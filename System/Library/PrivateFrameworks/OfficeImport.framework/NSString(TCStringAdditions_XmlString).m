@implementation NSString(TCStringAdditions_XmlString)

+ (id)tc_stringWithXmlString:()TCStringAdditions_XmlString
{
  return (id)objc_msgSend([a1 alloc], "tc_initWithXmlString:", a3);
}

- (uint64_t)tc_xmlString
{
  return objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
}

- (uint64_t)tc_initWithValueOfXmlAttribute:()TCStringAdditions_XmlString
{
  uint64_t v4;
  int v5;
  xmlChar *String;
  id v7;
  void *v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a3 + 24);
  if (!v4 || *(_QWORD *)(v4 + 48) || (*(_DWORD *)(v4 + 8) - 3) > 1)
  {
    v5 = 1;
    String = xmlNodeListGetString(*(xmlDocPtr *)(a3 + 64), (const xmlNode *)v4, 1);
  }
  else
  {
    v5 = 0;
    String = *(xmlChar **)(v4 + 80);
  }
  v7 = a1;
  v8 = v7;
  if (String)
  {
    v9 = objc_msgSend(v7, "tc_initWithXmlString:", String);

    if (v5)
      ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(String);
  }
  else
  {
    v9 = objc_msgSend(v7, "init");

  }
  return v9;
}

- (uint64_t)tc_initWithContentOfXmlNode:()TCStringAdditions_XmlString
{
  xmlChar *Content;
  id v5;
  void *v6;
  uint64_t v7;

  Content = xmlNodeGetContent(cur);
  v5 = a1;
  v6 = v5;
  if (Content)
  {
    v7 = objc_msgSend(v5, "tc_initWithXmlString:", Content);

    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(Content);
  }
  else
  {
    v7 = objc_msgSend(v5, "init");

  }
  return v7;
}

- (uint64_t)tc_initFromXmlNode:()TCStringAdditions_XmlString ns:attributeName:
{
  xmlChar *NsProp;
  id v7;
  uint64_t v8;

  NsProp = xmlGetNsProp(node, name, nameSpace);
  if (NsProp)
  {
    v7 = a1;
    v8 = objc_msgSend(v7, "tc_initWithXmlString:", NsProp);

    ((void (*)(xmlChar *))*MEMORY[0x24BEDE758])(NsProp);
  }
  else
  {

    return 0;
  }
  return v8;
}

- (uint64_t)tc_initFromXmlNode:()TCStringAdditions_XmlString nsWithFallbackNs:attributeName:
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a1;
  v10 = objc_msgSend(v9, "tc_initFromXmlNode:ns:attributeName:", a3, objc_msgSend(v8, "uri"), a5);

  if (!v10)
  {
    objc_msgSend(v8, "fallbackNamespace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v8, "fallbackNamespace");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(0, "tc_initFromXmlNode:nsWithFallbackNs:attributeName:", a3, v12, a5);

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)tc_componentsSeparatedByWhitespace
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  void *v11;
  unsigned int v12;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "length");
  v4 = MEMORY[0x24BDAC740];
  v5 = 0;
  if (!v3)
    goto LABEL_10;
  do
  {
    v6 = objc_msgSend(a1, "characterAtIndex:", v5);
    if (v6 <= 0x7F)
    {
      if ((*(_DWORD *)(v4 + 4 * v6 + 60) & 0x4000) == 0)
        goto LABEL_8;
    }
    else if (!__maskrune(v6, 0x4000uLL))
    {
      goto LABEL_8;
    }
    ++v5;
  }
  while (v3 != v5);
  v5 = v3;
LABEL_8:
  if (v5)
    objc_msgSend(v2, "addObject:", &stru_24F3BFFF8);
LABEL_10:
  while (v5 < v3)
  {
    v7 = 0;
    do
    {
      v8 = v7;
      if (v5 + v7 + 1 >= v3)
        break;
      v9 = objc_msgSend(a1, "characterAtIndex:");
      v10 = v9 <= 0x7F ? *(_DWORD *)(v4 + 4 * v9 + 60) & 0x4000 : __maskrune(v9, 0x4000uLL);
      v7 = v8 + 1;
    }
    while (!v10);
    objc_msgSend(a1, "substringWithRange:", v5, v8 + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v11);

    v5 += v8 + 2;
    if (v5 < v3)
    {
      do
      {
        v12 = objc_msgSend(a1, "characterAtIndex:", v5);
        if (v12 <= 0x7F)
        {
          if ((*(_DWORD *)(v4 + 4 * v12 + 60) & 0x4000) == 0)
            goto LABEL_10;
        }
        else if (!__maskrune(v12, 0x4000uLL))
        {
          goto LABEL_10;
        }
        ++v5;
      }
      while (v5 < v3);
      goto LABEL_25;
    }
  }
  if (v5 != v3)
    return v2;
LABEL_25:
  objc_msgSend(v2, "addObject:", &stru_24F3BFFF8);
  return v2;
}

- (uint64_t)tc_isEqualToXmlString:()TCStringAdditions_XmlString
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isEqualToString:", v2);

  return v3;
}

- (id)tc_stringByRemovingInvalidXmlChars
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  TCInvalidXmlCharacterSet();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1;
  if (objc_msgSend(v3, "rangeOfCharacterFromSet:", v2) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", &stru_24F3BFFF8);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v5;
  }
  objc_msgSend(v3, "tsu_stringByFixingBrokenSurrogatePairs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
