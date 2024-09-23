@implementation AWDMetricManager

+ (void)postMetricWithId:(unint64_t)a3
{
  AWDPostSimpleMetric(a3);
}

+ (void)postMetricWithId:(unint64_t)a3 BOOLValue:(BOOL)a4
{
  AWDPostSimpleMetricWithBool(a3, a4);
}

+ (void)postMetricWithId:(unint64_t)a3 integerValue:(int64_t)a4
{
  AWDPostSimpleMetricWithInteger(a3, a4);
}

+ (void)postMetricWithId:(unint64_t)a3 unsignedIntegerValue:(unint64_t)a4
{
  AWDPostSimpleMetricWithUnsignedInteger(a3, a4);
}

+ (void)postMetricWithId:(unint64_t)a3 stringValue:(id)a4
{
  int v4;
  id v5;

  v4 = a3;
  v5 = objc_retainAutorelease(a4);
  AWDPostSimpleMetricWithString(v4, objc_msgSend(v5, "UTF8String"));

}

+ (void)postMetricWithId:(unint64_t)a3 numberValue:(id)a4
{
  int v4;
  id v5;

  v4 = a3;
  v5 = a4;
  AWDPostSimpleMetricWithInteger(v4, objc_msgSend(v5, "longLongValue"));

}

+ (void)postMetricWithId:(unint64_t)a3 object:(id)a4
{
  id v5;
  id v6;
  int v7;
  unint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    AWDPostSimpleMetricWithInteger(a3, objc_msgSend(v5, "longLongValue"));
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      AWDPostSimpleMetricWithString(a3, objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = 134218242;
      v8 = a3;
      v9 = 2080;
      v10 = objc_msgSend(v6, "UTF8String");
      _os_log_impl(&dword_1CC590000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "metric:#E In postMetricWithId:object: for mid 0x%lx: unsupported NSObject type! (Got '%s')", (uint8_t *)&v7, 0x16u);

    }
  }

}

@end
