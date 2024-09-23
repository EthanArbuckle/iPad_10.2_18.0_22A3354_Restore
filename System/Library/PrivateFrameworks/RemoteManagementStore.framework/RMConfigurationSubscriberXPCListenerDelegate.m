@implementation RMConfigurationSubscriberXPCListenerDelegate

- (RMConfigurationSubscriberXPCListenerDelegate)initWithApplicators:(id)a3 publisherClass:(Class)a4
{
  id v7;
  RMConfigurationSubscriberXPCListenerDelegate *v8;
  RMConfigurationSubscriberXPCListenerDelegate *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RMConfigurationSubscriberXPCListenerDelegate;
  v8 = -[RMConfigurationSubscriberXPCListenerDelegate init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_applicatorClasses, a3);
    objc_storeStrong((id *)&v9->_publisherClass, a4);
  }

  return v9;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2574503F0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v6);

  v7 = +[RMConfigurationSubscriberService newConfigurationSubscriberServiceWithXPCConnection:](RMConfigurationSubscriberService, "newConfigurationSubscriberServiceWithXPCConnection:", v5);
  -[RMConfigurationSubscriberXPCListenerDelegate applicatorClasses](self, "applicatorClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[RMConfigurationSubscriberXPCListenerDelegate applicatorClasses](self, "applicatorClasses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[RMConfigurationSubscriberDelegate sharedDelegateWithApplicators:](RMConfigurationSubscriberDelegate, "sharedDelegateWithApplicators:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSubscriberDelegate:", v10);

  }
  if (-[RMConfigurationSubscriberXPCListenerDelegate publisherClass](self, "publisherClass"))
  {
    +[RMStatusPublisherDelegate sharedDelegateWithPublisherClass:](RMStatusPublisherDelegate, "sharedDelegateWithPublisherClass:", -[RMConfigurationSubscriberXPCListenerDelegate publisherClass](self, "publisherClass"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPublisherDelegate:", v11);

  }
  objc_msgSend(v5, "setExportedObject:", v7);
  objc_msgSend(v5, "resume");

  return 1;
}

- (NSArray)applicatorClasses
{
  return self->_applicatorClasses;
}

- (Class)publisherClass
{
  return self->_publisherClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherClass, 0);
  objc_storeStrong((id *)&self->_applicatorClasses, 0);
}

@end
