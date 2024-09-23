@implementation EQKitMathMLNode

- (Schemata)layoutSchemata
{
  return (Schemata *)EQKit::Layout::Schemata::Schemata((uint64_t)retstr);
}

- (id)layoutStyleNode
{
  return 0;
}

- (BOOL)isNumber
{
  return 0;
}

- (BOOL)isSpaceLike
{
  return 0;
}

- (BOOL)isBaseFontNameUsed
{
  return 0;
}

- (int64_t)scriptLevelWithBase:(int64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isEmbellishedOperator
{
  return 0;
}

- (id)operatorCore
{
  return 0;
}

- (int)isOperatorPaddingRequired
{
  return 1;
}

- (BOOL)isAttributeDefaultInheritableFromStyle:(int)a3
{
  return (a3 > 0x2B) | (0x3FFFFFFFCFFuLL >> a3) & 1;
}

- (EQKitLayoutNode)parent
{
  return self->mParent;
}

- (void)setParent:(id)a3
{
  self->mParent = (EQKitLayoutNode *)a3;
}

@end
