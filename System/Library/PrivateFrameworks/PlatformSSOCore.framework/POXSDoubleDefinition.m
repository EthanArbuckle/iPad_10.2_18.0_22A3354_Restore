@implementation POXSDoubleDefinition

- (id)valueFromString:(id)a3
{
  void *v3;

  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a3, "doubleValue");
  return (id)objc_msgSend(v3, "numberWithDouble:");
}

- (id)stringFromValue:(id)a3
{
  return (id)objc_msgSend(a3, "stringValue");
}

@end
