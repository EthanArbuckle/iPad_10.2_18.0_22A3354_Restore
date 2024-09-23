@implementation WLXMLSerialization

- (id)XMLObjectWithString:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLXMLSerialization XMLObjectWithData:](self, "XMLObjectWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)XMLObjectWithData:(id)a3
{
  id v4;
  const char *v5;
  int v6;
  xmlDocPtr Memory;
  void *v8;

  v4 = objc_retainAutorelease(a3);
  v5 = (const char *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  Memory = xmlReadMemory(v5, v6, 0, 0, 0);
  -[WLXMLSerialization parseXMLContent:](self, "parseXMLContent:", xmlDocGetRootElement(Memory));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  xmlFreeDoc(Memory);
  return v8;
}

- (id)parseXMLContent:(_xmlNode *)a3
{
  _xmlNode *children;
  id v5;
  const xmlChar *name;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  __CFString *v12;
  xmlChar *Content;

  if (!a3)
    goto LABEL_16;
  children = a3->children;
  if (!children)
  {
    Content = xmlNodeGetContent(a3);
    if (Content)
    {
      v12 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", Content);
      return v12;
    }
LABEL_16:
    v12 = &stru_24E376E00;
    return v12;
  }
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  while (1)
  {
    name = children->name;
    if (name)
      break;
LABEL_12:
    if (!children)
    {
      v12 = (__CFString *)v5;
      goto LABEL_18;
    }
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", name);
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("text")) & 1) == 0)
  {
    if (v8)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      -[WLXMLSerialization parseXMLContent:](self, "parseXMLContent:", children);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v8, "addObject:", v10);
      }
      else
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v8, v10, 0);
        objc_msgSend(v5, "setObject:forKey:", v11, v7);

      }
    }
    else
    {
      -[WLXMLSerialization parseXMLContent:](self, "parseXMLContent:", children);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v10, v7);
    }

    children = children->next;
    goto LABEL_12;
  }
  -[WLXMLSerialization parseXMLContent:](self, "parseXMLContent:", children);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return v12;
}

@end
