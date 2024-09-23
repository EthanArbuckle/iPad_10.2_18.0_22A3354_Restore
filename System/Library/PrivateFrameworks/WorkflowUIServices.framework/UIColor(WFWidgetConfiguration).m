@implementation UIColor(WFWidgetConfiguration)

+ (uint64_t)wf_defaultWidgetConfigurationCardBackgroundColor
{
  return objc_msgSend(a1, "colorWithDynamicProvider:", &__block_literal_global_143);
}

@end
