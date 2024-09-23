@implementation HKSPXPCConnectionInfo

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPXPCConnectionInfo machServiceName](self, "machServiceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("machServiceName"));

  -[HKSPXPCConnectionInfo remoteObjectInterface](self, "remoteObjectInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("remoteObjectInterface"));

  -[HKSPXPCConnectionInfo exportedObject](self, "exportedObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("exportedObject"));

  -[HKSPXPCConnectionInfo exportedObjectInterface](self, "exportedObjectInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", v9, CFSTR("exportedObjectInterface"));

  -[HKSPXPCConnectionInfo requiredEntitlement](self, "requiredEntitlement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:withName:", v11, CFSTR("requiredEntitlement"));

  return v3;
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSString)requiredEntitlement
{
  return self->_requiredEntitlement;
}

- (id)exportedObject
{
  return self->_exportedObject;
}

- (NSXPCInterface)remoteObjectInterface
{
  return self->_remoteObjectInterface;
}

- (NSXPCInterface)exportedObjectInterface
{
  return self->_exportedObjectInterface;
}

+ (id)infoForMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedObject:(id)a5 exportedObjectInterface:(id)a6 lifecycleNotification:(id)a7 requiredEntitlement:(id)a8 options:(unint64_t)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMachServiceName:remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:", v19, v18, v17, v16, v15, v14, 0);

  return v20;
}

- (HKSPXPCConnectionInfo)initWithMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedObject:(id)a5 exportedObjectInterface:(id)a6 lifecycleNotification:(id)a7 requiredEntitlement:(id)a8 options:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HKSPXPCConnectionInfo *v20;
  uint64_t v21;
  NSString *machServiceName;
  uint64_t v23;
  NSString *lifecycleNotification;
  uint64_t v25;
  NSString *requiredEntitlement;
  HKSPXPCConnectionInfo *v27;
  id v29;
  objc_super v30;

  v15 = a3;
  v29 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v30.receiver = self;
  v30.super_class = (Class)HKSPXPCConnectionInfo;
  v20 = -[HKSPXPCConnectionInfo init](&v30, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v15, "copy");
    machServiceName = v20->_machServiceName;
    v20->_machServiceName = (NSString *)v21;

    objc_storeStrong((id *)&v20->_remoteObjectInterface, a4);
    objc_storeStrong(&v20->_exportedObject, a5);
    objc_storeStrong((id *)&v20->_exportedObjectInterface, a6);
    v23 = objc_msgSend(v18, "copy");
    lifecycleNotification = v20->_lifecycleNotification;
    v20->_lifecycleNotification = (NSString *)v23;

    v25 = objc_msgSend(v19, "copy");
    requiredEntitlement = v20->_requiredEntitlement;
    v20->_requiredEntitlement = (NSString *)v25;

    v20->_options = a9;
    v27 = v20;
  }

  return v20;
}

- (NSString)lifecycleNotification
{
  return self->_lifecycleNotification;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HKSPXPCConnectionInfo succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredEntitlement, 0);
  objc_storeStrong((id *)&self->_lifecycleNotification, 0);
  objc_storeStrong((id *)&self->_exportedObjectInterface, 0);
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPXPCConnectionInfo descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
