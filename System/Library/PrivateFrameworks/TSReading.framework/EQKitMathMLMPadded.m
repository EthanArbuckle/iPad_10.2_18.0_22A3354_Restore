@implementation EQKitMathMLMPadded

- (const)mathMLAttributes
{
  unsigned __int8 v2;

  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMPadded mathMLAttributes]::sAttributesSet, -[EQKitMathMLMPadded mathMLAttributes]::sAttributesData, (int *)&-[EQKitMathMLMStringLiteral mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMPadded mathMLAttributes]::sAttributesSet;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)EQKitMathMLMPadded;
  -[EQKitMathMLUnaryNode dealloc](&v2, sel_dealloc);
}

- (BOOL)isEmbellishedOperator
{
  return -[EQKitMathMLNode isEmbellishedOperator](self->super.mChild, "isEmbellishedOperator");
}

- (id)operatorCore
{
  return -[EQKitMathMLNode operatorCore](self->super.mChild, "operatorCore");
}

- (id)schemataNode
{
  return self->super.mChild;
}

@end
