@implementation PUCropPerspectiveAdjustmentsDataSource

- (PUCropPerspectiveAdjustmentsDataSource)init
{
  PUCropPerspectiveAdjustmentsDataSource *v2;
  PUCropPerspectiveAdjustmentsDataSource *v3;
  uint64_t v4;
  NSMutableDictionary *valueScaleForKey;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUCropPerspectiveAdjustmentsDataSource;
  v2 = -[PUCropPerspectiveAdjustmentsDataSource init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_orientation = 1;
    v4 = objc_opt_new();
    valueScaleForKey = v3->_valueScaleForKey;
    v3->_valueScaleForKey = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (void)setupWithCompositionController:(id)a3 valuesCalculator:(id)a4
{
  PEValuesCalculator *v7;
  PEValuesCalculator **p_valuesCalculator;
  PICompositionController *v9;

  v9 = (PICompositionController *)a3;
  v7 = (PEValuesCalculator *)a4;
  if (self->_compositionController != v9)
  {
    objc_storeStrong((id *)&self->_compositionController, a3);
    p_valuesCalculator = &self->_valuesCalculator;
    if (self->_valuesCalculator == v7)
      goto LABEL_6;
    goto LABEL_5;
  }
  p_valuesCalculator = &self->_valuesCalculator;
  if (self->_valuesCalculator != v7)
  {
LABEL_5:
    objc_storeStrong((id *)p_valuesCalculator, a4);
LABEL_6:
    -[PUCropPerspectiveAdjustmentsDataSource _enableNonAutoAjustments:](self, "_enableNonAutoAjustments:", 1);
    -[PUCropPerspectiveAdjustmentsDataSource _updateAdjustmentInfos](self, "_updateAdjustmentInfos");
  }

}

- (void)setOrientation:(int64_t)a3
{
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSMutableDictionary *valueScaleForKey;
  void *v33;
  id v34;
  void *v35;
  NSMutableDictionary *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;

  if (self->_orientation != a3)
  {
    v5 = PLOrientationBetweenOrientations();
    self->_orientation = a3;
    -[PUAdjustmentInfo currentLevel](self->_straightenAngleInfo, "currentLevel");
    v7 = v6;
    -[PUAdjustmentInfo lastAdjustedLevel](self->_straightenAngleInfo, "lastAdjustedLevel");
    v9 = v8;
    -[PUAdjustmentInfo settingKey](self->_straightenAngleInfo, "settingKey");
    v47 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_valueScaleForKey, "objectForKeyedSubscript:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    -[PUAdjustmentInfo currentLevel](self->_yawAngleInfo, "currentLevel");
    v13 = v12;
    -[PUAdjustmentInfo lastAdjustedLevel](self->_yawAngleInfo, "lastAdjustedLevel");
    v15 = v14;
    -[PUAdjustmentInfo settingKey](self->_yawAngleInfo, "settingKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAdjustmentInfo attributeKey](self->_yawAngleInfo, "attributeKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_valueScaleForKey, "objectForKeyedSubscript:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "intValue");

    -[PUAdjustmentInfo currentLevel](self->_pitchAngleInfo, "currentLevel");
    v21 = v20;
    -[PUAdjustmentInfo lastAdjustedLevel](self->_pitchAngleInfo, "lastAdjustedLevel");
    v23 = v22;
    -[PUAdjustmentInfo settingKey](self->_pitchAngleInfo, "settingKey");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAdjustmentInfo attributeKey](self->_pitchAngleInfo, "attributeKey");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_valueScaleForKey, "objectForKeyedSubscript:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "intValue");

    switch(v5)
    {
      case 2:
        -[PUAdjustmentInfo setCurrentLevel:](self->_yawAngleInfo, "setCurrentLevel:", -v13);
        -[PUAdjustmentInfo setLastAdjustedLevel:](self->_yawAngleInfo, "setLastAdjustedLevel:", -v15);
        -[PUAdjustmentInfo setCurrentLevel:](self->_straightenAngleInfo, "setCurrentLevel:", -v7);
        -[PUAdjustmentInfo setLastAdjustedLevel:](self->_straightenAngleInfo, "setLastAdjustedLevel:", -v9);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -(int)v19);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_valueScaleForKey, "setObject:forKeyedSubscript:", v28, v16);

        v29 = (void *)MEMORY[0x1E0CB37E8];
        goto LABEL_11;
      case 3:
        -[PUAdjustmentInfo setCurrentLevel:](self->_yawAngleInfo, "setCurrentLevel:", -v13);
        -[PUAdjustmentInfo setLastAdjustedLevel:](self->_yawAngleInfo, "setLastAdjustedLevel:", -v15);
        -[PUAdjustmentInfo setCurrentLevel:](self->_pitchAngleInfo, "setCurrentLevel:", -v21);
        -[PUAdjustmentInfo setLastAdjustedLevel:](self->_pitchAngleInfo, "setLastAdjustedLevel:", -v23);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -(int)v19);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_valueScaleForKey, "setObject:forKeyedSubscript:", v30, v16);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -(int)v27);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        valueScaleForKey = self->_valueScaleForKey;
        v33 = v31;
        v34 = v24;
        goto LABEL_14;
      case 4:
        -[PUAdjustmentInfo setCurrentLevel:](self->_pitchAngleInfo, "setCurrentLevel:", -v21);
        -[PUAdjustmentInfo setLastAdjustedLevel:](self->_pitchAngleInfo, "setLastAdjustedLevel:", -v23);
        -[PUAdjustmentInfo setCurrentLevel:](self->_straightenAngleInfo, "setCurrentLevel:", -v7);
        -[PUAdjustmentInfo setLastAdjustedLevel:](self->_straightenAngleInfo, "setLastAdjustedLevel:", -v9);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -(int)v27);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = self->_valueScaleForKey;
        v37 = v35;
        v38 = v24;
        goto LABEL_10;
      case 5:
        -[PUAdjustmentInfo setCurrentLevel:](self->_yawAngleInfo, "setCurrentLevel:", v21);
        -[PUAdjustmentInfo setLastAdjustedLevel:](self->_yawAngleInfo, "setLastAdjustedLevel:", v23);
        -[PUAdjustmentInfo setSettingKey:](self->_yawAngleInfo, "setSettingKey:", v24);
        -[PUAdjustmentInfo setAttributeKey:](self->_yawAngleInfo, "setAttributeKey:", v25);
        -[PUAdjustmentInfo setCurrentLevel:](self->_pitchAngleInfo, "setCurrentLevel:", v13);
        -[PUAdjustmentInfo setLastAdjustedLevel:](self->_pitchAngleInfo, "setLastAdjustedLevel:", v15);
        -[PUAdjustmentInfo setSettingKey:](self->_pitchAngleInfo, "setSettingKey:", v16);
        -[PUAdjustmentInfo setAttributeKey:](self->_pitchAngleInfo, "setAttributeKey:", v17);
        -[PUAdjustmentInfo setCurrentLevel:](self->_straightenAngleInfo, "setCurrentLevel:", -v7);
        -[PUAdjustmentInfo setLastAdjustedLevel:](self->_straightenAngleInfo, "setLastAdjustedLevel:", -v9);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_valueScaleForKey, "setObject:forKeyedSubscript:", v39, v24);

        v40 = (void *)MEMORY[0x1E0CB37E8];
        v41 = v19;
        goto LABEL_9;
      case 6:
        -[PUAdjustmentInfo setCurrentLevel:](self->_yawAngleInfo, "setCurrentLevel:", -v21);
        -[PUAdjustmentInfo setLastAdjustedLevel:](self->_yawAngleInfo, "setLastAdjustedLevel:", -v23);
        -[PUAdjustmentInfo setSettingKey:](self->_yawAngleInfo, "setSettingKey:", v24);
        -[PUAdjustmentInfo setAttributeKey:](self->_yawAngleInfo, "setAttributeKey:", v25);
        -[PUAdjustmentInfo setCurrentLevel:](self->_pitchAngleInfo, "setCurrentLevel:", v13);
        -[PUAdjustmentInfo setLastAdjustedLevel:](self->_pitchAngleInfo, "setLastAdjustedLevel:", v15);
        -[PUAdjustmentInfo setSettingKey:](self->_pitchAngleInfo, "setSettingKey:", v16);
        -[PUAdjustmentInfo setAttributeKey:](self->_pitchAngleInfo, "setAttributeKey:", v17);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -(int)v27);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_valueScaleForKey, "setObject:forKeyedSubscript:", v42, v24);

        v43 = (void *)MEMORY[0x1E0CB37E8];
        v44 = v19;
        goto LABEL_13;
      case 7:
        -[PUAdjustmentInfo setCurrentLevel:](self->_yawAngleInfo, "setCurrentLevel:", -v21);
        -[PUAdjustmentInfo setLastAdjustedLevel:](self->_yawAngleInfo, "setLastAdjustedLevel:", -v23);
        -[PUAdjustmentInfo setSettingKey:](self->_yawAngleInfo, "setSettingKey:", v24);
        -[PUAdjustmentInfo setAttributeKey:](self->_yawAngleInfo, "setAttributeKey:", v25);
        -[PUAdjustmentInfo setCurrentLevel:](self->_pitchAngleInfo, "setCurrentLevel:", -v13);
        -[PUAdjustmentInfo setLastAdjustedLevel:](self->_pitchAngleInfo, "setLastAdjustedLevel:", -v15);
        -[PUAdjustmentInfo setSettingKey:](self->_pitchAngleInfo, "setSettingKey:", v16);
        -[PUAdjustmentInfo setAttributeKey:](self->_pitchAngleInfo, "setAttributeKey:", v17);
        -[PUAdjustmentInfo setCurrentLevel:](self->_straightenAngleInfo, "setCurrentLevel:", -v7);
        -[PUAdjustmentInfo setLastAdjustedLevel:](self->_straightenAngleInfo, "setLastAdjustedLevel:", -v9);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -(int)v27);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_valueScaleForKey, "setObject:forKeyedSubscript:", v45, v24);

        v40 = (void *)MEMORY[0x1E0CB37E8];
        v41 = -(int)v19;
LABEL_9:
        objc_msgSend(v40, "numberWithInt:", v41);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = self->_valueScaleForKey;
        v37 = v35;
        v38 = v16;
LABEL_10:
        -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v37, v38);

        v29 = (void *)MEMORY[0x1E0CB37E8];
LABEL_11:
        objc_msgSend(v29, "numberWithInt:", -v11);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        valueScaleForKey = self->_valueScaleForKey;
        v33 = v31;
        v34 = v47;
        goto LABEL_14;
      case 8:
        -[PUAdjustmentInfo setCurrentLevel:](self->_yawAngleInfo, "setCurrentLevel:", v21);
        -[PUAdjustmentInfo setLastAdjustedLevel:](self->_yawAngleInfo, "setLastAdjustedLevel:", v23);
        -[PUAdjustmentInfo setSettingKey:](self->_yawAngleInfo, "setSettingKey:", v24);
        -[PUAdjustmentInfo setAttributeKey:](self->_yawAngleInfo, "setAttributeKey:", v25);
        -[PUAdjustmentInfo setCurrentLevel:](self->_pitchAngleInfo, "setCurrentLevel:", -v13);
        -[PUAdjustmentInfo setLastAdjustedLevel:](self->_pitchAngleInfo, "setLastAdjustedLevel:", -v15);
        -[PUAdjustmentInfo setSettingKey:](self->_pitchAngleInfo, "setSettingKey:", v16);
        -[PUAdjustmentInfo setAttributeKey:](self->_pitchAngleInfo, "setAttributeKey:", v17);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_valueScaleForKey, "setObject:forKeyedSubscript:", v46, v24);

        v43 = (void *)MEMORY[0x1E0CB37E8];
        v44 = -(int)v19;
LABEL_13:
        objc_msgSend(v43, "numberWithInt:", v44);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        valueScaleForKey = self->_valueScaleForKey;
        v33 = v31;
        v34 = v16;
LABEL_14:
        -[NSMutableDictionary setObject:forKeyedSubscript:](valueScaleForKey, "setObject:forKeyedSubscript:", v33, v34);

        break;
      default:
        break;
    }

  }
}

- (id)renderer
{
  void *v3;
  void *v4;

  -[PUCropPerspectiveAdjustmentsDataSource delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjustmentsRenderer:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setDefaultsForInfo:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  float v20;
  id v21;

  v21 = a3;
  objc_msgSend(v21, "attributeKey");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(v21, "adjustmentKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0D71660];
      objc_msgSend(v21, "adjustmentKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "attributeKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "valueForType:adjustmentKey:settingKey:", 2, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      objc_msgSend(v21, "setMinimumLevel:", v10);

      v11 = (void *)MEMORY[0x1E0D71660];
      objc_msgSend(v21, "adjustmentKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "attributeKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "valueForType:adjustmentKey:settingKey:", 3, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");
      objc_msgSend(v21, "setMaximumLevel:", v15);

      v16 = (void *)MEMORY[0x1E0D71660];
      objc_msgSend(v21, "adjustmentKey");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "attributeKey");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "valueForType:adjustmentKey:settingKey:", 1, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      objc_msgSend(v21, "setDefaultLevel:", v20);

      objc_msgSend(v21, "defaultLevel");
      objc_msgSend(v21, "setCurrentLevel:");
    }
  }

}

- (id)_newAdjustmentInfoWithIdentifier:(id)a3 adjustmentKey:(id)a4 settingKey:(id)a5 attributeKey:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PUAdjustmentInfo *v14;
  id v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(PUAdjustmentInfo);
  -[PUAdjustmentInfo setIdentifier:](v14, "setIdentifier:", v13);

  -[PUAdjustmentInfo setAdjustmentKey:](v14, "setAdjustmentKey:", v12);
  -[PUAdjustmentInfo setSettingKey:](v14, "setSettingKey:", v11);
  if (v10)
    v15 = v10;
  else
    v15 = v11;
  -[PUAdjustmentInfo setAttributeKey:](v14, "setAttributeKey:", v15);

  -[PUCropPerspectiveAdjustmentsDataSource _setDefaultsForInfo:](self, "_setDefaultsForInfo:", v14);
  return v14;
}

- (id)_newAdjustmentInfoWithAdjustmentKey:(id)a3 settingKey:(id)a4 attributeKey:(id)a5
{
  return -[PUCropPerspectiveAdjustmentsDataSource _newAdjustmentInfoWithIdentifier:adjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithIdentifier:adjustmentKey:settingKey:attributeKey:", a3, a3, a4, a5);
}

- (void)_createAdjustmentInfos
{
  NSMutableArray *adjustmentInfoSections;
  id v3;

  adjustmentInfoSections = self->_adjustmentInfoSections;
  -[PUCropPerspectiveAdjustmentsDataSource _geometryAdjustmentInfos](self, "_geometryAdjustmentInfos");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](adjustmentInfoSections, "addObject:", v3);

}

- (id)_geometryAdjustmentInfos
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  PUAdjustmentInfo *v7;
  PUAdjustmentInfo *straightenAngleInfo;
  NSMutableDictionary *valueScaleForKey;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  PUAdjustmentInfo *v17;
  PUAdjustmentInfo *pitchAngleInfo;
  void *v19;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  void *v23;
  void *v24;
  PUAdjustmentInfo *v25;
  PUAdjustmentInfo *yawAngleInfo;
  void *v27;
  void *v28;
  NSMutableDictionary *v29;
  void *v30;
  void *v31;
  __int128 v33;
  PUAdjustmentInfo *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  PULocalizedString(CFSTR("PHOTOEDIT_CROP_ADJUSTMENTS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D71328];
  objc_msgSend(MEMORY[0x1E0D711A8], "angleKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D711A8], "angleKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PUCropPerspectiveAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v4, v5, v6);
  straightenAngleInfo = self->_straightenAngleInfo;
  self->_straightenAngleInfo = v7;

  valueScaleForKey = self->_valueScaleForKey;
  -[PUAdjustmentInfo settingKey](self->_straightenAngleInfo, "settingKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](valueScaleForKey, "setObject:forKeyedSubscript:", &unk_1E59BC3F0, v10);

  -[PUAdjustmentInfo setIconName:](self->_straightenAngleInfo, "setIconName:", CFSTR("PUPerspectiveToolRoll"));
  PULocalizedString(CFSTR("PHOTOEDIT_CROP_ADJUSTMENTS_STRAIGHTEN"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentInfo setLocalizedName:](self->_straightenAngleInfo, "setLocalizedName:", v11);

  PULocalizedString(CFSTR("PHOTOEDIT_CROP_ADJUSTMENTS_STRAIGHTEN_ACTION"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentInfo setLocalizedActionName:](self->_straightenAngleInfo, "setLocalizedActionName:", v12);

  -[PUAdjustmentInfo setLocalizedSectionName:](self->_straightenAngleInfo, "setLocalizedSectionName:", v3);
  v13 = self->_valueScaleForKey;
  -[PUAdjustmentInfo settingKey](self->_straightenAngleInfo, "settingKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", &unk_1E59BC3F0, v14);

  objc_msgSend(MEMORY[0x1E0D711A8], "pitchKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D711A8], "pitchKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PUCropPerspectiveAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v4, v15, v16);
  pitchAngleInfo = self->_pitchAngleInfo;
  self->_pitchAngleInfo = v17;

  -[PUAdjustmentInfo setIconName:](self->_pitchAngleInfo, "setIconName:", CFSTR("PUPerspectiveToolPitch"));
  PULocalizedString(CFSTR("PHOTOEDIT_CROP_ADJUSTMENTS_PERSPECTIVE_VERTICAL"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentInfo setLocalizedName:](self->_pitchAngleInfo, "setLocalizedName:", v19);

  PULocalizedString(CFSTR("PHOTOEDIT_CROP_ADJUSTMENTS_PERSPECTIVE_VERTICAL_ACTION"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentInfo setLocalizedActionName:](self->_pitchAngleInfo, "setLocalizedActionName:", v20);

  -[PUAdjustmentInfo setLocalizedSectionName:](self->_pitchAngleInfo, "setLocalizedSectionName:", v3);
  v21 = self->_valueScaleForKey;
  -[PUAdjustmentInfo settingKey](self->_pitchAngleInfo, "settingKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", &unk_1E59BC3F0, v22);

  objc_msgSend(MEMORY[0x1E0D711A8], "yawKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D711A8], "yawKey");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[PUCropPerspectiveAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v4, v23, v24);
  yawAngleInfo = self->_yawAngleInfo;
  self->_yawAngleInfo = v25;

  -[PUAdjustmentInfo setIconName:](self->_yawAngleInfo, "setIconName:", CFSTR("PUPerspectiveToolYaw"));
  PULocalizedString(CFSTR("PHOTOEDIT_CROP_ADJUSTMENTS_PERSPECTIVE_HORIZONTAL"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentInfo setLocalizedName:](self->_yawAngleInfo, "setLocalizedName:", v27);

  PULocalizedString(CFSTR("PHOTOEDIT_CROP_ADJUSTMENTS_PERSPECTIVE_HORIZONTAL_ACTION"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentInfo setLocalizedActionName:](self->_yawAngleInfo, "setLocalizedActionName:", v28);

  -[PUAdjustmentInfo setLocalizedSectionName:](self->_yawAngleInfo, "setLocalizedSectionName:", v3);
  v29 = self->_valueScaleForKey;
  -[PUAdjustmentInfo settingKey](self->_yawAngleInfo, "settingKey");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", &unk_1E59BC3F0, v30);

  v33 = *(_OWORD *)&self->_straightenAngleInfo;
  v34 = self->_yawAngleInfo;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (void)_enableNonAutoAjustments:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  id obj;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[PUCropPerspectiveAdjustmentsDataSource adjustmentInfoSections](self, "adjustmentInfoSections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = v4;
    v17 = *(_QWORD *)v23;
    v6 = (void *)*MEMORY[0x1E0D712F0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v19 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
              objc_msgSend(v14, "identifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15 != v6)
                objc_msgSend(v14, "setEnabled:", v3);
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v11);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }

}

- (void)_updateAdjustmentInfos
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  NSMutableDictionary *valueScaleForKey;
  void *v20;
  void *v21;
  _BOOL8 v22;
  double v23;
  double v24;
  double v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[PUCropPerspectiveAdjustmentsDataSource adjustmentInfoSections](self, "adjustmentInfoSections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  v3 = 0;
  if (v28)
  {
    v27 = *(_QWORD *)v36;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(obj);
        v29 = v4;
        v5 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v4);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v30 = v5;
        v6 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v32 != v8)
                objc_enumerationMutation(v30);
              v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
              objc_msgSend(v10, "attributeKey");
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              if (v11)
              {
                v12 = (void *)MEMORY[0x1E0D71660];
                -[PUCropPerspectiveAdjustmentsDataSource compositionController](self, "compositionController");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "adjustmentKey");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "attributeKey");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "valueForCompositionController:adjustmentKey:settingKey:", v13, v14, v15);
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                if (v16)
                {
                  objc_msgSend(v16, "floatValue");
                  v18 = v17;
                  valueScaleForKey = self->_valueScaleForKey;
                  objc_msgSend(v10, "settingKey");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableDictionary objectForKeyedSubscript:](valueScaleForKey, "objectForKeyedSubscript:", v20);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "setCurrentLevel:", (float)(v18 * (float)(int)objc_msgSend(v21, "intValue")));

                  if ((objc_msgSend(v10, "enabled") & 1) != 0)
                  {
                    v22 = 1;
                  }
                  else
                  {
                    objc_msgSend(v10, "currentLevel");
                    v24 = v23;
                    objc_msgSend(v10, "defaultLevel");
                    v22 = v24 != v25;
                  }
                  objc_msgSend(v10, "setEnabled:", v22);
                  v3 = v16;
                }
                else
                {
                  objc_msgSend(v10, "defaultLevel");
                  objc_msgSend(v10, "setCurrentLevel:");
                  v3 = 0;
                }
              }
            }
            v7 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v7);
        }

        v4 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v28);
  }

}

- (NSMutableArray)adjustmentInfoSections
{
  NSMutableArray *adjustmentInfoSections;
  NSMutableArray *v4;
  NSMutableArray *v5;

  adjustmentInfoSections = self->_adjustmentInfoSections;
  if (!adjustmentInfoSections)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    v5 = self->_adjustmentInfoSections;
    self->_adjustmentInfoSections = v4;

    -[PUCropPerspectiveAdjustmentsDataSource _createAdjustmentInfos](self, "_createAdjustmentInfos");
    adjustmentInfoSections = self->_adjustmentInfoSections;
  }
  return adjustmentInfoSections;
}

- (int64_t)numberOfSections
{
  void *v2;
  int64_t v3;

  -[PUCropPerspectiveAdjustmentsDataSource adjustmentInfoSections](self, "adjustmentInfoSections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  int64_t v9;

  -[PUCropPerspectiveAdjustmentsDataSource adjustmentInfoSections](self, "adjustmentInfoSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (a3 < 0 || v6 <= a3)
    return 0;
  -[PUCropPerspectiveAdjustmentsDataSource adjustmentInfoSections](self, "adjustmentInfoSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  return v9;
}

- (id)infoForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  v6 = objc_msgSend(v4, "section");
  -[PUCropPerspectiveAdjustmentsDataSource adjustmentInfoSections](self, "adjustmentInfoSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 >= v8)
    goto LABEL_5;
  v9 = objc_msgSend(v5, "item");
  -[PUCropPerspectiveAdjustmentsDataSource adjustmentInfoSections](self, "adjustmentInfoSections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v9 < v12)
  {
    -[PUCropPerspectiveAdjustmentsDataSource adjustmentInfoSections](self, "adjustmentInfoSections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v5, "item"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    v15 = 0;
  }

  return v15;
}

- (BOOL)canModifyAdjustmentAtIndexPath:(id)a3
{
  void *v3;
  BOOL v4;

  -[PUCropPerspectiveAdjustmentsDataSource compositionController](self, "compositionController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)beginInteractiveChange
{
  id v2;

  -[PUCropPerspectiveAdjustmentsDataSource delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willModifyAdjustment");

}

- (void)endInteractiveChange
{
  void *v3;
  id v4;

  -[PUCropPerspectiveAdjustmentsDataSource delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUCropPerspectiveAdjustmentsDataSource lastAdjustmentLocalizedName](self, "lastAdjustmentLocalizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didModifyAdjustmentWithLocalizedName:", v3);

}

- (void)setAdjustmentEnabled:(BOOL)a3 atIndexPath:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  uint64_t (*v10)(uint64_t);
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a3;
  v8 = a5;
  -[PUCropPerspectiveAdjustmentsDataSource infoForItemAtIndexPath:](self, "infoForItemAtIndexPath:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "enabled") == v6)
  {
    if (v8)
    {
      v13 = MEMORY[0x1E0C809B0];
      v10 = __93__PUCropPerspectiveAdjustmentsDataSource_setAdjustmentEnabled_atIndexPath_completionHandler___block_invoke;
      v11 = &v13;
LABEL_9:
      v11[1] = 3221225472;
      v11[2] = (uint64_t)v10;
      v11[3] = (uint64_t)&unk_1E58ABAC8;
      v11[4] = (uint64_t)v8;
      dispatch_async(MEMORY[0x1E0C80D38], v11);

    }
  }
  else
  {
    objc_msgSend(v9, "setEnabled:", v6);
    if (objc_msgSend(v9, "enabled"))
      objc_msgSend(v9, "lastAdjustedLevel");
    else
      objc_msgSend(v9, "defaultLevel");
    objc_msgSend(v9, "setCurrentLevel:");
    -[PUCropPerspectiveAdjustmentsDataSource _modifyAdjustmentForInfo:](self, "_modifyAdjustmentForInfo:", v9);
    if (v8)
    {
      v12 = MEMORY[0x1E0C809B0];
      v10 = __93__PUCropPerspectiveAdjustmentsDataSource_setAdjustmentEnabled_atIndexPath_completionHandler___block_invoke_2;
      v11 = &v12;
      goto LABEL_9;
    }
  }

}

- (void)_modifyAdjustmentForInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PUCropPerspectiveAdjustmentsDataSource *v13;

  v4 = a3;
  -[PUCropPerspectiveAdjustmentsDataSource delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willModifyAdjustment");

  -[PUCropPerspectiveAdjustmentsDataSource compositionController](self, "compositionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adjustmentKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__PUCropPerspectiveAdjustmentsDataSource__modifyAdjustmentForInfo___block_invoke;
  v11[3] = &unk_1E58AB3E0;
  v12 = v4;
  v13 = self;
  v10 = v4;
  objc_msgSend(v6, "modifyAdjustmentWithKey:modificationBlock:", v7, v11);

  objc_msgSend(v10, "localizedActionName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCropPerspectiveAdjustmentsDataSource delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didModifyAdjustmentWithLocalizedName:", v8);

  -[PUCropPerspectiveAdjustmentsDataSource setLastAdjustmentLocalizedName:](self, "setLastAdjustmentLocalizedName:", v8);
}

- (void)modifyValue:(double)a3 atIndexPath:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[PUCropPerspectiveAdjustmentsDataSource infoForItemAtIndexPath:](self, "infoForItemAtIndexPath:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "enabled") & 1) == 0)
    -[PUCropPerspectiveAdjustmentsDataSource setAdjustmentEnabled:atIndexPath:completionHandler:](self, "setAdjustmentEnabled:atIndexPath:completionHandler:", 1, v8, 0);
  objc_msgSend(v6, "settingKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "setCurrentLevel:", a3);
    -[PUCropPerspectiveAdjustmentsDataSource _modifyAdjustmentForInfo:](self, "_modifyAdjustmentForInfo:", v6);
  }

}

- (void)resetInfoAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  -[PUCropPerspectiveAdjustmentsDataSource infoForItemAtIndexPath:](self, "infoForItemAtIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    objc_msgSend(v4, "settingKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v8;
    if (v5)
    {
      -[PUCropPerspectiveAdjustmentsDataSource compositionController](self, "compositionController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "adjustmentKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __63__PUCropPerspectiveAdjustmentsDataSource_resetInfoAtIndexPath___block_invoke;
      v9[3] = &unk_1E58AB408;
      v10 = v8;
      objc_msgSend(v6, "modifyAdjustmentWithKey:modificationBlock:", v7, v9);

      v4 = v8;
    }
  }

}

- (void)setAdjustmentInfoSections:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentInfoSections, a3);
}

- (PUCropPerspectiveAdjustmentsDataSourceDelegate)delegate
{
  return (PUCropPerspectiveAdjustmentsDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (void)setCompositionController:(id)a3
{
  objc_storeStrong((id *)&self->_compositionController, a3);
}

- (PEValuesCalculator)valuesCalculator
{
  return self->_valuesCalculator;
}

- (void)setValuesCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_valuesCalculator, a3);
}

- (NSString)lastAdjustmentLocalizedName
{
  return self->_lastAdjustmentLocalizedName;
}

- (void)setLastAdjustmentLocalizedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAdjustmentLocalizedName, 0);
  objc_storeStrong((id *)&self->_valuesCalculator, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_adjustmentInfoSections, 0);
  objc_storeStrong((id *)&self->_valueScaleForKey, 0);
  objc_storeStrong((id *)&self->_yawAngleInfo, 0);
  objc_storeStrong((id *)&self->_pitchAngleInfo, 0);
  objc_storeStrong((id *)&self->_straightenAngleInfo, 0);
}

void __63__PUCropPerspectiveAdjustmentsDataSource_resetInfoAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "setEnabled:", 0);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "defaultLevel");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "settingKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v5);

}

void __67__PUCropPerspectiveAdjustmentsDataSource__modifyAdjustmentForInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  objc_msgSend(v3, "setEnabled:", 1);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "currentLevel");
  v6 = v5;
  v7 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
  objc_msgSend(*(id *)(a1 + 32), "settingKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithDouble:", v6 * (double)(int)objc_msgSend(v9, "intValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "settingKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v11);

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "adjustmentsDataChanged:", *(_QWORD *)(a1 + 40));

}

uint64_t __93__PUCropPerspectiveAdjustmentsDataSource_setAdjustmentEnabled_atIndexPath_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __93__PUCropPerspectiveAdjustmentsDataSource_setAdjustmentEnabled_atIndexPath_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
