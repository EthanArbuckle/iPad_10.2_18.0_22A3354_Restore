@implementation NSNumber(SiriCoreSQLiteValue)

- (uint64_t)siriCoreSQLiteValue_type
{
  id v1;
  unsigned int v2;
  void *v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v1 = objc_retainAutorelease(a1);
  v2 = *(char *)objc_msgSend(v1, "objCType") - 66;
  if (v2 > 0x31)
    goto LABEL_6;
  if (((1 << v2) & 0x2848200028483) != 0)
    return 3;
  if (((1 << v2) & 0x1400000000) != 0)
    return 2;
LABEL_6:
  v4 = (void *)*MEMORY[0x24BE08FC8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC8], OS_LOG_TYPE_ERROR))
  {
    v5 = objc_retainAutorelease(v1);
    v6 = v4;
    v7 = 136315650;
    v8 = "-[NSNumber(SiriCoreSQLiteValue) siriCoreSQLiteValue_type]";
    v9 = 2112;
    v10 = v1;
    v11 = 2080;
    v12 = objc_msgSend(v5, "objCType");
    _os_log_error_impl(&dword_211AB2000, v6, OS_LOG_TYPE_ERROR, "%s %@ (objCType = %s)", (uint8_t *)&v7, 0x20u);

  }
  return 0;
}

- (id)siriCoreSQLiteValue_escapedString:()SiriCoreSQLiteValue
{
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = *MEMORY[0x24BE08FC8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC8], OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[NSNumber(SiriCoreSQLiteValue) siriCoreSQLiteValue_escapedString:]";
      v8 = 2112;
      v9 = a1;
      _os_log_error_impl(&dword_211AB2000, v4, OS_LOG_TYPE_ERROR, "%s Using %@ as identifier is NOT supported.", (uint8_t *)&v6, 0x16u);
    }
    return 0;
  }
  else
  {
    objc_msgSend(a1, "stringValue");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)siriCoreSQLiteValue_toData
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "siriCoreSQLiteValue_toString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "siriCoreSQLiteValue_toData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
