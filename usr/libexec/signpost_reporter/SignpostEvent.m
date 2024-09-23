@implementation SignpostEvent

- (id)signpostType
{
  return CFSTR("Event");
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
  id v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  id v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SignpostEvent;
  v3 = -[SignpostEvent coreAnalyticsPayload](&v16, "coreAnalyticsPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {
    if (sub_100004CD8(self))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostEvent attributes](self, "attributes"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BundleIdOverride")));

      objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("StartProcessName"));
      v7 = sub_100003384();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        sub_100009974(self);

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostEvent processImagePath](self, "processImagePath"));
      v10 = sub_100004524(v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v10);

      if (v6)
      {
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("StartProcessName"));
      }
      else
      {
        v11 = objc_claimAutoreleasedReturnValue(-[SignpostEvent processName](self, "processName"));
        v12 = (void *)v11;
        if (v11)
          v13 = (const __CFString *)v11;
        else
          v13 = CFSTR("Unknown");
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("StartProcessName"));

      }
    }

    v14 = v4;
  }

  return v4;
}

@end
