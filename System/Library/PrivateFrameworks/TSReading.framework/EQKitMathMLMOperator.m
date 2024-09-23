@implementation EQKitMathMLMOperator

- (EQKitMathMLMOperator)initWithString:(id)a3 environment:(id)a4
{
  EQKitMathMLMOperator *v6;
  uint64_t v7;
  void *__p[2];
  char v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)EQKitMathMLMOperator;
  v6 = -[EQKitMathMLMToken initWithString:environment:](&v11, sel_initWithString_environment_);
  if (v6)
  {
    v7 = objc_msgSend(a4, "operatorDictionary");
    std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(a3, "UTF8String"));
    v6->mOperatorId = EQKit::Config::Operator::Dictionary::operatorId(v7, (const void **)__p);
    if (v10 < 0)
      operator delete(__p[0]);
  }
  return v6;
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EQKitMathMLMOperator;
  return -[EQKitMathMLMToken initFromXMLNode:parser:](&v5, sel_initFromXMLNode_parser_, a3, a4);
}

- (const)mathMLAttributes
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMOperator mathMLAttributes]::sAttributesSet, -[EQKitMathMLMOperator mathMLAttributes]::sAttributesData, &-[EQKitMathMLMToken mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMOperator mathMLAttributes]::sAttributesSet;
}

- (unsigned)operatorId
{
  return self->mOperatorId;
}

- (BOOL)isEmbellishedOperator
{
  return 1;
}

@end
