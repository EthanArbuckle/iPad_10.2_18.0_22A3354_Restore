@implementation THModelContentNode

- (TSUNoCopyDictionary)presentationContentBodies
{
  return self->mPresentationContentBodies;
}

- (void)setPresentationContentBodies:(id)a3
{
  id v5;

  -[THModelContentNode willModify](self, "willModify");
  v5 = a3;

  self->mPresentationContentBodies = (TSUNoCopyDictionary *)a3;
}

- (TSUNoCopyDictionary)displayStartingPageNumbers
{
  return self->mDisplayStartingPageNumbers;
}

- (void)setDisplayStartingPageNumbers:(id)a3
{
  id v5;

  -[THModelContentNode willModify](self, "willModify");
  v5 = a3;

  self->mDisplayStartingPageNumbers = (TSUNoCopyDictionary *)a3;
}

- (TSUNoCopyDictionary)displayStartingPageFormats
{
  return self->mDisplayStartingPageFormats;
}

- (void)setDisplayStartingPageFormats:(id)a3
{
  id v5;

  -[THModelContentNode willModify](self, "willModify");
  v5 = a3;

  self->mDisplayStartingPageFormats = (TSUNoCopyDictionary *)a3;
}

- (NSMutableDictionary)fragmentPhysicalPageIndexes
{
  return self->mFragmentPhysicalPageIndexes;
}

- (void)setFragmentPhysicalPageIndexes:(id)a3
{
  id v5;

  -[THModelContentNode willModify](self, "willModify");
  v5 = a3;

  self->mFragmentPhysicalPageIndexes = (NSMutableDictionary *)a3;
}

- (NSMutableDictionary)storageAnchorsForAnchorID
{
  return self->mStorageAnchorsForAnchorID;
}

- (void)setStorageAnchorsForAnchorID:(id)a3
{
  id v5;

  -[THModelContentNode willModify](self, "willModify");
  v5 = a3;

  self->mStorageAnchorsForAnchorID = (NSMutableDictionary *)a3;
}

- (NSMutableDictionary)anchorForCfiFrag
{
  return self->mAnchorForCfiFrag;
}

- (void)setAnchorForCfiFrag:(id)a3
{
  id v5;

  -[THModelContentNode willModify](self, "willModify");
  v5 = a3;

  self->mAnchorForCfiFrag = (NSMutableDictionary *)a3;
}

- (NSMutableDictionary)storageAnchorsForCfiFrag
{
  return self->mStorageAnchorsForCfiFrag;
}

- (void)setStorageAnchorsForCfiFrag:(id)a3
{
  id v5;

  -[THModelContentNode willModify](self, "willModify");
  v5 = a3;

  self->mStorageAnchorsForCfiFrag = (NSMutableDictionary *)a3;
}

- (NSMutableDictionary)textChildOffsetStorageAnchorsForCfiFrag
{
  return self->mTextChildOffsetStorageAnchorsForCfiFrag;
}

- (void)setTextChildOffsetStorageAnchorsForCfiFrag:(id)a3
{
  id v5;

  -[THModelContentNode willModify](self, "willModify");
  v5 = a3;

  self->mTextChildOffsetStorageAnchorsForCfiFrag = (NSMutableDictionary *)a3;
}

- (id)cfiFragsForTextChildOffsets
{
  return self->mCfiFragsForTextChildOffsets;
}

- (void)setCfiFragsForTextChildOffsets:(id)a3
{
  id v5;

  -[THModelContentNode willModify](self, "willModify");
  v5 = a3;

  self->mCfiFragsForTextChildOffsets = (NSMutableDictionary *)a3;
}

- (NSString)cfiBase
{
  return self->mCfiBase;
}

- (void)setCfiBase:(id)a3
{
  id v5;

  -[THModelContentNode willModify](self, "willModify");
  v5 = a3;

  self->mCfiBase = (NSString *)a3;
}

- (BOOL)glossaryTermExists
{
  return self->mGlossaryTermExists;
}

- (void)setGlossaryTermExists:(BOOL)a3
{
  -[THModelContentNode willModify](self, "willModify");
  self->mGlossaryTermExists = a3;
}

- (THModelContentNode)initWithTitle:(id)a3 includeInTOC:(BOOL)a4 context:(id)a5
{
  THModelContentNode *v5;
  CFMutableDictionaryRef Mutable;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THModelContentNode;
  v5 = -[THModelNode initWithTitle:includeInTOC:context:](&v8, "initWithTitle:includeInTOC:context:", a3, a4, a5);
  if (v5)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, 0);
    -[THModelContentNode setPresentationContentBodies:](v5, "setPresentationContentBodies:", objc_msgSend(objc_alloc((Class)TSUNoCopyDictionary), "initWithCFDictionary:", Mutable));
    CFRelease(Mutable);
    -[THModelContentNode setStorageAnchorsForAnchorID:](v5, "setStorageAnchorsForAnchorID:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[THModelContentNode setAnchorForCfiFrag:](v5, "setAnchorForCfiFrag:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[THModelContentNode setStorageAnchorsForCfiFrag:](v5, "setStorageAnchorsForCfiFrag:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[THModelContentNode setTextChildOffsetStorageAnchorsForCfiFrag:](v5, "setTextChildOffsetStorageAnchorsForCfiFrag:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v5->mCfiFragsForTextChildOffsets = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    -[THModelContentNode setDisplayStartingPageNumbers:](v5, "setDisplayStartingPageNumbers:", +[TSUNoCopyDictionary dictionary](TSUNoCopyDictionary, "dictionary"));
    -[THModelContentNode setDisplayStartingPageFormats:](v5, "setDisplayStartingPageFormats:", +[TSUNoCopyDictionary dictionary](TSUNoCopyDictionary, "dictionary"));
    -[THModelContentNode setFragmentPhysicalPageIndexes:](v5, "setFragmentPhysicalPageIndexes:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v5->mLoadState = 0;
    v5->mLoadStateLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (void)dealloc
{
  unsigned int mLoadState;
  BOOL v4;
  int v5;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  mLoadState = self->mLoadState;
  v4 = mLoadState > 5;
  v5 = (1 << mLoadState) & 0x31;
  if (v4 || v5 == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m"), 115, CFSTR("node should not be loading when deallocated"));
  v7 = objc_alloc_init((Class)NSAutoreleasePool);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = -[TSUNoCopyDictionary allValues](-[THModelContentNode presentationContentBodies](self, "presentationContentBodies"), "allValues");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12), "ownerRelease");
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  self->mFragmentPhysicalPageIndexes = 0;
  self->mPresentationContentBodies = 0;

  self->mPublicationContext = 0;
  self->mApplePubURL = 0;

  self->mLoadOperation = 0;
  self->mStorageAnchorsForAnchorID = 0;

  self->mStorageAnchorsForCfiFrag = 0;
  self->mTextChildOffsetStorageAnchorsForCfiFrag = 0;

  self->mCfiFragsForTextChildOffsets = 0;
  self->mAnchorForCfiFrag = 0;

  self->mDisplayStartingPageNumbers = 0;
  self->mDisplayStartingPageFormats = 0;

  self->_paginationOperation = 0;
  self->mBodyObjectsFlushed = 0;
  v13.receiver = self;
  v13.super_class = (Class)THModelContentNode;
  -[THModelNode dealloc](&v13, "dealloc");
}

- (void)i_flushingBody:(id)a3
{
  os_unfair_lock_s *p_mLoadStateLock;

  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  if (self->mLoadState != 4)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode i_flushingBody:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m"), 144, CFSTR("shouldn't be flushing a content node that isn't loaded"));
  self->mBodyObjectsFlushed = 1;

  self->mLoadOperation = 0;
  os_unfair_lock_unlock(p_mLoadStateLock);
}

- (id)p_bodyForPresentationType:(id)a3
{
  id v5;

  if (!a3)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode p_bodyForPresentationType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m"), 152, CFSTR("Invalid parameter not satisfying: %s"), "presentationType != nil");
    return 0;
  }
  if (self->mLoadState == 5)
    return 0;
  -[THModelContentNode willRead](self, "willRead");
  os_unfair_lock_lock(&self->mLoadStateLock);
  v5 = -[TSUNoCopyDictionary objectForKey:](-[THModelContentNode presentationContentBodies](self, "presentationContentBodies"), "objectForKey:", a3);
  objc_msgSend(v5, "ownerAutoreleasedAccess");
  os_unfair_lock_unlock(&self->mLoadStateLock);
  return v5;
}

- (void)p_releaseFlushedBodies
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  if (self->mBodyObjectsFlushed)
  {
    objc_sync_enter(self);
    if (self->mBodyObjectsFlushed)
    {
      os_unfair_lock_lock(&self->mLoadStateLock);
      v9 = 0u;
      v10 = 0u;
      v7 = 0u;
      v8 = 0u;
      v3 = -[TSUNoCopyDictionary allValues](-[THModelContentNode presentationContentBodies](self, "presentationContentBodies", 0), "allValues");
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
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
            objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "ownerRelease");
            v6 = (char *)v6 + 1;
          }
          while (v4 != v6);
          v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        }
        while (v4);
      }
      -[TSUNoCopyDictionary removeAllObjects](-[THModelContentNode presentationContentBodies](self, "presentationContentBodies"), "removeAllObjects");
      self->mBodyObjectsFlushed = 0;
      self->mLoadState = 0;
      -[THModelContentNode setPaginatedBodyStale:](self, "setPaginatedBodyStale:", 0);
      os_unfair_lock_unlock(&self->mLoadStateLock);
    }
    objc_sync_exit(self);
  }
}

- (void)invalidatePresentationType:(id)a3
{
  int mLoadState;

  if (objc_msgSend(a3, "isFlow"))
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode invalidatePresentationType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m"), 192, CFSTR("Code for unloading the flow presentation type is not done."));
  }
  else if (objc_msgSend(a3, "isPaginated"))
  {
    os_unfair_lock_lock(&self->mLoadStateLock);
    mLoadState = self->mLoadState;
    if ((mLoadState - 3) <= 1)
    {
      if (mLoadState == 3)
      {
        -[THReflowableContentPaginationOperation cancel](self->_paginationOperation, "cancel");

        self->_paginationOperation = 0;
      }
      -[THModelContentNode setPaginatedBodyStale:](self, "setPaginatedBodyStale:", 1);
    }
    -[THModelContentNode setDisplayStartingPageNumber:presentationType:](self, "setDisplayStartingPageNumber:presentationType:", 0x7FFFFFFFFFFFFFFFLL, a3);
    -[THModelNode setPageCount:forPresentationType:](self, "setPageCount:forPresentationType:", 0x7FFFFFFFFFFFFFFFLL, a3);
    os_unfair_lock_unlock(&self->mLoadStateLock);
  }
}

- (id)applePubRelativePath
{
  return self->mPublicationContext;
}

- (unint64_t)displayStartingPageNumberForPresentationType:(id)a3
{
  id v3;

  if (!a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  v3 = -[TSUNoCopyDictionary objectForKey:](-[THModelContentNode displayStartingPageNumbers](self, "displayStartingPageNumbers"), "objectForKey:", a3);
  if (v3)
    return (int)objc_msgSend(v3, "intValue");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setDisplayStartingPageNumber:(unint64_t)a3 presentationType:(id)a4
{
  -[TSUNoCopyDictionary setObject:forUncopiedKey:](-[THModelContentNode displayStartingPageNumbers](self, "displayStartingPageNumbers"), "setObject:forUncopiedKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3), a4);
}

- (int)displayStartingPageFormatForPresentationType:(id)a3
{
  id v3;

  if (a3
    && (v3 = -[TSUNoCopyDictionary objectForKey:](-[THModelContentNode displayStartingPageFormats](self, "displayStartingPageFormats"), "objectForKey:", a3)) != 0)
  {
    return objc_msgSend(v3, "intValue");
  }
  else
  {
    return 0;
  }
}

- (void)setDisplayStartingPageFormat:(int)a3 presentationType:(id)a4
{
  -[TSUNoCopyDictionary setObject:forUncopiedKey:](-[THModelContentNode displayStartingPageFormats](self, "displayStartingPageFormats"), "setObject:forUncopiedKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3), a4);
}

- (void)retainBodies
{
  os_unfair_lock_s *p_mLoadStateLock;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  int *v8;
  void *i;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  -[THModelContentNode p_releaseFlushedBodies](self, "p_releaseFlushedBodies");
  if (self->mLoadState == 4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = -[TSUNoCopyDictionary allValues](-[THModelContentNode presentationContentBodies](self, "presentationContentBodies", 0), "allValues");
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      v8 = &OBJC_IVAR___THModelContentNode_mLoadedBodyRetainCount;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          v11 = v10;
          objc_msgSend(v10, "ownerAutoreleasedAccess");
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }
    else
    {
      v8 = &OBJC_IVAR___THModelContentNode_mLoadedBodyRetainCount;
    }
  }
  else
  {
    v8 = &OBJC_IVAR___THModelContentNode_mPreloadingBodyRetainCount;
  }
  ++*(_QWORD *)&self->super.TSPObject_opaque[*v8];
  os_unfair_lock_unlock(p_mLoadStateLock);
}

- (void)releaseBodies
{
  os_unfair_lock_s *p_mLoadStateLock;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  int *v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  if (self->mLoadState == 4)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = -[TSUNoCopyDictionary allValues](-[THModelContentNode presentationContentBodies](self, "presentationContentBodies", 0), "allValues");
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      v8 = &OBJC_IVAR___THModelContentNode_mLoadedBodyRetainCount;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }
    else
    {
      v8 = &OBJC_IVAR___THModelContentNode_mLoadedBodyRetainCount;
    }
  }
  else
  {
    v8 = &OBJC_IVAR___THModelContentNode_mPreloadingBodyRetainCount;
  }
  --*(_QWORD *)&self->super.TSPObject_opaque[*v8];
  os_unfair_lock_unlock(p_mLoadStateLock);
}

- (void)willRead
{
  if (self->mLoadState != 5)
  {
    -[THModelContentNode startLoading](self, "startLoading");
    -[THModelContentNode waitUntilFinishedLoadingAndPaginating](self, "waitUntilFinishedLoadingAndPaginating");
  }
}

- (void)willReadJustLoad
{
  if (self->mLoadState != 5)
  {
    -[THModelContentNode startLoading](self, "startLoading");
    -[THModelContentNode waitUntilFinishedLoading](self, "waitUntilFinishedLoading");
  }
}

- (BOOL)nodeBodyExists
{
  if (self->mLoadState == 4)
    return 1;
  else
    return -[THModelContentNode hasCachedVersion](self, "hasCachedVersion");
}

- (id)bodyStorageForPresentationType:(id)a3
{
  return objc_msgSend(-[THModelContentNode p_bodyForPresentationType:](self, "p_bodyForPresentationType:", a3), "bodyStorage");
}

- (id)nodeBodyForPresentationType:(id)a3
{
  id v3;

  v3 = a3;
  if (a3)
    v3 = -[TSUNoCopyDictionary objectForKey:](-[THModelContentNode presentationContentBodies](self, "presentationContentBodies"), "objectForKey:", a3);
  objc_msgSend(v3, "ownerAutoreleasedAccess");
  return v3;
}

- (unint64_t)pageCountForPresentationType:(id)a3
{
  TSUNoCopyDictionary *mPageCountByPresentationType;
  id v6;
  unint64_t result;
  id v8;
  id v9;

  if (!a3)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode pageCountForPresentationType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m"), 322, CFSTR("Invalid parameter not satisfying: %s"), "presentationType != nil");
LABEL_9:
    v9 = -[THReflowablePaginationController paginationResultForContentNode:](-[THModelContentNode reflowablePaginationController](self, "reflowablePaginationController"), "paginationResultForContentNode:", self);
    if (v9)
      return (unint64_t)objc_msgSend(v9, "pageCount");
    else
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  mPageCountByPresentationType = self->super.mPageCountByPresentationType;
  if (!mPageCountByPresentationType
    || (v6 = -[TSUNoCopyDictionary objectForKey:](mPageCountByPresentationType, "objectForKey:", a3)) == 0
    || (result = (unint64_t)objc_msgSend(v6, "unsignedIntegerValue"), result == 0x7FFFFFFFFFFFFFFFLL))
  {
    v8 = -[TSUNoCopyDictionary objectForKey:](-[THModelContentNode presentationContentBodies](self, "presentationContentBodies"), "objectForKey:", a3);
    if (!v8)
      goto LABEL_9;
    result = (unint64_t)objc_msgSend(v8, "pageCount");
    if (result == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_9;
  }
  return result;
}

- (id)pagesForPresentationType:(id)a3
{
  return objc_msgSend(-[THModelContentNode p_bodyForPresentationType:](self, "p_bodyForPresentationType:", a3), "pages");
}

- (void)addPageInfo:(id)a3 insertContext:(id)a4 forPresentationType:(id)a5
{
  if (-[THModelNode state](self, "state") == 2)
    objc_msgSend(a3, "willBeAddedToDocumentRoot:context:", -[THModelContentNode documentRoot](self, "documentRoot"), a4);
  objc_msgSend(-[THModelContentNode p_bodyForPresentationType:](self, "p_bodyForPresentationType:", a5), "addPageInfo:", a3);
  objc_msgSend(a3, "setParent:", self);
  if (-[THModelNode state](self, "state") == 2)
    objc_msgSend(a3, "wasAddedToDocumentRoot:context:", -[THModelContentNode documentRoot](self, "documentRoot"), a4);
}

- (unint64_t)relativePageIndexForInfo:(id)a3 forPresentationType:(id)a4
{
  id v5;

  v5 = -[THModelContentNode p_bodyForPresentationType:](self, "p_bodyForPresentationType:", a4);
  if (v5)
    return (unint64_t)objc_msgSend(v5, "relativePageIndexForInfo:", a3);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)pageAtRelativeIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  id v5;
  void *v6;

  v5 = -[THModelContentNode p_bodyForPresentationType:](self, "p_bodyForPresentationType:", a4);
  if (v5 && (v6 = v5, (unint64_t)objc_msgSend(objc_msgSend(v5, "pages"), "count") > a3))
    return objc_msgSend(objc_msgSend(v6, "pages"), "objectAtIndex:", a3);
  else
    return 0;
}

- (id)pageInfoForStorageAnchor:(id)a3 forPresentationType:(id)a4
{
  id v5;
  char *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char *v13;
  uint64_t v14;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = -[THModelContentNode p_bodyForPresentationType:](self, "p_bodyForPresentationType:", a4);
  v6 = (char *)objc_msgSend(a3, "range");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(v5, "pages", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v8)
    return 0;
  v9 = v8;
  v10 = *(_QWORD *)v18;
LABEL_3:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v18 != v10)
      objc_enumerationMutation(v7);
    v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
    v13 = (char *)objc_msgSend(v12, "bodyStorageRange");
    if (v13 <= v6 && &v13[v14] >= v6)
      return v12;
    if (v9 == (id)++v11)
    {
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        goto LABEL_3;
      return 0;
    }
  }
}

- (unint64_t)relativeIndexOfPage:(id)a3 forPresentationType:(id)a4
{
  id v5;

  v5 = -[THModelContentNode p_bodyForPresentationType:](self, "p_bodyForPresentationType:", a4);
  if (v5)
    return (unint64_t)objc_msgSend(objc_msgSend(v5, "pages"), "indexOfObject:", a3);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)contentNodeForRelativePageIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  THModelContentNode *v5;
  unint64_t v6;

  v5 = self;
  v6 = -[THModelContentNode pageCountForPresentationType:](self, "pageCountForPresentationType:", a4);
  if (v6 <= a3 || v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode contentNodeForRelativePageIndex:forPresentationType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m"), 419, CFSTR("Relative page index out of bounds"));
    return 0;
  }
  return v5;
}

- (id)storagesForPresentationType:(id)a3
{
  if (self->mLoadState != 4)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode storagesForPresentationType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m"), 425, CFSTR("Requesting storages from unloaded content node titled '%@'"), -[THModelNode title](self, "title"));
  -[THModelContentNode willRead](self, "willRead");
  return objc_msgSend(objc_alloc((Class)TSKDocumentModelEnumerator), "initWithRootModelObject:filter:", -[THModelContentNode p_bodyForPresentationType:](self, "p_bodyForPresentationType:", a3), &stru_427700);
}

- (id)storagesForAllPresentationTypes
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  v3 = +[TSUMutablePointerSet set](TSUMutablePointerSet, "set");
  -[THModelContentNode willRead](self, "willRead");
  os_unfair_lock_lock(&self->mLoadStateLock);
  v4 = -[TSUNoCopyDictionary copy](-[THModelContentNode presentationContentBodies](self, "presentationContentBodies"), "copy");
  os_unfair_lock_unlock(&self->mLoadStateLock);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = v4;
  v5 = objc_msgSend(v4, "allKeys");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v9);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v11 = -[THModelContentNode storagesForPresentationType:](self, "storagesForPresentationType:", v10);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v15));
              v15 = (char *)v15 + 1;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v13);
        }
        v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  return v3;
}

- (int64_t)p_binarySearchPageArray:(id)a3 forCharacterIndex:(unint64_t)a4 min:(int64_t)a5 max:(int64_t)a6
{
  int64_t v6;
  int64_t v7;
  int64_t v8;
  id v12;

  if (a6 < a5)
    return 0x7FFFFFFFFFFFFFFFLL;
  v7 = a6;
  v8 = a5;
  v6 = a5 + (a6 - a5) / 2;
  v12 = objc_msgSend(a3, "objectAtIndex:", v6);
  if ((unint64_t)objc_msgSend(v12, "pageStartCharIndex") <= a4)
  {
    if ((unint64_t)objc_msgSend(v12, "pageEndCharIndex") > a4)
      return v6;
    v8 = v6 + 1;
  }
  else
  {
    v7 = v6 - 1;
  }
  return -[THModelContentNode p_binarySearchPageArray:forCharacterIndex:min:max:](self, "p_binarySearchPageArray:forCharacterIndex:min:max:", a3, a4, v8, v7);
}

- (unint64_t)relativePageIndexForBodyCharacterIndex:(unint64_t)a3
{
  id v5;
  unint64_t result;

  v5 = objc_msgSend(-[THModelContentNode p_bodyForPresentationType:](self, "p_bodyForPresentationType:", +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THModelContentNode context](self, "context"))), "pages");
  if (objc_msgSend(v5, "count") == (char *)&dword_0 + 1)
    return 0;
  result = -[THModelContentNode p_binarySearchPageArray:forCharacterIndex:min:max:](self, "p_binarySearchPageArray:forCharacterIndex:min:max:", v5, a3, 0, (char *)objc_msgSend(v5, "count") - 1);
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!a3)
      return 0;
    if (objc_msgSend(objc_msgSend(v5, "objectAtIndex:", (char *)objc_msgSend(v5, "count") - 1), "pageEndCharIndex") == (id)a3)
      return (unint64_t)objc_msgSend(v5, "count") - 1;
    else
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (unint64_t)relativePageIndexForCharacterIndex:(unint64_t)a3 forInfo:(id)a4
{
  uint64_t v7;
  uint64_t v8;

  if (!a4)
    return 0x7FFFFFFFFFFFFFFFLL;
  v7 = objc_opt_class(THWPStorage, a2);
  v8 = TSUDynamicCast(v7, a4);
  if (v8 && -[THModelContentNode isBodyStorage:](self, "isBodyStorage:", v8))
    return -[THModelContentNode relativePageIndexForBodyCharacterIndex:](self, "relativePageIndexForBodyCharacterIndex:", a3);
  else
    return -[THModelContentNode relativePageIndexForInfo:forPresentationType:](self, "relativePageIndexForInfo:forPresentationType:", a4, +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THModelContentNode context](self, "context")));
}

- (void)accumulateDisplayPageNumbersIntoAbsolutePageIndexMap:(id)a3 AndDisplayPageNumberArray:(id)a4
{
  id v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSNull *v16;
  id v17;
  id v18;
  NSNull *v19;

  v7 = +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THModelContentNode context](self, "context"));
  v8 = -[THModelContentNode pageCountForPresentationType:](self, "pageCountForPresentationType:", v7);
  v9 = -[THModelNode precedingPageCountForPresentationType:](self, "precedingPageCountForPresentationType:", v7);
  v10 = -[THModelContentNode displayStartingPageNumberForPresentationType:](self, "displayStartingPageNumberForPresentationType:", v7);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL && v9 != 0x7FFFFFFFFFFFFFFFLL && v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = v10;
    v14 = -[THModelContentNode displayStartingPageFormatForPresentationType:](self, "displayStartingPageFormatForPresentationType:", v7);
    if (v8)
    {
      v15 = v14;
      do
      {
        v16 = (NSNull *)objc_msgSend(+[NSString stringForValue:withListNumberFormat:includeFormatting:](NSString, "stringForValue:withListNumberFormat:includeFormatting:", v13, v15, 0), "lowercaseString");
        v17 = objc_msgSend(a3, "objectForKey:", v16);
        if (!v17)
        {
          v17 = +[NSMutableArray array](NSMutableArray, "array");
          objc_msgSend(a3, "setObject:forKey:", v17, v16);
        }
        objc_msgSend(v17, "addObject:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9));
        if (v16)
        {
          v18 = a4;
          v19 = v16;
        }
        else
        {
          v19 = +[NSNull null](NSNull, "null");
          v18 = a4;
        }
        objc_msgSend(v18, "insertObject:atIndex:", v19, v9);
        v13 = (v13 + 1);
        ++v9;
        --v8;
      }
      while (v8);
    }
  }
}

- (id)nodeUniqueIDForInfo:(id)a3 forPresentationType:(id)a4
{
  return objc_msgSend(-[THModelContentNode p_bodyForPresentationType:](self, "p_bodyForPresentationType:", a4), "nodeUniqueIDForInfo:", a3);
}

- (id)infoForNodeUniqueID:(id)a3 forPresentationType:(id)a4
{
  return objc_msgSend(-[THModelContentNode p_bodyForPresentationType:](self, "p_bodyForPresentationType:", a4), "infoForNodeUniqueID:", a3);
}

- (id)infoForNodeUniqueID:(id)a3
{
  return -[THModelContentNode infoForNodeUniqueID:forPresentationType:](self, "infoForNodeUniqueID:forPresentationType:", a3, -[THModelNode paginatedPresentationType](self, "paginatedPresentationType"));
}

- (void)setNodeUniqueID:(id)a3 forInfo:(id)a4 presentationType:(id)a5
{
  objc_msgSend(-[THModelContentNode p_bodyForPresentationType:](self, "p_bodyForPresentationType:", a5), "setNodeUniqueID:forInfo:", a3, a4);
}

- (BOOL)isBodyStorage:(id)a3
{
  os_unfair_lock_s *p_mLoadStateLock;
  int mLoadState;
  unsigned int v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  mLoadState = self->mLoadState;
  if ((mLoadState - 3) >= 2)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode isBodyStorage:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m"), 597, CFSTR("Asking about an info from unloaded node. Where did the info even come from?"));
    mLoadState = self->mLoadState;
  }
  v7 = mLoadState - 1;
  os_unfair_lock_unlock(p_mLoadStateLock);
  if (v7 <= 1)
    -[THModelContentNode willReadJustLoad](self, "willReadJustLoad");
  os_unfair_lock_lock(p_mLoadStateLock);
  v8 = -[TSUNoCopyDictionary allValues](-[THModelContentNode presentationContentBodies](self, "presentationContentBodies"), "allValues");
  os_unfair_lock_unlock(p_mLoadStateLock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12), "bodyStorage") == a3)
        {
          LOBYTE(v9) = 1;
          return (char)v9;
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v10 = v9;
      if (v9)
        continue;
      break;
    }
  }
  return (char)v9;
}

- (BOOL)hasBodyStorageUID:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  -[THModelContentNode willReadJustLoad](self, "willReadJustLoad");
  v5 = -[TSUNoCopyDictionary allValues](-[THModelContentNode presentationContentBodies](self, "presentationContentBodies"), "allValues");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "nodeUniqueIDForInfo:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "bodyStorage")), "isEqualToString:", a3) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          return (char)v6;
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v7 = v6;
      if (v6)
        continue;
      break;
    }
  }
  return (char)v6;
}

- (id)nodeUniqueIDForInfo:(id)a3
{
  os_unfair_lock_s *p_mLoadStateLock;
  unsigned int v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id result;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  v6 = self->mLoadState - 1;
  os_unfair_lock_unlock(p_mLoadStateLock);
  if (v6 <= 1)
    -[THModelContentNode willReadJustLoad](self, "willReadJustLoad");
  os_unfair_lock_lock(p_mLoadStateLock);
  v7 = -[TSUNoCopyDictionary allValues](-[THModelContentNode presentationContentBodies](self, "presentationContentBodies"), "allValues");
  os_unfair_lock_unlock(p_mLoadStateLock);
  if (self->mLoadState < 3u)
    return 0;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v8)
  {
LABEL_12:
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode nodeUniqueIDForInfo:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m"), 671, CFSTR("Couldn't find unique ID for info: %@"), a3);
    return 0;
  }
  v9 = v8;
  v10 = *(_QWORD *)v14;
LABEL_6:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v14 != v10)
      objc_enumerationMutation(v7);
    result = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "nodeUniqueIDForInfo:", a3);
    if (result)
      return result;
    if (v9 == (id)++v11)
    {
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
}

- (BOOL)containsInfo:(id)a3
{
  os_unfair_lock_s *p_mLoadStateLock;
  int mLoadState;
  unsigned int v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  mLoadState = self->mLoadState;
  if ((mLoadState - 3) >= 2)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode containsInfo:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m"), 680, CFSTR("Asking for id from unloaded node. Where did the info even come from?"));
    mLoadState = self->mLoadState;
  }
  v7 = mLoadState - 1;
  os_unfair_lock_unlock(p_mLoadStateLock);
  if (v7 <= 1)
    -[THModelContentNode willReadJustLoad](self, "willReadJustLoad");
  os_unfair_lock_lock(p_mLoadStateLock);
  v8 = -[TSUNoCopyDictionary allValues](-[THModelContentNode presentationContentBodies](self, "presentationContentBodies"), "allValues");
  os_unfair_lock_unlock(p_mLoadStateLock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12), "infos"), "containsObject:", a3) & 1) != 0)
        {
          LOBYTE(v9) = 1;
          return (char)v9;
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v10 = v9;
      if (v9)
        continue;
      break;
    }
  }
  return (char)v9;
}

- (void)setStorageAnchor:(id)a3 forAnchorId:(id)a4
{
  if (objc_msgSend(a3, "contentNode") != self)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode setStorageAnchor:forAnchorId:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m"), 708, CFSTR("THModelStorageAnchor.context should match THModelContentNodeBody.context"));
  -[THModelContentNode willModify](self, "willModify");
  -[NSMutableDictionary setObject:forKey:](self->mStorageAnchorsForAnchorID, "setObject:forKey:", a3, a4);
}

- (id)storageAnchorForNodeRelativePageIndex:(unint64_t)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;

  -[THModelContentNode willRead](self, "willRead");
  v5 = -[THModelContentNode pageAtRelativeIndex:forPresentationType:](self, "pageAtRelativeIndex:forPresentationType:", a3, +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THModelContentNode context](self, "context")));
  if (v5
    && ((v6 = v5, v7 = objc_msgSend(v5, "bodyStorageRange"), v7 != (id)0x7FFFFFFFFFFFFFFFLL)
     || -[THModelContentNode reflowablePaginationController](self, "reflowablePaginationController")
     && (v9 = -[THReflowablePaginationController paginationResultForContentNode:](-[THModelContentNode reflowablePaginationController](self, "reflowablePaginationController"), "paginationResultForContentNode:", self)) != 0&& (v7 = objc_msgSend(v9, "hintRangeForRelativePageIndex:", a3), v7 != (id)0x7FFFFFFFFFFFFFFFLL)))
  {
    return +[THModelStorageAnchor storageAnchorWithContentNode:storageUID:range:](THModelStorageAnchor, "storageAnchorWithContentNode:storageUID:range:", self, -[THModelContentNode nodeUniqueIDForInfo:](self, "nodeUniqueIDForInfo:", objc_msgSend(v6, "bodyStorage")), v7, v8);
  }
  else
  {
    return 0;
  }
}

- (id)storageAnchorForAnchorId:(id)a3
{
  -[THModelContentNode willRead](self, "willRead");
  return -[NSMutableDictionary objectForKey:](-[THModelContentNode storageAnchorsForAnchorID](self, "storageAnchorsForAnchorID"), "objectForKey:", a3);
}

- (void)setStorage:(id)a3 range:(_NSRange)a4 forAnchorId:(id)a5
{
  -[THModelContentNode setStorageAnchor:forAnchorId:](self, "setStorageAnchor:forAnchorId:", +[THModelStorageAnchor storageAnchorWithContentNode:storageUID:range:](THModelStorageAnchor, "storageAnchorWithContentNode:storageUID:range:", self, -[THModelContentNode nodeUniqueIDForInfo:](self, "nodeUniqueIDForInfo:", a3), a4.location, a4.length), a5);
}

- (void)setAbsolutePhysicalPageIndex:(unint64_t)a3 forFragment:(id)a4
{
  -[THModelContentNode willModify](self, "willModify");
  -[NSMutableDictionary setObject:forKey:](-[THModelContentNode fragmentPhysicalPageIndexes](self, "fragmentPhysicalPageIndexes"), "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3), a4);
}

- (unint64_t)absolutePhysicalPageIndex:(unint64_t)a3 forFragment:(id)a4
{
  id v4;

  v4 = -[NSMutableDictionary objectForKey:](-[THModelContentNode fragmentPhysicalPageIndexes](self, "fragmentPhysicalPageIndexes", a3), "objectForKey:", a4);
  if (v4)
    return (unint64_t)objc_msgSend(v4, "unsignedIntegerValue");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setStorageAnchorsForAnchorIDs:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  -[NSMutableDictionary removeAllObjects](self->mStorageAnchorsForAnchorID, "removeAllObjects");
  v5 = objc_msgSend(a3, "allKeys");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(a3, "objectForKey:", v10);
        objc_msgSend(v11, "setContentNode:", self);
        -[NSMutableDictionary setObject:forKey:](self->mStorageAnchorsForAnchorID, "setObject:forKey:", v11, v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
}

- (void)p_setStorageAnchorsForCfis:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  -[NSMutableDictionary removeAllObjects](self->mStorageAnchorsForCfiFrag, "removeAllObjects");
  v5 = objc_msgSend(a3, "allKeys");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(a3, "objectForKey:", v10);
        objc_msgSend(v11, "setContentNode:", self);
        -[NSMutableDictionary setObject:forKey:](self->mStorageAnchorsForCfiFrag, "setObject:forKey:", v11, v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
}

- (id)p_cfiFragsForOffsetsComparator
{
  return &stru_427740;
}

- (BOOL)p_possiblyReplaceCFIFragmentForExistingOffsetEntry:(id)a3 newEntry:(id)a4
{
  id v6;
  id v7;

  v6 = objc_msgSend(objc_msgSend(a3, "first"), "compare:", objc_msgSend(a4, "first"));
  if (!v6)
  {
    v7 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "second"), "componentsSeparatedByString:", CFSTR("/")), "count");
    if (v7 > objc_msgSend(objc_msgSend(objc_msgSend(a3, "second"), "componentsSeparatedByString:", CFSTR("/")), "count"))objc_msgSend(a3, "setSecond:", objc_msgSend(a4, "second"));
  }
  return v6 == 0;
}

- (void)p_setTextChildOffsetStorageAnchorsForCfis:(id)a3
{
  id v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  TSUMutablePair *v14;
  char *v15;
  NSObject *v16;
  id v17;
  __int128 v18;
  id v19;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  _BYTE v28[128];

  -[NSMutableDictionary removeAllObjects](self->mTextChildOffsetStorageAnchorsForCfiFrag, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->mCfiFragsForTextChildOffsets, "removeAllObjects");
  v5 = objc_msgSend(a3, "allKeys");
  v19 = -[THModelContentNode p_cfiFragsForOffsetsComparator](self, "p_cfiFragsForOffsetsComparator");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v23;
    *(_QWORD *)&v7 = 138543362;
    v18 = v7;
    do
    {
      v10 = 0;
      v20 = v8;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v10);
        v12 = objc_msgSend(a3, "objectForKey:", v11, v18);
        objc_msgSend(v12, "setContentNode:", self);
        -[NSMutableDictionary setObject:forKey:](self->mTextChildOffsetStorageAnchorsForCfiFrag, "setObject:forKey:", v12, v11);
        if (objc_msgSend(v12, "storageUID"))
        {
          if (objc_msgSend(v12, "storageUID"))
          {
            v13 = -[NSMutableDictionary objectForKeyedSubscript:](self->mCfiFragsForTextChildOffsets, "objectForKeyedSubscript:", objc_msgSend(v12, "storageUID"));
            if (!v13)
            {
              v13 = +[NSMutableArray array](NSMutableArray, "array");
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->mCfiFragsForTextChildOffsets, "setObject:forKeyedSubscript:", v13, objc_msgSend(v12, "storageUID"));
            }
            v14 = +[TSUMutablePair pairWithFirst:second:](TSUMutablePair, "pairWithFirst:second:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "range")), v11);
            v15 = (char *)objc_msgSend(v13, "indexOfObject:inSortedRange:options:usingComparator:", v14, 0, objc_msgSend(v13, "count"), 1024, v19);
            v8 = v20;
            if ((objc_msgSend(v13, "count") <= v15
               || !-[THModelContentNode p_possiblyReplaceCFIFragmentForExistingOffsetEntry:newEntry:](self, "p_possiblyReplaceCFIFragmentForExistingOffsetEntry:newEntry:", objc_msgSend(v13, "objectAtIndexedSubscript:", v15), v14))&& (!v15|| objc_msgSend(v13, "count") <= v15 - 1|| !-[THModelContentNode p_possiblyReplaceCFIFragmentForExistingOffsetEntry:newEntry:](self, "p_possiblyReplaceCFIFragmentForExistingOffsetEntry:newEntry:", objc_msgSend(v13, "objectAtIndexedSubscript:"), v14)))
            {
              objc_msgSend(v13, "insertObject:atIndex:", v14, v15);
            }
          }
        }
        else
        {
          v16 = THLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v17 = objc_msgSend(v12, "description");
            *(_DWORD *)buf = v18;
            v27 = v17;
            _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Encountered invalid anchor %{public}@.  This can happen when two TSWPStorages share an ID.  Will not use this anchor in the CFI fragment reverse map.", buf, 0xCu);
          }
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v8);
  }
}

- (id)storageAnchorForCfiFrag:(id)a3
{
  id result;

  -[THModelContentNode willRead](self, "willRead");
  result = -[NSMutableDictionary objectForKey:](-[THModelContentNode storageAnchorsForCfiFrag](self, "storageAnchorsForCfiFrag"), "objectForKey:", a3);
  if (!result)
    return -[NSMutableDictionary objectForKey:](-[THModelContentNode textChildOffsetStorageAnchorsForCfiFrag](self, "textChildOffsetStorageAnchorsForCfiFrag"), "objectForKey:", a3);
  return result;
}

- (id)cfiFragWithOffset:(unint64_t)a3 storageUID:(id)a4 pedantic:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  void *v11;
  NSNumber *v12;
  char *v13;
  id v14;
  id v15;
  int64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  _BOOL4 v24;
  BOOL v25;
  id v26;
  unint64_t v27;
  id v28;
  const __CFString *v29;

  v5 = a5;
  -[THModelContentNode willRead](self, "willRead");
  if (v5)
  {
    v9 = -[THModelContentNode p_cfiFragsForOffsetsComparator](self, "p_cfiFragsForOffsetsComparator");
    v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->mCfiFragsForTextChildOffsets, "objectForKeyedSubscript:", a4);
    if (v10)
    {
      v11 = v10;
      v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3);
      v13 = (char *)objc_msgSend(v11, "indexOfObject:inSortedRange:options:usingComparator:", +[TSUMutablePair pairWithFirst:second:](TSUMutablePair, "pairWithFirst:second:", v12, &stru_43D7D8), 0, objc_msgSend(v11, "count"), 1024, v9);
      if (objc_msgSend(v11, "count") > v13
        && !objc_msgSend(objc_msgSend(objc_msgSend(v11, "objectAtIndexedSubscript:", v13), "first"), "compare:", v12))
      {
        v15 = objc_msgSend(objc_msgSend(v11, "objectAtIndexedSubscript:", v13), "second");
        v16 = 0;
LABEL_30:
        v19 = v15;
        if (v15)
          goto LABEL_31;
        return 0;
      }
      if (v13 && objc_msgSend(v11, "count") > v13 - 1)
      {
        v14 = objc_msgSend(v11, "objectAtIndexedSubscript:");
        v15 = objc_msgSend(v14, "second");
        v16 = a3 - (_QWORD)objc_msgSend(objc_msgSend(v14, "first"), "integerValue");
        goto LABEL_30;
      }
    }
    return 0;
  }
  v17 = -[NSMutableDictionary keyEnumerator](self->mStorageAnchorsForCfiFrag, "keyEnumerator");
  v18 = objc_msgSend(v17, "nextObject");
  if (!v18)
    return 0;
  v19 = v18;
  v15 = 0;
  v16 = -1;
  while (1)
  {
    v20 = -[THModelContentNode storageAnchorForCfiFrag:](self, "storageAnchorForCfiFrag:", v19);
    if (objc_msgSend(objc_msgSend(v20, "storageUID"), "isEqualToString:", a4))
      break;
LABEL_26:
    v19 = objc_msgSend(v17, "nextObject");
    if (!v19)
      goto LABEL_30;
  }
  v21 = objc_msgSend(v20, "range");
  v22 = a3 - (_QWORD)v21;
  if ((id)a3 != v21)
  {
    v24 = v16 == -1 || v22 < v16;
    v25 = !v24;
    if (v24)
      v26 = v19;
    else
      v26 = v15;
    if (v25)
      v27 = v16;
    else
      v27 = a3 - (_QWORD)v21;
    if (v22 >= 1)
    {
      v15 = v26;
      v16 = v27;
    }
    goto LABEL_26;
  }
  v16 = 0;
LABEL_31:
  if (v5 || (v28 = -[NSMutableDictionary objectForKey:](self->mAnchorForCfiFrag, "objectForKey:", v19)) == 0)
    v29 = &stru_43D7D8;
  else
    v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@]"), v28);
  return objc_msgSend(v19, "stringByAppendingFormat:", CFSTR("%@:%ld"), v29, v16);
}

- (id)storageAnchorForCfiInnerPathReader:(id)a3
{
  char *v5;
  id v6;
  id v7;
  int v8;
  char *v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  id v14;
  uint64_t v15;
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v20 = 0;
  v5 = (char *)objc_msgSend(a3, "componentCount");
  v6 = objc_msgSend(a3, "pathStringNoIds");
  if (v5)
  {
    v7 = v6;
    v8 = 0;
    do
    {
      if ((v8 & 1) != 0)
      {
        objc_msgSend(a3, "componentAtIndex:identifier:", --v5, &v20);
        v7 = objc_msgSend(v7, "stringByDeletingLastPathComponent");
        v9 = 0;
      }
      else
      {
        v9 = (char *)objc_msgSend(a3, "characterOffsetTerminatingStepIdentifier:", &v20);
        --v5;
      }
      if (v20)
      {
        v10 = -[THModelContentNode storageAnchorForAnchorId:](self, "storageAnchorForAnchorId:");
        if (v10)
        {
          v12 = v10;
          if ((v8 & 1) == 0)
            goto LABEL_17;
          goto LABEL_20;
        }
      }
      v11 = -[THModelContentNode storageAnchorForCfiFrag:](self, "storageAnchorForCfiFrag:", v7);
      v12 = v11;
      if (v11)
        v13 = 0;
      else
        v13 = v8 == 0;
      if (v13)
        v8 = 1;
    }
    while (!v11 && v5);
    if ((v8 & 1) == 0)
    {
LABEL_17:
      if (!v12)
        return 0;
      goto LABEL_18;
    }
LABEL_20:
    v17 = -[THModelContentNode cfiFragWithOffset:storageUID:pedantic:](self, "cfiFragWithOffset:storageUID:pedantic:", objc_msgSend(v12, "range"), objc_msgSend(v12, "storageUID"), 0);
    if (v17 && objc_msgSend(a3, "updateWithCfiFrag:toIndex:", v17, v5 + 1))
    {
      v18 = objc_msgSend(a3, "pathStringNoIds");
      v19 = v12;
      if (v18)
      {
        v19 = -[THModelContentNode storageAnchorForCfiFrag:](self, "storageAnchorForCfiFrag:", v18);
        v9 = (char *)objc_msgSend(a3, "characterOffsetTerminatingStepIdentifier:", &v20);
      }
    }
    else
    {
      v19 = v12;
    }
    if (v19)
      v12 = v19;
    else
      v9 = 0;
    if (v12)
    {
LABEL_18:
      v14 = objc_msgSend(v12, "range");
      return +[THModelStorageAnchor storageAnchorWithContentNode:storageUID:range:](THModelStorageAnchor, "storageAnchorWithContentNode:storageUID:range:", self, objc_msgSend(v12, "storageUID"), &v9[(_QWORD)v14], v15);
    }
  }
  return 0;
}

- (id)storageAnchorForCfiReader:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _BYTE *v12;
  int64_t v13;
  _BYTE *v14;

  -[THModelContentNode willRead](self, "willRead");
  v5 = objc_msgSend(a3, "innerPathReader");
  v6 = objc_msgSend(a3, "innerPathMaxRangeReader");
  v7 = -[THModelContentNode storageAnchorForCfiInnerPathReader:](self, "storageAnchorForCfiInnerPathReader:", v5);
  v8 = -[THModelContentNode storageAnchorForCfiInnerPathReader:](self, "storageAnchorForCfiInnerPathReader:", v6);
  if (v7)
  {
    v9 = v8;
    if (v8)
    {
      if (objc_msgSend(objc_msgSend(v7, "storageUID"), "isEqualToString:", objc_msgSend(v8, "storageUID")))
      {
        v10 = objc_msgSend(v9, "range");
        if (v10 <= objc_msgSend(v7, "range"))
        {
          v11 = objc_msgSend(v9, "range");
          v14 = objc_msgSend(v7, "range");
          v13 = v14 - (_BYTE *)objc_msgSend(v9, "range");
        }
        else
        {
          v11 = objc_msgSend(v7, "range");
          v12 = objc_msgSend(v9, "range");
          v13 = v12 - (_BYTE *)objc_msgSend(v7, "range");
        }
        objc_msgSend(v7, "setRange:", v11, v13);
      }
      else
      {
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode storageAnchorForCfiReader:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m"), 1046, CFSTR("Cannot resolve a modelStorageAnchorRange across storages."));
      }
    }
  }
  return v7;
}

- (id)storageAnchorAfterAnchor:(id)a3 forNthInstance:(unint64_t)a4 ofSearchString:(id)a5 presentationType:(id)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char *v14;
  _BYTE *v15;
  _BYTE *v16;
  char *v17;
  THModelStorageAnchor *v18;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  id v24;
  id v25;
  id v26;
  id v27;

  if (!a3)
    return 0;
  v9 = -[THModelContentNode infoForNodeUniqueID:forPresentationType:](self, "infoForNodeUniqueID:forPresentationType:", objc_msgSend(a3, "storageUID"), a6);
  v11 = objc_opt_class(THWPStorage, v10);
  v12 = TSUDynamicCast(v11, v9);
  if (!v12)
    return a3;
  v13 = (void *)v12;
  v14 = (char *)objc_msgSend(a3, "range");
  v15 = objc_msgSend(v13, "length");
  v16 = objc_msgSend(a3, "range");
  if (!a4)
    return a3;
  v17 = (char *)(v15 - v16);
  v18 = (THModelStorageAnchor *)a3;
  do
  {
    if (v14 == (char *)0x7FFFFFFFFFFFFFFFLL || v17 == 0)
      break;
    v20 = objc_msgSend(v13, "rangeOfString:searchOptions:range:", a5, 1, v14, v17);
    if (v20 == (_BYTE *)0x7FFFFFFFFFFFFFFFLL)
      break;
    v22 = v21;
    if (!v21)
      break;
    v23 = v20;
    if (a4 == 1)
    {
      v24 = a5;
      v25 = objc_msgSend(a3, "contentNode");
      v26 = objc_msgSend(a3, "storageUID");
      v27 = v25;
      a5 = v24;
      v18 = +[THModelStorageAnchor storageAnchorWithContentNode:storageUID:range:](THModelStorageAnchor, "storageAnchorWithContentNode:storageUID:range:", v27, v26, v23, v22);
    }
    else
    {
      v14 = &v20[v21];
      v17 = (char *)((_BYTE *)objc_msgSend(v13, "length") - &v20[v21]);
    }
    --a4;
  }
  while (a4);
  return v18;
}

- (id)cfiForOffset:(unint64_t)a3 storageUID:(id)a4 includeFilename:(BOOL)a5 pedantic:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  id v11;
  NSString *v12;

  v6 = a6;
  v7 = a5;
  -[THModelContentNode willRead](self, "willRead");
  if (!self->mCfiBase)
    self->mCfiBase = (NSString *)&stru_43D7D8;
  v11 = -[THModelContentNode cfiFragWithOffset:storageUID:pedantic:](self, "cfiFragWithOffset:storageUID:pedantic:", a3, a4, v6);
  if (v7)
    v12 = -[NSURL lastPathComponent](self->mApplePubURL, "lastPathComponent");
  else
    v12 = 0;
  return +[THCFIReader cfiWithFilename:base:innerComponents:](THCFIReader, "cfiWithFilename:base:innerComponents:", v12, self->mCfiBase, v11);
}

- (id)cfiForRange:(_NSRange)a3 storageUID:(id)a4 includeFilename:(BOOL)a5 pedantic:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  NSString *v14;

  v6 = a6;
  v7 = a5;
  length = a3.length;
  location = a3.location;
  -[THModelContentNode willRead](self, "willRead");
  if (self->mCfiBase)
  {
    if (length)
      goto LABEL_3;
    return -[THModelContentNode cfiForOffset:storageUID:includeFilename:pedantic:](self, "cfiForOffset:storageUID:includeFilename:pedantic:", location, a4, v7, v6);
  }
  self->mCfiBase = (NSString *)&stru_43D7D8;
  if (!length)
    return -[THModelContentNode cfiForOffset:storageUID:includeFilename:pedantic:](self, "cfiForOffset:storageUID:includeFilename:pedantic:", location, a4, v7, v6);
LABEL_3:
  v12 = -[THModelContentNode cfiFragWithOffset:storageUID:pedantic:](self, "cfiFragWithOffset:storageUID:pedantic:", location, a4, v6);
  v13 = -[THModelContentNode cfiFragWithOffset:storageUID:pedantic:](self, "cfiFragWithOffset:storageUID:pedantic:", location + length, a4, v6);
  if (v7)
  {
    v14 = -[NSURL lastPathComponent](self->mApplePubURL, "lastPathComponent");
    if (!v12)
      return 0;
  }
  else
  {
    v14 = 0;
    if (!v12)
      return 0;
  }
  if (v13)
    return +[THCFIReader cfiRangeWithFilename:base:innerComponents1:innerComponents2:](THCFIReader, "cfiRangeWithFilename:base:innerComponents1:innerComponents2:", v14, self->mCfiBase, v12, v13);
  return 0;
}

- (id)pageNumberStringForAbsolutePageIndex:(unint64_t)a3 presentationType:(id)a4
{
  unint64_t v7;
  objc_super v9;

  v7 = -[THModelContentNode displayStartingPageNumberForPresentationType:](self, "displayStartingPageNumberForPresentationType:", a4);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    return +[NSString stringForValue:withListNumberFormat:includeFormatting:](NSString, "stringForValue:withListNumberFormat:includeFormatting:", -[THModelNode relativePageIndexForAbsolutePageIndex:forPresentationType:](self, "relativePageIndexForAbsolutePageIndex:forPresentationType:", a3, a4)+ v7, -[THModelContentNode displayStartingPageFormatForPresentationType:](self, "displayStartingPageFormatForPresentationType:", a4), 0);
  v9.receiver = self;
  v9.super_class = (Class)THModelContentNode;
  return -[THModelNode pageNumberStringForAbsolutePageIndex:presentationType:](&v9, "pageNumberStringForAbsolutePageIndex:presentationType:", a3, a4);
}

- (id)gutterStorageForPresentationType:(id)a3
{
  return objc_msgSend(-[THModelContentNode p_bodyForPresentationType:](self, "p_bodyForPresentationType:", a3), "gutterDrawableStorage");
}

- (id)expandableInfoForWidgetInfo:(id)a3 forPresentationType:(id)a4
{
  return objc_msgSend(-[THModelContentNode p_bodyForPresentationType:](self, "p_bodyForPresentationType:", a4), "expandableInfoForWidgetInfo:", a3);
}

- (unint64_t)bodyCharIndexForGutterDrawableForWidgetInfo:(id)a3 forPresentationType:(id)a4
{
  id v6;

  v6 = -[THModelContentNode expandableInfoForWidgetInfo:forPresentationType:](self, "expandableInfoForWidgetInfo:forPresentationType:", a3);
  if (v6)
    return (unint64_t)objc_msgSend(-[THModelContentNode p_bodyForPresentationType:](self, "p_bodyForPresentationType:", a4), "bodyCharIndexOfGutterDrawable:", v6);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)p_clearFieldsForFutureLoading
{

  self->mStorageAnchorsForAnchorID = 0;
  self->mStorageAnchorsForCfiFrag = 0;

  self->mTextChildOffsetStorageAnchorsForCfiFrag = 0;
  self->mCfiFragsForTextChildOffsets = 0;

  self->mAnchorForCfiFrag = 0;
  -[THModelContentNode setStorageAnchorsForAnchorID:](self, "setStorageAnchorsForAnchorID:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[THModelContentNode setStorageAnchorsForCfiFrag:](self, "setStorageAnchorsForCfiFrag:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[THModelContentNode setTextChildOffsetStorageAnchorsForCfiFrag:](self, "setTextChildOffsetStorageAnchorsForCfiFrag:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[THModelContentNode setCfiFragsForTextChildOffsets:](self, "setCfiFragsForTextChildOffsets:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[THModelContentNode setAnchorForCfiFrag:](self, "setAnchorForCfiFrag:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
}

- (void)startLoading
{
  os_unfair_lock_s *p_mLoadStateLock;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[5];
  _QWORD v7[6];
  _QWORD block[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  -[THModelContentNode p_releaseFlushedBodies](self, "p_releaseFlushedBodies");
  if (!self->mLoadState)
  {
    v4 = _os_activity_create(&dword_0, "Content Node Load", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_3393C;
    block[3] = &unk_427768;
    block[4] = self;
    block[5] = &v9;
    os_activity_apply(v4, block);

  }
  if (-[THModelContentNode paginatedBodyStale](self, "paginatedBodyStale"))
  {
    v5 = _os_activity_create(&dword_0, "Content Node Load Paginated Body Stale", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_33A94;
    v7[3] = &unk_426E28;
    v7[4] = self;
    v7[5] = v5;
    os_activity_apply(v5, v7);

  }
  os_unfair_lock_unlock(p_mLoadStateLock);
  if (*((_BYTE *)v10 + 24))
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_33B20;
    v6[3] = &unk_427790;
    v6[4] = self;
    +[THPerformanceRegressionLogger logEventWithBlock:](THPerformanceRegressionLogger, "logEventWithBlock:", v6);
  }
  _Block_object_dispose(&v9, 8);
}

- (void)cancelLoading
{
  os_unfair_lock_s *p_mLoadStateLock;
  int mLoadState;

  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  mLoadState = self->mLoadState;
  if ((mLoadState - 1) >= 2)
  {
    if (mLoadState == 3)
    {
      -[THReflowableContentPaginationOperation cancel](self->_paginationOperation, "cancel");

      self->_paginationOperation = 0;
    }
  }
  else
  {
    -[THModelContentLoadOperation cancel](self->mLoadOperation, "cancel");
    self->mLoadState = 0;

    self->mLoadOperation = 0;
    -[THModelContentNode p_clearFieldsForFutureLoading](self, "p_clearFieldsForFutureLoading");
  }
  -[THModelContentNode setPaginatedBodyStale:](self, "setPaginatedBodyStale:", 0);
  os_unfair_lock_unlock(p_mLoadStateLock);
}

- (void)performWhenFinishedLoading:(id)a3 onError:(id)a4
{
  os_unfair_lock_s *p_mLoadStateLock;
  int mLoadState;
  THModelContentLoadOperation *mLoadOperation;
  _QWORD v10[7];

  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  mLoadState = self->mLoadState;
  if (!mLoadState)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode performWhenFinishedLoading:onError:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m"), 1283, CFSTR("should be loading before this is called"));
    mLoadState = self->mLoadState;
  }
  if (mLoadState != 5)
  {
    if (mLoadState != 4)
    {
      mLoadOperation = self->mLoadOperation;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_33D38;
      v10[3] = &unk_4277B8;
      v10[4] = self;
      v10[5] = a4;
      v10[6] = a3;
      -[THModelContentLoadOperation appendMainThreadCompletionBlock:](mLoadOperation, "appendMainThreadCompletionBlock:", v10);
      os_unfair_lock_unlock(p_mLoadStateLock);
      return;
    }
    a4 = a3;
  }
  os_unfair_lock_unlock(p_mLoadStateLock);
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)waitUntilFinishedLoading
{
  os_unfair_lock_s *p_mLoadStateLock;
  unsigned int mLoadState;
  THModelContentLoadOperation *v5;

  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  mLoadState = self->mLoadState;
  if (!mLoadState)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode waitUntilFinishedLoading]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m"), 1311, CFSTR("should be loading before this is called"));
    mLoadState = self->mLoadState;
  }
  if (mLoadState == 1)
  {
    self->mLoadState = 2;
  }
  else if (mLoadState > 2)
  {
    v5 = 0;
    goto LABEL_8;
  }
  v5 = self->mLoadOperation;
LABEL_8:
  os_unfair_lock_unlock(p_mLoadStateLock);
  -[THModelContentLoadOperation waitUntilFinished](v5, "waitUntilFinished");

}

- (void)waitUntilFinishedLoadingAndPaginating
{
  os_activity_t v3;
  THReflowableContentPaginationOperation *v4;

  -[THModelContentNode waitUntilFinishedLoading](self, "waitUntilFinishedLoading");
  os_unfair_lock_lock(&self->mLoadStateLock);
  if (-[THModelContentNode paginatedBodyStale](self, "paginatedBodyStale"))
  {
    v3 = _os_activity_create(&dword_0, "Model Node Wait Until Finished Paginating", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    -[THReflowableContentPaginationOperation cancel](self->_paginationOperation, "cancel");

    self->_paginationOperation = 0;
    -[THModelContentNode setPaginatedBodyStale:](self, "setPaginatedBodyStale:", 0);
    self->mLoadState = 3;
    self->_paginationOperation = (THReflowableContentPaginationOperation *)-[THReflowablePaginationController paginateContentNode:paginationCompletionDelegate:priority:isForeground:activity:](-[THModelContentNode reflowablePaginationController](self, "reflowablePaginationController"), "paginateContentNode:paginationCompletionDelegate:priority:isForeground:activity:", self, self, 8, 1, v3);

  }
  if (self->mLoadState == 3)
    v4 = self->_paginationOperation;
  else
    v4 = 0;
  os_unfair_lock_unlock(&self->mLoadStateLock);
  -[THReflowableContentPaginationOperation waitUntilFinished](v4, "waitUntilFinished");

}

- (BOOL)isLoaded
{
  return self->mLoadState == 4;
}

- (void)paginationController:(id)a3 paginatedBody:(id)a4 forPresentationType:(id)a5
{
  os_unfair_lock_s *p_mLoadStateLock;
  id v9;
  void *v10;
  int64_t *p_mLoadedBodyRetainCount;
  int64_t v12;
  int64_t mLoadedBodyRetainCount;
  int64_t v14;
  id v15;
  int64_t v16;
  id v17;

  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  if (self->mLoadState != 3)
    goto LABEL_15;
  v9 = -[TSUNoCopyDictionary objectForKey:](-[THModelContentNode presentationContentBodies](self, "presentationContentBodies"), "objectForKey:", a5);
  if (!v9)
  {
    mLoadedBodyRetainCount = self->mLoadedBodyRetainCount;
    goto LABEL_8;
  }
  v10 = v9;
  -[TSUNoCopyDictionary removeObjectForKey:](-[THModelContentNode presentationContentBodies](self, "presentationContentBodies"), "removeObjectForKey:", a5);
  objc_msgSend(v10, "ownerRelease");
  p_mLoadedBodyRetainCount = &self->mLoadedBodyRetainCount;
  if (self->mLoadedBodyRetainCount >= 1)
  {
    v12 = 0;
    do
    {

      ++v12;
      mLoadedBodyRetainCount = *p_mLoadedBodyRetainCount;
    }
    while (v12 < *p_mLoadedBodyRetainCount);
LABEL_8:
    p_mLoadedBodyRetainCount = &self->mLoadedBodyRetainCount;
    if (mLoadedBodyRetainCount >= 1)
    {
      v14 = 0;
      do
      {
        v15 = a4;
        ++v14;
      }
      while (v14 < *p_mLoadedBodyRetainCount);
    }
  }
  objc_msgSend(a4, "ownerRetain");
  objc_msgSend(a4, "setParent:", self);
  -[TSUNoCopyDictionary setObject:forUncopiedKey:](-[THModelContentNode presentationContentBodies](self, "presentationContentBodies"), "setObject:forUncopiedKey:", a4, a5);
  -[THModelNode setPageCount:forPresentationType:](self, "setPageCount:forPresentationType:", objc_msgSend(a4, "pageCount"), a5);
  if (self->mPreloadingBodyRetainCount >= 1)
  {
    v16 = 0;
    do
    {
      v17 = a4;
      ++v16;
    }
    while (v16 < self->mPreloadingBodyRetainCount);
  }
  objc_msgSend(a4, "ownerAutoreleasedAccess");

  self->_paginationOperation = 0;
  *p_mLoadedBodyRetainCount += self->mPreloadingBodyRetainCount;
  self->mPreloadingBodyRetainCount = 0;
  self->mLoadState = 4;
LABEL_15:
  os_unfair_lock_unlock(p_mLoadStateLock);
}

- (void)contentLoadOperationFailed:(id)mLoadOperation
{
  os_unfair_lock_s *p_mLoadStateLock;

  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  if ((objc_msgSend(mLoadOperation, "isCancelled") & 1) != 0)
  {
    self->mLoadState = 0;

    self->mLoadOperation = 0;
    -[THModelContentNode p_clearFieldsForFutureLoading](self, "p_clearFieldsForFutureLoading");
  }
  else
  {
    self->mLoadState = 5;
    objc_msgSend(-[THModelContentNode documentRoot](self, "documentRoot"), "setIsCorrupt:", 1);
    if (self->mLoadOperation != mLoadOperation)
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContentNode contentLoadOperationFailed:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContentNode.m"), 1441, CFSTR("unknown operation failed"));
      mLoadOperation = self->mLoadOperation;
    }

    self->mLoadOperation = 0;
  }
  os_unfair_lock_unlock(p_mLoadStateLock);
}

- (void)contentLoadOperation:(id)a3 loadedContentBodies:(id)a4
{
  os_unfair_lock_s *p_mLoadStateLock;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD block[8];

  p_mLoadStateLock = &self->mLoadStateLock;
  os_unfair_lock_lock(&self->mLoadStateLock);
  if ((objc_msgSend(a3, "isCancelled") & 1) != 0)
  {
    self->mLoadState = 0;

    self->mLoadOperation = 0;
    -[THModelContentNode p_clearFieldsForFutureLoading](self, "p_clearFieldsForFutureLoading");
  }
  else
  {
    v8 = _os_activity_create(&dword_0, "Load Operation Finished", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_34380;
    block[3] = &unk_4272D8;
    block[4] = self;
    block[5] = a4;
    block[6] = v8;
    block[7] = a3;
    os_activity_apply(v8, block);

  }
  os_unfair_lock_unlock(p_mLoadStateLock);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_34890;
  v9[3] = &unk_427790;
  v9[4] = self;
  +[THPerformanceRegressionLogger logEventWithBlock:](THPerformanceRegressionLogger, "logEventWithBlock:", v9);
}

- (id)annotationIDForInfo:(id)a3
{
  id result;
  uint64_t v5;

  result = -[THModelContentNode nodeUniqueIDForInfo:](self, "nodeUniqueIDForInfo:", a3);
  if (result)
    return objc_msgSend((id)objc_opt_class(self, v5), "annotationIDForInfoID:contentNodeID:", result, -[THModelNode nodeGUID](self, "nodeGUID"));
  return result;
}

+ (id)annotationIDForInfoID:(id)a3 contentNodeID:(id)a4
{
  if (a3 && a4)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), a4, a3);
  else
    return 0;
}

- (id)legacyBookmarkIDForInfo:(id)a3
{
  id result;
  uint64_t v5;
  id v6;
  void *v7;

  result = -[THModelContentNode nodeUniqueIDForInfo:](self, "nodeUniqueIDForInfo:", a3);
  if (result)
  {
    v6 = result;
    v7 = (void *)objc_opt_class(self, v5);
    return objc_msgSend(v7, "legacyBookmarkIDForInfoID:contentNodeID:", v6, -[THModelNode nodeGUID](self, "nodeGUID"));
  }
  return result;
}

+ (id)legacyBookmarkIDForInfoID:(id)a3 contentNodeID:(id)a4
{
  BOOL v4;

  if (a4)
    v4 = a3 == 0;
  else
    v4 = 1;
  if (v4)
    return 0;
  else
    return a3;
}

- (NSString)description
{
  id v3;
  unint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", 0);
  v4 = -[THModelContentNode displayStartingPageNumberForPresentationType:](self, "displayStartingPageNumberForPresentationType:", v3);
  v5 = (char *)-[THModelContentNode pageCountForPresentationType:](self, "pageCountForPresentationType:", v3) + v4 - 1;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@* %p title=%@ pp. %lu-%lu presentations = %@>"), objc_opt_class(self, v6), self, -[THModelNode title](self, "title"), v4, v5, self->mPresentationContentBodies);
}

- (THReflowablePaginationController)reflowablePaginationController
{
  return self->_reflowablePaginationController;
}

- (void)setReflowablePaginationController:(id)a3
{
  self->_reflowablePaginationController = (THReflowablePaginationController *)a3;
}

- (BOOL)navigationPageNode
{
  return self->_navigationPageNode;
}

- (void)setNavigationPageNode:(BOOL)a3
{
  self->_navigationPageNode = a3;
}

- (THReflowableContentPaginationOperation)paginationOperation
{
  return self->_paginationOperation;
}

- (void)setPaginationOperation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (BOOL)paginatedBodyStale
{
  return self->_paginatedBodyStale;
}

- (void)setPaginatedBodyStale:(BOOL)a3
{
  self->_paginatedBodyStale = a3;
}

- (BOOL)hasCachedVersion
{
  PFXArchive *v3;
  BOOL v4;

  if (!self->mApplePubURL || !self->mPublicationContext)
    return 0;
  v3 = -[PFXArchive initWithPath:]([PFXArchive alloc], "initWithPath:", -[NSURL path](self->mApplePubURL, "path"));
  v4 = -[PFXArchive entryWithName:](v3, "entryWithName:", self->mPublicationContext) != 0;

  return v4;
}

- (id)applePubEntryID
{
  return self->mPublicationContext;
}

- (void)setApplePubEntryID:(id)a3
{
  id v3;

  if (self->mPublicationContext != a3)
  {
    v3 = a3;
    if (objc_msgSend(a3, "hasPrefix:", CFSTR("/")))
      v3 = objc_msgSend(v3, "substringFromIndex:", 1);

    self->mPublicationContext = (NSString *)v3;
  }
}

- (void)setCfiBaseWithState:(id)a3
{
  id v4;
  id v5;

  v4 = objc_msgSend(objc_msgSend(a3, "spineURLToCfi"), "objectForKey:", objc_msgSend(CFSTR("/"), "stringByAppendingString:", self->mPublicationContext));
  if (!-[NSString isEqualToString:](self->mCfiBase, "isEqualToString:", v4))
  {
    v5 = v4;

    self->mCfiBase = (NSString *)v4;
  }
}

- (BOOL)hasCachedVersionInZip:(id)a3
{
  return +[PFXUtilities hasEntry:inArchive:](PFXUtilities, "hasEntry:inArchive:", -[NSString stringByAppendingString:](self->mPublicationContext, "stringByAppendingString:", CFSTR("/")), a3);
}

- (void)setApplePubURLWithState:(id)a3
{
  NSURL *v5;
  NSURL *mApplePubURL;

  v5 = (NSURL *)objc_msgSend(a3, "applePubZipURL");
  if (-[THModelContentNode hasCachedVersionInZip:](self, "hasCachedVersionInZip:", objc_msgSend(a3, "archive")))
  {
    mApplePubURL = self->mApplePubURL;
    if (mApplePubURL != v5)
    {

      self->mApplePubURL = v5;
    }
  }
}

@end
