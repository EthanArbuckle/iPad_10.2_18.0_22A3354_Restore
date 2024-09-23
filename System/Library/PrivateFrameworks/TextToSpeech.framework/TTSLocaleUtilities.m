@implementation TTSLocaleUtilities

- (TTSLocaleUtilities)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  TTSLocaleUtilities *v6;
  uint64_t v7;
  NSMutableDictionary *fallbackSampleStringCache;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TTSLocaleUtilities;
  v6 = -[TTSLocaleUtilities init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    fallbackSampleStringCache = v6->_fallbackSampleStringCache;
    v6->_fallbackSampleStringCache = (NSMutableDictionary *)v7;

  }
  return v6;
}

- (id)defaultVoiceIdentifierForGeneralLanguageCode:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v4 = a3;
  if (v4)
  {
    AXCLanguageCanonicalFormToGeneralLanguage();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v5, v6, (uint64_t)v4, v7, v8))
    {
      objc_msgSend_generalLanguageCodeData(self, v9, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v13, v14, (uint64_t)v4, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        objc_msgSend_sharedInstance(TTSAXResourceManager, v18, v19, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_resourcesWithLanguage_type_(v22, v23, (uint64_t)v4, 4, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v25, v26, v27, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_voiceId(v30, v31, v32, v33, v34);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)sharedInstance
{
  if (qword_1ED1B5CB8 != -1)
    dispatch_once(&qword_1ED1B5CB8, &unk_1E4A9F3E8);
  return (id)qword_1ED1B5CA8;
}

- (NSDictionary)canonicalLanguageCodeVoiceNamesData
{
  NSDictionary *canonicalLanguageCodeVoiceNamesData;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSDictionary *v16;
  NSDictionary *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  canonicalLanguageCodeVoiceNamesData = self->_canonicalLanguageCodeVoiceNamesData;
  if (!canonicalLanguageCodeVoiceNamesData)
  {
    v4 = (void *)MEMORY[0x1E0CB34D0];
    v5 = objc_opt_class();
    objc_msgSend_bundleForClass_(v4, v6, v5, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pathForResource_ofType_(v9, v10, (uint64_t)CFSTR("CanonicalLanguageCodeVoiceNamesMap"), (uint64_t)CFSTR("plist"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x1E0C99D80], v13, (uint64_t)v12, v14, v15);
      v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v17 = self->_canonicalLanguageCodeVoiceNamesData;
      self->_canonicalLanguageCodeVoiceNamesData = v16;

    }
    else
    {
      AXTTSLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_1A3AB21D8(v18, v19, v20, v21, v22, v23, v24, v25);

    }
    canonicalLanguageCodeVoiceNamesData = self->_canonicalLanguageCodeVoiceNamesData;
  }
  return canonicalLanguageCodeVoiceNamesData;
}

- (NSDictionary)generalLanguageCodeData
{
  NSDictionary *generalLanguageCodeData;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSDictionary *v16;
  NSDictionary *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  generalLanguageCodeData = self->_generalLanguageCodeData;
  if (!generalLanguageCodeData)
  {
    v4 = (void *)MEMORY[0x1E0CB34D0];
    v5 = objc_opt_class();
    objc_msgSend_bundleForClass_(v4, v6, v5, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pathForResource_ofType_(v9, v10, (uint64_t)CFSTR("GeneralLanguageCodeMap"), (uint64_t)CFSTR("plist"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x1E0C99D80], v13, (uint64_t)v12, v14, v15);
      v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v17 = self->_generalLanguageCodeData;
      self->_generalLanguageCodeData = v16;

    }
    else
    {
      AXTTSLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_1A3AB21D8(v18, v19, v20, v21, v22, v23, v24, v25);

    }
    generalLanguageCodeData = self->_generalLanguageCodeData;
  }
  return generalLanguageCodeData;
}

- (NSDictionary)voiceIdSampleStringData
{
  NSDictionary *voiceIdSampleStringData;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSDictionary *v16;
  NSDictionary *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  voiceIdSampleStringData = self->_voiceIdSampleStringData;
  if (!voiceIdSampleStringData)
  {
    v4 = (void *)MEMORY[0x1E0CB34D0];
    v5 = objc_opt_class();
    objc_msgSend_bundleForClass_(v4, v6, v5, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pathForResource_ofType_(v9, v10, (uint64_t)CFSTR("VoiceIdSampleStringMap"), (uint64_t)CFSTR("plist"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x1E0C99D80], v13, (uint64_t)v12, v14, v15);
      v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v17 = self->_voiceIdSampleStringData;
      self->_voiceIdSampleStringData = v16;

    }
    else
    {
      AXTTSLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_1A3AB2208(v18, v19, v20, v21, v22, v23, v24, v25);

    }
    voiceIdSampleStringData = self->_voiceIdSampleStringData;
  }
  return voiceIdSampleStringData;
}

- (id)sampleStringForVoiceIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  TTSLocaleUtilities *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char isPersonalVoice;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  void *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  TTSLocaleUtilities *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;

  objc_msgSend_lowercaseString(a3, a2, (uint64_t)a3, v3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_voiceIdSampleStringData(self, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v11, v12, (uint64_t)v10, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      if (!objc_msgSend_containsString_(v10, v16, (uint64_t)CFSTR("compact"), v17, v18))
        goto LABEL_9;
      if ((objc_msgSend_containsString_(v10, v19, (uint64_t)CFSTR(".super-compact."), v21, v22) & 1) != 0)
        objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v10, v23, (uint64_t)CFSTR(".super-compact."), (uint64_t)CFSTR(".compact."), v24);
      else
        objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v10, v23, (uint64_t)CFSTR(".compact."), (uint64_t)CFSTR(".super-compact."), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_voiceIdSampleStringData(self, v26, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v30, v31, (uint64_t)v25, v32, v33);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
LABEL_9:
        objc_msgSend_sharedInstance(TTSAXResourceManager, v19, v20, v21, v22);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_resourceWithVoiceId_(v34, v35, (uint64_t)v10, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v38)
          goto LABEL_24;
        v39 = self;
        objc_sync_enter(v39);
        isPersonalVoice = objc_msgSend_isPersonalVoice(v38, v40, v41, v42, v43);
        v53 = objc_msgSend_type(v38, v45, v46, v47, v48) == 3 ? 1 : isPersonalVoice;
        if ((v53 & 1) != 0)
        {
          v54 = 0;
        }
        else
        {
          objc_msgSend_fallbackSampleStringCache(v39, v49, v50, v51, v52);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_primaryLanguage(v38, v56, v57, v58, v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v55, v61, (uint64_t)v60, v62, v63);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_sync_exit(v39);

        if (v54)
          goto LABEL_18;
        objc_msgSend_type(v38, v64, v65, v66, v67);
        v68 = (void *)MEMORY[0x1E0CB34D0];
        v69 = objc_opt_class();
        objc_msgSend_bundleForClass_(v68, v70, v69, v71, v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_primaryLanguage(v38, v74, v75, v76, v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        AXNSLocalizedStringForLocale();
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54)
        {
LABEL_18:
          v79 = v39;
          objc_sync_enter(v79);
          if (objc_msgSend_type(v38, v80, v81, v82, v83) == 3)
            v88 = 1;
          else
            v88 = isPersonalVoice;
          if ((v88 & 1) == 0)
          {
            objc_msgSend_fallbackSampleStringCache(v79, v84, v85, v86, v87);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_primaryLanguage(v38, v90, v91, v92, v93);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v89, v95, (uint64_t)v54, (uint64_t)v94, v96);

          }
          objc_sync_exit(v79);

          objc_msgSend_name(v38, v97, v98, v99, v100);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_primaryLanguage(v38, v102, v103, v104, v105);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_localizedName_forLanguage_(TTSSpeechVoice, v107, (uint64_t)v101, (uint64_t)v106, v108);
          v109 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v110, (uint64_t)v54, v111, v112, v109);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
LABEL_24:
          v15 = 0;
        }

      }
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)defaultVoiceIdentifierForVoiceName:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  NSObject *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend_canonicalLanguageCodeVoiceNamesData(self, v4, v5, v6, v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v9, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v46, (uint64_t)v52, 16);
    if (v16)
    {
      v21 = v16;
      v22 = *(_QWORD *)v47;
LABEL_4:
      v23 = 0;
      while (1)
      {
        if (*(_QWORD *)v47 != v22)
          objc_enumerationMutation(v14);
        v24 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v23);
        objc_msgSend_canonicalLanguageCodeVoiceNamesData(self, v17, v18, v19, v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v25, v26, (uint64_t)v24, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_lowercaseString(v8, v30, v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend_containsObject_(v29, v35, (uint64_t)v34, v36, v37);

        if ((v38 & 1) != 0)
          break;

        if (v21 == ++v23)
        {
          v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v46, (uint64_t)v52, 16);
          if (v21)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v39 = v24;

      if (!v39)
        goto LABEL_13;
      AXCLanguageCanonicalFormToGeneralLanguage();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_defaultVoiceIdentifierForGeneralLanguageCode_(self, v41, (uint64_t)v40, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_10:

LABEL_13:
      AXTTSLogResourceManager();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v8;
        _os_log_impl(&dword_1A3940000, v39, OS_LOG_TYPE_INFO, "Unable to find language code for voice name: %@", buf, 0xCu);
      }
      v44 = 0;
    }

  }
  else
  {
    v44 = 0;
  }

  return v44;
}

- (void)setGeneralLanguageCodeData:(id)a3
{
  objc_storeStrong((id *)&self->_generalLanguageCodeData, a3);
}

- (void)setVoiceIdSampleStringData:(id)a3
{
  objc_storeStrong((id *)&self->_voiceIdSampleStringData, a3);
}

- (void)setCanonicalLanguageCodeVoiceNamesData:(id)a3
{
  objc_storeStrong((id *)&self->_canonicalLanguageCodeVoiceNamesData, a3);
}

- (NSMutableDictionary)fallbackSampleStringCache
{
  return self->_fallbackSampleStringCache;
}

- (void)setFallbackSampleStringCache:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackSampleStringCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackSampleStringCache, 0);
  objc_storeStrong((id *)&self->_canonicalLanguageCodeVoiceNamesData, 0);
  objc_storeStrong((id *)&self->_voiceIdSampleStringData, 0);
  objc_storeStrong((id *)&self->_generalLanguageCodeData, 0);
}

@end
