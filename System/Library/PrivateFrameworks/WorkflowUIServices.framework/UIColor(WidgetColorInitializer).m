@implementation UIColor(WidgetColorInitializer)

+ (uint64_t)wf_colorNamed:()WidgetColorInitializer inBundle:
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "colorNamed:inBundle:compatibleWithTraitCollection:", a3, a4, 0);
}

@end
