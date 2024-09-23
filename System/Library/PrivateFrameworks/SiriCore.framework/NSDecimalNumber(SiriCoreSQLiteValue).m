@implementation NSDecimalNumber(SiriCoreSQLiteValue)

- (uint64_t)siriCoreSQLiteValue_type
{
  return 5;
}

- (uint64_t)siriCoreSQLiteValue_textRepresentation
{
  id v1;
  uint64_t v2;

  objc_msgSend(a1, "stringValue");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = objc_msgSend(v1, "UTF8String");

  return v2;
}

@end
