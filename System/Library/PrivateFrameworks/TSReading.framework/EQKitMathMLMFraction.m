@implementation EQKitMathMLMFraction

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EQKitMathMLMFraction;
  return -[EQKitMathMLBinaryNode initFromXMLNode:parser:](&v5, sel_initFromXMLNode_parser_, a3, a4);
}

- (const)mathMLAttributes
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMFraction mathMLAttributes]::sAttributesSet, -[EQKitMathMLMFraction mathMLAttributes]::sAttributesData, -[EQKitMathMLMOperator mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMFraction mathMLAttributes]::sAttributesSet;
}

- (BOOL)isEmbellishedOperator
{
  return -[EQKitMathMLNode isEmbellishedOperator](self->super.mFirst, "isEmbellishedOperator");
}

- (id)operatorCore
{
  return -[EQKitMathMLNode operatorCore](self->super.mFirst, "operatorCore");
}

- (id)schemataNumerator
{
  return self->super.mFirst;
}

- (id)schemataDenominator
{
  return self->super.mSecond;
}

@end
