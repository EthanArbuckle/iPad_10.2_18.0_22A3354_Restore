@implementation EQKitMathMLMLongDivision

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  EQKitMathMLMLongDivision *v6;
  void *v7;
  EQKitMathMLNode *v8;
  void *v9;
  EQKitMathMLMStackLine *v10;
  EQKitMathMLMStack *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)EQKitMathMLMLongDivision;
  v6 = -[EQKitMathMLMLongDivision init](&v13, sel_init);
  if (v6)
  {
    v7 = (void *)objc_msgSend(a4, "parseChildrenAsArrayFromXMLNode:", a3);
    if ((unint64_t)objc_msgSend(v7, "count") < 3)
    {
      objc_msgSend(a4, "reportError:withNode:", 5, a3);

      return 0;
    }
    else
    {
      v8 = (EQKitMathMLNode *)(id)objc_msgSend(v7, "objectAtIndex:", 0);
      v6->mDivisor = v8;
      -[EQKitMathMLNode setParent:](v8, "setParent:", v6);
      v9 = (void *)objc_msgSend(v7, "mutableCopy");
      objc_msgSend(v9, "removeObjectAtIndex:", 0);
      v10 = objc_alloc_init(EQKitMathMLMStackLine);
      objc_msgSend(v9, "insertObject:atIndex:", v10, 1);
      v11 = -[EQKitMathMLMStack initWithChildren:]([EQKitMathMLMStack alloc], "initWithChildren:", v9);
      v6->mStack = v11;
      -[EQKitMathMLNode setParent:](v11, "setParent:", v6);

    }
  }
  return v6;
}

- (const)mathMLAttributes
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMLongDivision mathMLAttributes]::sAttributesSet, &-[EQKitMathMLMLongDivision mathMLAttributes]::sAttributesData, &-[EQKitMathMLMStack mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMLongDivision mathMLAttributes]::sAttributesSet;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMLongDivision;
  -[EQKitMathMLMLongDivision dealloc](&v3, sel_dealloc);
}

- (id)schemataDivisor
{
  return self->mDivisor;
}

- (id)schemataStack
{
  return self->mStack;
}

@end
