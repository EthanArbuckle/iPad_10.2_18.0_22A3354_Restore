@implementation TBXMLHelper

- (TBXMLHelper)initWithContentsOfURL:(id)a3
{
  TBXMLHelper *v4;
  NSXMLParser *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TBXMLHelper;
  v4 = -[TBXMLHelper init](&v7, sel_init);
  if (v4)
  {
    v5 = (NSXMLParser *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B28]), "initWithContentsOfURL:", a3);
    v4->_parser = v5;
    -[NSXMLParser setDelegate:](v5, "setDelegate:", v4);
    v4->_depth = 0;
    v4->_successfullyEndedParsing = 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TBXMLHelper;
  -[TBXMLHelper dealloc](&v3, sel_dealloc);
}

- (BOOL)parse
{
  return -[NSXMLParser parse](self->_parser, "parse") || self->_successfullyEndedParsing;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  if (self->_interested)
  {

    self->_key = (NSString *)a4;
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("sceneSettings"), a4, a5, a6, a7))
    goto LABEL_8;
  if (!objc_msgSend(a4, "isEqualToString:", CFSTR("description")) || self->_depth != 1)
  {
    if (!objc_msgSend(a4, "isEqualToString:", CFSTR("template")))
      goto LABEL_9;
LABEL_8:
    self->_interested = 1;
    goto LABEL_9;
  }
  self->_interested = 1;

  self->_key = (NSString *)a4;
LABEL_9:
  ++self->_depth;
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("sceneSettings")) & 1) != 0
    || objc_msgSend(a4, "isEqualToString:", CFSTR("description")) && self->_depth == 1)
  {
    self->_interested = 0;
  }
  --self->_depth;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("sceneSettings")))
  {
    objc_msgSend(a3, "abortParsing");
    self->_successfullyEndedParsing = 1;
  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  const __CFString *v6;

  if (self->_interested)
  {
    if (!self->_settings)
      self->_settings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (objc_msgSend((id)objc_msgSend(a4, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet", a3)), "length"))
    {
      if (-[NSMutableDictionary objectForKey:](self->_settings, "objectForKey:", self->_key))
        v6 = (const __CFString *)-[NSMutableDictionary objectForKey:](self->_settings, "objectForKey:", self->_key);
      else
        v6 = &stru_1E65EDDA0;
      -[NSMutableDictionary setObject:forKey:](self->_settings, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v6, a4), self->_key);
    }
  }
}

- (NSDictionary)sceneSettings
{
  return &self->_settings->super;
}

@end
