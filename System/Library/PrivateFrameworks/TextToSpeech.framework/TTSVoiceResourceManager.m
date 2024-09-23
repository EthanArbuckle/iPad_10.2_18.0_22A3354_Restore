@implementation TTSVoiceResourceManager

+ (id)effectiveResourceForLanguageCode:(id)a3 andVoiceType:(int64_t)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[16];

  v5 = a3;
  if ((_AXSSpeechSynthesisOptions() & 8) != 0)
  {
    AXTTSLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A3940000, v9, OS_LOG_TYPE_DEFAULT, "Pref AXSpeechSynthesisOptionMauiEngineSkipSiriProvidedRules=YES. will not load Siri-provided rules", v11, 2u);
    }

    v8 = 0;
  }
  else
  {
    objc_msgSend_voiceResourceForLanguage_voiceType_(TTSSiriAssetManager, v6, (uint64_t)v5, a4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (void)enumerateLoadableResourcesInAsset:(id)a3 usingBlock:(id)a4
{
  id v5;
  void (**v6)(id, void *, void *, void *, id);
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  int isEqualToString;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id obj;
  _QWORD aBlock[4];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *, void *, void *, id))a4;
  v48 = v5;
  if (v5)
  {
    AXTTSLogRange();
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG))
      sub_1A3AB1074(v5, v7, v8, v9, v10);

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend_resourceList(v5, v11, v12, v13, v14);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v52, (uint64_t)v56, 16);
    if (v16)
    {
      v20 = v16;
      v21 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v53 != v21)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend_objectForKeyedSubscript_(v23, v17, (uint64_t)CFSTR("mime-type"), v18, v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v23, v25, (uint64_t)CFSTR("filename"), v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v29, (uint64_t)"application/edct-bin-dictionary", v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v24, v33, (uint64_t)v32, v34, v35);

          if (isEqualToString)
          {
            objc_msgSend_searchPathURL(v48, v37, v38, v39, v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_URLByAppendingPathComponent_(v41, v42, (uint64_t)v28, v43, v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = sub_1A396EFFC;
            aBlock[3] = &unk_1E4AA0290;
            v51 = v45;
            v46 = v45;
            v47 = _Block_copy(aBlock);
            v6[2](v6, v28, v24, v47, v46);

          }
        }
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v52, (uint64_t)v56, 16);
      }
      while (v20);
    }

  }
}

@end
