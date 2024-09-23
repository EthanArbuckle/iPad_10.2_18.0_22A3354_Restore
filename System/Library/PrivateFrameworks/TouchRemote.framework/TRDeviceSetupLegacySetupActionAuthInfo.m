@implementation TRDeviceSetupLegacySetupActionAuthInfo

- (TRDeviceSetupLegacySetupActionAuthInfo)initWithHeaders:(id)a3 body:(id)a4
{
  id v6;
  id v7;
  TRDeviceSetupLegacySetupActionAuthInfo *v8;
  uint64_t v9;
  NSDictionary *headers;
  uint64_t v11;
  NSDictionary *body;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TRDeviceSetupLegacySetupActionAuthInfo;
  v8 = -[TRDeviceSetupLegacySetupActionAuthInfo init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    headers = v8->_headers;
    v8->_headers = (NSDictionary *)v9;

    v11 = objc_msgSend(v7, "copy");
    body = v8->_body;
    v8->_body = (NSDictionary *)v11;

  }
  return v8;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (NSDictionary)body
{
  return self->_body;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_headers, 0);
}

@end
