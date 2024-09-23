@implementation TTSVoiceAsset

- (TTSVoiceAsset)initWithName:(id)a3 languages:(id)a4 gender:(int64_t)a5 footprint:(int64_t)a6 isInstalled:(BOOL)a7 isBuiltIn:(BOOL)a8 masteredVersion:(id)a9 compatibilityVersion:(id)a10 neural:(BOOL)a11
{
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  TTSVoiceAsset *v23;
  uint64_t v24;
  NSString *name;
  id v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSArray *languages;
  int64_t v43;
  BOOL v44;
  BOOL v45;
  uint8_t buf;
  _BYTE v47[15];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v52.receiver = self;
  v52.super_class = (Class)TTSVoiceAsset;
  v23 = -[TTSVoiceAsset init](&v52, sel_init);
  if (v23)
  {
    v43 = a6;
    v44 = a7;
    v45 = a8;
    v24 = objc_msgSend_copy(v17, v19, v20, v21, v22);
    name = v23->_name;
    v23->_name = (NSString *)v24;

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v26 = v18;
    v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v48, (uint64_t)v53, 16);
    if (v28)
    {
      v32 = v28;
      v33 = *(_QWORD *)v49;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v49 != v33)
            objc_enumerationMutation(v26);
          if (objc_msgSend_containsString_(*(void **)(*((_QWORD *)&v48 + 1) + 8 * v34), v29, (uint64_t)CFSTR("_"), v30, v31))
          {
            AXTTSLogCommon();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
              sub_1A3AB3324(&buf, v47, v35);

          }
          ++v34;
        }
        while (v32 != v34);
        v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v48, (uint64_t)v53, 16);
      }
      while (v32);
    }

    v40 = objc_msgSend_copy(v26, v36, v37, v38, v39);
    languages = v23->_languages;
    v23->_languages = (NSArray *)v40;

    v23->_gender = a5;
    v23->_footprint = v43;
    v23->_isInstalled = v44;
    v23->_isBuiltInVoice = v45;
    v23->_neural = a11;
  }

  return v23;
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSString *name;
  NSArray *languages;
  int64_t gender;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  objc_super v34;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v34.receiver = self;
  v34.super_class = (Class)TTSVoiceAsset;
  -[TTSVoiceAsset description](&v34, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  languages = self->_languages;
  gender = self->_gender;
  v11 = CFSTR("any");
  if (gender == 2)
    v11 = CFSTR("female");
  if (gender == 1)
    v12 = CFSTR("male");
  else
    v12 = v11;
  if (self->_footprint == 3)
    v13 = CFSTR("compact");
  else
    v13 = CFSTR("premium");
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_neural, v5, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v15, self->_isInstalled, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_masteredVersion(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_compatibilityVersion(self, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v29, (uint64_t)CFSTR("%@ Name: %@, Languages: %@, Gender: %@, Footprint: %@, Neural: %@, Installed: %@, Version: %@/%@"), v30, v31, v7, name, languages, v12, v13, v14, v18, v23, v28);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  id v27;

  name = self->_name;
  v5 = a3;
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)name, (uint64_t)CFSTR("_name"), v7);
  objc_msgSend_encodeObject_forKey_(v5, v8, (uint64_t)self->_languages, (uint64_t)CFSTR("_languages"), v9);
  objc_msgSend_encodeInteger_forKey_(v5, v10, self->_gender, (uint64_t)CFSTR("_gender"), v11);
  objc_msgSend_encodeInteger_forKey_(v5, v12, self->_footprint, (uint64_t)CFSTR("_footprint"), v13);
  objc_msgSend_encodeBool_forKey_(v5, v14, self->_isInstalled, (uint64_t)CFSTR("_isInstalled"), v15);
  objc_msgSend_encodeBool_forKey_(v5, v16, self->_isBuiltInVoice, (uint64_t)CFSTR("_isBuiltInVoice"), v17);
  objc_msgSend_encodeObject_forKey_(v5, v18, (uint64_t)self->_voicePath, (uint64_t)CFSTR("_voicePath"), v19);
  objc_msgSend_encodeBool_forKey_(v5, v20, self->_neural, (uint64_t)CFSTR("_neural"), v21);
  objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v22, self->_fileSize, v23, v24);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v25, (uint64_t)v27, (uint64_t)CFSTR("fileSizeWithNumber"), v26);

}

- (TTSVoiceAsset)initWithCoder:(id)a3
{
  id v4;
  TTSVoiceAsset *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *name;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSArray *languages;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSString *voicePath;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  objc_super v52;
  _QWORD v53[3];

  v53[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)TTSVoiceAsset;
  v5 = -[TTSVoiceAsset init](&v52, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_name"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v53[0] = objc_opt_class();
    v53[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v12, (uint64_t)v53, 2, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v11, v15, (uint64_t)v14, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v19, (uint64_t)v18, (uint64_t)CFSTR("_languages"), v20);
    v21 = objc_claimAutoreleasedReturnValue();
    languages = v5->_languages;
    v5->_languages = (NSArray *)v21;

    v5->_gender = objc_msgSend_decodeIntegerForKey_(v4, v23, (uint64_t)CFSTR("_gender"), v24, v25);
    v5->_footprint = objc_msgSend_decodeIntegerForKey_(v4, v26, (uint64_t)CFSTR("_footprint"), v27, v28);
    v5->_isInstalled = objc_msgSend_decodeBoolForKey_(v4, v29, (uint64_t)CFSTR("_isInstalled"), v30, v31);
    v5->_isBuiltInVoice = objc_msgSend_decodeBoolForKey_(v4, v32, (uint64_t)CFSTR("_isBuiltInVoice"), v33, v34);
    v35 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v36, v35, (uint64_t)CFSTR("_voicePath"), v37);
    v38 = objc_claimAutoreleasedReturnValue();
    voicePath = v5->_voicePath;
    v5->_voicePath = (NSString *)v38;

    v5->_neural = objc_msgSend_decodeBoolForKey_(v4, v40, (uint64_t)CFSTR("_neural"), v41, v42);
    v43 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v44, v43, (uint64_t)CFSTR("fileSizeWithNumber"), v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_fileSize = objc_msgSend_integerValue(v46, v47, v48, v49, v50);

  }
  return v5;
}

- (TTSVoiceAsset)initWithDictionaryRepresentation:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *isBuiltIn_masteredVersion_compatibilityVersion_neural;
  TTSVoiceAsset *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  char v52;

  v3 = a3;
  objc_msgSend_objectForKey_(v3, v4, (uint64_t)CFSTR("Name"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  objc_msgSend_objectForKey_(v3, v10, (uint64_t)CFSTR("Languages"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v18 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_lastObject(v13, v14, v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v13;
    else
      v20 = 0;
    v18 = v20;

  }
  objc_msgSend_objectForKey_(v3, v14, (uint64_t)CFSTR("Gender"), v16, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v26 = objc_msgSend_integerValue(v21, v22, v23, v24, v25);
  else
    v26 = 0;
  objc_msgSend_objectForKeyedSubscript_(v3, v22, (uint64_t)CFSTR("neural"), v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_BOOLValue(v27, v28, v29, v30, v31);

  objc_msgSend_objectForKeyedSubscript_(v3, v33, (uint64_t)CFSTR("MasteredVersion"), v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v3, v37, (uint64_t)CFSTR("CompatabilityVersion"), v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v32;
  isBuiltIn_masteredVersion_compatibilityVersion_neural = (void *)objc_msgSend_initWithName_languages_gender_footprint_isInstalled_isBuiltIn_masteredVersion_compatibilityVersion_neural_(self, v41, (uint64_t)v9, (uint64_t)v18, v26, 1, 0, 1, v36, v40, v52);

  v43 = isBuiltIn_masteredVersion_compatibilityVersion_neural;
  objc_msgSend_objectForKeyedSubscript_(v3, v44, (uint64_t)CFSTR("VoicePath"), v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setVoicePath_(v43, v48, (uint64_t)v47, v49, v50);

  return v43;
}

- (id)dictionaryRepresentation
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSString *name;
  NSArray *languages;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = v3;
  name = self->_name;
  if (name)
    objc_msgSend_setObject_forKey_(v3, v4, (uint64_t)name, (uint64_t)CFSTR("Name"), v6);
  languages = self->_languages;
  if (languages)
    objc_msgSend_setObject_forKey_(v7, v4, (uint64_t)languages, (uint64_t)CFSTR("Languages"), v6);
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v4, self->_gender, v5, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v7, v11, (uint64_t)v10, (uint64_t)CFSTR("Gender"), v12);

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v13, self->_neural, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v7, v17, (uint64_t)v16, (uint64_t)CFSTR("neural"), v18);

  objc_msgSend_contentVersion(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend_contentVersion(self, v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v29, (uint64_t)v28, (uint64_t)CFSTR("ContentVersion"), v30);

  }
  objc_msgSend_masteredVersion(self, v24, v25, v26, v27);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend_masteredVersion(self, v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v37, (uint64_t)v36, (uint64_t)CFSTR("MasteredVersion"), v38);

  }
  objc_msgSend_compatibilityVersion(self, v32, v33, v34, v35);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend_compatibilityVersion(self, v40, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v45, (uint64_t)v44, (uint64_t)CFSTR("CompatabilityVersion"), v46);

  }
  objc_msgSend_voicePath(self, v40, v41, v42, v43);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend_voicePath(self, v48, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v7, v53, (uint64_t)v52, (uint64_t)CFSTR("VoicePath"), v54);

  }
  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSArray)languages
{
  return self->_languages;
}

- (int64_t)gender
{
  return self->_gender;
}

- (int64_t)footprint
{
  return self->_footprint;
}

- (BOOL)neural
{
  return self->_neural;
}

- (BOOL)isInstalled
{
  return self->_isInstalled;
}

- (BOOL)isDownloading
{
  return self->_isDownloading;
}

- (void)setIsDownloading:(BOOL)a3
{
  self->_isDownloading = a3;
}

- (BOOL)isBuiltInVoice
{
  return self->_isBuiltInVoice;
}

- (NSString)voicePath
{
  return self->_voicePath;
}

- (void)setVoicePath:(id)a3
{
  objc_storeStrong((id *)&self->_voicePath, a3);
}

- (int64_t)voiceType
{
  return self->_voiceType;
}

- (void)setVoiceType:(int64_t)a3
{
  self->_voiceType = a3;
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(int64_t)a3
{
  self->_fileSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voicePath, 0);
  objc_storeStrong((id *)&self->_languages, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
