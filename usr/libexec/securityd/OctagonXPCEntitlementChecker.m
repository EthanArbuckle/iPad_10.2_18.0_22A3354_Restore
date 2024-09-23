@implementation OctagonXPCEntitlementChecker

- (OctagonXPCEntitlementChecker)initWithManager:(id)a3 entitlementBearer:(id)a4
{
  OTManager *v6;
  OctagonEntitlementBearerProtocol *v7;
  OTManager *manager;
  OTManager *v9;
  OctagonEntitlementBearerProtocol *entitlementBearer;

  v6 = (OTManager *)a3;
  v7 = (OctagonEntitlementBearerProtocol *)a4;
  manager = self->_manager;
  self->_manager = v6;
  v9 = v6;

  entitlementBearer = self->_entitlementBearer;
  self->_entitlementBearer = v7;

  return self;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker manager](self, "manager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "methodSignatureForSelector:", a3));

  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const void *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  const void *v24;
  NSObject *v25;
  void *v26;
  const void *v27;
  NSObject *v28;
  void *v29;
  const void *v30;
  NSObject *v31;
  void *v32;
  const void *v33;
  NSObject *v34;
  void *v35;
  const void *v36;
  NSObject *v37;
  void *v38;
  const void *v39;
  NSObject *v40;
  void *v41;
  int v42;
  void *v43;
  __int16 v44;
  uint64_t v45;

  v4 = a3;
  if (sel_isEqual((SEL)objc_msgSend(v4, "selector"), "fetchEscrowContents:reply:"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", kSecEntitlementPrivateOctagonEscrow));

    if (!v6)
    {
      v20 = sub_10000EF14("SecError");
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
        v42 = 138412546;
        v43 = v22;
        v44 = 2112;
        v45 = kSecEntitlementPrivateOctagonEscrow;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Client %@ does not have entitlement %@, rejecting rpc", (uint8_t *)&v42, 0x16u);

      }
      v23 = "failFetchEscrowContents:reply:";
      goto LABEL_37;
    }
  }
  if (sel_isEqual((SEL)objc_msgSend(v4, "selector"), "setLocalSecureElementIdentity:secureElementIdentity:reply:"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForEntitlement:", kSecEntitlementPrivateOctagonSecureElement));

    if (!v8)
    {
      v24 = sub_10000EF14("SecError");
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
        v42 = 138412546;
        v43 = v26;
        v44 = 2112;
        v45 = kSecEntitlementPrivateOctagonSecureElement;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Client %@ does not have entitlement %@, rejecting rpc", (uint8_t *)&v42, 0x16u);

      }
      v23 = "failSetLocalSecureElementIdentity:secureElementIdentity:reply:";
      goto LABEL_37;
    }
  }
  if (sel_isEqual((SEL)objc_msgSend(v4, "selector"), "removeLocalSecureElementIdentityPeerID:secureElementIdentityPeerID:reply:"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForEntitlement:", kSecEntitlementPrivateOctagonSecureElement));

    if (!v10)
    {
      v27 = sub_10000EF14("SecError");
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
        v42 = 138412546;
        v43 = v29;
        v44 = 2112;
        v45 = kSecEntitlementPrivateOctagonSecureElement;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Client %@ does not have entitlement %@, rejecting rpc", (uint8_t *)&v42, 0x16u);

      }
      v23 = "failRemoveLocalSecureElementIdentityPeerID:secureElementIdentityPeerID:reply:";
      goto LABEL_37;
    }
  }
  if (sel_isEqual((SEL)objc_msgSend(v4, "selector"), "fetchTrustedSecureElementIdentities:reply:"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForEntitlement:", kSecEntitlementPrivateOctagonSecureElement));

    if (!v12)
    {
      v30 = sub_10000EF14("SecError");
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
        v42 = 138412546;
        v43 = v32;
        v44 = 2112;
        v45 = kSecEntitlementPrivateOctagonSecureElement;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Client %@ does not have entitlement %@, rejecting rpc", (uint8_t *)&v42, 0x16u);

      }
      v23 = "failFetchTrustedSecureElementIdentities:reply:";
      goto LABEL_37;
    }
  }
  if (sel_isEqual((SEL)objc_msgSend(v4, "selector"), "setAccountSetting:setting:reply:"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForEntitlement:", kSecEntitlementPrivateOctagonWalrus));

    if (!v14)
    {
      v33 = sub_10000EF14("SecError");
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
        v42 = 138412546;
        v43 = v35;
        v44 = 2112;
        v45 = kSecEntitlementPrivateOctagonWalrus;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Client %@ does not have entitlement %@, rejecting rpc", (uint8_t *)&v42, 0x16u);

      }
      v23 = "failSetAccountSetting:setting:reply:";
      goto LABEL_37;
    }
  }
  if (sel_isEqual((SEL)objc_msgSend(v4, "selector"), "fetchAccountSettings:reply:"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "valueForEntitlement:", kSecEntitlementPrivateOctagonWalrus));

    if (!v16)
    {
      v36 = sub_10000EF14("SecError");
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
        v42 = 138412546;
        v43 = v38;
        v44 = 2112;
        v45 = kSecEntitlementPrivateOctagonWalrus;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Client %@ does not have entitlement %@, rejecting rpc", (uint8_t *)&v42, 0x16u);

      }
      v23 = "failFetchAccountSettings:reply:";
      goto LABEL_37;
    }
  }
  if (sel_isEqual((SEL)objc_msgSend(v4, "selector"), "fetchAccountWideSettingsWithForceFetch:arguments:reply:"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForEntitlement:", kSecEntitlementPrivateOctagonWalrus));

    if (!v18)
    {
      v39 = sub_10000EF14("SecError");
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker entitlementBearer](self, "entitlementBearer"));
        v42 = 138412546;
        v43 = v41;
        v44 = 2112;
        v45 = kSecEntitlementPrivateOctagonWalrus;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Client %@ does not have entitlement %@, rejecting rpc", (uint8_t *)&v42, 0x16u);

      }
      v23 = "failFetchAccountWideSettingsWithForceFetch:arguments:reply:";
LABEL_37:
      objc_msgSend(v4, "setSelector:", v23);
      objc_msgSend(v4, "invokeWithTarget:", self);
      goto LABEL_38;
    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonXPCEntitlementChecker manager](self, "manager"));
  objc_msgSend(v4, "invokeWithTarget:", v19);

LABEL_38:
}

- (void)failFetchEscrowContents:(id)a3 reply:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v5 = kSecEntitlementPrivateOctagonEscrow;
  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Missing entitlement '%@'"), v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -34018, v8));
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))a4 + 2))(v6, 0, 0, 0, v7);

}

- (void)failSetLocalSecureElementIdentity:(id)a3 secureElementIdentity:(id)a4 reply:(id)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v6 = kSecEntitlementPrivateOctagonSecureElement;
  v7 = a5;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Missing entitlement '%@'"), v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -34018, v9));
  (*((void (**)(id, void *))a5 + 2))(v7, v8);

}

- (void)failRemoveLocalSecureElementIdentityPeerID:(id)a3 secureElementIdentityPeerID:(id)a4 reply:(id)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v6 = kSecEntitlementPrivateOctagonSecureElement;
  v7 = a5;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Missing entitlement '%@'"), v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -34018, v9));
  (*((void (**)(id, void *))a5 + 2))(v7, v8);

}

- (void)failFetchTrustedSecureElementIdentities:(id)a3 reply:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v5 = kSecEntitlementPrivateOctagonSecureElement;
  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Missing entitlement '%@'"), v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -34018, v8));
  (*((void (**)(id, _QWORD, void *))a4 + 2))(v6, 0, v7);

}

- (void)failSetAccountSetting:(id)a3 setting:(id)a4 reply:(id)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v6 = kSecEntitlementPrivateOctagonWalrus;
  v7 = a5;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Missing entitlement '%@'"), v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -34018, v9));
  (*((void (**)(id, void *))a5 + 2))(v7, v8);

}

- (void)failFetchAccountSettings:(id)a3 reply:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v5 = kSecEntitlementPrivateOctagonWalrus;
  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Missing entitlement '%@'"), v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -34018, v8));
  (*((void (**)(id, _QWORD, void *))a4 + 2))(v6, 0, v7);

}

- (void)failFetchAccountWideSettingsWithForceFetch:(BOOL)a3 arguments:(id)a4 reply:(id)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v6 = kSecEntitlementPrivateOctagonWalrus;
  v7 = a5;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Missing entitlement '%@'"), v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -34018, v9));
  (*((void (**)(id, _QWORD, void *))a5 + 2))(v7, 0, v8);

}

- (void)failPersistAccountSettings:(id)a3 setting:(id)a4 reply:(id)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v6 = kSecEntitlementPrivateOctagonWalrus;
  v7 = a5;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Missing entitlement '%@'"), v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -34018, v9));
  (*((void (**)(id, void *))a5 + 2))(v7, v8);

}

- (OTManager)manager
{
  return (OTManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)setManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OctagonEntitlementBearerProtocol)entitlementBearer
{
  return (OctagonEntitlementBearerProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEntitlementBearer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlementBearer, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

+ (BOOL)conformsToProtocol:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  v4 = objc_msgSend((id)objc_opt_class(OTManager), "conformsToProtocol:", v3);

  return v4;
}

+ (id)createWithManager:(id)a3 entitlementBearer:(id)a4
{
  id v5;
  id v6;
  OctagonXPCEntitlementChecker *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[OctagonXPCEntitlementChecker initWithManager:entitlementBearer:]([OctagonXPCEntitlementChecker alloc], "initWithManager:entitlementBearer:", v6, v5);

  return v7;
}

@end
