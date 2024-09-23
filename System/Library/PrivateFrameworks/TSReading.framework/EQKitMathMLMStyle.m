@implementation EQKitMathMLMStyle

- (const)mathMLAttributes
{
  unsigned __int8 v2;

  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMStyle mathMLAttributes]::sAttributesSet, (int *)-[EQKitMathMLMStyle mathMLAttributes]::sAttributesDataInherited, &-[EQKitMathMLMAlignGroup mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMStyle mathMLAttributes]::sAttributesSet;
}

- (Schemata)layoutSchemata
{
  return (Schemata *)EQKit::Layout::Schemata::node(self->super.mChild, (uint64_t)retstr);
}

- (int)isOperatorPaddingRequired
{
  return 0;
}

- (BOOL)isEmbellishedOperator
{
  return -[EQKitMathMLNode isEmbellishedOperator](self->super.mChild, "isEmbellishedOperator");
}

- (id)operatorCore
{
  return -[EQKitMathMLNode operatorCore](self->super.mChild, "operatorCore");
}

@end
