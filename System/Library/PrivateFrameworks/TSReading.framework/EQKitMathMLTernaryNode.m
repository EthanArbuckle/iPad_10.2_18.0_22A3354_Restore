@implementation EQKitMathMLTernaryNode

- (EQKitMathMLTernaryNode)init
{
  return -[EQKitMathMLTernaryNode initWithFirst:second:third:](self, "initWithFirst:second:third:", 0, 0, 0);
}

- (EQKitMathMLTernaryNode)initWithFirst:(id)a3 second:(id)a4 third:(id)a5
{
  EQKitMathMLTernaryNode *v10;
  objc_super v12;

  if (a3)
  {
    if (a4)
      goto LABEL_3;
LABEL_8:
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EQKitMathMLTernaryNode.mm"), 24, CFSTR("inSecond should not be nil"));
    if (a5)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EQKitMathMLTernaryNode.mm"), 23, CFSTR("inFirst should not be nil"));
  if (!a4)
    goto LABEL_8;
LABEL_3:
  if (a5)
    goto LABEL_4;
LABEL_9:
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EQKitMathMLTernaryNode.mm"), 25, CFSTR("inThird should not be nil"));
LABEL_4:
  v12.receiver = self;
  v12.super_class = (Class)EQKitMathMLTernaryNode;
  v10 = -[EQKitMathMLTernaryNode init](&v12, sel_init);
  if (v10)
  {
    v10->mFirst = (EQKitMathMLNode *)a3;
    v10->mSecond = (EQKitMathMLNode *)a4;
    v10->mThird = (EQKitMathMLNode *)a5;
    -[EQKitMathMLNode setParent:](v10->mFirst, "setParent:", v10);
    -[EQKitMathMLNode setParent:](v10->mSecond, "setParent:", v10);
    -[EQKitMathMLNode setParent:](v10->mThird, "setParent:", v10);
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLTernaryNode;
  -[EQKitMathMLTernaryNode dealloc](&v3, sel_dealloc);
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  void *v7;

  v7 = (void *)objc_msgSend(a4, "parseChildrenAsArrayFromXMLNode:");
  if (objc_msgSend(v7, "count") == 3)
    return -[EQKitMathMLTernaryNode initWithFirst:second:third:](self, "initWithFirst:second:third:", objc_msgSend(v7, "objectAtIndex:", 0), objc_msgSend(v7, "objectAtIndex:", 1), objc_msgSend(v7, "objectAtIndex:", 2));
  objc_msgSend(a4, "reportError:withNode:", 5, a3);

  return 0;
}

- (const)mathMLAttributes
{
  return 0;
}

- (BOOL)isBaseFontNameUsed
{
  return -[EQKitMathMLNode isBaseFontNameUsed](self->mFirst, "isBaseFontNameUsed")
      || -[EQKitMathMLNode isBaseFontNameUsed](self->mSecond, "isBaseFontNameUsed")
      || -[EQKitMathMLNode isBaseFontNameUsed](self->mThird, "isBaseFontNameUsed");
}

@end
