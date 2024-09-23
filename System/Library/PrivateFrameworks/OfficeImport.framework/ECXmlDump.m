@implementation ECXmlDump

- (BOOL)isXmlNodeNeeded
{
  return 1;
}

+ (_xmlNode)xmlNodeForObject:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _xmlNode *v10;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (!objc_msgSend(v6, "compare:options:range:", CFSTR("ED"), 2, 0, 2))
    {
      v8 = 2;
      goto LABEL_6;
    }
    if (!objc_msgSend(v7, "compare:options:range:", CFSTR("CHD"), 2, 0, 3))
    {
      v8 = 3;
LABEL_6:
      objc_msgSend(v7, "substringFromIndex:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
    }
  }
  v10 = (_xmlNode *)objc_msgSend(a1, "xmlNodeWithName:forObject:", v7, v4);

  return v10;
}

+ (_xmlNode)xmlNodeWithName:(id)a3 forObject:(id)a4
{
  __CFString *v5;
  id v6;
  xmlNodePtr v7;

  v5 = (__CFString *)a3;
  v6 = a4;
  if (!v5 || !-[__CFString length](v5, "length"))
  {

    v5 = CFSTR("UnknownObject");
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v6, "isXmlNodeNeeded") & 1) == 0)
  {
    v7 = 0;
  }
  else
  {
    v7 = xmlNewNode(0, (const xmlChar *)-[__CFString tc_xmlString](v5, "tc_xmlString"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "addXmlProperties:", v7);
    else
      sfaxmlSetBoolNoNsProp(v7, (const xmlChar *)"xmlDumpingSupported", 0);
  }

  return v7;
}

@end
