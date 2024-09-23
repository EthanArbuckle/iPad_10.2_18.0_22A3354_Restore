@implementation APMetricHelpers

+ (Class)diagnosticDaemonMetricHelper
{
  if (qword_100269AE8 != -1)
    dispatch_once(&qword_100269AE8, &stru_100215C78);
  return (Class)(id)qword_100269AF0;
}

+ (void)setDiagnosticDaemonMetricHelper:(Class)a3
{
  void *v4;
  unsigned int v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  __objc2_prot *proto;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v5 = objc_msgSend(v4, "isRunningTests");

  if (v5)
  {
    proto = &OBJC_PROTOCOL___APDiagnosticDaemonMetricHelping;
    if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:"))
    {
      qword_100269AF0 = (uint64_t)a3;
    }
    else
    {
      v6 = NSStringFromClass(a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v8 = NSStringFromProtocol((Protocol *)proto);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Class %@ does not implement protocol %@!"), v7, v9));

      APSimulateCrash(5, v10, 0);
    }

  }
}

+ (Class)journeyDaemonMetricHelper
{
  if (qword_100269AF8 != -1)
    dispatch_once(&qword_100269AF8, &stru_100215C98);
  return (Class)(id)qword_100269B00;
}

+ (void)setJourneyDaemonMetricHelper:(Class)a3
{
  void *v4;
  unsigned int v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  __objc2_prot *proto;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v5 = objc_msgSend(v4, "isRunningTests");

  if (v5)
  {
    proto = &OBJC_PROTOCOL___APJourneyDaemonMetricHelping;
    if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:"))
    {
      qword_100269B00 = (uint64_t)a3;
    }
    else
    {
      v6 = NSStringFromClass(a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v8 = NSStringFromProtocol((Protocol *)proto);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Class %@ does not implement protocol %@!"), v7, v9));

      APSimulateCrash(5, v10, 0);
    }

  }
}

+ (id)diagnosticMetricHelperForContentData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "diagnosticDaemonMetricHelper")), "initWithContentData:", v4);

  return v5;
}

+ (id)journeyMetricHelperForContentData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "journeyDaemonMetricHelper")), "initWithContentData:", v4);

  return v5;
}

@end
