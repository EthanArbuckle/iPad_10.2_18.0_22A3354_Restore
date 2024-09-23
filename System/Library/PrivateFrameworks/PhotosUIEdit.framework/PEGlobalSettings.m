@implementation PEGlobalSettings

- (PEGlobalSettings)init
{
  PEGlobalSettings *v2;
  PEGlobalSettings *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PEGlobalSettings;
  v2 = -[PEGlobalSettings init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PEGlobalSettings _setInitialValues](v2, "_setInitialValues");
  return v3;
}

- (void)_setInitialValues
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
  void *v12;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v3 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(sel_smartCopyPasteReviewUIEnabled);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PE_SETTINGS_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGlobalSettings setSmartCopyPasteReviewUIEnabled:](self, "setSmartCopyPasteReviewUIEnabled:", -[PEGlobalSettings existingBoolValueForKey:withDefaultValue:](self, "existingBoolValueForKey:withDefaultValue:", v6, 0));

  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(sel_smartCopyPasteGateOnCaptureTime);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uppercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("PE_SETTINGS_%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGlobalSettings setSmartCopyPasteGateOnCaptureTime:](self, "setSmartCopyPasteGateOnCaptureTime:", -[PEGlobalSettings existingBoolValueForKey:withDefaultValue:](self, "existingBoolValueForKey:withDefaultValue:", v10, 0));

  v11 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(sel_smartCopyPasteSimilarityGatingThreshold);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uppercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("PE_SETTINGS_%@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGlobalSettings setSmartCopyPasteSimilarityGatingThreshold:](self, "setSmartCopyPasteSimilarityGatingThreshold:", (double)-[PEGlobalSettings existingFloatValueForKey:withDefaultValue:](self, "existingFloatValueForKey:withDefaultValue:", v14, 0.8));

  v15 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(sel_affectManuallyEditedSlidersOnly);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "uppercaseString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("PE_SETTINGS_%@"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGlobalSettings setAffectManuallyEditedSlidersOnly:](self, "setAffectManuallyEditedSlidersOnly:", -[PEGlobalSettings existingBoolValueForKey:withDefaultValue:](self, "existingBoolValueForKey:withDefaultValue:", v18, 0));

  v19 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(sel_useEngPlaceholderNames);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "uppercaseString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("PE_SETTINGS_%@"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGlobalSettings setUseEngPlaceholderNames:](self, "setUseEngPlaceholderNames:", -[PEGlobalSettings existingBoolValueForKey:withDefaultValue:](self, "existingBoolValueForKey:withDefaultValue:", v22, 0));

  v23 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(sel_synchronousStylesCopyPaste);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "uppercaseString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("PE_SETTINGS_%@"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGlobalSettings setSynchronousStylesCopyPaste:](self, "setSynchronousStylesCopyPaste:", -[PEGlobalSettings existingBoolValueForKey:withDefaultValue:](self, "existingBoolValueForKey:withDefaultValue:", v26, 0));

  v27 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(sel_shouldUseFlipAnimationForValuePlatter);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "uppercaseString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringWithFormat:", CFSTR("PE_SETTINGS_%@"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEGlobalSettings setShouldUseFlipAnimationForValuePlatter:](self, "setShouldUseFlipAnimationForValuePlatter:", -[PEGlobalSettings existingBoolValueForKey:withDefaultValue:](self, "existingBoolValueForKey:withDefaultValue:", v29, 1));

}

- (BOOL)existingBoolValueForKey:(id)a3 withDefaultValue:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    a4 = objc_msgSend(v8, "BOOLForKey:", v5);

  }
  return a4;
}

- (BOOL)existingFloatValueForKey:(id)a3 withDefaultValue:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  BOOL v10;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatForKey:", v5);
    v10 = v9 != 0.0;

  }
  else
  {
    v10 = a4 != 0.0;
  }

  return v10;
}

- (BOOL)smartCopyPasteReviewUIEnabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(sel_smartCopyPasteReviewUIEnabled);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PE_SETTINGS_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "BOOLForKey:", v6);

  return v7;
}

- (void)setSmartCopyPasteReviewUIEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(sel_smartCopyPasteReviewUIEnabled);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PE_SETTINGS_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBool:forKey:", v3, v7);

}

- (BOOL)smartCopyPasteGateOnCaptureTime
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(sel_smartCopyPasteGateOnCaptureTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PE_SETTINGS_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "BOOLForKey:", v6);

  return v7;
}

- (void)setSmartCopyPasteGateOnCaptureTime:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(sel_smartCopyPasteGateOnCaptureTime);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PE_SETTINGS_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBool:forKey:", v3, v7);

}

- (double)smartCopyPasteSimilarityGatingThreshold
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(sel_smartCopyPasteSimilarityGatingThreshold);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PE_SETTINGS_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatForKey:", v6);
  v8 = v7;

  return v8;
}

- (void)setSmartCopyPasteSimilarityGatingThreshold:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(sel_smartCopyPasteSimilarityGatingThreshold);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PE_SETTINGS_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  objc_msgSend(v9, "setFloat:forKey:", v7, v8);

}

- (BOOL)affectManuallyEditedSlidersOnly
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(sel_affectManuallyEditedSlidersOnly);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PE_SETTINGS_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "BOOLForKey:", v6);

  return v7;
}

- (void)setAffectManuallyEditedSlidersOnly:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(sel_affectManuallyEditedSlidersOnly);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PE_SETTINGS_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBool:forKey:", v3, v7);

}

- (BOOL)useEngPlaceholderNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(sel_useEngPlaceholderNames);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PE_SETTINGS_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "BOOLForKey:", v6);

  return v7;
}

- (void)setUseEngPlaceholderNames:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(sel_useEngPlaceholderNames);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PE_SETTINGS_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBool:forKey:", v3, v7);

}

- (BOOL)synchronousStylesCopyPaste
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(sel_synchronousStylesCopyPaste);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PE_SETTINGS_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "BOOLForKey:", v6);

  return v7;
}

- (void)setSynchronousStylesCopyPaste:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(sel_synchronousStylesCopyPaste);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PE_SETTINGS_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBool:forKey:", v3, v7);

}

- (BOOL)shouldUseFlipAnimationForValuePlatter
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(sel_shouldUseFlipAnimationForValuePlatter);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PE_SETTINGS_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "BOOLForKey:", v6);

  return v7;
}

- (void)setShouldUseFlipAnimationForValuePlatter:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(sel_shouldUseFlipAnimationForValuePlatter);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PE_SETTINGS_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBool:forKey:", v3, v7);

}

- (BOOL)fetchAndSendScenePrintsForSliderNet
{
  return self->_fetchAndSendScenePrintsForSliderNet;
}

- (void)setFetchAndSendScenePrintsForSliderNet:(BOOL)a3
{
  self->_fetchAndSendScenePrintsForSliderNet = a3;
}

+ (id)globalSettings
{
  if (globalSettings_onceToken != -1)
    dispatch_once(&globalSettings_onceToken, &__block_literal_global);
  return (id)globalSettings_sharedGlobalInstance;
}

void __34__PEGlobalSettings_globalSettings__block_invoke()
{
  PEGlobalSettings *v0;
  void *v1;

  v0 = objc_alloc_init(PEGlobalSettings);
  v1 = (void *)globalSettings_sharedGlobalInstance;
  globalSettings_sharedGlobalInstance = (uint64_t)v0;

}

@end
