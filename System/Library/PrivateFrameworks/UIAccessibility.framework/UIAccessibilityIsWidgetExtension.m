@implementation UIAccessibilityIsWidgetExtension

void __UIAccessibilityIsWidgetExtension_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("NSExtension"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("NSExtensionPointIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityIsWidgetExtension_IsWidget = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.widget-extension"));

}

@end
