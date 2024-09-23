@implementation CLSCurationModel_v4

+ (id)baseSpecificationWithSpecification:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  CLSCurationModelSpecification *v10;
  objc_super v12;

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___CLSCurationModel_v4;
  v3 = a3;
  objc_msgSendSuper2(&v12, sel_baseSpecificationWithSpecification_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "sceneAnalysisVersion", v12.receiver, v12.super_class);

  v6 = objc_msgSend(v4, "sceneAnalysisVersion");
  v7 = objc_msgSend(MEMORY[0x24BE726B8], "baseSceneAnalysisVersionWithSceneAnalysisVersion:", v5);
  if (v6 <= v7)
    v6 = v7;
  v8 = objc_msgSend(MEMORY[0x24BE726E8], "baseSceneAnalysisVersionWithSceneAnalysisVersion:", v5);
  if (v6 <= v8)
    v6 = v8;
  v9 = objc_msgSend(MEMORY[0x24BE72690], "baseSceneAnalysisVersionWithSceneAnalysisVersion:", v5);
  if (v6 <= v9)
    v6 = v9;
  v10 = -[CLSCurationModelSpecification initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:]([CLSCurationModelSpecification alloc], "initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:", v6, objc_msgSend(v4, "mediaAnalysisVersion"), objc_msgSend(v4, "faceAnalysisVersion"));

  return v10;
}

- (CLSCurationModel_v4)initWithCurationModelSpecification:(id)a3
{
  id v4;
  CLSCurationModel_v4 *v5;
  uint64_t v6;
  uint64_t v7;
  CLSMemeModel *memeModel;
  uint64_t v9;
  CLSTrendsSceneModel *trendsSceneModel;
  uint64_t v11;
  CLSIVSNSFWModel *ivsNSFWModel;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CLSCurationModel_v4;
  v5 = -[CLSCurationModel_v3 initWithCurationModelSpecification:](&v14, sel_initWithCurationModelSpecification_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "sceneAnalysisVersion");
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BE726B8]), "initWithSceneAnalysisVersion:", v6);
    memeModel = v5->_memeModel;
    v5->_memeModel = (CLSMemeModel *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE726E8]), "initWithSceneAnalysisVersion:", v6);
    trendsSceneModel = v5->_trendsSceneModel;
    v5->_trendsSceneModel = (CLSTrendsSceneModel *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE72690]), "initWithSceneAnalysisVersion:", v6);
    ivsNSFWModel = v5->_ivsNSFWModel;
    v5->_ivsNSFWModel = (CLSIVSNSFWModel *)v11;

  }
  return v5;
}

- (id)faceInformationSummaryWithFaces:(id)a3 detectionTraitsByFaceLocalIdentifier:(id)a4 verifiedPersonUUIDs:(id)a5 hiddenPersonUUIDs:(id)a6 personUUIDByMergeCandidateUUID:(id)a7 userFeedbackCalculator:(id)a8 assetUUID:(id)a9
{
  id v15;
  id v16;
  CLSCurationModel_v4 *v17;
  id v18;
  uint64_t v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  uint64_t i;
  void *v28;
  void *v29;
  int v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  int v37;
  double v38;
  _BOOL8 v39;
  double v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  CLSFaceInformation *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  double v52;
  CLSFaceInformation *v53;
  uint64_t v54;
  CLSFaceInformation *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t j;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  CLSAssetFaceInformationSummary *v72;
  id v74;
  id v75;
  void *v76;
  void *v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  id v83;
  void *v84;
  id obj;
  CLSCurationModel_v4 *v86;
  uint64_t v87;
  void *v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  unint64_t v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  void *v109;
  id v110;
  void *v111;
  _BYTE v112[128];
  uint8_t v113[128];
  uint8_t buf[4];
  id v115;
  uint64_t v116;

  v116 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v93 = a4;
  v81 = a5;
  v83 = a6;
  v89 = a7;
  v16 = a8;
  v17 = self;
  v18 = a9;
  -[CLSCurationModel_v1 faceModel](self, "faceModel");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v77 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v115 = v18;
    _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "faceInformationSummaryWithFaces: Asset %@ has no face model", buf, 0xCu);
  }
  v19 = objc_msgSend(v15, "count");
  v76 = v18;
  if (!v19)
  {
    v79 = 0;
    v80 = 0;
    v91 = 0;
    v92 = 0;
    v82 = 0;
    v97 = 0;
    v24 = 0.0;
    v60 = (void *)MEMORY[0x24BDBD1B8];
    v94 = (void *)MEMORY[0x24BDBD1B8];
    v25 = 0.0;
    v26 = 0.0;
    goto LABEL_54;
  }
  v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v19);
  v94 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v19);
  objc_msgSend(v77, "qualityNode");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v20 = v15;
  v95 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
  if (!v95)
  {

    v23 = 0;
    v79 = 0;
    v80 = 0;
    v82 = 0;
    v91 = 0;
    v92 = 0;
    v26 = 0.0;
    v25 = 0.0;
    v24 = 0.0;
    goto LABEL_53;
  }
  obj = v20;
  v86 = self;
  v74 = v16;
  v75 = v15;
  v21 = 0;
  v22 = 0;
  v78 = 0;
  v79 = 0;
  v91 = 0;
  v92 = 0;
  v82 = 0;
  v80 = 0;
  v23 = 0;
  v90 = *(_QWORD *)v106;
  v24 = 0.0;
  v25 = 0.0;
  v26 = 0.0;
  v87 = v19;
  do
  {
    for (i = 0; i != v95; ++i)
    {
      if (*(_QWORD *)v106 != v90)
        objc_enumerationMutation(obj);
      v28 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
      objc_msgSend(v28, "localIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "objectForKeyedSubscript:", v29);
      v98 = objc_claimAutoreleasedReturnValue();

      v30 = objc_msgSend(v28, "detectionType");
      if (v30 != 2)
        ++v23;
      objc_msgSend(v28, "size");
      v32 = v31;
      objc_msgSend(v28, "quality");
      v34 = v33;
      v35 = -0.0;
      if (v30 != 2)
        v35 = v34;
      v36 = v26 + v35;
      if (v34 >= 0.0)
        v21 += v30 != 2;
      v100 = v21;
      if (v34 >= 0.0)
      {
        ++v22;
        v25 = v25 + v34;
        v26 = v36;
      }
      v37 = objc_msgSend(v28, "eyesState");
      -[CLSCurationModel_v1 faceSizeLowerLimit](v17, "faceSizeLowerLimit");
      if (v32 >= v38)
      {
        -[CLSCurationModel_v1 faceSizeUpperLimit](v17, "faceSizeUpperLimit");
        v39 = v32 <= v40;
      }
      else
      {
        v39 = 0;
      }
      v99 = v22;
      if (v37 == 2)
      {
        v41 = objc_msgSend(v84, "passesHighPrecisionWithConfidence:", v34) & v39;
        v92 += v41 & 1;
        v91 += v41 & (v30 != 2);
        v42 = objc_msgSend(v84, "passesWithConfidence:", v34) & v39;
      }
      else
      {
        LOBYTE(v41) = 0;
        v42 = 0;
      }
      objc_msgSend(v28, "personLocalIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v43)
      {
        v21 = v100;
        v47 = (void *)v98;
        goto LABEL_43;
      }
      objc_msgSend(MEMORY[0x24BDE35E0], "uuidFromLocalIdentifier:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "objectForKeyedSubscript:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45)
      {
        objc_msgSend(MEMORY[0x24BDE35E0], "localIdentifierWithUUID:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v46 = 0;
      }
      v96 = v23;
      if (v44)
      {
        if (objc_msgSend(v83, "containsObject:", v44))
        {
          ++v82;
          v48 = [CLSFaceInformation alloc];
          objc_msgSend(v28, "size");
          v49 = v41 & 1;
          v47 = (void *)v98;
          v50 = -[CLSFaceInformation initForHiddenPersonWithFaceSize:faceQuality:faceSizeIsGood:faceIsGood:faceIsOk:traits:](v48, "initForHiddenPersonWithFaceSize:faceQuality:faceSizeIsGood:faceIsGood:faceIsOk:traits:", v39, v49, v42, v98);
          goto LABEL_39;
        }
        if (objc_msgSend(v81, "containsObject:", v44))
        {
          v51 = v78;
          if (v34 >= 0.0)
            v51 = v78 + 1;
          v78 = v51;
          v52 = -0.0;
          if (v34 >= 0.0)
            v52 = v34;
          v24 = v24 + v52;
          v79 += v41 & 1;
          ++v80;
          v53 = [CLSFaceInformation alloc];
          objc_msgSend(v28, "size");
          v54 = v41 & 1;
          v47 = (void *)v98;
          v50 = -[CLSFaceInformation initForKnownPersonWithFaceSize:faceQuality:faceSizeIsGood:faceIsGood:faceIsOk:traits:](v53, "initForKnownPersonWithFaceSize:faceQuality:faceSizeIsGood:faceIsGood:faceIsOk:traits:", v39, v54, v42, v98);
          goto LABEL_39;
        }
      }
      v55 = [CLSFaceInformation alloc];
      objc_msgSend(v28, "size");
      v56 = v41 & 1;
      v47 = (void *)v98;
      v50 = -[CLSFaceInformation initForUnknownPersonWithFaceSize:faceQuality:faceSizeIsGood:faceIsGood:faceIsOk:traits:](v55, "initForUnknownPersonWithFaceSize:faceQuality:faceSizeIsGood:faceIsGood:faceIsOk:traits:", v39, v56, v42, v98);
LABEL_39:
      v57 = (void *)v50;
      objc_msgSend(v88, "setObject:forKeyedSubscript:", v50, v43);
      v23 = v96;
      v21 = v100;
      if (!v46
        || (objc_msgSend(v94, "objectForKeyedSubscript:", v46),
            v58 = (void *)objc_claimAutoreleasedReturnValue(),
            v58,
            v59 = v46,
            v58))
      {
        v59 = v43;
      }
      objc_msgSend(v94, "setObject:forKeyedSubscript:", v57, v59);

      v17 = v86;
      v19 = v87;
LABEL_43:

      v22 = v99;
    }
    v95 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
  }
  while (v95);

  if (v99)
    v25 = v25 / (double)v99;
  if (v21)
    v26 = v26 / (double)v21;
  v16 = v74;
  v15 = v75;
  if (v78)
    v24 = v24 / (double)v78;
LABEL_53:
  v97 = v23;

  v60 = v88;
LABEL_54:
  v61 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v62 = v60;
  v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
  if (v63)
  {
    v64 = v63;
    v65 = *(_QWORD *)v102;
    do
    {
      for (j = 0; j != v64; ++j)
      {
        if (*(_QWORD *)v102 != v65)
          objc_enumerationMutation(v62);
        objc_msgSend(MEMORY[0x24BDE35D0], "uuidFromLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * j));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "addObject:", v67);

      }
      v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
    }
    while (v64);
  }

  v111 = v76;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v111, 1);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = v76;
  v110 = v61;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scoreForAssetUUIDs:personsUUIDsByAssetUUIDs:", v68, v69);
  v71 = v70;

  v72 = -[CLSAssetFaceInformationSummary initWithNumberOfFaces:numberOfFacesIncludingPets:numberOfFacesOfVerifiedPersons:numberOfFacesOfHiddenPersons:numberOfGoodFaces:numberOfGoodFacesIncludingPets:numberOfGoodFacesOfVerifiedPersons:averageFaceQuality:averageFaceQualityIncludingPets:averageFaceQualityOfVerifiedPersons:userFeedbackScore:faceInformationByPersonLocalIdentifier:faceInformationByConsolidatedPersonLocalIdentifier:]([CLSAssetFaceInformationSummary alloc], "initWithNumberOfFaces:numberOfFacesIncludingPets:numberOfFacesOfVerifiedPersons:numberOfFacesOfHiddenPersons:numberOfGoodFaces:numberOfGoodFacesIncludingPets:numberOfGoodFacesOfVerifiedPersons:averageFaceQuality:averageFaceQualityIncludingPets:averageFaceQualityOfVerifiedPersons:userFeedbackScore:faceInformationByPersonLocalIdentifier:faceInformationByConsolidatedPersonLocalIdentifier:", v97, v19, v80, v82, v91, v92, v26, v25, v24, v71, v79, v62, v94);
  return v72;
}

- (BOOL)isMemeExclusiveWithAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CLSCurationModel_v4 memeModel](self, "memeModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clsSceneClassifications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isMemeExclusiveFromSceneClassifications:", v6);
  return (char)v4;
}

- (BOOL)isMemeWithAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CLSCurationModel_v4 memeModel](self, "memeModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clsSceneClassifications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isMemeFromSceneClassifications:", v6);
  return (char)v4;
}

- (BOOL)isVeryPreciselyIVSNSFWExplicitWithAsset:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  objc_msgSend(a3, "clsProcessedSignals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSCurationModel_v4 ivsNSFWModel](self, "ivsNSFWModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v4, "isVeryPreciselyIVSNSFWExplicit");
  else
    v6 = objc_msgSend(v4, "isPreciselyNSFWExplicit");
  v7 = v6;

  return v7;
}

- (BOOL)isUtilityForVideoAsset:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "playbackStyle") == 5)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CLSCurationModel_v4;
    v5 = -[CLSCurationModel_v1 isUtilityForVideoAsset:](&v7, sel_isUtilityForVideoAsset_, v4);
  }

  return v5;
}

- (BOOL)isUtilityForMemoriesWithVideoAsset:(id)a3
{
  id v4;
  double v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "duration");
  if (v5 <= 60.0)
  {
    v8.receiver = self;
    v8.super_class = (Class)CLSCurationModel_v4;
    v6 = -[CLSCurationModel_v1 isUtilityForMemoriesWithVideoAsset:](&v8, sel_isUtilityForMemoriesWithVideoAsset_, v4);
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)isUtilityForMemoriesForImageAsset:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v13;
  BOOL v14;
  void *v15;

  v4 = a3;
  if ((objc_msgSend(v4, "clsHasCustomPlaybackVariation") & 1) != 0)
    goto LABEL_2;
  if ((objc_msgSend(v4, "clsIsTragicFailure") & 1) != 0)
    goto LABEL_6;
  -[CLSCurationModel_v1 mediaPreAnalysisModel](self, "mediaPreAnalysisModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sharpnessNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clsSharpnessScore");
  v8 = objc_msgSend(v7, "failsHighRecallWithConfidence:");

  if ((v8 & 1) != 0)
    goto LABEL_6;
  -[CLSCurationModel_v1 aestheticsModel](self, "aestheticsModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "overallAestheticScoreNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clsAestheticScore");
  v11 = objc_msgSend(v10, "failsHighRecallWithConfidence:");

  if ((v11 & 1) != 0)
  {
LABEL_6:
    v5 = 1;
    goto LABEL_7;
  }
  if (!objc_msgSend(v4, "clsPeopleCount"))
  {
    objc_msgSend(v4, "clsSceneClassifications");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CLSCurationModel_v1 imageAssetIsJunkFromSceneAndJunkClassifications:](self, "imageAssetIsJunkFromSceneAndJunkClassifications:", v13);

    if (!v14)
    {
      objc_msgSend(v4, "clsSceneClassifications");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[CLSCurationModel_v1 imageAssetIsJunkForMemoriesFromSceneAndJunkClassifications:forKeyAsset:forMemories:](self, "imageAssetIsJunkForMemoriesFromSceneAndJunkClassifications:forKeyAsset:forMemories:", v15, 0, 1);

      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_2:
  v5 = 0;
LABEL_7:

  return v5;
}

- (BOOL)isUtilityForMemoriesWithAsset:(id)a3 userFeedbackCalculator:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  int v10;
  __int16 v11;
  float v12;
  float v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  id v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  objc_super v55;
  void *v56;
  id v57;
  void *v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v55.receiver = self;
  v55.super_class = (Class)CLSCurationModel_v4;
  if (!-[CLSCurationModel_v3 isUtilityForMemoriesWithAsset:userFeedbackCalculator:](&v55, sel_isUtilityForMemoriesWithAsset_userFeedbackCalculator_, v6, v7)&& !-[CLSCurationModel_v4 isMemeWithAsset:](self, "isMemeWithAsset:", v6))
  {
    objc_msgSend(v6, "mediaAnalysisProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "probableRotationDirection");
    if ((v10 - 1) >= 4)
      v11 = 0;
    else
      v11 = v10;
    objc_msgSend(v9, "probableRotationDirectionConfidence");
    v13 = v12;
    -[CLSCurationModel_v1 mediaPreAnalysisModel](self, "mediaPreAnalysisModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isWronglyRotatedForDirection:confidence:", v11, v13);

    v46 = v9;
    if (v15
      && (objc_msgSend(v6, "clsFaceInformationSummary"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v16, "numberOfFaces"),
          v16,
          v17))
    {
      -[CLSCurationModel_v1 confidenceThresholdBySceneIdentifierForBabyScenes](self, "confidenceThresholdBySceneIdentifierForBabyScenes");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      objc_msgSend(v6, "clsSceneClassifications");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      if (v20)
      {
        v21 = v20;
        v45 = v7;
        v22 = *(_QWORD *)v52;
LABEL_11:
        v23 = 0;
        while (1)
        {
          if (*(_QWORD *)v52 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v23);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v24, "extendedSceneIdentifier", v45));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
            break;
          if (v21 == ++v23)
          {
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
            v8 = 1;
            if (v21)
              goto LABEL_11;
            v7 = v45;
            goto LABEL_28;
          }
        }
        objc_msgSend(v24, "confidence");
        v28 = v27;
        objc_msgSend(v26, "doubleValue");
        v30 = v29;

        v7 = v45;
        if (v28 >= v30)
          goto LABEL_20;
        v8 = 1;
        goto LABEL_30;
      }
      v8 = 1;
    }
    else
    {
LABEL_20:
      objc_msgSend(v6, "clsFaceInformationSummary");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "faceInformationByPersonLocalIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v18 = v32;
      v33 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v48 != v35)
              objc_enumerationMutation(v18);
            objc_msgSend(MEMORY[0x24BDE35D0], "uuidFromLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v37);

          }
          v34 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
        }
        while (v34);
      }

      objc_msgSend(v6, "clsIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v38;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v58, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clsIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v40;
      v57 = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scoreForAssetUUIDs:personsUUIDsByAssetUUIDs:", v39, v41);
      v43 = v42;

      v8 = objc_msgSend(MEMORY[0x24BDE36A8], "score:meetsScoreThreshold:", v43, *MEMORY[0x24BDE38C8]);
LABEL_28:
      v9 = v46;
    }

LABEL_30:
    goto LABEL_31;
  }
  v8 = 1;
LABEL_31:

  return v8;
}

- (BOOL)avoidIfPossibleForKeyAssetWithAsset:(id)a3 statistics:(id *)a4
{
  id v6;
  int v7;
  void *v8;
  int v9;
  __int16 v10;
  float v11;
  float v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CLSCurationModel_v4;
  if (-[CLSCurationModel_v3 avoidIfPossibleForKeyAssetWithAsset:statistics:](&v15, sel_avoidIfPossibleForKeyAssetWithAsset_statistics_, v6, a4))
  {
    goto LABEL_4;
  }
  if (-[CLSCurationModel_v4 isMemeWithAsset:](self, "isMemeWithAsset:", v6))
  {
    ++a4->var9;
LABEL_4:
    LOBYTE(v7) = 1;
    goto LABEL_11;
  }
  objc_msgSend(v6, "mediaAnalysisProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "probableRotationDirection");
  if ((v9 - 1) >= 4)
    v10 = 0;
  else
    v10 = v9;
  objc_msgSend(v8, "probableRotationDirectionConfidence");
  v12 = v11;
  -[CLSCurationModel_v1 mediaPreAnalysisModel](self, "mediaPreAnalysisModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v13, "isWronglyRotatedForDirection:confidence:", v10, v12);

  if (v7)
    ++a4->var10;

LABEL_11:
  return v7;
}

- (BOOL)isUtilityForSyndicationWithAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v13;
  BOOL v14;
  void *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLSCurationModel_v4;
  if (!-[CLSCurationModel_v1 isUtilityForSyndicationWithAsset:](&v16, sel_isUtilityForSyndicationWithAsset_, v4)
    && !-[CLSCurationModel_v4 isMemeWithAsset:](self, "isMemeWithAsset:", v4)
    && !-[CLSCurationModel_v4 isVeryPreciselyIVSNSFWExplicitWithAsset:](self, "isVeryPreciselyIVSNSFWExplicitWithAsset:", v4)&& (objc_msgSend(v4, "clsIsTragicFailure") & 1) == 0)
  {
    -[CLSCurationModel_v1 mediaPreAnalysisModel](self, "mediaPreAnalysisModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sharpnessNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clsSharpnessScore");
    v7 = objc_msgSend(v6, "failsHighRecallWithConfidence:");

    if ((v7 & 1) == 0)
    {
      -[CLSCurationModel_v1 aestheticsModel](self, "aestheticsModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "overallAestheticScoreNode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "clsAestheticScore");
      v10 = objc_msgSend(v9, "failsHighRecallWithConfidence:");

      if ((v10 & 1) == 0)
      {
        if (objc_msgSend(v4, "clsPeopleCount"))
        {
          v11 = 0;
          goto LABEL_8;
        }
        objc_msgSend(v4, "clsSceneClassifications");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[CLSCurationModel_v1 imageAssetIsJunkFromSceneAndJunkClassifications:](self, "imageAssetIsJunkFromSceneAndJunkClassifications:", v13);

        if (!v14)
        {
          objc_msgSend(v4, "clsSceneClassifications");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[CLSCurationModel_v1 imageAssetIsJunkForMemoriesFromSceneAndJunkClassifications:forKeyAsset:forMemories:](self, "imageAssetIsJunkForMemoriesFromSceneAndJunkClassifications:forKeyAsset:forMemories:", v15, 0, 0);

          goto LABEL_8;
        }
      }
    }
  }
  v11 = 1;
LABEL_8:

  return v11;
}

- (BOOL)assetIsJunkWithSceneClassifications:(id)a3 confidenceThresholdBySceneIdentifierForScenesPreventingJunking:(id)a4 confidenceThresholdBySceneIdentifierForJunkingScenes:(id)a5 confidenceThresholdBySceneIdentifierForScenesPreventingSceneBasedJunking:(id)a6 forMemories:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  char v39;
  uint64_t v40;
  uint64_t v42;
  char v43;
  id v44;
  id v45;
  char v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  char v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v7 = a7;
  v62 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v52 = a4;
  v44 = a5;
  v47 = a6;
  -[CLSCurationModel_v1 junkClassificationModel](self, "junkClassificationModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "negativeNode");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nonMemorableNode");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "poorQualityNode");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSCurationModel_v3 sdModel](self, "sdModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "foodDrinkNode");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v15 = v12;
  v56 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (!v56)
  {

    LOBYTE(v17) = 0;
    v40 = 0;
LABEL_44:
    v39 = v17 | (v40 != 0);
    goto LABEL_51;
  }
  v43 = 0;
  v46 = 0;
  v16 = 0;
  v17 = 0;
  v53 = 0;
  v18 = 0;
  v42 = 0;
  v55 = *(_QWORD *)v58;
  do
  {
    for (i = 0; i != v56; ++i)
    {
      if (*(_QWORD *)v58 != v55)
        objc_enumerationMutation(v15);
      v20 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
      v21 = objc_msgSend(v20, "extendedSceneIdentifier", v42);
      objc_msgSend(v20, "confidence");
      v23 = v22;
      if (objc_msgSend(v13, "isResponsibleForSignalIdentifier:", v21))
      {
        if (v7)
        {
          if ((v18 & 1) == 0 && (objc_msgSend(v51, "passesHighPrecisionWithSignal:", v20) & 1) != 0)
            goto LABEL_18;
          if ((v53 & 1) == 0 && (objc_msgSend(v50, "passesWithSignal:", v20) & 1) != 0)
            goto LABEL_24;
        }
        else
        {
          if ((v18 & 1) == 0 && (objc_msgSend(v51, "passesWithSignal:", v20) & 1) != 0)
          {
LABEL_18:
            v18 = 1;
            continue;
          }
          if ((v53 & 1) == 0 && (objc_msgSend(v50, "passesHighPrecisionWithSignal:", v20) & 1) != 0)
          {
LABEL_24:
            v53 = 1;
            continue;
          }
        }
        if ((v17 & 1) != 0)
          v17 = 1;
        else
          v17 = objc_msgSend(v49, "passesWithSignal:", v20);
      }
      else if (objc_msgSend(v14, "isResponsibleForSignalIdentifier:", v21))
      {
        if ((v16 & 1) != 0)
          v16 = 1;
        else
          v16 = objc_msgSend(v48, "passesHighPrecisionWithSignal:", v20);
      }
      else
      {
        v54 = v18;
        v24 = v16;
        v25 = v17;
        v26 = v13;
        v27 = v7;
        v28 = v14;
        v29 = v15;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v21);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "objectForKeyedSubscript:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (v31)
        {
          objc_msgSend(v31, "doubleValue");
          if (v23 >= v33)
            v46 = 1;
        }
        else
        {
          objc_msgSend(v47, "objectForKeyedSubscript:", v30);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v34;
          if (v34)
          {
            objc_msgSend(v34, "doubleValue");
            if (v23 >= v36)
              v43 = 1;
          }
          else
          {
            objc_msgSend(v44, "objectForKeyedSubscript:", v30);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (v37)
            {
              v45 = v37;
              objc_msgSend(v37, "doubleValue");
              if (v23 >= v38)
                ++v42;
              v37 = v45;
            }

          }
        }

        v15 = v29;
        v14 = v28;
        v7 = v27;
        v13 = v26;
        v17 = v25;
        v16 = v24;
        v18 = v54;
      }
    }
    v56 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  }
  while (v56);

  if ((v46 & 1) == 0)
  {
    v40 = v42;
    if ((v43 & 1) != 0)
      v40 = 0;
    if ((v18 & 1) != 0)
    {
      v39 = v53 & v16 & (v40 != 0);
      goto LABEL_51;
    }
    if ((v53 & 1) != 0)
    {
      v39 = 1;
      goto LABEL_51;
    }
    goto LABEL_44;
  }
  v39 = 0;
LABEL_51:

  return v39 & 1;
}

- (BOOL)isSemDevSceneDetectedForIdentifier:(unsigned int)a3 withSceneClassification:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a4;
  -[CLSCurationModel_v3 sdModel](self, "sdModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nodeForSignalIdentifier:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "passesWithSignal:", v6);

  return v9;
}

- (void)enumerateSignalModelsUsingBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__CLSCurationModel_v4_enumerateSignalModelsUsingBlock___block_invoke;
  v11[3] = &unk_251480458;
  v5 = v4;
  v12 = v5;
  v13 = &v14;
  v10.receiver = self;
  v10.super_class = (Class)CLSCurationModel_v4;
  -[CLSCurationModel_v3 enumerateSignalModelsUsingBlock:](&v10, sel_enumerateSignalModelsUsingBlock_, v11);
  if (!*((_BYTE *)v15 + 24))
  {
    -[CLSCurationModel_v4 memeModel](self, "memeModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6
      || (-[CLSCurationModel_v4 memeModel](self, "memeModel"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          (*((void (**)(id, void *, uint64_t *))v5 + 2))(v5, v7, v15 + 3),
          v7,
          !*((_BYTE *)v15 + 24)))
    {
      -[CLSCurationModel_v4 ivsNSFWModel](self, "ivsNSFWModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[CLSCurationModel_v4 ivsNSFWModel](self, "ivsNSFWModel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, uint64_t *))v5 + 2))(v5, v9, v15 + 3);

      }
    }
  }

  _Block_object_dispose(&v14, 8);
}

- (void)enumerateClassificationBasedSignalModelsUsingBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__CLSCurationModel_v4_enumerateClassificationBasedSignalModelsUsingBlock___block_invoke;
  v11[3] = &unk_251480480;
  v5 = v4;
  v12 = v5;
  v13 = &v14;
  v10.receiver = self;
  v10.super_class = (Class)CLSCurationModel_v4;
  -[CLSCurationModel_v3 enumerateClassificationBasedSignalModelsUsingBlock:](&v10, sel_enumerateClassificationBasedSignalModelsUsingBlock_, v11);
  if (!*((_BYTE *)v15 + 24))
  {
    -[CLSCurationModel_v4 memeModel](self, "memeModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6
      || (-[CLSCurationModel_v4 memeModel](self, "memeModel"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          (*((void (**)(id, void *, uint64_t *))v5 + 2))(v5, v7, v15 + 3),
          v7,
          !*((_BYTE *)v15 + 24)))
    {
      -[CLSCurationModel_v4 ivsNSFWModel](self, "ivsNSFWModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[CLSCurationModel_v4 ivsNSFWModel](self, "ivsNSFWModel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, uint64_t *))v5 + 2))(v5, v9, v15 + 3);

      }
    }
  }

  _Block_object_dispose(&v14, 8);
}

- (CLSMemeModel)memeModel
{
  return (CLSMemeModel *)objc_getProperty(self, a2, 152, 1);
}

- (CLSTrendsSceneModel)trendsSceneModel
{
  return (CLSTrendsSceneModel *)objc_getProperty(self, a2, 160, 1);
}

- (CLSIVSNSFWModel)ivsNSFWModel
{
  return (CLSIVSNSFWModel *)objc_getProperty(self, a2, 168, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ivsNSFWModel, 0);
  objc_storeStrong((id *)&self->_trendsSceneModel, 0);
  objc_storeStrong((id *)&self->_memeModel, 0);
}

@end
