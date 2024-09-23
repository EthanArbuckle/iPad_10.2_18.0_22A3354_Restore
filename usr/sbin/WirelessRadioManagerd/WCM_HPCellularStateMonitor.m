@implementation WCM_HPCellularStateMonitor

- (WCM_HPCellularStateMonitor)init
{
  WCM_HPCellularStateMonitor *v2;
  WCM_HPCellularStateMonitor *v3;
  CTStewieStateMonitor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WCM_HPCellularStateMonitor;
  v2 = -[WCM_HPCellularStateMonitor init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_bHPCellSetBTAFH = 0;
    v4 = (CTStewieStateMonitor *)objc_msgSend(objc_alloc((Class)CTStewieStateMonitor), "initWithDelegate:queue:", v2, &_dispatch_main_q);
    v3->fMonitor = v4;
    if (!v4)
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("HPCellular: Failed to create HPCellStateMonitor"));
  }
  return v3;
}

- (BOOL)start
{
  unsigned int v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  _BOOL8 v8;
  const __CFString *v9;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HPCellular: start method in WCM_HPCellularStateMonitor is called."));
  v3 = -[CTStewieStateMonitor start](self->fMonitor, "start");
  if (v3)
  {
    v4 = -[CTStewieStateMonitor getState](self->fMonitor, "getState");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HPCellular: Initial state queried succesfully. Initial state: %@"), v4);
    v5 = objc_msgSend(v4, "status");
    v6 = +[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton");
    if (v6)
    {
      v7 = v6;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HPCellular: in initial state query, creating [WCM_PolicyManager singleton] is successful in WCM_HPCellularStateMonitor.m."));
      if (objc_msgSend(objc_msgSend(v7, "activeCoexFeatures"), "containsObject:", CFSTR("hpcellularstatemonitorsupport")))
      {
        v8 = v5 == (id)5;
        if (v5 == (id)5)
          v9 = CFSTR("HPCellular: In initial state query, HPCellular Status is active and Bool flag bHPCellSetBTAFH of WCM_HPCellularStateMonitor class has been set to: (%d)");
        else
          v9 = CFSTR("HPCellular: In initial state query, HPCellular Status is not active and Bool flag bHPCellSetBTAFH of WCM_HPCellularStateMonitor class has been set to: (%d)");
        -[WCM_HPCellularStateMonitor setBHPCellSetBTAFH:](self, "setBHPCellSetBTAFH:", v8);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, v9, -[WCM_HPCellularStateMonitor bHPCellSetBTAFH](self, "bHPCellSetBTAFH"));
        objc_msgSend(v7, "handleHPCellularStateUpdate:", -[WCM_HPCellularStateMonitor bHPCellSetBTAFH](self, "bHPCellSetBTAFH"));
      }
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("HPCellular: In initial state query, Failed to start"));
  }
  return v3;
}

- (void)stateChanged:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _BOOL8 v8;
  const __CFString *v9;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HPCellular: stateChanged method is called in delegate callback."));
  if (a3)
  {
    v5 = objc_msgSend(a3, "status");
    objc_msgSend(a3, "reason");
    objc_msgSend(a3, "allowedServices");
    objc_msgSend(a3, "transportType");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HPCellular: stateChanged method, HPCellular state changed to: %@"), a3);
    v6 = +[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton");
    if (v6)
    {
      v7 = v6;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HPCellular: in stateChanged method, [WCM_PolicyManager singleton] is successful in WCM_HPCellularStateMonitor.m."));
      if (objc_msgSend(objc_msgSend(v7, "activeCoexFeatures"), "containsObject:", CFSTR("hpcellularstatemonitorsupport")))
      {
        v8 = v5 == (id)5;
        if (v5 == (id)5)
          v9 = CFSTR("HPCellular: in stateChanged method, HPCellular Status is active and Bool flag bHPCellSetBTAFH of WCM_HPCellularStateMonitor class has been set to: (%d)");
        else
          v9 = CFSTR("HPCellular: in stateChanged method, HPCellular Status is not active and Bool flag bHPCellSetBTAFH of WCM_HPCellularStateMonitor class has been set to: (%d)");
        -[WCM_HPCellularStateMonitor setBHPCellSetBTAFH:](self, "setBHPCellSetBTAFH:", v8);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, v9, -[WCM_HPCellularStateMonitor bHPCellSetBTAFH](self, "bHPCellSetBTAFH"));
        objc_msgSend(v7, "handleHPCellularStateUpdate:", -[WCM_HPCellularStateMonitor bHPCellSetBTAFH](self, "bHPCellSetBTAFH"));
      }
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR("HPCellular: in stateChanged method, unexpected CTHPCellState null pointer in delegate callback"));
  }
}

- (BOOL)bHPCellSetBTAFH
{
  return self->_bHPCellSetBTAFH;
}

- (void)setBHPCellSetBTAFH:(BOOL)a3
{
  self->_bHPCellSetBTAFH = a3;
}

@end
