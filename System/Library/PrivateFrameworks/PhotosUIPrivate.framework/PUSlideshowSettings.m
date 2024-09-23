@implementation PUSlideshowSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PUSlideshowSettings setDefaultPresetTransitionValues](self, "setDefaultPresetTransitionValues");
  -[PUSlideshowSettings setAllowUserInteractivity:](self, "setAllowUserInteractivity:", 1);
  -[PUSlideshowSettings setSlideshowSettingsEnableFullscreenSupport:](self, "setSlideshowSettingsEnableFullscreenSupport:", 0);
}

- (void)setSlideshowSettingsEnableFullscreenSupport:(BOOL)a3
{
  self->_slideshowSettingsEnableFullscreenSupport = a3;
}

- (void)setDefaultPresetTransitionValues
{
  OKProducerPreset *currentPreset;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  void *v16;
  void *v17;
  float v18;
  void *v19;
  void *v20;
  float v21;
  void *v22;
  void *v23;
  float v24;
  void *v25;
  void *v26;
  float v27;
  void *v28;
  void *v29;
  float v30;
  void *v31;
  void *v32;
  float v33;
  void *v34;
  void *v35;
  float v36;
  void *v37;
  void *v38;
  float v39;
  void *v40;
  void *v41;
  float v42;
  void *v43;
  void *v44;
  void *v45;
  float v46;
  void *v47;
  void *v48;
  float v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  currentPreset = self->_currentPreset;
  if (currentPreset)
  {
    -[OKProducerPreset guidelines](currentPreset, "guidelines");
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v56;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v56 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend(v9, "valueForKey:", CFSTR("key"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("interactiveTransitionSettings"));

          if (v11)
          {
            objc_msgSend(v9, "valueForKey:", CFSTR("value"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "valueForKey:", CFSTR("trackingBoxRadiusMinValue"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13;
            if (v13)
            {
              objc_msgSend(v13, "floatValue");
              -[PUSlideshowSettings setInteractiveTransitionFingerTrackingBoxRadiusMinValue:](self, "setInteractiveTransitionFingerTrackingBoxRadiusMinValue:", v15);
            }
            objc_msgSend(v12, "valueForKey:", CFSTR("trackingBoxRadiusMaxValue"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (v16)
            {
              objc_msgSend(v16, "floatValue");
              -[PUSlideshowSettings setInteractiveTransitionFingerTrackingBoxRadiusMaxValue:](self, "setInteractiveTransitionFingerTrackingBoxRadiusMaxValue:", v18);
            }
            objc_msgSend(v12, "valueForKey:", CFSTR("trackingBoxRadiusDefaultValue"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if (v19)
            {
              objc_msgSend(v19, "floatValue");
              -[PUSlideshowSettings setInteractiveTransitionFingerTrackingBoxRadiusDefaultValue:](self, "setInteractiveTransitionFingerTrackingBoxRadiusDefaultValue:", v21);
            }
            objc_msgSend(v12, "valueForKey:", CFSTR("trackingBoxRadiusIncrementValue"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22;
            if (v22)
            {
              objc_msgSend(v22, "floatValue");
              -[PUSlideshowSettings setInteractiveTransitionFingerTrackingBoxRadiusIncrementValue:](self, "setInteractiveTransitionFingerTrackingBoxRadiusIncrementValue:", v24);
            }
            objc_msgSend(v12, "valueForKey:", CFSTR("progressThresholdMinValue"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v25;
            if (v25)
            {
              objc_msgSend(v25, "floatValue");
              -[PUSlideshowSettings setInteractiveTransitionProgressThresholdMinValue:](self, "setInteractiveTransitionProgressThresholdMinValue:", v27);
            }
            objc_msgSend(v12, "valueForKey:", CFSTR("progressThresholdMaxValue"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v28;
            if (v28)
            {
              objc_msgSend(v28, "floatValue");
              -[PUSlideshowSettings setInteractiveTransitionProgressThresholdMaxValue:](self, "setInteractiveTransitionProgressThresholdMaxValue:", v30);
            }
            v54 = v14;
            objc_msgSend(v12, "valueForKey:", CFSTR("progressThresholdDefaultValue"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v31;
            if (v31)
            {
              objc_msgSend(v31, "floatValue");
              -[PUSlideshowSettings setInteractiveTransitionProgressThresholdDefaultValue:](self, "setInteractiveTransitionProgressThresholdDefaultValue:", v33);
            }
            v53 = v17;
            objc_msgSend(v12, "valueForKey:", CFSTR("progressThresholdIncrementValue"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v34;
            if (v34)
            {
              objc_msgSend(v34, "floatValue");
              -[PUSlideshowSettings setInteractiveTransitionProgressThresholdIncrementValue:](self, "setInteractiveTransitionProgressThresholdIncrementValue:", v36);
            }
            v52 = v20;
            objc_msgSend(v12, "valueForKey:", CFSTR("velocityThresholdMinValue"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v37;
            if (v37)
            {
              objc_msgSend(v37, "floatValue");
              -[PUSlideshowSettings setInteractiveTransitionVelocityThresholdForAlwaysFinishingMinValue:](self, "setInteractiveTransitionVelocityThresholdForAlwaysFinishingMinValue:", v39);
            }
            v50 = v29;
            v51 = v23;
            objc_msgSend(v12, "valueForKey:", CFSTR("velocityThresholdMaxValue"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v40;
            if (v40)
            {
              objc_msgSend(v40, "floatValue");
              -[PUSlideshowSettings setInteractiveTransitionVelocityThresholdForAlwaysFinishingMaxValue:](self, "setInteractiveTransitionVelocityThresholdForAlwaysFinishingMaxValue:", v42);
            }
            v43 = v26;
            objc_msgSend(v12, "valueForKey:", CFSTR("velocityThresholdDefaultValue"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v44;
            if (v44)
            {
              objc_msgSend(v44, "floatValue");
              -[PUSlideshowSettings setInteractiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue:](self, "setInteractiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue:", v46);
            }
            objc_msgSend(v12, "valueForKey:", CFSTR("velocityThresholdIncrementValue"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v47;
            if (v47)
            {
              objc_msgSend(v47, "floatValue");
              -[PUSlideshowSettings setInteractiveTransitionVelocityThresholdForAlwaysFinishingIncrementValue:](self, "setInteractiveTransitionVelocityThresholdForAlwaysFinishingIncrementValue:", v49);
            }

            -[PUSlideshowSettings restoreCurrentInteractiveTransitionValuesFromUserDefaults](self, "restoreCurrentInteractiveTransitionValuesFromUserDefaults");
            return;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
        if (v6)
          continue;
        break;
      }
    }

    -[PUSlideshowSettings restoreCurrentInteractiveTransitionValuesFromUserDefaults](self, "restoreCurrentInteractiveTransitionValuesFromUserDefaults");
  }
  -[PUSlideshowSettings setInteractiveTransitionFingerTrackingBoxRadiusMinValue:](self, "setInteractiveTransitionFingerTrackingBoxRadiusMinValue:", 0.100000001);
  -[PUSlideshowSettings setInteractiveTransitionFingerTrackingBoxRadiusMaxValue:](self, "setInteractiveTransitionFingerTrackingBoxRadiusMaxValue:", 5.0);
  -[PUSlideshowSettings setInteractiveTransitionFingerTrackingBoxRadiusDefaultValue:](self, "setInteractiveTransitionFingerTrackingBoxRadiusDefaultValue:", 3.0);
  -[PUSlideshowSettings setInteractiveTransitionFingerTrackingBoxRadiusIncrementValue:](self, "setInteractiveTransitionFingerTrackingBoxRadiusIncrementValue:", 0.100000001);
  -[PUSlideshowSettings setInteractiveTransitionProgressThresholdMinValue:](self, "setInteractiveTransitionProgressThresholdMinValue:", 0.0);
  -[PUSlideshowSettings setInteractiveTransitionProgressThresholdMaxValue:](self, "setInteractiveTransitionProgressThresholdMaxValue:", 1.0);
  -[PUSlideshowSettings setInteractiveTransitionProgressThresholdDefaultValue:](self, "setInteractiveTransitionProgressThresholdDefaultValue:", 0.300000012);
  -[PUSlideshowSettings setInteractiveTransitionProgressThresholdIncrementValue:](self, "setInteractiveTransitionProgressThresholdIncrementValue:", 0.0500000007);
  -[PUSlideshowSettings setInteractiveTransitionVelocityThresholdForAlwaysFinishingMinValue:](self, "setInteractiveTransitionVelocityThresholdForAlwaysFinishingMinValue:", 0.0);
  -[PUSlideshowSettings setInteractiveTransitionVelocityThresholdForAlwaysFinishingMaxValue:](self, "setInteractiveTransitionVelocityThresholdForAlwaysFinishingMaxValue:", 1000.0);
  -[PUSlideshowSettings setInteractiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue:](self, "setInteractiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue:", 300.0);
  -[PUSlideshowSettings setInteractiveTransitionVelocityThresholdForAlwaysFinishingIncrementValue:](self, "setInteractiveTransitionVelocityThresholdForAlwaysFinishingIncrementValue:", 10.0);
}

- (void)setInteractiveTransitionVelocityThresholdForAlwaysFinishingMinValue:(double)a3
{
  self->_interactiveTransitionVelocityThresholdForAlwaysFinishingMinValue = a3;
}

- (void)setInteractiveTransitionVelocityThresholdForAlwaysFinishingMaxValue:(double)a3
{
  self->_interactiveTransitionVelocityThresholdForAlwaysFinishingMaxValue = a3;
}

- (void)setInteractiveTransitionVelocityThresholdForAlwaysFinishingIncrementValue:(double)a3
{
  self->_interactiveTransitionVelocityThresholdForAlwaysFinishingIncrementValue = a3;
}

- (void)setInteractiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue:(double)a3
{
  self->_interactiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue = a3;
}

- (void)setInteractiveTransitionProgressThresholdMinValue:(double)a3
{
  self->_interactiveTransitionProgressThresholdMinValue = a3;
}

- (void)setInteractiveTransitionProgressThresholdMaxValue:(double)a3
{
  self->_interactiveTransitionProgressThresholdMaxValue = a3;
}

- (void)setInteractiveTransitionProgressThresholdIncrementValue:(double)a3
{
  self->_interactiveTransitionProgressThresholdIncrementValue = a3;
}

- (void)setInteractiveTransitionProgressThresholdDefaultValue:(double)a3
{
  self->_interactiveTransitionProgressThresholdDefaultValue = a3;
}

- (void)setInteractiveTransitionFingerTrackingBoxRadiusMinValue:(double)a3
{
  self->_interactiveTransitionFingerTrackingBoxRadiusMinValue = a3;
}

- (void)setInteractiveTransitionFingerTrackingBoxRadiusMaxValue:(double)a3
{
  self->_interactiveTransitionFingerTrackingBoxRadiusMaxValue = a3;
}

- (void)setInteractiveTransitionFingerTrackingBoxRadiusIncrementValue:(double)a3
{
  self->_interactiveTransitionFingerTrackingBoxRadiusIncrementValue = a3;
}

- (void)setInteractiveTransitionFingerTrackingBoxRadiusDefaultValue:(double)a3
{
  self->_interactiveTransitionFingerTrackingBoxRadiusDefaultValue = a3;
}

- (void)setAllowUserInteractivity:(BOOL)a3
{
  self->_allowUserInteractivity = a3;
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUSlideshowSettings;
  v4 = -[PTSettings copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 12, self->_currentPreset);
  objc_storeStrong(v4 + 25, self->_currentPresetUniqueIdentifier);
  return v4;
}

- (void)performPostSaveActions
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowSettings;
  -[PXSettings performPostSaveActions](&v3, sel_performPostSaveActions);
  -[PUSlideshowSettings saveInteractiveSlideshowSettingsInUserDefaults](self, "saveInteractiveSlideshowSettingsInUserDefaults");
}

- (void)applyArchiveValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "hasPrefix:", CFSTR("currentPreset")) & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)PUSlideshowSettings;
    -[PXSettings applyArchiveValue:forKey:](&v8, sel_applyArchiveValue_forKey_, v6, v7);
  }

}

- (id)archiveValueForKey:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("currentPreset")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PUSlideshowSettings;
    -[PXSettings archiveValueForKey:](&v7, sel_archiveValueForKey_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)setCurrentPreset:(id)a3
{
  OKProducerPreset **p_currentPreset;
  NSString *v6;
  NSString *currentPresetUniqueIdentifier;
  void *v8;
  void *v9;
  void *v10;
  OKProducerPreset *v11;

  p_currentPreset = &self->_currentPreset;
  v11 = (OKProducerPreset *)a3;
  if (*p_currentPreset != v11)
  {
    objc_storeStrong((id *)&self->_currentPreset, a3);
    -[OKProducerPreset uniqueIdentifier](*p_currentPreset, "uniqueIdentifier");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    currentPresetUniqueIdentifier = self->_currentPresetUniqueIdentifier;
    self->_currentPresetUniqueIdentifier = v6;

    if (self->_currentPresetUniqueIdentifier)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "valueForKey:", CFSTR("InteractiveSlideshowTransitionSettings"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[PUSlideshowSettings setDefaultPresetTransitionValues](self, "setDefaultPresetTransitionValues");
      objc_msgSend(v10, "setObject:forKey:", self->_currentPresetUniqueIdentifier, CFSTR("LastUsedPresetIdentifier"));
      objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("InteractiveSlideshowTransitionSettings"));
      objc_msgSend(v8, "synchronize");

    }
  }

}

- (OKProducerPreset)currentPreset
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *currentPresetUniqueIdentifier;
  void *v8;
  id v9;
  void *v10;
  OKProducerPreset *v11;
  OKProducerPreset *currentPreset;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  if (!self->_currentPreset)
  {
    if (self->_currentPresetUniqueIdentifier)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForKey:", CFSTR("InteractiveSlideshowTransitionSettings"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("LastUsedPresetIdentifier"));
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      currentPresetUniqueIdentifier = self->_currentPresetUniqueIdentifier;
      self->_currentPresetUniqueIdentifier = v6;

    }
    if (self->_currentPresetUniqueIdentifier)
    {
LABEL_6:
      v15 = 0;
      v16 = &v15;
      v17 = 0x2050000000;
      v8 = (void *)getOKProducerPresetsManagerClass_softClass_87674;
      v18 = getOKProducerPresetsManagerClass_softClass_87674;
      if (!getOKProducerPresetsManagerClass_softClass_87674)
      {
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __getOKProducerPresetsManagerClass_block_invoke_87675;
        v14[3] = &unk_1E58AAEB0;
        v14[4] = &v15;
        __getOKProducerPresetsManagerClass_block_invoke_87675((uint64_t)v14);
        v8 = (void *)v16[3];
      }
      v9 = objc_retainAutorelease(v8);
      _Block_object_dispose(&v15, 8);
      objc_msgSend(v9, "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "presetForUniqueIdentifier:", self->_currentPresetUniqueIdentifier);
      v11 = (OKProducerPreset *)objc_claimAutoreleasedReturnValue();
      currentPreset = self->_currentPreset;
      self->_currentPreset = v11;

      -[PUSlideshowSettings setDefaultPresetTransitionValues](self, "setDefaultPresetTransitionValues");
    }
  }
  return self->_currentPreset;
}

- (void)removeTransitionTimingCustomizationsFromUserDefaults
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("InteractiveSlideshowTransitionSettings"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  if (v3)
  {
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("interactiveTransitionFineTuneSettings"));
    objc_msgSend(v4, "setValue:forKey:", v3, CFSTR("InteractiveSlideshowTransitionSettings"));
    objc_msgSend(v4, "synchronize");
  }

}

- (void)restoreCurrentInteractiveTransitionValuesFromUserDefaults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  void *v12;
  float v13;
  void *v14;
  void *v15;
  float v16;
  id v17;

  if (self->_currentPreset)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "valueForKey:", CFSTR("InteractiveSlideshowTransitionSettings"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "valueForKey:", CFSTR("interactiveTransitionFineTuneSettings"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[OKProducerPreset uniqueIdentifier](self->_currentPreset, "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v7, "valueForKey:", CFSTR("interactiveTransitionFingerTrackingBoxRadiusCurrentValueAsNumber"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          objc_msgSend(v8, "floatValue");
          -[PUSlideshowSettings setInteractiveTransitionFingerTrackingBoxRadiusDefaultValue:](self, "setInteractiveTransitionFingerTrackingBoxRadiusDefaultValue:", v10);
        }
        objc_msgSend(v7, "valueForKey:", CFSTR("interactiveTransitionProgressThresholdCurrentValueAsNumber"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          objc_msgSend(v11, "floatValue");
          -[PUSlideshowSettings setInteractiveTransitionProgressThresholdDefaultValue:](self, "setInteractiveTransitionProgressThresholdDefaultValue:", v13);
        }
        objc_msgSend(v7, "valueForKey:", CFSTR("interactiveTransitionVelocityThresholdForAlwaysFinishingCurrentValueAsNumber"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          objc_msgSend(v14, "floatValue");
          -[PUSlideshowSettings setInteractiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue:](self, "setInteractiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue:", v16);
        }

      }
    }

  }
}

- (BOOL)transitionSettingsAreDefaults
{
  OKProducerPreset *currentPreset;
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  double interactiveTransitionFingerTrackingBoxRadiusDefaultValue;
  float v16;
  void *v17;
  void *v18;
  double interactiveTransitionProgressThresholdDefaultValue;
  float v20;
  int v21;
  void *v22;
  void *v23;
  double interactiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue;
  float v25;
  char v27;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  currentPreset = self->_currentPreset;
  if (!currentPreset)
    return 1;
  -[OKProducerPreset guidelines](currentPreset, "guidelines");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v3)
  {
    v4 = v3;
    v5 = CFSTR("key");
    v6 = *(_QWORD *)v31;
    v27 = 1;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v31 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v8, "valueForKey:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("interactiveTransitionSettings"));

        if (v10)
        {
          v11 = v5;
          objc_msgSend(v8, "valueForKey:", CFSTR("value"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "valueForKey:", CFSTR("trackingBoxRadiusDefaultValue"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            interactiveTransitionFingerTrackingBoxRadiusDefaultValue = self->_interactiveTransitionFingerTrackingBoxRadiusDefaultValue;
            objc_msgSend(v13, "floatValue");
            if (interactiveTransitionFingerTrackingBoxRadiusDefaultValue != v16)
            {

              v27 = 0;
              goto LABEL_25;
            }
          }
          objc_msgSend(v12, "valueForKey:", CFSTR("progressThresholdDefaultValue"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (!v17
            || (interactiveTransitionProgressThresholdDefaultValue = self->_interactiveTransitionProgressThresholdDefaultValue,
                objc_msgSend(v17, "floatValue"),
                interactiveTransitionProgressThresholdDefaultValue == v20))
          {
            objc_msgSend(v12, "valueForKey:", CFSTR("velocityThresholdDefaultValue"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22;
            if (!v22
              || (interactiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue = self->_interactiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue,
                  objc_msgSend(v22, "floatValue"),
                  interactiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue == v25))
            {
              v21 = 0;
            }
            else
            {
              v27 = 0;
              v21 = 2;
            }

          }
          else
          {
            v27 = 0;
            v21 = 2;
          }

          v5 = v11;
          if (v21)
            goto LABEL_25;
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v27 = 1;
  }
LABEL_25:

  return v27 & 1;
}

- (void)saveInteractiveSlideshowSettingsInUserDefaults
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
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("InteractiveSlideshowTransitionSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "valueForKey:", CFSTR("interactiveTransitionFineTuneSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("interactiveTransitionFineTuneSettings"));
  }
  if (self->_currentPreset
    && !-[PUSlideshowSettings transitionSettingsAreDefaults](self, "transitionSettingsAreDefaults"))
  {
    -[OKProducerPreset uniqueIdentifier](self->_currentPreset, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = CFSTR("interactiveTransitionFingerTrackingBoxRadiusCurrentValueAsNumber");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_interactiveTransitionFingerTrackingBoxRadiusDefaultValue);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v13[1] = CFSTR("interactiveTransitionProgressThresholdCurrentValueAsNumber");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_interactiveTransitionProgressThresholdDefaultValue);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v10;
    v13[2] = CFSTR("interactiveTransitionVelocityThresholdForAlwaysFinishingCurrentValueAsNumber");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_interactiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setValue:forKey:", v12, v8);
    objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("interactiveTransitionFineTuneSettings"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("InteractiveSlideshowTransitionSettings"));

    objc_msgSend(v3, "synchronize");
  }

}

- (BOOL)allowUserInteractivity
{
  return self->_allowUserInteractivity;
}

- (double)interactiveTransitionFingerTrackingBoxRadiusMinValue
{
  return self->_interactiveTransitionFingerTrackingBoxRadiusMinValue;
}

- (double)interactiveTransitionFingerTrackingBoxRadiusMaxValue
{
  return self->_interactiveTransitionFingerTrackingBoxRadiusMaxValue;
}

- (double)interactiveTransitionFingerTrackingBoxRadiusDefaultValue
{
  return self->_interactiveTransitionFingerTrackingBoxRadiusDefaultValue;
}

- (double)interactiveTransitionFingerTrackingBoxRadiusIncrementValue
{
  return self->_interactiveTransitionFingerTrackingBoxRadiusIncrementValue;
}

- (double)interactiveTransitionProgressThresholdMinValue
{
  return self->_interactiveTransitionProgressThresholdMinValue;
}

- (double)interactiveTransitionProgressThresholdMaxValue
{
  return self->_interactiveTransitionProgressThresholdMaxValue;
}

- (double)interactiveTransitionProgressThresholdDefaultValue
{
  return self->_interactiveTransitionProgressThresholdDefaultValue;
}

- (double)interactiveTransitionProgressThresholdIncrementValue
{
  return self->_interactiveTransitionProgressThresholdIncrementValue;
}

- (double)interactiveTransitionVelocityThresholdForAlwaysFinishingMinValue
{
  return self->_interactiveTransitionVelocityThresholdForAlwaysFinishingMinValue;
}

- (double)interactiveTransitionVelocityThresholdForAlwaysFinishingMaxValue
{
  return self->_interactiveTransitionVelocityThresholdForAlwaysFinishingMaxValue;
}

- (double)interactiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue
{
  return self->_interactiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue;
}

- (double)interactiveTransitionVelocityThresholdForAlwaysFinishingIncrementValue
{
  return self->_interactiveTransitionVelocityThresholdForAlwaysFinishingIncrementValue;
}

- (BOOL)slideshowSettingsEnableFullscreenSupport
{
  return self->_slideshowSettingsEnableFullscreenSupport;
}

- (NSString)currentPresetUniqueIdentifier
{
  return self->_currentPresetUniqueIdentifier;
}

- (void)setCurrentPresetUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentPresetUniqueIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPresetUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_currentPreset, 0);
}

+ (PUSlideshowSettings)sharedInstance
{
  if (sharedInstance_onceToken_87742 != -1)
    dispatch_once(&sharedInstance_onceToken_87742, &__block_literal_global_87743);
  return (PUSlideshowSettings *)(id)sharedInstance_sharedInstance_87744;
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD v67[4];
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  _QWORD v72[6];

  v72[4] = *MEMORY[0x1E0C80C00];
  +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "restoreCurrentInteractiveTransitionValuesFromUserDefaults");

  +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPreset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 0x1E0D83000uLL;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentPreset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Features (%@)"), v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v65 = (void *)MEMORY[0x1E0D83078];
    objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("User Interactivity"), CFSTR("allowUserInteractivity"));
    v62 = objc_claimAutoreleasedReturnValue();
    v72[0] = v62;
    objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Transition, tracking box radius"), CFSTR("interactiveTransitionFingerTrackingBoxRadiusDefaultValue"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "interactiveTransitionFingerTrackingBoxRadiusMinValue");
    v12 = v11;
    +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "interactiveTransitionFingerTrackingBoxRadiusMaxValue");
    objc_msgSend(v57, "minValue:maxValue:", v12, v13);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "interactiveTransitionFingerTrackingBoxRadiusIncrementValue");
    objc_msgSend(v60, "pu_increment:");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "conditionFormat:", CFSTR("allowUserInteractivity != 0"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v72[1] = v58;
    objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Transition, progress thr"), CFSTR("interactiveTransitionProgressThresholdDefaultValue"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "interactiveTransitionProgressThresholdMinValue");
    v15 = v14;
    +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "interactiveTransitionProgressThresholdMaxValue");
    objc_msgSend(v55, "minValue:maxValue:", v15, v16);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "interactiveTransitionProgressThresholdIncrementValue");
    objc_msgSend(v52, "pu_increment:");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "conditionFormat:", CFSTR("allowUserInteractivity != 0"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v72[2] = v50;
    objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Transition, velocity thr 4 always finishing"), CFSTR("interactiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "interactiveTransitionVelocityThresholdForAlwaysFinishingMinValue");
    v19 = v18;
    +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "interactiveTransitionVelocityThresholdForAlwaysFinishingMaxValue");
    objc_msgSend(v49, "minValue:maxValue:", v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "interactiveTransitionVelocityThresholdForAlwaysFinishingIncrementValue");
    objc_msgSend(v22, "pu_increment:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "conditionFormat:", CFSTR("allowUserInteractivity != 0"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v72[3] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "sectionWithRows:title:", v26, v10);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = 0x1E0D83000;
    v27 = v57;

    v28 = (void *)v62;
  }
  else
  {
    v29 = (void *)MEMORY[0x1E0D83078];
    objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("User Interactivity"), CFSTR("allowUserInteractivity"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("Features");
    objc_msgSend(v29, "sectionWithRows:title:", v27, CFSTR("Features"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v30 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(*(id *)(v5 + 264), "rowWithTitle:valueKeyPath:", CFSTR("Fullscreen support"), CFSTR("slideshowSettingsEnableFullscreenSupport"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sectionWithRows:title:", v32, CFSTR("Presentation Settings"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_92);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83010], "rowWithTitle:action:", CFSTR("Reset Transition Timing Customizations"), v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sectionWithRows:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = (void *)MEMORY[0x1E0D83078];
  v40 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "rowWithTitle:action:", CFSTR("Restore Defaults"), v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "sectionWithRows:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = (void *)MEMORY[0x1E0D83078];
  v67[0] = v66;
  v67[1] = v33;
  v67[2] = v38;
  v67[3] = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "moduleWithTitle:contents:", CFSTR("One Up"), v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  return v47;
}

uint64_t __47__PUSlideshowSettings_settingsControllerModule__block_invoke()
{
  void *v0;
  void *v1;

  +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeTransitionTimingCustomizationsFromUserDefaults");

  +[PUSlideshowSettings sharedInstance](PUSlideshowSettings, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setDefaultPresetTransitionValues");

  return 1;
}

void __37__PUSlideshowSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "slideshowSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_87744;
  sharedInstance_sharedInstance_87744 = v0;

}

@end
