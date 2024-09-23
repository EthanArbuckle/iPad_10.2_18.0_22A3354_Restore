@implementation PFMediaCapabilities

- (id)platformInformation
{
  return -[NSDictionary objectForKeyedSubscript:](self->_capabilitiesInformation, "objectForKeyedSubscript:", CFSTR("PFMediaCapabilitiesPlatformInfoKey"));
}

- (BOOL)sortSourceEnumerationAscending
{
  void *v2;
  void *v3;
  char v4;

  -[NSDictionary objectForKeyedSubscript:](self->_capabilitiesInformation, "objectForKeyedSubscript:", CFSTR("SortSourceEnumerationAscending"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (PFMediaCapabilities)initWithOpaqueRepresentation:(id)a3
{
  id v4;
  PFMediaCapabilities *v5;
  uint64_t v6;
  id v7;
  NSDictionary *capabilitiesInformation;
  PFMediaCapabilities *v9;
  id v11;
  objc_super v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PFMediaCapabilities;
  v5 = -[PFMediaCapabilities init](&v12, sel_init);
  if (!v5)
    goto LABEL_4;
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, &v11);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v6)
  {
    capabilitiesInformation = v5->_capabilitiesInformation;
    v5->_capabilitiesInformation = (NSDictionary *)v6;

LABEL_4:
    v9 = v5;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v14 = 0;
    v15 = 2112;
    v16 = v7;
    _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to deserialize capabilities information %@: %@", buf, 0x16u);
  }

  v9 = 0;
LABEL_8:

  return v9;
}

- (PFMediaCapabilities)initWithPlatformInformation:(id)a3
{
  id v4;
  PFMediaCapabilities *v5;
  uint64_t v6;
  NSDictionary *capabilitiesInformation;
  objc_super v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PFMediaCapabilities;
  v5 = -[PFMediaCapabilities init](&v9, sel_init);
  if (v5)
  {
    v10 = CFSTR("PFMediaCapabilitiesPlatformInfoKey");
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    capabilitiesInformation = v5->_capabilitiesInformation;
    v5->_capabilitiesInformation = (NSDictionary *)v6;

  }
  return v5;
}

- (int64_t)supportForContainerTypeIdentifier:(id)a3
{
  NSDictionary *capabilitiesInformation;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  capabilitiesInformation = self->_capabilitiesInformation;
  v6 = a3;
  -[NSDictionary objectForKeyedSubscript:](capabilitiesInformation, "objectForKeyedSubscript:", CFSTR("ContainerFormats"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = 1;
  else
    v9 = -1;
  return -[PFMediaCapabilities supportValueByApplyingUserDefaultsPeerOverrideToValue:selector:](self, "supportValueByApplyingUserDefaultsPeerOverrideToValue:selector:", v9, a2);
}

- (int64_t)supportForLivePhotoVersion:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;

  v5 = objc_msgSend(a3, "integerValue");
  -[NSDictionary objectForKeyedSubscript:](self->_capabilitiesInformation, "objectForKeyedSubscript:", CFSTR("Vendor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("LivePhotoFormatVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v8, "integerValue");
    v10 = -1;
    if (v9 >= v5)
      v10 = 1;
    if (v9)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = -[PFMediaCapabilities supportValueByApplyingUserDefaultsPeerOverrideToValue:selector:](self, "supportValueByApplyingUserDefaultsPeerOverrideToValue:selector:", v11, a2);

  return v12;
}

- (int64_t)supportForAssetBundleVersion:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;

  v5 = objc_msgSend(a3, "integerValue");
  -[NSDictionary objectForKeyedSubscript:](self->_capabilitiesInformation, "objectForKeyedSubscript:", CFSTR("Vendor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetBundleFormatVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v8, "integerValue");
    v10 = -1;
    if (v9 >= v5)
      v10 = 1;
    if (v9)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = -[PFMediaCapabilities supportValueByApplyingUserDefaultsPeerAssetBundleSupportOverrideToValue:selector:](self, "supportValueByApplyingUserDefaultsPeerAssetBundleSupportOverrideToValue:selector:", v11, a2);

  return v12;
}

- (int64_t)supportForAdjustmentBaseResources
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_capabilitiesInformation, "objectForKeyedSubscript:", CFSTR("SupportsAdjustmentBaseResources"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v2, "BOOLValue") & 1) != 0)
    v3 = 1;
  else
    v3 = -1;

  return v3;
}

- (int64_t)supportForCodec:(unsigned int)a3
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  -[NSDictionary objectForKeyedSubscript:](self->_capabilitiesInformation, "objectForKeyedSubscript:", CFSTR("Codecs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%c%c%c"), HIBYTE(a3), BYTE2(a3), BYTE1(a3), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = 1;
  else
    v9 = -1;
  return -[PFMediaCapabilities supportValueByApplyingUserDefaultsPeerOverrideToValue:selector:](self, "supportValueByApplyingUserDefaultsPeerOverrideToValue:selector:", v9, a2);
}

- (int64_t)decodingSupportForFormatDescription:(opaqueCMFormatDescription *)a3
{
  uint64_t MediaSubType;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
  if (self->_capabilitiesInformation
    && +[PFMediaCapabilities videoCodecIsEligibleForBackwardsCompatibilityTranscoding:](PFMediaCapabilities, "videoCodecIsEligibleForBackwardsCompatibilityTranscoding:", MediaSubType))
  {
    -[NSDictionary objectForKeyedSubscript:](self->_capabilitiesInformation, "objectForKeyedSubscript:", CFSTR("Version"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    if (v7 < 3)
    {
      if ((_DWORD)MediaSubType != 1752589105)
      {
LABEL_21:
        v14 = 1;
        return -[PFMediaCapabilities supportValueByApplyingUserDefaultsPeerOverrideToValue:selector:](self, "supportValueByApplyingUserDefaultsPeerOverrideToValue:selector:", v14, a2);
      }
      -[NSDictionary objectForKeyedSubscript:](self->_capabilitiesInformation, "objectForKeyedSubscript:", CFSTR("Codecs"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%c%c%c"), 104, 118, 99, 49);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Profiles"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = VTGetHEVCCapabilitesForFormatDescription();
      if (v18)
      {
        v19 = v18;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v22) = v19;
          v12 = MEMORY[0x1E0C81028];
          v13 = "VTGetHEVCCapabilitesForFormatDescription returned non-success status %d, defaulting to compatible";
          goto LABEL_15;
        }
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      -[NSDictionary objectForKeyedSubscript:](self->_capabilitiesInformation, "objectForKeyedSubscript:", CFSTR("Codecs"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CodecSupport"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v22 = CFSTR("CodecSupport");
          v23 = 1024;
          v24 = 3;
          _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unexpected nil value for %@ key in capabilities dictionary for version >= %d", buf, 0x12u);
        }
        v9 = 0;
        goto LABEL_20;
      }
      v10 = VTGetDecoderCapabilitesForFormatDescription();
      if (v10)
      {
        v11 = v10;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v22) = v11;
          v12 = MEMORY[0x1E0C81028];
          v13 = "VTGetDecoderCapabilitesForFormatDescription returned non-success status %d, defaulting to compatible";
LABEL_15:
          _os_log_error_impl(&dword_1A16EE000, v12, OS_LOG_TYPE_ERROR, v13, buf, 8u);
          goto LABEL_20;
        }
        goto LABEL_20;
      }
    }

    v14 = -1;
  }
  else if ((_DWORD)MediaSubType == 1635148593)
  {
    v14 = 2;
  }
  else
  {
    v14 = 1;
  }
  return -[PFMediaCapabilities supportValueByApplyingUserDefaultsPeerOverrideToValue:selector:](self, "supportValueByApplyingUserDefaultsPeerOverrideToValue:selector:", v14, a2);
}

- (int64_t)decodingSupportForAVAsset:(id)a3
{
  id v5;
  PFMetadata *v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;

  v5 = a3;
  v6 = -[PFMetadata initWithAVAsset:timeZoneLookup:]([PFMetadata alloc], "initWithAVAsset:timeZoneLookup:", v5, 0);

  v7 = -[PFMetadata firstVideoTrackCodec](v6, "firstVideoTrackCodec");
  if (objc_msgSend((id)objc_opt_class(), "videoCodecIsEligibleForBackwardsCompatibilityTranscoding:", v7))
  {
    v8 = -[PFMediaCapabilities decodingSupportForFormatDescription:](self, "decodingSupportForFormatDescription:", -[PFMetadata videoTrackFormatDescription](v6, "videoTrackFormatDescription"));
  }
  else if ((_DWORD)v7 == 1635148593)
  {
    v8 = 2;
  }
  else
  {
    v8 = 1;
  }
  v9 = -[PFMediaCapabilities supportValueByApplyingUserDefaultsPeerOverrideToValue:selector:](self, "supportValueByApplyingUserDefaultsPeerOverrideToValue:selector:", v8, a2);

  return v9;
}

- (BOOL)supportsTranscodeChoice
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _BYTE v8[12];
  __int16 v9;
  void *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKeyedSubscript:](self->_capabilitiesInformation, "objectForKeyedSubscript:", CFSTR("TranscodeChoice"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("PFMediaCapabilitiesPeerTranscodeChoiceOverride"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("NO");
      *(_DWORD *)v8 = 138412802;
      if (v3)
        v6 = CFSTR("YES");
      *(_QWORD *)&v8[4] = v6;
      v9 = 2112;
      v10 = v5;
      v11 = 2112;
      v12 = CFSTR("PFMediaCapabilitiesPeerTranscodeChoiceOverride");
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Overriding peer capabilities result of supportsTranscodeChoice from %@ to %@ because %@ user default is set", v8, 0x20u);
    }
    LOBYTE(v3) = objc_msgSend(v5, "BOOLValue", *(_QWORD *)v8);
  }

  return v3;
}

- (BOOL)supportsHDR
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NSDictionary objectForKeyedSubscript:](self->_capabilitiesInformation, "objectForKeyedSubscript:", CFSTR("Codecs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%c%c%c"), 104, 118, 99, 49);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Profiles"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VTIsHDRAllowedOnDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v6, "BOOLValue");
  return (char)v2;
}

- (id)opaqueRepresentation
{
  NSDictionary *capabilitiesInformation;
  void *v4;
  id v5;
  NSDictionary *v7;
  id v8;
  uint8_t buf[4];
  NSDictionary *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  capabilitiesInformation = self->_capabilitiesInformation;
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", capabilitiesInformation, 0, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = self->_capabilitiesInformation;
    *(_DWORD *)buf = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to serialize capabilities information %@: %@", buf, 0x16u);
  }

  return v4;
}

- (int64_t)supportValueByApplyingUserDefaultsPeerOverrideToValue:(int64_t)a3 selector:(SEL)a4
{
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = -[PFMediaCapabilities userDefaultsPeerOverrideValue](self, "userDefaultsPeerOverrideValue");
  if (!v6)
    return a3;
  v7 = v6;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "stringForSupport:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "stringForSupport:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138413058;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = CFSTR("PFMediaCapabilitiesPeerSupportOverride");
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Overriding peer capabilities result of %@ from %@ to %@ because %@ user default is set", (uint8_t *)&v12, 0x2Au);

  }
  return v7;
}

- (int64_t)userDefaultsPeerOverrideValue
{
  void *v2;
  void *v3;
  int64_t v4;
  NSObject *v5;
  const char *v6;
  int v8;
  const __CFString *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PFMediaCapabilitiesPeerSupportOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_7;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = CFSTR("PFMediaCapabilitiesPeerSupportOverride");
      v10 = 2112;
      v11 = v3;
      v5 = MEMORY[0x1E0C81028];
      v6 = "Ignoring value for user default %@ that is not an integer: %@";
      goto LABEL_10;
    }
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  v4 = objc_msgSend(v3, "integerValue");
  if ((unint64_t)(v4 - 3) <= 0xFFFFFFFFFFFFFFFBLL)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = CFSTR("PFMediaCapabilitiesPeerSupportOverride");
      v10 = 2112;
      v11 = v3;
      v5 = MEMORY[0x1E0C81028];
      v6 = "Ignoring value for user default %@ that is out of range: %@";
LABEL_10:
      _os_log_error_impl(&dword_1A16EE000, v5, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v8, 0x16u);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
LABEL_8:

  return v4;
}

- (int64_t)supportValueByApplyingUserDefaultsPeerAssetBundleSupportOverrideToValue:(int64_t)a3 selector:(SEL)a4
{
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = -[PFMediaCapabilities userDefaultsPeerAssetBundleSupportOverrideValue](self, "userDefaultsPeerAssetBundleSupportOverrideValue");
  if (!v6)
    return a3;
  v7 = v6;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "stringForSupport:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "stringForSupport:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138413058;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = CFSTR("PFMediaCapabilitiesPeerAssetBundleSupportOverride");
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Overriding peer asset bundle capabilities result of %@ from %@ to %@ because %@ user default is set", (uint8_t *)&v12, 0x2Au);

  }
  return v7;
}

- (int64_t)userDefaultsPeerAssetBundleSupportOverrideValue
{
  void *v2;
  void *v3;
  int64_t v4;
  NSObject *v5;
  const char *v6;
  int v8;
  const __CFString *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PFMediaCapabilitiesPeerAssetBundleSupportOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_7;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = CFSTR("PFMediaCapabilitiesPeerAssetBundleSupportOverride");
      v10 = 2112;
      v11 = v3;
      v5 = MEMORY[0x1E0C81028];
      v6 = "Ignoring value for user default %@ that is not an integer: %@";
      goto LABEL_10;
    }
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  v4 = objc_msgSend(v3, "integerValue");
  if ((unint64_t)(v4 - 3) <= 0xFFFFFFFFFFFFFFFBLL)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = CFSTR("PFMediaCapabilitiesPeerAssetBundleSupportOverride");
      v10 = 2112;
      v11 = v3;
      v5 = MEMORY[0x1E0C81028];
      v6 = "Ignoring value for user default %@ that is out of range: %@";
LABEL_10:
      _os_log_error_impl(&dword_1A16EE000, v5, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v8, 0x16u);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
LABEL_8:

  return v4;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%p: %@ capabilities info: %@>"), self, objc_opt_class(), self->_capabilitiesInformation);
  return v3;
}

- (NSDictionary)outOfBandHints
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOutOfBandHints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDictionary)capabilitiesInformation
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCapabilitiesInformation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilitiesInformation, 0);
  objc_storeStrong((id *)&self->_outOfBandHints, 0);
}

+ (id)capabilitiesForCurrentDevice
{
  return (id)objc_msgSend(a1, "capabilitiesForCurrentDeviceWithOptions:", MEMORY[0x1E0C9AA70]);
}

+ (id)capabilitiesForCurrentDeviceWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(a1, "capabilitiesInformationForCurrentDeviceWithOptions:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setCapabilitiesInformation:", v6);
  return v5;
}

+ (id)legacyCapabilities
{
  return (id)objc_opt_new();
}

+ (id)capabilitiesInformationForCurrentDeviceWithOptions:(id)a3
{
  id v3;
  PFMediaCapabilitiesQuery *v4;
  void *v5;

  v3 = a3;
  v4 = -[PFMediaCapabilitiesQuery initWithOptions:]([PFMediaCapabilitiesQuery alloc], "initWithOptions:", v3);

  -[PFMediaCapabilitiesQuery dictionaryRepresentation](v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)stringForSupport:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 3)
    return CFSTR("PFMediaCapabilitiesSupportUnknown");
  else
    return off_1E45A21D0[a3 + 1];
}

+ (unsigned)currentDeviceHEVCCapabilities
{
  if (currentDeviceHEVCCapabilities_onceToken != -1)
    dispatch_once(&currentDeviceHEVCCapabilities_onceToken, &__block_literal_global_2116);
  if (currentDeviceHEVCCapabilities_sCapabilities)
    return 15;
  else
    return 0;
}

+ (BOOL)videoCodecIsEligibleForBackwardsCompatibilityTranscoding:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(a1, "videoCodecTypesEligibleForBackwardsCompatibilityTranscoding");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

+ (BOOL)videoCodecIsProResEligibleForBackwardsCompatibilityTranscoding:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(a1, "proResVideoCodecTypesEligibleForBackwardsCompatibilityTranscoding");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

+ (id)videoCodecTypesEligibleForBackwardsCompatibilityTranscoding
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__PFMediaCapabilities_videoCodecTypesEligibleForBackwardsCompatibilityTranscoding__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (videoCodecTypesEligibleForBackwardsCompatibilityTranscoding_onceToken != -1)
    dispatch_once(&videoCodecTypesEligibleForBackwardsCompatibilityTranscoding_onceToken, block);
  return (id)videoCodecTypesEligibleForBackwardsCompatibilityTranscoding_codecTypeNumbers;
}

+ (id)proResVideoCodecTypesEligibleForBackwardsCompatibilityTranscoding
{
  return &unk_1E45CB270;
}

+ (BOOL)currentDeviceIsEligibleForHDRPlayback
{
  return objc_msgSend(MEMORY[0x1E0C8B2E8], "eligibleForHDRPlayback");
}

void __82__PFMediaCapabilities_videoCodecTypesEligibleForBackwardsCompatibilityTranscoding__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E45CB258);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)videoCodecTypesEligibleForBackwardsCompatibilityTranscoding_codecTypeNumbers;
  videoCodecTypesEligibleForBackwardsCompatibilityTranscoding_codecTypeNumbers = v2;

  v4 = (void *)videoCodecTypesEligibleForBackwardsCompatibilityTranscoding_codecTypeNumbers;
  objc_msgSend(*(id *)(a1 + 32), "proResVideoCodecTypesEligibleForBackwardsCompatibilityTranscoding");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

}

void __52__PFMediaCapabilities_currentDeviceHEVCCapabilities__block_invoke()
{
  __CFDictionary *Mutable;
  int VideoEncoderInstance;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CEDD38], (const void *)*MEMORY[0x1E0C9AE50]);
  VideoEncoderInstance = VTSelectAndCreateVideoEncoderInstance();
  CFRelease(Mutable);
  if (!VideoEncoderInstance)
    currentDeviceHEVCCapabilities_sCapabilities = 1;
}

- (void)setSupportForAdjustmentBaseResources:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *capabilitiesInformation;
  id v9;

  v3 = a3;
  v5 = -[NSDictionary mutableCopy](self->_capabilitiesInformation, "mutableCopy");
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (id)v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("SupportsAdjustmentBaseResources"));

  v7 = (NSDictionary *)objc_msgSend(v9, "copy");
  capabilitiesInformation = self->_capabilitiesInformation;
  self->_capabilitiesInformation = v7;

}

- (void)setSupportsTranscodeChoice:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *capabilitiesInformation;
  id v9;

  v3 = a3;
  v5 = -[NSDictionary mutableCopy](self->_capabilitiesInformation, "mutableCopy");
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (id)v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("TranscodeChoice"));

  v7 = (NSDictionary *)objc_msgSend(v9, "copy");
  capabilitiesInformation = self->_capabilitiesInformation;
  self->_capabilitiesInformation = v7;

}

+ (int64_t)newFormatsConfiguration
{
  int64_t result;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppIntegerValue(CFSTR("CAMUserPreferenceCaptureEncodingBehavior"), CFSTR("com.apple.camera"), &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
    return 0;
  return result;
}

+ (BOOL)setNewFormatsConfiguration:(int64_t)a3 fromSource:(int64_t)a4
{
  CFIndex AppIntegerValue;
  int64_t v8;
  BOOL v9;
  CFIndex v10;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("CAMUserPreferenceCaptureEncodingBehaviorSource"), CFSTR("com.apple.camera"), 0);
  v8 = AppIntegerValue;
  if (a4 == 2 || AppIntegerValue < a4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v14 = v8;
      v15 = 2048;
      v16 = a4;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "overwriting encoding behavior from source %ld to source %ld", buf, 0x16u);
    }
    CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceCaptureEncodingBehaviorSource"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4), CFSTR("com.apple.camera"));
  }
  if (a4 != 2 && v8 > a4)
    return 0;
  keyExistsAndHasValidFormat = 0;
  v10 = CFPreferencesGetAppIntegerValue(CFSTR("CAMUserPreferenceCaptureEncodingBehavior"), CFSTR("com.apple.camera"), &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
    CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceCaptureEncodingBehavior"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), CFSTR("com.apple.camera"));
  v9 = v10 != a3;
  if (v10 != a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v14 = v10;
      v15 = 2048;
      v16 = a3;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "changing encoding behavior from %ld to %ld", buf, 0x16u);
    }
    CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceCaptureEncodingBehavior"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), CFSTR("com.apple.camera"));
    if (a3 == 1)
    {
      if (CFPreferencesGetAppIntegerValue(CFSTR("CAMUserPreferenceSlomoConfiguration"), CFSTR("com.apple.camera"), 0) == 8)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v14 = 8;
          v15 = 2048;
          v16 = 0;
          _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "changing slow-mo configuration from %ld to %ld", buf, 0x16u);
        }
        objc_msgSend(a1, "setRecordSlomoConfiguration:", &unk_1E45CA5B0);
      }
      if (CFPreferencesGetAppIntegerValue(CFSTR("CAMUserPreferenceVideoConfiguration"), CFSTR("com.apple.camera"), 0) == 9)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v14 = 9;
          v15 = 2048;
          v16 = 1;
          _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "changing video configuration from %ld to %ld", buf, 0x16u);
        }
        objc_msgSend(a1, "setRecordVideoConfiguration:", &unk_1E45CA5C8);
      }
    }
    else if (!a3
           && v10 == 1
           && CFPreferencesGetAppIntegerValue(CFSTR("CAMUserPreferenceSlomoConfiguration"), CFSTR("com.apple.camera"), 0) == 8)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v14 = 8;
        v15 = 2048;
        v16 = 0;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "changing slow-mo configuration from %ld to %ld for change from MostCompatible back to Automatic", buf, 0x16u);
      }
      objc_msgSend(a1, "setRecordSlomoConfiguration:", &unk_1E45CA5B0);
    }
    CFPreferencesAppSynchronize(CFSTR("com.apple.camera"));
  }
  return v9;
}

+ (id)recordVideoConfigurationWithValidValues:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", CFPreferencesGetAppIntegerValue(CFSTR("CAMUserPreferenceVideoConfiguration"), CFSTR("com.apple.camera"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  if ((v5 & 1) == 0)
  {

    v4 = &unk_1E45CA5B0;
  }
  return v4;
}

+ (void)setRecordVideoConfiguration:(id)a3
{
  CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceVideoConfiguration"), a3, CFSTR("com.apple.camera"));
}

+ (id)recordSlomoConfigurationWithValidValues:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", CFPreferencesGetAppIntegerValue(CFSTR("CAMUserPreferenceSlomoConfiguration"), CFSTR("com.apple.camera"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  if ((v5 & 1) == 0)
  {

    v4 = &unk_1E45CA5B0;
  }
  return v4;
}

+ (void)setRecordSlomoConfiguration:(id)a3
{
  CFPreferencesSetAppValue(CFSTR("CAMUserPreferenceSlomoConfiguration"), a3, CFSTR("com.apple.camera"));
}

+ (id)testCapabilitiesNotSupportingHEVC
{
  return (id)objc_opt_new();
}

+ (id)testCapabilitiesNotSupportingHEIF
{
  return (id)objc_opt_new();
}

@end
