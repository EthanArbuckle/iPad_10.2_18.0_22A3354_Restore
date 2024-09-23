@implementation SSMetricsBaseEvent

- (SSMetricsBaseEvent)init
{
  SSMetricsBaseEvent *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SSMetricsBaseEvent;
  v2 = -[SSMetricsMutableEvent init](&v9, sel_init);
  if (v2)
  {
    if (init_sToken != -1)
      dispatch_once(&init_sToken, &__block_literal_global_43);
    objc_msgSend((id)__mainScreenAnswers, "objectForKey:", CFSTR("main-screen-width"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMetricsMutableEvent setProperty:forBodyKey:](v2, "setProperty:forBodyKey:", v3, CFSTR("screenWidth"));

    objc_msgSend((id)__mainScreenAnswers, "objectForKey:", CFSTR("main-screen-height"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMetricsMutableEvent setProperty:forBodyKey:](v2, "setProperty:forBodyKey:", v4, CFSTR("screenHeight"));

    objc_msgSend((id)__mainScreenAnswers, "objectForKey:", CFSTR("main-screen-scale"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMetricsMutableEvent setProperty:forBodyKey:](v2, "setProperty:forBodyKey:", v5, CFSTR("pixelRatio"));

    objc_msgSend((id)__mainScreenAnswers, "objectForKey:", CFSTR("main-screen-width"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMetricsMutableEvent setProperty:forBodyKey:](v2, "setProperty:forBodyKey:", v6, CFSTR("windowInnerWidth"));

    objc_msgSend((id)__mainScreenAnswers, "objectForKey:", CFSTR("main-screen-height"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMetricsMutableEvent setProperty:forBodyKey:](v2, "setProperty:forBodyKey:", v7, CFSTR("windowInnerHeight"));

  }
  return v2;
}

void __26__SSMetricsBaseEvent_init__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("main-screen-width");
  v2[1] = CFSTR("main-screen-height");
  v2[2] = CFSTR("main-screen-scale");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 3);
  MGCopyMultipleAnswers();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__mainScreenAnswers;
  __mainScreenAnswers = v0;

}

- (BOOL)isBlacklistedByConfiguration:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSMetricsBaseEvent;
  return -[SSMetricsEvent isBlacklistedByConfiguration:](&v4, sel_isBlacklistedByConfiguration_, a3);
}

- (NSString)pageContext
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("pageContext"));
}

- (NSString)pageDescription
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("page"));
}

- (unint64_t)pageID
{
  void *v2;
  unint64_t v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("pageId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return v3;
}

- (NSString)pageType
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("pageType"));
}

- (NSString)pageURL
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("pageUrl"));
}

- (NSNumber)pixelRatio
{
  return (NSNumber *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("pixelRatio"));
}

- (NSNumber)screenHeight
{
  return (NSNumber *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("screenHeight"));
}

- (NSNumber)screenWidth
{
  return (NSNumber *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("screenWidth"));
}

- (void)setPageContext:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("pageContext"));
}

- (void)setPageDescription:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("page"));
}

- (void)setPageID:(unint64_t)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("pageId"));

  }
  else
  {
    -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", 0, CFSTR("pageId"));
  }
}

- (void)setPageType:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("pageType"));
}

- (void)setPageURL:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("pageUrl"));
}

- (void)setPixelRatio:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("pixelRatio"));
}

- (void)setScreenHeight:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("screenHeight"));
}

- (void)setScreenWidth:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("screenWidth"));
}

- (void)setWindowHeight:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("windowInnerHeight"));
}

- (void)setWindowOrientation:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("windowOrientation"));
}

- (void)setWindowWidth:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("windowInnerWidth"));
}

- (NSNumber)windowHeight
{
  return (NSNumber *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("windowInnerHeight"));
}

- (NSString)windowOrientation
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("windowOrientation"));
}

- (NSNumber)windowWidth
{
  return (NSNumber *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("windowInnerWidth"));
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)SSMetricsBaseEvent;
  -[SSMetricsBaseEvent description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent eventType](self, "eventType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent eventVersion](self, "eventVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ -- [Type: %@] [eVersion: %@]"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
