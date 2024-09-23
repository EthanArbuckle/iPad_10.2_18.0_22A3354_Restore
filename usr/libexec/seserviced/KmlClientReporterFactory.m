@implementation KmlClientReporterFactory

+ (id)getReporter
{
  void *v2;
  KmlWalletReporter *v3;
  void *v4;

  v2 = (void *)qword_1003548D8;
  if (!qword_1003548D8)
  {
    v2 = (void *)qword_1003548D0;
    if (!qword_1003548D0)
    {
      v3 = objc_alloc_init(KmlWalletReporter);
      v4 = (void *)qword_1003548D0;
      qword_1003548D0 = (uint64_t)v3;

      v2 = (void *)qword_1003548D0;
    }
  }
  return v2;
}

+ (id)getTestReporter
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  KmlTestClientReporter *v7;
  void *v8;
  uint64_t v10;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"+[KmlClientReporterFactory getTestReporter]", 53, &stru_100316BD0, v2, v3, v4, v5, v10);
  v6 = (void *)qword_1003548D8;
  if (!qword_1003548D8)
  {
    v7 = objc_alloc_init(KmlTestClientReporter);
    v8 = (void *)qword_1003548D8;
    qword_1003548D8 = (uint64_t)v7;

    v6 = (void *)qword_1003548D8;
  }
  return v6;
}

+ (void)removeTestReporter
{
  uint64_t v2;
  void *v3;

  v2 = qword_1003548D8;
  if (qword_1003548D8)
  {
    ++*(_DWORD *)(qword_1003548D8 + 64);
    if (!objc_msgSend(*(id *)(v2 + 8), "count") || *(_DWORD *)(v2 + 64) >= *(_DWORD *)(v2 + 68))
    {
      objc_msgSend((id)qword_1003548D8, "cleanup");
      v3 = (void *)qword_1003548D8;
      qword_1003548D8 = 0;

    }
  }
}

@end
