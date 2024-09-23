@implementation PGCurationCriteria

- (PGCurationCriteria)initWithMinimumAssetsRatio:(double)a3 client:(unint64_t)a4
{
  PGCurationCriteria *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGCurationCriteria;
  result = -[PGCurationCriteria init](&v7, sel_init);
  if (result)
  {
    result->_minimumAssetsRatio = a3;
    result->_faceFilter = 1;
    result->_filterUtilityAssets = 1;
    result->_client = a4;
  }
  return result;
}

- (BOOL)isPassingForAsset:(id)a3 score:(double *)a4
{
  id v6;
  void *v7;
  double v8;
  int v9;
  void *v10;
  PGCurationSceneTrait *compulsoryScenesTrait;
  void *v12;
  double v13;
  PGCurationSceneTrait *scenesTrait;
  void *v15;
  double v16;
  double v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  double v22;
  BOOL v23;
  BOOL v24;
  PGCurationSDFoodTrait *sdFoodTrait;
  void *v26;
  double v27;
  double v28;
  BOOL v30;
  BOOL v31;
  unsigned __int8 v33;

  v6 = a3;
  v7 = v6;
  v33 = 0;
  if (self->_filterUtilityAssets)
  {
    objc_msgSend(v6, "clsContentScore");
    v9 = v8 < *MEMORY[0x1E0D77DE0];
    v33 = v8 < *MEMORY[0x1E0D77DE0];
  }
  else
  {
    v9 = 0;
  }
  if (-[PGCurationSceneTrait isActive](self->_compulsoryScenesTrait, "isActive"))
  {
    objc_msgSend(v7, "clsSceneClassifications");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    compulsoryScenesTrait = self->_compulsoryScenesTrait;
    objc_msgSend(v7, "curationModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCurationCriteria _scoreForSceneClassifications:withScenesTrait:curationModel:traitFailed:](self, "_scoreForSceneClassifications:withScenesTrait:curationModel:traitFailed:", v10, compulsoryScenesTrait, v12, &v33);

    v9 = v33;
  }
  else
  {
    v10 = 0;
  }
  v13 = 0.0;
  if (v9)
    goto LABEL_32;
  if (-[PGCurationSceneTrait isActive](self->_scenesTrait, "isActive"))
  {
    if (!v10)
    {
      objc_msgSend(v7, "clsSceneClassifications");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    scenesTrait = self->_scenesTrait;
    objc_msgSend(v7, "curationModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCurationCriteria _scoreForSceneClassifications:withScenesTrait:curationModel:traitFailed:](self, "_scoreForSceneClassifications:withScenesTrait:curationModel:traitFailed:", v10, scenesTrait, v15, &v33);
    v17 = v16;

    v13 = v17 + 0.0;
    v18 = 1;
  }
  else
  {
    v18 = 0;
  }
  if (v33)
    goto LABEL_30;
  if (-[PGCurationPartOfDayTrait isActive](self->_partOfDayTrait, "isActive"))
  {
    objc_msgSend(MEMORY[0x1E0D4B210], "partOfDayForItem:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = -[PGCurationPartOfDayTrait value](self->_partOfDayTrait, "value");
      v21 = +[PGGraphPartOfDayNode partOfDayForPartOfDayName:](PGGraphPartOfDayNode, "partOfDayForPartOfDayName:", v19);
      if (v21 != 1)
      {
        if ((v21 & ~v20) != 0)
          v22 = 0.0;
        else
          v22 = 1.0;
        v13 = v13 + v22;
        v23 = -[PGCurationTrait isMatchingRequired](self->_partOfDayTrait, "isMatchingRequired");
        v24 = v22 == 0.0 && v23;
        v33 |= v24;
        ++v18;
      }
    }

  }
  if (v33 || !-[PGCurationSDFoodTrait isActive](self->_sdFoodTrait, "isActive"))
  {
LABEL_30:
    if (!v18)
      goto LABEL_32;
  }
  else
  {
    if (!v10)
    {
      objc_msgSend(v7, "clsSceneClassifications");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    sdFoodTrait = self->_sdFoodTrait;
    objc_msgSend(v7, "curationModel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCurationCriteria _scoreForSceneClassifications:withSDFoodTrait:curationModel:traitFailed:](self, "_scoreForSceneClassifications:withSDFoodTrait:curationModel:traitFailed:", v10, sdFoodTrait, v26, &v33);
    v28 = v27;

    v13 = v13 + v28;
    ++v18;
  }
  v13 = v13 / (double)v18;
LABEL_32:
  v30 = v13 + -2.22044605e-16 <= 0.0 && v33 != 0;
  v33 = v30;
  if (a4)
    *a4 = v13;
  v31 = !v30;

  return v31;
}

- (id)passingAssetsInAssets:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[PGCurationCriteria passesForItem:score:](self, "passesForItem:score:", v11, 0, (_QWORD)v13))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)passesForItem:(id)a3 score:(double *)a4
{
  return -[PGCurationCriteria _passesForItem:score:graph:reasonString:](self, "_passesForItem:score:graph:reasonString:", a3, a4, 0, 0);
}

- (BOOL)_passesForItem:(id)a3 score:(double *)a4 graph:(id)a5 reasonString:(id *)a6
{
  id v10;
  id v11;
  id v12;
  double v13;
  BOOL v14;
  void *v15;
  double v16;
  PGCurationSceneTrait *compulsoryScenesTrait;
  void *v18;
  void *v19;
  PGCurationSceneTrait *scenesTrait;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  _BOOL4 v31;
  double v32;
  _BOOL4 v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  void *v48;
  BOOL v49;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  PGCurationSDFoodTrait *sdFoodTrait;
  void *v62;
  double v63;
  double v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  void *v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  BOOL v75;

  v10 = a3;
  v11 = a5;
  v75 = 0;
  if (a6)
    v12 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  else
    v12 = 0;
  if (self->_filterUtilityAssets)
  {
    objc_msgSend(v10, "clsContentScore");
    v14 = v13 < *MEMORY[0x1E0D77DE0];
    v75 = v14;
    if (v14)
    {
      objc_msgSend(v12, "appendString:", CFSTR("FAILED: item is utility\n"));
      v15 = 0;
      v16 = 0.0;
      goto LABEL_65;
    }
  }
  if (-[PGCurationSceneTrait isActive](self->_compulsoryScenesTrait, "isActive"))
  {
    objc_msgSend(v10, "clsSceneClassifications");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    compulsoryScenesTrait = self->_compulsoryScenesTrait;
    objc_msgSend(v10, "curationModel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCurationCriteria _scoreForSceneClassifications:withScenesTrait:curationModel:traitFailed:](self, "_scoreForSceneClassifications:withScenesTrait:curationModel:traitFailed:", v15, compulsoryScenesTrait, v18, &v75);

    if (v75)
    {
      -[PGCurationTrait niceDescription](self->_compulsoryScenesTrait, "niceDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendFormat:", CFSTR("FAILED: missing compulsory scenes %@"), v19);

      v16 = 0.0;
      if (v75)
        goto LABEL_65;
    }
    if (-[PGCurationSceneTrait isActive](self->_scenesTrait, "isActive"))
    {
      if (v15)
      {
LABEL_16:
        scenesTrait = self->_scenesTrait;
        objc_msgSend(v10, "curationModel");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGCurationCriteria _scoreForSceneClassifications:withScenesTrait:curationModel:traitFailed:](self, "_scoreForSceneClassifications:withScenesTrait:curationModel:traitFailed:", v15, scenesTrait, v21, &v75);
        v23 = v22;

        LODWORD(v21) = v75;
        -[PGCurationTrait niceDescription](self->_scenesTrait, "niceDescription");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v24;
        if ((_DWORD)v21)
          objc_msgSend(v12, "appendFormat:", CFSTR("FAILED: missing scenes %@"), v24, v67);
        else
          objc_msgSend(v12, "appendFormat:", CFSTR(" - scored %f on scenes %@\n"), *(_QWORD *)&v23, v24);
        v16 = v23 + 0.0;

        v26 = 1;
        goto LABEL_22;
      }
LABEL_15:
      objc_msgSend(v10, "clsSceneClassifications");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
  }
  else
  {
    if (-[PGCurationSceneTrait isActive](self->_scenesTrait, "isActive"))
      goto LABEL_15;
    v15 = 0;
  }
  v26 = 0;
  v16 = 0.0;
LABEL_22:
  if (v75)
    goto LABEL_60;
  if (-[PGCurationPartOfDayTrait isActive](self->_partOfDayTrait, "isActive"))
  {
    objc_msgSend(MEMORY[0x1E0D4B210], "partOfDayForItem:", v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v72 = v26;
      v28 = -[PGCurationPartOfDayTrait value](self->_partOfDayTrait, "value");
      v29 = +[PGGraphPartOfDayNode partOfDayForPartOfDayName:](PGGraphPartOfDayNode, "partOfDayForPartOfDayName:", v27);
      if (v29 != 1)
      {
        v30 = v29;
        v70 = v29 & v28;
        v31 = -[PGCurationTrait isMatchingRequired](self->_partOfDayTrait, "isMatchingRequired");
        if (v30 == v70)
          v32 = 1.0;
        else
          v32 = 0.0;
        v33 = v30 != v70 && v31;
        v75 = v33;
        ++v72;
        +[PGGraphPartOfDayNode stringValueForPartOfDay:](PGGraphPartOfDayNode, "stringValueForPartOfDay:", v28);
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = (void *)v34;
        if (v33)
          objc_msgSend(v12, "appendFormat:", CFSTR("FAILED: not matching part of day (%@ != %@)"), v27, v34, v68);
        else
          objc_msgSend(v12, "appendFormat:", CFSTR(" - scored %f on part of day (%@, expected %@)\n"), *(_QWORD *)&v32, v27, v34);
        v16 = v16 + v32;

      }
      v26 = v72;
    }

  }
  if (v75)
    goto LABEL_60;
  if (-[PGCurationSetTrait isActive](self->_peopleTrait, "isActive"))
  {
    v73 = v26;
    objc_msgSend(v10, "clsPersonAndPetLocalIdentifiers");
    v36 = objc_claimAutoreleasedReturnValue();
    -[PGCurationSetTrait items](self->_peopleTrait, "items");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (void *)v36;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "intersectSet:", v37);
    if (v12)
    {
      -[PGCurationCriteria peopleTraitStringWithGraph:](self, "peopleTraitStringWithGraph:", v11);
      v69 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v69 = 0;
    }
    if (objc_msgSend(v38, "isEqualToSet:", v37))
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v71);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "minusSet:", v38);
      v40 = objc_msgSend(v39, "count");
      if (v40 <= 0xA)
        v41 = (double)v40 / -10.0 + 1.0;
      else
        v41 = 0.0;
      ++v73;
      if (v75)
        objc_msgSend(v12, "appendFormat:", CFSTR("FAILED: too many people around %@"), v69, v67);
      else
        objc_msgSend(v12, "appendFormat:", CFSTR(" - scored %f on people %@\n"), *(_QWORD *)&v41, v69);
      v16 = v16 + v41;

      v42 = (void *)v69;
    }
    else
    {
      v75 = 1;
      v42 = (void *)v69;
      objc_msgSend(v12, "appendFormat:", CFSTR("FAILED: not matching people %@"), v69);
    }

    v26 = v73;
  }
  if (v75)
    goto LABEL_60;
  if (-[PGCurationSetTrait isActive](self->_socialGroupTrait, "isActive"))
  {
    v43 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v10, "clsPersonAndPetLocalIdentifiers");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setWithArray:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGCurationSetTrait items](self->_socialGroupTrait, "items");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "intersectSet:", v46);
    v47 = objc_msgSend(v45, "count");
    if (v47)
    {
      ++v26;
      v16 = v16 + (double)v47 / (double)(unint64_t)objc_msgSend(v46, "count");
    }
    else
    {
      v75 = 1;
      -[PGCurationTrait niceDescription](self->_socialGroupTrait, "niceDescription");
      v74 = v26;
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendFormat:", CFSTR("FAILED: not matching any people from social group %@"), v48);

      v26 = v74;
    }

  }
  if (v75)
    goto LABEL_60;
  if (!-[PGCurationContentOrAestheticScoreTrait isActive](self->_contentOrAestheticScoreTrait, "isActive"))
  {
LABEL_74:
    if (v75)
      goto LABEL_60;
    goto LABEL_75;
  }
  objc_msgSend(v10, "clsContentScore");
  v52 = v51;
  -[PGCurationTrait minimumScore](self->_contentOrAestheticScoreTrait, "minimumScore");
  v75 = v52 < v53;
  if (v52 < v53)
  {
    v54 = v53;
    objc_msgSend(v10, "clsAestheticScore");
    v56 = v55;
    -[PGCurationContentOrAestheticScoreTrait minimumAestheticScore](self->_contentOrAestheticScoreTrait, "minimumAestheticScore");
    v75 = v56 < v57;
    if (v56 < v57)
    {
      objc_msgSend(v12, "appendFormat:", CFSTR("FAILED: content score %.3f is lower than %.3f and aesthetic score %.3f is lower than %.3f"), *(_QWORD *)&v52, *(_QWORD *)&v54, *(_QWORD *)&v56, *(_QWORD *)&v57);
      goto LABEL_74;
    }
  }
LABEL_75:
  if (-[PGCurationCropScoreTrait isActive](self->_cropScoreTrait, "isActive"))
  {
    objc_msgSend(v10, "clsSquareCropScore");
    v59 = v58;
    -[PGCurationCropScoreTrait minimumSquareCropScore](self->_cropScoreTrait, "minimumSquareCropScore");
    v75 = v59 < v60;
    if (v59 >= v60)
      goto LABEL_79;
    objc_msgSend(v12, "appendFormat:", CFSTR("FAILED: crop score %.3f is lower than %.3f"), *(_QWORD *)&v59, *(_QWORD *)&v60);
  }
  if (!v75)
  {
LABEL_79:
    if (-[PGCurationSDFoodTrait isActive](self->_sdFoodTrait, "isActive"))
    {
      if (!v15)
      {
        objc_msgSend(v10, "clsSceneClassifications");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      sdFoodTrait = self->_sdFoodTrait;
      objc_msgSend(v10, "curationModel");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGCurationCriteria _scoreForSceneClassifications:withSDFoodTrait:curationModel:traitFailed:](self, "_scoreForSceneClassifications:withSDFoodTrait:curationModel:traitFailed:", v15, sdFoodTrait, v62, &v75);
      v64 = v63;

      ++v26;
      LODWORD(sdFoodTrait) = v75;
      -[PGCurationTrait niceDescription](self->_sdFoodTrait, "niceDescription");
      v65 = objc_claimAutoreleasedReturnValue();
      v66 = (void *)v65;
      if ((_DWORD)sdFoodTrait)
        objc_msgSend(v12, "appendFormat:", CFSTR("FAILED: missing SD food classification %@"), v65, v67);
      else
        objc_msgSend(v12, "appendFormat:", CFSTR(" - scored %f on SD food %@\n"), *(_QWORD *)&v64, v65);
      v16 = v16 + v64;

    }
  }
LABEL_60:
  if (!v75 && v26)
  {
    v16 = v16 / (double)v26;
    v75 = v16 <= 0.0;
    if (v16 > 0.0)
      objc_msgSend(v12, "appendFormat:", CFSTR("Scored %f for the whole criteria\n"), *(_QWORD *)&v16);
    else
      objc_msgSend(v12, "appendFormat:", CFSTR("FAILED: total score %f too low"), *(_QWORD *)&v16);
  }
LABEL_65:
  if (a4)
    *a4 = v16;
  if (a6)
    *a6 = objc_retainAutorelease(v12);
  v49 = !v75;

  return v49;
}

- (double)_scoreForSceneClassifications:(id)a3 withScenesTrait:(id)a4 curationModel:(id)a5 traitFailed:(BOOL *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  unint64_t v31;
  double v32;
  double v33;
  double v34;
  int v35;
  double v36;
  double v37;
  double v38;
  char v39;
  void *v41;
  id v42;
  BOOL *v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "sceneNames");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  if (v13)
  {
    v14 = v13;
    v41 = v12;
    v42 = v11;
    v43 = a6;
    v44 = v10;
    objc_msgSend(v10, "confidenceThresholdBySceneIdentifierWithCurationModel:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v45 = v9;
    v16 = v9;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v47;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v47 != v20)
            objc_enumerationMutation(v16);
          v22 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          v23 = objc_msgSend(v22, "extendedSceneIdentifier");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_msgSend(v22, "confidence");
            v27 = v26;
            objc_msgSend(v25, "doubleValue");
            if (v27 >= v28)
              ++v19;
          }

          if (v19 == v14)
          {
            v19 = v14;
            goto LABEL_17;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
        if (v18)
          continue;
        break;
      }
    }
    else
    {
      v19 = 0;
    }
LABEL_17:

    v10 = v44;
    v30 = objc_msgSend(v44, "targetNumberOfMatches");
    if (v30)
      v31 = v30;
    else
      v31 = v14;
    v32 = (double)v31;
    objc_msgSend(v44, "minimumScore");
    v34 = v33;
    v35 = objc_msgSend(v44, "isMatchingRequired");
    v36 = (double)v19 / v32;
    if (v35)
      v37 = v34;
    else
      v37 = 1.0;
    v38 = fmin(v36 / v37, 1.0);
    v39 = v35 & (v36 < v34);
    if (v39)
      v29 = 0.0;
    else
      v29 = v38;
    if (v43)
      *v43 &= v39;

    v9 = v45;
    v12 = v41;
    v11 = v42;
  }
  else
  {
    v29 = 0.0;
  }

  return v29;
}

- (double)_scoreForSceneClassifications:(id)a3 withSDFoodTrait:(id)a4 curationModel:(id)a5 traitFailed:(BOOL *)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  *a6 = 1;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  v12 = 0.0;
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v16, "extendedSceneIdentifier", (_QWORD)v21) == 2147482622)
        {
          objc_msgSend(v9, "sdModel");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "foodDrinkNode");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "confidence");
          v19 = objc_msgSend(v18, "passesWithConfidence:");

          if (v19)
          {
            *a6 = 0;
            v12 = 1.0;
          }
          goto LABEL_12;
        }
      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_12:

  return v12;
}

- (id)niceDescriptionWithGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t faceFilter;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_minimumAssetsRatio > 0.0)
    objc_msgSend(v5, "appendFormat:", CFSTR("minimumAssetsRatio = %f\n"), *(_QWORD *)&self->_minimumAssetsRatio);
  if (-[PGCurationSceneTrait isActive](self->_compulsoryScenesTrait, "isActive"))
  {
    -[PGCurationTrait niceDescription](self->_compulsoryScenesTrait, "niceDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("compulsoryScenes = %@\n"), v7);

  }
  if (-[PGCurationSceneTrait isActive](self->_scenesTrait, "isActive"))
  {
    -[PGCurationTrait niceDescription](self->_scenesTrait, "niceDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("scenes = %@\n"), v8);

  }
  if (-[PGCurationPartOfDayTrait isActive](self->_partOfDayTrait, "isActive"))
  {
    -[PGCurationPartOfDayTrait niceDescription](self->_partOfDayTrait, "niceDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("partOfDay = %@\n"), v9);

  }
  faceFilter = self->_faceFilter;
  if (faceFilter)
  {
    if (faceFilter == 1)
      v11 = CFSTR("Faces");
    else
      v11 = CFSTR("No Faces");
    objc_msgSend(v6, "appendFormat:", CFSTR("faceRequirement = %@\n"), v11);
  }
  if (-[PGCurationSetTrait isActive](self->_peopleTrait, "isActive"))
  {
    -[PGCurationCriteria peopleTraitStringWithGraph:](self, "peopleTraitStringWithGraph:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("people = %@\n"), v12);

  }
  if (-[PGCurationSetTrait isActive](self->_socialGroupTrait, "isActive"))
  {
    -[PGCurationTrait niceDescription](self->_socialGroupTrait, "niceDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("socialGroup = %@\n"), v13);

  }
  if (-[PGCurationContentOrAestheticScoreTrait isActive](self->_contentOrAestheticScoreTrait, "isActive"))
  {
    -[PGCurationTrait minimumScore](self->_contentOrAestheticScoreTrait, "minimumScore");
    v15 = v14;
    -[PGCurationContentOrAestheticScoreTrait minimumAestheticScore](self->_contentOrAestheticScoreTrait, "minimumAestheticScore");
    objc_msgSend(v6, "appendFormat:", CFSTR("content score >= %.3f or aesthetic score >= %.3f\n"), v15, v16);
  }
  if (self->_filterUtilityAssets)
    objc_msgSend(v6, "appendFormat:", CFSTR("filterUtilityAssets = YES\n"));

  return v6;
}

- (id)peopleTraitStringWithGraph:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  PGCurationCriteria *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[PGCurationSetTrait items](self->_peopleTrait, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithArray:", v7);

  -[PGCurationSetTrait negativeItems](self->_peopleTrait, "negativeItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v10);

  v48 = v8;
  v49 = v4;
  objc_msgSend(v4, "personNodesForPersonLocalIdentifiers:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v60 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v18, "localIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
    }
    while (v15);
  }
  v47 = v13;

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
  v21 = objc_claimAutoreleasedReturnValue();

  v22 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v46 = self;
  -[PGCurationSetTrait items](self->_peopleTrait, "items");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)v21;
  objc_msgSend(v23, "sortedArrayUsingDescriptors:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v56 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j);
        objc_msgSend(v12, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "name");
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = (void *)v31;
        if (v31)
          v33 = v31;
        else
          v33 = v29;
        objc_msgSend(v22, "appendFormat:", CFSTR("+ %@"), v33);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    }
    while (v26);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  -[PGCurationSetTrait negativeItems](v46->_peopleTrait, "negativeItems");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "sortedArrayUsingDescriptors:", v50);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v52;
    do
    {
      for (k = 0; k != v37; ++k)
      {
        if (*(_QWORD *)v52 != v38)
          objc_enumerationMutation(v35);
        v40 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * k);
        objc_msgSend(v12, "objectForKeyedSubscript:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "name");
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = (void *)v42;
        if (v42)
          v44 = v42;
        else
          v44 = v40;
        objc_msgSend(v22, "appendFormat:", CFSTR("- %@"), v44);

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    }
    while (v37);
  }

  return v22;
}

- (double)minimumAssetsRatio
{
  return self->_minimumAssetsRatio;
}

- (void)setMinimumAssetsRatio:(double)a3
{
  self->_minimumAssetsRatio = a3;
}

- (PGCurationSceneTrait)compulsoryScenesTrait
{
  return self->_compulsoryScenesTrait;
}

- (void)setCompulsoryScenesTrait:(id)a3
{
  objc_storeStrong((id *)&self->_compulsoryScenesTrait, a3);
}

- (PGCurationSceneTrait)scenesTrait
{
  return self->_scenesTrait;
}

- (void)setScenesTrait:(id)a3
{
  objc_storeStrong((id *)&self->_scenesTrait, a3);
}

- (PGCurationPartOfDayTrait)partOfDayTrait
{
  return self->_partOfDayTrait;
}

- (void)setPartOfDayTrait:(id)a3
{
  objc_storeStrong((id *)&self->_partOfDayTrait, a3);
}

- (unint64_t)faceFilter
{
  return self->_faceFilter;
}

- (void)setFaceFilter:(unint64_t)a3
{
  self->_faceFilter = a3;
}

- (PGCurationSetTrait)peopleTrait
{
  return self->_peopleTrait;
}

- (void)setPeopleTrait:(id)a3
{
  objc_storeStrong((id *)&self->_peopleTrait, a3);
}

- (PGCurationSetTrait)socialGroupTrait
{
  return self->_socialGroupTrait;
}

- (void)setSocialGroupTrait:(id)a3
{
  objc_storeStrong((id *)&self->_socialGroupTrait, a3);
}

- (PGCurationContentOrAestheticScoreTrait)contentOrAestheticScoreTrait
{
  return self->_contentOrAestheticScoreTrait;
}

- (void)setContentOrAestheticScoreTrait:(id)a3
{
  objc_storeStrong((id *)&self->_contentOrAestheticScoreTrait, a3);
}

- (PGCurationCropScoreTrait)cropScoreTrait
{
  return self->_cropScoreTrait;
}

- (void)setCropScoreTrait:(id)a3
{
  objc_storeStrong((id *)&self->_cropScoreTrait, a3);
}

- (PGCurationSDFoodTrait)sdFoodTrait
{
  return self->_sdFoodTrait;
}

- (void)setSdFoodTrait:(id)a3
{
  objc_storeStrong((id *)&self->_sdFoodTrait, a3);
}

- (BOOL)filterUtilityAssets
{
  return self->_filterUtilityAssets;
}

- (void)setFilterUtilityAssets:(BOOL)a3
{
  self->_filterUtilityAssets = a3;
}

- (unint64_t)client
{
  return self->_client;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sdFoodTrait, 0);
  objc_storeStrong((id *)&self->_cropScoreTrait, 0);
  objc_storeStrong((id *)&self->_contentOrAestheticScoreTrait, 0);
  objc_storeStrong((id *)&self->_socialGroupTrait, 0);
  objc_storeStrong((id *)&self->_peopleTrait, 0);
  objc_storeStrong((id *)&self->_partOfDayTrait, 0);
  objc_storeStrong((id *)&self->_scenesTrait, 0);
  objc_storeStrong((id *)&self->_compulsoryScenesTrait, 0);
}

@end
