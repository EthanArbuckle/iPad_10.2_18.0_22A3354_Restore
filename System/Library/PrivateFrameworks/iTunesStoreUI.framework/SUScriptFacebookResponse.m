@implementation SUScriptFacebookResponse

- (SUScriptFacebookResponse)initWithData:(id)a3 response:(id)a4 error:(id)a5
{
  SUScriptFacebookResponse *v8;
  CFStringEncoding v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SUScriptFacebookResponse;
  v8 = -[SUScriptObject init](&v11, sel_init);
  if (v8)
  {
    if (a3)
    {
      if (objc_msgSend(a4, "textEncodingName"))
        v9 = CFStringConvertIANACharSetNameToEncoding((CFStringRef)objc_msgSend(a4, "textEncodingName"));
      else
        v9 = 134217984;
      v8->_bodyData = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", a3, CFStringConvertEncodingToNSStringEncoding(v9));
    }
    if (a5)
      v8->_error = -[SUScriptError initWithError:]([SUScriptError alloc], "initWithError:", a5);
    if (a4)
      v8->_statusCode = objc_msgSend(a4, "statusCode");
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptFacebookResponse;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (NSString)bodyData
{
  return self->_bodyData;
}

- (id)_className
{
  return CFSTR("iTunesFacebookResponse");
}

- (SUScriptError)error
{
  return self->_error;
}

- (int64_t)HTTPStatusCode
{
  return self->_statusCode;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_64, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptFacebookResponse;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptFacebookResponse;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_64, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    __KeyMapping_64 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("bodyData"), CFSTR("error"), CFSTR("error"), CFSTR("HTTPStatusCode"), CFSTR("HTTPStatusCode"), 0);
}

@end
