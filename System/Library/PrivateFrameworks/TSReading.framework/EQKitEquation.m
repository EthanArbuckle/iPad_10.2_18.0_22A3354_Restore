@implementation EQKitEquation

- (EQKitEquation)init
{
  return -[EQKitEquation initWithRoot:source:](self, "initWithRoot:source:", 0, 0);
}

- (EQKitEquation)initWithRoot:(id)a3 source:(id)a4
{
  EQKitEquation *v7;
  objc_super v9;

  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EQKitEquation.mm"), 333, CFSTR("invalid root"));
  v9.receiver = self;
  v9.super_class = (Class)EQKitEquation;
  v7 = -[EQKitEquation init](&v9, sel_init);
  if (v7)
  {
    v7->mRoot = (EQKitExpression *)a3;
    v7->mSource = (NSData *)a4;
  }
  return v7;
}

+ (int)formatFromData:(id)a3
{
  return 0;
}

+ (int)formatFromString:(id)a3
{
  return 0;
}

+ (id)equationWithData:(id)a3 format:(int)a4 environment:(id)a5 error:(id *)a6
{
  _QWORD *v7;
  id v9;
  void *v10;
  int v11;
  xmlParserInputPtr (__cdecl *ExternalEntityLoader)(const char *, const char *, xmlParserCtxtPtr);
  xmlDoc *v13;
  id v14;
  EQKitMathMLParser *v15;
  xmlSAXHandler hdlr;

  if (a4 != 1)
  {
    if (!a4 && a6 && !*a6)
    {
      v7 = 0;
      *a6 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("EQKitErrorDomain"), 0, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("String format unknown. String format should be LaTeX or MathML."), &stru_24D82FEB0, 0), *MEMORY[0x24BDD0FC8], 0));
      return v7;
    }
    return 0;
  }
  v9 = a3;
  if (!v9)
    return 0;
  v10 = v9;
  if (xmlSAXVersion(&hdlr, 2))
  {
    v7 = 0;
  }
  else
  {
    hdlr.getEntity = EQKitMathMLParserGetEntity;
    v11 = xmlSubstituteEntitiesDefault(1);
    ExternalEntityLoader = xmlGetExternalEntityLoader();
    xmlSetExternalEntityLoader((xmlExternalEntityLoader)NoExternalEntityLoader);
    v13 = xmlSAXParseMemory(&hdlr, (const char *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), 0);
    xmlSetExternalEntityLoader(ExternalEntityLoader);
    xmlSubstituteEntitiesDefault(v11);
    v7 = 0;
    if (a5 && v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = a5;
      else
        v14 = 0;
      v15 = -[EQKitMathMLParser initWithDocument:node:source:environment:]([EQKitMathMLParser alloc], "initWithDocument:node:source:environment:", v13, 0, v10, v14);
      v7 = -[EQKitMathMLParser parse](v15, "parse");
      if (a6 && !*a6)
        *a6 = -[EQKitMathMLParser error](v15, "error");

      xmlFreeDoc(v13);
    }
  }
  if (a6 && !v7)
  {
    if (!*a6)
      *a6 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("EQKitErrorDomain"), 0, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Unable to create equation."), &stru_24D82FEB0, 0), *MEMORY[0x24BDD0FC8], 0));

    return 0;
  }

  if (v7)
    v7[3] = a5;
  return v7;
}

+ (id)equationWithString:(id)a3 format:(int)a4 environment:(id)a5 error:(id *)a6
{
  uint64_t v8;
  const char *v10;

  v8 = *(_QWORD *)&a4;
  v10 = (const char *)objc_msgSend(a3, "UTF8String");
  return (id)objc_msgSend(a1, "equationWithData:format:environment:error:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v10, strlen(v10)), v8, a5, a6);
}

+ (id)equationWithString:(id)a3 format:(int)a4 error:(id *)a5
{
  uint64_t v6;
  const char *v8;

  v6 = *(_QWORD *)&a4;
  v8 = (const char *)objc_msgSend(a3, "UTF8String");
  return (id)objc_msgSend(a1, "equationWithData:format:environment:error:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v8, strlen(v8)), v6, +[EQKitEnvironment defaultEnvironment](EQKitEnvironment, "defaultEnvironment"), a5);
}

+ (id)equationWithXMLDoc:(_xmlDoc *)a3 node:(_xmlNode *)a4 environment:(id)a5 error:(id *)a6
{
  id v6;
  EQKitMathMLParser *v11;
  uint64_t v12;
  EQKitMathMLParser *v13;

  v6 = 0;
  if (a3 && a4)
  {
    v11 = [EQKitMathMLParser alloc];
    v12 = objc_opt_class();
    v13 = -[EQKitMathMLParser initWithDocument:node:source:environment:](v11, "initWithDocument:node:source:environment:", a3, a4, 0, EQKitUtilDynamicCast(v12, (uint64_t)a5));
    v6 = -[EQKitMathMLParser parse](v13, "parse");
    if (a6)
      *a6 = -[EQKitMathMLParser error](v13, "error");

  }
  return v6;
}

- (BOOL)exportToXMLWriter:(_xmlTextWriter *)a3 ns:(const char *)a4 prefix:(const char *)a5 characterCount:(int *)a6
{
  return 0;
}

- (id)pdfDataWithLayoutContext:(id)a3 baselineOffset:(double *)a4
{
  void *v7;
  void *v8;
  id v9;
  double v10;

  v7 = (void *)-[EQKitExpression newLayout](-[EQKitEquation root](self, "root"), "newLayout");
  if (!v7)
    return 0;
  v8 = v7;
  objc_msgSend(v7, "layoutWithContext:", a3);
  v9 = -[EQKitEquation pdfDataWithLayout:layoutContext:](self, "pdfDataWithLayout:layoutContext:", v8, a3);
  if (a4)
  {
    objc_msgSend(v8, "depth");
    *a4 = -v10;
  }

  return v9;
}

- (id)pdfDataWithLayout:(id)a3 layoutContext:(id)a4
{
  return 0;
}

+ (id)equationSourceFromPDFDocument:(CGPDFDocument *)a3
{
  return 0;
}

- (BOOL)isBaseFontNameUsed
{
  return -[EQKitExpression isBaseFontNameUsed](self->mRoot, "isBaseFontNameUsed");
}

- (id)newLayout
{
  return (id)-[EQKitExpression newLayout](self->mRoot, "newLayout");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitEquation;
  -[EQKitEquation dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p root=%@>"), NSStringFromClass(v4), self, self->mRoot);
}

+ (id)mathMLStringFromLaTeXString:(id)a3 environment:(id)a4 error:(id *)a5
{
  return 0;
}

- (EQKitExpression)root
{
  return self->mRoot;
}

- (EQKitEnvironment)environment
{
  return self->mEnvironment;
}

@end
