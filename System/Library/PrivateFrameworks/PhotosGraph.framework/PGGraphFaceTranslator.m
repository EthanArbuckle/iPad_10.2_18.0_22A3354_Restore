@implementation PGGraphFaceTranslator

+ (Class)entityClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)includesRelationshipChanges
{
  return 1;
}

- (id)graphChangesForInsertedLocalIdentifiers:(id)a3 progressBlock:(id)a4
{
  id v5;
  void *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Insert %ld new faces via moment updates", (uint8_t *)&v8, 0xCu);
  }
  -[PGGraphFaceTranslator _momentChangesForFaceLocalIdentifiers:](self, "_momentChangesForFaceLocalIdentifiers:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)graphChangesForDeletedLocalIdentifiers:(id)a3 progressBlock:(id)a4
{
  id v5;
  void *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Delete %ld faces", (uint8_t *)&v8, 0xCu);
  }
  -[PGGraphFaceTranslator _momentChangesForFaceLocalIdentifiers:](self, "_momentChangesForFaceLocalIdentifiers:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)graphChangesForChangedPropertyNamesByLocalIdentifier:(id)a3 change:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(void *, _BYTE *, double);
  double v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  double Current;
  int *v23;
  NSObject *v24;
  void *v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  char v32;
  uint8_t v33[128];
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(void *, _BYTE *, double))_Block_copy(a5);
  v11 = 0.0;
  if (!v10 || (v12 = CFAbsoluteTimeGetCurrent(), v12 < 0.01))
  {
LABEL_8:
    v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v8;
    objc_msgSend(v8, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (objc_msgSend(v9, "personRelationshipChangedForFaceWithLocalIdentifier:", v21))
            objc_msgSend(v14, "addObject:", v21);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v18);
    }
    if (v10)
    {
      Current = CFAbsoluteTimeGetCurrent();
      v23 = &OBJC_IVAR____TtC11PhotosGraphP33_9DC9DF9C86728BDC9D73ADC3140142CF24FrequentLocationModifier_smallCountryStateLevelModifier;
      if (Current - v11 >= 0.01)
      {
        v32 = 0;
        v10[2](v10, &v32, 0.5);
        if (v32)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v35 = 786;
            v36 = 2080;
            v37 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core"
                  "/PGGraphEntityTranslator.m";
            v24 = MEMORY[0x1E0C81028];
LABEL_31:
            _os_log_impl(&dword_1CA237000, v24, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_32;
          }
          goto LABEL_32;
        }
        v11 = Current;
      }
    }
    else
    {
      v23 = &OBJC_IVAR____TtC11PhotosGraphP33_9DC9DF9C86728BDC9D73ADC3140142CF24FrequentLocationModifier_smallCountryStateLevelModifier;
    }
    if (objc_msgSend(v14, "count"))
    {
      -[PGGraphFaceTranslator _momentChangesForFaceLocalIdentifiers:](self, "_momentChangesForFaceLocalIdentifiers:", v14);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObjectsFromArray:", v25);

    }
    if (!v10 || CFAbsoluteTimeGetCurrent() - v11 < *((double *)v23 + 72) || (v32 = 0, v10[2](v10, &v32, 1.0), !v32))
    {
      v13 = v15;
      goto LABEL_34;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v35 = 795;
      v36 = 2080;
      v37 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGGra"
            "phEntityTranslator.m";
      v24 = MEMORY[0x1E0C81028];
      goto LABEL_31;
    }
LABEL_32:
    v13 = (id)MEMORY[0x1E0C9AA60];
LABEL_34:

    v8 = v27;
    goto LABEL_35;
  }
  v32 = 0;
  v10[2](v10, &v32, 0.0);
  if (!v32)
  {
    v11 = v12;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v35 = 767;
    v36 = 2080;
    v37 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGGraph"
          "EntityTranslator.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v13 = (id)MEMORY[0x1E0C9AA60];
LABEL_35:

  return v13;
}

- (id)_momentChangesForFaceLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PGGraphEntityTranslator photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  momentChangesForLocalIdentifiers(v4, v5, &__block_literal_global_299);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __63__PGGraphFaceTranslator__momentChangesForFaceLocalIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CD1670];
  v5 = a3;
  objc_msgSend(a2, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchMomentsForFacesWithLocalIdentifiers:options:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
