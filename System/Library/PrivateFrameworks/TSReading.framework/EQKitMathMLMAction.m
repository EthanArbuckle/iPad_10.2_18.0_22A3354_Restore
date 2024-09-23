@implementation EQKitMathMLMAction

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  EQKitMathMLMAction *v6;
  void *v7;
  EQKitMathMLNode *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)EQKitMathMLMAction;
  v6 = -[EQKitMathMLMAction init](&v10, sel_init);
  if (v6)
  {
    v7 = (void *)objc_msgSend(a4, "parseChildrenAsArrayFromXMLNode:", a3);
    if (objc_msgSend(v7, "count"))
    {
      v8 = (EQKitMathMLNode *)(id)objc_msgSend(v7, "objectAtIndex:", 0);
      v6->mExpression = v8;
      -[EQKitMathMLNode setParent:](v8, "setParent:", v6);
    }
    else
    {
      objc_msgSend(a4, "reportError:withNode:", 5, a3);

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLMAction;
  -[EQKitMathMLMAction dealloc](&v3, sel_dealloc);
}

- (const)mathMLAttributes
{
  return 0;
}

- (Schemata)layoutSchemata
{
  return (Schemata *)EQKit::Layout::Schemata::node(self->mExpression, (uint64_t)retstr);
}

- (BOOL)isEmbellishedOperator
{
  return -[EQKitMathMLNode isEmbellishedOperator](self->mExpression, "isEmbellishedOperator");
}

- (id)operatorCore
{
  return -[EQKitMathMLNode operatorCore](self->mExpression, "operatorCore");
}

@end
