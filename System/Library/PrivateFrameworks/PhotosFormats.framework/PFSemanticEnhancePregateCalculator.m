@implementation PFSemanticEnhancePregateCalculator

+ (BOOL)isSemanticDevelopmentEnabledInCameraSettings
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.camera"));
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("CAMUserPreferenceEnableSemanticDevelopment"), CFSTR("com.apple.camera"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 0;
  return !v3;
}

+ ($12FC28267955EE572C1AED5C354322B1)semanticEnhanceSceneForCameraMetadata:(id)a3
{
  int64_t v3;
  double v4;
  $12FC28267955EE572C1AED5C354322B1 result;

  v3 = objc_msgSend(a1, "semanticEnhanceSceneForCameraMetadata:ignoreCameraSetting:", a3, 0);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

+ ($12FC28267955EE572C1AED5C354322B1)semanticEnhanceSceneForCameraMetadata:(id)a3 ignoreCameraSetting:(BOOL)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  float v33;
  double v34;
  void *v35;
  float v36;
  double v37;
  void *v38;
  float v39;
  uint64_t v40;
  float v41;
  double v42;
  int64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  _BYTE v55[128];
  uint64_t v56;
  $12FC28267955EE572C1AED5C354322B1 result;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!a4 && !objc_msgSend((id)objc_opt_class(), "isSemanticDevelopmentEnabledInCameraSettings"))
  {
    v27 = 0.0;
    v40 = -1;
    goto LABEL_49;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleForKey:", CFSTR("semantic_enhance_food_threshold"));
  if (v7 == 0.0)
    v8 = 0.91;
  else
    v8 = v7;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleForKey:", CFSTR("semantic_enhance_landscape_threshold"));
  if (v10 == 0.0)
    v11 = 0.91;
  else
    v11 = v10;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleForKey:", CFSTR("semantic_enhance_face_threshold"));
  if (v13 == 0.0)
    v14 = 0.2;
  else
    v14 = v13;

  objc_msgSend(v5, "faceObservations");
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v49 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v20, "boundingBox");
        v22 = v21;
        objc_msgSend(v20, "boundingBox");
        if (v22 * v23 > v14)
        {
          v27 = 0.0;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[SemDev] Detected faces larger than threshold, skipping semantic development", buf, 2u);
          }
          v40 = -1;
          v25 = v15;
          goto LABEL_48;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v55, 16, v22 * v23);
    }
    while (v17);
  }

  objc_msgSend(v5, "semanticDevelopmentGatingObservations");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v54 = v24;
    _os_log_debug_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[SemDev] Semantic development gating observations: %@", buf, 0xCu);
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v25 = v24;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  v27 = 0.0;
  if (!v26)
  {
    v40 = -1;
    goto LABEL_47;
  }
  v28 = v26;
  v29 = *(_QWORD *)v45;
  while (2)
  {
    for (j = 0; j != v28; ++j)
    {
      if (*(_QWORD *)v45 != v29)
        objc_enumerationMutation(v25);
      v31 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
      objc_msgSend(v31, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "isEqualToString:", CFSTR("food")))
      {
        objc_msgSend(v31, "confidence");
        v34 = v33;

        if (v8 < v34)
        {
          v40 = 1;
LABEL_46:
          objc_msgSend(v31, "confidence");
          v27 = v41;
          goto LABEL_47;
        }
      }
      else
      {

      }
      objc_msgSend(v31, "identifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v35, "isEqualToString:", CFSTR("landscape")) & 1) != 0)
      {
        objc_msgSend(v31, "confidence");
        v37 = v36;
      }
      else
      {
        objc_msgSend(v31, "identifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v38, "isEqualToString:", CFSTR("landscape_cityscape")) & 1) == 0)
        {

          continue;
        }
        objc_msgSend(v31, "confidence");
        v37 = v39;

      }
      if (v11 < v37)
      {
        v40 = 3;
        goto LABEL_46;
      }
    }
    v28 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v28)
      continue;
    break;
  }
  v40 = -1;
LABEL_47:

LABEL_48:
LABEL_49:

  v42 = v27;
  v43 = v40;
  result.var1 = v42;
  result.var0 = v43;
  return result;
}

+ (int64_t)semanticEnhanceSceneForPrivateClientMetadata:(id)a3
{
  void *v4;
  id v5;
  int64_t v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  +[PFCameraMetadataSerialization deserializedMetadataFromPrivateClientMetadata:error:](PFCameraMetadataSerialization, "deserializedMetadataFromPrivateClientMetadata:error:", a3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (v4)
  {
    v6 = objc_msgSend(a1, "semanticEnhanceSceneForCameraMetadata:ignoreCameraSetting:", v4, 1);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[SemDev] Error deserializing camera metadata: %@", buf, 0xCu);
    }
    v6 = -1;
  }

  return v6;
}

+ (id)filterForSemanticEnhanceScene:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", off_1E45A2C88[a3 - 1], v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
