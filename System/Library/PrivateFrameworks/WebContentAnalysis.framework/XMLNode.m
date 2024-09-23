@implementation XMLNode

- (XMLNode)initWithNode:(_xmlNode *)a3
{
  XMLNode *v4;
  XMLNode *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)XMLNode;
  v4 = -[XMLNode init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[XMLNode setXmlNode:](v4, "setXmlNode:", a3);
  return v5;
}

- (void)setXmlNode:(_xmlNode *)a3
{
  self->_xmlNode = a3;
}

- (_xmlNode)xmlNode
{
  return self->_xmlNode;
}

- (id)_stringValueFromAttribute:(id)a3
{
  return +[XMLNode stringValueForAttribute:inNode:](XMLNode, "stringValueForAttribute:inNode:", a3, self->_xmlNode);
}

- (int64_t)_intValueFromAttribute:(id)a3
{
  const char *v4;
  int64_t v5;
  uint64_t i;
  uint64_t j;

  v4 = (const char *)objc_msgSend(a3, "UTF8String");
  v5 = kWFImgDimensionUnknown;
  if ((_QWORD)-[XMLNode xmlNode](self, "xmlNode")[88])
  {
    for (i = (uint64_t)-[XMLNode xmlNode](self, "xmlNode")[88]; i; i = *(_QWORD *)(i + 48))
    {
      if (!strcmp(*(const char **)(i + 16), v4))
      {
        for (j = *(_QWORD *)(i + 24); j; j = *(_QWORD *)(j + 48))
        {
          if (!strcmp(*(const char **)(j + 16), "text"))
            v5 = atoi(*(const char **)(j + 80));
        }
      }
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)XMLNode;
  -[XMLNode dealloc](&v2, sel_dealloc);
}

+ (id)stringValueForAttribute:(id)a3 inNode:(_xmlNode *)a4
{
  uint64_t v5;
  _xmlAttr *properties;
  const char *v7;
  _xmlNode *children;

  v5 = objc_msgSend(a3, "UTF8String");
  properties = a4->properties;
  if (properties)
  {
    v7 = (const char *)v5;
    do
    {
      if (!strcmp((const char *)properties->name, v7))
      {
        children = properties->children;
        if (children)
        {
          while (strcmp((const char *)children->name, "text"))
          {
            children = children->next;
            if (!children)
              goto LABEL_4;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", children->content, 4);
        }
      }
LABEL_4:
      properties = properties->next;
    }
    while (properties);
  }
  return 0;
}

+ (id)getJavascriptFromNode:(_xmlNode *)a3
{
  _xmlNode *children;

  children = a3->children;
  if (children)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", children->content, 4);
  else
    return 0;
}

@end
