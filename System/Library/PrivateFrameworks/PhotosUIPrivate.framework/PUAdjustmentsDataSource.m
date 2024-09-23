@implementation PUAdjustmentsDataSource

- (void)setupWithCompositionController:(id)a3 valuesCalculator:(id)a4 autoAdjustmentController:(id)a5 assetType:(unint64_t)a6
{
  PEValuesCalculator *v11;
  id v12;
  PICompositionController *compositionController;
  _BOOL4 v14;
  PICompositionController *v15;

  v15 = (PICompositionController *)a3;
  v11 = (PEValuesCalculator *)a4;
  v12 = a5;
  compositionController = self->_compositionController;
  v14 = compositionController != v15;
  if (compositionController != v15)
    objc_storeStrong((id *)&self->_compositionController, a3);
  if (self->_valuesCalculator != v11)
  {
    objc_storeStrong((id *)&self->_valuesCalculator, a4);
    v14 = 1;
  }
  if (-[PUAdjustmentsDataSource assetType](self, "assetType") == a6)
  {
    objc_storeStrong((id *)&self->_autoEnhanceController, a5);
    if (!v14)
      goto LABEL_10;
  }
  else
  {
    -[PUAdjustmentsDataSource setAssetType:](self, "setAssetType:", a6);
    objc_storeStrong((id *)&self->_autoEnhanceController, a5);
  }
  -[PUAdjustmentsDataSource _enableNonAutoAdjustments:](self, "_enableNonAutoAdjustments:", 1);
  -[PUAdjustmentsDataSource _updateAdjustmentInfos](self, "_updateAdjustmentInfos");
LABEL_10:

}

- (id)renderer
{
  void *v3;
  void *v4;

  -[PUAdjustmentsDataSource delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjustmentsRenderer:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setDefaultsForInfo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  double v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "attributeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 || (objc_msgSend(v18, "settingKey"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v18, "adjustmentKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0D71660];
      objc_msgSend(v18, "adjustmentKey");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "valueForType:adjustmentKey:settingKey:", 2, v6, v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      objc_msgSend(v18, "setMinimumLevel:", v8);

      v9 = (void *)MEMORY[0x1E0D71660];
      objc_msgSend(v18, "adjustmentKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "valueForType:adjustmentKey:settingKey:", 3, v10, v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      objc_msgSend(v18, "setMaximumLevel:", v12);

      v13 = (void *)MEMORY[0x1E0D71660];
      objc_msgSend(v18, "adjustmentKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "valueForType:adjustmentKey:settingKey:", 1, v14, v3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "floatValue");
      v17 = v16;

      objc_msgSend(v18, "setIdentityLevel:", v17);
      objc_msgSend(v18, "setDefaultLevel:", v17);
      objc_msgSend(v18, "setCurrentLevel:", v17);
      objc_msgSend(v18, "setLastAdjustedLevel:", v17);
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

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(PUAdjustmentInfo);
  -[PUAdjustmentInfo setIdentifier:](v14, "setIdentifier:", v13);

  -[PUAdjustmentInfo setAdjustmentKey:](v14, "setAdjustmentKey:", v12);
  -[PUAdjustmentInfo setSettingKey:](v14, "setSettingKey:", v11);

  -[PUAdjustmentInfo setAttributeKey:](v14, "setAttributeKey:", v10);
  -[PUAdjustmentsDataSource _setDefaultsForInfo:](self, "_setDefaultsForInfo:", v14);
  return v14;
}

- (id)_newAdjustmentInfoWithAdjustmentKey:(id)a3 settingKey:(id)a4 attributeKey:(id)a5
{
  return -[PUAdjustmentsDataSource _newAdjustmentInfoWithIdentifier:adjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithIdentifier:adjustmentKey:settingKey:attributeKey:", a3, a3, a4, a5);
}

- (void)_createAdjustmentInfos
{
  NSMutableArray *adjustmentInfoSections;
  void *v4;
  NSMutableArray *v5;
  void *v6;
  NSMutableArray *v7;
  void *v8;
  NSMutableArray *v9;
  void *v10;
  NSMutableArray *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  void *v15;
  NSMutableArray *v16;
  void *v17;
  NSMutableArray *v18;
  id v19;

  adjustmentInfoSections = self->_adjustmentInfoSections;
  -[PUAdjustmentsDataSource _autoEnhanceAdjustmentInfo](self, "_autoEnhanceAdjustmentInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](adjustmentInfoSections, "addObject:", v4);

  v5 = self->_adjustmentInfoSections;
  -[PUAdjustmentsDataSource _lightAdjustmentInfos](self, "_lightAdjustmentInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v5, "addObject:", v6);

  v7 = self->_adjustmentInfoSections;
  -[PUAdjustmentsDataSource _colorAdjustmentInfos](self, "_colorAdjustmentInfos");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v7, "addObject:", v8);

  v9 = self->_adjustmentInfoSections;
  -[PUAdjustmentsDataSource _detailAdjustmentInfos](self, "_detailAdjustmentInfos");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v9, "addObject:", v10);

  v11 = self->_adjustmentInfoSections;
  -[PUAdjustmentsDataSource _vignetteAdjustmentInfos](self, "_vignetteAdjustmentInfos");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v11, "addObject:", v12);

  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v13, "showSmartBlackAndWhiteAdjustment");

  if ((_DWORD)v12)
  {
    v14 = self->_adjustmentInfoSections;
    -[PUAdjustmentsDataSource _smartBlackAndWhiteAdjustmentInfos](self, "_smartBlackAndWhiteAdjustmentInfos");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v14, "addObject:", v15);

  }
  v16 = self->_adjustmentInfoSections;
  -[PUAdjustmentsDataSource _debugAdjustmentInfos](self, "_debugAdjustmentInfos");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v16, "addObject:", v17);

  v18 = self->_adjustmentInfoSections;
  -[PUAdjustmentsDataSource _headroomAdjustmentInfos](self, "_headroomAdjustmentInfos");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v18, "addObject:", v19);

}

- (id)_autoEnhanceAdjustmentInfo
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D712F0];
  v4 = *MEMORY[0x1E0D71468];
  objc_msgSend(MEMORY[0x1E0D712C0], "inputLightKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithIdentifier:adjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithIdentifier:adjustmentKey:settingKey:attributeKey:", v3, v4, v5, 0);

  PULocalizedString(CFSTR("PHOTOEDIT_ADJUSTMENTS_AUTO"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocalizedName:", v7);

  PULocalizedString(CFSTR("MENU_ITEM_TITLE_AUTO_ENHANCE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocalizedActionName:", v8);

  objc_msgSend(v6, "setIconName:", CFSTR("PUAutoEnhanceAdjustment"));
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setDataSource:", self);
  objc_msgSend(v6, "setCustomSettingDelegate:", v9);
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_lightAdjustmentInfos
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  PUAdjustmentsDataSource *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  PUAdjustmentsDataSource *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  id v42;
  _QWORD v43[7];
  _QWORD v44[7];

  v44[6] = *MEMORY[0x1E0C80C00];
  PULocalizedString(CFSTR("PHOTOEDIT_ADJUSTMENTS_LIGHT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D71468];
  objc_msgSend(MEMORY[0x1E0D712C0], "offsetExposureKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D712C0], "attributeExposureKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self;
  v8 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v4, v5, v6);

  objc_msgSend(v8, "setIconName:", CFSTR("PUExposureAdjustment"));
  PULocalizedString(CFSTR("PHOTOEDIT_ADJUSTMENTS_EXPOSURE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocalizedName:", v9);

  v42 = v8;
  objc_msgSend(v8, "setLocalizedSectionName:", v3);
  objc_msgSend(MEMORY[0x1E0D712C0], "offsetHighlightsKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D712C0], "attributeHighlightsKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  v13 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](v7, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v4, v10, v11);

  objc_msgSend(v13, "setIconName:", CFSTR("PUHighlightsAdjustment"));
  objc_msgSend(v13, "setAltIconName:", CFSTR("PUShadowsAdjustment"));
  objc_msgSend(v13, "setAltImageTransformBlock:", &__block_literal_global_5402);
  PULocalizedString(CFSTR("PHOTOEDIT_ADJUSTMENTS_HIGHLIGHTS"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLocalizedName:", v14);

  v41 = v13;
  objc_msgSend(v13, "setLocalizedSectionName:", v3);
  objc_msgSend(MEMORY[0x1E0D712C0], "offsetShadowsKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D712C0], "attributeShadowsKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](v7, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v4, v15, v16);

  objc_msgSend(v17, "setIconName:", CFSTR("PUShadowsAdjustment"));
  objc_msgSend(v17, "setAltIconName:", CFSTR("PUHighlightsAdjustment"));
  objc_msgSend(v17, "setAltImageTransformBlock:", &__block_literal_global_43);
  PULocalizedString(CFSTR("PHOTOEDIT_ADJUSTMENTS_SHADOWS"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLocalizedName:", v18);

  objc_msgSend(v17, "setLocalizedSectionName:", v3);
  v19 = (void *)objc_opt_new();
  objc_msgSend(v17, "setCustomSettingDelegate:", v19);

  objc_msgSend(MEMORY[0x1E0D712C0], "offsetContrastKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D712C0], "attributeContrastKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](v12, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v4, v20, v21);

  objc_msgSend(v22, "setIconName:", CFSTR("PUContrastAdjustment"));
  PULocalizedString(CFSTR("PHOTOEDIT_ADJUSTMENTS_CONTRAST"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setLocalizedName:", v23);

  objc_msgSend(v22, "setAltImageTransformBlock:", &__block_literal_global_51);
  objc_msgSend(v22, "setLocalizedSectionName:", v3);
  objc_msgSend(MEMORY[0x1E0D712C0], "offsetBrightnessKey");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D712C0], "attributeBrightnessKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](v12, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v4, v24, v25);

  objc_msgSend(v26, "setIconName:", CFSTR("PUBrightnessAdjustment"));
  PULocalizedString(CFSTR("PHOTOEDIT_ADJUSTMENTS_BRIGHTNESS"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setLocalizedName:", v27);

  objc_msgSend(v26, "setLocalizedSectionName:", v3);
  objc_msgSend(MEMORY[0x1E0D712C0], "offsetBlackKey");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D712C0], "attributeBlackPointKey");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](v12, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v4, v28, v29);

  objc_msgSend(v30, "setIconName:", CFSTR("PUBlackPointAdjustment"));
  PULocalizedString(CFSTR("PHOTOEDIT_ADJUSTMENTS_BLACK_POINT"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setLocalizedName:", v31);

  objc_msgSend(v30, "setLocalizedSectionName:", v3);
  if ((-[PUAdjustmentsDataSource assetType](v12, "assetType") & 2) != 0)
  {
    v38 = v41;
    v37 = v42;
    v44[0] = v42;
    v44[1] = v41;
    v44[2] = v17;
    v44[3] = v22;
    v44[4] = v26;
    v44[5] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 6);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D712C0], "offsetLocalLightKey");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D712C0], "attributeLocalLightKey");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](v12, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v4, v32, v33);

    objc_msgSend(v34, "setIconName:", CFSTR("PUBrillianceAdjustment"));
    PULocalizedString(CFSTR("PHOTOEDIT_ADJUSTMENTS_LOCAL_LIGHT"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setLocalizedName:", v35);

    objc_msgSend(v34, "setLocalizedSectionName:", v3);
    v36 = (void *)objc_opt_new();
    objc_msgSend(v34, "setCustomSettingDelegate:", v36);

    v38 = v41;
    v37 = v42;
    v43[0] = v42;
    v43[1] = v34;
    v43[2] = v41;
    v43[3] = v17;
    v43[4] = v22;
    v43[5] = v26;
    v43[6] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 7);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v39;
}

- (id)_colorAdjustmentInfos
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  PULocalizedString(CFSTR("PHOTOEDIT_ADJUSTMENTS_COLOR"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D71460];
  objc_msgSend(MEMORY[0x1E0D712B8], "offsetSaturationKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D712B8], "attributeVibrancyKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v4, v5, v6);

  objc_msgSend(v7, "setIconName:", CFSTR("PUSaturationAdjustment"));
  PULocalizedString(CFSTR("PHOTOEDIT_ADJUSTMENTS_COLOR_SATURATION"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalizedName:", v8);

  objc_msgSend(v7, "setLocalizedSectionName:", v3);
  objc_msgSend(v7, "setIconIsColor:", 1);
  objc_msgSend(MEMORY[0x1E0D712B8], "offsetContrastKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D712B8], "attributeContrastKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v4, v9, v10);

  objc_msgSend(v11, "setIconName:", CFSTR("PUVibranceAdjustment"));
  PULocalizedString(CFSTR("PHOTOEDIT_ADJUSTMENTS_COLOR_VIBRANCY"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLocalizedName:", v12);

  objc_msgSend(v11, "setLocalizedSectionName:", v3);
  objc_msgSend(v11, "setIconIsColor:", 1);
  v13 = *MEMORY[0x1E0D71488];
  objc_msgSend(MEMORY[0x1E0D712E0], "warmTempKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v13, v14, 0);

  objc_msgSend(v15, "setIconName:", CFSTR("PUTemperatureAdjustment"));
  PULocalizedString(CFSTR("PHOTOEDIT_ADJUSTMENTS_WHITE_BALANCE_WARMTH"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLocalizedName:", v16);

  objc_msgSend(v15, "setLocalizedSectionName:", v3);
  objc_msgSend(MEMORY[0x1E0D712E0], "warmTintKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v13, v17, 0);

  objc_msgSend(v18, "setIconName:", CFSTR("PUTintAdjustment"));
  PULocalizedString(CFSTR("PHOTOEDIT_ADJUSTMENTS_WHITE_BALANCE_TINT"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLocalizedName:", v19);

  objc_msgSend(v18, "setLocalizedSectionName:", v3);
  v22[0] = v7;
  v22[1] = v11;
  v22[2] = v15;
  v22[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_detailAdjustmentInfos
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  PULocalizedString(CFSTR("PHOTOEDIT_ADJUSTMENTS_DETAIL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D71448];
  objc_msgSend(MEMORY[0x1E0D712A8], "intensityKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v4, v5, 0);

  objc_msgSend(v6, "setIconName:", CFSTR("PUSharpenAdjustment"));
  PULocalizedString(CFSTR("PHOTOEDIT_ADJUSTMENTS_DETAIL_SHARPNESS"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocalizedName:", v7);

  objc_msgSend(v6, "setLocalizedSectionName:", v3);
  v8 = *MEMORY[0x1E0D71338];
  objc_msgSend(MEMORY[0x1E0D711B8], "intensityKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v8, v9, 0);

  objc_msgSend(v10, "setIconName:", CFSTR("PUDefinitionAdjustment"));
  PULocalizedString(CFSTR("PHOTOEDIT_ADJUSTMENTS_DETAIL_DEFINITION"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLocalizedName:", v11);

  objc_msgSend(v10, "setLocalizedSectionName:", v3);
  if ((-[PUAdjustmentsDataSource assetType](self, "assetType") & 1) != 0)
  {
    v12 = *MEMORY[0x1E0D713D8];
    objc_msgSend(MEMORY[0x1E0D71270], "luminanceKey");
  }
  else
  {
    v12 = *MEMORY[0x1E0D71388];
    objc_msgSend(MEMORY[0x1E0D711F0], "amountKey");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v12, v13, 0);

  objc_msgSend(v14, "setIconName:", CFSTR("PUNoiseReductionAdjustment"));
  PULocalizedString(CFSTR("PHOTOEDIT_ADJUSTMENTS_DETAIL_NOISE_REDUCTION"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLocalizedName:", v15);

  objc_msgSend(v14, "setLocalizedSectionName:", v3);
  v16 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", *MEMORY[0x1E0D71458], 0, 0);
  objc_msgSend(v16, "setIconName:", CFSTR("PUGrainAdjustment"));
  PULocalizedString(CFSTR("PHOTOEDIT_ADJUSTMENTS_BLACK_AND_WHITE_GRAIN"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLocalizedName:", v17);

  objc_msgSend(v16, "setLocalizedSectionName:", v3);
  v20[0] = v6;
  v20[1] = v10;
  v20[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_vignetteAdjustmentInfos
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = *MEMORY[0x1E0D71480];
  objc_msgSend(MEMORY[0x1E0D712D8], "intensityKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v4, v5, 0);

  objc_msgSend(v6, "setIconName:", CFSTR("PUVignetteTransitionAdjustment"));
  PULocalizedString(CFSTR("PHOTOEDIT_ADJUSTMENTS_VIGNETTE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocalizedName:", v7);

  objc_msgSend(v6, "setCustomSettingDelegate:", v3);
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_smartBlackAndWhiteAdjustmentInfos
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = *MEMORY[0x1E0D71458];
  objc_msgSend(MEMORY[0x1E0D712B0], "hueKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v4, v5, 0);

  objc_msgSend(v6, "setIconName:", CFSTR("PUExposureAdjustment"));
  objc_msgSend(v6, "setLocalizedName:", CFSTR("SmartBW Hue"));
  objc_msgSend(MEMORY[0x1E0D712B0], "strengthKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v4, v7, 0);

  objc_msgSend(v8, "setIconName:", CFSTR("PUExposureAdjustment"));
  objc_msgSend(v8, "setLocalizedName:", CFSTR("SmartBW Strength"));
  objc_msgSend(MEMORY[0x1E0D712B0], "neutralKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v4, v9, 0);

  objc_msgSend(v10, "setIconName:", CFSTR("PUExposureAdjustment"));
  objc_msgSend(v10, "setLocalizedName:", CFSTR("SmartBW Neutral"));
  objc_msgSend(MEMORY[0x1E0D712B0], "toneKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v4, v11, 0);

  objc_msgSend(v12, "setIconName:", CFSTR("PUExposureAdjustment"));
  objc_msgSend(v12, "setLocalizedName:", CFSTR("SmartBW Tone"));
  objc_msgSend(MEMORY[0x1E0D712B0], "grainKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v4, v13, 0);

  objc_msgSend(v14, "setIconName:", CFSTR("PUExposureAdjustment"));
  objc_msgSend(v14, "setLocalizedName:", CFSTR("SmartBW Grain"));
  objc_msgSend(v3, "addObject:", v8);
  objc_msgSend(v3, "addObject:", v6);
  objc_msgSend(v3, "addObject:", v10);
  objc_msgSend(v3, "addObject:", v12);
  objc_msgSend(v3, "addObject:", v14);

  return v3;
}

- (id)_debugAdjustmentInfos
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showHDRDebugAdjustments");

  if (v5)
  {
    v6 = *MEMORY[0x1E0D71330];
    objc_msgSend(MEMORY[0x1E0D711B0], "inputExposureKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v6, v7, 0);

    objc_msgSend(v8, "setIconName:", CFSTR("PUExposureAdjustment"));
    objc_msgSend(v8, "setLocalizedName:", CFSTR("Input Exposure"));
    objc_msgSend(MEMORY[0x1E0D711B0], "outputExposureKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v6, v9, 0);

    objc_msgSend(v10, "setIconName:", CFSTR("PUExposureAdjustment"));
    objc_msgSend(v10, "setLocalizedName:", CFSTR("Output Exposure"));
    objc_msgSend(MEMORY[0x1E0D711B0], "falseColorHDRKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v6, v11, 0);

    objc_msgSend(v12, "setIconName:", CFSTR("PUSaturationAdjustment"));
    objc_msgSend(v12, "setLocalizedName:", CFSTR("False Color HDR"));
    objc_msgSend(v12, "setIconIsColor:", 1);
    objc_msgSend(MEMORY[0x1E0D711B0], "inputRAWGamutMapMaxKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v6, v13, 0);

    objc_msgSend(v14, "setIconName:", CFSTR("PUExposureAdjustment"));
    objc_msgSend(v14, "setLocalizedName:", CFSTR("RAW HDR"));
    objc_msgSend(v3, "addObject:", v8);
    objc_msgSend(v3, "addObject:", v10);
    objc_msgSend(v3, "addObject:", v12);
    if ((-[PUAdjustmentsDataSource assetType](self, "assetType") & 1) != 0)
      objc_msgSend(v3, "addObject:", v14);

  }
  return v3;
}

- (id)_headroomAdjustmentInfos
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showHDRHeadroomControl");

  if (v5)
  {
    v6 = *MEMORY[0x1E0D71330];
    objc_msgSend(MEMORY[0x1E0D711B0], "headroomAdjustmentKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PUAdjustmentsDataSource _newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:](self, "_newAdjustmentInfoWithAdjustmentKey:settingKey:attributeKey:", v6, v7, 0);

    objc_msgSend(v8, "setIconName:", CFSTR("PUExposureAdjustment"));
    objc_msgSend(v8, "setLocalizedName:", CFSTR("HDR Highlight Brightness"));
    objc_msgSend(v3, "addObject:", v8);

  }
  return v3;
}

- (void)_enableNonAutoAdjustments:(BOOL)a3
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
  -[PUAdjustmentsDataSource adjustmentInfoSections](self, "adjustmentInfoSections");
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
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  double v19;
  double v20;
  double v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  PUAdjustmentsDataSource *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[PUAdjustmentsDataSource compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v26 = self;
  -[PUAdjustmentsDataSource adjustmentInfoSections](self, "adjustmentInfoSections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v33;
    v4 = (void *)*MEMORY[0x1E0D712F0];
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(obj);
        v25 = v5;
        v6 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v5);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v27 = v6;
        v7 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v29 != v9)
                objc_enumerationMutation(v27);
              v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v11, "identifier");
              v12 = (void *)objc_claimAutoreleasedReturnValue();

              if (v12 == v4)
              {
                objc_msgSend(v11, "setEnabled:", objc_msgSend(MEMORY[0x1E0D7CAC0], "isAutoEnhanceEnabledForCompositionController:", v3));
                -[PUAdjustmentsDataSource autoEnhanceController](v26, "autoEnhanceController");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "defaultAutoEnhanceIntensityForCompositionController:", v3);
                objc_msgSend(v11, "setDefaultLevel:");

              }
              objc_msgSend(v11, "attributeKey");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v14)
              {
                objc_msgSend(v11, "settingKey");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v14)
                  continue;
              }
              v15 = (void *)MEMORY[0x1E0D71660];
              objc_msgSend(v11, "adjustmentKey");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "valueForCompositionController:adjustmentKey:settingKey:", v3, v16, v14);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17)
              {
                objc_msgSend(v17, "floatValue");
                objc_msgSend(v11, "setCurrentLevel:", v18);
                if (v12 != v4 && (objc_msgSend(v11, "enabled") & 1) == 0)
                {
                  objc_msgSend(v11, "currentLevel");
                  v20 = v19;
                  objc_msgSend(v11, "defaultLevel");
                  objc_msgSend(v11, "setEnabled:", v20 != v21);
                }
              }
              else
              {
                objc_msgSend(v11, "defaultLevel");
                objc_msgSend(v11, "setCurrentLevel:");
              }

            }
            v8 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v8);
        }

        v5 = v25 + 1;
      }
      while (v25 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v24);
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
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_adjustmentInfoSections;
    self->_adjustmentInfoSections = v4;

    -[PUAdjustmentsDataSource _createAdjustmentInfos](self, "_createAdjustmentInfos");
    adjustmentInfoSections = self->_adjustmentInfoSections;
  }
  return adjustmentInfoSections;
}

- (int64_t)numberOfSections
{
  void *v2;
  int64_t v3;

  -[PUAdjustmentsDataSource adjustmentInfoSections](self, "adjustmentInfoSections");
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

  -[PUAdjustmentsDataSource adjustmentInfoSections](self, "adjustmentInfoSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (a3 < 0 || v6 <= a3)
    return 0;
  -[PUAdjustmentsDataSource adjustmentInfoSections](self, "adjustmentInfoSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  return v9;
}

- (int64_t)numberOfItemsInAllSections
{
  int64_t v3;
  int64_t v4;

  if (-[PUAdjustmentsDataSource numberOfSections](self, "numberOfSections") < 1)
    return 0;
  v3 = 0;
  v4 = 0;
  do
    v4 += -[PUAdjustmentsDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", v3++);
  while (v3 < -[PUAdjustmentsDataSource numberOfSections](self, "numberOfSections"));
  return v4;
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
  -[PUAdjustmentsDataSource adjustmentInfoSections](self, "adjustmentInfoSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 >= v8)
    goto LABEL_5;
  v9 = objc_msgSend(v5, "item");
  -[PUAdjustmentsDataSource adjustmentInfoSections](self, "adjustmentInfoSections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v9 < v12)
  {
    -[PUAdjustmentsDataSource adjustmentInfoSections](self, "adjustmentInfoSections");
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
  void *v4;
  void *v5;
  char v6;

  -[PUAdjustmentsDataSource compositionController](self, "compositionController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[PUAdjustmentsDataSource autoEnhanceController](self, "autoEnhanceController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isBusy");

  return v6 ^ 1;
}

- (void)beginInteractiveChange
{
  id v2;

  -[PUAdjustmentsDataSource delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willModifyAdjustment");

}

- (void)endInteractiveChange
{
  void *v3;
  id v4;

  -[PUAdjustmentsDataSource delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentsDataSource lastAdjustmentLocalizedName](self, "lastAdjustmentLocalizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didModifyAdjustmentWithLocalizedName:", v3);

}

- (void)setAdjustmentEnabled:(BOOL)a3 atIndexPath:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id *v10;
  NSObject *v11;
  _QWORD *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  _QWORD block[4];
  id v18;
  _QWORD v19[4];
  _QWORD v20[2];
  id v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v8 = a5;
  -[PUAdjustmentsDataSource infoForItemAtIndexPath:](self, "infoForItemAtIndexPath:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "enabled") == v6)
  {
    if (v8)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __78__PUAdjustmentsDataSource_setAdjustmentEnabled_atIndexPath_completionHandler___block_invoke;
      v22[3] = &unk_1E58ABAC8;
      v10 = &v23;
      v23 = v8;
      v11 = MEMORY[0x1E0C80D38];
      v12 = v22;
LABEL_11:
      dispatch_async(v11, v12);
      goto LABEL_12;
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
    objc_msgSend(v9, "customSettingDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      objc_msgSend(v9, "customSettingDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __78__PUAdjustmentsDataSource_setAdjustmentEnabled_atIndexPath_completionHandler___block_invoke_2;
      v19[3] = &unk_1E58ABAF0;
      v10 = (id *)v20;
      v16 = v9;
      v20[0] = v16;
      v20[1] = self;
      v21 = v8;
      objc_msgSend(v15, "dataSource:adjustmentInfo:setEnabled:completionHandler:", self, v16, v6, v19);

LABEL_12:
      goto LABEL_13;
    }
    -[PUAdjustmentsDataSource _modifyAdjustmentForInfo:](self, "_modifyAdjustmentForInfo:", v9);
    if (v8)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __78__PUAdjustmentsDataSource_setAdjustmentEnabled_atIndexPath_completionHandler___block_invoke_4;
      block[3] = &unk_1E58ABAC8;
      v10 = &v18;
      v18 = v8;
      v11 = MEMORY[0x1E0C80D38];
      v12 = block;
      goto LABEL_11;
    }
  }
LABEL_13:

}

- (void)_modifyAdjustmentForInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  PUAdjustmentsDataSource *v17;
  BOOL v18;

  v4 = a3;
  -[PUAdjustmentsDataSource compositionController](self, "compositionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adjustmentKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "adjustmentControllerForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  -[PUAdjustmentsDataSource delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "willModifyAdjustment");

  -[PUAdjustmentsDataSource compositionController](self, "compositionController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adjustmentKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__PUAdjustmentsDataSource__modifyAdjustmentForInfo___block_invoke;
  v15[3] = &unk_1E589BB40;
  v18 = v8;
  v16 = v4;
  v17 = self;
  v14 = v4;
  objc_msgSend(v10, "modifyAdjustmentWithKey:modificationBlock:", v11, v15);

  objc_msgSend(v14, "localizedActionName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentsDataSource delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "didModifyAdjustmentWithLocalizedName:", v12);

  -[PUAdjustmentsDataSource setLastAdjustmentLocalizedName:](self, "setLastAdjustmentLocalizedName:", v12);
}

- (void)modifyValue:(double)a3 atIndexPath:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a4;
  -[PUAdjustmentsDataSource infoForItemAtIndexPath:](self, "infoForItemAtIndexPath:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "enabled") & 1) == 0)
    -[PUAdjustmentsDataSource setAdjustmentEnabled:atIndexPath:completionHandler:](self, "setAdjustmentEnabled:atIndexPath:completionHandler:", 1, v12, 0);
  objc_msgSend(v6, "settingKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "customSettingDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8
      && (objc_msgSend(v6, "customSettingDelegate"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_opt_respondsToSelector(),
          v9,
          (v10 & 1) != 0))
    {
      objc_msgSend(v6, "customSettingDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dataSource:adjustmentInfo:modifyValue:", self, v6, a3);

    }
    else
    {
      objc_msgSend(v6, "setCurrentLevel:", a3);
      -[PUAdjustmentsDataSource _modifyAdjustmentForInfo:](self, "_modifyAdjustmentForInfo:", v6);
    }
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

  -[PUAdjustmentsDataSource infoForItemAtIndexPath:](self, "infoForItemAtIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    objc_msgSend(v4, "settingKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v8;
    if (v5)
    {
      -[PUAdjustmentsDataSource compositionController](self, "compositionController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "adjustmentKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __48__PUAdjustmentsDataSource_resetInfoAtIndexPath___block_invoke;
      v9[3] = &unk_1E58AB408;
      v10 = v8;
      objc_msgSend(v6, "modifyAdjustmentWithKey:modificationBlock:", v7, v9);

      v4 = v8;
    }
  }

}

- (void)_resetEnabledStateForAutoEnhancedInfos
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  BOOL v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[PUAdjustmentsDataSource compositionController](self, "compositionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "whiteBalanceAdjustmentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "warmFace");

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[PUAdjustmentsDataSource adjustmentInfoSections](self, "adjustmentInfoSections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v39;
    v6 = (void *)*MEMORY[0x1E0D71468];
    v7 = (void *)*MEMORY[0x1E0D71460];
    v32 = (void *)*MEMORY[0x1E0D71468];
    v33 = (void *)*MEMORY[0x1E0D71488];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v39 != v29)
          objc_enumerationMutation(obj);
        v31 = v8;
        v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v8);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v35 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
              objc_msgSend(v15, "identifier");
              v16 = objc_claimAutoreleasedReturnValue();
              v17 = v6;
              if ((void *)v16 == v6)
                goto LABEL_18;
              v18 = (void *)v16;
              objc_msgSend(v15, "identifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19 == v7)
              {

                v17 = v18;
LABEL_18:

LABEL_19:
                objc_msgSend(v15, "setEnabled:", 1);
                continue;
              }
              v20 = v19;
              if ((_DWORD)v5)
              {
                objc_msgSend(v15, "identifier");
                v21 = v12;
                v22 = v13;
                v23 = v7;
                v24 = v10;
                v25 = v5;
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                v27 = v26 == v33;
                v5 = v25;
                v10 = v24;
                v7 = v23;
                v13 = v22;
                v12 = v21;
                v6 = v32;
                if (v27)
                  goto LABEL_19;
              }
              else
              {

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          }
          while (v12);
        }

        v8 = v31 + 1;
      }
      while (v31 + 1 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v30);
  }

}

- (void)compositionControllerDidChange
{
  id v3;

  -[PUAdjustmentsDataSource _updateAdjustmentInfos](self, "_updateAdjustmentInfos");
  -[PUAdjustmentsDataSource delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjustmentsDataChanged:", self);

}

- (void)setAdjustmentInfoSections:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentInfoSections, a3);
}

- (PUAdjustmentsDataSourceDelegate)delegate
{
  return (PUAdjustmentsDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (PEAutoAdjustmentController)autoEnhanceController
{
  return self->_autoEnhanceController;
}

- (void)setAutoEnhanceController:(id)a3
{
  objc_storeStrong((id *)&self->_autoEnhanceController, a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(unint64_t)a3
{
  self->_assetType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAdjustmentLocalizedName, 0);
  objc_storeStrong((id *)&self->_valuesCalculator, 0);
  objc_storeStrong((id *)&self->_autoEnhanceController, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_adjustmentInfoSections, 0);
}

void __48__PUAdjustmentsDataSource_resetInfoAtIndexPath___block_invoke(uint64_t a1, void *a2)
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

void __52__PUAdjustmentsDataSource__modifyAdjustmentForInfo___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  v39 = a2;
  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "customSettingDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "customSettingDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dataSource:adjustmentInfo:populateNewAdjustmentController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v39);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D71488];

  if (v6 == v7)
  {
    v8 = (void *)MEMORY[0x1E0D712E0];
    v9 = *MEMORY[0x1E0D71490];
    v10 = v39;
    objc_msgSend(v10, "setColorType:", objc_msgSend(v8, "colorTypeForString:", v9));

  }
  objc_msgSend(*(id *)(a1 + 32), "currentLevel");
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "attributeKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0D71660];
    objc_msgSend(*(id *)(a1 + 40), "compositionController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "adjustmentKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "attributeKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "valueForCompositionController:adjustmentKey:settingKey:", v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0D71660];
    objc_msgSend(*(id *)(a1 + 40), "compositionController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "adjustmentKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "settingKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "valueForCompositionController:adjustmentKey:settingKey:", v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "doubleValue");
    v25 = v24;
    objc_msgSend(v23, "doubleValue");
    v27 = v25 - v26;
    objc_msgSend(*(id *)(a1 + 32), "currentLevel");
    v12 = v28 - v27;

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "enabled") & 1) != 0)
  {
    v29 = 1;
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "numberOfSections") < 1)
  {
    v29 = 0;
  }
  else
  {
    v30 = 0;
    do
    {
      if (objc_msgSend(*(id *)(a1 + 40), "numberOfItemsInSection:", v30) < 1)
      {
        v29 = 0;
      }
      else
      {
        v31 = 1;
        do
        {
          v32 = *(void **)(a1 + 40);
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v31 - 1, v30);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "infoForItemAtIndexPath:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v34, "adjustmentKey");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "adjustmentKey");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v35, "isEqualToString:", v36))
            v29 = objc_msgSend(v34, "enabled");
          else
            v29 = 0;

          if (v31 >= objc_msgSend(*(id *)(a1 + 40), "numberOfItemsInSection:", v30))
            break;
          ++v31;
        }
        while ((v29 & 1) == 0);
      }
      ++v30;
    }
    while (v30 < objc_msgSend(*(id *)(a1 + 40), "numberOfSections") && (v29 & 1) == 0);
  }
  objc_msgSend(v39, "setEnabled:", v29);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "settingKey");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v37, v38);

}

uint64_t __78__PUAdjustmentsDataSource_setAdjustmentEnabled_atIndexPath_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__PUAdjustmentsDataSource_setAdjustmentEnabled_atIndexPath_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD block[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)*MEMORY[0x1E0D712F0];

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentLevel");
    objc_msgSend(*(id *)(a1 + 32), "setDefaultLevel:");
  }
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adjustmentsDataChanged:", *(_QWORD *)(a1 + 40));

  v5 = *(void **)(a1 + 48);
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__PUAdjustmentsDataSource_setAdjustmentEnabled_atIndexPath_completionHandler___block_invoke_3;
    block[3] = &unk_1E58ABAC8;
    v7 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __78__PUAdjustmentsDataSource_setAdjustmentEnabled_atIndexPath_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__PUAdjustmentsDataSource_setAdjustmentEnabled_atIndexPath_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __48__PUAdjustmentsDataSource__lightAdjustmentInfos__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "imageWithHorizontallyFlippedOrientation");
}

uint64_t __48__PUAdjustmentsDataSource__lightAdjustmentInfos__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "imageWithHorizontallyFlippedOrientation");
}

uint64_t __48__PUAdjustmentsDataSource__lightAdjustmentInfos__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "imageWithHorizontallyFlippedOrientation");
}

@end
