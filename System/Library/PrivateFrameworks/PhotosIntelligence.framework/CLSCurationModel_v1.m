@implementation CLSCurationModel_v1

- (CLSCurationModel_v1)initWithCurationModelSpecification:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CLSCurationModel_v1;
  v5 = -[CLSCurationModel_v1 init](&v30, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "sceneAnalysisVersion");
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BE726D8]), "initWithSceneAnalysisVersion:", v6);
    v8 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE726B0]), "initWithSceneAnalysisVersion:", v6);
    v10 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE726A8]), "initWithMediaAnalysisVersion:", objc_msgSend(v4, "mediaAnalysisVersion"));
    v12 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BE72668]), "initWithSceneAnalysisVersion:", v6);
    v14 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BE726A0]), "initWithSceneAnalysisVersion:", v6);
    v16 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BE72688]), "initWithFaceAnalysisVersion:", objc_msgSend(v4, "faceAnalysisVersion"));
    v18 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v17;

    *(_OWORD *)(v5 + 56) = xmmword_243FA9F50;
    objc_msgSend(*((id *)v5 + 1), "confidenceThresholdBySceneIdentifierForSceneNames:withThresholdType:", &unk_25149A760, 1);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)*((_QWORD *)v5 + 9);
    *((_QWORD *)v5 + 9) = v19;

    objc_msgSend(*((id *)v5 + 1), "confidenceThresholdBySceneIdentifierForSceneNames:withThresholdType:", &unk_25149A778, 1);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)*((_QWORD *)v5 + 10);
    *((_QWORD *)v5 + 10) = v21;

    objc_msgSend(*((id *)v5 + 1), "confidenceThresholdBySceneIdentifierForSceneNames:withThresholdType:", &unk_25149A790, 1);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)*((_QWORD *)v5 + 11);
    *((_QWORD *)v5 + 11) = v23;

    objc_msgSend(*((id *)v5 + 1), "confidenceThresholdBySceneIdentifierForSceneNames:withThresholdType:", &unk_25149A7A8, 1);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)*((_QWORD *)v5 + 12);
    *((_QWORD *)v5 + 12) = v25;

    objc_msgSend(*((id *)v5 + 1), "confidenceThresholdBySceneIdentifierForSceneNames:withThresholdType:", &unk_25149A7C0, 1);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)*((_QWORD *)v5 + 13);
    *((_QWORD *)v5 + 13) = v27;

  }
  return (CLSCurationModel_v1 *)v5;
}

- (id)initForTesting
{
  CLSCurationModelSpecification *v3;
  CLSCurationModel_v1 *v4;

  v3 = -[CLSCurationModelSpecification initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:]([CLSCurationModelSpecification alloc], "initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:", -1, -1, -1);
  v4 = -[CLSCurationModel_v1 initWithCurationModelSpecification:](self, "initWithCurationModelSpecification:", v3);

  return v4;
}

- (BOOL)isBlurryWithAsset:(id)a3
{
  CLSMediaPreAnalysisModel *mediaPreAnalysisModel;
  id v4;
  void *v5;
  double v6;
  double v7;

  mediaPreAnalysisModel = self->_mediaPreAnalysisModel;
  if (!mediaPreAnalysisModel)
    return 0;
  v4 = a3;
  -[CLSMediaPreAnalysisModel sharpnessNode](mediaPreAnalysisModel, "sharpnessNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clsSharpnessScore");
  v7 = v6;

  LOBYTE(v4) = objc_msgSend(v5, "failsHighRecallWithConfidence:", v7);
  return (char)v4;
}

- (BOOL)isInhabitedWithAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v9;
  NSDictionary *v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_getAssociatedObject(v4, "clsIsInhabited");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    LOBYTE(v7) = objc_msgSend(v5, "BOOLValue");
  }
  else if ((objc_msgSend(v4, "clsIsUtility") & 1) != 0)
  {
    LOBYTE(v7) = 0;
  }
  else if (objc_msgSend(v4, "clsPeopleCount") || objc_msgSend(v4, "clsVideoFaceCount"))
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_msgSend(v4, "clsSceneClassifications");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v10 = self->_confidenceThresholdBySceneIdentifierForBabyChildTeenAdultAndPetScenes;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v11 = v9;
      v7 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v7)
      {
        v21 = v9;
        v12 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v23 != v12)
              objc_enumerationMutation(v11);
            v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v14, "extendedSceneIdentifier"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              objc_msgSend(v14, "confidence");
              v18 = v17;
              objc_msgSend(v16, "doubleValue");
              if (v18 >= v19)
              {

                v7 = 1;
                goto LABEL_22;
              }
            }

          }
          v7 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v7)
            continue;
          break;
        }
LABEL_22:
        v9 = v21;
      }

    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v4, "clsIsInhabited", v20, (void *)3);

  }
  return v7;
}

- (BOOL)avoidIfPossibleForKeyAssetWithAsset:(id)a3 statistics:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  BOOL v9;
  double v11;
  double v12;
  double v13;
  void *v14;
  int v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  _BOOL4 v20;

  v6 = a3;
  objc_msgSend(v6, "clsFaceInformationSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfFacesOfHiddenPersons");

  if (v8)
    goto LABEL_2;
  if (!objc_msgSend(v6, "isPhoto"))
  {
    if (!objc_msgSend(v6, "isVideo"))
      goto LABEL_3;
    if ((objc_msgSend(v6, "clsIsInterestingVideo") & 1) == 0)
    {
      a4 = ($3AF015D817C010E0BAE3E0C8E92F9864 *)((char *)a4 + 32);
      goto LABEL_2;
    }
    if (self->_mediaAnalysisModel)
    {
      objc_msgSend(v6, "clsAutoplaySuggestionScore");
      v12 = v11;
      -[CLSMediaAnalysisModel autoplaySuggestionScoreExclusiveThresholdForVideoKeyAsset](self->_mediaAnalysisModel, "autoplaySuggestionScoreExclusiveThresholdForVideoKeyAsset");
      if (v12 <= v13)
      {
        a4 = ($3AF015D817C010E0BAE3E0C8E92F9864 *)((char *)a4 + 36);
        goto LABEL_2;
      }
    }
    objc_msgSend(v6, "clsLocation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v6, "clsHasPoorResolution");
    if (!v14 && v15)
    {
      a4 = ($3AF015D817C010E0BAE3E0C8E92F9864 *)((char *)a4 + 40);
      goto LABEL_2;
    }
LABEL_19:
    if (+[CLSCurationUtilities isRiskyFileFormatWithAsset:](CLSCurationUtilities, "isRiskyFileFormatWithAsset:", v6))
    {
      a4 = ($3AF015D817C010E0BAE3E0C8E92F9864 *)((char *)a4 + 44);
    }
    else
    {
      objc_msgSend(v6, "curationProperties");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "importedByBundleIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = +[CLSCurationUtilities isBlocklistedImportedByBundleIdentifier:](CLSCurationUtilities, "isBlocklistedImportedByBundleIdentifier:", v19);

      if (!v20)
      {
        v9 = 0;
        goto LABEL_4;
      }
      a4 = ($3AF015D817C010E0BAE3E0C8E92F9864 *)((char *)a4 + 48);
    }
    goto LABEL_2;
  }
  if (!objc_msgSend(v6, "isSubtype:", 1))
  {
    if (-[CLSCurationModel_v1 isBadQualityForImageKeyAssetWithAsset:statistics:](self, "isBadQualityForImageKeyAssetWithAsset:statistics:", v6, &a4->var2))
    {
      goto LABEL_3;
    }
    objc_msgSend(v6, "clsSceneClassifications");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[CLSCurationModel_v1 imageAssetIsJunkForMemoriesFromSceneAndJunkClassifications:forKeyAsset:forMemories:](self, "imageAssetIsJunkForMemoriesFromSceneAndJunkClassifications:forKeyAsset:forMemories:", v16, 1, 1);

    if (v17)
    {
      a4 = ($3AF015D817C010E0BAE3E0C8E92F9864 *)((char *)a4 + 28);
      goto LABEL_2;
    }
    goto LABEL_19;
  }
  a4 = ($3AF015D817C010E0BAE3E0C8E92F9864 *)((char *)a4 + 4);
LABEL_2:
  ++a4->var0;
LABEL_3:
  v9 = 1;
LABEL_4:

  return v9;
}

- (BOOL)avoidIfPossibleForMemoryKeyAssetWithAsset:(id)a3
{
  return objc_msgSend(a3, "isVideo");
}

- (BOOL)hasPoorResolutionWithAsset:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "pixelWidth");
  v5 = objc_msgSend(v3, "pixelHeight");

  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  return v6 < 0x259;
}

- (id)sceneIdentifiersOfInterestingScenes
{
  return (id)-[CLSSceneModel sceneIdentifiersForSceneNames:includingChildScenes:](self->_sceneModel, "sceneIdentifiersForSceneNames:includingChildScenes:", &unk_25149A7D8, 0);
}

- (BOOL)hasInterestingScenesWithAsset:(id)a3
{
  void *v4;
  NSDictionary *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "clsSceneClassifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = self->_confidenceThresholdBySceneIdentifierForInterestingScenes;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v10, "extendedSceneIdentifier", (_QWORD)v17));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v10, "confidence");
            v14 = v13;
            objc_msgSend(v12, "doubleValue");
            if (v14 >= v15)
            {

              LOBYTE(v7) = 1;
              goto LABEL_14;
            }
          }

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isInterestingLivePhotoWithAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  double v9;
  BOOL v10;

  v4 = a3;
  if (objc_msgSend(v4, "isSubtype:", 8))
  {
    objc_msgSend(v4, "mediaAnalysisProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaAnalysisTimeStamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (self->_mediaAnalysisModel)
      {
        objc_msgSend(v5, "autoplaySuggestionScore");
        v8 = v7;
        -[CLSMediaAnalysisModel autoplaySuggestionScoreThresholdToBeInteresting](self->_mediaAnalysisModel, "autoplaySuggestionScoreThresholdToBeInteresting");
        v10 = v9 <= v8;
      }
      else
      {
        v10 = 0;
      }
    }
    else
    {
      v10 = 1;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isInterestingPanoramaWithAsset:(id)a3
{
  return objc_msgSend(a3, "isSubtype:", 1);
}

- (BOOL)isInterestingSDOFWithAsset:(id)a3
{
  return objc_msgSend(a3, "isSubtype:", 16);
}

- (BOOL)isInterestingHDRWithAsset:(id)a3
{
  return objc_msgSend(a3, "isSubtype:", 2);
}

- (BOOL)hasInterestingAudioClassificationWithAsset:(id)a3
{
  return objc_msgSend(a3, "clsInterestingAudioClassifications") != 0;
}

- (signed)interestingAudioClassificationsWithAsset:(id)a3
{
  void *v3;
  __int16 v4;

  objc_msgSend(a3, "mediaAnalysisProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "audioClassification");

  return v4 & ~(unsigned __int16)objc_msgSend((id)objc_opt_class(), "uninterestingAudioClassifications");
}

- (BOOL)isInterestingVideoWithAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  double v9;
  BOOL v10;

  v4 = a3;
  if (objc_msgSend(v4, "isVideo"))
  {
    objc_msgSend(v4, "mediaAnalysisProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaAnalysisTimeStamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (self->_mediaAnalysisModel)
      {
        objc_msgSend(v5, "videoScore");
        v8 = v7;
        -[CLSMediaAnalysisModel videoScoreThresholdToBeInteresting](self->_mediaAnalysisModel, "videoScoreThresholdToBeInteresting");
        v10 = v9 <= v8;
      }
      else
      {
        v10 = 0;
      }
    }
    else
    {
      v10 = 1;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isNonMemorableWithAsset:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!self->_junkClassificationModel)
    return 0;
  objc_msgSend(a3, "clsSceneClassifications");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[CLSJunkClassificationModel nonMemorableNode](self->_junkClassificationModel, "nonMemorableNode", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v9) = objc_msgSend(v10, "passesWithSignal:", v9);

        if ((v9 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (BOOL)isAestheticallyPrettyGoodWithAsset:(id)a3
{
  double v4;
  CLSAestheticsModel *aestheticsModel;
  double v6;
  double v7;

  objc_msgSend(a3, "clsAestheticScore");
  aestheticsModel = self->_aestheticsModel;
  if (aestheticsModel)
  {
    v6 = v4;
    -[CLSAestheticsModel aestheticScoreThresholdToBeAestheticallyPrettyGood](aestheticsModel, "aestheticScoreThresholdToBeAestheticallyPrettyGood");
    LOBYTE(aestheticsModel) = v6 >= v7;
  }
  return (char)aestheticsModel;
}

- (BOOL)isAestheticallyAwesomeWithAsset:(id)a3
{
  double v4;
  CLSAestheticsModel *aestheticsModel;
  double v6;
  double v7;

  objc_msgSend(a3, "clsAestheticScore");
  aestheticsModel = self->_aestheticsModel;
  if (aestheticsModel)
  {
    v6 = v4;
    -[CLSAestheticsModel aestheticScoreThresholdToBeAwesome](aestheticsModel, "aestheticScoreThresholdToBeAwesome");
    LOBYTE(aestheticsModel) = v6 >= v7;
  }
  return (char)aestheticsModel;
}

- (BOOL)asset:(id)a3 isAestheticallyAwesomeWithContext:(id)a4
{
  id v6;
  CLSAestheticsModel *v7;
  BOOL v8;
  CLSAestheticsModel *aestheticsModel;
  double v10;
  double v11;
  double v12;

  v6 = a3;
  v7 = (CLSAestheticsModel *)a4;
  if ((objc_msgSend(v6, "isVideo") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    aestheticsModel = v7;
    if (v7 || (aestheticsModel = self->_aestheticsModel) != 0)
    {
      -[CLSAestheticsModel aestheticScoreThresholdToBeAwesome](aestheticsModel, "aestheticScoreThresholdToBeAwesome");
      v11 = v10;
    }
    else
    {
      v11 = 1.0;
    }
    objc_msgSend(v6, "clsAestheticScore");
    v8 = v12 >= v11;
  }

  return v8;
}

- (float)interactionScoreWithAsset:(id)a3
{
  id v3;
  float v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = a3;
  if ((objc_msgSend(v3, "clsIsUtility") & 1) != 0)
  {
    v4 = 0.01;
  }
  else
  {
    v5 = objc_msgSend(v3, "clsViewCount");
    v6 = objc_msgSend(v3, "clsPlayCount") + v5;
    v7 = v6 + objc_msgSend(v3, "clsShareCount");
    if (v7 >= 0x32)
      v7 = 50;
    if ((float)((float)v7 / 50.0) >= 0.01)
      v4 = (float)v7 / 50.0;
    else
      v4 = 0.01;
  }

  return v4;
}

- (double)scoreWithAsset:(id)a3 inContext:(id)a4
{
  id v6;
  id v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  _BOOL4 v13;
  int v14;
  int v15;
  char v16;
  uint64_t v17;
  double v18;
  double v19;
  char v20;
  int v21;
  int v22;
  unint64_t v23;
  void *v24;
  double v25;
  double v26;
  int v27;
  double v28;
  char v30;
  unint64_t v31;
  double v32;
  int v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "clsIsUtility") || (v8 = 0.25, objc_msgSend(v6, "isFavorite")))
  {
    v9 = (void *)MEMORY[0x24BDE36A8];
    objc_msgSend(v6, "clsFaceInformationSummary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userFeedbackScore");
    LOBYTE(v9) = objc_msgSend(v9, "score:meetsScoreThreshold:");

    v8 = 0.25;
    if ((v9 & 1) == 0)
    {
      if (v7)
      {
        v11 = (double)objc_msgSend(v6, "clsViewCount");
        objc_msgSend(v7, "viewCountThreshold");
        if (v12 >= v11)
        {
          v18 = (double)objc_msgSend(v6, "clsPlayCount");
          objc_msgSend(v7, "playCountThreshold");
          v13 = v19 < v18;
        }
        else
        {
          v13 = 1;
        }
        v20 = objc_msgSend(v7, "shouldEmphasizeShared");
        v21 = objc_msgSend(v7, "shouldEmphasizeAdjusted");
        HIDWORD(v37) = objc_msgSend(v7, "shouldEmphasizePanorama");
        v22 = objc_msgSend(v7, "shouldEmphasizeLive");
        HIDWORD(v35) = objc_msgSend(v7, "shouldEmphasizeBurst");
        LODWORD(v37) = objc_msgSend(v7, "shouldEmphasizeSDOF");
        LODWORD(v35) = objc_msgSend(v7, "audioClassificationsToEmphasize");
        v16 = v20 ^ 1;
        v15 = v21 ^ 1;
        v14 = v22 ^ 1;
        v17 = objc_msgSend(v6, "clsPeopleCount", v35);
      }
      else
      {
        v37 = 0;
        v13 = 0;
        v14 = 1;
        v15 = 1;
        v16 = 1;
        v17 = objc_msgSend(v6, "clsPeopleCount", 0);
      }
      v23 = v17;
      objc_msgSend(v6, "clsFaceInformationSummary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "averageFaceQuality");
      v26 = v25;
      v27 = objc_msgSend(v6, "isVideo");
      if ((objc_msgSend(v6, "isFavorite") & 1) != 0
        || -[CLSCurationModel_v1 asset:isAestheticallyAwesomeWithContext:](self, "asset:isAestheticallyAwesomeWithContext:", v6, v7)|| (objc_msgSend(v6, "isIncludedInCloudFeeds") & 1) != 0)
      {
LABEL_13:
        if (!v23)
        {
          v28 = 0.0;
          goto LABEL_16;
        }
LABEL_14:
        v28 = fmin((double)v23 / 10.0, 1.0) * 0.4 + 0.5 + v26 * 0.1;
LABEL_16:
        v8 = v28 * 0.25 + 0.75;
LABEL_17:

        goto LABEL_18;
      }
      if (objc_msgSend(v6, "clsShareCount"))
        v30 = v16;
      else
        v30 = 1;
      if ((v30 & 1) != 0)
      {
        if (v23 > 3)
          goto LABEL_14;
      }
      else if (objc_msgSend(v6, "clsVideoFaceCount") || v23 > 3)
      {
        goto LABEL_13;
      }
      if (v27)
      {
        v31 = objc_msgSend(v6, "clsVideoFaceCount");
        if (v23 <= v31)
          v23 = v31;
      }
      if (v23)
        v32 = fmin((double)v23 * 0.25, 1.0) * 0.4 + 0.5 + v26 * 0.1;
      else
        v32 = 0.0;
      v33 = objc_msgSend(v6, "clsIsInterestingLivePhoto");
      if (((v15 | v27) & 1) != 0)
      {
        if (v13)
          goto LABEL_47;
      }
      else if (((objc_msgSend(v6, "hasAdjustments") | v13) & 1) != 0)
      {
LABEL_47:
        v8 = v32 * 0.15 + 0.6;
        goto LABEL_17;
      }
      if (!objc_msgSend(v6, "clsIsInterestingVideo")
        && v14 | v33 ^ 1
        && (!HIDWORD(v37) || (objc_msgSend(v6, "clsIsInterestingPanorama") & 1) == 0)
        && (!(_DWORD)v37 || (objc_msgSend(v6, "clsIsInterestingSDOF") & 1) == 0)
        && (!v33 || (objc_msgSend(v6, "clsInterestingAudioClassifications") & v34) == 0)
        && (!v36 || !objc_msgSend(v6, "representsBurst")))
      {
        if ((v27 & (v32 * 0.25 + 0.5 < 0.6)) != 0)
          v8 = 0.6;
        else
          v8 = v32 * 0.25 + 0.5;
        goto LABEL_17;
      }
      goto LABEL_47;
    }
  }
LABEL_18:

  return v8;
}

- (BOOL)isGoldWithAsset:(id)a3
{
  float v3;

  objc_msgSend(a3, "clsBehavioralScore");
  return v3 == 1.0;
}

- (BOOL)isShinyGemWithAsset:(id)a3
{
  float v3;

  objc_msgSend(a3, "clsBehavioralScore");
  return v3 >= 0.9;
}

- (BOOL)isRegularGemWithAsset:(id)a3
{
  float v3;

  objc_msgSend(a3, "clsBehavioralScore");
  return v3 >= 0.7;
}

- (BOOL)isUtilityForVideoAsset:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;

  v4 = a3;
  -[CLSCurationModel_v1 minimumDurationForVideoToNotBeJunk](self, "minimumDurationForVideoToNotBeJunk");
  v6 = v5;
  if (objc_msgSend(v4, "isSubtype:", 0x20000))
  {
    -[CLSCurationModel_v1 minimumDurationForHighFramerateVideoToNotBeJunk](self, "minimumDurationForHighFramerateVideoToNotBeJunk");
  }
  else
  {
    if (!objc_msgSend(v4, "isSubtype:", 0x40000))
      goto LABEL_6;
    -[CLSCurationModel_v1 minimumDurationForTimelapseVideoToNotBeJunk](self, "minimumDurationForTimelapseVideoToNotBeJunk");
  }
  v6 = v7;
LABEL_6:
  objc_msgSend(v4, "duration");
  if (v8 >= v6)
  {
    if (self->_mediaAnalysisModel)
    {
      objc_msgSend(v4, "clsVideoScore");
      v11 = v10;
      -[CLSMediaAnalysisModel videoScoreThresholdToNotBeJunk](self->_mediaAnalysisModel, "videoScoreThresholdToNotBeJunk");
      v9 = v11 < v12;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)isBadQualityForImageKeyAssetWithAsset:(id)a3 statistics:(id *)a4
{
  id v6;
  CLSMediaPreAnalysisModel *mediaPreAnalysisModel;
  void *v8;
  int v9;
  CLSAestheticsModel *aestheticsModel;
  void *v11;
  int v12;
  BOOL v13;
  void *v14;
  void *v15;
  float v16;
  int v17;
  unsigned int *p_var2;
  void *v19;
  float v20;
  int v21;
  void *v22;
  float v23;
  int v24;

  v6 = a3;
  mediaPreAnalysisModel = self->_mediaPreAnalysisModel;
  if (!mediaPreAnalysisModel
    || (-[CLSMediaPreAnalysisModel sharpnessNode](mediaPreAnalysisModel, "sharpnessNode"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "clsSharpnessScore"),
        v9 = objc_msgSend(v8, "failsHighPrecisionWithConfidence:"),
        v8,
        !v9))
  {
    aestheticsModel = self->_aestheticsModel;
    if (!aestheticsModel)
    {
      v13 = 0;
      goto LABEL_17;
    }
    -[CLSAestheticsModel overallAestheticScoreNode](aestheticsModel, "overallAestheticScoreNode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clsAestheticScore");
    v12 = objc_msgSend(v11, "failsHighPrecisionWithConfidence:");

    if (v12)
    {
      ++a4->var1;
      goto LABEL_7;
    }
    objc_msgSend(v6, "aestheticProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSAestheticsModel failureScoreNode](self->_aestheticsModel, "failureScoreNode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "failureScore");
    v17 = objc_msgSend(v15, "failsHighPrecisionWithConfidence:", v16);

    if (v17)
    {
      p_var2 = &a4->var2;
    }
    else
    {
      -[CLSAestheticsModel tastefullyBlurredScoreNode](self->_aestheticsModel, "tastefullyBlurredScoreNode");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "tastefullyBlurredScore");
      v21 = objc_msgSend(v19, "failsHighPrecisionWithConfidence:", v20);

      if (v21)
      {
        p_var2 = &a4->var3;
      }
      else
      {
        -[CLSAestheticsModel pleasantLightingScoreNode](self->_aestheticsModel, "pleasantLightingScoreNode");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "pleasantLightingScore");
        v24 = objc_msgSend(v22, "failsHighPrecisionWithConfidence:", v23);

        if (!v24)
        {
          v13 = 0;
          goto LABEL_16;
        }
        p_var2 = &a4->var4;
      }
    }
    ++*p_var2;
    v13 = 1;
LABEL_16:

    goto LABEL_17;
  }
  ++a4->var0;
LABEL_7:
  v13 = 1;
LABEL_17:

  return v13;
}

- (BOOL)isTragicFailureWithImageAsset:(id)a3
{
  id v4;
  CLSAestheticsModel *v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  CLSAestheticsModel *aestheticsModel;
  void *v11;
  float v12;
  void *v13;
  float v14;

  v4 = a3;
  if ((objc_msgSend(v4, "clsIsBlurry") & 1) != 0
    || (v5 = self->_aestheticsModel) != 0
    && (-[CLSAestheticsModel overallAestheticScoreNode](v5, "overallAestheticScoreNode"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "clsAestheticScore"),
        v7 = objc_msgSend(v6, "failsHighRecallWithConfidence:"),
        v6,
        (v7 & 1) != 0))
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v4, "aestheticProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    aestheticsModel = self->_aestheticsModel;
    if (aestheticsModel)
    {
      -[CLSAestheticsModel failureScoreNode](aestheticsModel, "failureScoreNode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "failureScore");
      if ((objc_msgSend(v11, "failsHighRecallWithConfidence:", v12) & 1) != 0)
      {
        v8 = 1;
      }
      else
      {
        -[CLSAestheticsModel tastefullyBlurredScoreNode](self->_aestheticsModel, "tastefullyBlurredScoreNode");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "tastefullyBlurredScore");
        v8 = objc_msgSend(v13, "failsHighRecallWithConfidence:", v14);

      }
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (BOOL)isJunkWithJunkClassification:(id)a3
{
  id v4;
  CLSJunkClassificationModel *junkClassificationModel;
  void *v6;
  char v7;
  void *v8;
  char v9;
  char v10;
  void *v11;

  v4 = a3;
  junkClassificationModel = self->_junkClassificationModel;
  if (junkClassificationModel)
  {
    -[CLSJunkClassificationModel receiptOrDocumentNode](junkClassificationModel, "receiptOrDocumentNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "passesWithSignal:", v4);

    if ((v7 & 1) != 0
      || (-[CLSJunkClassificationModel screenshotNode](self->_junkClassificationModel, "screenshotNode"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "passesWithSignal:", v4),
          v8,
          (v9 & 1) != 0))
    {
      v10 = 1;
    }
    else
    {
      -[CLSJunkClassificationModel tragicFailureNode](self->_junkClassificationModel, "tragicFailureNode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "passesWithSignal:", v4);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)imageAssetIsJunkFromSceneAndJunkClassifications:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CLSJunkClassificationModel *junkClassificationModel;
  void *v14;
  char v15;
  uint64_t v16;
  CLSJunkClassificationModel *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  char v26;
  char v28;
  NSDictionary *v29;
  NSDictionary *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v30 = self->_confidenceThresholdBySceneIdentifierForBabyChildTeenAdultAndPetScenes;
  v29 = self->_confidenceThresholdBySceneIdentifierForWhiteboardScenes;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v6)
  {
    v7 = v6;
    v28 = 0;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v32;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v10)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v11);
      junkClassificationModel = self->_junkClassificationModel;
      if (junkClassificationModel)
      {
        -[CLSJunkClassificationModel negativeNode](junkClassificationModel, "negativeNode");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "passesHighPrecisionWithSignal:", v12);

        if ((v15 & 1) != 0)
          break;
      }
      if ((v9 & 1) != 0)
      {
        v9 = 1;
      }
      else
      {
        v16 = objc_msgSend(v12, "extendedSceneIdentifier");
        v17 = self->_junkClassificationModel;
        if (!v17
          || !-[CLSJunkClassificationModel isResponsibleForSignalIdentifier:](v17, "isResponsibleForSignalIdentifier:", v16))
        {
          objc_msgSend(v12, "confidence");
          v19 = v18;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            objc_msgSend(v21, "doubleValue");
            if (v19 >= v22)
            {
              v9 = 1;
LABEL_21:

              goto LABEL_22;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v16);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              objc_msgSend(v24, "doubleValue");
              if (v19 >= v25)
                v28 = 1;
            }

          }
          v9 = 0;
          goto LABEL_21;
        }
        v9 = 0;
        v8 |= -[CLSCurationModel_v1 isJunkWithJunkClassification:](self, "isJunkWithJunkClassification:", v12);
      }
LABEL_22:
      if (v7 == ++v11)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v7)
          goto LABEL_3;

        v26 = (v9 ^ 1) & (v8 | v28);
        goto LABEL_26;
      }
    }
  }

  v26 = 0;
LABEL_26:

  return v26;
}

- (BOOL)imageAssetIsJunkForMemoriesFromSceneAndJunkClassifications:(id)a3 forKeyAsset:(BOOL)a4 forMemories:(BOOL)a5
{
  _BOOL8 v5;
  NSDictionary *confidenceThresholdBySceneIdentifierForBabyChildTeenAdultAndPetScenes;
  NSDictionary *confidenceThresholdBySceneIdentifierForUtilityScenes;
  NSDictionary *v10;
  BOOL v11;

  v5 = a5;
  if (a4)
    confidenceThresholdBySceneIdentifierForBabyChildTeenAdultAndPetScenes = (NSDictionary *)MEMORY[0x24BDBD1B8];
  else
    confidenceThresholdBySceneIdentifierForBabyChildTeenAdultAndPetScenes = self->_confidenceThresholdBySceneIdentifierForBabyChildTeenAdultAndPetScenes;
  confidenceThresholdBySceneIdentifierForUtilityScenes = self->_confidenceThresholdBySceneIdentifierForUtilityScenes;
  v10 = confidenceThresholdBySceneIdentifierForBabyChildTeenAdultAndPetScenes;
  v11 = -[CLSCurationModel_v1 assetIsJunkWithSceneClassifications:confidenceThresholdBySceneIdentifierForScenesPreventingJunking:confidenceThresholdBySceneIdentifierForJunkingScenes:confidenceThresholdBySceneIdentifierForScenesPreventingSceneBasedJunking:forMemories:](self, "assetIsJunkWithSceneClassifications:confidenceThresholdBySceneIdentifierForScenesPreventingJunking:confidenceThresholdBySceneIdentifierForJunkingScenes:confidenceThresholdBySceneIdentifierForScenesPreventingSceneBasedJunking:forMemories:", a3, v10, confidenceThresholdBySceneIdentifierForUtilityScenes, v10, v5);

  return v11;
}

- (BOOL)isUtilityForImageAsset:(id)a3
{
  id v4;
  BOOL v5;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(v4, "clsHasCustomPlaybackVariation") & 1) != 0)
  {
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  if ((objc_msgSend(v4, "clsIsTragicFailure") & 1) == 0)
  {
    if (!objc_msgSend(v4, "clsPeopleCount"))
    {
      objc_msgSend(v4, "clsSceneClassifications");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[CLSCurationModel_v1 imageAssetIsJunkFromSceneAndJunkClassifications:](self, "imageAssetIsJunkFromSceneAndJunkClassifications:", v7);

      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v5 = 1;
LABEL_6:

  return v5;
}

- (BOOL)isUtilityForMemoriesForImageAsset:(id)a3
{
  id v4;
  BOOL v5;
  void *v7;
  BOOL v8;
  void *v9;

  v4 = a3;
  if ((objc_msgSend(v4, "clsHasCustomPlaybackVariation") & 1) != 0)
    goto LABEL_5;
  if ((objc_msgSend(v4, "clsIsTragicFailure") & 1) == 0)
  {
    if (!objc_msgSend(v4, "clsPeopleCount"))
    {
      objc_msgSend(v4, "clsSceneClassifications");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[CLSCurationModel_v1 imageAssetIsJunkFromSceneAndJunkClassifications:](self, "imageAssetIsJunkFromSceneAndJunkClassifications:", v7);

      if (!v8)
      {
        objc_msgSend(v4, "clsSceneClassifications");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = -[CLSCurationModel_v1 imageAssetIsJunkForMemoriesFromSceneAndJunkClassifications:forKeyAsset:forMemories:](self, "imageAssetIsJunkForMemoriesFromSceneAndJunkClassifications:forKeyAsset:forMemories:", v9, 0, 1);

        goto LABEL_6;
      }
      goto LABEL_3;
    }
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
LABEL_3:
  v5 = 1;
LABEL_6:

  return v5;
}

- (BOOL)isUtilityWithAsset:(id)a3
{
  id v4;
  BOOL v5;
  BOOL v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isAudio") & 1) != 0
    || (objc_msgSend(v4, "isTrashed") & 1) != 0
    || (objc_msgSend(v4, "isHidden") & 1) != 0
    || (objc_msgSend(v4, "clsIsScreenshotOrScreenRecording") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    if (objc_msgSend(v4, "isVideo"))
      v7 = -[CLSCurationModel_v1 isUtilityForVideoAsset:](self, "isUtilityForVideoAsset:", v4);
    else
      v7 = -[CLSCurationModel_v1 isUtilityForImageAsset:](self, "isUtilityForImageAsset:", v4);
    v5 = v7;
  }

  return v5;
}

- (BOOL)isUtilityForMemoriesWithAsset:(id)a3 userFeedbackCalculator:(id)a4
{
  id v5;
  BOOL v6;
  BOOL v8;

  v5 = a3;
  if ((objc_msgSend(v5, "isAudio") & 1) != 0
    || (objc_msgSend(v5, "isTrashed") & 1) != 0
    || (objc_msgSend(v5, "isHidden") & 1) != 0
    || (objc_msgSend(v5, "clsIsScreenshotOrScreenRecording") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    if (objc_msgSend(v5, "isVideo"))
      v8 = -[CLSCurationModel_v1 isUtilityForMemoriesWithVideoAsset:](self, "isUtilityForMemoriesWithVideoAsset:", v5);
    else
      v8 = -[CLSCurationModel_v1 isUtilityForMemoriesForImageAsset:](self, "isUtilityForMemoriesForImageAsset:", v5);
    v6 = v8;
  }

  return v6;
}

- (BOOL)isUtilityForSyndicationWithAsset:(id)a3
{
  return +[CLSCurationUtilities isRiskyFileFormatWithAsset:](CLSCurationUtilities, "isRiskyFileFormatWithAsset:", a3);
}

- (BOOL)isJunkWithSignal:(id)a3 isReliable:(BOOL *)a4
{
  id v6;
  CLSJunkClassificationModel *junkClassificationModel;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  char v16;

  v6 = a3;
  junkClassificationModel = self->_junkClassificationModel;
  if (!junkClassificationModel)
    goto LABEL_7;
  -[CLSJunkClassificationModel negativeNode](junkClassificationModel, "negativeNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "passesHighPrecisionWithSignal:", v6);

  if ((v9 & 1) != 0)
    goto LABEL_6;
  -[CLSJunkClassificationModel nonMemorableNode](self->_junkClassificationModel, "nonMemorableNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "passesWithSignal:", v6);

  if ((v11 & 1) != 0)
    goto LABEL_6;
  -[CLSJunkClassificationModel poorQualityNode](self->_junkClassificationModel, "poorQualityNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "passesWithSignal:", v6);

  if ((v13 & 1) != 0
    || (-[CLSJunkClassificationModel legacyNode](self->_junkClassificationModel, "legacyNode"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "passesWithSignal:", v6),
        v14,
        v15))
  {
LABEL_6:
    v16 = v9 ^ 1;
    *a4 = 1;
  }
  else
  {
LABEL_7:
    v16 = 0;
  }

  return v16;
}

- (BOOL)assetIsJunkWithSceneClassifications:(id)a3 confidenceThresholdBySceneIdentifierForScenesPreventingJunking:(id)a4 confidenceThresholdBySceneIdentifierForJunkingScenes:(id)a5 confidenceThresholdBySceneIdentifierForScenesPreventingSceneBasedJunking:(id)a6 forMemories:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  char v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  CLSJunkClassificationModel *junkClassificationModel;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  id v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  id v37;
  char v38;
  id v39;
  id v40;
  int v41;
  id v42;
  char v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v37 = a5;
  v40 = a6;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v14)
  {
    v15 = v14;
    v41 = 0;
    v38 = 0;
    v16 = 0;
    v17 = 0;
    v18 = *(_QWORD *)v45;
    v39 = v12;
    while (1)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v45 != v18)
          objc_enumerationMutation(v13);
        v20 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v21 = objc_msgSend(v20, "extendedSceneIdentifier", v37);
        objc_msgSend(v20, "confidence");
        v23 = v22;
        junkClassificationModel = self->_junkClassificationModel;
        if (!junkClassificationModel
          || !-[CLSJunkClassificationModel isResponsibleForSignalIdentifier:](junkClassificationModel, "isResponsibleForSignalIdentifier:", v21))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (v27)
          {
            objc_msgSend(v27, "doubleValue");
            if (v23 >= v29)
            {

              goto LABEL_35;
            }
            goto LABEL_31;
          }
          if (((v16 | v41) & 1) == 0)
          {
            v30 = v13;
            objc_msgSend(v40, "objectForKeyedSubscript:", v26);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v31;
            if (v31)
            {
              objc_msgSend(v31, "doubleValue");
              if (v23 >= v33)
              {
                v17 = 0;
                v41 = 1;
                goto LABEL_30;
              }
LABEL_29:
              v41 = 0;
            }
            else
            {
              if ((v38 & 1) == 0)
              {
                objc_msgSend(v37, "objectForKeyedSubscript:", v26);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                if (v34)
                {
                  v42 = v34;
                  objc_msgSend(v34, "doubleValue");
                  if (v23 >= v35)
                  {
                    v38 = 1;
                    v17 = 1;
                  }
                  else
                  {
                    v38 = 0;
                  }
                  v34 = v42;
                }
                else
                {
                  v38 = 0;
                }

                goto LABEL_29;
              }
              v41 = 0;
              v38 = 1;
            }
LABEL_30:

            v13 = v30;
            v12 = v39;
          }
LABEL_31:

          continue;
        }
        v43 = 0;
        v25 = -[CLSCurationModel_v1 isJunkWithSignal:isReliable:](self, "isJunkWithSignal:isReliable:", v20, &v43);
        if (v43 && !v25)
          goto LABEL_35;
        if (v43)
          v17 = v25;
        v16 |= v43 != 0;
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (!v15)
        goto LABEL_36;
    }
  }
LABEL_35:
  v17 = 0;
LABEL_36:

  return v17 & 1;
}

- (id)faceInformationSummaryWithFaces:(id)a3 detectionTraitsByFaceLocalIdentifier:(id)a4 verifiedPersonUUIDs:(id)a5 hiddenPersonUUIDs:(id)a6 personUUIDByMergeCandidateUUID:(id)a7 userFeedbackCalculator:(id)a8 assetUUID:(id)a9
{
  id v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t i;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int v26;
  _BOOL8 v27;
  char v28;
  uint64_t v29;
  void *v30;
  void *v31;
  CLSFaceInformation *v32;
  CLSFaceInformation *v33;
  id v34;
  void *v35;
  CLSFaceInformation *v36;
  uint64_t v37;
  CLSFaceInformation *v38;
  double v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  CLSAssetFaceInformationSummary *v44;
  unint64_t v46;
  id v47;
  unint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  id obj;
  uint64_t v53;
  id v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v50 = a5;
  v54 = a6;
  v13 = objc_msgSend(v12, "count");
  v14 = MEMORY[0x24BDBD1B8];
  if (!v13)
  {
    v40 = 0;
    v42 = 0;
    v43 = 0;
    v17 = 0;
    v41 = 0.0;
    v39 = 0.0;
    v15 = (id)MEMORY[0x24BDBD1B8];
    goto LABEL_34;
  }
  v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[CLSFaceModel qualityNode](self->_faceModel, "qualityNode");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v16 = v12;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
  if (!v17)
  {

    v43 = 0;
    v42 = 0;
    v40 = 0;
    v41 = 0.0;
    v39 = 0.0 / (double)v13;
    goto LABEL_33;
  }
  v46 = v13;
  v47 = v12;
  v48 = 0;
  v49 = 0;
  v56 = v15;
  v57 = 0;
  obj = v16;
  v53 = 0;
  v55 = *(_QWORD *)v59;
  v18 = 0.0;
  v19 = 0.0;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v59 != v55)
        objc_enumerationMutation(obj);
      v21 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
      objc_msgSend(v21, "size");
      v23 = v22;
      objc_msgSend(v21, "quality");
      v25 = v24;
      v26 = objc_msgSend(v21, "eyesState");
      v27 = v23 >= self->_faceSizeLowerLimit && v23 <= self->_faceSizeUpperLimit;
      if (v26 == 2)
      {
        v28 = objc_msgSend(v51, "passesHighPrecisionWithConfidence:", v25) & v27;
        v57 += v28 & 1;
        v29 = objc_msgSend(v51, "passesWithConfidence:", v25) & v27;
      }
      else
      {
        v28 = 0;
        v29 = 0;
      }
      objc_msgSend(v21, "personLocalIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDE35E0], "uuidFromLocalIdentifier:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "UUIDString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
        v38 = [CLSFaceInformation alloc];
        objc_msgSend(v21, "size");
        v37 = -[CLSFaceInformation initForUnknownPersonWithFaceSize:faceQuality:faceSizeIsGood:faceIsGood:faceIsOk:traits:](v38, "initForUnknownPersonWithFaceSize:faceQuality:faceSizeIsGood:faceIsGood:faceIsOk:traits:", v27, v28 & 1, v29, MEMORY[0x24BDBD1A8]);
        goto LABEL_21;
      }
      if (objc_msgSend(v54, "containsObject:", v31))
      {
        ++v53;
        v32 = [CLSFaceInformation alloc];
        objc_msgSend(v21, "size");
        v33 = v32;
        v15 = v56;
        v34 = -[CLSFaceInformation initForHiddenPersonWithFaceSize:faceQuality:faceSizeIsGood:faceIsGood:faceIsOk:traits:](v33, "initForHiddenPersonWithFaceSize:faceQuality:faceSizeIsGood:faceIsGood:faceIsOk:traits:", v27, v28 & 1, v29, MEMORY[0x24BDBD1A8]);
        goto LABEL_22;
      }
      if (!v31 || !objc_msgSend(v50, "containsObject:", v31))
        goto LABEL_20;
      v18 = v18 + v25;
      ++v48;
      v49 += v28 & 1;
      v36 = [CLSFaceInformation alloc];
      objc_msgSend(v21, "size");
      v37 = -[CLSFaceInformation initForKnownPersonWithFaceSize:faceQuality:faceSizeIsGood:faceIsGood:faceIsOk:traits:](v36, "initForKnownPersonWithFaceSize:faceQuality:faceSizeIsGood:faceIsGood:faceIsOk:traits:", v27, v28 & 1, v29, MEMORY[0x24BDBD1A8]);
LABEL_21:
      v34 = (id)v37;
      v15 = v56;
LABEL_22:
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v34, v30);
      v19 = v19 + v25;

    }
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
  }
  while (v17);

  v13 = v46;
  v12 = v47;
  v39 = v19 / (double)v46;
  v40 = v49;
  if (v48)
    v17 = v48;
  else
    v17 = 0;
  if (v48)
    v41 = v18 / (double)v48;
  else
    v41 = v18;
  v14 = MEMORY[0x24BDBD1B8];
  v42 = v57;
  v43 = v53;
LABEL_33:

LABEL_34:
  v44 = -[CLSAssetFaceInformationSummary initWithNumberOfFaces:numberOfFacesIncludingPets:numberOfFacesOfVerifiedPersons:numberOfFacesOfHiddenPersons:numberOfGoodFaces:numberOfGoodFacesIncludingPets:numberOfGoodFacesOfVerifiedPersons:averageFaceQuality:averageFaceQualityIncludingPets:averageFaceQualityOfVerifiedPersons:userFeedbackScore:faceInformationByPersonLocalIdentifier:faceInformationByConsolidatedPersonLocalIdentifier:]([CLSAssetFaceInformationSummary alloc], "initWithNumberOfFaces:numberOfFacesIncludingPets:numberOfFacesOfVerifiedPersons:numberOfFacesOfHiddenPersons:numberOfGoodFaces:numberOfGoodFacesIncludingPets:numberOfGoodFacesOfVerifiedPersons:averageFaceQuality:averageFaceQualityIncludingPets:averageFaceQualityOfVerifiedPersons:userFeedbackScore:faceInformationByPersonLocalIdentifier:faceInformationByConsolidatedPersonLocalIdentifier:", v13, 0, v17, v43, v42, 0, v39, 0.0, v41, 0.0, v40, v15, v14);

  return v44;
}

- (double)minimumDurationForVideoToNotBeJunk
{
  return 3.0;
}

- (double)minimumDurationForTimelapseVideoToNotBeJunk
{
  return 2.0;
}

- (double)minimumDurationForHighFramerateVideoToNotBeJunk
{
  return 1.0;
}

- (void)enumerateSignalModelsUsingBlock:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  CLSMediaPreAnalysisModel *mediaPreAnalysisModel;
  CLSMediaAnalysisModel *mediaAnalysisModel;
  CLSJunkClassificationModel *junkClassificationModel;
  CLSAestheticsModel *aestheticsModel;
  CLSFaceModel *faceModel;
  char v11;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  v11 = 0;
  mediaPreAnalysisModel = self->_mediaPreAnalysisModel;
  if (!mediaPreAnalysisModel
    || ((*((void (**)(id, CLSMediaPreAnalysisModel *, char *))v4 + 2))(v4, mediaPreAnalysisModel, &v11), !v11))
  {
    mediaAnalysisModel = self->_mediaAnalysisModel;
    if (!mediaAnalysisModel
      || (((void (**)(_QWORD, CLSMediaAnalysisModel *, char *))v5)[2](v5, mediaAnalysisModel, &v11), !v11))
    {
      junkClassificationModel = self->_junkClassificationModel;
      if (!junkClassificationModel
        || (((void (**)(_QWORD, CLSJunkClassificationModel *, char *))v5)[2](v5, junkClassificationModel, &v11), !v11))
      {
        aestheticsModel = self->_aestheticsModel;
        if (!aestheticsModel
          || (((void (**)(_QWORD, CLSAestheticsModel *, char *))v5)[2](v5, aestheticsModel, &v11), !v11))
        {
          faceModel = self->_faceModel;
          if (faceModel)
            ((void (**)(_QWORD, CLSFaceModel *, char *))v5)[2](v5, faceModel, &v11);
        }
      }
    }
  }

}

- (void)enumerateClassificationBasedSignalModelsUsingBlock:(id)a3
{
  CLSJunkClassificationModel *junkClassificationModel;
  char v4;

  v4 = 0;
  junkClassificationModel = self->_junkClassificationModel;
  if (junkClassificationModel)
    (*((void (**)(id, CLSJunkClassificationModel *, char *))a3 + 2))(a3, junkClassificationModel, &v4);
}

- (CLSSceneModel)sceneModel
{
  return (CLSSceneModel *)objc_getProperty(self, a2, 8, 1);
}

- (CLSMediaPreAnalysisModel)mediaPreAnalysisModel
{
  return (CLSMediaPreAnalysisModel *)objc_getProperty(self, a2, 16, 1);
}

- (CLSMediaAnalysisModel)mediaAnalysisModel
{
  return (CLSMediaAnalysisModel *)objc_getProperty(self, a2, 24, 1);
}

- (CLSAestheticsModel)aestheticsModel
{
  return (CLSAestheticsModel *)objc_getProperty(self, a2, 32, 1);
}

- (CLSJunkClassificationModel)junkClassificationModel
{
  return (CLSJunkClassificationModel *)objc_getProperty(self, a2, 40, 1);
}

- (CLSFaceModel)faceModel
{
  return (CLSFaceModel *)objc_getProperty(self, a2, 48, 1);
}

- (double)faceSizeUpperLimit
{
  return self->_faceSizeUpperLimit;
}

- (double)faceSizeLowerLimit
{
  return self->_faceSizeLowerLimit;
}

- (NSDictionary)confidenceThresholdBySceneIdentifierForBabyChildTeenAdultAndPetScenes
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (NSDictionary)confidenceThresholdBySceneIdentifierForBabyScenes
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (NSDictionary)confidenceThresholdBySceneIdentifierForUtilityScenes
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (NSDictionary)confidenceThresholdBySceneIdentifierForInterestingScenes
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (NSDictionary)confidenceThresholdBySceneIdentifierForWhiteboardScenes
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidenceThresholdBySceneIdentifierForWhiteboardScenes, 0);
  objc_storeStrong((id *)&self->_confidenceThresholdBySceneIdentifierForInterestingScenes, 0);
  objc_storeStrong((id *)&self->_confidenceThresholdBySceneIdentifierForUtilityScenes, 0);
  objc_storeStrong((id *)&self->_confidenceThresholdBySceneIdentifierForBabyScenes, 0);
  objc_storeStrong((id *)&self->_confidenceThresholdBySceneIdentifierForBabyChildTeenAdultAndPetScenes, 0);
  objc_storeStrong((id *)&self->_faceModel, 0);
  objc_storeStrong((id *)&self->_junkClassificationModel, 0);
  objc_storeStrong((id *)&self->_aestheticsModel, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisModel, 0);
  objc_storeStrong((id *)&self->_mediaPreAnalysisModel, 0);
  objc_storeStrong((id *)&self->_sceneModel, 0);
}

+ (id)baseSpecificationWithSpecification:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  v4 = objc_msgSend(v3, "sceneAnalysisVersion");
  v5 = objc_msgSend(MEMORY[0x24BE726D8], "baseSceneAnalysisVersionWithSceneAnalysisVersion:", v4);
  v6 = objc_msgSend(MEMORY[0x24BE726B0], "baseSceneAnalysisVersionWithSceneAnalysisVersion:", v4);
  if (v5 <= v6)
    v5 = v6;
  v7 = objc_msgSend(MEMORY[0x24BE72668], "baseSceneAnalysisVersionWithSceneAnalysisVersion:", v4);
  if (v5 <= v7)
    v5 = v7;
  v8 = objc_msgSend(MEMORY[0x24BE726A0], "baseSceneAnalysisVersionWithSceneAnalysisVersion:", v4);
  if (v5 <= v8)
    v9 = v8;
  else
    v9 = v5;
  v10 = objc_msgSend(v3, "mediaAnalysisVersion");
  v11 = objc_msgSend(MEMORY[0x24BE726A8], "baseMediaAnalysisVersionWithMediaAnalysisVersion:", v10);
  v12 = objc_msgSend(v3, "faceAnalysisVersion");

  return -[CLSCurationModelSpecification initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:]([CLSCurationModelSpecification alloc], "initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:", v9, v11, objc_msgSend(MEMORY[0x24BE72688], "baseFaceAnalysisVersionWithFaceAnalysisVersion:", v12));
}

+ (signed)uninterestingAudioClassifications
{
  return 18;
}

@end
