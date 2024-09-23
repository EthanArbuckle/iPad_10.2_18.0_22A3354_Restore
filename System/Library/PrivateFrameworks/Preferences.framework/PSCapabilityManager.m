@implementation PSCapabilityManager

- (BOOL)hasCapabilities:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  void *v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  PSCapabilityManager *v22;
  unint64_t v23;
  unint64_t v24;
  int v25;
  BOOL v26;
  void *v27;
  BOOL v28;
  uint64_t v30;
  uint64_t v31;
  id obj;
  uint64_t v33;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v41;
    v7 = 0x1E0C99000uLL;
    v8 = 0x1E0CB3000uLL;
    v30 = *(_QWORD *)v41;
LABEL_3:
    v9 = 0;
    v31 = v5;
    while (1)
    {
      if (*(_QWORD *)v41 != v6)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[PSCapabilityManager capabilityAnswer:](self, "capabilityAnswer:", v10);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27
          || (objc_opt_class(), v34 = v27, (objc_opt_isKindOfClass() & 1) != 0)
          && (objc_msgSend(v27, "BOOLValue") & 1) == 0)
        {

LABEL_34:
          v28 = 0;
          goto LABEL_35;
        }
LABEL_29:

      }
LABEL_30:
      if (++v9 == v5)
      {
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_32;
      }
    }
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v34 = v11;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v12)
    {
      v13 = v12;
      v35 = v10;
      v33 = v9;
      v14 = *(_QWORD *)v37;
      v15 = 1;
      v16 = v34;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v37 != v14)
            objc_enumerationMutation(v16);
          v18 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v35, "objectForKey:", v18, v30);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[PSCapabilityManager capabilityAnswer:](self, "capabilityAnswer:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = objc_msgSend(v20, "containsObject:", v19);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v22 = self;
              v23 = v8;
              v24 = v7;
              v25 = objc_msgSend(v20, "intValue");
              v26 = v25 == objc_msgSend(v19, "intValue");
              v7 = v24;
              v8 = v23;
              self = v22;
              v16 = v34;
              v21 = v26;
            }
            else
            {
              v21 = objc_msgSend(v20, "isEqual:", v19);
            }
          }
          if (!v21)
            v15 = 0;

        }
        v13 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v13);

      v6 = v30;
      v5 = v31;
      v9 = v33;
      if ((v15 & 1) == 0)
        goto LABEL_34;
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_32:
  v28 = 1;
LABEL_35:

  return v28;
}

- (id)capabilityAnswer:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char isKindOfClass;
  id v14;
  void *v15;

  v4 = a3;
  -[PSCapabilityManager overrides](self, "overrides");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_14;
  v6 = (void *)v5;
  -[PSCapabilityManager overrides](self, "overrides");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8
    || (-[PSCapabilityManager overrides](self, "overrides"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "objectForKeyedSubscript:", v4),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
LABEL_14:
    if (!MGIsQuestionValid() || (v10 = (void *)MGCopyAnswer()) == 0)
    {
      -[PSCapabilityManager preferencesCapabilityAnswer:](self, "preferencesCapabilityAnswer:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  -[PSCapabilityManager overrideForAllBoolValues](self, "overrideForAllBoolValues");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11
    && (v12 = (void *)v11,
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v12,
        (isKindOfClass & 1) != 0))
  {
    -[PSCapabilityManager overrideForAllBoolValues](self, "overrideForAllBoolValues");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v10;
  }
  v15 = v14;

  return v15;
}

- (NSMutableDictionary)overrides
{
  return self->_overrides;
}

- (NSNumber)overrideForAllBoolValues
{
  return self->_overrideForAllBoolValues;
}

+ (id)sharedManager
{
  if (sharedManager_once != -1)
    dispatch_once(&sharedManager_once, &__block_literal_global_6);
  return (id)sharedManager_manager;
}

void __36__PSCapabilityManager_sharedManager__block_invoke()
{
  PSCapabilityManager *v0;
  void *v1;

  v0 = objc_alloc_init(PSCapabilityManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

- (PSCapabilityManager)init
{
  PSCapabilityManager *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)PSCapabilityManager;
  v2 = -[PSCapabilityManager init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[PSCapabilityManager setOverrides:](v2, "setOverrides:", v3);

    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getAXCapabilityManagerClass_softClass;
    v13 = getAXCapabilityManagerClass_softClass;
    if (!getAXCapabilityManagerClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getAXCapabilityManagerClass_block_invoke;
      v9[3] = &unk_1E4A65650;
      v9[4] = &v10;
      __getAXCapabilityManagerClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (void *)objc_opt_new();
    -[PSCapabilityManager setAxCapabilityManager:](v2, "setAxCapabilityManager:", v6);

  }
  return v2;
}

- (void)setOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_overrides, a3);
}

- (void)setAxCapabilityManager:(id)a3
{
  objc_storeStrong((id *)&self->_axCapabilityManager, a3);
}

- (BOOL)capabilityBoolAnswer:(id)a3
{
  void *v3;
  char v4;

  -[PSCapabilityManager capabilityAnswer:](self, "capabilityAnswer:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setOverrideValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PSCapabilityManager overrides](self, "overrides");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

}

- (void)setOverrideForAllBoolValues:(id)a3
{
  objc_storeStrong((id *)&self->_overrideForAllBoolValues, a3);
}

- (void)resetOverrides
{
  void *v3;
  NSNumber *overrideForAllBoolValues;

  -[PSCapabilityManager overrides](self, "overrides");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  overrideForAllBoolValues = self->_overrideForAllBoolValues;
  self->_overrideForAllBoolValues = 0;

}

- (id)preferencesCapabilityAnswer:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PSDisplayZoomCapability")))
  {
    -[PSCapabilityManager supportsDisplayZoomCapability](self, "supportsDisplayZoomCapability");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_53:
    v6 = (void *)v5;
    goto LABEL_54;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PSApplicationDisplayIdentifiersCapability")))
  {
    -[PSCapabilityManager applicationDisplayIdentifiers](self, "applicationDisplayIdentifiers");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PSRaiseToWakeCapability")))
  {
    -[PSCapabilityManager supportsRaiseToWakeCapability](self, "supportsRaiseToWakeCapability");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PSAutoWhiteBalanceCapability")))
  {
    -[PSCapabilityManager supportsAutoWhiteBalanceCapability](self, "supportsAutoWhiteBalanceCapability");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PSNightShiftCapability")))
  {
    -[PSCapabilityManager supportsNightShiftCapability](self, "supportsNightShiftCapability");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PSInStoreDemoModeCapability")))
  {
    -[PSCapabilityManager supportsInStoreDemoModeCapability](self, "supportsInStoreDemoModeCapability");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PSInEDUModeCapability")))
  {
    -[PSCapabilityManager supportsInEDUModeCapability](self, "supportsInEDUModeCapability");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PSTTYCapability")))
  {
    -[PSCapabilityManager supportsPSTTYCapability](self, "supportsPSTTYCapability");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PSDeveloperSettingsCapability")))
  {
    -[PSCapabilityManager supportsPSDeveloperSettingsCapability](self, "supportsPSDeveloperSettingsCapability");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PSWalletApplePayCapability")))
  {
    -[PSCapabilityManager supportsWalletApplePayCapability](self, "supportsWalletApplePayCapability");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PSCellularDataPlanCapability")))
  {
    -[PSCapabilityManager supportsPSCellularDataPlanCapability](self, "supportsPSCellularDataPlanCapability");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PSPencilCapability")))
  {
    -[PSCapabilityManager supportsPSPencilCapability](self, "supportsPSPencilCapability");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PSExposureNotificationsCapability")))
  {
    -[PSCapabilityManager supportsPSExposureNotificationsCapability](self, "supportsPSExposureNotificationsCapability");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PSHomeScreenPhoneCapability")))
  {
    -[PSCapabilityManager supportsPSHomeScreenPhoneCapability](self, "supportsPSHomeScreenPhoneCapability");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("DeviceHasTrackpadOnly")))
  {
    -[PSCapabilityManager supportsPSTrackpadOnlyCapability](self, "supportsPSTrackpadOnlyCapability");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("DeviceHasTrackpadAndMouse")))
  {
    -[PSCapabilityManager supportsPSTrackpadAndMouseCapability](self, "supportsPSTrackpadAndMouseCapability");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("ListeningExperienceCapability")))
  {
    -[PSCapabilityManager supportsListeningExperienceCapbility](self, "supportsListeningExperienceCapbility");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("LightningAdapterCapability")))
  {
    -[PSCapabilityManager supportsLightningAdapterCapability](self, "supportsLightningAdapterCapability");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PSPictureInPictureCapability")))
  {
    -[PSCapabilityManager supportsPictureInPictureCapability](self, "supportsPictureInPictureCapability");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PSStageManagerCapability")))
  {
    -[PSCapabilityManager supportsChamoisExternalDisplay](self, "supportsChamoisExternalDisplay");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PSRecordHDRVideoCapability")))
  {
    -[PSCapabilityManager supportPSRecordHDRVideoCapability](self, "supportPSRecordHDRVideoCapability");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PSPhotoFormatProRAWCapabilities")))
  {
    -[PSCapabilityManager supportPSPhotoFormatProRAWCapability](self, "supportPSPhotoFormatProRAWCapability");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PSPhotoFormatEnhancedProRAWCapabilities")))
  {
    -[PSCapabilityManager supportPSPhotoFormatEnhancedProRAWCapability](self, "supportPSPhotoFormatEnhancedProRAWCapability");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PSPhoneNoiseCancellationCapability")))
  {
    -[PSCapabilityManager supportPSPhoneNoiseCancellationCapability](self, "supportPSPhoneNoiseCancellationCapability");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PSContunityCamera")))
  {
    -[PSCapabilityManager supportsContinuityCamera](self, "supportsContinuityCamera");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("retail-kiosk-mode")))
  {
    -[PSCapabilityManager supportsRetailKioskModeCapability](self, "supportsRetailKioskModeCapability");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  -[PSCapabilityManager axCapabilityManager](self, "axCapabilityManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAccessibilityCapability:", v4);

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[PSCapabilityManager axCapabilityManager](self, "axCapabilityManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithBool:", objc_msgSend(v11, "isCapabilityAvailable:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _PSLoggingFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl(&dword_1A3819000, v12, OS_LOG_TYPE_DEFAULT, "No capability found for key %@", (uint8_t *)&v13, 0xCu);
    }

    v6 = 0;
  }
LABEL_54:

  return v6;
}

- (id)supportsPictureInPictureCapability
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  if (_os_feature_enabled_impl())
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2050000000;
    v3 = (void *)getPGPictureInPictureProxyClass_softClass;
    v11 = getPGPictureInPictureProxyClass_softClass;
    if (!getPGPictureInPictureProxyClass_softClass)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __getPGPictureInPictureProxyClass_block_invoke;
      v7[3] = &unk_1E4A65650;
      v7[4] = &v8;
      __getPGPictureInPictureProxyClass_block_invoke((uint64_t)v7);
      v3 = (void *)v9[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v8, 8);
    v5 = objc_msgSend(v4, "isPictureInPictureSupported");
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v2, "numberWithInt:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)supportsChamoisExternalDisplay
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGGetBoolAnswer());
}

- (id)supportsLightningAdapterCapability
{
  void *v2;
  objc_class *v3;
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  _Unwind_Exception *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v2 = (void *)getADASManagerClass_softClass;
  v23 = getADASManagerClass_softClass;
  if (!getADASManagerClass_softClass)
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = (uint64_t)__getADASManagerClass_block_invoke;
    v18 = &unk_1E4A65650;
    v19 = &v20;
    __getADASManagerClass_block_invoke((uint64_t)&v15);
    v2 = (void *)v21[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v20, 8);
  v4 = objc_alloc_init(v3);
  v15 = 0;
  v16 = (uint64_t)&v15;
  v17 = 0x2020000000;
  v5 = (_QWORD *)getADAFPreferenceKeyHAENKnownAccessoriesSymbolLoc_ptr;
  v18 = (void *)getADAFPreferenceKeyHAENKnownAccessoriesSymbolLoc_ptr;
  if (!getADAFPreferenceKeyHAENKnownAccessoriesSymbolLoc_ptr)
  {
    v6 = (void *)AudioDataAnalysisLibrary();
    v5 = dlsym(v6, "ADAFPreferenceKeyHAENKnownAccessories");
    *(_QWORD *)(v16 + 24) = v5;
    getADAFPreferenceKeyHAENKnownAccessoriesSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v15, 8);
  if (!v5)
  {
    PSPNCreateFormattedStringWithCountry_cold_1();
    goto LABEL_14;
  }
  objc_msgSend(v4, "getPreferenceFor:", *v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  if (!objc_msgSend(v7, "count"))
  {
    v15 = 0;
    v16 = (uint64_t)&v15;
    v17 = 0x2020000000;
    v10 = (_QWORD *)getADAFPreferenceKeyConnectedWiredDeviceIsHeadphoneSymbolLoc_ptr;
    v18 = (void *)getADAFPreferenceKeyConnectedWiredDeviceIsHeadphoneSymbolLoc_ptr;
    if (!getADAFPreferenceKeyConnectedWiredDeviceIsHeadphoneSymbolLoc_ptr)
    {
      v11 = (void *)AudioDataAnalysisLibrary();
      v10 = dlsym(v11, "ADAFPreferenceKeyConnectedWiredDeviceIsHeadphone");
      *(_QWORD *)(v16 + 24) = v10;
      getADAFPreferenceKeyConnectedWiredDeviceIsHeadphoneSymbolLoc_ptr = (uint64_t)v10;
    }
    _Block_object_dispose(&v15, 8);
    if (v10)
    {
      objc_msgSend(v4, "getPreferenceFor:", *v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithInt:", v12 != 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
LABEL_14:
    v14 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v15, 8);
    _Unwind_Resume(v14);
  }
  objc_msgSend(v8, "numberWithInt:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v9;
}

- (id)supportsListeningExperienceCapbility
{
  void *v2;
  int v3;
  void *v4;

  v2 = (void *)MGCopyAnswer();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue") ^ 1;
  else
    v3 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", _os_feature_enabled_impl() & v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)supportsPSTrackpadOnlyCapability
{
  void *v2;
  int v3;
  void *v4;
  int v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("HasPointerDevice"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("HasMouse"));

  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3 & (v5 ^ 1u));
}

- (id)supportsPSTrackpadAndMouseCapability
{
  void *v2;
  int v3;
  void *v4;
  unsigned int v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("HasPointerDevice"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("HasMouse"));

  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3 & v5);
}

- (id)supportsPSHomeScreenPhoneCapability
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
}

- (id)supportsPSPencilCapability
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGGetBoolAnswer());
}

- (id)supportsPSCellularDataPlanCapability
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(getPSUICellularPlanManagerCacheClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "embeddedPlanItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(getPSUICellularPlanManagerCacheClass(), "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAnyLocalFlowTypeSupported");

  }
  else
  {
    v5 = 0;
  }

  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
}

- (id)supportsWalletApplePayCapability
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "BOOLForKey:", CFSTR("showPassbookRow")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)supportsPSExposureNotificationsCapability
{
  void *v2;
  void *v3;

  v2 = (void *)MGCopyAnswer();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "isEqualToString:", CFSTR("iPhone")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)supportsDisplayZoomCapability
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "sf_deviceSupportsDisplayZoom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)supportsRaiseToWakeCapability
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(MEMORY[0x1E0CA5708], "isWakeGestureAvailable"));
}

- (id)supportsAutoWhiteBalanceCapability
{
  id v2;
  void *v3;
  void *v4;

  if ((supportsAutoWhiteBalanceCapability_cached & 1) == 0)
  {
    v2 = objc_alloc_init((Class)getCBClientClass());
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "adaptationClient");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      supportsAutoWhiteBalanceCapability_supported = objc_msgSend(v4, "supported");

      supportsAutoWhiteBalanceCapability_cached = 1;
    }

  }
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", supportsAutoWhiteBalanceCapability_supported);
}

- (id)supportsNightShiftCapability
{
  id v2;
  void *v3;
  void *v4;

  if ((supportsNightShiftCapability_cached & 1) == 0)
  {
    v2 = objc_alloc_init((Class)getCBClientClass());
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "blueLightClient");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      supportsNightShiftCapability_supported = objc_msgSend(v4, "supported");

      supportsNightShiftCapability_cached = 1;
    }

  }
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", supportsNightShiftCapability_supported);
}

- (id)supportsInStoreDemoModeCapability
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(MEMORY[0x1E0CEA2F8], "isRunningInStoreDemoMode"));
}

- (id)supportsInEDUModeCapability
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", PSIsInEDUMode());
}

- (id)applicationDisplayIdentifiers
{
  void *v2;
  void *v3;

  v2 = (void *)SBSCopyDisplayIdentifiers();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)supportsPSTTYCapability
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  if ((objc_msgSend(getRTTTelephonyUtilitiesClass(), "softwareTTYIsSupported") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(getRTTTelephonyUtilitiesClass(), "hardwareTTYIsSupported");
  return (id)objc_msgSend(v2, "numberWithInt:", v3);
}

- (id)supportsPSDeveloperSettingsCapability
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "sf_isDeveloperModeEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)supportPSRecordHDRVideoCapability
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc((Class)getCAMCaptureCapabilitiesClass()), "initWithHostProcess:", 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "isHDR10BitVideoSupported"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)supportPSPhotoFormatProRAWCapability
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc((Class)getCAMCaptureCapabilitiesClass()), "initWithHostProcess:", 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "isLinearDNGSupported"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)supportPSPhotoFormatEnhancedProRAWCapability
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc((Class)getCAMCaptureCapabilitiesClass()), "initWithHostProcess:", 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "enhancedRAWResolutionSupported"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)supportPSPhoneNoiseCancellationCapability
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CFF1C8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isEarpieceActiveNoiseCancelationEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)supportsRetailKioskModeCapability
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "sf_inRetailKioskMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)supportsContinuityCamera
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", AVGestaltGetBoolAnswer());
}

- (AXCapabilityManager)axCapabilityManager
{
  return self->_axCapabilityManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axCapabilityManager, 0);
  objc_storeStrong((id *)&self->_overrideForAllBoolValues, 0);
  objc_storeStrong((id *)&self->_overrides, 0);
}

@end
