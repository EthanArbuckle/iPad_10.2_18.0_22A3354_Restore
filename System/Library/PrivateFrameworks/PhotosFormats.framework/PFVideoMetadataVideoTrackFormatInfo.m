@implementation PFVideoMetadataVideoTrackFormatInfo

- (PFVideoMetadataVideoTrackFormatInfo)initWithFirstVideoTrackOfAsset:(id)a3
{
  id v5;
  PFVideoMetadataVideoTrackFormatInfo *v6;
  PFVideoMetadataVideoTrackFormatInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PFVideoMetadataVideoTrackFormatInfo;
  v6 = -[PFVideoMetadataVideoTrackFormatInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_asset, a3);
    -[PFVideoMetadataVideoTrackFormatInfo _checkFormat](v7, "_checkFormat");
  }

  return v7;
}

- (void)_checkFormat
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *colorPrimaries;
  NSString *v16;
  NSString *transferFunction;
  int v18;
  int v19;
  AVAsset *v20;
  AVAsset *asset;
  NSObject *v22;
  const char *v23;
  AVAsset *v24;
  CGAffineTransform v25;
  uint8_t buf[4];
  AVAsset *v27;
  __int16 v28;
  int v29;
  uint64_t v30;
  CGRect v31;
  CGRect v32;

  v30 = *MEMORY[0x1E0C80C00];
  +[PFMediaUtilities tracksWithMediaType:forAsset:](PFMediaUtilities, "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], self->_asset);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    asset = self->_asset;
    *(_DWORD *)buf = 138412290;
    v27 = asset;
    v22 = MEMORY[0x1E0C81028];
    v23 = "Unable to query video format information for asset without video tracks: %@";
LABEL_12:
    _os_log_error_impl(&dword_1A16EE000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0xCu);
    goto LABEL_15;
  }
  objc_msgSend(v4, "formatDescriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v24 = self->_asset;
    *(_DWORD *)buf = 138412290;
    v27 = v24;
    v22 = MEMORY[0x1E0C81028];
    v23 = "Unable to query video format information for asset without first video track format description: %@";
    goto LABEL_12;
  }
  self->_codec = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v6);
  self->_isHighDynamicRange = +[PFVideoMetadata videoTrackFormatDescriptionIsHighDynamicRange:](PFVideoMetadata, "videoTrackFormatDescriptionIsHighDynamicRange:", v6);
  self->_isHDR10 = +[PFVideoMetadata videoTrackFormatDescriptionIsHDR10:](PFVideoMetadata, "videoTrackFormatDescriptionIsHDR10:", v6);
  self->_isProResLOG = +[PFVideoMetadata videoTrackFormatDescriptionIsProResLOG:](PFVideoMetadata, "videoTrackFormatDescriptionIsProResLOG:", v6);
  self->_hasDolby8_4Metadata = objc_msgSend((id)objc_opt_class(), "videoTrackFormatDescriptionHasDolby8_4Metadata:", v6);
  self->_isSpatial = +[PFVideoMetadata videoTrackIsSpatial:](PFVideoMetadata, "videoTrackIsSpatial:", v4);
  objc_msgSend(v4, "naturalSize");
  v8 = v7;
  objc_msgSend(v4, "naturalSize");
  v10 = v9;
  objc_msgSend(v4, "preferredTransform");
  v31.origin.x = 0.0;
  v31.origin.y = 0.0;
  v31.size.width = v8;
  v31.size.height = v10;
  v32 = CGRectApplyAffineTransform(v31, &v25);
  self->_displaySize.width = v32.size.width;
  self->_displaySize.height = v32.size.height;
  CMFormatDescriptionGetExtensions((CMFormatDescriptionRef)v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("BitsPerComponent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    self->_bitsPerComponent = objc_msgSend(v13, "integerValue");

    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8D68]);
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    colorPrimaries = self->_colorPrimaries;
    self->_colorPrimaries = v14;

    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8E98]);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    transferFunction = self->_transferFunction;
    self->_transferFunction = v16;

    if (self->_codec == 1752589105)
    {
      v18 = objc_msgSend((id)objc_opt_class(), "_getProfile:tier:level:fromFormatDescriptionExtensions:", &self->_hevcProfile, &self->_hevcTier, &self->_hevcLevel, v12);
      if (v18)
      {
        v19 = v18;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v20 = self->_asset;
          *(_DWORD *)buf = 138412546;
          v27 = v20;
          v28 = 1024;
          v29 = v19;
          _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unable to get profile/tier/level for %@: %d", buf, 0x12u);
        }
      }
      else
      {
        self->_hasHEVCProfileTierLevelInfo = 1;
      }
    }
  }

LABEL_15:
}

- (NSString)formatDebugDescription
{
  int64_t v3;
  __CFString *v4;
  _BOOL4 v5;
  __CFString *v6;
  void *v7;
  uint64_t codec;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;

  v3 = -[PFVideoMetadataVideoTrackFormatInfo bitsPerComponent](self, "bitsPerComponent");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%tdbit "), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E45A8128;
  }
  v5 = +[PFMediaCapabilities currentDeviceIsEligibleForHDRPlayback](PFMediaCapabilities, "currentDeviceIsEligibleForHDRPlayback");
  if (self->_isHighDynamicRange)
    v6 = CFSTR("HDR");
  else
    v6 = CFSTR("SDR");
  v7 = (void *)MEMORY[0x1E0CB3940];
  codec = self->_codec;
  v9 = v6;
  +[PFMediaUtilities stringFromFourCharCode:](PFMediaUtilities, "stringFromFourCharCode:", codec);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFVideoMetadataVideoTrackFormatInfo hevcProfileTierLevelDescription](self, "hevcProfileTierLevelDescription");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = CFSTR("yes");
  if (self->_hasDolby8_4Metadata)
    v14 = CFSTR("yes");
  else
    v14 = CFSTR("no");
  if (!v5)
    v13 = CFSTR("no");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ %@%@%@ size=%dx%d transfer=%@ color=%@ dv84=%@ (current device eligible for HDR: %@)"), v10, v4, v9, v11, (int)self->_displaySize.width, (int)self->_displaySize.height, self->_transferFunction, self->_colorPrimaries, v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (id)hevcProfileTierLevelDescription
{
  unint64_t v2;
  __CFString *v3;

  if (self->_hasHEVCProfileTierLevelInfo)
  {
    LOBYTE(v2) = self->_hevcLevel;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %d/%d/%1.1f"), self->_hevcProfile, self->_hevcTier, (double)v2 / 30.0);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR(" (profile/tier/level unavailable)");
  }
  return v3;
}

- (unsigned)codec
{
  return self->_codec;
}

- (BOOL)isHighDynamicRange
{
  return self->_isHighDynamicRange;
}

- (BOOL)isHDR10
{
  return self->_isHDR10;
}

- (BOOL)isProResLOG
{
  return self->_isProResLOG;
}

- (BOOL)hasDolby8_4Metadata
{
  return self->_hasDolby8_4Metadata;
}

- (BOOL)isSpatial
{
  return self->_isSpatial;
}

- (BOOL)hasHEVCProfileTierLevelInfo
{
  return self->_hasHEVCProfileTierLevelInfo;
}

- (unsigned)hevcProfile
{
  return self->_hevcProfile;
}

- (unsigned)hevcTier
{
  return self->_hevcTier;
}

- (unsigned)hevcLevel
{
  return self->_hevcLevel;
}

- (int64_t)bitsPerComponent
{
  return self->_bitsPerComponent;
}

- (NSString)colorPrimaries
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)transferFunction
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (CGSize)displaySize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_displaySize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferFunction, 0);
  objc_storeStrong((id *)&self->_colorPrimaries, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

+ (id)infoForFirstVideoTrackOfAsset:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFirstVideoTrackOfAsset:", v4);

  return v5;
}

+ (signed)_getProfile:(char *)a3 tier:(char *)a4 level:(char *)a5 fromFormatDescriptionExtensions:(id)a6
{
  void *v6;
  void *v7;
  int HEVCParameterSetAtIndex;
  signed __int16 SPSProfileTierLevel;

  objc_msgSend(a6, "objectForKeyedSubscript:", *MEMORY[0x1E0CA2240]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hvcC"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    HEVCParameterSetAtIndex = FigHEVCBridge_GetHEVCParameterSetAtIndex();
    SPSProfileTierLevel = HEVCParameterSetAtIndex;
    if (!HEVCParameterSetAtIndex)
      SPSProfileTierLevel = FigHEVCBridge_GetSPSProfileTierLevel();
  }
  else
  {
    SPSProfileTierLevel = 0;
  }

  return SPSProfileTierLevel;
}

+ (BOOL)videoTrackFormatDescriptionHasDolby8_4Metadata:(opaqueCMFormatDescription *)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  CMFormatDescriptionGetExtensions(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8E98]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CA2318])
      && (objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA2240]),
          (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = v6;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dvvC"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8 != 0;

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
