@implementation PXStoryConcreteStyle

- (PXStoryConcreteStyle)initWithStoryConfiguration:(id)a3
{
  uint64_t v4;

  LOBYTE(v4) = 0;
  return -[PXStoryConcreteStyle initWithCustomColorGradeKind:originalColorGradeCategory:songResource:cueSource:autoEditDecisionList:styleOptions:isCustomized:storyConfiguration:](self, "initWithCustomColorGradeKind:originalColorGradeCategory:songResource:cueSource:autoEditDecisionList:styleOptions:isCustomized:storyConfiguration:", 0, 0, 0, 0, 0, 0, 0, v4, a3);
}

- (PXStoryConcreteStyle)initWithCustomColorGradeKind:(int64_t)a3 originalColorGradeCategory:(id)a4 songResource:(id)a5 cueSource:(id)a6 autoEditDecisionList:(id)a7 styleOptions:(id)a8 isCustomized:(BOOL)a9 storyConfiguration:(id)a10
{
  id v16;
  id v17;
  PXStoryConcreteStyle *v18;
  PXStoryConcreteStyle *v19;
  uint64_t v20;
  PFStoryAutoEditConfiguration *autoEditConfiguration;
  id *p_autoEditDecisionList;
  void *v23;
  void *v24;
  uint64_t v25;
  Float64 v26;
  uint64_t v27;
  PXStoryConcreteAutoEditDecisionList *v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  id v32;
  unint64_t v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void **v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  NSArray *allowedKeyAssetClipCompositionsInPortrait;
  uint64_t v48;
  NSArray *allowedKeyAssetClipCompositionsInLandscape;
  NSArray *v50;
  NSArray *v51;
  void (**v52)(void *, _QWORD);
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  void *v59;
  uint64_t v60;
  NSArray *allowedClipCompositionsInPortrait;
  uint64_t v62;
  NSArray *allowedClipCompositionsInLandscape;
  void *v64;
  uint64_t v65;
  NSArray *allowedClipCompositionsInSquareView;
  NSArray *v68;
  SEL v69;
  uint64_t v70;
  id v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD aBlock[4];
  PXStoryConcreteStyle *v81;
  id v82;
  id v83;
  uint64_t v84;
  _QWORD v85[4];
  id v86;
  uint64_t v87;
  _QWORD v88[4];
  id v89;
  uint64_t v90;
  CMTime v91;
  _OWORD v92[5];
  CMTime v93;
  objc_super v94;
  _BYTE v95[128];
  void *v96;
  void *v97;
  void *v98;
  _QWORD v99[3];

  v69 = a2;
  v99[1] = *MEMORY[0x1E0C80C00];
  v16 = a4;
  v75 = a5;
  v74 = a6;
  v73 = a7;
  v17 = a10;
  v94.receiver = self;
  v94.super_class = (Class)PXStoryConcreteStyle;
  v18 = -[PXStoryConcreteStyle init](&v94, sel_init);
  v19 = v18;
  if (!v18)
    goto LABEL_33;
  v71 = v16;
  v18->_customColorGradeKind = a3;
  objc_storeStrong((id *)&v18->_originalColorGradeCategory, a4);
  objc_storeStrong((id *)&v19->_songResource, a5);
  objc_storeStrong((id *)&v19->_cueSource, a6);
  v19->_styleOptions = ($E177156E84AC54117B07FF8A1BF86624)a8;
  v19->_isCustomized = a9;
  objc_storeWeak((id *)&v19->_storyConfiguration, v17);
  +[PXStoryAutoEditConfigurationFactory autoEditConfiguration](PXStoryAutoEditConfigurationFactory, "autoEditConfiguration");
  v20 = objc_claimAutoreleasedReturnValue();
  autoEditConfiguration = v19->_autoEditConfiguration;
  v19->_autoEditConfiguration = (PFStoryAutoEditConfiguration *)v20;

  p_autoEditDecisionList = (id *)&v19->_autoEditDecisionList;
  objc_storeStrong((id *)&v19->_autoEditDecisionList, a7);
  if (!v19->_autoEditDecisionList)
  {
    objc_msgSend(v75, "px_storyResourceSongAsset");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
      v25 = objc_msgSend(v23, "pace");
    else
      v25 = 2;
    memset(&v93, 0, sizeof(v93));
    -[PFStoryAutoEditConfiguration outroDurationForSongPace:](v19->_autoEditConfiguration, "outroDurationForSongPace:", v25, v69);
    CMTimeMakeWithSeconds(&v93, v26, 600);
    if (v17)
      v27 = objc_msgSend(v17, "disableNUp") ^ 1;
    else
      v27 = 1;
    v28 = [PXStoryConcreteAutoEditDecisionList alloc];
    v29 = *(_OWORD *)(MEMORY[0x1E0D759B0] + 48);
    v92[2] = *(_OWORD *)(MEMORY[0x1E0D759B0] + 32);
    v92[3] = v29;
    v92[4] = *(_OWORD *)(MEMORY[0x1E0D759B0] + 64);
    v30 = *(_OWORD *)(MEMORY[0x1E0D759B0] + 16);
    v92[0] = *MEMORY[0x1E0D759B0];
    v92[1] = v30;
    v91 = v93;
    v31 = -[PXStoryConcreteAutoEditDecisionList initWithColorGradeCategory:song:clipCatalog:constrainedOverallDurationInfo:outroDuration:allowsNUp:](v28, "initWithColorGradeCategory:song:clipCatalog:constrainedOverallDurationInfo:outroDuration:allowsNUp:", v16, v24, 0, v92, &v91, v27);
    v32 = *p_autoEditDecisionList;
    *p_autoEditDecisionList = (id)v31;

  }
  v33 = 0x1E0C99000uLL;
  v34 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v35 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  if (objc_msgSend(v17, "isLetterboxingAllowed"))
  {
    +[PXStoryClipCompositionFactory defaultOneUpCompositions](PXStoryClipCompositionFactory, "defaultOneUpCompositions");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v99[0] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance", v69);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v38;
  if (objc_msgSend(v17, "otherAssetsAspectRatioOverride"))
  {
    OneUpCompositionForAspectRatio(objc_msgSend(v17, "otherAssetsAspectRatioOverride"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v98, 1);
    v40 = objc_claimAutoreleasedReturnValue();

    v38 = v72;
    v36 = (void *)v40;
  }
  if (objc_msgSend(v17, "keyAssetAspectRatioOverride"))
  {
    OneUpCompositionForAspectRatio(objc_msgSend(v17, "keyAssetAspectRatioOverride"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v41;
    v42 = (void *)MEMORY[0x1E0C99D20];
    v43 = &v97;
  }
  else
  {
    if (objc_msgSend(v38, "allowNonFillingCompositionsForKeyAsset")
      && objc_msgSend(v17, "isLetterboxingAllowed"))
    {
      if (objc_msgSend(v38, "limitKeyAssetAspectRatioToFeedCard"))
      {
        v44 = MEMORY[0x1E0C809B0];
        v88[0] = MEMORY[0x1E0C809B0];
        v88[1] = 3221225472;
        v88[2] = __169__PXStoryConcreteStyle_initWithCustomColorGradeKind_originalColorGradeCategory_songResource_cueSource_autoEditDecisionList_styleOptions_isCustomized_storyConfiguration___block_invoke_2;
        v88[3] = &unk_1E5141E60;
        v45 = v38;
        v89 = v45;
        v90 = 0x3F50624DD2F1A9FCLL;
        __169__PXStoryConcreteStyle_initWithCustomColorGradeKind_originalColorGradeCategory_songResource_cueSource_autoEditDecisionList_styleOptions_isCustomized_storyConfiguration___block_invoke(v88);
        v46 = objc_claimAutoreleasedReturnValue();
        allowedKeyAssetClipCompositionsInPortrait = v19->_allowedKeyAssetClipCompositionsInPortrait;
        v19->_allowedKeyAssetClipCompositionsInPortrait = (NSArray *)v46;

        v85[0] = v44;
        v85[1] = 3221225472;
        v85[2] = __169__PXStoryConcreteStyle_initWithCustomColorGradeKind_originalColorGradeCategory_songResource_cueSource_autoEditDecisionList_styleOptions_isCustomized_storyConfiguration___block_invoke_3;
        v85[3] = &unk_1E5141E60;
        v86 = v45;
        v87 = 0x3F50624DD2F1A9FCLL;
        v33 = 0x1E0C99000;
        __169__PXStoryConcreteStyle_initWithCustomColorGradeKind_originalColorGradeCategory_songResource_cueSource_autoEditDecisionList_styleOptions_isCustomized_storyConfiguration___block_invoke(v85);
        v48 = objc_claimAutoreleasedReturnValue();
        allowedKeyAssetClipCompositionsInLandscape = v19->_allowedKeyAssetClipCompositionsInLandscape;
        v19->_allowedKeyAssetClipCompositionsInLandscape = (NSArray *)v48;

        v41 = v89;
      }
      else
      {
        objc_storeStrong((id *)&v19->_allowedKeyAssetClipCompositionsInLandscape, v36);
        v68 = v36;
        v41 = v19->_allowedKeyAssetClipCompositionsInPortrait;
        v19->_allowedKeyAssetClipCompositionsInPortrait = v68;
      }
      goto LABEL_23;
    }
    +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v41;
    v42 = (void *)MEMORY[0x1E0C99D20];
    v43 = &v96;
  }
  objc_msgSend(v42, "arrayWithObjects:count:", v43, 1);
  v50 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v51 = v19->_allowedKeyAssetClipCompositionsInLandscape;
  v19->_allowedKeyAssetClipCompositionsInLandscape = v50;

  objc_storeStrong((id *)&v19->_allowedKeyAssetClipCompositionsInPortrait, v50);
LABEL_23:

  objc_msgSend(v34, "addObjectsFromArray:", v36);
  objc_msgSend(v35, "addObjectsFromArray:", v36);
  if (objc_msgSend(*p_autoEditDecisionList, "allowsNUp"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __169__PXStoryConcreteStyle_initWithCustomColorGradeKind_originalColorGradeCategory_songResource_cueSource_autoEditDecisionList_styleOptions_isCustomized_storyConfiguration___block_invoke_4;
    aBlock[3] = &unk_1E5141E88;
    v84 = v70;
    v81 = v19;
    v82 = v35;
    v83 = v34;
    v52 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    +[PXStoryClipCompositionFactory defaultTwoUpCompositions](PXStoryClipCompositionFactory, "defaultTwoUpCompositions");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v76, v95, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v77;
      do
      {
        for (i = 0; i != v55; ++i)
        {
          if (*(_QWORD *)v77 != v56)
            objc_enumerationMutation(v53);
          v52[2](v52, *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * i));
        }
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v76, v95, 16);
      }
      while (v55);
    }

    +[PXStoryClipCompositionFactory threeUpVerticalThirdsComposition](PXStoryClipCompositionFactory, "threeUpVerticalThirdsComposition");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void *, void *))v52)[2](v52, v58);

    +[PXStoryClipCompositionFactory threeUpHorizontalThirdsComposition](PXStoryClipCompositionFactory, "threeUpHorizontalThirdsComposition");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void *, void *))v52)[2](v52, v59);

    v33 = 0x1E0C99000uLL;
  }
  objc_msgSend(v34, "array");
  v60 = objc_claimAutoreleasedReturnValue();
  allowedClipCompositionsInPortrait = v19->_allowedClipCompositionsInPortrait;
  v19->_allowedClipCompositionsInPortrait = (NSArray *)v60;

  objc_msgSend(v35, "array");
  v62 = objc_claimAutoreleasedReturnValue();
  allowedClipCompositionsInLandscape = v19->_allowedClipCompositionsInLandscape;
  v19->_allowedClipCompositionsInLandscape = (NSArray *)v62;

  v64 = (void *)objc_msgSend(objc_alloc(*(Class *)(v33 + 3600)), "initWithArray:", v19->_allowedClipCompositionsInPortrait);
  objc_msgSend(v64, "addObjectsFromArray:", v19->_allowedClipCompositionsInLandscape);
  objc_msgSend(v64, "array");
  v65 = objc_claimAutoreleasedReturnValue();
  allowedClipCompositionsInSquareView = v19->_allowedClipCompositionsInSquareView;
  v19->_allowedClipCompositionsInSquareView = (NSArray *)v65;

  v16 = v71;
LABEL_33:

  return v19;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[PXStoryConcreteStyle originalColorGradeCategory](self, "originalColorGradeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteStyle customColorGradeKind](self, "customColorGradeKind");
  PFStoryColorGradeKindToString();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = CFSTR("-");
  -[PXStoryConcreteStyle songResource](self, "songResource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "px_storyResourceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; originalColorGradeCategory: %@; customColorGradeKind %@; songID: %@>"),
                  v4,
                  self,
                  v5,
                  v8,
                  v10);

  return v11;
}

- (Class)timelineStyleClass
{
  return (Class)objc_opt_class();
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)outroDuration
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v6;

  -[PXStoryConcreteStyle autoEditDecisionList](self, "autoEditDecisionList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "outroDuration");
    v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (id)createRandomNumberGenerators
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75238]), "initWithSeed:", 0);
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)timelineStyleWithSpec:(id)a3 resourcesDataSource:(id)a4 randomNumberGenerators:(id)a5 errorReporter:(id)a6
{
  id v10;
  id v11;
  void *v12;
  double v13;
  long double v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  id v19;
  void *v20;
  char v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  PFStoryAutoEditConfiguration *autoEditConfiguration;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  _OWORD v44[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v41 = a6;
  v40 = a5;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v10;
  objc_msgSend(v10, "viewportSize");
  PXSizeGetAspectRatio();
  v14 = v13;
  v15 = 16;
  if (v13 < 1.0)
    v15 = 8;
  v39 = *(id *)((char *)&self->super.isa + v15);
  v16 = objc_msgSend(v12, "clipCompositionShowcaseMode");
  if (!objc_msgSend(v12, "allowsDefaultBehaviorForShowcaseMode:", v16))
    goto LABEL_10;
  log(v14);
  v17 = PXFloatEqualToFloatWithTolerance();
  v18 = 24;
  if (v14 > 1.0)
    v18 = 32;
  if (v17)
    v18 = 40;
  v19 = *(id *)((char *)&self->super.isa + v18);
  if (v19)
  {
    v20 = v19;
    v21 = 0;
  }
  else
  {
LABEL_10:
    v22 = objc_msgSend(v12, "allowsRandomFallbackForShowcaseMode:", v16);
    v21 = v22;
    if (v22
      && (objc_msgSend(v12, "clipCompositionFallback"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "possibleClipCompositionsForFallback:", v23),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v23,
          v20))
    {
      v21 = 1;
    }
    else
    {
      +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v42 = v12;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v45 = 0u;
  if (v11)
    objc_msgSend(v11, "overallDurationInfo");
  v36 = objc_alloc(-[PXStoryConcreteStyle timelineStyleClass](self, "timelineStyleClass"));
  -[PXStoryConcreteStyle songResource](self, "songResource");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "px_storyResourceSongAsset");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteStyle cueSource](self, "cueSource");
  v38 = v11;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteStyle autoEditDecisionList](self, "autoEditDecisionList");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  autoEditConfiguration = self->_autoEditConfiguration;
  v29 = -[PXStoryConcreteStyle styleOptions](self, "styleOptions");
  v31 = v30;
  -[PXStoryConcreteStyle storyConfiguration](self, "storyConfiguration");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v47;
  v44[3] = v48;
  v44[4] = v49;
  v44[0] = v45;
  v44[1] = v46;
  LOBYTE(v35) = v21;
  v33 = (void *)objc_msgSend(v36, "initWithSpec:audioAsset:cueSource:overallDurationInfo:autoEditDecisionList:autoEditConfiguration:allowedKeyAssetClipCompositions:allowedClipCompositions:randomNumberGenerators:errorReporter:allowsIncompleteTimelines:styleOptions:storyConfiguration:", v43, v25, v26, v44, v27, autoEditConfiguration, v39, v20, v40, v41, v35, v29, v31, v32);

  return v33;
}

- (NSString)originalColorGradeCategory
{
  return self->_originalColorGradeCategory;
}

- (int64_t)customColorGradeKind
{
  return self->_customColorGradeKind;
}

- (PXStorySongResource)songResource
{
  return self->_songResource;
}

- (BOOL)isCustomized
{
  return self->_isCustomized;
}

- (PXAudioCueSource)cueSource
{
  return self->_cueSource;
}

- (PXStoryAutoEditDecisionList)autoEditDecisionList
{
  return self->_autoEditDecisionList;
}

- ($1A23BB056C565A410801C90FE7234890)styleOptions
{
  uint64_t v2;
  unint64_t croppingOptions;
  $1A23BB056C565A410801C90FE7234890 result;

  v2 = *(_QWORD *)&self->_styleOptions.preferStillKeySegment;
  croppingOptions = self->_styleOptions.croppingOptions;
  result.var1 = v2;
  result.var0 = croppingOptions;
  return result;
}

- (PXStoryConfiguration)storyConfiguration
{
  return (PXStoryConfiguration *)objc_loadWeakRetained((id *)&self->_storyConfiguration);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_storyConfiguration);
  objc_storeStrong((id *)&self->_autoEditDecisionList, 0);
  objc_storeStrong((id *)&self->_cueSource, 0);
  objc_storeStrong((id *)&self->_songResource, 0);
  objc_storeStrong((id *)&self->_originalColorGradeCategory, 0);
  objc_storeStrong((id *)&self->_autoEditConfiguration, 0);
  objc_storeStrong((id *)&self->_allowedClipCompositionsInSquareView, 0);
  objc_storeStrong((id *)&self->_allowedClipCompositionsInLandscape, 0);
  objc_storeStrong((id *)&self->_allowedClipCompositionsInPortrait, 0);
  objc_storeStrong((id *)&self->_allowedKeyAssetClipCompositionsInLandscape, 0);
  objc_storeStrong((id *)&self->_allowedKeyAssetClipCompositionsInPortrait, 0);
}

BOOL __169__PXStoryConcreteStyle_initWithCustomColorGradeKind_originalColorGradeCategory_songResource_cueSource_autoEditDecisionList_styleOptions_isCustomized_storyConfiguration___block_invoke_2(uint64_t a1, double a2)
{
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "feedCardPortraitAspectRatio");
  return v4 + *(double *)(a1 + 40) >= a2;
}

id __169__PXStoryConcreteStyle_initWithCustomColorGradeKind_originalColorGradeCategory_songResource_cueSource_autoEditDecisionList_styleOptions_isCustomized_storyConfiguration___block_invoke(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = (objc_class *)MEMORY[0x1E0C99DE8];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  +[PXStoryClipCompositionFactory oneUpCompositionsWithAspectRatioPassingTest:](PXStoryClipCompositionFactory, "oneUpCompositionsWithAspectRatioPassingTest:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObjectsFromArray:", v5);
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

BOOL __169__PXStoryConcreteStyle_initWithCustomColorGradeKind_originalColorGradeCategory_songResource_cueSource_autoEditDecisionList_styleOptions_isCustomized_storyConfiguration___block_invoke_3(uint64_t a1, double a2)
{
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "feedCardLandscapeAspectRatio");
  return v4 - *(double *)(a1 + 40) <= a2;
}

void __169__PXStoryConcreteStyle_initWithCustomColorGradeKind_originalColorGradeCategory_songResource_cueSource_autoEditDecisionList_styleOptions_isCustomized_storyConfiguration___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id *v6;
  id v7;

  v7 = a2;
  v3 = objc_msgSend(v7, "mainDividerAxis");
  if (v3 == 1)
  {
    v6 = (id *)(a1 + 40);
LABEL_7:
    objc_msgSend(*v6, "addObject:", v7);
    v4 = v7;
    goto LABEL_8;
  }
  if (v3 == 2)
  {
    v6 = (id *)(a1 + 48);
    goto LABEL_7;
  }
  v4 = v7;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PXStoryConcreteStyle.m"), 282, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
LABEL_8:

}

+ (id)bestClipCompositionFromClipCompositions:(id)a3 forKeyAsset:(id)a4 contentInfo:(id *)a5 playbackStyle:(int64_t)a6 spec:(id)a7 croppingContext:(id)a8 options:(unint64_t)a9 loggingOptions:(unint64_t)a10
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double x;
  double v41;
  double y;
  double v43;
  double width;
  double v45;
  double height;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  double v59;
  CGSize v60;
  double v61;
  double v62;
  double v63;
  double v64;
  id v65;
  NSObject *v66;
  void *v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  NSObject *v71;
  uint64_t v72;
  NSObject *v73;
  id v74;
  void *v75;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  id v81;
  id obj;
  double v85;
  double v86;
  double v87;
  id v90;
  double v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _QWORD v96[4];
  uint8_t v97[4];
  double v98;
  __int16 v99;
  double v100;
  __int16 v101;
  _BOOL4 v102;
  _BYTE v103[128];
  uint8_t buf[40];
  uint64_t v105;
  CGSize v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;

  v105 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a7;
  v90 = a8;
  if (!objc_msgSend(v13, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXStoryConcreteStyle.m"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("allowedClipCompositions.count > 0"));

  }
  objc_msgSend(v15, "viewportSize");
  v17 = v16;
  v19 = v18;
  objc_msgSend(v15, "nUpDividerWidth");
  v21 = v20;
  objc_msgSend(v14, "aspectRatio");
  v96[0] = v17;
  v96[1] = v19;
  v96[2] = v21;
  v96[3] = v22;
  objc_msgSend(v15, "safeAreaInsets");
  objc_msgSend(v15, "viewportSize");
  PXSizeGetArea();
  v87 = v23;
  v86 = (double)(unint64_t)objc_msgSend(v14, "pixelWidth");
  v85 = (double)(unint64_t)objc_msgSend(v14, "pixelHeight");
  if ((a10 & 1) != 0)
  {
    PLStoryGetLog();
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "viewportSize");
      NSStringFromCGSize(v106);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v110.origin.x = 0.0;
      v110.origin.y = 0.0;
      v110.size.height = v85;
      v110.size.width = v86;
      NSStringFromCGRect(v110);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v79;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v87;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v80;
      _os_log_impl(&dword_1A6789000, v78, OS_LOG_TYPE_DEFAULT, "viewportSize: %@, viewportArea: %f, assetRect: %@", buf, 0x20u);

    }
  }
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v24 = v13;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v92, v103, 16);
  if (!v25)
  {

    goto LABEL_42;
  }
  v26 = v25;
  v81 = v15;
  v27 = 0;
  v28 = *(_QWORD *)v93;
  v91 = -1.79769313e308;
  obj = v24;
  do
  {
    v29 = 0;
    do
    {
      if (*(_QWORD *)v93 != v28)
        objc_enumerationMutation(obj);
      v30 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v29);
      if ((a10 & 1) != 0)
      {
        PLStoryGetLog();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v30;
          _os_log_impl(&dword_1A6789000, v66, OS_LOG_TYPE_DEFAULT, "clipComposition: %@", buf, 0xCu);
        }

      }
      if (objc_msgSend(v30, "numberOfClips") != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXStoryConcreteStyle.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clipComposition.numberOfClips == 1"));

      }
      memset(buf, 0, 32);
      objc_msgSend(v30, "getClipFrames:forContext:", buf, v96);
      PXEdgeInsetsInsetRect();
      PXRectNormalize();
      PXStoryDisplayAssetSuggestedCrop(v14, a5, a6, v90, a9, *(double *)&buf[16], *(double *)&buf[24]);
      PXRectNormalize();
      PXRectFlippedVertically();
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;
      objc_msgSend(v14, "acceptableCropRect");
      x = v39;
      y = v41;
      width = v43;
      height = v45;
      objc_msgSend(v14, "faceAreaRect");
      if (!CGRectIsEmpty(v107))
      {
        objc_msgSend(v14, "faceAreaRect");
        v111.origin.x = v47;
        v111.origin.y = v48;
        v111.size.width = v49;
        v111.size.height = v50;
        v108.origin.x = x;
        v108.origin.y = y;
        v108.size.width = width;
        v108.size.height = height;
        v109 = CGRectIntersection(v108, v111);
        x = v109.origin.x;
        y = v109.origin.y;
        width = v109.size.width;
        height = v109.size.height;
      }
      v51 = (void *)MEMORY[0x1E0D750F0];
      v52 = objc_msgSend(v14, "pixelWidth");
      v53 = objc_msgSend(v14, "pixelHeight");
      objc_msgSend(v14, "preferredCropRect");
      objc_msgSend(v51, "scoreForCropRect:sourcePixelWidth:sourcePixelHeight:sourceEssentialAreaRect:sourceSecondaryEssentialAreaRect:", v52, v53, v32, v34, v36, v38, x, y, width, height, v54, v55, v56, v57);
      v59 = v58;
      if ((a10 & 1) != 0)
      {
        PLStoryGetLog();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v97 = 134217984;
          v98 = v59;
          _os_log_impl(&dword_1A6789000, v68, OS_LOG_TYPE_DEFAULT, "cropScore: %f", v97, 0xCu);
        }

      }
      v60 = *(CGSize *)&buf[16];
      PXSizeGetArea();
      v62 = v61 / v87;
      if ((a10 & 1) != 0)
      {
        PLStoryGetLog();
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromCGSize(v60);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v97 = 138412802;
          v98 = *(double *)&v70;
          v99 = 2048;
          v100 = v62;
          v101 = 1024;
          v102 = v59 >= 0.400000006;
          _os_log_impl(&dword_1A6789000, v69, OS_LOG_TYPE_DEFAULT, "clipSize: %@, viewportFillingFraction: %f, isAcceptableCrop: %i", v97, 0x1Cu);

        }
      }
      if (v59 >= 0.400000006)
      {
        v63 = v62 + 10.0;
        if ((a10 & 1) == 0)
          goto LABEL_22;
LABEL_35:
        PLStoryGetLog();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v97 = 134217984;
          v98 = v63;
          _os_log_impl(&dword_1A6789000, v71, OS_LOG_TYPE_DEFAULT, "score: %f", v97, 0xCu);
        }

        goto LABEL_22;
      }
      PXSizeGetAspectRatio();
      if (v64 < 1.0)
        v64 = 1.0 / v64;
      v63 = 0.0 - v64;
      if ((a10 & 1) != 0)
        goto LABEL_35;
LABEL_22:
      if (v63 > v91)
      {
        v65 = v30;

        v91 = v63;
        v27 = v65;
      }
      ++v29;
    }
    while (v26 != v29);
    v24 = obj;
    v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v103, 16);
    v26 = v72;
  }
  while (v72);

  v15 = v81;
  if (!v27)
  {
LABEL_42:
    PLStoryGetLog();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v73, OS_LOG_TYPE_ERROR, "failed to find best clip composition", buf, 2u);
    }

    v74 = (id)objc_msgSend(a1, "bestClipCompositionFromClipCompositions:forKeyAsset:contentInfo:playbackStyle:spec:croppingContext:options:loggingOptions:", v24, v14, a5, a6, v15, v90, a9, 1);
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXStoryConcreteStyle.m"), 210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bestClipComposition != nil"));

    v27 = 0;
  }

  return v27;
}

@end
