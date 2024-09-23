@implementation PFMetadataSyndication

- (PFMetadataSyndication)initWithSyndicationProperties:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PFTimeZoneLookup *v9;
  PFMetadataSyndication *v10;
  PFMetadataSyndication *v11;
  objc_super v13;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uti"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PFUniformTypeUtilities typeWithIdentifier:](PFUniformTypeUtilities, "typeWithIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(PFTimeZoneLookup);
    v13.receiver = self;
    v13.super_class = (Class)PFMetadataSyndication;
    v10 = -[PFMetadata initWithContentType:options:timeZoneLookup:](&v13, sel_initWithContentType_options_timeZoneLookup_, v8, 12, v9);

    if (v10)
    {
      objc_storeStrong((id *)&v10->_syndicationProperties, a3);
      -[PFMetadata setSourceType:](v10, "setSourceType:", 10);
    }
    self = v10;

    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)configureWithMetadataPlist:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSDictionary *v6;
  NSDictionary *syndicationProperties;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PFMetadataSyndication;
  v5 = -[PFMetadata configureWithMetadataPlist:](&v9, sel_configureWithMetadataPlist_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", PFMetadataPlistSyndicationProperties);
    v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    syndicationProperties = self->_syndicationProperties;
    self->_syndicationProperties = v6;

  }
  return v5;
}

- (BOOL)isImage
{
  void *v2;
  char v3;

  -[PFMetadata contentType](self, "contentType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "conformsToType:", *MEMORY[0x1E0CEC520]);

  return v3;
}

- (BOOL)isMovie
{
  void *v2;
  char v3;

  -[PFMetadata contentType](self, "contentType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "conformsToType:", *MEMORY[0x1E0CEC568]);

  return v3;
}

- (id)pixelWidth
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD048]);
}

- (id)pixelHeight
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD040]);
}

- (int64_t)orientation
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (id)lensModel
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCBE0]);
}

- (id)lensMake
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCBD8]);
}

- (id)profileName
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD060]);
}

- (unint64_t)photoProcessingFlags
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("photoProcessingFlags"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (unint64_t)photoCaptureFlags
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("stillImageCaptureFlags"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (int64_t)cameraUsedForCapture
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("cameraUsedForCapture"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (int64_t)customRendered
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB30]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (id)fNumber
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB80]);
}

- (id)exposureBias
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB60]);
}

- (id)flashValue
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB88]);
}

- (BOOL)flashFired
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("flashFired"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)flashCompensation
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCA38]);
}

- (id)focalLength
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCBA0]);
}

- (id)focalLengthIn35mm
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB98]);
}

- (id)digitalZoomRatio
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB58]);
}

- (id)iso
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCBC0]);
}

- (id)meteringMode
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCC08]);
}

- (id)exposureTime
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB78]);
}

- (id)whiteBalance
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCCC0]);
}

- (id)lightSource
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCBF8]);
}

- (id)whiteBalanceIndex
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC8C0]);
}

- (id)GIFDelayTime
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCCD8]);
}

- (id)HEICSDelayTime
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCE78]);
}

- (id)burstUuid
{
  void *v2;
  id v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("burstUuid"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "UUIDString");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = v2;
  }
  v4 = v3;

  return v4;
}

- (id)hdrGainMap
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC710]);
}

- (id)videoDynamicRange
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("videoDynamicRange"));
}

- (BOOL)isCinematicVideo
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("videoContainsCinematicData"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoComplementDuration
{
  void *v5;
  BOOL v6;
  uint64_t v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v9;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("videoComplementDuration"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("videoComplementTimescale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
  {
    v7 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
    retstr->var3 = *(_QWORD *)(v7 + 16);
  }
  else
  {
    CMTimeMake((CMTime *)retstr, objc_msgSend(v9, "longLongValue"), objc_msgSend(v5, "intValue"));
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageDisplayTime
{
  void *v5;
  BOOL v6;
  uint64_t v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v9;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("imageDisplayTime"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("imageDisplayTimescale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
  {
    v7 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
    retstr->var3 = *(_QWORD *)(v7 + 16);
  }
  else
  {
    CMTimeMake((CMTime *)retstr, objc_msgSend(v9, "longLongValue"), objc_msgSend(v5, "intValue"));
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  void *v5;
  BOOL v6;
  uint64_t v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v9;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("videoDurationValue"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("videoDurationTimescale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
  {
    v7 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
    retstr->var3 = *(_QWORD *)(v7 + 16);
  }
  else
  {
    CMTimeMake((CMTime *)retstr, objc_msgSend(v9, "longLongValue"), objc_msgSend(v5, "intValue"));
  }

  return result;
}

- (id)nominalFrameRate
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("framesPerSecond"));
}

- (unsigned)firstVideoTrackCodec
{
  void *v2;
  unsigned int v3;

  -[PFMetadataSyndication firstVideoTrackCodecString](self, "firstVideoTrackCodecString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[PFMediaUtilities fourCharCodeFromString:](PFMediaUtilities, "fourCharCodeFromString:", v2);

  return v3;
}

- (id)firstVideoTrackCodecString
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("fourCharCode"));
}

- (id)captureMode
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("com.apple.photos.captureMode"));
}

- (BOOL)isTimelapse
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("Time-lapse"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)montageString
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("isMontage"));
}

- (id)audioDataRate
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("estimatedDataRate"));
}

- (id)audioTrackFormat
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("audioTrackFormat"));
}

- (id)audioSampleRate
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("audioTrackSampleRate"));
}

- (id)timeZoneOffset
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("timeZoneOffset"));
}

- (id)cameraModel
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD0B8]);
}

- (id)cameraMake
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD0B0]);
}

- (id)livePhotoPairingIdentifier
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("livePhotoParingIdentifier"));
}

- (id)playbackVariation
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("playbackVariation"));
}

- (id)originatingAssetIdentifer
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("originiatinAssetIdentifier"));
}

- (BOOL)isProRes
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("isProRes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)spatialOverCaptureIdentifier
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("socIdentifier"));
}

- (id)longitude
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCDA0]);
}

- (id)latitude
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCD90]);
}

- (id)speed
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCDD0]);
}

- (id)speedRef
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCDD8]);
}

- (id)gpsDateTime
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("gpsDateTime"));
}

- (id)gpsHPositioningError
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCD78]);
}

- (id)altitude
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCD00]);
}

- (id)imageDirection
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCD80]);
}

- (id)imageDirectionRef
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCD88]);
}

- (unint64_t)fileSize
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AF0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (id)originalFileName
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("originalFilename"));
}

- (BOOL)isPhotoBooth
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("isPhotoBooth"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)userComment
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCCB0]);
}

- (BOOL)isHDR
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("isHDR"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)hdrGain
{
  void *v3;
  void *v4;
  objc_super v6;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("hdrGain"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)PFMetadataSyndication;
  -[PFMetadata hdrGainFromValue:](&v6, sel_hdrGainFromValue_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)hasHDRGainMap
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("hasHDRGainMap"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)hasISOGainMap
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("hasISOGainMap"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)semanticStyleToneBias
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("semanticStyleToneBias"));
}

- (id)semanticStyleWarmthBias
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("semanticStyleWarmthBias"));
}

- (id)semanticStyleRenderingVersion
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("semanticStyleRenderingVersion"));
}

- (id)semanticStylePreset
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("semanticStylePreset"));
}

- (BOOL)isAnimatedImage
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("isAnimatedImage"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isSyndicationOriginated
{
  return 1;
}

- (id)syndicationProperties
{
  return self->_syndicationProperties;
}

- (BOOL)isFrontFacingCamera
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("kPFImagePropertyFrontFacingCamera"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (signed)smartStyleCast
{
  void *v2;
  signed __int16 v3;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("smartStyleCast"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (id)smartStyleToneBias
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("smartStyleToneBias"));
}

- (id)smartStyleColorBias
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("smartStyleColorBias"));
}

- (id)smartStyleIntensity
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("smartStyleIntensity"));
}

- (id)smartStyleRenderingVersion
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("smartStyleRenderingVersion"));
}

- (id)smartStyleIsReversible
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("smartStyleIsReversible"));
}

- (id)smartStyleExpectingReversibility
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("smartStyleExpectingReversibility"));
}

- (BOOL)hasSmartStyle
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("hasSmartStyle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (signed)smartStyleVideoCastValue
{
  void *v2;
  signed __int16 v3;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("smartStyleVideoCastValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shortValue");

  return v3;
}

- (BOOL)hasSpatialAudio
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("hasSpatialAudio"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isAlchemist
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("isAlchemist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isThreeImageStereoHEIC
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("isThreeImageStereoHEIC"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)generativeAIImageType
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("generativeAIImageType"));
}

- (id)credit
{
  return -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCEC8]);
}

- (id)_makeDateTimeProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("creationDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    PFStringFromDate(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = *MEMORY[0x1E0CBCB40] == 0;
    else
      v7 = 1;
    if (!v7)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6);

  }
  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", CFSTR("timeZoneOffset"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFMetadataSyndication _timeZoneOffsetStringFromTimeZoneOffsetSeconds:](self, "_timeZoneOffsetStringFromTimeZoneOffsetSeconds:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = *MEMORY[0x1E0CBCC20] == 0;
  else
    v10 = 1;
  if (!v10)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9);
  v11 = *MEMORY[0x1E0CBCCA0];
  -[NSDictionary objectForKeyedSubscript:](self->_syndicationProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCCA0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v12, "doubleValue");
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%03g"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "substringFromIndex:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && v17)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, v11);

  }
  v20 = *MEMORY[0x1E0CBCB50];
  v21[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_timeZoneOffsetStringFromTimeZoneOffsetSeconds:(id)a3
{
  double v3;
  const __CFString *v4;
  long double v5;
  double __y;

  if (!a3)
    return 0;
  objc_msgSend(a3, "doubleValue");
  if (v3 <= 0.0)
    v4 = CFSTR("-");
  else
    v4 = CFSTR("+");
  __y = 0.0;
  v5 = modf(v3 / 3600.0, &__y);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%02lu:%02lu"), v4, (unint64_t)fabs(__y), (unint64_t)(v5 * 60.0));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)plistForEncoding
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFMetadataSyndication;
  -[PFMetadata plistForEncoding](&v6, sel_plistForEncoding);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_syndicationProperties, PFMetadataPlistSyndicationProperties);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFMetadataSyndication;
  v4 = -[PFMetadata copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 22, self->_syndicationProperties);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDictionary *syndicationProperties;
  char v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PFMetadataSyndication;
  if (!-[PFMetadata isEqual:](&v8, sel_isEqual_, v4)
    || (syndicationProperties = self->_syndicationProperties, (syndicationProperties == 0) == (v4[22] != 0)))
  {
    v6 = 0;
  }
  else
  {
    v6 = -[NSDictionary isEqual:](syndicationProperties, "isEqual:");
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syndicationProperties, 0);
}

@end
