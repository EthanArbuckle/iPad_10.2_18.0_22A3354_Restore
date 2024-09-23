@implementation SignpostInterval

- (id)signpostType
{
  return CFSTR("Interval");
}

- (BOOL)canGenerateCoreAnalyticsPayload
{
  return 1;
}

- (id)coreAnalyticsPayload
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SignpostInterval;
  v3 = -[SignpostInterval coreAnalyticsPayload](&v25, "coreAnalyticsPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {
    if (sub_100004CD8(self))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostInterval attributes](self, "attributes"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BundleIdOverride")));

      objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("StartProcessName"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("EndProcessName"));
      v7 = sub_100003384();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        sub_100009A24(self);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostInterval beginEvent](self, "beginEvent"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "processImagePath"));
      v11 = sub_100004524(v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v11);

      if (v6)
      {
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("StartProcessName"));
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostInterval beginEvent](self, "beginEvent"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "processName"));
        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostInterval beginEvent](self, "beginEvent"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "processName"));
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("StartProcessName"));

        }
        else
        {
          objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Unknown"), CFSTR("StartProcessName"));
        }

      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostInterval endEvent](self, "endEvent"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "processImagePath"));
      v18 = sub_100004524(v17);
      v8 = objc_claimAutoreleasedReturnValue(v18);

      if (v8)
      {
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("EndProcessName"));
      }
      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostInterval endEvent](self, "endEvent"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "processName"));
        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostInterval endEvent](self, "endEvent"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "processName"));
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("EndProcessName"));

        }
        else
        {
          objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Unknown"), CFSTR("EndProcessName"));
        }

      }
    }

    v23 = v4;
  }

  return v4;
}

@end
