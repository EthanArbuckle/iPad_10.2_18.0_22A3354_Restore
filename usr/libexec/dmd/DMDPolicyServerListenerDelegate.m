@implementation DMDPolicyServerListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  NSObject *v13;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.dmd.policy")));
  v8 = objc_opt_class(NSNumber, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0 && (objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[DMFPolicyMonitor remoteInterface](DMFPolicyMonitor, "remoteInterface"));
    objc_msgSend(v5, "setExportedInterface:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPolicyServerListenerDelegate policyPersistence](self, "policyPersistence"));
    objc_msgSend(v5, "setExportedObject:", v10);

    objc_msgSend(v5, "resume");
    v11 = 1;
  }
  else
  {
    v12 = DMFPolicyLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100078EB4((uint64_t)v5, v13);

    v11 = 0;
  }

  return v11;
}

- (DMDPolicyPersistence)policyPersistence
{
  return self->_policyPersistence;
}

- (DMDPolicyServerListenerDelegate)initWithPolicyPersistence:(id)a3
{
  id v5;
  DMDPolicyServerListenerDelegate *v6;
  DMDPolicyServerListenerDelegate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMDPolicyServerListenerDelegate;
  v6 = -[DMDPolicyServerListenerDelegate init](&v9, "init");
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
