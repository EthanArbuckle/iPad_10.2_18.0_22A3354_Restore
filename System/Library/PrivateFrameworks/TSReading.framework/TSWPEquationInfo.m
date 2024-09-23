@implementation TSWPEquationInfo

- (TSWPEquationInfo)initWithContext:(id)a3 mathMLNode:(_xmlNode *)a4 fromXMLDoc:(_xmlDoc *)a5
{
  void *v9;
  uint64_t v10;
  TSWPEquationInfo *v11;
  void *v12;
  id v13;
  EQKitEquation *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v22;

  if (a4)
  {
    if (a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v19 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEquationInfo initWithContext:mathMLNode:fromXMLDoc:]");
  objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationInfo.m"), 36, CFSTR("invalid nil value for '%s'"), "mathMLNode");
  if (!a5)
  {
LABEL_3:
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEquationInfo initWithContext:mathMLNode:fromXMLDoc:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationInfo.m"), 37, CFSTR("invalid nil value for '%s'"), "xmlDoc");
  }
LABEL_4:
  v22.receiver = self;
  v22.super_class = (Class)TSWPEquationInfo;
  v11 = -[TSDDrawableInfo initWithContext:geometry:](&v22, sel_initWithContext_geometry_, a3, 0);
  if (v11)
  {
    v21 = 0;
    v12 = (void *)objc_msgSend(a3, "documentRoot");
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (v13 = (id)objc_msgSend(v12, "performSelector:", sel_equationEnvironment)) == 0)
    {
      v13 = +[EQKitEnvironment defaultEnvironment](EQKitEnvironment, "defaultEnvironment");
    }
    v14 = +[EQKitEquation equationWithXMLDoc:node:environment:error:](EQKitEquation, "equationWithXMLDoc:node:environment:error:", a5, a4, v13, &v21);
    v11->_equation = v14;
    if (!v14)
    {
      v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPEquationInfo initWithContext:mathMLNode:fromXMLDoc:]");
      v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEquationInfo.m");
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, v17, 58, CFSTR("failed to create equation with error: %@"), v21);
      if (!v11->_equation)
      {

        return 0;
      }
    }
  }
  return v11;
}

- (id)copyWithContext:(id)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSWPEquationInfo;
  v4 = -[TSDDrawableInfo copyWithContext:](&v6, sel_copyWithContext_, a3);
  if (v4)
    v4[18] = self->_equation;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPEquationInfo;
  -[TSDDrawableInfo dealloc](&v3, sel_dealloc);
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (EQKitEquation)equation
{
  return self->_equation;
}

- (void)setEquation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

@end
