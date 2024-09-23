@implementation CLSCurationSession

- (CLSCurationSession)init
{
  CLSCurationSession *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *curationModelBySpecification;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLSCurationSession;
  v2 = -[CLSCurationSession init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    curationModelBySpecification = v2->_curationModelBySpecification;
    v2->_curationModelBySpecification = v3;

    v2->_curationModelBySpecificationLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)_curationModelWithSpecification:(id)a3
{
  id v3;
  CLSCurationModel *v4;

  v3 = a3;
  v4 = -[CLSCurationModel initWithCurationModelSpecification:]([CLSCurationModel alloc], "initWithCurationModelSpecification:", v3);

  return v4;
}

- (id)curationModelWithSpecification:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  os_unfair_lock_lock(&self->_curationModelBySpecificationLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_curationModelBySpecification, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[CLSCurationModel baseSpecificationWithSpecification:](CLSCurationModel, "baseSpecificationWithSpecification:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_curationModelBySpecification, "objectForKeyedSubscript:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[CLSCurationSession _curationModelWithSpecification:](self, "_curationModelWithSpecification:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_curationModelBySpecification, "setObject:forKeyedSubscript:", v5, v6);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_curationModelBySpecification, "setObject:forKeyedSubscript:", v5, v4);

  }
  os_unfair_lock_unlock(&self->_curationModelBySpecificationLock);

  return v5;
}

- (id)curationModelForAsset:(id)a3
{
  id v4;
  CLSCurationModelSpecification *v5;
  void *v6;

  v4 = a3;
  v5 = -[CLSCurationModelSpecification initWithAsset:]([CLSCurationModelSpecification alloc], "initWithAsset:", v4);

  -[CLSCurationSession curationModelWithSpecification:](self, "curationModelWithSpecification:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)curationModelForItemInfo:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  CLSCurationModelSpecification *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[CLSCurationModelSpecification initWithItemInfo:options:]([CLSCurationModelSpecification alloc], "initWithItemInfo:options:", v7, v6);

  -[CLSCurationSession curationModelWithSpecification:](self, "curationModelWithSpecification:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)prepareAssets:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v9, "hasCurationModel") & 1) == 0)
        {
          -[CLSCurationSession curationModelForAsset:](self, "curationModelForAsset:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setCurationModel:", v10);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curationModelBySpecification, 0);
}

+ (double)legacyAestheticScoreThresholdToBeAwesome
{
  double result;

  objc_msgSend(MEMORY[0x24BE72668], "legacyAestheticScoreThresholdToBeAwesome");
  return result;
}

+ (double)legacyAestheticScoreThresholdToBeAestheticallyPrettyGood
{
  double result;

  objc_msgSend(MEMORY[0x24BE72668], "legacyAestheticScoreThresholdToBeAestheticallyPrettyGood");
  return result;
}

+ (double)legacyAestheticScoreThresholdToNotBeJunk
{
  double result;

  objc_msgSend(MEMORY[0x24BE72668], "legacyAestheticScoreThresholdToNotBeJunk");
  return result;
}

+ (id)scoringContextWithAssets:(id)a3 aestheticScoreThresholdToBeAwesome:(double)a4
{
  id v5;
  double v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  double v21;
  double v22;
  unint64_t v23;
  unint64_t v24;
  double v25;
  double v26;
  id v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  void *v38;
  int v39;
  double v40;
  double v41;
  double v42;
  _BOOL8 v43;
  _BOOL8 v44;
  _BOOL8 v45;
  _BOOL8 v46;
  _BOOL8 v47;
  _BOOL8 v48;
  uint64_t v49;
  CLSAssetScoringContext *v50;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  id v56;
  id obj;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (double)(unint64_t)objc_msgSend(v5, "count");
  v56 = objc_alloc_init(MEMORY[0x24BDD14E0]);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
  v8 = 0.0;
  if (v7)
  {
    v9 = v7;
    v52 = 0;
    v53 = 0;
    v10 = 0;
    v54 = 0;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v63;
    v14 = 0.0;
    v15 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v63 != v13)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "clsViewCount", v52);
        v19 = objc_msgSend(v17, "clsPlayCount");
        if (objc_msgSend(v17, "clsShareCount"))
          ++v12;
        v20 = objc_msgSend(v17, "hasAdjustments");
        if (objc_msgSend(v17, "clsIsInterestingLivePhoto"))
        {
          ++v10;
          objc_msgSend(a1, "addAudioClassifications:toAudioClassificationCounts:", objc_msgSend(v17, "clsInterestingAudioClassifications"), v56);
        }
        else if (objc_msgSend(v17, "clsIsInterestingPanorama"))
        {
          ++v54;
        }
        else if (objc_msgSend(v17, "representsBurst"))
        {
          ++v53;
        }
        else
        {
          v52 += objc_msgSend(v17, "clsIsInterestingSDOF");
        }
        v15 = v15 + (double)v18;
        v14 = v14 + (double)v19;
        v11 += v20;
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    }
    while (v9);
    v21 = (double)v12;
    v22 = (double)v11;
    v23 = v52;
    v24 = v54;
  }
  else
  {
    v23 = 0;
    v53 = 0;
    v10 = 0;
    v24 = 0;
    v22 = 0.0;
    v21 = 0.0;
    v14 = 0.0;
    v15 = 0.0;
  }

  v25 = v15 / v6;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v26 = v14 / v6;
  v27 = obj;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
  v29 = 0.0;
  if (v28)
  {
    v30 = v28;
    v31 = *(_QWORD *)v59;
    v8 = 0.0;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v59 != v31)
          objc_enumerationMutation(v27);
        v33 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
        v34 = objc_msgSend(v33, "clsViewCount", v52);
        v29 = v29 + ((double)v34 - v25) * ((double)v34 - v25);
        v35 = objc_msgSend(v33, "clsPlayCount");
        v8 = v8 + ((double)v35 - v26) * ((double)v35 - v26);
      }
      v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    }
    while (v30);
  }

  v36 = v25 + sqrt(v29 / v6) * 2.0;
  v37 = v26 + sqrt(v8 / v6) * 2.0;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "BOOLForKey:", CFSTR("CLSAssetScoreIgnoreViewPlayCount"));

  if (v39)
  {
    v37 = 1.79769313e308;
    v40 = 1.79769313e308;
  }
  else
  {
    v40 = v36;
  }
  v41 = sqrt(v6) + -1.0;
  if (v41 < 0.0)
    v41 = 0.0;
  v42 = ceil(v41);
  v43 = v42 >= v21;
  v44 = v42 >= v22;
  v45 = v42 >= (double)v24;
  v46 = v42 >= (double)v10;
  v47 = v42 >= (double)v53;
  v48 = v42 >= (double)v23;
  v49 = objc_msgSend(a1, "audioClassificationsToEmphasizeWithAudioClassificationCounts:threshold:", v56);
  v50 = objc_alloc_init(CLSAssetScoringContext);
  -[CLSAssetScoringContext setViewCountThreshold:](v50, "setViewCountThreshold:", v40);
  -[CLSAssetScoringContext setPlayCountThreshold:](v50, "setPlayCountThreshold:", v37);
  -[CLSAssetScoringContext setShouldEmphasizeShared:](v50, "setShouldEmphasizeShared:", v43);
  -[CLSAssetScoringContext setShouldEmphasizeAdjusted:](v50, "setShouldEmphasizeAdjusted:", v44);
  -[CLSAssetScoringContext setShouldEmphasizePanorama:](v50, "setShouldEmphasizePanorama:", v45);
  -[CLSAssetScoringContext setShouldEmphasizeLive:](v50, "setShouldEmphasizeLive:", v46);
  -[CLSAssetScoringContext setShouldEmphasizeBurst:](v50, "setShouldEmphasizeBurst:", v47);
  -[CLSAssetScoringContext setShouldEmphasizeSDOF:](v50, "setShouldEmphasizeSDOF:", v48);
  -[CLSAssetScoringContext setAudioClassificationsToEmphasize:](v50, "setAudioClassificationsToEmphasize:", v49);
  -[CLSAssetScoringContext setAestheticScoreThresholdToBeAwesome:](v50, "setAestheticScoreThresholdToBeAwesome:", a4);

  return v50;
}

+ (void)addAudioClassifications:(signed __int16)a3 toAudioClassificationCounts:(id)a4
{
  int v4;
  int v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  if (v4 >= 1)
  {
    LOWORD(v5) = 1;
    do
    {
      if (((unsigned __int16)v5 & (unsigned __int16)v4) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", (__int16)v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v6);

      }
      v5 = (__int16)(2 * v5);
    }
    while (v5 <= v4);
  }

}

+ (signed)audioClassificationsToEmphasizeWithAudioClassificationCounts:(id)a3 threshold:(double)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v12 = (double)(unint64_t)objc_msgSend(v5, "countForObject:", v11);
        if (v12 <= a4)
          v8 |= objc_msgSend(v11, "integerValue", v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16, v12);
    }
    while (v7);
  }
  else
  {
    LOWORD(v8) = 0;
  }

  return v8;
}

+ (void)enumerateSignalsFromAsset:(id)a3 fullHierarchyName:(BOOL)a4 usingBlock:(id)a5
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t, char *, double, double, double, double, double, double);
  void *v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  id obj;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  _QWORD v38[11];
  id v39;
  id v40;
  uint64_t v41;
  double *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v31 = a4;
  v56 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t, char *, double, double, double, double, double, double))a5;
  v30 = v6;
  objc_msgSend(v6, "curationModel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "sceneModel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "entityNetModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v6, "clsSceneClassifications");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v36)
  {
    v35 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v52 != v35)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        v45 = 0;
        v46 = &v45;
        v47 = 0x3032000000;
        v48 = __Block_byref_object_copy_;
        v49 = __Block_byref_object_dispose_;
        v50 = 0;
        v11 = objc_msgSend(v10, "extendedSceneIdentifier");
        v41 = 0;
        v42 = (double *)&v41;
        v43 = 0x2020000000;
        v44 = 0;
        if (!objc_msgSend(v8, "isResponsibleForSignalIdentifier:", v11))
        {
          v38[0] = MEMORY[0x24BDAC760];
          v38[1] = 3221225472;
          v38[2] = __77__CLSCurationSession_enumerateSignalsFromAsset_fullHierarchyName_usingBlock___block_invoke_2;
          v38[3] = &unk_25147F828;
          v38[4] = &v45;
          v38[5] = &v41;
          v38[6] = v11;
          objc_msgSend(v34, "enumerateClassificationBasedSignalModelsUsingBlock:", v38);
          goto LABEL_18;
        }
        if (objc_msgSend(v32, "isResponsibleForSignalIdentifier:", v11))
          v12 = v32;
        else
          v12 = v8;
        v13 = v12;
        if (!objc_msgSend(v13, "taxonomyNodeRefForSceneIdentifier:", v11))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown (%llu)"), v11);
          v21 = objc_claimAutoreleasedReturnValue();
LABEL_16:
          v16 = (id)v46[5];
          v46[5] = v21;
          goto LABEL_17;
        }
        PFSceneTaxonomyNodeSearchThreshold();
        *((_QWORD *)v42 + 3) = v14;
        if (!v31)
        {
          PFSceneTaxonomyNodeName();
          v21 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v38[7] = MEMORY[0x24BDAC760];
        v38[8] = 3221225472;
        v38[9] = __77__CLSCurationSession_enumerateSignalsFromAsset_fullHierarchyName_usingBlock___block_invoke;
        v38[10] = &unk_25147F800;
        v39 = v13;
        v16 = v15;
        v40 = v16;
        PFSceneTaxonomyNodeTraverseParents();
        objc_msgSend(v16, "reverseObjectEnumerator");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "allObjects");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR("->"));
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v46[5];
        v46[5] = v19;

LABEL_17:
LABEL_18:
        v37 = 0;
        v22 = v46[5];
        objc_msgSend(v10, "confidence");
        v24 = v23;
        v25 = v42[3];
        objc_msgSend(v10, "boundingBox");
        v7[2](v7, v11, v22, &v37, v24, v25, v26, v27, v28, v29);
        LOBYTE(v22) = v37 == 0;
        _Block_object_dispose(&v41, 8);
        _Block_object_dispose(&v45, 8);

        if ((v22 & 1) == 0)
          goto LABEL_21;
      }
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v36);
  }
LABEL_21:

}

uint64_t __77__CLSCurationSession_enumerateSignalsFromAsset_fullHierarchyName_usingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "sceneTaxonomy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PFSceneTaxonomyNodeLocalizedLabel();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    PFSceneTaxonomyNodeName();
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  return 0;
}

void __77__CLSCurationSession_enumerateSignalsFromAsset_fullHierarchyName_usingBlock___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(a2, "nodeForSignalIdentifier:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = v3;
    objc_msgSend(v3, "name");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[4] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    objc_msgSend(v8, "operatingPoint");
    v3 = v8;
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v7;
  }

}

@end
