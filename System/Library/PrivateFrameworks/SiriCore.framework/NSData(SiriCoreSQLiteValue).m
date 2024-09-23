@implementation NSData(SiriCoreSQLiteValue)

- (id)siriCoreSQLiteValue_escapedString:()SiriCoreSQLiteValue
{
  NSObject *v4;
  id v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = *MEMORY[0x24BE08FC8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FC8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[NSData(SiriCoreSQLiteValue) siriCoreSQLiteValue_escapedString:]";
      v11 = 2112;
      v12 = a1;
      _os_log_error_impl(&dword_211AB2000, v4, OS_LOG_TYPE_ERROR, "%s Using %@ as identifier is NOT supported.", buf, 0x16u);
    }
    return 0;
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(MEMORY[0x24BDD17C8], "hexStringFromData:", a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("X'%@'"), v7);

    return v8;
  }
}

- (id)siriCoreSQLiteValue_toString
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", a1, 4);
}

- (id)siriCoreSQLiteValue_toNumber
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "siriCoreSQLiteValue_toString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "siriCoreSQLiteValue_toNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)siriCoreSQLiteValue_type
{
  return 1;
}

- (uint64_t)siriCoreSQLiteValue_blobRepresentationWithLength:()SiriCoreSQLiteValue
{
  if (a3)
    *a3 = objc_msgSend(a1, "length");
  return objc_msgSend(objc_retainAutorelease(a1), "bytes");
}

@end
