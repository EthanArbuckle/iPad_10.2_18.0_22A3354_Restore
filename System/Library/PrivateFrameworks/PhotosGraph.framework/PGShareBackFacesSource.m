@implementation PGShareBackFacesSource

- (PGShareBackFacesSource)initWithLoggingConnection:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  int v8;
  Class *v9;
  id v10;
  PGShareBackFacesSource *v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "isSystemPhotoLibrary");
  v9 = (Class *)0x1E0D4B150;
  if (!v8)
    v9 = (Class *)0x1E0D4B158;
  v10 = objc_alloc_init(*v9);
  v11 = -[PGShareBackFacesSource initWithLoggingConnection:photoLibrary:faceIdentification:](self, "initWithLoggingConnection:photoLibrary:faceIdentification:", v7, v6, v10);

  return v11;
}

- (PGShareBackFacesSource)initWithLoggingConnection:(id)a3 photoLibrary:(id)a4 faceIdentification:(id)a5
{
  id v9;
  id v10;
  PGShareBackFacesSource *v11;
  PGShareBackFacesSource *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PGShareBackFacesSource;
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
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSString *v8;
  NSString *meLocalIdentifier;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSSet *v18;
  NSSet *childPersonLocalIdentifiers;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "meNodeWithFallbackInferredMeNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "isMeNode") & 1) == 0)
    {
      -[PGShareBackSource loggingConnection](self, "loggingConnection");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138412290;
        v22 = v5;
        _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_DEFAULT, "[PGShareBackFacesSource] No meNode set, using inferred meNode %@", (uint8_t *)&v21, 0xCu);
      }

    }
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v5, "localIdentifier");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    meLocalIdentifier = self->_meLocalIdentifier;
    self->_meLocalIdentifier = v8;

    objc_msgSend(v5, "collection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "childPersonNodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unionSet:", v12);

    objc_msgSend(v10, "inferredChildPersonNodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unionSet:", v14);

    if (objc_msgSend(v7, "count"))
    {
      -[PGShareBackSource loggingConnection](self, "loggingConnection");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "debugDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412290;
        v22 = v16;
        _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_DEFAULT, "[PGShareBackFacesSource] Child persons to check %@", (uint8_t *)&v21, 0xCu);

      }
    }

  }
  else
  {
    -[PGShareBackSource loggingConnection](self, "loggingConnection");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_DEFAULT, "[PGShareBackFacesSource] Couldn't infer device owner", (uint8_t *)&v21, 2u);
    }

    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  }
  v18 = (NSSet *)objc_msgSend(v7, "copy");
  childPersonLocalIdentifiers = self->_childPersonLocalIdentifiers;
  self->_childPersonLocalIdentifiers = v18;

  return 1;
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
  NSObject *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  id *p_isa;
  CLSFaceIdentificationProtocol *faceIdentification;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t m;
  void *v69;
  PGShareBackFacesSource *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t n;
  void *v76;
  PGShareBackSuggesterResult *v77;
  uint64_t v78;
  PGShareBackSuggesterResult *v79;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  NSObject *v89;
  int v90;
  NSObject *v91;
  void *v92;
  id v93;
  void *v94;
  NSObject *v95;
  NSObject *v96;
  PGShareBackFacesSource *v97;
  id obj;
  NSSet *obja;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  id v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  uint8_t v134[128];
  uint8_t buf[4];
  NSObject *v136;
  uint64_t v137;
  _BYTE v138[128];
  uint64_t v139;

  v139 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v125, v138, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v126;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v126 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v125 + 1) + 8 * i), "localIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          -[NSObject addObject:](v11, "addObject:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v125, v138, 16);
    }
    while (v14);
  }

  if (-[NSObject count](v11, "count"))
  {
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v18 = objc_claimAutoreleasedReturnValue();
    v137 = *MEMORY[0x1E0CD19C0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v137, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setFetchPropertySets:](v18, "setFetchPropertySets:", v19);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("faceAdjustmentVersion"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setInternalPredicate:](v18, "setInternalPredicate:", v20);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v11, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
    {
      v97 = self;
      v94 = v21;
      v95 = v18;
      objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesGroupedByAssetLocalIdentifierForAssets:options:", v21, 0);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v121 = 0u;
      v122 = 0u;
      v123 = 0u;
      v124 = 0u;
      v96 = v22;
      -[NSObject allValues](v22, "allValues");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v122;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v122 != v27)
              objc_enumerationMutation(v24);
            objc_msgSend(*(id *)(*((_QWORD *)&v121 + 1) + 8 * j), "fetchedObjects");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObjectsFromArray:", v29);

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v121, v134, 16);
        }
        while (v26);
      }

      if (objc_msgSend(v23, "count"))
      {
        p_isa = (id *)&v97->super.super.isa;
        faceIdentification = v97->_faceIdentification;
        v120 = 0;
        -[CLSFaceIdentificationProtocol requestIdentificationOfFaces:error:](faceIdentification, "requestIdentificationOfFaces:error:", v23, &v120);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v120;
        v34 = v33;
        if (v33)
        {
          if (a6)
            *a6 = objc_retainAutorelease(v33);
          -[PGShareBackSource loggingConnection](v97, "loggingConnection");
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v136 = v34;
            _os_log_error_impl(&dword_1CA237000, v35, OS_LOG_TYPE_ERROR, "[PGShareBackFacesSource] Error while getting classification results for faces: %@", buf, 0xCu);
          }
          v36 = 0;
        }
        else if (objc_msgSend(v32, "count"))
        {
          v35 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          v93 = v10;
          v92 = v32;
          if (objc_msgSend(v10, "count"))
          {
            v38 = v35;
            v118 = 0u;
            v119 = 0u;
            v116 = 0u;
            v117 = 0u;
            obj = v10;
            v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v133, 16);
            if (v39)
            {
              v40 = v39;
              v41 = *(_QWORD *)v117;
              do
              {
                for (k = 0; k != v40; ++k)
                {
                  if (*(_QWORD *)v117 != v41)
                    objc_enumerationMutation(obj);
                  objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * k), "collection");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "personNodes");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "localIdentifiers");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject unionSet:](v38, "unionSet:", v45);

                }
                v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v133, 16);
              }
              while (v40);
            }

            p_isa = (id *)&v97->super.super.isa;
            -[PGShareBackSource loggingConnection](v97, "loggingConnection");
            v46 = objc_claimAutoreleasedReturnValue();
            v35 = v38;
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v136 = v38;
              _os_log_impl(&dword_1CA237000, v46, OS_LOG_TYPE_INFO, "[PGShareBackFacesSource] Persons to match: %@", buf, 0xCu);
            }

            v34 = 0;
            v10 = v93;
            v32 = v92;
          }
          v47 = objc_msgSend(p_isa[3], "length");
          if (-[NSObject count](v35, "count") | v47)
          {
            v87 = v47;
            v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v112 = 0u;
            v113 = 0u;
            v114 = 0u;
            v115 = 0u;
            v48 = v12;
            v49 = -[NSObject countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v112, v132, 16);
            if (!v49)
              goto LABEL_101;
            v50 = *(_QWORD *)v113;
            v89 = v48;
            v81 = *(_QWORD *)v113;
            while (1)
            {
              v51 = 0;
              v84 = v49;
              do
              {
                if (*(_QWORD *)v113 != v50)
                {
                  v52 = v51;
                  objc_enumerationMutation(v48);
                  v51 = v52;
                }
                v86 = v51;
                v53 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * v51);
                v108 = 0u;
                v109 = 0u;
                v110 = 0u;
                v111 = 0u;
                objc_msgSend(v53, "localIdentifier");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject objectForKeyedSubscript:](v96, "objectForKeyedSubscript:", v54);
                v55 = (void *)objc_claimAutoreleasedReturnValue();

                v56 = v55;
                v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v108, v131, 16);
                if (!v57)
                {

                  goto LABEL_88;
                }
                v58 = 0;
                v59 = *(_QWORD *)v109;
                v91 = v35;
                v88 = v56;
                v83 = *(_QWORD *)v109;
                while (2)
                {
                  v60 = 0;
                  v82 = v57;
                  do
                  {
                    v90 = v58;
                    if (*(_QWORD *)v109 != v59)
                    {
                      v61 = v60;
                      objc_enumerationMutation(v56);
                      v60 = v61;
                    }
                    v85 = v60;
                    objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * v60), "localIdentifier");
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "objectForKeyedSubscript:", v62);
                    v63 = (void *)objc_claimAutoreleasedReturnValue();

                    v106 = 0u;
                    v107 = 0u;
                    v104 = 0u;
                    v105 = 0u;
                    v64 = v35;
                    v65 = -[NSObject countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v104, v130, 16);
                    if (v65)
                    {
                      v66 = v65;
                      v67 = *(_QWORD *)v105;
                      while (2)
                      {
                        for (m = 0; m != v66; ++m)
                        {
                          if (*(_QWORD *)v105 != v67)
                            objc_enumerationMutation(v64);
                          objc_msgSend(v63, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * m));
                          v69 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v69)
                          {

                            goto LABEL_98;
                          }
                        }
                        v66 = -[NSObject countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v104, v130, 16);
                        if (v66)
                          continue;
                        break;
                      }
                    }

                    if ((unsigned __int16)v90 == 64)
                    {
LABEL_98:
                      LOWORD(v58) = 64;
                      v10 = v93;
                      v35 = v91;
LABEL_99:

                      v32 = v92;
                      v34 = 0;
LABEL_100:
                      v77 = [PGShareBackSuggesterResult alloc];
                      v78 = (unsigned __int16)v58;
                      v48 = v89;
                      v79 = -[PGShareBackSuggesterResult initWithInputs:processingValue:momentNodes:](v77, "initWithInputs:processingValue:momentNodes:", v89, v78, v10);
                      objc_msgSend(v36, "addObject:", v79);

                      goto LABEL_101;
                    }
                    v10 = v93;
                    v35 = v91;
                    if (v87)
                    {
                      v70 = v97;
                      objc_msgSend(v63, "objectForKeyedSubscript:", v97->_meLocalIdentifier);
                      v71 = (void *)objc_claimAutoreleasedReturnValue();

                      LOWORD(v58) = 32;
                      if (v71 || (unsigned __int16)v90 == 32)
                        goto LABEL_99;
                    }
                    else
                    {
                      v70 = v97;
                      if ((unsigned __int16)v90 == 32)
                      {
                        LOWORD(v58) = 32;
                        goto LABEL_99;
                      }
                    }
                    v102 = 0u;
                    v103 = 0u;
                    v100 = 0u;
                    v101 = 0u;
                    obja = v70->_childPersonLocalIdentifiers;
                    v72 = -[NSSet countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v100, v129, 16);
                    if (v72)
                    {
                      v73 = v72;
                      v74 = *(_QWORD *)v101;
                      while (2)
                      {
                        for (n = 0; n != v73; ++n)
                        {
                          if (*(_QWORD *)v101 != v74)
                            objc_enumerationMutation(obja);
                          objc_msgSend(v63, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * n));
                          v76 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v76)
                          {
                            v58 = 0x4000;
                            v35 = v91;
                            goto LABEL_83;
                          }
                        }
                        v73 = -[NSSet countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v100, v129, 16);
                        if (v73)
                          continue;
                        break;
                      }
                      v35 = v91;
                    }
                    v58 = v90;
LABEL_83:

                    v60 = v85 + 1;
                    v59 = v83;
                    v32 = v92;
                    v34 = 0;
                    v56 = v88;
                  }
                  while (v85 + 1 != v82);
                  v57 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v108, v131, 16);
                  v59 = v83;
                  if (v57)
                    continue;
                  break;
                }

                if ((_WORD)v58)
                  goto LABEL_100;
LABEL_88:
                v51 = v86 + 1;
                v50 = v81;
                v48 = v89;
              }
              while (v86 + 1 != v84);
              v49 = -[NSObject countByEnumeratingWithState:objects:count:](v89, "countByEnumeratingWithState:objects:count:", &v112, v132, 16);
              if (!v49)
                goto LABEL_101;
            }
          }
          objc_msgSend(p_isa, "loggingConnection");
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA237000, v48, OS_LOG_TYPE_INFO, "[PGShareBackFacesSource] No persons to match", buf, 2u);
          }
          v36 = (id)MEMORY[0x1E0C9AA60];
LABEL_101:

        }
        else
        {
          -[PGShareBackSource loggingConnection](v97, "loggingConnection");
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA237000, v35, OS_LOG_TYPE_INFO, "[PGShareBackFacesSource] No classification results for faces", buf, 2u);
          }
          v36 = (id)MEMORY[0x1E0C9AA60];
        }

      }
      else
      {
        -[PGShareBackSource loggingConnection](v97, "loggingConnection");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA237000, v34, OS_LOG_TYPE_INFO, "[PGShareBackFacesSource] No faces for assets", buf, 2u);
        }
        v36 = (id)MEMORY[0x1E0C9AA60];
      }

      v21 = v94;
      v18 = v95;
      v37 = v96;
    }
    else
    {
      -[PGShareBackSource loggingConnection](self, "loggingConnection");
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v136 = v11;
        _os_log_impl(&dword_1CA237000, v37, OS_LOG_TYPE_INFO, "[PGShareBackFacesSource] No assets with faces processed for asset local identifiers: %@", buf, 0xCu);
      }
      v36 = (id)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    -[PGShareBackSource loggingConnection](self, "loggingConnection");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v18, OS_LOG_TYPE_INFO, "[PGShareBackFacesSource] No assets to process", buf, 2u);
    }
    v36 = (id)MEMORY[0x1E0C9AA60];
  }

  return v36;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceIdentification, 0);
  objc_storeStrong((id *)&self->_childPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_meLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
