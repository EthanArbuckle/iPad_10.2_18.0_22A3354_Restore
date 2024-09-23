@implementation PXPeopleRecoDataSource

- (PXPeopleRecoDataSource)initWithPerson:(id)a3 dataSourceDelegate:(id)a4
{
  id v7;
  id v8;
  PXPeopleRecoDataSource *v9;
  PXPeopleRecoDataSource *v10;
  NSMutableIndexSet *v11;
  NSMutableIndexSet *rejectedFaceIndexes;
  NSMutableIndexSet *v13;
  NSMutableIndexSet *rejectedFaceCropIndexes;
  void *v15;
  void *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PXPeopleRecoDataSource;
  v9 = -[PXPeopleRecoDataSource init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_person, a3);
    objc_storeWeak((id *)&v10->_dataSourceDelegate, v8);
    v11 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    rejectedFaceIndexes = v10->_rejectedFaceIndexes;
    v10->_rejectedFaceIndexes = v11;

    v13 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    rejectedFaceCropIndexes = v10->_rejectedFaceCropIndexes;
    v10->_rejectedFaceCropIndexes = v13;

    +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_isUsingMockedData = objc_msgSend(v15, "useReviewPhotosMockDataSource");

    -[PXPeopleRecoDataSource _fetchEverythingForPerson:](v10, "_fetchEverythingForPerson:", v7);
    objc_msgSend(v7, "photoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "px_registerChangeObserver:", v10);

  }
  return v10;
}

- (void)_fetchEverythingForPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludeOnlyFacesNeedingFaceCrop:", 1);
  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludedDetectionTypes:", v6);

  objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesForPerson:options:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleRecoDataSource setFaces:](self, "setFaces:", v7);

  objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", 0, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXPeopleRecoDataSource isUsingMockedData](self, "isUsingMockedData"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("uuid"), 1);
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSortDescriptors:", v10);

    objc_msgSend(v8, "setFetchLimit:", 100);
    objc_msgSend(MEMORY[0x1E0CD1538], "fetchFaceCropsWithOptions:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type=%d||type=%d||type=%d"), 1, 3, 5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPredicate:", v12);

    objc_msgSend(MEMORY[0x1E0CD1538], "fetchFaceCropsForPerson:options:", v4, v8);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v11;
  -[PXPeopleRecoDataSource setFaceCrops:](self, "setFaceCrops:", v11);

}

- (unint64_t)numberOfItems
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[PXPeopleRecoDataSource faces](self, "faces");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[PXPeopleRecoDataSource faceCrops](self, "faceCrops");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") + v4;

  return v6;
}

- (void)requestImageForItemAtIndex:(unint64_t)a3 targetSize:(CGSize)a4 displayScale:(double)a5 imageBlock:(id)a6
{
  double height;
  double width;
  id v11;
  void *v12;
  unint64_t v13;
  PXPeopleFaceCropFetchOptions *v14;
  void *v15;
  void *v16;
  PXPeopleFaceCropFetchOptions *v17;
  void *v18;
  void *v19;
  id v20;
  unint64_t v21;
  NSObject *v22;
  _QWORD block[5];
  id v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD v27[4];
  id v28;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  -[PXPeopleRecoDataSource faces](self, "faces");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  if (v13 <= a3)
  {
    v21 = v13;
    dispatch_get_global_queue(25, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__PXPeopleRecoDataSource_requestImageForItemAtIndex_targetSize_displayScale_imageBlock___block_invoke_2;
    block[3] = &unk_1E5145070;
    v25 = a3;
    v26 = v21;
    block[4] = self;
    v24 = v11;
    v17 = (PXPeopleFaceCropFetchOptions *)v11;
    dispatch_async(v22, block);

  }
  else
  {
    v14 = [PXPeopleFaceCropFetchOptions alloc];
    -[PXPeopleRecoDataSource person](self, "person");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PXPeopleFaceCropFetchOptions initWithPerson:face:targetSize:displayScale:](v14, "initWithPerson:face:targetSize:displayScale:", v15, v16, width, height, a5);

    +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v14) = objc_msgSend(v18, "showReviewPhotosObjectType");

    if ((v14 & 1) == 0)
      -[PXPeopleFaceCropFetchOptions setCornerStyle:](v17, "setCornerStyle:", 1);
    +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __88__PXPeopleRecoDataSource_requestImageForItemAtIndex_targetSize_displayScale_imageBlock___block_invoke;
    v27[3] = &unk_1E5147AB8;
    v28 = v11;
    v20 = v11;
    objc_msgSend(v19, "requestFaceCropForOptions:resultHandler:", v17, v27);

  }
}

- (BOOL)isIndexRejected:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  char v10;

  -[PXPeopleRecoDataSource faces](self, "faces");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (a3 >= v6)
  {
    -[PXPeopleRecoDataSource rejectedFaceCropIndexes](self, "rejectedFaceCropIndexes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = a3 - v6;
  }
  else
  {
    -[PXPeopleRecoDataSource rejectedFaceIndexes](self, "rejectedFaceIndexes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = a3;
  }
  v10 = objc_msgSend(v7, "containsIndex:", v9);

  return v10;
}

- (BOOL)toggleRejectionForIndex:(unint64_t)a3
{
  BOOL v5;
  void *v6;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;

  v5 = -[PXPeopleRecoDataSource isIndexRejected:](self, "isIndexRejected:");
  -[PXPeopleRecoDataSource faces](self, "faces");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = a3 >= v7;
  v9 = a3 - v7;
  if (v5)
  {
    if (v8)
    {
      -[PXPeopleRecoDataSource rejectedFaceCropIndexes](self, "rejectedFaceCropIndexes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = v9;
    }
    else
    {
      -[PXPeopleRecoDataSource rejectedFaceIndexes](self, "rejectedFaceIndexes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = a3;
    }
    objc_msgSend(v10, "removeIndex:", v12);
  }
  else
  {
    if (v8)
    {
      -[PXPeopleRecoDataSource rejectedFaceCropIndexes](self, "rejectedFaceCropIndexes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v13;
      v14 = v9;
    }
    else
    {
      -[PXPeopleRecoDataSource rejectedFaceIndexes](self, "rejectedFaceIndexes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v13;
      v14 = a3;
    }
    objc_msgSend(v13, "addIndex:", v14);
  }

  return !v5;
}

- (BOOL)shouldAllowCommitting
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = -[PXPeopleRecoDataSource numberOfItems](self, "numberOfItems");
  -[PXPeopleRecoDataSource rejectedFaceIndexes](self, "rejectedFaceIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  -[PXPeopleRecoDataSource rejectedFaceCropIndexes](self, "rejectedFaceCropIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v3 > objc_msgSend(v6, "count") + v5;

  return v3;
}

- (BOOL)hasAnyRejectedItems
{
  void *v3;
  BOOL v4;
  void *v5;

  -[PXPeopleRecoDataSource rejectedFaceIndexes](self, "rejectedFaceIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[PXPeopleRecoDataSource rejectedFaceCropIndexes](self, "rejectedFaceCropIndexes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

- (void)commitChanges
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  PXPeopleRecoDataSource *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  if (-[PXPeopleRecoDataSource hasAnyRejectedItems](self, "hasAnyRejectedItems")
    && !-[PXPeopleRecoDataSource isUsingMockedData](self, "isUsingMockedData"))
  {
    +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "enableReviewPhotosDemoMode");

    if ((v4 & 1) == 0)
    {
      -[PXPeopleRecoDataSource faces](self, "faces");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleRecoDataSource rejectedFaceIndexes](self, "rejectedFaceIndexes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectsAtIndexes:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXPeopleRecoDataSource faceCrops](self, "faceCrops");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleRecoDataSource rejectedFaceCropIndexes](self, "rejectedFaceCropIndexes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectsAtIndexes:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXPeopleRecoDataSource person](self, "person");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "photoLibrary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __39__PXPeopleRecoDataSource_commitChanges__block_invoke;
      v20[3] = &unk_1E51457C8;
      v21 = v11;
      v22 = v7;
      v23 = v10;
      v17[0] = v13;
      v17[1] = 3221225472;
      v17[2] = __39__PXPeopleRecoDataSource_commitChanges__block_invoke_2;
      v17[3] = &unk_1E5147B40;
      v18 = v21;
      v19 = self;
      v14 = v21;
      v15 = v10;
      v16 = v7;
      objc_msgSend(v12, "performChanges:completionHandler:", v20, v17);

    }
  }
}

- (OS_dispatch_queue)processingQueue
{
  OS_dispatch_queue **p_processingQueue;
  OS_dispatch_queue *v3;
  NSObject *v4;

  p_processingQueue = &self->_processingQueue;
  v3 = self->_processingQueue;
  if (!v3)
  {
    dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.photos.people.manageTags.processing", v4);

    objc_storeStrong((id *)p_processingQueue, v3);
  }
  return v3;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
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
  objc_class *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  -[PXPeopleRecoDataSource person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "changeDetailsForObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectAfterChanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "px_descriptionForAssertionMessage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleRecoDataSource.m"), 235, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("personChangeDetails.objectAfterChanges"), v20, v21);

    }
  }
  if (objc_msgSend(v7, "verifiedType") == -2)
  {
    objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CD16C0];
    objc_msgSend(v7, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchFinalMergeTargetPersonsForPersonWithUUID:options:", v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPeopleRecoDataSource setPerson:](self, "setPerson:", v12);
    -[PXPeopleRecoDataSource _fetchEverythingForPerson:](self, "_fetchEverythingForPerson:", v12);
LABEL_11:
    -[PXPeopleRecoDataSource _clearIndexes](self, "_clearIndexes");
    v17 = v8;
    goto LABEL_12;
  }
  -[PXPeopleRecoDataSource faces](self, "faces");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "changeDetailsForFetchResult:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "fetchResultAfterChanges");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleRecoDataSource setFaces:](self, "setFaces:", v14);

  }
  -[PXPeopleRecoDataSource faceCrops](self, "faceCrops");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "changeDetailsForFetchResult:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "fetchResultAfterChanges");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleRecoDataSource setFaceCrops:](self, "setFaceCrops:", v16);

    goto LABEL_11;
  }
  v17 = 0;
  if (v8)
    goto LABEL_11;
LABEL_12:

}

- (void)_clearIndexes
{
  void *v3;
  void *v4;
  id v5;

  -[PXPeopleRecoDataSource rejectedFaceIndexes](self, "rejectedFaceIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllIndexes");

  -[PXPeopleRecoDataSource rejectedFaceCropIndexes](self, "rejectedFaceCropIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllIndexes");

  -[PXPeopleRecoDataSource dataSourceDelegate](self, "dataSourceDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recoDataSourceDataChanged:", self);

}

- (PHPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (PXPeopleRecoDataSourceDelegate)dataSourceDelegate
{
  return (PXPeopleRecoDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_dataSourceDelegate);
}

- (PHFetchResult)faces
{
  return self->_faces;
}

- (void)setFaces:(id)a3
{
  objc_storeStrong((id *)&self->_faces, a3);
}

- (PHFetchResult)faceCrops
{
  return self->_faceCrops;
}

- (void)setFaceCrops:(id)a3
{
  objc_storeStrong((id *)&self->_faceCrops, a3);
}

- (NSMutableIndexSet)rejectedFaceIndexes
{
  return self->_rejectedFaceIndexes;
}

- (NSMutableIndexSet)rejectedFaceCropIndexes
{
  return self->_rejectedFaceCropIndexes;
}

- (void)setProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processingQueue, a3);
}

- (BOOL)isUsingMockedData
{
  return self->_isUsingMockedData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_rejectedFaceCropIndexes, 0);
  objc_storeStrong((id *)&self->_rejectedFaceIndexes, 0);
  objc_storeStrong((id *)&self->_faceCrops, 0);
  objc_storeStrong((id *)&self->_faces, 0);
  objc_destroyWeak((id *)&self->_dataSourceDelegate);
  objc_storeStrong((id *)&self->_person, 0);
}

uint64_t __39__PXPeopleRecoDataSource_commitChanges__block_invoke(id *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t result;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1[4], "verifiedType");
  v3 = objc_msgSend(a1[5], "count");
  if (v2 != 1 || v3 != 0)
  {
    v5 = v3;
    objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", a1[4]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v2 != 1)
      objc_msgSend(v6, "setVerifiedType:", 1);
    if (v5)
      objc_msgSend(v7, "addRejectedFaces:forCluster:", a1[5], 1);

  }
  result = objc_msgSend(a1[6], "count");
  if (result)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = a1[6];
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = (id)objc_msgSend(MEMORY[0x1E0CD1548], "creationRequestForFaceCropCopyFromFaceCrop:withType:onPerson:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++), 2, a1[4], (_QWORD)v15);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

    return objc_msgSend(MEMORY[0x1E0CD1548], "deleteFaceCrops:", a1[6]);
  }
  return result;
}

void __39__PXPeopleRecoDataSource_commitChanges__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD block[4];
  NSObject *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v14 = v5;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Error committing rejections: %@ for person: %@", buf, 0x16u);
    }
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isLowPowerModeEnabled");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "processingQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__PXPeopleRecoDataSource_commitChanges__block_invoke_144;
    block[3] = &unk_1E5149198;
    v12 = *(id *)(a1 + 32);
    dispatch_async(v8, block);

    v9 = v12;
LABEL_7:

  }
}

void __39__PXPeopleRecoDataSource_commitChanges__block_invoke_144(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(MEMORY[0x1E0D475C0], "sharedAnalysisService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoLibraryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__PXPeopleRecoDataSource_commitChanges__block_invoke_3;
  v5[3] = &unk_1E5148600;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v2, "requestPersonProcessingForPhotoLibraryURL:options:progressHandler:completionHandler:", v4, MEMORY[0x1E0C9AA70], &__block_literal_global_283401, v5);

}

void __39__PXPeopleRecoDataSource_commitChanges__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v12 = 138412546;
      v13 = v3;
      v14 = 2112;
      v15 = v6;
      v7 = "Error requesting person processing: %@ for person: %@";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 22;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(void **)(a1 + 32);
    v12 = 138412290;
    v13 = v11;
    v7 = "Successfully requested person processing for person: %@";
    v8 = v5;
    v9 = OS_LOG_TYPE_DEFAULT;
    v10 = 12;
    goto LABEL_6;
  }

}

void __88__PXPeopleRecoDataSource_requestImageForItemAtIndex_targetSize_displayScale_imageBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  if (*(_QWORD *)(a1 + 32))
  {
    v5 = a2;
    objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PXPeopleContentsRectKey"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "CGRectValue");
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);

  }
}

void __88__PXPeopleRecoDataSource_requestImageForItemAtIndex_targetSize_displayScale_imageBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "faceCrops");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  if (v4 < v5)
    v5 = 0;
  objc_msgSend(v2, "objectAtIndex:", v4 - v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v10, "resourceData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, void *, double, double, double, double))(v9 + 16))(v9, v8, *(double *)off_1E50B86D0, *((double *)off_1E50B86D0 + 1), *((double *)off_1E50B86D0 + 2), *((double *)off_1E50B86D0 + 3));

}

@end
