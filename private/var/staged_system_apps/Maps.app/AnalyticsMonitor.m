@implementation AnalyticsMonitor

- (AnalyticsMonitor)init
{
  char *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AnalyticsMonitor;
  v2 = -[AnalyticsMonitor init](&v10, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "processNotification:", CFSTR("ContainerWillChangeStyleNotification"), 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, "processNotification:", CFSTR("ContainerDidChangeStyleNotification"), 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, "processNotification:", CFSTR("ContainerWillChangeLayoutNotification"), 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, "processNotification:", CFSTR("ContainerDidChangeLayoutNotification"), 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "processNotification:", CFSTR("ContainerWillPresentContaineeNotification"), 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, "processNotification:", CFSTR("ContainerWillResignContaineeNotification"), 0);

    *(_OWORD *)(v2 + 8) = xmmword_100E348E0;
  }
  return (AnalyticsMonitor *)v2;
}

- (void)processNotification:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  id v17;
  unint64_t containeeLayout;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;

  v28 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "object"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "object"));
    v6 = objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___ContainerProtocol);

    if (v6)
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "object"));
    else
      v4 = 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "name"));
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("ContainerDidChangeLayoutNotification"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "userInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ContainerLayout")));
    self->_containeeLayout = (unint64_t)objc_msgSend(v10, "integerValue");
LABEL_9:

    goto LABEL_10;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "name"));
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("ContainerDidChangeStyleNotification"));

  if (v12)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "userInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ContainerStyle")));
    self->_containerStyle = (unint64_t)objc_msgSend(v10, "integerValue");
    goto LABEL_9;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "name"));
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("ContainerWillChangeLayoutNotification"));

  if (!v14)
    goto LABEL_11;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "userInfo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ContainerUpdateSource")));
  v17 = objc_msgSend(v16, "unsignedIntegerValue");

  containeeLayout = self->_containeeLayout;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "userInfo"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ContainerLayout")));
  v21 = objc_msgSend(v20, "integerValue");

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("ContainerContainee")));

  if ((unint64_t)v21 > containeeLayout)
    v23 = 1;
  else
    v23 = 2 * ((unint64_t)v21 < containeeLayout);
  if (v21 != (id)containeeLayout && v17 == (id)1)
  {
    if (objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___GEOLogContextDelegate))
    {
      v24 = v9;
    }
    else
    {
      if ((objc_opt_respondsToSelector(v9, "contentViewController") & 1) != 0)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentViewController"));
        if (objc_msgSend(v25, "conformsToProtocol:", &OBJC_PROTOCOL___GEOLogContextDelegate))
          v26 = v25;
        else
          v26 = 0;

        if (v26)
          goto LABEL_26;
        goto LABEL_29;
      }
      if (!objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___GEOLogContextDelegate))
        goto LABEL_29;
      v24 = v4;
    }
    v26 = v24;
    if (v24)
    {
LABEL_26:
      v27 = objc_msgSend(v26, "currentUITargetForAnalytics");

LABEL_30:
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v23, v27, 0);
      goto LABEL_10;
    }
LABEL_29:
    v27 = 0;
    goto LABEL_30;
  }
LABEL_10:

LABEL_11:
}

@end
