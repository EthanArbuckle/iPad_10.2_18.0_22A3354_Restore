@implementation NSNull(SiriCoreSQLiteValue)

- (const)siriCoreSQLiteValue_escapedString:()SiriCoreSQLiteValue
{
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return CFSTR("null");
  v4 = *MEMORY[0x24BE08FC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC8], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[NSNull(SiriCoreSQLiteValue) siriCoreSQLiteValue_escapedString:]";
    v8 = 2112;
    v9 = a1;
    _os_log_error_impl(&dword_211AB2000, v4, OS_LOG_TYPE_ERROR, "%s Using %@ as identifier is NOT supported.", (uint8_t *)&v6, 0x16u);
  }
  return 0;
}

- (uint64_t)siriCoreSQLiteValue_toString
{
  return 0;
}

- (uint64_t)siriCoreSQLiteValue_toNumber
{
  return 0;
}

- (uint64_t)siriCoreSQLiteValue_toData
{
  return 0;
}

- (uint64_t)siriCoreSQLiteValue_type
{
  return 4;
}

@end
