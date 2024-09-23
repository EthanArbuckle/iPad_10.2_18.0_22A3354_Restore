@implementation POXSBooleanDefinition

- (id)valueFromString:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a3, "BOOLValue"));
}

- (id)stringFromValue:(id)a3
{
  if (objc_msgSend(a3, "BOOLValue"))
    return CFSTR("true");
  else
    return CFSTR("false");
}

@end
