@implementation EQKitMathMLBinaryNode

- (EQKitMathMLBinaryNode)init
{
  return -[EQKitMathMLBinaryNode initWithFirst:second:](self, "initWithFirst:second:", 0, 0);
}

- (EQKitMathMLBinaryNode)initWithFirst:(id)a3 second:(id)a4
{
  EQKitMathMLBinaryNode *v8;
  objc_super v10;

  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EQKitMathMLBinaryNode.mm"), 22, CFSTR("inFirst should not be nil"));
    if (a4)
      goto LABEL_3;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EQKitMathMLBinaryNode.mm"), 23, CFSTR("inSecond should not be nil"));
LABEL_3:
  v10.receiver = self;
  v10.super_class = (Class)EQKitMathMLBinaryNode;
  v8 = -[EQKitMathMLBinaryNode init](&v10, sel_init);
  if (v8)
  {
    v8->mFirst = (EQKitMathMLNode *)a3;
    v8->mSecond = (EQKitMathMLNode *)a4;
    -[EQKitMathMLNode setParent:](v8->mFirst, "setParent:", v8);
    -[EQKitMathMLNode setParent:](v8->mSecond, "setParent:", v8);
  }
  return v8;
}

- (id)initFromXMLNode:(_xmlNode *)a3 parser:(id)a4
{
  void *v7;

  v7 = (void *)objc_msgSend(a4, "parseChildrenAsArrayFromXMLNode:");
  if (objc_msgSend(v7, "count") == 2)
    return -[EQKitMathMLBinaryNode initWithFirst:second:](self, "initWithFirst:second:", objc_msgSend(v7, "objectAtIndex:", 0), objc_msgSend(v7, "objectAtIndex:", 1));
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
      || -[EQKitMathMLNode isBaseFontNameUsed](self->mSecond, "isBaseFontNameUsed");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLBinaryNode;
  -[EQKitMathMLBinaryNode dealloc](&v3, sel_dealloc);
}

@end
