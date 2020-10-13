module kubow.strategies;
import model "MicroControllersSystem:Acme" { MicroControllersSystem as M, KubernetesFam as K };


define boolean highTraffic = M.monitorS.traffic >= 50;
define boolean lowTraffic = M.monitorS.traffic < 50;

define string proactiveMonitoringModeImage = "californibrs/monitor-proactivemonitoring";
define string dynamicMonitoringModeImage = "californibrs/monitor-dynamicmonitoring";

tactic differentMonitoring() {
  condition {
    highTraffic || lowTraffic;
  }
  action {
    if (highTraffic) {
      M.rollOut(M.monitorD, "monitor", proactiveMonitoringModeImage);
    }
    if (lowTraffic) {
      M.rollOut(M.monitorD, "monitor", dynamicMonitoringModeImage);
    }
  }
  effect @[10000] {
    lowTraffic;
  }
}