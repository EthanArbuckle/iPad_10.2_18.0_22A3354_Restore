@implementation CHUISWidgetHostViewController(PRAdditions)

- (id)pr_initWithComplicationDescriptor:()PRAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  +[PRWidgetMetricsProvider sharedInstance](PRWidgetMetricsProvider, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemMetricsForWidget:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = a1;
  objc_msgSend(v4, "widget");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v8, "initWithWidget:metrics:widgetConfigurationIdentifier:", v9, v7, v10);
  return v11;
}

@end
