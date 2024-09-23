@implementation POXSIntegerDefinition

- (id)valueFromString:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a3, "integerValue"));
}

- (id)stringFromValue:(id)a3
{
  return (id)objc_msgSend(a3, "stringValue");
}

@end
