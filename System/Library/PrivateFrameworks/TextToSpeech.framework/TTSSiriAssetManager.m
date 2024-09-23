@implementation TTSSiriAssetManager

+ (id)_assetTypesForVoiceType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 1:
      objc_msgSend_vocalizerVoice(MEMORY[0x1E0DA7930], a2, a3, v3, v4);
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v9, (uint64_t)&v20, 1, v10, v18, v19, v6, v21);
      goto LABEL_5;
    case 2:
      objc_msgSend_customVoice(MEMORY[0x1E0DA7930], a2, a3, v3, v4);
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)&v19, 1, v12, v18, v6, v20, v21);
      goto LABEL_5;
    case 4:
    case 5:
    case 7:
      objc_msgSend_gryphonVoice(MEMORY[0x1E0DA7930], a2, a3, v3, v4);
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)&v18, 1, v8, v6, v19, v20, v21);
LABEL_5:
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      AXTTSLogCommon();
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
        sub_1A3AB0468(a3, v6, v15, v16, v17);
      v13 = 0;
      break;
  }

  return v13;
}

+ (id)_assetsForLanguage:(id)a3 voiceType:(int64_t)a4 installedOnly:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  void *v63;
  _QWORD v64[4];

  v5 = a5;
  v64[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v63 = &unk_1E4ABC7B0;
  objc_msgSend__assetTechnologyForVoiceType_(a1, v9, a4, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v12;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)v64, (uint64_t)&v63, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_mutableCopy(v14, v15, v16, v17, v18);

  if (v8)
    objc_msgSend_setObject_forKeyedSubscript_(v19, v20, (uint64_t)v8, (uint64_t)&unk_1E4ABC768, v22);
  objc_msgSend__assetTypesForVoiceType_(a1, v20, a4, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v26 = (void *)objc_opt_new();
    if (v5)
      objc_msgSend_setObject_forKeyedSubscript_(v19, v24, MEMORY[0x1E0C9AAB0], (uint64_t)&unk_1E4ABC780, v25);
    objc_msgSend_listAssetsOfTypes_matching_(MEMORY[0x1E0DA7910], v24, (uint64_t)v23, (uint64_t)v19, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    AXTTSLogResourceManager();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_numberWithLong_(MEMORY[0x1E0CB37E8], v29, a4, v30, v31);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v58 = v51;
      v59 = 2112;
      v60 = v19;
      v61 = 2112;
      v62 = v27;
      _os_log_debug_impl(&dword_1A3940000, v28, OS_LOG_TYPE_DEBUG, "TTSAsset::listAssetsOfTypes (voiceTypes=%@ filter=%@): %@", buf, 0x20u);

    }
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v32 = v27;
    v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v52, (uint64_t)v56, 16);
    if (v34)
    {
      v38 = v34;
      v39 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v53 != v39)
            objc_enumerationMutation(v32);
          objc_msgSend_voiceAssetFromTTSAsset_(a1, v35, *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i), v36, v37, (_QWORD)v52);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v26, v42, (uint64_t)v41, v43, v44);

        }
        v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v52, (uint64_t)v56, 16);
      }
      while (v38);
    }

    objc_msgSend_allObjects(v26, v45, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v49 = 0;
  }

  return v49;
}

+ (id)installedAssetsForLanguage:(id)a3 voiceType:(int64_t)a4
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel__assetsForLanguage_voiceType_installedOnly_, a3, a4, 1);
}

+ (id)_assetTechnologyForVoiceType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  switch(a3)
  {
    case 1:
      objc_msgSend_vocalizer(MEMORY[0x1E0DA7928], a2, a3, v3, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend_custom(MEMORY[0x1E0DA7928], a2, a3, v3, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend_gryphon(MEMORY[0x1E0DA7928], a2, a3, v3, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend_neural(MEMORY[0x1E0DA7928], a2, a3, v3, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      objc_msgSend_neuralAX(MEMORY[0x1E0DA7928], a2, a3, v3, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      AXTTSLogCommon();
      v7 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
        sub_1A3AB0468(a3, v7, v8, v9, v10);

      v6 = 0;
      break;
  }
  return v6;
}

+ (id)convertTTSLanguageCodeToSiriLanguageCode:(id)a3
{
  __CFString *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;

  v3 = (__CFString *)a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("ar-001"), v5, v6) & 1) != 0)
  {
    v10 = CFSTR("ar-SA");
LABEL_5:

    v3 = (__CFString *)v10;
    return v3;
  }
  if (objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("no-NO"), v8, v9))
  {
    v10 = CFSTR("nb-NO");
    goto LABEL_5;
  }
  return v3;
}

+ (void)downloadVoiceResourceForLanguage:(id)a3 completion:(id)a4
{
  void (**v5)(id, uint64_t);
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  _QWORD v32[4];
  void (**v33)(id, uint64_t);
  uint8_t buf[4];
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, uint64_t))a4;
  v6 = a3;
  v7 = (void *)objc_opt_class();
  objc_msgSend_convertTTSLanguageCodeToSiriLanguageCode_(v7, v8, (uint64_t)v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = &unk_1E4ABC768;
  v38[0] = v11;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v12, (uint64_t)v38, (uint64_t)&v37, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DA7910];
  objc_msgSend_voiceResources(MEMORY[0x1E0DA7930], v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v19;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v20, (uint64_t)&v36, 1, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bestAssetOfTypes_matching_(v14, v23, (uint64_t)v22, (uint64_t)v13, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_locallyAvailable(v25, v26, v27, v28, v29))
  {
    if (v5)
      v5[2](v5, 1);
  }
  else if (v25)
  {
    AXTTSLogCommon();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v25;
      _os_log_impl(&dword_1A3940000, v30, OS_LOG_TYPE_INFO, "Downloading voice resources asset %@", buf, 0xCu);
    }

    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = sub_1A3956C78;
    v32[3] = &unk_1E4A9FCB0;
    v33 = v5;
    objc_msgSend_downloadWithReservation_useBattery_progress_then_(v25, v31, (uint64_t)CFSTR("TextToSpeech.VoiceResources"), 1, (uint64_t)&unk_1E4A9F2C8, v32);

  }
  else if (v5)
  {
    v5[2](v5, 0);
  }

}

+ (id)installedVoiceResourceForLanguage:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend_convertTTSLanguageCodeToSiriLanguageCode_(v4, v5, (uint64_t)v3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = &unk_1E4ABC780;
  v25[1] = &unk_1E4ABC768;
  v26[0] = MEMORY[0x1E0C9AAB0];
  v26[1] = v8;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v9, (uint64_t)v26, (uint64_t)v25, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0DA7910];
  objc_msgSend_voiceResources(MEMORY[0x1E0DA7930], v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v16;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v17, (uint64_t)&v24, 1, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bestAssetOfTypes_matching_(v11, v20, (uint64_t)v19, (uint64_t)v10, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)voiceResourceForLanguage:(id)a3 voiceType:(int64_t)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  TTSVoiceResourceAsset *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  void *v99;
  _QWORD v100[2];
  _QWORD v101[3];

  v101[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_class();
  objc_msgSend_convertTTSLanguageCodeToSiriLanguageCode_(v7, v8, (uint64_t)v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v100[0] = &unk_1E4ABC780;
  v100[1] = &unk_1E4ABC768;
  v101[0] = MEMORY[0x1E0C9AAB0];
  v101[1] = v11;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v12, (uint64_t)v101, (uint64_t)v100, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DA7910];
  objc_msgSend_voiceResources(MEMORY[0x1E0DA7930], v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v19;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v20, (uint64_t)&v99, 1, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bestAssetOfTypes_matching_(v14, v23, (uint64_t)v22, (uint64_t)v13, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  AXTTSLogCommon();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    sub_1A3AB03E8();

  if (v25)
  {
    objc_msgSend_assetSource(v25, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mobileAsset(MEMORY[0x1E0DA7920], v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31 == v36)
      objc_msgSend_downloadVoiceResourceForLanguage_completion_(a1, v37, (uint64_t)v11, 0, v38);
    v39 = objc_alloc_init(TTSVoiceResourceAsset);
    objc_msgSend_setBundleIdentifier_(v39, v40, (uint64_t)CFSTR("com.apple.MobileAsset.VoiceServices.VoiceResources"), v41, v42);
    v43 = (void *)MEMORY[0x1E0CB37E8];
    v48 = objc_msgSend_versionNumber(v25, v44, v45, v46, v47);
    objc_msgSend_numberWithInteger_(v43, v49, v48, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringValue(v52, v53, v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMasteredVersion_(v39, v58, (uint64_t)v57, v59, v60);

    objc_msgSend_setCompatibilityVersion_(v39, v61, (uint64_t)&unk_1E4ABC798, v62, v63);
    objc_msgSend_setContentVersion_(v39, v64, (uint64_t)&unk_1E4ABC798, v65, v66);
    objc_msgSend_supportedLanguages(v25, v67, v68, v69, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLanguages_(v39, v72, (uint64_t)v71, v73, v74);

    if (objc_msgSend_locallyAvailable(v25, v75, v76, v77, v78))
    {
      objc_msgSend_bundle(v25, v79, v80, v81, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bundleURL(v83, v84, v85, v86, v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_setSearchPathURL_(v39, v89, (uint64_t)v88, v90, v91);
      objc_msgSend_URLByAppendingPathComponent_(v88, v92, (uint64_t)CFSTR("voice_configs.plist"), v93, v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_syncWithConfigFile_voiceType_(v39, v96, (uint64_t)v95, a4, v97);

    }
  }
  else
  {
    objc_msgSend_downloadVoiceResourceForLanguage_completion_(a1, v27, (uint64_t)v11, 0, v30);
    v39 = 0;
  }

  return v39;
}

+ (id)_footprintForType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if ((unint64_t)(a3 - 1) >= 3)
  {
    if (a3 == 4)
    {
      objc_msgSend_premium(MEMORY[0x1E0DA7918], a2, 4, v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (a3 == 5)
    {
      objc_msgSend_premiumhigh(MEMORY[0x1E0DA7918], a2, 5, v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    objc_msgSend_compact(MEMORY[0x1E0DA7918], a2, a3, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)ttsAssetFromVoiceAsset:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t isInstalled;
  const char *v40;
  void *v41;

  if (a3)
  {
    v4 = a3;
    objc_msgSend_languages(v4, v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v9, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_gender(v4, v15, v16, v17, v18);
    v24 = objc_msgSend_footprint(v4, v20, v21, v22, v23);
    objc_msgSend_name(v4, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_voiceType(v4, v30, v31, v32, v33);
    isInstalled = objc_msgSend_isInstalled(v4, v35, v36, v37, v38);

    objc_msgSend__siriAssetForLanguage_gender_footprint_voiceName_voiceType_locallyAvailable_(a1, v40, (uint64_t)v14, v19, v24, v29, v34, isInstalled);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v41 = 0;
  }
  return v41;
}

+ (int64_t)_footprintForQuality:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int isEqual;
  int64_t v14;

  v3 = (void *)MEMORY[0x1E0DA7918];
  v4 = a3;
  objc_msgSend_compact(v3, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v4, v10, (uint64_t)v9, v11, v12);

  if (isEqual)
    v14 = 3;
  else
    v14 = 4;

  return v14;
}

+ (id)voiceAssetFromTTSAsset:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *isBuiltIn_masteredVersion_compatibilityVersion_neural;
  NSObject *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  int isEqual;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unsigned int v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  unsigned int v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  char isEqualToString;
  unsigned int v191;
  id v192;
  TTSVoiceAsset *v193;
  uint64_t v194;

  v4 = a3;
  v9 = v4;
  if (v4)
  {
    objc_msgSend_name(v4, v5, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v9, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v15, v16, v17, v18, v19))
    {
      objc_msgSend_supportedLanguages(v9, v20, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend_count(v24, v25, v26, v27, v28);

      if (v29)
      {
        objc_msgSend_technology(v9, v30, v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_gryphon(MEMORY[0x1E0DA7928], v35, v36, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqual_(v34, v40, (uint64_t)v39, v41, v42))
        {

        }
        else
        {
          objc_msgSend_technology(v9, v43, v44, v45, v46);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_neural(MEMORY[0x1E0DA7928], v54, v55, v56, v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v53, v59, (uint64_t)v58, v60, v61);

          if (!isEqual)
          {
LABEL_13:
            if ((objc_msgSend_purgeable(v9, v47, v48, v49, v50) & 1) != 0)
              v70 = 0;
            else
              v70 = objc_msgSend_locallyAvailable(v9, v66, v67, v68, v69);
            objc_msgSend_technology(v9, v66, v67, v68, v69);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_custom(MEMORY[0x1E0DA7928], v72, v73, v74, v75);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v194 = (uint64_t)v10;
            if (objc_msgSend_isEqual_(v71, v77, (uint64_t)v76, v78, v79))
            {
              objc_msgSend_quality(v9, v80, v81, v82, v83);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_compact(MEMORY[0x1E0DA7918], v85, v86, v87, v88);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              v93 = objc_msgSend_isEqual_(v84, v90, (uint64_t)v89, v91, v92);

              v70 |= v93;
            }
            v191 = v70;

            v193 = [TTSVoiceAsset alloc];
            objc_msgSend_supportedLanguages(v9, v94, v95, v96, v97);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = objc_msgSend_gender(v9, v99, v100, v101, v102);
            if (v103 == 2)
              v108 = 2;
            else
              v108 = v103 == 1;
            objc_msgSend_quality(v9, v104, v105, v106, v107);
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            v113 = objc_msgSend__footprintForQuality_(a1, v110, (uint64_t)v109, v111, v112);
            v118 = objc_msgSend_locallyAvailable(v9, v114, v115, v116, v117);
            objc_msgSend_technology(v9, v119, v120, v121, v122);
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_string(v123, v124, v125, v126, v127);
            v192 = a1;
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_neural(MEMORY[0x1E0DA7928], v129, v130, v131, v132);
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_string(v133, v134, v135, v136, v137);
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToString = objc_msgSend_isEqualToString_(v128, v139, (uint64_t)v138, v140, v141);
            v142 = v108;
            v10 = (void *)v194;
            isBuiltIn_masteredVersion_compatibilityVersion_neural = (void *)objc_msgSend_initWithName_languages_gender_footprint_isInstalled_isBuiltIn_masteredVersion_compatibilityVersion_neural_(v193, v143, v194, (uint64_t)v98, v142, v113, v118, v191, CFSTR("1"), CFSTR("1"), isEqualToString);

            objc_msgSend_technology(v9, v144, v145, v146, v147);
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            v152 = objc_msgSend__voiceTypeForAssetTechnology_(v192, v149, (uint64_t)v148, v150, v151);

            objc_msgSend_bundle(v9, v153, v154, v155, v156);
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_bundlePath(v157, v158, v159, v160, v161);
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setVoicePath_(isBuiltIn_masteredVersion_compatibilityVersion_neural, v163, (uint64_t)v162, v164, v165);

            objc_msgSend_setVoiceType_(isBuiltIn_masteredVersion_compatibilityVersion_neural, v166, v152, v167, v168);
            objc_msgSend_voiceIdentifierForAsset_(v192, v169, (uint64_t)v9, v170, v171);
            v172 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setIdentifier_(isBuiltIn_masteredVersion_compatibilityVersion_neural, v173, (uint64_t)v172, v174, v175);

            objc_msgSend_diskSize(v9, v176, v177, v178, v179);
            v180 = (void *)objc_claimAutoreleasedReturnValue();
            v185 = objc_msgSend_unsignedIntValue(v180, v181, v182, v183, v184);
            objc_msgSend_setFileSize_(isBuiltIn_masteredVersion_compatibilityVersion_neural, v186, v185, v187, v188);

LABEL_22:
            goto LABEL_23;
          }
        }
        objc_msgSend_lowercaseString(v10, v47, v48, v49, v50);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v63, v64, (uint64_t)CFSTR("-"), (uint64_t)&stru_1E4AA5CE8, v65);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      }
    }
    else
    {

    }
    AXTTSLogCommon();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      sub_1A3AB04EC();

    isBuiltIn_masteredVersion_compatibilityVersion_neural = 0;
    goto LABEL_22;
  }
  isBuiltIn_masteredVersion_compatibilityVersion_neural = 0;
LABEL_23:

  return isBuiltIn_masteredVersion_compatibilityVersion_neural;
}

+ (id)voiceIdentifierForType:(int64_t)a3 footprint:(int64_t)a4 language:(id)a5 name:(id)a6
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __CFString **v27;
  __CFString *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;

  v9 = a5;
  v10 = a6;
  v14 = v10;
  v15 = 0;
  switch(a3)
  {
    case 1:
      v16 = (void *)MEMORY[0x1E0CB3940];
      TTSStringForSpeechFootprint(a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lowercaseString(v17, v18, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v16, v23, (uint64_t)CFSTR("%@.%@-%@"), v24, v25, CFSTR("com.apple.ttsbundle"), v14, v22);
      goto LABEL_10;
    case 2:
      v26 = (void *)MEMORY[0x1E0CB3940];
      v27 = kTTSSiriVoiceIdentifierPrefix;
      goto LABEL_9;
    case 4:
      v26 = (void *)MEMORY[0x1E0CB3940];
      v27 = kTTSGryphonVoiceIdentifierPrefix;
      goto LABEL_9;
    case 5:
      v26 = (void *)MEMORY[0x1E0CB3940];
      v27 = kTTSNeuralVoiceIdentifierPrefix;
      goto LABEL_9;
    case 7:
      v26 = (void *)MEMORY[0x1E0CB3940];
      if (a4 == 3)
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v11, (uint64_t)CFSTR("%@.%@"), v12, v13, CFSTR("com.apple.voice"), v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v27 = kTTSNeuralAXVoiceIdentifierPrefix;
LABEL_9:
        v28 = *v27;
        TTSStringForSpeechFootprint(a4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lowercaseString(v17, v29, v30, v31, v32);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v26, v33, (uint64_t)CFSTR("%@_%@_%@_%@"), v34, v35, v28, v14, v9, v22);
LABEL_10:
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
LABEL_11:

      return v15;
    default:
      goto LABEL_11;
  }
}

+ (id)voiceIdentifierForAsset:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;

  v4 = a3;
  objc_msgSend_technology(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend__voiceTypeForAssetTechnology_(a1, v10, (uint64_t)v9, v11, v12);

  objc_msgSend_quality(v4, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend__footprintForQuality_(a1, v19, (uint64_t)v18, v20, v21);

  objc_msgSend_primaryLanguage(v4, v23, v24, v25, v26);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    objc_msgSend_primaryLanguage(v4, v27, v28, v29, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_supportedLanguages(v4, v27, v28, v29, v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v33, v34, v35, v36, v37);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_name(v4, v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_voiceIdentifierForType_footprint_language_name_(a1, v43, v13, v22, (uint64_t)v32, v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

+ (BOOL)spaceCheck:(id)a3
{
  return 1;
}

+ (void)purgeAsset:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  objc_msgSend_ttsAssetFromVoiceAsset_(a1, a2, (uint64_t)a3, v3, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_purgeImmediately_(v8, v5, 1, v6, v7);

}

+ (void)stopDownload:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13[16];

  v4 = a3;
  AXTTSLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1A3940000, v5, OS_LOG_TYPE_DEFAULT, "Reqeuesting cancel asset download", v13, 2u);
  }

  objc_msgSend_ttsAssetFromVoiceAsset_(a1, v6, (uint64_t)v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_cancelDownloadingThen_(v9, v10, (uint64_t)&unk_1E4A9FCF0, v11, v12);
}

+ (id)deprecatedVoicesMap
{
  if (qword_1EE6D51E8 != -1)
    dispatch_once(&qword_1EE6D51E8, &unk_1E4A9FD10);
  return (id)qword_1EE6D51E0;
}

+ (void)downloadAsset:(id)a3 progressHandler:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  objc_msgSend_ttsAssetFromVoiceAsset_(a1, v7, (uint64_t)a3, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1A3957B74;
  v16[3] = &unk_1E4A9FD38;
  v17 = v6;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = sub_1A3957B94;
  v14[3] = &unk_1E4A9FCB0;
  v15 = v17;
  v12 = v17;
  objc_msgSend_downloadWithReservation_useBattery_progress_then_(v10, v13, (uint64_t)CFSTR("Accessibility"), 1, (uint64_t)v16, v14);

}

+ (int64_t)_voiceTypeForAssetTechnology:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  char isEqual;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  int v49;

  v3 = a3;
  objc_msgSend_custom(MEMORY[0x1E0DA7928], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v3, v9, (uint64_t)v8, v10, v11);

  if ((isEqual & 1) != 0)
  {
    v17 = 2;
  }
  else
  {
    objc_msgSend_vocalizer(MEMORY[0x1E0DA7928], v13, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend_isEqual_(v3, v19, (uint64_t)v18, v20, v21);

    if ((v22 & 1) != 0)
    {
      v17 = 1;
    }
    else
    {
      objc_msgSend_neural(MEMORY[0x1E0DA7928], v23, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend_isEqual_(v3, v28, (uint64_t)v27, v29, v30);

      if ((v31 & 1) != 0)
      {
        v17 = 5;
      }
      else
      {
        objc_msgSend_neuralAX(MEMORY[0x1E0DA7928], v32, v33, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend_isEqual_(v3, v37, (uint64_t)v36, v38, v39);

        if ((v40 & 1) != 0)
        {
          v17 = 7;
        }
        else
        {
          objc_msgSend_gryphon(MEMORY[0x1E0DA7928], v41, v42, v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend_isEqual_(v3, v46, (uint64_t)v45, v47, v48);

          if (v49)
            v17 = 4;
          else
            v17 = 1;
        }
      }
    }
  }

  return v17;
}

+ (id)assetsForLanguage:(id)a3 voiceType:(int64_t)a4
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel__assetsForLanguage_voiceType_installedOnly_, a3, a4, 0);
}

+ (id)installedAssetForLanguage:(id)a3 gender:(int64_t)a4 footprint:(int64_t)a5 voiceName:(id)a6 voiceType:(int64_t)a7
{
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend__siriAssetForLanguage_gender_footprint_voiceName_voiceType_locallyAvailable_(a1, a2, (uint64_t)a3, a4, a5, a6, a7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_voiceAssetFromTTSAsset_(a1, v9, (uint64_t)v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)assetForLanguage:(id)a3 gender:(int64_t)a4 footprint:(int64_t)a5 voiceName:(id)a6 voiceType:(int64_t)a7
{
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend__siriAssetForLanguage_gender_footprint_voiceName_voiceType_(a1, a2, (uint64_t)a3, a4, a5, a6, a7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_voiceAssetFromTTSAsset_(a1, v9, (uint64_t)v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_siriAssetForLanguage:(id)a3 gender:(int64_t)a4 footprint:(int64_t)a5 voiceName:(id)a6 voiceType:(int64_t)a7
{
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;

  v12 = a6;
  objc_msgSend_convertTTSLanguageCodeToSiriLanguageCode_(a1, v13, (uint64_t)a3, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__assetFilterForLanguage_gender_footprint_voiceName_voiceType_locallyAvailable_(a1, v17, (uint64_t)v16, a4, a5, v12, a7, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)objc_msgSend_mutableCopy(v18, v19, v20, v21, v22);
  objc_msgSend__assetTypesForVoiceType_(a1, v24, a7, v25, v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    objc_msgSend_bestAssetOfTypes_matching_(MEMORY[0x1E0DA7910], v27, (uint64_t)v29, (uint64_t)v23, v28);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
      objc_msgSend_removeObjectForKey_(v23, v30, (uint64_t)&unk_1E4ABC780, v31, v32);
      objc_msgSend_bestAssetOfTypes_matching_(MEMORY[0x1E0DA7910], v34, (uint64_t)v29, (uint64_t)v23, v35);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

+ (id)_siriAssetForLanguage:(id)a3 gender:(int64_t)a4 footprint:(int64_t)a5 voiceName:(id)a6 voiceType:(int64_t)a7 locallyAvailable:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;

  v8 = a8;
  v14 = a6;
  objc_msgSend_convertTTSLanguageCodeToSiriLanguageCode_(a1, v15, (uint64_t)a3, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__assetTypesForVoiceType_(a1, v19, a7, v20, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)MEMORY[0x1E0DA7910];
    objc_msgSend__assetFilterForLanguage_gender_footprint_voiceName_voiceType_locallyAvailable_(a1, v22, (uint64_t)v18, a4, a5, v14, a7, v8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bestAssetOfTypes_matching_(v24, v26, (uint64_t)v23, (uint64_t)v25, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

+ (id)_assetFilterForLanguage:(id)a3 gender:(int64_t)a4 footprint:(int64_t)a5 voiceName:(id)a6 voiceType:(int64_t)a7 locallyAvailable:(BOOL)a8
{
  _BOOL8 v8;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  _QWORD v37[3];
  _QWORD v38[4];

  v8 = a8;
  v38[3] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  v37[0] = &unk_1E4ABC7B0;
  objc_msgSend__assetTechnologyForVoiceType_(a1, v15, a7, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v18;
  v37[1] = &unk_1E4ABC7C8;
  objc_msgSend__footprintForType_(a1, v19, a5, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v22;
  v37[2] = &unk_1E4ABC780;
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v23, v8, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v26;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v27, (uint64_t)v38, (uint64_t)v37, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend_mutableCopy(v28, v29, v30, v31, v32);

  if (v13)
    objc_msgSend_setObject_forKeyedSubscript_(v33, v34, (uint64_t)v13, (uint64_t)&unk_1E4ABC768, v35);
  if (v14)
    objc_msgSend_setObject_forKeyedSubscript_(v33, v34, (uint64_t)v14, (uint64_t)&unk_1E4ABC7E0, v35);

  return v33;
}

@end
