@implementation TTSAXResource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentSubType, 0);
  objc_storeStrong((id *)&self->_synthesizerBundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_synthesisProviderVoice, 0);
  objc_storeStrong((id *)&self->_assetId, 0);
  objc_storeStrong((id *)&self->_voiceId, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_languages, 0);
  objc_storeStrong((id *)&self->_voiceAsset, 0);
  objc_storeStrong((id *)&self->_axAsset, 0);
}

- (TTSAXResource)initWithCoder:(id)a3
{
  id v4;
  TTSAXResource *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *voiceId;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSArray *languages;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  NSString *synthesizerBundleIdentifier;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  NSString *componentSubType;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  NSString *assetId;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  AVSpeechSynthesisProviderVoice *synthesisProviderVoice;
  objc_super v87;

  v4 = a3;
  v87.receiver = self;
  v87.super_class = (Class)TTSAXResource;
  v5 = -[TTSAXResource init](&v87, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("Name"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("VoiceId"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    voiceId = v5->_voiceId;
    v5->_voiceId = (NSString *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend_setWithObjects_(v16, v19, v17, v20, v21, v18, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v22, (uint64_t)CFSTR("Languages"), v24);
    v25 = objc_claimAutoreleasedReturnValue();
    languages = v5->_languages;
    v5->_languages = (NSArray *)v25;

    v5->_type = objc_msgSend_decodeIntegerForKey_(v4, v27, (uint64_t)CFSTR("Type"), v28, v29);
    v5->_subtype = objc_msgSend_decodeIntegerForKey_(v4, v30, (uint64_t)CFSTR("Subtype"), v31, v32);
    v5->_footprint = objc_msgSend_decodeIntegerForKey_(v4, v33, (uint64_t)CFSTR("Footprint"), v34, v35);
    v5->_gender = objc_msgSend_decodeIntegerForKey_(v4, v36, (uint64_t)CFSTR("Gender"), v37, v38);
    v39 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v40, v39, (uint64_t)CFSTR("synthesizerBundleIdentifier"), v41);
    v42 = objc_claimAutoreleasedReturnValue();
    synthesizerBundleIdentifier = v5->_synthesizerBundleIdentifier;
    v5->_synthesizerBundleIdentifier = (NSString *)v42;

    v44 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v45, v44, (uint64_t)CFSTR("componentSubType"), v46);
    v47 = objc_claimAutoreleasedReturnValue();
    componentSubType = v5->_componentSubType;
    v5->_componentSubType = (NSString *)v47;

    v49 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v50, v49, (uint64_t)CFSTR("AssetSize"), v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_assetSize = objc_msgSend_unsignedIntegerValue(v52, v53, v54, v55, v56);

    v5->_isInstalled = objc_msgSend_decodeBoolForKey_(v4, v57, (uint64_t)CFSTR("IsInstalled"), v58, v59);
    v5->_canBeDownloaded = objc_msgSend_decodeBoolForKey_(v4, v60, (uint64_t)CFSTR("CanBeDownloaded"), v61, v62);
    v63 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v64, v63, (uint64_t)CFSTR("AssetId"), v65);
    v66 = objc_claimAutoreleasedReturnValue();
    assetId = v5->_assetId;
    v5->_assetId = (NSString *)v66;

    v5->_memoryPeak = objc_msgSend_decodeIntegerForKey_(v4, v68, (uint64_t)CFSTR("MemoryPeak"), v69, v70);
    v5->_isNoveltyVoice = objc_msgSend_decodeBoolForKey_(v4, v71, (uint64_t)CFSTR("NoveltyVoice"), v72, v73);
    v5->_isPersonalVoice = objc_msgSend_decodeBoolForKey_(v4, v74, (uint64_t)CFSTR("PersonalVoice"), v75, v76);
    objc_msgSend__ensureFirstPartyComponents(v5, v77, v78, v79, v80);
    v81 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v82, v81, (uint64_t)CFSTR("_synthesisProviderVoice"), v83);
    v84 = objc_claimAutoreleasedReturnValue();
    synthesisProviderVoice = v5->_synthesisProviderVoice;
    v5->_synthesisProviderVoice = (AVSpeechSynthesisProviderVoice *)v84;

  }
  return v5;
}

- (void)_ensureFirstPartyComponents
{
  unint64_t type;
  NSString *synthesizerBundleIdentifier;
  __CFString *v5;
  NSString *componentSubType;

  if (self->_componentSubType && self->_synthesizerBundleIdentifier)
    return;
  type = self->_type;
  if (type > 0xA)
    return;
  if (((1 << type) & 0x4D0) != 0)
  {
    if (TTSUseMauiSSE())
    {
      synthesizerBundleIdentifier = self->_synthesizerBundleIdentifier;
      self->_synthesizerBundleIdentifier = (NSString *)CFSTR("com.apple.ax.MauiTTSSupport.MauiAUSP");
      v5 = CFSTR("crnc");
LABEL_13:

      componentSubType = self->_componentSubType;
      self->_componentSubType = &v5->isa;

      return;
    }
  }
  else
  {
    if (type == 2)
    {
      synthesizerBundleIdentifier = self->_synthesizerBundleIdentifier;
      self->_synthesizerBundleIdentifier = (NSString *)CFSTR("com.apple.speech.MacinTalkFramework.MacinTalkAUSP");
      v5 = CFSTR("mctk");
      goto LABEL_13;
    }
    if (type != 3)
      return;
  }
  if (TTSUseSiriSSE())
  {
    synthesizerBundleIdentifier = self->_synthesizerBundleIdentifier;
    self->_synthesizerBundleIdentifier = (NSString *)CFSTR("com.apple.texttospeech.SiriAUSP");
    v5 = CFSTR("axsr");
    goto LABEL_13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = objc_msgSend_init(v9, v10, v11, v12, v13);
  objc_msgSend_name(self, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_copy(v19, v20, v21, v22, v23);
  v25 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v24;

  objc_msgSend_voiceId(self, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend_copy(v30, v31, v32, v33, v34);
  v36 = *(void **)(v14 + 48);
  *(_QWORD *)(v14 + 48) = v35;

  objc_msgSend_languages(self, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend_copy(v41, v42, v43, v44, v45);
  v47 = *(void **)(v14 + 32);
  *(_QWORD *)(v14 + 32) = v46;

  *(_QWORD *)(v14 + 64) = objc_msgSend_type(self, v48, v49, v50, v51);
  *(_QWORD *)(v14 + 72) = objc_msgSend_subtype(self, v52, v53, v54, v55);
  *(_QWORD *)(v14 + 80) = objc_msgSend_footprint(self, v56, v57, v58, v59);
  *(_QWORD *)(v14 + 88) = objc_msgSend_gender(self, v60, v61, v62, v63);
  *(_BYTE *)(v14 + 8) = objc_msgSend_isNoveltyVoice(self, v64, v65, v66, v67);
  *(_BYTE *)(v14 + 9) = objc_msgSend_isPersonalVoice(self, v68, v69, v70, v71);
  objc_msgSend_synthesizerBundleIdentifier(self, v72, v73, v74, v75);
  v76 = objc_claimAutoreleasedReturnValue();
  v77 = *(void **)(v14 + 120);
  *(_QWORD *)(v14 + 120) = v76;

  objc_msgSend_componentSubType(self, v78, v79, v80, v81);
  v82 = objc_claimAutoreleasedReturnValue();
  v83 = *(void **)(v14 + 128);
  *(_QWORD *)(v14 + 128) = v82;

  *(_QWORD *)(v14 + 136) = objc_msgSend_assetSize(self, v84, v85, v86, v87);
  *(_BYTE *)(v14 + 11) = objc_msgSend_isInstalled(self, v88, v89, v90, v91);
  *(_BYTE *)(v14 + 10) = objc_msgSend_canBeDownloaded(self, v92, v93, v94, v95);
  objc_msgSend_assetId(self, v96, v97, v98, v99);
  v100 = objc_claimAutoreleasedReturnValue();
  v101 = *(void **)(v14 + 56);
  *(_QWORD *)(v14 + 56) = v100;

  *(_QWORD *)(v14 + 144) = objc_msgSend_memoryPeak(self, v102, v103, v104, v105);
  objc_storeStrong((id *)(v14 + 96), self->_synthesisProviderVoice);
  return (id)v14;
}

- (unint64_t)subtype
{
  return self->_subtype;
}

- (BOOL)isPersonalVoice
{
  return self->_isPersonalVoice;
}

- (BOOL)isNoveltyVoice
{
  return self->_isNoveltyVoice;
}

- (int64_t)gender
{
  return self->_gender;
}

- (NSString)voiceId
{
  return self->_voiceId;
}

- (BOOL)isInstalled
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v20;
  void *v21;
  char isInstalled;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  objc_msgSend_voiceAsset(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_voiceAsset(self, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v21 = v11;
    isInstalled = objc_msgSend_isInstalled(v11, v12, v13, v14, v15);

    return isInstalled;
  }
  objc_msgSend_axAsset(self, v7, v8, v9, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend_axAsset(self, v17, v18, v19, v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return (objc_msgSend_isSystemVoice(self, v17, v18, v19, v20) & 1) != 0
      || objc_msgSend_type(self, v24, v25, v26, v27) == 9
      || self->_isInstalled;
}

- (AXAsset)axAsset
{
  return self->_axAsset;
}

- (int64_t)footprint
{
  uint64_t v2;
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
  uint64_t v15;
  int64_t footprint;

  objc_msgSend_voiceAsset(self, a2, v2, v3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_voiceAsset(self, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    footprint = objc_msgSend_footprint(v11, v12, v13, v14, v15);

  }
  else
  {
    footprint = self->_footprint;
  }

  return footprint;
}

- (TTSVoiceAsset)voiceAsset
{
  return self->_voiceAsset;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)synthesizerBundleIdentifier
{
  return self->_synthesizerBundleIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (id)primaryLanguage
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;

  objc_msgSend_languages(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_count(v6, v7, v8, v9, v10);

  if (v11)
  {
    objc_msgSend_languages(self, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v16, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    AXCLanguageConvertToCanonicalForm();
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    AXTTSLogResourceManager();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_1A3AB0924((uint64_t)self, v23);

    v22 = 0;
  }
  return v22;
}

- (NSArray)languages
{
  return self->_languages;
}

- (NSString)componentSubType
{
  return self->_componentSubType;
}

- (BOOL)canBeDownloaded
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  TTSAXResource *v5;
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
  uint64_t v20;

  v5 = self;
  objc_msgSend_axAsset(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_msgSend_voiceAsset(v5, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend_voiceAsset(v5, v12, v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v5) = objc_msgSend_isBuiltInVoice(v16, v17, v18, v19, v20) ^ 1;

    }
    else
    {
      LOBYTE(v5) = v5->_canBeDownloaded;
    }
  }
  return (char)v5;
}

- (int64_t)memoryPeak
{
  return self->_memoryPeak;
}

- (unint64_t)assetSize
{
  uint64_t v2;
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
  uint64_t v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;

  if (objc_msgSend_type(self, a2, v2, v3, v4) == 3 || objc_msgSend_type(self, v6, v7, v8, v9) == 10)
  {
    objc_msgSend_voiceAsset(self, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend_voiceAsset(self, v6, v7, v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend_fileSize(v11, v12, v13, v14, v15);
LABEL_5:

      return v16;
    }
  }
  if (objc_msgSend_isInstalled(self, v6, v7, v8, v9))
  {
    objc_msgSend_axAsset(self, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend_axAsset(self, v17, v18, v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_unarchivedFileSize(v22, v23, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend_unsignedIntegerValue(v27, v28, v29, v30, v31);

      if (v16)
        return v16;
      objc_msgSend_axAsset(self, v32, v33, v34, v35);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_computedOnDiskSize(v11, v36, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend_unsignedIntValue(v40, v41, v42, v43, v44);

      goto LABEL_5;
    }
  }
  if ((objc_msgSend_isInstalled(self, v17, v18, v19, v20) & 1) == 0)
  {
    objc_msgSend_axAsset(self, v45, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      objc_msgSend_axAsset(self, v50, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_downloadSize(v54, v55, v56, v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend_unsignedIntegerValue(v59, v60, v61, v62, v63);

      return v64;
    }
  }
  return self->_assetSize;
}

- (TTSAXResource)initWithData:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  TTSAXResource *v9;
  uint64_t v10;
  NSString *name;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString *voiceId;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *languages;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSString *synthesizerBundleIdentifier;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSString *componentSubType;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  TTSAXResource *v84;
  TTSAXResource *v85;
  objc_super v87;

  v4 = a3;
  v87.receiver = self;
  v87.super_class = (Class)TTSAXResource;
  v9 = -[TTSAXResource init](&v87, sel_init);
  if (v9)
  {
    objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("Name"), v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    name = v9->_name;
    v9->_name = (NSString *)v10;

    objc_msgSend_objectForKey_(v4, v12, (uint64_t)CFSTR("VoiceId"), v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    voiceId = v9->_voiceId;
    v9->_voiceId = (NSString *)v15;

    objc_msgSend_objectForKey_(v4, v17, (uint64_t)CFSTR("Languages"), v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    languages = v9->_languages;
    v9->_languages = (NSArray *)v20;

    objc_msgSend_objectForKey_(v4, v22, (uint64_t)CFSTR("Type"), v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_type = objc_msgSend__resourceTypeFromStringInput_(v9, v26, (uint64_t)v25, v27, v28);

    objc_msgSend_objectForKey_(v4, v29, (uint64_t)CFSTR("Subtype"), v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_subtype = objc_msgSend__resourceSubtypeFromStringInput_(v9, v33, (uint64_t)v32, v34, v35);

    objc_msgSend_objectForKey_(v4, v36, (uint64_t)CFSTR("Footprint"), v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_footprint = objc_msgSend__resourceFootprintFromStringInput_(v9, v40, (uint64_t)v39, v41, v42);

    objc_msgSend_objectForKey_(v4, v43, (uint64_t)CFSTR("Gender"), v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_gender = objc_msgSend__resourceGenderFromStringInput_(v9, v47, (uint64_t)v46, v48, v49);

    objc_msgSend_objectForKey_(v4, v50, (uint64_t)CFSTR("NoveltyVoice"), v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_isNoveltyVoice = objc_msgSend_BOOLValue(v53, v54, v55, v56, v57);

    v9->_isPersonalVoice = objc_msgSend_hasPrefix_(v9->_voiceId, v58, (uint64_t)CFSTR("com.apple.speech.personalvoice"), v59, v60);
    objc_msgSend_objectForKey_(v4, v61, (uint64_t)CFSTR("synthesizerBundleIdentifier"), v62, v63);
    v64 = objc_claimAutoreleasedReturnValue();
    synthesizerBundleIdentifier = v9->_synthesizerBundleIdentifier;
    v9->_synthesizerBundleIdentifier = (NSString *)v64;

    objc_msgSend_objectForKey_(v4, v66, (uint64_t)CFSTR("componentSubType"), v67, v68);
    v69 = objc_claimAutoreleasedReturnValue();
    componentSubType = v9->_componentSubType;
    v9->_componentSubType = (NSString *)v69;

    objc_msgSend_objectForKey_(v4, v71, (uint64_t)CFSTR("MemoryPeak"), v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_memoryPeak = objc_msgSend_integerValue(v74, v75, v76, v77, v78);

    objc_msgSend__ensureFirstPartyComponents(v9, v79, v80, v81, v82);
  }
  objc_msgSend_name(v9, v5, v6, v7, v8);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (v83)
    v84 = v9;
  else
    v84 = 0;
  v85 = v84;

  return v85;
}

- (BOOL)memoryPeakExceedsActiveJetsamLimit
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend_processInfo(MEMORY[0x1E0CB3898], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_physicalMemory(v6, v7, v8, v9, v10);

  if (v11 > 0x147D356FFLL)
    return 0;
  if (AXDeviceIsJ42() && objc_msgSend_memoryPeak(self, v13, v14, v15, v16) > 70000000)
    return 1;
  return objc_msgSend_memoryPeak(self, v13, v14, v15, v16) > 150000000;
}

- (unint64_t)_resourceTypeFromStringInput:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD v17[8];
  _QWORD v18[9];

  v18[8] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17[0] = CFSTR("MacinTalk");
  v17[1] = CFSTR("Gryphon");
  v18[0] = &unk_1E4ABC7F8;
  v18[1] = &unk_1E4ABC810;
  v17[2] = CFSTR("Custom");
  v17[3] = CFSTR("Maui");
  v18[2] = &unk_1E4ABC828;
  v18[3] = &unk_1E4ABC840;
  v17[4] = CFSTR("Kona");
  v17[5] = CFSTR("LegacyCombinedVocalizer");
  v18[4] = &unk_1E4ABC858;
  v18[5] = &unk_1E4ABC870;
  v17[6] = CFSTR("LegacyVocalizer");
  v17[7] = CFSTR("SynthesizerExtension");
  v18[6] = &unk_1E4ABC888;
  v18[7] = &unk_1E4ABC8A0;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v4, (uint64_t)v18, (uint64_t)v17, 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (v3)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)v3, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_integerValue(v10, v11, v12, v13, v14);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)_resourceSubtypeFromStringInput:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD v17[6];
  _QWORD v18[7];

  v18[6] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17[0] = CFSTR("None");
  v17[1] = CFSTR("MacinTalk");
  v18[0] = &unk_1E4ABC7F8;
  v18[1] = &unk_1E4ABC810;
  v17[2] = CFSTR("Gryphon");
  v17[3] = CFSTR("SiriNeuralAX");
  v18[2] = &unk_1E4ABC840;
  v18[3] = &unk_1E4ABC888;
  v17[4] = CFSTR("Hydra");
  v17[5] = CFSTR("SiriNeural");
  v18[4] = &unk_1E4ABC858;
  v18[5] = &unk_1E4ABC870;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v4, (uint64_t)v18, (uint64_t)v17, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (v3)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)v3, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_integerValue(v10, v11, v12, v13, v14);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (int64_t)_resourceGenderFromStringInput:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17[0] = CFSTR("male");
  v17[1] = CFSTR("female");
  v18[0] = &unk_1E4ABC918;
  v18[1] = &unk_1E4ABC8B8;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v4, (uint64_t)v18, (uint64_t)v17, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (v3)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)v3, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_integerValue(v10, v11, v12, v13, v14);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (int64_t)_resourceFootprintFromStringInput:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17[0] = CFSTR("super-compact");
  v17[1] = CFSTR("compact");
  v18[0] = &unk_1E4ABC8B8;
  v18[1] = &unk_1E4ABC8D0;
  v17[2] = CFSTR("enhanced");
  v17[3] = CFSTR("premium");
  v18[2] = &unk_1E4ABC8E8;
  v18[3] = &unk_1E4ABC900;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v4, (uint64_t)v18, (uint64_t)v17, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (v3)
  {
    objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)v3, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_integerValue(v10, v11, v12, v13, v14);

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (NSString)assetId
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  NSString *v16;

  objc_msgSend_axAsset(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_axAsset(self, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetId(v11, v12, v13, v14, v15);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = self->_assetId;
  }
  return v16;
}

- (TTSAXResource)initWithSSEVoice:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  TTSAXResource *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  int isEqualToString;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSString *name;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  TTSAXResource *v67;
  NSString *voiceId;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSArray *languages;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  objc_super v83;

  v5 = a3;
  v83.receiver = self;
  v83.super_class = (Class)TTSAXResource;
  v10 = -[TTSAXResource init](&v83, sel_init);
  if (!v10)
  {
LABEL_21:
    v67 = v10;
    goto LABEL_22;
  }
  objc_msgSend_synthesizerBundleIdentifier(v5, v6, v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v11, v12, (uint64_t)CFSTR("com.apple.speech.MacinTalkFramework.MacinTalkAUSP"), v13, v14) & 1) == 0&& (objc_msgSend_isEqualToString_(v11, v15, (uint64_t)CFSTR("com.apple.speech.MacinTalkFramework"), v16, v17) & 1) == 0&& (!TTSUseMauiSSE()|| (objc_msgSend_isEqualToString_(v11, v18, (uint64_t)CFSTR("com.apple.ax.MauiTTSSupport.MauiAUSP"), v20, v21) & 1) == 0&& (objc_msgSend_isEqualToString_(v11, v22, (uint64_t)CFSTR("com.apple.ax.MauiTTSSupport"), v23, v24) & 1) == 0))
  {
    objc_msgSend_name(v5, v18, v19, v20, v21);
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v30 = (void *)v25;
      objc_msgSend_identifier(v5, v26, v27, v28, v29);
      v31 = objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v36 = (void *)v31;
        objc_msgSend_primaryLanguages(v5, v32, v33, v34, v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          objc_msgSend_synthesizerBundleIdentifier(v5, v38, v39, v40, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v42, v43, (uint64_t)CFSTR("com.apple.ax.KonaTTSSupport.KonaSynthesizer"), v44, v45);
          v47 = 4;
          if (!isEqualToString)
            v47 = 0;
          v10->_footprint = v47;

          objc_msgSend_name(v5, v48, v49, v50, v51);
          v52 = objc_claimAutoreleasedReturnValue();
          name = v10->_name;
          v10->_name = (NSString *)v52;

          if (objc_msgSend_isFirstParty(v5, v54, v55, v56, v57))
            objc_msgSend_identifier(v5, v58, v59, v60, v61);
          else
            objc_msgSend_fullBundleIdentifier(v5, v58, v59, v60, v61);
          v62 = objc_claimAutoreleasedReturnValue();
          voiceId = v10->_voiceId;
          v10->_voiceId = (NSString *)v62;

          v10->_isPersonalVoice = objc_msgSend_hasPrefix_(v10->_voiceId, v69, (uint64_t)CFSTR("com.apple.speech.personalvoice"), v70, v71);
          objc_msgSend_primaryLanguages(v5, v72, v73, v74, v75);
          v76 = objc_claimAutoreleasedReturnValue();
          languages = v10->_languages;
          v10->_languages = (NSArray *)v76;

          *(_OWORD *)&v10->_type = xmmword_1A3ABF2A0;
          v10->_gender = objc_msgSend_gender(v5, v78, v79, v80, v81);
          objc_storeStrong((id *)&v10->_synthesisProviderVoice, a3);

          goto LABEL_21;
        }
      }
      else
      {

      }
    }
    AXTTSLogResourceManager();
    v63 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v63, OS_LOG_TYPE_ERROR))
      sub_1A3AB0848(v5, v63, v64, v65, v66);

  }
  v67 = 0;
LABEL_22:

  return v67;
}

- (TTSAXResource)initWithAsset:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  TTSAXResource *v14;

  v5 = a3;
  objc_msgSend_properties(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (TTSAXResource *)objc_msgSend_initWithData_(self, v11, (uint64_t)v10, v12, v13);

  if (v14)
    objc_storeStrong((id *)&v14->_axAsset, a3);

  return v14;
}

- (int64_t)voiceType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = objc_msgSend_type(self, a2, v2, v3, v4);
  v11 = objc_msgSend_subtype(self, v7, v8, v9, v10);
  return TTSVoiceTypeForResourceType(v6, v11);
}

- (NSString)contentPath
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
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
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;

  if (objc_msgSend_type(self, a2, v2, v3, v4) == 3
    || objc_msgSend_type(self, v6, v7, v8, v9) == 10
    || objc_msgSend_type(self, v6, v7, v8, v9) == 7)
  {
    objc_msgSend_voiceAsset(self, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend_primaryLanguage(self, v11, v12, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend_gender(self, v16, v17, v18, v19);
      v25 = objc_msgSend_footprint(self, v21, v22, v23, v24);
      objc_msgSend_name(self, v26, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend_type(self, v31, v32, v33, v34);
      v40 = objc_msgSend_subtype(self, v36, v37, v38, v39);
      v41 = TTSVoiceTypeForResourceType(v35, v40);
      objc_msgSend_installedAssetForLanguage_gender_footprint_voiceName_voiceType_(TTSSiriAssetManager, v42, (uint64_t)v15, v20, v25, v30, v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setVoiceAsset_(self, v44, (uint64_t)v43, v45, v46);

    }
    objc_msgSend_voiceAsset(self, v11, v12, v13, v14);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_voicePath(v47, v48, v49, v50, v51);
    v52 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if ((objc_msgSend_type(self, v6, v7, v8, v9) == 4
     || objc_msgSend_type(self, v55, v56, v57, v58) == 2
     || objc_msgSend_type(self, v55, v56, v57, v58) == 6)
    && (objc_msgSend_isSystemVoice(self, v55, v56, v57, v58) & 1) == 0)
  {
    objc_msgSend_axAsset(self, v55, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v59)
    {
      objc_msgSend_sharedInstance(TTSAXResourceManager, v55, v56, v57, v58);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_refreshAssetForResource_installedOnly_(v60, v61, (uint64_t)self, 1, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAxAsset_(self, v64, (uint64_t)v63, v65, v66);

    }
  }
  objc_msgSend_axAsset(self, v55, v56, v57, v58);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localURL(v67, v68, v69, v70, v71);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_isSystemVoice(self, v72, v73, v74, v75))
  {
    objc_msgSend_bundleWithPath_(MEMORY[0x1E0CB34D0], v76, (uint64_t)CFSTR("/System/Library/PrivateFrameworks/TextToSpeechMauiSupport.framework"), v78, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend_pathForResource_ofType_(v80, v82, (uint64_t)CFSTR("TTSResources"), 0, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURLWithPath_(v81, v85, (uint64_t)v84, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_type(self, v89, v90, v91, v92) == 2 || objc_msgSend_type(self, v93, v94, v95, v96) == 4)
    {
      objc_msgSend_primaryLanguage(self, v93, v94, v95, v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URLByAppendingPathComponent_(v88, v98, (uint64_t)v97, v99, v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(self, v102, v103, v104, v105);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URLByAppendingPathComponent_(v101, v107, (uint64_t)v106, v108, v109);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_type(self, v110, v111, v112, v113) == 2)
      {
        objc_msgSend_path(v47, v114, v115, v116, v117);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingPathComponent_(v118, v119, (uint64_t)CFSTR("Contents/VoiceBundle"), v120, v121);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      }
    }
    else
    {
      v47 = v88;
    }

  }
  if (objc_msgSend_type(self, v76, v77, v78, v79) != 2)
  {
    if (objc_msgSend_type(self, v122, v123, v124, v125) != 6)
    {
      objc_msgSend_path(v47, v126, v127, v128, v129);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingPathComponent_(v80, v157, (uint64_t)CFSTR("Contents"), v158, v159);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    objc_msgSend_name(self, v126, v127, v128, v129);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lowercaseString(v80, v130, v131, v132, v133);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLByAppendingPathComponent_(v47, v134, (uint64_t)v118, v135, v136);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = objc_msgSend_footprint(self, v138, v139, v140, v141);
    TTSStringForSpeechFootprint(v142);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lowercaseString(v143, v144, v145, v146, v147);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLByAppendingPathComponent_(v137, v149, (uint64_t)v148, v150, v151);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_path(v152, v153, v154, v155, v156);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_26:
LABEL_28:

    goto LABEL_8;
  }
  objc_msgSend_path(v47, v122, v123, v124, v125);
  v52 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v53 = (void *)v52;
LABEL_8:

  return (NSString *)v53;
}

- (BOOL)isValid
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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

  v6 = objc_msgSend_type(self, a2, v2, v3, v4);
  v11 = 1;
  if (v6 <= 0xA && ((1 << v6) & 0x4DC) != 0)
  {
    objc_msgSend_contentPath(self, v7, v8, v9, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v12, v13, v14, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_contentPath(self, v18, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend_fileExistsAtPath_(v17, v23, (uint64_t)v22, v24, v25);

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (BOOL)shouldFilterResourceFromUI
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (objc_msgSend_type(self, a2, v2, v3, v4) == 10 && objc_msgSend_footprint(self, v6, v7, v8, v9) == 3)
    return 1;
  else
    return objc_msgSend_memoryPeakExceedsActiveJetsamLimit(self, v6, v7, v8, v9);
}

- (AVSpeechSynthesisProviderVoice)synthesisProviderVoice
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  AVSpeechSynthesisProviderVoice *synthesisProviderVoice;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
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
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  _DWORD v73[2];
  uint64_t v74;
  int v75;
  void *v76;
  _QWORD v77[2];

  v77[1] = *MEMORY[0x1E0C80C00];
  synthesisProviderVoice = self->_synthesisProviderVoice;
  if (synthesisProviderVoice)
    return synthesisProviderVoice;
  objc_msgSend_synthesizerBundleIdentifier(self, a2, v2, v3, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend_componentSubType(self, v8, v9, v10, v11);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      v15 = TTSIsBaseSystem();

      if ((v15 & 1) == 0)
      {
        v16 = objc_alloc(MEMORY[0x1E0C89B78]);
        objc_msgSend_name(self, v17, v18, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_voiceId(self, v22, v23, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_primaryLanguage(self, v27, v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v77[0] = v31;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v32, (uint64_t)v77, 1, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_primaryLanguage(self, v35, v36, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v39;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v40, (uint64_t)&v76, 1, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)objc_msgSend_initWithName_identifier_primaryLanguages_supportedLanguages_(v16, v43, (uint64_t)v21, (uint64_t)v26, (uint64_t)v34, v42);

        objc_msgSend_synthesizerBundleIdentifier(self, v45, v46, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setSynthesizerBundleIdentifier_(v44, v50, (uint64_t)v49, v51, v52);

        objc_msgSend_componentSubType(self, v53, v54, v55, v56);
        v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        LODWORD(v49) = bswap32(*(_DWORD *)objc_msgSend_cStringUsingEncoding_(v57, v58, 1, v59, v60));

        v73[0] = 1635087216;
        v73[1] = (_DWORD)v49;
        v74 = 1634758764;
        v75 = 0;
        objc_msgSend_setAuComponentDesc_(v44, v61, (uint64_t)v73, v62, v63);
        objc_msgSend_setManufacturerName_(v44, v64, (uint64_t)CFSTR("Apple"), v65, v66);
        objc_msgSend_setIsFirstParty_(v44, v67, 1, v68, v69);
        objc_msgSend_setHasPerVoiceSettings_(v44, v70, 1, v71, v72);
        return (AVSpeechSynthesisProviderVoice *)v44;
      }
    }
    else
    {

    }
    v12 = 0;
  }
  return (AVSpeechSynthesisProviderVoice *)v12;
}

+ (id)siriLocalizedNameForName:(id)a3 identifier:(id)a4 includeSiri:(BOOL)a5
{
  void *v5;
  id v7;
  id v8;
  int v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  void (*v59)(const __CFString *);
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v71;
  _BOOL4 v72;
  id v73;
  id v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  void *v78;
  _BYTE buf[24];
  void *v80;
  uint64_t *v81;
  uint64_t v82;

  v72 = a5;
  v82 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v73 = 0;
  v74 = 0;
  v9 = TTSGetComponentsInNamedSiriVoiceIdentifier(v8, &v74, &v73, 0);
  v10 = v74;
  v15 = v73;
  if (v9)
  {
    objc_msgSend_sharedInstance(MEMORY[0x1E0CFE8F8], v11, v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_outputVoiceDescriptorForOutputLanguageCode_voiceName_(v16, v17, (uint64_t)v15, (uint64_t)v10, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v19;
    if (v19)
    {
      objc_msgSend_localizedDisplay(v19, v20, v21, v22, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend_sharedInstance(MEMORY[0x1E0CFE8F8], v20, v21, v22, v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lowercaseString(v10, v27, v28, v29, v30);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_outputVoiceDescriptorForOutputLanguageCode_voiceName_(v26, v31, (uint64_t)v15, (uint64_t)v5, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedDisplay(v33, v34, v35, v36, v37);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    AXLogSpeechAssetDownload();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      v80 = v10;
      _os_log_impl(&dword_1A3940000, v38, OS_LOG_TYPE_DEFAULT, "Name: %@ for language: %@ and asset: %@", buf, 0x20u);
    }

    if (v25)
      goto LABEL_14;
    objc_msgSend_sharedInstance(MEMORY[0x1E0CFE8F8], v39, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_outputVoiceDescriptorForOutputLanguageCode_voiceName_(v43, v44, (uint64_t)v15, (uint64_t)v7, v45);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (!v50)
    {
      objc_msgSend_sharedInstance(MEMORY[0x1E0CFE8F8], v46, v47, v48, v49);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lowercaseString(v7, v52, v53, v54, v55);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_outputVoiceDescriptorForOutputLanguageCode_voiceName_(v71, v56, (uint64_t)v15, (uint64_t)v5, v57);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_localizedDisplay(v51, v46, v47, v48, v49);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v50)
    {

    }
    if (v25)
    {
LABEL_14:
      if (v72)
      {
        v58 = (void *)MEMORY[0x1E0CB3940];
        v75 = 0;
        v76 = &v75;
        v77 = 0x2020000000;
        v59 = (void (*)(const __CFString *))off_1EE6D5648;
        v78 = off_1EE6D5648;
        if (!off_1EE6D5648)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = sub_1A3966950;
          v80 = &unk_1E4A9FC10;
          v81 = &v75;
          sub_1A3966950((uint64_t)buf, v39, v40, v41, v42);
          v59 = (void (*)(const __CFString *))v76[3];
        }
        _Block_object_dispose(&v75, 8);
        if (!v59)
          sub_1A3AB0998(v60, v61, v62, v63, v64);
        v59(CFSTR("siri.and.type"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v58, v66, (uint64_t)v65, v67, v68, v25);
        v69 = objc_claimAutoreleasedReturnValue();

        v25 = (void *)v69;
      }
    }
    else
    {
      objc_msgSend_localizedCapitalizedString(v7, v39, v40, v41, v42);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (NSString)localizedName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  objc_msgSend_name(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_type(self, v7, v8, v9, v10) == 3
    && (objc_msgSend_subtype(self, v11, v12, v13, v14) != 7
     || objc_msgSend_subtype(self, v11, v15, v16, v14) == 7 && objc_msgSend_footprint(self, v11, v17, v18, v14) != 3))
  {
    objc_msgSend_voiceId(self, v11, v15, v16, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_siriLocalizedNameForName_identifier_includeSiri_(TTSAXResource, v20, (uint64_t)v6, (uint64_t)v19, 1);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = (void *)v21;
    else
      v23 = v6;
    v24 = v23;

    v6 = v24;
  }
  objc_msgSend_localizedName_forLanguage_(TTSAXResource, v11, (uint64_t)v6, 0, v14);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v25, v26, v27, v28, v29))
  {
    v30 = v25;

    v6 = v30;
  }

  return (NSString *)v6;
}

+ (id)localizedStringForKey:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_bundleForClass_(v3, v6, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  AXNSLocalizedStringForLocale();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)localizedNameWithFootprint:(int64_t)a3 name:(id)a4
{
  id v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
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
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;

  v5 = a4;
  TTSStringForSpeechFootprint(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  if ((unint64_t)(a3 - 4) <= 0xFFFFFFFFFFFFFFFDLL && v6)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v6, v7, (uint64_t)CFSTR(" "), (uint64_t)CFSTR("_"), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_uppercaseString(v11, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v10, v17, (uint64_t)CFSTR("%@_VOICE_WITH_NAME"), v18, v19, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_localizedStringForKey_(TTSAXResource, v22, (uint64_t)v20, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringWithFormat_(v21, v26, (uint64_t)v25, v27, v28, v5);
    v29 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = v5;
  }

  return v29;
}

- (NSString)localizedNameWithFootprint
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;

  objc_msgSend_localizedName(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_speechVoice(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_synthesisProviderVoice(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_synthesizerBundleIdentifier(v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v21, v22, (uint64_t)CFSTR("com.apple.ax.KonaTTSSupport.KonaSynthesizer"), v23, v24) & 1) != 0
    || objc_msgSend_type(self, v25, v26, v27, v28) == 2)
  {

  }
  else
  {
    v36 = objc_msgSend_type(self, v29, v30, v31, v32);

    if (v36 != 9)
    {
      v41 = objc_msgSend_footprint(self, v37, v38, v39, v40);
      objc_msgSend_localizedNameWithFootprint_name_(TTSAXResource, v42, v41, (uint64_t)v6, v43);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
  }
  v33 = v6;
LABEL_5:
  v34 = v33;

  return (NSString *)v34;
}

- (BOOL)isSystemVoice
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  char isEqualToString;

  if (objc_msgSend_footprint(self, a2, v2, v3, v4) == 2
    || objc_msgSend_type(self, v6, v7, v8, v9) == 2
    && !objc_msgSend_canBeDownloaded(self, v10, v11, v12, v13))
  {
    return 1;
  }
  objc_msgSend_synthesizerBundleIdentifier(self, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v14, v15, (uint64_t)CFSTR("com.apple.ax.KonaTTSSupport.KonaSynthesizer"), v16, v17);

  return isEqualToString;
}

- (BOOL)isDefault
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  objc_msgSend_primaryLanguage(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _BuiltInVoiceNameForLanguage((uint64_t)v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v11, v17, (uint64_t)v16, v18, v19))
  {
    v24 = objc_msgSend_type(self, v20, v21, v22, v23);

    if (v24 == 4
      && (objc_msgSend_footprint(self, v25, v26, v27, v28) == 2
       || objc_msgSend_footprint(self, v29, v30, v31, v32) == 3
       && (objc_msgSend_isInstalled(self, v33, v34, v35, v36) & 1) != 0))
    {
      return 1;
    }
  }
  else
  {

  }
  return 0;
}

- (NSString)identifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v6 = objc_msgSend_footprint(self, a2, v2, v3, v4);
  objc_msgSend_voiceId(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11;
  if (v6 == 2)
  {
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v11, v12, (uint64_t)CFSTR(".super-compact."), (uint64_t)CFSTR(".compact."), v13);
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v15;
  }
  return (NSString *)v14;
}

- (NSString)serviceIdentifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString *v22;
  void *serviceIdentifier;
  void *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSString *v33;
  NSString *v34;

  if (!self->_serviceIdentifier)
  {
    objc_msgSend_service(self, a2, v2, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend_service(self, v7, v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        objc_msgSend_service(self, v13, v14, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_serviceIdentifier(v17, v18, v19, v20, v21);
        v22 = (NSString *)objc_claimAutoreleasedReturnValue();
        serviceIdentifier = self->_serviceIdentifier;
        self->_serviceIdentifier = v22;
      }
      else
      {
        v24 = (void *)MEMORY[0x1E0CB34D0];
        objc_msgSend_service(self, v13, v14, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_opt_class();
        objc_msgSend_bundleForClass_(v24, v26, v25, v27, v28);
        serviceIdentifier = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_bundleIdentifier(serviceIdentifier, v29, v30, v31, v32);
        v33 = (NSString *)objc_claimAutoreleasedReturnValue();
        v34 = self->_serviceIdentifier;
        self->_serviceIdentifier = v33;

      }
    }
  }
  return self->_serviceIdentifier;
}

+ (id)localizedName:(id)a3 forLanguage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB34D0];
  v8 = objc_opt_class();
  objc_msgSend_bundleForClass_(v7, v9, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (TTSSpeechUnitTestingMode())
  {
    objc_msgSend_bundleWithPath_(MEMORY[0x1E0CB34D0], v13, (uint64_t)CFSTR("/System/Library/PrivateFrameworks/TextToSpeech.framework"), v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v16;
  }
  AXNSLocalizedStringForLocale();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)localizedNameForLanguage:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend_name(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedName_forLanguage_(v5, v11, (uint64_t)v10, (uint64_t)v4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
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
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int isInstalled;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_name(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_voiceId(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_type(self, v13, v14, v15, v16);
  v22 = objc_msgSend_subtype(self, v18, v19, v20, v21);
  v27 = objc_msgSend_footprint(self, v23, v24, v25, v26);
  objc_msgSend_languages(self, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsJoinedByString_(v32, v33, (uint64_t)CFSTR(", "), v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  isInstalled = objc_msgSend_isInstalled(self, v37, v38, v39, v40);
  objc_msgSend_stringWithFormat_(v6, v42, (uint64_t)CFSTR("TTSAXResource<%p> Name:%@ ID:%@ Type:[%ld:%ld] Foot:%ld Langs:[%@] Installed:%ld"), v43, v44, self, v7, v12, v17, v22, v27, v36, isInstalled);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  return v45;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t isNoveltyVoice;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t isPersonalVoice;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t isInstalled;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t canBeDownloaded;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  id v123;

  v123 = a3;
  objc_msgSend_name(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v9, (uint64_t)v8, (uint64_t)CFSTR("Name"), v10);

  objc_msgSend_voiceId(self, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v16, (uint64_t)v15, (uint64_t)CFSTR("VoiceId"), v17);

  objc_msgSend_languages(self, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v23, (uint64_t)v22, (uint64_t)CFSTR("Languages"), v24);

  v29 = objc_msgSend_type(self, v25, v26, v27, v28);
  objc_msgSend_encodeInteger_forKey_(v123, v30, v29, (uint64_t)CFSTR("Type"), v31);
  v36 = objc_msgSend_subtype(self, v32, v33, v34, v35);
  objc_msgSend_encodeInteger_forKey_(v123, v37, v36, (uint64_t)CFSTR("Subtype"), v38);
  v43 = objc_msgSend_footprint(self, v39, v40, v41, v42);
  objc_msgSend_encodeInteger_forKey_(v123, v44, v43, (uint64_t)CFSTR("Footprint"), v45);
  v50 = objc_msgSend_gender(self, v46, v47, v48, v49);
  objc_msgSend_encodeInteger_forKey_(v123, v51, v50, (uint64_t)CFSTR("Gender"), v52);
  isNoveltyVoice = objc_msgSend_isNoveltyVoice(self, v53, v54, v55, v56);
  objc_msgSend_encodeBool_forKey_(v123, v58, isNoveltyVoice, (uint64_t)CFSTR("NoveltyVoice"), v59);
  isPersonalVoice = objc_msgSend_isPersonalVoice(self, v60, v61, v62, v63);
  objc_msgSend_encodeBool_forKey_(v123, v65, isPersonalVoice, (uint64_t)CFSTR("PersonalVoice"), v66);
  isInstalled = objc_msgSend_isInstalled(self, v67, v68, v69, v70);
  objc_msgSend_encodeBool_forKey_(v123, v72, isInstalled, (uint64_t)CFSTR("IsInstalled"), v73);
  canBeDownloaded = objc_msgSend_canBeDownloaded(self, v74, v75, v76, v77);
  objc_msgSend_encodeBool_forKey_(v123, v79, canBeDownloaded, (uint64_t)CFSTR("CanBeDownloaded"), v80);
  objc_msgSend_assetId(self, v81, v82, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v86, (uint64_t)v85, (uint64_t)CFSTR("AssetId"), v87);

  v92 = objc_msgSend_memoryPeak(self, v88, v89, v90, v91);
  objc_msgSend_encodeInteger_forKey_(v123, v93, v92, (uint64_t)CFSTR("MemoryPeak"), v94);
  v95 = (void *)MEMORY[0x1E0CB37E8];
  v100 = objc_msgSend_assetSize(self, v96, v97, v98, v99);
  objc_msgSend_numberWithUnsignedInteger_(v95, v101, v100, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v105, (uint64_t)v104, (uint64_t)CFSTR("AssetSize"), v106);

  objc_msgSend_synthesizerBundleIdentifier(self, v107, v108, v109, v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v112, (uint64_t)v111, (uint64_t)CFSTR("synthesizerBundleIdentifier"), v113);

  objc_msgSend_componentSubType(self, v114, v115, v116, v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v123, v119, (uint64_t)v118, (uint64_t)CFSTR("componentSubType"), v120);

  objc_msgSend_encodeObject_forKey_(v123, v121, (uint64_t)self->_synthesisProviderVoice, (uint64_t)CFSTR("_synthesisProviderVoice"), v122);
}

- (void)setAxAsset:(id)a3
{
  objc_storeStrong((id *)&self->_axAsset, a3);
}

- (void)setVoiceAsset:(id)a3
{
  objc_storeStrong((id *)&self->_voiceAsset, a3);
}

- (void)setAssetId:(id)a3
{
  objc_storeStrong((id *)&self->_assetId, a3);
}

- (void)setFootprint:(int64_t)a3
{
  self->_footprint = a3;
}

- (void)setCanBeDownloaded:(BOOL)a3
{
  self->_canBeDownloaded = a3;
}

- (void)setSynthesisProviderVoice:(id)a3
{
  objc_storeStrong((id *)&self->_synthesisProviderVoice, a3);
}

- (void)setServiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_serviceIdentifier, a3);
}

- (TTSSpeechService)service
{
  return (TTSSpeechService *)objc_loadWeakRetained((id *)&self->_service);
}

- (void)setService:(id)a3
{
  objc_storeWeak((id *)&self->_service, a3);
}

- (void)setSynthesizerBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_synthesizerBundleIdentifier, a3);
}

- (void)setComponentSubType:(id)a3
{
  objc_storeStrong((id *)&self->_componentSubType, a3);
}

- (void)setAssetSize:(unint64_t)a3
{
  self->_assetSize = a3;
}

- (void)setIsInstalled:(BOOL)a3
{
  self->_isInstalled = a3;
}

- (void)setMemoryPeak:(int64_t)a3
{
  self->_memoryPeak = a3;
}

@end
