module kubow.strategies;
import model "MicroControllersSystem:Acme" { MicroControllersSystem as M, KubernetesFam as K };


define boolean highTraffic = M.monitorS.traffic >= 50;
define boolean lowTraffic = M.monitorS.traffic < 50;

define string proactiveMonitoringModeImage = "californibrs/monitor-proactivemonitoring";
define string dynamicMonitoringModeImage = "californibrs/monitor-dynamicmonitoring";

tactic differentMonitoring() {
  condition {
    lowTraffic;
  }
  action {
    M.rollOut(M.monitorD, "monitor", dynamicMonitoringModeImage);
  }
  effect {
    lowTraffic;
  }
}