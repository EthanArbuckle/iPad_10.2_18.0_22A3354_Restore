@implementation PGShareBackPetSource

- (PGShareBackPetSource)initWithLoggingConnection:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  int v8;
  Class *v9;
  id v10;
  PGShareBackPetSource *v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "isSystemPhotoLibrary");
  v9 = (Class *)0x1E0D4B150;
  if (!v8)
    v9 = (Class *)0x1E0D4B158;
  v10 = objc_alloc_init(*v9);
  v11 = -[PGShareBackPetSource initWithLoggingConnection:photoLibrary:faceIdentification:](self, "initWithLoggingConnection:photoLibrary:faceIdentification:", v7, v6, v10);

  return v11;
}

- (PGShareBackPetSource)initWithLoggingConnection:(id)a3 photoLibrary:(id)a4 faceIdentification:(id)a5
{
  id v9;
  id v10;
  PGShareBackPetSource *v11;
  PGShareBackPetSource *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PGShareBackPetSource;
  v11 = -[PGShareBackSource initWithLoggingConnection:](&v14, sel_initWithLoggingConnection_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_photoLibrary, a4);
    objc_storeStrong((id *)&v12->_faceIdentification, a5);
  }

  return v12;
}

- (BOOL)prepareSourceWithGraph:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSSet *v9;
  NSSet *petPersonLocalIdentifiersToCheck;
  NSSet *v11;
  BOOL v12;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  v4 = a3;
  -[PGShareBackSource loggingConnection](self, "loggingConnection");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "meNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "collection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ownedPetNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "localIdentifiers");
      v9 = (NSSet *)objc_claimAutoreleasedReturnValue();
      if (-[NSSet count](v9, "count"))
      {
        petPersonLocalIdentifiersToCheck = self->_petPersonLocalIdentifiersToCheck;
        self->_petPersonLocalIdentifiersToCheck = v9;
        v11 = v9;

        v12 = 1;
LABEL_14:

        goto LABEL_15;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_error_impl(&dword_1CA237000, v5, OS_LOG_TYPE_ERROR, "[PGShareBackPetSource] No pet local identifiers available", v14, 2u);
      }

    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1CA237000, v5, OS_LOG_TYPE_INFO, "[PGShareBackPetSource] No pets available", v15, 2u);
    }
    v12 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, v5, OS_LOG_TYPE_INFO, "[PGShareBackPetSource] No me node available, unable to infer user's pets", buf, 2u);
  }
  v12 = 0;
LABEL_15:

  return v12;
}

- (id)suggesterResultsForInputs:(id)a3 momentNodes:(id)a4 inGraph:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  PGShareBackPetSource *v32;
  CLSFaceIdentificationProtocol *faceIdentification;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  NSSet *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  void *v59;
  PGShareBackSuggesterResult *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  id v68;
  void *v69;
  id obj;
  NSObject *v71;
  void *v72;
  PGShareBackPetSource *v73;
  void *v74;
  id v75;
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
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint8_t v100[128];
  uint8_t buf[4];
  NSObject *v102;
  uint64_t v103;
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v94;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v94 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * i), "localIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          -[NSObject addObject:](v11, "addObject:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
    }
    while (v14);
  }

  if (-[NSObject count](v11, "count"))
  {
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v18 = objc_claimAutoreleasedReturnValue();
    v103 = *MEMORY[0x1E0CD19C0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v103, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setFetchPropertySets:](v18, "setFetchPropertySets:", v19);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("faceAdjustmentVersion"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setInternalPredicate:](v18, "setInternalPredicate:", v20);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v11, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
    {
      v75 = v10;
      v22 = a6;
      v73 = self;
      -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
      v23 = objc_claimAutoreleasedReturnValue();
      -[NSObject setIncludedDetectionTypes:](v23, "setIncludedDetectionTypes:", &unk_1E84E94D8);
      v71 = v23;
      v72 = v21;
      objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesGroupedByAssetLocalIdentifierForAssets:options:", v21, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v89 = 0u;
      v90 = 0u;
      v91 = 0u;
      v92 = 0u;
      v74 = v24;
      objc_msgSend(v24, "allValues");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v89, v100, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v90;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v90 != v29)
              objc_enumerationMutation(v26);
            objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * j), "fetchedObjects");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObjectsFromArray:", v31);

          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v89, v100, 16);
        }
        while (v28);
      }

      if (objc_msgSend(v25, "count"))
      {
        v32 = v73;
        faceIdentification = v73->_faceIdentification;
        v88 = 0;
        -[CLSFaceIdentificationProtocol requestIdentificationOfFaces:error:](faceIdentification, "requestIdentificationOfFaces:error:", v25, &v88);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v88;
        v36 = v35;
        if (v35)
        {
          if (v22)
            *v22 = objc_retainAutorelease(v35);
          -[PGShareBackSource loggingConnection](v73, "loggingConnection");
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v102 = v36;
            _os_log_error_impl(&dword_1CA237000, v37, OS_LOG_TYPE_ERROR, "[PGShareBackPetSource] Error while getting classification results for faces: %@", buf, 0xCu);
          }
          v38 = 0;
          v10 = v75;
        }
        else
        {
          v10 = v75;
          if (objc_msgSend(v34, "count"))
          {
            v68 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v84 = 0u;
            v85 = 0u;
            v86 = 0u;
            v87 = 0u;
            v37 = v12;
            v41 = -[NSObject countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v84, v99, 16);
            if (v41)
            {
              v69 = v34;
              v42 = *(_QWORD *)v85;
              v67 = v37;
              v61 = *(_QWORD *)v85;
              do
              {
                v43 = 0;
                v62 = v41;
                do
                {
                  if (*(_QWORD *)v85 != v42)
                  {
                    v44 = v43;
                    objc_enumerationMutation(v37);
                    v43 = v44;
                  }
                  v64 = v43;
                  v45 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v43);
                  v80 = 0u;
                  v81 = 0u;
                  v82 = 0u;
                  v83 = 0u;
                  objc_msgSend(v45, "localIdentifier");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "objectForKeyedSubscript:", v46);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();

                  obj = v47;
                  v65 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v80, v98, 16);
                  if (v65)
                  {
                    v48 = *(_QWORD *)v81;
                    v63 = *(_QWORD *)v81;
                    do
                    {
                      v49 = 0;
                      v50 = v69;
                      do
                      {
                        if (*(_QWORD *)v81 != v48)
                        {
                          v51 = v49;
                          objc_enumerationMutation(obj);
                          v49 = v51;
                        }
                        v66 = v49;
                        objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * v49), "localIdentifier");
                        v52 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v50, "objectForKeyedSubscript:", v52);
                        v53 = (void *)objc_claimAutoreleasedReturnValue();

                        v78 = 0u;
                        v79 = 0u;
                        v76 = 0u;
                        v77 = 0u;
                        v54 = v32->_petPersonLocalIdentifiersToCheck;
                        v55 = -[NSSet countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v76, v97, 16);
                        if (v55)
                        {
                          v56 = v55;
                          v57 = *(_QWORD *)v77;
                          while (2)
                          {
                            for (k = 0; k != v56; ++k)
                            {
                              if (*(_QWORD *)v77 != v57)
                                objc_enumerationMutation(v54);
                              objc_msgSend(v53, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * k));
                              v59 = (void *)objc_claimAutoreleasedReturnValue();

                              if (v59)
                              {

                                v37 = v67;
                                v10 = v75;
                                v60 = -[PGShareBackSuggesterResult initWithInputs:processingValue:momentNodes:]([PGShareBackSuggesterResult alloc], "initWithInputs:processingValue:momentNodes:", v67, 512, v75);
                                v38 = v68;
                                objc_msgSend(v68, "addObject:", v60);

                                v36 = 0;
                                goto LABEL_64;
                              }
                            }
                            v56 = -[NSSet countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v76, v97, 16);
                            if (v56)
                              continue;
                            break;
                          }
                        }

                        v49 = v66 + 1;
                        v10 = v75;
                        v32 = v73;
                        v37 = v67;
                        v36 = 0;
                        v50 = v69;
                        v48 = v63;
                      }
                      while (v66 + 1 != v65);
                      v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v98, 16);
                    }
                    while (v65);
                  }

                  v43 = v64 + 1;
                  v42 = v61;
                }
                while (v64 + 1 != v62);
                v41 = -[NSObject countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v84, v99, 16);
              }
              while (v41);
              v38 = v68;
LABEL_64:
              v34 = v69;
            }
            else
            {
              v38 = v68;
            }
          }
          else
          {
            -[PGShareBackSource loggingConnection](v73, "loggingConnection");
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1CA237000, v37, OS_LOG_TYPE_INFO, "[PGShareBackPetSource] No classification results for faces", buf, 2u);
            }
            v38 = (void *)MEMORY[0x1E0C9AA60];
          }
        }

      }
      else
      {
        -[PGShareBackSource loggingConnection](v73, "loggingConnection");
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA237000, v36, OS_LOG_TYPE_INFO, "[PGShareBackPetSource] No pet faces for assets", buf, 2u);
        }
        v38 = (void *)MEMORY[0x1E0C9AA60];
        v10 = v75;
      }

      v39 = v71;
      v21 = v72;
    }
    else
    {
      -[PGShareBackSource loggingConnection](self, "loggingConnection");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v102 = v11;
        _os_log_impl(&dword_1CA237000, v39, OS_LOG_TYPE_INFO, "[PGShareBackPetSource] No assets with faces processed for asset local identifiers: %@", buf, 0xCu);
      }
      v38 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    -[PGShareBackSource loggingConnection](self, "loggingConnection");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v18, OS_LOG_TYPE_INFO, "[PGShareBackPetSource] No assets to process", buf, 2u);
    }
    v38 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v38;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceIdentification, 0);
  objc_storeStrong((id *)&self->_petPersonLocalIdentifiersToCheck, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
