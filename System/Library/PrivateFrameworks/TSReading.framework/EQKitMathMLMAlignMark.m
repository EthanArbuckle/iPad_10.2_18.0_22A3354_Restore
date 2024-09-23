@implementation EQKitMathMLMAlignMark

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EQKitMathMLMAlignMark;
  return -[EQKitMathMLMAlignMark init](&v5, sel_init, a3, a4);
}

- (const)mathMLAttributes
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMAlignMark mathMLAttributes]::sAttributesSet, &-[EQKitMathMLMAlignMark mathMLAttributes]::sAttributesData, &dword_217C2795C);
  }
  return &-[EQKitMathMLMAlignMark mathMLAttributes]::sAttributesSet;
}

@end
