@implementation NSData

- (unint64_t)ic_lengthAsMIMEAttachment
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedDataWithOptions:](self, "base64EncodedDataWithOptions:", 2));
  v3 = objc_msgSend(v2, "length");

  return (unint64_t)v3;
}

@end
