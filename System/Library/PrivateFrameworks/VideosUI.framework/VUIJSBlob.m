@implementation VUIJSBlob

- (VUIJSBlob)initWithData:(id)a3
{
  id v5;
  void *v6;
  VUIJSBlob *v7;
  objc_super v9;

  v5 = a3;
  +[VUIAppContext currentAppContext](VUIAppContext, "currentAppContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)VUIJSBlob;
  v7 = -[VUIJSObject initWithAppContext:](&v9, sel_initWithAppContext_, v6);

  if (v7)
    objc_storeStrong((id *)&v7->_data, a3);

  return v7;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
