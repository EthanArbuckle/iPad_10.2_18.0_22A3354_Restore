@implementation EMWorkbookMapper

- (void)setFileName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void)startMappingWithState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  self->mHasPushedHeader = 0;
  self->mIsFirstMappedSheet = 1;
  if (-[EMWorkbookMapper hasMultipleSheets](self, "hasMultipleSheets"))
    self->mTabPosition = 0.0;
  -[CMMapper document](self, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseStyles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorScheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setColorScheme:", v7);

  objc_msgSend(v4, "resources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setResources:", v8);

}

- (BOOL)hasMultipleSheets
{
  if (self->mRealSheetCount < 2)
    return 0;
  else
    return !-[CMArchiveManager isThumbnail](self->super.super.mArchiver, "isThumbnail");
}

- (void)mapElement:(id)a3 atIndex:(unint64_t)a4 withState:(id)a5 isLastElement:(BOOL)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSMutableArray *mSheetURLs;
  void *v17;
  CMArchiveManager *mArchiver;
  void *v19;
  id v20;
  id v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  v10 = a5;
  if ((objc_msgSend(v31, "isHidden") & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      && !-[CMArchiveManager isCancelled](self->super.super.mArchiver, "isCancelled"))
    {
      v11 = (void *)MEMORY[0x22E2DDB58]();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMWorkbookMapper.mm"), 436, CFSTR("Expected a EMState"));

      }
      v12 = v10;
      objc_msgSend(v12, "setCurrentSheet:", v31);
      v13 = -[EMWorkbookMapper copySheetMapperWithEdSheet:](self, "copySheetMapperWithEdSheet:", v31);
      if (v13)
      {
        objc_msgSend(v31, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "string");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableArray addObject:](self->mWorksheetNames, "addObject:", v15);
        if (self->mIsFirstMappedSheet)
        {
          -[CMArchiveManager pushText:toPath:](self->super.super.mArchiver, "pushText:toPath:", &stru_24F3BFFF8, 0);
          -[CMArchiveManager commitDataAtPath:](self->super.super.mArchiver, "commitDataAtPath:", 0);
          self->mIsFirstMappedSheet = 0;
        }
        if (-[EMWorkbookMapper hasMultipleSheets](self, "hasMultipleSheets"))
        {
          while (-[NSMutableArray count](self->mSheetURLs, "count") < a4)
          {
            mSheetURLs = self->mSheetURLs;
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](mSheetURLs, "addObject:", v17);

          }
          mArchiver = self->super.super.mArchiver;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Sheet%lu.html"), a4);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[CMArchiveManager copyResourceWithName:type:](mArchiver, "copyResourceWithName:type:", v19, 10);

          if (v20)
            -[NSMutableArray addObject:](self->mSheetURLs, "addObject:", v20);
          else
            NSLog((NSString *)CFSTR("Could not create URL for sheet %lu"), a4);

        }
        v21 = -[EMWorkbookMapper _copyStringForSheet:atIndex:withState:andMapper:](self, "_copyStringForSheet:atIndex:withState:andMapper:", v31, a4, v12, v13);
        if (-[CMArchiveManager isThumbnail](self->super.super.mArchiver, "isThumbnail"))
        {
          objc_msgSend(v13, "adjustedSize");
          v23 = v22;
          -[CMArchiveManager setHTMLWidth:](self->super.super.mArchiver, "setHTMLWidth:", (int)v24);
          -[CMArchiveManager setHTMLHeight:](self->super.super.mArchiver, "setHTMLHeight:", (int)v23);
        }
        if (v21)
        {
          if (-[EMWorkbookMapper hasMultipleSheets](self, "hasMultipleSheets"))
          {
            -[NSMutableArray objectAtIndex:](self->mSheetURLs, "objectAtIndex:", a4);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (!self->mHasPushedHeader)
            {
              v30 = v15;
              self->mHasPushedHeader = 1;
              -[EMWorkbookMapper _frontPageByCopyingMainPage](self, "_frontPageByCopyingMainPage");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[CMArchiveManager pushText:toPath:](self->super.super.mArchiver, "pushText:toPath:", v26, 0);

              v15 = v30;
            }
            -[EMWorkbookMapper _pushTabForSheet:atIndex:](self, "_pushTabForSheet:atIndex:", v31, a4);
            -[CMArchiveManager pushText:toPath:](self->super.super.mArchiver, "pushText:toPath:", v21, v25);
            -[CMArchiveManager commitDataAtPath:](self->super.super.mArchiver, "commitDataAtPath:", v25);
            -[CMArchiveManager closeResourceAtPath:](self->super.super.mArchiver, "closeResourceAtPath:", v25);
            ++self->mNumberOfMappedSheets;
            if (!self->mHasPushedFirstSheet)
            {
              self->mHasPushedFirstSheet = 1;
              objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "activeProcessorCount");

              if (v28 == 1)
                sleep(2u);
            }

          }
          else
          {
            -[CMArchiveManager pushText:toPath:](self->super.super.mArchiver, "pushText:toPath:", v21, 0);
            -[CMArchiveManager commitDataAtPath:](self->super.super.mArchiver, "commitDataAtPath:", 0);
            -[CMArchiveManager closeResourceAtPath:](self->super.super.mArchiver, "closeResourceAtPath:", 0);
          }
        }
        else
        {
          ++self->mSheetIndex;
        }

      }
      objc_autoreleasePoolPop(v11);
    }
  }

}

- (id)copySheetMapperWithEdSheet:(id)a3
{
  id v4;
  EMChartsheetMapper *v5;
  EMChartsheetMapper *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isHidden") & 1) != 0)
    goto LABEL_2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[EMChartsheetMapper initWithChartSheet:parent:]([EMChartsheetMapper alloc], "initWithChartSheet:parent:", v4, self);
LABEL_7:
    v5 = v6;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[EMWorksheetMapper initWithEDWorksheet:parent:]([EMWorksheetMapper alloc], "initWithEDWorksheet:parent:", v4, self);
    goto LABEL_7;
  }
LABEL_2:
  v5 = 0;
LABEL_8:

  return v5;
}

- (id)_copyStringForSheet:(id)a3 atIndex:(unint64_t)a4 withState:(id)a5 andMapper:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v8 = a5;
  v9 = a6;
  v10 = +[CMXmlUtils copyXhtmlDocument](CMXmlUtils, "copyXhtmlDocument");
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mapAt:withState:", v11, v8);
  v12 = objc_msgSend(v9, "width");
  if (v12 > self->mWidth)
    self->mWidth = v12;
  v13 = objc_msgSend(v9, "height");
  if (v13 > self->mHeight)
    self->mHeight = v13;
  -[EMWorkbookMapper archiver](self, "archiver");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cssStylesheetString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[EMWorkbookMapper documentTitle](self, "documentTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[CMXmlUtils copyHeadElementWithTitle:](CMXmlUtils, "copyHeadElementWithTitle:", v16);

  -[EMWorkbookMapper mapStylesheetNamed:atElement:](self, "mapStylesheetNamed:atElement:", CFSTR("spreadsheet"), v17);
  -[EMWorkbookMapper mapStylesheetNamed:atElement:](self, "mapStylesheetNamed:atElement:", CFSTR("spreadsheet-ios"), v17);
  v22.receiver = self;
  v22.super_class = (Class)EMWorkbookMapper;
  -[CMMapper mapStylesheetAt:stylesheet:](&v22, sel_mapStylesheetAt_stylesheet_, v17, v15);
  objc_msgSend(v10, "rootElement");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addChild:", v17);

  objc_msgSend(v10, "rootElement");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addChild:", v11);

  objc_msgSend(v10, "XMLString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)archiver
{
  return self->super.super.mArchiver;
}

- (id)documentTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  -[CMMapper document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "summary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && objc_msgSend(v6, "length"))
    {
      v7 = v6;
      goto LABEL_9;
    }
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v3, "workbookName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || !objc_msgSend(v8, "length"))
  {
    -[EMWorkbookMapper fileName](self, "fileName");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v7 = v8;
LABEL_9:
  v8 = v7;
LABEL_11:
  v9 = v7;

  return v9;
}

- (NSString)fileName
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)finishMappingWithState:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMWorkbookMapper.mm"), 536, CFSTR("Expected a EMState"));

  }
  v8 = v5;
  objc_msgSend(v8, "setCurrentSheet:", 0);
  if (-[EMWorkbookMapper hasMultipleSheets](self, "hasMultipleSheets"))
  {
    -[EMWorkbookMapper _mainPageBack](self, "_mainPageBack");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMArchiveManager pushText:toPath:](self->super.super.mArchiver, "pushText:toPath:", v6, 0);
    -[CMArchiveManager commitDataAtPath:](self->super.super.mArchiver, "commitDataAtPath:", 0);
    -[CMArchiveManager closeResourceAtPath:](self->super.super.mArchiver, "closeResourceAtPath:", 0);

  }
}

+ (id)borderStyleCache
{
  return +[CMGlobalCache borderStyleCache](CMGlobalCache, "borderStyleCache");
}

+ (id)borderWidthCache
{
  return +[CMGlobalCache borderWidthCache](CMGlobalCache, "borderWidthCache");
}

- (id)_frontPageByCopyingMainPage
{
  OIXMLDocument *v3;
  OIXMLDocument *mXhtmlDoc;
  void *v5;
  OIXMLElement *v6;
  OIXMLElement *mBodyElement;
  OIXMLElement *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  BOOL v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = +[CMXmlUtils copyXhtmlDocument](CMXmlUtils, "copyXhtmlDocument");
  mXhtmlDoc = self->mXhtmlDoc;
  self->mXhtmlDoc = v3;

  -[EMWorkbookMapper headElementForFrontPage](self, "headElementForFrontPage");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[OIXMLDocument rootElement](self->mXhtmlDoc, "rootElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addChild:", v36);

  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 1);
  v6 = (OIXMLElement *)objc_claimAutoreleasedReturnValue();
  mBodyElement = self->mBodyElement;
  self->mBodyElement = v6;

  v8 = self->mBodyElement;
  v9 = (void *)MEMORY[0x24BDD17C8];
  -[NSMutableArray objectAtIndex:](self->mSheetURLs, "objectAtIndex:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("javascript:ReloadFirstSheetIfNeeded('%@')"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("onload"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[OIXMLElement addAttribute:](v8, "addAttribute:", v12);

  -[OIXMLDocument rootElement](self->mXhtmlDoc, "rootElement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addChild:", self->mBodyElement);

  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("id"), CFSTR("wrapper"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addAttribute:", v14);

  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("style"), CFSTR("position:absolute; top:40; left:0; right:0; "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addAttribute:", v15);

  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("id"), CFSTR("SheetFrame"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAttribute:", v17);

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v18 = self->mSheetURLs;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v39;
LABEL_3:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v39 != v20)
        objc_enumerationMutation(v18);
      v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v21);
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v22 == v23;

      if (!v24)
        break;
      if (v19 == ++v21)
      {
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v19)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v25 = v22;

    v26 = v25;
    if (v25)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  v26 = &stru_24F3BFFF8;
LABEL_12:
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("src"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAttribute:", v27);

  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("style"), CFSTR("border:0; width:100%; height:100%;"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAttribute:", v28);

  objc_msgSend(v37, "addChild:", v16);
  -[OIXMLElement addChild:](self->mBodyElement, "addChild:", v37);
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[OIXMLDocument rootElement](self->mXhtmlDoc, "rootElement");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "openingTagString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "appendString:", v31);

  objc_msgSend(v36, "XMLString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "appendString:", v32);

  -[OIXMLElement openingTagString](self->mBodyElement, "openingTagString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "appendString:", v33);

  objc_msgSend(v37, "XMLString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "appendString:", v34);

  return v29;
}

- (id)blipAtIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  -[CMMapper document](self, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blips");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blipAtIndex:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_mainPageBack
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OIXMLElement closingTagString](self->mBodyElement, "closingTagString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  -[OIXMLDocument rootElement](self->mXhtmlDoc, "rootElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "closingTagString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  return v3;
}

- (EMWorkbookMapper)initWithDocument:(id)a3 archiver:(id)a4
{
  id v6;
  id v7;
  id v8;
  EMWorkbookMapper *v9;
  EMWorkbookMapper *v10;
  NSMutableArray *v11;
  NSMutableArray *mWorksheetGuids;
  NSMutableArray *v13;
  NSMutableArray *mWorksheetUrls;
  NSMutableArray *v15;
  NSMutableArray *mWorksheetNames;
  NSMutableArray *v17;
  NSMutableArray *mSheetURLs;
  NSString *mResourceUrlPrefix;
  NSString *mStyleSheetGuid;
  uint64_t v21;
  uint64_t i;
  void *v23;
  EMWorkbookMapper *v24;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    v26.receiver = self;
    v26.super_class = (Class)EMWorkbookMapper;
    v9 = -[CMDocumentMapper initWithDocument:archiver:](&v26, sel_initWithDocument_archiver_, v8, v7);
    v10 = v9;
    if (v9)
    {
      v9->mWidth = 0;
      v9->mHeight = 0;
      v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      mWorksheetGuids = v10->mWorksheetGuids;
      v10->mWorksheetGuids = v11;

      v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      mWorksheetUrls = v10->mWorksheetUrls;
      v10->mWorksheetUrls = v13;

      v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      mWorksheetNames = v10->mWorksheetNames;
      v10->mWorksheetNames = v15;

      v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      mSheetURLs = v10->mSheetURLs;
      v10->mSheetURLs = v17;

      mResourceUrlPrefix = v10->mResourceUrlPrefix;
      v10->mResourceUrlPrefix = (NSString *)&stru_24F3BFFF8;

      mStyleSheetGuid = v10->mStyleSheetGuid;
      v10->mStyleSheetGuid = (NSString *)&stru_24F3BFFF8;

      v10->mRealSheetCount = 0;
      v21 = objc_msgSend(v8, "sheetCount");
      if (v21 >= 1)
      {
        for (i = 0; i != v21; ++i)
        {
          objc_msgSend(v8, "sheetAtIndex:loadIfNeeded:", i, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v23, "isHidden") & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              ++v10->mRealSheetCount;
          }

        }
      }
    }
    self = v10;

    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (id)cssStyleCache
{
  return +[CMGlobalCache cssStylesheetCache](CMGlobalCache, "cssStylesheetCache");
}

- (id)styleMatrix
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CMMapper document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "baseStyles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "styleMatrix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CGSize)pageSizeForDevice
{
  int mWidth;
  double mHeight;
  double v4;
  double v5;
  CGSize result;

  mWidth = self->mWidth;
  mHeight = (double)self->mHeight;
  if (-[EMWorkbookMapper hasMultipleSheets](self, "hasMultipleSheets"))
    v4 = mHeight + 40.0;
  else
    v4 = mHeight;
  v5 = (double)mWidth;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)mapStylesheetData:(id)a3 name:(id)a4 atElement:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a5;
  -[CMArchiveManager addResource:withName:type:](self->super.super.mArchiver, "addResource:withName:type:", a3, a4, 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("href"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAttribute:", v10);

  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("rel"), CFSTR("stylesheet"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAttribute:", v11);

  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("type"), CFSTR("text/css"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAttribute:", v12);

  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("charset"), CFSTR("utf-8"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAttribute:", v13);

  objc_msgSend(v14, "addChild:", v9);
}

- (void)mapStylesheetNamed:(id)a3 atElement:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLForResource:withExtension:", v11, CFSTR("css"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathExtension:", CFSTR("css"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMWorkbookMapper mapStylesheetData:name:atElement:](self, "mapStylesheetData:name:atElement:", v9, v10, v6);

}

- (id)headElementForFrontPage
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  -[EMWorkbookMapper documentTitle](self, "documentTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[CMXmlUtils copyHeadElementWithTitle:](CMXmlUtils, "copyHeadElementWithTitle:", v3);

  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("http-equiv"), CFSTR("Content-Type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAttribute:", v6);

  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("content"), CFSTR("text/html; charset=utf-8"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAttribute:", v7);

  objc_msgSend(v4, "addChild:", v5);
  v8 = (void *)MEMORY[0x24BDBCE50];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pathForResource:ofType:", CFSTR("TabViewPhone"), CFSTR("js"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataWithContentsOfFile:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CMArchiveManager addResource:withName:type:](self->super.super.mArchiver, "addResource:withName:type:", v11, CFSTR("Tabs.js"), 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("src"), v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAttribute:", v14);

  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("charset"), CFSTR("utf-8"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAttribute:", v15);

  objc_msgSend(v4, "addChild:", v13);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pathForResource:ofType:", CFSTR("TabViewPurple"), CFSTR("css"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithContentsOfFile:encoding:error:", v17, 4, 0);
  objc_msgSend(v18, "dataUsingEncoding:", 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMWorkbookMapper mapStylesheetData:name:atElement:](self, "mapStylesheetData:name:atElement:", v19, CFSTR("Tabs.css"), v4);

  return v4;
}

- (id)tabTitleDrawingAttributes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10 = *MEMORY[0x24BDF7740];
  v11[0] = CFSTR("Arial");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A78], "fontDescriptorWithFontAttributes:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v3, "symbolicTraits") | 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v4, 18.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 18.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = *MEMORY[0x24BDF65F8];
  v9 = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_pushTabForSheet:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  CMArchiveManager *mArchiver;
  void *v24;
  id v25;

  v25 = a3;
  objc_msgSend(v25, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[OIXMLElement elementWithType:stringValue:](OIXMLElement, "elementWithType:stringValue:", 3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD17C8];
  -[NSMutableArray objectAtIndex:](self->mSheetURLs, "objectAtIndex:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("javascript:SelectSheet(%lu, '%@')"), a4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("onclick"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAttribute:", v12);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Tab%lu"), a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("id"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAttribute:", v14);

  v15 = &stru_24F3BFFF8;
  if (!a4)
    v15 = CFSTR(" selected");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TabView%@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("class"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAttribute:", v17);

  -[EMWorkbookMapper tabTitleDrawingAttributes](self, "tabTitleDrawingAttributes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeWithAttributes:", v18);
  v20 = v19 + 40.0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("position:absolute; overflow:hidden;  top:0; left:%d; width:%d; height:38;"),
    (int)self->mTabPosition,
    (int)(v19 + 40.0));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("style"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAttribute:", v22);

  self->mTabPosition = v20 + self->mTabPosition;
  mArchiver = self->super.super.mArchiver;
  objc_msgSend(v8, "XMLString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMArchiveManager pushText:toPath:](mArchiver, "pushText:toPath:", v24, 0);

}

- (void)setElementCount:(unint64_t)a3
{
  self->mRealSheetCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSheetURLs, 0);
  objc_storeStrong((id *)&self->mTabBarURL, 0);
  objc_storeStrong((id *)&self->mTabBarDoc, 0);
  objc_storeStrong((id *)&self->mBodyElement, 0);
  objc_storeStrong((id *)&self->mXhtmlDoc, 0);
  objc_storeStrong((id *)&self->mFileName, 0);
  objc_storeStrong((id *)&self->mStyleSheetGuid, 0);
  objc_storeStrong((id *)&self->mResourceUrlProtocol, 0);
  objc_storeStrong((id *)&self->mResourceUrlPrefix, 0);
  objc_storeStrong((id *)&self->mWorksheetGuids, 0);
  objc_storeStrong((id *)&self->mWorksheetNames, 0);
  objc_storeStrong((id *)&self->mWorksheetUrls, 0);
}

@end
