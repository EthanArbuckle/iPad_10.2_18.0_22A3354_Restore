@implementation THCFIReader

+ (id)getHrefFromNode:(_xmlNode *)a3 ns:(id)a4
{
  NSString *v7;
  NSString *v8;

  v8 = 0;
  if (CXOptionalStringAttribute(a3, (CXNamespace *)a4, (xmlChar *)"media-type", &v8)
    && -[NSString isEqualToString:](v8, "isEqualToString:", CFSTR("application/xhtml+xml"))
    && (v7 = 0, CXOptionalStringAttribute(a3, (CXNamespace *)a4, (xmlChar *)"href", &v7)))
  {
    return v7;
  }
  else
  {
    return 0;
  }
}

+ (_xmlNode)lookupIDFrom:(_xmlNode *)a3 inManifest:(_xmlNode *)a4 ns:(id)a5
{
  _BOOL4 v8;
  _xmlNode *result;
  _xmlNode *v10;
  NSString *v11;

  v11 = 0;
  objc_opt_class(CXCommon);
  v8 = CXOptionalStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"idref", &v11);
  result = 0;
  if (v8)
  {
    if (a4)
      return (_xmlNode *)CXFindChildWithAttributeValue(a4, (CXNamespace *)a5, "item", "id", -[NSString cStringUsingEncoding:](v11, "cStringUsingEncoding:", 4));
    v10 = CXGetRootElement(a3->doc);
    result = (_xmlNode *)CXFindChild(v10, (CXNamespace *)a5, "manifest");
    a4 = result;
    if (result)
      return (_xmlNode *)CXFindChildWithAttributeValue(a4, (CXNamespace *)a5, "item", "id", -[NSString cStringUsingEncoding:](v11, "cStringUsingEncoding:", 4));
  }
  return result;
}

+ (_xmlNode)findRefNodeFromRoot:(_xmlNode *)a3 reader:(id)a4 ns:(id)a5 manifest:(_xmlNode *)a6
{
  char *v10;
  char *v11;
  char *i;
  unint64_t v13;
  _xmlNode *v14;
  _xmlNode *v15;
  _BOOL4 v16;
  unint64_t v17;
  _xmlNode *v18;
  uint64_t v20;

  v10 = (char *)objc_msgSend(a4, "componentCount");
  if (!v10)
    return a3;
  v11 = v10;
  for (i = 0; i != v11; ++i)
  {
    v20 = 0;
    v13 = (unint64_t)objc_msgSend(a4, "componentAtIndex:identifier:", i, &v20);
    if (!v20
      || (v14 = (_xmlNode *)CXFirstNodeMatchingXPathQuery(a3, (const xmlChar *)-[NSString cStringUsingEncoding:](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*[@id='%@']"), v20), "cStringUsingEncoding:", 4))) == 0&& (v14 = (_xmlNode *)CXFirstNodeMatchingXPathQuery(a3, (const xmlChar *)-[NSString cStringUsingEncoding:](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("//*[@id=%@]"), v20), "cStringUsingEncoding:", 4))) == 0)
    {
      v15 = CXFirstChild(a3);
      if (v15)
        a3 = v15;
      v16 = a3 != 0;
      if (v13 >= 3 && a3)
      {
        v17 = 4;
        while (a3->next)
        {
          v18 = CXNextSibling(a3);
          if (v18)
            a3 = v18;
          if (!i && !*a6 && CXNodeHasName(a3, (CXNamespace *)a5, (xmlChar *)"manifest"))
            *a6 = a3;
          v16 = a3 != 0;
          if (v17 >= v13)
            goto LABEL_21;
          v17 += 2;
        }
        v16 = 1;
      }
LABEL_21:
      if ((v13 & 1) != 0 && v16)
      {
        do
        {
          v14 = a3;
          if (xmlNodeIsText(a3))
            break;
          a3 = a3->next;
        }
        while (a3);
      }
      else
      {
        v14 = a3;
      }
    }
    a3 = v14;
  }
  return v14;
}

- (void)parseTerminatingStep
{
  -[THCFIInnerPathReader parseTerminatingStep](self->mInnerPathReader, "parseTerminatingStep");
  -[THCFIInnerPathReader parseTerminatingStep](self->mInnerPathRangeMaxReader, "parseTerminatingStep");
}

+ (id)mergeBackArrayComponentsWithEscapeIn:(id)a3 desiredMaxCount:(int64_t)a4 separator:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  int64_t v11;
  id v12;
  BOOL v13;

  v8 = objc_msgSend(a3, "mutableCopy");
  v9 = objc_msgSend(a3, "count");
  v10 = (uint64_t)v9 - 2;
  if ((uint64_t)v9 >= 2)
  {
    v11 = (int64_t)v9;
    if ((uint64_t)v9 > a4)
    {
      do
      {
        v12 = objc_msgSend(v8, "objectAtIndex:", v10);
        if (objc_msgSend(v12, "length"))
        {
          v13 = objc_msgSend(v12, "characterAtIndex:", (char *)objc_msgSend(v12, "length") - 1) == 94
             && v10 + 1 < v11;
          if (v13)
          {
            objc_msgSend(v8, "replaceObjectAtIndex:withObject:", v10, objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("%@%@"), a5, objc_msgSend(v8, "objectAtIndex:", v10 + 1)));
            objc_msgSend(v8, "removeObjectAtIndex:", v10 + 1);
            --v11;
          }
        }
        v13 = v10-- < 1;
      }
      while (!v13 && v11 > a4);
    }
  }
  return v8;
}

- (THCFIReader)initWithCFI:(id)a3 error:(id *)a4
{
  THCFIReader *v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  char *v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)THCFIReader;
  v6 = -[THCFIReader init](&v19, "init");
  if (v6)
  {
    v7 = (char *)objc_msgSend(a3, "rangeOfString:", CFSTR("#epubcfi(/"));
    if (v8)
    {
      v9 = objc_msgSend(a3, "substringWithRange:", &v7[v8], (char *)objc_msgSend(a3, "length") + ~(unint64_t)&v7[v8]);
      v10 = objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("!/"));
      v11 = (char *)objc_msgSend(v10, "count");
      if (v11 == (_BYTE *)&dword_0 + 2)
        goto LABEL_8;
      if ((unint64_t)v11 > 1
        || (v10 = objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("!")),
            v12 = (char *)objc_msgSend(v10, "count"),
            (unint64_t)v12 >= 3))
      {
        v10 = +[THCFIReader mergeBackArrayComponentsWithEscapeIn:desiredMaxCount:separator:](THCFIReader, "mergeBackArrayComponentsWithEscapeIn:desiredMaxCount:separator:", v10, 2, CFSTR("!/"));
        v12 = (char *)objc_msgSend(v10, "count");
      }
      if (v12 == (_BYTE *)&dword_0 + 2)
      {
LABEL_8:
        v6->mOutsidePathComponents = (NSArray *)objc_msgSend(objc_msgSend(v10, "objectAtIndex:", 0), "componentsSeparatedByString:", CFSTR("/"));
        v13 = objc_msgSend(v10, "objectAtIndex:", 1);
        v14 = objc_msgSend(v13, "componentsSeparatedByString:", CFSTR(","));
        if (objc_msgSend(v14, "count") == (char *)&dword_0 + 3)
        {
          v15 = objc_msgSend(v14, "objectAtIndex:", 0);
          v16 = objc_msgSend(v15, "stringByAppendingString:", objc_msgSend(v14, "objectAtIndex:", 1));
          v13 = objc_msgSend(v15, "stringByAppendingString:", objc_msgSend(v14, "objectAtIndex:", 2));
          v6->mInnerPathReader = -[THCFIInnerPathReader initWithInnerCfiFrag:]([THCFIInnerPathReader alloc], "initWithInnerCfiFrag:", v16);
          v17 = 24;
        }
        else
        {
          v17 = 16;
        }
        *(Class *)((char *)&v6->super.isa + v17) = (Class)-[THCFIInnerPathReader initWithInnerCfiFrag:]([THCFIInnerPathReader alloc], "initWithInnerCfiFrag:", v13);
        v6->mOutsidePathComponents = (NSArray *)+[THCFIReader mergeBackArrayComponentsWithEscapeIn:desiredMaxCount:separator:](THCFIReader, "mergeBackArrayComponentsWithEscapeIn:desiredMaxCount:separator:", v6->mOutsidePathComponents, 0, CFSTR("/"));
        -[THCFIReader parseTerminatingStep](v6, "parseTerminatingStep");
      }
    }
    else if (a4)
    {
      *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.iWork.Compatibility.CFIImport"), 0, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", CFSTR("invalid CFI."), NSLocalizedDescriptionKey, 0));
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THCFIReader;
  -[THCFIReader dealloc](&v3, "dealloc");
}

+ (unint64_t)componentOfArray:(id)a3 atIndex:(unint64_t)a4 identifier:(id *)a5
{
  id v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  char *v10;

  v6 = objc_msgSend(a3, "objectAtIndex:", a4);
  v7 = objc_msgSend(v6, "rangeOfString:", CFSTR("["));
  if (v8)
  {
    v9 = v7;
    v10 = (char *)objc_msgSend(v6, "length");
    if (a5)
      *a5 = objc_msgSend(objc_msgSend(v6, "substringWithRange:", v9 + 1, v10 - v9 - 2), "tsu_stringByRemovingCharactersInSet:", +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("^")));
    v6 = objc_msgSend(v6, "substringToIndex:", v9);
  }
  return (unint64_t)objc_msgSend(v6, "integerValue");
}

- (unint64_t)componentAtIndex:(unint64_t)a3 identifier:(id *)a4
{
  return +[THCFIReader componentOfArray:atIndex:identifier:](THCFIReader, "componentOfArray:atIndex:identifier:", self->mOutsidePathComponents, a3, a4);
}

- (unint64_t)componentCount
{
  return -[NSArray count](self->mOutsidePathComponents, "count");
}

- (id)innerPathReader
{
  return self->mInnerPathReader;
}

- (id)innerPathMaxRangeReader
{
  return self->mInnerPathRangeMaxReader;
}

+ (id)cfiWithFilename:(id)a3 base:(id)a4 innerComponents:(id)a5
{
  __CFString *v7;
  const __CFString *v8;

  v7 = (__CFString *)objc_msgSend(a3, "stringByAppendingString:", CFSTR("#"));
  v8 = &stru_43D7D8;
  if (!v7)
    v7 = &stru_43D7D8;
  if (a5)
    v8 = (const __CFString *)a5;
  return -[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", CFSTR("epubcfi(/%@!/%@)"), a4, v8);
}

+ (id)cfiRangeWithFilename:(id)a3 base:(id)a4 innerComponents1:(id)a5 innerComponents2:(id)a6
{
  id v9;
  id v10;
  char *v11;
  char *v12;
  id v13;
  char *v14;
  char *v15;
  id v16;
  id v17;
  char *v18;
  id v19;
  NSString *v20;
  id v22;
  id v23;

  v9 = objc_msgSend(a5, "componentsSeparatedByString:", CFSTR("/"));
  v10 = objc_msgSend(a6, "componentsSeparatedByString:", CFSTR("/"));
  v11 = (char *)objc_msgSend(v9, "count");
  v12 = (char *)objc_msgSend(v10, "count");
  v13 = objc_alloc_init((Class)NSMutableString);
  if (v11 >= v12)
    v14 = v12;
  else
    v14 = v11;
  v22 = a4;
  v23 = a3;
  v15 = 0;
  if (v14)
  {
    while (1)
    {
      v16 = objc_msgSend(v9, "objectAtIndex:", v15);
      if (!objc_msgSend(v16, "isEqualToString:", objc_msgSend(v10, "objectAtIndex:", v15)))
        break;
      objc_msgSend(v13, "appendFormat:", CFSTR("/"));
      objc_msgSend(v13, "appendString:", v16);
      if (v14 == ++v15)
      {
        v15 = v14;
        break;
      }
    }
  }
  v17 = objc_alloc_init((Class)NSMutableString);
  if (v15 < v11)
  {
    v18 = v15;
    do
    {
      objc_msgSend(v17, "appendFormat:", CFSTR("/"));
      objc_msgSend(v17, "appendString:", objc_msgSend(v9, "objectAtIndex:", v18++));
    }
    while (v11 != v18);
  }
  v19 = objc_alloc_init((Class)NSMutableString);
  if (v15 < v12)
  {
    do
    {
      objc_msgSend(v19, "appendFormat:", CFSTR("/"));
      objc_msgSend(v19, "appendString:", objc_msgSend(v10, "objectAtIndex:", v15++));
    }
    while (v12 != v15);
  }
  v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("epubcfi(/%@!%@,%@,%@)"), v22, v13, v17, v19);
  if (v23)
    v20 = (NSString *)objc_msgSend(v23, "stringByAppendingFormat:", CFSTR("#%@"), v20);

  return v20;
}

@end
