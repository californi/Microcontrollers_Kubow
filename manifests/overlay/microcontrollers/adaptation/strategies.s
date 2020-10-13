module kubow.strategies;
import model "MicroControllersSystem:Acme" { MicroControllersSystem as M, KubernetesFam as K };
import lib "tactics.s";

define boolean highTraffic = M.monitorS.traffic >= 50;
define boolean lowTraffic = M.monitorS.traffic < 50;

/*
 * ----
 */
strategy ImproveMonitoring [ highTraffic || lowTraffic ] {
  t0: (highTraffic) -> differentMonitoring() @[20000 /*ms*/] {
    t0a: (success) -> done;
  }
  t1: (default) -> TNULL;
}
