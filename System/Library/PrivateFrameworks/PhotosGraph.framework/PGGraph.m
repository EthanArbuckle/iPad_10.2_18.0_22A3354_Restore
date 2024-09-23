@implementation PGGraph

- (BOOL)_enumerateMomentNodesForAssetCollection:(id)a3 paddingTime:(double)a4 error:(id *)a5 enumerationBlock:(id)a6
{
  BOOL v6;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  double v28;
  uint64_t v29;

  v11 = a3;
  v12 = a6;
  objc_msgSend(v11, "cls_localStartDateComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[PGGraph _momentNodesForDateComponents:error:](self, "_momentNodesForDateComponents:error:", v13, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14 && objc_msgSend(v14, "count"))
    {
      objc_msgSend(v11, "cls_universalStartDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSince1970");
      v18 = v17;

      objc_msgSend(v11, "cls_universalEndDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSince1970");
      v21 = v20;

      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __94__PGGraph_Lookup___enumerateMomentNodesForAssetCollection_paddingTime_error_enumerationBlock___block_invoke;
      v25[3] = &unk_1E8429190;
      v27 = v18;
      v28 = a4;
      v29 = v21;
      v26 = v12;
      objc_msgSend(v15, "enumerateNodesUsingBlock:", v25);

      v22 = 1;
    }
    else
    {
      v22 = 0;
      v6 = v15 != 0;
    }

    v23 = v22 | v6;
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDescription:", CFSTR("Couldn't get asset collection's dates"));
    v23 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }

  return v23 & 1;
}

- (void)_enumerateMomentForMomentNode:(id)a3 inPhotoLibrary:(id)a4 paddingTime:(double)a5 enumerationBlock:(id)a6
{
  id v9;
  void *v10;
  id v11;
  id v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = (void *)MEMORY[0x1E0C99D68];
  v11 = a4;
  v12 = a3;
  objc_msgSend(v12, "timestampUTCStart");
  objc_msgSend(v10, "dateWithTimeIntervalSince1970:", v13 - a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v12, "timestampUTCEnd");
  v17 = v16;

  objc_msgSend(v15, "dateWithTimeIntervalSince1970:", v17 + a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(startDate >= %@) AND (endDate <= %@)"), v14, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "librarySpecificFetchOptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSortDescriptors:", v22);

  objc_msgSend(v20, "setPredicate:", v19);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchMomentsWithOptions:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __93__PGGraph_Lookup___enumerateMomentForMomentNode_inPhotoLibrary_paddingTime_enumerationBlock___block_invoke;
  v25[3] = &unk_1E84291B8;
  v26 = v9;
  v24 = v9;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v25);

}

- (id)_momentNodesForDateComponents:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (void *)MEMORY[0x1E0D4B130];
  v7 = a3;
  objc_msgSend(v7, "timeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:inTimeZone:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraph dateNodeForLocalDate:](self, "dateNodeForLocalDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "collection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "momentNodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!a4)
    {
      v13 = 0;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s - Cannot find node with date: %@"), "-[PGGraph(Lookup) _momentNodesForDateComponents:error:]", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGError errorWithCode:description:](PGError, "errorWithCode:description:", -3, v12);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  return v13;
}

- (id)_strictMomentNodeLookupForAssetCollection:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v6 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__11978;
  v14 = __Block_byref_object_dispose__11979;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__PGGraph_Lookup___strictMomentNodeLookupForAssetCollection_error___block_invoke;
  v9[3] = &unk_1E842FA68;
  v9[4] = &v10;
  -[PGGraph _enumerateMomentNodesForAssetCollection:paddingTime:error:enumerationBlock:](self, "_enumerateMomentNodesForAssetCollection:paddingTime:error:enumerationBlock:", v6, a4, v9, 0.001);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)_fuzzyMomentNodeLookupForAssetCollection:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  PGGraph *v19;
  id v20;
  id v21;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __66__PGGraph_Lookup___fuzzyMomentNodeLookupForAssetCollection_error___block_invoke;
  v17 = &unk_1E842D8B0;
  v9 = v6;
  v18 = v9;
  v19 = self;
  v10 = v8;
  v20 = v10;
  v11 = v7;
  v21 = v11;
  -[PGGraph _enumerateMomentNodesForAssetCollection:paddingTime:error:enumerationBlock:](self, "_enumerateMomentNodesForAssetCollection:paddingTime:error:enumerationBlock:", v9, a4, &v14, 10800.0);
  if (objc_msgSend(v11, "count", v14, v15, v16, v17) == 1)
  {
    objc_msgSend(v11, "anyObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    +[PGError errorWithCode:description:](PGError, "errorWithCode:description:", -3, CFSTR("Fuzzy event find multiple events"));
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)eventNodeForAssetCollection:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "assetCollectionType");
  if (v5 > 0xB)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  if (((1 << v5) & 0xFB7) != 0)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "Requesting event node for unsupported asset collection type: %@", (uint8_t *)&v10, 0xCu);
    }

    goto LABEL_6;
  }
  if (v5 == 3)
    -[PGGraph momentNodeForMoment:](self, "momentNodeForMoment:", v4);
  else
    -[PGGraph highlightNodeForHighlight:](self, "highlightNodeForHighlight:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (id)momentNodeForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGGraph _checkCanRead](self, "_checkCanRead");
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAsset:withType:options:", v4, 3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraph momentNodeForMoment:](self, "momentNodeForMoment:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_error_impl(&dword_1CA237000, v9, OS_LOG_TYPE_ERROR, "Multiple moment for asset %@", (uint8_t *)&v11, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (id)highlightNodeForHighlight:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphHighlightNodeCollection highlightNodeForUUID:inGraph:](PGGraphHighlightNodeCollection, "highlightNodeForUUID:inGraph:", v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)momentNodeForMoment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGGraph _checkCanRead](self, "_checkCanRead");
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMomentNodeCollection momentNodeForUUID:inGraph:](PGGraphMomentNodeCollection, "momentNodeForUUID:inGraph:", v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v13 = 0;
    -[PGGraph _momentNodeForAssetCollection:error:](self, "_momentNodeForAssetCollection:error:", v4, &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    if (!v7)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "loggingConnection");
      v10 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v15 = "-[PGGraph(Lookup) momentNodeForMoment:]";
        v16 = 2112;
        v17 = v12;
        v18 = 2112;
        v19 = v8;
        _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "%s - Can't get node for moment (%@), error:%@", buf, 0x20u);

      }
      v7 = 0;
    }
  }

  return v7;
}

- (id)_strictMomentLookupForMomentNode:(id)a3 inPhotoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11978;
  v16 = __Block_byref_object_dispose__11979;
  v17 = 0;
  v8 = (void *)MEMORY[0x1CAA4EB2C]();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__PGGraph_Lookup___strictMomentLookupForMomentNode_inPhotoLibrary___block_invoke;
  v11[3] = &unk_1E84291E0;
  v11[4] = &v12;
  -[PGGraph _enumerateMomentForMomentNode:inPhotoLibrary:paddingTime:enumerationBlock:](self, "_enumerateMomentForMomentNode:inPhotoLibrary:paddingTime:enumerationBlock:", v6, v7, v11, 0.001);
  objc_autoreleasePoolPop(v8);
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (id)_fuzzyMomentLookupForMomentNode:(id)a3 inPhotoLibrary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  PGGraph *v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1CAA4EB2C]();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __72__PGGraph_Lookup___fuzzyMomentLookupForMomentNode_inPhotoLibrary_error___block_invoke;
  v19 = &unk_1E8429208;
  v20 = self;
  v12 = v8;
  v21 = v12;
  v13 = v10;
  v22 = v13;
  -[PGGraph _enumerateMomentForMomentNode:inPhotoLibrary:paddingTime:enumerationBlock:](self, "_enumerateMomentForMomentNode:inPhotoLibrary:paddingTime:enumerationBlock:", v12, v9, &v16, 10800.0);

  objc_autoreleasePoolPop(v11);
  if (objc_msgSend(v13, "count") == 1)
  {
    objc_msgSend(v13, "anyObject");
    a5 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a5)
  {
    if (objc_msgSend(v13, "count"))
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Event node %@ matching multiple moments"), v12, v16, v17, v18, v19, v20);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Event node %@ matching 0 moment"), v12, v16, v17, v18, v19, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGError errorWithCode:description:](PGError, "errorWithCode:description:", -3, v14);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }

  return a5;
}

- (id)highlightForHighlightNode:(id)a3 inPhotoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[PGGraph _checkCanRead](self, "_checkCanRead");
  objc_msgSend(v7, "localIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "librarySpecificFetchOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("localIdentifier == %@"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicate:", v10);

    objc_msgSend(v9, "setFetchLimit:", 1);
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 0x7FFFFFFFFFFFFFFFLL, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count") != 1)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "loggingConnection");
      v14 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315651;
        v17 = "-[PGGraph(Lookup) highlightForHighlightNode:inPhotoLibrary:]";
        v18 = 2112;
        v19 = v8;
        v20 = 2113;
        v21 = v11;
        _os_log_error_impl(&dword_1CA237000, v14, OS_LOG_TYPE_ERROR, "error: %s Didn't find highlight with identifier %@. %{private}@", buf, 0x20u);
      }

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)momentForMomentNode:(id)a3 inPhotoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PGGraph _checkCanRead](self, "_checkCanRead");
  objc_msgSend(v6, "localIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_3;
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFetchLimit:", 1);
  v10 = (void *)MEMORY[0x1E0CD13B8];
  v24[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchAssetCollectionsWithLocalIdentifiers:options:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_3:
    -[PGGraph _strictMomentLookupForMomentNode:inPhotoLibrary:](self, "_strictMomentLookupForMomentNode:inPhotoLibrary:", v6, v7);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v13 = (void *)v14;
      v15 = 0;
    }
    else
    {
      v19 = 0;
      -[PGGraph _fuzzyMomentLookupForMomentNode:inPhotoLibrary:error:](self, "_fuzzyMomentLookupForMomentNode:inPhotoLibrary:error:", v6, v7, &v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v19;
      if (!v13)
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "loggingConnection");
        v17 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v21 = "-[PGGraph(Lookup) momentForMomentNode:inPhotoLibrary:]";
          v22 = 2112;
          v23 = v15;
          _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "error: %s %@", buf, 0x16u);
        }

        v13 = 0;
      }
    }

  }
  return v13;
}

- (id)momentsForMomentNodes:(id)a3 inPhotoLibrary:(id)a4 sortChronologically:(BOOL)a5
{
  void *v5;
  void *v6;

  -[PGGraph momentsResultForMomentNodes:inPhotoLibrary:sortChronologically:](self, "momentsResultForMomentNodes:inPhotoLibrary:sortChronologically:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchedObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)momentsResultForMomentNodes:(id)a3 inPhotoLibrary:(id)a4 sortChronologically:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[2];

  v5 = a5;
  v25[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(a4, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSortDescriptors:", v10);

  }
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v16), "localIdentifier", (_QWORD)v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithLocalIdentifiers:options:", v11, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)dateNodesForLocalDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  NSObject *v13;
  int v15;
  void *v16;
  __int16 v17;
  unint64_t v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGGraph _checkCanRead](self, "_checkCanRead");
  -[PGGraph dateNodeNameWithLocalDate:](self, "dateNodeNameWithLocalDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0D42A50]);
  v19 = CFSTR("name");
  v20[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithLabel:domain:properties:", CFSTR("Date"), 400, v7);

  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphDateNodeCollection, "nodesMatchingFilter:inGraph:", v8, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (v10 >= 2)
  {
    v11 = v10;
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingConnection");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412546;
      v16 = v5;
      v17 = 2048;
      v18 = v11;
      _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "Error: too many date nodes for local date %@, count: %lu", (uint8_t *)&v15, 0x16u);
    }

  }
  return v9;
}

- (id)dateNodeForLocalDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PGGraph _checkCanRead](self, "_checkCanRead");
  -[PGGraph dateNodesForLocalDate:](self, "dateNodesForLocalDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "anyNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dateNodeFilterForLocalDateInterval:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;

  objc_msgSend(v4, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSince1970");
  v11 = v10;

  while (v8 <= v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraph dateNodeNameWithLocalDate:](self, "dateNodeNameWithLocalDate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v13);

    v8 = v8 + 86400.0;
  }
  v14 = objc_alloc(MEMORY[0x1E0D42A50]);
  v18 = CFSTR("name");
  v19[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithLabel:domain:properties:", CFSTR("Date"), 400, v15);

  return v16;
}

- (id)dateNodesForLocalDateInterval:(id)a3
{
  void *v4;
  void *v5;

  -[PGGraph dateNodeFilterForLocalDateInterval:](self, "dateNodeFilterForLocalDateInterval:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphDateNodeCollection, "nodesMatchingFilter:inGraph:", v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dateNodesIgnoringYearForLocalDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PGGraph _checkCanRead](self, "_checkCanRead");
  +[PGGraphMonthDayNodeCollection monthDayNodesForLocalDate:inGraph:](PGGraphMonthDayNodeCollection, "monthDayNodesForLocalDate:inGraph:", v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dateNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dateNodesForMonth:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphMonthNodeCollection monthNodesForMonth:inGraph:](PGGraphMonthNodeCollection, "monthNodesForMonth:inGraph:", a3, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "temporarySet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dateNodesForYear:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[PGGraph _checkCanRead](self, "_checkCanRead");
  +[PGGraphYearNodeCollection yearNodesForYear:inGraph:](PGGraphYearNodeCollection, "yearNodesForYear:inGraph:", a3, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "temporarySet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dateNodesForWeekOfYear:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[PGGraph _checkCanRead](self, "_checkCanRead");
  +[PGGraphWeekOfYearNodeCollection weekOfYearNodesForWeekOfYear:inGraph:](PGGraphWeekOfYearNodeCollection, "weekOfYearNodesForWeekOfYear:inGraph:", a3, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "temporarySet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dateNodesForWeekOfMonth:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[PGGraph _checkCanRead](self, "_checkCanRead");
  +[PGGraphWeekOfMonthNodeCollection weekOfMonthNodesForWeekOfMonth:inGraph:](PGGraphWeekOfMonthNodeCollection, "weekOfMonthNodesForWeekOfMonth:inGraph:", a3, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "temporarySet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)seasonNodeForLocalDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGGraph _checkCanRead](self, "_checkCanRead");
  -[PGGraph infoNode](self, "infoNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D4B130], "seasonNameForLocalDate:locale:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v12 = CFSTR("name");
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAGraph nodesForLabel:domain:properties:](self, "nodesForLabel:domain:properties:", CFSTR("Season"), 400, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)previousSeasonNodeForSeasonNode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraph _previousSeasonForSeason:](self, "_previousSeasonForSeason:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v10 = CFSTR("name");
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAGraph nodesForLabel:domain:properties:](self, "nodesForLabel:domain:properties:", CFSTR("Season"), 400, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_previousSeasonForSeason:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (_previousSeasonForSeason__onceToken != -1)
    dispatch_once(&_previousSeasonForSeason__onceToken, &__block_literal_global_11981);
  v4 = objc_msgSend((id)_previousSeasonForSeason__seasons, "indexOfObject:", v3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_8;
  if (v4)
    objc_msgSend((id)_previousSeasonForSeason__seasons, "objectAtIndex:", v4 - 1);
  else
    objc_msgSend((id)_previousSeasonForSeason__seasons, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_8:
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_error_impl(&dword_1CA237000, v7, OS_LOG_TYPE_ERROR, "Error: could not find _previousSeasonForSeason: string %@", (uint8_t *)&v9, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

- (id)dayNodeForDay:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("name");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAGraph anyNodeForLabel:domain:properties:](self, "anyNodeForLabel:domain:properties:", CFSTR("Day"), 400, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)monthNodeForMonth:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("name");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAGraph anyNodeForLabel:domain:properties:](self, "anyNodeForLabel:domain:properties:", CFSTR("Month"), 400, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)yearNodeForYear:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("name");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAGraph anyNodeForLabel:domain:properties:](self, "anyNodeForLabel:domain:properties:", CFSTR("Year"), 400, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)closestMomentNodeForLocalDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  _QWORD *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  _QWORD *v19;
  _QWORD v20[4];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  -[PGGraph _checkCanRead](self, "_checkCanRead");
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__11978;
  v25 = __Block_byref_object_dispose__11979;
  v26 = 0;
  -[PGGraph dateNodeForLocalDate:](self, "dateNodeForLocalDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "momentNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0x7FEFFFFFFFFFFFFFLL;
  if (objc_msgSend(v7, "count"))
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __49__PGGraph_Lookup__closestMomentNodeForLocalDate___block_invoke;
    v16[3] = &unk_1E842F998;
    v17 = v4;
    v18 = &v21;
    v19 = v20;
    objc_msgSend(v7, "enumerateNodesUsingBlock:", v16);
    v8 = v17;
  }
  else
  {
    -[PGGraph momentNodes](self, "momentNodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__PGGraph_Lookup__closestMomentNodeForLocalDate___block_invoke_2;
    v12[3] = &unk_1E842F998;
    v13 = v4;
    v14 = &v21;
    v15 = v20;
    objc_msgSend(v9, "enumerateNodesUsingBlock:", v12);

    v8 = v13;
  }

  _Block_object_dispose(v20, 8);
  v10 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v10;
}

- (id)localDatesForMomentNode:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[PGGraph _checkCanRead](self, "_checkCanRead");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__PGGraph_Lookup__localDatesForMomentNode___block_invoke;
  v8[3] = &unk_1E8432070;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateDateNodesUsingBlock:", v8);

  return v6;
}

- (id)_momentNodeForAssetCollection:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PGGraph _strictMomentNodeLookupForAssetCollection:error:](self, "_strictMomentNodeLookupForAssetCollection:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[PGGraph _fuzzyMomentNodeLookupForAssetCollection:error:](self, "_fuzzyMomentNodeLookupForAssetCollection:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)momentNodesOverlappingLocalDateInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PGGraph _checkCanRead](self, "_checkCanRead");
  +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:inGraph:](PGGraphMomentNodeCollection, "momentNodesForLocalDateInterval:inGraph:", v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dayOfWeekNodeForDayOfWeek:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphDayOfWeekNode nameForDayOfWeek:](PGGraphDayOfWeekNode, "nameForDayOfWeek:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("name");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAGraph anyNodeForLabel:domain:properties:](self, "anyNodeForLabel:domain:properties:", CFSTR("DayOfWeek"), 400, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)libraryAge
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0x7FFFFFFFLL;
  -[PGGraph allTimeYearsNodes](self, "allTimeYearsNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__PGGraph_Lookup__libraryAge__block_invoke;
  v8[3] = &unk_1E8429250;
  v8[4] = &v9;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v8);
  v3 = (void *)MEMORY[0x1E0D4B130];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "yearFromDate:", v4);

  if (v5 - v10[3] <= 1)
    v6 = 1;
  else
    v6 = v5 - v10[3];

  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __29__PGGraph_Lookup__libraryAge__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(a2, "calendarUnitValue");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(_QWORD *)(v4 + 24);
  if (result < v5)
    v5 = result;
  *(_QWORD *)(v4 + 24) = v5;
  return result;
}

void __43__PGGraph_Lookup__localDatesForMomentNode___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "localDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __49__PGGraph_Lookup__closestMomentNodeForLocalDate___block_invoke(_QWORD *a1, void *a2)
{
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "localStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", a1[4]);
  v6 = fabs(v5);

  v7 = *(_QWORD *)(a1[5] + 8);
  v9 = *(_QWORD *)(v7 + 40);
  v8 = (id *)(v7 + 40);
  if (!v9 || v6 < *(double *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    objc_storeStrong(v8, a2);
    *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = v6;
  }

}

void __49__PGGraph_Lookup__closestMomentNodeForLocalDate___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "localStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", a1[4]);
  v6 = fabs(v5);

  v7 = *(_QWORD *)(a1[5] + 8);
  v9 = *(_QWORD *)(v7 + 40);
  v8 = (id *)(v7 + 40);
  if (!v9 || v6 < *(double *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    objc_storeStrong(v8, a2);
    *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = v6;
  }

}

void __44__PGGraph_Lookup___previousSeasonForSeason___block_invoke()
{
  void *v0;

  v0 = (void *)_previousSeasonForSeason__seasons;
  _previousSeasonForSeason__seasons = (uint64_t)&unk_1E84E9748;

}

void __72__PGGraph_Lookup___fuzzyMomentLookupForMomentNode_inPhotoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_strictMomentNodeLookupForAssetCollection:error:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || objc_msgSend(v3, "isSameNodeAsNode:", *(_QWORD *)(a1 + 40)))
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);

}

void __67__PGGraph_Lookup___strictMomentLookupForMomentNode_inPhotoLibrary___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

void __66__PGGraph_Lookup___fuzzyMomentNodeLookupForAssetCollection_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)MEMORY[0x1CAA4EB2C]();
  if (objc_msgSend(*(id *)(a1 + 32), "assetCollectionType") == 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_strictMomentLookupForMomentNode:inPhotoLibrary:", v5, *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4 || objc_msgSend(*(id *)(a1 + 32), "isEqual:", v4))
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);
  }
  objc_autoreleasePoolPop(v3);

}

void __67__PGGraph_Lookup___strictMomentNodeLookupForAssetCollection_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

uint64_t __93__PGGraph_Lookup___enumerateMomentForMomentNode_inPhotoLibrary_paddingTime_enumerationBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __94__PGGraph_Lookup___enumerateMomentNodesForAssetCollection_paddingTime_error_enumerationBlock___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "timestampUTCStart");
  v4 = v3;
  objc_msgSend(v15, "timestampUTCEnd");
  v7 = *(double *)(a1 + 40);
  v6 = *(double *)(a1 + 48);
  v8 = v7 - v6;
  v9 = v7 + v6;
  if (v4 >= v8 && v4 <= v9)
  {
    v11 = *(double *)(a1 + 56);
    v12 = v11 - v6;
    v13 = v6 + v11;
    if (v5 >= v12 && v5 <= v13)
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (id)meNode
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[MAGraph nodesForLabel:domain:](self, "nodesForLabel:domain:", CFSTR("Me"), 300);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "count") >= 2)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "loggingConnection");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v2;
      _os_log_error_impl(&dword_1CA237000, v4, OS_LOG_TYPE_ERROR, "Graph has multiple meNodes: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  objc_msgSend(v2, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)meNodeCollection
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "count") >= 2)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "loggingConnection");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "set");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_error_impl(&dword_1CA237000, v4, OS_LOG_TYPE_ERROR, "Graph has multiple meNodes: %@", (uint8_t *)&v7, 0xCu);

    }
  }
  return v2;
}

- (id)familyMembers
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  -[PGGraph meNode](self, "meNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __38__PGGraph_Conveniences__familyMembers__block_invoke;
    v6[3] = &unk_1E8429E18;
    v7 = v3;
    objc_msgSend(v4, "enumeratePersonNodesWithRelationship:matchingQuery:usingBlock:", 4, 3, v6);

  }
  return v3;
}

- (id)partners
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  -[PGGraph meNode](self, "meNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __33__PGGraph_Conveniences__partners__block_invoke;
    v6[3] = &unk_1E8429E18;
    v7 = v3;
    objc_msgSend(v4, "enumeratePersonNodesWithRelationship:matchingQuery:usingBlock:", 13, 3, v6);

  }
  return v3;
}

- (id)parents
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  -[PGGraph meNode](self, "meNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __32__PGGraph_Conveniences__parents__block_invoke;
    v6[3] = &unk_1E8429E18;
    v7 = v3;
    objc_msgSend(v4, "enumeratePersonNodesWithRelationship:matchingQuery:usingBlock:", 8, 3, v6);

  }
  return v3;
}

- (id)children
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  -[PGGraph meNode](self, "meNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __33__PGGraph_Conveniences__children__block_invoke;
    v6[3] = &unk_1E8429E18;
    v7 = v3;
    objc_msgSend(v4, "enumeratePersonNodesWithRelationship:matchingQuery:usingBlock:", 5, 3, v6);

  }
  return v3;
}

- (id)friends
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  -[PGGraph meNode](self, "meNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __32__PGGraph_Conveniences__friends__block_invoke;
    v6[3] = &unk_1E8429E18;
    v7 = v3;
    objc_msgSend(v4, "enumeratePersonNodesWithRelationship:matchingQuery:usingBlock:", 2, 3, v6);

  }
  return v3;
}

- (id)coworkers
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  -[PGGraph meNode](self, "meNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34__PGGraph_Conveniences__coworkers__block_invoke;
    v6[3] = &unk_1E8429E18;
    v7 = v3;
    objc_msgSend(v4, "enumeratePersonNodesWithRelationship:matchingQuery:usingBlock:", 1, 3, v6);

  }
  return v3;
}

- (id)dateNodeNameWithLocalDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PGGraph dateFormatter](self, "dateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)allTimeYearsNodes
{
  -[PGGraph _checkCanRead](self, "_checkCanRead");
  return -[MAGraph nodesForLabel:domain:](self, "nodesForLabel:domain:", CFSTR("Year"), 400);
}

- (id)celebratedHolidayNodes
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  -[PGGraph _checkCanRead](self, "_checkCanRead");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__PGGraph_Conveniences__celebratedHolidayNodes__block_invoke;
  v6[3] = &unk_1E8433B30;
  v4 = v3;
  v7 = v4;
  -[PGGraph enumerateCelebratedHolidayNodesUsingBlock:](self, "enumerateCelebratedHolidayNodesUsingBlock:", v6);

  return v4;
}

- (id)businessNodes
{
  return -[MAGraph nodesForLabel:domain:](self, "nodesForLabel:domain:", CFSTR("Business"), 503);
}

- (double)libraryDuration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[PGGraph momentNodesSortedByDate](self, "momentNodesSortedByDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "universalEndDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "universalStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v6);
  v8 = v7;

  return v8;
}

- (BOOL)isSharedLibraryEnabled
{
  void *v2;
  BOOL v3;

  +[PGGraphPersonNodeCollection personNodesForSharedLibraryParticipantsInGraph:](PGGraphPersonNodeCollection, "personNodesForSharedLibraryParticipantsInGraph:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)bestFittingAreaNodeFromAreaNodes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  _QWORD v8[4];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__16440;
  v13 = __Block_byref_object_dispose__16441;
  v14 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0x7FEFFFFFFFFFFFFFLL;
  +[PGGraphEdgeCollection edgesToNodes:](PGGraphAreaEdgeCollection, "edgesToNodes:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__PGGraph_Conveniences__bestFittingAreaNodeFromAreaNodes___block_invoke;
  v7[3] = &unk_1E8429E40;
  v7[4] = v8;
  v7[5] = &v9;
  objc_msgSend(v4, "enumerateEdgesUsingBlock:", v7);
  v5 = (id)v10[5];

  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (void)enumerateCelebratedHolidayNodesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  -[PGGraph _checkCanRead](self, "_checkCanRead");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__PGGraph_Conveniences__enumerateCelebratedHolidayNodesUsingBlock___block_invoke;
  v6[3] = &unk_1E8429E68;
  v7 = v4;
  v5 = v4;
  -[MAGraph enumerateEdgesWithLabel:domain:usingBlock:](self, "enumerateEdgesWithLabel:domain:usingBlock:", CFSTR("CELEBRATING"), 401, v6);

}

- (void)enumerateAreaNodesUsingBlock:(id)a3
{
  -[MAGraph enumerateNodesWithLabel:domain:usingBlock:](self, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("Area"), 201, a3);
}

- (void)enumerateBusinessNodesUsingBlock:(id)a3
{
  -[MAGraph enumerateNodesWithLabel:domain:usingBlock:](self, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("Business"), 503, a3);
}

- (void)enumeratePublicEventNodesUsingBlock:(id)a3
{
  -[MAGraph enumerateNodesWithLabel:domain:usingBlock:](self, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("PublicEvent"), 900, a3);
}

- (id)dayOfWeekNodes
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__PGGraph_Conveniences__dayOfWeekNodes__block_invoke;
  v6[3] = &unk_1E8429E90;
  v4 = v3;
  v7 = v4;
  -[MAGraph enumerateNodesWithLabel:domain:usingBlock:](self, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("DayOfWeek"), 400, v6);

  return v4;
}

- (id)sceneNodeForSceneName:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "capitalizedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAGraph anyNodeForLabel:domain:](self, "anyNodeForLabel:domain:", v4, 600);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sceneNodesForSceneNames:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "capitalizedString", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v12 = objc_alloc(MEMORY[0x1E0D42A50]);
  v13 = (void *)objc_msgSend(v12, "initWithLabels:domain:properties:", v5, 600, MEMORY[0x1E0C9AA70]);
  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphSceneNodeCollection, "nodesMatchingFilter:inGraph:", v13, self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)largeFrequentLocationNodes
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v36;
  id obj;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  id v51;
  id v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _QWORD v55[4];

  v55[2] = *MEMORY[0x1E0C80C00];
  -[PGGraph supersets](self, "supersets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v3, "count") > 2)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = (void *)MEMORY[0x1E0D4B128];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __51__PGGraph_Conveniences__largeFrequentLocationNodes__block_invoke_2;
    v50[3] = &unk_1E8429F18;
    v36 = v3;
    v51 = v3;
    v7 = v5;
    v52 = v7;
    objc_msgSend(v6, "calculateStandardDeviationForItems:valueBlock:result:", v51, &__block_literal_global_187, v50);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("numberOfMomentNodes"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v8;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedArrayUsingDescriptors:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(v11, "mutableCopy");
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = v11;
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v40)
    {
      v39 = *(_QWORD *)v47;
      v38 = v12;
LABEL_5:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v47 != v39)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v13);
        objc_msgSend(v14, "collection", v36);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "momentNodes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        objc_msgSend(v12, "removeObject:", v14);
        if (!v17)
          break;
        v41 = v13;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        objc_msgSend(v12, "reverseObjectEnumerator");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v43;
          v22 = (double)v17;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v43 != v21)
                objc_enumerationMutation(v18);
              v24 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
              if (objc_msgSend(v7, "containsObject:", v24))
              {
                objc_msgSend(v24, "collection");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "momentNodes");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "count");

                if ((double)v27 / v22 >= 0.2)
                  goto LABEL_21;
                objc_msgSend(v24, "universalDateInterval");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "duration");
                v30 = v29;
                objc_msgSend(v14, "universalDateInterval");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "intersectionWithDateInterval:", v31);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "duration");
                v34 = v33;

                if (v34 / v30 >= 0.5)
                  objc_msgSend(v7, "removeObject:", v24, v34 / v30);

              }
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
          }
          while (v20);
        }
LABEL_21:

        v13 = v41 + 1;
        v12 = v38;
        if (v41 + 1 == v40)
        {
          v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
          if (v40)
            goto LABEL_5;
          break;
        }
      }
    }

    v4 = v7;
    v3 = v36;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)meaningNodes
{
  return +[PGGraphNodeCollection nodesInGraph:](PGGraphMeaningNodeCollection, "nodesInGraph:", self);
}

- (id)poiNodes
{
  return +[PGGraphNodeCollection nodesInGraph:](PGGraphPOINodeCollection, "nodesInGraph:", self);
}

- (id)publicEventNodes
{
  return +[PGGraphNodeCollection nodesInGraph:](PGGraphPublicEventNodeCollection, "nodesInGraph:", self);
}

void __51__PGGraph_Conveniences__largeFrequentLocationNodes__block_invoke_2(uint64_t a1, double a2, double a3)
{
  double v4;
  double v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = ceil(a3 - a2);
  if (v4 >= 1.0)
    v5 = v4;
  else
    v5 = 1.0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "collection", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "momentNodes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (v14 >= (unint64_t)v5)
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

double __51__PGGraph_Conveniences__largeFrequentLocationNodes__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;

  objc_msgSend(a2, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)(unint64_t)objc_msgSend(v3, "count");

  return v4;
}

uint64_t __39__PGGraph_Conveniences__dayOfWeekNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __67__PGGraph_Conveniences__enumerateCelebratedHolidayNodesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "targetNode");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v5, a3);

}

void __58__PGGraph_Conveniences__bestFittingAreaNodeFromAreaNodes___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "relevance");
  v4 = v3;
  if (v3 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(v8, "targetNode");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  }

}

uint64_t __47__PGGraph_Conveniences__celebratedHolidayNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __34__PGGraph_Conveniences__coworkers__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __32__PGGraph_Conveniences__friends__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __33__PGGraph_Conveniences__children__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __32__PGGraph_Conveniences__parents__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __33__PGGraph_Conveniences__partners__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __38__PGGraph_Conveniences__familyMembers__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (id)_graphNodePOILabelByPlaceType
{
  if (_graphNodePOILabelByPlaceType_onceToken != -1)
    dispatch_once(&_graphNodePOILabelByPlaceType_onceToken, &__block_literal_global_16446);
  return (id)_graphNodePOILabelByPlaceType_graphNodePOILabelByPlaceType;
}

+ (id)poiLabelForPOIType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_graphNodePOILabelByPlaceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __54__PGGraph_Conveniences___graphNodePOILabelByPlaceType__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[16];
  _QWORD v19[18];

  v19[16] = *MEMORY[0x1E0C80C00];
  +[PGPhotosGraphProfile poiHospital](PGPhotosGraphProfile, "poiHospital");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v17;
  v19[0] = CFSTR("Hospital");
  +[PGPhotosGraphProfile poiFitness](PGPhotosGraphProfile, "poiFitness");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v16;
  v19[1] = CFSTR("Fitness");
  +[PGPhotosGraphProfile poiHiking](PGPhotosGraphProfile, "poiHiking");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v15;
  v19[2] = CFSTR("Hiking");
  +[PGPhotosGraphProfile poiDiving](PGPhotosGraphProfile, "poiDiving");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  v19[3] = CFSTR("Diving");
  +[PGPhotosGraphProfile poiActivity](PGPhotosGraphProfile, "poiActivity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v13;
  v19[4] = CFSTR("Activity");
  +[PGPhotosGraphProfile poiStadium](PGPhotosGraphProfile, "poiStadium");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v12;
  v19[5] = CFSTR("Stadium");
  +[PGPhotosGraphProfile poiPerformance](PGPhotosGraphProfile, "poiPerformance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v0;
  v19[6] = CFSTR("Performance");
  +[PGPhotosGraphProfile poiPark](PGPhotosGraphProfile, "poiPark");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v18[7] = v1;
  v19[7] = CFSTR("Park");
  +[PGPhotosGraphProfile poiAmusementPark](PGPhotosGraphProfile, "poiAmusementPark");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[8] = v2;
  v19[8] = CFSTR("AmusementPark");
  +[PGPhotosGraphProfile poiEntertainment](PGPhotosGraphProfile, "poiEntertainment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[9] = v3;
  v19[9] = CFSTR("Entertainment");
  +[PGPhotosGraphProfile poiMuseum](PGPhotosGraphProfile, "poiMuseum");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[10] = v4;
  v19[10] = CFSTR("Museum");
  +[PGPhotosGraphProfile poiCulture](PGPhotosGraphProfile, "poiCulture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[11] = v5;
  v19[11] = CFSTR("Culture");
  +[PGPhotosGraphProfile poiTravel](PGPhotosGraphProfile, "poiTravel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[12] = v6;
  v19[12] = CFSTR("Travel");
  +[PGPhotosGraphProfile poiShopping](PGPhotosGraphProfile, "poiShopping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[13] = v7;
  v19[13] = CFSTR("Shopping");
  +[PGPhotosGraphProfile poiNightlife](PGPhotosGraphProfile, "poiNightlife");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[14] = v8;
  v19[14] = CFSTR("Nightlife");
  +[PGPhotosGraphProfile poiRestaurant](PGPhotosGraphProfile, "poiRestaurant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[15] = v9;
  v19[15] = CFSTR("Restaurant");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 16);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_graphNodePOILabelByPlaceType_graphNodePOILabelByPlaceType;
  _graphNodePOILabelByPlaceType_graphNodePOILabelByPlaceType = v10;

}

- (void)setGraphQueue:(id)a3
{
  NSObject *WeakRetained;
  NSObject *obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_graphQueue);
  if (WeakRetained != obj)
  {
    if (WeakRetained)
      dispatch_queue_set_specific(WeakRetained, self, 0, 0);
    objc_storeWeak((id *)&self->_graphQueue, obj);
    if (obj)
      dispatch_queue_set_specific(obj, self, self, 0);
  }

}

- (void)_checkCanRead
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  WeakRetained = objc_loadWeakRetained((id *)&self->_graphQueue);
  if (WeakRetained && !-[PGGraph isOnGraphQueue](self, "isOnGraphQueue"))
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loggingConnection");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1CA237000, v5, OS_LOG_TYPE_ERROR, "Accessing graph on the wrong queue!", v6, 2u);
    }

  }
}

- (BOOL)isOnGraphQueue
{
  return dispatch_get_specific(self) != 0;
}

- (PGGraph)initWithURL:(id)a3 persistenceOptions:(int64_t)a4 error:(id *)a5
{
  id v8;
  PGGraph *v9;
  void *v10;
  uint64_t v11;
  char v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = -[MAGraph initWithPersistentStoreURL:options:error:](self, "initWithPersistentStoreURL:options:error:", v8, a4, a5);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0C999D8];
    v17 = 0;
    v12 = objc_msgSend(v8, "setResourceValue:forKey:error:", v10, v11, &v17);
    v13 = v17;

    if ((v12 & 1) == 0)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "loggingConnection");
      v15 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v19 = v8;
        v20 = 2112;
        v21 = v13;
        _os_log_error_impl(&dword_1CA237000, v15, OS_LOG_TYPE_ERROR, "Error excluding \"%@\" from backup: \"%@\", buf, 0x16u);
      }

    }
  }

  return v9;
}

- (PGGraph)initWithSpecification:(id)a3
{
  PGGraph *v3;
  NSDateFormatter *v4;
  NSDateFormatter *dateFormatter;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PGGraph;
  v3 = -[MAGraph initWithSpecification:](&v8, sel_initWithSpecification_, a3);
  if (v3)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = v3->_dateFormatter;
    v3->_dateFormatter = v4;

    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](v3->_dateFormatter, "setTimeZone:", v6);

    -[NSDateFormatter setDateFormat:](v3->_dateFormatter, "setDateFormat:", CFSTR("MM-dd-yyyy"));
    v3->_supersetLock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (void)enableInTransactionCheck
{
  void *v2;
  id v3;

  -[MAGraph graph](self, "graph");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableInTransactionCheck");

}

- (BOOL)saveToURL:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  void *v7;
  uint8_t v9[8];
  id v10;

  v4 = a3;
  -[PGGraph _checkCanRead](self, "_checkCanRead");
  if (v4)
  {
    v10 = 0;
    v5 = -[MAGraph writeDataToURL:error:](self, "writeDataToURL:error:", v4, &v10);
    v6 = v10;
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loggingConnection");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1CA237000, v6, OS_LOG_TYPE_ERROR, "Url is nil", v9, 2u);
    }
    v5 = 0;
  }

  return v5;
}

- (BOOL)copyToURL:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  uint8_t v10[8];
  id v11;

  v4 = a3;
  -[PGGraph _checkCanRead](self, "_checkCanRead");
  if (v4)
  {
    -[MAGraph databaseURL](self, "databaseURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v6 = +[MAGraph copyPersistentStoreFromURL:toURL:error:](PGGraph, "copyPersistentStoreFromURL:toURL:error:", v5, v4, &v11);
    v7 = v11;

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1CA237000, v7, OS_LOG_TYPE_ERROR, "URL is nil", v10, 2u);
    }
    v6 = 0;
  }

  return v6;
}

- (void)invalidateMemoryCaches
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGGraph;
  -[MAGraph invalidateMemoryCaches](&v3, sel_invalidateMemoryCaches);
  -[PGGraph invalidateProcessingCaches](self, "invalidateProcessingCaches");
}

- (BOOL)isEmpty
{
  return !-[MAGraph version](self, "version") && -[MAGraph nodesCount](self, "nodesCount") == 0;
}

- (PGGraphInfoNode)infoNode
{
  return (PGGraphInfoNode *)-[MAGraph anyNodeForLabel:domain:](self, "anyNodeForLabel:domain:", CFSTR("Info"), 21);
}

- (int64_t)librarySizeRange
{
  void *v3;
  void *v4;
  int64_t v5;

  v3 = (void *)objc_opt_class();
  -[PGGraph infoNode](self, "infoNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "librarySizeRangeForNumberOfAssets:", objc_msgSend(v4, "numberOfAssets"));

  return v5;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (OS_dispatch_queue)graphQueue
{
  return (OS_dispatch_queue *)objc_loadWeakRetained((id *)&self->_graphQueue);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_graphQueue);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_zeroKeywordMappingByMeaningLabel, 0);
  objc_storeStrong((id *)&self->_interestingCityNodes, 0);
  objc_storeStrong((id *)&self->_supersetCountryNodes, 0);
  objc_storeStrong((id *)&self->_supersetStateNodes, 0);
  objc_storeStrong((id *)&self->_supersetCountyNodes, 0);
  objc_storeStrong((id *)&self->_supersetCityNodes, 0);
}

+ (id)assetPropertySetsForIngest
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[15];

  v13[14] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v3 = *MEMORY[0x1E0CD1A50];
  v13[0] = *MEMORY[0x1E0CD1A80];
  v13[1] = v3;
  v4 = *MEMORY[0x1E0CD19F0];
  v13[2] = *MEMORY[0x1E0CD1A60];
  v13[3] = v4;
  v5 = *MEMORY[0x1E0CD1978];
  v13[4] = *MEMORY[0x1E0CD1A40];
  v13[5] = v5;
  v6 = *MEMORY[0x1E0CD1938];
  v13[6] = *MEMORY[0x1E0CD19E0];
  v13[7] = v6;
  v7 = *MEMORY[0x1E0CD1998];
  v13[8] = *MEMORY[0x1E0CD1958];
  v13[9] = v7;
  v8 = *MEMORY[0x1E0CD19A0];
  v13[10] = *MEMORY[0x1E0CD19D8];
  v13[11] = v8;
  v9 = *MEMORY[0x1E0CD1A28];
  v13[12] = *MEMORY[0x1E0CD1A70];
  v13[13] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v2, "initWithArray:", v10);

  if (+[PGEventLabelingConfiguration isEventLabelingEnabled](PGEventLabelingConfiguration, "isEventLabelingEnabled"))
  {
    objc_msgSend(v11, "addObject:", *MEMORY[0x1E0CD1A08]);
  }
  return v11;
}

+ (id)graphURLForName:(id)a3 parentDirectoryURL:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (objc_class *)MEMORY[0x1E0CB3620];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("PhotosGraph"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v10, 0) & 1) != 0
    || (v17 = 0,
        objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v17),
        (v11 = v17) == 0))
  {
    objc_msgSend((id)objc_opt_class(), "persistentStoreURLWithPath:andName:", v10, v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v11;
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loggingConnection");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v12;
      _os_log_error_impl(&dword_1CA237000, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    v15 = 0;
  }

  return v15;
}

+ (BOOL)graphExistsAtURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;
  char v9;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v9 = 0;
  objc_msgSend(v3, "relativePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v5, &v9);
  if (v9)
    v7 = 0;
  else
    v7 = v6;

  return v7;
}

+ (BOOL)graphExistsWithName:(id)a3 parentDirectoryURL:(id)a4
{
  id v4;
  void *v5;

  v4 = a1;
  objc_msgSend(a1, "graphURLForName:parentDirectoryURL:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "graphExistsAtURL:", v5);

  return (char)v4;
}

+ (PGGraph)graphWithVisualString:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___PGGraph;
  objc_msgSendSuper2(&v5, sel_graphWithVisualString_error_, a3, a4);
  return (PGGraph *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)defaultSpecification
{
  return objc_alloc_init(PGGraphSpecification);
}

+ (int64_t)librarySizeRangeForNumberOfAssets:(unint64_t)a3
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 1;
  v4 = 2;
  v5 = 3;
  v6 = 4;
  if (a3 >> 4 >= 0xC35)
    v6 = 5;
  if (a3 >> 4 >= 0x271)
    v5 = v6;
  if (a3 >= 0x7D0)
    v4 = v5;
  if (a3 >= 0x1F4)
    v3 = v4;
  if (a3)
    return v3;
  else
    return 0;
}

- (id)sortedSocialGroupNodesWithMomentNodes:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  PGGraph *v13;
  _QWORD v14[4];
  id v15;

  objc_msgSend(a3, "socialGroupNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__PGGraph_OnDiskQueries__sortedSocialGroupNodesWithMomentNodes___block_invoke;
  v14[3] = &unk_1E842B970;
  v8 = v6;
  v15 = v8;
  objc_msgSend(v4, "enumerateIdentifiersAsCollectionsWithBlock:", v14);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __64__PGGraph_OnDiskQueries__sortedSocialGroupNodesWithMomentNodes___block_invoke_2;
  v11[3] = &unk_1E842B998;
  v12 = v8;
  v13 = self;
  v9 = v8;
  objc_msgSend(v5, "sortUsingComparator:", v11);

  return v5;
}

void __64__PGGraph_OnDiskQueries__sortedSocialGroupNodesWithMomentNodes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "momentNodes");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

}

uint64_t __64__PGGraph_OnDiskQueries__sortedSocialGroupNodesWithMomentNodes___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "compare:", v9);
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "rankInGraph:", *(_QWORD *)(a1 + 40)));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "rankInGraph:", *(_QWORD *)(a1 + 40)));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v15, "compare:", v14);

  }
  return v13;
}

- (id)meNodeWithFallbackInferredMeNode
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[PGGraph meNode](self, "meNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(v2, "inferredPersonNode");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)inferMeNodeFromSocialGroups
{
  double v3;
  double v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v15[4];
  NSObject *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PGGraph libraryDuration](self, "libraryDuration");
  v4 = v3;
  if (v3 >= 15552000.0)
  {
    v8 = (void *)objc_opt_new();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __46__PGGraph_People__inferMeNodeFromSocialGroups__block_invoke;
    v15[3] = &unk_1E842FBB0;
    v6 = v8;
    v16 = v6;
    -[PGGraph enumerateSocialGroupsIncludingMeNode:socialGroupsVersion:simulateMeNodeNotSet:validGroupsBlock:invalidGroupsBlock:averageWeight:](self, "enumerateSocialGroupsIncludingMeNode:socialGroupsVersion:simulateMeNodeNotSet:validGroupsBlock:invalidGroupsBlock:averageWeight:", 1, 0, 0, v15, 0, 0);
    v9 = -[PGGraph _countOfDistinctSocialGroups:](self, "_countOfDistinctSocialGroups:", v6);
    if (v9 > 2)
    {
      -[PGGraph _personNodeIntersectingSocialGroups:](self, "_personNodeIntersectingSocialGroups:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = v9;
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "loggingConnection");
      v12 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = -[NSObject count](v6, "count");
        *(_DWORD *)buf = 134218496;
        v18 = v13;
        v19 = 2048;
        v20 = v10;
        v21 = 2048;
        v22 = 3;
        _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, "Can't suggest Me Person: Not enough distinct social groups (%lu social groups, %lu distinct < %lu)", buf, 0x20u);
      }

      v7 = 0;
    }

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loggingConnection");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v18 = *(_QWORD *)&v4;
      v19 = 2048;
      v20 = 0x416DA9C000000000;
      _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_INFO, "Can't suggest Me Person: Library time interval too small (%.2f < %.2f)", buf, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

- (id)socialGroupNodeForMemberNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, void *, _BYTE *);
  void *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGGraph meNode](self, "meNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "collection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionBySubtracting:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v8;
  }
  objc_msgSend(v4, "socialGroupNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__26840;
  v27 = __Block_byref_object_dispose__26841;
  v28 = 0;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __49__PGGraph_People__socialGroupNodeForMemberNodes___block_invoke;
  v20 = &unk_1E842BBA8;
  v10 = v4;
  v21 = v10;
  v22 = &v23;
  objc_msgSend(v9, "enumerateIdentifiersAsCollectionsWithBlock:", &v17);
  v11 = (void *)v24[5];
  if (!v11)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging", v17, v18, v19, v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingConnection");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "set");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v30 = "-[PGGraph(People) socialGroupNodeForMemberNodes:]";
      v31 = 2112;
      v32 = v16;
      _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "%s - Cannot find social group for people nodes %@", buf, 0x16u);

    }
    v11 = (void *)v24[5];
  }
  v14 = v11;

  _Block_object_dispose(&v23, 8);
  return v14;
}

- (unint64_t)numberOfSocialGroupNodes
{
  return -[MAGraph nodesCountForLabel:domain:](self, "nodesCountForLabel:domain:", CFSTR("SocialGroup"), 302);
}

- (id)socialGroupNodesSortedByImportance
{
  void *v2;
  void *v3;
  void *v4;

  +[PGGraphNodeCollection nodesInGraph:](PGGraphSocialGroupNodeCollection, "nodesInGraph:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphSocialGroupNode importanceSortDescriptors](PGGraphSocialGroupNode, "importanceSortDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingDescriptors:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)bestSocialGroupNodes
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;

  -[PGGraph socialGroupNodesSortedByImportance](self, "socialGroupNodesSortedByImportance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  if (v3 >= 5)
    v4 = 5;
  else
    v4 = v3;
  objc_msgSend(v2, "subarrayWithRange:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasSocialGroups
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__PGGraph_People__hasSocialGroups__block_invoke;
  v4[3] = &unk_1E842BBD0;
  v4[4] = &v5;
  -[MAGraph enumerateEdgesWithLabel:domain:properties:usingBlock:](self, "enumerateEdgesWithLabel:domain:properties:usingBlock:", CFSTR("SOCIALGROUP"), 302, 0, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isPairSocialGroup:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  -[PGGraph meNode](self, "meNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "countOfEdgesWithLabel:domain:", CFSTR("BELONGSTO"), 302);

  v7 = 1;
  if (!v5)
    v7 = 2;
  v8 = v6 == v7;

  return v8;
}

- (BOOL)isBestPairSocialGroup:(id)a3
{
  id v4;
  double v5;
  BOOL v6;

  v4 = a3;
  objc_msgSend(v4, "importance");
  v6 = v5 == 1.0 && -[PGGraph isPairSocialGroup:](self, "isPairSocialGroup:", v4);

  return v6;
}

- (id)commonSocialGroupNodesForMemberNodes:(id)a3
{
  return -[PGGraph commonSocialGroupNodesForMemberNodes:withThreshold:](self, "commonSocialGroupNodesForMemberNodes:withThreshold:", a3, 0.75);
}

- (id)commonSocialGroupNodesForMemberNodes:(id)a3 withThreshold:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  PGGraphSocialGroupNodeCollection *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  double v20;

  v6 = a3;
  -[PGGraph meNode](self, "meNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "collection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collectionBySubtracting:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v10;
  }
  objc_msgSend(v6, "socialGroupNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0D429B0]);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __70__PGGraph_People__commonSocialGroupNodesForMemberNodes_withThreshold___block_invoke;
  v17[3] = &unk_1E842BBF8;
  v20 = a4;
  v18 = v6;
  v19 = v12;
  v13 = v12;
  v14 = v6;
  objc_msgSend(v11, "enumerateIdentifiersAsCollectionsWithBlock:", v17);
  v15 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphSocialGroupNodeCollection alloc], "initWithGraph:elementIdentifiers:", self, v13);

  return v15;
}

- (unint64_t)numberOfPersonNodesIncludingMe:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;

  v3 = a3;
  v5 = -[MAGraph nodesCountForLabel:domain:](self, "nodesCountForLabel:domain:", CFSTR("People"), 300);
  if (v3)
    v5 += -[MAGraph nodesCountForLabel:domain:](self, "nodesCountForLabel:domain:", CFSTR("Me"), 300);
  return v5;
}

- (id)personNodesIncludingMe:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  -[MAGraph nodesForLabel:domain:](self, "nodesForLabel:domain:", CFSTR("People"), 300);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MAGraph nodesForLabel:domain:](self, "nodesForLabel:domain:", CFSTR("Me"), 300);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v7 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v7, "unionSet:", v6);

      v5 = v7;
    }

  }
  return v5;
}

- (id)favoritedPersonNodesIncludingMe:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  uint64_t v13;
  const __CFString *v14;
  _QWORD v15[2];

  v3 = a3;
  v15[1] = *MEMORY[0x1E0C80C00];
  v14 = CFSTR("fav");
  v5 = MEMORY[0x1E0C9AAB0];
  v15[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAGraph nodesForLabel:domain:properties:](self, "nodesForLabel:domain:properties:", CFSTR("People"), 300, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v12 = CFSTR("fav");
    v13 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAGraph nodesForLabel:domain:properties:](self, "nodesForLabel:domain:properties:", CFSTR("Me"), 300, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      v10 = (void *)objc_msgSend(v7, "mutableCopy");
      objc_msgSend(v10, "unionSet:", v9);

      v7 = v10;
    }

  }
  return v7;
}

- (void)enumeratePersonNodesIncludingMe:(BOOL)a3 withBlock:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, _BYTE *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  if (!v4)
    goto LABEL_3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __61__PGGraph_People__enumeratePersonNodesIncludingMe_withBlock___block_invoke;
  v11 = &unk_1E842BC20;
  v12 = v6;
  v13 = &v14;
  -[MAGraph enumerateNodesWithLabel:domain:usingBlock:](self, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("Me"), 300, &v8);

  if (!*((_BYTE *)v15 + 24))
LABEL_3:
    -[MAGraph enumerateNodesWithLabel:domain:usingBlock:](self, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("People"), 300, v7, v8, v9, v10, v11);
  _Block_object_dispose(&v14, 8);

}

- (id)personNodesForPersonLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PGGraphPersonNodeCollection personNodesForArrayOfLocalIdentifiers:inGraph:](PGGraphPersonNodeCollection, "personNodesForArrayOfLocalIdentifiers:inGraph:", v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personNodeByLocalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "count");
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (id)socialGroupMemberNodesForMemberLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v4);
  +[PGGraphSocialGroupMemberNodeCollection memberNodesForLocalIdentifiers:inGraph:](PGGraphSocialGroupMemberNodeCollection, "memberNodesForLocalIdentifiers:inGraph:", v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "memberNodeByLocalIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "count");
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14), (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (id)momentNodesForPersonNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(v5, "momentNodes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PGGraph _socialGroupNodeForPersonNodes:searchWithTolerance:](self, "_socialGroupNodeForPersonNodes:searchWithTolerance:", v5, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "momentNodes");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)personNodeForPersonLocalIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PGGraphPersonNodeCollection personNodesForLocalIdentifier:inGraph:](PGGraphPersonNodeCollection, "personNodesForLocalIdentifier:inGraph:", v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = 136315394;
      v11 = "-[PGGraph(People) personNodeForPersonLocalIdentifier:]";
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "%s - Cannot find person node for person local identifier: %@", (uint8_t *)&v10, 0x16u);
    }

  }
  objc_msgSend(v5, "anyNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)memberLocalIdentifiersBySocialGroupUUIDWithMemberNodesBySocialGroupNode:(id)a3 shouldIncludeMeNode:(BOOL)a4 simulateMeNodeNotSet:(BOOL)a5
{
  _BOOL4 v6;
  id v8;
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
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v6 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v8, "count"));
  if (a5)
    goto LABEL_2;
  -[PGGraph meNode](self, "meNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "length"))
  {
    -[PGGraph meNode](self, "meNode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inferredPersonNode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v13, "length"))
    {

LABEL_2:
      v9 = 0;
      goto LABEL_6;
    }
    v9 = v13;
  }
LABEL_6:
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = v8;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v14, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localIdentifiers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v21, "count") != 1 || !v6)
        {
          objc_msgSend(v21, "allObjects");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "UUID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v23, v24);
        }
        else
        {
          if (!v9)
            goto LABEL_20;
          objc_msgSend(v21, "setByAddingObject:", v9);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "allObjects");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "UUID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v23, v24);
          v21 = v25;
        }

LABEL_20:
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v16);
  }

  return v27;
}

- (id)socialGroupsIdentifiersFromSocialGroupNodesWithMemberNodesBySocialGroupNode:(id)a3 shouldIncludeMeNode:(BOOL)a4 simulateMeNodeNotSet:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v5 = a5;
  v6 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[PGGraph memberLocalIdentifiersBySocialGroupUUIDWithMemberNodesBySocialGroupNode:shouldIncludeMeNode:simulateMeNodeNotSet:](self, "memberLocalIdentifiersBySocialGroupUUIDWithMemberNodesBySocialGroupNode:shouldIncludeMeNode:simulateMeNodeNotSet:", v8, v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphSocialGroupNode importanceSortDescriptors](PGGraphSocialGroupNode, "importanceSortDescriptors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingDescriptors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v19, "UUID", (_QWORD)v25);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v19, "UUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
            objc_msgSend(v10, "addObject:", v23);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

  return v10;
}

- (id)socialGroupsIdentifiersFromSocialGroupNodes:(id)a3 shouldIncludeMeNode:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  -[PGGraph fetchMemberNodesBySocialGroupNodeForSocialGroups:](self, "fetchMemberNodesBySocialGroupNodeForSocialGroups:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraph socialGroupsIdentifiersFromSocialGroupNodesWithMemberNodesBySocialGroupNode:shouldIncludeMeNode:simulateMeNodeNotSet:](self, "socialGroupsIdentifiersFromSocialGroupNodesWithMemberNodesBySocialGroupNode:shouldIncludeMeNode:simulateMeNodeNotSet:", v6, v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)fetchMemberNodesBySocialGroupNodeForSocialGroups:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraph fetchMemberNodesBySocialGroupNodeForSocialGroupNodes:](self, "fetchMemberNodesBySocialGroupNodeForSocialGroupNodes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fetchMemberNodesBySocialGroupNodeForSocialGroupNodes:(id)a3
{
  id v3;
  PGGraphSocialGroupNodeCollection *v4;
  void *v5;
  void *v6;
  PGGraphSocialGroupNodeCollection *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = [PGGraphSocialGroupNodeCollection alloc];
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "graph");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MAElementCollection initWithArray:graph:](v4, "initWithArray:graph:", v3, v6);

    v8 = (void *)MEMORY[0x1E0D429D8];
    +[PGGraphSocialGroupNode memberOfSocialGroup](PGGraphSocialGroupNode, "memberOfSocialGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "adjacencyWithSources:relation:targetsClass:", v7, v9, objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v3;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v10, "targetsForSourceIdentifier:", objc_msgSend(v17, "identifier", (_QWORD)v20));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v14);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v11;
}

- (id)_socialGroupNodeForPersonNodes:(id)a3 searchWithTolerance:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  uint64_t *v17;
  _QWORD v18[4];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a4;
  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__26840;
  v23 = __Block_byref_object_dispose__26841;
  objc_msgSend(v6, "asSocialGroupMemberNodeCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraph socialGroupNodeForMemberNodes:](self, "socialGroupNodeForMemberNodes:", v7);
  v24 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (void *)v20[5];
  if (v8)
    v9 = 1;
  else
    v9 = !v4;
  if (!v9)
  {
    objc_msgSend(v6, "asSocialGroupMemberNodeCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraph commonSocialGroupNodesForMemberNodes:](self, "commonSocialGroupNodesForMemberNodes:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      v18[0] = 0;
      v18[1] = v18;
      v18[2] = 0x2020000000;
      v18[3] = 0;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __70__PGGraph_People___socialGroupNodeForPersonNodes_searchWithTolerance___block_invoke;
      v14[3] = &unk_1E842BC48;
      v15 = v6;
      v16 = v18;
      v17 = &v19;
      objc_msgSend(v11, "enumerateIdentifiersAsCollectionsWithBlock:", v14);

      _Block_object_dispose(v18, 8);
    }

    v8 = (void *)v20[5];
  }
  v12 = v8;
  _Block_object_dispose(&v19, 8);

  return v12;
}

- (id)_personNodeIntersectingSocialGroups:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  NSObject *v16;
  uint64_t v17;
  char v18;
  uint64_t j;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  unint64_t v39;
  __int16 v40;
  NSObject *v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "unionSet:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v7);
  }

  v10 = vcvtmd_u64_f64((double)(unint64_t)objc_msgSend(v5, "count") * 0.8);
  if (v10 <= 3)
    v11 = 3;
  else
    v11 = v10;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (!v13)
  {

    v15 = 0;
    goto LABEL_29;
  }
  v14 = v13;
  v29 = v5;
  v15 = 0;
  v16 = 0;
  v17 = *(_QWORD *)v31;
  v18 = 1;
  do
  {
    for (j = 0; j != v14; ++j)
    {
      if (*(_QWORD *)v31 != v17)
        objc_enumerationMutation(v12);
      v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
      v21 = objc_msgSend(v12, "countForObject:", v20);
      v22 = v21;
      if (v21 >= v11 && v21 > v15)
      {
        v24 = v20;

        v18 = 1;
        v15 = v22;
        v16 = v24;
      }
      else
      {
        v18 &= v21 != v15;
      }
    }
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  }
  while (v14);

  if (!v16)
  {
    v5 = v29;
LABEL_29:
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "loggingConnection");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v39 = v15;
      v40 = 2112;
      v41 = 0;
      _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_INFO, "Can't suggest Me Person: Not getting 1 person intersect between social groups. Highest overlap count %lu for person %@", buf, 0x16u);
    }
    goto LABEL_34;
  }
  if ((v18 & 1) == 0)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "loggingConnection");
    v27 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v39 = v15;
      v40 = 2112;
      v41 = v16;
      _os_log_impl(&dword_1CA237000, v27, OS_LOG_TYPE_INFO, "Can't suggest Me Person: Not getting a unique person intersecting between the social groups. Highest overlap count %lu for person %@", buf, 0x16u);
    }

    v5 = v29;
LABEL_34:

    v16 = 0;
    goto LABEL_35;
  }
  v5 = v29;
LABEL_35:

  return v16;
}

- (unint64_t)_countOfDistinctSocialGroups:(id)a3
{
  id v3;
  char *v4;
  void *v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id obj;
  char *v36;
  id v37;
  void *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v33 = (void *)objc_opt_new();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v3;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
  if (v34)
  {
    v32 = *(_QWORD *)v53;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v53 != v32)
          objc_enumerationMutation(obj);
        v36 = v4;
        v5 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v4);
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v5, v32);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "count");
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v7 = obj;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
        if (v8)
        {
          v9 = v8;
          v10 = vcvtpd_u64_f64((double)v6 * 0.5);
          v11 = *(_QWORD *)v49;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v49 != v11)
                objc_enumerationMutation(v7);
              v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              if (v13 != v5)
              {
                objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v5);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "intersectSet:", v13);
                if (objc_msgSend(v14, "count") > v10
                  || (v15 = objc_msgSend(v14, "count"), v15 == objc_msgSend(v5, "count")))
                {
                  objc_msgSend(v38, "addObject:", v13);
                }

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
          }
          while (v9);
        }

        objc_msgSend(v33, "addObject:", v38);
        v4 = v36 + 1;
      }
      while (v36 + 1 != (char *)v34);
      v34 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    }
    while (v34);
  }

  v16 = (void *)objc_msgSend(v33, "mutableCopy");
  v17 = (void *)objc_opt_new();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v37 = v33;
  v18 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
  if (v18)
  {
    v19 = v18;
    v39 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v45 != v39)
          objc_enumerationMutation(v37);
        v21 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        objc_msgSend(v16, "removeObject:", v21);
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v22 = v16;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v41;
          do
          {
            for (k = 0; k != v24; ++k)
            {
              if (*(_QWORD *)v41 != v25)
                objc_enumerationMutation(v22);
              v27 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * k);
              if ((objc_msgSend(v21, "isSubsetOfSet:", v27) & 1) == 0)
              {
                v28 = objc_msgSend(v27, "isSubsetOfSet:", v21);
                v27 = v21;
                if (!v28)
                  continue;
              }
              objc_msgSend(v17, "addObject:", v27);
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
          }
          while (v24);
        }

      }
      v19 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
    }
    while (v19);
  }

  v29 = objc_msgSend(v37, "count");
  v30 = objc_msgSend(v17, "count");

  return v29 - v30;
}

- (id)allSocialGroupsForMemberLocalIdentifier:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, float);
  void *v23;
  id v24;
  PGGraph *v25;

  v6 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72208]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    if (v6)
    {
      -[PGGraph meNode](self, "meNode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14
        && (objc_msgSend(v14, "localIdentifier"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "isEqualToString:", v6),
            v16,
            v17))
      {
        +[PGGraphNodeCollection nodesInGraph:](PGGraphSocialGroupNodeCollection, "nodesInGraph:", self);
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[PGGraphPersonNodeCollection personNodesForLocalIdentifier:inGraph:](PGGraphPersonNodeCollection, "personNodesForLocalIdentifier:inGraph:", v6, self);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "socialGroupNodes");
        v12 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (!v12)
        goto LABEL_16;
    }
    else
    {
      +[PGGraphNodeCollection nodesInGraph:](PGGraphSocialGroupNodeCollection, "nodesInGraph:", self);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_16;
    }
    if (objc_msgSend(v12, "count"))
    {
      -[PGGraph socialGroupsIdentifiersFromSocialGroupNodes:shouldIncludeMeNode:](self, "socialGroupsIdentifiersFromSocialGroupNodes:shouldIncludeMeNode:", v12, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_16:
    v13 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_17;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D72210]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __67__PGGraph_People__allSocialGroupsForMemberLocalIdentifier_options___block_invoke;
  v23 = &unk_1E8433288;
  v12 = v11;
  v24 = v12;
  v25 = self;
  -[PGGraph enumerateSocialGroupsIncludingMeNode:socialGroupsVersion:simulateMeNodeNotSet:validGroupsBlock:invalidGroupsBlock:averageWeight:](self, "enumerateSocialGroupsIncludingMeNode:socialGroupsVersion:simulateMeNodeNotSet:validGroupsBlock:invalidGroupsBlock:averageWeight:", 1, 0, v10, &v20, 0, 0);
  if (objc_msgSend(v12, "count", v20, v21, v22, v23))
  {
    -[PGGraph socialGroupsIdentifiersFromSocialGroupNodesWithMemberNodesBySocialGroupNode:shouldIncludeMeNode:simulateMeNodeNotSet:](self, "socialGroupsIdentifiersFromSocialGroupNodesWithMemberNodesBySocialGroupNode:shouldIncludeMeNode:simulateMeNodeNotSet:", v12, 1, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

LABEL_17:
  return v13;
}

- (id)socialGroupsOverlappingMemberLocalIdentifiers:(id)a3
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

  v4 = a3;
  +[PGGraphPersonNodeCollection personNodesForLocalIdentifiers:inGraph:](PGGraphPersonNodeCollection, "personNodesForLocalIdentifiers:inGraph:", v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "asSocialGroupMemberNodeCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraph commonSocialGroupNodesForMemberNodes:](self, "commonSocialGroupNodesForMemberNodes:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
    {
      -[PGGraph meNode](self, "meNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "localIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "containsObject:", v10);

      }
      else
      {
        v11 = 0;
      }
      -[PGGraph socialGroupsIdentifiersFromSocialGroupNodes:shouldIncludeMeNode:](self, "socialGroupsIdentifiersFromSocialGroupNodes:shouldIncludeMeNode:", v7, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)maximalSocialGroupsOverlappingMemberLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id obj;
  uint64_t v35;
  id v36;
  _QWORD v37[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v47;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1CAA4EB2C]();
        -[PGGraph allSocialGroupsForMemberLocalIdentifier:options:](self, "allSocialGroupsForMemberLocalIdentifier:options:", v11, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v5, "addObjectsFromArray:", v13);

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
    }
    while (v8);
  }
  v30 = v6;

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("@count"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v5;
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v16;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v33)
  {
    v32 = *(_QWORD *)v43;
    v17 = MEMORY[0x1E0C809B0];
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v43 != v32)
          objc_enumerationMutation(obj);
        v35 = v18;
        v19 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v18);
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v20 = obj;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v50, 16, v30);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v39;
LABEL_17:
          v24 = 0;
          while (1)
          {
            if (*(_QWORD *)v39 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v24);
            v26 = objc_msgSend(v19, "count");
            if (v26 >= objc_msgSend(v25, "count"))
              break;
            v37[0] = v17;
            v37[1] = 3221225472;
            v37[2] = __72__PGGraph_People__maximalSocialGroupsOverlappingMemberLocalIdentifiers___block_invoke;
            v37[3] = &unk_1E842BC70;
            v37[4] = v25;
            objc_msgSend(v19, "indexesOfObjectsPassingTest:", v37);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "count");
            if (v28 != objc_msgSend(v19, "count"))
              objc_msgSend(v36, "addObject:", v19);

            if (v22 == ++v24)
            {
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
              if (v22)
                goto LABEL_17;
              break;
            }
          }
        }

        v18 = v35 + 1;
      }
      while (v35 + 1 != v33);
      v33 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    }
    while (v33);
  }

  return v36;
}

uint64_t __72__PGGraph_People__maximalSocialGroupsOverlappingMemberLocalIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

void __67__PGGraph_People__allSocialGroupsForMemberLocalIdentifier_options___block_invoke(uint64_t a1, void *a2, float a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  PGGraphSocialGroupMemberNodeCollection *v9;
  PGGraphSocialGroupNode *v10;

  v5 = (void *)MEMORY[0x1E0CB3A28];
  v6 = a2;
  objc_msgSend(v5, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  v10 = -[PGGraphSocialGroupNode initWithSocialGroupIdentifier:importance:]([PGGraphSocialGroupNode alloc], "initWithSocialGroupIdentifier:importance:", v8, a3);
  -[MANode resolveIdentifier:](v10, "resolveIdentifier:", v8);
  v9 = -[MAElementCollection initWithArray:graph:]([PGGraphSocialGroupMemberNodeCollection alloc], "initWithArray:graph:", v6, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v10);
}

void __70__PGGraph_People___socialGroupNodeForPersonNodes_searchWithTolerance___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  unint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "personNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 > objc_msgSend(*(id *)(a1 + 32), "count") && v6 > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  }

}

uint64_t __61__PGGraph_People__enumeratePersonNodesIncludingMe_withBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

void __70__PGGraph_People__commonSocialGroupNodesForMemberNodes_withThreshold___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v10;

  objc_msgSend(a3, "memberNodes");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionByIntersecting:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v10, "count");
  v7 = objc_msgSend(v5, "count");
  v8 = vcvtmd_u64_f64(*(double *)(a1 + 48) * (double)v6);
  if (v8 <= 2)
    v8 = 2;
  if (v7 >= v8 || v7 == v6)
    objc_msgSend(*(id *)(a1 + 40), "addIdentifier:", a2);

}

uint64_t __34__PGGraph_People__hasSocialGroups__block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

void __49__PGGraph_People__socialGroupNodeForMemberNodes___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "memberNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

void __46__PGGraph_People__inferMeNodeFromSocialGroups__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (id)socialGroupMemberSortDescriptorForSocialGroupNode:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3928];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__PGGraph_People__socialGroupMemberSortDescriptorForSocialGroupNode___block_invoke;
  v8[3] = &unk_1E842BB80;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "sortDescriptorWithKey:ascending:comparator:", CFSTR("self"), 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __69__PGGraph_People__socialGroupMemberSortDescriptorForSocialGroupNode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v17;
  void *v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "anyEdgeTowardNode:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "importance");
  v9 = v8;

  objc_msgSend(v6, "anyEdgeTowardNode:", *(_QWORD *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "importance");
  v12 = v11;

  if (v9 < v12)
    goto LABEL_4;
  if (v9 > v12)
  {
LABEL_7:
    v15 = 1;
    goto LABEL_8;
  }
  v13 = objc_msgSend(v5, "edgesCount");
  v14 = objc_msgSend(v6, "edgesCount");
  if (v13 >= v14)
  {
    if (v13 <= v14)
    {
      objc_msgSend(v5, "localIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v17, "compare:", v18);

      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_4:
  v15 = -1;
LABEL_8:

  return v15;
}

- (NSSet)musicSessions
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__PGGraph_Music__musicSessions__block_invoke;
  v6[3] = &unk_1E842C138;
  v4 = v3;
  v7 = v4;
  -[PGGraph enumerateMusicSessionNodesUsingBlock:](self, "enumerateMusicSessionNodesUsingBlock:", v6);

  return (NSSet *)v4;
}

- (void)enumerateMusicSessionNodesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PGGraph_Music__enumerateMusicSessionNodesUsingBlock___block_invoke;
  v6[3] = &unk_1E842C160;
  v7 = v4;
  v5 = v4;
  -[MAGraph enumerateNodesWithLabel:domain:usingBlock:](self, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("MusicSession"), 1000, v6);

}

- (id)musicGenreDistributionUsingTaggedGenres:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  PGMusicGenreDistributionComputer *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__PGGraph_Music__musicGenreDistributionUsingTaggedGenres___block_invoke;
  v10[3] = &unk_1E842C138;
  v11 = v5;
  v6 = v5;
  -[PGGraph enumerateMusicSessionNodesUsingBlock:](self, "enumerateMusicSessionNodesUsingBlock:", v10);
  v7 = objc_alloc_init(PGMusicGenreDistributionComputer);
  -[PGMusicGenreDistributionComputer setUseTaggedGenres:](v7, "setUseTaggedGenres:", v3);
  -[PGMusicGenreDistributionComputer musicGenreDistributionForGenres:](v7, "musicGenreDistributionForGenres:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __58__PGGraph_Music__musicGenreDistributionUsingTaggedGenres___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__PGGraph_Music__musicGenreDistributionUsingTaggedGenres___block_invoke_2;
  v3[3] = &unk_1E842D240;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "enumerateMusicTrackNodesUsingBlock:", v3);

}

void __58__PGGraph_Music__musicGenreDistributionUsingTaggedGenres___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "genreNodes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v5, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

uint64_t __55__PGGraph_Music__enumerateMusicSessionNodesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __31__PGGraph_Music__musicSessions__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)staticGraphSchema
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  _QWORD v175[4];
  id v176;
  id v177;
  PGGraph *v178;
  _QWORD v179[4];
  id v180;

  v2 = objc_alloc_init(MEMORY[0x1E0D42A28]);
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Info"), 1);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Moment"), 100);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Highlight"), 102);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("HighlightGroup"), 102);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", 0, 103);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Address"), 200);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Number"), 200);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Street"), 200);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("District"), 200);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("City"), 200);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("County"), 200);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("State"), 200);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Country"), 200);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Language"), 205);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Area"), 201);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Home"), 202);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Work"), 202);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", 0, 203);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("FrequentLocation"), 204);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Me"), 300);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("People"), 300);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("SocialGroup"), 302);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Contact"), 303);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", 0, 305);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Date"), 400);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Day"), 400);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Month"), 400);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Year"), 400);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("WeekMonth"), 400);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("WeekYear"), 400);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Season"), 400);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Weekend"), 400);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Weekday"), 400);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Holiday"), 401);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("PartOfDay"), 400);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("DayOfWeek"), 400);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Urban"), 502);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Beach"), 502);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Water"), 502);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Nature"), 502);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Mountain"), 502);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Restaurant"), 501);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Nightlife"), 501);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Shopping"), 501);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Travel"), 501);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Culture"), 501);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Entertainment"), 501);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Park"), 501);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("AmusementPark"), 501);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Museum"), 501);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Stadium"), 501);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Business"), 503);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", 0, 504);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("PublicEvent"), 900);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", CFSTR("Performer"), 900);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", 0, 901);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", 0, 902);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeSchemeWithLabel:domain:", 0, 600);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_class();
  v179[0] = MEMORY[0x1E0C809B0];
  v179[1] = 3221225472;
  v179[2] = __36__PGGraph_Schema__staticGraphSchema__block_invoke;
  v179[3] = &unk_1E8432160;
  v11 = v2;
  v180 = v11;
  objc_msgSend(v10, "_traverseMeaningLabelsUsingBlock:", v179);
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("NEXT"), 101, v3, v3);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = (void *)v4;
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("CONTAINS"), 102, v4, v3);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = (void *)v5;
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("GROUP_CONTAINS"), 102, v5, v4);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("HAS_TYPE"), 103, v5, v122);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("ADDRESS"), 200, v3, v6);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("NUMBER"), 200, v6, v7);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("STREET"), 200, v6, v8);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("STREET"), 200, v7, v8);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("DISTRICT"), 200, v6, v9);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("DISTRICT"), 200, v7, v9);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("DISTRICT"), 200, v8, v9);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("CITY"), 200, v6, v138);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("CITY"), 200, v7, v138);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("CITY"), 200, v8, v138);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("CITY"), 200, v9, v138);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("COUNTY"), 200, v6, v174);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("COUNTY"), 200, v7, v174);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("COUNTY"), 200, v8, v174);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("COUNTY"), 200, v9, v174);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("COUNTY"), 200, v138, v174);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("STATE"), 200, v6, v173);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = (void *)v7;
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("STATE"), 200, v7, v173);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = (void *)v8;
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("STATE"), 200, v8, v173);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = (void *)v9;
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("STATE"), 200, v9, v173);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("STATE"), 200, v138, v173);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("STATE"), 200, v174, v173);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("COUNTRY"), 200, v6, v137);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("COUNTRY"), 200, v7, v137);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("COUNTRY"), 200, v8, v137);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("COUNTRY"), 200, v9, v137);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("COUNTRY"), 200, v138, v137);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("COUNTRY"), 200, v174, v137);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("COUNTRY"), 200, v173, v137);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("POPULAR_LANGUAGE"), 205, v137, v172);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("AREA"), 201, v6, v171);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("IS_HOME_WORK"), 202, v6, v136);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = (void *)v6;
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("IS_HOME_WORK"), 202, v6, v135);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("IS_OWNED_BY"), 202, v136, v128);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("IS_OWNED_BY"), 202, v135, v128);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("IS_OWNED_BY"), 202, v136, v132);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("IS_OWNED_BY"), 202, v135, v132);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("MOBILITY"), 203, v3, v170);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("IN"), 204, v3, v134);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("AT"), 204, v134, v6);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("PRESENT"), 300, v128, v3);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("PRESENT"), 300, v132, v3);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("FAMILY"), 300, v132, v128);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("CHILD"), 300, v132, v128);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("PARENT"), 300, v132, v128);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("FRIEND"), 300, v132, v128);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("PARTNER"), 300, v132, v128);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("VIP"), 300, v132, v128);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("COWORKER"), 300, v132, v128);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("BELONGSTO"), 302, v128, v133);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("SOCIALGROUP"), 302, v3, v133);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("FAMILY_SOCIALGROUP"), 302, v132, v133);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("COWORKER_SOCIALGROUP"), 302, v132, v133);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("BIRTHDAY"), 301, v3, v128);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("ANNIVERSARY"), 301, v3, v128);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("BIRTHDAY"), 301, v3, v132);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("ANNIVERSARY"), 301, v3, v132);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("PEOPLE_CONTACT_SUGGESTION"), 303, v128, v129);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("PEOPLE_CONTACT_SUGGESTION"), 303, v132, v129);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("RELATIONSHIP_TAG"), 305, v128, v169);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("DATE"), 400, v3, v126);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("DAY"), 400, v126, v168);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("MONTH"), 400, v126, v167);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("YEAR"), 400, v126, v166);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("WEEKMONTH"), 400, v126, v165);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("WEEKYEAR"), 400, v126, v164);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("SEASON"), 400, v126, v163);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("PARTOFWEEK"), 400, v3, v162);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("PARTOFWEEK"), 400, v3, v161);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("CELEBRATING"), 401, v3, v127);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("HOLIDAY"), 401, v126, v127);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("PARTOFDAY"), 400, v3, v160);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("DAYOFWEEK"), 400, v126, v159);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("ROI"), 502, v3, v158);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("ROI"), 502, v3, v157);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("ROI"), 502, v3, v156);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("ROI"), 502, v3, v155);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("ROI"), 502, v3, v154);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("POI"), 501, v3, v153);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("POI"), 501, v3, v152);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("POI"), 501, v3, v151);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("POI"), 501, v3, v150);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("POI"), 501, v3, v149);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("POI"), 501, v3, v148);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("POI"), 501, v3, v147);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("POI"), 501, v3, v146);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("POI"), 501, v3, v145);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("POI"), 501, v3, v144);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("BUSINESS"), 503, v3, v130);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("BUSINESSCATEGORY"), 504, v130, v143);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("PUBLIC_EVENT"), 900, v3, v131);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("PERFORMER"), 900, v131, v142);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("CATEGORY"), 901, v131, v141);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("LOCALIZED_SUBCATEGORY"), 900, v131, v140);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("PUBLIC_EVENT_BUSINESS"), 900, v131, v130);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("SCENE"), 600, v3, v139);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_opt_class();
  v175[0] = MEMORY[0x1E0C809B0];
  v175[1] = 3221225472;
  v175[2] = __36__PGGraph_Schema__staticGraphSchema__block_invoke_2;
  v175[3] = &unk_1E842C450;
  v19 = v11;
  v176 = v19;
  v177 = v3;
  v178 = self;
  v20 = v3;
  objc_msgSend(v18, "_traverseMeaningLabelsUsingBlock:", v175);
  v21 = v19;

  return v21;
}

void __36__PGGraph_Schema__staticGraphSchema__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "nodeSchemeWithLabel:domain:", a2, 700);

}

void __36__PGGraph_Schema__staticGraphSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "nodesForLabel:domain:", v3, 700);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("MEANING"), 700, *(_QWORD *)(a1 + 40), v5);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "parentMeaningLabelForMeaningLabel:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "nodesForLabel:domain:", v7, 700);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "anyObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(*(id *)(a1 + 32), "edgeSchemeWithLabel:domain:sourceNode:targetNode:", CFSTR("SUBMEANING_OF"), 700, v5, v9);

      }
      else
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "loggingConnection");
        v12 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = 138412290;
          v14 = v3;
          _os_log_error_impl(&dword_1CA237000, v12, OS_LOG_TYPE_ERROR, "Cannot find meaning node for meaning %@", (uint8_t *)&v13, 0xCu);
        }

      }
    }

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loggingConnection");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v3;
      _os_log_error_impl(&dword_1CA237000, v6, OS_LOG_TYPE_ERROR, "Cannot find meaning node for meaning %@", (uint8_t *)&v13, 0xCu);
    }
  }

}

+ (void)traverseParentMeaningsForMeaningLabel:(id)a3 usingBlock:(id)a4
{
  void (**v6)(id, void *, _BYTE *);
  void *v7;
  char v8;

  v6 = (void (**)(id, void *, _BYTE *))a4;
  objc_msgSend(a1, "parentMeaningLabelForMeaningLabel:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = 0;
    v6[2](v6, v7, &v8);
    if (!v8)
      objc_msgSend(a1, "traverseParentMeaningsForMeaningLabel:usingBlock:", v7, v6);
  }

}

+ (id)parentMeaningLabelForMeaningLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_meaningLabelTree");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_findParentMeaningLabelForMeaningLabel:inTree:currentParent:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_findParentMeaningLabelForMeaningLabel:(id)a3 inTree:(id)a4 currentParent:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__28921;
  v24 = __Block_byref_object_dispose__28922;
  v25 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__PGGraph_Schema___findParentMeaningLabelForMeaningLabel_inTree_currentParent___block_invoke;
  v15[3] = &unk_1E842C478;
  v11 = v8;
  v16 = v11;
  v18 = &v20;
  v12 = v10;
  v17 = v12;
  v19 = a1;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v15);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

+ (void)_traverseMeaningLabelsUsingBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "_meaningLabelTree");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_traverseMeaningLabelsInTree:usingBlock:", v5, v4);

}

+ (void)_traverseMeaningLabelsInTree:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__PGGraph_Schema___traverseMeaningLabelsInTree_usingBlock___block_invoke;
  v8[3] = &unk_1E842C4A0;
  v9 = v6;
  v10 = a1;
  v7 = v6;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);

}

+ (id)_meaningLabelTree
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];
  _QWORD v11[4];
  _QWORD v12[4];
  _QWORD v13[9];
  _QWORD v14[9];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("Activity");
  v2 = MEMORY[0x1E0C9AA70];
  v15[0] = CFSTR("Hiking");
  v15[1] = CFSTR("Climbing");
  v16[0] = MEMORY[0x1E0C9AA70];
  v16[1] = MEMORY[0x1E0C9AA70];
  v15[2] = CFSTR("Beaching");
  v15[3] = CFSTR("Diving");
  v16[2] = MEMORY[0x1E0C9AA70];
  v16[3] = MEMORY[0x1E0C9AA70];
  v15[4] = CFSTR("WinterSport");
  v16[4] = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = CFSTR("Entertainment");
  v13[0] = CFSTR("AmusementPark");
  v13[1] = CFSTR("SportEvent");
  v14[0] = v2;
  v14[1] = v2;
  v13[2] = CFSTR("Performance");
  v13[3] = CFSTR("Concert");
  v14[2] = v2;
  v14[3] = v2;
  v13[4] = CFSTR("Festival");
  v13[5] = CFSTR("NightOut");
  v14[4] = v2;
  v14[5] = v2;
  v13[6] = CFSTR("Museum");
  v13[7] = CFSTR("Theater");
  v14[6] = v2;
  v14[7] = v2;
  v13[8] = CFSTR("Dance");
  v14[8] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("Celebration");
  v11[0] = CFSTR("Birthday");
  v11[1] = CFSTR("Anniversary");
  v12[0] = v2;
  v12[1] = v2;
  v11[2] = CFSTR("Wedding");
  v11[3] = CFSTR("HolidayEvent");
  v12[2] = v2;
  v12[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v5;
  v17[3] = CFSTR("Restaurant");
  v9[0] = CFSTR("Breakfast");
  v9[1] = CFSTR("Lunch");
  v10[0] = v2;
  v10[1] = v2;
  v9[2] = CFSTR("Dinner");
  v10[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = CFSTR("Gathering");
  v18[3] = v6;
  v18[4] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __59__PGGraph_Schema___traverseMeaningLabelsInTree_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;

  v6 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *a4 = 0;
  if (objc_msgSend(v6, "count"))
    objc_msgSend(*(id *)(a1 + 40), "_traverseMeaningLabelsInTree:usingBlock:", v6, *(_QWORD *)(a1 + 32));

}

void __79__PGGraph_Schema___findParentMeaningLabelForMeaningLabel_inTree_currentParent___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v7 = a3;
  if (objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(id *)(a1 + 40);
    v10 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v9;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "_findParentMeaningLabelForMeaningLabel:inTree:currentParent:", *(_QWORD *)(a1 + 32), v7, v13);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
  }

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    *a4 = 1;

}

- (NSDictionary)zeroKeywordMappingByMeaningLabel
{
  PGGraph *v2;
  NSDictionary *zeroKeywordMappingByMeaningLabel;
  uint64_t v4;
  NSDictionary *v5;
  NSDictionary *v6;

  v2 = self;
  objc_sync_enter(v2);
  zeroKeywordMappingByMeaningLabel = v2->_zeroKeywordMappingByMeaningLabel;
  if (!zeroKeywordMappingByMeaningLabel)
  {
    -[PGGraph _createZeroKeywordMappingByMeaningLabel](v2, "_createZeroKeywordMappingByMeaningLabel");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v2->_zeroKeywordMappingByMeaningLabel;
    v2->_zeroKeywordMappingByMeaningLabel = (NSDictionary *)v4;

    zeroKeywordMappingByMeaningLabel = v2->_zeroKeywordMappingByMeaningLabel;
  }
  v6 = zeroKeywordMappingByMeaningLabel;
  objc_sync_exit(v2);

  return v6;
}

- (id)_createZeroKeywordMappingByMeaningLabel
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  PGZeroKeywordMapping *v14;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[11];

  v23[9] = *MEMORY[0x1E0C80C00];
  v23[0] = CFSTR("AmusementPark");
  v23[1] = CFSTR("Concert");
  v23[2] = CFSTR("Festival");
  v23[3] = CFSTR("SportEvent");
  v23[4] = CFSTR("Museum");
  v23[5] = CFSTR("Wedding");
  v23[6] = CFSTR("Birthday");
  v23[7] = CFSTR("Anniversary");
  v23[8] = CFSTR("Restaurant");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[MAGraph anyNodeForLabel:domain:properties:](self, "anyNodeForLabel:domain:properties:", v10, 700, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v11, 0);
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __58__PGGraph_Search___createZeroKeywordMappingByMeaningLabel__block_invoke;
          v16[3] = &unk_1E84322A8;
          v17 = v12;
          v13 = v12;
          objc_msgSend(v11, "traverseSubmeaningHierarchyUsingBlock:", v16);
          v14 = -[PGZeroKeywordMapping initWithDisplayNode:mappedMeaningNodes:]([PGZeroKeywordMapping alloc], "initWithDisplayNode:mappedMeaningNodes:", v11, v13);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  return v4;
}

void __58__PGGraph_Search___createZeroKeywordMappingByMeaningLabel__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("HolidayEvent"));

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (id)nodeLabelForHighlightType:(unsigned __int16)a3
{
  if (a3 > 7u)
    return 0;
  else
    return *off_1E842DA78[a3];
}

- (id)longTripHighlightTypeNode
{
  void *v2;
  void *v3;

  -[MAGraph nodesForLabel:domain:](self, "nodesForLabel:domain:", CFSTR("LongTrip"), 103);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)shortTripHighlightTypeNode
{
  void *v2;
  void *v3;

  -[MAGraph nodesForLabel:domain:](self, "nodesForLabel:domain:", CFSTR("ShortTrip"), 103);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)aggregationHighlightTypeNode
{
  void *v2;
  void *v3;

  -[MAGraph nodesForLabel:domain:](self, "nodesForLabel:domain:", CFSTR("Aggregation"), 103);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)onGoingTripHighlightTypeNode
{
  void *v2;
  void *v3;

  -[MAGraph nodesForLabel:domain:](self, "nodesForLabel:domain:", CFSTR("OngoingTrip"), 103);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)defaultHighlightTypeNode
{
  void *v2;
  void *v3;

  -[MAGraph nodesForLabel:domain:](self, "nodesForLabel:domain:", CFSTR("Default"), 103);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)longTripNodes
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PGGraph longTripHighlightTypeNode](self, "longTripHighlightTypeNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__PGGraph_Highlight__longTripNodes__block_invoke;
  v7[3] = &unk_1E842F948;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("HAS_TYPE"), 103, v7);

  return v5;
}

- (id)shortTripNodes
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PGGraph shortTripHighlightTypeNode](self, "shortTripHighlightTypeNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__PGGraph_Highlight__shortTripNodes__block_invoke;
  v7[3] = &unk_1E842F948;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("HAS_TYPE"), 103, v7);

  return v5;
}

- (id)allTripNodes
{
  void *v3;
  void *v4;
  void *v5;

  -[PGGraph longTripNodes](self, "longTripNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraph shortTripNodes](self, "shortTripNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)aggregationNodes
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PGGraph aggregationHighlightTypeNode](self, "aggregationHighlightTypeNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__PGGraph_Highlight__aggregationNodes__block_invoke;
  v7[3] = &unk_1E842F948;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("HAS_TYPE"), 103, v7);

  return v5;
}

- (id)defaultHighlightNodes
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PGGraph dayHighlightNodes](self, "dayHighlightNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isPartOfTrip") & 1) == 0 && (objc_msgSend(v9, "isPartOfAggregation") & 1) == 0)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)dayHighlightNodes
{
  void *v2;
  void *v3;

  +[PGGraphHighlightNodeCollection dayHighlightNodesInGraph:](PGGraphHighlightNodeCollection, "dayHighlightNodesInGraph:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "temporarySet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dayHighlightNodesSortedByDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  -[PGGraph dayHighlightNodes](self, "dayHighlightNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)enumerateDayHighlightNodesWithBlock:(id)a3
{
  -[MAGraph enumerateNodesWithLabel:domain:usingBlock:](self, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("Highlight"), 102, a3);
}

- (id)highlightGroupNodes
{
  return -[MAGraph nodesForLabel:domain:](self, "nodesForLabel:domain:", CFSTR("HighlightGroup"), 102);
}

- (id)highlightGroupNodesSortedByDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  -[PGGraph highlightGroupNodes](self, "highlightGroupNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)enumerateHighlightGroupNodesWithBlock:(id)a3
{
  -[MAGraph enumerateNodesWithLabel:domain:usingBlock:](self, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("HighlightGroup"), 102, a3);
}

- (id)onGoingTripNodes
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PGGraph onGoingTripHighlightTypeNode](self, "onGoingTripHighlightTypeNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__PGGraph_Highlight__onGoingTripNodes__block_invoke;
  v7[3] = &unk_1E842F948;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("HAS_TYPE"), 103, v7);

  return v5;
}

uint64_t __38__PGGraph_Highlight__onGoingTripNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __38__PGGraph_Highlight__aggregationNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __36__PGGraph_Highlight__shortTripNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __35__PGGraph_Highlight__longTripNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (unint64_t)numberOfMomentNodes
{
  return -[MAGraph nodesCountForLabel:domain:](self, "nodesCountForLabel:domain:", CFSTR("Moment"), 100);
}

- (id)momentNodes
{
  return +[PGGraphNodeCollection nodesInGraph:](PGGraphMomentNodeCollection, "nodesInGraph:", self);
}

- (id)momentNodesSortedByDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  -[PGGraph momentNodes](self, "momentNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)momentNodesSortedByDateFromMomentNodes:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3928];
  v4 = a3;
  objc_msgSend(v3, "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)meaningfulMomentNodesSortedByDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  -[PGGraph meaningfulEvents](self, "meaningfulEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)matchEvent:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  double v31;
  id v32;
  void *v33;
  id v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  id v67;
  id v68;
  void *v69;
  id v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  double v75;
  id v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PGGraph _checkCanRead](self, "_checkCanRead");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v88 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "relatedType");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 & 1) != 0)
  {
    -[PGGraph _peopleMatchingIdsToResultsFromEvent:options:](self, "_peopleMatchingIdsToResultsFromEvent:options:", v6, v7);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v12);

    v10 = 0.7;
    if ((v8 & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v87 = 0;
    v10 = 0.0;
    if ((v8 & 2) != 0)
    {
LABEL_3:
      -[PGGraph _timeMatchingIdsToScoresFromEvent:options:](self, "_timeMatchingIdsToScoresFromEvent:options:", v6, v7);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "allKeys");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObjectsFromArray:", v11);

      v10 = v10 + 0.5;
      goto LABEL_6;
    }
  }
  v86 = 0;
LABEL_6:
  if ((v8 & 4) != 0)
  {
    -[PGGraph _locationMatchingIdsToScoresFromEvent:options:](self, "_locationMatchingIdsToScoresFromEvent:options:", v6, v7);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v14);

    v10 = v10 + 1.1;
    if ((v8 & 8) != 0)
      goto LABEL_8;
LABEL_10:
    v84 = 0;
    goto LABEL_11;
  }
  v85 = 0;
  if ((v8 & 8) == 0)
    goto LABEL_10;
LABEL_8:
  -[PGGraph _eventMatchingIdsToScoresFromEvent:options:](self, "_eventMatchingIdsToScoresFromEvent:options:", v6, v7);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v13);

  v10 = v10 + 0.5;
LABEL_11:
  if ((v8 & 0x10) != 0)
  {
    -[PGGraph _placeMatchingIdsToScoresFromEvent:options:](self, "_placeMatchingIdsToScoresFromEvent:options:", v6, v7);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v15);

    v10 = v10 + 0.3;
  }
  else
  {
    v83 = 0;
  }
  v81 = v7;
  v82 = v6;
  if ((v8 & 0x20) != 0)
  {
    -[PGGraph _sceneMatchingIdsToScoresFromEvent:options:](self, "_sceneMatchingIdsToScoresFromEvent:options:", v6, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v17);

    v10 = v10 + 0.3;
  }
  else
  {
    v16 = 0;
  }
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v18 = v9;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
  if (!v19)
    goto LABEL_77;
  v20 = v19;
  v21 = 0.7 / v10;
  v22 = 0.5 / v10;
  v23 = 1.1 / v10;
  v24 = *(_QWORD *)v90;
  v25 = 0.3 / v10;
  do
  {
    v26 = 0;
    do
    {
      if (*(_QWORD *)v90 != v24)
        objc_enumerationMutation(v18);
      v27 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * v26);
      if ((v8 & 1) != 0)
      {
        objc_msgSend(v87, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * v26));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v29;
        if (v29)
        {
          v30 = objc_retainAutorelease(v29);
          objc_msgSend(v30, "score");
          objc_msgSend(v30, "setScore:", v21 * v31);
        }
      }
      else
      {
        v28 = 0;
      }
      if ((v8 & 2) != 0)
      {
        objc_msgSend(v86, "objectForKeyedSubscript:", v27);
        v32 = (id)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        v34 = v28;
        if (v32)
        {
          if (v28)
          {
            objc_msgSend(v32, "score");
            v36 = v35;
            objc_msgSend(v28, "score");
            objc_msgSend(v28, "setScore:", v37 + v36 * v22);
            objc_msgSend(v28, "contextItemForRelatedType:", 2);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v38)
            {
              objc_msgSend(v33, "contextItemForRelatedType:", 2);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if (v38)
                objc_msgSend(v28, "setContextItem:forRelatedType:", v38, 2);
            }

            v34 = v28;
          }
          else
          {
            v34 = objc_retainAutorelease(v32);
            objc_msgSend(v34, "score");
            objc_msgSend(v34, "setScore:", v22 * v39);
          }
        }

        v40 = v34;
        v28 = v40;
        if ((v8 & 4) == 0)
        {
LABEL_28:
          if ((v8 & 8) == 0)
            goto LABEL_29;
          goto LABEL_51;
        }
      }
      else if ((v8 & 4) == 0)
      {
        goto LABEL_28;
      }
      objc_msgSend(v85, "objectForKeyedSubscript:", v27, v81, v82);
      v41 = (id)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      v43 = v28;
      if (v41)
      {
        if (v28)
        {
          objc_msgSend(v41, "score");
          v45 = v44;
          objc_msgSend(v28, "score");
          objc_msgSend(v28, "setScore:", v46 + v45 * v23);
          objc_msgSend(v28, "contextItemForRelatedType:", 4);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v47)
          {
            objc_msgSend(v42, "contextItemForRelatedType:", 4);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (v47)
              objc_msgSend(v28, "setContextItem:forRelatedType:", v47, 4);
          }

          v43 = v28;
        }
        else
        {
          v43 = objc_retainAutorelease(v41);
          objc_msgSend(v43, "score");
          objc_msgSend(v43, "setScore:", v23 * v48);
        }
      }

      v49 = v43;
      v28 = v49;
      if ((v8 & 8) == 0)
      {
LABEL_29:
        if ((v8 & 0x10) == 0)
          goto LABEL_30;
        goto LABEL_59;
      }
LABEL_51:
      objc_msgSend(v84, "objectForKeyedSubscript:", v27, v81);
      v50 = (id)objc_claimAutoreleasedReturnValue();
      v51 = v50;
      v52 = v28;
      if (v50)
      {
        if (v28)
        {
          objc_msgSend(v50, "score");
          v54 = v53;
          objc_msgSend(v28, "score");
          objc_msgSend(v28, "setScore:", v55 + v54 * v22);
          objc_msgSend(v28, "contextItemForRelatedType:", 8);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v56)
          {
            objc_msgSend(v51, "contextItemForRelatedType:", 8);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            if (v56)
              objc_msgSend(v28, "setContextItem:forRelatedType:", v56, 8);
          }

          v52 = v28;
        }
        else
        {
          v52 = objc_retainAutorelease(v50);
          objc_msgSend(v52, "score");
          objc_msgSend(v52, "setScore:", v22 * v57);
        }
      }

      v58 = v52;
      v28 = v58;
      if ((v8 & 0x10) == 0)
      {
LABEL_30:
        if ((v8 & 0x20) == 0)
          goto LABEL_31;
        goto LABEL_67;
      }
LABEL_59:
      objc_msgSend(v83, "objectForKeyedSubscript:", v27, v81);
      v59 = (id)objc_claimAutoreleasedReturnValue();
      v60 = v59;
      v61 = v28;
      if (v59)
      {
        if (v28)
        {
          objc_msgSend(v59, "score");
          v63 = v62;
          objc_msgSend(v28, "score");
          objc_msgSend(v28, "setScore:", v64 + v63 * v25);
          objc_msgSend(v28, "contextItemForRelatedType:", 16);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v65)
          {
            objc_msgSend(v60, "contextItemForRelatedType:", 16);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            if (v65)
              objc_msgSend(v28, "setContextItem:forRelatedType:", v65, 16);
          }

          v61 = v28;
        }
        else
        {
          v61 = objc_retainAutorelease(v59);
          objc_msgSend(v61, "score");
          objc_msgSend(v61, "setScore:", v25 * v66);
        }
      }

      v67 = v61;
      v28 = v67;
      if ((v8 & 0x20) == 0)
      {
LABEL_31:
        if (!v28)
          goto LABEL_33;
LABEL_32:
        objc_msgSend(v88, "addObject:", v28, v81);
        goto LABEL_33;
      }
LABEL_67:
      objc_msgSend(v16, "objectForKeyedSubscript:", v27, v81);
      v68 = (id)objc_claimAutoreleasedReturnValue();
      v69 = v68;
      v70 = v28;
      if (v68)
      {
        if (v28)
        {
          objc_msgSend(v68, "score");
          v72 = v71;
          objc_msgSend(v28, "score");
          objc_msgSend(v28, "setScore:", v73 + v72 * v25);
          objc_msgSend(v28, "contextItemForRelatedType:", 32);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v74)
          {
            objc_msgSend(v69, "contextItemForRelatedType:", 32);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            if (v74)
              objc_msgSend(v28, "setContextItem:forRelatedType:", v74, 32);
          }

          v70 = v28;
        }
        else
        {
          v70 = objc_retainAutorelease(v68);
          objc_msgSend(v70, "score");
          objc_msgSend(v70, "setScore:", v25 * v75);
        }
      }

      v76 = v70;
      v28 = v76;
      if (v76)
        goto LABEL_32;
LABEL_33:

      ++v26;
    }
    while (v20 != v26);
    v77 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
    v20 = v77;
  }
  while (v77);
LABEL_77:

  objc_msgSend(v81, "sortDescriptors");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
  {
    objc_msgSend(v81, "sortDescriptors");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "sortUsingDescriptors:", v79);

  }
  return v88;
}

- (id)matchEvent:(id)a3 withEvent:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  char v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  double v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  double v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  double v57;
  id v58;
  double v59;
  id v60;
  void *v61;
  id v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  double v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  double v85;
  id v86;
  id v87;
  id v89;
  id v90;
  int v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PGGraph _checkCanRead](self, "_checkCanRead");
  v11 = objc_msgSend(v10, "relatedType");
  v12 = v11;
  if ((v11 & 1) != 0)
  {
    -[PGGraph _peopleMatchingFromEvent:toEvent:options:](self, "_peopleMatchingFromEvent:toEvent:options:", v8, v9, v10);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0.7;
    if ((v12 & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v93 = 0;
    v13 = 0.0;
    if ((v11 & 2) != 0)
    {
LABEL_3:
      -[PGGraph _timeMatchingFromEvent:toEvent:options:](self, "_timeMatchingFromEvent:toEvent:options:", v8, v9, v10);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v13 + 0.5;
      goto LABEL_6;
    }
  }
  v95 = 0;
LABEL_6:
  if ((v12 & 4) != 0)
  {
    -[PGGraph _locationMatchingFromEvent:toEvent:options:](self, "_locationMatchingFromEvent:toEvent:options:", v8, v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v13 + 1.1;
    if ((v12 & 8) != 0)
      goto LABEL_8;
  }
  else
  {
    v14 = 0;
    if ((v12 & 8) != 0)
    {
LABEL_8:
      -[PGGraph _eventMatchingFromEvent:toEvent:options:](self, "_eventMatchingFromEvent:toEvent:options:", v8, v9, v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v13 + 0.5;
      goto LABEL_11;
    }
  }
  v15 = 0;
LABEL_11:
  if ((v12 & 0x10) != 0)
  {
    -[PGGraph _placeMatchingFromEvent:toEvent:options:](self, "_placeMatchingFromEvent:toEvent:options:", v8, v9, v10);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v13 + 0.3;
    if ((v12 & 0x20) != 0)
      goto LABEL_13;
  }
  else
  {
    v94 = 0;
    if ((v12 & 0x20) != 0)
    {
LABEL_13:
      -[PGGraph _sceneMatchingFromEvent:toEvent:options:](self, "_sceneMatchingFromEvent:toEvent:options:", v8, v9, v10);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v13 + 0.3;
      goto LABEL_16;
    }
  }
  v92 = 0;
LABEL_16:
  v91 = objc_msgSend(v10, "needsKeywords");
  if ((v12 & 1) != 0)
  {
    v17 = v93;
    v16 = v17;
    if (v17)
    {
      v18 = objc_retainAutorelease(v17);
      objc_msgSend(v18, "score");
      objc_msgSend(v18, "setScore:", 0.7 / v13 * v19);
    }
  }
  else
  {
    v16 = 0;
  }
  v20 = 0.5 / v13;
  if ((v12 & 2) != 0)
  {
    v21 = v95;
    v22 = v21;
    v23 = v16;
    if (v21)
    {
      if (v16)
      {
        objc_msgSend(v21, "score");
        v25 = v24;
        objc_msgSend(v16, "score");
        objc_msgSend(v16, "setScore:", v26 + v25 * v20);
        objc_msgSend(v16, "contextItemForRelatedType:", 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          objc_msgSend(v22, "contextItemForRelatedType:", 2);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
            objc_msgSend(v16, "setContextItem:forRelatedType:", v27, 2);
        }
        if (v91)
        {
          objc_msgSend(v22, "keywordsForRelatedType:", 2);
          v89 = v9;
          v28 = v8;
          v29 = v14;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addKeywords:forRelatedType:", v30, 2);

          v14 = v29;
          v8 = v28;
          v9 = v89;
        }

        v23 = v16;
      }
      else
      {
        v23 = objc_retainAutorelease(v21);
        objc_msgSend(v23, "score");
        objc_msgSend(v23, "setScore:", v20 * v31);
      }
    }

    v32 = v23;
    v16 = v32;
  }
  if ((v12 & 4) != 0)
  {
    v33 = v14;
    v34 = v33;
    v35 = v16;
    if (v33)
    {
      v36 = 1.1 / v13;
      if (v16)
      {
        objc_msgSend(v33, "score");
        v38 = v37;
        objc_msgSend(v16, "score");
        objc_msgSend(v16, "setScore:", v39 + v38 * v36);
        objc_msgSend(v16, "contextItemForRelatedType:", 4);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v40)
        {
          objc_msgSend(v34, "contextItemForRelatedType:", 4);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (v40)
            objc_msgSend(v16, "setContextItem:forRelatedType:", v40, 4);
        }
        if (v91)
        {
          objc_msgSend(v34, "keywordsForRelatedType:", 4);
          v90 = v9;
          v41 = v8;
          v42 = v14;
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addKeywords:forRelatedType:", v43, 4);

          v14 = v42;
          v8 = v41;
          v9 = v90;
        }

        v35 = v16;
      }
      else
      {
        v35 = objc_retainAutorelease(v33);
        objc_msgSend(v35, "score");
        objc_msgSend(v35, "setScore:", v36 * v44);
      }
    }

    v45 = v35;
    v16 = v45;
  }
  if ((v12 & 8) != 0)
  {
    v46 = v15;
    v47 = v46;
    v48 = v16;
    if (v46)
    {
      if (v16)
      {
        objc_msgSend(v46, "score");
        v50 = v49;
        objc_msgSend(v16, "score");
        objc_msgSend(v16, "setScore:", v51 + v50 * v20);
        objc_msgSend(v16, "contextItemForRelatedType:", 8);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v52)
        {
          objc_msgSend(v47, "contextItemForRelatedType:", 8);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (v52)
            objc_msgSend(v16, "setContextItem:forRelatedType:", v52, 8);
        }
        if (v91)
        {
          objc_msgSend(v47, "keywordsForRelatedType:", 8);
          v53 = v9;
          v54 = v8;
          v55 = v14;
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addKeywords:forRelatedType:", v56, 8);

          v14 = v55;
          v8 = v54;
          v9 = v53;
        }

        v48 = v16;
      }
      else
      {
        v48 = objc_retainAutorelease(v46);
        objc_msgSend(v48, "score");
        objc_msgSend(v48, "setScore:", v20 * v57);
      }
    }

    v58 = v48;
    v16 = v58;
  }
  v59 = 0.3 / v13;
  if ((v12 & 0x10) != 0)
  {
    v60 = v94;
    v61 = v60;
    v62 = v16;
    if (v60)
    {
      if (v16)
      {
        objc_msgSend(v60, "score");
        v64 = v63;
        objc_msgSend(v16, "score");
        objc_msgSend(v16, "setScore:", v65 + v64 * v59);
        objc_msgSend(v16, "contextItemForRelatedType:", 16);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v66)
        {
          objc_msgSend(v61, "contextItemForRelatedType:", 16);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          if (v66)
            objc_msgSend(v16, "setContextItem:forRelatedType:", v66, 16);
        }
        if (v91)
        {
          objc_msgSend(v61, "keywordsForRelatedType:", 16);
          v67 = v9;
          v68 = v8;
          v69 = v14;
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addKeywords:forRelatedType:", v70, 16);

          v14 = v69;
          v8 = v68;
          v9 = v67;
        }

        v62 = v16;
      }
      else
      {
        v62 = objc_retainAutorelease(v60);
        objc_msgSend(v62, "score");
        objc_msgSend(v62, "setScore:", v59 * v71);
      }
    }

    v72 = v62;
    v16 = v72;
  }
  if ((v12 & 0x20) != 0)
  {
    v73 = v92;
    v74 = v92;
    v75 = v74;
    v76 = v16;
    if (v74)
    {
      if (v16)
      {
        objc_msgSend(v74, "score");
        v78 = v77;
        objc_msgSend(v16, "score");
        objc_msgSend(v16, "setScore:", v79 + v78 * v59);
        objc_msgSend(v16, "contextItemForRelatedType:", 32);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v80)
        {
          objc_msgSend(v75, "contextItemForRelatedType:", 32);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          if (v80)
            objc_msgSend(v16, "setContextItem:forRelatedType:", v80, 32);
        }
        if (v91)
        {
          objc_msgSend(v75, "keywordsForRelatedType:", 32);
          v81 = v9;
          v82 = v8;
          v83 = v14;
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addKeywords:forRelatedType:", v84, 32);

          v14 = v83;
          v8 = v82;
          v9 = v81;
          v73 = v92;
        }

        v76 = v16;
      }
      else
      {
        v76 = objc_retainAutorelease(v74);
        objc_msgSend(v76, "score");
        objc_msgSend(v76, "setScore:", v59 * v85);
      }
    }

    v86 = v76;
    v16 = v86;
  }
  else
  {
    v73 = v92;
  }
  v87 = v16;

  return v87;
}

- (id)matchPersonNodes:(id)a3 sortDescriptors:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PGNeighborScoreComputer *v10;
  void *v11;
  void *v12;
  id v13;
  PGNeighborScoreComputer *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v30;
  id v31;
  PGGraph *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  PGGraph *v38;
  id v39;
  uint64_t v40;
  __int16 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  PGNeighborScoreComputer *v47;
  id v48;
  __int16 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v32 = self;
  -[PGGraph meNode](self, "meNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 1 && objc_msgSend(v6, "containsObject:", v9))
  {
    v10 = objc_alloc_init(PGNeighborScoreComputer);
    objc_msgSend(v9, "collection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "momentNodes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __54__PGGraph_Matching__matchPersonNodes_sortDescriptors___block_invoke;
    v46[3] = &unk_1E8430370;
    v47 = v10;
    v49 = 102;
    v13 = v8;
    v48 = v13;
    v14 = v10;
    objc_msgSend(v12, "enumerateNodesUsingBlock:", v46);

    v15 = v13;
  }
  else
  {
    v33 = v8;
    v30 = v9;
    v31 = v7;
    if ((unint64_t)objc_msgSend(v6, "count") >= 2 && objc_msgSend(v6, "containsObject:", v9))
    {
      v16 = (void *)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v16, "removeObject:", v9);

      v6 = v16;
    }
    v17 = objc_msgSend(v6, "count");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v20 = v6;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v43 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "collection");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "momentNodes");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __54__PGGraph_Matching__matchPersonNodes_sortDescriptors___block_invoke_2;
          v34[3] = &unk_1E84303C0;
          v27 = v20;
          v35 = v27;
          v41 = 102;
          v36 = v19;
          v37 = v33;
          v38 = v32;
          v40 = v17;
          v39 = v18;
          objc_msgSend(v26, "enumerateNodesUsingBlock:", v34);

        }
        v22 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v22);
    }
    v6 = v20;

    v8 = v33;
    v7 = v31;
    if (v31)
      objc_msgSend(v33, "sortUsingDescriptors:", v31);
    v28 = v33;

    v9 = v30;
  }

  return v8;
}

- (id)_peopleMatchingIdsToResultsFromEvent:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  PGGraph *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  unint64_t v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "personNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "focusedNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PGGraph _peopleCountWithoutMe:focusOnNodes:](self, "_peopleCountWithoutMe:focusOnNodes:", v9, v10);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "pathToMoment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphMomentNode inclusivePathToTargetNodeDomain:withName:](PGGraphMomentNode, "inclusivePathToTargetNodeDomain:withName:", objc_msgSend(v7, "targetEventDomain"), CFSTR("linkedEvent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("(e)%@<-[:PRESENT]-(commonPerson:People)-[:PRESENT]->%@"), v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = CFSTR("e");
    v33[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAGraph matchWithVisualFormat:elements:error:](self, "matchWithVisualFormat:elements:error:", v16, v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __66__PGGraph_Matching___peopleMatchingIdsToResultsFromEvent_options___block_invoke;
    v24[3] = &unk_1E8430428;
    v25 = v18;
    v26 = self;
    v27 = v7;
    v19 = v6;
    v28 = v19;
    v31 = v11;
    v29 = v12;
    v20 = v8;
    v30 = v20;
    v21 = v18;
    objc_msgSend(v21, "enumerateNodesWithName:usingBlock:", CFSTR("linkedEvent"), v24);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v19, "identifier"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeObjectForKey:", v22);

  }
  return v8;
}

- (id)_peopleWithoutMe:(id)a3 focusOnNodes:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99E20];
  v7 = a3;
  objc_msgSend(v6, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__PGGraph_Matching___peopleWithoutMe_focusOnNodes___block_invoke;
  v14[3] = &unk_1E8435398;
  v15 = v5;
  v9 = v8;
  v16 = v9;
  v10 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

- (unint64_t)_peopleCountWithoutMe:(id)a3 focusOnNodes:(id)a4
{
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__PGGraph_Matching___peopleCountWithoutMe_focusOnNodes___block_invoke;
  v10[3] = &unk_1E84341D8;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)_peopleMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "pathToMoment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("(e)%@"), v12);
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "pathFromMoment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@(oe)"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v10;
  v36 = (void *)v13;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@<-[:PRESENT]-(commonPerson:People)-[:PRESENT]->%@"), v13, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = CFSTR("e");
  v37[1] = CFSTR("oe");
  v38[0] = v8;
  v38[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAGraph matchWithVisualFormat:elements:error:](self, "matchWithVisualFormat:elements:error:", v18, v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "nodesForName:", CFSTR("commonPerson"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "focusedNodes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraph _peopleWithoutMe:focusOnNodes:](self, "_peopleWithoutMe:focusOnNodes:", v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v23, "count"))
  {
    objc_msgSend(v8, "personNodes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "focusedNodes");
    v35 = v16;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[PGGraph _peopleCountWithoutMe:focusOnNodes:](self, "_peopleCountWithoutMe:focusOnNodes:", v34, v24);

    objc_msgSend(v9, "personNodes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v20;
    v27 = v18;
    v28 = -[PGGraph _peopleCountWithoutMe:focusOnNodes:](self, "_peopleCountWithoutMe:focusOnNodes:", v25, 0);
    LOBYTE(v32) = objc_msgSend(v17, "needsKeywords");
    v29 = v28;
    v18 = v27;
    v20 = v26;
    -[PGGraph _peopleMatchingResultFromEvent:matchedEvent:presentPeopleCountForEvent:presentPeopleCountForMatchedEvent:commonPeople:relationshipScoreCache:needsKeywords:](self, "_peopleMatchingResultFromEvent:matchedEvent:presentPeopleCountForEvent:presentPeopleCountForMatchedEvent:commonPeople:relationshipScoreCache:needsKeywords:", v8, v9, v33, v29, v23, 0, v32);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v35;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (id)_peopleMatchingResultFromEvent:(id)a3 matchedEvent:(id)a4 presentPeopleCountForEvent:(unint64_t)a5 presentPeopleCountForMatchedEvent:(unint64_t)a6 commonPeople:(id)a7 relationshipScoreCache:(id)a8 needsKeywords:(BOOL)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double (**v25)(void *, void *);
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  PGGraphMatchingResult *v37;
  void *v38;
  PGGraphMatchingResult *v39;
  PGGraphMatchingContextItem *v40;
  void *v41;
  PGGraphMatchingContextItem *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  PGGraphMatchingContextItem *v51;
  PGGraphMatchingResult *v52;
  id v53;
  id obj;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD aBlock[4];
  id v66;
  PGGraph *v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  v18 = (double)(a6 + a5 - objc_msgSend(v16, "count"));
  v19 = 1.0 - ((v18 + 1.0) / (v18 + 1.0 + (double)(unint64_t)objc_msgSend(v16, "count") - v18) + -1.0) / v18;
  v56 = v14;
  objc_msgSend(v14, "eventCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "eventMomentNodes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v15;
  objc_msgSend(v15, "eventCollection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "eventMomentNodes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __176__PGGraph_Matching___peopleMatchingResultFromEvent_matchedEvent_presentPeopleCountForEvent_presentPeopleCountForMatchedEvent_commonPeople_relationshipScoreCache_needsKeywords___block_invoke_3;
  aBlock[3] = &unk_1E8430478;
  v53 = v17;
  v66 = v53;
  v67 = self;
  v25 = (double (**)(void *, void *))_Block_copy(aBlock);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v26 = v16;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
  obj = v26;
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v62 != v29)
          objc_enumerationMutation(obj);
        v31 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_msgSend(v56, "relatableEvent");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = __176__PGGraph_Matching___peopleMatchingResultFromEvent_matchedEvent_presentPeopleCountForEvent_presentPeopleCountForMatchedEvent_commonPeople_relationshipScoreCache_needsKeywords___block_invoke(v32, v31, v21);
        objc_msgSend(v22, "relatableEvent");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v33
            - __176__PGGraph_Matching___peopleMatchingResultFromEvent_matchedEvent_presentPeopleCountForEvent_presentPeopleCountForMatchedEvent_commonPeople_relationshipScoreCache_needsKeywords___block_invoke(v34, v31, v24);

        v36 = -v35;
        if (v35 >= 0.0)
          v36 = v35;
        v19 = v19 + (1.0 - v36) * 0.000000001 + v25[2](v25, v31) * 1.0e-10;
      }
      v26 = obj;
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    }
    while (v28);
  }

  v37 = [PGGraphMatchingResult alloc];
  objc_msgSend(v22, "relatableEvent");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[PGGraphMatchingResult initWithEvent:](v37, "initWithEvent:", v38);

  -[PGGraphMatchingResult setScore:](v39, "setScore:", v19);
  v40 = [PGGraphMatchingContextItem alloc];
  -[PGGraphMatchingResult score](v39, "score");
  v41 = obj;
  v42 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v40, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 1, 1, v56, v22, obj);
  -[PGGraphMatchingResult setContextItem:forRelatedType:](v39, "setContextItem:forRelatedType:", v42, 1);
  if (a9)
  {
    v51 = v42;
    v52 = v39;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(obj, "count"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v44 = obj;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v46; ++j)
        {
          if (*(_QWORD *)v58 != v47)
            objc_enumerationMutation(v44);
          objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * j), "keywordDescription");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "addObject:", v49);

        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
      }
      while (v46);
    }

    v39 = v52;
    -[PGGraphMatchingResult addKeywords:forRelatedType:](v52, "addKeywords:forRelatedType:", v43, 1);

    v41 = obj;
    v42 = v51;
  }

  return v39;
}

- (id)_timeMatchingIdsToScoresFromEvent:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t m;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t n;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t ii;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t jj;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t kk;
  void *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t mm;
  void *v105;
  PGGraphMatchingResult *v106;
  void *v107;
  PGGraphMatchingResult *v108;
  void *v109;
  void *v110;
  PGGraphMatchingContextItem *v111;
  PGGraphMatchingContextItem *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t nn;
  void *v117;
  PGGraphMatchingResult *v118;
  void *v119;
  PGGraphMatchingResult *v120;
  void *v121;
  void *v122;
  PGGraphMatchingContextItem *v123;
  PGGraphMatchingContextItem *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t i1;
  void *v129;
  PGGraphMatchingResult *v130;
  void *v131;
  PGGraphMatchingResult *v132;
  void *v133;
  void *v134;
  PGGraphMatchingContextItem *v135;
  PGGraphMatchingContextItem *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t i2;
  void *v141;
  PGGraphMatchingResult *v142;
  void *v143;
  PGGraphMatchingResult *v144;
  void *v145;
  void *v146;
  PGGraphMatchingContextItem *v147;
  PGGraphMatchingContextItem *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t i3;
  void *v153;
  PGGraphMatchingResult *v154;
  void *v155;
  PGGraphMatchingResult *v156;
  void *v157;
  void *v158;
  PGGraphMatchingContextItem *v159;
  PGGraphMatchingContextItem *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t i4;
  void *v165;
  PGGraphMatchingResult *v166;
  void *v167;
  PGGraphMatchingResult *v168;
  void *v169;
  void *v170;
  PGGraphMatchingContextItem *v171;
  PGGraphMatchingContextItem *v172;
  id v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t i5;
  void *v178;
  PGGraphMatchingResult *v179;
  void *v180;
  PGGraphMatchingResult *v181;
  void *v182;
  void *v183;
  PGGraphMatchingContextItem *v184;
  PGGraphMatchingContextItem *v185;
  id v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t i6;
  void *v191;
  PGGraphMatchingResult *v192;
  void *v193;
  PGGraphMatchingResult *v194;
  void *v195;
  void *v196;
  PGGraphMatchingContextItem *v197;
  PGGraphMatchingContextItem *v198;
  id v199;
  uint64_t v200;
  void *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t i7;
  void *v205;
  PGGraphMatchingResult *v206;
  void *v207;
  PGGraphMatchingResult *v208;
  void *v209;
  void *v210;
  PGGraphMatchingContextItem *v211;
  PGGraphMatchingContextItem *v212;
  PGGraphMatchingContextItem *v213;
  void *v214;
  void *v216;
  void *v217;
  unsigned int v218;
  void *v219;
  id obj;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  uint64_t v229;
  uint64_t v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  id v240;
  id v241;
  id v242;
  id v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  id v249;
  id v250;
  id v251;
  id v252;
  id v253;
  id v254;
  id v255;
  id v256;
  void *v257;
  void *v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  _QWORD v299[4];
  id v300;
  _QWORD v301[5];
  id v302;
  id v303;
  id v304;
  id v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  _QWORD v314[4];
  id v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  _QWORD v328[5];
  id v329;
  id v330;
  id v331;
  id v332;
  __int128 v333;
  __int128 v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  _BYTE v341[128];
  _BYTE v342[128];
  _BYTE v343[128];
  _BYTE v344[128];
  _BYTE v345[128];
  _BYTE v346[128];
  _BYTE v347[128];
  _BYTE v348[128];
  _BYTE v349[128];
  _BYTE v350[128];
  _BYTE v351[128];
  _BYTE v352[128];
  _BYTE v353[128];
  _BYTE v354[128];
  _BYTE v355[128];
  _BYTE v356[128];
  _BYTE v357[128];
  uint64_t v358;

  v358 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  v218 = objc_msgSend(v7, "targetEventDomain");
  v230 = objc_msgSend(v7, "relatedType") & 0x402;
  v8 = (void *)MEMORY[0x1E0D4B130];
  objc_msgSend(MEMORY[0x1E0D4B130], "currentLocalDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "yearFromDate:", v9);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v253 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v255 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  v337 = 0u;
  v338 = 0u;
  v339 = 0u;
  v340 = 0u;
  objc_msgSend(v6, "dateNodes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v238 = v6;
  v226 = v7;
  v222 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v337, v357, 16);
  if (v222)
  {
    v251 = (id)(v10 - 1);
    v221 = *(_QWORD *)v338;
    do
    {
      for (i = 0; i != v222; ++i)
      {
        if (*(_QWORD *)v338 != v221)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v337 + 1) + 8 * i);
        objc_msgSend(v7, "focusedNodes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (!v13 || objc_msgSend(v13, "containsObject:", v12))
        {
          v228 = v14;
          v229 = i;
          if (v230 == 1026)
          {
            objc_msgSend(v12, "collection");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "momentNodes");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "temporarySet");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[PGGraph _eventsFromEvents:withTargetDomain:](self, "_eventsFromEvents:withTargetDomain:", v17, v218);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke(v19, v225, v18, v12);
            objc_msgSend(v219, "unionSet:", v18);

          }
          objc_msgSend(v12, "siblingNodesThroughEdgesWithLabel:domain:", CFSTR("DAY"), 400);
          v20 = objc_claimAutoreleasedReturnValue();
          v235 = v12;
          objc_msgSend(v12, "siblingNodesThroughEdgesWithLabel:domain:", CFSTR("MONTH"), 400);
          v21 = objc_claimAutoreleasedReturnValue();
          v227 = (void *)v20;
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v234 = (void *)v21;
          objc_msgSend(v22, "intersectSet:", v21);
          v336 = 0u;
          v335 = 0u;
          v334 = 0u;
          v333 = 0u;
          v249 = v22;
          v23 = objc_msgSend(v249, "countByEnumeratingWithState:objects:count:", &v333, v356, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v334;
            do
            {
              for (j = 0; j != v24; ++j)
              {
                if (*(_QWORD *)v334 != v25)
                  objc_enumerationMutation(v249);
                v27 = *(void **)(*((_QWORD *)&v333 + 1) + 8 * j);
                v28 = objc_msgSend(v27, "year");
                objc_msgSend(v27, "collection");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "momentNodes");
                v30 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v30, "temporarySet");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                -[PGGraph _eventsFromEvents:withTargetDomain:](self, "_eventsFromEvents:withTargetDomain:", v31, objc_msgSend(v7, "targetEventDomain"));
                v32 = (void *)objc_claimAutoreleasedReturnValue();

                if ((id)v28 == v251)
                  v34 = v258;
                else
                  v34 = v257;
                if ((id)v28 == v251)
                  v35 = v253;
                else
                  v35 = v255;
                __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke(v33, v34, v32, v27);
                objc_msgSend(v35, "unionSet:", v32);

              }
              v24 = objc_msgSend(v249, "countByEnumeratingWithState:objects:count:", &v333, v356, 16);
            }
            while (v24);
          }

          v328[0] = MEMORY[0x1E0C809B0];
          v328[1] = 3221225472;
          v328[2] = __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke_3;
          v328[3] = &unk_1E84304E0;
          v328[4] = self;
          v36 = v7;
          v329 = v36;
          v332 = &__block_literal_global_277;
          v330 = v237;
          v331 = v233;
          objc_msgSend(v235, "enumerateSiblingNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("HOLIDAY"), 401, v328);
          if (v230 == 1026)
          {
            objc_msgSend(v235, "sameWeekDateNodes");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v324 = 0u;
            v325 = 0u;
            v326 = 0u;
            v327 = 0u;
            v242 = v37;
            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v324, v355, 16);
            if (v38)
            {
              v39 = v38;
              v40 = *(_QWORD *)v325;
              do
              {
                for (k = 0; k != v39; ++k)
                {
                  if (*(_QWORD *)v325 != v40)
                    objc_enumerationMutation(v242);
                  v42 = *(void **)(*((_QWORD *)&v324 + 1) + 8 * k);
                  objc_msgSend(v42, "collection");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "momentNodes");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v44, "temporarySet");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PGGraph _eventsFromEvents:withTargetDomain:](self, "_eventsFromEvents:withTargetDomain:", v45, objc_msgSend(v36, "targetEventDomain"));
                  v46 = (void *)objc_claimAutoreleasedReturnValue();

                  __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke(v47, v224, v46, v42);
                  objc_msgSend(v244, "unionSet:", v46);

                }
                v39 = objc_msgSend(v242, "countByEnumeratingWithState:objects:count:", &v324, v355, 16);
              }
              while (v39);
            }
            objc_msgSend(v235, "lastWeekDateNodes");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v320 = 0u;
            v321 = 0u;
            v322 = 0u;
            v323 = 0u;
            v240 = v48;
            v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v320, v354, 16);
            if (v49)
            {
              v50 = v49;
              v51 = *(_QWORD *)v321;
              do
              {
                for (m = 0; m != v50; ++m)
                {
                  if (*(_QWORD *)v321 != v51)
                    objc_enumerationMutation(v240);
                  v53 = *(void **)(*((_QWORD *)&v320 + 1) + 8 * m);
                  objc_msgSend(v53, "collection");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "momentNodes");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v55, "temporarySet");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PGGraph _eventsFromEvents:withTargetDomain:](self, "_eventsFromEvents:withTargetDomain:", v56, objc_msgSend(v36, "targetEventDomain"));
                  v57 = (void *)objc_claimAutoreleasedReturnValue();

                  __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke(v58, v223, v57, v53);
                  objc_msgSend(v245, "unionSet:", v57);

                }
                v50 = objc_msgSend(v240, "countByEnumeratingWithState:objects:count:", &v320, v354, 16);
              }
              while (v50);
            }
            objc_msgSend(v235, "siblingNodesThroughEdgesWithLabel:domain:", CFSTR("WEEKMONTH"), 400);
            v236 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "intersectSet:", v234);
            v319 = 0u;
            v318 = 0u;
            v317 = 0u;
            v316 = 0u;
            v60 = v59;
            v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v316, v353, 16);
            if (v61)
            {
              v62 = v61;
              v63 = *(_QWORD *)v317;
              do
              {
                for (n = 0; n != v62; ++n)
                {
                  if (*(_QWORD *)v317 != v63)
                    objc_enumerationMutation(v60);
                  v65 = *(void **)(*((_QWORD *)&v316 + 1) + 8 * n);
                  objc_msgSend(v65, "collection");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "momentNodes");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v67, "temporarySet");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PGGraph _eventsFromEvents:withTargetDomain:](self, "_eventsFromEvents:withTargetDomain:", v68, objc_msgSend(v36, "targetEventDomain"));
                  v69 = (void *)objc_claimAutoreleasedReturnValue();

                  __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke(v70, v248, v69, v65);
                  objc_msgSend(v247, "unionSet:", v69);

                }
                v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v316, v353, 16);
              }
              while (v62);
            }

            v7 = v226;
          }

          v6 = v238;
          v14 = v228;
          i = v229;
        }

      }
      v222 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v337, v357, 16);
    }
    while (v222);
  }

  if (v230 == 1026)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "eventCollection");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "eventMomentNodes");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v314[0] = MEMORY[0x1E0C809B0];
    v314[1] = 3221225472;
    v314[2] = __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke_4;
    v314[3] = &unk_1E8436408;
    v74 = v71;
    v315 = v74;
    objc_msgSend(v73, "enumerateNodesUsingBlock:", v314);

    -[PGGraph _eventsFromEvents:withTargetDomain:](self, "_eventsFromEvents:withTargetDomain:", v74, objc_msgSend(v226, "targetEventDomain"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v216, "unionSet:", v75);
    v313 = 0u;
    v312 = 0u;
    v311 = 0u;
    v310 = 0u;
    v76 = v75;
    v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v310, v352, 16);
    if (v77)
    {
      v78 = v77;
      v79 = *(_QWORD *)v311;
      do
      {
        for (ii = 0; ii != v78; ++ii)
        {
          if (*(_QWORD *)v311 != v79)
            objc_enumerationMutation(v76);
          v81 = *(void **)(*((_QWORD *)&v310 + 1) + 8 * ii);
          objc_msgSend(v81, "dateNodes");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke_2(v232, v81, v82);

        }
        v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v310, v352, 16);
      }
      while (v78);
    }

  }
  v309 = 0u;
  v308 = 0u;
  v307 = 0u;
  v306 = 0u;
  objc_msgSend(v6, "celebratedHolidayNodes");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v306, v351, 16);
  if (v84)
  {
    v85 = v84;
    v86 = *(_QWORD *)v307;
    do
    {
      for (jj = 0; jj != v85; ++jj)
      {
        if (*(_QWORD *)v307 != v86)
          objc_enumerationMutation(v83);
        v88 = *(void **)(*((_QWORD *)&v306 + 1) + 8 * jj);
        v301[0] = MEMORY[0x1E0C809B0];
        v301[1] = 3221225472;
        v301[2] = __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke_5;
        v301[3] = &unk_1E8430508;
        v301[4] = self;
        v302 = v226;
        v305 = &__block_literal_global_277;
        v303 = v237;
        v304 = v233;
        objc_msgSend(v88, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("HOLIDAY"), 401, v301);

      }
      v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v306, v351, 16);
    }
    while (v85);
  }

  if (v230 == 1026)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v238, "eventCollection");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "eventMomentNodes");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v299[0] = MEMORY[0x1E0C809B0];
    v299[1] = 3221225472;
    v299[2] = __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke_6;
    v299[3] = &unk_1E8436408;
    v92 = v89;
    v300 = v92;
    objc_msgSend(v91, "enumerateNodesUsingBlock:", v299);

    -[PGGraph _eventsFromEvents:withTargetDomain:](self, "_eventsFromEvents:withTargetDomain:", v92, objc_msgSend(v226, "targetEventDomain"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v217, "unionSet:", v93);
    v297 = 0u;
    v298 = 0u;
    v295 = 0u;
    v296 = 0u;
    v94 = v93;
    v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v295, v350, 16);
    if (v95)
    {
      v96 = v95;
      v97 = *(_QWORD *)v296;
      do
      {
        for (kk = 0; kk != v96; ++kk)
        {
          if (*(_QWORD *)v296 != v97)
            objc_enumerationMutation(v94);
          v99 = *(void **)(*((_QWORD *)&v295 + 1) + 8 * kk);
          objc_msgSend(v99, "dateNodes");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke_2(v231, v99, v100);

        }
        v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v295, v350, 16);
      }
      while (v96);
    }

  }
  objc_msgSend(v216, "minusSet:", v219);
  objc_msgSend(v253, "minusSet:", v219);
  objc_msgSend(v253, "minusSet:", v216);
  objc_msgSend(v255, "minusSet:", v219);
  objc_msgSend(v255, "minusSet:", v216);
  objc_msgSend(v255, "minusSet:", v253);
  objc_msgSend(v233, "minusSet:", v219);
  objc_msgSend(v233, "minusSet:", v216);
  objc_msgSend(v233, "minusSet:", v253);
  objc_msgSend(v233, "minusSet:", v255);
  objc_msgSend(v217, "minusSet:", v219);
  objc_msgSend(v217, "minusSet:", v216);
  objc_msgSend(v217, "minusSet:", v253);
  objc_msgSend(v217, "minusSet:", v255);
  objc_msgSend(v217, "minusSet:", v233);
  objc_msgSend(v244, "minusSet:", v219);
  objc_msgSend(v244, "minusSet:", v216);
  objc_msgSend(v244, "minusSet:", v253);
  objc_msgSend(v244, "minusSet:", v255);
  objc_msgSend(v244, "minusSet:", v233);
  objc_msgSend(v244, "minusSet:", v217);
  objc_msgSend(v245, "minusSet:", v219);
  objc_msgSend(v245, "minusSet:", v216);
  objc_msgSend(v245, "minusSet:", v253);
  objc_msgSend(v245, "minusSet:", v255);
  objc_msgSend(v245, "minusSet:", v233);
  objc_msgSend(v245, "minusSet:", v217);
  objc_msgSend(v245, "minusSet:", v244);
  objc_msgSend(v247, "minusSet:", v219);
  objc_msgSend(v247, "minusSet:", v216);
  objc_msgSend(v247, "minusSet:", v253);
  objc_msgSend(v247, "minusSet:", v255);
  objc_msgSend(v247, "minusSet:", v233);
  objc_msgSend(v247, "minusSet:", v217);
  objc_msgSend(v247, "minusSet:", v244);
  objc_msgSend(v247, "minusSet:", v245);
  v293 = 0u;
  v294 = 0u;
  v291 = 0u;
  v292 = 0u;
  v252 = v219;
  v101 = objc_msgSend(v252, "countByEnumeratingWithState:objects:count:", &v291, v349, 16);
  if (v101)
  {
    v102 = v101;
    v103 = *(_QWORD *)v292;
    do
    {
      for (mm = 0; mm != v102; ++mm)
      {
        if (*(_QWORD *)v292 != v103)
          objc_enumerationMutation(v252);
        v105 = *(void **)(*((_QWORD *)&v291 + 1) + 8 * mm);
        v106 = [PGGraphMatchingResult alloc];
        objc_msgSend(v105, "relatableEvent");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = -[PGGraphMatchingResult initWithEvent:](v106, "initWithEvent:", v107);

        -[PGGraphMatchingResult setScore:](v108, "setScore:", 0.8);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v105, "identifier"));
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v225, "objectForKey:", v109);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = [PGGraphMatchingContextItem alloc];
        -[PGGraphMatchingResult score](v108, "score");
        v112 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v111, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 2, v238, v105, v110);
        -[PGGraphMatchingResult setContextItem:forRelatedType:](v108, "setContextItem:forRelatedType:", v112, 2);
        objc_msgSend(v239, "setObject:forKeyedSubscript:", v108, v109);

      }
      v102 = objc_msgSend(v252, "countByEnumeratingWithState:objects:count:", &v291, v349, 16);
    }
    while (v102);
  }

  v289 = 0u;
  v290 = 0u;
  v287 = 0u;
  v288 = 0u;
  v250 = v216;
  v113 = objc_msgSend(v250, "countByEnumeratingWithState:objects:count:", &v287, v348, 16);
  if (v113)
  {
    v114 = v113;
    v115 = *(_QWORD *)v288;
    do
    {
      for (nn = 0; nn != v114; ++nn)
      {
        if (*(_QWORD *)v288 != v115)
          objc_enumerationMutation(v250);
        v117 = *(void **)(*((_QWORD *)&v287 + 1) + 8 * nn);
        v118 = [PGGraphMatchingResult alloc];
        objc_msgSend(v117, "relatableEvent");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = -[PGGraphMatchingResult initWithEvent:](v118, "initWithEvent:", v119);

        -[PGGraphMatchingResult setScore:](v120, "setScore:", 0.7);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v117, "identifier"));
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v232, "objectForKey:", v121);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = [PGGraphMatchingContextItem alloc];
        -[PGGraphMatchingResult score](v120, "score");
        v124 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v123, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 3, v238, v117, v122);
        -[PGGraphMatchingResult setContextItem:forRelatedType:](v120, "setContextItem:forRelatedType:", v124, 2);
        objc_msgSend(v239, "setObject:forKeyedSubscript:", v120, v121);

      }
      v114 = objc_msgSend(v250, "countByEnumeratingWithState:objects:count:", &v287, v348, 16);
    }
    while (v114);
  }

  v285 = 0u;
  v286 = 0u;
  v283 = 0u;
  v284 = 0u;
  v254 = v253;
  v125 = objc_msgSend(v254, "countByEnumeratingWithState:objects:count:", &v283, v347, 16);
  if (v125)
  {
    v126 = v125;
    v127 = *(_QWORD *)v284;
    do
    {
      for (i1 = 0; i1 != v126; ++i1)
      {
        if (*(_QWORD *)v284 != v127)
          objc_enumerationMutation(v254);
        v129 = *(void **)(*((_QWORD *)&v283 + 1) + 8 * i1);
        v130 = [PGGraphMatchingResult alloc];
        objc_msgSend(v129, "relatableEvent");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        v132 = -[PGGraphMatchingResult initWithEvent:](v130, "initWithEvent:", v131);

        -[PGGraphMatchingResult setScore:](v132, "setScore:", 1.0);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v129, "identifier"));
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v258, "objectForKey:", v133);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        v135 = [PGGraphMatchingContextItem alloc];
        -[PGGraphMatchingResult score](v132, "score");
        v136 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v135, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 5, v238, v129, v134);
        -[PGGraphMatchingResult setContextItem:forRelatedType:](v132, "setContextItem:forRelatedType:", v136, 2);
        objc_msgSend(v239, "setObject:forKeyedSubscript:", v132, v133);

      }
      v126 = objc_msgSend(v254, "countByEnumeratingWithState:objects:count:", &v283, v347, 16);
    }
    while (v126);
  }

  v281 = 0u;
  v282 = 0u;
  v279 = 0u;
  v280 = 0u;
  v256 = v255;
  v137 = objc_msgSend(v256, "countByEnumeratingWithState:objects:count:", &v279, v346, 16);
  if (v137)
  {
    v138 = v137;
    v139 = *(_QWORD *)v280;
    do
    {
      for (i2 = 0; i2 != v138; ++i2)
      {
        if (*(_QWORD *)v280 != v139)
          objc_enumerationMutation(v256);
        v141 = *(void **)(*((_QWORD *)&v279 + 1) + 8 * i2);
        v142 = [PGGraphMatchingResult alloc];
        objc_msgSend(v141, "relatableEvent");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        v144 = -[PGGraphMatchingResult initWithEvent:](v142, "initWithEvent:", v143);

        -[PGGraphMatchingResult setScore:](v144, "setScore:", 0.95);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v141, "identifier"));
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v257, "objectForKey:", v145);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        v147 = [PGGraphMatchingContextItem alloc];
        -[PGGraphMatchingResult score](v144, "score");
        v148 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v147, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 6, v238, v141, v146);
        -[PGGraphMatchingResult setContextItem:forRelatedType:](v144, "setContextItem:forRelatedType:", v148, 2);
        objc_msgSend(v239, "setObject:forKeyedSubscript:", v144, v145);

      }
      v138 = objc_msgSend(v256, "countByEnumeratingWithState:objects:count:", &v279, v346, 16);
    }
    while (v138);
  }

  v277 = 0u;
  v278 = 0u;
  v275 = 0u;
  v276 = 0u;
  v243 = v233;
  v149 = objc_msgSend(v243, "countByEnumeratingWithState:objects:count:", &v275, v345, 16);
  if (v149)
  {
    v150 = v149;
    v151 = *(_QWORD *)v276;
    do
    {
      for (i3 = 0; i3 != v150; ++i3)
      {
        if (*(_QWORD *)v276 != v151)
          objc_enumerationMutation(v243);
        v153 = *(void **)(*((_QWORD *)&v275 + 1) + 8 * i3);
        v154 = [PGGraphMatchingResult alloc];
        objc_msgSend(v153, "relatableEvent");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        v156 = -[PGGraphMatchingResult initWithEvent:](v154, "initWithEvent:", v155);

        -[PGGraphMatchingResult setScore:](v156, "setScore:", 0.6);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v153, "identifier"));
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v237, "objectForKey:", v157);
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        v159 = [PGGraphMatchingContextItem alloc];
        -[PGGraphMatchingResult score](v156, "score");
        v160 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v159, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 8, v238, v153, v158);
        -[PGGraphMatchingResult setContextItem:forRelatedType:](v156, "setContextItem:forRelatedType:", v160, 2);
        objc_msgSend(v239, "setObject:forKeyedSubscript:", v156, v157);

      }
      v150 = objc_msgSend(v243, "countByEnumeratingWithState:objects:count:", &v275, v345, 16);
    }
    while (v150);
  }

  v273 = 0u;
  v274 = 0u;
  v271 = 0u;
  v272 = 0u;
  v241 = v217;
  v161 = objc_msgSend(v241, "countByEnumeratingWithState:objects:count:", &v271, v344, 16);
  if (v161)
  {
    v162 = v161;
    v163 = *(_QWORD *)v272;
    do
    {
      for (i4 = 0; i4 != v162; ++i4)
      {
        if (*(_QWORD *)v272 != v163)
          objc_enumerationMutation(v241);
        v165 = *(void **)(*((_QWORD *)&v271 + 1) + 8 * i4);
        v166 = [PGGraphMatchingResult alloc];
        objc_msgSend(v165, "relatableEvent");
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        v168 = -[PGGraphMatchingResult initWithEvent:](v166, "initWithEvent:", v167);

        -[PGGraphMatchingResult setScore:](v168, "setScore:", 0.5);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v165, "identifier"));
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v231, "objectForKey:", v169);
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        v171 = [PGGraphMatchingContextItem alloc];
        -[PGGraphMatchingResult score](v168, "score");
        v172 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v171, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 7, v238, v165, v170);
        -[PGGraphMatchingResult setContextItem:forRelatedType:](v168, "setContextItem:forRelatedType:", v172, 2);
        objc_msgSend(v239, "setObject:forKeyedSubscript:", v168, v169);

      }
      v162 = objc_msgSend(v241, "countByEnumeratingWithState:objects:count:", &v271, v344, 16);
    }
    while (v162);
  }

  v269 = 0u;
  v270 = 0u;
  v267 = 0u;
  v268 = 0u;
  v173 = v244;
  v174 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v267, v343, 16);
  if (v174)
  {
    v175 = v174;
    v176 = *(_QWORD *)v268;
    do
    {
      for (i5 = 0; i5 != v175; ++i5)
      {
        if (*(_QWORD *)v268 != v176)
          objc_enumerationMutation(v173);
        v178 = *(void **)(*((_QWORD *)&v267 + 1) + 8 * i5);
        v179 = [PGGraphMatchingResult alloc];
        objc_msgSend(v178, "relatableEvent");
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        v181 = -[PGGraphMatchingResult initWithEvent:](v179, "initWithEvent:", v180);

        -[PGGraphMatchingResult setScore:](v181, "setScore:", 0.2);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v178, "identifier"));
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v224, "objectForKey:", v182);
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        v184 = [PGGraphMatchingContextItem alloc];
        -[PGGraphMatchingResult score](v181, "score");
        v185 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v184, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 9, v238, v178, v183);
        -[PGGraphMatchingResult setContextItem:forRelatedType:](v181, "setContextItem:forRelatedType:", v185, 2);
        objc_msgSend(v239, "setObject:forKeyedSubscript:", v181, v182);

      }
      v175 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v267, v343, 16);
    }
    while (v175);
  }

  v265 = 0u;
  v266 = 0u;
  v263 = 0u;
  v264 = 0u;
  v186 = v245;
  v187 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v263, v342, 16);
  if (v187)
  {
    v188 = v187;
    v189 = *(_QWORD *)v264;
    do
    {
      for (i6 = 0; i6 != v188; ++i6)
      {
        if (*(_QWORD *)v264 != v189)
          objc_enumerationMutation(v186);
        v191 = *(void **)(*((_QWORD *)&v263 + 1) + 8 * i6);
        v192 = [PGGraphMatchingResult alloc];
        objc_msgSend(v191, "relatableEvent");
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        v194 = -[PGGraphMatchingResult initWithEvent:](v192, "initWithEvent:", v193);

        -[PGGraphMatchingResult setScore:](v194, "setScore:", 0.15);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v191, "identifier"));
        v195 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v223, "objectForKey:", v195);
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        v197 = [PGGraphMatchingContextItem alloc];
        -[PGGraphMatchingResult score](v194, "score");
        v198 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v197, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 10, v238, v191, v196);
        -[PGGraphMatchingResult setContextItem:forRelatedType:](v194, "setContextItem:forRelatedType:", v198, 2);
        objc_msgSend(v239, "setObject:forKeyedSubscript:", v194, v195);

      }
      v188 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v263, v342, 16);
    }
    while (v188);
  }
  v246 = v173;

  v261 = 0u;
  v262 = 0u;
  v259 = 0u;
  v260 = 0u;
  v199 = v247;
  v200 = objc_msgSend(v199, "countByEnumeratingWithState:objects:count:", &v259, v341, 16);
  v201 = v238;
  if (v200)
  {
    v202 = v200;
    v203 = *(_QWORD *)v260;
    do
    {
      for (i7 = 0; i7 != v202; ++i7)
      {
        if (*(_QWORD *)v260 != v203)
          objc_enumerationMutation(v199);
        v205 = *(void **)(*((_QWORD *)&v259 + 1) + 8 * i7);
        v206 = [PGGraphMatchingResult alloc];
        objc_msgSend(v205, "relatableEvent");
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        v208 = -[PGGraphMatchingResult initWithEvent:](v206, "initWithEvent:", v207);

        -[PGGraphMatchingResult setScore:](v208, "setScore:", 0.1);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v205, "identifier"));
        v209 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v248, "objectForKey:", v209);
        v210 = (void *)objc_claimAutoreleasedReturnValue();
        v211 = [PGGraphMatchingContextItem alloc];
        -[PGGraphMatchingResult score](v208, "score");
        v212 = v211;
        v201 = v238;
        v213 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v212, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 11, v238, v205, v210);
        -[PGGraphMatchingResult setContextItem:forRelatedType:](v208, "setContextItem:forRelatedType:", v213, 2);
        objc_msgSend(v239, "setObject:forKeyedSubscript:", v208, v209);

      }
      v202 = objc_msgSend(v199, "countByEnumeratingWithState:objects:count:", &v259, v341, 16);
    }
    while (v202);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v201, "identifier"));
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "removeObjectForKey:", v214);

  return v239;
}

- (id)_timeMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  PGGraphMatchingResult *v24;
  void *v25;
  PGGraphMatchingResult *v26;
  PGGraphMatchingContextItem *v27;
  PGGraphMatchingContextItem *v28;
  PGGraphMatchingContextItem *v29;
  PGGraphMatchingContextItem *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  PGGraphMatchingContextItem *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  BOOL v52;
  char v53;
  PGGraphMatchingResult *v54;
  void *v55;
  PGGraphMatchingResult *v56;
  PGGraphMatchingContextItem *v57;
  PGGraphMatchingContextItem *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  void *m;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t n;
  void *v83;
  PGGraphMatchingContextItem *v84;
  PGGraphMatchingResult *v85;
  void *v86;
  PGGraphMatchingResult *v87;
  PGGraphMatchingContextItem *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t ii;
  void *v94;
  void *v95;
  void *v96;
  PGGraphMatchingResult *v97;
  void *v98;
  PGGraphMatchingResult *v99;
  PGGraphMatchingContextItem *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t jj;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t kk;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t mm;
  void *v117;
  PGGraphMatchingResult *v118;
  void *v119;
  PGGraphMatchingResult *v120;
  PGGraphMatchingContextItem *v121;
  PGGraphMatchingContextItem *v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t nn;
  void *v128;
  void *v129;
  void *v130;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t i1;
  void *v140;
  uint64_t v141;
  _BOOL4 v142;
  PGGraphMatchingResult *v143;
  void *v144;
  PGGraphMatchingResult *v145;
  PGGraphMatchingContextItem *v146;
  PGGraphMatchingContextItem *v147;
  void *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t i2;
  void *v153;
  void *v154;
  void *v155;
  id v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t i3;
  void *v161;
  void *v162;
  PGGraphMatchingResult *v163;
  void *v164;
  PGGraphMatchingResult *v165;
  PGGraphMatchingContextItem *v166;
  PGGraphMatchingContextItem *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t i4;
  void *v172;
  void *v173;
  void *v174;
  int v175;
  id v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t i5;
  void *v181;
  PGGraphMatchingResult *v182;
  void *v183;
  PGGraphMatchingResult *v184;
  PGGraphMatchingContextItem *v185;
  PGGraphMatchingContextItem *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t i6;
  void *v191;
  void *v192;
  void *v193;
  PGGraphMatchingContextItem *v194;
  void *v195;
  uint64_t i7;
  void *v197;
  uint64_t v198;
  uint64_t v199;
  void *v200;
  id v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t i8;
  uint64_t v206;
  PGGraphMatchingResult *v207;
  void *v208;
  PGGraphMatchingResult *v209;
  PGGraphMatchingContextItem *v210;
  void *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t i9;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  id v221;
  uint64_t v222;
  _BOOL4 v223;
  uint64_t v224;
  uint64_t v225;
  void *v226;
  int v227;
  void *v228;
  id v229;
  id v230;
  void *v231;
  id v232;
  id v233;
  void *v234;
  id v235;
  PGGraphMatchingResult *v236;
  id v237;
  id v238;
  PGGraphMatchingContextItem *v239;
  id v240;
  PGGraphMatchingContextItem *v241;
  uint64_t v242;
  PGGraphMatchingContextItem *v243;
  void *v244;
  PGGraphMatchingContextItem *v245;
  id v246;
  id v247;
  PGGraphMatchingContextItem *v248;
  id v249;
  id v250;
  id v251;
  PGGraphMatchingContextItem *v252;
  id v253;
  PGGraphMatchingContextItem *v254;
  id obj;
  id obja;
  PGGraphMatchingContextItem *objb;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  _QWORD v298[4];
  PGGraphMatchingContextItem *v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  _QWORD v304[4];
  id v305;
  PGGraphMatchingContextItem *v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  __int128 v333;
  __int128 v334;
  _QWORD v335[4];
  id v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  _BYTE v341[128];
  _BYTE v342[128];
  _BYTE v343[128];
  _BYTE v344[128];
  _BYTE v345[128];
  _BYTE v346[128];
  _BYTE v347[128];
  _BYTE v348[128];
  _BYTE v349[128];
  _BYTE v350[128];
  _BYTE v351[128];
  _BYTE v352[128];
  _BYTE v353[128];
  _BYTE v354[128];
  _BYTE v355[128];
  _BYTE v356[128];
  _BYTE v357[128];
  _BYTE v358[128];
  _BYTE v359[128];
  uint64_t v360;

  v360 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v9, "relatedType") & 0x402;
  v227 = objc_msgSend(v9, "needsKeywords");
  v11 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v7, "dateNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v8, "dateNodes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithSet:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "focusedNodes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v9, "focusedNodes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "intersectSet:", v18);

  }
  v225 = v10;
  v235 = v9;
  v228 = v13;
  if (v10 != 1026)
  {
    v223 = 0;
    goto LABEL_42;
  }
  objc_msgSend(v8, "eventCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "eventMomentNodes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "weekendNodes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v13;
  v23 = objc_msgSend(v21, "count");

  if (objc_msgSend(v22, "intersectsSet:", v16))
  {
    v24 = [PGGraphMatchingResult alloc];
    objc_msgSend(v8, "relatableEvent");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[PGGraphMatchingResult initWithEvent:](v24, "initWithEvent:", v25);

    -[PGGraphMatchingResult setScore:](v26, "setScore:", 0.8);
    v27 = (PGGraphMatchingContextItem *)objc_msgSend(v22, "mutableCopy");
    -[PGGraphMatchingContextItem intersectSet:](v27, "intersectSet:", v16);
    v28 = [PGGraphMatchingContextItem alloc];
    -[PGGraphMatchingResult score](v26, "score");
    v29 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v28, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 2, v7, v8, v27);
    v236 = v26;
    -[PGGraphMatchingResult setContextItem:forRelatedType:](v26, "setContextItem:forRelatedType:", v29, 2);
    v13 = v22;
    if (!v227)
    {
      v67 = v235;
LABEL_112:

      goto LABEL_113;
    }
    v229 = v8;
    v232 = v7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v30 = (PGGraphMatchingContextItem *)objc_claimAutoreleasedReturnValue();
    v337 = 0u;
    v338 = 0u;
    v339 = 0u;
    v340 = 0u;
    v31 = v22;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v337, v359, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v338;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v338 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v337 + 1) + 8 * i);
          if (objc_msgSend(v16, "containsObject:", v36))
          {
            v37 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v36, "keywordDescription");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "stringWithFormat:", CFSTR("%@ - Same Date"), v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[PGGraphMatchingContextItem addObject:](v30, "addObject:", v39);

          }
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v337, v359, 16);
      }
      while (v33);
    }

    v40 = v30;
    -[PGGraphMatchingResult addKeywords:forRelatedType:](v236, "addKeywords:forRelatedType:", v30, 2);
    v8 = v229;
    v7 = v232;
    goto LABEL_110;
  }
  v223 = v23 != 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventCollection");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "eventMomentNodes");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v335[0] = MEMORY[0x1E0C809B0];
  v335[1] = 3221225472;
  v335[2] = __60__PGGraph_Matching___timeMatchingFromEvent_toEvent_options___block_invoke;
  v335[3] = &unk_1E8436408;
  v44 = v41;
  v336 = v44;
  objc_msgSend(v43, "enumerateNodesUsingBlock:", v335);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v331 = 0u;
  v332 = 0u;
  v333 = 0u;
  v334 = 0u;
  v46 = v44;
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v331, v358, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v332;
    do
    {
      for (j = 0; j != v48; ++j)
      {
        if (*(_QWORD *)v332 != v49)
          objc_enumerationMutation(v46);
        objc_msgSend(*(id *)(*((_QWORD *)&v331 + 1) + 8 * j), "dateNodes");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "unionSet:", v51);

      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v331, v358, 16);
    }
    while (v48);
  }

  objc_msgSend(v45, "intersectSet:", v16);
  if (objc_msgSend(v45, "count"))
    v52 = v23 == 0;
  else
    v52 = 1;
  v53 = !v52;
  if (!v52)
  {
    v54 = [PGGraphMatchingResult alloc];
    objc_msgSend(v8, "relatableEvent");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = -[PGGraphMatchingResult initWithEvent:](v54, "initWithEvent:", v55);

    -[PGGraphMatchingResult setScore:](v56, "setScore:", 0.7);
    v57 = [PGGraphMatchingContextItem alloc];
    -[PGGraphMatchingResult score](v56, "score");
    v58 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v57, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 3, v7, v8, v45);
    v236 = v56;
    -[PGGraphMatchingResult setContextItem:forRelatedType:](v56, "setContextItem:forRelatedType:", v58, 2);
    if (v227)
    {
      v245 = v58;
      v230 = v8;
      v233 = v7;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v327 = 0u;
      v328 = 0u;
      v329 = 0u;
      v330 = 0u;
      obj = v45;
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v327, v357, 16);
      if (v60)
      {
        v61 = v60;
        v62 = *(_QWORD *)v328;
        do
        {
          for (k = 0; k != v61; ++k)
          {
            if (*(_QWORD *)v328 != v62)
              objc_enumerationMutation(obj);
            v64 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(*(id *)(*((_QWORD *)&v327 + 1) + 8 * k), "keywordDescription");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "stringWithFormat:", CFSTR("%@ - Same Weekend Date"), v65);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "addObject:", v66);

          }
          v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v327, v357, 16);
        }
        while (v61);
      }

      -[PGGraphMatchingResult addKeywords:forRelatedType:](v236, "addKeywords:forRelatedType:", v59, 2);
      v8 = v230;
      v7 = v233;
      v58 = v245;
    }

  }
  v67 = v235;
  v13 = v228;
  if ((v53 & 1) == 0)
  {
LABEL_42:
    v231 = v8;
    v234 = v7;
    v68 = (void *)MEMORY[0x1E0D4B130];
    objc_msgSend(MEMORY[0x1E0D4B130], "currentLocalDate");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v68, "yearFromDate:", v69);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v27 = (PGGraphMatchingContextItem *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v29 = (PGGraphMatchingContextItem *)objc_claimAutoreleasedReturnValue();
    v323 = 0u;
    v324 = 0u;
    v325 = 0u;
    v326 = 0u;
    v71 = v13;
    v246 = (id)objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v323, v356, 16);
    if (v246)
    {
      v72 = v70 - 1;
      v237 = v71;
      v242 = *(_QWORD *)v324;
      do
      {
        for (m = 0; m != v246; m = (char *)m + 1)
        {
          if (*(_QWORD *)v324 != v242)
            objc_enumerationMutation(v237);
          v74 = *(void **)(*((_QWORD *)&v323 + 1) + 8 * (_QWORD)m);
          objc_msgSend(v74, "siblingNodesThroughEdgesWithLabel:domain:", CFSTR("DAY"), 400);
          v75 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "siblingNodesThroughEdgesWithLabel:domain:", CFSTR("MONTH"), 400);
          v76 = objc_claimAutoreleasedReturnValue();
          obja = (id)v75;
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v75);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v250 = (id)v76;
          objc_msgSend(v77, "intersectSet:", v76);
          v322 = 0u;
          v321 = 0u;
          v320 = 0u;
          v319 = 0u;
          v78 = v77;
          v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v319, v355, 16);
          if (v79)
          {
            v80 = v79;
            v81 = *(_QWORD *)v320;
            do
            {
              for (n = 0; n != v80; ++n)
              {
                if (*(_QWORD *)v320 != v81)
                  objc_enumerationMutation(v78);
                v83 = *(void **)(*((_QWORD *)&v319 + 1) + 8 * n);
                if (objc_msgSend(v16, "containsObject:", v83))
                {
                  if (objc_msgSend(v83, "year") == v72)
                    v84 = v27;
                  else
                    v84 = v29;
                  -[PGGraphMatchingContextItem addObject:](v84, "addObject:", v83);
                }
              }
              v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v319, v355, 16);
            }
            while (v80);
          }

        }
        v71 = v237;
        v246 = (id)objc_msgSend(v237, "countByEnumeratingWithState:objects:count:", &v323, v356, 16);
      }
      while (v246);
    }

    if (-[PGGraphMatchingContextItem count](v27, "count"))
    {
      v85 = [PGGraphMatchingResult alloc];
      v8 = v231;
      objc_msgSend(v231, "relatableEvent");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = -[PGGraphMatchingResult initWithEvent:](v85, "initWithEvent:", v86);

      -[PGGraphMatchingResult setScore:](v87, "setScore:", 1.0);
      v88 = [PGGraphMatchingContextItem alloc];
      -[PGGraphMatchingResult score](v87, "score");
      v7 = v234;
      v40 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v88, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 5, v234, v231, v27);
      v236 = v87;
      -[PGGraphMatchingResult setContextItem:forRelatedType:](v87, "setContextItem:forRelatedType:", v40, 2);
      if (v227)
      {
        objb = v40;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v315 = 0u;
        v316 = 0u;
        v317 = 0u;
        v318 = 0u;
        v27 = v27;
        v90 = -[PGGraphMatchingContextItem countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v315, v354, 16);
        if (v90)
        {
          v91 = v90;
          v92 = *(_QWORD *)v316;
          do
          {
            for (ii = 0; ii != v91; ++ii)
            {
              if (*(_QWORD *)v316 != v92)
                objc_enumerationMutation(v27);
              v94 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(*(id *)(*((_QWORD *)&v315 + 1) + 8 * ii), "keywordDescription");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "stringWithFormat:", CFSTR("%@ - A Year Ago"), v95);
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "addObject:", v96);

            }
            v91 = -[PGGraphMatchingContextItem countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v315, v354, 16);
          }
          while (v91);
        }

LABEL_81:
        -[PGGraphMatchingResult addKeywords:forRelatedType:](v236, "addKeywords:forRelatedType:", v89, 2);

        v8 = v231;
        v7 = v234;
LABEL_82:
        v67 = v235;
        v13 = v228;
LABEL_83:
        v40 = objb;
LABEL_111:

        goto LABEL_112;
      }
      goto LABEL_110;
    }
    v8 = v231;
    v7 = v234;
    if (-[PGGraphMatchingContextItem count](v29, "count"))
    {
      v97 = [PGGraphMatchingResult alloc];
      objc_msgSend(v231, "relatableEvent");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = -[PGGraphMatchingResult initWithEvent:](v97, "initWithEvent:", v98);

      -[PGGraphMatchingResult setScore:](v99, "setScore:", 0.95);
      v100 = [PGGraphMatchingContextItem alloc];
      -[PGGraphMatchingResult score](v99, "score");
      v40 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v100, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 6, v234, v231, v29);
      v236 = v99;
      -[PGGraphMatchingResult setContextItem:forRelatedType:](v99, "setContextItem:forRelatedType:", v40, 2);
      if (v227)
      {
        objb = v40;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v311 = 0u;
        v312 = 0u;
        v313 = 0u;
        v314 = 0u;
        v29 = v29;
        v101 = -[PGGraphMatchingContextItem countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v311, v353, 16);
        if (v101)
        {
          v102 = v101;
          v103 = *(_QWORD *)v312;
          do
          {
            for (jj = 0; jj != v102; ++jj)
            {
              if (*(_QWORD *)v312 != v103)
                objc_enumerationMutation(v29);
              v105 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(*(id *)(*((_QWORD *)&v311 + 1) + 8 * jj), "keywordDescription");
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "stringWithFormat:", CFSTR("%@ - Day in History"), v106);
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "addObject:", v107);

            }
            v102 = -[PGGraphMatchingContextItem countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v311, v353, 16);
          }
          while (v102);
        }

        goto LABEL_81;
      }
LABEL_110:
      v67 = v235;
      v13 = v228;
      goto LABEL_111;
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    objb = (PGGraphMatchingContextItem *)objc_claimAutoreleasedReturnValue();
    v307 = 0u;
    v308 = 0u;
    v309 = 0u;
    v310 = 0u;
    v251 = v71;
    v108 = objc_msgSend(v251, "countByEnumeratingWithState:objects:count:", &v307, v352, 16);
    if (v108)
    {
      v109 = v108;
      v110 = *(_QWORD *)v308;
      do
      {
        for (kk = 0; kk != v109; ++kk)
        {
          if (*(_QWORD *)v308 != v110)
            objc_enumerationMutation(v251);
          v112 = *(void **)(*((_QWORD *)&v307 + 1) + 8 * kk);
          v304[0] = MEMORY[0x1E0C809B0];
          v304[1] = 3221225472;
          v304[2] = __60__PGGraph_Matching___timeMatchingFromEvent_toEvent_options___block_invoke_2;
          v304[3] = &unk_1E8430530;
          v305 = v16;
          v306 = objb;
          objc_msgSend(v112, "enumerateSiblingNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("HOLIDAY"), 401, v304);

        }
        v109 = objc_msgSend(v251, "countByEnumeratingWithState:objects:count:", &v307, v352, 16);
      }
      while (v109);
    }

    v302 = 0u;
    v303 = 0u;
    v300 = 0u;
    v301 = 0u;
    objc_msgSend(v234, "celebratedHolidayNodes");
    v247 = (id)objc_claimAutoreleasedReturnValue();
    v113 = objc_msgSend(v247, "countByEnumeratingWithState:objects:count:", &v300, v351, 16);
    if (v113)
    {
      v114 = v113;
      v115 = *(_QWORD *)v301;
      do
      {
        for (mm = 0; mm != v114; ++mm)
        {
          if (*(_QWORD *)v301 != v115)
            objc_enumerationMutation(v247);
          v117 = *(void **)(*((_QWORD *)&v300 + 1) + 8 * mm);
          v298[0] = MEMORY[0x1E0C809B0];
          v298[1] = 3221225472;
          v298[2] = __60__PGGraph_Matching___timeMatchingFromEvent_toEvent_options___block_invoke_3;
          v298[3] = &unk_1E8432070;
          v299 = objb;
          objc_msgSend(v117, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("HOLIDAY"), 401, v298);

        }
        v114 = objc_msgSend(v247, "countByEnumeratingWithState:objects:count:", &v300, v351, 16);
      }
      while (v114);
    }

    -[PGGraphMatchingContextItem intersectSet:](objb, "intersectSet:", v16);
    if (-[PGGraphMatchingContextItem count](objb, "count"))
    {
      v118 = [PGGraphMatchingResult alloc];
      v8 = v231;
      objc_msgSend(v231, "relatableEvent");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = -[PGGraphMatchingResult initWithEvent:](v118, "initWithEvent:", v119);

      -[PGGraphMatchingResult setScore:](v120, "setScore:", 0.6);
      v121 = [PGGraphMatchingContextItem alloc];
      -[PGGraphMatchingResult score](v120, "score");
      v7 = v234;
      v122 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v121, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 8, v234, v231, objb);
      v236 = v120;
      -[PGGraphMatchingResult setContextItem:forRelatedType:](v120, "setContextItem:forRelatedType:", v122, 2);
      v40 = objb;
      if (v227)
      {
        v248 = v122;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v294 = 0u;
        v295 = 0u;
        v296 = 0u;
        v297 = 0u;
        v252 = objb;
        v124 = -[PGGraphMatchingContextItem countByEnumeratingWithState:objects:count:](v252, "countByEnumeratingWithState:objects:count:", &v294, v350, 16);
        if (v124)
        {
          v125 = v124;
          v126 = *(_QWORD *)v295;
          do
          {
            for (nn = 0; nn != v125; ++nn)
            {
              if (*(_QWORD *)v295 != v126)
                objc_enumerationMutation(v252);
              v128 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(*(id *)(*((_QWORD *)&v294 + 1) + 8 * nn), "keywordDescription");
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v128, "stringWithFormat:", CFSTR("%@ - Same Holiday"), v129);
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v123, "addObject:", v130);

            }
            v125 = -[PGGraphMatchingContextItem countByEnumeratingWithState:objects:count:](v252, "countByEnumeratingWithState:objects:count:", &v294, v350, 16);
          }
          while (v125);
        }

        -[PGGraphMatchingResult addKeywords:forRelatedType:](v236, "addKeywords:forRelatedType:", v123, 2);
        v8 = v231;
        v7 = v234;
        v40 = objb;
        v122 = v248;
      }

      goto LABEL_110;
    }
    v8 = v231;
    v7 = v234;
    v67 = v235;
    v13 = v228;
    if (v225 != 1026)
    {
LABEL_203:
      v236 = 0;
      goto LABEL_83;
    }
    objc_msgSend(v234, "eventSortedMomentNodes");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "firstObject");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "lastWeekendMoments");
    v134 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v290 = 0u;
    v291 = 0u;
    v292 = 0u;
    v293 = 0u;
    v249 = v134;
    v136 = objc_msgSend(v249, "countByEnumeratingWithState:objects:count:", &v290, v349, 16);
    if (v136)
    {
      v137 = v136;
      v138 = *(_QWORD *)v291;
      do
      {
        for (i1 = 0; i1 != v137; ++i1)
        {
          if (*(_QWORD *)v291 != v138)
            objc_enumerationMutation(v249);
          objc_msgSend(*(id *)(*((_QWORD *)&v290 + 1) + 8 * i1), "dateNodes");
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "unionSet:", v140);

        }
        v137 = objc_msgSend(v249, "countByEnumeratingWithState:objects:count:", &v290, v349, 16);
      }
      while (v137);
    }

    objc_msgSend(v135, "intersectSet:", v16);
    v141 = objc_msgSend(v135, "count");
    v142 = v223;
    if (!v141)
      v142 = 0;
    if (v142)
    {
      v143 = [PGGraphMatchingResult alloc];
      objc_msgSend(v231, "relatableEvent");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = -[PGGraphMatchingResult initWithEvent:](v143, "initWithEvent:", v144);

      -[PGGraphMatchingResult setScore:](v145, "setScore:", 0.5);
      v146 = [PGGraphMatchingContextItem alloc];
      -[PGGraphMatchingResult score](v145, "score");
      v147 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v146, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 7, v234, v231, v135);
      v236 = v145;
      -[PGGraphMatchingResult setContextItem:forRelatedType:](v145, "setContextItem:forRelatedType:", v147, 2);
      if (v227)
      {
        v243 = v147;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        v286 = 0u;
        v287 = 0u;
        v288 = 0u;
        v289 = 0u;
        v219 = v135;
        v253 = v135;
        v149 = objc_msgSend(v253, "countByEnumeratingWithState:objects:count:", &v286, v348, 16);
        if (v149)
        {
          v150 = v149;
          v151 = *(_QWORD *)v287;
          do
          {
            for (i2 = 0; i2 != v150; ++i2)
            {
              if (*(_QWORD *)v287 != v151)
                objc_enumerationMutation(v253);
              v153 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(*(id *)(*((_QWORD *)&v286 + 1) + 8 * i2), "keywordDescription");
              v154 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v153, "stringWithFormat:", CFSTR("%@ - Previous Weekend Date"), v154);
              v155 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v148, "addObject:", v155);

            }
            v150 = objc_msgSend(v253, "countByEnumeratingWithState:objects:count:", &v286, v348, 16);
          }
          while (v150);
        }

        -[PGGraphMatchingResult addKeywords:forRelatedType:](v236, "addKeywords:forRelatedType:", v148, 2);
        v8 = v231;
        v7 = v234;
        v135 = v219;
        v147 = v243;
      }

      goto LABEL_82;
    }
    v220 = v135;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    v282 = 0u;
    v283 = 0u;
    v284 = 0u;
    v285 = 0u;
    v156 = v251;
    v157 = objc_msgSend(v156, "countByEnumeratingWithState:objects:count:", &v282, v347, 16);
    if (v157)
    {
      v158 = v157;
      v159 = *(_QWORD *)v283;
      do
      {
        for (i3 = 0; i3 != v158; ++i3)
        {
          if (*(_QWORD *)v283 != v159)
            objc_enumerationMutation(v156);
          objc_msgSend(*(id *)(*((_QWORD *)&v282 + 1) + 8 * i3), "sameWeekDateNodes");
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v244, "unionSet:", v161);

        }
        v158 = objc_msgSend(v156, "countByEnumeratingWithState:objects:count:", &v282, v347, 16);
      }
      while (v158);
    }

    v162 = v244;
    objc_msgSend(v244, "intersectSet:", v16);
    if (objc_msgSend(v244, "count"))
    {
      v163 = [PGGraphMatchingResult alloc];
      objc_msgSend(v231, "relatableEvent");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      v165 = -[PGGraphMatchingResult initWithEvent:](v163, "initWithEvent:", v164);

      -[PGGraphMatchingResult setScore:](v165, "setScore:", 0.2);
      v166 = [PGGraphMatchingContextItem alloc];
      -[PGGraphMatchingResult score](v165, "score");
      v236 = v165;
      v254 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v166, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 9, v234, v231, v244);
      -[PGGraphMatchingResult setContextItem:forRelatedType:](v165, "setContextItem:forRelatedType:");
      if (!v227)
      {
        v175 = 1;
        v67 = v235;
        v195 = v220;
        goto LABEL_202;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v167 = (PGGraphMatchingContextItem *)objc_claimAutoreleasedReturnValue();
      v278 = 0u;
      v279 = 0u;
      v280 = 0u;
      v281 = 0u;
      v238 = v244;
      v168 = objc_msgSend(v238, "countByEnumeratingWithState:objects:count:", &v278, v346, 16);
      if (v168)
      {
        v169 = v168;
        v170 = *(_QWORD *)v279;
        do
        {
          for (i4 = 0; i4 != v169; ++i4)
          {
            if (*(_QWORD *)v279 != v170)
              objc_enumerationMutation(v238);
            v172 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(*(id *)(*((_QWORD *)&v278 + 1) + 8 * i4), "keywordDescription");
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v172, "stringWithFormat:", CFSTR("%@ - Same Week Date"), v173);
            v174 = (void *)objc_claimAutoreleasedReturnValue();
            -[PGGraphMatchingContextItem addObject:](v167, "addObject:", v174);

          }
          v169 = objc_msgSend(v238, "countByEnumeratingWithState:objects:count:", &v278, v346, 16);
        }
        while (v169);
      }

      -[PGGraphMatchingResult addKeywords:forRelatedType:](v236, "addKeywords:forRelatedType:", v167, 2);
      v175 = 1;
      v8 = v231;
      v7 = v234;
      goto LABEL_197;
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v254 = (PGGraphMatchingContextItem *)objc_claimAutoreleasedReturnValue();
    v274 = 0u;
    v275 = 0u;
    v276 = 0u;
    v277 = 0u;
    v176 = v156;
    v177 = objc_msgSend(v176, "countByEnumeratingWithState:objects:count:", &v274, v345, 16);
    if (v177)
    {
      v178 = v177;
      v179 = *(_QWORD *)v275;
      do
      {
        for (i5 = 0; i5 != v178; ++i5)
        {
          if (*(_QWORD *)v275 != v179)
            objc_enumerationMutation(v176);
          objc_msgSend(*(id *)(*((_QWORD *)&v274 + 1) + 8 * i5), "lastWeekDateNodes");
          v181 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGGraphMatchingContextItem unionSet:](v254, "unionSet:", v181);

        }
        v178 = objc_msgSend(v176, "countByEnumeratingWithState:objects:count:", &v274, v345, 16);
      }
      while (v178);
    }

    -[PGGraphMatchingContextItem intersectSet:](v254, "intersectSet:", v16);
    if (-[PGGraphMatchingContextItem count](v254, "count"))
    {
      v182 = [PGGraphMatchingResult alloc];
      objc_msgSend(v231, "relatableEvent");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      v184 = -[PGGraphMatchingResult initWithEvent:](v182, "initWithEvent:", v183);

      -[PGGraphMatchingResult setScore:](v184, "setScore:", 0.15);
      v185 = [PGGraphMatchingContextItem alloc];
      -[PGGraphMatchingResult score](v184, "score");
      v167 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v185, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 10, v234, v231, v254);
      v236 = v184;
      -[PGGraphMatchingResult setContextItem:forRelatedType:](v184, "setContextItem:forRelatedType:", v167, 2);
      if (!v227)
      {
        v175 = 1;
LABEL_197:
        v67 = v235;
        v195 = v220;
        v162 = v244;
LABEL_201:

LABEL_202:
        v13 = v228;
        if (v175)
          goto LABEL_83;
        goto LABEL_203;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v186 = (PGGraphMatchingContextItem *)objc_claimAutoreleasedReturnValue();
      v270 = 0u;
      v271 = 0u;
      v272 = 0u;
      v273 = 0u;
      v239 = v254;
      v187 = -[PGGraphMatchingContextItem countByEnumeratingWithState:objects:count:](v239, "countByEnumeratingWithState:objects:count:", &v270, v344, 16);
      if (v187)
      {
        v188 = v187;
        v189 = *(_QWORD *)v271;
        do
        {
          for (i6 = 0; i6 != v188; ++i6)
          {
            if (*(_QWORD *)v271 != v189)
              objc_enumerationMutation(v239);
            v191 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(*(id *)(*((_QWORD *)&v270 + 1) + 8 * i6), "keywordDescription");
            v192 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v191, "stringWithFormat:", CFSTR("%@ - Previous Week Date"), v192);
            v193 = (void *)objc_claimAutoreleasedReturnValue();
            -[PGGraphMatchingContextItem addObject:](v186, "addObject:", v193);

          }
          v188 = -[PGGraphMatchingContextItem countByEnumeratingWithState:objects:count:](v239, "countByEnumeratingWithState:objects:count:", &v270, v344, 16);
        }
        while (v188);
      }

      v194 = v186;
      -[PGGraphMatchingResult addKeywords:forRelatedType:](v236, "addKeywords:forRelatedType:", v186, 2);
      v8 = v231;
      v7 = v234;
      v67 = v235;
      v195 = v220;
      v162 = v244;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v167 = (PGGraphMatchingContextItem *)objc_claimAutoreleasedReturnValue();
      v266 = 0u;
      v267 = 0u;
      v268 = 0u;
      v269 = 0u;
      v221 = v176;
      v224 = objc_msgSend(v221, "countByEnumeratingWithState:objects:count:", &v266, v343, 16);
      if (v224)
      {
        v222 = *(_QWORD *)v267;
        do
        {
          for (i7 = 0; i7 != v224; ++i7)
          {
            if (*(_QWORD *)v267 != v222)
              objc_enumerationMutation(v221);
            v197 = *(void **)(*((_QWORD *)&v266 + 1) + 8 * i7);
            objc_msgSend(v197, "siblingNodesThroughEdgesWithLabel:domain:", CFSTR("WEEKMONTH"), 400);
            v198 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v197, "siblingNodesThroughEdgesWithLabel:domain:", CFSTR("MONTH"), 400);
            v199 = objc_claimAutoreleasedReturnValue();
            v240 = (id)v198;
            objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v198);
            v200 = (void *)objc_claimAutoreleasedReturnValue();
            v226 = (void *)v199;
            objc_msgSend(v200, "intersectSet:", v199);
            v264 = 0u;
            v265 = 0u;
            v262 = 0u;
            v263 = 0u;
            v201 = v200;
            v202 = objc_msgSend(v201, "countByEnumeratingWithState:objects:count:", &v262, v342, 16);
            if (v202)
            {
              v203 = v202;
              v204 = *(_QWORD *)v263;
              do
              {
                for (i8 = 0; i8 != v203; ++i8)
                {
                  if (*(_QWORD *)v263 != v204)
                    objc_enumerationMutation(v201);
                  v206 = *(_QWORD *)(*((_QWORD *)&v262 + 1) + 8 * i8);
                  if (objc_msgSend(v16, "containsObject:", v206))
                    -[PGGraphMatchingContextItem addObject:](v167, "addObject:", v206);
                }
                v203 = objc_msgSend(v201, "countByEnumeratingWithState:objects:count:", &v262, v342, 16);
              }
              while (v203);
            }

          }
          v224 = objc_msgSend(v221, "countByEnumeratingWithState:objects:count:", &v266, v343, 16);
        }
        while (v224);
      }

      v162 = v244;
      if (!-[PGGraphMatchingContextItem count](v167, "count"))
      {
        v175 = 0;
        v8 = v231;
        v7 = v234;
        v67 = v235;
        v195 = v220;
        goto LABEL_201;
      }
      v207 = [PGGraphMatchingResult alloc];
      v8 = v231;
      objc_msgSend(v231, "relatableEvent");
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      v209 = -[PGGraphMatchingResult initWithEvent:](v207, "initWithEvent:", v208);

      -[PGGraphMatchingResult setScore:](v209, "setScore:", 0.1);
      v210 = [PGGraphMatchingContextItem alloc];
      -[PGGraphMatchingResult score](v209, "score");
      v7 = v234;
      v194 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v210, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 2, 11, v234, v231, v167);
      v236 = v209;
      -[PGGraphMatchingResult setContextItem:forRelatedType:](v209, "setContextItem:forRelatedType:", v194, 2);
      if (v227)
      {
        v241 = v194;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v211 = (void *)objc_claimAutoreleasedReturnValue();
        v258 = 0u;
        v259 = 0u;
        v260 = 0u;
        v261 = 0u;
        v167 = v167;
        v212 = -[PGGraphMatchingContextItem countByEnumeratingWithState:objects:count:](v167, "countByEnumeratingWithState:objects:count:", &v258, v341, 16);
        if (v212)
        {
          v213 = v212;
          v214 = *(_QWORD *)v259;
          do
          {
            for (i9 = 0; i9 != v213; ++i9)
            {
              if (*(_QWORD *)v259 != v214)
                objc_enumerationMutation(v167);
              v216 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(*(id *)(*((_QWORD *)&v258 + 1) + 8 * i9), "keywordDescription");
              v217 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v216, "stringWithFormat:", CFSTR("%@ - Same Week In History Date"), v217);
              v218 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v211, "addObject:", v218);

            }
            v213 = -[PGGraphMatchingContextItem countByEnumeratingWithState:objects:count:](v167, "countByEnumeratingWithState:objects:count:", &v258, v341, 16);
          }
          while (v213);
        }

        -[PGGraphMatchingResult addKeywords:forRelatedType:](v236, "addKeywords:forRelatedType:", v211, 2);
        v8 = v231;
        v7 = v234;
        v67 = v235;
        v195 = v220;
        v194 = v241;
        v162 = v244;
      }
      else
      {
        v67 = v235;
        v195 = v220;
      }
    }

    v175 = 1;
    goto LABEL_201;
  }
LABEL_113:

  return v236;
}

- (id)_locationMatchingIdsToScoresFromEvent:(id)a3 options:(id)a4
{
  return -[PGGraph _coreLocationMatchingFromEvent:toEvent:options:](self, "_coreLocationMatchingFromEvent:toEvent:options:", a3, 0, a4);
}

- (id)_locationMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v8 = a4;
  -[PGGraph _coreLocationMatchingFromEvent:toEvent:options:](self, "_coreLocationMatchingFromEvent:toEvent:options:", a3, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = objc_msgSend(v8, "identifier");

  objc_msgSend(v10, "numberWithUnsignedInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_coreLocationMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  void *v66;
  double v67;
  double v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  id v88;
  id v89;
  PGGraphAreaNodeCollection *v90;
  void *v91;
  uint64_t v92;
  BOOL v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  void *v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  double v118;
  uint64_t n;
  double v120;
  void *v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  double v125;
  uint64_t ii;
  double v127;
  id v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t jj;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  double v136;
  double v137;
  void *v138;
  void *v139;
  double v140;
  double v141;
  void *v142;
  void *v143;
  double v144;
  double v145;
  double v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t kk;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  double v155;
  double v156;
  void *v157;
  void *v158;
  double v159;
  double v160;
  void *v161;
  void *v162;
  double v163;
  double v164;
  double v165;
  PGGraphMatchingResult *v166;
  void *v167;
  PGGraphMatchingResult *v168;
  void *v169;
  void *v170;
  void *v171;
  uint64_t v172;
  void *v173;
  void *v174;
  unint64_t v175;
  void *v176;
  NSObject *v177;
  void *v178;
  void *v179;
  void *v180;
  PGGraphMatchingContextItem *v181;
  PGGraphMatchingContextItem *v182;
  void *v183;
  unint64_t v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  BOOL v198;
  id v199;
  uint64_t v200;
  void *v201;
  uint64_t v202;
  double v203;
  uint64_t mm;
  void *v205;
  double v206;
  double v207;
  id v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  BOOL v213;
  void *v214;
  void *v215;
  void *v216;
  id v217;
  void *v218;
  double v219;
  double v220;
  void *v221;
  double v222;
  double v223;
  double v224;
  void *v225;
  void *v226;
  BOOL v227;
  void *v228;
  id v229;
  id v230;
  id v231;
  id v233;
  id v234;
  id v235;
  uint64_t v236;
  id v237;
  void *v238;
  uint64_t v239;
  void *v240;
  id v241;
  void *v242;
  void *v243;
  void *v244;
  uint64_t v245;
  void *v246;
  void *v247;
  void *v248;
  unint64_t v249;
  void *v250;
  void *v251;
  id v252;
  id v253;
  void *v254;
  uint64_t v255;
  uint64_t v256;
  id obj;
  uint64_t m;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  id v263;
  id v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  id v269;
  void *oslog;
  NSObject *osloga;
  id v272;
  void *v273;
  id v274;
  PGGraphAreaNodeCollection *v275;
  _QWORD v277[4];
  id v278;
  uint64_t *v279;
  __int128 *p_buf;
  uint64_t v281;
  double *v282;
  uint64_t v283;
  uint64_t v284;
  _QWORD v285[4];
  id v286;
  id v287;
  uint64_t v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  _QWORD v317[4];
  id v318;
  id v319;
  void *v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  _QWORD v329[4];
  id v330;
  id v331;
  id v332;
  id v333;
  _QWORD v334[4];
  id v335;
  id v336;
  id v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  __int128 v344;
  __int128 v345;
  _QWORD v346[4];
  id v347;
  id v348;
  id v349;
  void *v350;
  void *v351;
  __int128 buf;
  uint64_t v353;
  uint64_t v354;
  _BYTE v355[128];
  _BYTE v356[128];
  _BYTE v357[128];
  _BYTE v358[128];
  _BYTE v359[128];
  _BYTE v360[128];
  _BYTE v361[128];
  _BYTE v362[128];
  _BYTE v363[128];
  _BYTE v364[128];
  _BYTE v365[128];
  _QWORD v366[6];
  _QWORD v367[8];
  CLLocationCoordinate2D v368;
  CLLocationCoordinate2D v369;
  CLLocationCoordinate2D v370;
  CLLocationCoordinate2D v371;

  v367[6] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v237 = a4;
  v274 = a5;
  objc_msgSend(v7, "graph");
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  v366[0] = CFSTR("Street");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v367[0] = v8;
  v366[1] = CFSTR("District");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v367[1] = v9;
  v366[2] = CFSTR("City");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v367[2] = v10;
  v366[3] = CFSTR("County");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v367[3] = v11;
  v366[4] = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v367[4] = v12;
  v366[5] = CFSTR("Country");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v367[5] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v367, v366, 6);
  v238 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "eventCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "eventMomentNodes");
  v246 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v246, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v346[0] = MEMORY[0x1E0C809B0];
  v346[1] = 3221225472;
  v346[2] = __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke;
  v346[3] = &unk_1E8430580;
  v17 = v15;
  v347 = v17;
  v264 = v16;
  v348 = v264;
  v272 = v7;
  v349 = v272;
  objc_msgSend(v246, "enumerateNodesUsingBlock:", v346);
  objc_msgSend(v274, "focusedNodes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = v18 == 0;

  if ((a5 & 1) != 0)
  {
    v259 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    v345 = 0u;
    v344 = 0u;
    v343 = 0u;
    v342 = 0u;
    objc_msgSend(v274, "focusedNodes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v342, v365, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v343;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v343 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v342 + 1) + 8 * i);
          objc_msgSend(v23, "label");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("Address"));

          if (v25)
            objc_msgSend(v259, "addObject:", v23);
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v342, v365, 16);
      }
      while (v20);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_alloc_init(MEMORY[0x1E0D429B0]);
  v341 = 0u;
  v340 = 0u;
  v339 = 0u;
  v338 = 0u;
  v28 = v17;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v338, v364, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v339;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v339 != v30)
          objc_enumerationMutation(v28);
        v32 = *(void **)(*((_QWORD *)&v338 + 1) + 8 * j);
        if (!v259 || objc_msgSend(v259, "containsObject:", *(_QWORD *)(*((_QWORD *)&v338 + 1) + 8 * j)))
        {
          v334[0] = MEMORY[0x1E0C809B0];
          v334[1] = 3221225472;
          v334[2] = __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_3;
          v334[3] = &unk_1E84305A8;
          v335 = v274;
          v336 = v272;
          v337 = v26;
          objc_msgSend(v32, "enumerateSiblingNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("AREA"), 201, v334);
          objc_msgSend(v32, "collection");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "countryNodes");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "anyNode");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
          {
            objc_msgSend(v254, "addObject:", v35);
            objc_msgSend(v27, "addIdentifier:", objc_msgSend(v35, "identifier"));
          }
          else
          {
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "loggingConnection");
            v37 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v32;
              _os_log_error_impl(&dword_1CA237000, v37, OS_LOG_TYPE_ERROR, "No country node for address node: %@", (uint8_t *)&buf, 0xCu);
            }

          }
        }
      }
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v338, v364, 16);
    }
    while (v29);
  }

  v329[0] = MEMORY[0x1E0C809B0];
  v329[1] = 3221225472;
  v329[2] = __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_304;
  v329[3] = &unk_1E84305D0;
  v233 = v27;
  v330 = v233;
  v234 = v274;
  v331 = v234;
  v235 = v272;
  v332 = v235;
  v38 = v26;
  v333 = v38;
  -[MAGraph enumerateNodesWithLabel:domain:usingBlock:](self, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("Address"), 200, v329);
  v39 = objc_alloc_init(MEMORY[0x1E0D429A8]);
  v40 = objc_alloc_init(MEMORY[0x1E0D429A8]);
  v328 = 0u;
  v327 = 0u;
  v326 = 0u;
  v325 = 0u;
  obj = v28;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v325, v363, 16);
  if (v41)
  {
    v42 = *(_QWORD *)v326;
    do
    {
      for (k = 0; k != v41; ++k)
      {
        if (*(_QWORD *)v326 != v42)
          objc_enumerationMutation(obj);
        v44 = *(void **)(*((_QWORD *)&v325 + 1) + 8 * k);
        objc_msgSend(v44, "collection");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "areaNodes");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "elementIdentifiers");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setTargets:forSource:", v47, objc_msgSend(v44, "identifier"));

        objc_msgSend(v44, "collection");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "deepParentLocationNodes");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "elementIdentifiers");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setTargets:forSource:", v50, objc_msgSend(v44, "identifier"));

        objc_msgSend(v40, "insertSource:target:", objc_msgSend(v44, "identifier"), objc_msgSend(v44, "identifier"));
      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v325, v363, 16);
    }
    while (v41);
  }

  v51 = objc_alloc(MEMORY[0x1E0D429D8]);
  v52 = objc_opt_class();
  v251 = (void *)objc_msgSend(v51, "initWithAdjacency:graph:sourcesClass:targetsClass:", v39, v260, v52, objc_opt_class());
  v53 = objc_alloc(MEMORY[0x1E0D429D8]);
  v54 = objc_opt_class();
  v250 = (void *)objc_msgSend(v53, "initWithAdjacency:graph:sourcesClass:targetsClass:", v40, v260, v54, objc_opt_class());

  v324 = 0u;
  v323 = 0u;
  v322 = 0u;
  v321 = 0u;
  v241 = v38;
  v245 = objc_msgSend(v241, "countByEnumeratingWithState:objects:count:", &v321, v362, 16);
  if (v245)
  {
    v236 = *(_QWORD *)v322;
    v55 = 1.0;
    do
    {
      v56 = 0;
      do
      {
        if (*(_QWORD *)v322 != v236)
        {
          v57 = v56;
          objc_enumerationMutation(v241);
          v56 = v57;
        }
        v239 = v56;
        v247 = *(void **)(*((_QWORD *)&v321 + 1) + 8 * v56);
        objc_msgSend(v247, "eventCollection");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "eventMomentNodes");
        v248 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v248, "count"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v317[0] = MEMORY[0x1E0C809B0];
        v317[1] = 3221225472;
        v317[2] = __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_3_312;
        v317[3] = &unk_1E8430580;
        v252 = v59;
        v318 = v252;
        v263 = v60;
        v319 = v263;
        v320 = v247;
        objc_msgSend(v248, "enumerateNodesUsingBlock:", v317);
        if (objc_msgSend(v259, "count"))
          v61 = v259;
        else
          v61 = obj;
        v62 = objc_msgSend(v61, "count");
        v63 = objc_msgSend(v252, "count");
        if (v62 >= v63)
          v64 = v63;
        else
          v64 = v62;
        v249 = v64;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
        v266 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v249);
        v273 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v249);
        v244 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v249);
        v243 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v261 = (void *)objc_claimAutoreleasedReturnValue();
        v275 = -[MAElementCollection initWithGraph:]([PGGraphAreaNodeCollection alloc], "initWithGraph:", v260);
        v65 = objc_msgSend(v266, "count");
        while (2)
        {
          if (v65 >= v249)
            goto LABEL_97;
          v315 = 0u;
          v316 = 0u;
          v313 = 0u;
          v314 = 0u;
          v253 = obj;
          v256 = objc_msgSend(v253, "countByEnumeratingWithState:objects:count:", &v313, v361, 16);
          if (!v256)
            goto LABEL_96;
          oslog = 0;
          v66 = 0;
          v255 = *(_QWORD *)v314;
          v67 = 0.0;
          v68 = 0.0;
          do
          {
            for (m = 0; m != v256; ++m)
            {
              if (*(_QWORD *)v314 != v255)
                objc_enumerationMutation(v253);
              v262 = *(void **)(*((_QWORD *)&v313 + 1) + 8 * m);
              if ((objc_msgSend(v266, "containsObject:") & 1) == 0
                && (!v259 || objc_msgSend(v259, "containsObject:", v262)))
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v262, "identifier"));
                v265 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v251, "targetsForSourceIdentifier:", objc_msgSend(v262, "identifier"));
                v267 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v250, "targetsForSourceIdentifier:", objc_msgSend(v262, "identifier"));
                v268 = (void *)objc_claimAutoreleasedReturnValue();
                v311 = 0u;
                v312 = 0u;
                v309 = 0u;
                v310 = 0u;
                v269 = v252;
                v69 = objc_msgSend(v269, "countByEnumeratingWithState:objects:count:", &v309, v360, 16);
                if (!v69)
                  goto LABEL_90;
                v70 = *(_QWORD *)v310;
                while (1)
                {
                  v71 = 0;
                  do
                  {
                    if (*(_QWORD *)v310 != v70)
                      objc_enumerationMutation(v269);
                    v72 = *(void **)(*((_QWORD *)&v309 + 1) + 8 * v71);
                    if ((objc_msgSend(v273, "containsObject:", v72) & 1) == 0)
                    {
                      -[PGGraph _firstLocationNodeFromAddressNode:inLocationNodes:](self, "_firstLocationNodeFromAddressNode:inLocationNodes:", v72, v268);
                      v73 = (void *)objc_claimAutoreleasedReturnValue();
                      -[PGGraph _commonAreaNodesBetweenAddressAreaNodes:andAddressNode:](self, "_commonAreaNodesBetweenAddressAreaNodes:andAddressNode:", v267, v72);
                      v74 = (void *)objc_claimAutoreleasedReturnValue();
                      v75 = v74;
                      if (v73)
                      {
                        objc_msgSend(v73, "label");
                        v76 = (void *)objc_claimAutoreleasedReturnValue();
                        -[PGGraph _distanceForLocationLabel:](self, "_distanceForLocationLabel:", v76);
                        v78 = v77;

                        goto LABEL_66;
                      }
                      if ((objc_msgSend(v74, "isEmpty") & 1) == 0)
                      {
                        v78 = 0.95;
LABEL_66:
                        if ((objc_msgSend(v75, "isEmpty") & 1) == 0)
                          v78 = v78 * ((double)(unint64_t)(objc_msgSend(v75, "count") - 1) * -0.0001 + 0.01);
                        objc_msgSend(v264, "objectForKeyedSubscript:", v265);
                        v79 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v79, "doubleValue");
                        v81 = v80;
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v72, "identifier"));
                        v82 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v263, "objectForKeyedSubscript:", v82);
                        v83 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v83, "doubleValue");
                        v85 = v84;

                        v86 = v81 + v85;
                        v87 = (v55 - v78) * (v81 + v85);
                        if (v87 > v68)
                        {
                          v88 = v262;

                          v89 = v72;
                          if (!objc_msgSend(v266, "count"))
                          {
                            objc_msgSend(v261, "removeAllObjects");
                            if (objc_msgSend(v75, "count"))
                            {
                              -[MAElementCollection collectionByFormingUnionWith:](v275, "collectionByFormingUnionWith:", v75);
                              v90 = (PGGraphAreaNodeCollection *)objc_claimAutoreleasedReturnValue();
                              v91 = v275;
                              goto LABEL_88;
                            }
                            v90 = -[MAElementCollection initWithGraph:]([PGGraphAreaNodeCollection alloc], "initWithGraph:", v260);

                            objc_msgSend(v88, "coordinate");
                            v104 = v103;
                            v106 = v105;
                            objc_msgSend(v89, "coordinate");
                            v108 = v107;
                            v110 = v109;
                            v370.latitude = v104;
                            v370.longitude = v106;
                            if (CLLocationCoordinate2DIsValid(v370))
                            {
                              v371.latitude = v108;
                              v371.longitude = v110;
                              if (CLLocationCoordinate2DIsValid(v371))
                              {
                                objc_msgSend(v73, "label");
                                v91 = (void *)objc_claimAutoreleasedReturnValue();
                                +[PGMatchingCommonLocation matchingCommonLocationWithLabel:coordinate:forAddressCoordinate:](PGMatchingCommonLocation, "matchingCommonLocationWithLabel:coordinate:forAddressCoordinate:", v91, v108, v110, v104, v106);
                                v111 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v261, "addObject:", v111);

LABEL_88:
                              }
                            }
LABEL_82:

                            oslog = v89;
                            v66 = v88;
                            v67 = v86;
                            v68 = v87;
                            v275 = v90;
                            goto LABEL_83;
                          }
LABEL_81:
                          v90 = v275;
                          goto LABEL_82;
                        }
                        if (!objc_msgSend(v266, "count") && v87 == v68)
                        {
                          v92 = -[MAElementCollection count](v275, "count");
                          v93 = v73 == 0;
                          if (v92)
                            v93 = 1;
                          if (!v93)
                          {
                            objc_msgSend(v262, "coordinate");
                            v95 = v94;
                            v97 = v96;
                            objc_msgSend(v72, "coordinate");
                            v99 = v98;
                            v101 = v100;
                            v368.latitude = v95;
                            v368.longitude = v97;
                            if (CLLocationCoordinate2DIsValid(v368))
                            {
                              v369.latitude = v99;
                              v369.longitude = v101;
                              if (CLLocationCoordinate2DIsValid(v369))
                              {
                                objc_msgSend(v73, "label");
                                v91 = (void *)objc_claimAutoreleasedReturnValue();
                                +[PGMatchingCommonLocation matchingCommonLocationWithLabel:coordinate:forAddressCoordinate:](PGMatchingCommonLocation, "matchingCommonLocationWithLabel:coordinate:forAddressCoordinate:", v91, v99, v101, v95, v97);
                                v102 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v261, "addObject:", v102);

                                v89 = oslog;
                                v88 = v66;
                                v86 = v67;
                                v87 = v68;
                                v90 = v275;
                                goto LABEL_88;
                              }
                            }
                          }
                        }
                      }
                      v89 = oslog;
                      v88 = v66;
                      v86 = v67;
                      v87 = v68;
                      goto LABEL_81;
                    }
LABEL_83:
                    ++v71;
                  }
                  while (v69 != v71);
                  v112 = objc_msgSend(v269, "countByEnumeratingWithState:objects:count:", &v309, v360, 16);
                  v69 = v112;
                  if (!v112)
                  {
LABEL_90:

                    break;
                  }
                }
              }
            }
            v256 = objc_msgSend(v253, "countByEnumeratingWithState:objects:count:", &v313, v361, 16);
          }
          while (v256);

          if (v66)
          {
            objc_msgSend(v266, "addObject:", v66);
            objc_msgSend(v273, "addObject:", oslog);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v68);
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v244, "addObject:", v113);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v67);
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v243, "addObject:", v114);

            v65 = objc_msgSend(v266, "count");
            continue;
          }
          break;
        }
        v253 = oslog;
LABEL_96:

LABEL_97:
        if (objc_msgSend(v266, "count"))
        {
          v307 = 0u;
          v308 = 0u;
          v305 = 0u;
          v306 = 0u;
          v115 = v244;
          v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v305, v359, 16);
          if (v116)
          {
            v117 = *(_QWORD *)v306;
            v118 = 0.0;
            do
            {
              for (n = 0; n != v116; ++n)
              {
                if (*(_QWORD *)v306 != v117)
                  objc_enumerationMutation(v115);
                objc_msgSend(*(id *)(*((_QWORD *)&v305 + 1) + 8 * n), "doubleValue");
                v118 = v118 + v120;
              }
              v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v305, v359, 16);
            }
            while (v116);
          }
          else
          {
            v118 = 0.0;
          }

          v303 = 0u;
          v304 = 0u;
          v301 = 0u;
          v302 = 0u;
          v122 = v243;
          v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v301, v358, 16);
          if (v123)
          {
            v124 = *(_QWORD *)v302;
            v125 = 0.0;
            do
            {
              for (ii = 0; ii != v123; ++ii)
              {
                if (*(_QWORD *)v302 != v124)
                  objc_enumerationMutation(v122);
                objc_msgSend(*(id *)(*((_QWORD *)&v301 + 1) + 8 * ii), "doubleValue");
                v125 = v125 + v127;
              }
              v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v301, v358, 16);
            }
            while (v123);
          }
          else
          {
            v125 = 0.0;
          }

          v299 = 0u;
          v300 = 0u;
          v297 = 0u;
          v298 = 0u;
          v128 = obj;
          v129 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v297, v357, 16);
          if (v129)
          {
            v130 = *(_QWORD *)v298;
            do
            {
              for (jj = 0; jj != v129; ++jj)
              {
                if (*(_QWORD *)v298 != v130)
                  objc_enumerationMutation(v128);
                v132 = *(void **)(*((_QWORD *)&v297 + 1) + 8 * jj);
                if ((objc_msgSend(v266, "containsObject:", v132) & 1) == 0)
                {
                  objc_msgSend(v266, "firstObject");
                  v133 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PGGraph _closestLocationNodeFromAddressNode:toAddressNode:](self, "_closestLocationNodeFromAddressNode:toAddressNode:", v132, v133);
                  v134 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v134)
                  {
                    objc_msgSend(v134, "label");
                    v135 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PGGraph _distanceForLocationLabel:](self, "_distanceForLocationLabel:", v135);
                    v137 = v136;

                  }
                  else
                  {
                    v137 = 1.0;
                  }
                  if (objc_msgSend(v261, "count"))
                  {
                    objc_msgSend(v261, "firstObject");
                    v138 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v138, "label");
                    v139 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PGGraph _distanceForLocationLabel:](self, "_distanceForLocationLabel:", v139);
                    v141 = v140;

                  }
                  else
                  {
                    v141 = 0.0;
                  }
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v132, "identifier"));
                  v142 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v264, "objectForKeyedSubscript:", v142);
                  v143 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v143, "doubleValue");
                  v145 = v144;
                  if (v137 - v141 >= 0.0)
                    v146 = v137 - v141;
                  else
                    v146 = -(v137 - v141);

                  v125 = v125 + v146 * v145;
                }
              }
              v129 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v297, v357, 16);
            }
            while (v129);
          }

          v295 = 0u;
          v296 = 0u;
          v293 = 0u;
          v294 = 0u;
          v147 = v252;
          v148 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v293, v356, 16);
          if (v148)
          {
            v149 = *(_QWORD *)v294;
            do
            {
              for (kk = 0; kk != v148; ++kk)
              {
                if (*(_QWORD *)v294 != v149)
                  objc_enumerationMutation(v147);
                v151 = *(void **)(*((_QWORD *)&v293 + 1) + 8 * kk);
                if ((objc_msgSend(v273, "containsObject:", v151) & 1) == 0)
                {
                  objc_msgSend(v273, "firstObject");
                  v152 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PGGraph _closestLocationNodeFromAddressNode:toAddressNode:](self, "_closestLocationNodeFromAddressNode:toAddressNode:", v151, v152);
                  v153 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v153)
                  {
                    objc_msgSend(v153, "label");
                    v154 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PGGraph _distanceForLocationLabel:](self, "_distanceForLocationLabel:", v154);
                    v156 = v155;

                  }
                  else
                  {
                    v156 = 1.0;
                  }
                  if (objc_msgSend(v261, "count"))
                  {
                    objc_msgSend(v261, "firstObject");
                    v157 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v157, "label");
                    v158 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PGGraph _distanceForLocationLabel:](self, "_distanceForLocationLabel:", v158);
                    v160 = v159;

                  }
                  else
                  {
                    v160 = 0.0;
                  }
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v151, "identifier"));
                  v161 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v263, "objectForKeyedSubscript:", v161);
                  v162 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v162, "doubleValue");
                  v164 = v163;
                  if (v156 - v160 >= 0.0)
                    v165 = v156 - v160;
                  else
                    v165 = -(v156 - v160);

                  v125 = v125 + v165 * v164;
                }
              }
              v148 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v293, v356, 16);
            }
            while (v148);
          }

          -[PGGraph bestFittingAreaNodeFromAreaNodes:](self, "bestFittingAreaNodeFromAreaNodes:", v275);
          osloga = objc_claimAutoreleasedReturnValue();
          v166 = [PGGraphMatchingResult alloc];
          objc_msgSend(v247, "relatableEvent");
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          v168 = -[PGGraphMatchingResult initWithEvent:](v166, "initWithEvent:", v167);

          v55 = 1.0;
          -[PGGraphMatchingResult setScore:](v168, "setScore:", 1.0 - ((v125 + 1.0) / (v125 + 1.0 + v118 - v125) + -1.0) / v125);
          if (osloga)
          {
            v169 = (void *)MEMORY[0x1E0C99E60];
            objc_msgSend(v273, "firstObject");
            v170 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v169, "setWithObjects:", v170, osloga, 0);
            v171 = (void *)objc_claimAutoreleasedReturnValue();
            v172 = 12;
          }
          else
          {
            if (objc_msgSend(v261, "count"))
            {
              objc_msgSend(v261, "firstObject");
              v173 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v173, "label");
              v174 = (void *)objc_claimAutoreleasedReturnValue();
              v175 = +[PGGraphMatchingContextItem criteriaForLocationLabel:](PGGraphMatchingContextItem, "criteriaForLocationLabel:", v174);
            }
            else
            {
              +[PGLogging sharedLogging](PGLogging, "sharedLogging");
              v176 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v176, "loggingConnection");
              v177 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR))
              {
                LOWORD(buf) = 0;
                _os_log_error_impl(&dword_1CA237000, v177, OS_LOG_TYPE_ERROR, "Best common locations count is 0", (uint8_t *)&buf, 2u);
              }

              objc_msgSend(v266, "firstObject");
              v178 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v273, "firstObject");
              v179 = (void *)objc_claimAutoreleasedReturnValue();
              -[PGGraph _closestLocationNodeFromAddressNode:toAddressNode:](self, "_closestLocationNodeFromAddressNode:toAddressNode:", v178, v179);
              v173 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v173, "label");
              v174 = (void *)objc_claimAutoreleasedReturnValue();
              v175 = +[PGGraphMatchingContextItem criteriaForLocationLabel:](PGGraphMatchingContextItem, "criteriaForLocationLabel:", v174);
            }
            v172 = v175;

            v180 = (void *)MEMORY[0x1E0C99E60];
            objc_msgSend(v273, "firstObject");
            v170 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v180, "setWithObject:", v170);
            v171 = (void *)objc_claimAutoreleasedReturnValue();
          }

          v181 = [PGGraphMatchingContextItem alloc];
          -[PGGraphMatchingResult score](v168, "score");
          v182 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v181, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 4, v172, v235, v247, v171);
          -[PGGraphMatchingResult setContextItem:forRelatedType:](v168, "setContextItem:forRelatedType:", v182, 4);
          if (objc_msgSend(v234, "needsKeywords")
            && objc_msgSend(v247, "isSameNodeAsNode:", v237))
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v183 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v266, "count"))
            {
              v184 = 0;
              do
              {
                objc_msgSend(v266, "objectAtIndexedSubscript:", v184);
                v185 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v273, "objectAtIndexedSubscript:", v184);
                v186 = (void *)objc_claimAutoreleasedReturnValue();
                -[PGGraph _commonAreaNodesBetweenAddressNode:andAddressNode:](self, "_commonAreaNodesBetweenAddressNode:andAddressNode:", v185, v186);
                v187 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v187, "count"))
                {
                  objc_msgSend(v187, "array");
                  v188 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v188, "valueForKey:", CFSTR("keywordDescription"));
                  v189 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v183, "addObjectsFromArray:", v189);

                }
                objc_msgSend(v266, "objectAtIndexedSubscript:", v184);
                v190 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v273, "objectAtIndexedSubscript:", v184);
                v191 = (void *)objc_claimAutoreleasedReturnValue();
                -[PGGraph _closestLocationNodeFromAddressNode:toAddressNode:](self, "_closestLocationNodeFromAddressNode:toAddressNode:", v190, v191);
                v192 = (void *)objc_claimAutoreleasedReturnValue();

                if (v192)
                {
                  objc_msgSend(v192, "keywordDescription");
                  v193 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v183, "addObject:", v193);

                }
                ++v184;
              }
              while (v184 < objc_msgSend(v266, "count"));
            }
            -[PGGraphMatchingResult addKeywords:forRelatedType:](v168, "addKeywords:forRelatedType:", v183, 4);

          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v247, "identifier"));
          v194 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v242, "setObject:forKey:", v168, v194);
          if (objc_msgSend(v261, "count"))
          {
            objc_msgSend(v261, "firstObject");
            v195 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v195, "label");
            v196 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v238, "objectForKeyedSubscript:", v196);
            v197 = (void *)objc_claimAutoreleasedReturnValue();
            v198 = v197 == 0;

            if (!v198)
            {
              v291 = 0u;
              v292 = 0u;
              v289 = 0u;
              v290 = 0u;
              v199 = v261;
              v200 = objc_msgSend(v199, "countByEnumeratingWithState:objects:count:", &v289, v355, 16);
              if (v200)
              {
                v201 = 0;
                v202 = *(_QWORD *)v290;
                v203 = 1.79769313e308;
                do
                {
                  for (mm = 0; mm != v200; ++mm)
                  {
                    if (*(_QWORD *)v290 != v202)
                      objc_enumerationMutation(v199);
                    v205 = *(void **)(*((_QWORD *)&v289 + 1) + 8 * mm);
                    objc_msgSend(v205, "distanceBetweenCoordinates");
                    v207 = v206;
                    if (v206 < v203)
                    {
                      v208 = v205;

                      v201 = v208;
                      v203 = v207;
                    }
                  }
                  v200 = objc_msgSend(v199, "countByEnumeratingWithState:objects:count:", &v289, v355, 16);
                }
                while (v200);

                if (v201)
                {
                  objc_msgSend(v201, "label");
                  v209 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v238, "objectForKeyedSubscript:", v209);
                  v210 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v210, "addObject:", v194);

                  objc_msgSend(v240, "setObject:forKey:", v201, v194);
                  goto LABEL_186;
                }
              }
              else
              {
                v201 = v199;
LABEL_186:

              }
            }
          }

        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "loggingConnection");
          osloga = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(osloga, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_error_impl(&dword_1CA237000, osloga, OS_LOG_TYPE_ERROR, "Inconsistency in Graph: common location found in query but not common", (uint8_t *)&buf, 2u);
          }
        }

        v56 = v239 + 1;
      }
      while (v239 + 1 != v245);
      v245 = objc_msgSend(v241, "countByEnumeratingWithState:objects:count:", &v321, v362, 16);
    }
    while (v245);
  }

  if (v237)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v237, "identifier"));
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "objectForKeyedSubscript:", v211);
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    v213 = v212 == 0;

    if (!v213)
    {
      objc_msgSend(v240, "objectForKeyedSubscript:", v211);
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v214, "label");
      v215 = (void *)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v353 = 0x2020000000;
      v354 = 0x7FEFFFFFFFFFFFFFLL;
      v281 = 0;
      v282 = (double *)&v281;
      v283 = 0x2020000000;
      v284 = 0;
      objc_msgSend(v238, "objectForKeyedSubscript:", v215);
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      v277[0] = MEMORY[0x1E0C809B0];
      v277[1] = 3221225472;
      v277[2] = __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_4_323;
      v277[3] = &unk_1E84305F8;
      v217 = v240;
      v278 = v217;
      v279 = &v281;
      p_buf = &buf;
      objc_msgSend(v216, "enumerateObjectsUsingBlock:", v277);

      if (v282[3] != *(double *)(*((_QWORD *)&buf + 1) + 24))
      {
        objc_msgSend(v217, "objectForKeyedSubscript:", v211);
        v218 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v218, "distanceBetweenCoordinates");
        v220 = v219;

        objc_msgSend(v242, "objectForKeyedSubscript:", v211);
        v221 = (void *)objc_claimAutoreleasedReturnValue();
        v222 = *(double *)(*((_QWORD *)&buf + 1) + 24);
        v223 = v282[3];
        objc_msgSend(v221, "score");
        objc_msgSend(v221, "setScore:", v224 - ((v220 - v222) / (v223 - v222) * 0.02 + -0.01));
        objc_msgSend(v221, "contextItemForRelatedType:", 4);
        v225 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v221, "score");
        objc_msgSend(v225, "setScore:");

      }
      _Block_object_dispose(&v281, 8);
      _Block_object_dispose(&buf, 8);

    }
    objc_msgSend(v242, "objectForKeyedSubscript:", v211);
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    v227 = v226 == 0;

    if (v227)
    {
      v229 = 0;
    }
    else
    {
      v350 = v211;
      objc_msgSend(v242, "objectForKeyedSubscript:", v211);
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      v351 = v228;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v351, &v350, 1);
      v229 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v285[0] = MEMORY[0x1E0C809B0];
    v285[1] = 3221225472;
    v285[2] = __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_318;
    v285[3] = &unk_1E8430648;
    v286 = v240;
    v230 = v242;
    v287 = v230;
    v288 = 4;
    objc_msgSend(v238, "enumerateKeysAndObjectsUsingBlock:", v285);
    v229 = v230;

    v211 = v286;
  }

  v231 = v229;
  return v231;
}

- (id)_eventMatchingIdsToScoresFromEvent:(id)a3 options:(id)a4
{
  return -[PGGraph _coreEventMatchingFromEvent:toEvent:options:](self, "_coreEventMatchingFromEvent:toEvent:options:", a3, 0, a4);
}

- (id)_eventMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v8 = a4;
  -[PGGraph _coreEventMatchingFromEvent:toEvent:options:](self, "_coreEventMatchingFromEvent:toEvent:options:", a3, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = objc_msgSend(v8, "identifier");

  objc_msgSend(v10, "numberWithUnsignedInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_coreEventMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  PGGraphMatchingResult *v23;
  void *v24;
  PGGraphMatchingResult *v25;
  void *v26;
  PGGraphMatchingContextItem *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  PGGraphMatchingResult *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  id v51;
  int v52;
  id v53;
  id obj;
  void *v55;
  PGGraphMatchingResult *v56;
  void *v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  PGGraphMatchingContextItem *v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  char v68;
  __int128 v69;
  __int128 v70;
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
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v53 = a4;
  v59 = a5;
  v52 = objc_msgSend(v59, "needsKeywords");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  objc_msgSend(v8, "celebratedHolidayNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v78;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v78 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * v14), "collection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "celebratingMomentNodes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "temporarySet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[PGGraph _eventsFromEvents:withTargetDomain:](self, "_eventsFromEvents:withTargetDomain:", v17, objc_msgSend(v59, "targetEventDomain"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "unionSet:", v18);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
    }
    while (v12);
  }

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v9;
  v19 = v53;
  v20 = v52;
  v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
  if (v60)
  {
    v58 = *(_QWORD *)v74;
    v51 = v8;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v74 != v58)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v21);
        if (!v19 || objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * v21), "isSameNodeAsNode:", v19))
        {
          v23 = [PGGraphMatchingResult alloc];
          objc_msgSend(v22, "relatableEvent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[PGGraphMatchingResult initWithEvent:](v23, "initWithEvent:", v24);

          -[PGGraphMatchingResult setScore:](v25, "setScore:", 0.9);
          objc_msgSend(v22, "dateNodes");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = [PGGraphMatchingContextItem alloc];
          -[PGGraphMatchingResult score](v25, "score");
          v61 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v27, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", 8, 4, v8, v22, v26);
          -[PGGraphMatchingResult setContextItem:forRelatedType:](v25, "setContextItem:forRelatedType:");
          if (v20)
          {
            v56 = v25;
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = 0u;
            v70 = 0u;
            v71 = 0u;
            v72 = 0u;
            v55 = v26;
            v29 = v26;
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
            if (v30)
            {
              v31 = v30;
              v32 = *(_QWORD *)v70;
              do
              {
                v33 = 0;
                do
                {
                  if (*(_QWORD *)v70 != v32)
                    objc_enumerationMutation(v29);
                  v34 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * v33), "keywordDescription");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "stringWithFormat:", CFSTR("%@ - Celebrated Holiday Date"), v35);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "addObject:", v36);

                  ++v33;
                }
                while (v31 != v33);
                v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
              }
              while (v31);
            }

            v25 = v56;
            -[PGGraphMatchingResult addKeywords:forRelatedType:](v56, "addKeywords:forRelatedType:", v28, 8);

            v8 = v51;
            v19 = v53;
            v20 = v52;
            v26 = v55;
          }
          v37 = (void *)MEMORY[0x1E0CB37E8];
          -[PGGraphMatchingResult event](v25, "event");
          v38 = v25;
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "numberWithUnsignedInteger:", objc_msgSend(v39, "identifier"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setObject:forKey:", v38, v40);

        }
        ++v21;
      }
      while (v21 != v60);
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    }
    while (v60);
  }

  objc_msgSend(v8, "eventCollection");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "eventMomentNodes");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __65__PGGraph_Matching___coreEventMatchingFromEvent_toEvent_options___block_invoke;
  v62[3] = &unk_1E8430698;
  v63 = v59;
  v64 = v19;
  v43 = v57;
  v66 = v8;
  v67 = 8;
  v65 = v43;
  v68 = v20;
  v44 = v8;
  v45 = v19;
  v46 = v59;
  objc_msgSend(v42, "enumerateNodesUsingBlock:", v62);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v44, "identifier"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "removeObjectForKey:", v47);

  v48 = v66;
  v49 = v43;

  return v49;
}

- (id)_placeMatchingIdsToScoresFromEvent:(id)a3 options:(id)a4
{
  return -[PGGraph _corePlaceMatchingIdsToScoresFromEvent:toEvent:options:](self, "_corePlaceMatchingIdsToScoresFromEvent:toEvent:options:", a3, 0, a4);
}

- (id)_placeMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v8 = a4;
  -[PGGraph _corePlaceMatchingIdsToScoresFromEvent:toEvent:options:](self, "_corePlaceMatchingIdsToScoresFromEvent:toEvent:options:", a3, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = objc_msgSend(v8, "identifier");

  objc_msgSend(v10, "numberWithUnsignedInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_corePlaceMatchingIdsToScoresFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  char v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v33;
  id v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD *v42;
  __int128 v43;
  char v44;
  _QWORD v45[4];
  id v46;
  id v47;
  PGGraph *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  _QWORD *v53;
  _QWORD v54[4];
  _QWORD v55[4];

  v55[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v34 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 501);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 502);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "eventCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "eventMomentNodes");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  v54[3] = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __76__PGGraph_Matching___corePlaceMatchingIdsToScoresFromEvent_toEvent_options___block_invoke;
  v45[3] = &unk_1E8430710;
  v18 = v8;
  v46 = v18;
  v19 = v13;
  v53 = v54;
  v47 = v19;
  v48 = self;
  v20 = v9;
  v49 = v20;
  v21 = v15;
  v50 = v21;
  v22 = v16;
  v51 = v22;
  v23 = v10;
  v52 = v23;
  objc_msgSend(v35, "enumerateNodesUsingBlock:", v45);
  v24 = objc_msgSend(v20, "needsKeywords");
  v36[0] = v17;
  v36[1] = 3221225472;
  v36[2] = __76__PGGraph_Matching___corePlaceMatchingIdsToScoresFromEvent_toEvent_options___block_invoke_4;
  v36[3] = &unk_1E8430738;
  v36[4] = self;
  v42 = v54;
  v25 = v22;
  v37 = v25;
  v26 = v23;
  v38 = v26;
  v43 = xmmword_1CA8EDA40;
  v27 = v18;
  v39 = v27;
  v44 = v24;
  v28 = v34;
  v40 = v28;
  v29 = v33;
  v41 = v29;
  objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v36);
  v30 = v41;
  v31 = v29;

  _Block_object_dispose(v54, 8);
  return v31;
}

- (id)_sceneMatchingIdsToScoresFromEvent:(id)a3 options:(id)a4
{
  return -[PGGraph _coreSceneMatchingFromEvent:toEvent:options:](self, "_coreSceneMatchingFromEvent:toEvent:options:", a3, 0, a4);
}

- (id)_sceneMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v8 = a4;
  -[PGGraph _coreSceneMatchingFromEvent:toEvent:options:](self, "_coreSceneMatchingFromEvent:toEvent:options:", a3, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = objc_msgSend(v8, "identifier");

  objc_msgSend(v10, "numberWithUnsignedInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_coreSceneMatchingFromEvent:(id)a3 toEvent:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD *v43;
  __int128 v44;
  char v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  _QWORD *v53;
  _QWORD v54[5];

  v8 = a3;
  v35 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend((id)objc_opt_class(), "matchingBlockedSceneLabels");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = objc_claimAutoreleasedReturnValue();

  v33 = (void *)v13;
  -[PGGraph sceneNodesForSceneNames:](self, "sceneNodesForSceneNames:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "eventCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "eventMomentNodes");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  v54[3] = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __65__PGGraph_Matching___coreSceneMatchingFromEvent_toEvent_options___block_invoke;
  v46[3] = &unk_1E84307B0;
  v19 = v8;
  v47 = v19;
  v20 = v14;
  v48 = v20;
  v53 = v54;
  v21 = v9;
  v49 = v21;
  v22 = v16;
  v50 = v22;
  v23 = v17;
  v51 = v23;
  v24 = v10;
  v52 = v24;
  objc_msgSend(v36, "enumerateNodesUsingBlock:", v46);
  LOBYTE(v15) = objc_msgSend(v21, "needsKeywords");
  v37[0] = v18;
  v37[1] = 3221225472;
  v37[2] = __65__PGGraph_Matching___coreSceneMatchingFromEvent_toEvent_options___block_invoke_4;
  v37[3] = &unk_1E8430738;
  v37[4] = self;
  v43 = v54;
  v25 = v23;
  v38 = v25;
  v26 = v24;
  v39 = v26;
  v44 = xmmword_1CA8EDA50;
  v27 = v19;
  v40 = v27;
  v45 = (char)v15;
  v28 = v35;
  v41 = v28;
  v29 = v34;
  v42 = v29;
  objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v37);
  v30 = v42;
  v31 = v29;

  _Block_object_dispose(v54, 8);
  return v31;
}

- (double)_scoreForPlaceSubDomain:(unsigned __int16)a3
{
  int v3;
  void *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3 == 501)
    return 1.0;
  v3 = a3;
  if (a3 == 502)
    return 0.9;
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loggingConnection");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_error_impl(&dword_1CA237000, v6, OS_LOG_TYPE_ERROR, "Error: unknown category domain '%d'", (uint8_t *)v7, 8u);
  }

  return 0.0;
}

- (double)relationshipScoreForPersonNode:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  char v12;
  double v13;
  char v14;
  char v15;
  char v16;
  char v17;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGGraph meNode](self, "meNode");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v4;
  objc_msgSend(v19, "edgesTowardNode:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "label");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("VIP"));
        v13 = 1.0;
        if ((v12 & 1) == 0)
        {
          v14 = objc_msgSend(v11, "isEqualToString:", CFSTR("PARTNER"), 1.0);
          v13 = 0.9;
          if ((v14 & 1) == 0)
          {
            v15 = objc_msgSend(v11, "isEqualToString:", CFSTR("FAMILY"), 0.9);
            v13 = 0.8;
            if ((v15 & 1) == 0)
            {
              v16 = objc_msgSend(v11, "isEqualToString:", CFSTR("FRIEND"), 0.8);
              v13 = 0.7;
              if ((v16 & 1) == 0)
              {
                v17 = objc_msgSend(v11, "isEqualToString:", CFSTR("COWORKER"), 0.7);
                v13 = 0.4;
                if ((v17 & 1) == 0)
                {
                  if (objc_msgSend(v11, "isEqualToString:", CFSTR("ACQUAINTANCE"), 0.4))
                    v13 = 0.3;
                  else
                    v13 = 0.0;
                }
              }
            }
          }
        }
        if (v13 > v9)
          v9 = v13;

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (double)_distanceForLocationLabel:(id)a3
{
  id v3;
  double v4;
  void *v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = 0.0;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Address")) & 1) == 0)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Number")) & 1) != 0)
    {
      v4 = 0.01;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Street")) & 1) != 0)
    {
      v4 = 0.1;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("District")) & 1) != 0)
    {
      v4 = 0.3;
    }
    else
    {
      v4 = 0.5;
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("City")) & 1) == 0)
      {
        if ((objc_msgSend(v3, "isEqualToString:", CFSTR("County")) & 1) != 0)
        {
          v4 = 0.8;
        }
        else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("State")) & 1) != 0)
        {
          v4 = 0.9;
        }
        else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Country")) & 1) != 0)
        {
          v4 = 0.95;
        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "loggingConnection");
          v6 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            v8 = 138412290;
            v9 = v3;
            _os_log_error_impl(&dword_1CA237000, v6, OS_LOG_TYPE_ERROR, "Error: unknown location label '%@'", (uint8_t *)&v8, 0xCu);
          }

          v4 = 1.0;
        }
      }
    }
  }

  return v4;
}

- (id)_firstLocationNodeFromAddressNode:(id)a3 inLocationNodes:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "containsNode:", v5))
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v5, "collection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "parentLocationNodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      while ((objc_msgSend(v6, "intersectsCollection:", v9) & 1) == 0)
      {
        objc_msgSend(v9, "parentLocationNodes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = v10;
        if (!objc_msgSend(v10, "count"))
          goto LABEL_8;
      }
    }
    v10 = v9;
LABEL_8:
    objc_msgSend(v10, "anyNode");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_closestLocationNodeFromAddressNode:(id)a3 toAddressNode:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  int v18;
  void *v19;
  uint64_t *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  double v30;
  void *v31;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD v40[5];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "isSameNodeAsNode:", v7))
  {
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__49738;
    v45 = __Block_byref_object_dispose__49739;
    v9 = MEMORY[0x1E0C809B0];
    v46 = 0;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __71__PGGraph_Matching___closestLocationNodeFromAddressNode_toAddressNode___block_invoke;
    v40[3] = &unk_1E84307D8;
    v40[4] = &v41;
    objc_msgSend(v6, "enumerateNeighborNodesThroughOutEdgesUsingBlock:", v40);
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__49738;
    v38 = __Block_byref_object_dispose__49739;
    v39 = 0;
    v33[0] = v9;
    v33[1] = 3221225472;
    v33[2] = __71__PGGraph_Matching___closestLocationNodeFromAddressNode_toAddressNode___block_invoke_2;
    v33[3] = &unk_1E84307D8;
    v33[4] = &v34;
    objc_msgSend(v7, "enumerateNeighborNodesThroughOutEdgesUsingBlock:", v33);
    if (objc_msgSend((id)v42[5], "isSameNodeAsNode:", v35[5]))
    {
      v10 = v35;
    }
    else
    {
      v11 = (void *)v42[5];
      v10 = v35;
      if (v11 && v35[5])
      {
        objc_msgSend(v11, "label");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGGraph _distanceForLocationLabel:](self, "_distanceForLocationLabel:", v12);
        v14 = v13;

        objc_msgSend((id)v35[5], "label");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGGraph _distanceForLocationLabel:](self, "_distanceForLocationLabel:", v15);
        v17 = v16;
        while (1)
        {

          v18 = objc_msgSend((id)v42[5], "isSameNodeAsNode:", v35[5]);
          v19 = (void *)v42[5];
          if (v18)
            break;
          v20 = v35;
          if (!v19 || !v35[5])
            goto LABEL_18;
          if (v14 <= v17)
          {
            objc_msgSend(v19, "locationNodeCollection");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "parentLocationNodes");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "anyNode");
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = (void *)v42[5];
            v42[5] = v28;

            objc_msgSend((id)v42[5], "label");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[PGGraph _distanceForLocationLabel:](self, "_distanceForLocationLabel:", v15);
            v14 = v30;
          }
          else
          {
            objc_msgSend((id)v35[5], "locationNodeCollection");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "parentLocationNodes");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "anyNode");
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = (void *)v35[5];
            v35[5] = v23;

            objc_msgSend((id)v35[5], "label");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[PGGraph _distanceForLocationLabel:](self, "_distanceForLocationLabel:", v15);
            v17 = v25;
          }
        }
        v20 = v35;
LABEL_18:
        if (!objc_msgSend(v19, "isSameNodeAsNode:", v20[5]))
        {
          v8 = 0;
          goto LABEL_21;
        }
        goto LABEL_19;
      }
    }
    if (!v10[5] || (objc_msgSend((id)v42[5], "isSameNodeAsNode:") & 1) == 0)
    {
      v31 = 0;
LABEL_20:
      v8 = v31;
LABEL_21:
      _Block_object_dispose(&v34, 8);

      _Block_object_dispose(&v41, 8);
      goto LABEL_22;
    }
LABEL_19:
    v31 = (void *)v42[5];
    goto LABEL_20;
  }
  v8 = v6;
LABEL_22:

  return v8;
}

- (id)_commonAreaNodesBetweenAddressNode:(id)a3 andAddressNode:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a3, "collection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "areaNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraph _commonAreaNodesBetweenAddressAreaNodes:andAddressNode:](self, "_commonAreaNodesBetweenAddressAreaNodes:andAddressNode:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_commonAreaNodesBetweenAddressAreaNodes:(id)a3 andAddressNode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v6, "collection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "areaNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionByIntersecting:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (id)_eventsFromEvents:(id)a3 withTargetDomain:(unsigned __int16)a4
{
  int v4;
  id v5;
  void *v6;
  int v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  int v26;
  _BYTE v27[128];
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "domain");

  if (v7 == v4)
  {
    v8 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (v4 == 102)
          {
            objc_msgSend(v14, "connectedEventsWithTargetDomain:", 102, (_QWORD)v21);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "unionSet:", v15);
          }
          else
          {
            if (v4 != 100)
            {
              +[PGLogging sharedLogging](PGLogging, "sharedLogging");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "loggingConnection");
              v19 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                v26 = v4;
                _os_log_error_impl(&dword_1CA237000, v19, OS_LOG_TYPE_ERROR, "Unsupported target domain: %hu", buf, 8u);
              }

              goto LABEL_18;
            }
            objc_msgSend(v14, "eventCollection");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "eventMomentNodes");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "temporarySet");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "unionSet:", v17);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_18:

  }
  return v8;
}

- (BOOL)exportMatchMomentEventResults:(id)a3 relatedType:(unint64_t)a4 focusOnNodes:(id)a5 toFileURL:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v36;
  void *v37;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v39 = a6;
  v12 = a3;
  -[PGGraph _checkCanRead](self, "_checkCanRead");
  +[PGGraphMatchingOptions optionsWithRelatedType:](PGGraphMatchingOptions, "optionsWithRelatedType:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFocusedNodes:", v11);
  objc_msgSend((id)objc_opt_class(), "defaultMatchingSortDescriptors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSortDescriptors:", v14);

  -[PGGraph matchEvent:options:](self, "matchEvent:options:", v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __92__PGGraph_Matching__exportMatchMomentEventResults_relatedType_focusOnNodes_toFileURL_error___block_invoke;
  v40[3] = &unk_1E8430840;
  v19 = v17;
  v41 = v19;
  v20 = v18;
  v42 = v20;
  v37 = v15;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v40);
  v21 = (void *)MEMORY[0x1E0CB37E8];
  v22 = objc_msgSend(v12, "identifier");

  objc_msgSend(v21, "numberWithUnsignedInteger:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v23, CFSTR("reference_identifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v24, CFSTR("relatedType"));

  objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("related_identifier"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("results"));
  if (v11)
  {
    objc_msgSend(v11, "valueForKeyPath:", CFSTR("identifier"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v26, CFSTR("focusNodeIdentifiers"));

  }
  v27 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E48]), "initWithURL:append:", v39, 0);
  objc_msgSend(v28, "open");
  v29 = objc_msgSend(MEMORY[0x1E0CB38B0], "writePropertyList:toStream:format:options:error:", v16, v28, 100, 0, a7);
  if (v29)
  {
    objc_msgSend(v28, "close");
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "loggingConnection");
    v31 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v31, OS_LOG_TYPE_ERROR, "Export matching result done!", buf, 2u);
    }

    v32 = v39;
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "loggingConnection");
    v34 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v36 = *a7;
      *(_DWORD *)buf = 136315394;
      v44 = "-[PGGraph(Matching) exportMatchMomentEventResults:relatedType:focusOnNodes:toFileURL:error:]";
      v45 = 2112;
      v46 = v36;
      _os_log_error_impl(&dword_1CA237000, v34, OS_LOG_TYPE_ERROR, "%s - %@", buf, 0x16u);
    }

    objc_msgSend(v28, "close");
    v32 = v39;
    objc_msgSend(v27, "removeItemAtURL:error:", v39, 0);
  }

  return v29 != 0;
}

void __92__PGGraph_Matching__exportMatchMomentEventResults_relatedType_focusOnNodes_toFileURL_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
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
  id v17;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(v5, "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v6, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "event");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v9, "identifier"));
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "event");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("eventIdentifier"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "score");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("score"));

  objc_msgSend(v5, "debugDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("debugDescription"));
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v17);

}

void __71__PGGraph_Matching___closestLocationNodeFromAddressNode_toAddressNode___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "domain") == 200)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __71__PGGraph_Matching___closestLocationNodeFromAddressNode_toAddressNode___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "domain") == 200)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __65__PGGraph_Matching___coreSceneMatchingFromEvent_toEvent_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t v21;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "relatableEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "weightForMoment:", v4);
  v7 = v6;

  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__PGGraph_Matching___coreSceneMatchingFromEvent_toEvent_options___block_invoke_2;
  v18[3] = &unk_1E8430760;
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 80);
  v19 = v9;
  v20 = v10;
  v21 = v7;
  objc_msgSend(v4, "enumerateSceneEdgesAndNodesUsingBlock:", v18);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __65__PGGraph_Matching___coreSceneMatchingFromEvent_toEvent_options___block_invoke_3;
  v11[3] = &unk_1E8430788;
  v12 = *(id *)(a1 + 40);
  v17 = v7;
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 64);
  v16 = *(id *)(a1 + 72);
  objc_msgSend(v4, "enumerateSiblingNodesThroughEdgesWithLabel:domain:usingBlock:", 0, 600, v11);

}

void __65__PGGraph_Matching___coreSceneMatchingFromEvent_toEvent_options___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  PGGraphMatchingResult *v15;
  PGGraphMatchingContextItem *v16;
  uint64_t v17;
  PGGraphMatchingContextItem *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "nodeForIdentifier:", objc_msgSend(v5, "unsignedIntegerValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v8 + v10;
  objc_msgSend(v6, "doubleValue");
  v13 = 1.0 - ((v11 + 1.0) / (v11 + 1.0 + v12 - v11) + -1.0) / v11;

  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PGGraphMatchingResult initWithEvent:]([PGGraphMatchingResult alloc], "initWithEvent:", v7);
  -[PGGraphMatchingResult setScore:](v15, "setScore:", v13);
  v16 = [PGGraphMatchingContextItem alloc];
  v17 = *(_QWORD *)(a1 + 88);
  -[PGGraphMatchingResult score](v15, "score");
  v18 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v16, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", v17, *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 56), v7, v14);
  -[PGGraphMatchingResult setContextItem:forRelatedType:](v15, "setContextItem:forRelatedType:", v18, *(_QWORD *)(a1 + 88));
  if (*(_BYTE *)(a1 + 104) && objc_msgSend(v7, "isSameNodeAsNode:", *(_QWORD *)(a1 + 64)))
  {
    v27 = v7;
    v28 = v6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v26 = v14;
    v20 = v14;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "keywordDescription");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v22);
    }

    -[PGGraphMatchingResult addKeywords:forRelatedType:](v15, "addKeywords:forRelatedType:", v19, *(_QWORD *)(a1 + 88));
    v7 = v27;
    v6 = v28;
    v14 = v26;
  }
  objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:", v15, v5);

}

void __65__PGGraph_Matching___coreSceneMatchingFromEvent_toEvent_options___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  id v6;

  v6 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsNode:", a3) & 1) == 0)
  {
    objc_msgSend(v6, "confidence");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24)
                                                                + v5 * *(double *)(a1 + 48);
  }

}

void __65__PGGraph_Matching___coreSceneMatchingFromEvent_toEvent_options___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  double v21;
  double v22;
  id v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  id *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id obj;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v42 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsNode:", v10) & 1) == 0)
  {
    v40 = v11;
    objc_msgSend(v11, "confidence");
    v13 = v12;
    v14 = *(double *)(a1 + 72);
    objc_msgSend(v9, "connectedEventsWithTargetDomain:", objc_msgSend(*(id *)(a1 + 40), "targetEventDomain"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v15)
    {
      v16 = v15;
      v17 = v13 * v14;
      v18 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v44 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v42, "confidence");
          v22 = v21;
          v23 = v9;
          objc_msgSend(v20, "weightForMoment:", v9);
          v25 = v22 * v24;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v20, "identifier"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "doubleValue");
            v30 = v17 + v25 + v29;

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v31, v26);

            objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v26);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "doubleValue");
            v34 = v25 + v33;

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = (id *)(a1 + 56);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17 + v25);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v37, v26);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v38, v26);

            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = (id *)(a1 + 64);
          }
          objc_msgSend(*v36, "setObject:forKeyedSubscript:", v35, v26);

          objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v26);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v10);

          v9 = v23;
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v16);
    }

    v11 = v40;
  }

}

void __76__PGGraph_Matching___corePlaceMatchingIdsToScoresFromEvent_toEvent_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[7];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "relatableEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "weightForMoment:", v4);
  v7 = v6;

  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __76__PGGraph_Matching___corePlaceMatchingIdsToScoresFromEvent_toEvent_options___block_invoke_2;
  v18[3] = &unk_1E84306C0;
  v9 = *(_QWORD *)(a1 + 88);
  v10 = *(_QWORD *)(a1 + 40);
  v18[4] = *(_QWORD *)(a1 + 48);
  v18[5] = v9;
  v18[6] = v7;
  objc_msgSend(v4, "enumerateNeighborEdgesAndNodesThroughEdgesWithDomains:usingBlock:", v10, v18);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __76__PGGraph_Matching___corePlaceMatchingIdsToScoresFromEvent_toEvent_options___block_invoke_3;
  v12[3] = &unk_1E84306E8;
  v17 = v7;
  v11 = *(_QWORD *)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 64);
  v15 = *(id *)(a1 + 72);
  v16 = *(id *)(a1 + 80);
  objc_msgSend(v4, "enumerateSiblingNodesThroughEdgesWithDomains:usingBlock:", v11, v12);

}

void __76__PGGraph_Matching___corePlaceMatchingIdsToScoresFromEvent_toEvent_options___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  PGGraphMatchingResult *v15;
  PGGraphMatchingContextItem *v16;
  uint64_t v17;
  PGGraphMatchingContextItem *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "nodeForIdentifier:", objc_msgSend(v5, "unsignedIntegerValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v8 + v10;
  objc_msgSend(v6, "doubleValue");
  v13 = 1.0 - ((v11 + 1.0) / (v11 + 1.0 + v12 - v11) + -1.0) / v11;

  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PGGraphMatchingResult initWithEvent:]([PGGraphMatchingResult alloc], "initWithEvent:", v7);
  -[PGGraphMatchingResult setScore:](v15, "setScore:", v13);
  v16 = [PGGraphMatchingContextItem alloc];
  v17 = *(_QWORD *)(a1 + 88);
  -[PGGraphMatchingResult score](v15, "score");
  v18 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v16, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", v17, *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 56), v7, v14);
  -[PGGraphMatchingResult setContextItem:forRelatedType:](v15, "setContextItem:forRelatedType:", v18, *(_QWORD *)(a1 + 88));
  if (*(_BYTE *)(a1 + 104) && objc_msgSend(v7, "isSameNodeAsNode:", *(_QWORD *)(a1 + 64)))
  {
    v27 = v7;
    v28 = v6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v26 = v14;
    v20 = v14;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "keywordDescription");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v22);
    }

    -[PGGraphMatchingResult addKeywords:forRelatedType:](v15, "addKeywords:forRelatedType:", v19, *(_QWORD *)(a1 + 88));
    v7 = v27;
    v6 = v28;
    v14 = v26;
  }
  objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:", v15, v5);

}

void __76__PGGraph_Matching___corePlaceMatchingIdsToScoresFromEvent_toEvent_options___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (objc_msgSend(v9, "domain") == 501 || (v6 = 0.0, objc_msgSend(v9, "domain") == 502))
  {
    objc_msgSend(v9, "confidence");
    v6 = v7;
  }
  objc_msgSend(*(id *)(a1 + 32), "_scoreForPlaceSubDomain:", objc_msgSend(v5, "domain"));
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + v6 * v8 * *(double *)(a1 + 48);

}

void __76__PGGraph_Matching___corePlaceMatchingIdsToScoresFromEvent_toEvent_options___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  id *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id obj;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v45 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v11, "domain") == 501 || (v12 = 0.0, objc_msgSend(v11, "domain") == 502))
  {
    objc_msgSend(v11, "confidence");
    v12 = v13;
  }
  v14 = *(double *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "_scoreForPlaceSubDomain:", objc_msgSend(v10, "domain", v11));
  v16 = v15;
  objc_msgSend(v45, "connectedEventsWithTargetDomain:", objc_msgSend(*(id *)(a1 + 40), "targetEventDomain"));
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v17)
  {
    v18 = v17;
    v19 = v12 * v14;
    v20 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v47 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        if (objc_msgSend(v9, "domain") == 501
          || (v23 = 0.0, objc_msgSend(v9, "domain") == 502))
        {
          objc_msgSend(v9, "confidence");
          v23 = v24;
        }
        objc_msgSend(v22, "weightForMoment:", v45);
        v26 = v23 * v25;
        v27 = v16 * (v19 + v26);
        v28 = v16 * v26;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "identifier"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "doubleValue");
          v33 = v27 + v32;

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v34, v29);

          objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v29);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "doubleValue");
          v37 = v28 + v36;

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (id *)(a1 + 56);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v40, v29);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v41, v29);

          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (id *)(a1 + 64);
        }
        objc_msgSend(*v39, "setObject:forKeyedSubscript:", v38, v29);

        objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v29);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addObject:", v10);

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v18);
  }

}

void __65__PGGraph_Matching___coreEventMatchingFromEvent_toEvent_options___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  char v13;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__PGGraph_Matching___coreEventMatchingFromEvent_toEvent_options___block_invoke_2;
  v7[3] = &unk_1E8430670;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v10 = v4;
  v12 = v5;
  v11 = v6;
  v13 = *(_BYTE *)(a1 + 72);
  objc_msgSend(a2, "enumerateSiblingNodesThroughEdgesWithLabel:domain:usingBlock:", 0, 301, v7);

}

void __65__PGGraph_Matching___coreEventMatchingFromEvent_toEvent_options___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  int v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  PGGraphMatchingResult *v29;
  PGGraphMatchingResult *v30;
  double v31;
  id v32;
  PGGraphMatchingContextItem *v33;
  uint64_t v34;
  double v35;
  double v36;
  uint64_t v37;
  void *v38;
  PGGraphMatchingContextItem *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  id obj;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v53 = a4;
  v49 = a5;
  objc_msgSend(v49, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BIRTHDAY")) & 1) != 0
    || (v12 = 0.0, objc_msgSend(v11, "isEqualToString:", CFSTR("ANNIVERSARY"))))
  {
    objc_msgSend(v49, "confidence");
    v12 = v13;
  }
  objc_msgSend(v10, "label");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("BIRTHDAY")) & 1) != 0
    || (v15 = 0.0, objc_msgSend(v14, "isEqualToString:", CFSTR("ANNIVERSARY"))))
  {
    objc_msgSend(v10, "confidence");
    v15 = v16;
  }
  v46 = v11;
  v47 = v10;
  v45 = v14;
  v17 = objc_msgSend(v11, "isEqualToString:", v14);
  v18 = v12 * v15;
  v19 = v12 * v15 * 0.5;
  v20 = 23;
  if (!v17)
    v20 = 24;
  v51 = v20;
  if (v17)
    v21 = v12 * v15;
  else
    v21 = v12 * v15 * 0.5;
  v48 = v9;
  objc_msgSend(v9, "connectedEventsWithTargetDomain:", objc_msgSend(*(id *)(a1 + 32), "targetEventDomain", v18, v19));
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v56;
    v25 = 0x1E0CB3000uLL;
    v50 = *(_QWORD *)v56;
LABEL_14:
    v26 = 0;
    v52 = v23;
    while (1)
    {
      if (*(_QWORD *)v56 != v24)
        objc_enumerationMutation(obj);
      v27 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v26);
      if (*(_QWORD *)(a1 + 40))
      {
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * v26), "isSameNodeAsNode:"))
          break;
      }
      objc_msgSend(*(id *)(v25 + 2024), "numberWithUnsignedInteger:", objc_msgSend(v27, "identifier"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v28);
      v29 = (PGGraphMatchingResult *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v30 = v29;
        -[PGGraphMatchingResult score](v29, "score");
      }
      else
      {
        v30 = -[PGGraphMatchingResult initWithEvent:]([PGGraphMatchingResult alloc], "initWithEvent:", v27);
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v30, v28);
        v31 = 0.0;
      }
      if (v21 > v31)
      {
        -[PGGraphMatchingResult setScore:](v30, "setScore:", v21);
        v32 = v53;
        v33 = [PGGraphMatchingContextItem alloc];
        v34 = *(_QWORD *)(a1 + 64);
        -[PGGraphMatchingResult score](v30, "score");
        v36 = v35;
        v37 = *(_QWORD *)(a1 + 56);
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v32);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[PGGraphMatchingContextItem initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:](v33, "initWithRelatedType:score:criteria:referenceNode:matchedNode:contextNodes:", v34, v51, v37, v27, v38, v36);

        -[PGGraphMatchingResult setContextItem:forRelatedType:](v30, "setContextItem:forRelatedType:", v39, *(_QWORD *)(a1 + 64));
        if (*(_BYTE *)(a1 + 72))
        {
          -[PGGraphMatchingResult clearKeywordsForRelatedType:](v30, "clearKeywordsForRelatedType:", *(_QWORD *)(a1 + 64));
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v49, "label");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "name");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "stringWithFormat:", CFSTR("[%@] %@"), v42, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v44);

          -[PGGraphMatchingResult addKeywords:forRelatedType:](v30, "addKeywords:forRelatedType:", v40, *(_QWORD *)(a1 + 64));
        }

        v24 = v50;
        v25 = 0x1E0CB3000;
        v23 = v52;
      }

      if (v23 == ++v26)
      {
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
        if (v23)
          goto LABEL_14;
        break;
      }
    }
  }

}

void __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_2;
  v5[3] = &unk_1E8430558;
  v6 = a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v9 = v3;
  v4 = v3;
  objc_msgSend(v4, "enumerateAddressEdgesAndNodesUsingBlock:", v5);

}

void __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_3(id *a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(a2, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "momentNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_4;
  v5[3] = &unk_1E8430580;
  v6 = a1[4];
  v7 = a1[5];
  v8 = a1[6];
  objc_msgSend(v4, "enumerateNodesUsingBlock:", v5);

}

void __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_304(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v10 = v3;
  objc_msgSend(v3, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "countryNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "elementIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "intersectsIdentifierSet:", v7);

  if ((_DWORD)v4)
  {
    objc_msgSend(v10, "collection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "momentNodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_2_305;
    v11[3] = &unk_1E8430580;
    v12 = *(id *)(a1 + 40);
    v13 = *(id *)(a1 + 48);
    v14 = *(id *)(a1 + 56);
    objc_msgSend(v9, "enumerateNodesUsingBlock:", v11);

  }
}

void __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_3_312(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_4_313;
  v7[3] = &unk_1E8430558;
  v8 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v9 = v4;
  v10 = v5;
  v11 = v3;
  v6 = v3;
  objc_msgSend(v6, "enumerateAddressEdgesAndNodesUsingBlock:", v7);

}

void __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_318(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double *v24;
  uint64_t v25;
  uint64_t v26;

  v5 = a2;
  v6 = a3;
  v23 = 0;
  v24 = (double *)&v23;
  v25 = 0x2020000000;
  v26 = 0x7FEFFFFFFFFFFFFFLL;
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x2020000000;
  v7 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_2_319;
  v15[3] = &unk_1E84305F8;
  v16 = *(id *)(a1 + 32);
  v17 = &v19;
  v18 = &v23;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v15);
  if (v20[3] != v24[3])
  {
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_3_321;
    v9[3] = &unk_1E8430620;
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 32);
    v12 = &v23;
    v8 = *(_QWORD *)(a1 + 48);
    v13 = &v19;
    v14 = v8;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

}

void __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_4_323(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "distanceBetweenCoordinates");
  v5 = v4;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v5 > *(double *)(v6 + 24))
    *(double *)(v6 + 24) = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v5 < *(double *)(v7 + 24))
    *(double *)(v7 + 24) = v5;
}

void __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_2_319(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "distanceBetweenCoordinates");
  v5 = v4;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v5 > *(double *)(v6 + 24))
    *(double *)(v6 + 24) = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v5 < *(double *)(v7 + 24))
    *(double *)(v7 + 24) = v5;
}

void __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_3_321(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "distanceBetweenCoordinates");
  v7 = v6;

  v8 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v9 = (v7 - v8) / (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) - v8) * 0.02 + -0.01;
  objc_msgSend(v12, "score");
  objc_msgSend(v12, "setScore:", v10 - v9);
  objc_msgSend(v12, "contextItemForRelatedType:", *(_QWORD *)(a1 + 64));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "score");
  objc_msgSend(v11, "setScore:");

}

void __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_4_313(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "addObject:", v6);
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = objc_msgSend(v6, "identifier");

  objc_msgSend(v8, "numberWithUnsignedInteger:", v9);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  objc_msgSend(v7, "relevance");
  v14 = v13;

  objc_msgSend(*(id *)(a1 + 48), "relatableEvent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "weightForMoment:", *(_QWORD *)(a1 + 56));
  v17 = v12 + v14 * v16;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v18, v19);

}

void __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_2_305(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v3, "connectedEventsWithTargetDomain:", objc_msgSend(*(id *)(a1 + 32), "targetEventDomain", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isSameNodeAsNode:", *(_QWORD *)(a1 + 40)) & 1) == 0)
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

void __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v3, "connectedEventsWithTargetDomain:", objc_msgSend(*(id *)(a1 + 32), "targetEventDomain", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isSameNodeAsNode:", *(_QWORD *)(a1 + 40)) & 1) == 0)
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

void __68__PGGraph_Matching___coreLocationMatchingFromEvent_toEvent_options___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "addObject:", v6);
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = objc_msgSend(v6, "identifier");

  objc_msgSend(v8, "numberWithUnsignedInteger:", v9);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  objc_msgSend(v7, "relevance");
  v14 = v13;

  objc_msgSend(*(id *)(a1 + 48), "relatableEvent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "weightForMoment:", *(_QWORD *)(a1 + 56));
  v17 = v12 + v14 * v16;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v18, v19);

}

void __60__PGGraph_Matching___timeMatchingFromEvent_toEvent_options___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "sameWeekendMoments");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v3);

}

void __60__PGGraph_Matching___timeMatchingFromEvent_toEvent_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

uint64_t __60__PGGraph_Matching___timeMatchingFromEvent_toEvent_options___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "identifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v14, v13);
        }
        objc_msgSend(v14, "addObject:", v8);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

void __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentNodes");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v8, "temporarySet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_eventsFromEvents:withTargetDomain:", v6, objc_msgSend(*(id *)(a1 + 40), "targetEventDomain"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_msgSend(*(id *)(a1 + 56), "unionSet:", v7);

}

void __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "sameWeekendMoments");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v3);

}

void __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a1;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, v6);
  }
  objc_msgSend(v7, "unionSet:", v5);

}

void __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentNodes");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v8, "temporarySet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_eventsFromEvents:withTargetDomain:", v6, objc_msgSend(*(id *)(a1 + 40), "targetEventDomain"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_msgSend(*(id *)(a1 + 56), "unionSet:", v7);

}

void __63__PGGraph_Matching___timeMatchingIdsToScoresFromEvent_options___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "lastWeekendMoments");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v3);

}

double __176__PGGraph_Matching___peopleMatchingResultFromEvent_matchedEvent_presentPeopleCountForEvent_presentPeopleCountForMatchedEvent_commonPeople_relationshipScoreCache_needsKeywords___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    v8 = v7;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "relationshipScoreForPersonNode:", v3);
    v8 = v9;
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v4);

    }
  }

  return v8;
}

double __176__PGGraph_Matching___peopleMatchingResultFromEvent_matchedEvent_presentPeopleCountForEvent_presentPeopleCountForMatchedEvent_commonPeople_relationshipScoreCache_needsKeywords___block_invoke(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(v6, "collection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 1)
  {
    +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphPersonPresentEdgeCollection, "edgesFromNodes:toNodes:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "anyEdge");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "importance");
    v12 = v11;

  }
  else
  {
    v18 = 0;
    v19 = (double *)&v18;
    v20 = 0x2020000000;
    v21 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __176__PGGraph_Matching___peopleMatchingResultFromEvent_matchedEvent_presentPeopleCountForEvent_presentPeopleCountForMatchedEvent_commonPeople_relationshipScoreCache_needsKeywords___block_invoke_2;
    v14[3] = &unk_1E8430450;
    v15 = v8;
    v17 = &v18;
    v16 = v5;
    objc_msgSend(v7, "enumerateNodesUsingBlock:", v14);
    v12 = v19[3];

    _Block_object_dispose(&v18, 8);
  }

  return v12;
}

double __176__PGGraph_Matching___peopleMatchingResultFromEvent_matchedEvent_presentPeopleCountForEvent_presentPeopleCountForMatchedEvent_commonPeople_relationshipScoreCache_needsKeywords___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double result;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphPersonPresentEdgeCollection, "edgesFromNodes:toNodes:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyEdge");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "importance");
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 40), "weightForMoment:", v4);
  v11 = v10;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  result = *(double *)(v12 + 24) + v11 * v9;
  *(double *)(v12 + 24) = result;
  return result;
}

void __56__PGGraph_Matching___peopleCountWithoutMe_focusOnNodes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  char v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7 = v3;
  if (!v4 || (v5 = objc_msgSend(v4, "containsObject:", v3), v3 = v7, v5))
  {
    v6 = objc_msgSend(v3, "isMeNode");
    v3 = v7;
    if ((v6 & 1) == 0)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

void __51__PGGraph_Matching___peopleWithoutMe_focusOnNodes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  char v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7 = v3;
  if (!v4 || (v5 = objc_msgSend(v4, "containsObject:", v3), v3 = v7, v5))
  {
    v6 = objc_msgSend(v3, "isMeNode");
    v3 = v7;
    if ((v6 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
      v3 = v7;
    }
  }

}

void __66__PGGraph_Matching___peopleMatchingIdsToResultsFromEvent_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "nodesForName:fromNode:", CFSTR("commonPerson"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "focusedNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_peopleWithoutMe:focusOnNodes:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v14, "personNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "_peopleCountWithoutMe:focusOnNodes:", v8, 0);

    LOBYTE(v13) = 0;
    objc_msgSend(*(id *)(a1 + 40), "_peopleMatchingResultFromEvent:matchedEvent:presentPeopleCountForEvent:presentPeopleCountForMatchedEvent:commonPeople:relationshipScoreCache:needsKeywords:", *(_QWORD *)(a1 + 56), v14, *(_QWORD *)(a1 + 80), v9, v6, *(_QWORD *)(a1 + 64), v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v10, v12);

  }
}

void __54__PGGraph_Matching__matchPersonNodes_sortDescriptors___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PGGraphMatchingResult *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "neighborScoreWithMomentNode:", v3);
  v5 = v4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "connectedEventsWithTargetDomain:", *(unsigned __int16 *)(a1 + 48), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = -[PGGraphMatchingResult initWithEvent:]([PGGraphMatchingResult alloc], "initWithEvent:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10));
        -[PGGraphMatchingResult setScore:](v11, "setScore:", v5);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

void __54__PGGraph_Matching__matchPersonNodes_sortDescriptors___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __54__PGGraph_Matching__matchPersonNodes_sortDescriptors___block_invoke_3;
  v18[3] = &unk_1E8430398;
  v19 = *(id *)(a1 + 32);
  v5 = v4;
  v20 = v5;
  v21 = &v22;
  objc_msgSend(v3, "enumeratePersonNodesUsingBlock:", v18);
  objc_msgSend(v3, "connectedEventsWithTargetDomain:", *(unsigned __int16 *)(a1 + 80));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v26, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
      if ((objc_msgSend(*(id *)(a1 + 40), "containsIndex:", objc_msgSend(v10, "identifier")) & 1) != 0)
        break;
      objc_msgSend(*(id *)(a1 + 40), "addIndex:", objc_msgSend(v10, "identifier"));
      v11 = *(void **)(a1 + 48);
      LOBYTE(v13) = 0;
      objc_msgSend(*(id *)(a1 + 56), "_peopleMatchingResultFromEvent:matchedEvent:presentPeopleCountForEvent:presentPeopleCountForMatchedEvent:commonPeople:relationshipScoreCache:needsKeywords:", 0, v10, *(_QWORD *)(a1 + 72), v23[3], v5, *(_QWORD *)(a1 + 64), v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v12);

      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v26, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  _Block_object_dispose(&v22, 8);
}

void __54__PGGraph_Matching__matchPersonNodes_sortDescriptors___block_invoke_3(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "isMeNode");
  v4 = v5;
  if ((v3 & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5))
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v4 = v5;
  }

}

+ (id)matchingWeightToDictionary
{
  return &unk_1E84EB630;
}

+ (id)matchingBlockedSceneLabels
{
  return &unk_1E84EA3A8;
}

+ (id)defaultMatchingSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("event"), 0, &__block_literal_global_49803);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __51__PGGraph_Matching__defaultMatchingSortDescriptors__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "timestampUTCStart");
  v7 = v6;
  objc_msgSend(v5, "timestampUTCStart");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "timestampUTCStart");
    v11 = v10;
    objc_msgSend(v5, "timestampUTCStart");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (void)invalidateProcessingCaches
{
  PGGraph *v2;
  NSDictionary *zeroKeywordMappingByMeaningLabel;
  PGGraphLocationCityNodeCollection *interestingCityNodes;

  v2 = self;
  objc_sync_enter(v2);
  zeroKeywordMappingByMeaningLabel = v2->_zeroKeywordMappingByMeaningLabel;
  v2->_zeroKeywordMappingByMeaningLabel = 0;

  objc_sync_exit(v2);
  interestingCityNodes = v2->_interestingCityNodes;
  v2->_interestingCityNodes = 0;

}

- (void)invalidateSupersetCaches
{
  os_unfair_lock_s *p_supersetLock;
  PGGraphLocationCityNodeCollection *supersetCityNodes;
  PGGraphLocationCountyNodeCollection *supersetCountyNodes;
  PGGraphLocationStateNodeCollection *supersetStateNodes;
  PGGraphLocationCountryNodeCollection *supersetCountryNodes;

  p_supersetLock = &self->_supersetLock;
  os_unfair_lock_lock(&self->_supersetLock);
  supersetCityNodes = self->_supersetCityNodes;
  self->_supersetCityNodes = 0;

  supersetCountyNodes = self->_supersetCountyNodes;
  self->_supersetCountyNodes = 0;

  supersetStateNodes = self->_supersetStateNodes;
  self->_supersetStateNodes = 0;

  supersetCountryNodes = self->_supersetCountryNodes;
  self->_supersetCountryNodes = 0;

  os_unfair_lock_unlock(p_supersetLock);
}

- (void)enumeratePeopleClustersIncludingMeNode:(BOOL)a3 socialGroupsVersion:(unint64_t)a4 singlePersonGroups:(id *)a5 withBlock:(id)a6
{
  _BOOL8 v7;
  uint64_t v8;
  double v9;

  v7 = a3;
  if (a4 == 1)
    v8 = 4;
  else
    v8 = 3;
  v9 = 0.7;
  if (a4 == 1)
    v9 = 0.0;
  -[PGGraph enumeratePeopleClustersWithLinkage:threshold:includingMeNode:socialGroupsVersion:singlePersonGroups:withBlock:](self, "enumeratePeopleClustersWithLinkage:threshold:includingMeNode:socialGroupsVersion:singlePersonGroups:withBlock:", v8, v7, v9);
}

- (void)enumeratePeopleClustersWithLinkage:(unint64_t)a3 threshold:(double)a4 includingMeNode:(BOOL)a5 socialGroupsVersion:(unint64_t)a6 singlePersonGroups:(id *)a7 withBlock:(id)a8
{
  _BOOL4 v8;
  NSObject *v11;
  id v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  os_signpost_id_t v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint32_t numer;
  uint32_t denom;
  id v28;
  NSObject *v29;
  id v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint32_t v47;
  uint32_t v48;
  id v49;
  NSObject *v50;
  id v51;
  NSObject *v52;
  os_signpost_id_t v53;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint32_t v63;
  uint32_t v64;
  id v65;
  NSObject *v66;
  id v67;
  NSObject *v68;
  os_signpost_id_t v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  id v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t m;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t n;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  int v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t j;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  double v112;
  unint64_t v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t k;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  char v122;
  double v123;
  double v124;
  double v125;
  float v127;
  id v128;
  id v129;
  double v130;
  float v131;
  int v132;
  void *v133;
  id v134;
  id v135;
  void *v136;
  void *v137;
  float v138;
  float v139;
  id v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t ii;
  void *v144;
  void *v145;
  float v146;
  float v147;
  double v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  BOOL v153;
  unint64_t v154;
  uint64_t v155;
  uint32_t v156;
  uint32_t v157;
  id v158;
  NSObject *v159;
  id v160;
  float v161;
  void *v162;
  void *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  os_signpost_id_t v167;
  unint64_t v168;
  void *v169;
  id v170;
  void (**v171)(id, id, id, void *, uint8_t *, float, float);
  void *context;
  NSObject *v173;
  void *v174;
  void *v175;
  PGGraphMomentNodeCollection *v176;
  void *v177;
  uint64_t v178;
  void *v179;
  void *v180;
  unint64_t v181;
  void *v182;
  id v183;
  unint64_t v184;
  void *v185;
  void *v186;
  uint64_t v187;
  PGGraph *v188;
  unint64_t v189;
  void *v190;
  id v191;
  unint64_t v192;
  void *v193;
  uint64_t v194;
  void *v195;
  id v196;
  os_signpost_id_t spid;
  os_signpost_id_t spida;
  uint64_t v200;
  void *v201;
  id obj;
  id v204;
  id v205;
  id v206;
  uint64_t v208;
  unint64_t v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  mach_timebase_info v238;
  _QWORD v239[6];
  mach_timebase_info v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  _QWORD v245[4];
  id v246;
  id v247;
  uint8_t *v248;
  uint8_t buf[8];
  uint8_t *v250;
  uint64_t v251;
  uint64_t v252;
  mach_timebase_info v253;
  mach_timebase_info info;
  _BYTE v255[128];
  _BYTE v256[128];
  _BYTE v257[128];
  _BYTE v258[128];
  _BYTE v259[128];
  _BYTE v260[128];
  _QWORD v261[2];
  _BYTE v262[128];
  _QWORD v263[2];
  _QWORD v264[2];
  _QWORD v265[3];
  _QWORD v266[3];
  _QWORD v267[2];
  _QWORD v268[2];
  _QWORD v269[2];
  _QWORD v270[2];
  uint8_t v271[128];
  uint8_t v272[4];
  const char *v273;
  __int16 v274;
  double v275;
  uint64_t v276;

  v8 = a5;
  v276 = *MEMORY[0x1E0C80C00];
  v171 = (void (**)(id, id, id, void *, uint8_t *, float, float))a8;
  v188 = self;
  -[PGGraph _checkCanRead](self, "_checkCanRead");
  v11 = MEMORY[0x1E0C81028];
  v12 = MEMORY[0x1E0C81028];
  v13 = os_signpost_id_generate(v11);
  v14 = v11;
  spid = v13;
  v204 = (id)(v13 - 1);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_BEGIN, v13, "BaseGroupsCreation", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v194 = mach_absolute_time();
  v15 = MEMORY[0x1E0C81028];
  v16 = MEMORY[0x1E0C81028];
  v17 = os_signpost_id_generate(v15);
  v18 = v15;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_BEGIN, v17, "GatherExclusiveMoments", ", buf, 2u);
  }

  v253 = 0;
  mach_timebase_info(&v253);
  v19 = mach_absolute_time();
  v196 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v191 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PGGraph relevantMomentNodesForSocialGroupProcessing](v188, "relevantMomentNodesForSocialGroupProcessing");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = -[MAElementCollection initWithArray:graph:]([PGGraphMomentNodeCollection alloc], "initWithArray:graph:", v179, v188);
  *(_QWORD *)buf = 0;
  v250 = buf;
  v251 = 0x2020000000;
  v252 = 0;
  v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v8)
    +[PGGraphMomentNode personInMoment](PGGraphMomentNode, "personInMoment");
  else
    +[PGGraphMomentNode personExcludingMeInMoment](PGGraphMomentNode, "personExcludingMeInMoment");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0D429D8];
  objc_opt_self();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "adjacencyWithSources:relation:targetsClass:", v176, v175, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v245[0] = MEMORY[0x1E0C809B0];
  v245[1] = 3221225472;
  v245[2] = __133__PGGraph_Processing__enumeratePeopleClustersWithLinkage_threshold_includingMeNode_socialGroupsVersion_singlePersonGroups_withBlock___block_invoke;
  v245[3] = &unk_1E84308C8;
  v170 = v23;
  v246 = v170;
  v24 = v20;
  v247 = v24;
  v248 = buf;
  objc_msgSend(v179, "enumerateObjectsUsingBlock:", v245);
  v25 = mach_absolute_time();
  numer = v253.numer;
  denom = v253.denom;
  v28 = MEMORY[0x1E0C81028];
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    *(_WORD *)v272 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_END, v17, "GatherExclusiveMoments", ", v272, 2u);
  }

  v29 = MEMORY[0x1E0C81028];
  v30 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v272 = 136315394;
    v273 = "GatherExclusiveMoments";
    v274 = 2048;
    v275 = (float)((float)((float)((float)(v25 - v19) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v272, 0x16u);
  }

  v243 = 0u;
  v244 = 0u;
  v241 = 0u;
  v242 = 0u;
  obj = v24;
  v31 = 0;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v241, v271, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v242;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v242 != v33)
          objc_enumerationMutation(obj);
        v35 = *(void **)(*((_QWORD *)&v241 + 1) + 8 * i);
        objc_msgSend(obj, "objectForKeyedSubscript:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36;
        if (a6 != 1)
        {
          objc_msgSend(v35, "relationshipEdges");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "labels");
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          v44 = objc_msgSend(v37, "count");
          v266[0] = v37;
          v265[0] = CFSTR("momentNodes");
          v265[1] = CFSTR("personNodes");
          objc_msgSend(v35, "temporarySet");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v265[2] = CFSTR("relationships");
          v266[1] = v42;
          v266[2] = v41;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v266, v265, 3);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v196, "addObject:", v45);

          v31 += v44;
          goto LABEL_28;
        }
        if (objc_msgSend(v36, "count") && objc_msgSend(v35, "count"))
        {
          v38 = objc_msgSend(v37, "count");
          v270[0] = v37;
          v269[0] = CFSTR("momentNodes");
          v269[1] = CFSTR("personNodes");
          objc_msgSend(v35, "temporarySet");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v270[1] = v39;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v270, v269, 2);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v196, "addObject:", v40);

          v31 += v38;
        }
        if (objc_msgSend(v35, "count") == 1 && objc_msgSend(v37, "count"))
        {
          v268[0] = v37;
          v267[0] = CFSTR("momentNodes");
          v267[1] = CFSTR("personNodes");
          objc_msgSend(v35, "temporarySet");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v268[1] = v41;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v268, v267, 2);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v191, "addObject:", v42);
LABEL_28:

        }
      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v241, v271, 16);
    }
    while (v32);
  }

  v46 = mach_absolute_time();
  v47 = info.numer;
  v48 = info.denom;
  v49 = MEMORY[0x1E0C81028];
  if ((unint64_t)v204 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    *(_WORD *)v272 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_END, spid, "BaseGroupsCreation", ", v272, 2u);
  }

  v50 = MEMORY[0x1E0C81028];
  v51 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v272 = 136315394;
    v273 = "BaseGroupsCreation";
    v274 = 2048;
    v275 = (float)((float)((float)((float)(v46 - v194) * (float)v47) / (float)v48) / 1000000.0);
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v272, 0x16u);
  }

  if (a7)
    *a7 = objc_retainAutorelease(v191);
  v52 = v50;
  v53 = os_signpost_id_generate(v50);
  v54 = v50;
  if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    *(_WORD *)v272 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_BEGIN, v53, "BaseGroupsClustering", ", v272, 2u);
  }

  v240 = 0;
  mach_timebase_info(&v240);
  v55 = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("personNodes"), 1, &__block_literal_global_50286);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("momentNodes"), 0, &__block_literal_global_206);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6 == 1)
  {
    v264[0] = v174;
    v264[1] = v177;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v264, 2);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "sortUsingDescriptors:", v56);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("momentNodes"), 0, &__block_literal_global_208);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v263[0] = v174;
    v263[1] = v56;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v263, 2);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "sortUsingDescriptors:", v57);

  }
  v58 = objc_alloc(MEMORY[0x1E0D717A0]);
  v239[0] = MEMORY[0x1E0C809B0];
  v239[1] = 3221225472;
  v239[2] = __133__PGGraph_Processing__enumeratePeopleClustersWithLinkage_threshold_includingMeNode_socialGroupsVersion_singlePersonGroups_withBlock___block_invoke_4;
  v239[3] = &unk_1E8430950;
  v239[5] = a6;
  v239[4] = v188;
  v59 = (void *)objc_msgSend(v58, "initWithDistanceBlock:", v239);
  objc_msgSend(v59, "setK:", 1);
  objc_msgSend(v59, "setLinkage:", a3);
  objc_msgSend(v59, "setThreshold:", a4);
  if (a6 == 1)
  {
    if (objc_msgSend(v59, "linkage") == 5)
      objc_msgSend(v59, "setClusterKeyElementBlock:", &__block_literal_global_213_50287);
    if (objc_msgSend(v59, "linkage") == 4)
      objc_msgSend(v59, "setClusterConsolidationBlock:", &__block_literal_global_215_50288);
  }
  v169 = v59;
  objc_msgSend(v59, "performWithDataset:progressBlock:", v196, 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "sortedArrayUsingComparator:", &__block_literal_global_217);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = mach_absolute_time();
  v63 = v240.numer;
  v64 = v240.denom;
  v65 = MEMORY[0x1E0C81028];
  if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    *(_WORD *)v272 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_END, v53, "BaseGroupsClustering", ", v272, 2u);
  }

  v66 = MEMORY[0x1E0C81028];
  v67 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v272 = 136315394;
    v273 = "BaseGroupsClustering";
    v274 = 2048;
    v275 = (float)((float)((float)((float)(v62 - v55) * (float)v63) / (float)v64) / 1000000.0);
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v272, 0x16u);
  }

  v68 = v66;
  v69 = os_signpost_id_generate(v66);
  v70 = v66;
  v167 = v69;
  v168 = v69 - 1;
  if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    *(_WORD *)v272 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_BEGIN, v69, "ClusterConsolidation", ", v272, 2u);
  }

  v238 = 0;
  mach_timebase_info(&v238);
  v164 = mach_absolute_time();
  v236 = 0u;
  v237 = 0u;
  v234 = 0u;
  v235 = 0u;
  v173 = v61;
  v71 = -[NSObject countByEnumeratingWithState:objects:count:](v173, "countByEnumeratingWithState:objects:count:", &v234, v262, 16);
  if (v71)
  {
    v72 = *(_QWORD *)v235;
    v161 = (float)v31;
    v165 = *(_QWORD *)v235;
    do
    {
      v178 = 0;
      v166 = v71;
      do
      {
        if (*(_QWORD *)v235 != v72)
          objc_enumerationMutation(v173);
        v73 = *(void **)(*((_QWORD *)&v234 + 1) + 8 * v178);
        context = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(v73, "objects");
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v75 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v182 = v74;
        if (a6 == 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("personNodes"), 1, &__block_literal_global_222);
          v183 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v180);
          v195 = (void *)objc_claimAutoreleasedReturnValue();
          v261[0] = v183;
          v261[1] = v177;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v261, 2);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v195, "sortUsingDescriptors:", v76);

          objc_msgSend(v195, "objectAtIndexedSubscript:", 0);
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v163, "objectForKeyedSubscript:", CFSTR("personNodes"));
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v162, "count") > 3)
          {
            v78 = 0.8;
            v77 = 0.3;
            v79 = 0.05;
            v80 = 3;
          }
          else
          {
            v77 = 0.0;
            v78 = 1.0;
            v79 = 0.0;
            v80 = 1;
          }
          v181 = v80;
          v98 = 0;
          v184 = 0;
LABEL_89:
          if (((v184 < objc_msgSend(v195, "count")) & (v98 ^ 1)) != 0)
          {
            objc_msgSend(v195, "objectAtIndexedSubscript:");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("personNodes"));
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v190 = v99;
            objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("momentNodes"));
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            v209 = objc_msgSend(v101, "count");
            v185 = v101;
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v101);
            v186 = (void *)objc_claimAutoreleasedReturnValue();
            v102 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v232 = 0u;
            v233 = 0u;
            v230 = 0u;
            v231 = 0u;
            v206 = v100;
            v103 = objc_msgSend(v206, "countByEnumeratingWithState:objects:count:", &v230, v260, 16);
            if (v103)
            {
              v104 = *(_QWORD *)v231;
              do
              {
                for (j = 0; j != v103; ++j)
                {
                  if (*(_QWORD *)v231 != v104)
                    objc_enumerationMutation(v206);
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v230 + 1) + 8 * j), "identifier"));
                  v106 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v102, "objectForKeyedSubscript:", v106);
                  v107 = (void *)objc_claimAutoreleasedReturnValue();
                  v108 = objc_msgSend(v107, "unsignedIntegerValue");

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v108 + v209);
                  v109 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v102, "setObject:forKeyedSubscript:", v109, v106);

                }
                v103 = objc_msgSend(v206, "countByEnumeratingWithState:objects:count:", &v230, v260, 16);
              }
              while (v103);
            }

            v192 = objc_msgSend(v185, "count");
            v189 = v192;
            spida = ++v184;
            while (1)
            {
              if (spida >= objc_msgSend(v195, "count"))
              {
LABEL_114:
                if (v189)
                {
                  v123 = (double)v192 / (double)v189;
                  v124 = (double)v209 / (double)v189;
                }
                else
                {
                  v123 = 0.0;
                  v124 = 0.0;
                }
                -[PGGraph longevity:](v188, "longevity:", v185);
                if (v123 < v77 || v124 < v79)
                {
                  v98 = 0;
                }
                else
                {
                  v98 = 0;
                  if (v209 >= v181)
                  {
                    v127 = v125 / 31536000.0;
                    if (v127 >= 0.083333)
                    {
                      v128 = v102;

                      v129 = v186;
                      v98 = 1;
                      v182 = v129;
                      v75 = v128;
                    }
                  }
                }

                goto LABEL_89;
              }
              objc_msgSend(v195, "objectAtIndexedSubscript:");
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("personNodes"));
              v201 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("momentNodes"));
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              v193 = v110;
              if (objc_msgSend(v201, "isSubsetOfSet:", v206))
              {
                -[PGGraph peopleDistance:withSecondBaseGroup:threshold:factor:](v188, "peopleDistance:withSecondBaseGroup:threshold:factor:", v190, v110, 0.0, 1.0);
                v113 = v192;
                if (v112 > v78)
                {
                  v122 = 0;
                  goto LABEL_113;
                }
                if (v112 <= 0.6)
                  v113 = objc_msgSend(v111, "count") + v192;
                v187 = objc_msgSend(v111, "count");
                objc_msgSend(v186, "addObjectsFromArray:", v111);
                v228 = 0u;
                v229 = 0u;
                v226 = 0u;
                v227 = 0u;
                v114 = v201;
                v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v226, v259, 16);
                v192 = v113;
                if (v115)
                {
                  v116 = *(_QWORD *)v227;
                  do
                  {
                    for (k = 0; k != v115; ++k)
                    {
                      if (*(_QWORD *)v227 != v116)
                        objc_enumerationMutation(v114);
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v226 + 1) + 8 * k), "identifier"));
                      v118 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v102, "objectForKeyedSubscript:", v118);
                      v119 = (void *)objc_claimAutoreleasedReturnValue();
                      v120 = objc_msgSend(v119, "unsignedIntegerValue");

                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v111, "count") + v120);
                      v121 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v102, "setObject:forKeyedSubscript:", v121, v118);

                    }
                    v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v226, v259, 16);
                  }
                  while (v115);
                }

                v189 += v187;
              }
              v122 = 1;
LABEL_113:

              ++spida;
              if ((v122 & 1) == 0)
                goto LABEL_114;
            }
          }

        }
        else
        {
          v224 = 0u;
          v225 = 0u;
          v222 = 0u;
          v223 = 0u;
          objc_msgSend(v180, "valueForKey:", CFSTR("momentNodes"));
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v222, v258, 16);
          if (v82)
          {
            v83 = *(_QWORD *)v223;
            do
            {
              for (m = 0; m != v82; ++m)
              {
                if (*(_QWORD *)v223 != v83)
                  objc_enumerationMutation(v81);
                objc_msgSend(v74, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v222 + 1) + 8 * m));
              }
              v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v222, v258, 16);
            }
            while (v82);
          }

          v220 = 0u;
          v221 = 0u;
          v218 = 0u;
          v219 = 0u;
          v183 = v180;
          v85 = objc_msgSend(v183, "countByEnumeratingWithState:objects:count:", &v218, v257, 16);
          if (v85)
          {
            v200 = *(_QWORD *)v219;
            do
            {
              v86 = 0;
              v205 = (id)v85;
              do
              {
                if (*(_QWORD *)v219 != v200)
                  objc_enumerationMutation(v183);
                v208 = v86;
                v87 = *(void **)(*((_QWORD *)&v218 + 1) + 8 * v86);
                v214 = 0u;
                v215 = 0u;
                v216 = 0u;
                v217 = 0u;
                objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("personNodes"));
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v214, v256, 16);
                if (v89)
                {
                  v90 = *(_QWORD *)v215;
                  do
                  {
                    for (n = 0; n != v89; ++n)
                    {
                      if (*(_QWORD *)v215 != v90)
                        objc_enumerationMutation(v88);
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v214 + 1) + 8 * n), "identifier"));
                      v92 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v75, "objectForKeyedSubscript:", v92);
                      v93 = (void *)objc_claimAutoreleasedReturnValue();
                      v94 = objc_msgSend(v93, "unsignedIntegerValue");

                      v95 = (void *)MEMORY[0x1E0CB37E8];
                      objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("momentNodes"));
                      v96 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v95, "numberWithUnsignedInteger:", objc_msgSend(v96, "count") + v94);
                      v97 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v75, "setObject:forKeyedSubscript:", v97, v92);

                    }
                    v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v214, v256, 16);
                  }
                  while (v89);
                }

                v86 = v208 + 1;
              }
              while ((id)(v208 + 1) != v205);
              v85 = objc_msgSend(v183, "countByEnumeratingWithState:objects:count:", &v218, v257, 16);
            }
            while (v85);
          }
        }

        if (!objc_msgSend(v182, "count"))
          goto LABEL_133;
        if (a6 == 1)
        {
          -[PGGraph longevity:](v188, "longevity:", v182);
          v131 = v130 / 31536000.0;
        }
        else
        {
          v131 = 0.0;
          if (!a6 && (unint64_t)objc_msgSend(v182, "count") < 3)
          {
LABEL_133:
            v132 = 5;
            goto LABEL_159;
          }
        }
        objc_msgSend(v75, "keysSortedByValueUsingComparator:", &__block_literal_global_226);
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        v134 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v135 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v133, "firstObject");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "objectForKeyedSubscript:", v136);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "floatValue");
        v139 = v138;

        v212 = 0u;
        v213 = 0u;
        v210 = 0u;
        v211 = 0u;
        v140 = v133;
        v141 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v210, v255, 16);
        if (!v141)
          goto LABEL_149;
        v142 = *(_QWORD *)v211;
        while (2)
        {
          for (ii = 0; ii != v141; ++ii)
          {
            if (*(_QWORD *)v211 != v142)
              objc_enumerationMutation(v140);
            v144 = *(void **)(*((_QWORD *)&v210 + 1) + 8 * ii);
            if (v139 <= 0.0)
            {
              v148 = 0.0;
              if (a6 != 1)
                goto LABEL_151;
            }
            else
            {
              objc_msgSend(v75, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v210 + 1) + 8 * ii));
              v145 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v145, "floatValue");
              v147 = v146;

              v148 = (float)(v147 / v139);
              if (a6 != 1)
              {
                if (v148 < 0.35)
                {
LABEL_151:

                  v151 = v182;
                  goto LABEL_157;
                }
                goto LABEL_147;
              }
              if (v148 >= 0.35)
                goto LABEL_147;
            }
            if (objc_msgSend(v75, "count") != 1)
            {

              v151 = v182;
              goto LABEL_153;
            }
LABEL_147:
            -[MAGraph nodeForIdentifier:](v188, "nodeForIdentifier:", objc_msgSend(v144, "unsignedIntegerValue"));
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v134, "addObject:", v149);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v148);
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v135, "addObject:", v150);

          }
          v141 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v210, v255, 16);
          if (v141)
            continue;
          break;
        }
LABEL_149:

        v151 = v182;
        if (a6 == 1)
        {
LABEL_153:
          if (objc_msgSend(v134, "count") == 1)
          {
            objc_msgSend(v134, "objectAtIndexedSubscript:", 0);
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            v153 = (unint64_t)objc_msgSend(v152, "numberOfMomentNodes") > 1;

            v151 = v182;
            if (v153)
              goto LABEL_157;
          }
          else if ((unint64_t)objc_msgSend(v151, "count") >= 2)
          {
            goto LABEL_157;
          }
          v132 = 5;
        }
        else
        {
LABEL_157:
          v154 = objc_msgSend(v151, "count");
          v272[0] = 0;
          v171[2](v171, v134, v135, v151, v272, (float)v154 / v161, v131);
          v132 = v272[0];
        }

LABEL_159:
        objc_autoreleasePoolPop(context);
        v72 = v165;
        if (v132 != 5 && v132)
        {
          v159 = v173;
          goto LABEL_168;
        }
        ++v178;
      }
      while (v178 != v166);
      v71 = -[NSObject countByEnumeratingWithState:objects:count:](v173, "countByEnumeratingWithState:objects:count:", &v234, v262, 16);
    }
    while (v71);
  }

  v155 = mach_absolute_time();
  v156 = v238.numer;
  v157 = v238.denom;
  v158 = MEMORY[0x1E0C81028];
  if (v168 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    *(_WORD *)v272 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_END, v167, "ClusterConsolidation", ", v272, 2u);
  }

  v159 = MEMORY[0x1E0C81028];
  v160 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v159, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v272 = 136315394;
    v273 = "ClusterConsolidation";
    v274 = 2048;
    v275 = (float)((float)((float)((float)(v155 - v164) * (float)v156) / (float)v157) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v159, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v272, 0x16u);
  }
LABEL_168:

  _Block_object_dispose(buf, 8);
}

- (double)peopleDistance:(id)a3 withSecondBaseGroup:(id)a4 threshold:(double)a5 factor:(double)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  double v16;

  v9 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("personNodes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("personNodes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "intersectSet:", v11);
  v13 = objc_msgSend(v10, "count");
  v14 = objc_msgSend(v11, "count");
  v15 = objc_msgSend(v12, "count");
  v16 = -(a5 - (((double)v14 - (double)v15) / (double)v14 + ((double)v13 - (double)v15) / (double)v13) * a6);

  return v16;
}

- (double)momentsCountDistance:(id)a3 withSecondBaseGroup:(id)a4 withSubsetBias:(double)a5 withDistanceThreshold:(double)a6 withIntersectionBias:(double)a7 withKey:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  int v23;
  double v24;
  double v25;
  unint64_t v26;
  unint64_t v27;
  double v28;

  v13 = a8;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("personNodes"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("personNodes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "intersectSet:", v17);
  objc_msgSend(v14, "objectForKeyedSubscript:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKeyedSubscript:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v19, "count");
  v22 = objc_msgSend(v20, "count");
  if ((objc_msgSend(v16, "isSubsetOfSet:", v17) & 1) != 0 || objc_msgSend(v17, "isSubsetOfSet:", v16))
  {
    v23 = objc_msgSend(v16, "isSubsetOfSet:", v17);
    v24 = (double)v21 + (double)v22;
    v25 = (double)v22 / v24 + a5;
    if (v23)
      v25 = (double)v21 / v24 + a5;
  }
  else
  {
    v26 = v22 - v21;
    if (v21 >= v22)
      v26 = v21 - v22;
    if (v21 <= v22)
      v27 = v22;
    else
      v27 = v21;
    v25 = a6 - a7 + (double)v26 / (double)v27;
  }
  v28 = v25 - a6;

  return v28;
}

- (id)relevantMomentNodesForSocialGroupProcessing
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  -[PGGraph meNodeCollection](self, "meNodeCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PGGraph isSharedLibraryEnabled](self, "isSharedLibraryEnabled") && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "momentNodesWithPresence");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PGGraph momentNodes](self, "momentNodes");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)enumerateSocialGroupsWithBlock:(id)a3 includeInvalidGroups:(BOOL)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__PGGraph_Processing__enumerateSocialGroupsWithBlock_includeInvalidGroups___block_invoke;
  v12[3] = &unk_1E8430A18;
  v13 = v6;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __75__PGGraph_Processing__enumerateSocialGroupsWithBlock_includeInvalidGroups___block_invoke_2;
  v9[3] = &unk_1E8430A40;
  v11 = a4;
  v10 = v13;
  v8 = v13;
  -[PGGraph enumerateSocialGroupsIncludingMeNode:socialGroupsVersion:simulateMeNodeNotSet:validGroupsBlock:invalidGroupsBlock:averageWeight:](self, "enumerateSocialGroupsIncludingMeNode:socialGroupsVersion:simulateMeNodeNotSet:validGroupsBlock:invalidGroupsBlock:averageWeight:", 0, 1, 0, v12, v9, 0);

}

- (void)enumerateSocialGroupsIncludingMeNode:(BOOL)a3 validGroupsBlock:(id)a4 invalidGroupsBlock:(id)a5 averageWeight:(float *)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v10 = a4;
  v14 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __110__PGGraph_Processing__enumerateSocialGroupsIncludingMeNode_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke;
  v15[3] = &unk_1E8430A18;
  v16 = v10;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __110__PGGraph_Processing__enumerateSocialGroupsIncludingMeNode_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke_2;
  v13[3] = &unk_1E8430A18;
  v11 = v14;
  v12 = v10;
  -[PGGraph enumerateSocialGroupsIncludingMeNode:socialGroupsVersion:simulateMeNodeNotSet:validGroupsBlock:invalidGroupsBlock:averageWeight:](self, "enumerateSocialGroupsIncludingMeNode:socialGroupsVersion:simulateMeNodeNotSet:validGroupsBlock:invalidGroupsBlock:averageWeight:", v8, 0, 0, v15, v13, a6);

}

- (void)enumerateSocialGroupsIncludingMeNode:(BOOL)a3 socialGroupsVersion:(unint64_t)a4 simulateMeNodeNotSet:(BOOL)a5 validGroupsBlock:(id)a6 invalidGroupsBlock:(id)a7 averageWeight:(float *)a8
{
  _BOOL8 v10;
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  PGGraphMeNodeCollection *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  os_signpost_id_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  float v28;
  float v29;
  float v30;
  float v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  float v35;
  float v36;
  uint64_t i;
  void *v38;
  float v39;
  float v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  float v45;
  float v46;
  float v47;
  float v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  double v53;
  uint64_t j;
  void *v55;
  double v56;
  double v57;
  void *v58;
  unsigned int v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  char v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  float v71;
  float v72;
  void *v73;
  int v74;
  int v75;
  id v76;
  id v77;
  id v78;
  unint64_t v79;
  double v80;
  void *v81;
  void *v82;
  double v83;
  double v84;
  unint64_t v85;
  unint64_t v86;
  double v87;
  double v88;
  unint64_t v89;
  double v90;
  float v91;
  double v92;
  double v93;
  double v94;
  float v95;
  float v96;
  double v97;
  double v98;
  double v99;
  float v100;
  float v101;
  float v102;
  float v103;
  id v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  double v108;
  uint64_t k;
  double v110;
  char v111;
  void (**v112)(char *, id, id, id, float, double);
  char *v113;
  _BOOL4 v114;
  unint64_t v115;
  double v116;
  float v117;
  void *v118;
  void *v119;
  double v120;
  void *v121;
  double v122;
  void *v123;
  double v124;
  void *v125;
  void *v126;
  void *v127;
  unint64_t m;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  float v133;
  float v134;
  void *v135;
  int v136;
  int v137;
  uint64_t v138;
  double v139;
  uint64_t v140;
  char *v141;
  void *v142;
  unint64_t n;
  void *v144;
  uint64_t v145;
  uint64_t ii;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  double v153;
  double v154;
  double v155;
  float v156;
  float v157;
  double v158;
  double v159;
  float v160;
  double v161;
  float v162;
  float v163;
  float v164;
  float v165;
  id v166;
  void *v167;
  id v168;
  id v169;
  uint64_t v170;
  uint64_t v171;
  double v172;
  uint64_t jj;
  double v174;
  unint64_t v175;
  double v176;
  id v177;
  void *v178;
  void *v179;
  double v180;
  void *v181;
  double v182;
  void *v183;
  void *v184;
  uint64_t v185;
  double v186;
  uint64_t v187;
  unint64_t v188;
  void *v189;
  uint64_t v190;
  unint64_t v191;
  unint64_t v192;
  _BOOL4 v194;
  unint64_t v195;
  void *v196;
  void *v197;
  float v198;
  float v199;
  void *v200;
  void *v201;
  void *v202;
  _BOOL4 v203;
  void *v204;
  BOOL v205;
  void *v206;
  void *v207;
  uint64_t v208;
  unint64_t v209;
  unint64_t v210;
  uint64_t v211;
  unint64_t v212;
  void *v213;
  BOOL v214;
  void *v215;
  void *v216;
  uint64_t v217;
  id v218;
  uint64_t v219;
  unint64_t v220;
  uint64_t v221;
  uint64_t kk;
  void *v223;
  void *v224;
  void *v225;
  uint64_t v226;
  unint64_t v227;
  char *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  float v233;
  float v234;
  void *v235;
  int v236;
  int v237;
  uint64_t v238;
  double v239;
  void *v240;
  void *v241;
  unint64_t mm;
  void *v243;
  void *v244;
  float v245;
  float v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  float v251;
  unint64_t nn;
  void *v253;
  void *v254;
  float v255;
  float v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  float v261;
  uint64_t v262;
  uint32_t numer;
  uint32_t denom;
  id v265;
  NSObject *v266;
  id v267;
  uint64_t v268;
  uint32_t v269;
  uint32_t v270;
  NSObject *v271;
  NSObject *v272;
  NSObject *v273;
  uint64_t v274;
  os_signpost_id_t v275;
  unint64_t v276;
  uint64_t v277;
  os_signpost_id_t spid;
  unint64_t v279;
  id v281;
  id v282;
  id v283;
  void *v284;
  id v285;
  id v286;
  id v287;
  PGGraphMeNodeCollection *v288;
  NSObject *v289;
  id v290;
  float v291;
  unint64_t v292;
  id v293;
  id v294;
  id v295;
  void *v296;
  void *v297;
  id v298;
  void *v299;
  char *v300;
  char *v301;
  id obj;
  char *obja;
  id v304;
  unsigned int v305;
  int v306;
  id v307;
  id v308;
  id v310;
  uint64_t v311;
  void *v312;
  id v313;
  id v314;
  void *context;
  void *contexta;
  id contextb;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  __int128 v333;
  __int128 v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  mach_timebase_info v339;
  _QWORD v340[4];
  id v341;
  id v342;
  id v343;
  id v344;
  id v345;
  char *v346;
  uint64_t *v347;
  uint64_t *v348;
  uint64_t *v349;
  unint64_t v350;
  id v351;
  uint64_t v352;
  uint64_t *v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  float *v357;
  uint64_t v358;
  int v359;
  uint64_t v360;
  float *v361;
  uint64_t v362;
  int v363;
  mach_timebase_info info;
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  _QWORD v369[2];
  _QWORD v370[2];
  _QWORD v371[3];
  _BYTE v372[128];
  _QWORD v373[3];
  _QWORD v374[2];
  _BYTE v375[128];
  _QWORD v376[3];
  _QWORD v377[3];
  _QWORD v378[8];
  _QWORD v379[8];
  _BYTE v380[128];
  _BYTE v381[128];
  uint8_t v382[128];
  uint8_t buf[4];
  const char *v384;
  __int16 v385;
  double v386;
  uint64_t v387;

  v10 = a3;
  v387 = *MEMORY[0x1E0C80C00];
  v301 = (char *)a6;
  v11 = a7;
  v12 = os_log_create("com.apple.PhotosGraph", "graph");
  v13 = os_signpost_id_generate(v12);
  v14 = v12;
  v15 = v14;
  spid = v13;
  v279 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SocialGroupsV2", ", buf, 2u);
  }
  v289 = v15;

  info = 0;
  mach_timebase_info(&info);
  v277 = mach_absolute_time();
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a5)
  {
    v17 = -[MAElementCollection initWithGraph:]([PGGraphMeNodeCollection alloc], "initWithGraph:", self);
  }
  else
  {
    -[PGGraph meNodeCollection](self, "meNodeCollection");
    v17 = (PGGraphMeNodeCollection *)objc_claimAutoreleasedReturnValue();
  }
  v288 = v17;

  -[PGGraphPersonNodeCollection momentNodes](v288, "momentNodes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v360 = 0;
  v361 = (float *)&v360;
  v362 = 0x2020000000;
  v363 = 0;
  v356 = 0;
  v357 = (float *)&v356;
  v358 = 0x2020000000;
  v359 = 0;
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v352 = 0;
  v353 = &v352;
  v354 = 0x2020000000;
  v355 = 0;
  v351 = 0;
  v340[0] = MEMORY[0x1E0C809B0];
  v340[1] = 3221225472;
  v340[2] = __151__PGGraph_Processing__enumerateSocialGroupsIncludingMeNode_socialGroupsVersion_simulateMeNodeNotSet_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke;
  v340[3] = &unk_1E8430A68;
  v347 = &v352;
  v348 = &v360;
  v349 = &v356;
  v350 = a4;
  v286 = v19;
  v341 = v286;
  v285 = v20;
  v342 = v285;
  v283 = v21;
  v343 = v283;
  v282 = v18;
  v344 = v282;
  v300 = (char *)v11;
  v346 = v300;
  v287 = v16;
  v345 = v287;
  -[PGGraph enumeratePeopleClustersIncludingMeNode:socialGroupsVersion:singlePersonGroups:withBlock:](self, "enumeratePeopleClustersIncludingMeNode:socialGroupsVersion:singlePersonGroups:withBlock:", v10, a4, &v351, v340);
  v281 = v351;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:");
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  if (v353[3])
  {
    v22 = MEMORY[0x1E0C81028];
    v23 = MEMORY[0x1E0C81028];
    v24 = os_signpost_id_generate(v22);
    v25 = v22;
    v275 = v24;
    v276 = v24 - 1;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_BEGIN, v24, "CandidatesValidation", ", buf, 2u);
    }

    v339 = 0;
    mach_timebase_info(&v339);
    v274 = mach_absolute_time();
    v361[6] = v361[6] / (float)(unint64_t)v353[3];
    v314 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v313 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (a4 == 1)
    {
      objc_msgSend(v286, "sortedArrayUsingComparator:", &__block_literal_global_235);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A20]), "initWithArray:", v26);
      objc_msgSend(v27, "mean");
      v29 = v28;
      objc_msgSend(v27, "standardDeviation");
      v31 = v30;
      v337 = 0u;
      v338 = 0u;
      v335 = 0u;
      v336 = 0u;
      v32 = v26;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v335, v382, 16);
      if (v33)
      {
        v34 = *(_QWORD *)v336;
        v35 = v29 - v31;
        v36 = v29 + v31;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v336 != v34)
              objc_enumerationMutation(v32);
            v38 = *(void **)(*((_QWORD *)&v335 + 1) + 8 * i);
            objc_msgSend(v38, "floatValue", v274);
            if (v39 >= v35)
            {
              objc_msgSend(v38, "floatValue");
              if (v40 <= v36)
                objc_msgSend(v314, "addObject:", v38);
            }
          }
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v335, v382, 16);
        }
        while (v33);
      }

      v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A20]), "initWithArray:", v314);
      objc_msgSend(v41, "mean");
      v306 = v42;
      objc_msgSend(v285, "sortedArrayUsingComparator:", &__block_literal_global_237);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A20]), "initWithArray:", v43);
      objc_msgSend(v44, "mean");
      v46 = v45;
      objc_msgSend(v44, "standardDeviation");
      v48 = v47;
      v333 = 0u;
      v334 = 0u;
      v331 = 0u;
      v332 = 0u;
      v49 = v43;
      v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v331, v381, 16);
      if (v50)
      {
        v51 = *(_QWORD *)v332;
        v52 = (float)(v46 - v48);
        v53 = (float)(v46 + v48);
        do
        {
          for (j = 0; j != v50; ++j)
          {
            if (*(_QWORD *)v332 != v51)
              objc_enumerationMutation(v49);
            v55 = *(void **)(*((_QWORD *)&v331 + 1) + 8 * j);
            objc_msgSend(v55, "doubleValue", v274);
            if (v56 >= v52)
            {
              objc_msgSend(v55, "doubleValue");
              if (v57 <= v53)
                objc_msgSend(v313, "addObject:", v55);
            }
          }
          v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v331, v381, 16);
        }
        while (v50);
      }

      v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A20]), "initWithArray:", v313);
      objc_msgSend(v58, "mean");
      v305 = v59;
      v60 = v353[3];
      if (v60 <= 0x4F)
      {
        v291 = (float)((float)((float)v60 / 80.0) * 0.48) + -0.65;
        v61 = vcvtps_u32_f32((float)((float)v60 * 0.15) + 6.0);
        if (v61 <= 7)
          v61 = 7;
        v292 = v61;
      }
      else
      {
        v292 = 18;
        v291 = -0.17;
      }

    }
    else
    {
      v292 = 0;
      v305 = 0;
      v306 = 0;
      v291 = 0.0;
    }
    v304 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v294 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v290 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v295 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v298 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v293 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v329 = 0u;
    v330 = 0u;
    v327 = 0u;
    v328 = 0u;
    obj = v287;
    v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v327, v380, 16);
    if (v62)
    {
      v307 = *(id *)v328;
      do
      {
        v63 = 0;
        v311 = v62;
        do
        {
          if (*(id *)v328 != v307)
            objc_enumerationMutation(obj);
          v64 = *(void **)(*((_QWORD *)&v327 + 1) + 8 * v63);
          context = (void *)MEMORY[0x1CAA4EB2C]();
          objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("isSubset"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v65, "BOOLValue");

          objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("personNodes"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("peopleWeights"));
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("momentNodes"));
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("frequency"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "floatValue");
          v72 = v71;

          objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("longevity"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "floatValue");
          v75 = v74;

          v76 = v67;
          v77 = v68;
          v78 = v69;
          v79 = 0;
          v80 = 0.0;
          while (v79 < objc_msgSend(v76, "count", v274))
          {
            objc_msgSend(v76, "objectAtIndexedSubscript:", v79);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "objectAtIndexedSubscript:", v79);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "doubleValue");
            v84 = v83;

            v85 = objc_msgSend(v81, "numberOfMomentNodes");
            if (v85)
            {
              v86 = objc_msgSend(v78, "count");
              v87 = -((double)v86 * v84 - (double)v85);
              if (-((double)v85 - (double)v86 * v84) >= 0.0)
                v87 = -((double)v85 - (double)v86 * v84);
              v88 = v87 / (double)v85;
            }
            else
            {
              v88 = 0.0;
            }

            v80 = v80 + v88;
            ++v79;
          }
          v89 = objc_msgSend(v76, "count");

          v90 = 1.0 - v80 / (double)v89;
          v91 = v72 / v357[6];
          if (a4 == 1)
          {
            *(float *)&v92 = (float)(unint64_t)objc_msgSend(v78, "count");
            LODWORD(v93) = v306;
            LODWORD(v94) = 1060320051;
            -[PGGraph normalizeFeatureValue:average:featureValues:factor:](self, "normalizeFeatureValue:average:featureValues:factor:", v314, v92, v93, v94);
            v96 = v95;
            LODWORD(v97) = v75;
            LODWORD(v98) = v305;
            LODWORD(v99) = 1060320051;
            -[PGGraph normalizeFeatureValue:average:featureValues:factor:](self, "normalizeFeatureValue:average:featureValues:factor:", v313, v97, v98, v99);
            v101 = v100;
            -[PGGraph averageTopMomentTimes:numberOfMoments:](self, "averageTopMomentTimes:numberOfMoments:", v78, 5);
            -[PGGraph recencyFeature:](self, "recencyFeature:");
            v103 = v102;
            v104 = v77;
            v365 = 0u;
            v366 = 0u;
            v367 = 0u;
            v368 = 0u;
            v105 = v104;
            v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v365, buf, 16);
            if (v106)
            {
              v107 = *(_QWORD *)v366;
              v108 = 0.0;
              do
              {
                for (k = 0; k != v106; ++k)
                {
                  if (*(_QWORD *)v366 != v107)
                    objc_enumerationMutation(v105);
                  objc_msgSend(*(id *)(*((_QWORD *)&v365 + 1) + 8 * k), "doubleValue");
                  v108 = v108 + v110;
                }
                v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v365, buf, 16);
              }
              while (v106);
            }
            else
            {
              v108 = 0.0;
            }

            v115 = objc_msgSend(v105, "count");
            v116 = v108 / (double)v115 + -0.5 + v108 / (double)v115 + -0.5;
            *(float *)&v116 = v116;
            *(float *)&v116 = (float)((float)((float)(v96 + (float)(v103 * 0.0)) + (float)(v101 * 0.0))
                                    + (float)(*(float *)&v116 * 0.0))
                            + 0.0;
            if (*(float *)&v116 < 1.0)
              v117 = *(float *)&v116;
            else
              v117 = 1.0;
            v378[0] = CFSTR("personNodes");
            v378[1] = CFSTR("peopleWeights");
            v379[0] = v76;
            v379[1] = v105;
            v379[2] = v78;
            v378[2] = CFSTR("momentNodes");
            v378[3] = CFSTR("socialGroupWeight");
            *(float *)&v116 = v91;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v116);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            v379[3] = v118;
            v378[4] = CFSTR("groupCohesionScore");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v90);
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            v379[4] = v119;
            v378[5] = CFSTR("recencyFeature");
            *(float *)&v120 = v103;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v120);
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            v379[5] = v121;
            v378[6] = CFSTR("longevity");
            LODWORD(v122) = v75;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v122);
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            v379[6] = v123;
            v378[7] = CFSTR("ranking");
            *(float *)&v124 = v117;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v124);
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            v379[7] = v125;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v379, v378, 8);
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v304, "addObject:", v126);

          }
          else
          {
            if (v301)
              v111 = v66;
            else
              v111 = 1;
            if ((v111 & 1) != 0)
            {
              v112 = (void (**)(char *, id, id, id, float, double))(v300 + 16);
              v113 = v300;
              if (v300)
                goto LABEL_75;
            }
            else
            {
              v114 = v90 >= 0.3 || v72 >= v361[6];
              v112 = (void (**)(char *, id, id, id, float, double))(v301 + 16);
              if (v114)
              {
                v113 = v301;
              }
              else
              {
                v112 = (void (**)(char *, id, id, id, float, double))(v300 + 16);
                v113 = v300;
              }
              if (v114 || v300)
LABEL_75:
                (*v112)(v113, v76, v77, v78, v91, v90);
            }
          }

          objc_autoreleasePoolPop(context);
          ++v63;
        }
        while (v63 != v311);
        v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v327, v380, 16);
      }
      while (v62);
    }

    if (a4 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("ranking"), 0);
      v299 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("momentNodes"), 0, &__block_literal_global_238_50261);
      v297 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("personNodes"), 1, &__block_literal_global_239);
      v296 = (void *)objc_claimAutoreleasedReturnValue();
      v377[0] = v299;
      v377[1] = v297;
      v377[2] = v296;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v377, 3);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v304, "sortUsingDescriptors:", v127);

      obja = 0;
      for (m = 0; m < objc_msgSend(v304, "count", v274); ++m)
      {
        objc_msgSend(v304, "objectAtIndexedSubscript:", m);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("momentNodes"));
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("personNodes"));
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("ranking"));
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "floatValue");
        v134 = v133;

        objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("longevity"));
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "floatValue");
        v137 = v136;

        v138 = objc_msgSend(v130, "count");
        LODWORD(v139) = v137;
        if (-[PGGraph isSocialGroupEligible:longevity:](self, "isSocialGroupEligible:longevity:", v138, v139))
        {
          if (v134 < v291 || m >= v292)
          {
            objc_msgSend(v294, "addObject:", v129);
          }
          else
          {
            objc_msgSend(v290, "addObject:", v129);
            v140 = objc_msgSend(v131, "count");
            v141 = obja;
            if (v140 == 1)
              v141 = obja + 1;
            obja = v141;
          }
        }

      }
      v376[0] = v299;
      v376[1] = v297;
      v376[2] = v296;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v376, 3);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v294, "sortUsingDescriptors:", v142);

      for (n = 0; n < objc_msgSend(v294, "count"); ++n)
      {
        objc_msgSend(v294, "objectAtIndexedSubscript:", n);
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        if (n < v292)
          objc_msgSend(v295, "addObject:", v144);

      }
      v310 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v325 = 0u;
      v326 = 0u;
      v323 = 0u;
      v324 = 0u;
      v308 = v284;
      v145 = objc_msgSend(v308, "countByEnumeratingWithState:objects:count:", &v323, v375, 16);
      if (v145)
      {
        contexta = *(void **)v324;
        do
        {
          for (ii = 0; ii != v145; ++ii)
          {
            if (*(void **)v324 != contexta)
              objc_enumerationMutation(v308);
            v147 = *(void **)(*((_QWORD *)&v323 + 1) + 8 * ii);
            objc_msgSend(v147, "objectForKeyedSubscript:", CFSTR("momentNodes"));
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            v149 = (void *)MEMORY[0x1E0C99D20];
            objc_msgSend(v147, "objectForKeyedSubscript:", CFSTR("personNodes"));
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v150, "allObjects");
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v149, "arrayWithArray:", v151);
            v152 = (void *)objc_claimAutoreleasedReturnValue();

            *(float *)&v153 = (float)(unint64_t)objc_msgSend(v148, "count");
            LODWORD(v154) = v306;
            LODWORD(v155) = 1060320051;
            -[PGGraph normalizeFeatureValue:average:featureValues:factor:](self, "normalizeFeatureValue:average:featureValues:factor:", v314, v153, v154, v155);
            v157 = v156;
            -[PGGraph longevity:](self, "longevity:", v148);
            v159 = v158 / 31536000.0;
            v160 = v159;
            *(float *)&v159 = v160;
            LODWORD(v161) = 1060320051;
            -[PGGraph normalizeFeatureValue:average:featureValues:factor:](self, "normalizeFeatureValue:average:featureValues:factor:", v313, v159, COERCE_DOUBLE(v305 | 0x417E133800000000), v161);
            v163 = v162;
            -[PGGraph averageTopMomentTimes:numberOfMoments:](self, "averageTopMomentTimes:numberOfMoments:", v148, 5);
            -[PGGraph recencyFeature:](self, "recencyFeature:");
            v165 = v164;
            v166 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0);
            v167 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v166, "addObject:", v167);

            v168 = v166;
            v365 = 0u;
            v366 = 0u;
            v367 = 0u;
            v368 = 0u;
            v169 = v168;
            v170 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v365, buf, 16);
            if (v170)
            {
              v171 = *(_QWORD *)v366;
              v172 = 0.0;
              do
              {
                for (jj = 0; jj != v170; ++jj)
                {
                  if (*(_QWORD *)v366 != v171)
                    objc_enumerationMutation(v169);
                  objc_msgSend(*(id *)(*((_QWORD *)&v365 + 1) + 8 * jj), "doubleValue");
                  v172 = v172 + v174;
                }
                v170 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v365, buf, 16);
              }
              while (v170);
            }
            else
            {
              v172 = 0.0;
            }

            v175 = objc_msgSend(v169, "count");
            if ((float)((float)(v157 + (float)(v165 * 0.0)) + (float)(v163 * 0.0))
               + (v172 / (double)v175 + -0.5 + v172 / (double)v175 + -0.5) * 0.0
               + 0.0 < 1.0)
              v176 = (float)((float)(v157 + (float)(v165 * 0.0)) + (float)(v163 * 0.0))
                   + (v172 / (double)v175 + -0.5 + v172 / (double)v175 + -0.5) * 0.0
                   + 0.0;
            else
              v176 = 1.0;
            v177 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v177, "setObject:forKeyedSubscript:", v148, CFSTR("momentNodes"));
            objc_msgSend(v177, "setObject:forKeyedSubscript:", v152, CFSTR("personNodes"));
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v176);
            v178 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v177, "setObject:forKeyedSubscript:", v178, CFSTR("socialGroupWeight"));

            objc_msgSend(v177, "setObject:forKeyedSubscript:", v169, CFSTR("peopleWeights"));
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0);
            v179 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v177, "setObject:forKeyedSubscript:", v179, CFSTR("groupCohesionScore"));

            *(float *)&v180 = v160;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v180);
            v181 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v177, "setObject:forKeyedSubscript:", v181, CFSTR("longevity"));

            *(float *)&v182 = v165;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v182);
            v183 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v177, "setObject:forKeyedSubscript:", v183, CFSTR("recencyFeature"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v176);
            v184 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v177, "setObject:forKeyedSubscript:", v184, CFSTR("ranking"));

            v185 = objc_msgSend(v148, "count");
            *(float *)&v186 = v160;
            if (-[PGGraph isSocialGroupEligible:longevity:](self, "isSocialGroupEligible:longevity:", v185, v186))
              objc_msgSend(v310, "addObject:", v177);

          }
          v145 = objc_msgSend(v308, "countByEnumeratingWithState:objects:count:", &v323, v375, 16);
        }
        while (v145);
      }

      v187 = objc_msgSend(v310, "count");
      v188 = 0x1E0C99000;
      if (v187)
      {
        v374[0] = v299;
        v374[1] = v297;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v374, 2);
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v310, "sortUsingDescriptors:", v189);

        v188 = 0x1E0C99000uLL;
      }
      contextb = objc_alloc_init(*(Class *)(v188 + 3560));
      v190 = 0;
      v191 = 0;
      v192 = vcvtps_u32_f32((float)(unint64_t)objc_msgSend(v290, "count") / 3.0);
      if (v192 <= 3)
        v192 = 3;
      v194 = v192 < 4 && v292 < 8;
      v195 = v192 + 1;
      while (v191 < objc_msgSend(v310, "count"))
      {
        objc_msgSend(v310, "objectAtIndexedSubscript:", v191);
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v196, "objectForKeyedSubscript:", CFSTR("ranking"));
        v197 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v197, "floatValue");
        v199 = v198;

        objc_msgSend(v310, "objectAtIndexedSubscript:", v191);
        v200 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[PGGraph singlePersonGroupIsInSocialGroups:groups:](self, "singlePersonGroupIsInSocialGroups:groups:", v200, v290))
        {

        }
        else if (v199 >= -0.65)
        {
          objc_msgSend(v310, "objectAtIndexedSubscript:", v191);
          v202 = (void *)objc_claimAutoreleasedReturnValue();
          v203 = -[PGGraph singlePersonBelongsToSocialGroupOfMaxSize:groups:maxSize:](self, "singlePersonBelongsToSocialGroupOfMaxSize:groups:maxSize:", v202, v290, 2);

          if (v203 && !v194)
          {
LABEL_140:
            objc_msgSend(v310, "objectAtIndexedSubscript:", v191);
            v204 = (void *)objc_claimAutoreleasedReturnValue();
            v205 = -[PGGraph singlePersonGroupIsInSocialGroups:groups:](self, "singlePersonGroupIsInSocialGroups:groups:", v204, v293);

            if (!v205)
            {
              objc_msgSend(v310, "objectAtIndexedSubscript:", v191);
              v206 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v293, "addObject:", v206);

            }
            goto LABEL_137;
          }
        }
        else
        {

          if (!v194)
            goto LABEL_140;
        }
        objc_msgSend(v310, "objectAtIndexedSubscript:", v191);
        v201 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(contextb, "addObject:", v201);

        ++v190;
LABEL_137:
        ++v191;
        if (v190 == v195)
          break;
      }
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("recencyFeature"), 0);
      v312 = (void *)objc_claimAutoreleasedReturnValue();
      v373[0] = v312;
      v373[1] = v299;
      v373[2] = v297;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v373, 3);
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(contextb, "sortUsingDescriptors:", v207);

      v208 = objc_msgSend(contextb, "count");
      v209 = v208;
      if (v208)
      {
        v210 = 0;
        v211 = 0;
        v212 = v208 - 1;
        do
        {
          if (v209 < 4 || v210 < v212)
          {
            objc_msgSend(contextb, "objectAtIndexedSubscript:", v210);
            v216 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v298, "addObject:", v216);

            ++v211;
          }
          else
          {
            objc_msgSend(contextb, "objectAtIndexedSubscript:", v210);
            v213 = (void *)objc_claimAutoreleasedReturnValue();
            v214 = -[PGGraph singlePersonGroupIsInSocialGroups:groups:](self, "singlePersonGroupIsInSocialGroups:groups:", v213, v293);

            if (!v214)
            {
              objc_msgSend(contextb, "objectAtIndexedSubscript:", v210);
              v215 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v293, "addObject:", v215);

            }
          }
          ++v210;
        }
        while (v209 != v210);
      }
      else
      {
        v211 = 0;
      }
      v217 = objc_msgSend(v298, "count");
      v321 = 0u;
      v322 = 0u;
      v319 = 0u;
      v320 = 0u;
      v218 = v290;
      v219 = objc_msgSend(v218, "countByEnumeratingWithState:objects:count:", &v319, v372, 16);
      if (v219)
      {
        v220 = 0;
        v221 = *(_QWORD *)v320;
        do
        {
          for (kk = 0; kk != v219; ++kk)
          {
            if (*(_QWORD *)v320 != v221)
              objc_enumerationMutation(v218);
            v223 = *(void **)(*((_QWORD *)&v319 + 1) + 8 * kk);
            objc_msgSend(v223, "objectForKeyedSubscript:", CFSTR("personNodes"));
            v224 = (void *)objc_claimAutoreleasedReturnValue();
            if ((unint64_t)objc_msgSend(v224, "count") >= 2)
            {
              if (v220 < v292 - v217)
              {
                objc_msgSend(v298, "addObject:", v223);
                ++v220;
                goto LABEL_163;
              }
LABEL_162:
              objc_msgSend(v295, "addObject:", v223);
              goto LABEL_163;
            }
            if (objc_msgSend(v224, "count") == 1
              && !-[PGGraph singlePersonGroupIsInSocialGroups:groups:](self, "singlePersonGroupIsInSocialGroups:groups:", v223, v298))
            {
              goto LABEL_162;
            }
LABEL_163:

          }
          v219 = objc_msgSend(v218, "countByEnumeratingWithState:objects:count:", &v319, v372, 16);
        }
        while (v219);
      }

      v371[0] = v299;
      v371[1] = v297;
      v371[2] = v296;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v371, 3);
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v295, "sortUsingDescriptors:", v225);

      v226 = 0;
      v227 = 0;
      v228 = &obja[-v211];
      while (v227 < objc_msgSend(v295, "count"))
      {
        objc_msgSend(v295, "objectAtIndexedSubscript:", v227);
        v229 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("personNodes"));
        v230 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("momentNodes"));
        v231 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("ranking"));
        v232 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v232, "floatValue");
        v234 = v233;

        objc_msgSend(v229, "objectForKeyedSubscript:", CFSTR("longevity"));
        v235 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v235, "floatValue");
        v237 = v236;

        if ((unint64_t)objc_msgSend(v230, "count") >= 2
          && v226 < (uint64_t)v228
          && v234 >= v291
          && (v238 = objc_msgSend(v231, "count"),
              LODWORD(v239) = v237,
              -[PGGraph isSocialGroupEligible:longevity:](self, "isSocialGroupEligible:longevity:", v238, v239)))
        {
          objc_msgSend(v298, "addObject:", v229);
          ++v226;
        }
        else if ((unint64_t)objc_msgSend(v230, "count") > 1
               || !-[PGGraph singlePersonGroupIsInSocialGroups:groups:](self, "singlePersonGroupIsInSocialGroups:groups:", v229, v293))
        {
          objc_msgSend(v293, "addObject:", v229);
        }

        ++v227;
      }
      v370[0] = v312;
      v370[1] = v299;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v370, 2);
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v298, "sortUsingDescriptors:", v240);

      v369[0] = v312;
      v369[1] = v299;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v369, 2);
      v241 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v293, "sortUsingDescriptors:", v241);

      if (v301)
      {
        for (mm = 0; mm < objc_msgSend(v298, "count"); ++mm)
        {
          objc_msgSend(v298, "objectAtIndexedSubscript:", mm);
          v243 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v243, "objectForKeyedSubscript:", CFSTR("recencyFeature"));
          v244 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v244, "floatValue");
          v246 = v245;

          objc_msgSend(v243, "objectForKeyedSubscript:", CFSTR("personNodes"));
          v247 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v243, "objectForKeyedSubscript:", CFSTR("peopleWeights"));
          v248 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v243, "objectForKeyedSubscript:", CFSTR("momentNodes"));
          v249 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v243, "objectForKeyedSubscript:", CFSTR("groupCohesionScore"));
          v250 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v250, "floatValue");
          (*((void (**)(char *, void *, void *, void *, float, double))v301 + 2))(v301, v247, v248, v249, v246, v251);

        }
      }
      if (v300)
      {
        for (nn = 0; nn < objc_msgSend(v293, "count"); ++nn)
        {
          objc_msgSend(v293, "objectAtIndexedSubscript:", nn);
          v253 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v253, "objectForKeyedSubscript:", CFSTR("recencyFeature"));
          v254 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v254, "floatValue");
          v256 = v255;

          objc_msgSend(v253, "objectForKeyedSubscript:", CFSTR("personNodes"));
          v257 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v253, "objectForKeyedSubscript:", CFSTR("peopleWeights"));
          v258 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v253, "objectForKeyedSubscript:", CFSTR("momentNodes"));
          v259 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v253, "objectForKeyedSubscript:", CFSTR("groupCohesionScore"));
          v260 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v260, "floatValue");
          (*((void (**)(char *, void *, void *, void *, float, double))v300 + 2))(v300, v257, v258, v259, v256, v261);

        }
      }

    }
    v262 = mach_absolute_time();
    numer = v339.numer;
    denom = v339.denom;
    v265 = MEMORY[0x1E0C81028];
    if (v276 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_END, v275, "CandidatesValidation", ", buf, 2u);
    }

    v266 = MEMORY[0x1E0C81028];
    v267 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v266, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v384 = "CandidatesValidation";
      v385 = 2048;
      v386 = (float)((float)((float)((float)(v262 - v274) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    v268 = mach_absolute_time();
    v269 = info.numer;
    v270 = info.denom;
    v271 = v289;
    v272 = v271;
    if (v279 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v271))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v272, OS_SIGNPOST_INTERVAL_END, spid, "SocialGroupsV2", ", buf, 2u);
    }

    v273 = v272;
    if (os_log_type_enabled(v273, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v384 = "SocialGroupsV2";
      v385 = 2048;
      v386 = (float)((float)((float)((float)(v268 - v277) * (float)v269) / (float)v270) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v273, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    if (a8)
      *a8 = v361[6] / v357[6];

  }
  _Block_object_dispose(&v352, 8);

  _Block_object_dispose(&v356, 8);
  _Block_object_dispose(&v360, 8);

}

- (float)normalizeFeatureValue:(float)a3 average:(float)a4 featureValues:(id)a5 factor:(float)a6
{
  id v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  float v18;
  float v19;
  void *v20;
  float v21;
  float v22;
  float v23;

  v9 = a5;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v12 = v11;

    v13 = -1.0;
    if (v12 <= a3)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");
      v16 = v15;

      v13 = 1.0;
      if (v16 >= a3)
      {
        if (a3 < a4)
        {
          objc_msgSend(v9, "lastObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "floatValue");
          v19 = a4;
LABEL_9:
          v13 = (float)((float)(a3 - a4) / (float)(v19 - v18)) * a6;

          goto LABEL_10;
        }
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "floatValue");
        v22 = v21;

        v13 = 0.0;
        if (v22 != a4)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "floatValue");
          v19 = v23;
          v18 = a4;
          goto LABEL_9;
        }
      }
    }
  }
  else
  {
    v13 = -0.1;
  }
LABEL_10:

  return v13;
}

- (double)averageTopMomentTimes:(id)a3 numberOfMoments:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -315360000.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = v8;
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_244);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "count");
  if (v11 >= a4)
    v12 = a4;
  else
    v12 = v11;
  if (v12)
  {
    v13 = 0;
    v14 = 0.0;
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "universalStartDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSince1970");
      v14 = v14 + v17;

      ++v13;
    }
    while (v12 != v13);
    v18 = v14 / (double)v12;
  }
  else
  {
    v18 = 0.0;
  }
  if (v18 >= v9)
    v9 = v18;

  return v9;
}

- (float)recencyFeature:(double)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", -157680000.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "timeIntervalSince1970");
  *(float *)&a3 = (a3 - v9) / (v6 - v9);

  return *(float *)&a3;
}

- (double)longevity:(id)a3
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_245);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0.0;
    if ((unint64_t)objc_msgSend(v4, "count") >= 2)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "universalStartDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSince1970");
      v9 = v8;
      objc_msgSend(v4, "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "universalStartDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSince1970");
      v5 = v9 - v12;

    }
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (BOOL)singlePersonGroupIsInSocialGroups:(id)a3 groups:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("personNodes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("personNodes"), (_QWORD)v19);
        v15 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setWithArray:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v15) = objc_msgSend(v16, "isEqualToSet:", v8);
        if ((v15 & 1) != 0)
        {
          v17 = 1;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
        continue;
      break;
    }
  }
  v17 = 0;
LABEL_11:

  return v17;
}

- (BOOL)singlePersonBelongsToSocialGroupOfMaxSize:(id)a3 groups:(id)a4 maxSize:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("personNodes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("personNodes"), (_QWORD)v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setWithArray:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v18, "count") <= a5 && objc_msgSend(v10, "isSubsetOfSet:", v18))
        {

          v19 = 1;
          goto LABEL_12;
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v13)
        continue;
      break;
    }
  }
  v19 = 0;
LABEL_12:

  return v19;
}

- (BOOL)isSocialGroupEligible:(unint64_t)a3 longevity:(float)a4
{
  return a4 >= 0.083333 && a3 > 4;
}

- (NSSet)supersets
{
  void *v3;
  void *v4;

  -[PGGraph _checkCanRead](self, "_checkCanRead");
  +[PGGraphNodeCollection nodesInGraph:](PGGraphFrequentLocationNodeCollection, "nodesInGraph:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "temporarySet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (PGGraphLocationCityNodeCollection)supersetCityNodes
{
  os_unfair_lock_s *p_supersetLock;
  PGGraphLocationCityNodeCollection *supersetCityNodes;
  void *v5;
  void *v6;
  PGGraphLocationCityNodeCollection *v7;
  PGGraphLocationCityNodeCollection *v8;
  PGGraphLocationCityNodeCollection *v9;

  -[PGGraph _checkCanRead](self, "_checkCanRead");
  p_supersetLock = &self->_supersetLock;
  os_unfair_lock_lock(&self->_supersetLock);
  supersetCityNodes = self->_supersetCityNodes;
  if (!supersetCityNodes)
  {
    +[PGGraphNodeCollection nodesInGraph:](PGGraphFrequentLocationNodeCollection, "nodesInGraph:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addressNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cityNodes");
    v7 = (PGGraphLocationCityNodeCollection *)objc_claimAutoreleasedReturnValue();
    v8 = self->_supersetCityNodes;
    self->_supersetCityNodes = v7;

    supersetCityNodes = self->_supersetCityNodes;
  }
  v9 = supersetCityNodes;
  os_unfair_lock_unlock(p_supersetLock);
  return v9;
}

- (PGGraphLocationCountyNodeCollection)supersetCountyNodes
{
  os_unfair_lock_s *p_supersetLock;
  PGGraphLocationCountyNodeCollection *supersetCountyNodes;
  void *v5;
  void *v6;
  PGGraphLocationCountyNodeCollection *v7;
  PGGraphLocationCountyNodeCollection *v8;
  PGGraphLocationCountyNodeCollection *v9;

  -[PGGraph _checkCanRead](self, "_checkCanRead");
  p_supersetLock = &self->_supersetLock;
  os_unfair_lock_lock(&self->_supersetLock);
  supersetCountyNodes = self->_supersetCountyNodes;
  if (!supersetCountyNodes)
  {
    +[PGGraphNodeCollection nodesInGraph:](PGGraphFrequentLocationNodeCollection, "nodesInGraph:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addressNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "countyNodes");
    v7 = (PGGraphLocationCountyNodeCollection *)objc_claimAutoreleasedReturnValue();
    v8 = self->_supersetCountyNodes;
    self->_supersetCountyNodes = v7;

    supersetCountyNodes = self->_supersetCountyNodes;
  }
  v9 = supersetCountyNodes;
  os_unfair_lock_unlock(p_supersetLock);
  return v9;
}

- (PGGraphLocationStateNodeCollection)supersetStateNodes
{
  os_unfair_lock_s *p_supersetLock;
  PGGraphLocationStateNodeCollection *supersetStateNodes;
  void *v5;
  void *v6;
  PGGraphLocationStateNodeCollection *v7;
  PGGraphLocationStateNodeCollection *v8;
  PGGraphLocationStateNodeCollection *v9;

  -[PGGraph _checkCanRead](self, "_checkCanRead");
  p_supersetLock = &self->_supersetLock;
  os_unfair_lock_lock(&self->_supersetLock);
  supersetStateNodes = self->_supersetStateNodes;
  if (!supersetStateNodes)
  {
    +[PGGraphNodeCollection nodesInGraph:](PGGraphFrequentLocationNodeCollection, "nodesInGraph:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addressNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stateNodes");
    v7 = (PGGraphLocationStateNodeCollection *)objc_claimAutoreleasedReturnValue();
    v8 = self->_supersetStateNodes;
    self->_supersetStateNodes = v7;

    supersetStateNodes = self->_supersetStateNodes;
  }
  v9 = supersetStateNodes;
  os_unfair_lock_unlock(p_supersetLock);
  return v9;
}

- (PGGraphLocationCountryNodeCollection)supersetCountryNodes
{
  os_unfair_lock_s *p_supersetLock;
  PGGraphLocationCountryNodeCollection *supersetCountryNodes;
  void *v5;
  void *v6;
  PGGraphLocationCountryNodeCollection *v7;
  PGGraphLocationCountryNodeCollection *v8;
  PGGraphLocationCountryNodeCollection *v9;

  -[PGGraph _checkCanRead](self, "_checkCanRead");
  p_supersetLock = &self->_supersetLock;
  os_unfair_lock_lock(&self->_supersetLock);
  supersetCountryNodes = self->_supersetCountryNodes;
  if (!supersetCountryNodes)
  {
    +[PGGraphNodeCollection nodesInGraph:](PGGraphFrequentLocationNodeCollection, "nodesInGraph:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addressNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "countryNodes");
    v7 = (PGGraphLocationCountryNodeCollection *)objc_claimAutoreleasedReturnValue();
    v8 = self->_supersetCountryNodes;
    self->_supersetCountryNodes = v7;

    supersetCountryNodes = self->_supersetCountryNodes;
  }
  v9 = supersetCountryNodes;
  os_unfair_lock_unlock(p_supersetLock);
  return v9;
}

- (id)trips
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[5];

  v22[3] = *MEMORY[0x1E0C80C00];
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[PGGraph longTripNodes](self, "longTripNodes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v6), "collection");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "momentNodes");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = v9;
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22[1] = v10;
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v22[2] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "sortedArrayUsingDescriptors:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v13);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v16;
}

- (id)weekends
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[5];

  v22[3] = *MEMORY[0x1E0C80C00];
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[PGGraph shortTripNodes](self, "shortTripNodes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v6), "collection");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "momentNodes");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = v9;
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22[1] = v10;
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v22[2] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "sortedArrayUsingDescriptors:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v13);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  return v16;
}

- (id)celebratedHolidays
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[PGGraphNodeCollection nodesInGraph:](PGGraphHolidayNodeCollection, "nodesInGraph:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__PGGraph_Processing__celebratedHolidays__block_invoke;
  v7[3] = &unk_1E8430B70;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateIdentifiersAsCollectionsWithBlock:", v7);

  return v5;
}

- (id)inferredUserLocales
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PGGraph supersetCountryNodes](self, "supersetCountryNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locales");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "addObject:", v6);

  return v5;
}

- (unint64_t)_cluePeopleForRelationships:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "containsObject:", CFSTR("FAMILY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "containsObject:", CFSTR("FRIEND")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "containsObject:", CFSTR("PARTNER")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "containsObject:", CFSTR("COWORKER")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "containsObject:", CFSTR("ACQUAINTANCE")) & 1) != 0)
  {
    v4 = 32;
  }
  else if (objc_msgSend(v3, "containsObject:", CFSTR("VIP")))
  {
    v4 = 64;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)mainUrbanCityNodes
{
  id v3;
  NSObject *v4;
  id v5;
  os_signpost_id_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  mach_timebase_info v17;
  NSObject *v18;
  NSObject *v19;
  PGGraphLocationCityNodeCollection *v20;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[PGGraph _checkCanRead](self, "_checkCanRead");
  v3 = objc_alloc_init(MEMORY[0x1E0D429B0]);
  v4 = MEMORY[0x1E0C81028];
  v5 = MEMORY[0x1E0C81028];
  v6 = os_signpost_id_generate(v4);
  v7 = v4;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_BEGIN, v6, "MainUrbanCityNodes", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v22 = mach_absolute_time();
  v8 = (void *)MEMORY[0x1CAA4EB2C]();
  +[PGGraphROINode urbanFilter](PGGraphROINode, "urbanFilter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphROINodeCollection, "nodesMatchingFilter:inGraph:", v9, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "momentNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphLocationCityNode filter](PGGraphLocationCityNode, "filter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphLocationCityNodeCollection, "nodesMatchingFilter:inGraph:", v12, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __41__PGGraph_Processing__mainUrbanCityNodes__block_invoke;
  v23[3] = &unk_1E8430BA8;
  v24 = v11;
  v14 = v3;
  v25 = v14;
  v15 = v11;
  objc_msgSend(v13, "enumerateIdentifiersAsCollectionsWithBlock:", v23);

  objc_autoreleasePoolPop(v8);
  v16 = mach_absolute_time();
  v17 = info;
  v18 = v4;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_END, v6, "MainUrbanCityNodes", ", buf, 2u);
  }
  v19 = MEMORY[0x1E0C81028];

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "MainUrbanCityNodes";
    v29 = 2048;
    v30 = (float)((float)((float)((float)(v16 - v22) * (float)v17.numer) / (float)v17.denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v20 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphLocationCityNodeCollection alloc], "initWithGraph:elementIdentifiers:", self, v14);

  return v20;
}

- (id)interestingCityNodes
{
  void *v3;
  PGGraphLocationCityNodeCollection *interestingCityNodes;
  NSObject *v5;
  id v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  PGGraphLocationCityNodeCollection *v13;
  PGGraphLocationCityNodeCollection *v14;
  uint64_t v15;
  mach_timebase_info v16;
  id v17;
  PGGraphLocationCityNodeCollection *v18;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[PGGraph _checkCanRead](self, "_checkCanRead");
  -[PGGraph supersets](self, "supersets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  interestingCityNodes = self->_interestingCityNodes;
  if (!interestingCityNodes)
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
    v7 = os_signpost_id_generate(v5);
    v8 = v5;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_BEGIN, v7, "InterestingCityNodes", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v9 = mach_absolute_time();
    v10 = (void *)MEMORY[0x1CAA4EB2C]();
    -[PGGraph mainUrbanCityNodes](self, "mainUrbanCityNodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraph supersetCityNodes](self, "supersetCityNodes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "collectionBySubtracting:", v12);
    v13 = (PGGraphLocationCityNodeCollection *)objc_claimAutoreleasedReturnValue();
    v14 = self->_interestingCityNodes;
    self->_interestingCityNodes = v13;

    objc_autoreleasePoolPop(v10);
    v15 = mach_absolute_time();
    v16 = info;
    v17 = MEMORY[0x1E0C81028];
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_END, v7, "InterestingCityNodes", ", buf, 2u);
    }

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "InterestingCityNodes";
      v23 = 2048;
      v24 = (float)((float)((float)((float)(v15 - v9) * (float)v16.numer) / (float)v16.denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    interestingCityNodes = self->_interestingCityNodes;
  }
  v18 = interestingCityNodes;
  objc_sync_exit(v3);

  return v18;
}

- (id)interestingAreaNodes
{
  NSObject *v2;
  id v3;
  os_signpost_id_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  double v18;
  PGGraphAreaNodeCollection *v19;
  unint64_t v20;
  double v21;
  id v22;
  void *v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  double v30;
  uint64_t v31;
  uint32_t denom;
  uint32_t numer;
  id v34;
  uint64_t v36;
  os_signpost_id_t spid;
  void *context;
  unint64_t v39;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  id v51;
  id v52;
  _BYTE *v53;
  mach_timebase_info info;
  _BYTE v55[128];
  uint8_t v56[128];
  _BYTE buf[24];
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  -[PGGraph _checkCanRead](self, "_checkCanRead");
  v2 = MEMORY[0x1E0C81028];
  v3 = MEMORY[0x1E0C81028];
  v4 = os_signpost_id_generate(v2);
  v5 = v2;
  spid = v4;
  v39 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_BEGIN, v4, "InterestingAreaNodes", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v36 = mach_absolute_time();
  context = (void *)MEMORY[0x1CAA4EB2C]();
  -[PGGraph supersetCityNodes](self, "supersetCityNodes");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addressNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
  +[PGGraphAreaNode nonBlockedFilter](PGGraphAreaNode, "nonBlockedFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphAreaNodeCollection, "nodesMatchingFilter:inGraph:", v8, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v58 = 0;
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __43__PGGraph_Processing__interestingAreaNodes__block_invoke;
  v50[3] = &unk_1E8430BD0;
  v10 = v6;
  v51 = v10;
  v53 = buf;
  v11 = v7;
  v52 = v11;
  objc_msgSend(v9, "enumerateIdentifiersAsCollectionsWithBlock:", v50);
  v12 = objc_msgSend(v11, "count");
  if (v12)
  {
    *(double *)(*(_QWORD *)&buf[8] + 24) = *(double *)(*(_QWORD *)&buf[8] + 24) / (double)v12;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v11, "objectEnumerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v47;
      v16 = 0.0;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v47 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "doubleValue");
          v16 = v16 + (v18 - *(double *)(*(_QWORD *)&buf[8] + 24)) * (v18 - *(double *)(*(_QWORD *)&buf[8] + 24));
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      }
      while (v14);
    }
    else
    {
      v16 = 0.0;
    }

    v20 = objc_msgSend(v11, "count");
    v21 = *(double *)(*(_QWORD *)&buf[8] + 24);
    v22 = objc_alloc_init(MEMORY[0x1E0D429B0]);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v11, "keyEnumerator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
    if (v24)
    {
      v25 = v21 + sqrt(v16 / (double)v20) * 0.5;
      v26 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v43 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
          objc_msgSend(v11, "objectForKey:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "doubleValue");
          if (v30 >= v25)
            objc_msgSend(v22, "addIdentifier:", objc_msgSend(v28, "unsignedIntegerValue"));

        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
      }
      while (v24);
    }

    if (objc_msgSend(v22, "count"))
      v19 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphAreaNodeCollection alloc], "initWithGraph:elementIdentifiers:", self, v22);
    else
      v19 = 0;

  }
  else
  {
    v19 = 0;
  }

  _Block_object_dispose(buf, 8);
  objc_autoreleasePoolPop(context);
  v31 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v34 = MEMORY[0x1E0C81028];
  if (v39 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_END, spid, "InterestingAreaNodes", ", buf, 2u);
  }

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "InterestingAreaNodes";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v31 - v36) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  if (!v19)
    v19 = -[MAElementCollection initWithGraph:]([PGGraphAreaNodeCollection alloc], "initWithGraph:", self);

  return v19;
}

void __43__PGGraph_Processing__interestingAreaNodes__block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v5 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v16, "addressNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionBySubtracting:", a1[4]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "momentNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  if (v9 >= 3)
  {
    v10 = v9;
    objc_msgSend(v8, "universalDateInterval");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "duration");
    if (v12 >= 7776000.0)
    {
      *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = *(double *)(*(_QWORD *)(a1[6] + 8) + 24) + (double)v10;
      v13 = (void *)a1[5];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v14, v15);

    }
  }

  objc_autoreleasePoolPop(v5);
}

void __41__PGGraph_Processing__mainUrbanCityNodes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  double v7;
  id v8;

  objc_msgSend(a3, "momentNodes");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionByIntersecting:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") >= 3)
  {
    objc_msgSend(v5, "universalDateInterval");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "duration");
    if (v7 >= 7776000.0)
      objc_msgSend(*(id *)(a1 + 40), "addIdentifier:", a2);

  }
}

void __41__PGGraph_Processing__celebratedHolidays__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "celebratingMomentNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v6;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "sortedArrayUsingDescriptors:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
  }

}

uint64_t __33__PGGraph_Processing__longevity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "universalStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "universalEndDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __61__PGGraph_Processing__averageTopMomentTimes_numberOfMoments___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "universalStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "universalEndDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __151__PGGraph_Processing__enumerateSocialGroupsIncludingMeNode_socialGroupsVersion_simulateMeNodeNotSet_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, float a5, float a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  int v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[6];
  _QWORD v52[6];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = v13;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24)
                                                             + a5;
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  if (*(float *)(v15 + 24) == 0.0)
    *(float *)(v15 + 24) = a5;
  v16 = *(_QWORD *)(a1 + 104);
  if (v16 == 1)
  {
    v17 = *(void **)(a1 + 32);
    v18 = (void *)MEMORY[0x1E0CB37E8];
    *(float *)&v19 = (float)(unint64_t)objc_msgSend(v13, "count");
    objc_msgSend(v18, "numberWithFloat:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v20);

    v21 = *(void **)(a1 + 40);
    *(float *)&v22 = a6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v23);

    v16 = *(_QWORD *)(a1 + 104);
  }
  if (v16)
  {
    if (!objc_msgSend(v11, "count"))
      goto LABEL_38;
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v26 = *(id *)(a1 + 48);
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v48;
    while (2)
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v48 != v29)
          objc_enumerationMutation(v26);
        if ((objc_msgSend(v25, "isSubsetOfSet:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i)) & 1) != 0)
        {

          v31 = 1;
          goto LABEL_18;
        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
      if (v28)
        continue;
      break;
    }
  }

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v25);
  v31 = 0;
LABEL_18:

  if (*(_QWORD *)(a1 + 104) || objc_msgSend(v11, "count") != 1)
  {
LABEL_31:
    if (objc_msgSend(v11, "count"))
    {
      if (!v31)
      {
LABEL_35:
        v37 = 0;
        goto LABEL_36;
      }
      if (*(_QWORD *)(a1 + 72))
      {
        v37 = 1;
LABEL_36:
        v38 = *(void **)(a1 + 64);
        v51[0] = CFSTR("personNodes");
        v51[1] = CFSTR("peopleWeights");
        v52[0] = v11;
        v52[1] = v12;
        v52[2] = v14;
        v51[2] = CFSTR("momentNodes");
        v51[3] = CFSTR("frequency");
        *(float *)&v24 = a5;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
        v32 = (id)objc_claimAutoreleasedReturnValue();
        v52[3] = v32;
        v51[4] = CFSTR("longevity");
        *(float *)&v39 = a6;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v52[4] = v40;
        v51[5] = CFSTR("isSubset");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v37);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v52[5] = v41;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 6);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addObject:", v42);

LABEL_37:
      }
    }
  }
  else if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v32 = v14;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v44;
      while (2)
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v44 != v35)
            objc_enumerationMutation(v32);
          if ((objc_msgSend(*(id *)(a1 + 56), "containsNode:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j), (_QWORD)v43) & 1) != 0)
          {

            goto LABEL_31;
          }
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
        if (v34)
          continue;
        break;
      }
    }
    goto LABEL_37;
  }
LABEL_38:

}

uint64_t __151__PGGraph_Processing__enumerateSocialGroupsIncludingMeNode_socialGroupsVersion_simulateMeNodeNotSet_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "count");
  if (v6 >= objc_msgSend(v5, "count"))
  {
    v8 = objc_msgSend(v4, "count");
    if (v8 <= objc_msgSend(v5, "count"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t __151__PGGraph_Processing__enumerateSocialGroupsIncludingMeNode_socialGroupsVersion_simulateMeNodeNotSet_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "count");
  if (v6 >= objc_msgSend(v5, "count"))
  {
    v8 = objc_msgSend(v4, "count");
    v7 = v8 > objc_msgSend(v5, "count");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

uint64_t __151__PGGraph_Processing__enumerateSocialGroupsIncludingMeNode_socialGroupsVersion_simulateMeNodeNotSet_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __151__PGGraph_Processing__enumerateSocialGroupsIncludingMeNode_socialGroupsVersion_simulateMeNodeNotSet_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke_234(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __110__PGGraph_Processing__enumerateSocialGroupsIncludingMeNode_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __110__PGGraph_Processing__enumerateSocialGroupsIncludingMeNode_validGroupsBlock_invalidGroupsBlock_averageWeight___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75__PGGraph_Processing__enumerateSocialGroupsWithBlock_includeInvalidGroups___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75__PGGraph_Processing__enumerateSocialGroupsWithBlock_includeInvalidGroups___block_invoke_2(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __133__PGGraph_Processing__enumeratePeopleClustersWithLinkage_threshold_includingMeNode_socialGroupsVersion_singlePersonGroups_withBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "targetsForSourceIdentifier:", objc_msgSend(v10, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v10);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v6);

      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    }
    *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) > 0x3E8uLL;
  }

}

double __133__PGGraph_Processing__enumeratePeopleClustersWithLinkage_threshold_includingMeNode_socialGroupsVersion_singlePersonGroups_withBlock___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  id v23;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("personNodes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("personNodes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40) == 1)
  {
    if ((objc_msgSend(v7, "isSubsetOfSet:", v8) & 1) != 0
      || (v9 = 3.0, objc_msgSend(v8, "isSubsetOfSet:", v7)))
    {
      objc_msgSend(*(id *)(a1 + 32), "peopleDistance:withSecondBaseGroup:threshold:factor:", v5, v6, 0.28, 0.5);
      v11 = v10 + 0.0;
      objc_msgSend(*(id *)(a1 + 32), "momentsCountDistance:withSecondBaseGroup:withSubsetBias:withDistanceThreshold:withIntersectionBias:withKey:", v5, v6, CFSTR("momentNodes"), 0.0, 0.66, 0.2);
      v9 = v11 + v12;
    }
  }
  else
  {
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("relationships"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "_cluePeopleForRelationships:", v14);

    v16 = *(void **)(a1 + 32);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("relationships"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "_cluePeopleForRelationships:", v17);

    if (v18 | v15)
      v9 = 0.0;
    else
      v9 = 0.33;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "unionSet:", v8);
    v20 = objc_msgSend(v19, "count");
    if (v20)
    {
      v21 = v20;
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "intersectSet:", v8);
      v23 = v19;
      objc_msgSend(v23, "minusSet:", v22);
      v9 = v9 + ((double)(v21 + 1) / (double)(v21 + 1 - objc_msgSend(v23, "count")) + -1.0) / (double)v21;

    }
    else
    {
      v23 = 0;
    }

  }
  return v9;
}

uint64_t __133__PGGraph_Processing__enumeratePeopleClustersWithLinkage_threshold_includingMeNode_socialGroupsVersion_singlePersonGroups_withBlock___block_invoke_2_224(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __133__PGGraph_Processing__enumeratePeopleClustersWithLinkage_threshold_includingMeNode_socialGroupsVersion_singlePersonGroups_withBlock___block_invoke_221(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "count");
  if (v6 >= objc_msgSend(v5, "count"))
  {
    v8 = objc_msgSend(v4, "count");
    if (v8 <= objc_msgSend(v5, "count"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t __133__PGGraph_Processing__enumeratePeopleClustersWithLinkage_threshold_includingMeNode_socialGroupsVersion_singlePersonGroups_withBlock___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "objects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKeyPath:", CFSTR("@sum.momentNodes.@count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "valueForKeyPath:", CFSTR("@sum.momentNodes.@count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "compare:", v6);
  return v9;
}

id __133__PGGraph_Processing__enumeratePeopleClustersWithLinkage_threshold_includingMeNode_socialGroupsVersion_singlePersonGroups_withBlock___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = a5;
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (a4)
  {
    v9 = 0;
    do
    {
      objc_msgSend(v20, "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(a2 + 8 * a3) + 8 * v9));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("momentNodes"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v11);

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("personNodes"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v22;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v22 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(v8, "addObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16++));
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v14);
      }

      ++v9;
    }
    while (v9 != a4);
  }
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v8, CFSTR("personNodes"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v7, CFSTR("momentNodes"));

  return v18;
}

uint64_t __133__PGGraph_Processing__enumeratePeopleClustersWithLinkage_threshold_includingMeNode_socialGroupsVersion_singlePersonGroups_withBlock___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;

  v5 = *(_QWORD *)(a2 + 8 * a3);
  if (a4)
  {
    v8 = 0;
    v9 = 0;
    for (i = 0; i != a4; ++i)
    {
      objc_msgSend(a5, "objectAtIndexedSubscript:", *(_QWORD *)(v5 + 8 * i));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("personNodes"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count") > v8)
      {
        v8 = objc_msgSend(v12, "count");
        v9 = i;
      }

    }
  }
  else
  {
    v9 = 0;
  }
  return *(_QWORD *)(v5 + 8 * v9);
}

uint64_t __133__PGGraph_Processing__enumeratePeopleClustersWithLinkage_threshold_includingMeNode_socialGroupsVersion_singlePersonGroups_withBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "universalStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "universalEndDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

uint64_t __133__PGGraph_Processing__enumeratePeopleClustersWithLinkage_threshold_includingMeNode_socialGroupsVersion_singlePersonGroups_withBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "count");
  if (v6 >= objc_msgSend(v5, "count"))
  {
    v8 = objc_msgSend(v4, "count");
    v7 = v8 > objc_msgSend(v5, "count");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

uint64_t __133__PGGraph_Processing__enumeratePeopleClustersWithLinkage_threshold_includingMeNode_socialGroupsVersion_singlePersonGroups_withBlock___block_invoke_203(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "count");
  if (v6 >= objc_msgSend(v5, "count"))
  {
    v8 = objc_msgSend(v4, "count");
    v7 = v8 > objc_msgSend(v5, "count");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

+ (id)_closestRelationshipEdgeLabelForPersonNode:(id)a3 andOtherPersonNode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "graph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_personClosestToMeBetweenPersonNode:andOtherPersonNode:", v5, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (objc_msgSend(v5, "isSameNodeAsNode:", v10))
      v11 = v6;
    else
      v11 = v5;
    v12 = v11;
    objc_msgSend(v10, "anyEdgeFromNode:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "label");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "anyEdgeFromNode:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "label");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v17 = CFSTR("ACQUAINTANCE");
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("PARTNER"))
      && !-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("COWORKER")))
    {
      v17 = v16;
    }
    v18 = v17;

  }
  else
  {
    objc_msgSend(v5, "anyEdgeFromNode:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "label");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

+ (id)_personClosestToMeBetweenPersonNode:(id)a3 andOtherPersonNode:(id)a4
{
  id v5;
  id v6;
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
  uint64_t v19;
  id v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[7];

  v28[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "graph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "anyEdgeFromNode:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "anyEdgeFromNode:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = CFSTR("PARTNER");
  v28[1] = CFSTR("FAMILY");
  v28[2] = CFSTR("FRIEND");
  v28[3] = CFSTR("COWORKER");
  v28[4] = CFSTR("ACQUAINTANCE");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 5);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v15)
  {
    v20 = 0;
    goto LABEL_15;
  }
  v16 = v15;
  v17 = *(_QWORD *)v24;
  while (2)
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v24 != v17)
        objc_enumerationMutation(v14);
      v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
      if ((objc_msgSend(v11, "isEqualToString:", v19, (_QWORD)v23) & 1) != 0)
      {
        v21 = v5;
LABEL_14:
        v20 = v21;
        goto LABEL_15;
      }
      if ((objc_msgSend(v13, "isEqualToString:", v19) & 1) != 0)
      {
        v21 = v6;
        goto LABEL_14;
      }
    }
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    v20 = 0;
    if (v16)
      continue;
    break;
  }
LABEL_15:

  return v20;
}

- (id)meaningfulEvents
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id obj;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend((id)objc_opt_class(), "availableInferredMeaningLabels");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        -[MAGraph nodesForLabel:domain:](self, "nodesForLabel:domain:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8), 700);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "anyObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v13[0] = v7;
        v13[1] = 3221225472;
        v13[2] = __36__PGGraph_Meaning__meaningfulEvents__block_invoke;
        v13[3] = &unk_1E8431308;
        v14 = v3;
        objc_msgSend(v10, "enumerateMeaningfulEventsUsingBlock:", v13);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  return v3;
}

- (BOOL)eventIsVeryMeaningful:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend((id)objc_opt_class(), "veryMeaningfulMeanings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__PGGraph_Meaning__eventIsVeryMeaningful___block_invoke;
  v8[3] = &unk_1E8431330;
  v10 = &v11;
  v6 = v5;
  v9 = v6;
  -[PGGraph enumerateMeaningsFromMeaningfulEvent:usingBlock:](self, "enumerateMeaningsFromMeaningfulEvent:usingBlock:", v4, v8);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

- (BOOL)eventIsStellar:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend((id)objc_opt_class(), "stellarMeanings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__PGGraph_Meaning__eventIsStellar___block_invoke;
  v8[3] = &unk_1E8431330;
  v10 = &v11;
  v6 = v5;
  v9 = v6;
  -[PGGraph enumerateMeaningsFromMeaningfulEvent:usingBlock:](self, "enumerateMeaningsFromMeaningfulEvent:usingBlock:", v4, v8);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

- (void)enumerateMeaningfulEventsWithMeaning:(unint64_t)a3 usingBlock:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  PGMeaningLabelForMeaning(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraph _enumerateMeaningfulEventsWithMeaningLabel:visitedMeaningfulEvents:usingBlock:](self, "_enumerateMeaningfulEventsWithMeaningLabel:visitedMeaningfulEvents:usingBlock:", v6, v7, v8);

  }
}

- (id)meaningsFromMeaningfulEvent:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = (void *)MEMORY[0x1E0CB3788];
  v5 = a3;
  objc_msgSend(v4, "indexSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__PGGraph_Meaning__meaningsFromMeaningfulEvent___block_invoke;
  v9[3] = &unk_1E8434FA8;
  v7 = v6;
  v10 = v7;
  -[PGGraph enumerateMeaningsFromMeaningfulEvent:usingBlock:](self, "enumerateMeaningsFromMeaningfulEvent:usingBlock:", v5, v9);

  return v7;
}

- (void)enumerateMeaningsFromMeaningfulEvent:(id)a3 usingBlock:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB3788];
  v7 = a3;
  objc_msgSend(v6, "indexSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__PGGraph_Meaning__enumerateMeaningsFromMeaningfulEvent_usingBlock___block_invoke;
  v11[3] = &unk_1E84313A8;
  v12 = v8;
  v13 = v5;
  v9 = v5;
  v10 = v8;
  objc_msgSend(v7, "enumerateMeaningNodesUsingBlock:", v11);

}

- (id)momentNodesWithMeaning:(unint64_t)a3
{
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__PGGraph_Meaning__momentNodesWithMeaning___block_invoke;
  v8[3] = &unk_1E8436408;
  v6 = v5;
  v9 = v6;
  -[PGGraph enumerateMomentNodesWithMeaning:usingBlock:](self, "enumerateMomentNodesWithMeaning:usingBlock:", a3, v8);

  return v6;
}

- (void)enumerateMomentNodesWithMeaning:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__PGGraph_Meaning__enumerateMomentNodesWithMeaning_usingBlock___block_invoke;
  v8[3] = &unk_1E84313F8;
  v9 = v6;
  v7 = v6;
  -[PGGraph enumerateMeaningfulEventsWithMeaning:usingBlock:](self, "enumerateMeaningfulEventsWithMeaning:usingBlock:", a3, v8);

}

- (id)bestMeaningLabelForMeaningfulEvent:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  uint64_t *v11;
  _QWORD v12[4];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__52132;
  v17 = __Block_byref_object_dispose__52133;
  v18 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend((id)objc_opt_class(), "availableInferredMeaningLabels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PGGraph_Meaning__bestMeaningLabelForMeaningfulEvent___block_invoke;
  v8[3] = &unk_1E8431420;
  v5 = v4;
  v9 = v5;
  v10 = v12;
  v11 = &v13;
  objc_msgSend(v3, "enumerateMeaningNodesUsingBlock:", v8);
  v6 = (id)v14[5];

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v13, 8);

  return v6;
}

- (id)meaningfulEventNodeForUUID:(id)a3
{
  void *v3;
  void *v4;

  +[PGGraphMomentNodeCollection momentNodeForUUID:inGraph:](PGGraphMomentNodeCollection, "momentNodeForUUID:inGraph:", a3, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_enumerateMeaningfulEventsWithMeaningLabel:(id)a3 visitedMeaningfulEvents:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  PGGraph *v14;
  id v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__PGGraph_Meaning___enumerateMeaningfulEventsWithMeaningLabel_visitedMeaningfulEvents_usingBlock___block_invoke;
  v12[3] = &unk_1E84314C0;
  v14 = self;
  v15 = v9;
  v13 = v8;
  v10 = v9;
  v11 = v8;
  -[MAGraph enumerateNodesWithLabel:domain:usingBlock:](self, "enumerateNodesWithLabel:domain:usingBlock:", a3, 700, v12);

}

void __98__PGGraph_Meaning___enumerateMeaningfulEventsWithMeaningLabel_visitedMeaningfulEvents_usingBlock___block_invoke(uint64_t a1, void *a2, char *a3)
{
  id v5;
  uint64_t v6;
  char v7;
  id v8;
  int8x16_t v9;
  _QWORD v10[4];
  int8x16_t v11;
  id v12;
  uint64_t *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v5 = a2;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v6 = MEMORY[0x1E0C809B0];
  v21 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __98__PGGraph_Meaning___enumerateMeaningfulEventsWithMeaningLabel_visitedMeaningfulEvents_usingBlock___block_invoke_2;
  v14[3] = &unk_1E8431448;
  v15 = *(id *)(a1 + 32);
  v16 = *(id *)(a1 + 48);
  v17 = &v18;
  objc_msgSend(v5, "enumerateMeaningfulEventsUsingBlock:", v14);
  if (*((_BYTE *)v19 + 24))
  {
    v7 = 1;
  }
  else
  {
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __98__PGGraph_Meaning___enumerateMeaningfulEventsWithMeaningLabel_visitedMeaningfulEvents_usingBlock___block_invoke_3;
    v10[3] = &unk_1E8431498;
    v9 = *(int8x16_t *)(a1 + 32);
    v8 = (id)v9.i64[0];
    v11 = vextq_s8(v9, v9, 8uLL);
    v12 = *(id *)(a1 + 48);
    v13 = &v18;
    objc_msgSend(v5, "enumerateSubmeaningsUsingBlock:", v10);

    v7 = *((_BYTE *)v19 + 24);
  }
  *a3 = v7;

  _Block_object_dispose(&v18, 8);
}

void __98__PGGraph_Meaning___enumerateMeaningfulEventsWithMeaningLabel_visitedMeaningfulEvents_usingBlock___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;

  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }

}

void __98__PGGraph_Meaning___enumerateMeaningfulEventsWithMeaningLabel_visitedMeaningfulEvents_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(a3, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __98__PGGraph_Meaning___enumerateMeaningfulEventsWithMeaningLabel_visitedMeaningfulEvents_usingBlock___block_invoke_4;
  v11[3] = &unk_1E8431470;
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v12 = v9;
  v13 = v10;
  v14 = a4;
  objc_msgSend(v6, "_enumerateMeaningfulEventsWithMeaningLabel:visitedMeaningfulEvents:usingBlock:", v7, v8, v11);

}

uint64_t __98__PGGraph_Meaning___enumerateMeaningfulEventsWithMeaningLabel_visitedMeaningfulEvents_usingBlock___block_invoke_4(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  _BYTE *v6;

  result = (*(uint64_t (**)(void))(a1[4] + 16))();
  v6 = (_BYTE *)a1[6];
  *a3 = *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24);
  *v6 = *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24);
  return result;
}

void __55__PGGraph_Meaning__bestMeaningLabelForMeaningfulEvent___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  id obj;

  objc_msgSend(a2, "label");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:");
  if (v3 < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v4 = v3;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  }

}

void __63__PGGraph_Meaning__enumerateMomentNodesWithMeaning_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  objc_msgSend(a2, "eventCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventMomentNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__PGGraph_Meaning__enumerateMomentNodesWithMeaning_usingBlock___block_invoke_2;
  v7[3] = &unk_1E84313D0;
  v8 = *(id *)(a1 + 32);
  v9 = a3;
  objc_msgSend(v6, "enumerateNodesUsingBlock:", v7);

}

uint64_t __63__PGGraph_Meaning__enumerateMomentNodesWithMeaning_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  **(_BYTE **)(a1 + 40) = *a3;
  return result;
}

uint64_t __43__PGGraph_Meaning__momentNodesWithMeaning___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __68__PGGraph_Meaning__enumerateMeaningsFromMeaningfulEvent_usingBlock___block_invoke(uint64_t a1, void *a2, char *a3)
{
  id v5;
  uint64_t v6;
  void (**v7)(void *, void *);
  void *v8;
  char v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  void (**v13)(void *, void *);
  uint64_t *v14;
  _QWORD aBlock[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v5 = a2;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v6 = MEMORY[0x1E0C809B0];
  v22 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PGGraph_Meaning__enumerateMeaningsFromMeaningfulEvent_usingBlock___block_invoke_2;
  aBlock[3] = &unk_1E8431358;
  v16 = *(id *)(a1 + 32);
  v17 = *(id *)(a1 + 40);
  v18 = &v19;
  v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(v5, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v8);

  if (*((_BYTE *)v20 + 24))
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v5, "collection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "parentMeaningNodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __68__PGGraph_Meaning__enumerateMeaningsFromMeaningfulEvent_usingBlock___block_invoke_3;
    v12[3] = &unk_1E8431380;
    v13 = v7;
    v14 = &v19;
    objc_msgSend(v11, "enumerateNodesUsingBlock:", v12);

    v9 = *((_BYTE *)v20 + 24);
  }
  *a3 = v9;

  _Block_object_dispose(&v19, 8);
}

uint64_t __68__PGGraph_Meaning__enumerateMeaningsFromMeaningfulEvent_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = PGMeaningForMeaningLabel(a2);
  if (result)
  {
    v4 = result;
    result = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", result);
    if ((result & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "addIndex:", v4);
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  return result;
}

void __68__PGGraph_Meaning__enumerateMeaningsFromMeaningfulEvent_usingBlock___block_invoke_3(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  void *v6;

  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

uint64_t __48__PGGraph_Meaning__meaningsFromMeaningfulEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a2);
}

uint64_t __35__PGGraph_Meaning__eventIsStellar___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __42__PGGraph_Meaning__eventIsVeryMeaningful___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __36__PGGraph_Meaning__meaningfulEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (id)allMeaningfulMeanings
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 1, 16);
}

+ (id)veryMeaningfulMeanings
{
  if (veryMeaningfulMeanings_onceToken != -1)
    dispatch_once(&veryMeaningfulMeanings_onceToken, &__block_literal_global_52137);
  return (id)veryMeaningfulMeanings_meanings;
}

+ (id)lessMeaningfulMeanings
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "allMeaningfulMeanings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "veryMeaningfulMeanings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v5, "removeIndexes:", v4);

  return v5;
}

+ (id)stellarMeanings
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "allMeaningfulMeanings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(v3, "removeIndex:", 16);
  objc_msgSend(v3, "removeIndex:", 15);
  objc_msgSend(v3, "removeIndex:", 0);

  return v3;
}

+ (id)frequentMeaningLabels
{
  if (frequentMeaningLabels_onceToken != -1)
    dispatch_once(&frequentMeaningLabels_onceToken, &__block_literal_global_171);
  return (id)frequentMeaningLabels_frequentMeaningLabels;
}

+ (id)mostSignificantMeaningLabels
{
  if (mostSignificantMeaningLabels_onceToken != -1)
    dispatch_once(&mostSignificantMeaningLabels_onceToken, &__block_literal_global_173);
  return (id)mostSignificantMeaningLabels_mostSignificantMeaningLabels;
}

+ (id)preciseMeaningNodeForMeaningLabel:(id)a3 meaningfulEvent:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__52132;
  v17 = __Block_byref_object_dispose__52133;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__PGGraph_Meaning__preciseMeaningNodeForMeaningLabel_meaningfulEvent___block_invoke;
  v10[3] = &unk_1E8432138;
  v12 = &v13;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "enumerateMeaningNodesUsingBlock:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

+ (id)meaningLabelForMeaning:(unint64_t)a3
{
  return PGMeaningLabelForMeaning(a3);
}

+ (unint64_t)meaningForMeaningLabel:(id)a3
{
  return PGMeaningForMeaningLabel(a3);
}

+ (id)availableInferredMeaningLabels
{
  void *v2;
  void *v3;
  void *v4;
  PGEventLabelingConfiguration *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend((id)objc_opt_class(), "availableMeaningLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[PGEventLabelingConfiguration isEventLabelingEnabled](PGEventLabelingConfiguration, "isEventLabelingEnabled"))
  {
    v5 = objc_alloc_init(PGEventLabelingConfiguration);
    -[PGEventLabelingConfiguration meaningLabels](v5, "meaningLabels");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", v6);

  }
  objc_msgSend(v4, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __70__PGGraph_Meaning__preciseMeaningNodeForMeaningLabel_meaningfulEvent___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  id v14;

  v6 = a2;
  objc_msgSend(v6, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v14 = v8;
  if (v8)
  {
    v9 = v8;
    do
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
        break;
      objc_msgSend(v9, "parentMeaningNode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "label");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v11))
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v9);

      v9 = v10;
    }
    while (v10);
  }
  else
  {
    v9 = 0;
  }
  v12 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(*(_QWORD *)(v12 + 8) + 40))
  {
    v13 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v7);
    v12 = *(_QWORD *)(a1 + 40);
    if (v13)
    {
      objc_storeStrong((id *)(*(_QWORD *)(v12 + 8) + 40), a2);
      v12 = *(_QWORD *)(a1 + 40);
    }
  }
  *a3 = *(_QWORD *)(*(_QWORD *)(v12 + 8) + 40) != 0;

}

void __48__PGGraph_Meaning__mostSignificantMeaningLabels__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Wedding"), CFSTR("Celebration"), CFSTR("Birthday"), CFSTR("HolidayEvent"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mostSignificantMeaningLabels_mostSignificantMeaningLabels;
  mostSignificantMeaningLabels_mostSignificantMeaningLabels = v0;

}

void __41__PGGraph_Meaning__frequentMeaningLabels__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Restaurant"), CFSTR("Lunch"), CFSTR("Dinner"), CFSTR("Breakfast"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)frequentMeaningLabels_frequentMeaningLabels;
  frequentMeaningLabels_frequentMeaningLabels = v0;

}

uint64_t __42__PGGraph_Meaning__veryMeaningfulMeanings__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)veryMeaningfulMeanings_meanings;
  veryMeaningfulMeanings_meanings = v0;

  objc_msgSend((id)veryMeaningfulMeanings_meanings, "addIndex:", 12);
  objc_msgSend((id)veryMeaningfulMeanings_meanings, "addIndex:", 11);
  objc_msgSend((id)veryMeaningfulMeanings_meanings, "addIndex:", 14);
  return objc_msgSend((id)veryMeaningfulMeanings_meanings, "addIndex:", 10);
}

- (void)reportMetricsLogsWithAnalytics:(id)a3 photoLibrary:(id)a4 serviceManager:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PGGraph _reportLibraryWithAnalytics:](self, "_reportLibraryWithAnalytics:", v10);
  -[PGGraph _reportMobilityWithAnalytics:](self, "_reportMobilityWithAnalytics:", v10);
  -[PGGraph _reportDisambiguatedLocationsWithAnalytics:](self, "_reportDisambiguatedLocationsWithAnalytics:", v10);
  -[PGGraph _reportBusinessItemsWithAnalytics:](self, "_reportBusinessItemsWithAnalytics:", v10);
  -[PGGraph _reportDeviceOwnerWithAnalytics:photoLibrary:serviceManager:](self, "_reportDeviceOwnerWithAnalytics:photoLibrary:serviceManager:", v10, v9, v8);

}

- (void)_reportLibraryWithAnalytics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGGraph infoNode](self, "infoNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("numberOfUtilityAssets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "numberOfUtilityAssets"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v11[1] = CFSTR("numberOfDefaultAssets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "numberOfDefaultAssets"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  v11[2] = CFSTR("numberOfImprovedAssets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "numberOfImprovedAssets"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  v11[3] = CFSTR("numberOfBetterAssets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "numberOfBetterAssets"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendEvent:withPayload:", CFSTR("com.apple.Photos.Intelligence.library"), v10);

}

- (void)_reportDeviceOwnerWithAnalytics:(id)a3 photoLibrary:(id)a4 serviceManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[5];
  _QWORD v37[5];
  uint8_t buf[4];
  void *v39;
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PGGraph meNode](self, "meNode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "ratioOfAssetsWithFacesProcessed");
  v14 = v13;
  if (objc_msgSend(v12, "length") && v14 >= 0.9)
  {
    objc_msgSend(v9, "librarySpecificFetchOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPersonContext:", 1);
    objc_msgSend(v15, "setFetchLimit:", 1);
    objc_msgSend(v15, "setShouldPrefetchCount:", 1);
    v16 = (void *)MEMORY[0x1E0CD16C0];
    v40[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fetchPersonsWithLocalIdentifiers:options:", v17, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "count"))
    {
      v34 = v18;
      v35 = v10;
      objc_msgSend(v10, "inferredDeviceOwnerForPhotoLibrary:ignoreContactLinking:", v9, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localIdentifier");
      v20 = objc_claimAutoreleasedReturnValue();

      -[PGGraph inferMeNodeFromSocialGroups](self, "inferMeNodeFromSocialGroups");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = objc_msgSend(v22, "length");
      if (v23)
        v24 = objc_msgSend(v22, "isEqualToString:", v12);
      else
        v24 = 0;
      v26 = -[NSObject length](v20, "length");
      v33 = v22;
      if (v26)
        v27 = -[NSObject isEqualToString:](v20, "isEqualToString:", v12, v22);
      else
        v27 = 0;
      v37[0] = MEMORY[0x1E0C9AAB0];
      v36[0] = CFSTR("VUEnabled");
      v36[1] = CFSTR("graphInferenceAvailable");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v23 != 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v28;
      v36[2] = CFSTR("graphInferenceMatchesGroundTruth");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v24);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v37[2] = v29;
      v36[3] = CFSTR("vuInferenceAvailable");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v26 != 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v37[3] = v30;
      v36[4] = CFSTR("vuInferenceMatchesGroundTruth");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v37[4] = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 5);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sendEvent:withPayload:", CFSTR("com.apple.Photos.Intelligence.deviceOwnerInference"), v32);

      v18 = v34;
      v10 = v35;
    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "loggingConnection");
      v20 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v12;
        _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "No person node for local identifier %@, skipping device owner metric reporting.", buf, 0xCu);
      }
    }

  }
}

- (void)_reportMobilityWithAnalytics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[4];
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[PGGraph momentNodes](self, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__PGGraph_Metrics___reportMobilityWithAnalytics___block_invoke;
  v11[3] = &unk_1E8434DE8;
  v11[4] = &v24;
  v11[5] = &v20;
  v11[6] = &v16;
  v11[7] = &v12;
  objc_msgSend(v5, "enumerateNodesUsingBlock:", v11);

  v28[0] = CFSTR("locationMobilityPedestrianCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25[3]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v6;
  v28[1] = CFSTR("locationMobilityBicycleCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21[3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v7;
  v28[2] = CFSTR("locationMobilityCarCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17[3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v8;
  v28[3] = CFSTR("locationMobilityPlaneCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13[3]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendEvent:withPayload:", CFSTR("com.apple.Photos.Intelligence.locationMobility"), v10);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

}

- (void)_reportDisambiguatedLocationsWithAnalytics:(id)a3
{
  void *v4;
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
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[10];
  _QWORD v32[12];

  v32[10] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __63__PGGraph_Metrics___reportDisambiguatedLocationsWithAnalytics___block_invoke;
  v22[3] = &unk_1E8434E10;
  v22[4] = &v27;
  v22[5] = &v23;
  -[MAGraph enumerateNodesWithLabel:domain:usingBlock:](self, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("Address"), 200, v22);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PGGraph infoNode](self, "infoNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "routineInfo");
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
  }

  v31[0] = CFSTR("improvedLocationsCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28[3]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v17;
  v31[1] = CFSTR("remoteLocationsCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24[3]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v6;
  v31[2] = CFSTR("routineAvailable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v7;
  v31[3] = CFSTR("routineNumberOfLocationsOfInterest");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *((_QWORD *)&v18 + 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v8;
  v31[4] = CFSTR("routineNumberOfVisits");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (_QWORD)v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v9;
  v31[5] = CFSTR("routineNumberOfTimeMatches");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *((_QWORD *)&v19 + 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32[5] = v10;
  v31[6] = CFSTR("routineNumberOfCloseByLocationMatches");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (_QWORD)v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[6] = v11;
  v31[7] = CFSTR("routineNumberOfRemoteLocationMatches");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *((_QWORD *)&v20 + 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[7] = v12;
  v31[8] = CFSTR("routineNumberOfMatchRequests");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (_QWORD)v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[8] = v13;
  v31[9] = CFSTR("routinePinningVisitsRatio");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v21 + 1) * 100.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[9] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sendEvent:withPayload:", CFSTR("com.apple.Photos.Intelligence.disambiguatedLocations"), v15);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

}

- (void)_reportBusinessItemsWithAnalytics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__PGGraph_Metrics___reportBusinessItemsWithAnalytics___block_invoke;
  v10[3] = &unk_1E8434E68;
  v10[4] = &v23;
  v10[5] = &v19;
  v10[6] = &v15;
  v10[7] = &v11;
  -[MAGraph enumerateNodesWithLabel:domain:usingBlock:](self, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("Business"), 503, v10);
  v27[0] = CFSTR("businessItemsCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24[3]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v5;
  v27[1] = CFSTR("businessItemsCountFromPublicEvent");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20[3]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v6;
  v27[2] = CFSTR("businessItemsCountFromRoutine");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16[3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v7;
  v27[3] = CFSTR("businessItemsCountFromMeaningInference");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12[3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendEvent:withPayload:", CFSTR("com.apple.Photos.Intelligence.businessItems"), v9);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

}

void __54__PGGraph_Metrics___reportBusinessItemsWithAnalytics___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a2;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v3, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "publicEventNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  else
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__PGGraph_Metrics___reportBusinessItemsWithAnalytics___block_invoke_2;
    v8[3] = &unk_1E8434E40;
    v8[4] = &v9;
    objc_msgSend(v3, "enumerateMomentEdgesAndNodesUsingBlock:", v8);
    v7 = 48;
    if (!*((_BYTE *)v10 + 24))
      v7 = 56;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + v7) + 8) + 24);
    _Block_object_dispose(&v9, 8);
  }

}

void __54__PGGraph_Metrics___reportBusinessItemsWithAnalytics___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v6;
  char v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "confidence");
  if (v6 >= 0.6)
    v7 = objc_msgSend(v8, "hasRoutineInfo");
  else
    v7 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

}

void __63__PGGraph_Metrics___reportDisambiguatedLocationsWithAnalytics___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = (void *)MEMORY[0x1CAA4EB2C]();
  if (objc_msgSend(v6, "isImproved"))
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(v6, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v5, "count");

  objc_autoreleasePoolPop(v3);
}

uint64_t __49__PGGraph_Metrics___reportMobilityWithAnalytics___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "locationMobilityType");
  switch(result)
  {
    case 1:
      v4 = a1 + 32;
      goto LABEL_6;
    case 2:
      v4 = a1 + 40;
      goto LABEL_6;
    case 3:
      v4 = a1 + 48;
      goto LABEL_6;
    case 4:
      v4 = a1 + 56;
LABEL_6:
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v4 + 8) + 24);
      break;
    default:
      return result;
  }
  return result;
}

@end
