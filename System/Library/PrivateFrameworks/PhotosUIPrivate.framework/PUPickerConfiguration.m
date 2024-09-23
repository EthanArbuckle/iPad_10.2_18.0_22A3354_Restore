@implementation PUPickerConfiguration

- (PUPickerConfiguration)init
{
  id v4;
  PUPickerConfiguration *v5;
  void *v7;

  v4 = objc_alloc_init(MEMORY[0x1E0CD2168]);
  v5 = -[PUPickerConfiguration initWithPHPickerConfiguration:connection:](self, "initWithPHPickerConfiguration:connection:", v4, 0);

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, 0, CFSTR("PUPickerConfiguration.m"), 145, CFSTR("Self must not be nil."));

  }
  return v5;
}

- (PUPickerConfiguration)initWithPHPickerConfiguration:(id)a3 connection:(id)a4
{
  id v7;
  id v8;
  PUPickerConfiguration *v9;
  void *v11;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerConfiguration.m"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("phPickerConfiguration != nil"));

  }
  v9 = -[PUPickerConfiguration initWithPHPickerConfiguration:connection:overriddenGeneratedFilter:allowsDownload:usesMemoriesLayout:](self, "initWithPHPickerConfiguration:connection:overriddenGeneratedFilter:allowsDownload:usesMemoriesLayout:", v7, v8, 0, 0, objc_msgSend(v7, "_usesMemoriesLayout"));

  return v9;
}

- (id)initForUIImagePickerControllerWithPHPickerConfiguration:(id)a3 connection:(id)a4 overriddenGeneratedFilter:(id)a5
{
  id v9;
  id v10;
  id v11;
  PUPickerConfiguration *v12;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerConfiguration.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("phPickerConfiguration != nil"));

  }
  v12 = -[PUPickerConfiguration initWithPHPickerConfiguration:connection:overriddenGeneratedFilter:allowsDownload:usesMemoriesLayout:](self, "initWithPHPickerConfiguration:connection:overriddenGeneratedFilter:allowsDownload:usesMemoriesLayout:", v9, v10, v11, objc_msgSend(v9, "_onlyReturnsIdentifiers") ^ 1, objc_msgSend(v9, "_usesMemoriesLayout"));

  return v12;
}

- (PUPickerConfiguration)initWithPHPickerConfiguration:(id)a3 connection:(id)a4 overriddenGeneratedFilter:(id)a5 allowsDownload:(BOOL)a6 usesMemoriesLayout:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  PUPickerConfiguration *v16;
  PUPickerConfiguration *v17;
  PUPickerGeneratedFilter *v18;
  PUPickerGeneratedFilter *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _PHPickerSuggestionGroup *suggestionGroup;
  uint64_t v29;
  _PHPickerCollectionConfiguration *albumsConfiguration;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSOrderedSet *allPersonIdentifiers;
  void *v41;
  void *v42;
  uint64_t v43;
  char v44;
  void *v45;
  id v46;
  uint64_t v47;
  NSString *pickerClientDisplayName;
  NSObject *v49;
  id v50;
  BOOL v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t i;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  NSOrderedSet *preselectedItemObjectIDs;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  NSOrderedSet *suggestedItemObjectIDs;
  PUPickerGeneratedFilter *v101;
  uint64_t v102;
  id v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  id *p_preselectedItemIdentifiers;
  void *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  uint64_t v117;
  id v118;
  void *v119;
  void *v120;
  NSObject *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  PHFetchResult *v134;
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
  NSObject *v148;
  void *v149;
  void *v150;
  NSObject *v151;
  uint64_t v152;
  PHFetchResult *containerCollectionFetchResult;
  uint64_t v154;
  PHAssetCollection *allPhotosVirtualCollection;
  PUPickerConfiguration *v156;
  PUPickerConfiguration *v157;
  void *v159;
  void *v160;
  uint64_t v161;
  void *v162;
  void *v163;
  uint64_t v164;
  void *v165;
  id v166;
  id v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  id v176;
  PUPickerGeneratedFilter *v177;
  id v178;
  void *v179;
  id obj;
  _BOOL4 v181;
  void *v182;
  void *v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  _OWORD v188[2];
  id v189;
  id v190;
  objc_super v191;
  void *v192;
  void *v193;
  void *v194;
  uint64_t v195;
  uint8_t v196[128];
  uint8_t buf[16];
  __int128 v198;
  uint8_t v199[16];
  __int128 v200;
  _QWORD v201[4];

  v181 = a7;
  v201[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerConfiguration.m"), 180, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("phPickerConfiguration != nil"));

  }
  v191.receiver = self;
  v191.super_class = (Class)PUPickerConfiguration;
  v16 = -[PUPickerConfiguration init](&v191, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_phPickerConfiguration, a3);
    v17->_preferredAssetRepresentationMode = objc_msgSend(v13, "preferredAssetRepresentationMode");
    v17->_selection = objc_msgSend(v13, "selection");
    v17->_mode = objc_msgSend(v13, "mode");
    if (v15)
    {
      v18 = (PUPickerGeneratedFilter *)v15;
    }
    else
    {
      v19 = [PUPickerGeneratedFilter alloc];
      objc_msgSend(v13, "filter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_puPickerFilter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[PUPickerGeneratedFilter initWithFilter:](v19, "initWithFilter:", v21);

    }
    objc_storeStrong((id *)&v17->_generatedFilter, v18);
    objc_msgSend(v13, "photoLibrary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      v24 = v22;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD16F8], "imagePickerPhotoLibrary");
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v25 = v24;

    v183 = v25;
    objc_storeStrong((id *)&v17->_photoLibrary, v25);
    objc_msgSend(v13, "photoLibrary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_receivedPhotoLibrary = v26 != 0;

    v17->_onlyReturnsIdentifiers = objc_msgSend(v13, "_onlyReturnsIdentifiers");
    v17->_allowsDownscaling = objc_msgSend(v13, "_allowsDownscaling");
    v17->_allowsEncodingPolicyModification = objc_msgSend(v13, "_allowsEncodingPolicyModification");
    objc_msgSend(v13, "_suggestionGroup");
    v27 = objc_claimAutoreleasedReturnValue();
    suggestionGroup = v17->_suggestionGroup;
    v17->_suggestionGroup = (_PHPickerSuggestionGroup *)v27;

    objc_msgSend(v13, "_albumsConfiguration");
    v29 = objc_claimAutoreleasedReturnValue();
    albumsConfiguration = v17->_albumsConfiguration;
    v17->_albumsConfiguration = (_PHPickerCollectionConfiguration *)v29;

    objc_msgSend(v13, "_peopleConfiguration");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v13, "_peopleConfiguration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v201[0] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v201, 1);
    }
    else
    {
      objc_msgSend(v13, "_followupPeopleConfigurations");
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v17->_peopleConfigurations, v32);
    if (v31)
    {

      v32 = v25;
    }

    v17->_usesMemoriesLayout = v181;
    objc_msgSend(v13, "_peopleConfiguration");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v13, "_peopleConfiguration");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "suggestedIdentifiers");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v35);
      objc_msgSend(v13, "_peopleConfiguration");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "_identifiers");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v38, "count"))
        objc_msgSend(v36, "addObjectsFromArray:", v38);
      v39 = objc_msgSend(v36, "copy");
      allPersonIdentifiers = v17->_allPersonIdentifiers;
      v17->_allPersonIdentifiers = (NSOrderedSet *)v39;

    }
    v17->_allowsDownload = a6;
    v177 = v18;
    v178 = v15;
    if (v14)
    {
      v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D731B0]), "initWithConnection:", v14);
      objc_msgSend(v41, "trustedCallerBundleID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_OWORD *)v199 = 0u;
      v200 = 0u;
      if (v41)
        objc_msgSend(v41, "clientAuditToken");
      *(_OWORD *)buf = *(_OWORD *)v199;
      v198 = v200;
      v43 = PLPhotosAccessAllowedResultForClientAuditToken();
      *(_OWORD *)buf = *(_OWORD *)v199;
      v198 = v200;
      v44 = objc_msgSend(MEMORY[0x1E0D732D8], "isEntitledForPhotoKitOrPrivatePhotosTCCForToken:", buf);
      v190 = 0;
      *(_OWORD *)buf = *(_OWORD *)v199;
      v198 = v200;
      objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForAuditToken:error:", buf, &v190);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v190;
      if (v45)
      {
        objc_msgSend(v45, "localizedName");
        v47 = objc_claimAutoreleasedReturnValue();
        pickerClientDisplayName = v17->_pickerClientDisplayName;
        v17->_pickerClientDisplayName = (NSString *)v47;

        if (!v42)
        {
          objc_msgSend(v45, "bundleIdentifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        PLPickerGetLog();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v46;
          _os_log_impl(&dword_1AAB61000, v49, OS_LOG_TYPE_ERROR, "Failed to obtain bundle record: %@", buf, 0xCu);
        }

      }
    }
    else
    {
      v42 = 0;
      v44 = 0;
      v41 = 0;
      v43 = 1;
    }
    v175 = v41;
    objc_storeStrong((id *)&v17->_pickerClientIdentification, v41);
    v17->_pickerClientAccessAllowedResult = v43;
    v17->_pickerClientIsEntitledForOrHasPrivateLibraryAccess = v44;
    v174 = v42;
    objc_storeStrong((id *)&v17->_pickerClientBundleIdentifier, v42);
    objc_msgSend(v13, "_purposedLimitedLibraryApplicationIdentifier");
    v50 = (id)objc_claimAutoreleasedReturnValue();
    v51 = v50 != 0;

    if (v50)
    {
      objc_msgSend(v13, "_purposedLimitedLibraryApplicationIdentifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v189 = 0;
      +[PUPickerConfiguration limitedLibraryApplicationTrustedIdentifierWithConnection:purposedIdentifier:error:](PUPickerConfiguration, "limitedLibraryApplicationTrustedIdentifierWithConnection:purposedIdentifier:error:", v14, v52, &v189);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v189;

    }
    else
    {
      v53 = 0;
    }
    v17->_isLimitedLibraryPicker = v51;
    objc_storeStrong((id *)&v17->_limitedLibraryClientIdentifier, v53);
    v172 = v50;
    objc_storeStrong((id *)&v17->_LimitedLibraryError, v50);
    v54 = (void *)MEMORY[0x1E0C99E40];
    objc_msgSend(v13, "preselectedAssetIdentifiers");
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = (void *)v55;
    v57 = (void *)MEMORY[0x1E0C9AA60];
    if (v55)
      v58 = v55;
    else
      v58 = MEMORY[0x1E0C9AA60];
    objc_msgSend(v54, "orderedSetWithArray:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = (void *)MEMORY[0x1E0C99E40];
    objc_msgSend(v13, "_peopleConfiguration");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "preselectedIdentifiers");
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = (void *)v62;
    if (v62)
      v64 = v62;
    else
      v64 = (uint64_t)v57;
    objc_msgSend(v60, "orderedSetWithArray:", v64);
    v179 = (void *)objc_claimAutoreleasedReturnValue();

    v65 = (void *)MEMORY[0x1E0C99E40];
    objc_msgSend(v13, "_albumsConfiguration");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "preselectedIdentifiers");
    v67 = objc_claimAutoreleasedReturnValue();
    v68 = (void *)v67;
    if (v67)
      v69 = v67;
    else
      v69 = (uint64_t)v57;
    objc_msgSend(v65, "orderedSetWithArray:", v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    v176 = v14;
    v173 = v53;
    obj = v70;
    if (v53)
    {
      if (v14)
        objc_msgSend(v14, "auditToken");
      else
        memset(v188, 0, sizeof(v188));
      v85 = 0x1E0C99000uLL;
      +[PUPickerConfiguration limitedLibraryApplicationPreselectedObjectIDsOrCreateEmptySelectionWithTrustedIdentifier:auditToken:photoLibrary:](PUPickerConfiguration, "limitedLibraryApplicationPreselectedObjectIDsOrCreateEmptySelectionWithTrustedIdentifier:auditToken:photoLibrary:", v53, v188, v183);
      v84 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v70, "count"))
    {
      v166 = v13;
      -[PUPickerConfiguration photoLibrary](v17, "photoLibrary");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "librarySpecificFetchOptions");
      v72 = v70;
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v184 = 0u;
      v185 = 0u;
      v186 = 0u;
      v187 = 0u;
      objc_msgSend(v72, "array");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v184, v196, 16);
      if (v76)
      {
        v77 = v76;
        v78 = *(_QWORD *)v185;
        do
        {
          for (i = 0; i != v77; ++i)
          {
            if (*(_QWORD *)v185 != v78)
              objc_enumerationMutation(v75);
            v80 = (void *)MEMORY[0x1E0CD13B8];
            v195 = *(_QWORD *)(*((_QWORD *)&v184 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v195, 1);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "fetchAssetCollectionsWithLocalIdentifiers:options:", v81, v73);
            v82 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v82, "px_fetchedObjectIDsSortedByLocalIdentifiers:", v59);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "addObjectsFromArray:", v83);

          }
          v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v184, v196, 16);
        }
        while (v77);
      }

      v84 = objc_msgSend(v74, "mutableCopy");
      objc_storeStrong((id *)&v17->_preselectedItemIdentifiers, obj);

      v13 = v166;
      v57 = (void *)MEMORY[0x1E0C9AA60];
      v85 = 0x1E0C99000;
    }
    else
    {
      v85 = 0x1E0C99000;
      if (objc_msgSend(v59, "count"))
      {
        -[PUPickerConfiguration photoLibrary](v17, "photoLibrary");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "librarySpecificFetchOptions");
        v107 = (void *)objc_claimAutoreleasedReturnValue();

        v108 = (void *)MEMORY[0x1E0CD1390];
        objc_msgSend(v59, "array");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "fetchAssetsWithLocalIdentifiers:options:", v109, v107);
        v110 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v110, "px_fetchedObjectIDsSortedByLocalIdentifiers:", v59);
        v84 = objc_claimAutoreleasedReturnValue();
        p_preselectedItemIdentifiers = (id *)&v17->_preselectedItemIdentifiers;
        v112 = v59;
      }
      else
      {
        if (!objc_msgSend(v179, "count"))
        {
          objc_storeStrong((id *)&v17->_preselectedItemIdentifiers, v59);
          v84 = MEMORY[0x1E0C9AA60];
          goto LABEL_56;
        }
        -[PUPickerConfiguration photoLibrary](v17, "photoLibrary");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v131, "librarySpecificFetchOptions");
        v107 = (void *)objc_claimAutoreleasedReturnValue();

        v132 = (void *)MEMORY[0x1E0CD16C0];
        objc_msgSend(v179, "array");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "fetchPersonsWithLocalIdentifiers:options:", v133, v107);
        v110 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v110, "px_fetchedObjectIDsSortedByLocalIdentifiers:", v179);
        v84 = objc_claimAutoreleasedReturnValue();
        p_preselectedItemIdentifiers = (id *)&v17->_preselectedItemIdentifiers;
        v112 = v179;
      }
      objc_storeStrong(p_preselectedItemIdentifiers, v112);

    }
LABEL_56:
    objc_msgSend(*(id *)(v85 + 3648), "orderedSetWithArray:", v84);
    v86 = objc_claimAutoreleasedReturnValue();
    preselectedItemObjectIDs = v17->_preselectedItemObjectIDs;
    v17->_preselectedItemObjectIDs = (NSOrderedSet *)v86;

    if (objc_msgSend(v13, "_sourceType") == 1
      || objc_msgSend(v13, "_sourceType") == 3
      || objc_msgSend(v13, "_sourceType") == 4)
    {
      v168 = 0;
    }
    else
    {
      objc_msgSend(v183, "librarySpecificFetchOptions");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "setIncludeAllPhotosSmartAlbum:", 1);
      objc_msgSend(v13, "_containerIdentifier");
      v114 = objc_claimAutoreleasedReturnValue();
      v115 = (void *)v114;
      if (v114)
      {
        v171 = (void *)v114;
        PUPickerConfigurationGetFetchType(v13);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = *MEMORY[0x1E0CD1BB8];
        v165 = v116;
        if (objc_msgSend(v116, "isEqualToString:", *MEMORY[0x1E0CD1BB8]))
        {
          v118 = v13;
          PUPickerConfigurationGetFetchType(v118);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "_containerIdentifier");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          v167 = v13;
          v163 = v113;
          v164 = v84;
          if (v120 && objc_msgSend(v119, "isEqualToString:", v117))
          {
            PLPickerGetLog();
            v121 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v199 = 138412290;
              *(_QWORD *)&v199[4] = v120;
              _os_log_impl(&dword_1AAB61000, v121, OS_LOG_TYPE_DEFAULT, "Looking for person with identifier: %@", v199, 0xCu);
            }

            objc_msgSend(v118, "photoLibrary");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v122, "librarySpecificFetchOptions");
            v123 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v123, "setFetchLimit:", 1);
            objc_msgSend(v123, "setPersonContext:", 5);
            objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "setIncludedDetectionTypes:", v124);

            v125 = (void *)MEMORY[0x1E0CD16C0];
            *(_QWORD *)v199 = v120;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v199, 1);
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v125, "fetchPersonsWithLocalIdentifiers:options:", v126, v123);
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v127, "firstObject");
            v128 = objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v128 = 0;
          }

          objc_msgSend(v183, "librarySpecificFetchOptions");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v141, "setIncludeTorsoAndFaceDetectionData:", 1);
          v168 = (void *)v128;
          objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsForPerson:options:", v128, v141);
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = v171;
          objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:identifier:", v142, &stru_1E58AD278, v171);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          v144 = (void *)MEMORY[0x1E0CD14E0];
          v194 = v143;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v194, 1);
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v144, "transientCollectionListWithCollections:title:", v145, &stru_1E58AD278);
          v146 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", v183, 0);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v146, v147);
          v134 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();

          v140 = v141;
          v13 = v167;
          v57 = (void *)MEMORY[0x1E0C9AA60];
          v113 = v163;
          v84 = v164;
        }
        else
        {
          if (objc_msgSend(v116, "isEqualToString:", *MEMORY[0x1E0CD1BC8]))
          {
            PUPickerConfigurationGetSocialGroup(v13);
            v161 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v183, "librarySpecificFetchOptions");
            v169 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CD1390], "fetchExclusiveAssetsForSocialGroup:options:", v161, v169);
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:identifier:", v162, &stru_1E58AD278, v171);
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            v136 = (void *)MEMORY[0x1E0CD14E0];
            v193 = v135;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v193, 1);
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v136, "transientCollectionListWithCollections:title:", v137, &stru_1E58AD278);
            v138 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", v183, 0);
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v138, v139);
            v134 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();

            v140 = (void *)v161;
            v115 = v171;

          }
          else
          {
            PLPickerGetLog();
            v148 = objc_claimAutoreleasedReturnValue();
            v115 = v171;
            if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v199 = 138412290;
              *(_QWORD *)&v199[4] = v171;
              _os_log_impl(&dword_1AAB61000, v148, OS_LOG_TYPE_DEFAULT, "Looking for custom asset collection with identifier: %@", v199, 0xCu);
            }

            v149 = (void *)MEMORY[0x1E0CD13B8];
            v192 = v171;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v192, 1);
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v149, "fetchAssetCollectionsWithLocalIdentifiers:options:", v140, v113);
            v134 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
          }
          v168 = 0;
        }

      }
      else
      {
        v168 = 0;
        v134 = 0;
      }
      -[PHFetchResult firstObject](v134, "firstObject");
      v150 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v150)
      {
        PLPickerGetLog();
        v151 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v199 = 0;
          _os_log_impl(&dword_1AAB61000, v151, OS_LOG_TYPE_DEFAULT, "No custom collection specified/found. Using all photos asset collection.", v199, 2u);
        }

        objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, 1000000205, v113);
        v152 = objc_claimAutoreleasedReturnValue();

        v134 = (PHFetchResult *)v152;
      }
      containerCollectionFetchResult = v17->_containerCollectionFetchResult;
      v17->_containerCollectionFetchResult = v134;

      v85 = 0x1E0C99000;
    }
    v88 = (void *)v84;
    objc_msgSend(v13, "_peopleConfiguration");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "suggestedIdentifiers");
    v90 = objc_claimAutoreleasedReturnValue();
    v91 = (void *)v90;
    if (v90)
      v92 = (void *)v90;
    else
      v92 = v57;
    v93 = v92;

    if (objc_msgSend(v93, "count"))
    {
      -[PUPickerConfiguration photoLibrary](v17, "photoLibrary");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "librarySpecificFetchOptions");
      v95 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithLocalIdentifiers:options:", v93, v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v85 + 3648), "orderedSetWithArray:", v93);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "px_fetchedObjectIDsSortedByLocalIdentifiers:", v97);
      v98 = objc_claimAutoreleasedReturnValue();

      v85 = 0x1E0C99000;
    }
    else
    {
      v98 = (uint64_t)v57;
    }
    v15 = v178;
    v170 = (void *)v98;
    objc_msgSend(*(id *)(v85 + 3648), "orderedSetWithArray:", v98);
    v99 = objc_claimAutoreleasedReturnValue();
    suggestedItemObjectIDs = v17->_suggestedItemObjectIDs;
    v17->_suggestedItemObjectIDs = (NSOrderedSet *)v99;

    v101 = v177;
    v102 = -[PUPickerGeneratedFilter possibleAssetTypes](v177, "possibleAssetTypes");
    v103 = v168;
    v104 = v13;
    v105 = v104;
    if (v102 > 127)
    {
      if (v102 >= 0x2000)
      {
        if (v102 == 0x2000 || v102 == 0x4000 || v102 == 0x8000)
          goto LABEL_129;
      }
      else if (v102 == 128 || v102 == 256 || v102 == 2048)
      {
        goto LABEL_129;
      }
    }
    else if (v102 > 15)
    {
      if (v102 == 16 || v102 == 32 || v102 == 64)
        goto LABEL_129;
    }
    else if (!v102 || v102 == 4 || v102 == 8)
    {
      goto LABEL_129;
    }
    if ((v102 & 0x3FE) != 0 && (v102 & 0x1FC00) != 0)
    {
      if ((!v181
         || (objc_msgSend(v104, "_suggestionGroup"),
             v129 = (void *)objc_claimAutoreleasedReturnValue(),
             v129,
             v129))
        && v103)
      {
        objc_msgSend(v103, "px_localizedName");
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = v177;
        v15 = v178;
        if (objc_msgSend(v182, "length"))
        {
          objc_msgSend(v103, "px_localizedName");
          v130 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          *(_QWORD *)v199 = v103;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v199, 1);
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          PXLocalizedStringForPeople();
          v130 = (void *)objc_claimAutoreleasedReturnValue();

          v101 = v177;
          v15 = v178;
        }

      }
      else
      {
        PXLocalizedString();
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = v177;
        v15 = v178;
      }
      goto LABEL_130;
    }
LABEL_129:
    PXLocalizedString();
    v130 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_130:

    objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", MEMORY[0x1E0C9AA60], v130, *MEMORY[0x1E0D7C8E8], v183);
    v154 = objc_claimAutoreleasedReturnValue();
    allPhotosVirtualCollection = v17->_allPhotosVirtualCollection;
    v17->_allPhotosVirtualCollection = (PHAssetCollection *)v154;

    v17->_supportsInteractiveBarTransition = 0;
    v17->_interactiveBarTransitionFractionExpanded = 1.0;
    v17->_interactiveBarTransitionWindowHeight = 0.0;

    v14 = v176;
  }
  if (-[PUPickerConfiguration isValidConfiguration](v17, "isValidConfiguration"))
    v156 = v17;
  else
    v156 = 0;
  v157 = v156;

  return v157;
}

- (BOOL)isValidConfiguration
{
  int64_t v3;
  BOOL v4;
  NSObject *v5;
  int64_t v6;
  NSObject *v7;
  int64_t v8;
  NSObject *v9;
  int64_t v10;
  NSObject *v11;
  int64_t v12;
  NSObject *v13;
  int64_t v14;
  NSObject *v15;
  int64_t v16;
  NSObject *v17;
  int64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  NSObject *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  unint64_t v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  NSObject *v63;
  void *v64;
  uint64_t v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  NSObject *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  NSObject *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  NSObject *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  NSObject *v88;
  NSObject *v89;
  void *v90;
  uint64_t v91;
  NSObject *v92;
  void *v93;
  NSObject *v94;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint8_t buf[16];
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v3 = -[PUPickerConfiguration preferredAssetRepresentationMode](self, "preferredAssetRepresentationMode");
  v4 = v3 >= *MEMORY[0x1E0CD2218];
  if (v3 < *MEMORY[0x1E0CD2218])
  {
    PLPickerGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "asset representation mode too small", buf, 2u);
    }

  }
  v6 = -[PUPickerConfiguration preferredAssetRepresentationMode](self, "preferredAssetRepresentationMode");
  if (v6 > *MEMORY[0x1E0CD2210])
  {
    PLPickerGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "asset representation mode too big", buf, 2u);
    }

    v4 = 0;
  }
  v8 = -[PUPickerConfiguration selection](self, "selection");
  if (v8 < *MEMORY[0x1E0CD2228])
  {
    PLPickerGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "selection too small", buf, 2u);
    }

    v4 = 0;
  }
  v10 = -[PUPickerConfiguration selection](self, "selection");
  if (v10 > *MEMORY[0x1E0CD2220])
  {
    PLPickerGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_ERROR, "selection too big", buf, 2u);
    }

    v4 = 0;
  }
  v12 = -[PUPickerConfiguration mode](self, "mode");
  if (v12 < *MEMORY[0x1E0CD2238])
  {
    PLPickerGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_ERROR, "mode too small", buf, 2u);
    }

    v4 = 0;
  }
  v14 = -[PUPickerConfiguration mode](self, "mode");
  if (v14 > *MEMORY[0x1E0CD2230])
  {
    PLPickerGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_ERROR, "mode too big", buf, 2u);
    }

    v4 = 0;
  }
  v16 = -[PUPickerConfiguration sourceType](self, "sourceType");
  if (v16 < *MEMORY[0x1E0CD22E0])
  {
    PLPickerGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_ERROR, "source type too small", buf, 2u);
    }

    v4 = 0;
  }
  v18 = -[PUPickerConfiguration sourceType](self, "sourceType");
  if (v18 > *MEMORY[0x1E0CD22D8])
  {
    PLPickerGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_ERROR, "source type too big", buf, 2u);
    }

    v4 = 0;
  }
  if (-[PUPickerConfiguration selectionLimit](self, "selectionLimit") < 0)
  {
    PLPickerGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v20, OS_LOG_TYPE_ERROR, "selection limit is negative", buf, 2u);
    }

    v4 = 0;
  }
  if (!-[PUPickerConfiguration receivedPhotoLibrary](self, "receivedPhotoLibrary")
    && -[PUPickerConfiguration onlyReturnsIdentifiers](self, "onlyReturnsIdentifiers"))
  {
    PLPickerGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v21, OS_LOG_TYPE_ERROR, "requested identifiers without specified photo library", buf, 2u);
    }

    v4 = 0;
  }
  -[PUPickerConfiguration phPickerConfiguration](self, "phPickerConfiguration");
  v22 = objc_claimAutoreleasedReturnValue();
  -[NSObject filter](v22, "filter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_puPickerFilter");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[PUPickerConfiguration phPickerConfiguration](self, "phPickerConfiguration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "filter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_puPickerFilter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isValidFilter");

    if ((v29 & 1) != 0)
      goto LABEL_49;
    PLPickerGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v22, OS_LOG_TYPE_ERROR, "invalid filter", buf, 2u);
    }
    v4 = 0;
  }
  else
  {

  }
LABEL_49:
  -[PUPickerConfiguration phPickerConfiguration](self, "phPickerConfiguration");
  v30 = objc_claimAutoreleasedReturnValue();
  -[NSObject _aspectRatio](v30, "_aspectRatio");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_aspectRatio");
  if (v32 > 0.0)
  {

LABEL_55:
    goto LABEL_56;
  }
  -[PUPickerConfiguration phPickerConfiguration](self, "phPickerConfiguration");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_aspectRatio");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "_aspectRatio");
  v36 = v35;
  v37 = *MEMORY[0x1E0CD2208];

  if (v36 != v37)
  {
    PLPickerGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v30, OS_LOG_TYPE_ERROR, "aspect ratio too small", buf, 2u);
    }
    v4 = 0;
    goto LABEL_55;
  }
LABEL_56:
  if (!-[PUPickerConfiguration receivedPhotoLibrary](self, "receivedPhotoLibrary"))
  {
    -[PUPickerConfiguration preselectedItemIdentifiers](self, "preselectedItemIdentifiers");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "count");

    if (v39)
    {
      PLPickerGetLog();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v40, OS_LOG_TYPE_ERROR, "provided preselection without specified photo library", buf, 2u);
      }

      v4 = 0;
    }
  }
  if (!-[PUPickerConfiguration receivedPhotoLibrary](self, "receivedPhotoLibrary"))
  {
    -[PUPickerConfiguration preselectedItemObjectIDs](self, "preselectedItemObjectIDs");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "count");

    if (v42)
    {
      PLPickerGetLog();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v43, OS_LOG_TYPE_ERROR, "provided preselection without specified photo library", buf, 2u);
      }

      v4 = 0;
    }
  }
  if (!-[PUPickerConfiguration isLimitedLibraryPicker](self, "isLimitedLibraryPicker"))
  {
    -[PUPickerConfiguration preselectedItemObjectIDs](self, "preselectedItemObjectIDs");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "count");
    -[PUPickerConfiguration preselectedItemIdentifiers](self, "preselectedItemIdentifiers");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "count");

    if (v45 > v47)
    {
      PLPickerGetLog();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v48, OS_LOG_TYPE_ERROR, "found more preselection than expected", buf, 2u);
      }

      v4 = 0;
    }
  }
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  -[PUPickerConfiguration peopleConfigurations](self, "peopleConfigurations");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v97, v102, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v98;
    v96 = *MEMORY[0x1E0D7C6A8];
    do
    {
      v53 = 0;
      do
      {
        if (*(_QWORD *)v98 != v52)
          objc_enumerationMutation(v49);
        v54 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v53);
        if (!-[PUPickerConfiguration receivedPhotoLibrary](self, "receivedPhotoLibrary"))
        {
          objc_msgSend(v54, "_identifiers");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "count");

          if (v56)
          {
            PLPickerGetLog();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AAB61000, v57, OS_LOG_TYPE_ERROR, "provided people without specified photo library", buf, 2u);
            }

            v4 = 0;
          }
        }
        if (!-[PUPickerConfiguration receivedPhotoLibrary](self, "receivedPhotoLibrary"))
        {
          objc_msgSend(v54, "preselectedIdentifiers");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v58, "count");

          if (v59)
          {
            PLPickerGetLog();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AAB61000, v60, OS_LOG_TYPE_ERROR, "provided preselected people without specified photo library", buf, 2u);
            }

            v4 = 0;
          }
        }
        if (!-[PUPickerConfiguration receivedPhotoLibrary](self, "receivedPhotoLibrary"))
        {
          objc_msgSend(v54, "suggestedIdentifiers");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v61, "count");

          if (v62)
          {
            PLPickerGetLog();
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AAB61000, v63, OS_LOG_TYPE_ERROR, "provided suggested people without specified photo library", buf, 2u);
            }

            v4 = 0;
          }
        }
        if (!-[PUPickerConfiguration receivedPhotoLibrary](self, "receivedPhotoLibrary"))
        {
          objc_msgSend(v54, "disabledIdentifiers");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v64, "count");

          if (v65)
          {
            PLPickerGetLog();
            v66 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AAB61000, v66, OS_LOG_TYPE_ERROR, "provided disabled people without specified photo library", buf, 2u);
            }

            v4 = 0;
          }
        }
        -[PUPickerConfiguration pickerClientIdentification](self, "pickerClientIdentification");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "trustedCallerBundleID");
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v68, "isEqualToString:", CFSTR("com.apple.Preferences")) & 1) == 0
          && (objc_msgSend(v68, "isEqualToString:", CFSTR("com.apple.Photos")) & 1) == 0
          && (objc_msgSend(v68, "isEqualToString:", v96) & 1) == 0
          && (objc_msgSend(v68, "isEqualToString:", CFSTR("com.apple.mobileslideshow")) & 1) == 0
          && (objc_msgSend(v68, "isEqualToString:", CFSTR("com.apple.Bridge")) & 1) == 0)
        {
          objc_msgSend(v54, "suggestedIdentifiers");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = objc_msgSend(v69, "count");

          if (v70)
          {
            PLPickerGetLog();
            v71 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AAB61000, v71, OS_LOG_TYPE_ERROR, "untrusted caller provided people suggestion", buf, 2u);
            }

            v4 = 0;
          }
        }

        ++v53;
      }
      while (v51 != v53);
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v97, v102, 16);
    }
    while (v51);
  }

  -[PUPickerConfiguration albumsConfiguration](self, "albumsConfiguration");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    if (!-[PUPickerConfiguration receivedPhotoLibrary](self, "receivedPhotoLibrary"))
    {
      -[PUPickerConfiguration albumsConfiguration](self, "albumsConfiguration");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "_identifiers");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v74, "count");

      if (v75)
      {
        PLPickerGetLog();
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AAB61000, v76, OS_LOG_TYPE_ERROR, "provided albums without specified photo library", buf, 2u);
        }

        v4 = 0;
      }
    }
    if (!-[PUPickerConfiguration receivedPhotoLibrary](self, "receivedPhotoLibrary"))
    {
      -[PUPickerConfiguration albumsConfiguration](self, "albumsConfiguration");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "preselectedIdentifiers");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend(v78, "count");

      if (v79)
      {
        PLPickerGetLog();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AAB61000, v80, OS_LOG_TYPE_ERROR, "provided preselected albums without specified photo library", buf, 2u);
        }

        v4 = 0;
      }
    }
    if (!-[PUPickerConfiguration receivedPhotoLibrary](self, "receivedPhotoLibrary"))
    {
      -[PUPickerConfiguration albumsConfiguration](self, "albumsConfiguration");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "suggestedIdentifiers");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend(v82, "count");

      if (v83)
      {
        PLPickerGetLog();
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AAB61000, v84, OS_LOG_TYPE_ERROR, "provided suggested albums without specified photo library", buf, 2u);
        }

        v4 = 0;
      }
    }
    if (!-[PUPickerConfiguration receivedPhotoLibrary](self, "receivedPhotoLibrary"))
    {
      -[PUPickerConfiguration albumsConfiguration](self, "albumsConfiguration");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "disabledIdentifiers");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(v86, "count");

      if (v87)
      {
        PLPickerGetLog();
        v88 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AAB61000, v88, OS_LOG_TYPE_ERROR, "provided disabled albums without specified photo library", buf, 2u);
        }

        v4 = 0;
      }
    }
  }
  if (-[PUPickerConfiguration isLimitedLibraryPicker](self, "isLimitedLibraryPicker"))
  {
    if (!-[PUPickerConfiguration receivedPhotoLibrary](self, "receivedPhotoLibrary"))
    {
      PLPickerGetLog();
      v89 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v89, OS_LOG_TYPE_ERROR, "limited library picker without specified photo library", buf, 2u);
      }

      v4 = 0;
    }
    -[PUPickerConfiguration limitedLibraryClientIdentifier](self, "limitedLibraryClientIdentifier");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v90, "length");

    if (!v91)
    {
      PLPickerGetLog();
      v92 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v92, OS_LOG_TYPE_ERROR, "limited library picker without client identifier", buf, 2u);
      }

      v4 = 0;
    }
    -[PUPickerConfiguration LimitedLibraryError](self, "LimitedLibraryError");
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    if (v93)
    {
      PLPickerGetLog();
      v94 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v94, OS_LOG_TYPE_ERROR, "limited library picker with client error", buf, 2u);
      }

      return 0;
    }
  }
  return v4;
}

- (void)setEdgesWithoutContentMargins:(unint64_t)a3
{
  if (-[PHPickerConfiguration edgesWithoutContentMargins](self->_phPickerConfiguration, "edgesWithoutContentMargins") != a3)
  {
    -[PHPickerConfiguration setEdgesWithoutContentMargins:](self->_phPickerConfiguration, "setEdgesWithoutContentMargins:", a3);
    -[PUPickerConfiguration signalChange:](self, "signalChange:", 1);
  }
}

- (void)setSelectionLimit:(int64_t)a3
{
  if (-[PHPickerConfiguration selectionLimit](self->_phPickerConfiguration, "selectionLimit") != a3)
  {
    -[PHPickerConfiguration setSelectionLimit:](self->_phPickerConfiguration, "setSelectionLimit:", a3);
    -[PUPickerConfiguration signalChange:](self, "signalChange:", 2);
  }
}

- (void)setDidDismissOnboardingOverlayView:(BOOL)a3
{
  if (self->_didDismissOnboardingOverlayView != a3)
  {
    self->_didDismissOnboardingOverlayView = a3;
    -[PUPickerConfiguration signalChange:](self, "signalChange:", 4);
  }
}

- (void)setDidDismissOnboardingHeaderView:(BOOL)a3
{
  if (self->_didDismissOnboardingHeaderView != a3)
  {
    self->_didDismissOnboardingHeaderView = a3;
    -[PUPickerConfiguration signalChange:](self, "signalChange:", 8);
  }
}

- (void)setDidShowPhotosIndicator:(BOOL)a3
{
  if (self->_didShowPhotosIndicator != a3)
  {
    self->_didShowPhotosIndicator = a3;
    -[PUPickerConfiguration signalChange:](self, "signalChange:", 16);
  }
}

- (void)setSupportsInteractiveBarTransition:(BOOL)a3
{
  if (self->_supportsInteractiveBarTransition != a3)
  {
    self->_supportsInteractiveBarTransition = a3;
    -[PUPickerConfiguration signalChange:](self, "signalChange:", 32);
  }
}

- (void)setInteractiveBarTransitionFractionExpanded:(double)a3
{
  if (self->_interactiveBarTransitionFractionExpanded != a3)
  {
    self->_interactiveBarTransitionFractionExpanded = a3;
    -[PUPickerConfiguration signalChange:](self, "signalChange:", 64);
  }
}

- (void)setInteractiveBarTransitionWindowHeight:(double)a3
{
  self->_interactiveBarTransitionWindowHeight = a3;
  -[PUPickerConfiguration signalChange:](self, "signalChange:", 128);
}

- (int64_t)cancellationBehaviorWithTraitCollection:(id)a3
{
  uint64_t v4;
  char v5;
  int64_t result;

  v4 = objc_msgSend(a3, "_presentationSemanticContext");
  v5 = -[PUPickerConfiguration disabledCapabilities](self, "disabledCapabilities");
  result = 0;
  if (v4 != 3 && (v5 & 8) == 0)
  {
    if (-[PUPickerConfiguration selection](self, "selection") == 2)
    {
      return 1;
    }
    else if (-[PUPickerConfiguration selection](self, "selection") == 3)
    {
      return 1;
    }
    else
    {
      return 2;
    }
  }
  return result;
}

- (int64_t)confirmationBehavior
{
  if (-[PUPickerConfiguration isSingleSelection](self, "isSingleSelection"))
    return 4;
  if (-[PUPickerConfiguration selection](self, "selection") == 2
    || -[PUPickerConfiguration selection](self, "selection") == 3)
  {
    if ((-[PUPickerConfiguration disabledCapabilities](self, "disabledCapabilities") & 8) != 0)
      return 2;
    else
      return 3;
  }
  else if (-[PUPickerConfiguration hasPreselection](self, "hasPreselection"))
  {
    return 1;
  }
  else
  {
    return -[PUPickerConfiguration allowsEmptySelection](self, "allowsEmptySelection");
  }
}

- (unint64_t)edgesWithoutContentMargins
{
  void *v2;
  unint64_t v3;

  -[PUPickerConfiguration phPickerConfiguration](self, "phPickerConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "edgesWithoutContentMargins");

  return v3;
}

- (unint64_t)disabledCapabilities
{
  void *v2;
  unint64_t v3;

  -[PUPickerConfiguration phPickerConfiguration](self, "phPickerConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disabledCapabilities");

  return v3;
}

- (int64_t)sourceType
{
  void *v2;
  int64_t v3;

  -[PUPickerConfiguration phPickerConfiguration](self, "phPickerConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_sourceType");

  return v3;
}

- (NSString)fetchType
{
  int64_t v2;
  id *v3;

  v2 = -[PUPickerConfiguration sourceType](self, "sourceType");
  if ((unint64_t)(v2 - 1) > 4)
    v3 = (id *)MEMORY[0x1E0CD1B90];
  else
    v3 = (id *)qword_1E58A24F8[v2 - 1];
  return (NSString *)*v3;
}

- (int64_t)selectionLimit
{
  void *v2;
  int64_t v3;

  -[PUPickerConfiguration phPickerConfiguration](self, "phPickerConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectionLimit");

  return v3;
}

- (BOOL)hasPreselection
{
  void *v3;
  BOOL v4;
  void *v5;

  -[PUPickerConfiguration preselectedItemIdentifiers](self, "preselectedItemIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[PUPickerConfiguration preselectedItemObjectIDs](self, "preselectedItemObjectIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

- (BOOL)isSingleSelection
{
  return -[PUPickerConfiguration selectionLimit](self, "selectionLimit") == 1;
}

- (BOOL)isOrderedSelection
{
  int64_t v3;

  v3 = -[PUPickerConfiguration selection](self, "selection");
  if (v3 != 1)
    LOBYTE(v3) = -[PUPickerConfiguration selection](self, "selection") == 3;
  return v3;
}

- (BOOL)shouldPassthroughSelection
{
  return (unint64_t)(-[PUPickerConfiguration confirmationBehavior](self, "confirmationBehavior") - 2) < 3;
}

- (BOOL)allowsUnlimitedMultipleSelection
{
  return -[PUPickerConfiguration selectionLimit](self, "selectionLimit") == 0;
}

- (BOOL)allowsEmptySelection
{
  if (-[PUPickerConfiguration usesMemoriesLayout](self, "usesMemoriesLayout"))
    return 0;
  if (-[PUPickerConfiguration isLimitedLibraryPicker](self, "isLimitedLibraryPicker"))
    return 1;
  return -[PUPickerConfiguration hasPreselection](self, "hasPreselection");
}

- (BOOL)allowsAssetData
{
  return !-[PUPickerConfiguration onlyReturnsIdentifiers](self, "onlyReturnsIdentifiers");
}

- (BOOL)allowsContextMenuInteraction
{
  int v3;

  if (!-[PUPickerConfiguration supportsInteractiveBarTransition](self, "supportsInteractiveBarTransition")
    || (-[PUPickerConfiguration interactiveBarTransitionFractionExpanded](self, "interactiveBarTransitionFractionExpanded"), (v3 = PXFloatApproximatelyEqualToFloat()) != 0))
  {
    LOBYTE(v3) = (~-[PUPickerConfiguration edgesWithoutContentMargins](self, "edgesWithoutContentMargins") & 0xF) != 0;
  }
  return v3;
}

- (BOOL)allowsSwipeToSelect
{
  if (-[PUPickerConfiguration mode](self, "mode") == 1
    || -[PUPickerConfiguration sourceType](self, "sourceType") == 1
    || -[PUPickerConfiguration sourceType](self, "sourceType") == 3
    || -[PUPickerConfiguration sourceType](self, "sourceType") == 4
    || -[PUPickerConfiguration isOrderedSelection](self, "isOrderedSelection"))
  {
    return 0;
  }
  else
  {
    return !-[PUPickerConfiguration shouldPassthroughSelection](self, "shouldPassthroughSelection");
  }
}

- (BOOL)allowsNavigationBar
{
  return (-[PUPickerConfiguration edgesWithoutContentMargins](self, "edgesWithoutContentMargins") & 1) == 0;
}

- (BOOL)allowsToolbar
{
  return (-[PUPickerConfiguration edgesWithoutContentMargins](self, "edgesWithoutContentMargins") & 4) == 0;
}

- (BOOL)allowsInteractivePopGesture
{
  void *v2;
  char v3;

  -[PUPickerConfiguration phPickerConfiguration](self, "phPickerConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_usesOpenPanelLayout") ^ 1;

  return v3;
}

- (BOOL)allowsNavigationPushPopAnimation
{
  void *v2;
  char v3;

  -[PUPickerConfiguration phPickerConfiguration](self, "phPickerConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_usesOpenPanelLayout") ^ 1;

  return v3;
}

- (BOOL)allowsCollectionNavigation
{
  void *v4;
  char v5;

  if ((-[PUPickerConfiguration disabledCapabilities](self, "disabledCapabilities") & 4) != 0
    || -[PUPickerConfiguration hasClearBackgroundColor](self, "hasClearBackgroundColor")
    || -[PUPickerConfiguration sourceType](self, "sourceType")
    || -[PUPickerConfiguration mode](self, "mode") == 1)
  {
    return 0;
  }
  -[PUPickerConfiguration generatedFilter](self, "generatedFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowsAlbums");

  return v5;
}

- (BOOL)allowsSidebar
{
  void *v3;
  void *v4;
  uint64_t v5;

  if ((-[PUPickerConfiguration edgesWithoutContentMargins](self, "edgesWithoutContentMargins") & 2) != 0)
    return 0;
  -[PUPickerConfiguration albumsConfiguration](self, "albumsConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

    return 0;
  }
  -[PUPickerConfiguration peopleConfigurations](self, "peopleConfigurations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    return 0;
  return -[PUPickerConfiguration allowsCollectionNavigation](self, "allowsCollectionNavigation");
}

- (BOOL)allowsSearchBar
{
  return (-[PUPickerConfiguration disabledCapabilities](self, "disabledCapabilities") & 1) == 0
      && (-[PUPickerConfiguration edgesWithoutContentMargins](self, "edgesWithoutContentMargins") & 1) == 0
      && !-[PUPickerConfiguration sourceType](self, "sourceType")
      && -[PUPickerConfiguration mode](self, "mode") != 1;
}

- (BOOL)allowsSearchSuggestions
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[PUPickerConfiguration allowsSearchBar](self, "allowsSearchBar");
  if (v3)
  {
    -[PUPickerConfiguration generatedFilter](self, "generatedFilter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "allowsSearchSuggestions");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)allowsSelectionStaging
{
  void *v2;
  char v3;

  -[PUPickerConfiguration phPickerConfiguration](self, "phPickerConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_usesOpenPanelLayout") ^ 1;

  return v3;
}

- (BOOL)allowsOpeningStagingArea
{
  if ((-[PUPickerConfiguration disabledCapabilities](self, "disabledCapabilities") & 2) != 0
    || -[PUPickerConfiguration sourceType](self, "sourceType")
    || -[PUPickerConfiguration mode](self, "mode") == 1)
  {
    return 0;
  }
  else
  {
    return !-[PUPickerConfiguration isSingleSelection](self, "isSingleSelection");
  }
}

- (BOOL)excludesSharedAlbums
{
  void *v2;
  BOOL v3;

  -[PUPickerConfiguration phPickerConfiguration](self, "phPickerConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_disabledPrivateCapabilities") & 1;

  return v3;
}

- (BOOL)excludesHiddenAlbum
{
  void *v2;
  unint64_t v3;

  -[PUPickerConfiguration phPickerConfiguration](self, "phPickerConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "_disabledPrivateCapabilities") >> 1) & 1;

  return v3;
}

- (BOOL)excludesOptionsMenu
{
  void *v3;
  unint64_t v4;

  if (-[PUPickerConfiguration sourceType](self, "sourceType")
    || !-[PUPickerConfiguration pickerClientShouldRespectOptionsMenu](self, "pickerClientShouldRespectOptionsMenu"))
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    -[PUPickerConfiguration phPickerConfiguration](self, "phPickerConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = ((unint64_t)objc_msgSend(v3, "_disabledPrivateCapabilities") >> 2) & 1;

  }
  return v4;
}

- (BOOL)excludesSortAndFilterMenuWithPhotosTabSelected:(BOOL)a3
{
  int v5;
  int64_t v6;

  v5 = _os_feature_enabled_impl();
  if (v5)
  {
    v6 = -[PUPickerConfiguration sourceType](self, "sourceType");
    if (v6 == 5 || v6 == 2)
    {
      LOBYTE(v5) = 1;
    }
    else if (v6)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      LOBYTE(v5) = !a3;
    }
  }
  return v5;
}

- (BOOL)excludesLocationMetadataSubtitle
{
  if (-[PUPickerConfiguration isLimitedLibraryPicker](self, "isLimitedLibraryPicker")
    || -[PUPickerConfiguration sourceType](self, "sourceType"))
  {
    return 1;
  }
  else
  {
    return !-[PUPickerConfiguration pickerClientShouldRespectOptionsMenu](self, "pickerClientShouldRespectOptionsMenu");
  }
}

- (BOOL)excludesNewAlbumCreation
{
  void *v2;
  unint64_t v3;

  -[PUPickerConfiguration phPickerConfiguration](self, "phPickerConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "_disabledPrivateCapabilities") >> 5) & 1;

  return v3;
}

- (BOOL)canIncludeLocationByDefault
{
  NSObject *v2;
  uint8_t v4[16];

  if (!_os_feature_enabled_impl() || !PLIsLockdownMode())
    return 1;
  PLPickerGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEFAULT, "Lockdown mode is enabled, excluding location metadata by default.", v4, 2u);
  }

  return 0;
}

- (BOOL)canIncludeCaptionByDefault
{
  NSObject *v2;
  uint8_t v4[16];

  if (!_os_feature_enabled_impl() || !PLIsLockdownMode())
    return 1;
  PLPickerGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEFAULT, "Lockdown mode is enabled, excluding caption metadata by default.", v4, 2u);
  }

  return 0;
}

- (BOOL)hasClearBackgroundColor
{
  void *v2;
  unint64_t v3;

  -[PUPickerConfiguration phPickerConfiguration](self, "phPickerConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "_disabledPrivateCapabilities") >> 4) & 1;

  return v3;
}

- (BOOL)allowsConfidentialWarning
{
  void *v2;
  BOOL v3;

  -[PUPickerConfiguration phPickerConfiguration](self, "phPickerConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v2, "_disabledPrivateCapabilities") & 0x80) == 0;

  return v3;
}

- (BOOL)shouldShowCommunicationSafetyIntervention
{
  void *v2;
  char v3;

  -[PUPickerConfiguration phPickerConfiguration](self, "phPickerConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disabledCapabilities");

  if ((v3 & 0x10) != 0)
    return 0;
  else
    return objc_msgSend(MEMORY[0x1E0D7B988], "userSafetyInterventionCheckRequired");
}

- (BOOL)shouldScrollToSelectedItemInitially
{
  return !-[PUPickerConfiguration isLimitedLibraryPicker](self, "isLimitedLibraryPicker");
}

- (BOOL)shouldShowPhotosIndicator
{
  if (-[PUPickerConfiguration didShowPhotosIndicator](self, "didShowPhotosIndicator"))
    return 0;
  else
    return !-[PUPickerConfiguration pickerClientHasFullLibraryAccess](self, "pickerClientHasFullLibraryAccess");
}

- (BOOL)shouldShowOnboardingOverlayView
{
  void *v3;
  char v4;
  _BOOL4 v5;

  if (-[PUPickerConfiguration pickerClientHasFullLibraryAccess](self, "pickerClientHasFullLibraryAccess")
    || (PLIsPhotosAppAnyPlatform() & 1) != 0
    || (-[PUPickerConfiguration phPickerConfiguration](self, "phPickerConfiguration"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "_onboardingOverlayDismissedBefore"),
        v3,
        (v4 & 1) != 0))
  {
    LOBYTE(v5) = 0;
  }
  else if ((-[PUPickerConfiguration edgesWithoutContentMargins](self, "edgesWithoutContentMargins") & 1) != 0
         || -[PUPickerConfiguration mode](self, "mode") == 1
         || (v5 = -[PUPickerConfiguration supportsInteractiveBarTransition](self, "supportsInteractiveBarTransition")))
  {
    LOBYTE(v5) = !-[PUPickerConfiguration didDismissOnboardingOverlayView](self, "didDismissOnboardingOverlayView");
  }
  return v5;
}

- (BOOL)shouldShowOnboardingHeaderView
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  if (-[PUPickerConfiguration isLimitedLibraryPicker](self, "isLimitedLibraryPicker"))
  {
    -[PUPickerConfiguration phPickerConfiguration](self, "phPickerConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_limitedLibraryHeaderDismissedBefore");

    if ((v4 & 1) != 0)
      return 0;
  }
  if (!-[PUPickerConfiguration isLimitedLibraryPicker](self, "isLimitedLibraryPicker"))
  {
    -[PUPickerConfiguration phPickerConfiguration](self, "phPickerConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_onboardingHeaderDismissedBefore");

    if ((v6 & 1) != 0)
      return 0;
  }
  if (-[PUPickerConfiguration pickerClientHasFullLibraryAccess](self, "pickerClientHasFullLibraryAccess")
    || (-[PUPickerConfiguration edgesWithoutContentMargins](self, "edgesWithoutContentMargins") & 1) != 0
    || -[PUPickerConfiguration mode](self, "mode") == 1
    || -[PUPickerConfiguration supportsInteractiveBarTransition](self, "supportsInteractiveBarTransition"))
  {
    return 0;
  }
  else
  {
    return !-[PUPickerConfiguration didDismissOnboardingHeaderView](self, "didDismissOnboardingHeaderView");
  }
}

- (BOOL)pickerClientHasLibraryAccessWithoutPrivateEntitlements
{
  -[PUPickerConfiguration pickerClientAccessAllowedResult](self, "pickerClientAccessAllowedResult");
  return PLPhotosAccessAllowed();
}

- (BOOL)pickerClientHasLibraryAccess
{
  -[PUPickerConfiguration pickerClientAccessAllowedResult](self, "pickerClientAccessAllowedResult");
  return (PLPhotosAccessAllowed() & 1) != 0
      || -[PUPickerConfiguration pickerClientIsEntitledForOrHasPrivateLibraryAccess](self, "pickerClientIsEntitledForOrHasPrivateLibraryAccess");
}

- (BOOL)pickerClientHasFullLibraryAccess
{
  -[PUPickerConfiguration pickerClientAccessAllowedResult](self, "pickerClientAccessAllowedResult");
  return (PLPhotosFullAccessAllowed() & 1) != 0
      || -[PUPickerConfiguration pickerClientIsEntitledForOrHasPrivateLibraryAccess](self, "pickerClientIsEntitledForOrHasPrivateLibraryAccess");
}

- (BOOL)pickerClientShouldRespectOptionsMenu
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  -[PUPickerConfiguration pickerClientIdentification](self, "pickerClientIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trustedCallerBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (pickerClientShouldRespectOptionsMenu_onceToken != -1)
    dispatch_once(&pickerClientShouldRespectOptionsMenu_onceToken, &__block_literal_global_46655);
  if ((PLIsPhotosMessagesApp() & 1) != 0
    || (objc_msgSend((id)pickerClientShouldRespectOptionsMenu_supportedBundleIDs, "containsObject:", v4) & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = !-[PUPickerConfiguration pickerClientHasFullLibraryAccess](self, "pickerClientHasFullLibraryAccess");
  }

  return v5;
}

- (BOOL)shouldDisableInlinePlayback
{
  void *v2;
  unint64_t v3;

  -[PUPickerConfiguration phPickerConfiguration](self, "phPickerConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "_disabledPrivateCapabilities") >> 3) & 1;

  return v3;
}

- (BOOL)isProcessingSuggestions
{
  unint64_t v3;
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
  unint64_t v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  if (-[PUPickerConfiguration showsWallpaperSuggestions](self, "showsWallpaperSuggestions"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    -[PUPickerConfiguration generatedFilter](self, "generatedFilter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v3) = objc_msgSend(v4, "containsStickersFilter");

    if ((_DWORD)v3)
    {
      -[PUPickerConfiguration photoLibrary](self, "photoLibrary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "librarySpecificFetchOptions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "setIncludeAssetSourceTypes:", 5);
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("kind"), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setInternalPredicate:", v7);

      objc_msgSend(v6, "setIncludeGuestAssets:", 1);
      objc_msgSend(v6, "setShouldPrefetchCount:", 1);
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v8, "count");

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= 0"), CFSTR("stickerConfidenceScore"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(v6, "internalPredicate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v11;
      v17[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "andPredicateWithSubpredicates:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setInternalPredicate:", v13);

      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      LOBYTE(v3) = v3 >= 0xB && (double)v15 / (double)v3 < 0.9;
    }
  }
  return v3;
}

- (NSArray)customSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  if (!-[PUPickerConfiguration usesMemoriesLayout](self, "usesMemoriesLayout"))
    return (NSArray *)0;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("sortToken"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (int64_t)clientEncodingPolicy
{
  int64_t result;

  result = -[PUPickerConfiguration preferredAssetRepresentationMode](self, "preferredAssetRepresentationMode");
  if ((unint64_t)result >= 3)
    return 0;
  return result;
}

- (BOOL)showsWallpaperSuggestions
{
  void *v2;
  char v3;

  -[PUPickerConfiguration suggestionGroup](self, "suggestionGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isForWallpaper");

  return v3;
}

- (BOOL)isPeoplePicker
{
  return -[PUPickerConfiguration sourceType](self, "sourceType") == 1;
}

- (BOOL)isPetsPicker
{
  return -[PUPickerConfiguration sourceType](self, "sourceType") == 3;
}

- (BOOL)isPeopleAndPetsPicker
{
  return -[PUPickerConfiguration sourceType](self, "sourceType") == 4;
}

- (BOOL)isPeopleOrPetsPicker
{
  int64_t v3;

  v3 = -[PUPickerConfiguration sourceType](self, "sourceType");
  if (v3 != 1)
    LOBYTE(v3) = -[PUPickerConfiguration sourceType](self, "sourceType") == 4
              || -[PUPickerConfiguration sourceType](self, "sourceType") == 3;
  return v3;
}

- (BOOL)isFollowupSingleSelectionPeoplePicker
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[PUPickerConfiguration isPeopleOrPetsPicker](self, "isPeopleOrPetsPicker"))
    return 0;
  -[PUPickerConfiguration phPickerConfiguration](self, "phPickerConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_followupPeopleConfigurations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)isAddToAlbumPicker
{
  int v3;
  int64_t v4;

  v3 = _os_feature_enabled_impl();
  if (v3)
  {
    v4 = -[PUPickerConfiguration sourceType](self, "sourceType");
    if (-[PUPickerConfiguration excludesNewAlbumCreation](self, "excludesNewAlbumCreation"))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      LOBYTE(v3) = -[PUPickerConfiguration isSingleSelection](self, "isSingleSelection");
      if (v4 != 2)
        LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)isAlbumPicker
{
  int v3;

  v3 = _os_feature_enabled_impl();
  if (v3)
    LOBYTE(v3) = -[PUPickerConfiguration sourceType](self, "sourceType") == 2;
  return v3;
}

- (BOOL)isCollectionsPicker
{
  int v3;

  v3 = _os_feature_enabled_impl();
  if (v3)
    LOBYTE(v3) = -[PUPickerConfiguration sourceType](self, "sourceType") == 5;
  return v3;
}

- (PHPickerConfiguration)phPickerConfiguration
{
  return self->_phPickerConfiguration;
}

- (int64_t)preferredAssetRepresentationMode
{
  return self->_preferredAssetRepresentationMode;
}

- (int64_t)selection
{
  return self->_selection;
}

- (int64_t)mode
{
  return self->_mode;
}

- (_PHPickerSuggestionGroup)suggestionGroup
{
  return self->_suggestionGroup;
}

- (_PHPickerCollectionConfiguration)albumsConfiguration
{
  return self->_albumsConfiguration;
}

- (NSArray)peopleConfigurations
{
  return self->_peopleConfigurations;
}

- (PUPickerGeneratedFilter)generatedFilter
{
  return self->_generatedFilter;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PHFetchResult)containerCollectionFetchResult
{
  return self->_containerCollectionFetchResult;
}

- (BOOL)receivedPhotoLibrary
{
  return self->_receivedPhotoLibrary;
}

- (BOOL)onlyReturnsIdentifiers
{
  return self->_onlyReturnsIdentifiers;
}

- (PLClientIdentification)pickerClientIdentification
{
  return self->_pickerClientIdentification;
}

- (NSOrderedSet)preselectedItemIdentifiers
{
  return self->_preselectedItemIdentifiers;
}

- (NSOrderedSet)preselectedItemObjectIDs
{
  return self->_preselectedItemObjectIDs;
}

- (NSOrderedSet)suggestedItemObjectIDs
{
  return self->_suggestedItemObjectIDs;
}

- (BOOL)allowsDownscaling
{
  return self->_allowsDownscaling;
}

- (BOOL)allowsEncodingPolicyModification
{
  return self->_allowsEncodingPolicyModification;
}

- (BOOL)allowsDownload
{
  return self->_allowsDownload;
}

- (BOOL)didDismissOnboardingOverlayView
{
  return self->_didDismissOnboardingOverlayView;
}

- (BOOL)didDismissOnboardingHeaderView
{
  return self->_didDismissOnboardingHeaderView;
}

- (BOOL)didShowPhotosIndicator
{
  return self->_didShowPhotosIndicator;
}

- (BOOL)pickerClientIsEntitledForOrHasPrivateLibraryAccess
{
  return self->_pickerClientIsEntitledForOrHasPrivateLibraryAccess;
}

- (NSString)pickerClientDisplayName
{
  return self->_pickerClientDisplayName;
}

- (PHAssetCollection)allPhotosVirtualCollection
{
  return self->_allPhotosVirtualCollection;
}

- (NSString)pickerClientBundleIdentifier
{
  return self->_pickerClientBundleIdentifier;
}

- (BOOL)supportsInteractiveBarTransition
{
  return self->_supportsInteractiveBarTransition;
}

- (double)interactiveBarTransitionFractionExpanded
{
  return self->_interactiveBarTransitionFractionExpanded;
}

- (double)interactiveBarTransitionWindowHeight
{
  return self->_interactiveBarTransitionWindowHeight;
}

- (BOOL)isLimitedLibraryPicker
{
  return self->_isLimitedLibraryPicker;
}

- (NSString)limitedLibraryClientIdentifier
{
  return self->_limitedLibraryClientIdentifier;
}

- (NSError)LimitedLibraryError
{
  return self->_LimitedLibraryError;
}

- (NSOrderedSet)allPersonIdentifiers
{
  return self->_allPersonIdentifiers;
}

- (int64_t)pickerClientAccessAllowedResult
{
  return self->_pickerClientAccessAllowedResult;
}

- (BOOL)usesMemoriesLayout
{
  return self->_usesMemoriesLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allPersonIdentifiers, 0);
  objc_storeStrong((id *)&self->_LimitedLibraryError, 0);
  objc_storeStrong((id *)&self->_limitedLibraryClientIdentifier, 0);
  objc_storeStrong((id *)&self->_pickerClientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_allPhotosVirtualCollection, 0);
  objc_storeStrong((id *)&self->_pickerClientDisplayName, 0);
  objc_storeStrong((id *)&self->_suggestedItemObjectIDs, 0);
  objc_storeStrong((id *)&self->_preselectedItemObjectIDs, 0);
  objc_storeStrong((id *)&self->_preselectedItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_pickerClientIdentification, 0);
  objc_storeStrong((id *)&self->_containerCollectionFetchResult, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_generatedFilter, 0);
  objc_storeStrong((id *)&self->_peopleConfigurations, 0);
  objc_storeStrong((id *)&self->_albumsConfiguration, 0);
  objc_storeStrong((id *)&self->_suggestionGroup, 0);
  objc_storeStrong((id *)&self->_phPickerConfiguration, 0);
}

void __61__PUPickerConfiguration_pickerClientShouldRespectOptionsMenu__block_invoke()
{
  void *v0;

  v0 = (void *)pickerClientShouldRespectOptionsMenu_supportedBundleIDs;
  pickerClientShouldRespectOptionsMenu_supportedBundleIDs = (uint64_t)&unk_1E59BA0D8;

}

+ (id)limitedLibraryApplicationTrustedIdentifierWithConnection:(id)a3 purposedIdentifier:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  id v20;

  v9 = a3;
  v10 = a4;
  if (a5)
  {
    if (v9)
      goto LABEL_3;
LABEL_12:
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = CFSTR("Missing XPC connection.");
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUPickerConfiguration.m"), 432, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outError != nil"));

  if (!v9)
    goto LABEL_12;
LABEL_3:
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(v9, "valueForEntitlement:", *MEMORY[0x1E0D73448]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if (v12)
    {
      v13 = v10;
      v14 = 0;
      goto LABEL_14;
    }
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = CFSTR("Missing entitlement.");
LABEL_13:
    objc_msgSend(v17, "px_genericErrorWithDebugDescription:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    goto LABEL_14;
  }
  PLClientApplicationIdentifierFromXPCConnection();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v15;
  if (v15)
  {
    v16 = v15;
    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Missing trusted bundle identifier."));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_14:
  v20 = objc_retainAutorelease(v14);
  *a5 = v20;

  return v13;
}

+ (id)limitedLibraryApplicationPreselectedObjectIDsOrCreateEmptySelectionWithTrustedIdentifier:(id)a3 auditToken:(id *)a4 photoLibrary:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v24;
  _QWORD v26[4];
  id v27;
  void *v28;
  uint8_t buf[16];
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0D71840];
  objc_msgSend(v8, "managedObjectContextForCurrentQueueQoS");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchLimitedLibraryFetchFilterWithApplicationIdentifier:inManagedObjectContext:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  PLPickerGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!v11)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_DEFAULT, "Creating initial empty fetch filter for client: %@", buf, 0xCu);
    }

    objc_msgSend(v8, "assetsdClient");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "libraryInternalClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __138__PUPickerConfiguration_limitedLibraryApplicationPreselectedObjectIDsOrCreateEmptySelectionWithTrustedIdentifier_auditToken_photoLibrary___block_invoke;
    v26[3] = &unk_1E58AB060;
    v27 = v7;
    v24 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a4->var0;
    v30 = v24;
    v22 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend(v15, "setFetchFilterWithAssets:forApplication:withAuditToken:completionHandler:", MEMORY[0x1E0C9AA60], v27, buf, v26);
    v16 = v27;
    goto LABEL_13;
  }
  if (v13)
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v7;
    _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_DEFAULT, "Fetching existing selection for client: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D71880], "entityName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateForEntityName:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v8, "librarySpecificFetchOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSortDescriptors:", v18);

    objc_msgSend(v16, "setInternalPredicate:", v15);
    objc_msgSend(v16, "setIncludeAssetSourceTypes:", 5);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fetchedObjectIDs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21)
    {
      objc_msgSend(v19, "fetchedObjectIDs");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = (void *)MEMORY[0x1E0C9AA60];
    }

LABEL_13:
    goto LABEL_14;
  }
  v22 = (void *)MEMORY[0x1E0C9AA60];
LABEL_14:

  return v22;
}

void __138__PUPickerConfiguration_limitedLibraryApplicationPreselectedObjectIDsOrCreateEmptySelectionWithTrustedIdentifier_auditToken_photoLibrary___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLPickerGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEFAULT, "Created initial empty fetch filter for client: %@, success: %@", (uint8_t *)&v7, 0x16u);

  }
}

@end
