@implementation NSExtensionContext(WidgetAdditions)

- (uint64_t)widgetLargestAvailableDisplayMode
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSExtension+Widgets.m"), 32, CFSTR("Intended to be implemented by concrete subclasses"));

  return 0;
}

- (void)setWidgetLargestAvailableDisplayMode:()WidgetAdditions
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSExtension+Widgets.m"), 38, CFSTR("Intended to be implemented by concrete subclasses"));

}

- (uint64_t)widgetActiveDisplayMode
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSExtension+Widgets.m"), 42, CFSTR("Intended to be implemented by concrete subclasses"));

  return 0;
}

- (double)widgetMaximumSizeForDisplayMode:()WidgetAdditions
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSExtension+Widgets.m"), 48, CFSTR("Intended to be implemented by concrete subclasses"));

  return *MEMORY[0x24BDBF148];
}

@end
