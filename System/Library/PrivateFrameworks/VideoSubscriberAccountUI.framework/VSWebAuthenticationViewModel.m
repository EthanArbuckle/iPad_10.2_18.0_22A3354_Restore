@implementation VSWebAuthenticationViewModel

- (VSWebAuthenticationViewModel)init
{
  VSWebAuthenticationViewModel *v2;
  VSMessageQueue *v3;
  VSMessageQueue *messagesToWeb;
  VSMessageQueue *v5;
  VSMessageQueue *messagesFromWeb;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VSWebAuthenticationViewModel;
  v2 = -[VSViewModel init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VSMessageQueue);
    messagesToWeb = v2->_messagesToWeb;
    v2->_messagesToWeb = v3;

    v5 = objc_alloc_init(VSMessageQueue);
    messagesFromWeb = v2->_messagesFromWeb;
    v2->_messagesFromWeb = v5;

  }
  return v2;
}

- (void)configureWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[VSViewModel identityProvider](self, "identityProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "forceUnwrapObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSViewModel setTitle:](self, "setTitle:", v7);

  v8.receiver = self;
  v8.super_class = (Class)VSWebAuthenticationViewModel;
  -[VSViewModel configureWithRequest:](&v8, sel_configureWithRequest_, v4);

}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (VSMessageQueue)messagesToWeb
{
  return self->_messagesToWeb;
}

- (VSMessageQueue)messagesFromWeb
{
  return self->_messagesFromWeb;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesFromWeb, 0);
  objc_storeStrong((id *)&self->_messagesToWeb, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
}

@end
