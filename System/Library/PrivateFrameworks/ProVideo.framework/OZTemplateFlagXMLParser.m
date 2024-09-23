@implementation OZTemplateFlagXMLParser

- (OZTemplateFlagXMLParser)initWithContentsOfURL:(id)a3
{
  uint64_t v4;
  NSXMLParser *v5;
  OZTemplateFlagXMLParser *v6;
  OZTemplateFlagXMLParser *v7;
  objc_super v9;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B28]), "initWithContentsOfURL:", a3);
  if (!v4)
    return 0;
  v5 = (NSXMLParser *)v4;
  v9.receiver = self;
  v9.super_class = (Class)OZTemplateFlagXMLParser;
  v6 = -[OZTemplateFlagXMLParser init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_parser = v5;
    -[NSXMLParser setDelegate:](v5, "setDelegate:", v6);
    *(unsigned int *)((char *)&v7->_templeFlags + 3) = 0;
    v7->_templeFlags = 0;
  }
  else
  {

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OZTemplateFlagXMLParser;
  -[OZTemplateFlagXMLParser dealloc](&v3, sel_dealloc);
}

- (BOOL)parse
{
  return -[NSXMLParser parse](self->_parser, "parse") || self->_success;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("template")))
    self->_foundTemplate = 1;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("flags")) && self->_foundTemplate)
    self->_foundTemplateFlag = 1;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("scene")))
  {
    self->_success = 1;
    objc_msgSend(a3, "abortParsing");
  }
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("flags")) && self->_foundTemplateFlag)
  {
    self->_success = 1;
    objc_msgSend(a3, "abortParsing");
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("template")))
  {
    self->_success = 1;
    objc_msgSend(a3, "abortParsing");
  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v6;

  if (self->_foundTemplateFlag)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v6, "setNumberStyle:", 1);
    self->_templeFlags = objc_msgSend((id)objc_msgSend(v6, "numberFromString:", a4), "unsignedIntValue");

  }
}

- (unsigned)templeFlags
{
  return self->_templeFlags;
}

@end
