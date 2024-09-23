@implementation EQKitMathMLMAlignGroup

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EQKitMathMLMAlignGroup;
  return -[EQKitMathMLMAlignGroup init](&v5, sel_init, a3, a4);
}

- (const)mathMLAttributes
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMAlignGroup mathMLAttributes]::sAttributesSet, &-[EQKitMathMLMAlignGroup mathMLAttributes]::sAttributesData, (int *)&-[EQKitMathMLMAlignMark mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMAlignGroup mathMLAttributes]::sAttributesSet;
}

@end
