@implementation WXReadState

- (WXReadState)init
{
  WXReadState *v2;
  WXReadState *v3;
  WDDocument *mDocument;
  OITSUNoCopyDictionary *v5;
  OITSUNoCopyDictionary *mTextNodesToBeAdded;
  OITSUNoCopyDictionary *v7;
  OITSUNoCopyDictionary *mMapBookmarkIdToName;
  OITSUNoCopyDictionary *v9;
  OITSUNoCopyDictionary *mMapAnnotationIdToAnnotation;
  OITSUNoCopyDictionary *v11;
  OITSUNoCopyDictionary *mMapAnnotationParaIdToAnnotation;
  NSMutableDictionary *v13;
  NSMutableDictionary *mMapFlowIdToTextBox;
  OCPPackagePart *mPackagePart;
  OCPPackagePart *mAnnotationPart;
  OCPPackagePart *mAnnotationExtendedPart;
  NSMutableArray *v18;
  NSMutableArray *mDeleteAuthorStack;
  NSMutableArray *v20;
  NSMutableArray *mDeleteDateStack;
  NSMutableArray *v22;
  NSMutableArray *mEditAuthorStack;
  NSMutableArray *v24;
  NSMutableArray *mEditDateStack;
  NSMutableArray *v26;
  NSMutableArray *mFormatAuthorStack;
  NSMutableArray *v28;
  NSMutableArray *mFormatDateStack;
  NSMutableArray *v30;
  NSMutableArray *mPendingCommentNodes;
  NSMutableArray *v32;
  NSMutableArray *mPendingBookmarkNodes;
  WXOAVReadState *v34;
  WXOAVReadState *mWXOavState;
  WXOfficeArtClient *v36;
  OAXDrawingState *v37;
  OAXDrawingState *mDrawingState;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)WXReadState;
  v2 = -[OCXState init](&v40, sel_init);
  v3 = v2;
  if (v2)
  {
    mDocument = v2->mDocument;
    v2->mDocument = 0;

    v5 = objc_alloc_init(OITSUNoCopyDictionary);
    mTextNodesToBeAdded = v3->mTextNodesToBeAdded;
    v3->mTextNodesToBeAdded = v5;

    v7 = objc_alloc_init(OITSUNoCopyDictionary);
    mMapBookmarkIdToName = v3->mMapBookmarkIdToName;
    v3->mMapBookmarkIdToName = v7;

    v9 = objc_alloc_init(OITSUNoCopyDictionary);
    mMapAnnotationIdToAnnotation = v3->mMapAnnotationIdToAnnotation;
    v3->mMapAnnotationIdToAnnotation = v9;

    v11 = objc_alloc_init(OITSUNoCopyDictionary);
    mMapAnnotationParaIdToAnnotation = v3->mMapAnnotationParaIdToAnnotation;
    v3->mMapAnnotationParaIdToAnnotation = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mMapFlowIdToTextBox = v3->mMapFlowIdToTextBox;
    v3->mMapFlowIdToTextBox = v13;

    mPackagePart = v3->mPackagePart;
    v3->mPackagePart = 0;

    mAnnotationPart = v3->mAnnotationPart;
    v3->mAnnotationPart = 0;

    mAnnotationExtendedPart = v3->mAnnotationExtendedPart;
    v3->mAnnotationExtendedPart = 0;

    v3->mFootnotes = 0;
    v3->mEndnotes = 0;
    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mDeleteAuthorStack = v3->mDeleteAuthorStack;
    v3->mDeleteAuthorStack = v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mDeleteDateStack = v3->mDeleteDateStack;
    v3->mDeleteDateStack = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mEditAuthorStack = v3->mEditAuthorStack;
    v3->mEditAuthorStack = v22;

    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mEditDateStack = v3->mEditDateStack;
    v3->mEditDateStack = v24;

    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mFormatAuthorStack = v3->mFormatAuthorStack;
    v3->mFormatAuthorStack = v26;

    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mFormatDateStack = v3->mFormatDateStack;
    v3->mFormatDateStack = v28;

    v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mPendingCommentNodes = v3->mPendingCommentNodes;
    v3->mPendingCommentNodes = v30;

    v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mPendingBookmarkNodes = v3->mPendingBookmarkNodes;
    v3->mPendingBookmarkNodes = v32;

    v34 = -[WXOAVReadState initWithWXReadState:]([WXOAVReadState alloc], "initWithWXReadState:", v3);
    mWXOavState = v3->mWXOavState;
    v3->mWXOavState = v34;

    v36 = objc_alloc_init(WXOfficeArtClient);
    v37 = -[OAXDrawingState initWithClient:]([OAXDrawingState alloc], "initWithClient:", v36);
    mDrawingState = v3->mDrawingState;
    v3->mDrawingState = v37;

    -[OAXDrawingState setDocumentState:](v3->mDrawingState, "setDocumentState:", v3);
    v3->mCurrentOfficeArtTextType = -1;
    -[OAVReadState setOaxState:](v3->mWXOavState, "setOaxState:", v3->mDrawingState);
    -[OAXDrawingState setOavState:](v3->mDrawingState, "setOavState:", v3->mWXOavState);
    v3->mNewSectionRequested = 0;
    v3->mReadingMath = 0;

  }
  return v3;
}

- (id)initNoStacksWith:(id)a3
{
  id *v4;
  WXReadState *v5;
  WXReadState *v6;
  NSMutableArray *v7;
  NSMutableArray *mPendingCommentNodes;
  NSMutableArray *v9;
  NSMutableArray *mPendingBookmarkNodes;
  objc_super v12;

  v4 = (id *)a3;
  v12.receiver = self;
  v12.super_class = (Class)WXReadState;
  v5 = -[OCXState init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->mDocument, v4[4]);
    objc_storeStrong((id *)&v6->mTextNodesToBeAdded, v4[5]);
    objc_storeStrong((id *)&v6->mMapBookmarkIdToName, v4[6]);
    objc_storeStrong((id *)&v6->mPackagePart, v4[10]);
    objc_storeStrong((id *)&v6->mMapAnnotationIdToAnnotation, v4[7]);
    objc_storeStrong((id *)&v6->mMapAnnotationParaIdToAnnotation, v4[8]);
    objc_storeStrong((id *)&v6->mMapFlowIdToTextBox, v4[9]);
    v6->mFootnoteDocument = (_xmlDoc *)v4[13];
    v6->mFootnotes = (_xmlNode *)v4[14];
    v6->mEndnoteDocument = (_xmlDoc *)v4[15];
    v6->mAnnotationDocument = (_xmlDoc *)v4[17];
    v6->mAnnotations = (_xmlNode *)v4[18];
    v6->mAnnotationExtendedDocument = (_xmlDoc *)v4[19];
    v6->mAnnotationsExtended = (_xmlNode *)v4[20];
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mPendingCommentNodes = v6->mPendingCommentNodes;
    v6->mPendingCommentNodes = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mPendingBookmarkNodes = v6->mPendingBookmarkNodes;
    v6->mPendingBookmarkNodes = v9;

    objc_storeStrong((id *)&v6->mWXOavState, v4[29]);
    objc_storeStrong((id *)&v6->mDrawingState, v4[30]);
    v6->mNewSectionRequested = *((_BYTE *)v4 + 264);
    v6->mCurrentRowCNFStyle = (unint64_t)v4[34];
    v6->mCurrentCellCNFStyle = (unint64_t)v4[35];
    v6->mCurrentTableWraps = *((_BYTE *)v4 + 288);
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[OITSUNoCopyDictionary allKeys](self->mTextNodesToBeAdded, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        -[WXReadState clearOutNodesToBeAdded:](self, "clearOutNodesToBeAdded:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  -[WXReadState clearPendingBookmarks](self, "clearPendingBookmarks");
  v7.receiver = self;
  v7.super_class = (Class)WXReadState;
  -[WXReadState dealloc](&v7, sel_dealloc);
}

- (id)document
{
  return self->mDocument;
}

- (void)setDocument:(id)a3
{
  WDDocument *v4;
  WDDocument *v5;
  OAXDrawingState *mDrawingState;
  void *v7;
  WDDocument *mDocument;

  v4 = (WDDocument *)a3;
  v5 = v4;
  if (!self->mDocument)
  {
    mDrawingState = self->mDrawingState;
    -[OCDDocument blips](v4, "blips");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OAXDrawingState setTargetBlipCollection:](mDrawingState, "setTargetBlipCollection:", v7);

  }
  mDocument = self->mDocument;
  self->mDocument = v5;

}

- (void)addText:(id)a3 node:(_xmlNode *)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  -[OITSUNoCopyDictionary objectForKey:](self->mTextNodesToBeAdded, "objectForKey:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[OITSUNoCopyDictionary setObject:forUncopiedKey:](self->mTextNodesToBeAdded, "setObject:forUncopiedKey:", v6, v8);
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", xmlCopyNode(a4, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

- (id)nodesToBeAdded:(id)a3
{
  void *v3;
  void *v4;

  -[OITSUNoCopyDictionary objectForKey:](self->mTextNodesToBeAdded, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)clearOutNodesToBeAdded:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  -[OITSUNoCopyDictionary objectForKey:](self->mTextNodesToBeAdded, "objectForKey:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "count");
  if (v3)
  {
    v4 = 0;
    do
      xmlFreeNode((xmlNodePtr)objc_msgSend(v5, "objectAtIndex:", v4++));
    while (v3 != v4);
  }
  objc_msgSend(v5, "removeAllObjects");

}

- (void)addBookmarkId:(int64_t)a3 name:(id)a4
{
  OITSUNoCopyDictionary *mMapBookmarkIdToName;
  void *v7;
  id v8;

  v8 = a4;
  mMapBookmarkIdToName = self->mMapBookmarkIdToName;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OITSUNoCopyDictionary setObject:forKey:](mMapBookmarkIdToName, "setObject:forKey:", v8, v7);

}

- (id)bookmarkName:(int64_t)a3
{
  OITSUNoCopyDictionary *mMapBookmarkIdToName;
  void *v4;
  void *v5;

  mMapBookmarkIdToName = self->mMapBookmarkIdToName;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OITSUNoCopyDictionary objectForKey:](mMapBookmarkIdToName, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addAnnotationId:(int64_t)a3 annotation:(id)a4
{
  OITSUNoCopyDictionary *mMapAnnotationIdToAnnotation;
  void *v7;
  id v8;

  v8 = a4;
  mMapAnnotationIdToAnnotation = self->mMapAnnotationIdToAnnotation;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OITSUNoCopyDictionary setObject:forKey:](mMapAnnotationIdToAnnotation, "setObject:forKey:", v8, v7);

}

- (id)annotationWithId:(int64_t)a3
{
  OITSUNoCopyDictionary *mMapAnnotationIdToAnnotation;
  void *v4;
  void *v5;

  mMapAnnotationIdToAnnotation = self->mMapAnnotationIdToAnnotation;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OITSUNoCopyDictionary objectForKey:](mMapAnnotationIdToAnnotation, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasAnnotations
{
  return self->mAnnotations != 0;
}

- (void)addAnnotationParaId:(unsigned int)a3 annotation:(id)a4
{
  uint64_t v4;
  OITSUNoCopyDictionary *mMapAnnotationParaIdToAnnotation;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  mMapAnnotationParaIdToAnnotation = self->mMapAnnotationParaIdToAnnotation;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OITSUNoCopyDictionary setObject:forKey:](mMapAnnotationParaIdToAnnotation, "setObject:forKey:", v8, v7);

}

- (id)annotationWithParaId:(unsigned int)a3
{
  OITSUNoCopyDictionary *mMapAnnotationParaIdToAnnotation;
  void *v4;
  void *v5;

  mMapAnnotationParaIdToAnnotation = self->mMapAnnotationParaIdToAnnotation;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OITSUNoCopyDictionary objectForKey:](mMapAnnotationParaIdToAnnotation, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasAnnotationsExtended
{
  return self->mAnnotationsExtended != 0;
}

- (id)textBoxForFlowId:(id)a3
{
  -[NSMutableDictionary objectForKeyedSubscript:](self->mMapFlowIdToTextBox, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setTextBox:(id)a3 forFlowId:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->mMapFlowIdToTextBox, "setObject:forKey:", a3, a4);
}

- (_xmlNode)xmlFootnoteWithID:(int64_t)a3
{
  _xmlNode *mFootnotes;
  _xmlNode *i;

  mFootnotes = self->mFootnotes;
  if (!mFootnotes)
    return 0;
  for (i = OCXFirstChild(mFootnotes); i; i = OCXNextSibling(i))
  {
    if (xmlStrEqual(i->name, (const xmlChar *)"footnote")
      && CXDefaultLongAttribute(i, self->mWXMainNamespace, (xmlChar *)"id", 0) == a3)
    {
      break;
    }
  }
  return i;
}

- (_xmlNode)xmlEndnoteWithID:(int64_t)a3
{
  _xmlNode *mEndnotes;
  _xmlNode *i;

  mEndnotes = self->mEndnotes;
  if (!mEndnotes)
    return 0;
  for (i = OCXFirstChild(mEndnotes); i; i = OCXNextSibling(i))
  {
    if (xmlStrEqual(i->name, (const xmlChar *)"endnote")
      && CXDefaultLongAttribute(i, self->mWXMainNamespace, (xmlChar *)"id", 0) == a3)
    {
      break;
    }
  }
  return i;
}

- (_xmlNode)xmlAnnotationWithID:(int64_t)a3
{
  _xmlNode *mAnnotations;
  _xmlNode *i;

  mAnnotations = self->mAnnotations;
  if (!mAnnotations)
    return 0;
  for (i = OCXFirstChild(mAnnotations); i; i = OCXNextSibling(i))
  {
    if (xmlStrEqual(i->name, (const xmlChar *)"comment")
      && CXDefaultLongAttribute(i, self->mWXMainNamespace, (xmlChar *)"id", 0) == a3)
    {
      break;
    }
  }
  return i;
}

- (_xmlNode)xmlAnnotationExtendedWithParaId:(unsigned int)a3
{
  void *v5;
  _BOOL4 v6;
  _xmlNode *i;
  void *v8;
  BOOL v9;
  unsigned int v12;

  if (!self->mAnnotationsExtended)
    return 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[OCXSTValidator isValidValue:simpleType:](OCXSTValidator, "isValidValue:simpleType:", v5, 10);

  if (!v6)
    return 0;
  for (i = OCXFirstChild(self->mAnnotationsExtended); i; i = OCXNextSibling(i))
  {
    if (xmlStrEqual(i->name, (const xmlChar *)"commentEx"))
    {
      v12 = 0;
      if (CXOptionalUnsignedAttributeFromHex8X(i, (CXNamespace *)WXWord2012Namespace, (xmlChar *)"paraId", &v12))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = +[OCXSTValidator isValidValue:simpleType:](OCXSTValidator, "isValidValue:simpleType:", v8, 10);

        if (v12 == a3 && v9)
          break;
      }
    }
  }
  return i;
}

- (id)packagePart
{
  return self->mPackagePart;
}

- (void)setPackagePart:(id)a3
{
  objc_storeStrong((id *)&self->mPackagePart, a3);
}

- (id)annotationPart
{
  return self->mAnnotationPart;
}

- (void)setAnnotationPart:(id)a3
{
  objc_storeStrong((id *)&self->mAnnotationPart, a3);
}

- (id)annotationExtendedPart
{
  return self->mAnnotationExtendedPart;
}

- (void)setAnnotationExtendedPart:(id)a3
{
  objc_storeStrong((id *)&self->mAnnotationExtendedPart, a3);
}

- (void)setDocumentPart:(id)a3
{
  OCPPackagePart *v5;
  OCPPackagePart *v6;
  void *v7;
  _xmlDoc *v8;
  void *v9;
  _xmlDoc *v10;
  OCPPackagePart *v11;
  OCPPackagePart *mAnnotationPart;
  _xmlDoc *v13;
  OCPPackagePart *v14;
  OCPPackagePart *mAnnotationExtendedPart;
  _xmlDoc *v16;
  OCPPackagePart *v17;

  v5 = (OCPPackagePart *)a3;
  v6 = v5;
  if (self->mPackagePart != v5)
  {
    v17 = v5;
    objc_storeStrong((id *)&self->mPackagePart, a3);
    OCXFirstPartWithRelationshipOfTypeToPartWithFallback(v17, &self->super.super, (objc_selector *)sel_OCXFootnotesRelationshipType);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (_xmlDoc *)objc_msgSend(v7, "xmlDocument");
    self->mFootnoteDocument = v8;
    if (v8)
      self->mFootnotes = OCXGetRootElement(v8);
    OCXFirstPartWithRelationshipOfTypeToPartWithFallback(v17, &self->super.super, (objc_selector *)sel_OCXEndnotesRelationshipType);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (_xmlDoc *)objc_msgSend(v9, "xmlDocument");
    self->mEndnoteDocument = v10;
    if (v10)
      self->mEndnotes = OCXGetRootElement(v10);
    OCXFirstPartWithRelationshipOfTypeToPartWithFallback(v17, &self->super.super, (objc_selector *)sel_OCXCommentsRelationshipType);
    v11 = (OCPPackagePart *)objc_claimAutoreleasedReturnValue();
    mAnnotationPart = self->mAnnotationPart;
    self->mAnnotationPart = v11;

    v13 = -[OCPPackagePart xmlDocument](self->mAnnotationPart, "xmlDocument");
    self->mAnnotationDocument = v13;
    if (v13)
      self->mAnnotations = OCXGetRootElement(v13);
    OCXFirstPartWithRelationshipOfTypeToPartWithFallback(v17, &self->super.super, (objc_selector *)sel_OCXCommentsExtendedRelationshipType);
    v14 = (OCPPackagePart *)objc_claimAutoreleasedReturnValue();
    mAnnotationExtendedPart = self->mAnnotationExtendedPart;
    self->mAnnotationExtendedPart = v14;

    v16 = -[OCPPackagePart xmlDocument](self->mAnnotationExtendedPart, "xmlDocument");
    self->mAnnotationExtendedDocument = v16;
    if (v16)
      self->mAnnotationsExtended = OCXGetRootElement(v16);
    -[OAVReadState setPackagePart:](self->mWXOavState, "setPackagePart:", v17);
    -[OAXDrawingState setPackagePart:](self->mDrawingState, "setPackagePart:", v17);

    v6 = v17;
  }

}

- (id)wxoavState
{
  return self->mWXOavState;
}

- (void)pushDeleteAuthor:(id)a3 date:(id)a4
{
  id v6;
  NSMutableArray *mDeleteAuthorStack;
  id v8;

  v8 = a3;
  v6 = a4;
  mDeleteAuthorStack = self->mDeleteAuthorStack;
  if (mDeleteAuthorStack && self->mDeleteDateStack)
  {
    if (v8)
      -[NSMutableArray addObject:](mDeleteAuthorStack, "addObject:", v8);
    if (v6)
      -[NSMutableArray addObject:](self->mDeleteDateStack, "addObject:", v6);
  }

}

- (void)popDeleteAuthorDate
{
  NSMutableArray *mDeleteAuthorStack;

  mDeleteAuthorStack = self->mDeleteAuthorStack;
  if (mDeleteAuthorStack)
  {
    if (self->mDeleteDateStack)
    {
      -[NSMutableArray removeLastObject](mDeleteAuthorStack, "removeLastObject");
      -[NSMutableArray removeLastObject](self->mDeleteDateStack, "removeLastObject");
    }
  }
}

- (id)currentDeleteAuthor
{
  return (id)-[NSMutableArray lastObject](self->mDeleteAuthorStack, "lastObject");
}

- (id)currentDeleteDate
{
  return (id)-[NSMutableArray lastObject](self->mDeleteDateStack, "lastObject");
}

- (void)pushEditAuthor:(id)a3 date:(id)a4
{
  id v6;
  NSMutableArray *mEditAuthorStack;
  id v8;

  v8 = a3;
  v6 = a4;
  mEditAuthorStack = self->mEditAuthorStack;
  if (mEditAuthorStack && self->mEditDateStack)
  {
    if (v8)
      -[NSMutableArray addObject:](mEditAuthorStack, "addObject:", v8);
    if (v6)
      -[NSMutableArray addObject:](self->mEditDateStack, "addObject:", v6);
  }

}

- (void)popEditAuthorDate
{
  NSMutableArray *mEditAuthorStack;

  mEditAuthorStack = self->mEditAuthorStack;
  if (mEditAuthorStack && self->mEditDateStack)
  {
    if (-[NSMutableArray count](mEditAuthorStack, "count"))
      -[NSMutableArray count](self->mEditDateStack, "count");
    -[NSMutableArray removeLastObject](self->mEditAuthorStack, "removeLastObject");
    -[NSMutableArray removeLastObject](self->mEditDateStack, "removeLastObject");
  }
}

- (id)currentEditAuthor
{
  return (id)-[NSMutableArray lastObject](self->mEditAuthorStack, "lastObject");
}

- (id)currentEditDate
{
  return (id)-[NSMutableArray lastObject](self->mEditDateStack, "lastObject");
}

- (void)pushFormatAuthor:(id)a3 date:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v7)
    -[NSMutableArray addObject:](self->mFormatAuthorStack, "addObject:", v7);
  if (v6)
    -[NSMutableArray addObject:](self->mFormatDateStack, "addObject:", v6);

}

- (void)popFormatAuthorDate
{
  -[NSMutableArray removeLastObject](self->mFormatAuthorStack, "removeLastObject");
  -[NSMutableArray removeLastObject](self->mFormatDateStack, "removeLastObject");
}

- (id)currentFormatAuthor
{
  return (id)-[NSMutableArray lastObject](self->mFormatAuthorStack, "lastObject");
}

- (id)currentFormatDate
{
  return (id)-[NSMutableArray lastObject](self->mFormatDateStack, "lastObject");
}

- (void)addPendingComment:(_xmlNode *)a3
{
  NSMutableArray *mPendingCommentNodes;
  id v4;

  mPendingCommentNodes = self->mPendingCommentNodes;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](mPendingCommentNodes, "addObject:");

}

- (id)pendingComments
{
  return self->mPendingCommentNodes;
}

- (void)clearPendingComments
{
  -[NSMutableArray removeAllObjects](self->mPendingCommentNodes, "removeAllObjects");
}

- (void)addPendingBookmark:(_xmlNode *)a3
{
  xmlNodePtr v4;
  NSMutableArray *mPendingBookmarkNodes;
  id v6;

  v4 = xmlCopyNode(a3, 1);
  mPendingBookmarkNodes = self->mPendingBookmarkNodes;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](mPendingBookmarkNodes, "addObject:");

}

- (id)pendingBookmarks
{
  return self->mPendingBookmarkNodes;
}

- (void)clearPendingBookmarks
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->mPendingBookmarkNodes;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        xmlFreeNode((xmlNodePtr)objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "pointerValue", (_QWORD)v7));
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  -[NSMutableArray removeAllObjects](self->mPendingBookmarkNodes, "removeAllObjects");
}

- (id)drawingState
{
  return self->mDrawingState;
}

- (id)readSymbolTo
{
  return self->mReadSymbolTo;
}

- (void)setReadSymbolTo:(id)a3
{
  objc_storeStrong((id *)&self->mReadSymbolTo, a3);
}

- (BOOL)isNewSectionRequested
{
  return self->mNewSectionRequested;
}

- (void)setNewSectionRequested:(BOOL)a3
{
  self->mNewSectionRequested = a3;
}

- (unint64_t)currentRowCNFStyle
{
  return self->mCurrentRowCNFStyle;
}

- (void)setCurrentRowCNFStyle:(unint64_t)a3
{
  self->mCurrentRowCNFStyle = a3;
}

- (unint64_t)currentCellCNFStyle
{
  return self->mCurrentCellCNFStyle;
}

- (void)setCurrentCellCNFStyle:(unint64_t)a3
{
  self->mCurrentCellCNFStyle = a3;
}

- (void)setCurrentTableWraps:(BOOL)a3
{
  self->mCurrentTableWraps = a3;
}

- (BOOL)currentTableWraps
{
  return self->mCurrentTableWraps;
}

- (void)setupNSForXMLFormat:(int)a3
{
  uint64_t v3;
  CXNamespace *v5;
  CXNamespace *v6;
  CXNamespace *v7;
  CXNamespace *v8;
  CXNamespace *v9;
  CXNamespace *v10;
  CXNamespace *v11;
  CXNamespace *v12;
  CXNamespace *v13;
  CXNamespace *v14;
  void *v15;
  void *v16;
  CXNamespace *v17;
  CXNamespace *v18;
  CXNamespace *v19;
  void *v20;
  void *v21;
  CXNamespace *v22;
  CXNamespace *v23;
  CXNamespace *v24;
  CXNamespace *v25;
  CXNamespace *v26;
  CXNamespace *v27;
  CXNamespace *v28;
  CXNamespace *v29;
  CXNamespace *v30;
  CXNamespace *v31;
  objc_super v32;

  v3 = *(_QWORD *)&a3;
  v32.receiver = self;
  v32.super_class = (Class)WXReadState;
  -[OCXState setupNSForXMLFormat:](&v32, sel_setupNSForXMLFormat_);
  v5 = [CXNamespace alloc];
  v6 = v5;
  if ((_DWORD)v3)
  {
    v7 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/wordprocessingml/2006/main");
    v8 = -[CXNamespace initWithUri:fallbackNamespace:](v6, "initWithUri:fallbackNamespace:", "http://purl.oclc.org/ooxml/wordprocessingml/main", v7);
    -[WXReadState setWXMainNamespace:](self, "setWXMainNamespace:", v8);

    v9 = [CXNamespace alloc];
    v10 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing");
    v11 = -[CXNamespace initWithUri:fallbackNamespace:](v9, "initWithUri:fallbackNamespace:", "http://purl.oclc.org/ooxml/drawingml/wordprocessingDrawing", v10);
    -[WXReadState setWXDrawingNamespace:](self, "setWXDrawingNamespace:", v11);

    v12 = [CXNamespace alloc];
    v13 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing");
    v14 = -[CXNamespace initWithUri:fallbackNamespace:](v12, "initWithUri:fallbackNamespace:", "http://purl.oclc.org/ooxml/drawingml/wordprocessingDrawing", v13);
    -[WXReadState setWXShapeNamespace:](self, "setWXShapeNamespace:", v14);

    -[WXReadState WXShapeNamespace](self, "WXShapeNamespace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fallbackNamespace");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFallbackNamespace:", WXShapeNamespace);

    v17 = [CXNamespace alloc];
    v18 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing");
    v19 = -[CXNamespace initWithUri:fallbackNamespace:](v17, "initWithUri:fallbackNamespace:", "http://purl.oclc.org/ooxml/drawingml/wordprocessingDrawing", v18);
    -[WXReadState setWXGroupNamespace:](self, "setWXGroupNamespace:", v19);

    -[WXReadState WXGroupNamespace](self, "WXGroupNamespace");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fallbackNamespace");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFallbackNamespace:", WXGroupNamespace);

    v22 = [CXNamespace alloc];
    v23 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/officeDocument/2006/bibliography");
    v24 = -[CXNamespace initWithUri:fallbackNamespace:](v22, "initWithUri:fallbackNamespace:", "http://purl.oclc.org/ooxml/officeDocument/bibliography", v23);
    -[WXReadState setWXOOBibliographyNamespace:](self, "setWXOOBibliographyNamespace:", v24);

    v25 = [CXNamespace alloc];
    v26 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/officeDocument/2006/relationships");
    v27 = -[CXNamespace initWithUri:fallbackNamespace:](v25, "initWithUri:fallbackNamespace:", "http://purl.oclc.org/ooxml/officeDocument/relationships", v26);
    -[WXReadState setWXRelationshipNamespace:](self, "setWXRelationshipNamespace:", v27);

  }
  else
  {
    v28 = -[CXNamespace initWithUri:](v5, "initWithUri:", "http://schemas.openxmlformats.org/wordprocessingml/2006/main");
    -[WXReadState setWXMainNamespace:](self, "setWXMainNamespace:", v28);

    v29 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing");
    -[WXReadState setWXDrawingNamespace:](self, "setWXDrawingNamespace:", v29);

    -[WXReadState setWXShapeNamespace:](self, "setWXShapeNamespace:", WXShapeNamespace);
    -[WXReadState setWXGroupNamespace:](self, "setWXGroupNamespace:", WXGroupNamespace);
    v30 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing");
    -[WXReadState setWXDrawingNamespace:](self, "setWXDrawingNamespace:", v30);

    v31 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/officeDocument/2006/bibliography");
    -[WXReadState setWXOOBibliographyNamespace:](self, "setWXOOBibliographyNamespace:", v31);

    v26 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/officeDocument/2006/relationships");
    -[WXReadState setWXRelationshipNamespace:](self, "setWXRelationshipNamespace:", v26);
  }

  -[OAXDrawingState setupNSForXMLFormat:](self->mDrawingState, "setupNSForXMLFormat:", v3);
  -[OCXState setupNSForXMLFormat:](self->mWXOavState, "setupNSForXMLFormat:", v3);
}

- (void)setIsThumbnail:(BOOL)a3
{
  self->mIsThumbnail = a3;
}

- (BOOL)isThumbnail
{
  return self->mIsThumbnail;
}

- (CXNamespace)WXMainNamespace
{
  return self->mWXMainNamespace;
}

- (void)setWXMainNamespace:(id)a3
{
  objc_storeStrong((id *)&self->mWXMainNamespace, a3);
}

- (CXNamespace)WXDrawingNamespace
{
  return self->mWXDrawingNamespace;
}

- (void)setWXDrawingNamespace:(id)a3
{
  objc_storeStrong((id *)&self->mWXDrawingNamespace, a3);
}

- (CXNamespace)WXShapeNamespace
{
  return self->mWXShapeNamespace;
}

- (void)setWXShapeNamespace:(id)a3
{
  objc_storeStrong((id *)&self->mWXShapeNamespace, a3);
}

- (CXNamespace)WXGroupNamespace
{
  return self->mWXGroupNamespace;
}

- (void)setWXGroupNamespace:(id)a3
{
  objc_storeStrong((id *)&self->mWXGroupNamespace, a3);
}

- (CXNamespace)WXOOBibliographyNamespace
{
  return self->mWXOOBibliographyNamespace;
}

- (void)setWXOOBibliographyNamespace:(id)a3
{
  objc_storeStrong((id *)&self->mWXOOBibliographyNamespace, a3);
}

- (CXNamespace)WXRelationshipNamespace
{
  return self->mWXRelationshipNamespace;
}

- (void)setWXRelationshipNamespace:(id)a3
{
  objc_storeStrong((id *)&self->mWXRelationshipNamespace, a3);
}

- (BOOL)readingMath
{
  return self->mReadingMath;
}

- (void)setReadingMath:(BOOL)a3
{
  self->mReadingMath = a3;
}

- (int)currentOfficeArtTextType
{
  return self->mCurrentOfficeArtTextType;
}

- (void)setCurrentOfficeArtTextType:(int)a3
{
  self->mCurrentOfficeArtTextType = a3;
}

- (TCCancelDelegate)cancelDelegate
{
  return self->mCancelDelegate;
}

- (void)setCancelDelegate:(id)a3
{
  objc_storeStrong((id *)&self->mCancelDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mWXRelationshipNamespace, 0);
  objc_storeStrong((id *)&self->mWXOOBibliographyNamespace, 0);
  objc_storeStrong((id *)&self->mWXGroupNamespace, 0);
  objc_storeStrong((id *)&self->mWXShapeNamespace, 0);
  objc_storeStrong((id *)&self->mWXDrawingNamespace, 0);
  objc_storeStrong((id *)&self->mWXMainNamespace, 0);
  objc_storeStrong((id *)&self->mCancelDelegate, 0);
  objc_storeStrong((id *)&self->mReadSymbolTo, 0);
  objc_storeStrong((id *)&self->mDrawingState, 0);
  objc_storeStrong((id *)&self->mWXOavState, 0);
  objc_storeStrong((id *)&self->mPendingBookmarkNodes, 0);
  objc_storeStrong((id *)&self->mPendingCommentNodes, 0);
  objc_storeStrong((id *)&self->mFormatDateStack, 0);
  objc_storeStrong((id *)&self->mFormatAuthorStack, 0);
  objc_storeStrong((id *)&self->mEditDateStack, 0);
  objc_storeStrong((id *)&self->mEditAuthorStack, 0);
  objc_storeStrong((id *)&self->mDeleteDateStack, 0);
  objc_storeStrong((id *)&self->mDeleteAuthorStack, 0);
  objc_storeStrong((id *)&self->mAnnotationExtendedPart, 0);
  objc_storeStrong((id *)&self->mAnnotationPart, 0);
  objc_storeStrong((id *)&self->mPackagePart, 0);
  objc_storeStrong((id *)&self->mMapFlowIdToTextBox, 0);
  objc_storeStrong((id *)&self->mMapAnnotationParaIdToAnnotation, 0);
  objc_storeStrong((id *)&self->mMapAnnotationIdToAnnotation, 0);
  objc_storeStrong((id *)&self->mMapBookmarkIdToName, 0);
  objc_storeStrong((id *)&self->mTextNodesToBeAdded, 0);
  objc_storeStrong((id *)&self->mDocument, 0);
}

@end
