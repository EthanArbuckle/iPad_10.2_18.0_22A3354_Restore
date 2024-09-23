@implementation OspreyService

- (OspreyService)initWithConnectionURL:(id)a3
{
  id v4;
  OspreyConnectionConfiguration *v5;
  OspreyService *v6;

  v4 = a3;
  v5 = objc_alloc_init(OspreyConnectionConfiguration);
  -[OspreyConnectionConfiguration setConnectionUrl:](v5, "setConnectionUrl:", v4);

  v6 = -[OspreyService initWithConnectionConfiguration:](self, "initWithConnectionConfiguration:", v5);
  return v6;
}

- (OspreyService)initWithConnectionConfiguration:(id)a3
{
  id v4;
  OspreyService *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  OspreyRPC *channel;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OspreyService;
  v5 = -[OspreyService init](&v11, sel_init);
  if (v5)
  {
    +[OspreyServiceConfiguration sharedConfiguration](OspreyServiceConfiguration, "sharedConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connectionPool");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "connectionForConfiguration:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    channel = v5->_channel;
    v5->_channel = (OspreyRPC *)v8;

  }
  return v5;
}

- (OspreyRPC)channel
{
  return self->_channel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
}

@end
