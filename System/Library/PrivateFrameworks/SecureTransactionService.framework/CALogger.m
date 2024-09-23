@implementation CALogger

+ (void)postCAEventFor:(id)a3 eventInput:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v11 = v5;
    v12 = v6;
    AnalyticsSendEventLazy();

  }
  else
  {
    sub_2158CDF18(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[CALogger postCAEventFor:eventInput:]", 24, CFSTR("Nothing to post..."), v7, v8, v9, v10);
  }

}

@end
