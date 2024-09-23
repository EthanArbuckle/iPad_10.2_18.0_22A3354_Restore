@implementation SAUISayIt(SiriUI)

- (void)siriui_setIgnoresMuteSwitch:()SiriUI
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setProperty:forKey:", v2, CFSTR("SiriUISAUISayItIgnoresMuteSwitch"));

}

- (uint64_t)siriui_ignoresMuteSwitch
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "propertyForKey:", CFSTR("SiriUISAUISayItIgnoresMuteSwitch"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

@end
