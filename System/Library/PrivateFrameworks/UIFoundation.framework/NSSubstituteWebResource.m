@implementation NSSubstituteWebResource

- (Class)_webResourceClass
{
  if (_webResourceClass_onceToken != -1)
    dispatch_once(&_webResourceClass_onceToken, &__block_literal_global_37);
  return (Class)_webResourceClass__webResourceClass;
}

Class __44__NSSubstituteWebResource__webResourceClass__block_invoke()
{
  Class result;

  result = objc_lookUpClass("WebResource");
  _webResourceClass__webResourceClass = (uint64_t)result;
  if (!result)
  {
    __NSLoadWebKit();
    result = objc_lookUpClass("WebResource");
    _webResourceClass__webResourceClass = (uint64_t)result;
  }
  return result;
}

- (NSSubstituteWebResource)initWithData:(id)a3 URL:(id)a4 MIMEType:(id)a5 textEncodingName:(id)a6 frameName:(id)a7
{
  NSSubstituteWebResource *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NSSubstituteWebResource;
  v12 = -[NSSubstituteWebResource init](&v14, sel_init);
  v12->_data = (NSData *)objc_msgSend(a3, "copy");
  v12->_url = (NSURL *)objc_msgSend(a4, "copy");
  v12->_mimeType = (NSString *)objc_msgSend(a5, "copy");
  v12->_textEncodingName = (NSString *)objc_msgSend(a6, "copy");
  v12->_frameName = (NSString *)objc_msgSend(a7, "copy");
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSSubstituteWebResource;
  -[NSSubstituteWebResource dealloc](&v3, sel_dealloc);
}

- (id)data
{
  return self->_data;
}

- (id)URL
{
  return self->_url;
}

- (id)MIMEType
{
  return self->_mimeType;
}

- (id)textEncodingName
{
  return self->_textEncodingName;
}

- (id)frameName
{
  return self->_frameName;
}

- (id)webResource
{
  return (id)objc_msgSend(objc_alloc(-[NSSubstituteWebResource _webResourceClass](self, "_webResourceClass")), "initWithData:URL:MIMEType:textEncodingName:frameName:", self->_data, self->_url, self->_mimeType, self->_textEncodingName, self->_frameName);
}

@end
