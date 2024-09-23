@implementation PowerUISmartChargeManagerUnsupported

- (PowerUISmartChargeManagerUnsupported)init
{
  PowerUISmartChargeManagerUnsupported *v2;
  uint64_t v3;
  NSXPCListener *listener;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PowerUISmartChargeManagerUnsupported;
  v2 = -[PowerUISmartChargeManagerUnsupported init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.powerui.smartChargeManager"));
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
    v5 = (void *)*MEMORY[0x24BDAC5A0];
    xpc_activity_register("com.apple.poweruiagent.reportAnalyticsRepeating", (xpc_object_t)*MEMORY[0x24BDAC5A0], &__block_literal_global_1815);
    xpc_activity_register("com.apple.poweruiagent.runOnBoot", v5, &__block_literal_global_1816);
  }
  return v2;
}

void __44__PowerUISmartChargeManagerUnsupported_init__block_invoke()
{
  xpc_activity_unregister("com.apple.poweruiagent.reportAnalyticsRepeating");
}

void __44__PowerUISmartChargeManagerUnsupported_init__block_invoke_2()
{
  xpc_activity_unregister("com.apple.poweruiagent.runOnBoot");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)MEMORY[0x24BDD1990];
  v6 = a4;
  objc_msgSend(v5, "interfaceWithProtocol:", &unk_254E02070);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_statusWithHandler_, 0, 1);

  objc_msgSend(v6, "setExportedInterface:", v7);
  objc_msgSend(v6, "setExportedObject:", self);
  objc_msgSend(v6, "resume");

  return 1;
}

+ (id)manager
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (void)isOBCSupportedWithHandler:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (void)client:(id)a3 setState:(unint64_t)a4 withHandler:(id)a5
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x24BDD1540];
  v7 = a5;
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), 4, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a5 + 2))(v7, 0, v8);

}

- (void)fullChargeDeadlineWithHandler:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = a3;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), 4, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v5, 0, v6);

}

- (void)legacy_isOBCEngagedWithHandler:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = a3;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), 4, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))a3 + 2))(v5, 0, 0, 0, v6);

}

- (void)smartChargingUIStateWithHandler:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = a3;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), 4, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t, uint64_t, _QWORD, id))a3 + 2))(v5, 1, 100, 0, v6);

}

- (void)isSmartChargingCurrentlyEnabledWithHandler:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = a3;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), 4, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v5, 0, v6);

}

- (void)powerLogStatusWithHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, MEMORY[0x24BDBD1B8]);
}

- (void)simulateCurrentOutputAsOfDate:(id)a3 overrideAllSignals:(BOOL)a4 withHandler:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = a5;
  objc_msgSend(v6, "distantPast");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), 4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void *))a5 + 2))(v7, v9, v8);

}

- (void)statusWithHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, MEMORY[0x24BDBD1B8]);
}

- (void)isOBCEngagedOrChargeLimitedWithHandler:(id)a3
{
  (*((void (**)(id, _QWORD, uint64_t, _QWORD, _QWORD))a3 + 2))(a3, 0, 100, 0, 0);
}

- (void)engageFrom:(id)a3 until:(id)a4 repeatUntil:(id)a5 overrideAllSignals:(BOOL)a6 withHandler:(id)a7
{
  (*((void (**)(id, _QWORD))a7 + 2))(a7, 0);
}

- (void)client:(id)a3 setChargingStatus:(BOOL)a4 withHandler:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)isCECSupportedWithHandler:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (void)client:(id)a3 setMCMState:(unint64_t)a4 withHandler:(id)a5
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x24BDD1540];
  v7 = a5;
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), 4, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a5 + 2))(v7, 0, v8);

}

- (void)isMCMCurrentlyEnabledWithHandler:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = a3;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), 4, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t, id))a3 + 2))(v5, 3, v6);

}

- (void)shouldMCMBeDisplayedWithHandler:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = a3;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), 4, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v5, 0, v6);

}

- (void)isDEoCSupportedWithHandler:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (void)client:(id)a3 setDEoCState:(unint64_t)a4 withHandler:(id)a5
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x24BDD1540];
  v7 = a5;
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), 4, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a5 + 2))(v7, 0, v8);

}

- (void)isDEoCCurrentlyEnabledWithHandler:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (unint64_t)currentChargeLimit
{
  return 100;
}

- (void)isMCLSupportedWithHandler:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (BOOL)isMCLSupported
{
  return 0;
}

- (void)client:(id)a3 setMCLLimit:(unsigned __int8)a4 withHandler:(id)a5
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x24BDD1540];
  v7 = a5;
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), 4, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a5 + 2))(v7, 0, v8);

}

- (void)client:(id)a3 getMCLLimitWithHandler:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = a4;
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), 4, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v6, 0, v7);

}

- (void)tmpDisableMCLViaClient:(id)a3 withHandler:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = a4;
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), 4, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v6, 0, v7);

}

- (void)isMCLCurrentlyEnabledWithHandler:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (unint64_t)currentRecommendedChargeLimit
{
  return 300;
}

- (void)currentRecommendedChargeLimitWithHandler:(id)a3
{
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 300, 0);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
