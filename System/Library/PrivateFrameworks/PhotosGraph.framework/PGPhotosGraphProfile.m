@implementation PGPhotosGraphProfile

- (PGPhotosGraphProfile)init
{
  PGPhotosGraphProfile *v2;
  NSSet *v3;
  uint64_t v4;
  NSSet *personalTraitsSceneNames;
  NSSet *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PGPhotosGraphProfile;
  v2 = -[CLSProfile init](&v8, sel_init);
  if (v2)
  {
    if (_os_feature_enabled_impl())
    {
      v3 = (NSSet *)objc_alloc_init(MEMORY[0x1E0D77EE8]);
      -[NSSet sceneNames](v3, "sceneNames");
      v4 = objc_claimAutoreleasedReturnValue();
      personalTraitsSceneNames = v2->_personalTraitsSceneNames;
      v2->_personalTraitsSceneNames = (NSSet *)v4;

    }
    else
    {
      v6 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
      v3 = v2->_personalTraitsSceneNames;
      v2->_personalTraitsSceneNames = v6;
    }

  }
  return v2;
}

- (PGPhotosGraphProfile)initWithSceneTaxonomy:(id)a3
{
  id v4;
  PGPhotosGraphProfile *v5;
  uint64_t v6;
  NSSet *blockedTaxonomyNodeNames;

  v4 = a3;
  v5 = -[PGPhotosGraphProfile init](self, "init");
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_computeBlockedTaxonomyNodeNamesWithSceneTaxonomy:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    blockedTaxonomyNodeNames = v5->_blockedTaxonomyNodeNames;
    v5->_blockedTaxonomyNodeNames = (NSSet *)v6;

  }
  return v5;
}

- (void)_insertEventCluesForClueCollection:(id)a3 serviceManager:(id)a4 locationCache:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "eventsForClueCollection:", v7);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "count");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __88__PGPhotosGraphProfile__insertEventCluesForClueCollection_serviceManager_locationCache___block_invoke;
  v16[3] = &unk_1E84278D8;
  v17 = v7;
  v18 = v9;
  v19 = v8;
  v20 = v10;
  v11 = v10;
  v12 = v8;
  v13 = v9;
  v14 = v7;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v16);
  objc_msgSend(v14, "mergeClues:", v11);

}

- (void)_insertPlacesForClueCollection:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v3 = (void *)MEMORY[0x1E0C99E20];
  v4 = a3;
  objc_msgSend(v3, "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputCluesForKey:", *MEMORY[0x1E0D4B008]);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__PGPhotosGraphProfile__insertPlacesForClueCollection___block_invoke;
  v14[3] = &unk_1E8427900;
  v7 = v5;
  v15 = v7;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v14);
  objc_msgSend(v4, "outputCluesForKey:", *MEMORY[0x1E0D4AF80]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __55__PGPhotosGraphProfile__insertPlacesForClueCollection___block_invoke_2;
  v12[3] = &unk_1E8427900;
  v13 = v7;
  v9 = v7;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mergeClues:", v10);

}

- (void)_insertScenesForClueCollection:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "outputCluesForKey:", *MEMORY[0x1E0D4B290]);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__PGPhotosGraphProfile__insertScenesForClueCollection___block_invoke;
  v9[3] = &unk_1E8427928;
  v9[4] = self;
  v10 = v6;
  v7 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);
  objc_msgSend(v5, "mergeClues:", v7);

}

- (void)_insertVisualLookupScenesForClueCollection:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "outputCluesForKey:", *MEMORY[0x1E0D4B298]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__PGPhotosGraphProfile__insertVisualLookupScenesForClueCollection___block_invoke;
  v8[3] = &unk_1E8427950;
  v9 = v5;
  v6 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);
  objc_msgSend(v4, "mergeClues:", v6);

}

- (void)_insertEntityNetScenesForClueCollection:(id)a3 personalTraitsOnly:(BOOL)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v7, "outputCluesForKey:", *MEMORY[0x1E0D4B288]);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__PGPhotosGraphProfile__insertEntityNetScenesForClueCollection_personalTraitsOnly___block_invoke;
  v11[3] = &unk_1E8427978;
  v13 = a4;
  v11[4] = self;
  v12 = v8;
  v9 = v8;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);
  objc_msgSend(v7, "mergeClues:", v9);

}

- (void)processResultsSynchronouslyForInvestigation:(id)a3 withProgressBlock:(id)a4
{
  id v6;
  id v7;
  void (**v8)(void *, _BYTE *, double);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double Current;
  char v15;
  NSObject *v16;
  double v17;
  char v18;
  double v19;
  char v20;
  double v21;
  char v22;
  double v23;
  char v24;
  double v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  char v32;
  NSObject *v33;
  double v34;
  char v35;
  id v36;
  _QWORD v37[4];
  id v38;
  void (**v39)(void *, _BYTE *, double);
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  double *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  uint8_t buf[4];
  int v53;
  __int16 v54;
  const char *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(void *, _BYTE *, double))_Block_copy(v7);
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  v44 = 0;
  v45 = (double *)&v44;
  v46 = 0x2020000000;
  v47 = 0;
  objc_msgSend(v6, "clueCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((CLSDeviceIs2GBOrLess() & 1) == 0)
  {
    objc_msgSend(v6, "helper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serviceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "helper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "locationCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPhotosGraphProfile _insertEventCluesForClueCollection:serviceManager:locationCache:](self, "_insertEventCluesForClueCollection:serviceManager:locationCache:", v9, v11, v13);

  }
  if (v8)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v45[3] >= 0.01)
    {
      v45[3] = Current;
      v43 = 0;
      v8[2](v8, &v43, 0.1);
      v15 = *((_BYTE *)v49 + 24) | v43;
      *((_BYTE *)v49 + 24) = v15;
      if (v15)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v53 = 242;
          v54 = 2080;
          v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Profil"
                "e/PGPhotosGraphProfile.m";
          v16 = MEMORY[0x1E0C81028];
LABEL_36:
          _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_52;
        }
        goto LABEL_52;
      }
    }
  }
  -[PGPhotosGraphProfile _insertPlacesForClueCollection:](self, "_insertPlacesForClueCollection:", v9);
  if (!v8
    || (v17 = CFAbsoluteTimeGetCurrent(), v17 - v45[3] < 0.01)
    || (v45[3] = v17, v43 = 0, v8[2](v8, &v43, 0.2), v18 = *((_BYTE *)v49 + 24) | v43, (*((_BYTE *)v49 + 24) = v18) == 0))
  {
    -[PGPhotosGraphProfile _insertScenesForClueCollection:](self, "_insertScenesForClueCollection:", v9);
    if (v8)
    {
      v19 = CFAbsoluteTimeGetCurrent();
      if (v19 - v45[3] >= 0.01)
      {
        v45[3] = v19;
        v43 = 0;
        v8[2](v8, &v43, 0.3);
        v20 = *((_BYTE *)v49 + 24) | v43;
        *((_BYTE *)v49 + 24) = v20;
        if (v20)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v53 = 248;
            v54 = 2080;
            v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Prof"
                  "ile/PGPhotosGraphProfile.m";
            v16 = MEMORY[0x1E0C81028];
            goto LABEL_36;
          }
          goto LABEL_52;
        }
      }
    }
    if (_os_feature_enabled_impl())
    {
      -[PGPhotosGraphProfile _insertVisualLookupScenesForClueCollection:](self, "_insertVisualLookupScenesForClueCollection:", v9);
      if (v8)
      {
        v21 = CFAbsoluteTimeGetCurrent();
        if (v21 - v45[3] >= 0.01)
        {
          v45[3] = v21;
          v43 = 0;
          v8[2](v8, &v43, 0.4);
          v22 = *((_BYTE *)v49 + 24) | v43;
          *((_BYTE *)v49 + 24) = v22;
          if (v22)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v53 = 252;
              v54 = 2080;
              v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Pr"
                    "ofile/PGPhotosGraphProfile.m";
              v16 = MEMORY[0x1E0C81028];
              goto LABEL_36;
            }
            goto LABEL_52;
          }
        }
      }
    }
    if (_os_feature_enabled_impl())
    {
      -[PGPhotosGraphProfile _insertEntityNetScenesForClueCollection:personalTraitsOnly:](self, "_insertEntityNetScenesForClueCollection:personalTraitsOnly:", v9, 0);
      if (v8)
      {
        v23 = CFAbsoluteTimeGetCurrent();
        if (v23 - v45[3] >= 0.01)
        {
          v45[3] = v23;
          v43 = 0;
          v8[2](v8, &v43, 0.45);
          v24 = *((_BYTE *)v49 + 24) | v43;
          *((_BYTE *)v49 + 24) = v24;
          if (v24)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v53 = 257;
              v54 = 2080;
              v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Pr"
                    "ofile/PGPhotosGraphProfile.m";
              v16 = MEMORY[0x1E0C81028];
              goto LABEL_36;
            }
            goto LABEL_52;
          }
        }
      }
    }
    else if (_os_feature_enabled_impl())
    {
      -[PGPhotosGraphProfile _insertEntityNetScenesForClueCollection:personalTraitsOnly:](self, "_insertEntityNetScenesForClueCollection:personalTraitsOnly:", v9, 1);
      if (v8)
      {
        v25 = CFAbsoluteTimeGetCurrent();
        if (v25 - v45[3] >= 0.01)
        {
          v45[3] = v25;
          v43 = 0;
          v8[2](v8, &v43, 0.45);
          v26 = *((_BYTE *)v49 + 24) | v43;
          *((_BYTE *)v49 + 24) = v26;
          if (v26)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v53 = 261;
              v54 = 2080;
              v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Pr"
                    "ofile/PGPhotosGraphProfile.m";
              v16 = MEMORY[0x1E0C81028];
              goto LABEL_36;
            }
            goto LABEL_52;
          }
        }
      }
    }
    if (!objc_msgSend(v9, "numberOfLocations"))
      goto LABEL_52;
    objc_msgSend(v6, "helper");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "locationCache");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "mePerson");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      objc_msgSend(v29, "prefetchPersonAddressesIfNeededWithLocationCache:", v28);
      if (!v8)
        goto LABEL_51;
      v31 = CFAbsoluteTimeGetCurrent();
      if (v31 - v45[3] >= 0.01)
      {
        v45[3] = v31;
        v43 = 0;
        v8[2](v8, &v43, 0.5);
        v32 = *((_BYTE *)v49 + 24) | v43;
        *((_BYTE *)v49 + 24) = v32;
        if (v32)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v53 = 271;
            v54 = 2080;
            v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Prof"
                  "ile/PGPhotosGraphProfile.m";
            v33 = MEMORY[0x1E0C81028];
LABEL_49:
            _os_log_impl(&dword_1CA237000, v33, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_50;
          }
          goto LABEL_50;
        }
      }
    }
    else if (!v8)
    {
      goto LABEL_51;
    }
    v34 = CFAbsoluteTimeGetCurrent();
    if (v34 - v45[3] >= 0.01)
    {
      v45[3] = v34;
      v43 = 0;
      v8[2](v8, &v43, 0.6);
      v35 = *((_BYTE *)v49 + 24) | v43;
      *((_BYTE *)v49 + 24) = v35;
      if (v35)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v53 = 274;
          v54 = 2080;
          v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Profil"
                "e/PGPhotosGraphProfile.m";
          v33 = MEMORY[0x1E0C81028];
          goto LABEL_49;
        }
LABEL_50:

        goto LABEL_52;
      }
    }
LABEL_51:
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __86__PGPhotosGraphProfile_processResultsSynchronouslyForInvestigation_withProgressBlock___block_invoke;
    v37[3] = &unk_1E84279A0;
    v36 = v28;
    v38 = v36;
    v39 = v8;
    v40 = &v44;
    v41 = &v48;
    v42 = 0x3F847AE147AE147BLL;
    objc_msgSend(v9, "enumeratePeopleClues:", v37);

    goto LABEL_52;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v53 = 245;
    v54 = 2080;
    v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Profile/PGPh"
          "otosGraphProfile.m";
    v16 = MEMORY[0x1E0C81028];
    goto LABEL_36;
  }
LABEL_52:

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

}

- (BOOL)isBlockedTaxonomyNodeWithName:(id)a3
{
  return -[NSSet containsObject:](self->_blockedTaxonomyNodeNames, "containsObject:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalTraitsSceneNames, 0);
  objc_storeStrong((id *)&self->_blockedTaxonomyNodeNames, 0);
}

void __86__PGPhotosGraphProfile_processResultsSynchronouslyForInvestigation_withProgressBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  double Current;
  uint64_t v9;

  objc_msgSend(a2, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "prefetchPersonAddressesIfNeededWithLocationCache:", *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 40))
    {
      Current = CFAbsoluteTimeGetCurrent();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 64))
      {
        *(double *)(v9 + 24) = Current;
        (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(0.7);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                              + 24);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
          *a4 = 1;
      }
    }
  }

}

void __83__PGPhotosGraphProfile__insertEntityNetScenesForClueCollection_personalTraitsOnly___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (!*(_BYTE *)(a1 + 48) || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", v3)))
  {
    v4 = (void *)MEMORY[0x1E0D4B1D8];
    objc_msgSend(v10, "confidence");
    v6 = v5;
    objc_msgSend(v10, "relevance");
    objc_msgSend(v4, "clueWithValue:forKey:confidence:relevance:", v3, CFSTR("EntityNetScene"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "extraParameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExtraParameters:", v9);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  }

}

void __67__PGPhotosGraphProfile__insertVisualLookupScenesForClueCollection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D4B1D8];
    objc_msgSend(v7, "confidence");
    objc_msgSend(v4, "clueWithValue:forKey:confidence:relevance:", v3, CFSTR("VisualLookupScene"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "extraParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExtraParameters:", v6);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }

}

void __55__PGPhotosGraphProfile__insertScenesForClueCollection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_msgSend(*(id *)(a1 + 32), "isBlockedTaxonomyNodeWithName:", v3) & 1) == 0)
  {
    v4 = (void *)MEMORY[0x1E0D4B1D8];
    objc_msgSend(v10, "confidence");
    v6 = v5;
    objc_msgSend(v10, "relevance");
    objc_msgSend(v4, "clueWithValue:forKey:confidence:relevance:", v3, CFSTR("Scene"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "extraParameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExtraParameters:", v9);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  }

}

void __55__PGPhotosGraphProfile__insertPlacesForClueCollection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0D4B1D8];
  v4 = a2;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "confidence");
  v7 = v6;
  objc_msgSend(v4, "relevance");
  objc_msgSend(v3, "clueWithValue:forKey:confidence:relevance:", v5, CFSTR("ROI"), v7, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "relatedInputLocationClues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRelatedData:", v10);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
}

void __55__PGPhotosGraphProfile__insertPlacesForClueCollection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0D4B1D8];
  v4 = a2;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "confidence");
  v7 = v6;
  objc_msgSend(v4, "relevance");
  objc_msgSend(v3, "clueWithValue:forKey:confidence:relevance:", v5, CFSTR("POI"), v7, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "relatedInputLocationClues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRelatedData:", v10);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
}

void __88__PGPhotosGraphProfile__insertEventCluesForClueCollection_serviceManager_locationCache___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  double v43;
  double v44;
  _BYTE v45[128];
  _QWORD v46[2];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v3;
  if (v4)
  {
    objc_msgSend(v3, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "coordinate");
    v7 = v6;
    v9 = v8;
    v43 = v6;
    v44 = v8;

    if (objc_msgSend(MEMORY[0x1E0D71860], "canUseCoordinate:", v7, v9))
    {
      objc_msgSend(*(id *)(a1 + 32), "locations");
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      v12 = v10;
      if (v11)
      {
        v13 = v11;
        v14 = *(_QWORD *)v40;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v40 != v14)
              objc_enumerationMutation(v10);
            v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            if ((objc_msgSend(MEMORY[0x1E0D71860], "locationIsCoarse:", v16) & 1) == 0)
            {
              objc_msgSend(v16, "coordinate");
              v37 = v17;
              v38 = v18;
              CLLocationCoordinate2DGetDistanceFrom();
              if (v19 < 1500.0)
              {

                objc_msgSend(MEMORY[0x1E0D4B188], "clueWithLocation:locationCache:", v4, *(_QWORD *)(a1 + 40));
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = (void *)MEMORY[0x1E0D4B198];
                objc_msgSend(v3, "startDate");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v46[0] = v21;
                objc_msgSend(v3, "endDate");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v46[1] = v22;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "clueWithDates:serviceManager:", v23, *(_QWORD *)(a1 + 48));
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                v3 = v32;
                objc_msgSend(*(id *)(a1 + 56), "addObject:", v12);
                objc_msgSend(*(id *)(a1 + 56), "addObject:", v24);

                goto LABEL_14;
              }
            }
          }
          v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          if (v13)
            continue;
          break;
        }
        v12 = v10;
      }
LABEL_14:

    }
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v3, "attendees");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v34 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "objectForKeyedSubscript:", CFSTR("name"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          objc_msgSend(MEMORY[0x1E0D4B190], "clueWithPeople:serviceManager:", v30, *(_QWORD *)(a1 + 48));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v31);

        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v27);
  }

}

+ (id)classIdentifier
{
  return CFSTR("photosgraph");
}

+ (id)informantDependenciesIdentifiers
{
  uint64_t v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D4B0A0];
  v4[0] = *MEMORY[0x1E0D4B0A8];
  v4[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)profileDependenciesIdentifiers
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)supportedMeaningClueKeys
{
  return 0;
}

+ (id)_blockedNamesToTraverse
{
  return &unk_1E84E9520;
}

+ (id)_blockedNames
{
  return &unk_1E84E9538;
}

+ (id)_computeBlockedTaxonomyNodeNamesWithSceneTaxonomy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v15;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = a1;
  objc_msgSend(a1, "_blockedNamesToTraverse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v4, "nodeForName:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v10;
        v16[1] = 3221225472;
        v16[2] = __74__PGPhotosGraphProfile__computeBlockedTaxonomyNodeNamesWithSceneTaxonomy___block_invoke;
        v16[3] = &unk_1E84331B0;
        v17 = v5;
        objc_msgSend(v12, "traverseChildrenUsingNameBlock:", v16);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  objc_msgSend(v15, "_blockedNames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v13);

  return v5;
}

+ (NSString)poiUnknown
{
  return (NSString *)CFSTR("Unknown");
}

+ (NSString)poiRestaurant
{
  return (NSString *)(id)*MEMORY[0x1E0D4AFE8];
}

+ (NSString)poiNightlife
{
  return (NSString *)(id)*MEMORY[0x1E0D4AFD0];
}

+ (NSString)poiShopping
{
  return (NSString *)(id)*MEMORY[0x1E0D4AFF0];
}

+ (NSString)poiTravel
{
  return (NSString *)(id)*MEMORY[0x1E0D4B000];
}

+ (NSString)poiCulture
{
  return (NSString *)(id)*MEMORY[0x1E0D4AF98];
}

+ (NSString)poiMuseum
{
  return (NSString *)(id)*MEMORY[0x1E0D4AFC8];
}

+ (NSString)poiEntertainment
{
  return (NSString *)(id)*MEMORY[0x1E0D4AFA8];
}

+ (NSString)poiAmusementPark
{
  return (NSString *)(id)*MEMORY[0x1E0D4AF90];
}

+ (NSString)poiPark
{
  return (NSString *)(id)*MEMORY[0x1E0D4AFD8];
}

+ (NSString)poiPerformance
{
  return (NSString *)(id)*MEMORY[0x1E0D4AFE0];
}

+ (NSString)poiStadium
{
  return (NSString *)(id)*MEMORY[0x1E0D4AFF8];
}

+ (NSString)poiActivity
{
  return (NSString *)(id)*MEMORY[0x1E0D4AF88];
}

+ (NSString)poiDiving
{
  return (NSString *)(id)*MEMORY[0x1E0D4AFA0];
}

+ (NSString)poiHiking
{
  return (NSString *)(id)*MEMORY[0x1E0D4AFB8];
}

+ (NSString)poiFitness
{
  return (NSString *)(id)*MEMORY[0x1E0D4AFB0];
}

+ (NSString)poiHospital
{
  return (NSString *)(id)*MEMORY[0x1E0D4AFC0];
}

+ (NSString)roiUrban
{
  return (NSString *)(id)*MEMORY[0x1E0D4B028];
}

+ (NSString)roiBeach
{
  return (NSString *)(id)*MEMORY[0x1E0D4B010];
}

+ (NSString)roiNature
{
  return (NSString *)(id)*MEMORY[0x1E0D4B020];
}

+ (NSString)roiWater
{
  return (NSString *)(id)*MEMORY[0x1E0D4B030];
}

+ (NSString)roiMoutain
{
  return (NSString *)(id)*MEMORY[0x1E0D4B018];
}

+ (NSString)partOfDayMorning
{
  return (NSString *)(id)*MEMORY[0x1E0D4B060];
}

+ (NSString)partOfDayNoon
{
  return (NSString *)(id)*MEMORY[0x1E0D4B070];
}

+ (NSString)partOfDayAfternoon
{
  return (NSString *)(id)*MEMORY[0x1E0D4B050];
}

+ (NSString)partOfDayEvening
{
  return (NSString *)(id)*MEMORY[0x1E0D4B058];
}

+ (NSString)partOfDayNight
{
  return (NSString *)(id)*MEMORY[0x1E0D4B068];
}

uint64_t __74__PGPhotosGraphProfile__computeBlockedTaxonomyNodeNamesWithSceneTaxonomy___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 0;
}

@end
