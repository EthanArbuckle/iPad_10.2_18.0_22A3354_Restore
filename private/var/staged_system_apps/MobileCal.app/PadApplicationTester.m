@implementation PadApplicationTester

- (id)extendedLaunchTestName
{
  void *v2;
  void *v3;
  id v4;
  unint64_t v5;
  NSObject *v7;
  uint8_t v8[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastViewMode"));
  v4 = objc_msgSend(v3, "integerValue");

  v5 = 3;
  if (v4 != (id)-1)
    v5 = (unint64_t)v4;
  if (v5 < 4)
    return (id)qword_1001B54C0[v5];
  v7 = kCalUILogTestHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogTestHandle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unknown view type encountered while trying to determine 'extendedLaunchTestName'", v8, 2u);
  }
  return 0;
}

@end
