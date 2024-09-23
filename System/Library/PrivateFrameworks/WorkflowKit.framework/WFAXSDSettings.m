@implementation WFAXSDSettings

+ (BOOL)soundDetectionEnabled
{
  void *v2;
  char v3;

  objc_msgSend(getAXSDSettingsClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "soundDetectionEnabled");

  return v3;
}

+ (id)localizedNameForSoundDetectionType:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(getAXSDSettingsClass(), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedNameForSoundDetectionType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)bmTypeForAXSDSoundDetectionType:(id)a3
{
  id result;

  soft_bmTypeForSoundDetectionType(a3);
  return result;
}

+ (BOOL)isApplianceSoundDetectionType:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  v3 = a3;
  getAXSDSoundDetectionTypeApplianceBeeps();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  getAXSDSoundDetectionTypeApplianceBuzzes();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "isEqualToString:", v6);

  getAXSDSoundDetectionTypeApplianceBellDings();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "isEqualToString:", v8);

  return v5 | v7 | v9;
}

+ (id)allBMApplianceTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  getAXSDSoundDetectionTypeApplianceBeeps();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  soft_bmTypeForSoundDetectionType(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  getAXSDSoundDetectionTypeApplianceBuzzes();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  soft_bmTypeForSoundDetectionType(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  getAXSDSoundDetectionTypeApplianceBellDings();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  soft_bmTypeForSoundDetectionType(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)mapLocalizedSupportedSoundDetectionTypesUsingBlock:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  _QWORD v14[3];
  char v15;

  v3 = a3;
  objc_msgSend(getAXSDSettingsClass(), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportedSoundDetectionTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v6 = MEMORY[0x1E0C809B0];
  v15 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__WFAXSDSettings_mapLocalizedSupportedSoundDetectionTypesUsingBlock___block_invoke;
  v13[3] = &unk_1E7AED300;
  v13[4] = v14;
  objc_msgSend(v5, "if_objectsPassingTest:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __69__WFAXSDSettings_mapLocalizedSupportedSoundDetectionTypesUsingBlock___block_invoke_2;
  v11[3] = &unk_1E7AED328;
  v8 = v3;
  v12 = v8;
  objc_msgSend(v7, "if_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v14, 8);
  return v9;
}

uint64_t __69__WFAXSDSettings_mapLocalizedSupportedSoundDetectionTypesUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  if (!+[WFAXSDSettings isApplianceSoundDetectionType:](WFAXSDSettings, "isApplianceSoundDetectionType:", a2))return 1;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v3 + 24))
    return 0;
  result = 1;
  *(_BYTE *)(v3 + 24) = 1;
  return result;
}

id __69__WFAXSDSettings_mapLocalizedSupportedSoundDetectionTypesUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  +[WFAXSDSettings localizedNameForSoundDetectionType:](WFAXSDSettings, "localizedNameForSoundDetectionType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
