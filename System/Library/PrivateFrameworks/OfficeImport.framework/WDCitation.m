@implementation WDCitation

+ (id)wordRefTypeEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_46, 0, &dword_22A0CC000);
  }
  if (+[WDCitation wordRefTypeEnumMap]::onceToken != -1)
    dispatch_once(&+[WDCitation wordRefTypeEnumMap]::onceToken, &__block_literal_global_96);
  return (id)+[WDCitation wordRefTypeEnumMap]::sWordRefTypeEnumMap;
}

void __32__WDCitation_wordRefTypeEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WDCitation wordRefTypeEnumMap]::sWordRefTypeEnumStructs, 17, 1);
  v1 = (void *)+[WDCitation wordRefTypeEnumMap]::sWordRefTypeEnumMap;
  +[WDCitation wordRefTypeEnumMap]::sWordRefTypeEnumMap = (uint64_t)v0;

}

+ (id)refTypeEnumMap
{
  unsigned __int8 v2;

  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_136, 0, &dword_22A0CC000);
  }
  if (+[WDCitation refTypeEnumMap]::onceToken != -1)
    dispatch_once(&+[WDCitation refTypeEnumMap]::onceToken, &__block_literal_global_137);
  return (id)+[WDCitation refTypeEnumMap]::sRefTypeEnumMap;
}

void __28__WDCitation_refTypeEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WDCitation refTypeEnumMap]::sRefTypeEnumStructs, 47, 1);
  v1 = (void *)+[WDCitation refTypeEnumMap]::sRefTypeEnumMap;
  +[WDCitation refTypeEnumMap]::sRefTypeEnumMap = (uint64_t)v0;

}

- (WDCitation)initWithDocument:(id)a3
{
  id v4;
  WDCitation *v5;
  WDCitation *v6;
  uint64_t v7;
  NSMutableArray *mAuthors;
  uint64_t v9;
  NSMutableArray *mTitles;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WDCitation;
  v5 = -[WDCitation init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mDocument, v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
    mAuthors = v6->mAuthors;
    v6->mAuthors = (NSMutableArray *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
    mTitles = v6->mTitles;
    v6->mTitles = (NSMutableArray *)v9;

  }
  return v6;
}

+ (id)endNoteStringForRefType:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(a1, "refTypeEnumMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForValue:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (int)refTypeForWordString:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  objc_msgSend(a1, "wordRefTypeEnumMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "valueForString:", v4);

  return v6;
}

+ (id)wordStringForRefType:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(a1, "wordRefTypeEnumMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForValue:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    switch((int)v3)
    {
      case '$':
      case '4':
      case '5':
        goto LABEL_6;
      case '%':
      case '&':
      case '\'':
      case '(':
      case ')':
      case '*':
      case '.':
      case '/':
      case '1':
      case '2':
      case '3':
      case '6':
      case '7':
      case ':':
      case ';':
        goto LABEL_8;
      case '+':
      case ',':
      case '-':
      case '0':
      case '<':
        objc_msgSend(a1, "wordRefTypeEnumMap");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringForValue:", 202);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case '8':
        objc_msgSend(a1, "wordRefTypeEnumMap");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringForValue:", 12);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case '9':
        goto LABEL_7;
      default:
        if ((_DWORD)v3 == 23)
        {
LABEL_7:
          objc_msgSend(a1, "wordRefTypeEnumMap");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "stringForValue:", 19);
          v8 = objc_claimAutoreleasedReturnValue();
        }
        else if ((_DWORD)v3 == 28)
        {
LABEL_6:
          objc_msgSend(a1, "wordRefTypeEnumMap");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "stringForValue:", 6);
          v8 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_8:
          objc_msgSend(a1, "wordRefTypeEnumMap");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "stringForValue:", 13);
          v8 = objc_claimAutoreleasedReturnValue();
        }
LABEL_10:
        v6 = (void *)v8;

        break;
    }
  }
  return v6;
}

+ (_xmlNode)nodeAtPath:(id)a3 nodePtr:(_xmlNode *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("/"));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        a4 = CXFirstChildNamed(a4, (xmlChar *)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "tc_xmlString", (_QWORD)v10));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return a4;
}

+ (_xmlNode)trimStyle:(_xmlNode *)a3
{
  _xmlNode *children;

  children = a3->children;
  if (!children || !xmlStrEqual((const xmlChar *)"style", children->name))
    return a3;
  return children;
}

+ (id)subStringOf:(_xmlNode *)a3 forPath:(id)a4
{
  xmlNode *v5;
  xmlBufferPtr v6;
  void *v7;

  v5 = (xmlNode *)objc_msgSend(a1, "nodeAtPath:nodePtr:", a4, a3);
  xmlSetBufferAllocationScheme(XML_BUFFER_ALLOC_EXACT);
  v6 = xmlBufferCreate();
  xmlNodeDump(v6, a3->doc, v5, 0, 0);
  if (xmlBufferLength(v6))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "tc_stringWithXmlString:", xmlBufferContent(v6));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  xmlBufferFree(v6);
  return v7;
}

+ (id)stringValueForNodeAtPath:(id)a3 nodePtr:(_xmlNode *)a4 trimStyle:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v5 = a5;
  v8 = a3;
  v9 = objc_msgSend(a1, "nodeAtPath:nodePtr:", v8, a4);
  if (!v9)
    goto LABEL_7;
  if (v5)
    v9 = objc_msgSend(a1, "trimStyle:", v9);
  v10 = *(_QWORD *)(v9 + 24);
  if (v10)
  {
    if (*(_DWORD *)(v10 + 8) == 1)
      v11 = 0;
    else
      v11 = *(_QWORD *)(v10 + 80);
    objc_msgSend(MEMORY[0x24BDD17C8], "tc_stringWithXmlString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_7:
    v12 = 0;
  }

  return v12;
}

+ (id)stringValuesForNodesAtPath:(id)a3 nodePtr:(_xmlNode *)a4 trimStyle:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  _xmlNode *v10;
  void *v11;
  xmlChar *v12;
  _xmlNode *v13;
  _xmlNode *children;
  void *v15;

  v5 = a5;
  v8 = a3;
  objc_msgSend(v8, "stringByDeletingLastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (_xmlNode *)objc_msgSend(a1, "nodeAtPath:nodePtr:", v9, a4);

  if (v10)
  {
    objc_msgSend(v8, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (xmlChar *)objc_msgSend(v11, "tc_xmlString");
    v13 = CXFirstChildNamed(v10, v12);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (_xmlNode *)objc_claimAutoreleasedReturnValue();
    while (v13)
    {
      if (v5)
        v13 = (_xmlNode *)objc_msgSend(a1, "trimStyle:", v13);
      children = v13->children;
      if (children->type != XML_ELEMENT_NODE)
      {
        if (children->content)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "tc_stringWithXmlString:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[_xmlNode addObject:](v10, "addObject:", v15);

        }
      }
      v13 = CXNextSiblingNamed(v13, v12);
    }

  }
  return v10;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDCitation;
  -[WDCitation description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)year
{
  return self->mYear;
}

- (void)setYear:(id)a3
{
  objc_storeStrong((id *)&self->mYear, a3);
}

- (NSMutableArray)authors
{
  return self->mAuthors;
}

- (void)setAuthors:(id)a3
{
  objc_storeStrong((id *)&self->mAuthors, a3);
}

- (NSString)sourceType
{
  return self->mSourceType;
}

- (void)setSourceType:(id)a3
{
  objc_storeStrong((id *)&self->mSourceType, a3);
}

- (NSMutableArray)titles
{
  return self->mTitles;
}

- (void)setTitles:(id)a3
{
  objc_storeStrong((id *)&self->mTitles, a3);
}

- (NSString)periodicalTitle
{
  return self->mPeriodicalTitle;
}

- (void)setPeriodicalTitle:(id)a3
{
  objc_storeStrong((id *)&self->mPeriodicalTitle, a3);
}

- (NSString)volume
{
  return self->mVolume;
}

- (void)setVolume:(id)a3
{
  objc_storeStrong((id *)&self->mVolume, a3);
}

- (NSString)number
{
  return self->mNumber;
}

- (void)setNumber:(id)a3
{
  objc_storeStrong((id *)&self->mNumber, a3);
}

- (NSString)section
{
  return self->mSection;
}

- (void)setSection:(id)a3
{
  objc_storeStrong((id *)&self->mSection, a3);
}

- (NSString)pubDate
{
  return self->mPubDate;
}

- (void)setPubDate:(id)a3
{
  objc_storeStrong((id *)&self->mPubDate, a3);
}

- (NSMutableArray)urls
{
  return self->mUrls;
}

- (void)setUrls:(id)a3
{
  objc_storeStrong((id *)&self->mUrls, a3);
}

- (NSString)pages
{
  return self->mPages;
}

- (void)setPages:(id)a3
{
  objc_storeStrong((id *)&self->mPages, a3);
}

- (WDDocument)document
{
  return (WDDocument *)objc_loadWeakRetained((id *)&self->mDocument);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mDocument);
  objc_storeStrong((id *)&self->mPages, 0);
  objc_storeStrong((id *)&self->mPubDate, 0);
  objc_storeStrong((id *)&self->mSection, 0);
  objc_storeStrong((id *)&self->mNumber, 0);
  objc_storeStrong((id *)&self->mVolume, 0);
  objc_storeStrong((id *)&self->mPeriodicalTitle, 0);
  objc_storeStrong((id *)&self->mUrls, 0);
  objc_storeStrong((id *)&self->mTitles, 0);
  objc_storeStrong((id *)&self->mYear, 0);
  objc_storeStrong((id *)&self->mAuthors, 0);
  objc_storeStrong((id *)&self->mSourceType, 0);
}

@end
