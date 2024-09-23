@implementation PGSurveyQuestionFactory

- (PGSurveyQuestionFactory)initWithWorkingContext:(id)a3 questionVersion:(signed __int16)a4
{
  id v7;
  PGSurveyQuestionFactory *v8;
  PGSurveyQuestionFactory *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGSurveyQuestionFactory;
  v8 = -[PGSurveyQuestionFactory init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_workingContext, a3);
    v9->_questionVersion = a4;
  }

  return v9;
}

- (unsigned)questionType
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0C99DA0]);
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ must implement %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithName:reason:userInfo:", v4, v9, 0);

  objc_exception_throw(objc_retainAutorelease(v10));
}

- (NSArray)collidingQuestionTypes
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[PGSurveyQuestionFactory questionType](self, "questionType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (int64_t)questionOptions
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0C99DA0]);
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ must implement %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithName:reason:userInfo:", v4, v9, 0);

  objc_exception_throw(objc_retainAutorelease(v10));
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = objc_alloc(MEMORY[0x1E0C99DA0]);
  v7 = *MEMORY[0x1E0C99768];
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ must implement %@"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v6, "initWithName:reason:userInfo:", v7, v12, 0);

  objc_exception_throw(objc_retainAutorelease(v13));
}

- (BOOL)questionAlreadyExists:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PGSurveyQuestionFactory ignoreExistingQuestions](self, "ignoreExistingQuestions"))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    objc_msgSend(v4, "entityIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGSurveyQuestionFactory existingQuestionsByEntityIdentifier](self, "existingQuestionsByEntityIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v9 = v8;
      v5 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
      {
        v10 = *(_QWORD *)v14;
        while (2)
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v9);
            if ((objc_msgSend(v4, "isEquivalentToPersistedQuestion:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13) & 1) != 0)
            {
              LOBYTE(v5) = 1;
              goto LABEL_14;
            }
          }
          v5 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v5)
            continue;
          break;
        }
      }
LABEL_14:

    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  return v5;
}

- (id)existingQuestionsForEntityIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PGSurveyQuestionFactory existingQuestionsByEntityIdentifier](self, "existingQuestionsByEntityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = (void *)MEMORY[0x1E0C9AA60];
  v8 = v7;

  return v8;
}

- (BOOL)shouldAddQuestion:(id)a3 toAlreadyGeneratedQuestions:(id)a4
{
  id v6;
  id v7;
  int v8;

  v6 = a3;
  v7 = a4;
  if (-[PGSurveyQuestionFactory questionAlreadyExists:](self, "questionAlreadyExists:", v6))
    LOBYTE(v8) = 0;
  else
    v8 = objc_msgSend(v7, "containsObject:", v6) ^ 1;

  return v8;
}

- (id)fetchExistingQuestions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3880];
  -[PGSurveyQuestionFactory collidingQuestionTypes](self, "collidingQuestionTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("type in %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  objc_msgSend(MEMORY[0x1E0CD1720], "fetchQuestionsWithOptions:validQuestionsOnly:", v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "loggingConnection");
  v11 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v16 = v9;
    v17 = 2112;
    v18 = v13;
    _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_INFO, "%d existing questions found for factory %@", buf, 0x12u);

  }
  return v8;
}

- (NSDictionary)existingQuestionsByEntityIdentifier
{
  NSDictionary *existingQuestionsByEntityIdentifier;
  void *v4;
  NSDictionary *v5;
  NSDictionary *v6;

  existingQuestionsByEntityIdentifier = self->_existingQuestionsByEntityIdentifier;
  if (!existingQuestionsByEntityIdentifier)
  {
    -[PGSurveyQuestionFactory fetchExistingQuestions](self, "fetchExistingQuestions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGSurveyQuestionFactory _questionsByEntityIdentifierFromQuestions:](self, "_questionsByEntityIdentifierFromQuestions:", v4);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_existingQuestionsByEntityIdentifier;
    self->_existingQuestionsByEntityIdentifier = v5;

    existingQuestionsByEntityIdentifier = self->_existingQuestionsByEntityIdentifier;
  }
  return existingQuestionsByEntityIdentifier;
}

- (id)_questionsByEntityIdentifierFromQuestions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "entityIdentifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);
        }
        objc_msgSend(v12, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)assetsFromMomentNode:(id)a3 curationContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchAssetCollectionInPhotoLibrary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSortDescriptors:", v11);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v7, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v19, "clsIsScreenshotOrScreenRecording", (_QWORD)v21) & 1) == 0)
          objc_msgSend(v13, "addObject:", v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }

  return v13;
}

- (id)curatedAssetsFromMomentNode:(id)a3 curationContext:(id)a4
{
  PGManagerWorkingContext *workingContext;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  workingContext = self->_workingContext;
  v7 = a4;
  v8 = a3;
  -[PGManagerWorkingContext photoLibrary](workingContext, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchAssetCollectionInPhotoLibrary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGCurationOptions defaultOptions](PGCurationOptions, "defaultOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGManagerWorkingContext curationManager](self->_workingContext, "curationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "curatedAssetsForAssetCollection:options:curationContext:progressBlock:", v10, v11, v7, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)assetFromMomentNode:(id)a3 closestToLocationCoordinate:(CLLocationCoordinate2D)a4 radius:(double)a5 curationContext:(id)a6
{
  double longitude;
  double latitude;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  id v28;
  uint64_t v30;
  uint64_t v31;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v11 = a3;
  if (v11)
  {
    -[PGSurveyQuestionFactory curatedAssetsFromMomentNode:curationContext:](self, "curatedAssetsFromMomentNode:curationContext:", v11, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGSurveyQuestionFactory _assetFromAssets:closestToLocationCoordinate:radius:](self, "_assetFromAssets:closestToLocationCoordinate:radius:", v12, latitude, longitude, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "locationCoordinate");
      v30 = v15;
      v31 = v16;
      CLLocationCoordinate2DGetDistanceFrom();
      if (a5 == 0.0 || (v18 = v17, v17 <= a5))
      {
        v19 = v14;
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      v18 = 1.79769313e308;
    }
    -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary", v30, v31);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchAssetCollectionInPhotoLibrary:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "librarySpecificFetchOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v21, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "fetchedObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGSurveyQuestionFactory _assetFromAssets:closestToLocationCoordinate:radius:](self, "_assetFromAssets:closestToLocationCoordinate:radius:", v25, a4.latitude, a4.longitude, a5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26 && (objc_msgSend(v26, "locationCoordinate"), CLLocationCoordinate2DGetDistanceFrom(), v27 + 10.0 < v18))
      v28 = v26;
    else
      v28 = v14;
    v19 = v28;

    goto LABEL_13;
  }
  v19 = 0;
LABEL_14:

  return v19;
}

- (id)_assetFromAssets:(id)a3 closestToLocationCoordinate:(CLLocationCoordinate2D)a4 radius:(double)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  double v19;
  uint64_t i;
  void *v21;
  double v22;
  double v23;
  id v26;
  id v27;
  void *v28;
  id v29;
  CLLocationCoordinate2D v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CLLocationCoordinate2D v36;
  _BYTE v37[128];
  _QWORD v38[3];
  CLLocationCoordinate2D v39;

  v38[2] = *MEMORY[0x1E0C80C00];
  v36 = a4;
  v6 = (void *)MEMORY[0x1E0CB3928];
  v7 = a3;
  objc_msgSend(v6, "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingDescriptors:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = 0;
    v17 = *MEMORY[0x1E0C9E318];
    v18 = *(_QWORD *)v33;
    v19 = *MEMORY[0x1E0C9E318];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(v12);
        v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v21, "locationCoordinate", 0, 0, (_QWORD)v32);
        v31 = v39;
        if (CLLocationCoordinate2DIsValid(v39))
        {
          CLLocationCoordinate2DGetDistanceFrom();
          v23 = v22;
          if ((v22 <= a5 || a5 == 0.0) && v22 < v17)
          {
            v26 = v21;

            v15 = v26;
            v17 = v23;
          }
          if (v23 < v19)
          {
            v27 = v21;

            v16 = v27;
            v19 = v23;
          }
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16, *(_QWORD *)&v31.latitude, *(_QWORD *)&v31.longitude);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
    v16 = 0;
  }

  if (v15)
    v28 = v15;
  else
    v28 = v16;
  v29 = v28;

  return v29;
}

- (id)representativeAssetsFromMomentNode:(id)a3 curationContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  void *v43;
  id v44;
  id v45;
  id obj;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  _BYTE buf[22];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    objc_msgSend(v6, "addressEdges");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v47 = v9;
      v44 = v7;
      v45 = v6;
      -[PGSurveyQuestionFactory assetsFromMomentNode:curationContext:](self, "assetsFromMomentNode:curationContext:", v6, v7);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v43 = v10;
      obj = v10;
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
      if (v50)
      {
        v48 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v50; ++i)
          {
            if (*(_QWORD *)v58 != v48)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
            v55 = 0;
            v56 = 0;
            objc_msgSend(v12, "photoLocation");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "coordinate");
            v55 = v14;
            v56 = v15;

            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "universalStartDate");
            v17 = objc_claimAutoreleasedReturnValue();
            if (v17
              && (v18 = (void *)v17,
                  objc_msgSend(v12, "universalEndDate"),
                  v19 = (void *)objc_claimAutoreleasedReturnValue(),
                  v19,
                  v18,
                  v19))
            {
              v20 = objc_alloc(MEMORY[0x1E0CB3588]);
              objc_msgSend(v12, "universalStartDate");
              v21 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "universalEndDate");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = (void *)objc_msgSend(v20, "initWithStartDate:endDate:", v21, v22);

            }
            else
            {
              +[PGLogging sharedLogging](PGLogging, "sharedLogging");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "loggingConnection");
              v21 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v12, "universalStartDate");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "universalEndDate");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v37;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v38;
                _os_log_error_impl(&dword_1CA237000, v21, OS_LOG_TYPE_ERROR, "[PGSurveyQuestionFactory] AddressEdge has invalid date. StartDate:%@, EndDate: %@", buf, 0x16u);

              }
              v23 = 0;
            }

            v53 = 0u;
            v54 = 0u;
            v51 = 0u;
            v52 = 0u;
            v25 = v49;
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v52;
              do
              {
                for (j = 0; j != v27; ++j)
                {
                  if (*(_QWORD *)v52 != v28)
                    objc_enumerationMutation(v25);
                  v30 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
                  objc_msgSend(v30, "creationDate");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v23)
                  {
                    if (objc_msgSend(v23, "containsDate:", v31))
                    {
                      *(_QWORD *)buf = 0;
                      *(_QWORD *)&buf[8] = 0;
                      objc_msgSend(v30, "location");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v32, "coordinate");
                      *(_QWORD *)buf = v33;
                      *(_QWORD *)&buf[8] = v34;

                      CLLocationCoordinate2DGetDistanceFrom();
                      if (v35 < 150.0)
                        objc_msgSend(v16, "addObject:", v30);
                    }
                  }

                }
                v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
              }
              while (v27);
            }

            if (objc_msgSend(v16, "count"))
            {
              objc_msgSend(v16, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v16, "count")));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "addObject:", v36);

            }
          }
          v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
        }
        while (v50);
      }

      v9 = v47;
      v39 = v47;

      v7 = v44;
      v6 = v45;
      v10 = v43;
    }
    else
    {
      v41 = v9;
    }

  }
  else
  {
    v40 = v8;
  }

  return v9;
}

- (void)setExistingQuestionsByEntityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_existingQuestionsByEntityIdentifier, a3);
}

- (PGManagerWorkingContext)workingContext
{
  return (PGManagerWorkingContext *)objc_getProperty(self, a2, 24, 1);
}

- (signed)questionVersion
{
  return self->_questionVersion;
}

- (BOOL)ignoreExistingQuestions
{
  return self->_ignoreExistingQuestions;
}

- (void)setIgnoreExistingQuestions:(BOOL)a3
{
  self->_ignoreExistingQuestions = a3;
}

- (CLSCurationSession)curationSession
{
  return self->_curationSession;
}

- (void)setCurationSession:(id)a3
{
  objc_storeStrong((id *)&self->_curationSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curationSession, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
  objc_storeStrong((id *)&self->_existingQuestionsByEntityIdentifier, 0);
}

@end
