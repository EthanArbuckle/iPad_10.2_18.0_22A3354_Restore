@implementation AMSMetricsEvent(IMMetrics)

+ (id)im_defaultTopicForEvents
{
  void *v0;
  void *v1;
  id v2;
  NSObject *v3;
  uint8_t v5[16];

  +[IMMetrics defaultMetricsController](IMMetrics, "defaultMetricsController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "topic");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v1, "length"))
  {
    v2 = v1;
  }
  else
  {
    _IMStoreLogCategoryDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A904E000, v3, OS_LOG_TYPE_ERROR, "Error: No default topic has been registered with the registered default controller in IMMetrics", v5, 2u);
    }

    v2 = 0;
  }

  return v2;
}

- (uint64_t)im_setContentIdentifier:()IMMetrics
{
  return objc_msgSend(a1, "im_setProperty:forBodyKey:", a3, CFSTR("contentId"));
}

- (id)shortDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "topic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "propertyForBodyKey:", CFSTR("eventType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "propertyForBodyKey:", CFSTR("pageType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@, %@, %@"), v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)im_setToken:()IMMetrics
{
  return objc_msgSend(a1, "im_setProperty:forBodyKey:", a3, CFSTR("token"));
}

- (uint64_t)im_setName:()IMMetrics
{
  return objc_msgSend(a1, "im_setProperty:forBodyKey:", a3, CFSTR("name"));
}

+ (id)im_eventWithDefaultTopic
{
  void *v0;
  void *v1;
  void *v2;
  NSObject *v3;
  uint8_t v5[16];

  +[IMMetrics defaultMetricsController](IMMetrics, "defaultMetricsController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "topic");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v1, "length"))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB68]), "initWithTopic:", v1);
  }
  else
  {
    _IMStoreLogCategoryDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A904E000, v3, OS_LOG_TYPE_ERROR, "Error: No topic has been registered with IMMetrics default controller.", v5, 2u);
    }

    v2 = 0;
  }

  return v2;
}

+ (IMClickAMSMetricsEvent)im_clickEventWithDefaultTopic
{
  return objc_alloc_init(IMClickAMSMetricsEvent);
}

+ (IMPageAMSMetricsEvent)im_pageEventWithDefaultTopic
{
  return objc_alloc_init(IMPageAMSMetricsEvent);
}

+ (id)im_eventWithDefaultTopicAndEventType:()IMMetrics
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CFDB68], "im_eventWithDefaultTopic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "setProperty:forBodyKey:", v3, CFSTR("eventType"));

  return v5;
}

+ (id)im_eventWithTopic:()IMMetrics eventType:
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CFDB68];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithTopic:", v7);

  if (v8)
    objc_msgSend(v8, "setProperty:forBodyKey:", v5, CFSTR("eventType"));

  return v8;
}

- (uint64_t)im_name
{
  return objc_msgSend(a1, "propertyForBodyKey:", CFSTR("name"));
}

- (uint64_t)im_contentIdentifier
{
  return objc_msgSend(a1, "propertyForBodyKey:", CFSTR("contentId"));
}

- (uint64_t)im_token
{
  return objc_msgSend(a1, "propertyForBodyKey:", CFSTR("token"));
}

@end
