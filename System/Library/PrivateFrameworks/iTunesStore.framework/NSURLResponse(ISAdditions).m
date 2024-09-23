@implementation NSURLResponse(ISAdditions)

- (uint64_t)itunes_statusCode
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(a1, "statusCode");
  else
    return 200;
}

- (uint64_t)itunes_allHeaderFields
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(a1, "allHeaderFields");
  else
    return objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
}

@end
