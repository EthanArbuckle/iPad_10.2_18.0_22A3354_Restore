@implementation NSString

- (NSString)_maps_sha1Hash
{
  id v2;
  id v3;
  uint64_t i;
  unsigned __int8 md[20];

  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSString dataUsingEncoding:](self, "dataUsingEncoding:", 4)));
  CC_SHA1(objc_msgSend(v2, "bytes"), (CC_LONG)objc_msgSend(v2, "length"), md);
  v3 = objc_alloc_init((Class)NSMutableString);
  for (i = 0; i != 20; ++i)
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[i]);

  return (NSString *)v3;
}

@end
