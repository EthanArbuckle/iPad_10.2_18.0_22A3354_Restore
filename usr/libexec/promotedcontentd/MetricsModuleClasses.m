@implementation MetricsModuleClasses

+ (Class)metricClass
{
  if (qword_100269A58 != -1)
    dispatch_once(&qword_100269A58, &stru_100215B08);
  return (Class)(id)qword_100269A60;
}

+ (Class)storageClass
{
  if (qword_100269AB8 != -1)
    dispatch_once(&qword_100269AB8, &stru_100215BC8);
  return (Class)(id)qword_100269AC0;
}

+ (Class)batchClass
{
  if (qword_100269A68 != -1)
    dispatch_once(&qword_100269A68, &stru_100215B28);
  return (Class)(id)qword_100269A70;
}

+ (void)setMetricClass:(Class)a3
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
    proto = &OBJC_PROTOCOL___APMetricProtocol;
    if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:"))
    {
      qword_100269A60 = (uint64_t)a3;
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

+ (void)setBatchClass:(Class)a3
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
    proto = &OBJC_PROTOCOL___APMetricBatchable;
    if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:"))
    {
      qword_100269A70 = (uint64_t)a3;
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

+ (Class)notificationRegistrarClass
{
  if (qword_100269A78 != -1)
    dispatch_once(&qword_100269A78, &stru_100215B48);
  return (Class)(id)qword_100269A80;
}

+ (void)setNotificationRegistrarClass:(Class)a3
{
  void *v4;
  unsigned int v5;
  __objc2_prot *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  __objc2_prot *proto;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v5 = objc_msgSend(v4, "isRunningTests");

  if (v5)
  {
    proto = &OBJC_PROTOCOL___APMetricNotificationRegister;
    v6 = &OBJC_PROTOCOL___APMetricReceiving;
    if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", proto)
      && -[objc_class conformsToProtocol:](a3, "conformsToProtocol:", v6))
    {
      qword_100269A80 = (uint64_t)a3;
    }
    else
    {
      v7 = NSStringFromClass(a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = NSStringFromProtocol((Protocol *)proto);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = NSStringFromProtocol((Protocol *)v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Class %@ does not implement both the %@ or %@ protocols!"), v8, v10, v12));

      APSimulateCrash(5, v13, 0);
    }

  }
}

+ (Class)purposeClass
{
  if (qword_100269A88 != -1)
    dispatch_once(&qword_100269A88, &stru_100215B68);
  return (Class)(id)qword_100269A90;
}

+ (void)setRouteClass:(Class)a3
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
    proto = &OBJC_PROTOCOL___APMetricRoutable;
    if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:"))
    {
      qword_100269A90 = (uint64_t)a3;
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

+ (Class)httpDeliveryClass
{
  if (qword_100269A98 != -1)
    dispatch_once(&qword_100269A98, &stru_100215B88);
  return (Class)(id)qword_100269AA0;
}

+ (void)setHttpDeliveryClass:(Class)a3
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
    proto = &OBJC_PROTOCOL___APMetricHTTPDelivering;
    if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:"))
    {
      qword_100269AA0 = (uint64_t)a3;
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

+ (Class)serverDeliveryClass
{
  if (qword_100269AA8 != -1)
    dispatch_once(&qword_100269AA8, &stru_100215BA8);
  return (Class)(id)qword_100269AB0;
}

+ (void)setServerDeliveryClass:(Class)a3
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
    proto = &OBJC_PROTOCOL___APMetricServerDelivering;
    if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:"))
    {
      qword_100269AB0 = (uint64_t)a3;
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

+ (void)setStorageClass:(Class)a3
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
    proto = &OBJC_PROTOCOL___APMetricReceiving;
    if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:")
      && -[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &OBJC_PROTOCOL___APMetricStoring))
    {
      qword_100269AC0 = (uint64_t)a3;
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

@end
