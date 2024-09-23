@implementation THCoreDataAnnotationSource

- (THCoreDataAnnotationSource)initWithAnnotationController:(id)a3 contentNode:(id)a4 storageId:(id)a5 storageLength:(unint64_t)a6
{
  THCoreDataAnnotationSource *v9;
  THCoreDataAnnotationSource *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)THCoreDataAnnotationSource;
  v9 = -[THCoreDataAnnotationSource init](&v12, "init", a3, a4, a5, a6);
  v10 = v9;
  if (v9)
  {
    v9->mContentNode = (THModelContentNode *)a4;
    v9->mAnnotationController = (THAnnotationStorageController *)a3;
    v9->mStorageID = (NSString *)a5;
    v10->mInterestedParties = (TSUMutablePointerSet *)objc_alloc_init((Class)TSUMutablePointerSet);
    v10->mCachedAnnotations = (THAnnotationCache *)-[THAnnotationStorageController cachedAnnotationsForContentNode:](v10->mAnnotationController, "cachedAnnotationsForContentNode:", v10->mContentNode);
    -[THAnnotationStorageController registerAnnotationObserver:forContentNode:](v10->mAnnotationController, "registerAnnotationObserver:forContentNode:", v10, v10->mContentNode);
    -[THCoreDataAnnotationSource updateAnnotations](v10, "updateAnnotations");
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  self->mStorageID = 0;
  self->mInterestedParties = 0;

  self->mCachedAnnotations = 0;
  self->mAnnotationController = 0;
  v3.receiver = self;
  v3.super_class = (Class)THCoreDataAnnotationSource;
  -[THCoreDataAnnotationSource dealloc](&v3, "dealloc");
}

- (void)p_rangeChanged:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  NSRange v16;
  NSRange v17;

  length = a3.length;
  location = a3.location;
  objc_sync_enter(self);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = -[TSUMutablePointerSet objectEnumerator](self->mInterestedParties, "objectEnumerator", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v16.location = (NSUInteger)objc_msgSend(v10, "rangeOfInterest");
        v17.location = location;
        v17.length = length;
        if (NSIntersectionRange(v16, v17).length)
          objc_msgSend(v10, "annotationsChangedInRange:", location, length);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  objc_sync_exit(self);
}

- (void)updateAnnotations
{
  id v3;

  v3 = objc_msgSend(-[THAnnotationStorageController cachedAnnotationsForContentNode:](self->mAnnotationController, "cachedAnnotationsForContentNode:", self->mContentNode), "newAnnotationCacheWithTemporaryAnnotation:", -[THCoreDataAnnotationSource temporaryAnnotation](self, "temporaryAnnotation"));
  objc_sync_enter(self);
  -[THCoreDataAnnotationSource p_updateCachedAnnotations:](self, "p_updateCachedAnnotations:", v3);
  objc_sync_exit(self);

}

- (void)p_updateCachedAnnotations:(id)a3
{
  id mCachedAnnotations;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  mCachedAnnotations = self->mCachedAnnotations;
  if (mCachedAnnotations == a3)
    return;
  if (!mCachedAnnotations)
  {
    if (!a3)
    {
      v8 = 0;
      v6 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_6;
    }
    mCachedAnnotations = a3;
  }
  v6 = (uint64_t)objc_msgSend(mCachedAnnotations, "differenceRangeWithCache:storageUID:");
  v8 = v7;
LABEL_6:

  self->mCachedAnnotations = 0;
  self->mCachedAnnotations = (THAnnotationCache *)a3;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0)
    -[THCoreDataAnnotationSource p_rangeChanged:](self, "p_rangeChanged:", v6, v8);
}

- (NSArray)annotations
{
  id v3;

  objc_sync_enter(self);
  v3 = -[THAnnotationCache annotationsForStorageUID:](self->mCachedAnnotations, "annotationsForStorageUID:", self->mStorageID);
  objc_sync_exit(self);
  return (NSArray *)v3;
}

- (id)annotationsForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id result;
  _QWORD v6[6];

  if (!a3.length)
    return 0;
  length = a3.length;
  location = a3.location;
  result = -[THCoreDataAnnotationSource annotations](self, "annotations");
  if (result)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_113D64;
    v6[3] = &unk_429C38;
    v6[4] = location;
    v6[5] = length;
    return objc_msgSend(result, "tsu_arrayOfObjectsPassingTest:", v6);
  }
  return result;
}

- (void)setTemporaryAnnotation:(id)a3
{
  id v5;

  objc_sync_enter(self);
  v5 = -[THAnnotationCache newAnnotationCacheWithTemporaryAnnotation:](self->mCachedAnnotations, "newAnnotationCacheWithTemporaryAnnotation:", a3);
  -[THCoreDataAnnotationSource p_updateCachedAnnotations:](self, "p_updateCachedAnnotations:", v5);

  objc_sync_exit(self);
}

- (THAnnotation)temporaryAnnotation
{
  THAnnotation *v3;

  objc_sync_enter(self);
  v3 = -[THAnnotationCache temporaryAnnotation](self->mCachedAnnotations, "temporaryAnnotation");
  objc_sync_exit(self);
  return v3;
}

- (void)addInterest:(id)a3
{
  objc_sync_enter(self);
  if (a3)
    -[TSUMutablePointerSet addObject:](self->mInterestedParties, "addObject:", a3);
  ++self->mInterestCount;
  objc_sync_exit(self);
}

- (void)removeInterest:(id)a3
{
  objc_sync_enter(self);
  if (a3)
    -[TSUMutablePointerSet removeObject:](self->mInterestedParties, "removeObject:", a3);
  --self->mInterestCount;
  objc_sync_exit(self);
}

- (void)annotationControllerTeardown
{
  -[THAnnotationStorageController unregisterAnnotationObserver:forContentNode:](self->mAnnotationController, "unregisterAnnotationObserver:forContentNode:", self, self->mContentNode);

  self->mAnnotationController = 0;
}

- (THAnnotationStorageController)annotationController
{
  return self->mAnnotationController;
}

- (void)setAnnotationController:(id)a3
{
  self->mAnnotationController = (THAnnotationStorageController *)a3;
}

- (NSString)storageID
{
  return self->mStorageID;
}

@end
