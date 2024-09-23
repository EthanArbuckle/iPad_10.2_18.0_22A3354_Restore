@implementation UIColor

id __82__UIColor_WFWidgetConfiguration__wf_defaultWidgetConfigurationCardBackgroundColor__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
  {
    v2 = 0.109803922;
    v3 = 0.117647059;
    v4 = 1.0;
    v5 = 0.109803922;
  }
  else
  {
    v2 = 1.0;
    v5 = 1.0;
    v3 = 1.0;
    v4 = 1.0;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDisplayP3Red:green:blue:alpha:", v2, v5, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
