@implementation PGCuratorInvestigationItem

- (PGCuratorInvestigationItem)init
{
  PGCuratorInvestigationItem *v2;
  void *v3;
  uint64_t v4;
  NSString *clsIdentifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGCuratorInvestigationItem;
  v2 = -[PGCuratorInvestigationItem init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    clsIdentifier = v2->_clsIdentifier;
    v2->_clsIdentifier = (NSString *)v4;

  }
  return v2;
}

- (PGCuratorInvestigationItem)initWithUUID:(id)a3 itemInfo:(id)a4 curationModel:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGCuratorInvestigationItem *v12;
  uint64_t v13;
  NSDate *cls_universalDate;
  uint64_t v15;
  CLLocation *clsLocation;
  uint64_t v17;
  NSArray *clsPersonLocalIdentifiers;
  uint64_t v19;
  NSSet *clsSceneClassifications;
  uint64_t v21;
  NSSet *clsVisualLookupSceneClassifications;
  uint64_t v23;
  VNSceneprint *clsSceneprint;
  uint64_t v25;
  NSArray *clsUnprefetchedPersonLocalIdentifiers;
  uint64_t v27;
  NSArray *clsPetLocalIdentifiers;
  uint64_t v29;
  NSArray *clsPersonAndPetLocalIdentifiers;
  uint64_t v31;
  NSNumber *clsViewCount;
  uint64_t v33;
  NSNumber *clsPlayCount;
  uint64_t v35;
  NSNumber *clsShareCount;
  uint64_t v37;
  NSNumber *clsIsUtility;
  uint64_t v39;
  NSNumber *clsIsBlurry;
  uint64_t v41;
  NSNumber *isVideo;
  uint64_t v43;
  NSNumber *clsIsScreenshotOrScreenRecording;
  uint64_t v45;
  NSNumber *isFavorite;
  uint64_t v47;
  NSNumber *clsContentScore;
  uint64_t v49;
  NSNumber *clsIsInterestingVideo;
  uint64_t v51;
  NSNumber *clsIsInterestingLivePhoto;
  uint64_t v53;
  NSNumber *clsIsInterestingPanorama;
  uint64_t v55;
  NSNumber *clsIsInterestingSDOF;
  uint64_t v57;
  NSNumber *clsIsInterestingHDR;
  uint64_t v59;
  NSNumber *clsHasInterestingAudioClassification;
  uint64_t v61;
  NSNumber *clsHasCustomPlaybackVariation;
  uint64_t v63;
  NSNumber *clsSharpnessScore;
  uint64_t v65;
  NSNumber *clsExposureScore;
  uint64_t v67;
  NSNumber *clsAestheticScore;
  uint64_t v69;
  NSNumber *clsIsAestheticallyPrettyGood;
  uint64_t v71;
  NSNumber *clsFaceScore;
  uint64_t v73;
  NSNumber *clsIsInhabited;
  uint64_t v75;
  NSNumber *clsAvoidIfPossibleForKeyItem;
  uint64_t v77;
  NSNumber *clsHasPoorResolution;
  uint64_t v79;
  NSNumber *clsHasInterestingScenes;
  uint64_t v81;
  NSNumber *clsLikabilityScore;
  uint64_t v83;
  NSNumber *clsInteractionScore;
  uint64_t v85;
  NSNumber *clsHighlightVisibilityScore;
  uint64_t v87;
  NSNumber *clsAutoplaySuggestionScore;
  uint64_t v89;
  NSNumber *isShinyGem;
  uint64_t v91;
  NSNumber *isRegularGem;
  uint64_t v93;
  NSNumber *clsDuration;
  uint64_t v95;
  NSNumber *clsIsNonMemorable;
  uint64_t v97;
  NSNumber *clsIsLoopOrBounce;
  uint64_t v99;
  NSNumber *clsIsLongExposure;
  uint64_t v101;
  NSNumber *clsGpsHorizontalAccuracy;
  uint64_t v103;
  NSNumber *clsSquareCropScore;
  uint64_t v105;
  NSNumber *clsIsInSharedLibrary;
  uint64_t v107;
  NSNumber *clsIconicScore;
  NSDate *v109;
  NSDate *v110;
  NSDate *v111;
  NSDate *cls_localDate;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  double v118;
  double v119;
  void *v120;
  double v121;
  uint64_t v122;
  CLLocation *v123;
  NSArray *v124;
  NSArray *v125;
  NSArray *v126;
  NSArray *v127;
  NSArray *v128;
  NSArray *v129;
  NSArray *v130;
  NSArray *v131;
  uint64_t v132;
  NSArray *v133;
  uint64_t v134;
  void *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  void *v139;
  void *v140;
  uint64_t v141;
  void *v142;
  void *v143;
  NSNumber *v144;
  NSNumber *v145;
  NSNumber *v146;
  NSNumber *v147;
  NSNumber *v148;
  NSNumber *v149;
  void **p_clsSceneprint;
  void *v151;
  NSArray *v152;
  void *v153;
  uint64_t v154;
  void *v155;
  void *v156;
  id v157;
  void *v158;
  id v159;
  void *v160;
  id v161;
  void *v162;
  id v163;
  void *v164;
  id v165;
  void *v166;
  id v167;
  void *v168;
  id v169;
  void *v170;
  id v171;
  void *v172;
  id v173;
  void *v174;
  id v175;
  void *v176;
  id v177;
  void *v178;
  id v179;
  void *v180;
  id v181;
  void *v182;
  id v183;
  void *v184;
  id v185;
  void *v186;
  id v187;
  void *v188;
  id v189;
  void *v190;
  id v191;
  NSNumber *v192;
  NSNumber *v193;
  NSArray *v194;
  NSArray *faceInfos;
  NSNumber *v196;
  NSNumber *v197;
  NSNumber *v198;
  NSNumber *v199;
  NSNumber *v200;
  NSNumber *v201;
  NSNumber *v202;
  NSNumber *v203;
  NSNumber *v204;
  NSNumber *v205;
  NSNumber *v206;
  NSNumber *v207;
  NSNumber *v208;
  NSNumber *v209;
  NSNumber *v210;
  NSNumber *v211;
  void *v212;
  id v213;
  id v214;
  PGCuratorInvestigationItem *v215;
  id *v217;
  void *v218;
  id v219;
  id *p_clsIsInterestingVideo;
  id *p_clsIsInterestingLivePhoto;
  id *p_clsIsInterestingPanorama;
  id *p_clsIsInterestingSDOF;
  id *p_clsIsInterestingHDR;
  id *p_clsHasInterestingAudioClassification;
  id *p_clsHasCustomPlaybackVariation;
  id *p_clsSharpnessScore;
  id *p_clsHasInterestingScenes;
  id *p_clsExposureScore;
  id *p_clsIsInhabited;
  id *p_clsLikabilityScore;
  id *p_clsInteractionScore;
  id *p_clsHighlightVisibilityScore;
  id *p_clsAutoplaySuggestionScore;
  id *p_isShinyGem;
  NSArray *v236;
  id v237;
  _QWORD v238[4];
  id v239;
  id v240;
  objc_super v241;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v241.receiver = self;
  v241.super_class = (Class)PGCuratorInvestigationItem;
  v12 = -[PGCuratorInvestigationItem init](&v241, sel_init);

  if (v12)
  {
    v237 = v11;
    v219 = v9;
    objc_storeStrong((id *)&v12->_clsIdentifier, a3);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
    cls_universalDate = v12->_cls_universalDate;
    v12->_cls_universalDate = (NSDate *)v13;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
    clsLocation = v12->_clsLocation;
    v12->_clsLocation = (CLLocation *)v15;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
    clsPersonLocalIdentifiers = v12->_clsPersonLocalIdentifiers;
    v12->_clsPersonLocalIdentifiers = (NSArray *)v17;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
    clsSceneClassifications = v12->_clsSceneClassifications;
    v12->_clsSceneClassifications = (NSSet *)v19;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
    clsVisualLookupSceneClassifications = v12->_clsVisualLookupSceneClassifications;
    v12->_clsVisualLookupSceneClassifications = (NSSet *)v21;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
    clsSceneprint = v12->_clsSceneprint;
    v12->_clsSceneprint = (VNSceneprint *)v23;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
    clsUnprefetchedPersonLocalIdentifiers = v12->_clsUnprefetchedPersonLocalIdentifiers;
    v12->_clsUnprefetchedPersonLocalIdentifiers = (NSArray *)v25;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = objc_claimAutoreleasedReturnValue();
    clsPetLocalIdentifiers = v12->_clsPetLocalIdentifiers;
    v12->_clsPetLocalIdentifiers = (NSArray *)v27;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = objc_claimAutoreleasedReturnValue();
    clsPersonAndPetLocalIdentifiers = v12->_clsPersonAndPetLocalIdentifiers;
    v12->_clsPersonAndPetLocalIdentifiers = (NSArray *)v29;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = objc_claimAutoreleasedReturnValue();
    clsViewCount = v12->_clsViewCount;
    v12->_clsViewCount = (NSNumber *)v31;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = objc_claimAutoreleasedReturnValue();
    clsPlayCount = v12->_clsPlayCount;
    v12->_clsPlayCount = (NSNumber *)v33;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = objc_claimAutoreleasedReturnValue();
    clsShareCount = v12->_clsShareCount;
    v12->_clsShareCount = (NSNumber *)v35;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = objc_claimAutoreleasedReturnValue();
    clsIsUtility = v12->_clsIsUtility;
    v12->_clsIsUtility = (NSNumber *)v37;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v39 = objc_claimAutoreleasedReturnValue();
    clsIsBlurry = v12->_clsIsBlurry;
    v12->_clsIsBlurry = (NSNumber *)v39;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v41 = objc_claimAutoreleasedReturnValue();
    isVideo = v12->_isVideo;
    v12->_isVideo = (NSNumber *)v41;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v43 = objc_claimAutoreleasedReturnValue();
    clsIsScreenshotOrScreenRecording = v12->_clsIsScreenshotOrScreenRecording;
    v12->_clsIsScreenshotOrScreenRecording = (NSNumber *)v43;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v45 = objc_claimAutoreleasedReturnValue();
    isFavorite = v12->_isFavorite;
    v12->_isFavorite = (NSNumber *)v45;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v47 = objc_claimAutoreleasedReturnValue();
    clsContentScore = v12->_clsContentScore;
    v12->_clsContentScore = (NSNumber *)v47;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v49 = objc_claimAutoreleasedReturnValue();
    clsIsInterestingVideo = v12->_clsIsInterestingVideo;
    p_clsIsInterestingVideo = (id *)&v12->_clsIsInterestingVideo;
    v12->_clsIsInterestingVideo = (NSNumber *)v49;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v51 = objc_claimAutoreleasedReturnValue();
    clsIsInterestingLivePhoto = v12->_clsIsInterestingLivePhoto;
    p_clsIsInterestingLivePhoto = (id *)&v12->_clsIsInterestingLivePhoto;
    v12->_clsIsInterestingLivePhoto = (NSNumber *)v51;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v53 = objc_claimAutoreleasedReturnValue();
    clsIsInterestingPanorama = v12->_clsIsInterestingPanorama;
    p_clsIsInterestingPanorama = (id *)&v12->_clsIsInterestingPanorama;
    v12->_clsIsInterestingPanorama = (NSNumber *)v53;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v55 = objc_claimAutoreleasedReturnValue();
    clsIsInterestingSDOF = v12->_clsIsInterestingSDOF;
    p_clsIsInterestingSDOF = (id *)&v12->_clsIsInterestingSDOF;
    v12->_clsIsInterestingSDOF = (NSNumber *)v55;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v57 = objc_claimAutoreleasedReturnValue();
    clsIsInterestingHDR = v12->_clsIsInterestingHDR;
    p_clsIsInterestingHDR = (id *)&v12->_clsIsInterestingHDR;
    v12->_clsIsInterestingHDR = (NSNumber *)v57;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v59 = objc_claimAutoreleasedReturnValue();
    clsHasInterestingAudioClassification = v12->_clsHasInterestingAudioClassification;
    p_clsHasInterestingAudioClassification = (id *)&v12->_clsHasInterestingAudioClassification;
    v12->_clsHasInterestingAudioClassification = (NSNumber *)v59;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v61 = objc_claimAutoreleasedReturnValue();
    clsHasCustomPlaybackVariation = v12->_clsHasCustomPlaybackVariation;
    p_clsHasCustomPlaybackVariation = (id *)&v12->_clsHasCustomPlaybackVariation;
    v12->_clsHasCustomPlaybackVariation = (NSNumber *)v61;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v63 = objc_claimAutoreleasedReturnValue();
    clsSharpnessScore = v12->_clsSharpnessScore;
    p_clsSharpnessScore = (id *)&v12->_clsSharpnessScore;
    v12->_clsSharpnessScore = (NSNumber *)v63;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v65 = objc_claimAutoreleasedReturnValue();
    clsExposureScore = v12->_clsExposureScore;
    p_clsExposureScore = (id *)&v12->_clsExposureScore;
    v12->_clsExposureScore = (NSNumber *)v65;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v67 = objc_claimAutoreleasedReturnValue();
    clsAestheticScore = v12->_clsAestheticScore;
    v12->_clsAestheticScore = (NSNumber *)v67;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v69 = objc_claimAutoreleasedReturnValue();
    clsIsAestheticallyPrettyGood = v12->_clsIsAestheticallyPrettyGood;
    v12->_clsIsAestheticallyPrettyGood = (NSNumber *)v69;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v71 = objc_claimAutoreleasedReturnValue();
    clsFaceScore = v12->_clsFaceScore;
    v12->_clsFaceScore = (NSNumber *)v71;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v73 = objc_claimAutoreleasedReturnValue();
    clsIsInhabited = v12->_clsIsInhabited;
    p_clsIsInhabited = (id *)&v12->_clsIsInhabited;
    v12->_clsIsInhabited = (NSNumber *)v73;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v75 = objc_claimAutoreleasedReturnValue();
    clsAvoidIfPossibleForKeyItem = v12->_clsAvoidIfPossibleForKeyItem;
    v12->_clsAvoidIfPossibleForKeyItem = (NSNumber *)v75;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v77 = objc_claimAutoreleasedReturnValue();
    clsHasPoorResolution = v12->_clsHasPoorResolution;
    v12->_clsHasPoorResolution = (NSNumber *)v77;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v79 = objc_claimAutoreleasedReturnValue();
    clsHasInterestingScenes = v12->_clsHasInterestingScenes;
    p_clsHasInterestingScenes = (id *)&v12->_clsHasInterestingScenes;
    v12->_clsHasInterestingScenes = (NSNumber *)v79;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v81 = objc_claimAutoreleasedReturnValue();
    clsLikabilityScore = v12->_clsLikabilityScore;
    p_clsLikabilityScore = (id *)&v12->_clsLikabilityScore;
    v12->_clsLikabilityScore = (NSNumber *)v81;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v83 = objc_claimAutoreleasedReturnValue();
    clsInteractionScore = v12->_clsInteractionScore;
    p_clsInteractionScore = (id *)&v12->_clsInteractionScore;
    v12->_clsInteractionScore = (NSNumber *)v83;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v85 = objc_claimAutoreleasedReturnValue();
    clsHighlightVisibilityScore = v12->_clsHighlightVisibilityScore;
    p_clsHighlightVisibilityScore = (id *)&v12->_clsHighlightVisibilityScore;
    v12->_clsHighlightVisibilityScore = (NSNumber *)v85;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v87 = objc_claimAutoreleasedReturnValue();
    clsAutoplaySuggestionScore = v12->_clsAutoplaySuggestionScore;
    p_clsAutoplaySuggestionScore = (id *)&v12->_clsAutoplaySuggestionScore;
    v12->_clsAutoplaySuggestionScore = (NSNumber *)v87;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v89 = objc_claimAutoreleasedReturnValue();
    isShinyGem = v12->_isShinyGem;
    p_isShinyGem = (id *)&v12->_isShinyGem;
    v12->_isShinyGem = (NSNumber *)v89;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v91 = objc_claimAutoreleasedReturnValue();
    isRegularGem = v12->_isRegularGem;
    v12->_isRegularGem = (NSNumber *)v91;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v93 = objc_claimAutoreleasedReturnValue();
    clsDuration = v12->_clsDuration;
    v12->_clsDuration = (NSNumber *)v93;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v95 = objc_claimAutoreleasedReturnValue();
    clsIsNonMemorable = v12->_clsIsNonMemorable;
    v12->_clsIsNonMemorable = (NSNumber *)v95;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v97 = objc_claimAutoreleasedReturnValue();
    clsIsLoopOrBounce = v12->_clsIsLoopOrBounce;
    v12->_clsIsLoopOrBounce = (NSNumber *)v97;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v99 = objc_claimAutoreleasedReturnValue();
    clsIsLongExposure = v12->_clsIsLongExposure;
    v12->_clsIsLongExposure = (NSNumber *)v99;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v101 = objc_claimAutoreleasedReturnValue();
    clsGpsHorizontalAccuracy = v12->_clsGpsHorizontalAccuracy;
    v12->_clsGpsHorizontalAccuracy = (NSNumber *)v101;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v103 = objc_claimAutoreleasedReturnValue();
    clsSquareCropScore = v12->_clsSquareCropScore;
    v12->_clsSquareCropScore = (NSNumber *)v103;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v105 = objc_claimAutoreleasedReturnValue();
    clsIsInSharedLibrary = v12->_clsIsInSharedLibrary;
    v12->_clsIsInSharedLibrary = (NSNumber *)v105;

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v107 = objc_claimAutoreleasedReturnValue();
    clsIconicScore = v12->_clsIconicScore;
    v12->_clsIconicScore = (NSNumber *)v107;

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("creationDate"));
    v109 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v110 = v109;
    if (!v109)
      v110 = v12->_cls_universalDate;
    objc_storeStrong((id *)&v12->_cls_universalDate, v110);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("localCreationDate"));
    v111 = (NSDate *)objc_claimAutoreleasedReturnValue();
    cls_localDate = v111;
    if (!v111)
      cls_localDate = v12->_cls_localDate;
    objc_storeStrong((id *)&v12->_cls_localDate, cls_localDate);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("location"));
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v218 = v113;
    if (v113)
    {
      v114 = v113;
      objc_msgSend(v113, "objectForKeyedSubscript:", CFSTR("latitude"));
      v115 = (void *)objc_claimAutoreleasedReturnValue();

      if (v115)
      {
        v116 = objc_alloc(MEMORY[0x1E0C9E3B8]);
        objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("latitude"));
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "doubleValue");
        v119 = v118;
        objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("longitude"));
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "doubleValue");
        v122 = objc_msgSend(v116, "initWithLatitude:longitude:", v119, v121);
        v123 = v12->_clsLocation;
        v12->_clsLocation = (CLLocation *)v122;

      }
      else
      {
        v117 = v12->_clsLocation;
        v12->_clsLocation = 0;
      }

    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("peopleNames"), &v12->_clsIsBlurry);
    v124 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v125 = v124;
    if (!v124)
      v125 = v12->_clsPersonLocalIdentifiers;
    objc_storeStrong((id *)&v12->_clsPersonLocalIdentifiers, v125);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("petNames"));
    v126 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v127 = v126;
    if (!v126)
      v127 = v12->_clsPetLocalIdentifiers;
    objc_storeStrong((id *)&v12->_clsPetLocalIdentifiers, v127);

    v128 = v12->_clsPersonLocalIdentifiers;
    v129 = (NSArray *)MEMORY[0x1E0C9AA60];
    if (!v128)
      v128 = (NSArray *)MEMORY[0x1E0C9AA60];
    v130 = v128;
    v131 = v12->_clsPetLocalIdentifiers;
    if (!v131)
      v131 = v129;
    v236 = v131;
    -[NSArray arrayByAddingObjectsFromArray:](v130, "arrayByAddingObjectsFromArray:");
    v132 = objc_claimAutoreleasedReturnValue();
    v133 = v12->_clsPersonAndPetLocalIdentifiers;
    v12->_clsPersonAndPetLocalIdentifiers = (NSArray *)v132;

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isUtility"));
    v134 = objc_claimAutoreleasedReturnValue();
    v135 = (void *)v134;
    v136 = (void *)MEMORY[0x1E0C9AAA0];
    if (v134)
      v137 = (void *)v134;
    else
      v137 = (void *)MEMORY[0x1E0C9AAA0];
    objc_storeStrong((id *)&v12->_clsIsUtility, v137);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isFavorite"));
    v138 = objc_claimAutoreleasedReturnValue();
    v139 = (void *)v138;
    if (v138)
      v140 = (void *)v138;
    else
      v140 = v136;
    objc_storeStrong((id *)&v12->_isFavorite, v140);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isVideo"));
    v141 = objc_claimAutoreleasedReturnValue();
    v142 = (void *)v141;
    if (v141)
      v143 = (void *)v141;
    else
      v143 = v136;
    objc_storeStrong((id *)&v12->_isVideo, v143);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("contentScore"));
    v144 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v145 = v144;
    if (!v144)
      v145 = v12->_clsContentScore;
    objc_storeStrong((id *)&v12->_clsContentScore, v145);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("aestheticScore"));
    v146 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v147 = v146;
    if (!v146)
      v147 = v12->_clsAestheticScore;
    objc_storeStrong((id *)&v12->_clsAestheticScore, v147);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("faceScore"));
    v148 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v149 = v148;
    if (!v148)
      v149 = v12->_clsFaceScore;
    p_clsSceneprint = (void **)&v12->_clsSceneprint;
    objc_storeStrong((id *)&v12->_clsFaceScore, v149);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sceneprint"));
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = v130;
    if (v151)
    {
      v153 = (void *)MEMORY[0x1E0CB3710];
      v154 = objc_opt_class();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sceneprint"));
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      v240 = 0;
      objc_msgSend(v153, "unarchivedObjectOfClass:fromData:error:", v154, v155, &v240);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = v240;
      objc_storeStrong((id *)&v12->_clsSceneprint, v156);

    }
    else
    {
      v157 = 0;
      v155 = *p_clsSceneprint;
      *p_clsSceneprint = 0;
    }
    v9 = v219;

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isInterestingVideo"));
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v159 = v158;
    if (!v158)
      v159 = *p_clsIsInterestingVideo;
    objc_storeStrong(p_clsIsInterestingVideo, v159);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isInterestingLivePhoto"));
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = v160;
    if (!v160)
      v161 = *p_clsIsInterestingLivePhoto;
    objc_storeStrong(p_clsIsInterestingLivePhoto, v161);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isInterestingPanorama"));
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    v163 = v162;
    if (!v162)
      v163 = *p_clsIsInterestingPanorama;
    objc_storeStrong(p_clsIsInterestingPanorama, v163);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isInterestingSDOF"));
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    v165 = v164;
    if (!v164)
      v165 = *p_clsIsInterestingSDOF;
    objc_storeStrong(p_clsIsInterestingSDOF, v165);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isInterestingHDR"));
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = v166;
    if (!v166)
      v167 = *p_clsIsInterestingHDR;
    objc_storeStrong(p_clsIsInterestingHDR, v167);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("hasInterestingAudioClassification"));
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = v168;
    if (!v168)
      v169 = *p_clsHasInterestingAudioClassification;
    objc_storeStrong(p_clsHasInterestingAudioClassification, v169);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("hasCustomPlaybackVariation"));
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = v170;
    if (!v170)
      v171 = *p_clsHasCustomPlaybackVariation;
    objc_storeStrong(p_clsHasCustomPlaybackVariation, v171);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sharpnessScore"));
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    v173 = v172;
    if (!v172)
      v173 = *p_clsSharpnessScore;
    objc_storeStrong(p_clsSharpnessScore, v173);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("exposureScore"));
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    v175 = v174;
    if (!v174)
      v175 = *p_clsExposureScore;
    objc_storeStrong(p_clsExposureScore, v175);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isBlurry"));
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = v176;
    if (!v176)
      v177 = *v217;
    objc_storeStrong(v217, v177);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isInhabited"));
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = v178;
    if (!v178)
      v179 = *p_clsIsInhabited;
    objc_storeStrong(p_clsIsInhabited, v179);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("hasInterestingScenes"));
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = v180;
    if (!v180)
      v181 = *p_clsHasInterestingScenes;
    objc_storeStrong(p_clsHasInterestingScenes, v181);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("behavioralScore"));
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    v183 = v182;
    if (!v182)
      v183 = *p_clsLikabilityScore;
    objc_storeStrong(p_clsLikabilityScore, v183);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("interactionScore"));
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    v185 = v184;
    if (!v184)
      v185 = *p_clsInteractionScore;
    objc_storeStrong(p_clsInteractionScore, v185);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("highlightVisibilityScore"));
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    v187 = v186;
    if (!v186)
      v187 = *p_clsHighlightVisibilityScore;
    objc_storeStrong(p_clsHighlightVisibilityScore, v187);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("autoplaySuggestionScore"));
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    v189 = v188;
    if (!v188)
      v189 = *p_clsAutoplaySuggestionScore;
    objc_storeStrong(p_clsAutoplaySuggestionScore, v189);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isShinyGem"));
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    v191 = v190;
    if (!v190)
      v191 = *p_isShinyGem;
    objc_storeStrong(p_isShinyGem, v191);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isRegularGem"));
    v192 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v193 = v192;
    if (!v192)
      v193 = v12->_isRegularGem;
    objc_storeStrong((id *)&v12->_isRegularGem, v193);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("faceInfos"));
    v194 = (NSArray *)objc_claimAutoreleasedReturnValue();
    faceInfos = v194;
    if (!v194)
      faceInfos = v12->_faceInfos;
    objc_storeStrong((id *)&v12->_faceInfos, faceInfos);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("duration"));
    v196 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v197 = v196;
    if (!v196)
      v197 = v12->_clsDuration;
    objc_storeStrong((id *)&v12->_clsDuration, v197);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isNonMemorable"));
    v198 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v199 = v198;
    if (!v198)
      v199 = v12->_clsIsNonMemorable;
    objc_storeStrong((id *)&v12->_clsIsNonMemorable, v199);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isLoopOrBounce"));
    v200 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v201 = v200;
    if (!v200)
      v201 = v12->_clsIsLoopOrBounce;
    objc_storeStrong((id *)&v12->_clsIsLoopOrBounce, v201);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isLongExposure"));
    v202 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v203 = v202;
    if (!v202)
      v203 = v12->_clsIsLongExposure;
    objc_storeStrong((id *)&v12->_clsIsLongExposure, v203);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("gpsHorizontalAccuracy"));
    v204 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v205 = v204;
    if (!v204)
      v205 = v12->_clsGpsHorizontalAccuracy;
    objc_storeStrong((id *)&v12->_clsGpsHorizontalAccuracy, v205);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("squareCropScore"));
    v206 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v207 = v206;
    if (!v206)
      v207 = v12->_clsSquareCropScore;
    objc_storeStrong((id *)&v12->_clsSquareCropScore, v207);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isInSharedLibrary"));
    v208 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v209 = v208;
    if (!v208)
      v209 = v12->_clsIsInSharedLibrary;
    objc_storeStrong((id *)&v12->_clsIsInSharedLibrary, v209);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("iconicScore"));
    v210 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v211 = v210;
    if (!v210)
      v211 = v12->_clsIconicScore;
    objc_storeStrong((id *)&v12->_clsIconicScore, v211);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("scenes"));
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    if (v212)
    {
      v213 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v238[0] = MEMORY[0x1E0C809B0];
      v238[1] = 3221225472;
      v238[2] = __66__PGCuratorInvestigationItem_initWithUUID_itemInfo_curationModel___block_invoke;
      v238[3] = &unk_1E842B948;
      v214 = v213;
      v239 = v214;
      objc_msgSend(v212, "enumerateKeysAndObjectsUsingBlock:", v238);
      objc_storeStrong((id *)&v12->_clsSceneClassifications, v213);

    }
    v11 = v237;
  }
  v215 = v12;

  return v215;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PGCuratorInvestigationItem;
  -[PGCuratorInvestigationItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCuratorInvestigationItem cls_universalDate](self, "cls_universalDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)date
{
  void *v3;
  void *v4;
  void *v5;

  -[PGCuratorInvestigationItem cls_universalDate](self, "cls_universalDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {
    v5 = 0;
  }
  else
  {
    -[PGCuratorInvestigationItem cls_universalDate](self, "cls_universalDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (CLLocation)location
{
  void *v3;
  void *v4;
  void *v5;

  -[PGCuratorInvestigationItem clsLocation](self, "clsLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {
    v5 = 0;
  }
  else
  {
    -[PGCuratorInvestigationItem clsLocation](self, "clsLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (CLLocation *)v5;
}

- (unint64_t)clsPeopleCount
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[PGCuratorInvestigationItem clsPersonLocalIdentifiers](self, "clsPersonLocalIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
    return 0;
  -[PGCuratorInvestigationItem clsPersonLocalIdentifiers](self, "clsPersonLocalIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (NSDateComponents)cls_localDateComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D4B130];
  -[PGCuratorInvestigationItem cls_universalDate](self, "cls_universalDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCuratorInvestigationItem cls_localDate](self, "cls_localDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateComponentsWithUTCDate:localDate:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDateComponents *)v6;
}

- (double)scoreInContext:(id)a3
{
  double result;

  -[CLSCurationModel scoreWithAsset:inContext:](self->_curationModel, "scoreWithAsset:inContext:", self, a3);
  return result;
}

- (int64_t)clsViewCount
{
  NSNumber *clsViewCount;
  NSNumber *v4;

  clsViewCount = self->_clsViewCount;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  if (clsViewCount == v4)
    return 0;
  else
    return -[NSNumber integerValue](self->_clsViewCount, "integerValue");
}

- (int64_t)clsPlayCount
{
  NSNumber *clsPlayCount;
  NSNumber *v4;

  clsPlayCount = self->_clsPlayCount;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  if (clsPlayCount == v4)
    return 0;
  else
    return -[NSNumber integerValue](self->_clsPlayCount, "integerValue");
}

- (int64_t)clsShareCount
{
  NSNumber *clsShareCount;
  NSNumber *v4;

  clsShareCount = self->_clsShareCount;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  if (clsShareCount == v4)
    return 0;
  else
    return -[NSNumber integerValue](self->_clsShareCount, "integerValue");
}

- (BOOL)clsIsUtility
{
  NSNumber *clsIsUtility;
  NSNumber *v4;

  clsIsUtility = self->_clsIsUtility;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  return clsIsUtility != v4 && -[NSNumber BOOLValue](self->_clsIsUtility, "BOOLValue");
}

- (BOOL)clsIsBlurry
{
  NSNumber *clsIsBlurry;
  NSNumber *v4;

  clsIsBlurry = self->_clsIsBlurry;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  return clsIsBlurry != v4 && -[NSNumber BOOLValue](self->_clsIsBlurry, "BOOLValue");
}

- (BOOL)clsIsScreenshotOrScreenRecording
{
  NSNumber *clsIsScreenshotOrScreenRecording;
  NSNumber *v4;

  clsIsScreenshotOrScreenRecording = self->_clsIsScreenshotOrScreenRecording;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  return clsIsScreenshotOrScreenRecording != v4
      && -[NSNumber BOOLValue](self->_clsIsScreenshotOrScreenRecording, "BOOLValue");
}

- (BOOL)isFavorite
{
  NSNumber *isFavorite;
  NSNumber *v4;

  isFavorite = self->_isFavorite;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  return isFavorite != v4 && -[NSNumber BOOLValue](self->_isFavorite, "BOOLValue");
}

- (BOOL)isVideo
{
  NSNumber *isVideo;
  NSNumber *v4;

  isVideo = self->_isVideo;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  return isVideo != v4 && -[NSNumber BOOLValue](self->_isVideo, "BOOLValue");
}

- (double)clsContentScore
{
  NSNumber *clsContentScore;
  NSNumber *v4;
  double result;

  clsContentScore = self->_clsContentScore;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  if (clsContentScore == v4)
    return 0.0;
  -[NSNumber doubleValue](self->_clsContentScore, "doubleValue");
  return result;
}

- (BOOL)clsIsInterestingVideo
{
  NSNumber *clsIsInterestingVideo;
  NSNumber *v4;

  clsIsInterestingVideo = self->_clsIsInterestingVideo;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  return clsIsInterestingVideo != v4 && -[NSNumber BOOLValue](self->_clsIsInterestingVideo, "BOOLValue");
}

- (BOOL)clsIsInterestingLivePhoto
{
  NSNumber *clsIsInterestingLivePhoto;
  NSNumber *v4;

  clsIsInterestingLivePhoto = self->_clsIsInterestingLivePhoto;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  return clsIsInterestingLivePhoto != v4 && -[NSNumber BOOLValue](self->_clsIsInterestingLivePhoto, "BOOLValue");
}

- (BOOL)clsIsInterestingPanorama
{
  NSNumber *clsIsInterestingPanorama;
  NSNumber *v4;

  clsIsInterestingPanorama = self->_clsIsInterestingPanorama;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  return clsIsInterestingPanorama != v4 && -[NSNumber BOOLValue](self->_clsIsInterestingPanorama, "BOOLValue");
}

- (BOOL)clsIsInterestingSDOF
{
  NSNumber *clsIsInterestingSDOF;
  NSNumber *v4;

  clsIsInterestingSDOF = self->_clsIsInterestingSDOF;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  return clsIsInterestingSDOF != v4 && -[NSNumber BOOLValue](self->_clsIsInterestingSDOF, "BOOLValue");
}

- (BOOL)clsIsInterestingHDR
{
  NSNumber *clsIsInterestingHDR;
  NSNumber *v4;

  clsIsInterestingHDR = self->_clsIsInterestingHDR;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  return clsIsInterestingHDR != v4 && -[NSNumber BOOLValue](self->_clsIsInterestingHDR, "BOOLValue");
}

- (BOOL)clsHasInterestingAudioClassification
{
  NSNumber *clsHasInterestingAudioClassification;
  NSNumber *v4;

  clsHasInterestingAudioClassification = self->_clsHasInterestingAudioClassification;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  return clsHasInterestingAudioClassification != v4
      && -[NSNumber BOOLValue](self->_clsHasInterestingAudioClassification, "BOOLValue");
}

- (BOOL)clsHasCustomPlaybackVariation
{
  NSNumber *clsHasCustomPlaybackVariation;
  NSNumber *v4;

  clsHasCustomPlaybackVariation = self->_clsHasCustomPlaybackVariation;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  return clsHasCustomPlaybackVariation != v4 && -[NSNumber BOOLValue](self->_clsHasCustomPlaybackVariation, "BOOLValue");
}

- (double)clsSharpnessScore
{
  NSNumber *clsSharpnessScore;
  NSNumber *v4;
  double result;

  clsSharpnessScore = self->_clsSharpnessScore;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  if (clsSharpnessScore == v4)
    return 0.0;
  -[NSNumber doubleValue](self->_clsSharpnessScore, "doubleValue");
  return result;
}

- (double)clsExposureScore
{
  NSNumber *clsExposureScore;
  NSNumber *v4;
  double result;

  clsExposureScore = self->_clsExposureScore;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  if (clsExposureScore == v4)
    return 0.0;
  -[NSNumber doubleValue](self->_clsExposureScore, "doubleValue");
  return result;
}

- (double)clsAestheticScore
{
  NSNumber *clsAestheticScore;
  NSNumber *v4;
  double result;

  clsAestheticScore = self->_clsAestheticScore;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  if (clsAestheticScore == v4)
    return 0.0;
  -[NSNumber doubleValue](self->_clsAestheticScore, "doubleValue");
  return result;
}

- (BOOL)clsIsAestheticallyPrettyGood
{
  return -[CLSCurationModel isAestheticallyPrettyGoodWithAsset:](self->_curationModel, "isAestheticallyPrettyGoodWithAsset:", self);
}

- (double)clsFaceScore
{
  NSNumber *clsFaceScore;
  NSNumber *v4;
  double result;

  clsFaceScore = self->_clsFaceScore;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  if (clsFaceScore == v4)
    return 0.0;
  -[NSNumber doubleValue](self->_clsFaceScore, "doubleValue");
  return result;
}

- (BOOL)clsIsInhabited
{
  NSNumber *clsIsInhabited;
  NSNumber *v4;

  clsIsInhabited = self->_clsIsInhabited;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  return clsIsInhabited != v4 && -[NSNumber BOOLValue](self->_clsIsInhabited, "BOOLValue");
}

- (BOOL)clsAvoidIfPossibleAsKeyItemForMemories:(BOOL)a3 allowGuestAsset:(BOOL)a4 reason:(id *)a5
{
  NSNumber *clsAvoidIfPossibleForKeyItem;
  NSNumber *v7;

  clsAvoidIfPossibleForKeyItem = self->_clsAvoidIfPossibleForKeyItem;
  objc_msgSend(MEMORY[0x1E0C99E38], "null", a3, a4, a5);
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  return clsAvoidIfPossibleForKeyItem != v7 && -[NSNumber BOOLValue](self->_clsAvoidIfPossibleForKeyItem, "BOOLValue");
}

- (BOOL)clsAvoidIfPossibleAsKeyItemForMemories:(BOOL)a3 allowGuestAsset:(BOOL)a4
{
  return -[PGCuratorInvestigationItem clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:reason:](self, "clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:reason:", a3, a4, 0);
}

- (BOOL)clsHasPoorResolution
{
  NSNumber *clsHasPoorResolution;
  NSNumber *v4;

  clsHasPoorResolution = self->_clsHasPoorResolution;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  return clsHasPoorResolution != v4 && -[NSNumber BOOLValue](self->_clsHasPoorResolution, "BOOLValue");
}

- (BOOL)clsHasInterestingScenes
{
  NSNumber *clsHasInterestingScenes;
  NSNumber *v4;

  clsHasInterestingScenes = self->_clsHasInterestingScenes;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  return clsHasInterestingScenes != v4 && -[NSNumber BOOLValue](self->_clsHasInterestingScenes, "BOOLValue");
}

- (double)clsLikabilityScore
{
  NSNumber *clsLikabilityScore;
  NSNumber *v4;
  double result;

  clsLikabilityScore = self->_clsLikabilityScore;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  if (clsLikabilityScore == v4)
    return 0.0;
  -[NSNumber doubleValue](self->_clsLikabilityScore, "doubleValue");
  return result;
}

- (double)clsInteractionScore
{
  NSNumber *clsInteractionScore;
  NSNumber *v4;
  double result;

  clsInteractionScore = self->_clsInteractionScore;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  if (clsInteractionScore == v4)
    return 0.0;
  -[NSNumber doubleValue](self->_clsInteractionScore, "doubleValue");
  return result;
}

- (double)clsHighlightVisibilityScore
{
  NSNumber *clsHighlightVisibilityScore;
  NSNumber *v4;
  double result;

  clsHighlightVisibilityScore = self->_clsHighlightVisibilityScore;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  if (clsHighlightVisibilityScore == v4)
    return 0.0;
  -[NSNumber doubleValue](self->_clsHighlightVisibilityScore, "doubleValue");
  return result;
}

- (double)clsAutoplaySuggestionScore
{
  NSNumber *clsAutoplaySuggestionScore;
  NSNumber *v4;
  double result;

  clsAutoplaySuggestionScore = self->_clsAutoplaySuggestionScore;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  if (clsAutoplaySuggestionScore == v4)
    return 0.0;
  -[NSNumber doubleValue](self->_clsAutoplaySuggestionScore, "doubleValue");
  return result;
}

- (BOOL)isShinyGem
{
  NSNumber *isShinyGem;
  NSNumber *v4;

  isShinyGem = self->_isShinyGem;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  return isShinyGem != v4 && -[NSNumber BOOLValue](self->_isShinyGem, "BOOLValue");
}

- (BOOL)isRegularGem
{
  NSNumber *isRegularGem;
  NSNumber *v4;

  isRegularGem = self->_isRegularGem;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  return isRegularGem != v4 && -[NSNumber BOOLValue](self->_isRegularGem, "BOOLValue");
}

- (double)clsDuration
{
  NSNumber *clsDuration;
  NSNumber *v4;
  double result;

  clsDuration = self->_clsDuration;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  if (clsDuration == v4)
    return 0.0;
  -[NSNumber doubleValue](self->_clsDuration, "doubleValue");
  return result;
}

- (BOOL)clsIsNonMemorable
{
  NSNumber *clsIsNonMemorable;
  NSNumber *v4;

  clsIsNonMemorable = self->_clsIsNonMemorable;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  return clsIsNonMemorable != v4 && -[NSNumber BOOLValue](self->_clsIsNonMemorable, "BOOLValue");
}

- (BOOL)clsIsLoopOrBounce
{
  NSNumber *clsIsLoopOrBounce;
  NSNumber *v4;

  clsIsLoopOrBounce = self->_clsIsLoopOrBounce;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  return clsIsLoopOrBounce != v4 && -[NSNumber BOOLValue](self->_clsIsLoopOrBounce, "BOOLValue");
}

- (BOOL)clsIsLongExposure
{
  NSNumber *clsIsLongExposure;
  NSNumber *v4;

  clsIsLongExposure = self->_clsIsLongExposure;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  return clsIsLongExposure != v4 && -[NSNumber BOOLValue](self->_clsIsLongExposure, "BOOLValue");
}

- (double)clsSquareCropScore
{
  NSNumber *clsSquareCropScore;
  NSNumber *v4;
  NSNumber *v5;
  NSNumber *v6;
  double v7;
  double v8;

  clsSquareCropScore = self->_clsSquareCropScore;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  if (clsSquareCropScore == v4)
    return 0.0;
  v5 = self->_clsSquareCropScore;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v8 = 0.5;
  }
  else
  {
    -[NSNumber doubleValue](self->_clsSquareCropScore, "doubleValue");
    v8 = v7;
  }

  return v8;
}

- (BOOL)clsIsInSharedLibrary
{
  NSNumber *clsIsInSharedLibrary;
  NSNumber *v4;

  clsIsInSharedLibrary = self->_clsIsInSharedLibrary;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  return clsIsInSharedLibrary != v4 && -[NSNumber BOOLValue](self->_clsIsInSharedLibrary, "BOOLValue");
}

- (double)clsIconicScore
{
  NSNumber *clsIconicScore;
  NSNumber *v4;
  double result;

  clsIconicScore = self->_clsIconicScore;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  if (clsIconicScore == v4)
    return 0.0;
  -[NSNumber doubleValue](self->_clsIconicScore, "doubleValue");
  return result;
}

- (unint64_t)clsSimilarityModelVersion
{
  void *v2;
  unint64_t v3;

  -[CLSCurationModel sceneModel](self->_curationModel, "sceneModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "version");

  return v3;
}

- (CLLocationCoordinate2D)pl_coordinate
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CLLocationCoordinate2D result;

  -[PGCuratorInvestigationItem location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PGCuratorInvestigationItem location](self, "location");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinate");
    v6 = v5;
    v8 = v7;

  }
  else
  {
    v6 = *MEMORY[0x1E0C9E500];
    v8 = *(double *)(MEMORY[0x1E0C9E500] + 8);
  }
  v9 = v6;
  v10 = v8;
  result.longitude = v10;
  result.latitude = v9;
  return result;
}

- (double)pl_gpsHorizontalAccuracy
{
  NSNumber *clsGpsHorizontalAccuracy;
  NSNumber *v4;
  double result;

  clsGpsHorizontalAccuracy = self->_clsGpsHorizontalAccuracy;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  if (clsGpsHorizontalAccuracy == v4)
    return 0.0;
  -[NSNumber doubleValue](self->_clsGpsHorizontalAccuracy, "doubleValue");
  return result;
}

- (NSString)clsIdentifier
{
  return self->_clsIdentifier;
}

- (NSDate)cls_universalDate
{
  return self->_cls_universalDate;
}

- (NSDate)cls_localDate
{
  return self->_cls_localDate;
}

- (CLLocation)clsLocation
{
  return self->_clsLocation;
}

- (NSArray)clsPersonLocalIdentifiers
{
  return self->_clsPersonLocalIdentifiers;
}

- (NSArray)clsConsolidatedPersonLocalIdentifiers
{
  return self->_clsConsolidatedPersonLocalIdentifiers;
}

- (NSArray)clsPetLocalIdentifiers
{
  return self->_clsPetLocalIdentifiers;
}

- (NSArray)clsPersonAndPetLocalIdentifiers
{
  return self->_clsPersonAndPetLocalIdentifiers;
}

- (NSSet)clsSceneClassifications
{
  return self->_clsSceneClassifications;
}

- (NSSet)clsVisualLookupSceneClassifications
{
  return self->_clsVisualLookupSceneClassifications;
}

- (VNSceneprint)clsSceneprint
{
  return self->_clsSceneprint;
}

- (NSArray)clsUnprefetchedPersonLocalIdentifiers
{
  return self->_clsUnprefetchedPersonLocalIdentifiers;
}

- (NSArray)faceInfos
{
  return (NSArray *)objc_getProperty(self, a2, 416, 1);
}

- (CLSCurationModel)curationModel
{
  return (CLSCurationModel *)objc_getProperty(self, a2, 424, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curationModel, 0);
  objc_storeStrong((id *)&self->_faceInfos, 0);
  objc_storeStrong((id *)&self->_clsUnprefetchedPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_clsSceneprint, 0);
  objc_storeStrong((id *)&self->_clsVisualLookupSceneClassifications, 0);
  objc_storeStrong((id *)&self->_clsSceneClassifications, 0);
  objc_storeStrong((id *)&self->_clsPersonAndPetLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_clsPetLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_clsConsolidatedPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_clsPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_clsLocation, 0);
  objc_storeStrong((id *)&self->_cls_localDate, 0);
  objc_storeStrong((id *)&self->_cls_universalDate, 0);
  objc_storeStrong((id *)&self->_clsIdentifier, 0);
  objc_storeStrong((id *)&self->_clsIconicScore, 0);
  objc_storeStrong((id *)&self->_clsIsInSharedLibrary, 0);
  objc_storeStrong((id *)&self->_clsSquareCropScore, 0);
  objc_storeStrong((id *)&self->_clsGpsHorizontalAccuracy, 0);
  objc_storeStrong((id *)&self->_clsIsLongExposure, 0);
  objc_storeStrong((id *)&self->_clsIsLoopOrBounce, 0);
  objc_storeStrong((id *)&self->_clsIsNonMemorable, 0);
  objc_storeStrong((id *)&self->_clsDuration, 0);
  objc_storeStrong((id *)&self->_isRegularGem, 0);
  objc_storeStrong((id *)&self->_isShinyGem, 0);
  objc_storeStrong((id *)&self->_clsAutoplaySuggestionScore, 0);
  objc_storeStrong((id *)&self->_clsHighlightVisibilityScore, 0);
  objc_storeStrong((id *)&self->_clsInteractionScore, 0);
  objc_storeStrong((id *)&self->_clsLikabilityScore, 0);
  objc_storeStrong((id *)&self->_clsHasInterestingScenes, 0);
  objc_storeStrong((id *)&self->_clsHasPoorResolution, 0);
  objc_storeStrong((id *)&self->_clsAvoidIfPossibleForKeyItem, 0);
  objc_storeStrong((id *)&self->_clsIsInhabited, 0);
  objc_storeStrong((id *)&self->_clsFaceScore, 0);
  objc_storeStrong((id *)&self->_clsIsAestheticallyPrettyGood, 0);
  objc_storeStrong((id *)&self->_clsAestheticScore, 0);
  objc_storeStrong((id *)&self->_clsExposureScore, 0);
  objc_storeStrong((id *)&self->_clsSharpnessScore, 0);
  objc_storeStrong((id *)&self->_clsHasCustomPlaybackVariation, 0);
  objc_storeStrong((id *)&self->_clsHasInterestingAudioClassification, 0);
  objc_storeStrong((id *)&self->_clsIsInterestingHDR, 0);
  objc_storeStrong((id *)&self->_clsIsInterestingSDOF, 0);
  objc_storeStrong((id *)&self->_clsIsInterestingPanorama, 0);
  objc_storeStrong((id *)&self->_clsIsInterestingLivePhoto, 0);
  objc_storeStrong((id *)&self->_clsIsInterestingVideo, 0);
  objc_storeStrong((id *)&self->_clsContentScore, 0);
  objc_storeStrong((id *)&self->_isVideo, 0);
  objc_storeStrong((id *)&self->_isFavorite, 0);
  objc_storeStrong((id *)&self->_clsIsScreenshotOrScreenRecording, 0);
  objc_storeStrong((id *)&self->_clsIsBlurry, 0);
  objc_storeStrong((id *)&self->_clsIsUtility, 0);
  objc_storeStrong((id *)&self->_clsShareCount, 0);
  objc_storeStrong((id *)&self->_clsPlayCount, 0);
  objc_storeStrong((id *)&self->_clsViewCount, 0);
}

void __66__PGCuratorInvestigationItem_initWithUUID_itemInfo_curationModel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "rangeOfString:", CFSTR("("));
  v8 = objc_msgSend(v5, "rangeOfString:", CFSTR(")"));
  if (v7 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v5, "substringWithRange:", v7 + 1, v8 + ~v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v11, "scanUnsignedLongLong:", &v15);
    v12 = objc_alloc(MEMORY[0x1E0CD1750]);
    v13 = v15;
    objc_msgSend(v6, "doubleValue");
    v14 = (void *)objc_msgSend(v12, "initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:", v13, 0);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);

  }
}

+ (id)itemWithUUID:(id)a3 itemInfo:(id)a4 curationModel:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUUID:itemInfo:curationModel:", v10, v9, v8);

  return v11;
}

@end
