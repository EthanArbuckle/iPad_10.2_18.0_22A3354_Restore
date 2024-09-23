@implementation XMLWrapperAttribute

- (XMLWrapperAttribute)initWithNode:(_xmlAttr *)a3 error:(id *)a4
{
  XMLWrapperAttribute *v6;
  XMLWrapperAttribute *v7;
  uint64_t v8;
  NSString *name;
  xmlNs *ns;
  XMLWrapperNamespace *v11;
  _xmlNode *children;
  uint64_t v13;
  NSString *value;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)XMLWrapperAttribute;
  v6 = -[XMLWrapperAttribute init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_attributeNode = a3;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3->name);
    v8 = objc_claimAutoreleasedReturnValue();
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v7->_type = a3->atype;
    ns = a3->ns;
    if (ns)
    {
      v11 = -[XMLWrapperNamespace initWithNsNode:error:]([XMLWrapperNamespace alloc], "initWithNsNode:error:", ns, a4);
      if (v11)
        -[XMLWrapperAttribute setNs:](v7, "setNs:", v11);

    }
    children = a3->children;
    if (children && children->type == XML_TEXT_NODE && children->content)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
      v13 = objc_claimAutoreleasedReturnValue();
      value = v7->_value;
      v7->_value = (NSString *)v13;

    }
  }
  return v7;
}

- (BOOL)xmlAttrNodeForNode:(_xmlNode *)a3 error:(id *)a4
{
  void *v7;
  id v8;
  id v9;
  xmlChar *v10;
  void *v11;
  void *v12;
  xmlNs *v13;
  xmlAttrPtr v14;
  xmlAttrPtr v15;

  -[XMLWrapperAttribute value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[XMLWrapperAttribute value](self, "value");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = xmlCharStrdup((const char *)objc_msgSend(v8, "UTF8String"));

  }
  -[XMLWrapperAttribute name](self, "name");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = xmlCharStrdup((const char *)objc_msgSend(v9, "UTF8String"));

  -[XMLWrapperAttribute ns](self, "ns");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[XMLWrapperAttribute ns](self, "ns");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (xmlNs *)objc_msgSend(v12, "xmlNsForNode:error:", 0, a4);

    v14 = xmlNewNsProp(a3, v13, v10, (const xmlChar *)v7);
  }
  else
  {
    v14 = xmlNewProp(a3, v10, (const xmlChar *)v7);
  }
  v15 = v14;
  if (a4 && !v14)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("XMLWrapperErrorDomain"), 204, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v15 != 0;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (XMLWrapperNamespace)ns
{
  return self->_ns;
}

- (void)setNs:(id)a3
{
  objc_storeStrong((id *)&self->_ns, a3);
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ns, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
