@implementation PXPeopleInternalAnnotationDataSource

- (PXPeopleInternalAnnotationDataSource)initWithPerson:(id)a3 dataSourceDelegate:(id)a4
{
  id v6;
  id v7;
  PXPeopleInternalAnnotationDataSource *v8;
  PXPeopleInternalAnnotationDataSource *v9;
  PXPeopleSuggestionDataSource *v10;
  PXPeopleSuggestionDataSource *mergeCandidatesDataSource;
  PXPeopleRecoDataSource *v12;
  void *v13;
  uint64_t v14;
  PXPeopleRecoDataSource *confirmedAssetsDataSource;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PXPeopleInternalAnnotationDataSource;
  v8 = -[PXPeopleInternalAnnotationDataSource init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSourceDelegate, v7);
    -[PXPeopleInternalAnnotationDataSource setPerson:](v9, "setPerson:", v6);
    v10 = -[PXPeopleSuggestionDataSource initWithFlowType:]([PXPeopleSuggestionDataSource alloc], "initWithFlowType:", 1);
    mergeCandidatesDataSource = v9->_mergeCandidatesDataSource;
    v9->_mergeCandidatesDataSource = v10;

    v12 = [PXPeopleRecoDataSource alloc];
    -[PXPeopleInternalAnnotationDataSource person](v9, "person");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PXPeopleRecoDataSource initWithPerson:dataSourceDelegate:](v12, "initWithPerson:dataSourceDelegate:", v13, v9);
    confirmedAssetsDataSource = v9->_confirmedAssetsDataSource;
    v9->_confirmedAssetsDataSource = (PXPeopleRecoDataSource *)v14;

    -[PXPeopleInternalAnnotationDataSource fetchMergeCandidatesAndFaces](v9, "fetchMergeCandidatesAndFaces");
    -[PXPeopleInternalAnnotationDataSource fetchUnverifiedPeopleAndFaces](v9, "fetchUnverifiedPeopleAndFaces");
  }

  return v9;
}

- (void)fetchMergeCandidatesAndFaces
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PXPeopleInternalAnnotationDataSource setAcceptedMergeCandidates:](self, "setAcceptedMergeCandidates:", v3);

  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PXPeopleInternalAnnotationDataSource setRejectedMergeCandidates:](self, "setRejectedMergeCandidates:", v4);

  v5 = (void *)MEMORY[0x1E0CD1570];
  -[PXPeopleInternalAnnotationDataSource person](self, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchOptionsWithPhotoLibrary:orObject:", 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleInternalAnnotationDataSource person](self, "person");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "px_isHuman");

  if ((v9 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[PXPeopleInternalAnnotationDataSource person](self, "person");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithShort:", objc_msgSend(v11, "detectionType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIncludedDetectionTypes:", v13);

  }
  v14 = (void *)MEMORY[0x1E0CD16C0];
  -[PXPeopleInternalAnnotationDataSource person](self, "person");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fetchMergeCandidatePersonsForPerson:options:", v15, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleInternalAnnotationDataSource setMergeCandidates:](self, "setMergeCandidates:", v16);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[PXPeopleInternalAnnotationDataSource mergeCandidates](self, "mergeCandidates", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v21);
        v23 = (void *)MEMORY[0x1A85CE17C]();
        -[PXPeopleInternalAnnotationDataSource acceptedMergeCandidates](self, "acceptedMergeCandidates");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v22);

        objc_autoreleasePoolPop(v23);
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v19);
  }

}

- (void)fetchUnverifiedPeopleAndFaces
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  PXPeopleInternalAnnotationDataSource *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
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
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id *v52;
  uint64_t *v53;
  id v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  uint64_t k;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id *v67;
  id *v68;
  void *v69;
  id v70;
  NSObject *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t m;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  id v95;
  id obj;
  uint64_t v97;
  int v98;
  uint64_t v99;
  id v100;
  PXPeopleInternalAnnotationDataSource *v101;
  void *v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  id v107;
  id v108;
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  uint64_t v114;
  uint64_t v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  uint8_t v125[128];
  uint8_t buf[4];
  id v127;
  __int16 v128;
  id v129;
  void *v130;
  _BYTE v131[128];
  uint64_t v132;
  _BYTE v133[128];
  _QWORD v134[4];

  v134[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXPeopleInternalAnnotationDataSource setUnverifiedPeople:](self, "setUnverifiedPeople:", v3);

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXPeopleInternalAnnotationDataSource setUnverifiedPeopleFaces:](self, "setUnverifiedPeopleFaces:", v4);

  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PXPeopleInternalAnnotationDataSource setAcceptedUnverifiedPeople:](self, "setAcceptedUnverifiedPeople:", v5);

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PXPeopleInternalAnnotationDataSource setKeyFaceDistancesByUnverifiedPersonLocalIdentifier:](self, "setKeyFaceDistancesByUnverifiedPersonLocalIdentifier:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = (void *)MEMORY[0x1E0CD1570];
  -[PXPeopleInternalAnnotationDataSource person](self, "person");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchOptionsWithPhotoLibrary:orObject:", 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPersonContext:", 6);
  +[PXPeopleDetailSettings sharedInstance](PXPeopleDetailSettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMinimumUnverifiedFaceCount:", objc_msgSend(v11, "unverifiedPeopleAnnotationMinimumFaceCount"));

  -[PXPeopleInternalAnnotationDataSource person](self, "person");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v12, "px_isHuman");

  if ((v9 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[PXPeopleInternalAnnotationDataSource person](self, "person");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberWithShort:", objc_msgSend(v14, "detectionType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v134[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIncludedDetectionTypes:", v16);

  }
  v101 = self;
  v91 = v10;
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v10);
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v133, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v121;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v121 != v19)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * i);
        v22 = (void *)MEMORY[0x1A85CE17C]();
        -[PXPeopleInternalAnnotationDataSource mergeCandidates](v101, "mergeCandidates");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "containsObject:", v21);

        if ((v24 & 1) == 0)
          objc_msgSend(v7, "addObject:", v21);
        objc_autoreleasePoolPop(v22);
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v133, 16);
    }
    while (v18);
  }

  v25 = (void *)MEMORY[0x1E0CD1570];
  v26 = v101;
  -[PXPeopleInternalAnnotationDataSource person](v101, "person");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "fetchOptionsWithPhotoLibrary:orObject:", 0, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "setIncludeOnlyFacesWithFaceprints:", 1);
  v132 = *MEMORY[0x1E0CD1B50];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v132, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFetchPropertySets:", v29);

  v93 = v28;
  objc_msgSend(MEMORY[0x1E0CD1528], "fetchKeyFaceByPersonLocalIdentifierForPersons:options:", v7, v28);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v30 = v7;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v116, v131, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v117;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v117 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * j);
        objc_msgSend(v35, "localIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "objectForKeyedSubscript:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          -[PXPeopleInternalAnnotationDataSource unverifiedPeopleFaces](v101, "unverifiedPeopleFaces");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v37);

          -[PXPeopleInternalAnnotationDataSource unverifiedPeople](v101, "unverifiedPeople");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v35);

        }
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v116, v131, 16);
    }
    while (v32);
  }
  v92 = v30;

  v40 = (void *)MEMORY[0x1E0CD1528];
  -[PXPeopleInternalAnnotationDataSource person](v101, "person");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v130, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "fetchKeyFaceByPersonLocalIdentifierForPersons:options:", v42, v93);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleInternalAnnotationDataSource person](v101, "person");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v41) = objc_msgSend(v44, "px_isHuman");

  v98 = (int)v41;
  if ((_DWORD)v41)
  {
    v45 = objc_alloc(MEMORY[0x1E0CEDEE8]);
    -[PXPeopleInternalAnnotationDataSource person](v101, "person", v43);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "localIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKeyedSubscript:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "faceClusteringProperties");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "faceprint");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "faceprintData");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = 0;
    v52 = (id *)&v115;
    v53 = &v115;
  }
  else
  {
    v45 = objc_alloc(MEMORY[0x1E0CEDDA0]);
    -[PXPeopleInternalAnnotationDataSource person](v101, "person", v43);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "localIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKeyedSubscript:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "faceClusteringProperties");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "faceprint");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "faceprintData");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = 0;
    v52 = (id *)&v114;
    v53 = &v114;
  }
  v94 = (void *)objc_msgSend(v45, "initWithState:error:", v51, v53);
  v54 = *v52;

  v55 = v92;
  if (v54)
  {
    PLUIGetLog();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      -[PXPeopleInternalAnnotationDataSource person](v101, "person");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "localIdentifier");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v127 = v58;
      v128 = 2112;
      v129 = v54;
      _os_log_impl(&dword_1A6789000, v56, OS_LOG_TYPE_ERROR, "Error getting faceprint of person %@: %@", buf, 0x16u);

    }
  }
  if (v94)
  {
    v100 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    v113 = 0u;
    -[PXPeopleInternalAnnotationDataSource unverifiedPeople](v101, "unverifiedPeople");
    v95 = (id)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v110, v125, 16);
    if (!v99)
      goto LABEL_49;
    v97 = *(_QWORD *)v111;
    while (1)
    {
      for (k = 0; k != v99; ++k)
      {
        if (*(_QWORD *)v111 != v97)
          objc_enumerationMutation(v95);
        v60 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * k);
        if (v98)
        {
          v61 = objc_alloc(MEMORY[0x1E0CEDEE8]);
          objc_msgSend(v60, "localIdentifier");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "objectForKeyedSubscript:", v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "faceClusteringProperties");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "faceprint");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "faceprintData");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = v54;
          v67 = &v109;
          v68 = &v109;
        }
        else
        {
          v61 = objc_alloc(MEMORY[0x1E0CEDDA0]);
          objc_msgSend(v60, "localIdentifier");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "objectForKeyedSubscript:", v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "faceClusteringProperties");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "faceprint");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "faceprintData");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = v54;
          v67 = &v108;
          v68 = &v108;
        }
        v69 = (void *)objc_msgSend(v61, "initWithState:error:", v66, v68);
        v70 = *v67;

        if (v70)
        {
          PLUIGetLog();
          v71 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          {
            -[PXPeopleInternalAnnotationDataSource person](v101, "person");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "localIdentifier");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v127 = v73;
            v128 = 2112;
            v129 = v70;
            _os_log_impl(&dword_1A6789000, v71, OS_LOG_TYPE_ERROR, "Error getting faceprint of person %@: %@", buf, 0x16u);

            v54 = v70;
            v26 = v101;
            goto LABEL_47;
          }
          v54 = v70;
          goto LABEL_46;
        }
        v107 = 0;
        objc_msgSend(v94, "computeDistance:withDistanceFunction:error:", v69, 0, &v107);
        v71 = objc_claimAutoreleasedReturnValue();
        v54 = v107;
        if (!v54)
        {
          objc_msgSend(v100, "setObject:forKeyedSubscript:", v71, v60);
LABEL_46:
          v26 = v101;
          goto LABEL_47;
        }
        PLUIGetLog();
        v74 = objc_claimAutoreleasedReturnValue();
        v26 = v101;
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v127 = v54;
          _os_log_impl(&dword_1A6789000, v74, OS_LOG_TYPE_ERROR, "Error finding distance between faceprints: %@", buf, 0xCu);
        }

LABEL_47:
      }
      v99 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v110, v125, 16);
      if (!v99)
      {
LABEL_49:

        objc_msgSend(v100, "keysSortedByValueUsingComparator:", &__block_literal_global_77072);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = (void *)objc_msgSend(v75, "mutableCopy");
        -[PXPeopleInternalAnnotationDataSource setUnverifiedPeople:](v26, "setUnverifiedPeople:", v76);

        -[PXPeopleInternalAnnotationDataSource unverifiedPeopleFaces](v26, "unverifiedPeopleFaces");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "removeAllObjects");

        v105 = 0u;
        v106 = 0u;
        v103 = 0u;
        v104 = 0u;
        -[PXPeopleInternalAnnotationDataSource unverifiedPeople](v26, "unverifiedPeople");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v103, v124, 16);
        if (v79)
        {
          v80 = v79;
          v81 = *(_QWORD *)v104;
          do
          {
            for (m = 0; m != v80; ++m)
            {
              if (*(_QWORD *)v104 != v81)
                objc_enumerationMutation(v78);
              v83 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * m);
              -[PXPeopleInternalAnnotationDataSource unverifiedPeopleFaces](v26, "unverifiedPeopleFaces");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "localIdentifier");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "objectForKeyedSubscript:", v85);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "addObject:", v86);

              objc_msgSend(v100, "objectForKeyedSubscript:", v83);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              -[PXPeopleInternalAnnotationDataSource keyFaceDistancesByUnverifiedPersonLocalIdentifier](v26, "keyFaceDistancesByUnverifiedPersonLocalIdentifier");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "localIdentifier");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "setObject:forKeyedSubscript:", v87, v89);

            }
            v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v103, v124, 16);
          }
          while (v80);
        }

        v55 = v92;
        break;
      }
    }
  }

}

- (id)keyFaceDistanceForUnverifiedPersonIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "item");
  -[PXPeopleInternalAnnotationDataSource keyFaceDistancesByUnverifiedPersonLocalIdentifier](self, "keyFaceDistancesByUnverifiedPersonLocalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 >= v7)
  {
    v12 = 0;
  }
  else
  {
    -[PXPeopleInternalAnnotationDataSource keyFaceDistancesByUnverifiedPersonLocalIdentifier](self, "keyFaceDistancesByUnverifiedPersonLocalIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleInternalAnnotationDataSource unverifiedPeople](self, "unverifiedPeople");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (int64_t)numberOfSections
{
  return 3;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  int64_t v5;

  if (a3 == 1)
  {
    -[PXPeopleInternalAnnotationDataSource confirmedAssetsDataSource](self, "confirmedAssetsDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "numberOfItems");
  }
  else
  {
    if (a3)
      -[PXPeopleInternalAnnotationDataSource unverifiedPeople](self, "unverifiedPeople");
    else
      -[PXPeopleInternalAnnotationDataSource mergeCandidates](self, "mergeCandidates");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");
  }
  v5 = v4;

  return v5;
}

- (id)titleForIndexPath:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "section"))
  {
    if (objc_msgSend(v4, "section") == 1)
    {
      v5 = CFSTR("Confirmed Assets");
    }
    else
    {
      -[PXPeopleInternalAnnotationDataSource person](self, "person");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "px_isHuman");
      PXStringWithValidatedFormat();
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = CFSTR("Merge Candidates");
  }

  return v5;
}

- (void)requestImageForItemAtIndexPath:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 imageBlock:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  unint64_t v13;
  PXPeopleFaceCropFetchOptions *v14;
  void *v15;
  unint64_t v16;
  PXPeopleFaceCropFetchOptions *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  PXPeopleFaceCropFetchOptions *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;

  height = a4.height;
  width = a4.width;
  v11 = a3;
  v12 = a6;
  v13 = objc_msgSend(v11, "item");
  if (objc_msgSend(v11, "section"))
  {
    if (objc_msgSend(v11, "section") == 1)
    {
      -[PXPeopleInternalAnnotationDataSource confirmedAssetsDataSource](self, "confirmedAssetsDataSource");
      v14 = (PXPeopleFaceCropFetchOptions *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleFaceCropFetchOptions requestImageForItemAtIndex:targetSize:displayScale:imageBlock:](v14, "requestImageForItemAtIndex:targetSize:displayScale:imageBlock:", v13, v12, width, height, a5);
LABEL_13:

      goto LABEL_14;
    }
    -[PXPeopleInternalAnnotationDataSource unverifiedPeopleFaces](self, "unverifiedPeopleFaces");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v13 < v24)
    {
      v25 = [PXPeopleFaceCropFetchOptions alloc];
      -[PXPeopleInternalAnnotationDataSource unverifiedPeople](self, "unverifiedPeople");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", v13);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleInternalAnnotationDataSource unverifiedPeopleFaces](self, "unverifiedPeopleFaces");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectAtIndexedSubscript:", v13);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PXPeopleFaceCropFetchOptions initWithPerson:face:targetSize:displayScale:](v25, "initWithPerson:face:targetSize:displayScale:", v27, v29, width, height, a5);

      +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v25) = objc_msgSend(v30, "showReviewPhotosObjectType");

      if ((v25 & 1) == 0)
        -[PXPeopleFaceCropFetchOptions setCornerStyle:](v14, "setCornerStyle:", 1);
      +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __106__PXPeopleInternalAnnotationDataSource_requestImageForItemAtIndexPath_targetSize_displayScale_imageBlock___block_invoke_180;
      v32[3] = &unk_1E5147AB8;
      v33 = v12;
      objc_msgSend(v31, "requestFaceCropForOptions:resultHandler:", v14, v32);

      v22 = v33;
LABEL_12:

      goto LABEL_13;
    }
  }
  else
  {
    -[PXPeopleInternalAnnotationDataSource mergeCandidates](self, "mergeCandidates");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v13 < v16)
    {
      v17 = [PXPeopleFaceCropFetchOptions alloc];
      -[PXPeopleInternalAnnotationDataSource mergeCandidates](self, "mergeCandidates");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:](v17, "initWithPerson:targetSize:displayScale:", v19, width, height, a5);

      +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v17) = objc_msgSend(v20, "showReviewPhotosObjectType");

      if ((v17 & 1) == 0)
        -[PXPeopleFaceCropFetchOptions setCornerStyle:](v14, "setCornerStyle:", 1);
      +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __106__PXPeopleInternalAnnotationDataSource_requestImageForItemAtIndexPath_targetSize_displayScale_imageBlock___block_invoke;
      v34[3] = &unk_1E5147AB8;
      v35 = v12;
      objc_msgSend(v21, "requestFaceCropForOptions:resultHandler:", v14, v34);

      v22 = v35;
      goto LABEL_12;
    }
  }
LABEL_14:

}

- (BOOL)isIndexPathRejected:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "item");
  if (!objc_msgSend(v4, "section"))
  {
    -[PXPeopleInternalAnnotationDataSource rejectedMergeCandidates](self, "rejectedMergeCandidates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleInternalAnnotationDataSource mergeCandidates](self, "mergeCandidates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v6, "containsObject:", v8);
LABEL_6:

    goto LABEL_7;
  }
  if (objc_msgSend(v4, "section") != 1)
  {
    -[PXPeopleInternalAnnotationDataSource acceptedUnverifiedPeople](self, "acceptedUnverifiedPeople");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleInternalAnnotationDataSource unverifiedPeople](self, "unverifiedPeople");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v6, "containsObject:", v8) ^ 1;
    goto LABEL_6;
  }
  -[PXPeopleInternalAnnotationDataSource confirmedAssetsDataSource](self, "confirmedAssetsDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v6, "isIndexRejected:", v5);
LABEL_7:

  return v5;
}

- (BOOL)toggleRejectionForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  BOOL v21;

  v4 = a3;
  v5 = objc_msgSend(v4, "item");
  if (!objc_msgSend(v4, "section"))
  {
    -[PXPeopleInternalAnnotationDataSource setHasChanges:](self, "setHasChanges:", 1);
    -[PXPeopleInternalAnnotationDataSource acceptedMergeCandidates](self, "acceptedMergeCandidates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleInternalAnnotationDataSource mergeCandidates](self, "mergeCandidates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "containsObject:", v10);

    -[PXPeopleInternalAnnotationDataSource acceptedMergeCandidates](self, "acceptedMergeCandidates");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleInternalAnnotationDataSource mergeCandidates](self, "mergeCandidates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v12, "removeObject:", v14);

      -[PXPeopleInternalAnnotationDataSource rejectedMergeCandidates](self, "rejectedMergeCandidates");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeopleInternalAnnotationDataSource mergeCandidates](self, "mergeCandidates");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      objc_msgSend(v7, "addObject:", v16);
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(v12, "addObject:", v14);

    -[PXPeopleInternalAnnotationDataSource rejectedMergeCandidates](self, "rejectedMergeCandidates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleInternalAnnotationDataSource mergeCandidates](self, "mergeCandidates");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    objc_msgSend(v7, "removeObject:", v16);
    goto LABEL_10;
  }
  v6 = objc_msgSend(v4, "section");
  -[PXPeopleInternalAnnotationDataSource setHasChanges:](self, "setHasChanges:", 1);
  if (v6 != 1)
  {
    -[PXPeopleInternalAnnotationDataSource acceptedUnverifiedPeople](self, "acceptedUnverifiedPeople");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleInternalAnnotationDataSource unverifiedPeople](self, "unverifiedPeople");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "containsObject:", v19);

    -[PXPeopleInternalAnnotationDataSource acceptedUnverifiedPeople](self, "acceptedUnverifiedPeople");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleInternalAnnotationDataSource unverifiedPeople](self, "unverifiedPeople");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
      goto LABEL_7;
    goto LABEL_9;
  }
  -[PXPeopleInternalAnnotationDataSource confirmedAssetsDataSource](self, "confirmedAssetsDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "toggleRejectionForIndex:", objc_msgSend(v4, "item"));
LABEL_11:

  v21 = -[PXPeopleInternalAnnotationDataSource isIndexPathRejected:](self, "isIndexPathRejected:", v4);
  return v21;
}

- (void)commitChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  -[PXPeopleInternalAnnotationDataSource confirmedAssetsDataSource](self, "confirmedAssetsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commitChanges");

  -[PXPeopleInternalAnnotationDataSource acceptedMergeCandidates](self, "acceptedMergeCandidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleInternalAnnotationDataSource rejectedMergeCandidates](self, "rejectedMergeCandidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleInternalAnnotationDataSource acceptedUnverifiedPeople](self, "acceptedUnverifiedPeople");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v9);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count") || objc_msgSend(v7, "count"))
  {
    -[PXPeopleInternalAnnotationDataSource mergeCandidatesDataSource](self, "mergeCandidatesDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleInternalAnnotationDataSource person](self, "person");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v10, "commitSuggestionsForPerson:withConfirmedSuggestions:andRejectedSuggestions:", v11, v13, v7);

  }
}

- (void)recoDataSourceDataChanged:(id)a3
{
  id v4;

  -[PXPeopleInternalAnnotationDataSource dataSourceDelegate](self, "dataSourceDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "annotationDataSourceDataChanged:", self);

}

- (PHPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (PXPeopleSuggestionDataSource)mergeCandidatesDataSource
{
  return self->_mergeCandidatesDataSource;
}

- (PXPeopleRecoDataSource)confirmedAssetsDataSource
{
  return self->_confirmedAssetsDataSource;
}

- (PHFetchResult)mergeCandidates
{
  return self->_mergeCandidates;
}

- (void)setMergeCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_mergeCandidates, a3);
}

- (NSMutableSet)acceptedMergeCandidates
{
  return self->_acceptedMergeCandidates;
}

- (void)setAcceptedMergeCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_acceptedMergeCandidates, a3);
}

- (NSMutableSet)rejectedMergeCandidates
{
  return self->_rejectedMergeCandidates;
}

- (void)setRejectedMergeCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_rejectedMergeCandidates, a3);
}

- (NSMutableArray)unverifiedPeople
{
  return self->_unverifiedPeople;
}

- (void)setUnverifiedPeople:(id)a3
{
  objc_storeStrong((id *)&self->_unverifiedPeople, a3);
}

- (NSMutableArray)unverifiedPeopleFaces
{
  return self->_unverifiedPeopleFaces;
}

- (void)setUnverifiedPeopleFaces:(id)a3
{
  objc_storeStrong((id *)&self->_unverifiedPeopleFaces, a3);
}

- (NSMutableSet)acceptedUnverifiedPeople
{
  return self->_acceptedUnverifiedPeople;
}

- (void)setAcceptedUnverifiedPeople:(id)a3
{
  objc_storeStrong((id *)&self->_acceptedUnverifiedPeople, a3);
}

- (NSMutableDictionary)keyFaceDistancesByUnverifiedPersonLocalIdentifier
{
  return self->_keyFaceDistancesByUnverifiedPersonLocalIdentifier;
}

- (void)setKeyFaceDistancesByUnverifiedPersonLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_keyFaceDistancesByUnverifiedPersonLocalIdentifier, a3);
}

- (BOOL)hasChanges
{
  return self->_hasChanges;
}

- (void)setHasChanges:(BOOL)a3
{
  self->_hasChanges = a3;
}

- (PXPeopleInternalAnnotationDataSourceDelegate)dataSourceDelegate
{
  return (PXPeopleInternalAnnotationDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_dataSourceDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSourceDelegate);
  objc_storeStrong((id *)&self->_keyFaceDistancesByUnverifiedPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_acceptedUnverifiedPeople, 0);
  objc_storeStrong((id *)&self->_unverifiedPeopleFaces, 0);
  objc_storeStrong((id *)&self->_unverifiedPeople, 0);
  objc_storeStrong((id *)&self->_rejectedMergeCandidates, 0);
  objc_storeStrong((id *)&self->_acceptedMergeCandidates, 0);
  objc_storeStrong((id *)&self->_mergeCandidates, 0);
  objc_storeStrong((id *)&self->_confirmedAssetsDataSource, 0);
  objc_storeStrong((id *)&self->_mergeCandidatesDataSource, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

void __106__PXPeopleInternalAnnotationDataSource_requestImageForItemAtIndexPath_targetSize_displayScale_imageBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PXPeopleContentsRectKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "CGRectValue");
  (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PXPeopleErrorKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "PXPeopleInternalAnnotationViewController: error requesting face crop: %@", (uint8_t *)&v11, 0xCu);
    }

  }
}

void __106__PXPeopleInternalAnnotationDataSource_requestImageForItemAtIndexPath_targetSize_displayScale_imageBlock___block_invoke_180(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PXPeopleContentsRectKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "CGRectValue");
  (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PXPeopleErrorKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "PXPeopleInternalAnnotationViewController: error requesting face crop: %@", (uint8_t *)&v11, 0xCu);
    }

  }
}

uint64_t __69__PXPeopleInternalAnnotationDataSource_fetchUnverifiedPeopleAndFaces__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

@end
