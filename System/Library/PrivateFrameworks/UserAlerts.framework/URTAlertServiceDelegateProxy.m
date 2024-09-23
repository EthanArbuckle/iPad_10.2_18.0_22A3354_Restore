@implementation URTAlertServiceDelegateProxy

- (URTAlertServiceDelegateProxy)initWithService:(id)a3
{
  id v4;
  URTAlertServiceDelegateProxy *v5;
  URTAlertServiceDelegateProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)URTAlertServiceDelegateProxy;
  v5 = -[URTAlertServiceDelegateProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_service, v4);

  return v6;
}

- (void)presentAlert:(id)a3 preferringPresentationStyle:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[URTAlertServiceDelegateProxy service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_msgSend(v6, "unsignedIntegerValue");
    objc_msgSend(MEMORY[0x24BE0FA00], "currentContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_connectionQueue_presentAlert:preferringPresentationStyle:forConnection:", v10, v8, v9);

  }
}

- (void)dismissAlert:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[URTAlertServiceDelegateProxy service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE0FA00], "currentContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_connectionQueue_dismissAlert:forConnection:", v6, v5);

  }
}

- (URTAlertService)service
{
  return (URTAlertService *)objc_loadWeakRetained((id *)&self->_service);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_service);
}

@end
