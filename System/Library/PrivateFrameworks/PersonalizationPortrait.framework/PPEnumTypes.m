@implementation PPEnumTypes

+ (id)stringForDeviceFilter:(unint64_t)a3
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3 < 3)
    return off_1E226AAA8[a3];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v11 = v9;
    v12 = 2048;
    v13 = a3;
    _os_log_error_impl(&dword_18BE3A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ called with invalid PPDeviceFilter value of %lu", buf, 0x16u);

  }
  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "raise:format:", v7, CFSTR("%@ called with invalid PPDeviceFilter value of %lu"), v8, a3);

  return CFSTR("invalid");
}

+ (id)stringForLocationConsumer:(unint64_t)a3
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3 < 5)
    return off_1E226AAC0[a3];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v11 = v9;
    v12 = 2048;
    v13 = a3;
    _os_log_error_impl(&dword_18BE3A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ called with invalid PPLocationConsumer value of %lu", buf, 0x16u);

  }
  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "raise:format:", v7, CFSTR("%@ called with invalid PPLocationConsumer value of %lu"), v8, a3);

  return CFSTR("invalid");
}

+ (id)deviceFilterMapping
{
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 3; ++i)
  {
    objc_msgSend(a1, "stringForDeviceFilter:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v6);

  }
  return v3;
}

+ (id)reverseDeviceFilterMapping
{
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 3; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stringForDeviceFilter:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v6);

  }
  return v3;
}

+ (id)locationConsumerMapping
{
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 4; ++i)
  {
    objc_msgSend(a1, "stringForLocationConsumer:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v6);

  }
  return v3;
}

+ (id)reverseLocationConsumerMapping
{
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 4; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stringForLocationConsumer:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v6);

  }
  return v3;
}

+ (id)locationConsumerValidValueList
{
  void *v2;
  void *v3;
  uint64_t i;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("["));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPEnumTypes stringForLocationConsumer:](PPEnumTypes, "stringForLocationConsumer:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v3);

  for (i = 2; i != 4; ++i)
  {
    objc_msgSend(v2, "appendString:", CFSTR(", "));
    +[PPEnumTypes stringForLocationConsumer:](PPEnumTypes, "stringForLocationConsumer:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendString:", v5);

  }
  objc_msgSend(v2, "appendString:", CFSTR("]"));
  return v2;
}

@end
