@implementation UIPDFParserDelegate

- (UIPDFParserDelegate)init
{
  UIPDFParserDelegate *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPDFParserDelegate;
  result = -[UIPDFParserDelegate init](&v3, sel_init);
  if (result)
  {
    result->_path = 0;
    result->_parserError = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  CGPathRelease(self->_path);
  v3.receiver = self;
  v3.super_class = (Class)UIPDFParserDelegate;
  -[UIPDFParserDelegate dealloc](&v3, sel_dealloc);
}

- (CGPath)path
{
  return self->_path;
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  self->_parserError = 1;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  CGPoint v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  CGPoint *p;
  uint64_t v20;

  if (objc_msgSend(a4, "isEqualToString:", CFSTR("UIPDFSelection")))
  {
    self->_path = CGPathCreateMutable();
    return;
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("Rectangle")))
  {
    v10 = (CGPoint)*MEMORY[0x1E0C9D538];
    self->_p[3] = (CGPoint)*MEMORY[0x1E0C9D538];
    self->_p[2] = v10;
    self->_p[1] = v10;
    self->_p[0] = v10;
    return;
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("Point")))
  {
    v11 = (void *)objc_msgSend(a7, "valueForKey:", CFSTR("id"));
    v12 = (void *)objc_msgSend(a7, "valueForKey:", CFSTR("x"));
    v13 = objc_msgSend(a7, "valueForKey:", CFSTR("y"));
    if (v11)
    {
      if (v12)
      {
        v14 = (void *)v13;
        if (v13)
        {
          objc_msgSend(v12, "floatValue");
          v16 = v15;
          objc_msgSend(v14, "floatValue");
          v18 = v17;
          if ((objc_msgSend(v11, "isEqualToString:", CFSTR("bottomLeft")) & 1) != 0)
          {
            p = self->_p;
            v20 = 16;
          }
          else if (objc_msgSend(v11, "isEqualToString:", CFSTR("topLeft")))
          {
            p = &self->_p[1];
            v20 = 32;
          }
          else if (objc_msgSend(v11, "isEqualToString:", CFSTR("topRight")))
          {
            p = &self->_p[2];
            v20 = 48;
          }
          else
          {
            if (!objc_msgSend(v11, "isEqualToString:", CFSTR("bottomRight")))
              return;
            p = &self->_p[3];
            v20 = 64;
          }
          p->x = v16;
          *(double *)((char *)&self->super.isa + v20) = v18;
        }
      }
    }
  }
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("UIPDFSelection")) & 1) == 0)
  {
    if (objc_msgSend(a4, "isEqualToString:", CFSTR("Rectangle")))
    {
      CGPathAddLines(self->_path, 0, self->_p, 4uLL);
      CGPathCloseSubpath(self->_path);
    }
    else
    {
      objc_msgSend(a4, "isEqualToString:", CFSTR("Point"));
    }
  }
}

- (BOOL)parserError
{
  return self->_parserError;
}

@end
