@implementation XMLWrapperNamespace

- (XMLWrapperNamespace)initWithNsNode:(_xmlNs *)a3 error:(id *)a4
{
  XMLWrapperNamespace *v5;
  XMLWrapperNamespace *v6;
  uint64_t v7;
  NSString *href;
  uint64_t v9;
  NSString *prefix;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)XMLWrapperNamespace;
  v5 = -[XMLWrapperNamespace init](&v12, sel_init, a3, a4);
  v6 = v5;
  if (v5)
  {
    v5->_xmlNs = a3;
    if (a3->href)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
      v7 = objc_claimAutoreleasedReturnValue();
      href = v6->_href;
      v6->_href = (NSString *)v7;

    }
    if (a3->prefix)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
      v9 = objc_claimAutoreleasedReturnValue();
      prefix = v6->_prefix;
      v6->_prefix = (NSString *)v9;
    }
    else
    {
      prefix = v6->_prefix;
      v6->_prefix = (NSString *)&stru_24FD3AC80;
    }

  }
  return v6;
}

- (_xmlNs)xmlNsForNode:(_xmlNode *)a3 error:(id *)a4
{
  void *v7;
  id v8;
  xmlChar *v9;
  void *v10;
  id v11;
  xmlChar *v12;
  xmlNsPtr v13;
  _xmlNs *v14;

  -[XMLWrapperNamespace href](self, "href");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[XMLWrapperNamespace href](self, "href");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = xmlCharStrdup((const char *)objc_msgSend(v8, "UTF8String"));

  }
  else
  {
    v9 = 0;
  }

  -[XMLWrapperNamespace prefix](self, "prefix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[XMLWrapperNamespace prefix](self, "prefix");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = xmlCharStrdup((const char *)objc_msgSend(v11, "UTF8String"));

  }
  else
  {
    v12 = 0;
  }

  v13 = xmlNewNs(a3, v9, v12);
  v14 = v13;
  if (a4 && !v13)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("XMLWrapperErrorDomain"), 205, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v14;
}

- (NSString)href
{
  return self->_href;
}

- (void)setHref:(id)a3
{
  objc_storeStrong((id *)&self->_href, a3);
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_prefix, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_href, 0);
}

@end
