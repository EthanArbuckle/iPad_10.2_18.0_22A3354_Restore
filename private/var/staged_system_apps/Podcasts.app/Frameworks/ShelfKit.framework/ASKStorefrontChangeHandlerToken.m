@implementation ASKStorefrontChangeHandlerToken

- (ASKStorefrontChangeHandlerToken)initWithHandler:(id)a3
{
  id v4;
  ASKStorefrontChangeHandlerToken *v5;
  id v6;
  id handler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASKStorefrontChangeHandlerToken;
  v5 = -[ASKStorefrontChangeHandlerToken init](&v9, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    handler = v5->_handler;
    v5->_handler = v6;

  }
  return v5;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
