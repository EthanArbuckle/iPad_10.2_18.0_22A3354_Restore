@implementation EQKitMathMLMath

- (EQKitMathMLMath)init
{
  return (EQKitMathMLMath *)-[EQKitMathMLMath initFromXMLNode:parser:](self, "initFromXMLNode:parser:", 0, 0);
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  EQKitMathMLMath *v7;
  _QWORD *v8;
  _QWORD *v9;
  EQKitMathMLNode *v10;
  objc_super v12;

  if (!a3 || !a4)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EQKitMathMLMath.mm"), 53, CFSTR("invalid arguments"));
  v12.receiver = self;
  v12.super_class = (Class)EQKitMathMLMath;
  v7 = -[EQKitMathMLMath init](&v12, sel_init);
  if (v7)
  {
    v8 = operator new(0x230uLL, MEMORY[0x24BEDB6B8]);
    if (v8)
    {
      v9 = v8;
      v7->mAttributeCollection = EQKit::AttributeCollection::AttributeCollection(v8);
      objc_msgSend(a4, "setAttributeCollection:", v9);
      v10 = (EQKitMathMLNode *)(id)objc_msgSend(a4, "parseChildrenAsNodeFromXMLNode:", a3);
      v7->mExpression = v10;
      -[EQKitMathMLNode setParent:](v10, "setParent:", v7);
    }
    else
    {
      v7->mAttributeCollection = 0;
    }
    if (v7->mExpression)
    {
      v7->mEnvironment = (EQKitEnvironmentInstance *)(id)objc_msgSend(a4, "environment");
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (const)mathMLAttributes
{
  unsigned __int8 v2;

  {
    std::set<EQKitTypes::Attributes::Enum>::set[abi:nn180100]<EQKitTypes::Attributes::Enum const*>((uint64_t)&-[EQKitMathMLMath mathMLAttributes]::sAttributesSet, &-[EQKitMathMLMath mathMLAttributes]::sAttributesData, -[EQKitMathMLMFenced mathMLAttributes]::sAttributesData);
  }
  return &-[EQKitMathMLMath mathMLAttributes]::sAttributesSet;
}

- (void)dealloc
{
  void *mAttributeCollection;
  objc_super v4;

  mAttributeCollection = self->mAttributeCollection;
  if (mAttributeCollection)
    (*(void (**)(void *, SEL))(*(_QWORD *)mAttributeCollection + 8))(mAttributeCollection, a2);

  v4.receiver = self;
  v4.super_class = (Class)EQKitMathMLMath;
  -[EQKitMathMLMath dealloc](&v4, sel_dealloc);
}

- (AttributeCollection)attributeCollection
{
  return (AttributeCollection *)self->mAttributeCollection;
}

- (id)newLayout
{
  return -[EQKitLayout initWithRoot:environment:]([EQKitLayout alloc], "initWithRoot:environment:", self, self->mEnvironment);
}

- (EQKitLayoutNode)parent
{
  return 0;
}

- (Schemata)layoutSchemata
{
  EQKit::Layout::Schemata *v4;

  if (self->mExpression)
    v4 = (EQKit::Layout::Schemata *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:");
  else
    v4 = (EQKit::Layout::Schemata *)objc_msgSend(MEMORY[0x24BDBCE30], "array");
  return (Schemata *)EQKit::Layout::Schemata::row(v4, (uint64_t)retstr);
}

- (id)layoutStyleNode
{
  return 0;
}

- (int64_t)scriptLevelWithBase:(int64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isNumber
{
  return 0;
}

- (BOOL)isSpaceLike
{
  return 0;
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

- (BOOL)isBaseFontNameUsed
{
  return -[EQKitMathMLNode isBaseFontNameUsed](self->mExpression, "isBaseFontNameUsed");
}

- (BOOL)isAttributeDefaultInheritableFromStyle:(int)a3
{
  return 0;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p expr=%@>"), NSStringFromClass(v4), self, self->mExpression);
}

@end
