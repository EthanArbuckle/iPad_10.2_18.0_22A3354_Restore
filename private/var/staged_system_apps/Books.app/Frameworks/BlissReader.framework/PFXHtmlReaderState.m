@implementation PFXHtmlReaderState

- (PFXHtmlReaderState)initWithDocumentRoot:(id)a3 contentNode:(id)a4 entry:(id)a5 inArchive:(id)a6
{
  PFXHtmlReaderState *v8;
  PFXHtmlReaderState *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PFXHtmlReaderState;
  v8 = -[PFXXmlStreamReaderState initWithEntry:inArchive:](&v11, "initWithEntry:inArchive:", a5, a6);
  v9 = v8;
  if (v8)
  {
    v8->_thDocumentRoot = (THDocumentRoot *)a3;
    v8->mContext = (TSPObjectContext *)objc_msgSend(a3, "context");
    v9->mContentNode = a4;
    v9->mStylesheetPropertyCache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9->mFontNameCache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9->mSvgDefinitionCache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9->mFrameSpecCache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9->_storageAnchorsForCfiFrag = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
    v9->_textChildOffsetStorageAnchorsForCfiFrag = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
    v9->_storageAnchorsForAnchorID = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
    v9->_anchorForCfiFrag = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
    v9->_tableAnchorsToUpdate = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v9->_wasCancelled = 0;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXHtmlReaderState;
  -[PFXXmlStreamReaderState dealloc](&v3, "dealloc");
}

- (NSString)bookGUID
{
  return -[THAsset assetID](-[THBookDescription asset](-[THDocumentRoot bookDescription](self->_thDocumentRoot, "bookDescription"), "asset"), "assetID");
}

- (double)applePubVersion
{
  double result;

  -[THDocumentProperties applePubVersion](-[THDocumentRoot properties](self->_thDocumentRoot, "properties"), "applePubVersion");
  return result;
}

- (TSPObjectContext)temporaryContext
{
  return (TSPObjectContext *)+[THTemporaryObjectContext context](THTemporaryObjectContext, "context");
}

- (PFXHtmlDocMediaState)currentHtmlDocMediaState
{
  return 0;
}

- (PFXHtmlStackEntry)currentHtmlStackEntry
{
  objc_opt_class(PFXHtmlStackEntry, a2);
  return (PFXHtmlStackEntry *)self->super.mCurrentEntry;
}

- (TSUColor)linkColor
{
  return (TSUColor *)+[TSUColor blueColor](TSUColor, "blueColor");
}

- (BOOL)isTOC
{
  return 0;
}

- (unint64_t)orientationCount
{
  return 1;
}

- (id)propertiesForStylesheetEntry:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mStylesheetPropertyCache, "objectForKey:", a3);
}

- (void)setStylesheetProperties:(id)a3 forEntry:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->mStylesheetPropertyCache, "setObject:forKey:", a3, a4);
}

- (id)postScriptNameForFamilyName:(id)a3
{
  NSNull *v5;
  uint64_t v6;
  NSNull *v7;

  v5 = (NSNull *)-[NSMutableDictionary objectForKey:](self->mFontNameCache, "objectForKey:");
  v6 = objc_opt_class(NSNull);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    return 0;
  if (!v5)
  {
    v5 = (NSNull *)TSWPFontPostScriptNameForFamilyName(a3);
    v7 = v5;
    if (!v5)
      v7 = +[NSNull null](NSNull, "null");
    -[NSMutableDictionary setObject:forKey:](self->mFontNameCache, "setObject:forKey:", v7, a3);
  }
  return v5;
}

- (id)imageDataForUri:(id)a3
{
  return -[PFXHtmlReaderState imageDataForUri:isSharable:](self, "imageDataForUri:isSharable:", a3, 1);
}

- (id)imageDataForUri:(id)a3 isSharable:(BOOL)a4
{
  id v6;
  id v7;
  id v8;
  void *v10;
  double v11;
  double v12;
  double v13;

  v6 = +[TSPData dataFromDocumentURI:context:](TSPData, "dataFromDocumentURI:context:", a3, -[PFXHtmlReaderState tspContext](self, "tspContext", a3, a4));
  if (-[THDocumentProperties wasThinned](-[THDocumentRoot properties](self->_thDocumentRoot, "properties"), "wasThinned"))
  {
    v7 = -[NSDictionary objectForKey:](-[THDocumentProperties originalAssetSizes](-[THDocumentRoot properties](self->_thDocumentRoot, "properties"), "originalAssetSizes"), "objectForKey:", a3);
    v8 = -[NSDictionary objectForKey:](-[THDocumentProperties thinnedAssetSizes](-[THDocumentRoot properties](self->_thDocumentRoot, "properties"), "thinnedAssetSizes"), "objectForKey:", a3);
    if (v7 && v8 != 0)
    {
      v10 = v8;
      if ((objc_msgSend(v7, "isEqualToValue:", v8) & 1) == 0)
      {
        if (!self->mImageThinningScales)
          self->mImageThinningScales = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
        objc_msgSend(v10, "CGSizeValue");
        v12 = v11;
        objc_msgSend(v7, "CGSizeValue");
        -[TSUNoCopyDictionary setObject:forUncopiedKey:](self->mImageThinningScales, "setObject:forUncopiedKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12 / v13), v6);
      }
    }
  }
  return v6;
}

- (double)thinningScaleForImageData:(id)a3
{
  id v3;
  double result;

  if (!a3)
    return 1.0;
  v3 = -[TSUNoCopyDictionary objectForKey:](self->mImageThinningScales, "objectForKey:");
  if (!v3)
    return 1.0;
  objc_msgSend(v3, "doubleValue");
  return result;
}

- (id)frameSpecForName:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mFrameSpecCache, "objectForKey:", a3);
}

- (void)cacheFrameSpec:(id)a3
{
  -[NSMutableDictionary setObject:forKey:](self->mFrameSpecCache, "setObject:forKey:", a3, objc_msgSend(a3, "frameName"));
}

- (id)hintCollectorForStorage:(id)a3
{
  return 0;
}

- (id)uniqueIdForInfo:(id)a3
{
  return 0;
}

- (id)setUniqueIdForInfo:(id)a3 withPostfix:(id)a4 fromStackEntry:(id)a5
{
  return 0;
}

- (id)setUniqueIdForInfo:(id)a3 nodeBody:(id)a4 withPostfix:(id)a5 fromStackEntry:(id)a6
{
  NSString *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSString *v16;
  double v17;

  v11 = (NSString *)objc_msgSend(a4, "nodeUniqueIDForInfo:");
  if (!v11)
  {
    v12 = objc_msgSend(a6, "xmlElementId");
    if (!v12
      || ((v13 = v12, (v14 = objc_msgSend(a6, "xmlValueForAttribute:", "data-original-id")) != 0)
        ? (v15 = v14)
        : (v15 = v13),
          (v16 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", v15)) == 0
       || (v11 = v16, objc_msgSend(a5, "length"))
       && (v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v11, a5)) == 0))
    {
      if (xmlStrEqual((const xmlChar *)objc_msgSend(a6, "xmlElementName"), (const xmlChar *)"td"))
        return 0;
      -[THDocumentProperties applePubVersion](-[THDocumentRoot properties](-[PFXHtmlReaderState thDocumentRoot](self, "thDocumentRoot"), "properties"), "applePubVersion");
      if (fabs(v17 + -2.0) < 0.01 || v17 > 2.0)
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXHtmlReaderState setUniqueIdForInfo:nodeBody:withPostfix:fromStackEntry:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/XML/PFXHtmlReaderState.mm"), 310, CFSTR("Registering an info %@ using a generated ID with stack entry %@"), a3, objc_msgSend(a6, "description"));
      v11 = +[NSString stringWithUUID](NSString, "stringWithUUID");
    }
    if (objc_msgSend(a4, "infoForNodeUniqueID:", v11))
    {
      if (!objc_msgSend(a6, "xmlValueForAttribute:", "data-original-id"))
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXHtmlReaderState setUniqueIdForInfo:nodeBody:withPostfix:fromStackEntry:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/XML/PFXHtmlReaderState.mm"), 322, CFSTR("Expected an original ID that we are avoiding replacing."));
    }
    else
    {
      objc_msgSend(a4, "setNodeUniqueID:forInfo:", v11, a3);
    }
  }
  return v11;
}

- (void)setCfiPathForInfo:(id)a3 childIndex:(unint64_t)a4 nodeBody:(id)a5 fromStackEntry:(id)a6
{
  id v11;
  uint64_t v12;
  double v13;
  id v14;
  THModelStorageAnchor *v15;
  id v16;
  id v17;
  uint64_t v18;
  TSUNoCopyDictionary *textChildOffsetStorageAnchorsForCfiFrag;
  id v20;
  TSUNoCopyDictionary *v21;
  THModelStorageAnchor *v22;
  NSString *v23;

  v11 = objc_msgSend(a5, "nodeUniqueIDForInfo:");
  if (!objc_msgSend(v11, "length"))
  {
    -[PFXHtmlReaderState setUniqueIdForInfo:fromStackEntry:](self, "setUniqueIdForInfo:fromStackEntry:", a3, a6);
    v11 = objc_msgSend(a5, "nodeUniqueIDForInfo:", a3);
  }
  v12 = objc_opt_class(TSWPStorage);
  *(_QWORD *)&v13 = TSUDynamicCast(v12, a3).n128_u64[0];
  v15 = +[THModelStorageAnchor storageAnchorWithContentNode:storageUID:range:](THModelStorageAnchor, "storageAnchorWithContentNode:storageUID:range:", 0, v11, objc_msgSend(v14, "length", v13), 0);
  v16 = objc_msgSend(a6, "cfiPath");
  v17 = v16;
  if (a4)
  {
    v17 = objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("/%lu"), a4);
    if ((a4 & 1) != 0)
      v18 = 200;
    else
      v18 = 192;
    v21 = *(Class *)((char *)&self->super.super.isa + v18);
    v22 = v15;
    v20 = v17;
  }
  else
  {
    -[TSUNoCopyDictionary setObject:forKey:](self->_storageAnchorsForCfiFrag, "setObject:forKey:", v15, v16);
    textChildOffsetStorageAnchorsForCfiFrag = self->_textChildOffsetStorageAnchorsForCfiFrag;
    v20 = objc_msgSend(v17, "stringByAppendingString:", CFSTR("/1"));
    v21 = textChildOffsetStorageAnchorsForCfiFrag;
    v22 = v15;
  }
  -[TSUNoCopyDictionary setObject:forKey:](v21, "setObject:forKey:", v22, v20);
  if (-[PFXHtmlReaderState inTable](self, "inTable"))
    -[NSMutableSet addObject:](self->_tableAnchorsToUpdate, "addObject:", v15);
  if (objc_msgSend(a6, "xmlElementId"))
  {
    v23 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", objc_msgSend(a6, "xmlElementId"));
    -[TSUNoCopyDictionary setObject:forKey:](self->_anchorForCfiFrag, "setObject:forKey:", v23, v17);
    -[PFXHtmlReaderState setStorageAnchor:forAnchorId:](self, "setStorageAnchor:forAnchorId:", v15, v23);
  }
}

- (id)setUniqueIdForInfo:(id)a3 fromStackEntry:(id)a4
{
  return -[PFXHtmlReaderState setUniqueIdForInfo:withPostfix:fromStackEntry:](self, "setUniqueIdForInfo:withPostfix:fromStackEntry:", a3, 0, a4);
}

- (void)setStorageAnchor:(id)a3 forAnchorId:(id)a4
{
  if (a3)
    -[TSUNoCopyDictionary setObject:forKey:](self->_storageAnchorsForAnchorID, "setObject:forKey:", a3, a4);
  if (-[PFXHtmlReaderState inTable](self, "inTable"))
    -[NSMutableSet addObject:](self->_tableAnchorsToUpdate, "addObject:", a3);
}

- (id)targetDrawableInfoForIdentifier:(id)a3
{
  uint64_t v5;
  id result;

  if (!a3)
    return 0;
  v5 = objc_opt_class(THWViewportInfo);
  TSUDynamicCast(v5, -[NSMutableDictionary objectForKey:](self->mTargetDrawableInfosWithIdentifier, "objectForKey:", a3));
  return result;
}

- (void)setTargetDrawableInfo:(id)a3 withIdentifier:(id)a4
{
  NSMutableDictionary *mTargetDrawableInfosWithIdentifier;

  if (a3 && a4 && objc_msgSend(a4, "length"))
  {
    mTargetDrawableInfosWithIdentifier = self->mTargetDrawableInfosWithIdentifier;
    if (!mTargetDrawableInfosWithIdentifier)
    {
      mTargetDrawableInfosWithIdentifier = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      self->mTargetDrawableInfosWithIdentifier = mTargetDrawableInfosWithIdentifier;
    }
    -[NSMutableDictionary setObject:forKey:](mTargetDrawableInfosWithIdentifier, "setObject:forKey:", a3, a4);
  }
}

- (void)addGutterInfo:(id)a3
{
  if (!self->mGutterInfosByAssociatedInfos)
    self->mGutterInfosByAssociatedInfos = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
  if (objc_msgSend(a3, "associatedInfo"))
    -[TSUNoCopyDictionary setObject:forUncopiedKey:](self->mGutterInfosByAssociatedInfos, "setObject:forUncopiedKey:", a3, objc_msgSend(a3, "associatedInfo"));
}

- (id)popoversByIdentifier
{
  return self->mTargetDrawableInfosWithIdentifier;
}

- (id)gutterInfosByAssociatedInfos
{
  return self->mGutterInfosByAssociatedInfos;
}

- (TSPObjectContext)tspContext
{
  return self->mContext;
}

- (id)contentNode
{
  return self->mContentNode;
}

- (NSMutableDictionary)svgDefinitionCache
{
  return self->mSvgDefinitionCache;
}

- (double)pageContentWidth
{
  return self->mPageContentWidth;
}

- (void)setPageContentWidth:(double)a3
{
  self->mPageContentWidth = a3;
}

- (BOOL)inTable
{
  return self->mInTable;
}

- (void)setInTable:(BOOL)a3
{
  self->mInTable = a3;
}

- (THDocumentRoot)thDocumentRoot
{
  return self->_thDocumentRoot;
}

- (PFAIOperationLoadDelegate)loadDelegate
{
  return self->_loadDelegate;
}

- (void)setLoadDelegate:(id)a3
{
  self->_loadDelegate = (PFAIOperationLoadDelegate *)a3;
}

- (TSUNoCopyDictionary)storageAnchorsForCfiFrag
{
  return self->_storageAnchorsForCfiFrag;
}

- (TSUNoCopyDictionary)textChildOffsetStorageAnchorsForCfiFrag
{
  return self->_textChildOffsetStorageAnchorsForCfiFrag;
}

- (TSUNoCopyDictionary)anchorForCfiFrag
{
  return self->_anchorForCfiFrag;
}

- (TSUNoCopyDictionary)storageAnchorsForAnchorID
{
  return self->_storageAnchorsForAnchorID;
}

- (NSMutableSet)tableAnchorsToUpdate
{
  return self->_tableAnchorsToUpdate;
}

- (BOOL)wasCancelled
{
  return self->_wasCancelled;
}

- (NSString)nodeGUID
{
  return self->_nodeGUID;
}

- (void)setNodeGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (BOOL)inBody
{
  return self->_inBody;
}

- (void)setInBody:(BOOL)a3
{
  self->_inBody = a3;
}

- (BOOL)isCancelled
{
  BOOL result;

  if (self->_wasCancelled)
    result = 1;
  else
    result = -[PFAIOperationLoadDelegate operationShouldCancelLoad](-[PFXHtmlReaderState loadDelegate](self, "loadDelegate"), "operationShouldCancelLoad");
  self->_wasCancelled = result;
  return result;
}

+ (Class)stackEntryClass
{
  return (Class)objc_opt_class(PFXHtmlMonoMediaStackEntry, a2);
}

- (BOOL)isRawAttribute:(const char *)a3
{
  return xmlStrEqual((const xmlChar *)a3, (const xmlChar *)"style")
      || xmlStrEqual((const xmlChar *)a3, (const xmlChar *)"class") != 0;
}

- (Class)drawablePlacementClass
{
  return (Class)objc_opt_class(PFXDrawablePlacement, a2);
}

- (Class)textBodyClass
{
  return (Class)objc_opt_class(PFXBody, a2);
}

- (id)currentTableReader
{
  id v2;
  uint64_t v3;
  id result;

  v2 = -[PFXHtmlReaderState drawableReaderForCurrentMediaStateWithStackEntry:](self, "drawableReaderForCurrentMediaStateWithStackEntry:", -[PFXXmlStreamReaderState ancestorEntryWithElementName:](self, "ancestorEntryWithElementName:", "table"));
  v3 = objc_opt_class(PFXTable);
  TSUDynamicCast(v3, v2);
  return result;
}

- (BOOL)isWidgetEntry:(id)a3
{
  const xmlChar *v4;

  LODWORD(v4) = xmlStrEqual((const xmlChar *)objc_msgSend(a3, "xmlElementName"), (const xmlChar *)"object");
  if ((_DWORD)v4)
  {
    v4 = (const xmlChar *)objc_msgSend(a3, "xmlValueForAttribute:", "type");
    if (v4)
      LOBYTE(v4) = xmlStrEqual(v4, (const xmlChar *)PFXCommonApubWidgetMimeType[0]) != 0;
  }
  return (char)v4;
}

- (BOOL)isInsideWidget
{
  vector<PFXXmlStackEntry *, std::allocator<PFXXmlStackEntry *>> *p_mContextStack;
  int64_t v3;
  uint64_t i;
  __end_ *v6;

  p_mContextStack = &self->super.mContextStack;
  v3 = (char *)self->super.mContextStack.var0 - (char *)self->super.mContextStack.__begin_;
  if ((unint64_t)v3 >= 9)
  {
    for (i = (v3 >> 3) - 2; i != -1; --i)
    {
      v6 = p_mContextStack->__begin_[i];
      if (xmlStrEqual((const xmlChar *)-[__end_ xmlElementName](v6, "xmlElementName"), (const xmlChar *)"p"))
        break;
      if (-[PFXHtmlReaderState isWidgetEntry:](self, "isWidgetEntry:", v6))
        return 1;
    }
  }
  return 0;
}

- (id)readerForCurrentMediaStateWithStackEntry:(id)a3
{
  return objc_msgSend(a3, "reader");
}

- (id)drawableReaderForCurrentMediaStateWithStackEntry:(id)a3
{
  uint64_t v5;
  id result;

  v5 = objc_opt_class(PFXDrawable);
  TSUDynamicCast(v5, -[PFXHtmlReaderState readerForCurrentMediaStateWithStackEntry:](self, "readerForCurrentMediaStateWithStackEntry:", a3));
  return result;
}

@end
