@implementation SCRCMathSpaceExpression

- (SCRCMathSpaceExpression)initWithDictionary:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCRCMathSpaceExpression;
  return -[SCRCMathExpression initWithDictionary:](&v4, sel_initWithDictionary_, a3);
}

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithString:treePosition:", CFSTR(" "), a4);
}

- (id)mathMLString
{
  return CFSTR("<mspace />");
}

- (BOOL)beginsWithSpace
{
  return 1;
}

- (BOOL)endsWithSpace
{
  return 1;
}

@end
