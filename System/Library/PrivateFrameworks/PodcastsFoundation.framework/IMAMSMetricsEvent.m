@implementation IMAMSMetricsEvent

- (void)setPageType:(id)a3
{
  -[IMAMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("pageType"));
}

- (void)setEventType:(id)a3
{
  -[IMAMSMetricsEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("eventType"));
}

- (IMAMSMetricsEvent)init
{
  void *v3;
  IMAMSMetricsEvent *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CFDB68], "im_defaultTopicForEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)IMAMSMetricsEvent;
  v4 = -[IMAMSMetricsEvent initWithTopic:](&v6, sel_initWithTopic_, v3);

  return v4;
}

- (id)eventType
{
  return (id)-[IMAMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("eventType"));
}

- (NSString)pageType
{
  return (NSString *)-[IMAMSMetricsEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("pageType"));
}

@end
