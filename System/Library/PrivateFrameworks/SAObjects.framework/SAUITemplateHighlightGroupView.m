@implementation SAUITemplateHighlightGroupView

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.templates");
}

- (id)encodedClassName
{
  return CFSTR("HighlightGroupView");
}

+ (id)highlightGroupView
{
  return objc_alloc_init((Class)a1);
}

@end
