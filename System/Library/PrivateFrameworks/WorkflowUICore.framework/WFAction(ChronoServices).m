@implementation WFAction(ChronoServices)

- (void)setWidgetFamily:()ChronoServices
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  INCodableAttributeArraySizeClassFromCHSWidgetFamily(a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v4;
  if (v4)
    v5 = v4;
  else
    v5 = *MEMORY[0x24BDD98A0];
  objc_msgSend(a1, "setWidgetSizeClass:", v5);

}

- (uint64_t)widgetFamily
{
  id v1;
  uint64_t v2;

  objc_msgSend(a1, "widgetSizeClass");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDD98B0]) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDD98A8]) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDD98A0]) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDD9898]) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDD9880]) & 1) != 0)
  {
    v2 = 10;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDD9890]) & 1) != 0)
  {
    v2 = 11;
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDD9888]))
  {
    v2 = 12;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end
