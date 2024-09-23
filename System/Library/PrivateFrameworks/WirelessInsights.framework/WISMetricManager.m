@implementation WISMetricManager

+ (void)postMetricWithId:(unint64_t)a3
{
  WISPostSimpleMetric(a3);
}

+ (void)postMetricWithId:(unint64_t)a3 BOOLValue:(BOOL)a4
{
  WISPostSimpleMetricWithBool(a3, a4);
}

+ (void)postMetricWithId:(unint64_t)a3 integerValue:(int64_t)a4
{
  WISPostSimpleMetricWithInteger(a3, a4);
}

+ (void)postMetricWithId:(unint64_t)a3 unsignedIntegerValue:(unint64_t)a4
{
  WISPostSimpleMetricWithUnsignedInteger(a3, a4);
}

+ (void)postMetricWithId:(unint64_t)a3 stringValue:(id)a4
{
  int v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v9 = objc_retainAutorelease(a4);
  v8 = objc_msgSend_UTF8String(v9, v5, v6, v7);
  WISPostSimpleMetricWithString(v4, v8);

}

+ (void)postMetricWithId:(unint64_t)a3 numberValue:(id)a4
{
  int v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v9 = a4;
  v8 = objc_msgSend_longLongValue(v9, v5, v6, v7);
  WISPostSimpleMetricWithInteger(v4, v8);

}

+ (void)postMetricWithId:(unint64_t)a3 object:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  unint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend_longLongValue(v5, v6, v7, v8);
    WISPostSimpleMetricWithInteger(a3, v9);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_retainAutorelease(v5);
      v14 = objc_msgSend_UTF8String(v10, v11, v12, v13);
      WISPostSimpleMetricWithString(a3, v14);
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_opt_class();
      objc_msgSend_description(v15, v16, v17, v18);
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v23 = 134218242;
      v24 = a3;
      v25 = 2080;
      v26 = objc_msgSend_UTF8String(v19, v20, v21, v22);
      _os_log_impl(&dword_24A56F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "metric:#E In postMetricWithId:object: for mid 0x%lx: unsupported NSObject type! (Got '%s')", (uint8_t *)&v23, 0x16u);

    }
  }

}

@end
