@implementation JSABase64

+ (id)encode:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "base64EncodedStringWithOptions:", 0));

  return v4;
}

+ (id)decode:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v3, 0);

  v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v4, 4);
  return v5;
}

@end
