@implementation PGFrequentLocationQuestionFactory

- (unsigned)questionType
{
  return 8;
}

- (int64_t)questionOptions
{
  return 128;
}

- (PHFetchResult)existingFrequentLocationQuestions
{
  PHFetchResult *existingFrequentLocationQuestions;
  PHFetchResult *v4;
  PHFetchResult *v5;

  existingFrequentLocationQuestions = self->_existingFrequentLocationQuestions;
  if (!existingFrequentLocationQuestions)
  {
    -[PGSurveyQuestionFactory fetchExistingQuestions](self, "fetchExistingQuestions");
    v4 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    v5 = self->_existingFrequentLocationQuestions;
    self->_existingFrequentLocationQuestions = v4;

    existingFrequentLocationQuestions = self->_existingFrequentLocationQuestions;
  }
  return existingFrequentLocationQuestions;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  PGFrequentLocationQuestionFactory *v18;
  id v19;
  unint64_t v20;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __78__PGFrequentLocationQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke;
  v16 = &unk_1E84350A0;
  v19 = v6;
  v20 = a3;
  v17 = v7;
  v18 = self;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performSynchronousConcurrentGraphReadUsingBlock:", &v13);

  objc_msgSend(v9, "allObjects", v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)_addIfNeededFrequentLocationQuestionForAsset:(id)a3 withLocationTypeName:(id)a4 toQuestions:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  double v26;
  CLLocationDegrees v27;
  void *v28;
  void *v29;
  double v30;
  CLLocationDegrees v31;
  CLLocationCoordinate2D v32;
  PGFrequentLocationQuestion *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  double v46;
  CLLocationDegrees v47;
  void *v48;
  void *v49;
  double v50;
  CLLocationDegrees v51;
  CLLocationCoordinate2D v52;
  PGFrequentLocationQuestion *v53;
  void *v54;
  void *v55;
  void *v56;
  PGFrequentLocationQuestion *v57;
  PGFrequentLocationQuestion *v58;
  BOOL v59;
  void *v61;
  void *v62;
  uint64_t v63;
  PGFrequentLocationQuestion *obj;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v66 = a4;
  v8 = a5;
  v62 = v7;
  objc_msgSend(v7, "location");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "coordinate");
  v10 = v9;
  v12 = v11;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = (PGFrequentLocationQuestion *)v8;
  v13 = -[PGFrequentLocationQuestion countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v72;
    v16 = *MEMORY[0x1E0D78040];
    v17 = *MEMORY[0x1E0D78028];
    v18 = *MEMORY[0x1E0D78030];
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v72 != v15)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
        objc_msgSend(v20, "additionalInfo");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", v16);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", v66);

        if (v23)
        {
          objc_msgSend(v20, "additionalInfo");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v17);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "doubleValue");
          v27 = v26;

          objc_msgSend(v20, "additionalInfo");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", v18);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "doubleValue");
          v31 = v30;

          v32 = CLLocationCoordinate2DMake(v27, v31);
          if (-[PGFrequentLocationQuestionFactory _distanceTooCloseBetweenCoordinate:otherCoordinate:](self, "_distanceTooCloseBetweenCoordinate:otherCoordinate:", v10, v12, v32.latitude, v32.longitude))
          {
            v59 = 0;
            v58 = obj;
            v33 = obj;
            v56 = v61;
            v54 = v62;
            goto LABEL_23;
          }
        }
      }
      v14 = -[PGFrequentLocationQuestion countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
      if (v14)
        continue;
      break;
    }
  }

  -[PGFrequentLocationQuestionFactory existingFrequentLocationQuestions](self, "existingFrequentLocationQuestions");
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v33 = (PGFrequentLocationQuestion *)(id)objc_claimAutoreleasedReturnValue();
  v34 = -[PGFrequentLocationQuestion countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v68;
    v37 = *MEMORY[0x1E0D78040];
    v63 = *MEMORY[0x1E0D78028];
    v38 = *MEMORY[0x1E0D78030];
    while (2)
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v68 != v36)
          objc_enumerationMutation(v33);
        v40 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
        objc_msgSend(v40, "additionalInfo");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", v37);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "isEqualToString:", v66);

        if (v43)
        {
          objc_msgSend(v40, "additionalInfo");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "objectForKeyedSubscript:", v63);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "doubleValue");
          v47 = v46;

          objc_msgSend(v40, "additionalInfo");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectForKeyedSubscript:", v38);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "doubleValue");
          v51 = v50;

          v52 = CLLocationCoordinate2DMake(v47, v51);
          if (-[PGFrequentLocationQuestionFactory _distanceTooCloseBetweenCoordinate:otherCoordinate:](self, "_distanceTooCloseBetweenCoordinate:otherCoordinate:", v10, v12, v52.latitude, v52.longitude))
          {
            v59 = 0;
            v57 = v33;
            v56 = v61;
            v54 = v62;
            v58 = obj;
            goto LABEL_22;
          }
        }
      }
      v35 = -[PGFrequentLocationQuestion countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
      if (v35)
        continue;
      break;
    }
  }

  v53 = [PGFrequentLocationQuestion alloc];
  v54 = v62;
  objc_msgSend(v62, "uuid");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v61;
  v57 = -[PGFrequentLocationQuestion initWithAssetUUID:location:locationTypeName:](v53, "initWithAssetUUID:location:locationTypeName:", v55, v61, v66);

  v58 = obj;
  -[PGFrequentLocationQuestion addObject:](obj, "addObject:", v57);
  v59 = 1;
LABEL_22:

LABEL_23:
  return v59;
}

- (BOOL)_distanceTooCloseBetweenCoordinate:(CLLocationCoordinate2D)a3 otherCoordinate:(CLLocationCoordinate2D)a4
{
  double v4;

  CLLocationCoordinate2DGetDistanceFrom();
  return v4 < *MEMORY[0x1E0D72F30];
}

- (id)_selectedAssetFromMomentNodes:(id)a3 closeToCoordinate:(CLLocationCoordinate2D)a4
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD *v21;
  uint64_t *v22;
  CLLocationDegrees v23;
  CLLocationDegrees v24;
  _QWORD v25[4];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[2];

  longitude = a4.longitude;
  latitude = a4.latitude;
  v32[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "librarySpecificFetchOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("locationData != nil"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInternalPredicate:", v11);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSortDescriptors:", v13);

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__47624;
  v30 = __Block_byref_object_dispose__47625;
  v31 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0x7FEFFFFFFFFFFFFFLL;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __85__PGFrequentLocationQuestionFactory__selectedAssetFromMomentNodes_closeToCoordinate___block_invoke;
  v18[3] = &unk_1E842F808;
  v14 = v9;
  v19 = v14;
  v15 = v10;
  v23 = latitude;
  v24 = longitude;
  v20 = v15;
  v21 = v25;
  v22 = &v26;
  objc_msgSend(v7, "enumerateNodesUsingBlock:", v18);
  v16 = (id)v27[5];

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v26, 8);

  return v16;
}

- (void)setExistingFrequentLocationQuestions:(id)a3
{
  objc_storeStrong((id *)&self->_existingFrequentLocationQuestions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingFrequentLocationQuestions, 0);
}

void __85__PGFrequentLocationQuestionFactory__selectedAssetFromMomentNodes_closeToCoordinate___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1CAA4EB2C]();
  v5 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(v3, "fetchAssetCollectionInPhotoLibrary:", a1[4]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchAssetsInAssetCollection:options:", v6, a1[5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "locationCoordinate", 0, 0, (_QWORD)v20);
        v18 = v14;
        v19 = v15;
        CLLocationCoordinate2DGetDistanceFrom();
        v17 = v16;
        if (v16 < *(double *)(*(_QWORD *)(a1[6] + 8) + 24))
        {
          objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v13);
          *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = v17;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16, v18, v19);
    }
    while (v10);
  }

  objc_autoreleasePoolPop(v4);
}

void __78__PGFrequentLocationQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(void *, _BYTE *, double);
  double Current;
  char v6;
  NSObject *v7;
  double v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void (**v14)(void *, _BYTE *, double);
  NSObject *v15;
  double v16;
  char v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  double *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void (**)(void *, _BYTE *, double))_Block_copy(*(const void **)(a1 + 48));
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v27 = 0;
  v28 = (double *)&v27;
  v29 = 0x2020000000;
  v30 = 0;
  if (!v4)
  {
    if (!*(_QWORD *)(a1 + 56))
      goto LABEL_23;
    goto LABEL_13;
  }
  Current = CFAbsoluteTimeGetCurrent();
  if (Current - v28[3] >= 0.01)
  {
    v28[3] = Current;
    v26 = 0;
    v4[2](v4, &v26, 0.0);
    v6 = *((_BYTE *)v32 + 24) | v26;
    *((_BYTE *)v32 + 24) = v6;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v36 = 60;
        v37 = 2080;
        v38 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/FrequentLocation/PGFrequentLocationQuestionFactory.m";
        v7 = MEMORY[0x1E0C81028];
LABEL_11:
        _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_23;
      }
      goto LABEL_23;
    }
  }
  if (*(_QWORD *)(a1 + 56))
  {
LABEL_13:
    objc_msgSend(v3, "graph");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphNodeCollection nodesInGraph:](PGGraphFrequentLocationNodeCollection, "nodesInGraph:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __78__PGFrequentLocationQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_153;
    v18[3] = &unk_1E842F7E0;
    v12 = *(id *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 56);
    v19 = v12;
    v24 = v13;
    v14 = v4;
    v25 = 0x3F847AE147AE147BLL;
    v22 = &v27;
    v23 = &v31;
    v20 = *(_QWORD *)(a1 + 40);
    v21 = v14;
    objc_msgSend(v11, "enumerateIdentifiersAsCollectionsWithBlock:", v18);
    if (*((_BYTE *)v32 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_22:

        goto LABEL_23;
      }
      *(_DWORD *)buf = 67109378;
      v36 = 93;
      v37 = 2080;
      v38 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/FrequentLocation/PGFrequentLocationQuestionFactory.m";
      v15 = MEMORY[0x1E0C81028];
    }
    else
    {
      if (!v4)
        goto LABEL_22;
      v16 = CFAbsoluteTimeGetCurrent();
      if (v16 - v28[3] < 0.01)
        goto LABEL_22;
      v28[3] = v16;
      v26 = 0;
      v14[2](v14, &v26, 1.0);
      v17 = *((_BYTE *)v32 + 24) | v26;
      *((_BYTE *)v32 + 24) = v17;
      if (!v17 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_22;
      *(_DWORD *)buf = 67109378;
      v36 = 95;
      v37 = 2080;
      v38 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Questions/"
            "Survey/FrequentLocation/PGFrequentLocationQuestionFactory.m";
      v15 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_22;
  }
  v8 = CFAbsoluteTimeGetCurrent();
  if (v8 - v28[3] >= 0.01)
  {
    v28[3] = v8;
    v26 = 0;
    v4[2](v4, &v26, 1.0);
    v9 = *((_BYTE *)v32 + 24) | v26;
    *((_BYTE *)v32 + 24) = v9;
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v36 = 64;
        v37 = 2080;
        v38 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Question"
              "s/Survey/FrequentLocation/PGFrequentLocationQuestionFactory.m";
        v7 = MEMORY[0x1E0C81028];
        goto LABEL_11;
      }
    }
  }
LABEL_23:
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

}

void __78__PGFrequentLocationQuestionFactory_generateQuestionsWithLimit_progressBlock___block_invoke_153(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  double Current;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (*(_QWORD *)(a1 + 48)
    && (v8 = v7,
        v9 = *(_QWORD *)(a1 + 72),
        Current = CFAbsoluteTimeGetCurrent(),
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8),
        Current - *(double *)(v11 + 24) >= *(double *)(a1 + 80))
    && (*(double *)(v11 + 24) = Current,
        (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))((double)v8 / (double)v9),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                               + 24)) != 0))
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v6, "addressNodes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 40);
    objc_msgSend(v12, "momentNodes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "anyNode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "coordinate");
    objc_msgSend(v13, "_selectedAssetFromMomentNodes:closeToCoordinate:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16
      || (objc_msgSend(v16, "location"), v17 = (void *)objc_claimAutoreleasedReturnValue(), v17, !v17)
      || objc_msgSend(*(id *)(a1 + 40), "_addIfNeededFrequentLocationQuestionForAsset:withLocationTypeName:toQuestions:", v16, CFSTR("FrequentLocation"), *(_QWORD *)(a1 + 32))&& (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= *(_QWORD *)(a1 + 72))
    {
      *a4 = 1;
    }

  }
}

@end
