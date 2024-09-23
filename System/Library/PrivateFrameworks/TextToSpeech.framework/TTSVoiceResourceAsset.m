@implementation TTSVoiceResourceAsset

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_componentsJoinedByString_(self->_languages, a2, (uint64_t)CFSTR(", "), v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contentVersion(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_masteredVersion(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v17, (uint64_t)CFSTR("Voice resource, Languages: %@, ContentVersion: %@, MasteredVersion: %@"), v18, v19, v6, v11, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TTSVoiceResourceAsset;
  v4 = a3;
  -[TTSAssetBase encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_languages, (uint64_t)CFSTR("_languages"), v6, v9.receiver, v9.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_searchPathURL, (uint64_t)CFSTR("_searchPathURL"), v8);

}

- (TTSVoiceResourceAsset)initWithCoder:(id)a3
{
  id v4;
  TTSVoiceResourceAsset *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *languages;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSURL *searchPathURL;
  objc_super v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TTSVoiceResourceAsset;
  v5 = -[TTSAssetBase initWithCoder:](&v24, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v25, 2, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v6, v10, (uint64_t)v9, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v13, (uint64_t)CFSTR("_languages"), v15);
    v16 = objc_claimAutoreleasedReturnValue();
    languages = v5->_languages;
    v5->_languages = (NSArray *)v16;

    v18 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, (uint64_t)CFSTR("_searchPathURL"), v20);
    v21 = objc_claimAutoreleasedReturnValue();
    searchPathURL = v5->_searchPathURL;
    v5->_searchPathURL = (NSURL *)v21;

  }
  return v5;
}

+ (id)legacyPlatforms
{
  if (qword_1EE6D56B0 != -1)
    dispatch_once(&qword_1EE6D56B0, &unk_1E4A9F348);
  return (id)qword_1EE6D56A8;
}

- (void)syncWithConfigFile:(id)a3 voiceType:(int64_t)a4
{
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  id v9;

  objc_msgSend_dictionaryWithContentsOfURL_(MEMORY[0x1E0C99D80], a2, (uint64_t)a3, a4, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_syncWithConfigData_voiceType_(self, v7, (uint64_t)v9, a4, v8);

}

- (void)syncWithConfigData:(id)a3 voiceType:(int64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  uint64_t v51;
  void *v52;
  const char *v53;
  void *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  TTSVoiceResourceAsset *v65;
  uint64_t v66;
  _QWORD v67[4];
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[2];
  _QWORD v74[2];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v11 = v6;
  if (v6)
  {
    objc_msgSend_allKeys(v6, v7, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_containsObject_(v12, v13, (uint64_t)CFSTR("ax_resources"), v14, v15);

    v65 = self;
    v66 = (uint64_t)v11;
    if (v16)
    {
      objc_msgSend_objectForKeyedSubscript_(v11, v17, (uint64_t)CFSTR("ax_resources"), v18, v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4)
        objc_msgSend_objectForKeyedSubscript_(v11, v20, (uint64_t)CFSTR("ax_gryphon_resource_order"), v21, v22);
      else
        objc_msgSend_objectForKeyedSubscript_(v11, v20, (uint64_t)CFSTR("ax_compact_resource_order"), v21, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend_objectForKeyedSubscript_(v11, v17, (uint64_t)CFSTR("vocalizer_resource_order"), v18, v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v11, v25, (uint64_t)CFSTR("vocalizer_resources"), v26, v27);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    objc_msgSend_allKeys(v23, v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = sub_1A396E10C;
    v67[3] = &unk_1E4AA0250;
    v38 = v24;
    v68 = v38;
    objc_msgSend_sortedArrayUsingComparator_(v37, v39, (uint64_t)v67, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v69, (uint64_t)v75, 16);
    if (v44)
    {
      v48 = v44;
      v49 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v48; ++i)
        {
          if (*(_QWORD *)v70 != v49)
            objc_enumerationMutation(v42);
          v51 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i);
          if (objc_msgSend_containsObject_(v38, v45, v51, v46, v47))
          {
            v73[0] = CFSTR("filename");
            v73[1] = CFSTR("mime-type");
            v74[0] = v51;
            objc_msgSend_objectForKeyedSubscript_(v23, v45, v51, v46, v47);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v74[1] = v52;
            objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v53, (uint64_t)v74, (uint64_t)v73, 2);
            v54 = v23;
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v32, v56, (uint64_t)v55, v57, v58);

            v23 = v54;
          }
        }
        v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v45, (uint64_t)&v69, (uint64_t)v75, 16);
      }
      while (v48);
    }

    objc_msgSend_setResourceList_(v65, v59, (uint64_t)v32, v60, v61);
    v11 = (void *)v66;
    objc_msgSend_setVoiceConfig_(v65, v62, v66, v63, v64);

  }
}

- (id)defaultVoice
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  objc_msgSend_voiceConfig(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("_voices"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (qword_1EE6D56C0 != -1)
      dispatch_once(&qword_1EE6D56C0, &unk_1E4A9DA10);
    if (byte_1EE6D56B8 && CFPreferencesGetAppBooleanValue(CFSTR("DisableGryphon"), CFSTR("com.apple.voiced"), 0)
      || (objc_msgSend_legacyPlatforms(TTSVoiceResourceAsset, v10, v11, v12, v13),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = (void *)MGCopyAnswer(),
          v19 = objc_msgSend_containsObject_(v14, v16, (uint64_t)v15, v17, v18),
          v15,
          v14,
          (v19 & 1) != 0))
    {
      objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)CFSTR("legacy"), v12, v13);
    }
    else
    {
      if (MGGetProductType() != 4240173202)
      {
LABEL_13:
        objc_msgSend_objectForKeyedSubscript_(v9, v20, (uint64_t)CFSTR("default"), v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      objc_msgSend_objectForKeyedSubscript_(v9, v20, (uint64_t)CFSTR("premiumhigh"), v21, v22);
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
      goto LABEL_13;
  }
  else
  {
    v23 = 0;
  }
LABEL_14:

  return v23;
}

- (id)defaultTypeString
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend_defaultVoice(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("Type"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)defaultFootprintString
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend_defaultVoice(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("Footprint"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSArray)languages
{
  return self->_languages;
}

- (void)setLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)resourceList
{
  return self->_resourceList;
}

- (void)setResourceList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSURL)searchPathURL
{
  return self->_searchPathURL;
}

- (void)setSearchPathURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)voiceConfig
{
  return self->_voiceConfig;
}

- (void)setVoiceConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceConfig, 0);
  objc_storeStrong((id *)&self->_searchPathURL, 0);
  objc_storeStrong((id *)&self->_resourceList, 0);
  objc_storeStrong((id *)&self->_languages, 0);
}

@end
