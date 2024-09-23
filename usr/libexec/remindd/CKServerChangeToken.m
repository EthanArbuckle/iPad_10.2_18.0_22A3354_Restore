@implementation CKServerChangeToken

- (id)ic_loggingDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKServerChangeToken data](self, "data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "base64EncodedStringWithOptions:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<ServerChangeToken %@>"), v3));

  return v4;
}

@end
