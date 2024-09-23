@implementation APResponseDataTranslator

- (id)response
{
  return objc_getProperty(self, a2, 16, 1);
}

- (id)requester
{
  return objc_getProperty(self, a2, 8, 1);
}

- (APResponseDataTranslator)initWithResponse:(id)a3 forRequester:(id)a4
{
  id v7;
  id v8;
  APResponseDataTranslator *v9;
  APResponseDataTranslator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)APResponseDataTranslator;
  v9 = -[APResponseDataTranslator init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_response, a3);
    objc_storeStrong(&v10->_requester, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_response, 0);
  objc_storeStrong(&self->_requester, 0);
}

+ (Class)translatesClass
{
  return 0;
}

- (id)translate:(id *)a3
{
  return 0;
}

- (void)setRequester:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)setResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

@end
