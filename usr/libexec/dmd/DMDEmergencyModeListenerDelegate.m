@implementation DMDEmergencyModeListenerDelegate

- (DMDPolicyPersistence)policyPersistence
{
  return self->_policyPersistence;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t isKindOfClass;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  NSObject *v14;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.dmd.emergency-mode")));
  v8 = objc_opt_class(NSNumber, v7);
  isKindOfClass = objc_opt_isKindOfClass(v6, v8);
  if ((isKindOfClass & 1) != 0 && (isKindOfClass = (uint64_t)objc_msgSend(v6, "BOOLValue"), (isKindOfClass & 1) != 0))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[DMFEmergencyModeMonitor remoteInterface](DMFEmergencyModeMonitor, "remoteInterface"));
    objc_msgSend(v5, "setExportedInterface:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEmergencyModeListenerDelegate policyPersistence](self, "policyPersistence"));
    objc_msgSend(v5, "setExportedObject:", v11);

    objc_msgSend(v5, "resume");
    v12 = 1;
  }
  else
  {
    v13 = DMFEmergencyModeLog(isKindOfClass);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100075D6C((uint64_t)v5, v14);

    v12 = 0;
  }

  return v12;
}

- (DMDEmergencyModeListenerDelegate)initWithPolicyPersistence:(id)a3
{
  id v5;
  DMDEmergencyModeListenerDelegate *v6;
  DMDEmergencyModeListenerDelegate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMDEmergencyModeListenerDelegate;
  v6 = -[DMDEmergencyModeListenerDelegate init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_policyPersistence, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyPersistence, 0);
}

@end
