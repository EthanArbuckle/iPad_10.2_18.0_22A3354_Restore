@implementation NSDictionary(SUPPT)

- (uint64_t)iterations
{
  return objc_msgSend((id)objc_msgSend(a1, "objectForKey:", CFSTR("iterations")), "intValue");
}

- (uint64_t)offset
{
  return objc_msgSend((id)objc_msgSend(a1, "objectForKey:", CFSTR("offset")), "floatValue");
}

- (NSString)setupSelector
{
  NSString *result;

  result = (NSString *)objc_msgSend(a1, "objectForKey:", CFSTR("setupSelector"));
  if (result)
    return (NSString *)NSSelectorFromString(result);
  return result;
}

- (NSString)testSelector
{
  NSString *result;

  result = (NSString *)objc_msgSend(a1, "objectForKey:", CFSTR("testSelector"));
  if (result)
    return (NSString *)NSSelectorFromString(result);
  return result;
}

- (uint64_t)scriptPath
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("scriptPath"));
}

- (uint64_t)scriptEntry
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("scriptEntry"));
}

@end
