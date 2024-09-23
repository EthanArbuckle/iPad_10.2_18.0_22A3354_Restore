@implementation SWWeakMessageHandler

+ (id)handlerWithMessageHandler:(id)a3
{
  id v3;
  id *v4;

  v3 = a3;
  v4 = (id *)objc_alloc((Class)objc_opt_class());
  objc_storeWeak(v4 + 1, v3);

  return v4;
}

- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SWWeakMessageHandler messageHandler](self, "messageHandler");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didReceiveMessage:securityOrigin:", v7, v6);

}

- (SWMessageHandler)messageHandler
{
  return (SWMessageHandler *)objc_loadWeakRetained((id *)&self->_messageHandler);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messageHandler);
}

@end
