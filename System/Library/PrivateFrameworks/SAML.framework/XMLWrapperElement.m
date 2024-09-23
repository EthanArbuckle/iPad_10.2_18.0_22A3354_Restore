@implementation XMLWrapperElement

- (XMLWrapperElement)initWithNode:(_xmlNode *)a3 doc:(_xmlDoc *)a4 query:(id)a5 error:(id *)a6
{
  XMLWrapperElement *v11;
  XMLWrapperElement *v12;
  uint64_t v13;
  NSMutableArray *elements;
  uint64_t v15;
  NSMutableDictionary *attributes;
  uint64_t v17;
  NSMutableDictionary *namespaces;
  void *v19;
  _xmlNode *xmlNode;
  xmlNs *ns;
  XMLWrapperNamespace *v22;
  _xmlAttr *properties;
  uint64_t v24;
  NSMutableDictionary *v25;
  XMLWrapperAttribute *v26;
  XMLWrapperAttribute *v27;
  NSMutableDictionary *v28;
  void *v29;
  _xmlNode *children;
  void *v31;
  xmlElementType type;
  void *v33;
  objc_class *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSString *textContent;
  NSString *v41;
  NSString *v42;
  id v44;
  objc_super v45;

  v44 = a5;
  v45.receiver = self;
  v45.super_class = (Class)XMLWrapperElement;
  v11 = -[XMLWrapperElement init](&v45, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_xmlNode = a3;
    objc_storeStrong((id *)&v11->_query, a5);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    elements = v12->_elements;
    v12->_elements = (NSMutableArray *)v13;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    attributes = v12->_attributes;
    v12->_attributes = (NSMutableDictionary *)v15;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    namespaces = v12->_namespaces;
    v12->_namespaces = (NSMutableDictionary *)v17;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v12->_xmlNode->name);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setTagName:](v12, "setTagName:", v19);

    xmlNode = v12->_xmlNode;
    ns = xmlNode->ns;
    if (ns)
    {
      do
      {
        v22 = -[XMLWrapperNamespace initWithNsNode:error:]([XMLWrapperNamespace alloc], "initWithNsNode:error:", ns, a6);
        if (v22)
          -[XMLWrapperElement setNamespace:](v12, "setNamespace:", v22);
        ns = ns->next;

      }
      while (ns);
      xmlNode = v12->_xmlNode;
    }
    properties = xmlNode->properties;
    if (properties)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v12->_attributes;
      v12->_attributes = (NSMutableDictionary *)v24;

      do
      {
        v26 = -[XMLWrapperAttribute initWithNode:error:]([XMLWrapperAttribute alloc], "initWithNode:error:", properties, a6);
        v27 = v26;
        if (v26)
        {
          v28 = v12->_attributes;
          -[XMLWrapperAttribute name](v26, "name");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v27, v29);

        }
        properties = properties->next;

      }
      while (properties);
      xmlNode = v12->_xmlNode;
    }
    children = xmlNode->children;
    if (children)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      while (1)
      {
        type = children->type;
        if (type != XML_TEXT_NODE)
          break;
        if (children->content)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1690], "whitespaceAndNewlineCharacterSet");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "stringByTrimmingCharactersInSet:", v39);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37 && (objc_msgSend(v37, "isEqualToString:", &stru_24FD3AC80) & 1) == 0)
          {
            textContent = v12->_textContent;
            if (textContent)
            {
              -[NSString stringByAppendingString:](textContent, "stringByAppendingString:", v37);
              v41 = (NSString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v41 = v37;
            }
            v42 = v12->_textContent;
            v12->_textContent = v41;

          }
LABEL_26:

        }
LABEL_27:
        children = children->next;
        if (!children)
        {
          if (objc_msgSend(v31, "count"))
            -[XMLWrapperElement setElements:](v12, "setElements:", v31);

          goto LABEL_31;
        }
      }
      if (type != XML_ELEMENT_NODE)
        goto LABEL_27;
      +[XMLWrapperElementFactory sharedInstance](XMLWrapperElementFactory, "sharedInstance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (objc_class *)objc_msgSend(v33, "classForXMLNode:error:", children, a6);

      v35 = [v34 alloc];
      -[XMLWrapperElement query](v12, "query");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v35, "initWithNode:doc:query:error:", children, a4, v36, a6);

      if (!v37)
        goto LABEL_27;
      objc_msgSend(v31, "addObject:", v37);
      goto LABEL_26;
    }
  }
LABEL_31:

  return v12;
}

- (XMLWrapperElement)initWithTagName:(id)a3 error:(id *)a4
{
  id v5;
  XMLWrapperElement *v6;
  XMLWrapperElement *v7;
  uint64_t v8;
  NSMutableArray *elements;
  uint64_t v10;
  NSMutableDictionary *attributes;
  uint64_t v12;
  NSMutableDictionary *namespaces;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)XMLWrapperElement;
  v6 = -[XMLWrapperElement init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    -[XMLWrapperElement setTagName:](v6, "setTagName:", v5);
    v7->_xmlNode = -[XMLWrapperElement xmlNode:](v7, "xmlNode:", 0);
    v7->_ownsXMLNode = 1;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    elements = v7->_elements;
    v7->_elements = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    attributes = v7->_attributes;
    v7->_attributes = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    namespaces = v7->_namespaces;
    v7->_namespaces = (NSMutableDictionary *)v12;

  }
  return v7;
}

- (void)dealloc
{
  xmlNode *xmlNode;
  objc_super v4;

  xmlNode = self->_xmlNode;
  if (xmlNode && self->_ownsXMLNode)
    xmlFreeNode(xmlNode);
  v4.receiver = self;
  v4.super_class = (Class)XMLWrapperElement;
  -[XMLWrapperElement dealloc](&v4, sel_dealloc);
}

- (NSArray)elements
{
  return (NSArray *)self->_elements;
}

- (void)setElements:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *elements;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", a3);
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  elements = self->_elements;
  self->_elements = v4;

}

- (NSDictionary)attributes
{
  return (NSDictionary *)self->_attributes;
}

- (void)setNamespace:(id)a3
{
  NSMutableDictionary *namespaces;
  id v5;
  void *v6;
  id v7;

  namespaces = self->_namespaces;
  v5 = a3;
  objc_msgSend(v5, "prefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](namespaces, "setObject:forKey:", v5, v6);

  -[XMLWrapperElement query](self, "query");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerNamespace:", v5);

}

- (id)attributeWithName:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", a3);
}

- (void)setAttributeWithName:(id)a3 value:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *attributes;
  XMLWrapperAttribute *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (!self->_attributes)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    attributes = self->_attributes;
    self->_attributes = v7;

  }
  v9 = objc_alloc_init(XMLWrapperAttribute);
  -[XMLWrapperAttribute setName:](v9, "setName:", v10);
  -[XMLWrapperAttribute setValue:](v9, "setValue:", v6);
  -[NSMutableDictionary setObject:forKey:](self->_attributes, "setObject:forKey:", v9, v10);

}

- (id)firstElementByTagName:(id)a3
{
  void *v3;
  void *v4;

  -[XMLWrapperElement getElementsByTagName:](self, "getElementsByTagName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getElementsByTagName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[XMLWrapperElement elements](self, "elements", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "tagName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)addChildElement:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = -[NSMutableArray indexOfObject:](self->_elements, "indexOfObject:", v4);
    v4 = v6;
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray addObject:](self->_elements, "addObject:", v6);
      v4 = v6;
    }
  }

}

- (void)addChildElement:(id)a3 before:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10)
  {
    v7 = -[NSMutableArray indexOfObject:](self->_elements, "indexOfObject:", v6);
    v8 = -[NSMutableArray indexOfObject:](self->_elements, "indexOfObject:", v10);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL && v8 == 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray insertObject:atIndex:](self->_elements, "insertObject:atIndex:", v10, v7);
    else
      -[XMLWrapperElement addChildElement:](self, "addChildElement:", v10);
  }

}

- (void)removeChildElement:(id)a3
{
  -[NSMutableArray removeObject:](self->_elements, "removeObject:", a3);
}

- (void)replaceChildElement:(id)a3 newElement:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = -[NSMutableArray indexOfObject:](self->_elements, "indexOfObject:", v10);
    v8 = -[NSMutableArray indexOfObject:](self->_elements, "indexOfObject:", v6);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL && v8 == 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_elements, "replaceObjectAtIndex:withObject:", v7, v6);
  }

}

- (id)firstResultByXpathQuery:(id)a3
{
  void *v3;
  void *v4;

  -[XMLWrapperElement getResultsByXpathQuery:](self, "getResultsByXpathQuery:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getResultsByXpathQuery:(id)a3
{
  id v4;
  void *v5;
  _xmlNode *xmlNode;
  _xmlDoc *doc;
  void *v8;
  id v9;
  id v10;
  id v12;

  v4 = a3;
  -[XMLWrapperElement query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  xmlNode = self->_xmlNode;
  doc = xmlNode->doc;
  v12 = 0;
  objc_msgSend(v5, "executeXpathQuery:query:ctxNode:error:", doc, v4, xmlNode, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v12;
  if (v8)
    v10 = v8;
  else
    NSLog(CFSTR("%@"), v9);

  return v8;
}

- (void)reorderChildElements
{
  NSMutableArray *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *elements;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[XMLWrapperElement childElementSequence](self, "childElementSequence", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[XMLWrapperElement getElementsByTagName:](self, "getElementsByTagName:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  elements = self->_elements;
  self->_elements = v3;

}

- (_xmlNode)xmlNode:(id *)a3
{
  id v5;
  xmlChar *v6;
  xmlNodePtr v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  xmlNs *nsDef;
  void *v20;
  id v21;
  xmlChar *v22;
  xmlNode *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  -[XMLWrapperElement tagName](self, "tagName");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = xmlCharStrdup((const char *)objc_msgSend(v5, "UTF8String"));

  v7 = xmlNewNode(0, v6);
  if (v7)
  {
    -[XMLWrapperElement childElementSequence](self, "childElementSequence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[XMLWrapperElement reorderChildElements](self, "reorderChildElements");
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    -[NSMutableDictionary objectEnumerator](self->_attributes, "objectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v39;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v39 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v13++), "xmlAttrNodeForNode:error:", v7, a3);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v11);
    }

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[NSMutableDictionary objectEnumerator](self->_namespaces, "objectEnumerator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v35;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v35 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v18++), "xmlNsForNode:error:", v7, a3);
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      }
      while (v16);
    }

    nsDef = v7->nsDef;
    if (nsDef)
      xmlSetNs(v7, nsDef);
    -[XMLWrapperElement textContent](self, "textContent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[XMLWrapperElement textContent](self, "textContent");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v22 = xmlCharStrdup((const char *)objc_msgSend(v21, "UTF8String"));

      v23 = xmlNewText(v22);
      xmlAddChild(v7, v23);
    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[XMLWrapperElement elements](self, "elements", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v31;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v31 != v27)
            objc_enumerationMutation(v24);
          xmlAddChild(v7, (xmlNodePtr)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v28++), "xmlNode:", a3));
        }
        while (v26 != v28);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      }
      while (v26);
    }

  }
  return v7;
}

- (id)xmlString:(id *)a3
{
  _xmlNode *v4;
  xmlBuffer *v5;
  xmlBuffer *v6;
  id v7;
  const xmlChar *v8;

  v4 = -[XMLWrapperElement xmlNode:](self, "xmlNode:");
  if (v4)
  {
    v5 = xmlBufferCreate();
    if (v5)
    {
      v6 = v5;
      if (xmlNodeDump(v5, v4->doc, v4, 0, 1) < 1)
      {
        v4 = 0;
      }
      else
      {
        v7 = objc_alloc(MEMORY[0x24BDD17C8]);
        v8 = xmlBufferContent(v6);
        v4 = (_xmlNode *)objc_msgSend(v7, "initWithBytes:length:encoding:", v8, xmlBufferLength(v6), 4);
      }
      xmlBufferFree(v6);
    }
    else
    {
      v4 = 0;
      if (a3)
        *a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("XMLWrapperErrorDomain"), 101, 0);
    }
  }
  return v4;
}

- (NSString)tagName
{
  return self->_tagName;
}

- (void)setTagName:(id)a3
{
  objc_storeStrong((id *)&self->_tagName, a3);
}

- (NSString)textContent
{
  return self->_textContent;
}

- (void)setTextContent:(id)a3
{
  objc_storeStrong((id *)&self->_textContent, a3);
}

- (NSDictionary)namespaces
{
  return &self->_namespaces->super;
}

- (NSArray)childElementSequence
{
  return self->_childElementSequence;
}

- (void)setChildElementSequence:(id)a3
{
  objc_storeStrong((id *)&self->_childElementSequence, a3);
}

- (XMLWrapperQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_childElementSequence, 0);
  objc_storeStrong((id *)&self->_textContent, 0);
  objc_storeStrong((id *)&self->_tagName, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
