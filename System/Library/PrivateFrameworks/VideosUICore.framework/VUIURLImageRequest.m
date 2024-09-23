@implementation VUIURLImageRequest

- (VUIURLImageRequest)initWithURL:(id)a3 headers:(id)a4 identifier:(id)a5 decrypter:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  VUIURLImageRequest *v15;
  VUIURLImageRequest *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)VUIURLImageRequest;
  v15 = -[VUIURLImageRequest init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_url, a3);
    objc_storeStrong((id *)&v16->_headers, a4);
    objc_storeStrong((id *)&v16->_identifier, a5);
    objc_storeStrong((id *)&v16->_decrypter, a6);
  }

  return v16;
}

- (VUIURLImageRequest)initWithURL:(id)a3 headers:(id)a4 decrypter:(id)a5
{
  return -[VUIURLImageRequest initWithURL:headers:identifier:decrypter:](self, "initWithURL:headers:identifier:decrypter:", a3, a4, 0, a5);
}

- (NSString)identifier
{
  NSString *identifier;

  identifier = self->_identifier;
  if (identifier)
    return identifier;
  -[NSURL absoluteString](self->_url, "absoluteString");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_headers, a3);
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (VUIImageDecrypter)decrypter
{
  return self->_decrypter;
}

- (void)setDecrypter:(id)a3
{
  objc_storeStrong((id *)&self->_decrypter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decrypter, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
