@implementation NSData

- (id)base64EncodedString
{
  return -[NSData base64EncodedStringWithOptions:](self, "base64EncodedStringWithOptions:", 0);
}

- (NSData)initWithBase64EncodedString:(id)a3
{
  return -[NSData initWithBase64EncodedString:options:](self, "initWithBase64EncodedString:options:", a3, 0);
}

- (id)hexString
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100029364;
  v6[3] = &unk_100056448;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 2 * -[NSData length](self, "length")));
  v3 = v7;
  -[NSData enumerateByteRangesUsingBlock:](self, "enumerateByteRangesUsingBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v3));

  return v4;
}

@end
