@implementation EQKitMathMLMSpace

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EQKitMathMLMSpace;
  return -[EQKitMathMLMSpace init](&v5, sel_init, a3, a4);
}

- (const)mathMLAttributes
{
  unsigned __int8 v2;

  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMSpace mathMLAttributes]::sAttributesSet, -[EQKitMathMLMSpace mathMLAttributes]::sAttributesData, -[EQKitMathMLMPadded mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMSpace mathMLAttributes]::sAttributesSet;
}

- (BOOL)isSpaceLike
{
  return 1;
}

@end
