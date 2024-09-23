@implementation THDocumentRoot

- (NSManagedObjectContext)moc
{
  return self->mMOC;
}

- (THModelNode)rootNode
{
  return self->mRootNode;
}

- (void)setRootNode:(id)a3
{
  id v5;

  -[THDocumentRoot willModify](self, "willModify");
  v5 = a3;

  self->mRootNode = (THModelNode *)a3;
}

- (THDocumentProperties)properties
{
  return self->mProperties;
}

- (void)setProperties:(id)a3
{
  id v5;

  -[THDocumentRoot willModify](self, "willModify");
  v5 = a3;

  self->mProperties = (THDocumentProperties *)a3;
}

- (NSString)applePubDocId
{
  return self->mApplePubDocId;
}

- (void)setApplePubDocId:(id)a3
{
  NSString *v5;

  -[THDocumentRoot willModify](self, "willModify");
  v5 = (NSString *)objc_msgSend(a3, "copy");

  self->mApplePubDocId = v5;
}

- (THTOCModel)tocModel
{
  return self->mTOCModel;
}

- (void)setTocModel:(id)a3
{
  id v5;

  -[THDocumentRoot willModify](self, "willModify");
  v5 = a3;

  self->mTOCModel = (THTOCModel *)a3;
}

- (id)searchModel
{
  return self->mSearchModel;
}

- (void)setSearchModel:(id)a3
{
  id v5;

  -[THDocumentRoot willModify](self, "willModify");
  v5 = a3;

  self->mSearchModel = (THSearchModel *)a3;
}

- (NSURL)zipPackage
{
  return self->mZipPackage;
}

- (void)setZipPackage:(id)a3
{
  id v5;

  -[THDocumentRoot willModify](self, "willModify");
  v5 = a3;

  self->mZipPackage = (NSURL *)a3;
}

- (THModelGlossary)glossary
{
  return self->mGlossary;
}

- (void)setGlossary:(id)a3
{
  id v5;

  -[THDocumentRoot willModify](self, "willModify");
  v5 = a3;

  self->mGlossary = (THModelGlossary *)a3;
}

- (THModelSearchIndex)searchIndex
{
  return self->mSearchIndex;
}

- (void)setSearchIndex:(id)a3
{
  id v5;

  -[THDocumentRoot willModify](self, "willModify");
  v5 = a3;

  self->mSearchIndex = (THModelSearchIndex *)a3;
}

- (THAnnotationSearchIndex)annotationSearchIndex
{
  return self->mAnnotationSearchIndex;
}

- (void)setAnnotationSearchIndex:(id)a3
{
  id v5;

  -[THDocumentRoot willModify](self, "willModify");
  v5 = a3;

  self->mAnnotationSearchIndex = (THAnnotationSearchIndex *)a3;
}

- (BOOL)isEPUB
{
  return -[THBookDescription isEpub](self->mBookDescription, "isEpub");
}

+ (void)p_populateParagraphStyle:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1DFC4;
  v3[3] = &unk_427480;
  v3[4] = a3;
  objc_msgSend(+[TSWPParagraphStyle properties](TSWPParagraphStyle, "properties"), "enumeratePropertiesUsingBlock:", v3);
}

- (THDocumentRoot)initWithContext:(id)a3
{
  THDocumentRoot *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THDocumentRoot;
  v3 = -[THDocumentRoot initWithContext:](&v9, "initWithContext:", a3);
  if (v3)
  {
    v3->mStylesheet = (TSSStylesheet *)objc_msgSend(objc_alloc((Class)TSSStylesheet), "initWithContext:canCullStyles:", -[THDocumentRoot context](v3, "context"), 0);
    v4 = +[TSWPParagraphStyle defaultStyleWithContext:](TSWPParagraphStyle, "defaultStyleWithContext:", -[THDocumentRoot context](v3, "context"));
    objc_msgSend((id)objc_opt_class(v3, v5), "p_populateParagraphStyle:", v4);
    -[TSSStylesheet addStyle:withIdentifier:](v3->mStylesheet, "addStyle:withIdentifier:", v4, TSWPDefaultParagraphStyleIdentifier);
    v6 = +[TSWPListStyle defaultStyleWithContext:](TSWPListStyle, "defaultStyleWithContext:", -[THDocumentRoot context](v3, "context"));
    -[TSSStylesheet addStyle:withIdentifier:](v3->mStylesheet, "addStyle:withIdentifier:", v6, TSWPDefaultListStyleIdentifier);
    v7 = +[TSWPColumnStyle defaultStyleWithContext:](TSWPColumnStyle, "defaultStyleWithContext:", -[THDocumentRoot context](v3, "context"));
    -[TSSStylesheet addStyle:withIdentifier:](v3->mStylesheet, "addStyle:withIdentifier:", v7, TSWPDefaultColumnStyleIdentifier);
    +[TSTTableStyleNetwork createStylesInStylesheet:presetIndex:colors:alternate:](TSTTableStyleNetwork, "createStylesInStylesheet:presetIndex:colors:alternate:", v3->mStylesheet, 0, 0, 0);
    v3->mProperties = -[THDocumentProperties initWithContext:]([THDocumentProperties alloc], "initWithContext:", -[THDocumentRoot context](v3, "context"));
    v3->mTOCModel = -[THTOCModel initWithContext:]([THTOCModel alloc], "initWithContext:", -[THDocumentRoot context](v3, "context"));
    v3->mSearchModel = -[THSearchModel initWithContext:]([THSearchModel alloc], "initWithContext:", -[THDocumentRoot context](v3, "context"));
    v3->mApplePubDocId = (NSString *)CFSTR("0/0/0");
    v3->mLibraryDatabaseKey = (NSString *)&stru_43D7D8;
    v3->mCancelled = 0;
    v3->mBackgroundReaderCount = 0;
    v3->mGlossary = -[THModelGlossary initWithContext:documentRoot:]([THModelGlossary alloc], "initWithContext:documentRoot:", -[THDocumentRoot context](v3, "context"), v3);
    v3->mSearchIndex = -[THSearchIndex initWithContext:]([THModelSearchIndex alloc], "initWithContext:", -[THDocumentRoot context](v3, "context"));
    v3->mAnnotationSearchIndex = -[THSearchIndex initWithContext:]([THAnnotationSearchIndex alloc], "initWithContext:", -[THDocumentRoot context](v3, "context"));
    v3->mEquationEnvironment = 0;
    -[THDocumentRoot p_initializeFields](v3, "p_initializeFields");
    v3->_pagespotHistory = objc_alloc_init(THPageSpotHistory);
  }
  return v3;
}

- (void)teardown
{
  _xmlDoc *mOpfXmlDoc;

  -[THSearchController documentWillDealloc](-[THDocumentRoot searchController](self, "searchController"), "documentWillDealloc");
  -[THDocumentRoot setNavigationModel:](self, "setNavigationModel:", 0);
  -[THDocumentRoot setTetheringConnection:](self, "setTetheringConnection:", 0);
  -[THDocumentRoot setAnnotationController:](self, "setAnnotationController:", 0);
  -[THPageSpotHistory setDelegate:](self->_pagespotHistory, "setDelegate:", 0);

  self->_pagespotHistory = 0;
  self->_themeProvider = 0;

  self->mRootNode = 0;
  self->mProperties = 0;

  self->mStylesheet = 0;
  self->mTOCModel = 0;

  self->mSearchModel = 0;
  self->mLibraryDatabaseKey = 0;

  self->mStoreItemID = 0;
  self->mBackgroundReaderCountCondition = 0;

  self->mBookDescription = 0;
  self->mBookCoverDescription = 0;

  self->mZipPackage = 0;
  self->mGlossary = 0;

  self->mSearchIndex = 0;
  self->mAnnotationSearchIndex = 0;

  self->mEquationEnvironment = 0;
  self->mContentLoadOperationQueue = 0;

  self->mBookUserDefaults = 0;
  self->mSuppliedAnnotationProvider = 0;
  if (-[NSManagedObjectContext hasChanges](-[THDocumentRoot moc](self, "moc"), "hasChanges"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot teardown]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm"), 206, CFSTR("User Data managed object context has uncommitted changes."));

  self->mMOC = 0;
  self->mUserDataManager = 0;

  self->mGlossaryController = 0;
  self->mSearchController = 0;
  mOpfXmlDoc = self->mOpfXmlDoc;
  if (mOpfXmlDoc)
  {
    xmlFreeDoc(mOpfXmlDoc);
    self->mOpfXmlDoc = 0;
  }
}

- (void)dealloc
{
  objc_super v3;

  -[THDocumentRoot teardown](self, "teardown");
  v3.receiver = self;
  v3.super_class = (Class)THDocumentRoot;
  -[THDocumentRoot dealloc](&v3, "dealloc");
}

- (void)p_initializeFields
{
  self->mBackgroundReaderCountCondition = (NSCondition *)objc_alloc_init((Class)NSCondition);
  self->mContentLoadOperationQueue = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
}

- (unint64_t)writingDirection
{
  return 1;
}

- (id)theme
{
  return 0;
}

- (TSSStylesheet)stylesheet
{
  return self->mStylesheet;
}

- (void)willClose
{
  THSearchController *v3;
  objc_super v4;

  self->mClosing = 1;
  -[THAnnotationStorageController teardown](-[THDocumentRoot annotationController](self, "annotationController"), "teardown");
  -[THDocumentRoot setAnnotationController:](self, "setAnnotationController:", 0);
  v3 = -[THDocumentRoot searchController](self, "searchController");
  if (!-[THSearchController indexLoaded](v3, "indexLoaded"))
    -[THSearchController cancelLoadIndex](v3, "cancelLoadIndex");
  -[NSOperationQueue cancelAllOperations](self->mContentLoadOperationQueue, "cancelAllOperations");
  -[NSOperationQueue waitUntilAllOperationsAreFinished](self->mContentLoadOperationQueue, "waitUntilAllOperationsAreFinished");
  +[THWWebRep enumerateSubdomainsOfHost:usingBlock:](THWWebRep, "enumerateSubdomainsOfHost:usingBlock:", -[THBookDescription annotationID](-[THDocumentRoot bookDescription](self, "bookDescription"), "annotationID"), &stru_4274C0);
  +[PFDURLProtocol unregisterHost:](PFDURLProtocol, "unregisterHost:", -[THBookDescription annotationID](-[THDocumentRoot bookDescription](self, "bookDescription"), "annotationID"));
  -[PFDContextManager removeContextForArchive:](+[PFDContextManager sharedInstance](PFDContextManager, "sharedInstance"), "removeContextForArchive:", -[NSURL path](-[THDocumentRoot zipPackage](self, "zipPackage"), "path"));
  v4.receiver = self;
  v4.super_class = (Class)THDocumentRoot;
  -[THDocumentRoot willClose](&v4, "willClose");
}

- (BOOL)shouldHyphenate
{
  return -[THBookDescription autoHyphenate](self->mBookDescription, "autoHyphenate");
}

- (THBookspotHistoryStack)bookspotHistoryStack
{
  return (THBookspotHistoryStack *)self->_pagespotHistory;
}

- (void)resetWithDictionaryRepresentation:(id)a3
{
  -[THPageSpotHistory resetWithDictionaryRepresentation:](self->_pagespotHistory, "resetWithDictionaryRepresentation:", a3);
}

- (unint64_t)absolutePageIndexForStorageAnchor:(id)a3
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  if (!a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = objc_msgSend(a3, "contentNode");
  if (-[THDocumentRoot reflowablePaginationController](self, "reflowablePaginationController"))
  {
    v6 = -[THReflowablePaginationController paginationResultForContentNode:](-[THDocumentRoot reflowablePaginationController](self, "reflowablePaginationController"), "paginationResultForContentNode:", v5);
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    if (v6)
    {
      v8 = v6;
      if (objc_msgSend(v6, "firstPageIndex") != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v9 = objc_msgSend(v8, "relativePageIndexForStorageAnchor:", a3);
        v10 = objc_msgSend(v8, "firstPageIndex");
        if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
          v11 = 0;
        else
          v11 = v9;
        return (unint64_t)v11 + (_QWORD)v10;
      }
    }
    return v7;
  }
  v12 = +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THDocumentRoot context](self, "context"));
  v14 = objc_opt_class(TSWPStorage, v13);
  v15 = objc_msgSend(v5, "relativePageIndexForCharacterIndex:forInfo:", objc_msgSend(a3, "range"), TSUDynamicCast(v14, objc_msgSend(v5, "infoForNodeUniqueID:forPresentationType:", objc_msgSend(a3, "storageUID"), v12)));
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
    return v7;
  return (unint64_t)objc_msgSend(v5, "absolutePageIndexForRelativePageIndex:forPresentationType:", v15, v12);
}

- (unint64_t)absolutePageIndexForLocation:(id)a3
{
  id v5;

  v5 = objc_msgSend(a3, "pageIndex");
  if (-[THBookDescription isEpub](-[THDocumentRoot bookDescription](self, "bookDescription"), "isEpub"))
    return -[THDocumentRoot absolutePageIndexForStorageAnchor:](self, "absolutePageIndexForStorageAnchor:", +[THModelStorageAnchor storageAnchorWithContentNode:pageLocation:](THModelStorageAnchor, "storageAnchorWithContentNode:pageLocation:", -[THDocumentNavigationModel contentNodeForGUID:](-[THDocumentRoot navigationModel](self, "navigationModel"), "contentNodeForGUID:", objc_msgSend(a3, "contentNodeGUID")), a3));
  else
    return (unint64_t)v5;
}

- (id)kpfDocumentBaseResourcePath
{
  return -[NSURL path](-[THAsset url](-[THBookDescription asset](-[THDocumentRoot bookDescription](self, "bookDescription"), "asset"), "url"), "path");
}

- (id)pageNumberStringForLocation:(id)a3
{
  return -[THDocumentNavigationModel pageNumberStringForAbsolutePageIndex:forPresentationType:](-[THDocumentRoot navigationModel](self, "navigationModel"), "pageNumberStringForAbsolutePageIndex:forPresentationType:", -[THDocumentRoot absolutePageIndexForLocation:](self, "absolutePageIndexForLocation:", a3), +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THModelNode context](-[THDocumentRoot rootNode](self, "rootNode"), "context")));
}

- (id)sectionTitleStringForLocation:(id)a3
{
  id v5;

  v5 = objc_msgSend(a3, "pageIndex");
  if (-[THBookDescription isEpub](-[THDocumentRoot bookDescription](self, "bookDescription"), "isEpub"))
    v5 = -[THDocumentRoot absolutePageIndexForStorageAnchor:](self, "absolutePageIndexForStorageAnchor:", +[THModelStorageAnchor storageAnchorWithContentNode:pageLocation:](THModelStorageAnchor, "storageAnchorWithContentNode:pageLocation:", -[THDocumentNavigationModel contentNodeForGUID:](-[THDocumentRoot navigationModel](self, "navigationModel"), "contentNodeForGUID:", objc_msgSend(a3, "contentNodeGUID")), a3));
  return -[THDocumentNavigationModel minorSnippetForAbsolutePageIndex:withDocumentRoot:forPresentationType:](-[THDocumentRoot navigationModel](self, "navigationModel"), "minorSnippetForAbsolutePageIndex:withDocumentRoot:forPresentationType:", v5, self, +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THModelNode context](-[THDocumentRoot rootNode](self, "rootNode"), "context")));
}

- (id)sectionNumberStringForLocation:(id)a3
{
  id result;

  result = -[THDocumentNavigationModel navigationUnitContainingContentNode:](-[THDocumentRoot navigationModel](self, "navigationModel"), "navigationUnitContainingContentNode:", -[THDocumentNavigationModel contentNodeForGUID:](-[THDocumentRoot navigationModel](self, "navigationModel"), "contentNodeForGUID:", objc_msgSend(a3, "contentNodeGUID")));
  if (result)
    return -[THDocumentNavigationModel sectionIdentifierForNavigationUnit:](-[THDocumentRoot navigationModel](self, "navigationModel"), "sectionIdentifierForNavigationUnit:", result);
  return result;
}

- (CGImage)thumbnailImageForAbsolutePageIndex:(unint64_t)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot thumbnailImageForAbsolutePageIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm"), 403, CFSTR("Invalid index."));
  }
  else
  {
    v5 = +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THModelNode context](-[THDocumentRoot rootNode](self, "rootNode"), "context"));
    v6 = -[THDocumentNavigationModel navigationUnitContainingContentNode:](-[THDocumentRoot navigationModel](self, "navigationModel"), "navigationUnitContainingContentNode:", -[THModelNode contentNodeForRelativePageIndex:forPresentationType:](-[THDocumentRoot rootNode](self, "rootNode"), "contentNodeForRelativePageIndex:forPresentationType:", a3, v5));
    if (v6)
    {
      v7 = v6;
      v8 = objc_msgSend(v6, "relativePageIndexForAbsolutePageIndex:forPresentationType:", a3, v5);
      v9 = -[NSArray indexOfObject:](-[THDocumentNavigationModel navigationUnits](-[THDocumentRoot navigationModel](self, "navigationModel"), "navigationUnits"), "indexOfObject:", v7);
      if (v9 < -[NSArray count](-[THDocumentNavigationModel navigationUnits](-[THDocumentRoot navigationModel](self, "navigationModel"), "navigationUnits"), "count"))return (CGImage *)+[TSDBitmapImageProvider temporaryCGImageForImageData:](TSDBitmapImageProvider, "temporaryCGImageForImageData:", objc_msgSend(objc_msgSend(-[NSArray objectAtIndex:](-[THTOCModel tiles](-[THDocumentRoot tocModel](self, "tocModel"), "tiles"), "objectAtIndex:", v9), "tinyThumbs"), "objectAtIndex:", v8));
    }
  }
  return 0;
}

- (BOOL)hasThumbnailImageForAbsolutePageIndex:(unint64_t)a3
{
  return !-[THBookDescription isEpub](-[THDocumentRoot bookDescription](self, "bookDescription", a3), "isEpub");
}

- (NSString)docVersion
{
  THBookDescription *v2;

  v2 = -[THDocumentRoot bookDescription](self, "bookDescription");
  if (!-[THBookDescription authoredVersion](v2, "authoredVersion") || !-[THBookDescription timestamp](v2, "timestamp"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot docVersion]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm"), 445, CFSTR("Building a model version string befor initializing all of: authoredVersion, timestamp."));
  if (-[THBookDescription timestamp](v2, "timestamp")
    && -[NSString length](-[THBookDescription timestamp](v2, "timestamp"), "length"))
  {
    if (-[THBookDescription authoredVersion](v2, "authoredVersion")
      && -[NSString length](-[THBookDescription authoredVersion](v2, "authoredVersion"), "length"))
    {
      return -[NSString stringByAppendingFormat:](-[THBookDescription authoredVersion](v2, "authoredVersion"), "stringByAppendingFormat:", CFSTR("@%@"), -[THBookDescription timestamp](v2, "timestamp"));
    }
    else
    {
      return (NSString *)objc_msgSend(CFSTR("@"), "stringByAppendingString:", -[THBookDescription timestamp](v2, "timestamp"));
    }
  }
  else if (-[THBookDescription authoredVersion](v2, "authoredVersion")
         && -[NSString length](-[THBookDescription authoredVersion](v2, "authoredVersion"), "length"))
  {
    return -[THBookDescription authoredVersion](v2, "authoredVersion");
  }
  else
  {
    return (NSString *)CFSTR("0");
  }
}

- (NSURL)modelURL
{
  THBookDescription *v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = -[THDocumentRoot bookDescription](self, "bookDescription");
  if (!-[THBookDescription isbn](v3, "isbn")
    || !-[THBookDescription uniquifier](v3, "uniquifier")
    || !-[THBookDescription authoredVersion](v3, "authoredVersion")
    || !-[THBookDescription timestamp](v3, "timestamp"))
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot modelURL]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm"), 466, CFSTR("Building a model URL before initializing all of: isbn, uniquifier, authoredVersion, timestamp"));
  }
  if (-[THBookDescription isbn](v3, "isbn"))
    v4 = -[THBookDescription isbn](v3, "isbn");
  else
    v4 = CFSTR("0");
  if (-[THBookDescription uniquifier](v3, "uniquifier"))
    v5 = -[THBookDescription uniquifier](v3, "uniquifier");
  else
    v5 = CFSTR("0");
  return +[NSURL URLWithString:](NSURL, "URLWithString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("apub:///%@/%@/%@"), v4, v5, -[THDocumentRoot docVersion](self, "docVersion")));
}

- (BOOL)isPortraitOnlyBook
{
  THPresentationType *v2;
  double v3;
  double v4;
  double v5;

  v2 = -[THDocumentProperties chapterBrowserPagePresentationType](-[THDocumentRoot properties](self, "properties"), "chapterBrowserPagePresentationType");
  -[THPresentationType pageSize](v2, "pageSize");
  v4 = v3;
  -[THPresentationType pageSize](v2, "pageSize");
  return v4 > v5;
}

- (BOOL)isStoreBook
{
  return -[THDocumentRoot storeItemID](self, "storeItemID") != 0;
}

- (NSString)storeItemID
{
  NSString *result;

  result = self->mStoreItemID;
  if (!result)
  {
    result = (NSString *)objc_msgSend(-[NSDictionary objectForKey:](-[THDocumentRoot bookMetadata](self, "bookMetadata"), "objectForKey:", CFSTR("itemId")), "stringValue");
    self->mStoreItemID = result;
  }
  return result;
}

- (NSDictionary)bookMetadata
{
  return +[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", -[NSURL URLByAppendingPathComponent:](-[THBookDescription bookBundleUrl](-[THDocumentRoot bookDescription](self, "bookDescription"), "bookBundleUrl"), "URLByAppendingPathComponent:", CFSTR("iTunesMetadata.plist")));
}

- (NSString)yearFromReleaseDate
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString *v9;
  uint64_t v11;
  void *v12;

  v2 = -[NSDictionary objectForKey:](-[THDocumentRoot bookMetadata](self, "bookMetadata"), "objectForKey:", CFSTR("releaseDate"));
  v4 = objc_opt_class(NSDate, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0)
  {
    v6 = objc_opt_class(NSDate, v5);
    v7 = TSUDynamicCast(v6, v2);
    v8 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
    objc_msgSend(v8, "setTimeZone:", TSUGetGMTTimeZone());
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(objc_msgSend(v8, "components:fromDate:", 4, v7), "year"));

    return v9;
  }
  else
  {
    v11 = objc_opt_class(NSString, v5);
    v12 = (void *)TSUDynamicCast(v11, v2);
    if ((unint64_t)objc_msgSend(v12, "length") < 4)
      return 0;
    else
      return (NSString *)objc_msgSend(v12, "substringToIndex:", 4);
  }
}

- (BOOL)loadEquationFontsIfNeeded
{
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", objc_msgSend(-[THBookDescription urlForDocRelativePath:](-[THDocumentRoot bookDescription](self, "bookDescription"), "urlForDocRelativePath:", CFSTR("OPS/assets/images/equation-1.png")), "path")))
  {
    return -[EQKitEnvironment fontsLoaded](-[THDocumentRoot equationEnvironment](self, "equationEnvironment"), "fontsLoaded");
  }
  else
  {
    return 1;
  }
}

- (EQKitEnvironment)equationEnvironment
{
  id v3;
  id v4;
  EQKitEnvironment *v5;

  objc_sync_enter(self);
  if (!self->mEquationEnvironment)
  {
    if (-[THDocumentProperties equationEnvironmentEntry](-[THDocumentRoot properties](self, "properties"), "equationEnvironmentEntry")&& (v3 = objc_msgSend(-[THBookDescription dataForDocRelativePath:context:](-[THDocumentRoot bookDescription](self, "bookDescription"), "dataForDocRelativePath:context:", -[THDocumentProperties equationEnvironmentEntry](-[THDocumentRoot properties](self, "properties"), "equationEnvironmentEntry"), 0), "NSData")) != 0&& (v4 = +[EQKitEnvironment environmentFromData:](EQKitEnvironment, "environmentFromData:", v3)) != 0)
    {
      v5 = (EQKitEnvironment *)v4;
      self->mEquationEnvironment = v5;
      if (!v5)
        goto LABEL_8;
    }
    else if (!self->mEquationEnvironment)
    {
LABEL_8:
      self->mEquationEnvironment = (EQKitEnvironment *)+[EQKitEnvironment defaultEnvironment](EQKitEnvironment, "defaultEnvironment");
    }
  }
  objc_sync_exit(self);
  return self->mEquationEnvironment;
}

- (void)documentDidLoad
{
  NSString *v3;
  THUserDataManager *v4;
  NSManagedObjectContext *v5;
  PFDContext *v6;
  _QWORD v7[6];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THDocumentRoot;
  -[THDocumentRoot documentDidLoad](&v8, "documentDidLoad");
  v3 = -[THAsset assetID](-[THBookDescription asset](-[THDocumentRoot bookDescription](self, "bookDescription"), "asset"), "assetID");
  if (self->mBookUserDefaults)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot documentDidLoad]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm"), 585, CFSTR("expected nil value for '%s'"), "mBookUserDefaults");
  self->mBookUserDefaults = -[THBookUserDefaults initWithBookID:]([THBookUserDefaults alloc], "initWithBookID:", v3);
  if (self->mNavigationModel)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot documentDidLoad]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm"), 588, CFSTR("expected nil value for '%s'"), "mNavigationModel");
  self->mNavigationModel = -[THDocumentNavigationModel initWithDocumentRoot:navigationUnitsNodes:]([THDocumentNavigationModel alloc], "initWithDocumentRoot:navigationUnitsNodes:", self, 0);
  if (self->mGlossaryController)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot documentDidLoad]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm"), 591, CFSTR("expected nil value for '%s'"), "mGlossaryController");
  self->mGlossaryController = -[THGlossaryController initWithModel:documentRoot:]([THGlossaryController alloc], "initWithModel:documentRoot:", -[THDocumentRoot glossary](self, "glossary"), self);
  if (self->mSearchController)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot documentDidLoad]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm"), 594, CFSTR("expected nil value for '%s'"), "mSearchController");
  self->mSearchController = -[THSearchController initWithDocumentRoot:]([THSearchController alloc], "initWithDocumentRoot:", self);
  if (self->mUserDataManager)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot documentDidLoad]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm"), 597, CFSTR("expected nil value for '%s'"), "mUserDataManager");
  v4 = -[THUserDataManager initWithBookDescription:]([THUserDataManager alloc], "initWithBookDescription:", -[THDocumentRoot bookDescription](self, "bookDescription"));
  self->mUserDataManager = v4;
  if (!v4)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot documentDidLoad]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm"), 599, CFSTR("invalid nil value for '%s'"), "mUserDataManager");
  if (self->mMOC)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot documentDidLoad]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm"), 601, CFSTR("expected nil value for '%s'"), "mMOC");
  v5 = -[THUserDataManager newManagedObjectContext](self->mUserDataManager, "newManagedObjectContext");
  self->mMOC = v5;
  if (!v5)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot documentDidLoad]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm"), 603, CFSTR("invalid nil value for '%s'"), "mMOC");
  if (-[THDocumentRoot annotationController](self, "annotationController"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot documentDidLoad]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm"), 605, CFSTR("expected nil value for '%s'"), "self.annotationController");
  -[THDocumentRoot p_setupAnnotationControllerForBook:](self, "p_setupAnnotationControllerForBook:", -[THDocumentRoot bookDescription](self, "bookDescription"));
  -[THAnnotationStorageController rescueDanglingAnnotationsWithDocumentRoot:](-[THDocumentRoot annotationController](self, "annotationController"), "rescueDanglingAnnotationsWithDocumentRoot:", self);
  +[PFDURLProtocol registerHost:bookRootURL:withDRMContext:](PFDURLProtocol, "registerHost:bookRootURL:withDRMContext:", -[THBookDescription annotationID](-[THDocumentRoot bookDescription](self, "bookDescription"), "annotationID"), -[THBookDescription bookBundleUrl](-[THDocumentRoot bookDescription](self, "bookDescription"), "bookBundleUrl"), -[THBookDescription drmContext](-[THDocumentRoot bookDescription](self, "bookDescription"), "drmContext"));
  v6 = -[THBookDescription drmContext](-[THDocumentRoot bookDescription](self, "bookDescription"), "drmContext");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1F82C;
  v7[3] = &unk_4274E8;
  v7[4] = -[THBookDescription bookBundleUrl](-[THDocumentRoot bookDescription](self, "bookDescription"), "bookBundleUrl");
  v7[5] = v6;
  +[THWWebRep enumerateSubdomainsOfHost:usingBlock:](THWWebRep, "enumerateSubdomainsOfHost:usingBlock:", -[THBookDescription annotationID](-[THDocumentRoot bookDescription](self, "bookDescription"), "annotationID"), v7);
  -[BEDocumentExternalLoadApprovalCache removeCachedDisapprovalForBookID:](+[BEDocumentExternalLoadApprovalCache sharedInstance](BEDocumentExternalLoadApprovalCache, "sharedInstance"), "removeCachedDisapprovalForBookID:", v3);
}

- (id)firstLessonOfChapter:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_opt_class(THModelContentNode, a2);
  v5 = (void *)TSUDynamicCast(v4, objc_msgSend(a3, "nodeAtIndex:", 0));
  if (!v5)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot firstLessonOfChapter:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm"), 627, CFSTR("Expecting chapter child node to be a content node"));
  return v5;
}

- (id)linkForNavigationUnitIndex:(unint64_t)a3
{
  return -[THDocumentNavigationModel linkForNavigationUnitIndex:](-[THDocumentRoot navigationModel](self, "navigationModel"), "linkForNavigationUnitIndex:", a3);
}

- (void)p_setupAnnotationControllerForBook:(id)a3
{
  id v5;
  id v6;
  THBookVersion *v7;
  THAnnotationSerializationManager *v8;
  AEAnnotationProvider *v9;
  THAnnotationController *v10;
  THAnnotationController *v11;
  id v12;

  v5 = objc_msgSend(objc_msgSend(a3, "asset"), "assetID");
  v6 = objc_msgSend(objc_msgSend(a3, "asset"), "url");
  if (!-[THDocumentRoot properties](self, "properties"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot p_setupAnnotationControllerForBook:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm"), 721, CFSTR("expected to access document properties but it is nil"));
  v7 = -[THDocumentProperties bookVersion](-[THDocumentRoot properties](self, "properties"), "bookVersion");
  v8 = +[THAnnotationSerializationManager annotationSerializationManagerWithAssetID:assetURL:bookVersionString:pathToAssetContextDirectory:isManagedBook:](THAnnotationSerializationManager, "annotationSerializationManagerWithAssetID:assetURL:bookVersionString:pathToAssetContextDirectory:isManagedBook:", v5, v6, -[THBookVersion versionString](v7, "versionString"), objc_msgSend(a3, "contextDirectoryPath"), objc_msgSend(objc_msgSend(a3, "asset"), "isManagedBook"));
  if (!-[THDocumentRoot suppliedAnnotationProvider](self, "suppliedAnnotationProvider"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot p_setupAnnotationControllerForBook:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot.mm"), 726, CFSTR("expected annotationProvider to have been supplied"));
  v9 = -[THDocumentRoot suppliedAnnotationProvider](self, "suppliedAnnotationProvider");
  v10 = -[THAnnotationController initWithAnnotationProvider:documentNavigationModel:]([THAnnotationController alloc], "initWithAnnotationProvider:documentNavigationModel:", v9, -[THDocumentRoot navigationModel](self, "navigationModel"));
  if ((-[THAnnotationSerializationManager isAssetOfflineWithAssetID:](v8, "isAssetOfflineWithAssetID:", v5) & 1) != 0|| (-[THAnnotationSerializationManager takeBookOfflineIfManagedWithAnnotationProvider:assetID:](v8, "takeBookOfflineIfManagedWithAnnotationProvider:assetID:", v9, v5) & 1) != 0|| -[THAnnotationSerializationManager wentOfflineAfterHandleAnnotationProvider:willEncounterAnnotationAssetVersion:assetAssetVersion:assetID:assetURL:copyIfGoingOffline:](v8, "wentOfflineAfterHandleAnnotationProvider:willEncounterAnnotationAssetVersion:assetAssetVersion:assetID:assetURL:copyIfGoingOffline:", v9, -[THAnnotationController maxAnnotationAssetVersion](v10, "maxAnnotationAssetVersion"), v7, v5, objc_msgSend(objc_msgSend(a3, "asset"), "url"), 0))
  {
    v11 = -[THAnnotationController initWithAnnotationProvider:documentNavigationModel:]([THAnnotationController alloc], "initWithAnnotationProvider:documentNavigationModel:", -[THAnnotationSerializationManager annotationProviderForOfflineDBWithAssetID:](v8, "annotationProviderForOfflineDBWithAssetID:", v5), -[THDocumentRoot navigationModel](self, "navigationModel"));
    v12 = &dword_0 + 1;
    -[THAnnotationController setAnnotationsReadEnabled:](v11, "setAnnotationsReadEnabled:", 1);
    if (!-[THDocumentProperties isPreview](-[THDocumentRoot properties](self, "properties"), "isPreview"))
      v12 = objc_msgSend(objc_msgSend(a3, "asset"), "isManagedBook");
    -[THAnnotationController setAnnotationsWriteEnabled:](v11, "setAnnotationsWriteEnabled:", v12);
    -[THAnnotationController teardown](v10, "teardown");
  }
  else
  {
    v11 = v10;
  }
  -[THDocumentRoot setAnnotationController:](self, "setAnnotationController:", v11);
  -[THAnnotationSerializationManager removeOfflineDBFilesWithAssetID:exceptBookVersionString:](v8, "removeOfflineDBFilesWithAssetID:exceptBookVersionString:", v5, -[THBookVersion versionString](v7, "versionString"));
}

- (AEAnnotationProvider)suppliedAnnotationProvider
{
  return self->mSuppliedAnnotationProvider;
}

- (void)setSuppliedAnnotationProvider:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (THAnnotationStorageController)annotationController
{
  return self->mAnnotationController;
}

- (void)setAnnotationController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (THDocumentNavigationModel)navigationModel
{
  return self->mNavigationModel;
}

- (void)setNavigationModel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (THTetheringConnection)tetheringConnection
{
  return self->mTetheringConnection;
}

- (void)setTetheringConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (THUserDataManager)userDataManager
{
  return self->mUserDataManager;
}

- (void)setUserDataManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (THGlossaryController)glossaryController
{
  return self->mGlossaryController;
}

- (THSearchController)searchController
{
  return self->mSearchController;
}

- (THBookDescription)bookDescription
{
  return self->mBookDescription;
}

- (void)setBookDescription:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (THBookCoverDescription)bookCoverDescription
{
  return self->mBookCoverDescription;
}

- (void)setBookCoverDescription:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

- (NSString)libraryDatabaseKey
{
  return self->mLibraryDatabaseKey;
}

- (void)setLibraryDatabaseKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSOperationQueue)contentLoadOperationQueue
{
  return self->mContentLoadOperationQueue;
}

- (BOOL)isCorrupt
{
  return self->mIsCorrupt;
}

- (void)setIsCorrupt:(BOOL)a3
{
  self->mIsCorrupt = a3;
}

- (BOOL)isClosing
{
  return self->mClosing;
}

- (THBookUserDefaults)bookUserDefaults
{
  return self->mBookUserDefaults;
}

- (THThemeProvider)themeProvider
{
  return self->_themeProvider;
}

- (void)setThemeProvider:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 312);
}

- (THReflowablePaginationController)reflowablePaginationController
{
  return self->_reflowablePaginationController;
}

- (void)setReflowablePaginationController:(id)a3
{
  self->_reflowablePaginationController = (THReflowablePaginationController *)a3;
}

- (THPageSpotHistory)pagespotHistory
{
  return self->_pagespotHistory;
}

- (void)setPagespotHistory:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 328);
}

- (void)mutateReviewWidgetData:(id)a3 block:(id)a4
{
  if (a4)
    (*((void (**)(id, SEL))a4 + 2))(a4, a2);
  objc_msgSend(a3, "setModificationDate:", +[NSDate date](NSDate, "date"));
  -[THDocumentRoot commitUserDataChanges](self, "commitUserDataChanges");
}

- (void)removeReviewWidgetData:(id)a3
{
  -[NSManagedObjectContext deleteObject:](-[THDocumentRoot moc](self, "moc"), "deleteObject:", a3);
  -[THDocumentRoot commitUserDataChanges](self, "commitUserDataChanges");
}

- (void)removeReviewWidgetDataForWidgetID:(id)a3
{
  -[THDocumentRoot removeReviewWidgetData:](self, "removeReviewWidgetData:", -[THDocumentRoot p_fetchReviewWidgetDataForWidgetID:moc:](self, "p_fetchReviewWidgetDataForWidgetID:moc:", a3, -[THDocumentRoot moc](self, "moc")));
}

- (id)p_reviewEntityWithMOC:(id)a3
{
  if (a3)
    return +[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", kTSWReviewWidgetDataEntityName, a3);
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(TSWReviewWidgetDataController) p_reviewEntityWithMOC:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewWidgetDataController.m"), 51, CFSTR("invalid nil value for '%s'"), "moc");
  return 0;
}

- (id)reviewWidgetDataForWidgetID:(id)a3
{
  return -[THDocumentRoot reviewWidgetDataForWidgetID:temporaryMOC:](self, "reviewWidgetDataForWidgetID:temporaryMOC:", a3, 0);
}

- (id)reviewWidgetDataForWidgetID:(id)a3 temporaryMOC:(id)a4
{
  TSWReviewWidgetData *v7;
  NSManagedObjectContext *v8;
  id v9;
  NSDate *v10;

  if (a4)
    return -[THDocumentRoot p_fetchReviewWidgetDataForWidgetID:moc:](self, "p_fetchReviewWidgetDataForWidgetID:moc:", a3);
  v7 = -[THDocumentRoot p_fetchReviewWidgetDataForWidgetID:moc:](self, "p_fetchReviewWidgetDataForWidgetID:moc:", a3, -[THDocumentRoot moc](self, "moc"));
  if (!v7)
  {
    v8 = -[THDocumentRoot moc](self, "moc");
    v9 = -[THDocumentRoot p_reviewEntityWithMOC:](self, "p_reviewEntityWithMOC:", v8);
    if (v8 && v9)
    {
      v7 = -[TSWReviewWidgetData initWithEntity:insertIntoManagedObjectContext:]([TSWReviewWidgetData alloc], "initWithEntity:insertIntoManagedObjectContext:", v9, v8);
      -[TSWReviewWidgetData setUniqueID:](v7, "setUniqueID:", a3);
      v10 = +[NSDate date](NSDate, "date");
      -[TSWReviewWidgetData setCreationDate:](v7, "setCreationDate:", v10);
      -[TSWReviewWidgetData setModificationDate:](v7, "setModificationDate:", v10);
      -[THDocumentRoot commitUserDataChanges](self, "commitUserDataChanges");
    }
    else
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(TSWReviewWidgetDataController) reviewWidgetDataForWidgetID:temporaryMOC:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewWidgetDataController.m"), 82, CFSTR("Failed to save review widget data."));
      return 0;
    }
  }
  return v7;
}

- (id)newTemporaryReviewDataMOC
{
  return -[THUserDataManager newManagedObjectContext](-[THDocumentRoot userDataManager](self, "userDataManager"), "newManagedObjectContext");
}

- (id)p_fetchReviewWidgetDataForWidgetID:(id)a3 moc:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSString *v10;
  NSString *v11;
  id result;
  uint64_t v13;
  uint64_t v14;

  if (!a4)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(TSWReviewWidgetDataController) p_fetchReviewWidgetDataForWidgetID:moc:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewWidgetDataController.m"), 100, CFSTR("invalid nil value for '%s'"), "moc");
    if (a3)
      return 0;
LABEL_10:
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(TSWReviewWidgetDataController) p_fetchReviewWidgetDataForWidgetID:moc:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewWidgetDataController.m"), 101, CFSTR("invalid nil value for '%s'"), "widgetID");
    return 0;
  }
  if (!a3)
    goto LABEL_10;
  v7 = objc_alloc_init((Class)NSFetchRequest);
  objc_msgSend(v7, "setEntity:", -[THDocumentRoot p_reviewEntityWithMOC:](self, "p_reviewEntityWithMOC:", a4));
  objc_msgSend(v7, "setPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("uniqueID LIKE %@"), a3));
  v14 = 0;
  v8 = objc_msgSend(a4, "executeFetchRequest:error:", v7, &v14);
  if (!v8)
  {
    v9 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(TSWReviewWidgetDataController) p_fetchReviewWidgetDataForWidgetID:moc:]");
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewWidgetDataController.m");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 111, CFSTR("Error fetching results: %@ Error: %@"), v7, v14);
  }

  result = objc_msgSend(v8, "count");
  if (result)
  {
    if (objc_msgSend(v8, "count") != (char *)&dword_0 + 1)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(TSWReviewWidgetDataController) p_fetchReviewWidgetDataForWidgetID:moc:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewWidgetDataController.m"), 115, CFSTR("Retrieved multiple sets of metadata for widgetID %@.  See <rdar://problem/10669561>."), a3);
    v13 = objc_opt_class(TSWReviewWidgetData);
    TSUDynamicCast(v13, objc_msgSend(v8, "objectAtIndex:", 0));
  }
  return result;
}

- (id)p_reviewWidgetDataForResponse:(id)a3
{
  return 0;
}

- (void)mutateResponse:(id)a3 block:(id)a4
{
  if (a4)
    (*((void (**)(id, SEL))a4 + 2))(a4, a2);
  objc_msgSend(a3, "setModificationDate:", +[NSDate date](NSDate, "date"));
  -[THDocumentRoot mutateReviewWidgetData:block:](self, "mutateReviewWidgetData:block:", -[THDocumentRoot p_reviewWidgetDataForResponse:](self, "p_reviewWidgetDataForResponse:", a3), 0);
  -[THDocumentRoot commitUserDataChanges](self, "commitUserDataChanges");
}

- (void)removeResponse:(id)a3
{
  -[NSManagedObjectContext deleteObject:](-[THDocumentRoot moc](self, "moc"), "deleteObject:", a3);
  -[THDocumentRoot commitUserDataChanges](self, "commitUserDataChanges");
}

- (void)removeResponseForQuestionID:(id)a3
{
  id v4;

  v4 = -[THDocumentRoot p_fetchResponseForQuestionID:moc:](self, "p_fetchResponseForQuestionID:moc:", a3, -[THDocumentRoot moc](self, "moc"));
  if (v4)
    -[THDocumentRoot removeResponse:](self, "removeResponse:", v4);
}

- (id)p_responseEntityWithMOC:(id)a3
{
  if (a3)
    return +[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", kTSWReviewResponseEntityName, a3);
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(TSWReviewResponseController) p_responseEntityWithMOC:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewResponseController.m"), 69, CFSTR("invalid nil value for '%s'"), "moc");
  return 0;
}

- (id)p_fetchResponseForQuestionID:(id)a3 moc:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSString *v10;
  NSString *v11;
  id result;
  uint64_t v13;
  uint64_t v14;

  v7 = objc_alloc_init((Class)NSFetchRequest);
  objc_msgSend(v7, "setEntity:", -[THDocumentRoot p_responseEntityWithMOC:](self, "p_responseEntityWithMOC:", a4));
  objc_msgSend(v7, "setPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("uniqueID LIKE %@"), a3));
  v14 = 0;
  v8 = objc_msgSend(a4, "executeFetchRequest:error:", v7, &v14);
  if (!v8)
  {
    v9 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(TSWReviewResponseController) p_fetchResponseForQuestionID:moc:]");
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewResponseController.m");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 85, CFSTR("Error fetching results: %@ Error: %@"), v7, v14);
  }

  result = objc_msgSend(v8, "count");
  if (result)
  {
    if (objc_msgSend(v8, "count") != (char *)&dword_0 + 1)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(TSWReviewResponseController) p_fetchResponseForQuestionID:moc:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewResponseController.m"), 89, CFSTR("Retrieved multiple responses for questionID %@.  See <rdar://problem/10669561>."), a3);
    v13 = objc_opt_class(TSWReviewResponse);
    TSUDynamicCast(v13, objc_msgSend(v8, "objectAtIndex:", 0));
  }
  return result;
}

- (id)responseForQuestionID:(id)a3
{
  return -[THDocumentRoot responseForQuestionID:temporaryMOC:](self, "responseForQuestionID:temporaryMOC:", a3, 0);
}

- (id)responseForQuestionID:(id)a3 temporaryMOC:(id)a4
{
  TSWReviewResponse *v7;
  NSManagedObjectContext *v8;
  id v9;
  NSDate *v10;

  if (a4)
    return -[THDocumentRoot p_fetchResponseForQuestionID:moc:](self, "p_fetchResponseForQuestionID:moc:", a3);
  v7 = -[THDocumentRoot p_fetchResponseForQuestionID:moc:](self, "p_fetchResponseForQuestionID:moc:", a3, -[THDocumentRoot moc](self, "moc"));
  if (!v7)
  {
    v8 = -[THDocumentRoot moc](self, "moc");
    v9 = -[THDocumentRoot p_responseEntityWithMOC:](self, "p_responseEntityWithMOC:", v8);
    if (v8 && v9)
    {
      v7 = -[TSWReviewResponse initWithEntity:insertIntoManagedObjectContext:]([TSWReviewResponse alloc], "initWithEntity:insertIntoManagedObjectContext:", v9, v8);
      -[TSWReviewResponse setUniqueID:](v7, "setUniqueID:", a3);
      v10 = +[NSDate date](NSDate, "date");
      -[TSWReviewResponse setCreationDate:](v7, "setCreationDate:", v10);
      -[TSWReviewResponse setModificationDate:](v7, "setModificationDate:", v10);
      -[THDocumentRoot commitUserDataChanges](self, "commitUserDataChanges");
    }
    else
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(TSWReviewResponseController) responseForQuestionID:temporaryMOC:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewResponseController.m"), 119, CFSTR("Failed to save review response data."));
      return 0;
    }
  }
  return v7;
}

- (id)newTemporateReviewResponseMOC
{
  return -[THUserDataManager newManagedObjectContext](-[THDocumentRoot userDataManager](self, "userDataManager"), "newManagedObjectContext");
}

- (void)commitUserDataChanges
{
  id v2;
  NSString *v3;
  NSString *v4;
  uint64_t v5;

  v5 = 0;
  -[NSManagedObjectContext save:](-[THDocumentRoot moc](self, "moc"), "save:", &v5);
  if (v5)
  {
    v2 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(THUserDataControllerCommon) commitUserDataChanges]");
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot_UserDataAdditions.m");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, v4, 23, CFSTR("Error saving user data:%@"), v5);
  }
}

- (id)viewController
{
  id v3;
  void *v4;

  v3 = objc_msgSend(objc_msgSend(+[THApplePubAssetPlugin sharedPlugin](THApplePubAssetPlugin, "sharedPlugin"), "existingBookViewControllerForDocumentRoot:", self), "documentViewController");
  v4 = v3;
  if (v3 && objc_msgSend(v3, "documentRoot") != self)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(iOS) viewController]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot_iOS.m"), 25, CFSTR("There should never be more than one documentRoot"));
  if (objc_msgSend(v4, "documentRoot") == self)
    return v4;
  else
    return 0;
}

- (id)modelStorageAnchorForAnnotation:(id)a3
{
  return -[THDocumentRoot modelStorageAnchorForCfi:error:](self, "modelStorageAnchorForCfi:error:", objc_msgSend(a3, "annotationLocation"), 0);
}

- (unint64_t)absolutePageIndexForAnnotation:(id)a3
{
  void *v5;
  id v6;
  id v7;
  NSString *v8;
  NSString *v9;
  id v11;
  BOOL v12;
  id v13;

  v5 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THAnnotation, a3);
  if (-[THDocumentRoot reflowablePaginationController](self, "reflowablePaginationController"))
  {
    v13 = 0;
    v6 = -[THDocumentRoot modelStorageAnchorForCfi:error:](self, "modelStorageAnchorForCfi:error:", objc_msgSend(a3, "annotationLocation"), &v13);
    if (!v6)
    {
      v7 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(Annotations) absolutePageIndexForAnnotation:]");
      v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot_Annotations.m");
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 55, CFSTR("failed to lookup anchor for CFI with error: %@"), objc_msgSend(v13, "localizedDescription"));
    }
    return -[THDocumentRoot absolutePageIndexForStorageAnchor:](self, "absolutePageIndexForStorageAnchor:", v6);
  }
  else
  {
    v11 = objc_msgSend(v5, "annotationAbsolutePhysicalPageIndex");
    if (v5)
      v12 = v11 == (id)0x7FFFFFFFFFFFFFFFLL;
    else
      v12 = 1;
    if (v12)
    {
      if (objc_msgSend(a3, "annotationLocation"))
        return -[THDocumentRoot absolutePageIndexForCFI:](self, "absolutePageIndexForCFI:", objc_msgSend(a3, "annotationLocation"));
      else
        return 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      return (unint64_t)objc_msgSend(v5, "annotationAbsolutePhysicalPageIndex");
    }
  }
}

- (id)pageNumberStringForAnnotation:(id)a3
{
  unint64_t v4;

  v4 = -[THDocumentRoot absolutePageIndexForAnnotation:](self, "absolutePageIndexForAnnotation:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("-"), &stru_43D7D8, 0);
  else
    return -[THDocumentNavigationModel pageNumberStringForAbsolutePageIndex:forPresentationType:](-[THDocumentRoot navigationModel](self, "navigationModel"), "pageNumberStringForAbsolutePageIndex:forPresentationType:", v4, +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THDocumentRoot context](self, "context")));
}

- (id)sectionTitleStringForAnnotation:(id)a3
{
  return objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentRoot modelStorageAnchorForAnnotation:](self, "modelStorageAnchorForAnnotation:", a3), "contentNode"), "title"), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
}

- (id)storageForAnnotation:(id)a3
{
  id result;

  result = objc_msgSend(a3, "annotationLocation");
  if (result)
    return -[THDocumentRoot storageForCFI:](self, "storageForCFI:", objc_msgSend(a3, "annotationLocation"));
  return result;
}

- (_NSRange)storageRangeForAnnotation:(id)a3
{
  void *v3;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v3 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THAnnotation, a3);
  if (v3)
  {
    v4 = (NSUInteger)objc_msgSend(v3, "annotationStorageRange");
  }
  else
  {
    v4 = 0x7FFFFFFFFFFFFFFFLL;
    v5 = 0;
  }
  result.length = v5;
  result.location = v4;
  return result;
}

- (id)storageWithHighlightTextForAnnotation:(id)a3
{
  id v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  unint64_t v9;
  id v10;
  NSString *v11;
  NSString *v12;
  THWPStorage *v13;
  id v14;
  id v15;
  id v16;
  NSRange v18;

  v5 = -[THDocumentRoot storageForAnnotation:](self, "storageForAnnotation:");
  v6 = (NSUInteger)-[THDocumentRoot storageRangeForAnnotation:](self, "storageRangeForAnnotation:", a3);
  v8 = v7;
  v9 = v6 + v7;
  if (v6 + v7 > (unint64_t)objc_msgSend(v5, "length"))
  {
    v10 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(Annotations) storageWithHighlightTextForAnnotation:]");
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot_Annotations.m");
    v18.location = v6;
    v18.length = v8;
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, v12, 135, CFSTR("sourceRange %@ not within storage length = %lu"), NSStringFromRange(v18), objc_msgSend(v5, "length"));
  }
  if (v9 > (unint64_t)objc_msgSend(v5, "length"))
  {
    v8 = 0;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v13 = [THWPStorage alloc];
  v14 = -[THDocumentRoot context](self, "context");
  if (!v5 || v6 == 0x7FFFFFFFFFFFFFFFLL)
    v15 = -[THWPStorage initTemporaryWithContext:string:](v13, "initTemporaryWithContext:string:", v14, objc_msgSend(a3, "annotationSelectedText"));
  else
    v15 = -[THWPStorage initTemporaryWithContext:storage:range:](v13, "initTemporaryWithContext:storage:range:", v14, v5, v6, v8);
  v16 = v15;
  objc_msgSend(v16, "replaceListLabelTypeNumberWithBullet");
  return v16;
}

- (id)annotationsUpdatedForSharing:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = +[NSMutableArray array](NSMutableArray, "array");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(a3);
        v10 = TSUCheckedProtocolCast(&OBJC_PROTOCOL___THAnnotation, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9));
        if (v10)
        {
          v11 = -[THAnnotationStorageController modifiedAnnotation:withChapterTitle:physicalPageNumber:](-[THDocumentRoot annotationController](self, "annotationController"), "modifiedAnnotation:withChapterTitle:physicalPageNumber:", v10, -[THDocumentRoot sectionTitleStringForAnnotation:](self, "sectionTitleStringForAnnotation:", v10), -[THDocumentRoot pageNumberStringForAnnotation:](self, "pageNumberStringForAnnotation:", v10));
          if (v11)
            objc_msgSend(v5, "addObject:", v11);
          else
            objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(Annotations) annotationsUpdatedForSharing:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot_Annotations.m"), 169, CFSTR("invalid nil value for '%s'"), "updatedAnnotation");
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  return v5;
}

- (id)activityItemProvider
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)AEAssetActivityItemProvider), "initWithPropertySource:", -[THDocumentRoot p_activityItemPropertySource](self, "p_activityItemPropertySource"));
  objc_msgSend(v3, "setCitationsAllowed:", -[THBookDescription allowCopy](-[THDocumentRoot bookDescription](self, "bookDescription"), "allowCopy"));
  return v3;
}

- (id)activityItemProviderWithAnnotation:(id)a3
{
  id v4;

  v4 = objc_msgSend(objc_alloc((Class)AEAssetActivityItemProvider), "initWithAnnotation:propertySource:", a3, -[THDocumentRoot p_activityItemPropertySource](self, "p_activityItemPropertySource"));
  objc_msgSend(v4, "setCitationsAllowed:", -[THBookDescription allowCopy](-[THDocumentRoot bookDescription](self, "bookDescription"), "allowCopy"));
  return v4;
}

- (id)activityItemProviderWithAnnotations:(id)a3
{
  id v4;

  v4 = objc_msgSend(objc_alloc((Class)AEAssetActivityItemProvider), "initWithAnnotations:propertySource:", a3, -[THDocumentRoot p_activityItemPropertySource](self, "p_activityItemPropertySource"));
  objc_msgSend(v4, "setCitationsAllowed:", -[THBookDescription allowCopy](-[THDocumentRoot bookDescription](self, "bookDescription"), "allowCopy"));
  return v4;
}

- (id)p_activityItemPropertySource
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1A4AC0;
  v3[3] = &unk_42ADD0;
  v3[4] = self;
  return objc_msgSend(v3, "copy");
}

- (id)modelStorageAnchorForCfi:(id)a3 error:(id *)a4
{
  id result;

  if (!-[THBookDescription isEpub](-[THDocumentRoot bookDescription](self, "bookDescription"), "isEpub"))
    return -[THDocumentRoot modelStorageAnchorForCfi:shallow:error:](self, "modelStorageAnchorForCfi:shallow:error:", a3, 0, a4);
  result = -[THDocumentRoot reflowablePaginationController](self, "reflowablePaginationController");
  if (result)
    return -[THDocumentRoot modelStorageAnchorForCfi:shallow:error:](self, "modelStorageAnchorForCfi:shallow:error:", a3, 0, a4);
  return result;
}

- (id)contentNodeForCfi:(id)a3 error:(id *)a4
{
  id result;

  if (!-[THBookDescription isEpub](-[THDocumentRoot bookDescription](self, "bookDescription"), "isEpub"))
    return objc_msgSend(-[THDocumentRoot modelStorageAnchorForCfi:shallow:error:](self, "modelStorageAnchorForCfi:shallow:error:", a3, 1, a4), "contentNode");
  result = -[THDocumentRoot reflowablePaginationController](self, "reflowablePaginationController");
  if (result)
    return objc_msgSend(-[THDocumentRoot modelStorageAnchorForCfi:shallow:error:](self, "modelStorageAnchorForCfi:shallow:error:", a3, 1, a4), "contentNode");
  return result;
}

- (id)anchorForCFIString:(id)a3 coarsenIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  THReflowablePaginationController *v7;
  id result;
  __CFString *v9;
  id v10;

  v4 = a4;
  if (-[THBookDescription isEpub](-[THDocumentRoot bookDescription](self, "bookDescription"), "isEpub"))
  {
    v7 = -[THDocumentRoot reflowablePaginationController](self, "reflowablePaginationController");
    result = 0;
    if (!a3 || !v7)
      return result;
  }
  else if (!a3)
  {
    return 0;
  }
  result = -[THDocumentRoot modelStorageAnchorForCfi:error:](self, "modelStorageAnchorForCfi:error:", a3, 0);
  if (!result && v4)
  {
    v9 = +[THSimpleCFI pathStringFromFragment:](THSimpleCFI, "pathStringFromFragment:", a3);
    while (1)
    {
      result = -[__CFString length](v9, "length");
      if (!result)
        break;
      v10 = -[THSimpleCFI parent](+[THSimpleCFI simpleCFIWithString:](THSimpleCFI, "simpleCFIWithString:", v9), "parent");
      if (v10)
      {
        v9 = (__CFString *)objc_msgSend(v10, "cfiString");
        result = -[THDocumentRoot modelStorageAnchorForCfi:error:](self, "modelStorageAnchorForCfi:error:", +[THSimpleCFI fragmentFromPathString:](THSimpleCFI, "fragmentFromPathString:", v9), 0);
        if (result)
          return result;
      }
      else
      {
        v9 = &stru_43D7D8;
      }
    }
  }
  return result;
}

- (id)anchorForNthInstance:(unint64_t)a3 ofSearchString:(id)a4 afterCFIString:(id)a5 coarsenIfNeeded:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v11;
  void *v12;
  double v13;
  void *v14;

  v6 = a6;
  v11 = objc_opt_class(THModelStorageAnchor);
  *(_QWORD *)&v13 = TSUDynamicCast(v11, -[THDocumentRoot anchorForCFIString:coarsenIfNeeded:](self, "anchorForCFIString:coarsenIfNeeded:", a5, v6)).n128_u64[0];
  if (v12)
  {
    v14 = v12;
    if (objc_msgSend(v12, "contentNode", v13))
    {
      +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THDocumentRoot context](self, "context"));
      return objc_msgSend(objc_msgSend(v14, "contentNode"), "storageAnchorAfterAnchor:forNthInstance:ofSearchString:presentationType:", v14, a3, a4);
    }
    if (objc_msgSend(v14, "glossaryEntry"))
      return objc_msgSend(objc_msgSend(v14, "glossaryEntry"), "storageAnchorAfterAnchor:forNthInstance:ofSearchString:", v14, a3, a4);
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(CFI) anchorForNthInstance:ofSearchString:afterCFIString:coarsenIfNeeded:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot_CFI.m"), 98, CFSTR("expected anchor to contentNode or to glossaryEntry, got %@"), v14);
  }
  return 0;
}

- (unint64_t)absolutePageIndexForCFI:(id)a3
{
  id v5;
  id v6;
  NSString *v7;
  NSString *v8;
  id v10;

  if (-[THBookDescription isEpub](-[THDocumentRoot bookDescription](self, "bookDescription"), "isEpub")
    && !-[THDocumentRoot reflowablePaginationController](self, "reflowablePaginationController"))
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v10 = 0;
  v5 = -[THDocumentRoot modelStorageAnchorForCfi:error:](self, "modelStorageAnchorForCfi:error:", a3, &v10);
  if (!v5)
  {
    v6 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(CFI) absolutePageIndexForCFI:]");
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot_CFI.m");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 113, CFSTR("failed to lookup anchor for CFI %@ with error: %@"), a3, objc_msgSend(v10, "localizedDescription"));
  }
  return -[THDocumentRoot absolutePageIndexForStorageAnchor:](self, "absolutePageIndexForStorageAnchor:", v5);
}

- (id)storageForCFI:(id)a3
{
  id result;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  NSString *v12;
  NSString *v13;
  id v14;

  if (!-[THBookDescription isEpub](-[THDocumentRoot bookDescription](self, "bookDescription"), "isEpub")
    || (result = -[THDocumentRoot reflowablePaginationController](self, "reflowablePaginationController")) != 0)
  {
    v14 = 0;
    v6 = -[THDocumentRoot modelStorageAnchorForCfi:error:](self, "modelStorageAnchorForCfi:error:", a3, &v14);
    if (v6)
    {
      v7 = v6;
      v8 = +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THDocumentRoot context](self, "context"));
      v9 = objc_msgSend(v7, "contentNode");
      v10 = objc_opt_class(THWPStorage);
      TSUDynamicCast(v10, objc_msgSend(v9, "infoForNodeUniqueID:forPresentationType:", objc_msgSend(v7, "storageUID"), v8));
    }
    else
    {
      v11 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentRoot(CFI) storageForCFI:]");
      v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentRoot_CFI.m");
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 137, CFSTR("failed to lookup anchor for CFI with error: %@"), objc_msgSend(v14, "localizedDescription"));
      return 0;
    }
  }
  return result;
}

- (BOOL)incrementBackgroundReaderCount
{
  _BOOL4 mCancelled;

  mCancelled = self->mCancelled;
  if (!self->mCancelled && !+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    -[NSCondition lock](self->mBackgroundReaderCountCondition, "lock");
    ++self->mBackgroundReaderCount;
    -[NSCondition unlock](self->mBackgroundReaderCountCondition, "unlock");
  }
  return !mCancelled;
}

- (void)decrementBackgroundReaderCount
{
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    -[NSCondition lock](self->mBackgroundReaderCountCondition, "lock");
    --self->mBackgroundReaderCount;
    -[NSCondition signal](self->mBackgroundReaderCountCondition, "signal");
    -[NSCondition unlock](self->mBackgroundReaderCountCondition, "unlock");
  }
}

- (BOOL)readStructureFromURL:(id)a3 updateOnly:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  PFXArchive *v9;
  unsigned __int8 v10;
  BOOL v11;

  v6 = a4;
  v9 = -[PFXArchive initWithPath:]([PFXArchive alloc], "initWithPath:", objc_msgSend(a3, "path"));
  if (-[PFXArchive isValid](v9, "isValid"))
  {
    -[PFXArchive setAsset:](v9, "setAsset:", -[THBookDescription asset](-[THDocumentRoot bookDescription](self, "bookDescription"), "asset"));
    if (v6)
      v10 = +[PFAIDocument updateDocumentRoot:applePubURL:fromArchive:](PFAIDocument, "updateDocumentRoot:applePubURL:fromArchive:", self, a3, v9);
    else
      v10 = +[PFAIDocument readDocumentRoot:applePubURL:fromArchive:](PFAIDocument, "readDocumentRoot:applePubURL:fromArchive:", self, a3, v9);
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  if (a5 && !v11)
  {
    v11 = 0;
    *a5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.iWork.Compatibility.ApplePubImport"), 0, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", *(_QWORD *)(TCUnknownProblemMessage + 8), NSLocalizedDescriptionKey, 0));
  }

  return v11;
}

- (BOOL)updateStructureFromURL:(id)a3 error:(id *)a4
{
  return -[THDocumentRoot readStructureFromURL:updateOnly:error:](self, "readStructureFromURL:updateOnly:error:", a3, 1, a4);
}

- (BOOL)readStructureFromURL:(id)a3 error:(id *)a4
{
  THDocumentProperties *v7;
  THDocumentProperties *v8;
  THBookDescription *v9;
  unsigned int v10;
  id v11;
  id v12;
  id v13;

  v7 = -[THDocumentRoot properties](self, "properties");
  if (v7)
  {
    v8 = v7;
    v9 = -[THDocumentRoot bookDescription](self, "bookDescription");
    v10 = -[THBookDescription orientationLock](v9, "orientationLock");
    if (-[THBookDescription isEpub](v9, "isEpub"))
    {
      -[THDocumentProperties setFlowPresentationType:](v8, "setFlowPresentationType:", +[THPresentationType flowPresentationTypeInContext:pageSize:](THPresentationType, "flowPresentationTypeInContext:pageSize:", -[THDocumentRoot context](self, "context"), CGSizeZero.width, CGSizeZero.height));
      -[THDocumentProperties setPaginatedPresentationType:](v8, "setPaginatedPresentationType:", +[THPresentationType paginatedPresentationTypeInContext:pageSize:](THPresentationType, "paginatedPresentationTypeInContext:pageSize:", -[THDocumentRoot context](self, "context"), CGSizeZero.width, CGSizeZero.height));
    }
    else
    {
      v11 = -[THDocumentRoot context](self, "context");
      +[THPagePositionController fixedPageSizeForLandscapeOrientation:](THPagePositionController, "fixedPageSizeForLandscapeOrientation:", v10 != 1);
      v12 = +[THPresentationType paginatedPresentationTypeInContext:pageSize:](THPresentationType, "paginatedPresentationTypeInContext:pageSize:", v11);
      -[THDocumentProperties setPaginatedPresentationType:](v8, "setPaginatedPresentationType:", v12);
      -[THDocumentProperties setChapterBrowserPagePresentationType:](v8, "setChapterBrowserPagePresentationType:", v12);
      if (-[THBookDescription orientationLock](v9, "orientationLock") != 1
        && -[THBookDescription orientationLock](v9, "orientationLock") != 2)
      {
        v13 = -[THDocumentRoot context](self, "context");
        +[THPagePositionController fixedPageSizeForLandscapeOrientation:](THPagePositionController, "fixedPageSizeForLandscapeOrientation:", 0);
        -[THDocumentProperties setFlowPresentationType:](v8, "setFlowPresentationType:", +[THPresentationType flowPresentationTypeInContext:pageSize:](THPresentationType, "flowPresentationTypeInContext:pageSize:", v13));
      }
    }
  }
  return -[THDocumentRoot readStructureFromURL:updateOnly:error:](self, "readStructureFromURL:updateOnly:error:", a3, 0, a4);
}

- (void)cancelApplePubRead
{
  self->mCancelled = 1;
  -[NSCondition lock](self->mBackgroundReaderCountCondition, "lock");
  if (self->mBackgroundReaderCount >= 1)
  {
    do
      -[NSCondition wait](self->mBackgroundReaderCountCondition, "wait");
    while (self->mBackgroundReaderCount > 0);
  }
  -[NSCondition unlock](self->mBackgroundReaderCountCondition, "unlock");
}

- (id)modelLinkWithItemPath:(id)a3 dirPath:(id)a4 fragment:(id)a5
{
  return -[THModelLink initWithPath:fragment:context:]([THModelLink alloc], "initWithPath:fragment:context:", objc_msgSend(objc_msgSend(objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", -[THDocumentRoot applePubDocId](self, "applePubDocId")), "stringByAppendingPathComponent:", objc_msgSend(a4, "stringByDeletingLastPathComponent")), "stringByAppendingPathComponent:", a3), a5, -[THDocumentRoot context](self, "context"));
}

- (id)modelStorageAnchorForCfi:(id)a3 shallow:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  CXNamespace *v9;
  THCFIReader *v10;
  THCFIReader *v11;
  PFXArchive *v12;
  PFXArchive *v13;
  id v14;
  _xmlDoc *mOpfXmlDoc;
  id v16;
  _xmlDoc *v17;
  _xmlDoc *v18;
  THModelStorageAnchor *v19;
  NSDictionary *v20;
  _xmlNode *v21;
  _xmlNode *v22;
  id v23;
  THDocumentLinkResolver *v24;
  THDocumentLinkResolver *v25;
  id v26;
  THModelStorageAnchor *v27;
  id v28;
  uint64_t v30;

  v6 = a4;
  if (!-[THBookDescription isEpub](-[THDocumentRoot bookDescription](self, "bookDescription"), "isEpub")
    || -[THDocumentRoot reflowablePaginationController](self, "reflowablePaginationController"))
  {
    v9 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://www.idpf.org/2007/opf");
    v10 = -[THCFIReader initWithCFI:error:]([THCFIReader alloc], "initWithCFI:error:", a3, a5);
    if (!v10)
    {
      v19 = 0;
LABEL_35:

      return v19;
    }
    v11 = v10;
    v12 = -[PFXArchive initWithPath:]([PFXArchive alloc], "initWithPath:", -[NSURL path](-[THDocumentRoot zipPackage](self, "zipPackage"), "path"));
    if (!v12)
    {
      v19 = 0;
LABEL_34:

      goto LABEL_35;
    }
    v13 = v12;
    v14 = +[PFAXPackage opfXmlUriFromPackage:](PFAXPackage, "opfXmlUriFromPackage:", v12);
    if ((objc_msgSend(v14, "hasPrefix:", CFSTR("/")) & 1) == 0)
      v14 = objc_msgSend(CFSTR("/"), "stringByAppendingString:", v14);
    mOpfXmlDoc = self->mOpfXmlDoc;
    if (mOpfXmlDoc)
    {
LABEL_23:
      v30 = 0;
      v21 = +[THCFIReader findRefNodeFromRoot:reader:ns:manifest:](THCFIReader, "findRefNodeFromRoot:reader:ns:manifest:", CXGetRootElement(mOpfXmlDoc), v11, v9, &v30);
      v19 = 0;
      if (xmlNodeIsText(v21))
        goto LABEL_33;
      v22 = +[THCFIReader lookupIDFrom:inManifest:ns:](THCFIReader, "lookupIDFrom:inManifest:ns:", v21, v30, v9);
      if (v22)
      {
        v19 = +[THCFIReader getHrefFromNode:ns:](THCFIReader, "getHrefFromNode:ns:", v22, CXNoNamespace);
        if (v19)
        {
          v23 = -[THDocumentRoot modelLinkWithItemPath:dirPath:fragment:](self, "modelLinkWithItemPath:dirPath:fragment:", v19, v14, 0);
          v24 = -[THDocumentLinkResolver initWithDocumentRoot:]([THDocumentLinkResolver alloc], "initWithDocumentRoot:", self);
          if (v24)
          {
            v25 = v24;
            v26 = -[THDocumentLinkResolver nodeFromLink:](v24, "nodeFromLink:", v23);

            if (v26)
            {
              if (v6)
                v27 = +[THModelStorageAnchor storageAnchorWithContentNode:storageUID:range:](THModelStorageAnchor, "storageAnchorWithContentNode:storageUID:range:", v26, 0, 0, 0);
              else
                v27 = (THModelStorageAnchor *)objc_msgSend(v26, "storageAnchorForCfiReader:", v11);
              goto LABEL_38;
            }
            v28 = -[THModelGlossary entryForPath:](self->mGlossary, "entryForPath:", objc_msgSend(objc_msgSend(v14, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", v19));
            if (v28)
            {
              v27 = +[THModelStorageAnchor storageAnchorWithGlossaryEntry:storageUID:range:](THModelStorageAnchor, "storageAnchorWithGlossaryEntry:storageUID:range:", v28, 0, 0, 0);
LABEL_38:
              v19 = v27;
              goto LABEL_33;
            }
          }
          goto LABEL_32;
        }
LABEL_33:

        goto LABEL_34;
      }
LABEL_32:
      v19 = 0;
      goto LABEL_33;
    }
    v16 = -[PFXArchive entryWithName:](v13, "entryWithName:", v14);
    if (v16)
    {
      v17 = (_xmlDoc *)objc_msgSend(v16, "xmlDocument");
      if (v17)
      {
        v18 = v17;
        objc_sync_enter(self);
        if (self->mOpfXmlDoc)
          xmlFreeDoc(v18);
        else
          self->mOpfXmlDoc = v18;
        objc_sync_exit(self);
LABEL_22:
        mOpfXmlDoc = self->mOpfXmlDoc;
        if (!mOpfXmlDoc)
          goto LABEL_32;
        goto LABEL_23;
      }
      if (!a5)
        goto LABEL_22;
      v20 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", CFSTR("invalid XML in OPF."), NSLocalizedDescriptionKey, 0);
    }
    else
    {
      if (!a5)
        goto LABEL_22;
      v20 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", CFSTR("invalid archive."), NSLocalizedDescriptionKey, 0);
    }
    *a5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.iWork.Compatibility.CFIImport"), 0, v20);
    goto LABEL_22;
  }
  return 0;
}

@end
