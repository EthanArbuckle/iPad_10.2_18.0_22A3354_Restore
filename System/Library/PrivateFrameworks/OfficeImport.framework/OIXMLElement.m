@implementation OIXMLElement

- (void)addAttribute:(id)a3
{
  id v5;
  id *p_attributes;
  id attributes;
  void *v8;
  objc_class *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  v5 = a3;
  p_attributes = &self->_attributes;
  attributes = self->_attributes;
  v13 = v5;
  if (attributes)
  {
    if (!self->_hasMultipleAttributes)
    {
      v9 = (objc_class *)MEMORY[0x24BDBCEB8];
      v10 = attributes;
      v11 = objc_msgSend([v9 alloc], "initWithObjects:", v10, 0);
      v12 = *p_attributes;
      *p_attributes = (id)v11;

      objc_msgSend(*p_attributes, "addObject:", v13);
      v8 = v13;
      self->_hasMultipleAttributes = 1;
      goto LABEL_7;
    }
    objc_msgSend(attributes, "addObject:", v5);
  }
  else
  {
    objc_storeStrong(&self->_attributes, a3);
  }
  v8 = v13;
LABEL_7:

}

- (void)addChild:(id)a3
{
  id v5;
  id *p_children;
  id children;
  void *v8;
  objc_class *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  v5 = a3;
  p_children = &self->_children;
  children = self->_children;
  v13 = v5;
  if (children)
  {
    if (!self->_hasMultipleChildren)
    {
      v9 = (objc_class *)MEMORY[0x24BDBCEB8];
      v10 = children;
      v11 = objc_msgSend([v9 alloc], "initWithObjects:", v10, 0);
      v12 = *p_children;
      *p_children = (id)v11;

      objc_msgSend(*p_children, "addObject:", v13);
      v8 = v13;
      self->_hasMultipleChildren = 1;
      goto LABEL_7;
    }
    objc_msgSend(children, "addObject:", v5);
  }
  else
  {
    objc_storeStrong(&self->_children, a3);
  }
  v8 = v13;
LABEL_7:

}

- (id)openingTagString
{
  __CFString *v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  UniChar v10;
  UniChar chars;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  chars = 60;
  CFStringAppendCharacters(v3, &chars, 1);
  -[OIXMLElement name](self, "name");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFStringAppend(v3, v4);

  if (-[OIXMLElement attributeCount](self, "attributeCount") == 1)
  {
    CFStringAppend(v3, CFSTR(" "));
    objc_msgSend(self->_attributes, "_appendXMLStringToString:level:", v3, 0);
  }
  else
  {
    v5 = objc_msgSend(self->_attributes, "count");
    if (v5 >= 1)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        objc_msgSend(self->_attributes, "objectAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        CFStringAppend(v3, CFSTR(" "));
        objc_msgSend(v8, "_appendXMLStringToString:level:", v3, 0);

      }
    }
  }
  v10 = 62;
  CFStringAppendCharacters(v3, &v10, 1);
  return v3;
}

- (int64_t)attributeCount
{
  int64_t result;

  result = (int64_t)self->_attributes;
  if (result)
  {
    if (self->_hasMultipleAttributes)
      return objc_msgSend((id)result, "count");
    else
      return 1;
  }
  return result;
}

- (void)_appendXMLStringToString:(__CFString *)a3 level:(int)a4
{
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  UniChar v17;
  UniChar v18[2];
  UniChar v19;
  UniChar chars;

  -[OIXMLElement name](self, "name");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    chars = 60;
    CFStringAppendCharacters(a3, &chars, 1);
    CFStringAppend(a3, v7);
    if (-[OIXMLElement attributeCount](self, "attributeCount") == 1)
    {
      CFStringAppend(a3, CFSTR(" "));
      objc_msgSend(self->_attributes, "_appendXMLStringToString:level:", a3, (a4 + 1));
    }
    else
    {
      v8 = objc_msgSend(self->_attributes, "count");
      if (v8 >= 1)
      {
        v9 = v8;
        v10 = 0;
        for (i = 0; i != v9; ++i)
        {
          objc_msgSend(self->_attributes, "objectAtIndex:", i);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          CFStringAppend(a3, CFSTR(" "));
          objc_msgSend(v12, "_appendXMLStringToString:level:", a3, (a4 + 1));
          v10 = v12;
        }
LABEL_9:
        v13 = -[OIXMLElement childrenCount](self, "childrenCount");
        v19 = 62;
        CFStringAppendCharacters(a3, &v19, 1);
        if (v13 == 1)
        {
          objc_msgSend(self->_children, "_appendXMLStringToString:level:", a3, (a4 + 1));
        }
        else if (v13 < 1)
        {
          if (-[OIXMLElement isEmptyHTMLElement](self, "isEmptyHTMLElement"))
          {
LABEL_17:

            goto LABEL_18;
          }
        }
        else
        {
          v14 = 0;
          v15 = (a4 + 1);
          v16 = v12;
          do
          {
            objc_msgSend(self->_children, "objectAtIndex:", v14);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v12, "_appendXMLStringToString:level:", a3, v15);
            ++v14;
            v16 = v12;
          }
          while (v13 != v14);
        }
        *(_DWORD *)v18 = 3080252;
        CFStringAppendCharacters(a3, v18, 2);
        CFStringAppend(a3, v7);
        v17 = 62;
        CFStringAppendCharacters(a3, &v17, 1);
        goto LABEL_17;
      }
    }
    v12 = 0;
    goto LABEL_9;
  }
LABEL_18:

}

- (int64_t)childrenCount
{
  int64_t result;

  result = (int64_t)self->_children;
  if (result)
  {
    if (self->_hasMultipleChildren)
      return objc_msgSend((id)result, "count");
    else
      return 1;
  }
  return result;
}

- (id)closingTagString
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[OIXMLElement name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("</%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)insertChild:(id)a3 atIndex:(unint64_t)a4
{
  id v7;
  id *p_children;
  id children;
  void *v10;
  objc_class *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v7 = a3;
  p_children = &self->_children;
  children = self->_children;
  v15 = v7;
  if (children)
  {
    if (!self->_hasMultipleChildren)
    {
      v11 = (objc_class *)MEMORY[0x24BDBCEB8];
      v12 = children;
      v13 = objc_msgSend([v11 alloc], "initWithObjects:", v12, 0);
      v14 = *p_children;
      *p_children = (id)v13;

      objc_msgSend(*p_children, "insertObject:atIndex:", v15, a4);
      v10 = v15;
      self->_hasMultipleChildren = 1;
      goto LABEL_7;
    }
    objc_msgSend(children, "insertObject:atIndex:", v7, a4);
  }
  else
  {
    objc_storeStrong(&self->_children, a3);
  }
  v10 = v15;
LABEL_7:

}

- (OIXMLElement)initWithType:(unsigned __int8)a3
{
  OIXMLElement *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OIXMLElement;
  result = -[OIXMLElement init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (OIXMLElement)initWithType:(unsigned __int8)a3 stringValue:(id)a4
{
  uint64_t v4;
  id v6;
  OIXMLElement *v7;
  OIXMLElement *v8;

  v4 = a3;
  v6 = a4;
  v7 = -[OIXMLElement initWithType:](self, "initWithType:", v4);
  v8 = v7;
  if (v7)
    -[OIXMLElement setStringValue:](v7, "setStringValue:", v6);

  return v8;
}

+ (OIXMLElement)elementWithType:(unsigned __int8)a3
{
  return -[OIXMLElement initWithType:stringValue:]([OIXMLElement alloc], "initWithType:stringValue:", a3, 0);
}

+ (OIXMLElement)elementWithType:(unsigned __int8)a3 stringValue:(id)a4
{
  uint64_t v4;
  id v5;
  OIXMLElement *v6;

  v4 = a3;
  v5 = a4;
  v6 = -[OIXMLElement initWithType:stringValue:]([OIXMLElement alloc], "initWithType:stringValue:", v4, v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  OIXMLElement *v5;
  uint64_t v6;
  id attributes;
  uint64_t v8;
  id children;

  v5 = -[OIXMLElement initWithType:]([OIXMLElement alloc], "initWithType:", self->_type);
  v6 = objc_msgSend(self->_attributes, "copyWithZone:", a3);
  attributes = v5->_attributes;
  v5->_attributes = (id)v6;

  v8 = objc_msgSend(self->_children, "copyWithZone:", a3);
  children = v5->_children;
  v5->_children = (id)v8;

  v5->_hasMultipleAttributes = self->_hasMultipleAttributes;
  v5->_hasMultipleChildren = self->_hasMultipleChildren;
  return v5;
}

- (id)name
{
  return name_names[self->_type];
}

- (BOOL)isEmptyHTMLElement
{
  return isEmptyHTMLElement_empty[self->_type];
}

- (void)setStringValue:(id)a3
{
  OIXMLTextNode *v4;
  id children;
  id v6;

  v6 = a3;
  if (v6)
  {
    v4 = -[OIXMLTextNode initWithStringValue:]([OIXMLTextNode alloc], "initWithStringValue:", v6);
    children = self->_children;
    if (children)
    {
      self->_children = 0;

    }
    -[OIXMLElement addChild:](self, "addChild:", v4);
  }
  else
  {
    v4 = (OIXMLTextNode *)self->_children;
    self->_children = 0;
  }

}

- (id)stringValue
{
  void *v3;
  id children;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", &stru_24F3BFFF8);
  children = self->_children;
  if (self->_hasMultipleChildren)
  {
    v5 = objc_msgSend(children, "count");
    if (v5 >= 1)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        objc_msgSend(self->_children, "objectAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringValue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v9);

      }
    }
  }
  else if (children)
  {
    objc_msgSend(children, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v10);

  }
  return v3;
}

- (id)contentString
{
  void *v3;
  int64_t v4;
  id children;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[OIXMLElement childrenCount](self, "childrenCount");
  children = self->_children;
  if (v4 == 1)
  {
    objc_msgSend(children, "_appendXMLStringToString:level:", v3, 0);
  }
  else
  {
    v6 = objc_msgSend(children, "count");
    if (v6 >= 1)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        objc_msgSend(self->_children, "objectAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_appendXMLStringToString:level:", v3, 0);

      }
    }
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_children, 0);
  objc_storeStrong(&self->_attributes, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
