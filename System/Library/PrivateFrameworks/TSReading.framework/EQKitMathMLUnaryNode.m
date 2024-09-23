@implementation EQKitMathMLUnaryNode

- (EQKitMathMLUnaryNode)init
{
  return -[EQKitMathMLUnaryNode initWithChild:](self, "initWithChild:", 0);
}

- (EQKitMathMLUnaryNode)initWithChild:(id)a3
{
  EQKitMathMLUnaryNode *v5;
  EQKitMathMLNode *v6;
  objc_super v8;

  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EQKitMathMLUnaryNode.mm"), 22, CFSTR("child should not be nil"));
  v8.receiver = self;
  v8.super_class = (Class)EQKitMathMLUnaryNode;
  v5 = -[EQKitMathMLUnaryNode init](&v8, sel_init);
  if (v5)
  {
    v6 = (EQKitMathMLNode *)a3;
    v5->mChild = v6;
    -[EQKitMathMLNode setParent:](v6, "setParent:", v5);
  }
  return v5;
}

- (EQKitMathMLUnaryNode)initWithChildren:(id)a3
{
  EQKitMathMLUnaryNode *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EQKitMathMLUnaryNode;
  v4 = -[EQKitMathMLUnaryNode init](&v6, sel_init);
  if (v4)
    v4->mChild = (EQKitMathMLNode *)-[EQKitMathMLMRow initWithChildren:]([EQKitMathMLMRow alloc], "initWithChildren:", a3);
  return v4;
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  uint64_t v7;

  v7 = objc_msgSend(a4, "parseChildrenAsNodeFromXMLNode:");
  if (v7)
    return -[EQKitMathMLUnaryNode initWithChild:](self, "initWithChild:", v7);
  objc_msgSend(a4, "reportError:withNode:", 5, a3);

  return 0;
}

- (const)mathMLAttributes
{
  return 0;
}

- (BOOL)isBaseFontNameUsed
{
  return -[EQKitMathMLNode isBaseFontNameUsed](self->mChild, "isBaseFontNameUsed");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLUnaryNode;
  -[EQKitMathMLUnaryNode dealloc](&v3, sel_dealloc);
}

@end
