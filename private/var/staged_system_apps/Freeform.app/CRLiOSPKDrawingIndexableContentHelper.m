@implementation CRLiOSPKDrawingIndexableContentHelper

- (CRLiOSPKDrawingIndexableContentHelper)init
{
  CRLiOSPKDrawingIndexableContentHelper *v2;
  CRLiOSPKDrawingIndexableContentHelper *v3;
  uint64_t v4;
  NSMutableDictionary *boardIdentifierStringsToDrawingIndexedContents;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRLiOSPKDrawingIndexableContentHelper;
  v2 = -[CRLiOSPKDrawingIndexableContentHelper init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    v2->_indexedContentsAccessLock._os_unfair_lock_opaque = 0;
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    boardIdentifierStringsToDrawingIndexedContents = v3->_boardIdentifierStringsToDrawingIndexedContents;
    v3->_boardIdentifierStringsToDrawingIndexedContents = (NSMutableDictionary *)v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, "p_currentActiveBoardDidUpdatePKDrawingIndexedContents:", CFSTR("CRLActiveBoardDidUpdateDrawingIndexedContentsNotification"), 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, "p_startCachingDrawingIndexedContents:", CFSTR("CRLActiveBoardDidOpenToCacheAllDrawingIndexedContents"), 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, "p_removeAllCachedDrawingIndexedContents:", CFSTR("CRLActiveBoardDidCloseToRemoveAllCachedDrawingIndexedContents"), 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *boardIdentifierStringsToDrawingIndexedContents;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("CRLActiveBoardDidUpdateDrawingIndexedContentsNotification"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("CRLActiveBoardDidOpenToCacheAllDrawingIndexedContents"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("CRLActiveBoardDidCloseToRemoveAllCachedDrawingIndexedContents"), 0);

  -[NSMutableDictionary removeAllObjects](self->_boardIdentifierStringsToDrawingIndexedContents, "removeAllObjects");
  boardIdentifierStringsToDrawingIndexedContents = self->_boardIdentifierStringsToDrawingIndexedContents;
  self->_boardIdentifierStringsToDrawingIndexedContents = 0;

  v7.receiver = self;
  v7.super_class = (Class)CRLiOSPKDrawingIndexableContentHelper;
  -[CRLiOSPKDrawingIndexableContentHelper dealloc](&v7, "dealloc");
}

- (id)drawingIndexedContentsFromBoardWithIdentifierString:(id)a3
{
  os_unfair_lock_s *p_indexedContentsAccessLock;
  id v5;
  void *v6;

  p_indexedContentsAccessLock = &self->_indexedContentsAccessLock;
  v5 = a3;
  os_unfair_lock_lock(p_indexedContentsAccessLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_boardIdentifierStringsToDrawingIndexedContents, "objectForKey:", v5));

  os_unfair_lock_unlock(p_indexedContentsAccessLock);
  return v6;
}

- (void)removeDrawingIndexedContentsFromBoardWithIdentifierString:(id)a3
{
  os_unfair_lock_s *p_indexedContentsAccessLock;
  id v5;

  p_indexedContentsAccessLock = &self->_indexedContentsAccessLock;
  v5 = a3;
  os_unfair_lock_lock(p_indexedContentsAccessLock);
  -[NSMutableDictionary removeObjectForKey:](self->_boardIdentifierStringsToDrawingIndexedContents, "removeObjectForKey:", v5);

  os_unfair_lock_unlock(p_indexedContentsAccessLock);
}

- (void)p_currentActiveBoardDidUpdatePKDrawingIndexedContents:(id)a3
{
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v19;

  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  *(_QWORD *)&v5 = objc_opt_class(NSString, v4).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("CRLActiveBoardDidUpdateDrawingIndexedContentsBoardIdentifierString"), v5));
  v9 = sub_100221D0C(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  *(_QWORD *)&v12 = objc_opt_class(NSArray, v11).n128_u64[0];
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("CRLActiveBoardDidUpdateDrawingIndexedContents"), v12));
  v16 = sub_100221D0C(v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  if (v10)
  {
    if (objc_msgSend(v10, "length") && v17 != 0)
    {
      os_unfair_lock_lock(&self->_indexedContentsAccessLock);
      if (self->_shouldCacheIndexedContents)
        -[NSMutableDictionary setObject:forKey:](self->_boardIdentifierStringsToDrawingIndexedContents, "setObject:forKey:", v17, v10);
      os_unfair_lock_unlock(&self->_indexedContentsAccessLock);
    }
  }

}

- (void)p_startCachingDrawingIndexedContents:(id)a3
{
  os_unfair_lock_s *p_indexedContentsAccessLock;

  p_indexedContentsAccessLock = &self->_indexedContentsAccessLock;
  os_unfair_lock_lock(&self->_indexedContentsAccessLock);
  self->_shouldCacheIndexedContents = 1;
  os_unfair_lock_unlock(p_indexedContentsAccessLock);
}

- (void)p_removeAllCachedDrawingIndexedContents:(id)a3
{
  os_unfair_lock_s *p_indexedContentsAccessLock;

  p_indexedContentsAccessLock = &self->_indexedContentsAccessLock;
  os_unfair_lock_lock(&self->_indexedContentsAccessLock);
  self->_shouldCacheIndexedContents = 0;
  -[NSMutableDictionary removeAllObjects](self->_boardIdentifierStringsToDrawingIndexedContents, "removeAllObjects");
  os_unfair_lock_unlock(p_indexedContentsAccessLock);
}

+ (id)indexableStringFromDrawing:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_msgSend(a3, "copy");
  objc_msgSend(v3, "setRecognitionEnabled:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexableContent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentableTextRepresentation"));

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boardIdentifierStringsToDrawingIndexedContents, 0);
}

@end
