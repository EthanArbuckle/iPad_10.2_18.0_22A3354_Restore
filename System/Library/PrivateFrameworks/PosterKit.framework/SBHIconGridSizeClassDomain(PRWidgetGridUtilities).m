@implementation SBHIconGridSizeClassDomain(PRWidgetGridUtilities)

+ (id)pr_widgetDomain
{
  if (pr_widgetDomain_onceToken != -1)
    dispatch_once(&pr_widgetDomain_onceToken, &__block_literal_global_45);
  return (id)pr_widgetDomain_domain;
}

@end
