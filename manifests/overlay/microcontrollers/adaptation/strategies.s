module kubow.strategies;
import model "MicroControllersSystem:Acme" { MicroControllersSystem as M, KubernetesFam as K };
import lib "tactics.s";

define boolean highTraffic = M.monitorS.traffic >= 50;
define boolean lowTraffic = M.monitorS.traffic < 50;

/*
 * ----
 */
strategy ImproveMonitoring [ lowTraffic || highTraffic ] {
  t0: (lowTraffic) -> differentMonitoring() @[15000 /*ms*/] {
    t0a: (success) -> done;
  }
  t1: (default) -> TNULL;
}