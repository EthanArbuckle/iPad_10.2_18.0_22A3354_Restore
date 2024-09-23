@implementation THAnnotationController

- (THAnnotationController)initWithAnnotationProvider:(id)a3 documentNavigationModel:(id)a4
{
  THAnnotationController *v6;
  THAnnotationController *v7;
  NSPredicate *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)THAnnotationController;
  v6 = -[THAnnotationController init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    v6->mCurrentStyle = 3;
    v6->mAnnotationProvider = (AEAnnotationProvider *)a3;
    -[THAnnotationController setDocumentNavModel:](v7, "setDocumentNavModel:", a4);
    -[THAnnotationController setDocumentRoot:](v7, "setDocumentRoot:", objc_msgSend(a4, "documentRoot"));
    v7->mObservers = (TSURetainedPointerKeyDictionary *)objc_alloc_init((Class)TSURetainedPointerKeyDictionary);
    v7->mCachedAnnotations = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v7->mAEAnnotationManagedObjectIDs = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v7->mAnnotationCache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    -[THAnnotationController setManagedObjectContextSaveObserver:](v7, "setManagedObjectContextSaveObserver:", -[NSNotificationCenter addNonBlockingObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addNonBlockingObserver:selector:name:object:", v7, "p_managedObjectContextDidSaveNotification:", NSManagedObjectContextDidSaveNotification, 0));
    -[THAnnotationController setBasePredicate:](v7, "setBasePredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(annotationAssetID == %@) && (annotationDeleted == NO)"), -[THAnnotationController annotationID](v7, "annotationID")));
    v8 = -[THAnnotationController basePredicate](v7, "basePredicate");
    -[THAnnotationController setNonCurrentVersionPredicate:](v7, "setNonCurrentVersionPredicate:", +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v8, +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("((%K != %@) || (%K==nil))"), kAEAnnotationAssetVersionKey, -[THBookVersion versionString](-[THDocumentProperties bookVersion](-[THDocumentRoot properties](-[THAnnotationController documentRoot](v7, "documentRoot"), "properties"), "bookVersion"), "versionString"),
            kAEAnnotationAssetVersionKey),
          0)));
    -[THAnnotationController setRangePredicate:](v7, "setRangePredicate:", +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", -[THAnnotationController basePredicate](v7, "basePredicate"), +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(annotationType==%d)"), 2), 0)));
    -[THAnnotationController setPointPredicate:](v7, "setPointPredicate:", +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", -[THAnnotationController basePredicate](v7, "basePredicate"), +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(annotationType==%d)"), 1), 0)));
    -[THAnnotationController setGlobalPredicate:](v7, "setGlobalPredicate:", +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", -[THAnnotationController basePredicate](v7, "basePredicate"), +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(annotationType==%d)"), 3), 0)));
    -[THAnnotationController setNonOrphanedPredicate:](v7, "setNonOrphanedPredicate:", +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", -[THAnnotationController basePredicate](v7, "basePredicate"), +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(annotationLocation!=nil)")), 0)));
    -[THAnnotationController setNonOrphanedRangePredicate:](v7, "setNonOrphanedRangePredicate:", +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", -[THAnnotationController nonOrphanedPredicate](v7, "nonOrphanedPredicate"), +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(annotationType==%d)"), 2), 0)));
    -[THAnnotationController setNonSponsoredNonOrphanedPredicate:](v7, "setNonSponsoredNonOrphanedPredicate:", +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", -[THAnnotationController nonOrphanedPredicate](v7, "nonOrphanedPredicate"), -[THAnnotationController p_nonSponsoredPredicateWithDocumentRoot:](v7, "p_nonSponsoredPredicateWithDocumentRoot:", objc_msgSend(a4, "documentRoot")), 0)));
    -[THAnnotationController setOrphanedPredicate:](v7, "setOrphanedPredicate:", +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", -[THAnnotationController basePredicate](v7, "basePredicate"), +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(annotationLocation==nil)")), 0)));
    -[THAnnotationController setOrphanedRangePredicate:](v7, "setOrphanedRangePredicate:", +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", -[THAnnotationController orphanedPredicate](v7, "orphanedPredicate"), +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(annotationType==%d)"), 2), 0)));
    -[THAnnotationController setNonSponsoredPredicate:](v7, "setNonSponsoredPredicate:", +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", -[THAnnotationController basePredicate](v7, "basePredicate"), -[THAnnotationController p_nonSponsoredPredicateWithDocumentRoot:](v7, "p_nonSponsoredPredicateWithDocumentRoot:", objc_msgSend(a4, "documentRoot")), 0)));
    -[THAnnotationController setAnnotationsReadEnabled:](v7, "setAnnotationsReadEnabled:", 1);
    -[THAnnotationController setAnnotationsWriteEnabled:](v7, "setAnnotationsWriteEnabled:", 1);
  }
  return v7;
}

- (void)teardown
{

  self->mObservers = 0;
  self->mBookmarkObservers = 0;

  self->mUndoObservers = 0;
  if (self->mUndoManager)
    -[THAnnotationController unregisterWithUndoManager:](self, "unregisterWithUndoManager:");
  -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", -[THAnnotationController managedObjectContextSaveObserver](self, "managedObjectContextSaveObserver"));
  -[THAnnotationController setManagedObjectContextSaveObserver:](self, "setManagedObjectContextSaveObserver:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[THAnnotationController teardown](self, "teardown");
  -[THAnnotationController setDocumentRoot:](self, "setDocumentRoot:", 0);
  -[THAnnotationController setDocumentNavModel:](self, "setDocumentNavModel:", 0);
  -[THAnnotationController setBasePredicate:](self, "setBasePredicate:", 0);
  -[THAnnotationController setNonOrphanedPredicate:](self, "setNonOrphanedPredicate:", 0);
  -[THAnnotationController setOrphanedPredicate:](self, "setOrphanedPredicate:", 0);
  -[THAnnotationController setRangePredicate:](self, "setRangePredicate:", 0);
  -[THAnnotationController setPointPredicate:](self, "setPointPredicate:", 0);
  -[THAnnotationController setGlobalPredicate:](self, "setGlobalPredicate:", 0);
  -[THAnnotationController setNonCurrentVersionPredicate:](self, "setNonCurrentVersionPredicate:", 0);
  -[THAnnotationController setNonOrphanedRangePredicate:](self, "setNonOrphanedRangePredicate:", 0);
  -[THAnnotationController setOrphanedRangePredicate:](self, "setOrphanedRangePredicate:", 0);
  -[THAnnotationController setNonSponsoredPredicate:](self, "setNonSponsoredPredicate:", 0);
  -[THAnnotationController setNonSponsoredNonOrphanedPredicate:](self, "setNonSponsoredNonOrphanedPredicate:", 0);
  -[THAnnotationController setLastCommitMoc:](self, "setLastCommitMoc:", 0);
  if (self->mObservers)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 591, CFSTR("someone forgot to call -teardown"));

  self->mAnnotationProvider = 0;
  self->mAnnotationID = 0;

  self->mObservers = 0;
  self->mBookmarkObservers = 0;

  self->mCachedAnnotations = 0;
  self->mAEAnnotationManagedObjectIDs = 0;

  self->mAnnotationCache = 0;
  if (self->mCurrentUndoGroup || self->mCurrentChangeList)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 600, CFSTR("should not be deallocated with open groups"));
  if (self->mUndoObservers || self->mUndoManager)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 601, CFSTR("undo manager and observers should have been released during teardown"));
  v3.receiver = self;
  v3.super_class = (Class)THAnnotationController;
  -[THAnnotationController dealloc](&v3, "dealloc");
}

- (void)p_managedObjectContextDidSaveNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_managedObjectContextDidSaveNotification:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 608, CFSTR("This operation must only be performed on the main thread."));
  v6 = objc_opt_class(AEAnnotationManagedObjectContext, v5);
  v7 = (void *)TSUDynamicCast(v6, objc_msgSend(a3, "object"));
  if (objc_msgSend(v7, "sessionContextType") == 2)
  {
    v8 = objc_msgSend(v7, "persistentStoreCoordinator");
    if (v8 == -[AEAnnotationProvider persistentStoreCoordinator](self->mAnnotationProvider, "persistentStoreCoordinator"))
    {
      objc_sync_enter(self);
      -[THAnnotationController p_invalidateCaches](self, "p_invalidateCaches");
      objc_sync_exit(self);
      -[THAnnotationController p_clearUndoStack](self, "p_clearUndoStack");
    }
  }
}

- (void)p_commitChangesWithMoc:(id)a3
{
  -[THAnnotationController setLastCommitMoc:](self, "setLastCommitMoc:");
  -[AEAnnotationProvider saveManagedObjectContext:](self->mAnnotationProvider, "saveManagedObjectContext:", a3);
}

- (void)p_invalidateCaches
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *k;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];

  -[NSMutableDictionary removeAllObjects](self->mCachedAnnotations, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->mAEAnnotationManagedObjectIDs, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->mAnnotationCache, "removeAllObjects");
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v3 = -[THDocumentNavigationModel contentNodes](-[THDocumentRoot navigationModel](-[THAnnotationController documentRoot](self, "documentRoot"), "navigationModel"), "contentNodes");
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v9 = -[THAnnotationController p_keyForContentNode:](self, "p_keyForContentNode:", v8);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v10 = -[TSURetainedPointerKeyDictionary objectForKey:](self->mObservers, "objectForKey:", v9);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(_QWORD *)v25 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j), "annotationsUpdatedForContentNode:", v8);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
          }
          while (v12);
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v5);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = -[TSURetainedPointerKeyDictionary objectForKey:](self->mObservers, "objectForKey:", CFSTR("THMacAnnotationLostOrphans"), 0);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (k = 0; k != v17; k = (char *)k + 1)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)k), "annotationsUpdatedForContentNode:", 0);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }
}

- (id)p_keyForContentNode:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "nodeGUID");
  else
    return CFSTR("THMacAnnotationLostOrphans");
}

- (id)annotationID
{
  id result;

  result = self->mAnnotationID;
  if (!result)
  {
    result = -[THBookDescription annotationID](-[THDocumentRoot bookDescription](-[THAnnotationController documentRoot](self, "documentRoot"), "bookDescription"), "annotationID");
    self->mAnnotationID = (NSString *)result;
    if (!result)
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController annotationID]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 682, CFSTR("invalid nil value for '%s'"), "mAnnotationID");
      return self->mAnnotationID;
    }
  }
  return result;
}

- (id)p_annotationsForFetchRequest:(id)a3 moc:(id)a4 migrateIfNecessary:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  NSString *v11;
  NSString *v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  _BYTE v22[128];

  v5 = a5;
  if (!-[THAnnotationController annotationsReadEnabled](self, "annotationsReadEnabled"))
    return 0;
  v21 = 0;
  v9 = objc_msgSend(a4, "executeFetchRequest:error:", a3, &v21);
  if (v21)
  {
    v10 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_annotationsForFetchRequest:moc:migrateIfNecessary:]");
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, v12, 708, CFSTR("Error fetching exceptions: %@"), objc_msgSend(v21, "description"));
  }
  if (v5)
  {
    -[THAnnotationController p_openActionGroup](self, "p_openActionGroup");
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v9);
          -[THAnnotationController p_migrateAEAnnotationIfNecessary:moc:](self, "p_migrateAEAnnotationIfNecessary:moc:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v15), a4);
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v13);
    }
    -[THAnnotationController p_closeActionGroupWithMoc:](self, "p_closeActionGroupWithMoc:", a4);
  }
  return v9;
}

- (id)p_fetchedResultsControllerForFetchRequest:(id)a3 moc:(id)a4
{
  if (-[THAnnotationController annotationsReadEnabled](self, "annotationsReadEnabled"))
    return objc_msgSend(objc_alloc((Class)IMUbiquitousFetchedResultsController), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", a3, a4, 0, 0);
  else
    return 0;
}

- (id)p_nonSponsoredPredicateWithDocumentRoot:(id)a3
{
  id v4;
  id v5;
  NSCompoundPredicate *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(objc_msgSend(a3, "rootNode"), "addMappingFromGUIDToNodeToDictionary:", v4);
  v5 = objc_msgSend(v4, "allKeys");
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = sub_88A0C;
  v13 = sub_88A1C;
  v14 = 0;
  v14 = +[NSMutableArray array](NSMutableArray, "array");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_88A28;
  v8[3] = &unk_428660;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
  v6 = +[NSCompoundPredicate notPredicateWithSubpredicate:](NSCompoundPredicate, "notPredicateWithSubpredicate:", +[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v10[5]));
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)p_rangeAnnotationPredicateWithPredicate:(id)a3
{
  return +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", -[THAnnotationController rangePredicate](self, "rangePredicate"), a3, 0));
}

- (id)p_pointAnnotationPredicateWithPredicate:(id)a3
{
  return +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", -[THAnnotationController pointPredicate](self, "pointPredicate"), a3, 0));
}

- (id)p_nonCurrentVersionPredicateWithPredicate:(id)a3
{
  return +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", -[THAnnotationController nonCurrentVersionPredicate](self, "nonCurrentVersionPredicate"), a3, 0));
}

- (id)p_nonOrphanedRangeAnnotationPredicateWithPredicate:(id)a3
{
  return +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", -[THAnnotationController nonOrphanedRangePredicate](self, "nonOrphanedRangePredicate"), a3, 0));
}

- (id)p_annotationRequestForAnnotationUUID:(id)a3 includeDeleted:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  id v8;
  NSPredicate *v9;

  v4 = a4;
  v7 = objc_alloc((Class)NSFetchRequest);
  v8 = objc_msgSend(v7, "initWithEntityName:", kAEAnnotationEntityName);
  if (v4)
    v9 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(annotationAssetID == %@)"), -[THAnnotationController annotationID](self, "annotationID"));
  else
    v9 = -[THAnnotationController basePredicate](self, "basePredicate");
  objc_msgSend(v8, "setPredicate:", +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v9, +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(annotationUuid == %@)"), a3), 0)));
  return v8;
}

- (id)p_storageAnnotationForUUID:(id)a3 includeDeleted:(BOOL)a4 moc:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  NSString *v11;
  NSString *v12;
  id v13;
  id v15;

  if (!a3)
    return 0;
  v6 = a4;
  if (!objc_msgSend(a3, "length"))
    return 0;
  v15 = 0;
  v9 = objc_msgSend(a5, "executeFetchRequest:error:", -[THAnnotationController p_annotationRequestForAnnotationUUID:includeDeleted:](self, "p_annotationRequestForAnnotationUUID:includeDeleted:", a3, v6), &v15);
  if (v15)
  {
    v10 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_storageAnnotationForUUID:includeDeleted:moc:]");
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, v12, 810, CFSTR("Error fetching execeptions: %@"), objc_msgSend(v15, "description"));
  }
  if (!objc_msgSend(v9, "count"))
    return 0;
  v13 = objc_msgSend(v9, "objectAtIndex:", 0);
  if (objc_msgSend(v9, "count") != (char *)&dword_0 + 1)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_storageAnnotationForUUID:includeDeleted:moc:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 814, CFSTR("Found %lu annotations matching UUID %@."), objc_msgSend(v9, "count"), a3);
  return v13;
}

- (id)annotationRequestForStorageID:(id)a3
{
  id v5;
  id v6;

  v5 = objc_alloc((Class)NSFetchRequest);
  v6 = objc_msgSend(v5, "initWithEntityName:", kAEAnnotationEntityName);
  objc_msgSend(v6, "setPredicate:", -[THAnnotationController p_nonOrphanedRangeAnnotationPredicateWithPredicate:](self, "p_nonOrphanedRangeAnnotationPredicateWithPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(plStorageUUID == %@)"), a3)));
  objc_msgSend(v6, "setSortDescriptors:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", +[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("plLocationRangeStart"), 0)));
  return v6;
}

- (id)p_annotationRequestForStorageID:(id)a3 intersectingRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;

  length = a4.length;
  location = a4.location;
  v8 = objc_alloc((Class)NSFetchRequest);
  v9 = objc_msgSend(v8, "initWithEntityName:", kAEAnnotationEntityName);
  objc_msgSend(v9, "setPredicate:", -[THAnnotationController p_nonOrphanedRangeAnnotationPredicateWithPredicate:](self, "p_nonOrphanedRangeAnnotationPredicateWithPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(plStorageUUID == %@) && (plLocationRangeStart < %d) && (plLocationRangeEnd >= %d)"), a3, location + length, location)));
  objc_msgSend(v9, "setSortDescriptors:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", +[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("plLocationRangeStart"), 0)));
  return v9;
}

- (id)p_annotationRequestForAllNotesWithPredicate:(id)a3
{
  id v4;
  id v5;

  v4 = objc_alloc((Class)NSFetchRequest);
  v5 = objc_msgSend(v4, "initWithEntityName:", kAEAnnotationEntityName);
  objc_msgSend(v5, "setPredicate:", a3);
  objc_msgSend(v5, "setSortDescriptors:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", +[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("plLocationRangeStart"), 0)));
  return v5;
}

- (id)annotationRequestForAllNotes
{
  return -[THAnnotationController p_annotationRequestForAllNotesWithPredicate:](self, "p_annotationRequestForAllNotesWithPredicate:", -[THAnnotationController rangePredicate](self, "rangePredicate"));
}

- (id)annotationRequestForNonOrphanedNotes
{
  return -[THAnnotationController p_annotationRequestForAllNotesWithPredicate:](self, "p_annotationRequestForAllNotesWithPredicate:", -[THAnnotationController nonOrphanedRangePredicate](self, "nonOrphanedRangePredicate"));
}

- (id)annotationRequestForOrphanedNotes
{
  return -[THAnnotationController p_annotationRequestForAllNotesWithPredicate:](self, "p_annotationRequestForAllNotesWithPredicate:", -[THAnnotationController orphanedRangePredicate](self, "orphanedRangePredicate"));
}

- (id)annotationRequestForNonSponsoredNonOrphaned
{
  return -[THAnnotationController p_annotationRequestForAllNotesWithPredicate:](self, "p_annotationRequestForAllNotesWithPredicate:", -[THAnnotationController nonSponsoredNonOrphanedPredicate](self, "nonSponsoredNonOrphanedPredicate"));
}

- (id)p_annotationRequestForSearchText:(id)a3 conjoinedWithPredicate:(id)a4
{
  id v6;
  id v7;

  v6 = objc_alloc((Class)NSFetchRequest);
  v7 = objc_msgSend(v6, "initWithEntityName:", kAEAnnotationEntityName);
  objc_msgSend(v7, "setPredicate:", +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", a4, +[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationRepresentativeText contains[cd] %@"),
              a3),
            +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationNote contains[cd] %@"), a3), 0)), 0)));
  objc_msgSend(v7, "setSortDescriptors:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", +[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("plLocationRangeStart"), 0)));
  return v7;
}

- (id)annotationRequestForSearchText:(id)a3
{
  return -[THAnnotationController p_annotationRequestForSearchText:conjoinedWithPredicate:](self, "p_annotationRequestForSearchText:conjoinedWithPredicate:", a3, -[THAnnotationController rangePredicate](self, "rangePredicate"));
}

- (id)annotationRequestForNonOrphanedSearchText:(id)a3
{
  return -[THAnnotationController p_annotationRequestForSearchText:conjoinedWithPredicate:](self, "p_annotationRequestForSearchText:conjoinedWithPredicate:", a3, -[THAnnotationController nonOrphanedRangePredicate](self, "nonOrphanedRangePredicate"));
}

- (id)annotationRequestForOrphanedSearchText:(id)a3
{
  return -[THAnnotationController p_annotationRequestForSearchText:conjoinedWithPredicate:](self, "p_annotationRequestForSearchText:conjoinedWithPredicate:", a3, -[THAnnotationController orphanedRangePredicate](self, "orphanedRangePredicate"));
}

- (id)p_nonSponsoredAnnotationRequest
{
  id v3;
  id v4;

  v3 = objc_alloc((Class)NSFetchRequest);
  v4 = objc_msgSend(v3, "initWithEntityName:", kAEAnnotationEntityName);
  objc_msgSend(v4, "setPredicate:", -[THAnnotationController nonSponsoredPredicate](self, "nonSponsoredPredicate"));
  objc_msgSend(v4, "setSortDescriptors:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", +[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("plLocationRangeStart"), 0)));
  return v4;
}

- (id)p_annotationRequestForContentNode:(id)a3
{
  id v5;
  id v6;

  v5 = objc_alloc((Class)NSFetchRequest);
  v6 = objc_msgSend(v5, "initWithEntityName:", kAEAnnotationEntityName);
  objc_msgSend(v6, "setPredicate:", -[THAnnotationController p_rangeAnnotationPredicateWithPredicate:](self, "p_rangeAnnotationPredicateWithPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(plStorageUUID BEGINSWITH[n] %@)"), objc_msgSend(a3, "nodeGUID"))));
  objc_msgSend(v6, "setSortDescriptors:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", +[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("plLocationRangeStart"), 0)));
  return v6;
}

- (id)p_bookmarkSortDescriptorsAscending:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  NSArray *v6;
  NSSortDescriptor *v8;
  _QWORD v9[2];

  v3 = a3;
  if (-[THBookDescription isEpub](-[THDocumentRoot bookDescription](self->mDocumentRoot, "bookDescription"), "isEpub"))
  {
    v4 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:selector:", CFSTR("annotationLocation"), v3, "localizedStandardCompare:");
    v5 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("annotationCreationDate"), v3);
    v9[0] = v4;
    v9[1] = v5;
    v6 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2);

  }
  else
  {
    v8 = +[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("plAbsolutePhysicalLocation"), v3);
    return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1);
  }
  return v6;
}

- (id)p_bookmarkRequestForContentNode:(id)a3
{
  id v5;
  id v6;

  v5 = objc_alloc((Class)NSFetchRequest);
  v6 = objc_msgSend(v5, "initWithEntityName:", kAEAnnotationEntityName);
  objc_msgSend(v6, "setPredicate:", -[THAnnotationController p_pointAnnotationPredicateWithPredicate:](self, "p_pointAnnotationPredicateWithPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(plStorageUUID BEGINSWITH[n] %@)"), objc_msgSend(a3, "nodeGUID"))));
  objc_msgSend(v6, "setSortDescriptors:", -[THAnnotationController p_bookmarkSortDescriptorsAscending:](self, "p_bookmarkSortDescriptorsAscending:", 0));
  return v6;
}

- (id)p_annotationRequestForContentNode:(id)a3 withSearchText:(id)a4
{
  id v7;
  id v8;

  v7 = objc_alloc((Class)NSFetchRequest);
  v8 = objc_msgSend(v7, "initWithEntityName:", kAEAnnotationEntityName);
  objc_msgSend(v8, "setPredicate:", +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", -[THAnnotationController p_rangeAnnotationPredicateWithPredicate:](self, "p_rangeAnnotationPredicateWithPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(plStorageUUID BEGINSWITH[n] %@)"), objc_msgSend(a3, "nodeGUID"))), +[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:",
          +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationRepresentativeText contains[cd] %@"), a4), +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("annotationNote contains[cd] %@"), a4), 0)), 0)));
  objc_msgSend(v8, "setSortDescriptors:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", +[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("plLocationRangeStart"), 0)));
  return v8;
}

- (unint64_t)p_absolutePageIndexForCharacterIndex:(unint64_t)a3 withStorage:(id)a4 contentNode:(id)a5
{
  id v7;

  v7 = objc_msgSend(a5, "relativePageIndexForCharacterIndex:forInfo:", a3, a4);
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return (unint64_t)objc_msgSend(a5, "absolutePageIndexForRelativePageIndex:forPresentationType:", v7, +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THDocumentRoot context](-[THAnnotationController documentRoot](self, "documentRoot"), "context")));
}

- (BOOL)p_annotationNeedsMigration:(id)a3
{
  THBookVersion *v4;
  BOOL v5;

  v4 = -[THBookVersion initWithString:]([THBookVersion alloc], "initWithString:", objc_msgSend(a3, "annotationBookVersion"));
  v5 = -[THBookVersion isValid](-[THDocumentProperties bookVersion](-[THDocumentRoot properties](-[THAnnotationController documentRoot](self, "documentRoot"), "properties"), "bookVersion"), "isValid")&& (!-[THBookVersion isValid](v4, "isValid")|| -[THBookVersion isStrictlyNewerThanBookVersion:](-[THDocumentProperties bookVersion](-[THDocumentRoot properties](-[THAnnotationController documentRoot](self, "documentRoot"), "properties"), "bookVersion"), "isStrictlyNewerThanBookVersion:", v4));

  return v5;
}

- (BOOL)p_cachedAnnotationNeedsMigration:(id)a3
{
  THBookVersion *v4;
  BOOL v5;

  v4 = -[THBookVersion initWithString:]([THBookVersion alloc], "initWithString:", objc_msgSend(a3, "annotationBookVersion"));
  v5 = -[THBookVersion isValid](-[THDocumentProperties bookVersion](-[THDocumentRoot properties](-[THAnnotationController documentRoot](self, "documentRoot"), "properties"), "bookVersion"), "isValid")&& (!-[THBookVersion isValid](v4, "isValid")|| -[THBookVersion isStrictlyNewerThanBookVersion:](-[THDocumentProperties bookVersion](-[THDocumentRoot properties](-[THAnnotationController documentRoot](self, "documentRoot"), "properties"), "bookVersion"), "isStrictlyNewerThanBookVersion:", v4));

  return v5;
}

- (BOOL)p_annotationNeedsMigrationForAnnotationSchemaVersion:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "annotationVersion");
  return objc_msgSend(v3, "compare:options:", kAEAnnotationVersion_4, 64) == (id)-1;
}

- (id)contentNodeForAnnotation:(id)a3
{
  return -[THDocumentNavigationModel contentNodeForGUID:](-[THAnnotationController documentNavModel](self, "documentNavModel"), "contentNodeForGUID:", objc_msgSend(a3, "annotationContentNodeID"));
}

- (id)p_allBookmarksFetchRequest
{
  id v3;
  id v4;

  v3 = objc_alloc((Class)NSFetchRequest);
  v4 = objc_msgSend(v3, "initWithEntityName:", kAEAnnotationEntityName);
  objc_msgSend(v4, "setPredicate:", -[THAnnotationController pointPredicate](self, "pointPredicate"));
  objc_msgSend(v4, "setSortDescriptors:", -[THAnnotationController p_bookmarkSortDescriptorsAscending:](self, "p_bookmarkSortDescriptorsAscending:", 1));
  return v4;
}

- (id)allBookmarksFetchedResultsController
{
  id v3;
  id v4;
  id v5;

  v3 = -[THAnnotationController p_allBookmarksFetchRequest](self, "p_allBookmarksFetchRequest");
  v4 = objc_msgSend(v3, "predicate");
  objc_msgSend(v3, "setPredicate:", -[THAnnotationController p_nonCurrentVersionPredicateWithPredicate:](self, "p_nonCurrentVersionPredicateWithPredicate:", objc_msgSend(v3, "predicate")));
  v5 = -[AEAnnotationProvider uiManagedObjectContext](self->mAnnotationProvider, "uiManagedObjectContext");
  -[THAnnotationController p_annotationsForFetchRequest:moc:migrateIfNecessary:](self, "p_annotationsForFetchRequest:moc:migrateIfNecessary:", v3, v5, 1);
  objc_msgSend(v3, "setPredicate:", v4);
  return -[THAnnotationController p_fetchedResultsControllerForFetchRequest:moc:](self, "p_fetchedResultsControllerForFetchRequest:moc:", v3, v5);
}

- (void)bookmarkAbsolutePhysicalPage:(unint64_t)a3 anchor:(id)a4
{
  id v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  AEAnnotationProvider *mAnnotationProvider;
  _QWORD v13[10];

  v7 = objc_msgSend(a4, "storage");
  v8 = (char *)objc_msgSend(a4, "range");
  v10 = v8;
  if (v9)
    v11 = v9 - (&v8[v9] == (char *)objc_msgSend(v7, "length") + 1);
  else
    v11 = 0;
  mAnnotationProvider = self->mAnnotationProvider;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_89B78;
  v13[3] = &unk_428688;
  v13[8] = v10;
  v13[9] = v11;
  v13[4] = self;
  v13[5] = v7;
  v13[6] = a4;
  v13[7] = a3;
  -[AEAnnotationProvider performBlockOnUserSideQueueAndWait:](mAnnotationProvider, "performBlockOnUserSideQueueAndWait:", v13);
}

- (void)_unbookmarkBookmarks:(id)a3
{
  AEAnnotationProvider *mAnnotationProvider;
  _QWORD v6[6];

  if (!objc_msgSend(a3, "count"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController _unbookmarkBookmarks:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 1046, CFSTR("Trying to remove bookmark from page without bookmark"));
  -[THAnnotationController p_openActionGroup](self, "p_openActionGroup");
  mAnnotationProvider = self->mAnnotationProvider;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_89CC4;
  v6[3] = &unk_4286B0;
  v6[4] = a3;
  v6[5] = self;
  -[AEAnnotationProvider performBlockOnUserSideQueueAndWait:](mAnnotationProvider, "performBlockOnUserSideQueueAndWait:", v6);
}

- (void)unbookmarkPageInfo:(id)a3 absolutePageIndex:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[7];

  v7 = objc_msgSend(a3, "bodyStorageRange");
  v9 = v8;
  v10 = objc_msgSend(a3, "parent");
  if (!v10)
  {
    if (a4 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 0), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController unbookmarkPageInfo:absolutePageIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 1067, CFSTR("Invalid index."));
    v10 = -[THDocumentNavigationModel contentNodeForAbsolutePageIndex:](self->mDocumentNavModel, "contentNodeForAbsolutePageIndex:", a4);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_89F00;
  v11[3] = &unk_4286D0;
  v11[4] = a4;
  v11[5] = v7;
  v11[6] = v9;
  -[THAnnotationController _unbookmarkBookmarks:](self, "_unbookmarkBookmarks:", objc_msgSend(objc_msgSend(-[THAnnotationController cachedAnnotationsForContentNode:](self, "cachedAnnotationsForContentNode:", v10), "bookmarkAnnotations"), "tsu_arrayOfObjectsPassingTest:", v11));
}

- (void)bookmarkPageInfo:(id)a3 anchor:(id)a4
{
  id v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  AEAnnotationProvider *mAnnotationProvider;
  _QWORD v12[9];

  v6 = objc_msgSend(a4, "storage", a3);
  v7 = (char *)objc_msgSend(a4, "range");
  v9 = v7;
  if (v8)
    v10 = v8 - (&v7[v8] == (char *)objc_msgSend(v6, "length") + 1);
  else
    v10 = 0;
  mAnnotationProvider = self->mAnnotationProvider;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_8A030;
  v12[3] = &unk_4286F8;
  v12[7] = v9;
  v12[8] = v10;
  v12[4] = self;
  v12[5] = v6;
  v12[6] = a4;
  -[AEAnnotationProvider performBlockOnUserSideQueueAndWait:](mAnnotationProvider, "performBlockOnUserSideQueueAndWait:", v12);
}

- (void)removeBookmark:(id)a3
{
  id v3;

  if (a3)
  {
    v3 = a3;
    -[THAnnotationController _unbookmarkBookmarks:](self, "_unbookmarkBookmarks:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController removeBookmark:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 1111, CFSTR("invalid nil value for '%s'"), "bookmark");
  }
}

- (BOOL)isAbsolutePhysicalPageBookmarked:(unint64_t)a3
{
  unsigned int v5;

  v5 = -[THAnnotationController annotationsReadEnabled](self, "annotationsReadEnabled");
  if (v5)
    LOBYTE(v5) = objc_msgSend(objc_msgSend(-[THAnnotationController cachedAnnotationsForContentNode:](self, "cachedAnnotationsForContentNode:", -[THDocumentNavigationModel contentNodeForAbsolutePageIndex:](self->mDocumentNavModel, "contentNodeForAbsolutePageIndex:", a3)), "bookmarkAbsolutePhysicalPageIndexSet"), "containsIndex:", a3);
  return v5;
}

- (BOOL)_isPageInfoAnnotated:(id)a3 checkBookmarks:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v7;
  id v8;
  id v9;
  id v10;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  void *i;
  id v21;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v4 = a4;
  v7 = -[THAnnotationController annotationsReadEnabled](self, "annotationsReadEnabled");
  LOBYTE(v8) = 0;
  if (a3 && v7)
  {
    v9 = objc_msgSend(a3, "bodyStorageRange");
    if (NSInvalidRange[0] == v9 && NSInvalidRange[1] == v10)
    {
      LOBYTE(v8) = 0;
    }
    else
    {
      v12 = v9;
      v13 = v10;
      v14 = -[THAnnotationController cachedAnnotationsForContentNode:](self, "cachedAnnotationsForContentNode:", objc_msgSend(a3, "parent"));
      if (v4)
        v15 = objc_msgSend(v14, "bookmarkAnnotations");
      else
        v15 = objc_msgSend(v14, "annotationsForStorage:", objc_msgSend(a3, "bodyStorage"));
      v16 = v15;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v8 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v8)
      {
        v17 = v8;
        v18 = *(_QWORD *)v25;
        v19 = (unint64_t)v13 + (_QWORD)v12;
        while (2)
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v25 != v18)
              objc_enumerationMutation(v16);
            v21 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "annotationStorageRange");
            if (v12 <= v21 && v19 >= (unint64_t)v21 + 1)
            {
              LOBYTE(v8) = 1;
              return (char)v8;
            }
          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          LOBYTE(v8) = 0;
          if (v17)
            continue;
          break;
        }
      }
    }
  }
  return (char)v8;
}

- (BOOL)isPageInfoBookmarked:(id)a3
{
  if (a3)
    return -[THAnnotationController _isPageInfoAnnotated:checkBookmarks:](self, "_isPageInfoAnnotated:checkBookmarks:");
  else
    return 0;
}

- (BOOL)isAbsolutePhysicalPageHighlightedWithNotes:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || !-[THAnnotationController annotationsReadEnabled](self, "annotationsReadEnabled"))
    return 0;
  else
    return objc_msgSend(-[THAnnotationController cachedAnnotationsForContentNode:](self, "cachedAnnotationsForContentNode:", -[THDocumentNavigationModel contentNodeForAbsolutePageIndex:](self->mDocumentNavModel, "contentNodeForAbsolutePageIndex:", a3)), "hasAnnotationWithNoteInAbsolutePhysicalPageIndex:", a3);
}

- (BOOL)isPageInfoHighlightedWithNotes:(id)a3
{
  if (a3 && -[THAnnotationController annotationsReadEnabled](self, "annotationsReadEnabled"))
    return objc_msgSend(-[THAnnotationController cachedAnnotationsForContentNode:](self, "cachedAnnotationsForContentNode:", objc_msgSend(a3, "parent")), "hasAnnotationWithNoteOnPageInfo:", a3);
  else
    return 0;
}

- (void)registerBookmarkObserver:(id)a3
{
  TSUMutablePointerSet *mBookmarkObservers;

  if (a3)
  {
    objc_sync_enter(self);
    mBookmarkObservers = self->mBookmarkObservers;
    if (!mBookmarkObservers)
    {
      mBookmarkObservers = (TSUMutablePointerSet *)objc_alloc_init((Class)TSUMutablePointerSet);
      self->mBookmarkObservers = mBookmarkObservers;
    }
    -[TSUMutablePointerSet addObject:](mBookmarkObservers, "addObject:", a3);
    objc_sync_exit(self);
  }
}

- (void)unregisterBookmarkObserver:(id)a3
{
  if (a3)
  {
    objc_sync_enter(self);
    -[TSUMutablePointerSet removeObject:](self->mBookmarkObservers, "removeObject:", a3);
    if (!-[TSUMutablePointerSet count](self->mBookmarkObservers, "count"))
    {

      self->mBookmarkObservers = 0;
    }
    objc_sync_exit(self);
  }
}

- (unint64_t)numberOfBookmarks
{
  NSArray *v3;
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = -[THDocumentNavigationModel contentNodes](self->mDocumentNavModel, "contentNodes");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v11 != v7)
        objc_enumerationMutation(v3);
      v6 += (unint64_t)objc_msgSend(objc_msgSend(-[THAnnotationController cachedAnnotationsForContentNode:](self, "cachedAnnotationsForContentNode:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i)), "bookmarkAnnotations"), "count");
    }
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v5);
  return v6;
}

- (id)allBookmarkIdentifiers
{
  id v3;
  void *v4;
  AEAnnotationProvider *mAnnotationProvider;
  id v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = sub_88A0C;
  v14 = sub_88A1C;
  v15 = 0;
  objc_sync_enter(self);
  v3 = -[NSMutableDictionary objectForKey:](self->mAnnotationCache, "objectForKey:", CFSTR("THMacAnnotationAllBookmarks"));
  v11[5] = (uint64_t)v3;
  objc_sync_exit(self);
  v4 = (void *)v11[5];
  if (!v4)
  {
    mAnnotationProvider = self->mAnnotationProvider;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_8A730;
    v9[3] = &unk_428720;
    v9[4] = self;
    v9[5] = &v10;
    -[AEAnnotationProvider performBlockOnUserSideQueueAndWait:](mAnnotationProvider, "performBlockOnUserSideQueueAndWait:", v9);
    v6 = (id)v11[5];
    v4 = (void *)v11[5];
  }
  v7 = objc_msgSend(v4, "bookmarkAnnotations");
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)destroyBookmarkForIdentifier:(id)a3
{
  uint64_t v5;
  AEAnnotationProvider *mAnnotationProvider;
  _QWORD v7[6];

  if (!-[THAnnotationController canModifyAnnotations](self, "canModifyAnnotations"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController destroyBookmarkForIdentifier:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 1294, CFSTR("cannot modify annotations"));
  v5 = TSUCheckedProtocolCast(&OBJC_PROTOCOL___THAnnotation, a3);
  mAnnotationProvider = self->mAnnotationProvider;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_8A8B8;
  v7[3] = &unk_4286B0;
  v7[4] = self;
  v7[5] = v5;
  -[AEAnnotationProvider performBlockOnUserSideQueueAndWait:](mAnnotationProvider, "performBlockOnUserSideQueueAndWait:", v7);
}

- (void)rescueDanglingAnnotationsWithDocumentRoot:(id)a3
{
  AEAnnotationProvider *mAnnotationProvider;
  _QWORD v4[6];

  mAnnotationProvider = self->mAnnotationProvider;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_8A950;
  v4[3] = &unk_4286B0;
  v4[4] = self;
  v4[5] = a3;
  -[AEAnnotationProvider performBlockOnUserSideQueueAndWait:](mAnnotationProvider, "performBlockOnUserSideQueueAndWait:", v4);
}

- (id)placeholderFetchRequest
{
  id v3;
  id v4;

  v3 = objc_alloc((Class)NSFetchRequest);
  v4 = objc_msgSend(v3, "initWithEntityName:", kAEAnnotationEntityName);
  objc_msgSend(v4, "setPredicate:", -[THAnnotationController globalPredicate](self, "globalPredicate"));
  objc_msgSend(v4, "setSortDescriptors:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", +[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("plAbsolutePhysicalLocation"), 1)));
  return v4;
}

- (id)p_getReadingLocationWithMOC:(id)a3
{
  id v3;
  id result;

  v3 = -[THAnnotationController p_annotationsForFetchRequest:moc:migrateIfNecessary:](self, "p_annotationsForFetchRequest:moc:migrateIfNecessary:", -[THAnnotationController placeholderFetchRequest](self, "placeholderFetchRequest"), a3, 1);
  result = objc_msgSend(v3, "count");
  if (result)
    return objc_msgSend(v3, "objectAtIndex:", 0);
  return result;
}

- (id)placeholder
{
  void *v3;

  v3 = 0;
  -[THAnnotationController getPlaceholder:andPageHistory:](self, "getPlaceholder:andPageHistory:", &v3, 0);
  return v3;
}

- (id)readingProgress
{
  AEAnnotationProvider *mAnnotationProvider;
  double v3;
  NSNumber *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  mAnnotationProvider = self->mAnnotationProvider;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_8ACE8;
  v6[3] = &unk_428748;
  v6[4] = self;
  v6[5] = &v7;
  -[AEAnnotationProvider performBlockOnUserSideQueueAndWait:](mAnnotationProvider, "performBlockOnUserSideQueueAndWait:", v6);
  LODWORD(v3) = *((_DWORD *)v8 + 6);
  v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v3);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)readingProgressHighwaterMark
{
  AEAnnotationProvider *mAnnotationProvider;
  double v3;
  NSNumber *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  mAnnotationProvider = self->mAnnotationProvider;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_8ADDC;
  v6[3] = &unk_428748;
  v6[4] = self;
  v6[5] = &v7;
  -[AEAnnotationProvider performBlockOnUserSideQueueAndWait:](mAnnotationProvider, "performBlockOnUserSideQueueAndWait:", v6);
  LODWORD(v3) = *((_DWORD *)v8 + 6);
  v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v3);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)getPlaceholder:(id *)a3 andPageHistory:(id *)a4
{
  AEAnnotationProvider *mAnnotationProvider;
  id v8;
  id v9;
  THPageLocation *v10;
  id v11;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;

  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController getPlaceholder:andPageHistory:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 1427, CFSTR("invalid nil value for '%s'"), "placeholderHandle");
  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = sub_88A0C;
  v24 = sub_88A1C;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = sub_88A0C;
  v18 = sub_88A1C;
  v19 = 0;
  mAnnotationProvider = self->mAnnotationProvider;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_8B038;
  v13[3] = &unk_428770;
  v13[4] = self;
  v13[5] = &v20;
  v13[6] = &v14;
  -[AEAnnotationProvider performBlockOnUserSideQueueAndWait:](mAnnotationProvider, "performBlockOnUserSideQueueAndWait:", v13);
  v8 = (id)v21[5];
  v9 = (id)v15[5];
  if (a3)
  {
    v10 = (THPageLocation *)v21[5];
    if (!v10)
    {
      if (-[THBookDescription isEpub](-[THDocumentRoot bookDescription](self->mDocumentRoot, "bookDescription"), "isEpub"))
      {
        v11 = -[NSArray firstObject](-[THDocumentNavigationModel contentNodes](self->mDocumentNavModel, "contentNodes"), "firstObject");
        v10 = -[THPageLocation initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:]([THPageLocation alloc], "initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:", 0, 0, 0, objc_msgSend(v11, "nodeGUID"), objc_msgSend(v11, "nodeGUID"));
        v21[5] = (uint64_t)v10;
      }
      else
      {
        v10 = (THPageLocation *)v21[5];
      }
    }
    *a3 = v10;
  }
  if (a4)
    *a4 = (id)v15[5];
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return a3 != 0;
}

- (void)setPlaceholder:(id)a3 pageHistoryDictionary:(id)a4 withContentNode:(id)a5
{
  id v9;
  id v10;
  id v11;
  float v12;
  unint64_t v13;
  float v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  _QWORD v25[6];
  float v26;
  _QWORD v27[8];
  float v28;
  _QWORD v29[7];

  v9 = -[THAnnotationController placeholderFetchRequest](self, "placeholderFetchRequest");
  v10 = -[AEAnnotationProvider uiManagedObjectContext](self->mAnnotationProvider, "uiManagedObjectContext");
  v11 = -[THAnnotationController p_annotationsForFetchRequest:moc:migrateIfNecessary:](self, "p_annotationsForFetchRequest:moc:migrateIfNecessary:", v9, v10, 1);
  -[THAnnotationController p_beginIgnoringWritability](self, "p_beginIgnoringWritability");
  -[THAnnotationController p_openActionGroup](self, "p_openActionGroup");
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_8B378;
  v29[3] = &unk_428798;
  v29[4] = a3;
  v29[5] = self;
  v29[6] = v10;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v29);
  v12 = 0.0;
  if (!-[THBookDescription isSample](-[THDocumentRoot bookDescription](-[THAnnotationController documentRoot](self, "documentRoot"), "bookDescription"), "isSample"))
  {
    v13 = -[THDocumentNavigationModel pageCount](-[THDocumentRoot navigationModel](-[THAnnotationController documentRoot](self, "documentRoot"), "navigationModel"), "pageCount");
    v14 = (float)((unint64_t)objc_msgSend(a3, "absolutePhysicalPageIndex") + 1) / (float)v13;
    if (v14 > 1.0)
      v14 = 1.0;
    v12 = fmaxf(v14, 0.0);
  }
  if (a3)
  {
    if (objc_msgSend(v11, "count") && (v15 = objc_msgSend(v11, "objectAtIndex:", 0)) != 0)
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_8B3C0;
      v27[3] = &unk_4287C0;
      v27[4] = a3;
      v27[5] = a5;
      v28 = v12;
      v27[6] = a4;
      v27[7] = self;
      v16 = -[THAnnotationController p_actionForUpdatingAnnotation:withContentNode:block:](self, "p_actionForUpdatingAnnotation:withContentNode:block:", v15, a5, v27);
    }
    else
    {
      v17 = +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THDocumentRoot context](-[THAnnotationController documentRoot](self, "documentRoot"), "context"));
      v19 = objc_opt_class(THWPStorage, v18);
      v20 = TSUDynamicCast(v19, objc_msgSend(a5, "infoForNodeUniqueID:forPresentationType:", objc_msgSend(a3, "storageUID"), v17));
      v21 = -[THAnnotationController currentAnnotationStyle](self, "currentAnnotationStyle");
      v22 = objc_msgSend(a3, "absolutePhysicalPageIndex");
      v23 = objc_msgSend(a3, "range");
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_8B484;
      v25[3] = &unk_4287E8;
      v25[4] = a4;
      v25[5] = self;
      v26 = v12;
      v16 = -[THAnnotationController p_actionForInsertingAnnotationWithType:style:absolutePageIndex:range:storage:contentNode:updateBlock:](self, "p_actionForInsertingAnnotationWithType:style:absolutePageIndex:range:storage:contentNode:updateBlock:", 3, v21, v22, v23, v24, v20, a5, v25);
    }
    -[THAnnotationController p_performAction:moc:](self, "p_performAction:moc:", v16, v10);
  }
  -[THAnnotationController p_closeActionGroupWithMoc:](self, "p_closeActionGroupWithMoc:", v10);
  -[THAnnotationController p_endIgnoringWritability](self, "p_endIgnoringWritability");
}

- (id)p_allContentNodeAnnotations
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v4 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  -[THModelNode addMappingFromGUIDToNodeToDictionary:](-[THDocumentRoot rootNode](-[THAnnotationController documentRoot](self, "documentRoot"), "rootNode"), "addMappingFromGUIDToNodeToDictionary:", v4);
  v5 = objc_msgSend(v4, "allKeys");
  objc_sync_enter(self);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = -[THAnnotationController cachedAnnotationsForContentNode:](self, "cachedAnnotationsForContentNode:", -[THDocumentNavigationModel contentNodeForGUID:](-[THDocumentRoot navigationModel](-[THAnnotationController documentRoot](self, "documentRoot"), "navigationModel"), "contentNodeForGUID:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8)));
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_8B684;
        v11[3] = &unk_428810;
        v11[4] = v3;
        objc_msgSend(v9, "enumerateAnnotationsWithBlock:", v11);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  objc_sync_exit(self);
  return v3;
}

- (id)annotationWithUuid:(id)a3
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_8B6F4;
  v4[3] = &unk_428838;
  v4[4] = a3;
  return objc_msgSend(-[THAnnotationController p_allContentNodeAnnotations](self, "p_allContentNodeAnnotations"), "tsu_firstObjectPassingTest:", v4);
}

- (id)maxAnnotationAssetVersion
{
  AEAnnotationProvider *mAnnotationProvider;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_88A0C;
  v10 = sub_88A1C;
  v11 = 0;
  mAnnotationProvider = self->mAnnotationProvider;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_8B7EC;
  v5[3] = &unk_428748;
  v5[4] = self;
  v5[5] = &v6;
  -[AEAnnotationProvider performBlockOnUserSideQueueAndWait:](mAnnotationProvider, "performBlockOnUserSideQueueAndWait:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)p_sortedAssetIDVersionsWithMoc:(id)a3
{
  AEAnnotationProvider *mAnnotationProvider;
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  id v11;
  THBookVersion *v12;
  THBookVersion *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  _BYTE v27[128];

  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = sub_88A0C;
  v25 = sub_88A1C;
  v26 = 0;
  mAnnotationProvider = self->mAnnotationProvider;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_8BA44;
  v20[3] = &unk_428748;
  v20[4] = self;
  v20[5] = &v21;
  -[AEAnnotationProvider performBlockOnUserSideQueueAndWait:](mAnnotationProvider, "performBlockOnUserSideQueueAndWait:", v20);
  v4 = (id)v22[5];
  v5 = +[NSMutableArray array](NSMutableArray, "array");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)v22[5];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    v9 = kAEAnnotationAssetVersionKey;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "objectForKey:", v9);
        if (v11)
          v12 = -[THBookVersion initWithString:]([THBookVersion alloc], "initWithString:", v11);
        else
          v12 = +[THBookVersion newUnversionedBookVersion](THBookVersion, "newUnversionedBookVersion");
        v13 = v12;
        objc_msgSend(v5, "addObject:", v12);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
    }
    while (v7);
  }
  v14 = objc_msgSend(v5, "sortedArrayUsingComparator:", &stru_428878);
  _Block_object_dispose(&v21, 8);
  return v14;
}

- (void)ensureNonSponsoredAnnotationsAreMigrated
{
  AEAnnotationProvider *mAnnotationProvider;
  _QWORD v3[5];

  mAnnotationProvider = self->mAnnotationProvider;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_8BBEC;
  v3[3] = &unk_4288A0;
  v3[4] = self;
  -[AEAnnotationProvider performBlockOnUserSideQueueAndWait:](mAnnotationProvider, "performBlockOnUserSideQueueAndWait:", v3);
}

- (BOOL)p_migrateAEAnnotationIfNecessary:(id)a3 moc:(id)a4
{
  id v7;
  _BOOL4 v8;

  if (-[THAnnotationController p_annotationNeedsMigration:](self, "p_annotationNeedsMigration:"))
  {
    v7 = -[THDocumentNavigationModel contentNodeForGUID:](-[THAnnotationController documentNavModel](self, "documentNavModel"), "contentNodeForGUID:", objc_msgSend(a3, "annotationContentNodeID"));
    if (v7)
      -[THAnnotationController p_migrateAEAnnotation:inContentNode:moc:](self, "p_migrateAEAnnotation:inContentNode:moc:", a3, v7, a4);
    else
      -[THAnnotationController p_orphanAEAnnotation:moc:](self, "p_orphanAEAnnotation:moc:", a3, a4);
  }
  else if (!-[THAnnotationController p_annotationNeedsMigrationForAnnotationSchemaVersion:](self, "p_annotationNeedsMigrationForAnnotationSchemaVersion:", a3)|| !-[THAnnotationController p_ensureCFIForAEAnnotation:moc:](self, "p_ensureCFIForAEAnnotation:moc:", a3, a4))
  {
    v8 = -[THAnnotationController p_annotationNeedsMigrationForAnnotationSchemaVersion:](self, "p_annotationNeedsMigrationForAnnotationSchemaVersion:", a3);
    if (!v8)
      return v8;
  }
  -[THAnnotationController p_upgradeAEAnnotation:moc:](self, "p_upgradeAEAnnotation:moc:", a3, a4);
  if (objc_msgSend(a3, "isOrphan")
    && (objc_msgSend(a3, "annotationType") == 1 || objc_msgSend(a3, "annotationType") == 3))
  {
    -[THAnnotationController p_performAction:moc:](self, "p_performAction:moc:", -[THAnnotationController p_actionForDeletingAEAnnotation:](self, "p_actionForDeletingAEAnnotation:", a3), a4);
  }
  LOBYTE(v8) = 1;
  return v8;
}

- (void)p_migrateAEAnnotation:(id)a3 inContentNode:(id)a4 moc:(id)a5
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v9 = -[THAnnotationController p_infoForNodeUniqueID:inContentNode:](self, "p_infoForNodeUniqueID:inContentNode:", objc_msgSend(a3, "annotationStorageIDWithoutContentNodeID"), a4);
  v11 = objc_opt_class(THWPStorage, v10);
  v12 = TSUDynamicCast(v11, v9);
  if (objc_msgSend(a3, "isPlaceholder"))
    -[THAnnotationController p_performAction:moc:](self, "p_performAction:moc:", -[THAnnotationController p_actionForUpdatingAnnotation:withBlock:](self, "p_actionForUpdatingAnnotation:withBlock:", a3, &stru_4288E0), a5);
  if (!-[THAnnotationController p_migrateAEAnnotation:withinStorage:moc:](self, "p_migrateAEAnnotation:withinStorage:moc:", a3, v12, a5)&& ((objc_msgSend(a4, "isBodyStorage:", v12) & 1) != 0|| !-[THAnnotationController p_migrateAEAnnotation:fromStorage:toAnyNonBodyStorageInContentNode:moc:](self, "p_migrateAEAnnotation:fromStorage:toAnyNonBodyStorageInContentNode:moc:", a3, v12, a4, a5))&& !-[THAnnotationController p_migrateBookmarkOrPlaceholderAEAnnotation:inContentNode:moc:](self, "p_migrateBookmarkOrPlaceholderAEAnnotation:inContentNode:moc:", a3, a4, a5))
  {
    -[THAnnotationController p_orphanAEAnnotation:moc:](self, "p_orphanAEAnnotation:moc:", a3, a5);
  }
}

- (_NSRange)p_rangeOfAEAnnotation:(id)a3 inStorage:(id)a4
{
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  if (a4)
  {
    v4 = (NSUInteger)objc_msgSend(a4, "closestMatchForString:leftContext:rightContext:startCharIndex:", objc_msgSend(a3, "annotationRepresentativeText"), objc_msgSend(a3, "selectionPreContextText"), objc_msgSend(a3, "selectionPostContextText"), objc_msgSend(a3, "annotationStorageRange"));
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

- (BOOL)p_migrateAEAnnotation:(id)a3 withinStorage:(id)a4 moc:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v12[6];

  v8 = -[THAnnotationController p_rangeOfAEAnnotation:inStorage:](self, "p_rangeOfAEAnnotation:inStorage:", a3, a4);
  v10 = v8;
  if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_8BF84;
    v12[3] = &unk_428900;
    v12[4] = v8;
    v12[5] = v9;
    -[THAnnotationController p_performAction:moc:](self, "p_performAction:moc:", -[THAnnotationController p_actionForUpdatingAnnotation:withBlock:](self, "p_actionForUpdatingAnnotation:withBlock:", a3, v12), a5);
  }
  return v10 != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)p_migrateAEAnnotation:(id)a3 fromStorage:(id)a4 toAnyNonBodyStorageInContentNode:(id)a5 moc:(id)a6
{
  id v7;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  uint64_t v17;
  id v18;
  BOOL v19;
  id v20;
  id v21;
  id v22;
  _BYTE *v23;
  _BYTE *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  id v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  id v34;
  id v35;
  _QWORD v37[8];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];

  v7 = a5;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v10 = objc_msgSend(a5, "storagesForAllPresentationTypes");
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v11)
  {
    v13 = v11;
    v34 = 0;
    v35 = a3;
    v14 = *(_QWORD *)v39;
    v32 = 0;
    v33 = 0xFFFFFFFFLL;
    v30 = a6;
    v31 = 0x7FFFFFFFFFFFFFFFLL;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        v17 = objc_opt_class(THWPStorage, v12);
        v18 = (id)TSUDynamicCast(v17, v16);
        if (v18)
          v19 = v18 == a4;
        else
          v19 = 1;
        if (!v19)
        {
          v20 = v18;
          if ((objc_msgSend(v7, "isBodyStorage:", v18) & 1) == 0)
          {
            v21 = v10;
            v22 = v7;
            v23 = -[THAnnotationController p_rangeOfAEAnnotation:inStorage:](self, "p_rangeOfAEAnnotation:inStorage:", v35, v20);
            if (v23 == (_BYTE *)0x7FFFFFFFFFFFFFFFLL)
            {
              v10 = v21;
            }
            else
            {
              v24 = v23;
              v25 = v12;
              v26 = (char *)objc_msgSend(v35, "annotationStorageRange");
              v27 = v25;
              v28 = (char *)(v26 - v24);
              if (v24 >= v26)
                v28 = (char *)(v24 - v26);
              v7 = v22;
              v10 = v21;
              if (!v34 || (unint64_t)v28 < v33)
              {
                v32 = v27;
                v33 = (unint64_t)v28;
                v31 = (uint64_t)v24;
                v34 = v20;
                if (!v28)
                  goto LABEL_21;
              }
            }
          }
        }
      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v13)
        continue;
      break;
    }
    v20 = v34;
    v24 = (_BYTE *)v31;
    v27 = v32;
    if (v34)
    {
LABEL_21:
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_8C1C8;
      v37[3] = &unk_428928;
      v37[4] = v7;
      v37[5] = v20;
      v37[6] = v24;
      v37[7] = v27;
      -[THAnnotationController p_performAction:moc:](self, "p_performAction:moc:", -[THAnnotationController p_actionForUpdatingAnnotation:withBlock:](self, "p_actionForUpdatingAnnotation:withBlock:", v35, v37), v30);
      LOBYTE(v11) = 1;
      return (char)v11;
    }
    LOBYTE(v11) = 0;
  }
  return (char)v11;
}

- (BOOL)p_ensureCFIForAEAnnotation:(id)a3 moc:(id)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[6];

  v7 = -[THDocumentNavigationModel contentNodeForGUID:](-[THAnnotationController documentNavModel](self, "documentNavModel"), "contentNodeForGUID:", objc_msgSend(a3, "annotationContentNodeID"));
  if (v7)
  {
    v8 = v7;
    v9 = -[THAnnotationController p_infoForNodeUniqueID:inContentNode:](self, "p_infoForNodeUniqueID:inContentNode:", objc_msgSend(a3, "annotationStorageIDWithoutContentNodeID"), v7);
    v11 = objc_opt_class(THWPStorage, v10);
    v7 = (id)TSUDynamicCast(v11, v9);
    if (v7)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_8C2F0;
      v13[3] = &unk_428950;
      v13[4] = v8;
      v13[5] = v7;
      -[THAnnotationController p_performAction:moc:](self, "p_performAction:moc:", -[THAnnotationController p_actionForUpdatingAnnotation:withBlock:](self, "p_actionForUpdatingAnnotation:withBlock:", a3, v13), a4);
      LOBYTE(v7) = 1;
    }
  }
  return (char)v7;
}

- (BOOL)p_migrateBookmarkOrPlaceholderAEAnnotation:(id)a3 inContentNode:(id)a4 moc:(id)a5
{
  unsigned int v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  int64_t v15;
  _BYTE *v16;
  _QWORD v18[7];

  if ((objc_msgSend(a3, "isBookmark") & 1) != 0
    || (v9 = objc_msgSend(a3, "isPlaceholder")) != 0)
  {
    v10 = +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THDocumentRoot context](-[THAnnotationController documentRoot](self, "documentRoot"), "context"));
    v11 = objc_msgSend(a3, "contentNodeRelativePageIndex");
    if (v11 >= objc_msgSend(a4, "pageCountForPresentationType:", v10))
    {
      LOBYTE(v9) = 0;
    }
    else
    {
      v12 = objc_msgSend(a4, "absolutePageIndexForRelativePageIndex:", v11);
      v13 = objc_msgSend(a4, "pageAtRelativeIndex:forPresentationType:", v11, v10);
      v14 = objc_msgSend(v13, "pageStartCharIndex");
      if (objc_msgSend(v13, "pageStartCharIndex") == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v15 = 0;
      }
      else
      {
        v16 = objc_msgSend(v13, "pageEndCharIndex");
        v15 = v16 - (_BYTE *)objc_msgSend(v13, "pageStartCharIndex");
      }
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_8C4C4;
      v18[3] = &unk_428970;
      v18[4] = v12;
      v18[5] = v14;
      v18[6] = v15;
      -[THAnnotationController p_performAction:moc:](self, "p_performAction:moc:", -[THAnnotationController p_actionForUpdatingAnnotation:withBlock:](self, "p_actionForUpdatingAnnotation:withBlock:", a3, v18), a5);
      LOBYTE(v9) = 1;
    }
  }
  return v9;
}

- (void)p_orphanAEAnnotation:(id)a3 moc:(id)a4
{
  -[THAnnotationController p_performAction:moc:](self, "p_performAction:moc:", -[THAnnotationController p_actionForUpdatingAnnotation:withBlock:](self, "p_actionForUpdatingAnnotation:withBlock:", a3, &stru_428990), a4);
}

- (void)p_addVersioningPropertiesAE:(id)a3
{
  objc_msgSend(a3, "setAnnotationBookVersion:", -[THBookVersion versionString](-[THDocumentProperties bookVersion](-[THDocumentRoot properties](-[THAnnotationController documentRoot](self, "documentRoot"), "properties"), "bookVersion"), "versionString"));
  objc_msgSend(a3, "setAnnotationVersion:", kAEAnnotationVersion_4);
}

- (void)p_upgradeAEAnnotation:(id)a3 moc:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_8C5F4;
  v4[3] = &unk_4289B8;
  v4[4] = self;
  -[THAnnotationController p_performAction:moc:](self, "p_performAction:moc:", -[THAnnotationController p_actionForUpdatingAnnotation:withBlock:](self, "p_actionForUpdatingAnnotation:withBlock:", a3, v4), a4);
}

- (id)p_infoForNodeUniqueID:(id)a3 inContentNode:(id)a4
{
  id v6;
  id v7;
  id result;

  v6 = -[THDocumentRoot context](-[THAnnotationController documentRoot](self, "documentRoot"), "context");
  if (!a4)
    return 0;
  v7 = v6;
  result = objc_msgSend(a4, "infoForNodeUniqueID:forPresentationType:", a3, +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", v6));
  if (!result)
    return objc_msgSend(a4, "infoForNodeUniqueID:forPresentationType:", a3, +[THPresentationType flowPresentationTypeInContext:](THPresentationType, "flowPresentationTypeInContext:", v7));
  return result;
}

- (void)p_registerAnnotationObserver:(id)a3 forKey:(id)a4
{
  id v7;

  if (a3)
  {
    objc_sync_enter(self);
    v7 = -[TSURetainedPointerKeyDictionary objectForKey:](self->mObservers, "objectForKey:", a4);
    if (!v7)
    {
      v7 = +[TSUMutablePointerSet set](TSUMutablePointerSet, "set");
      -[TSURetainedPointerKeyDictionary setObject:forUncopiedKey:](self->mObservers, "setObject:forUncopiedKey:", v7, a4);
    }
    objc_msgSend(v7, "addObject:", a3);
    objc_sync_exit(self);
  }
}

- (void)registerAnnotationObserver:(id)a3 forContentNode:(id)a4
{
  -[THAnnotationController p_registerAnnotationObserver:forKey:](self, "p_registerAnnotationObserver:forKey:", a3, -[THAnnotationController p_keyForContentNode:](self, "p_keyForContentNode:", a4));
}

- (void)p_unregisterAnnotationObserver:(id)a3 forKey:(id)a4
{
  id v7;

  if (a3)
  {
    objc_sync_enter(self);
    v7 = -[TSURetainedPointerKeyDictionary objectForKey:](self->mObservers, "objectForKey:", a4);
    objc_msgSend(v7, "removeObject:", a3);
    if (!objc_msgSend(v7, "count"))
      -[TSURetainedPointerKeyDictionary removeObjectForKey:](self->mObservers, "removeObjectForKey:", a4);
    objc_sync_exit(self);
  }
}

- (void)unregisterAnnotationObserver:(id)a3 forContentNode:(id)a4
{
  -[THAnnotationController p_unregisterAnnotationObserver:forKey:](self, "p_unregisterAnnotationObserver:forKey:", a3, -[THAnnotationController p_keyForContentNode:](self, "p_keyForContentNode:", a4));
}

- (id)p_cachedAnnotationsForContentNode:(id)a3 moc:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  THCachedAnnotation *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v7 = -[THAnnotationController p_keyForContentNode:](self, "p_keyForContentNode:");
  objc_sync_enter(self);
  v8 = -[NSMutableDictionary objectForKey:](self->mCachedAnnotations, "objectForKey:", v7);
  objc_sync_exit(self);
  if (!v8)
  {
    v8 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = objc_msgSend(-[THAnnotationController p_annotationsForContentNode:moc:](self, "p_annotationsForContentNode:moc:", a3, a4), "allValues", 0);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v9);
          v13 = -[THCachedAnnotation initWithAnnotation:contentNode:]([THCachedAnnotation alloc], "initWithAnnotation:contentNode:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), a3);
          objc_msgSend(v8, "setObject:forKey:", v13, -[THCachedAnnotation annotationUuid](v13, "annotationUuid"));

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }
    objc_sync_enter(self);
    -[NSMutableDictionary setObject:forKey:](self->mCachedAnnotations, "setObject:forKey:", v8, v7);
    objc_sync_exit(self);
  }
  return v8;
}

- (id)p_annotationsForContentNode:(id)a3 moc:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  id v17;
  id v18;
  uint64_t v19;
  void *k;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];

  v7 = -[THAnnotationController p_keyForContentNode:](self, "p_keyForContentNode:");
  objc_sync_enter(self);
  v8 = -[NSMutableDictionary objectForKey:](self->mAEAnnotationManagedObjectIDs, "objectForKey:", v7);
  if (!v8)
  {
    v8 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    if (a3)
    {
      v9 = -[THAnnotationController p_annotationsForFetchRequest:moc:migrateIfNecessary:](self, "p_annotationsForFetchRequest:moc:migrateIfNecessary:", -[THAnnotationController p_annotationRequestForContentNode:](self, "p_annotationRequestForContentNode:", a3), a4, 1);
      v22 = v7;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v32 != v11)
              objc_enumerationMutation(v9);
            objc_msgSend(v8, "setObject:forKey:", objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i), "objectID"), objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i), "annotationUuid"));
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        }
        while (v10);
      }
      v7 = v22;
      v13 = -[THAnnotationController p_annotationsForFetchRequest:moc:migrateIfNecessary:](self, "p_annotationsForFetchRequest:moc:migrateIfNecessary:", -[THAnnotationController p_bookmarkRequestForContentNode:](self, "p_bookmarkRequestForContentNode:", a3), a4, 1);
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v28;
        do
        {
          for (j = 0; j != v14; j = (char *)j + 1)
          {
            if (*(_QWORD *)v28 != v15)
              objc_enumerationMutation(v13);
            objc_msgSend(v8, "setObject:forKey:", objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)j), "objectID"), objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)j), "annotationUuid"));
          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
        }
        while (v14);
      }
    }
    else
    {
      v17 = -[THAnnotationController p_annotationsForFetchRequest:moc:migrateIfNecessary:](self, "p_annotationsForFetchRequest:moc:migrateIfNecessary:", -[THAnnotationController p_nonSponsoredAnnotationRequest](self, "p_nonSponsoredAnnotationRequest"), a4, 1);
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v24;
        do
        {
          for (k = 0; k != v18; k = (char *)k + 1)
          {
            if (*(_QWORD *)v24 != v19)
              objc_enumerationMutation(v17);
            objc_msgSend(v8, "setObject:forKey:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)k), "objectID"), objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)k), "annotationUuid"));
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
        }
        while (v18);
      }
    }
    -[NSMutableDictionary setObject:forKey:](self->mAEAnnotationManagedObjectIDs, "setObject:forKey:", v8, v7);
  }
  objc_sync_exit(self);
  return -[THAnnotationController p_annotationsForManagedObjectIDs:moc:](self, "p_annotationsForManagedObjectIDs:moc:", v8, a4);
}

- (id)p_annotationsForManagedObjectIDs:(id)a3 moc:(id)a4
{
  id v7;
  _QWORD v9[7];

  v7 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_8CDE4;
  v9[3] = &unk_4289E0;
  v9[4] = a4;
  v9[5] = self;
  v9[6] = v7;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v9);
  return v7;
}

- (id)p_cachedBookmarksWithMoc:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  THCachedAnnotation *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  objc_sync_enter(self);
  v5 = -[NSMutableDictionary objectForKey:](self->mCachedAnnotations, "objectForKey:", CFSTR("THMacAnnotationAllBookmarks"));
  objc_sync_exit(self);
  if (!v5)
  {
    v5 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(-[THAnnotationController p_bookmarksWithMOC:](self, "p_bookmarksWithMOC:", a3), "allValues", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          v10 = -[THCachedAnnotation initWithAnnotation:contentNode:]([THCachedAnnotation alloc], "initWithAnnotation:contentNode:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), -[THDocumentNavigationModel contentNodeForGUID:](-[THAnnotationController documentNavModel](self, "documentNavModel"), "contentNodeForGUID:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "annotationContentNodeID")));
          objc_msgSend(v5, "setObject:forKey:", v10, -[THCachedAnnotation annotationUuid](v10, "annotationUuid"));

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
    objc_sync_enter(self);
    -[NSMutableDictionary setObject:forKey:](self->mCachedAnnotations, "setObject:forKey:", v5, CFSTR("THMacAnnotationAllBookmarks"));
    objc_sync_exit(self);
  }
  return v5;
}

- (id)p_bookmarksWithMOC:(id)a3
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

  objc_sync_enter(self);
  v5 = -[NSMutableDictionary objectForKey:](self->mAEAnnotationManagedObjectIDs, "objectForKey:", CFSTR("THMacAnnotationAllBookmarks"));
  if (!v5)
  {
    v5 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    v6 = -[THAnnotationController p_annotationsForFetchRequest:moc:migrateIfNecessary:](self, "p_annotationsForFetchRequest:moc:migrateIfNecessary:", -[THAnnotationController p_allBookmarksFetchRequest](self, "p_allBookmarksFetchRequest"), a3, 1);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "setObject:forKey:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "objectID"), objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "annotationUuid"));
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
    -[NSMutableDictionary setObject:forKey:](self->mAEAnnotationManagedObjectIDs, "setObject:forKey:", v5, CFSTR("THMacAnnotationAllBookmarks"));
  }
  objc_sync_exit(self);
  return -[THAnnotationController p_annotationsForManagedObjectIDs:moc:](self, "p_annotationsForManagedObjectIDs:moc:", v5, a3);
}

- (id)p_annotationForCachedAnnotation:(id)a3 moc:(id)a4
{
  return objc_msgSend(-[THAnnotationController p_annotationsForContentNode:moc:](self, "p_annotationsForContentNode:moc:", -[THAnnotationController p_contentNodeForCachedAnnotation:](self, "p_contentNodeForCachedAnnotation:"), a4), "objectForKey:", objc_msgSend(a3, "annotationUuid"));
}

- (id)p_contentNodeForCachedAnnotation:(id)a3
{
  uint64_t v5;
  id result;

  v5 = objc_opt_class(THCachedAnnotation, a2);
  result = objc_msgSend((id)TSUDynamicCast(v5, a3), "contentNode");
  if (!result)
    return -[THDocumentNavigationModel contentNodeForGUID:](-[THAnnotationController documentNavModel](self, "documentNavModel"), "contentNodeForGUID:", objc_msgSend(a3, "annotationContentNodeID"));
  return result;
}

- (id)p_extendExistingAnnotationForRange:(_NSRange)a3 storage:(id)a4 contentNode:(id)a5 style:(int)a6 moc:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSUInteger v27;
  NSRange v28;
  BOOL v29;
  id v31;
  _QWORD v33[4];
  NSRange v34;
  int v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  NSRange v46;
  NSRange v47;
  NSRange v48;
  NSRange v49;

  length = a3.length;
  location = a3.location;
  objc_sync_enter(self);
  v13 = objc_msgSend(a5, "annotationIDForInfo:", a4);
  v14 = objc_alloc_init((Class)NSMutableArray);
  v42 = 0u;
  v43 = 0u;
  v41 = 0u;
  v40 = 0u;
  v31 = a7;
  v15 = objc_msgSend(-[THAnnotationController p_annotationsForContentNode:moc:](self, "p_annotationsForContentNode:moc:", a5, a7), "allValues");
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(objc_msgSend(v19, "plStorageUUID"), "isEqualToString:", v13))
        {
          v46.location = (NSUInteger)objc_msgSend(v19, "annotationStorageRange");
          v48.location = location;
          v48.length = length;
          if (NSIntersectionRange(v46, v48).length)
            objc_msgSend(v14, "addObject:", v19);
        }
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v16);
  }
  v20 = +[THAnnotationCache annotationsOrderedForVisualStacking:](THAnnotationCache, "annotationsOrderedForVisualStacking:", v14);

  if (a6 != 6 || (v21 = objc_msgSend(v20, "lastObject")) == 0)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v22 = objc_msgSend(v20, "reverseObjectEnumerator");
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (!v23)
    {
LABEL_31:
      v26 = 0;
      goto LABEL_32;
    }
    v24 = *(_QWORD *)v37;
LABEL_15:
    v25 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v24)
        objc_enumerationMutation(v22);
      v21 = *(id *)(*((_QWORD *)&v36 + 1) + 8 * v25);
      if ((objc_msgSend(v21, "annotationIsUnderline") & 1) == 0)
        break;
      if (v23 == (id)++v25)
      {
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        v26 = 0;
        if (v23)
          goto LABEL_15;
        goto LABEL_32;
      }
    }
    if (!v21)
      goto LABEL_31;
  }
  v49.location = (NSUInteger)objc_msgSend(v21, "annotationStorageRange");
  v49.length = v27;
  v47.location = location;
  v47.length = length;
  v28 = NSUnionRange(v47, v49);
  if (objc_msgSend(v21, "annotationStyle") == a6
    || (v26 = 0, a6 != 6) && (location == v28.location ? (v29 = length == v28.length) : (v29 = 0), v29))
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_8D6E8;
    v33[3] = &unk_428A00;
    v34 = v28;
    v35 = a6;
    -[THAnnotationController p_performUndoableAction:moc:](self, "p_performUndoableAction:moc:", -[THAnnotationController p_actionForUpdatingAnnotation:withBlock:](self, "p_actionForUpdatingAnnotation:withBlock:", v21, v33), v31);
    v26 = v21;
  }
LABEL_32:
  objc_sync_exit(self);
  return v26;
}

- (id)addAnnotationForStorage:(id)a3 range:(_NSRange)a4 contentNode:(id)a5 style:(int)a6 undoContext:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  AEAnnotationProvider *mAnnotationProvider;
  id v15;
  _QWORD v17[11];
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  length = a4.length;
  location = a4.location;
  if (!-[THAnnotationController canModifyAnnotations](self, "canModifyAnnotations"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController addAnnotationForStorage:range:contentNode:style:undoContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2220, CFSTR("cannot modify annotations"));
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = sub_88A0C;
  v23 = sub_88A1C;
  v24 = 0;
  mAnnotationProvider = self->mAnnotationProvider;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_8D88C;
  v17[3] = &unk_428A50;
  v17[4] = a7;
  v17[5] = a5;
  v17[9] = location;
  v17[10] = length;
  v17[6] = a3;
  v17[7] = self;
  v18 = a6;
  v17[8] = &v19;
  -[AEAnnotationProvider performBlockOnUserSideQueueAndWait:](mAnnotationProvider, "performBlockOnUserSideQueueAndWait:", v17);
  v15 = (id)v20[5];
  _Block_object_dispose(&v19, 8);
  return v15;
}

- (void)destroyAnnotations:(id)a3 undoContext:(id)a4
{
  char *v7;
  char *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *i;
  NSMutableDictionary *v15;
  id v16;
  void *v17;
  const __CFString *v18;
  AEAnnotationProvider *mAnnotationProvider;
  _QWORD v20[6];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v7 = (char *)objc_msgSend(a3, "count");
  if (v7)
  {
    v8 = v7;
    if (!-[THAnnotationController canModifyAnnotations](self, "canModifyAnnotations"))
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController destroyAnnotations:undoContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2262, CFSTR("cannot modify annotations"));
    v9 = objc_msgSend(a3, "objectAtIndex:", 0);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(a3);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "annotationNote"))
          {
            if (v12)
            {
              v12 = 2;
              goto LABEL_17;
            }
            v12 = 1;
          }
        }
        v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v11)
          continue;
        break;
      }
    }
    else
    {
      v12 = 0;
    }
LABEL_17:
    v15 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", a4);
    v16 = -[THDocumentRoot modelStorageAnchorForAnnotation:](-[THAnnotationController documentRoot](self, "documentRoot"), "modelStorageAnchorForAnnotation:", v9);
    if (v16)
      -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v16, CFSTR("THAnnotationStorageAnchorUndoContextKey"));
    if (v12)
    {
      if (v12 == 1)
      {
        v17 = (void *)THBundle();
        if (v8 == (_BYTE *)&dword_0 + 1)
          v18 = CFSTR("Remove Highlight and Note");
        else
          v18 = CFSTR("Remove Highlights and Note");
      }
      else
      {
        v17 = (void *)THBundle();
        if (v8 == (_BYTE *)&dword_0 + 1)
          v18 = CFSTR("Remove Highlight and Notes");
        else
          v18 = CFSTR("Remove Highlights and Notes");
      }
    }
    else
    {
      v17 = (void *)THBundle();
      if (v8 == (_BYTE *)&dword_0 + 1)
        v18 = CFSTR("Remove Highlight");
      else
        v18 = CFSTR("Remove Highlights");
    }
    -[THAnnotationController p_openUndoGroupWithContext:actionName:](self, "p_openUndoGroupWithContext:actionName:", v15, objc_msgSend(v17, "localizedStringForKey:value:table:", v18, &stru_43D7D8, 0));
    mAnnotationProvider = self->mAnnotationProvider;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_8DCF0;
    v20[3] = &unk_4286B0;
    v20[4] = a3;
    v20[5] = self;
    -[AEAnnotationProvider performBlockOnUserSideQueueAndWait:](mAnnotationProvider, "performBlockOnUserSideQueueAndWait:", v20);
    -[THAnnotationController p_closeUndoGroup](self, "p_closeUndoGroup");
  }
}

- (void)destroyAnnotation:(id)a3 undoContext:(id)a4
{
  if (a3)
    -[THAnnotationController destroyAnnotations:undoContext:](self, "destroyAnnotations:undoContext:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:"), a4);
  else
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 0, a4), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController destroyAnnotation:undoContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2319, CFSTR("invalid nil value for '%s'"), "cachedAnnotation");
}

- (id)modifyAnnotation:(id)a3 undoContext:(id)a4 undoActionName:(id)a5 withBlock:(id)a6
{
  NSMutableDictionary *v11;
  id v12;
  id v13;
  AEAnnotationProvider *mAnnotationProvider;
  id v15;
  _QWORD v17[9];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;

  if (!-[THAnnotationController canModifyAnnotations](self, "canModifyAnnotations"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController modifyAnnotation:undoContext:undoActionName:withBlock:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2328, CFSTR("cannot modify annotations"));
  if (objc_msgSend(a3, "annotationType") != 2)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController modifyAnnotation:undoContext:undoActionName:withBlock:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2329, CFSTR("modifyAnnotation is only for highlight (ranged) annotations -- if we need it for somethign else, we should add a variant that does the right thing with undo"));
  v11 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", a4);
  v12 = -[THDocumentRoot modelStorageAnchorForAnnotation:](-[THAnnotationController documentRoot](self, "documentRoot"), "modelStorageAnchorForAnnotation:", a3);
  if (v12)
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v12, CFSTR("THAnnotationStorageAnchorUndoContextKey"));
  -[THAnnotationController p_openUndoGroupWithContext:actionName:](self, "p_openUndoGroupWithContext:actionName:", v11, a5);
  v13 = -[THAnnotationController p_contentNodeForCachedAnnotation:](self, "p_contentNodeForCachedAnnotation:", a3);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = sub_88A0C;
  v22 = sub_88A1C;
  v23 = 0;
  mAnnotationProvider = self->mAnnotationProvider;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_8E140;
  v17[3] = &unk_428AA0;
  v17[4] = self;
  v17[5] = a3;
  v17[6] = v13;
  v17[7] = a6;
  v17[8] = &v18;
  -[AEAnnotationProvider performBlockOnUserSideQueueAndWait:](mAnnotationProvider, "performBlockOnUserSideQueueAndWait:", v17);
  -[THAnnotationController p_closeUndoGroup](self, "p_closeUndoGroup");
  v15 = (id)v19[5];
  _Block_object_dispose(&v18, 8);
  return v15;
}

- (id)modifyAnnotation:(id)a3 withNoteText:(id)a4 undoContext:(id)a5
{
  id v7;
  id v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  const __CFString *v14;
  _QWORD v16[5];

  v7 = a3;
  v9 = objc_msgSend(a3, "annotationNote");
  v10 = (unint64_t)objc_msgSend(v9, "length");
  v11 = (unint64_t)objc_msgSend(a4, "length");
  if (v10 | v11)
  {
    v12 = v11;
    if ((objc_msgSend(a4, "isEqualToString:", v9) & 1) == 0)
    {
      if (v12)
      {
        v13 = (void *)THBundle();
        if (v10)
          v14 = CFSTR("Edit Note");
        else
          v14 = CFSTR("Add Note");
      }
      else
      {
        v13 = (void *)THBundle();
        v14 = CFSTR("Remove Note");
      }
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_8E3E4;
      v16[3] = &unk_428AC8;
      v16[4] = a4;
      return -[THAnnotationController modifyAnnotation:undoContext:undoActionName:withBlock:](self, "modifyAnnotation:undoContext:undoActionName:withBlock:", v7, a5, objc_msgSend(v13, "localizedStringForKey:value:table:", v14, &stru_43D7D8, 0), v16);
    }
  }
  return v7;
}

- (id)modifyAnnotation:(id)a3 withStyle:(int)a4 undoContext:(id)a5
{
  id v7;
  _QWORD v10[4];
  int v11;

  v7 = a3;
  if (objc_msgSend(a3, "annotationStyle") != a4)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_8E4A4;
    v10[3] = &unk_428AE8;
    v11 = a4;
    return -[THAnnotationController modifyAnnotation:undoContext:undoActionName:withBlock:](self, "modifyAnnotation:undoContext:undoActionName:withBlock:", v7, a5, objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Edit Highlight"), &stru_43D7D8, 0), v10);
  }
  return v7;
}

- (id)cachedAnnotationsForContentNode:(id)a3
{
  id v5;
  id v6;
  AEAnnotationProvider *mAnnotationProvider;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t v12[8];
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = sub_88A0C;
  v18 = sub_88A1C;
  v19 = 0;
  v5 = -[THAnnotationController p_keyForContentNode:](self, "p_keyForContentNode:");
  objc_sync_enter(self);
  v6 = -[NSMutableDictionary objectForKey:](self->mAnnotationCache, "objectForKey:", v5);
  v15[5] = (uint64_t)v6;
  objc_sync_exit(self);
  if (!v15[5])
  {
    mAnnotationProvider = self->mAnnotationProvider;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_8E64C;
    v13[3] = &unk_428B10;
    v13[5] = a3;
    v13[6] = &v14;
    v13[4] = self;
    v8 = -[AEAnnotationProvider performBlockOnUserSideQueueAndWait:](mAnnotationProvider, "performBlockOnUserSideQueueAndWait:", v13);
    if (v15[5])
    {
      objc_sync_enter(self);
      -[NSMutableDictionary setObject:forKey:](self->mAnnotationCache, "setObject:forKey:", v15[5], v5);
      objc_sync_exit(self);
    }
    else
    {
      v9 = _AEBookPluginsAnnotationsLog(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Dropping annotation cache result because annotation provider was nil.", v12, 2u);
      }
    }
  }
  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);
  return v10;
}

- (unint64_t)nonOrphanedAnnotationCount
{
  return (unint64_t)objc_msgSend(-[THAnnotationController cachedAnnotationsForFetchRequest:migrateIfNecessary:](self, "cachedAnnotationsForFetchRequest:migrateIfNecessary:", -[THAnnotationController annotationRequestForNonOrphanedNotes](self, "annotationRequestForNonOrphanedNotes"), 0), "count");
}

- (id)modifiedAnnotation:(id)a3 withChapterTitle:(id)a4 physicalPageNumber:(id)a5
{
  uint64_t v8;
  void *v9;

  v8 = objc_opt_class(THCachedAnnotation, a2);
  v9 = (void *)TSUDynamicCast(v8, a3);
  return objc_msgSend(v9, "annotationWithChapterTitle:physicalPageNumber:", a4, a5);
}

- (id)temporaryAnnotationForStorage:(id)a3 contentNode:(id)a4 withRange:(_NSRange)a5 style:(int)a6
{
  return -[THAnnotationController temporaryAnnotationForStorage:contentNode:withRange:style:chapterTitle:](self, "temporaryAnnotationForStorage:contentNode:withRange:style:chapterTitle:", a3, a4, a5.location, a5.length, *(_QWORD *)&a6, 0);
}

- (id)temporaryAnnotationForStorage:(id)a3 contentNode:(id)a4 withRange:(_NSRange)a5 style:(int)a6 chapterTitle:(id)a7
{
  return -[THCachedAnnotation initTemporaryWithStorage:range:contentNode:style:chapterTitle:]([THCachedAnnotation alloc], "initTemporaryWithStorage:range:contentNode:style:chapterTitle:", a3, a5.location, a5.length, a4, *(_QWORD *)&a6, a7);
}

- (id)cachedAnnotationForFetchedObject:(id)a3
{
  uint64_t v4;
  id result;

  v4 = objc_opt_class(AEAnnotation, a2);
  result = (id)TSUDynamicCast(v4, a3);
  if (result)
    return -[THCachedAnnotation initWithAnnotation:contentNode:]([THCachedAnnotation alloc], "initWithAnnotation:contentNode:", result, 0);
  return result;
}

- (id)cachedAnnotationsForFetchRequest:(id)a3 migrateIfNecessary:(BOOL)a4
{
  AEAnnotationProvider *mAnnotationProvider;
  id v5;
  _QWORD v7[7];
  BOOL v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = sub_88A0C;
  v13 = sub_88A1C;
  v14 = 0;
  mAnnotationProvider = self->mAnnotationProvider;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_8E8C0;
  v7[3] = &unk_428B38;
  v7[5] = a3;
  v7[6] = &v9;
  v7[4] = self;
  v8 = a4;
  -[AEAnnotationProvider performBlockOnUserSideQueueAndWait:](mAnnotationProvider, "performBlockOnUserSideQueueAndWait:", v7);
  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (BOOL)p_annotationsNeedsMigration:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(a3);
        if (-[THAnnotationController p_cachedAnnotationNeedsMigration:](self, "p_cachedAnnotationNeedsMigration:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8)))
        {
          LOBYTE(v5) = 1;
          return (char)v5;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = v5;
      if (v5)
        continue;
      break;
    }
  }
  return (char)v5;
}

- (id)cachedAnnotationsForAnnotations:(id)a3 withFilter:(id)a4
{
  id v4;
  _QWORD v7[5];

  v4 = a3;
  if (a4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_8EBCC;
    v7[3] = &unk_428B60;
    v7[4] = a4;
    v4 = objc_msgSend(a3, "tsu_arrayOfObjectsPassingTest:", v7);
  }
  return -[THAnnotationCache initWithAnnotations:contentNode:needsMigration:]([THAnnotationCache alloc], "initWithAnnotations:contentNode:needsMigration:", v4, 0, -[THAnnotationController p_annotationsNeedsMigration:](self, "p_annotationsNeedsMigration:", v4));
}

- (id)cachedAnnotationsForAnnotations:(id)a3 filteredWithContentNode:(id)a4
{
  id v7;
  _QWORD v9[5];

  if (!a4)
    return 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_8EC94;
  v9[3] = &unk_428B88;
  v9[4] = objc_msgSend(a4, "nodeGUID");
  v7 = objc_msgSend(a3, "tsu_arrayOfObjectsPassingTest:", v9);
  return -[THAnnotationCache initWithAnnotations:contentNode:needsMigration:]([THAnnotationCache alloc], "initWithAnnotations:contentNode:needsMigration:", v7, a4, -[THAnnotationController p_annotationsNeedsMigration:](self, "p_annotationsNeedsMigration:", v7));
}

- (void)registerWithUndoManager:(id)a3
{
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController registerWithUndoManager:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2557, CFSTR("This operation must only be performed on the main thread."));
  if (self->mUndoManager)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController registerWithUndoManager:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2558, CFSTR("already registered with an undo manager"));
  self->mUndoManager = (NSUndoManager *)a3;
}

- (void)unregisterWithUndoManager:(id)a3
{
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController unregisterWithUndoManager:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2565, CFSTR("This operation must only be performed on the main thread."));
  if (self->mUndoManager != a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController unregisterWithUndoManager:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2566, CFSTR("not registered with this undo manager"));
  -[THAnnotationController p_clearUndoStack](self, "p_clearUndoStack");

  self->mUndoManager = 0;
}

- (void)registerAnnotationUndoObserver:(id)a3
{
  TSUMutablePointerSet *mUndoObservers;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController registerAnnotationUndoObserver:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2575, CFSTR("This operation must only be performed on the main thread."));
  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController registerAnnotationUndoObserver:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2576, CFSTR("invalid undo observer"));
  if (-[TSUMutablePointerSet containsObject:](self->mUndoObservers, "containsObject:", a3))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController registerAnnotationUndoObserver:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2577, CFSTR("this observer is already registered"));
  if (a3)
  {
    mUndoObservers = self->mUndoObservers;
    if (!mUndoObservers)
    {
      mUndoObservers = (TSUMutablePointerSet *)objc_alloc_init((Class)TSUMutablePointerSet);
      self->mUndoObservers = mUndoObservers;
    }
    -[TSUMutablePointerSet addObject:](mUndoObservers, "addObject:", a3);
  }
}

- (void)unregisterAnnotationUndoObserver:(id)a3
{
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController unregisterAnnotationUndoObserver:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2592, CFSTR("This operation must only be performed on the main thread."));
  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController unregisterAnnotationUndoObserver:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2593, CFSTR("invalid undo observer"));
  if ((-[TSUMutablePointerSet containsObject:](self->mUndoObservers, "containsObject:", a3) & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController unregisterAnnotationUndoObserver:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2594, CFSTR("this observer is not registered"));
  if (a3)
  {
    -[TSUMutablePointerSet removeObject:](self->mUndoObservers, "removeObject:", a3);
    if (!-[TSUMutablePointerSet count](self->mUndoObservers, "count"))
    {

      self->mUndoObservers = 0;
    }
  }
}

- (void)p_performAction:(id)a3 moc:(id)a4
{
  -[THAnnotationController p_performAction:undoable:moc:](self, "p_performAction:undoable:moc:", a3, 0, a4);
}

- (void)p_performUndoableAction:(id)a3 moc:(id)a4
{
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_performUndoableAction:moc:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2616, CFSTR("This operation must only be performed on the main thread."));
  -[THAnnotationController p_performAction:undoable:moc:](self, "p_performAction:undoable:moc:", a3, 1, a4);
}

- (void)p_performAction:(id)a3 undoable:(BOOL)a4 moc:(id)a5
{
  _BOOL4 v6;
  THAnnotationChangeList *mCurrentChangeList;

  v6 = a4;
  if (-[THAnnotationController annotationsWriteEnabled](self, "annotationsWriteEnabled") || self->mIgnoringWritability)
  {
    mCurrentChangeList = self->mCurrentChangeList;
    if (!mCurrentChangeList)
      -[THAnnotationController p_openActionGroup](self, "p_openActionGroup");
    objc_sync_enter(self);
    objc_msgSend(a3, "commitWithChangeList:annotationHost:moc:", self->mCurrentChangeList, self, a5);
    objc_sync_exit(self);
    if (v6)
      -[THAnnotationUndoGroup addAction:](self->mCurrentUndoGroup, "addAction:", a3);
    if (!mCurrentChangeList)
      -[THAnnotationController p_closeActionGroupWithMoc:](self, "p_closeActionGroupWithMoc:", a5);
  }
}

- (void)p_openActionGroup
{
  unint64_t mCurrentChangeGroupDepth;

  mCurrentChangeGroupDepth = self->mCurrentChangeGroupDepth;
  if (!mCurrentChangeGroupDepth)
  {
    if (self->mCurrentChangeList)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_openActionGroup]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2655, CFSTR("can't open an action group while another is open"));
    self->mCurrentChangeList = objc_alloc_init(THAnnotationChangeList);
    mCurrentChangeGroupDepth = self->mCurrentChangeGroupDepth;
  }
  self->mCurrentChangeGroupDepth = mCurrentChangeGroupDepth + 1;
}

- (void)p_closeActionGroupWithMoc:(id)a3
{
  unint64_t mCurrentChangeGroupDepth;
  unint64_t v5;

  mCurrentChangeGroupDepth = self->mCurrentChangeGroupDepth;
  if (mCurrentChangeGroupDepth)
  {
    v5 = mCurrentChangeGroupDepth - 1;
    self->mCurrentChangeGroupDepth = v5;
    if (!v5)
    {
      if (!self->mCurrentChangeList)
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_closeActionGroupWithMoc:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2671, CFSTR("can't close action group if there isn't one open"));
      objc_sync_enter(self);
      -[THAnnotationController p_processChangeList:moc:](self, "p_processChangeList:moc:", self->mCurrentChangeList, a3);
      objc_sync_exit(self);

      self->mCurrentChangeList = 0;
    }
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_closeActionGroupWithMoc:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2683, CFSTR("imbalanced calls to p_open/closeActionGroup"));
  }
}

- (void)p_beginIgnoringWritability
{
  if (self->mIgnoringWritability)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_beginIgnoringWritability]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2691, CFSTR("nested ignore-writability is not supported"));
  self->mIgnoringWritability = 1;
}

- (void)p_endIgnoringWritability
{
  if (!self->mIgnoringWritability)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_endIgnoringWritability]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2697, CFSTR("can't end ignore-writability before it has begun"));
  self->mIgnoringWritability = 0;
}

- (void)p_openUndoGroupWithContext:(id)a3 actionName:(id)a4
{
  THAnnotationUndoGroup *v7;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_openUndoGroupWithContext:actionName:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2705, CFSTR("This operation must only be performed on the main thread."));
  if (self->mCurrentUndoGroup)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_openUndoGroupWithContext:actionName:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2706, CFSTR("nested undo groups are not supported"));
  v7 = objc_alloc_init(THAnnotationUndoGroup);
  self->mCurrentUndoGroup = v7;
  -[THAnnotationUndoGroup setContext:](v7, "setContext:", a3);
  if (a4)
    -[NSUndoManager setActionName:](self->mUndoManager, "setActionName:", a4);
}

- (void)p_closeUndoGroup
{
  THAnnotationUndoGroup *mCurrentUndoGroup;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_closeUndoGroup]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2719, CFSTR("This operation must only be performed on the main thread."));
  mCurrentUndoGroup = self->mCurrentUndoGroup;
  if (!mCurrentUndoGroup)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_closeUndoGroup]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2720, CFSTR("can't close undo group if it was never opened"));
    mCurrentUndoGroup = self->mCurrentUndoGroup;
  }
  if (-[THAnnotationUndoGroup hasActions](mCurrentUndoGroup, "hasActions"))
    -[NSUndoManager registerUndoWithTarget:selector:object:](self->mUndoManager, "registerUndoWithTarget:selector:object:", self, "p_undoWithUndoGroup:", self->mCurrentUndoGroup);

  self->mCurrentUndoGroup = 0;
}

- (void)p_undoWithUndoGroup:(id)a3
{
  TSUMutablePointerSet *mUndoObservers;
  id v6;
  uint64_t v7;
  void *i;
  AEAnnotationProvider *mAnnotationProvider;
  TSUMutablePointerSet *v10;
  id v11;
  uint64_t v12;
  void *j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_undoWithUndoGroup:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2732, CFSTR("This operation must only be performed on the main thread."));
  if ((objc_msgSend(a3, "hasActions") & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_undoWithUndoGroup:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2733, CFSTR("undo stack should not contain an empty undo group"));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  mUndoObservers = self->mUndoObservers;
  v6 = -[TSUMutablePointerSet countByEnumeratingWithState:objects:count:](mUndoObservers, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(mUndoObservers);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "annotationsWillUpdateWithUndoContext:", objc_msgSend(a3, "context"));
      }
      v6 = -[TSUMutablePointerSet countByEnumeratingWithState:objects:count:](mUndoObservers, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }
  objc_sync_enter(self);
  mAnnotationProvider = self->mAnnotationProvider;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_8FB08;
  v18[3] = &unk_4286B0;
  v18[4] = a3;
  v18[5] = self;
  -[AEAnnotationProvider performBlockOnUserSideQueueAndWait:](mAnnotationProvider, "performBlockOnUserSideQueueAndWait:", v18);
  objc_sync_exit(self);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->mUndoObservers;
  v11 = -[TSUMutablePointerSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v15;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)j), "annotationsDidUpdateWithUndoContext:", objc_msgSend(a3, "context"));
      }
      v11 = -[TSUMutablePointerSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
    }
    while (v11);
  }
  -[NSUndoManager registerUndoWithTarget:selector:object:](self->mUndoManager, "registerUndoWithTarget:selector:object:", self, "p_redoWithUndoGroup:", a3);
}

- (void)p_redoWithUndoGroup:(id)a3
{
  TSUMutablePointerSet *mUndoObservers;
  id v6;
  uint64_t v7;
  void *i;
  AEAnnotationProvider *mAnnotationProvider;
  TSUMutablePointerSet *v10;
  id v11;
  uint64_t v12;
  void *j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_redoWithUndoGroup:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2758, CFSTR("This operation must only be performed on the main thread."));
  if ((objc_msgSend(a3, "hasActions") & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_redoWithUndoGroup:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2759, CFSTR("redo stack should not contain an empty undo group"));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  mUndoObservers = self->mUndoObservers;
  v6 = -[TSUMutablePointerSet countByEnumeratingWithState:objects:count:](mUndoObservers, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(mUndoObservers);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "annotationsWillUpdateWithUndoContext:", objc_msgSend(a3, "context"));
      }
      v6 = -[TSUMutablePointerSet countByEnumeratingWithState:objects:count:](mUndoObservers, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }
  objc_sync_enter(self);
  mAnnotationProvider = self->mAnnotationProvider;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_8FE14;
  v18[3] = &unk_4286B0;
  v18[4] = a3;
  v18[5] = self;
  -[AEAnnotationProvider performBlockOnUserSideQueueAndWait:](mAnnotationProvider, "performBlockOnUserSideQueueAndWait:", v18);
  objc_sync_exit(self);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->mUndoObservers;
  v11 = -[TSUMutablePointerSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v15;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)j), "annotationsDidUpdateWithUndoContext:", objc_msgSend(a3, "context"));
      }
      v11 = -[TSUMutablePointerSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
    }
    while (v11);
  }
  -[NSUndoManager registerUndoWithTarget:selector:object:](self->mUndoManager, "registerUndoWithTarget:selector:object:", self, "p_undoWithUndoGroup:", a3);
}

- (void)p_processChangeList:(id)a3 moc:(id)a4
{
  id v4;
  void *i;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *j;
  uint64_t v20;
  id v21;
  void *v22;
  THCachedAnnotation *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *k;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *m;
  uint64_t v36;
  id v37;
  id v38;
  THCachedAnnotation *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *n;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  void *ii;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  void *jj;
  char v56;
  id obj;
  id v58;
  uint64_t v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  id v66;
  id v67;
  char v68;
  id v69;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];

  v4 = a3;
  if ((objc_msgSend(a3, "isEmpty") & 1) == 0)
  {
    v58 = +[NSMutableSet set](NSMutableSet, "set");
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    obj = objc_msgSend(v4, "changedContentNodeIDs");
    v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
    if (v61)
    {
      v68 = 0;
      v56 = 0;
      v59 = *(_QWORD *)v96;
      v65 = v4;
      do
      {
        for (i = 0; i != v61; i = (char *)i + 1)
        {
          if (*(_QWORD *)v96 != v59)
            objc_enumerationMutation(obj);
          v7 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)i);
          v8 = objc_autoreleasePoolPush();
          v9 = -[THDocumentNavigationModel contentNodeForGUID:](-[THAnnotationController documentNavModel](self, "documentNavModel"), "contentNodeForGUID:", v7);
          v10 = -[THAnnotationController p_keyForContentNode:](self, "p_keyForContentNode:", v9);
          if (v10)
          {
            v11 = v10;
            v67 = v9;
            v62 = v8;
            v63 = i;
            v12 = -[NSMutableDictionary objectForKey:](self->mAEAnnotationManagedObjectIDs, "objectForKey:", v10);
            v69 = -[NSMutableDictionary objectForKey:](self->mCachedAnnotations, "objectForKey:", v11);
            v60 = v11;
            v13 = -[NSMutableDictionary objectForKey:](self->mAnnotationCache, "objectForKey:", v11);
            v91 = 0u;
            v92 = 0u;
            v93 = 0u;
            v94 = 0u;
            v64 = v7;
            v66 = objc_msgSend(v4, "addedAnnotationUUIDsForContentNodeID:", v7);
            v14 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v92;
              v17 = v13;
              v18 = v13;
              do
              {
                for (j = 0; j != v15; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v92 != v16)
                    objc_enumerationMutation(v66);
                  v20 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)j);
                  v21 = -[THAnnotationController p_storageAnnotationForUUID:includeDeleted:moc:](self, "p_storageAnnotationForUUID:includeDeleted:moc:", v20, 0, a4);
                  if (v21)
                  {
                    v22 = v21;
                    if ((objc_msgSend(v21, "isPlaceholder") & 1) == 0)
                    {
                      v23 = -[THCachedAnnotation initWithAnnotation:contentNode:]([THCachedAnnotation alloc], "initWithAnnotation:contentNode:", v22, v67);
                      objc_msgSend(v12, "setObject:forKey:", objc_msgSend(v22, "objectID"), v20);
                      objc_msgSend(v69, "setObject:forKey:", v23, v20);
                      v18 = objc_msgSend(v18, "newAnnotationCacheWithUpdatedAnnotation:", v23);
                      if (-[THCachedAnnotation annotationIsBookmark](v23, "annotationIsBookmark"))
                      {
                        objc_msgSend(-[NSMutableDictionary objectForKey:](self->mCachedAnnotations, "objectForKey:", CFSTR("THMacAnnotationAllBookmarks")), "setObject:forKey:", v23, v20);
                        v68 = 1;
                      }
                    }
                  }
                }
                v15 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
              }
              while (v15);
            }
            else
            {
              v17 = v13;
              v18 = v13;
            }
            v89 = 0u;
            v90 = 0u;
            v87 = 0u;
            v88 = 0u;
            v24 = objc_msgSend(v65, "deletedAnnotationUUIDsForContentNodeID:", v64);
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v87, v103, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v88;
              do
              {
                for (k = 0; k != v26; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v88 != v27)
                    objc_enumerationMutation(v24);
                  v29 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)k);
                  objc_msgSend(v12, "removeObjectForKey:", v29);
                  objc_msgSend(v69, "removeObjectForKey:", v29);
                  v30 = objc_msgSend(v17, "annotationWithUUID:", v29);
                  if (v30)
                    v18 = objc_msgSend(v18, "newAnnotationCacheWithRemovedAnnotation:", v30);
                  if (objc_msgSend(v30, "annotationIsBookmark"))
                  {
                    objc_msgSend(-[NSMutableDictionary objectForKey:](self->mCachedAnnotations, "objectForKey:", CFSTR("THMacAnnotationAllBookmarks")), "removeObjectForKey:", objc_msgSend(v30, "annotationUuid"));
                    v68 = 1;
                  }
                }
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v87, v103, 16);
              }
              while (v26);
            }
            v85 = 0u;
            v86 = 0u;
            v83 = 0u;
            v84 = 0u;
            v31 = objc_msgSend(v65, "changedAnnotationUUIDsForContentNodeID:", v64);
            v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v83, v102, 16);
            if (v32)
            {
              v33 = v32;
              v34 = *(_QWORD *)v84;
              do
              {
                for (m = 0; m != v33; m = (char *)m + 1)
                {
                  if (*(_QWORD *)v84 != v34)
                    objc_enumerationMutation(v31);
                  v36 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)m);
                  v37 = -[THAnnotationController p_storageAnnotationForUUID:includeDeleted:moc:](self, "p_storageAnnotationForUUID:includeDeleted:moc:", v36, 0, a4);
                  if (v37)
                  {
                    v38 = v37;
                    if ((objc_msgSend(v37, "isPlaceholder") & 1) == 0)
                    {
                      v39 = -[THCachedAnnotation initWithAnnotation:contentNode:]([THCachedAnnotation alloc], "initWithAnnotation:contentNode:", v38, v67);
                      objc_msgSend(v69, "setObject:forKey:", v39, v36);
                      v18 = objc_msgSend(v18, "newAnnotationCacheWithUpdatedAnnotation:", v39);
                      if (-[THCachedAnnotation annotationIsBookmark](v39, "annotationIsBookmark"))
                      {
                        objc_msgSend(-[NSMutableDictionary objectForKey:](self->mCachedAnnotations, "objectForKey:", CFSTR("THMacAnnotationAllBookmarks")), "setObject:forKey:", v39, v36);
                        v68 = 1;
                      }
                    }
                  }
                  else
                  {
                    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_processChangeList:moc:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2865, CFSTR("invalid nil value for '%s'"), "annotation");
                  }
                }
                v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v83, v102, 16);
              }
              while (v33);
            }
            if (v18)
              -[NSMutableDictionary setObject:forKey:](self->mAnnotationCache, "setObject:forKey:", v18, v60);
            v8 = v62;
            i = v63;
            if (v67)
              objc_msgSend(v58, "addObject:");
            else
              v56 = 1;
            v4 = v65;
          }
          else
          {
            objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_processChangeList:moc:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2801, CFSTR("invalid nil value for '%s'"), "contentNodeKey");
          }
          objc_autoreleasePoolPop(v8);
        }
        v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
      }
      while (v61);
      if ((v68 & 1) != 0)
        -[NSMutableDictionary removeObjectForKey:](self->mAnnotationCache, "removeObjectForKey:", CFSTR("THMacAnnotationAllBookmarks"));
    }
    else
    {
      v56 = 0;
    }
    -[THAnnotationController p_commitChangesWithMoc:](self, "p_commitChangesWithMoc:", a4);
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v40 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v79, v101, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v80;
      do
      {
        for (n = 0; n != v41; n = (char *)n + 1)
        {
          if (*(_QWORD *)v80 != v42)
            objc_enumerationMutation(v58);
          v44 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)n);
          v45 = -[THAnnotationController p_keyForContentNode:](self, "p_keyForContentNode:", v44);
          v75 = 0u;
          v76 = 0u;
          v77 = 0u;
          v78 = 0u;
          v46 = -[TSURetainedPointerKeyDictionary objectForKey:](self->mObservers, "objectForKey:", v45);
          v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v75, v100, 16);
          if (v47)
          {
            v48 = v47;
            v49 = *(_QWORD *)v76;
            do
            {
              for (ii = 0; ii != v48; ii = (char *)ii + 1)
              {
                if (*(_QWORD *)v76 != v49)
                  objc_enumerationMutation(v46);
                objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)ii), "annotationsUpdatedForContentNode:", v44);
              }
              v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v75, v100, 16);
            }
            while (v48);
          }
        }
        v41 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v79, v101, 16);
      }
      while (v41);
    }
    if ((v56 & 1) != 0)
    {
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v51 = -[TSURetainedPointerKeyDictionary objectForKey:](self->mObservers, "objectForKey:", CFSTR("THMacAnnotationLostOrphans"));
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v71, v99, 16);
      if (v52)
      {
        v53 = v52;
        v54 = *(_QWORD *)v72;
        do
        {
          for (jj = 0; jj != v53; jj = (char *)jj + 1)
          {
            if (*(_QWORD *)v72 != v54)
              objc_enumerationMutation(v51);
            objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)jj), "annotationsUpdatedForContentNode:", 0);
          }
          v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v71, v99, 16);
        }
        while (v53);
      }
    }
  }
}

- (id)p_actionForInsertingAnnotationWithType:(int)a3 style:(int)a4 absolutePageIndex:(unint64_t)a5 range:(_NSRange)a6 storage:(id)a7 contentNode:(id)a8 updateBlock:(id)a9
{
  THInsertAnnotationAction *v11;
  uint64_t v12;
  NSString *v13;
  id v14;
  _QWORD v16[8];
  _NSRange v17;
  int v18;
  int v19;

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_90728;
  v16[3] = &unk_428BB0;
  v18 = a4;
  v19 = a3;
  v16[4] = a8;
  v16[5] = a7;
  v17 = a6;
  v16[6] = a9;
  v16[7] = a5;
  v11 = [THInsertAnnotationAction alloc];
  v12 = kAEAnnotationVersion_4;
  v13 = -[THBookVersion versionString](-[THDocumentProperties bookVersion](-[THDocumentRoot properties](-[THAnnotationController documentRoot](self, "documentRoot"), "properties"), "bookVersion"), "versionString");
  v14 = -[THAnnotationController annotationID](self, "annotationID");
  return -[THInsertAnnotationAction initWithVersion:bookVersion:assetID:creatorID:contentNode:storage:updateBlock:](v11, "initWithVersion:bookVersion:assetID:creatorID:contentNode:storage:updateBlock:", v12, v13, v14, kAEAnnotationCreatorIdentifier_iBooks_textbooks, a8, a7, v16);
}

- (id)p_actionForUpdatingAnnotation:(id)a3 withContentNode:(id)a4 block:(id)a5
{
  _QWORD v9[5];

  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_actionForUpdatingAnnotation:withContentNode:block:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 2985, CFSTR("invalid nil value for '%s'"), "annotation");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_9094C;
  v9[3] = &unk_428A78;
  v9[4] = a5;
  return -[THUpdateAnnotationAction initWithAnnotation:contentNode:updateBlock:]([THUpdateAnnotationAction alloc], "initWithAnnotation:contentNode:updateBlock:", a3, a4, v9);
}

- (id)p_actionForUpdatingAnnotation:(id)a3 withBlock:(id)a4
{
  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_actionForUpdatingAnnotation:withBlock:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 3000, CFSTR("invalid nil value for '%s'"), "annotation");
  return -[THAnnotationController p_actionForUpdatingAnnotation:withContentNode:block:](self, "p_actionForUpdatingAnnotation:withContentNode:block:", a3, -[THDocumentNavigationModel contentNodeForGUID:](-[THAnnotationController documentNavModel](self, "documentNavModel"), "contentNodeForGUID:", objc_msgSend(a3, "annotationContentNodeID")), a4);
}

- (id)p_actionForDeletingCachedAnnotation:(id)a3 moc:(id)a4
{
  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_actionForDeletingCachedAnnotation:moc:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 3008, CFSTR("invalid nil value for '%s'"), "cachedAnnotation");
  return -[THAnnotationController p_actionForDeletingAEAnnotation:](self, "p_actionForDeletingAEAnnotation:", -[THAnnotationController p_annotationForCachedAnnotation:moc:](self, "p_annotationForCachedAnnotation:moc:", a3, a4));
}

- (id)p_actionForDeletingAEAnnotation:(id)a3
{
  NSObject *v4;
  uint8_t buf[4];
  id v7;
  __int16 v8;
  id v9;

  if (!a3)
    self = (THAnnotationController *)objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_actionForDeletingAEAnnotation:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 3016, CFSTR("invalid nil value for '%s'"), "annotation");
  v4 = _AEBookPluginsAnnotationsLog(self);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v7 = objc_msgSend(a3, "annotationAssetID");
    v8 = 2112;
    v9 = objc_msgSend(a3, "annotationUuid");
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "delete bliss annotation: assetID: %@, uuid: %@", buf, 0x16u);
  }
  return -[THDeleteAnnotationAction initWithAnnotation:]([THDeleteAnnotationAction alloc], "initWithAnnotation:", a3);
}

- (void)p_clearUndoStack
{
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationController p_clearUndoStack]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"), 3029, CFSTR("This operation must only be performed on the main thread."));
  -[NSUndoManager removeAllActionsWithTarget:](self->mUndoManager, "removeAllActionsWithTarget:", self);
}

- (THDocumentRoot)documentRoot
{
  return self->mDocumentRoot;
}

- (void)setDocumentRoot:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (THDocumentNavigationModel)documentNavModel
{
  return self->mDocumentNavModel;
}

- (void)setDocumentNavModel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (int)currentAnnotationStyle
{
  return self->mCurrentStyle;
}

- (void)setCurrentAnnotationStyle:(int)a3
{
  self->mCurrentStyle = a3;
}

- (unint64_t)mocRevision
{
  return self->mMOCRevision;
}

- (NSPredicate)basePredicate
{
  return self->mBasePredicate;
}

- (void)setBasePredicate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSPredicate)nonOrphanedPredicate
{
  return self->mNonOrphanedPredicate;
}

- (void)setNonOrphanedPredicate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSPredicate)orphanedPredicate
{
  return self->mOrphanedPredicate;
}

- (void)setOrphanedPredicate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSPredicate)rangePredicate
{
  return self->mRangePredicate;
}

- (void)setRangePredicate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSPredicate)pointPredicate
{
  return self->mPointPredicate;
}

- (void)setPointPredicate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSPredicate)globalPredicate
{
  return self->mGlobalPredicate;
}

- (void)setGlobalPredicate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSPredicate)nonCurrentVersionPredicate
{
  return self->mNonCurrentVersionPredicate;
}

- (void)setNonCurrentVersionPredicate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

- (NSPredicate)nonOrphanedRangePredicate
{
  return self->mNonOrphanedRangePredicate;
}

- (void)setNonOrphanedRangePredicate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSPredicate)orphanedRangePredicate
{
  return self->mOrphanedRangePredicate;
}

- (void)setOrphanedRangePredicate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSPredicate)nonSponsoredPredicate
{
  return self->mNonSponsoredPredicate;
}

- (void)setNonSponsoredPredicate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSPredicate)nonSponsoredNonOrphanedPredicate
{
  return self->mNonSponsoredNonOrphanedPredicate;
}

- (void)setNonSponsoredNonOrphanedPredicate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (BOOL)annotationsReadEnabled
{
  return self->mAnnotationsReadEnabled;
}

- (void)setAnnotationsReadEnabled:(BOOL)a3
{
  self->mAnnotationsReadEnabled = a3;
}

- (BOOL)annotationsWriteEnabled
{
  return self->mAnnotationsWriteEnabled;
}

- (void)setAnnotationsWriteEnabled:(BOOL)a3
{
  self->mAnnotationsWriteEnabled = a3;
}

- (NSManagedObjectContext)lastCommitMoc
{
  return self->_lastCommitMoc;
}

- (void)setLastCommitMoc:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 240);
}

- (id)managedObjectContextSaveObserver
{
  return self->_managedObjectContextSaveObserver;
}

- (void)setManagedObjectContextSaveObserver:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 248);
}

@end
