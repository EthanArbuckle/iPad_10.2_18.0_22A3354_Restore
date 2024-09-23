@implementation PFMetadata

- (PFMetadata)initWithMediaURL:(id)a3 detail:(unsigned __int16)a4 timeZoneLookup:(id)a5 shouldCache:(BOOL)a6
{
  unsigned int v6;
  uint64_t v7;

  if (a4 == 1)
    v6 = 460;
  else
    v6 = 12;
  if (a4 == 2)
    v7 = 13;
  else
    v7 = v6;
  return -[PFMetadata initWithMediaURL:options:timeZoneLookup:shouldCache:](self, "initWithMediaURL:options:timeZoneLookup:shouldCache:", a3, v7, a5, a6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gpsDateTime, 0);
  objc_storeStrong((id *)&self->_speed, 0);
  objc_storeStrong((id *)&self->_altitude, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_gpsLocation, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_creationDateString, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_utcCreationDate, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_typeVerifier, 0);
  objc_storeStrong((id *)&self->_cachedTimeZoneLookup, 0);
  objc_storeStrong((id *)&self->_pixelHeight, 0);
  objc_storeStrong((id *)&self->_pixelWidth, 0);
  objc_storeStrong((id *)&self->_fileSystemProperties, 0);
}

- (id)originatingAssetIdentifierMetadataKey
{
  if (-[PFMetadata isImage](self, "isImage"))
    +[PFMetadata originatingAssetIdentifierMetadataKey](PFMetadata, "originatingAssetIdentifierMetadataKey");
  else
    +[PFMetadata originatingAssetIdentifierMetadataIdentifier](PFMetadata, "originatingAssetIdentifierMetadataIdentifier");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)renderOriginatingAssetIdentifierMetadataKey
{
  if (-[PFMetadata isImage](self, "isImage"))
    +[PFMetadata renderOriginatingAssetIdentifierMetadataKey](PFMetadata, "renderOriginatingAssetIdentifierMetadataKey");
  else
    +[PFMetadata renderOriginatingAssetIdentifierMetadataIdentifier](PFMetadata, "renderOriginatingAssetIdentifierMetadataIdentifier");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)livePhotoPairingIdentifierMetadataKey
{
  if (-[PFMetadata isImage](self, "isImage"))
    +[PFMetadata livePhotoPairingIdentifierMetadataKey](PFMetadata, "livePhotoPairingIdentifierMetadataKey");
  else
    +[PFMetadata livePhotoPairingIdentifierMetadataIdentifier](PFMetadata, "livePhotoPairingIdentifierMetadataIdentifier");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)spatialOverCaptureIdentifierMetadataKey
{
  if (-[PFMetadata isImage](self, "isImage"))
    +[PFMetadata spatialOverCaptureIdentifierMetadataKey](PFMetadata, "spatialOverCaptureIdentifierMetadataKey");
  else
    +[PFMetadata spatialOverCaptureIdentifierMetadataIdentifier](PFMetadata, "spatialOverCaptureIdentifierMetadataIdentifier");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)playbackVariationMetadataKey
{
  if (-[PFMetadata isImage](self, "isImage"))
    +[PFMetadata playbackVariationMetadataKey](PFMetadata, "playbackVariationMetadataKey");
  else
    +[PFMetadata playbackVariationMetadataIdentifier](PFMetadata, "playbackVariationMetadataIdentifier");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)photoProcessingFlagsMetadataKey
{
  void *v2;

  if (-[PFMetadata isImage](self, "isImage"))
  {
    +[PFMetadata photoProcessingFlagsMetadataKey](PFMetadata, "photoProcessingFlagsMetadataKey");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)photosFeatureFlagsMetadataKey
{
  void *v2;

  if (-[PFMetadata isImage](self, "isImage"))
  {
    +[PFMetadata photosFeatureFlagsMetadataKey](PFMetadata, "photosFeatureFlagsMetadataKey");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)burstUuidMetadataKey
{
  if (-[PFMetadata isImage](self, "isImage"))
    return (id)*MEMORY[0x1E0C89C78];
  else
    return 0;
}

- (id)hdrGainMetadataKey
{
  if (-[PFMetadata isImage](self, "isImage"))
    return (id)*MEMORY[0x1E0D03D40];
  else
    return 0;
}

- (PFMetadata)initWithMediaURL:(id)a3 timeZoneLookup:(id)a4
{
  return -[PFMetadata initWithMediaURL:options:timeZoneLookup:shouldCache:](self, "initWithMediaURL:options:timeZoneLookup:shouldCache:", a3, 13, a4, 0);
}

- (PFMetadata)initWithMediaURL:(id)a3 options:(unsigned __int16)a4 timeZoneLookup:(id)a5 shouldCache:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  id v13;
  PFMetadata *v14;
  PFMetadata *v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v6 = a6;
  v8 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  if (v10)
  {
    v18 = 0;
    +[PFUniformTypeUtilities typeForURL:error:](PFUniformTypeUtilities, "typeForURL:error:", v10, &v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;
    if (v12)
    {
      if (objc_msgSend(v12, "conformsToType:", *MEMORY[0x1E0CEC520]))
      {
        v14 = -[PFMetadata initWithImageURL:contentType:options:timeZoneLookup:cacheImageSource:cacheImageData:](self, "initWithImageURL:contentType:options:timeZoneLookup:cacheImageSource:cacheImageData:", v10, v12, v8, v11, v6, v6);
LABEL_10:
        v15 = v14;
LABEL_12:

        goto LABEL_13;
      }
      if (objc_msgSend(v12, "conformsToType:", *MEMORY[0x1E0CEC568]))
      {
        v14 = -[PFMetadata initWithAVURL:options:timeZoneLookup:](self, "initWithAVURL:options:timeZoneLookup:", v10, v8, v11);
        goto LABEL_10;
      }
    }
    else
    {
      v16 = metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v20 = v10;
        v21 = 2112;
        v22 = v13;
        _os_log_error_impl(&dword_1A16EE000, v16, OS_LOG_TYPE_ERROR, "Couldn't determine UTI for URL '%@' (ERROR: %@)", buf, 0x16u);
      }
    }

    v15 = 0;
    goto LABEL_12;
  }

  v15 = 0;
LABEL_13:

  return v15;
}

- (PFMetadata)initWithSyndicationProperties:(id)a3
{
  id v4;
  PFMetadataSyndication *v5;

  v4 = a3;

  v5 = -[PFMetadataSyndication initWithSyndicationProperties:]([PFMetadataSyndication alloc], "initWithSyndicationProperties:", v4);
  return &v5->super;
}

- (PFMetadata)initWithImageProperties:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5
{
  return -[PFMetadata initWithImageProperties:contentType:options:timeZoneLookup:](self, "initWithImageProperties:contentType:options:timeZoneLookup:", a3, a4, 12, a5);
}

- (PFMetadata)initWithPropertyListRepresentationData:(id)a3 timeZoneLookup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  __objc2_class *v12;
  NSObject *v13;
  PFMetadata *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v16 = 0;
  +[PFMetadata propertyListObjectFromEncodedData:expectedClass:options:error:](PFMetadata, "propertyListObjectFromEncodedData:expectedClass:options:error:", v7, objc_opt_class(), 0, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v16;
  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", PFMetadataPlistSourceType);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    switch(v11)
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
        v12 = PFMetadataImage;
        break;
      case 6:
      case 7:
      case 9:
        v12 = PFMetadataMovie;
        break;
      case 8:
        v12 = PFMetadataLegacyMovieProperties;
        break;
      case 10:
        v12 = PFMetadataSyndication;
        break;
      case 11:
        v12 = PFMetadataImageCaptureMovieProperties;
        break;
      default:
        goto LABEL_6;
    }
    v14 = (PFMetadata *)objc_msgSend([v12 alloc], "initWithMetadataPlist:timeZoneLookup:", v8, v6);
  }
  else
  {
    v13 = metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v9;
      _os_log_error_impl(&dword_1A16EE000, v13, OS_LOG_TYPE_ERROR, "Failed to decode PFMetadata plist (%@)", buf, 0xCu);
    }
LABEL_6:
    v14 = 0;
  }

  return v14;
}

- (PFMetadata)initWithMetadataPlist:(id)a3 timeZoneLookup:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  PFMetadata *v12;

  v6 = a3;
  v7 = PFMetadataPlistContentTypeIdentifier;
  v8 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFUniformTypeUtilities typeWithIdentifier:](PFUniformTypeUtilities, "typeWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", PFMetadataPlistOptions);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PFMetadata initWithContentType:options:timeZoneLookup:](self, "initWithContentType:options:timeZoneLookup:", v10, (unsigned __int16)objc_msgSend(v11, "integerValue"), v8);

  if (v12 && !-[PFMetadata configureWithMetadataPlist:](v12, "configureWithMetadataPlist:", v6))
  {

    v12 = 0;
  }

  return v12;
}

- (id)initForLimitedPropertiesWithPath:(id)a3
{
  id v4;
  const __CFURL *v5;
  const __CFDictionary *v6;
  CGImageSource *v7;
  CGImageSource *v8;
  CFDictionaryRef v9;
  PFTimeZoneLookup *v10;
  PFMetadata *v11;
  NSObject *v12;
  uint8_t v14[16];

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
    v5 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    +[PFMetadataImage defaultOptionsForCGImageSource](PFMetadataImage, "defaultOptionsForCGImageSource");
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = CGImageSourceCreateWithURL(v5, v6);
    if (v7)
    {
      v8 = v7;
      v9 = CGImageSourceCopyPropertiesAtIndex(v7, 0, v6);
      v10 = objc_alloc_init(PFTimeZoneLookup);
      if (v9)
      {
        v11 = -[PFMetadata initWithImageProperties:contentType:options:timeZoneLookup:](self, "initWithImageProperties:contentType:options:timeZoneLookup:", v9, 0, 460, v10);

        if (v11)
          -[PFMetadata setFileURL:](v11, "setFileURL:", v5);
      }
      else
      {
        v11 = -[PFMetadata initWithAVURL:options:timeZoneLookup:](self, "initWithAVURL:options:timeZoneLookup:", v5, 460, v10);

      }
      CFRelease(v8);

      self = v11;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v12 = metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl(&dword_1A16EE000, v12, OS_LOG_TYPE_ERROR, "Expected path to be non-nil", v14, 2u);
    }
    v11 = 0;
  }

  return v11;
}

- (PFMetadata)initWithImageURL:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5
{
  return -[PFMetadata initWithImageURL:contentType:options:timeZoneLookup:cacheImageSource:cacheImageData:](self, "initWithImageURL:contentType:options:timeZoneLookup:cacheImageSource:cacheImageData:", a3, a4, 13, a5, 0, 0);
}

- (PFMetadata)initWithAVURL:(id)a3 timeZoneLookup:(id)a4
{
  return -[PFMetadata initWithAVURL:options:timeZoneLookup:](self, "initWithAVURL:options:timeZoneLookup:", a3, 13, a4);
}

- (PFMetadata)initWithAVAsset:(id)a3 timeZoneLookup:(id)a4
{
  return -[PFMetadata initWithAVAsset:options:timeZoneLookup:](self, "initWithAVAsset:options:timeZoneLookup:", a3, 13, a4);
}

- (PFMetadata)initWithContentType:(id)a3 options:(unsigned __int16)a4 timeZoneLookup:(id)a5
{
  id v9;
  id v10;
  PFMetadata *v11;
  PFTimeZoneLookup *WeakRetained;
  PFTimeZoneLookup *cachedTimeZoneLookup;
  PFMetadataTypeVerifier *v14;
  PFMetadataTypeVerifier *typeVerifier;
  objc_super v17;

  v9 = a3;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PFMetadata;
  v11 = -[PFMetadata init](&v17, sel_init);
  if (v11)
  {
    if (initWithContentType_options_timeZoneLookup__onceToken != -1)
      dispatch_once(&initWithContentType_options_timeZoneLookup__onceToken, &__block_literal_global_2455);
    objc_storeStrong((id *)&v11->_contentType, a3);
    v11->_options = a4;
    if (v10)
      WeakRetained = (PFTimeZoneLookup *)v10;
    else
      WeakRetained = (PFTimeZoneLookup *)objc_loadWeakRetained(&gDefaultTimeZoneLookup);
    cachedTimeZoneLookup = v11->_cachedTimeZoneLookup;
    v11->_cachedTimeZoneLookup = WeakRetained;

    v14 = objc_alloc_init(PFMetadataTypeVerifier);
    typeVerifier = v11->_typeVerifier;
    v11->_typeVerifier = v14;

  }
  return v11;
}

- (PFMetadata)initWithImageURL:(id)a3 contentType:(id)a4 options:(unsigned __int16)a5 timeZoneLookup:(id)a6 cacheImageSource:(BOOL)a7 cacheImageData:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  PFMetadataImage *v19;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v8 = a8;
  v9 = a7;
  v11 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  if (!v15)
  {
    v21 = 0;
    +[PFUniformTypeUtilities typeForURL:error:](PFUniformTypeUtilities, "typeForURL:error:", v14, &v21);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v21;
    if (!v15)
    {
      v18 = metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v14;
        v24 = 2112;
        v25 = v17;
        _os_log_fault_impl(&dword_1A16EE000, v18, OS_LOG_TYPE_FAULT, "Failed to get a content type for URL '%@' (ERROR: %@)", buf, 0x16u);
      }
    }

  }
  v19 = -[PFMetadataImage initWithImageURL:contentType:options:timeZoneLookup:cacheImageSource:cacheImageData:]([PFMetadataImage alloc], "initWithImageURL:contentType:options:timeZoneLookup:cacheImageSource:cacheImageData:", v14, v15, v11, v16, v9, v8);

  return &v19->super;
}

- (PFMetadata)initWithImageData:(id)a3 contentType:(id)a4 options:(unsigned __int16)a5 timeZoneLookup:(id)a6 cacheImageSource:(BOOL)a7 cacheImageData:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  PFMetadataImage *v17;

  v8 = a8;
  v9 = a7;
  v10 = a5;
  v14 = a6;
  v15 = a4;
  v16 = a3;

  v17 = -[PFMetadataImage initWithImageData:contentType:options:timeZoneLookup:cacheImageSource:cacheImageData:]([PFMetadataImage alloc], "initWithImageData:contentType:options:timeZoneLookup:cacheImageSource:cacheImageData:", v16, v15, v10, v14, v9, v8);
  return &v17->super;
}

- (PFMetadata)initWithImageSource:(CGImageSource *)a3 contentType:(id)a4 options:(unsigned __int16)a5 timeZoneLookup:(id)a6 cacheImageSource:(BOOL)a7
{
  _BOOL8 v7;
  uint64_t v8;
  id v12;
  id v13;
  PFMetadataImage *v14;

  v7 = a7;
  v8 = a5;
  v12 = a6;
  v13 = a4;

  v14 = -[PFMetadataImage initWithImageSource:contentType:options:timeZoneLookup:cacheImageSource:]([PFMetadataImage alloc], "initWithImageSource:contentType:options:timeZoneLookup:cacheImageSource:", a3, v13, v8, v12, v7);
  return &v14->super;
}

- (PFMetadata)initWithEncodedImagePropertyData:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5
{
  id v8;
  id v9;
  id v10;
  PFMetadataImage *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;

  v11 = -[PFMetadataImage initWithEncodedImagePropertyData:contentType:timeZoneLookup:]([PFMetadataImage alloc], "initWithEncodedImagePropertyData:contentType:timeZoneLookup:", v10, v9, v8);
  return &v11->super;
}

- (PFMetadata)initWithImageSourceProxyData:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5
{
  id v8;
  id v9;
  id v10;
  PFMetadataImage *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;

  v11 = -[PFMetadataImage initWithImageSourceProxyData:contentType:timeZoneLookup:]([PFMetadataImage alloc], "initWithImageSourceProxyData:contentType:timeZoneLookup:", v10, v9, v8);
  return &v11->super;
}

- (PFMetadata)initWithImageSourceProxyOrEncodedImagePropertyData:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5
{
  id v8;
  id v9;
  id v10;
  PFMetadataImage *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;

  v11 = -[PFMetadataImage initWithImageSourceProxyOrEncodedImagePropertyData:contentType:timeZoneLookup:]([PFMetadataImage alloc], "initWithImageSourceProxyOrEncodedImagePropertyData:contentType:timeZoneLookup:", v10, v9, v8);
  return &v11->super;
}

- (PFMetadata)initWithImageProperties:(id)a3 contentType:(id)a4 options:(unsigned __int16)a5 timeZoneLookup:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  PFMetadataImage *v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;

  v13 = -[PFMetadataImage initWithImageProperties:contentType:options:timeZoneLookup:]([PFMetadataImage alloc], "initWithImageProperties:contentType:options:timeZoneLookup:", v12, v11, v6, v10);
  return &v13->super;
}

- (PFMetadata)initWithAVURL:(id)a3 options:(unsigned __int16)a4 timeZoneLookup:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  PFMetadataMovie *v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;

  v10 = -[PFMetadataMovie initWithAVURL:options:timeZoneLookup:]([PFMetadataMovie alloc], "initWithAVURL:options:timeZoneLookup:", v9, v5, v8);
  return &v10->super;
}

- (PFMetadata)initWithAVProxyData:(id)a3 timeZoneLookup:(id)a4
{
  id v6;
  id v7;
  PFMetadataMovie *v8;

  v6 = a3;
  v7 = a4;
  v8 = -[PFMetadataMovie initWithAVProxyData:timeZoneLookup:]([PFMetadataMovie alloc], "initWithAVProxyData:timeZoneLookup:", v6, v7);
  if (!v8)
    v8 = -[PFMetadataLegacyMovieProperties initWithAVProxyData:timeZoneLookup:]([PFMetadataLegacyMovieProperties alloc], "initWithAVProxyData:timeZoneLookup:", v6, v7);

  return &v8->super;
}

- (PFMetadata)initWithAVAsset:(id)a3 options:(unsigned __int16)a4 timeZoneLookup:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  PFMetadataMovie *v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;

  v10 = -[PFMetadataMovie initWithAVAsset:options:timeZoneLookup:]([PFMetadataMovie alloc], "initWithAVAsset:options:timeZoneLookup:", v9, v5, v8);
  return &v10->super;
}

- (PFMetadata)initWithImageCaptureMovieProperties:(id)a3 contentType:(id)a4 timeZoneLookup:(id)a5
{
  id v8;
  id v9;
  id v10;
  PFMetadataImageCaptureMovieProperties *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;

  v11 = -[PFMetadataImageCaptureMovieProperties initWithImageCaptureMovieProperties:contentType:timeZoneLookup:]([PFMetadataImageCaptureMovieProperties alloc], "initWithImageCaptureMovieProperties:contentType:timeZoneLookup:", v10, v9, v8);
  return &v11->super;
}

- (BOOL)isSameForURL:(id)a3 andOptions:(unsigned __int16)a4
{
  int v4;
  id v6;
  void *v7;
  int v8;

  v4 = a4;
  v6 = a3;
  -[PFMetadata fileURL](self, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v6);

  return v8 && (v4 & ~self->_options) == 0;
}

- (BOOL)configureWithMetadataPlist:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSURL *v8;
  NSURL *fileURL;
  NSDate *v10;
  NSDate *creationDate;
  NSDictionary *v12;
  NSDictionary *fileSystemProperties;
  void *v14;

  if (!a3)
    return 0;
  v4 = (void *)MEMORY[0x1E0C99E98];
  v5 = PFMetadataPlistFilePath;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:", v7);
  v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
  fileURL = self->_fileURL;
  self->_fileURL = v8;

  objc_msgSend(v6, "objectForKeyedSubscript:", PFMetadataPlistCreationDate);
  v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
  creationDate = self->_creationDate;
  self->_creationDate = v10;

  objc_msgSend(v6, "objectForKeyedSubscript:", PFMetadataPlistFileSystemProperties);
  v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  fileSystemProperties = self->_fileSystemProperties;
  self->_fileSystemProperties = v12;

  objc_msgSend(v6, "objectForKeyedSubscript:", PFMetadataPlistSourceType);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  self->_sourceType = objc_msgSend(v14, "integerValue");
  return self->_sourceType != 0;
}

- (PFTimeZoneLookup)timeZoneLookup
{
  PFTimeZoneLookup *cachedTimeZoneLookup;
  PFTimeZoneLookup *v4;
  PFTimeZoneLookup *v5;
  NSObject *v6;
  uint8_t v8[16];

  cachedTimeZoneLookup = self->_cachedTimeZoneLookup;
  if (!cachedTimeZoneLookup)
  {
    v4 = objc_alloc_init(PFTimeZoneLookup);
    v5 = self->_cachedTimeZoneLookup;
    self->_cachedTimeZoneLookup = v4;

    v6 = metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1A16EE000, v6, OS_LOG_TYPE_ERROR, "Initialialized PFMetadata without a PFTimeZoneLookup. It is better performance to use a cached instance.", v8, 2u);
    }
    cachedTimeZoneLookup = self->_cachedTimeZoneLookup;
  }
  return cachedTimeZoneLookup;
}

- (BOOL)doImmediateCompute
{
  return (self->_options >> 6) & 1;
}

- (BOOL)shouldCreateProxy
{
  return (self->_options >> 4) & 1;
}

- (BOOL)noFileAccess
{
  return (self->_options >> 7) & 1;
}

- (BOOL)noOutOfProcess
{
  return HIBYTE(self->_options) & 1;
}

- (BOOL)shouldLookForXmpSidecar
{
  return (self->_options >> 1) & 1;
}

- (BOOL)allowExportForProxy
{
  return (self->_options >> 5) & 1;
}

- (BOOL)shouldLoadValues
{
  return (self->_options >> 3) & 1;
}

- (BOOL)shouldLoadTrackMetadata
{
  return (self->_options >> 2) & 1;
}

- (void)setOptions:(unsigned __int16)a3
{
  self->_options |= a3;
}

- (BOOL)isImage
{
  return 0;
}

- (BOOL)isMovie
{
  return 0;
}

- (NSDictionary)cgImageProperties
{
  return 0;
}

- (CGImageSource)imageSource
{
  return 0;
}

- (NSData)imageData
{
  return 0;
}

- (NSString)livePhotoPairingIdentifier
{
  return 0;
}

- (NSString)cameraMake
{
  return 0;
}

- (NSString)cameraModel
{
  return 0;
}

- (id)software
{
  return 0;
}

- (NSString)originatingAssetIdentifier
{
  return 0;
}

- (NSString)renderOriginatingAssetIdentifier
{
  return 0;
}

- (NSString)captionAbstract
{
  return 0;
}

- (NSString)artworkContentDescription
{
  return 0;
}

- (NSString)spatialOverCaptureIdentifier
{
  return 0;
}

- (BOOL)isSpatialOverCapture
{
  return 0;
}

- (BOOL)isHDR
{
  return 0;
}

- (BOOL)isHDR_TS22028_5
{
  return 0;
}

- (BOOL)isHDR_ExtendedRange
{
  return 0;
}

- (NSString)title
{
  return 0;
}

- (NSArray)keywords
{
  return 0;
}

- (id)altitudeRef
{
  return 0;
}

- (NSNumber)gpsHPositioningError
{
  return 0;
}

- (NSNumber)imageDirection
{
  return 0;
}

- (NSString)imageDirectionRef
{
  return 0;
}

- (NSString)speedRef
{
  return 0;
}

- (BOOL)isSyndicationOriginated
{
  return 0;
}

- (BOOL)isFrontFacingCamera
{
  return 0;
}

- (BOOL)isSpatialMedia
{
  return 0;
}

- (int64_t)spatialVideoRecommendationForImmersiveMode
{
  return 0;
}

- (BOOL)sourceIsImageSourceProxy
{
  return 0;
}

- (BOOL)isScreenshot
{
  return 0;
}

- (NSNumber)hdrGain
{
  return 0;
}

- (NSDictionary)hdrGainMap
{
  return 0;
}

- (BOOL)hasHDRGainMap
{
  return 0;
}

- (NSNumber)hdrGainMapPercentageValue
{
  return 0;
}

- (BOOL)hasISOGainMap
{
  return 0;
}

- (BOOL)isPhotoBooth
{
  return 0;
}

- (NSString)burstUuid
{
  return 0;
}

- (NSString)groupingUuid
{
  return 0;
}

- (NSString)deferredPhotoProcessingIdentifier
{
  return 0;
}

- (NSString)imageCaptureRequestIdentifier
{
  return 0;
}

- (NSString)photoProcessingIdentifier
{
  return 0;
}

- (unint64_t)_stillImageProcessingFlags
{
  return 0;
}

- (BOOL)isPanorama
{
  return 0;
}

- (BOOL)isPortrait
{
  return 0;
}

- (BOOL)hasDepthDataAndIsNotRenderedSDOF
{
  return 0;
}

- (BOOL)isDeferredPhotoProxy
{
  return 0;
}

- (BOOL)isDeferredPhotoProxyExpectingDepth
{
  return 0;
}

- (int64_t)customRendered
{
  return 0;
}

- (CGImageMetadata)cgImageMetadata
{
  return 0;
}

- (BOOL)isSDOF
{
  return 0;
}

- (NSString)ownerName
{
  return 0;
}

- (NSString)firmware
{
  return 0;
}

- (NSNumber)fNumber
{
  return 0;
}

- (NSNumber)exposureBias
{
  return 0;
}

- (NSNumber)brightness
{
  return 0;
}

- (CGColorSpace)cgColorSpace
{
  return 0;
}

- (NSNumber)flashValue
{
  return 0;
}

- (NSNumber)flashCompensation
{
  return 0;
}

- (BOOL)flashFired
{
  return 0;
}

- (NSNumber)focalLength
{
  return 0;
}

- (NSNumber)focalLengthIn35mm
{
  return 0;
}

- (NSNumber)digitalZoomRatio
{
  return 0;
}

- (NSArray)focusPoints
{
  return 0;
}

- (NSNumber)focusMode
{
  return 0;
}

- (NSNumber)focusDistance
{
  return 0;
}

- (NSNumber)iso
{
  return 0;
}

- (NSString)lensModel
{
  return 0;
}

- (NSString)lensMake
{
  return 0;
}

- (NSNumber)lensMinimumMM
{
  return 0;
}

- (NSNumber)lensMaximumMM
{
  return 0;
}

- (NSString)cameraSerialNumber
{
  return 0;
}

- (NSNumber)meteringMode
{
  return 0;
}

- (NSNumber)exposureTime
{
  return 0;
}

- (NSNumber)whiteBalance
{
  return 0;
}

- (NSNumber)whiteBalanceIndex
{
  return 0;
}

- (NSString)profileName
{
  return 0;
}

- (NSNumber)lightSource
{
  return 0;
}

- (NSNumber)GIFDelayTime
{
  return 0;
}

- (NSNumber)HEICSDelayTime
{
  return 0;
}

- (BOOL)isAnimatedImage
{
  void *v3;
  int v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;

  -[PFMetadata contentType](self, "contentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0CEC4F8]);
  if (v4)
  {
    -[PFMetadata GIFDelayTime](self, "GIFDelayTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = 1;
LABEL_9:

      goto LABEL_10;
    }
  }
  -[PFMetadata contentType](self, "contentType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFUniformTypeUtilities heicSequenceType](PFUniformTypeUtilities, "heicSequenceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", v8))
  {
    -[PFMetadata HEICSDelayTime](self, "HEICSDelayTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9 != 0;

  }
  else
  {
    v6 = 0;
  }

  if (v4)
  {
    v5 = 0;
    goto LABEL_9;
  }
LABEL_10:

  return v6;
}

- (unint64_t)photoProcessingFlags
{
  return 0;
}

- (unint64_t)photoCaptureFlags
{
  return 0;
}

- (NSString)portraitInLandscapeCamera
{
  return 0;
}

- (NSString)userComment
{
  return 0;
}

- (NSNumber)semanticStyleToneBias
{
  return 0;
}

- (NSNumber)semanticStyleWarmthBias
{
  return 0;
}

- (NSNumber)semanticStyleRenderingVersion
{
  return 0;
}

- (NSNumber)semanticStylePreset
{
  return 0;
}

- (BOOL)isProRAW
{
  return 0;
}

- (unint64_t)photosAppFeatureFlags
{
  return 0;
}

- (NSNumber)nrfSrlStatus
{
  return 0;
}

- (NSNumber)srlCompensationValue
{
  void *v2;
  void *v3;
  unsigned int v4;
  double v5;
  void *v6;

  -[PFMetadata nrfSrlStatus](self, "nrfSrlStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (v4 = objc_msgSend(v2, "unsignedIntValue"), v4 >= 0x80000001))
  {
    *(float *)&v5 = (float)v4 * 0.0039062;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (signed)smartStyleCast
{
  return 0;
}

- (NSNumber)smartStyleIntensity
{
  return 0;
}

- (NSNumber)smartStyleToneBias
{
  return 0;
}

- (NSNumber)smartStyleColorBias
{
  return 0;
}

- (NSNumber)smartStyleRenderingVersion
{
  return 0;
}

- (BOOL)hasSmartStyle
{
  return 0;
}

- (NSNumber)smartStyleIsReversible
{
  return 0;
}

- (NSNumber)smartStyleExpectingReversibility
{
  return 0;
}

- (NSNumber)generativeAIImageType
{
  return 0;
}

- (NSString)credit
{
  return 0;
}

- (NSData)imageSourceProxyData
{
  return 0;
}

- (BOOL)isThreeImageStereoHEIC
{
  return 0;
}

- (BOOL)isAlchemist
{
  return 0;
}

- (int64_t)cameraUsedForCapture
{
  return 0;
}

- (BOOL)containsSpatialCameraHEIFMetadata
{
  return 0;
}

- (BOOL)containsCustomStylesMetadataBlob
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageDisplayTime
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return self;
}

- (NSNumber)nominalFrameRate
{
  return 0;
}

- (NSNumber)audioDataRate
{
  return 0;
}

- (NSNumber)videoDataRate
{
  return 0;
}

- (NSNumber)audioSampleRate
{
  return 0;
}

- (NSNumber)audioTrackFormat
{
  return 0;
}

- (NSNumber)audioTrackFormatFlags
{
  return 0;
}

- (id)audioBytesPerPacket
{
  return 0;
}

- (id)audioFramesPerPacket
{
  return 0;
}

- (id)audioBytesPerFrame
{
  return 0;
}

- (id)audioChannelsPerFrame
{
  return 0;
}

- (id)audioBitsPerChannel
{
  return 0;
}

- (NSNumber)playbackVariation
{
  return 0;
}

- (BOOL)isAutoLivePhoto
{
  return 0;
}

- (NSNumber)livePhotoVitalityScore
{
  return 0;
}

- (BOOL)hasVitality
{
  return 0;
}

- (BOOL)livePhotoVitalityLimitingAllowed
{
  return 0;
}

- (NSNumber)livePhotoMinimumClientVersion
{
  return 0;
}

- (unsigned)firstVideoTrackCodec
{
  return 0;
}

- (NSString)firstVideoTrackCodecString
{
  return 0;
}

- (NSString)videoCodecName
{
  return 0;
}

- (NSNumber)videoDynamicRange
{
  return 0;
}

- (BOOL)isSloMo
{
  return 0;
}

- (BOOL)isCinematicVideo
{
  return 0;
}

- (BOOL)hasSpatialAudio
{
  return 0;
}

- (BOOL)isTimelapse
{
  return 0;
}

- (BOOL)isActionCam
{
  return 0;
}

- (BOOL)isProRes
{
  return 0;
}

- (NSString)montageString
{
  return 0;
}

- (NSString)author
{
  return 0;
}

- (NSString)captureMode
{
  return 0;
}

- (NSString)firstVideoTrackFormatDebugDescription
{
  return 0;
}

- (UTType)contentTypeFromFastModernizeVideoMedia
{
  return 0;
}

- (NSString)colorPrimaries
{
  return 0;
}

- (NSString)transferFunction
{
  return 0;
}

- (NSNumber)livePhotoVitalityTransitionScore
{
  return 0;
}

- (id)formatDebugDescription
{
  return 0;
}

- (id)firstVideoTrackFullDebugDescription
{
  return 0;
}

- (opaqueCMFormatDescription)videoTrackFormatDescription
{
  return 0;
}

- (BOOL)isPlayable
{
  return 0;
}

- (BOOL)isDecodable
{
  return 0;
}

- (NSNumber)apacAudioTrackChannelCount
{
  return 0;
}

- (NSNumber)apacAudioTrackHoaChannelCount
{
  return 0;
}

- (NSNumber)apacAudioTrackBedChannelCount
{
  return 0;
}

- (NSString)apacAudioTrackCodecProfileLevelDescription
{
  return 0;
}

- (NSString)outOfBandHintsBase64String
{
  return 0;
}

- (NSDictionary)outOfBandHints
{
  return 0;
}

- (PFHEVCProfileInformation)hevcProfileInfo
{
  return 0;
}

- (signed)smartStyleVideoCastValue
{
  return 0;
}

- (NSDictionary)fileSystemProperties
{
  NSDictionary *fileSystemProperties;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSDictionary *v10;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSDictionary *v19;
  NSDictionary *v20;
  uint64_t v21;
  id v22;
  id v23;

  fileSystemProperties = self->_fileSystemProperties;
  if (fileSystemProperties || (self->_options & 0x80) != 0)
  {
    v10 = fileSystemProperties;
  }
  else
  {
    -[PFMetadata fileURL](self, "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[PFMetadata fileURL](self, "fileURL");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      objc_msgSend(MEMORY[0x1E0C99E98], "bookmarkDataWithContentsOfURL:error:", v5, &v23);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v23;
      if (v6)
      {
        v22 = v7;
        objc_msgSend(MEMORY[0x1E0C99E98], "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", v6, 768, v5, 0, &v22);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v22;

        v7 = v9;
      }
      else
      {
        v8 = v5;
      }

      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        objc_msgSend(v12, "attributesOfItemAtPath:error:", v13, &v21);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = *MEMORY[0x1E0CB2A38];
        objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A38]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", -*MEMORY[0x1E0C9ADE8]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqualToDate:", v16))
        {
          v17 = (void *)objc_msgSend(v4, "mutableCopy");
          objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A88]);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, v14);

          v4 = v17;
        }

      }
      else
      {
        v4 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
    v19 = (NSDictionary *)objc_msgSend(v4, "copy");
    v20 = self->_fileSystemProperties;
    self->_fileSystemProperties = v19;

    v10 = self->_fileSystemProperties;
  }
  return v10;
}

- (unint64_t)fileSize
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PFMetadata fileSystemProperties](self, "fileSystemProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AF0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (NSDate)fileCreationDate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[PFMetadata fileSystemProperties](self, "fileSystemProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A38]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[PFMetadata fileSystemProperties](self, "fileSystemProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A88]);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSDate *)v6;
}

- (NSDate)fileModificationDate
{
  void *v2;
  void *v3;

  -[PFMetadata fileSystemProperties](self, "fileSystemProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (UTType)contentType
{
  UTType *contentType;
  NSURL *fileURL;
  UTType *v5;
  id v6;
  UTType *v7;
  NSObject *v8;
  NSURL *v10;
  id v11;
  uint8_t buf[4];
  NSURL *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  contentType = self->_contentType;
  if (contentType)
    return contentType;
  if ((self->_options & 0x80) != 0 || (fileURL = self->_fileURL) == 0)
  {
    contentType = 0;
    return contentType;
  }
  v11 = 0;
  +[PFUniformTypeUtilities typeForURL:error:](PFUniformTypeUtilities, "typeForURL:error:", fileURL, &v11);
  v5 = (UTType *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  v7 = self->_contentType;
  self->_contentType = v5;

  if (!self->_contentType)
  {
    v8 = metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
    {
      v10 = self->_fileURL;
      *(_DWORD *)buf = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v6;
    }
  }

  return self->_contentType;
}

- (id)pixelWidth
{
  NSNumber *pixelWidth;

  pixelWidth = self->_pixelWidth;
  if (!pixelWidth)
  {
    -[PFMetadata _computePixelWidthAndHeightValue](self, "_computePixelWidthAndHeightValue");
    pixelWidth = self->_pixelWidth;
  }
  return pixelWidth;
}

- (id)pixelHeight
{
  NSNumber *pixelHeight;

  pixelHeight = self->_pixelHeight;
  if (!pixelHeight)
  {
    -[PFMetadata _computePixelWidthAndHeightValue](self, "_computePixelWidthAndHeightValue");
    pixelHeight = self->_pixelHeight;
  }
  return pixelHeight;
}

- (CGSize)exifPixelSize
{
  void *v3;
  float v4;
  double v5;
  void *v6;
  float v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[PFMetadata pixelWidth](self, "pixelWidth");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;
  -[PFMetadata pixelHeight](self, "pixelHeight");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  v9 = v5;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)orientedPixelSize
{
  int64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v3 = -[PFMetadata orientation](self, "orientation");
  -[PFMetadata exifPixelSize](self, "exifPixelSize");
  if ((unint64_t)(v3 - 5) >= 4)
    v6 = v4;
  else
    v6 = v5;
  if ((unint64_t)(v3 - 5) < 4)
    v5 = v4;
  v7 = v6;
  result.height = v5;
  result.width = v7;
  return result;
}

- (int64_t)orientation
{
  int64_t result;

  result = self->_orientation;
  if (!result)
  {
    -[PFMetadata _computeOrientationValue](self, "_computeOrientationValue");
    return self->_orientation;
  }
  return result;
}

- (NSDate)utcCreationDate
{
  NSDate *utcCreationDate;

  utcCreationDate = self->_utcCreationDate;
  if (!utcCreationDate)
  {
    -[PFMetadata computeDateTimeValues](self, "computeDateTimeValues");
    utcCreationDate = self->_utcCreationDate;
  }
  return utcCreationDate;
}

- (int64_t)creationDateSource
{
  if (!self->_creationDate)
    -[PFMetadata computeDateTimeValues](self, "computeDateTimeValues");
  return self->_creationDateSource;
}

- (NSDate)creationDate
{
  NSDate *creationDate;

  creationDate = self->_creationDate;
  if (!creationDate)
  {
    -[PFMetadata computeDateTimeValues](self, "computeDateTimeValues");
    creationDate = self->_creationDate;
  }
  return creationDate;
}

- (NSTimeZone)timeZone
{
  NSTimeZone *timeZone;

  timeZone = self->_timeZone;
  if (!timeZone)
  {
    -[PFMetadata computeDateTimeValues](self, "computeDateTimeValues");
    timeZone = self->_timeZone;
  }
  return timeZone;
}

- (NSString)timeZoneName
{
  void *v2;
  void *v3;

  -[PFMetadata timeZone](self, "timeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSNumber)timeZoneOffset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[PFMetadata timeZone](self, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFMetadata creationDate](self, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "secondsFromGMTForDate:", v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v6;
}

- (NSString)creationDateString
{
  NSString *creationDateString;

  creationDateString = self->_creationDateString;
  if (!creationDateString)
  {
    -[PFMetadata computeDateTimeValues](self, "computeDateTimeValues");
    creationDateString = self->_creationDateString;
  }
  return creationDateString;
}

- (CLLocation)gpsLocation
{
  CLLocation *gpsLocation;

  gpsLocation = self->_gpsLocation;
  if (!gpsLocation)
  {
    -[PFMetadata _computeGPSLocation](self, "_computeGPSLocation");
    gpsLocation = self->_gpsLocation;
  }
  return gpsLocation;
}

- (NSDate)gpsDateTime
{
  NSDate *gpsDateTime;

  gpsDateTime = self->_gpsDateTime;
  if (!gpsDateTime)
  {
    -[PFMetadata computeGPSValues](self, "computeGPSValues");
    gpsDateTime = self->_gpsDateTime;
  }
  return gpsDateTime;
}

- (NSNumber)longitude
{
  NSNumber *longitude;

  longitude = self->_longitude;
  if (!longitude)
  {
    -[PFMetadata computeGPSValues](self, "computeGPSValues");
    longitude = self->_longitude;
  }
  return longitude;
}

- (NSNumber)latitude
{
  NSNumber *latitude;

  latitude = self->_latitude;
  if (!latitude)
  {
    -[PFMetadata computeGPSValues](self, "computeGPSValues");
    latitude = self->_latitude;
  }
  return latitude;
}

- (NSNumber)altitude
{
  NSNumber *altitude;

  altitude = self->_altitude;
  if (!altitude)
  {
    -[PFMetadata computeGPSValues](self, "computeGPSValues");
    altitude = self->_altitude;
  }
  return altitude;
}

- (NSNumber)speed
{
  NSNumber *speed;

  speed = self->_speed;
  if (!speed)
  {
    -[PFMetadata computeGPSValues](self, "computeGPSValues");
    speed = self->_speed;
  }
  return speed;
}

- (NSString)originalFileName
{
  void *v2;
  void *v3;

  -[PFMetadata fileURL](self, "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)syndicationProperties
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PFMetadata _addCommonPropertiesToSyndicationProperties:](self, "_addCommonPropertiesToSyndicationProperties:", v3);
  -[PFMetadata _addImagePropertiesToSyndicationProperties:](self, "_addImagePropertiesToSyndicationProperties:", v3);
  -[PFMetadata _addMoviePropertiesToSyndicationProperties:](self, "_addMoviePropertiesToSyndicationProperties:", v3);
  return (NSDictionary *)v3;
}

- (void)_addCommonPropertiesToSyndicationProperties:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  -[PFMetadata contentType](self, "contentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v5, CFSTR("uti"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PFMetadata fileSize](self, "fileSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && *MEMORY[0x1E0CB2AF0])
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v6);

  -[PFMetadata originalFileName](self, "originalFileName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v7, CFSTR("originalFilename"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[PFMetadata exifPixelSize](self, "exifPixelSize");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && *MEMORY[0x1E0CBD048])
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v9);

  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[PFMetadata exifPixelSize](self, "exifPixelSize");
  objc_msgSend(v10, "numberWithDouble:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && *MEMORY[0x1E0CBD040])
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PFMetadata orientation](self, "orientation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && *MEMORY[0x1E0CBCFF0])
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v13);

  -[PFMetadata lensModel](self, "lensModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && *MEMORY[0x1E0CBCBE0])
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v14);

  -[PFMetadata lensMake](self, "lensMake");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && *MEMORY[0x1E0CBCBD8])
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v15);

  -[PFMetadata _dateTimeOriginalForSyndicationProperties](self, "_dateTimeOriginalForSyndicationProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v16, CFSTR("creationDate"));

  -[PFMetadata _dateTimeOffsetOriginalForSyndicationProperties](self, "_dateTimeOffsetOriginalForSyndicationProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v17, CFSTR("timeZoneOffset"));

  -[PFMetadata _dateTimeSubsecOriginalForSyndicationProperties](self, "_dateTimeSubsecOriginalForSyndicationProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 && *MEMORY[0x1E0CBCCA0])
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v18);

  -[PFMetadata cameraModel](self, "cameraModel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19 && *MEMORY[0x1E0CBD0B8])
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v19);

  -[PFMetadata cameraMake](self, "cameraMake");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20 && *MEMORY[0x1E0CBD0B0])
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v20);

  -[PFMetadata longitude](self, "longitude");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21 && *MEMORY[0x1E0CBCDA0])
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v21);

  -[PFMetadata latitude](self, "latitude");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22 && *MEMORY[0x1E0CBCD90])
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v22);

  -[PFMetadata spatialOverCaptureIdentifier](self, "spatialOverCaptureIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("socIdentifier"));

}

- (void)_addImagePropertiesToSyndicationProperties:(id)a3
{
  id v4;

  v4 = a3;
  -[PFMetadata _addImageSemanticStylePropertiesToSyndicationProperties:](self, "_addImageSemanticStylePropertiesToSyndicationProperties:", v4);
  -[PFMetadata _addImageLivePhotoPropertiesToSyndicationProperties:](self, "_addImageLivePhotoPropertiesToSyndicationProperties:", v4);
  -[PFMetadata _addImageMiscPropertiesToSyndicationProperties:](self, "_addImageMiscPropertiesToSyndicationProperties:", v4);
  -[PFMetadata _addImageGPSPropertiesToSyndicationProperties:](self, "_addImageGPSPropertiesToSyndicationProperties:", v4);
  -[PFMetadata _addImageSmartStylePropertiesToSyndicationProperties:](self, "_addImageSmartStylePropertiesToSyndicationProperties:", v4);

}

- (void)_addImageSemanticStylePropertiesToSyndicationProperties:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PFMetadata semanticStyleToneBias](self, "semanticStyleToneBias");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v4, CFSTR("semanticStyleToneBias"));

  -[PFMetadata semanticStyleWarmthBias](self, "semanticStyleWarmthBias");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, CFSTR("semanticStyleWarmthBias"));

  -[PFMetadata semanticStyleRenderingVersion](self, "semanticStyleRenderingVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("semanticStyleRenderingVersion"));

  -[PFMetadata semanticStylePreset](self, "semanticStylePreset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("semanticStylePreset"));

}

- (void)_addImageMiscPropertiesToSyndicationProperties:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  v39 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PFMetadata isFrontFacingCamera](self, "isFrontFacingCamera"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v4, CFSTR("kPFImagePropertyFrontFacingCamera"));

  -[PFMetadata focalLengthIn35mm](self, "focalLengthIn35mm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && *MEMORY[0x1E0CBCB98])
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v5);

  -[PFMetadata digitalZoomRatio](self, "digitalZoomRatio");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && *MEMORY[0x1E0CBCB58])
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v6);

  -[PFMetadata profileName](self, "profileName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && *MEMORY[0x1E0CBD060])
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PFMetadata photoProcessingFlags](self, "photoProcessingFlags"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v8, CFSTR("photoProcessingFlags"));

  if (-[PFMetadata hasCustomRendered](self, "hasCustomRendered"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PFMetadata customRendered](self, "customRendered"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && *MEMORY[0x1E0CBCB30])
      objc_msgSend(v39, "setObject:forKeyedSubscript:", v9);

  }
  -[PFMetadata fNumber](self, "fNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && *MEMORY[0x1E0CBCB80])
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v10);

  -[PFMetadata exposureBias](self, "exposureBias");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && *MEMORY[0x1E0CBCB60])
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v11);

  -[PFMetadata flashValue](self, "flashValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && *MEMORY[0x1E0CBCB88])
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PFMetadata flashFired](self, "flashFired"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v13, CFSTR("flashFired"));

  -[PFMetadata flashCompensation](self, "flashCompensation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && *MEMORY[0x1E0CBCA38])
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v14);

  -[PFMetadata focalLength](self, "focalLength");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && *MEMORY[0x1E0CBCBA0])
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v15);

  -[PFMetadata iso](self, "iso");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 && *MEMORY[0x1E0CBCBC0])
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v16);

  -[PFMetadata meteringMode](self, "meteringMode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 && *MEMORY[0x1E0CBCC08])
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v17);

  -[PFMetadata exposureTime](self, "exposureTime");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 && *MEMORY[0x1E0CBCB78])
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v18);

  -[PFMetadata whiteBalance](self, "whiteBalance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19 && *MEMORY[0x1E0CBCCC0])
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v19);

  -[PFMetadata lightSource](self, "lightSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20 && *MEMORY[0x1E0CBCBF8])
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v20);

  -[PFMetadata whiteBalanceIndex](self, "whiteBalanceIndex");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21 && *MEMORY[0x1E0CBC8C0])
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v21);

  -[PFMetadata GIFDelayTime](self, "GIFDelayTime");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22 && *MEMORY[0x1E0CBCCD8])
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v22);

  -[PFMetadata HEICSDelayTime](self, "HEICSDelayTime");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23 && *MEMORY[0x1E0CBCE78])
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v23);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PFMetadata isHDR](self, "isHDR"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v24, CFSTR("isHDR"));

  -[PFMetadata hdrGain](self, "hdrGain");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v25, CFSTR("hdrGain"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PFMetadata hasHDRGainMap](self, "hasHDRGainMap"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v26, CFSTR("hasHDRGainMap"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PFMetadata isPhotoBooth](self, "isPhotoBooth"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v27, CFSTR("isPhotoBooth"));

  -[PFMetadata userComment](self, "userComment");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28 && *MEMORY[0x1E0CBCCB0])
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v28);

  -[PFMetadata burstUuid](self, "burstUuid");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v29, CFSTR("burstUuid"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PFMetadata hasISOGainMap](self, "hasISOGainMap"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v30, CFSTR("hasISOGainMap"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PFMetadata isAnimatedImage](self, "isAnimatedImage"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v31, CFSTR("isAnimatedImage"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PFMetadata photoCaptureFlags](self, "photoCaptureFlags"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v32, CFSTR("stillImageCaptureFlags"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PFMetadata cameraUsedForCapture](self, "cameraUsedForCapture"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v33, CFSTR("cameraUsedForCapture"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PFMetadata hasSpatialAudio](self, "hasSpatialAudio"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v34, CFSTR("hasSpatialAudio"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PFMetadata isAlchemist](self, "isAlchemist"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v35, CFSTR("isAlchemist"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PFMetadata isThreeImageStereoHEIC](self, "isThreeImageStereoHEIC"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v36, CFSTR("isThreeImageStereoHEIC"));

  -[PFMetadata generativeAIImageType](self, "generativeAIImageType");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v37, CFSTR("generativeAIImageType"));

  -[PFMetadata credit](self, "credit");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38 && *MEMORY[0x1E0CBCEC8])
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v38);

}

- (void)_addImageLivePhotoPropertiesToSyndicationProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PFMetadata duration](self, "duration");
  -[PFMetadata stillImageDisplayTime](self, "stillImageDisplayTime");
  -[PFMetadata livePhotoPairingIdentifier](self, "livePhotoPairingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("livePhotoParingIdentifier"));

  -[PFMetadata playbackVariation](self, "playbackVariation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("playbackVariation"));

}

- (void)_addImageGPSPropertiesToSyndicationProperties:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[PFMetadata speed](self, "speed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && *MEMORY[0x1E0CBCDD0])
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v4);

  -[PFMetadata speedRef](self, "speedRef");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && *MEMORY[0x1E0CBCDD8])
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v5);

  -[PFMetadata gpsDateTime](self, "gpsDateTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, CFSTR("gpsDateTime"));

  -[PFMetadata gpsHPositioningError](self, "gpsHPositioningError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && *MEMORY[0x1E0CBCD78])
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v7);

  -[PFMetadata altitude](self, "altitude");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && *MEMORY[0x1E0CBCD00])
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8);

  -[PFMetadata imageDirection](self, "imageDirection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && *MEMORY[0x1E0CBCD80])
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9);

  -[PFMetadata imageDirectionRef](self, "imageDirectionRef");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && *MEMORY[0x1E0CBCD88])
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10);

}

- (void)_addImageSmartStylePropertiesToSyndicationProperties:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[PFMetadata smartStyleCast](self, "smartStyleCast"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v4, CFSTR("smartStyleCast"));

  -[PFMetadata smartStyleIntensity](self, "smartStyleIntensity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v5, CFSTR("smartStyleIntensity"));

  -[PFMetadata smartStyleToneBias](self, "smartStyleToneBias");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, CFSTR("smartStyleToneBias"));

  -[PFMetadata smartStyleColorBias](self, "smartStyleColorBias");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, CFSTR("smartStyleColorBias"));

  -[PFMetadata smartStyleRenderingVersion](self, "smartStyleRenderingVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, CFSTR("smartStyleRenderingVersion"));

  -[PFMetadata smartStyleIsReversible](self, "smartStyleIsReversible");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("smartStyleIsReversible"));

  -[PFMetadata smartStyleExpectingReversibility](self, "smartStyleExpectingReversibility");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, CFSTR("smartStyleExpectingReversibility"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PFMetadata hasSmartStyle](self, "hasSmartStyle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("hasSmartStyle"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[PFMetadata smartStyleVideoCastValue](self, "smartStyleVideoCastValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("smartStyleVideoCastValue"));

}

- (void)_addMoviePropertiesToSyndicationProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[PFMetadata videoDynamicRange](self, "videoDynamicRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("videoDynamicRange"));

  if (-[PFMetadata isCinematicVideo](self, "isCinematicVideo"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PFMetadata isCinematicVideo](self, "isCinematicVideo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("videoContainsCinematicData"));

  }
  -[PFMetadata duration](self, "duration");
  -[PFMetadata nominalFrameRate](self, "nominalFrameRate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("framesPerSecond"));

  -[PFMetadata firstVideoTrackCodecString](self, "firstVideoTrackCodecString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("fourCharCode"));

  -[PFMetadata captureMode](self, "captureMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("com.apple.photos.captureMode"));

  -[PFMetadata montageString](self, "montageString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("isMontage"));

  -[PFMetadata audioDataRate](self, "audioDataRate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("estimatedDataRate"));

  -[PFMetadata audioTrackFormat](self, "audioTrackFormat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("audioTrackFormat"));

  -[PFMetadata audioSampleRate](self, "audioSampleRate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("audioTrackSampleRate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PFMetadata isProRes](self, "isProRes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("isProRes"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PFMetadata isTimelapse](self, "isTimelapse"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("Time-lapse"));

}

- (BOOL)hasCustomRendered
{
  return -[PFMetadata customRendered](self, "customRendered") != 0;
}

- (NSString)defaultProfileName
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[PFMetadata profileName](self, "profileName");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("sRGB IEC61966-2.1");
  v4 = v2;

  return v4;
}

- (NSNumber)durationTimeInterval
{
  void *v2;
  CMTime v4[2];

  memset(&v4[1], 0, sizeof(CMTime));
  -[PFMetadata duration](self, "duration");
  v2 = 0;
  if ((v4[1].flags & 1) != 0)
  {
    v4[0] = v4[1];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CMTimeGetSeconds(v4));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)v2;
}

- (BOOL)isAutoloop
{
  void *v2;
  BOOL v3;

  -[PFMetadata playbackVariation](self, "playbackVariation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue") == 1;

  return v3;
}

- (BOOL)isMirror
{
  void *v2;
  BOOL v3;

  -[PFMetadata playbackVariation](self, "playbackVariation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue") == 2;

  return v3;
}

- (BOOL)isLongExposure
{
  void *v2;
  BOOL v3;

  -[PFMetadata playbackVariation](self, "playbackVariation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue") == 3;

  return v3;
}

- (BOOL)isLoopingVideo
{
  return -[PFMetadata isAutoloop](self, "isAutoloop") || -[PFMetadata isMirror](self, "isMirror");
}

- (void)_computePixelWidthAndHeightValue
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  float v8;
  float v9;
  uint64_t v10;
  void *v11;
  float v12;
  uint64_t v13;
  void *v14;
  float v15;
  double Width;
  double Height;
  NSNumber *v18;
  NSNumber *pixelWidth;
  NSNumber *v20;
  NSNumber *pixelHeight;
  PFMetadataTypeVerifier *typeVerifier;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  float v27;
  float v28;
  PFMetadataTypeVerifier *v29;
  void *v30;
  void *v31;
  void *v32;
  float v33;
  float v34;
  CGImageSource *v35;
  const __CFDictionary *v36;
  CGImage *ImageAtIndex;
  void *v38;
  const __CFURL *v39;
  const __CFDictionary *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[2];
  _QWORD v50[3];

  v50[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata _makeGeometryProperties](self, "_makeGeometryProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFMetadataTypeVerifier valueForKey:fromProperties:](self->_typeVerifier, "valueForKey:fromProperties:", *MEMORY[0x1E0CBD048], v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  -[PFMetadataTypeVerifier valueForKey:fromProperties:](self->_typeVerifier, "valueForKey:fromProperties:", *MEMORY[0x1E0CBD040], v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  if (v6 != 0.0 && v9 != 0.0)
    goto LABEL_5;
  v10 = *MEMORY[0x1E0CBCC28];
  -[PFMetadataTypeVerifier valueForKey:fromProperties:](self->_typeVerifier, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCC28], v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v6 = v12;

  v13 = *MEMORY[0x1E0CBCC30];
  -[PFMetadataTypeVerifier valueForKey:fromProperties:](self->_typeVerifier, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCC30], v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v9 = v15;

  if (v6 != 0.0 && v9 != 0.0)
  {
LABEL_5:
    Width = v6;
    Height = v9;
    goto LABEL_6;
  }
  typeVerifier = self->_typeVerifier;
  v50[0] = *MEMORY[0x1E0CBCB50];
  v23 = v50[0];
  v50[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "componentsJoinedByString:", CFSTR("."));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFMetadataTypeVerifier valueForKeyPath:fromProperties:](typeVerifier, "valueForKeyPath:fromProperties:", v25, v3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "floatValue");
  v28 = v27;
  Width = v27;

  v29 = self->_typeVerifier;
  v49[0] = v23;
  v49[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "componentsJoinedByString:", CFSTR("."));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFMetadataTypeVerifier valueForKeyPath:fromProperties:](v29, "valueForKeyPath:fromProperties:", v31, v3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "floatValue");
  v34 = v33;
  Height = v33;

  if (v28 == 0.0 || v34 == 0.0)
  {
    v35 = -[PFMetadata imageSource](self, "imageSource");
    if (v35)
      goto LABEL_10;
    -[PFMetadata fileURL](self, "fileURL");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v38)
      goto LABEL_6;
    -[PFMetadata fileURL](self, "fileURL");
    v39 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v47 = *MEMORY[0x1E0CBD178];
    v48 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v40 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v35 = CGImageSourceCreateWithURL(v39, v40);

    if (v35)
    {
      CFAutorelease(v35);
LABEL_10:
      +[PFMetadataImage defaultOptionsForCGImageSource](PFMetadataImage, "defaultOptionsForCGImageSource");
      v36 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v35, 0, v36);

      if (ImageAtIndex)
      {
        Width = (double)CGImageGetWidth(ImageAtIndex);
        Height = (double)CGImageGetHeight(ImageAtIndex);
        CGImageRelease(ImageAtIndex);
      }
      goto LABEL_6;
    }
    v41 = (void *)metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
    {
      v42 = v41;
      -[PFMetadata fileURL](self, "fileURL");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "path");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 138412290;
      v46 = v44;
      _os_log_error_impl(&dword_1A16EE000, v42, OS_LOG_TYPE_ERROR, "Unable to create image source for %@", (uint8_t *)&v45, 0xCu);

    }
  }
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", Width);
  v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  pixelWidth = self->_pixelWidth;
  self->_pixelWidth = v18;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", Height);
  v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  pixelHeight = self->_pixelHeight;
  self->_pixelHeight = v20;

}

- (void)_computeOrientationValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata _makeGeometryProperties](self, "_makeGeometryProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFMetadata typeVerifier](self, "typeVerifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCFF0], v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[PFMetadata typeVerifier](self, "typeVerifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0CBD0C0];
    v12[0] = *MEMORY[0x1E0CBD090];
    v12[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR("."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForKeyPath:fromProperties:", v9, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v10 = objc_msgSend(v5, "integerValue");
  if ((unint64_t)(v10 - 1) >= 8)
    v11 = 1;
  else
    v11 = v10;
  self->_orientation = v11;

}

- (void)computeDateTimeValues
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  -[PFMetadata _makeDateTimeProperties](self, "_makeDateTimeProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = 0;
  v7 = 0;
  -[PFMetadata _computeSubSecondString:timeZoneOffsetString:unqualifiedDateString:fromProperties:](self, "_computeSubSecondString:timeZoneOffsetString:unqualifiedDateString:fromProperties:", &v9, &v8, &v7, v3);
  v4 = v9;
  v5 = v8;
  v6 = v7;
  -[PFMetadata _computeTimeZoneFromString:](self, "_computeTimeZoneFromString:", v5);
  -[PFMetadata _computeUnqualifiedDateFromDateString:subSecondString:](self, "_computeUnqualifiedDateFromDateString:subSecondString:", v6, v4);

}

- (void)_computeSubSecondString:(id *)a3 timeZoneOffsetString:(id *)a4 unqualifiedDateString:(id *)a5 fromProperties:(id)a6
{
  void *v10;
  id v11;
  PFMetadataTypeVerifier *typeVerifier;
  PFMetadataTypeVerifier *v13;
  _QWORD *v14;
  id v15;
  PFMetadataTypeVerifier *v16;
  void *v17;
  id v18;

  v18 = a6;
  -[PFMetadataTypeVerifier valueForKey:fromProperties:](self->_typeVerifier, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCB50]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFMetadataTypeVerifier valueForKey:fromProperties:](self->_typeVerifier, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCB40], v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  *a5 = v11;
  typeVerifier = self->_typeVerifier;
  if (v11)
  {
    -[PFMetadataTypeVerifier valueForKey:fromProperties:](typeVerifier, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCCA0], v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    v13 = self->_typeVerifier;
    v14 = (_QWORD *)MEMORY[0x1E0CBCC20];
  }
  else
  {
    -[PFMetadataTypeVerifier valueForKey:fromProperties:](typeVerifier, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCB38], v10);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    *a5 = v15;
    v16 = self->_typeVerifier;
    if (!v15)
    {
      -[PFMetadataTypeVerifier valueForKey:fromProperties:](v16, "valueForKey:fromProperties:", *MEMORY[0x1E0CBD090], v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PFMetadataTypeVerifier valueForKey:fromProperties:](self->_typeVerifier, "valueForKey:fromProperties:", *MEMORY[0x1E0CBD088], v17);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    -[PFMetadataTypeVerifier valueForKey:fromProperties:](v16, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCC98], v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    v13 = self->_typeVerifier;
    v14 = (_QWORD *)MEMORY[0x1E0CBCC18];
  }
  -[PFMetadataTypeVerifier valueForKey:fromProperties:](v13, "valueForKey:fromProperties:", *v14, v10);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:

}

- (void)_computeTimeZoneFromString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  NSTimeZone *v16;
  NSTimeZone *timeZone;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  CLLocationDegrees v23;
  CLLocationDegrees v24;
  CLLocationCoordinate2D v25;
  void *v26;
  void *v27;
  NSTimeZone *v28;
  NSTimeZone *v29;
  NSTimeZone *v30;
  NSTimeZone *v31;
  int v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(":"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 2)
    {
      objc_msgSend(v6, "objectAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v9 = v8;
      v10 = (uint64_t)v8;

      if (v10 >= 0)
        v11 = 1.0;
      else
        v11 = -1.0;
      v12 = (uint64_t)(v11 * (double)(uint64_t)v9);
      objc_msgSend(v6, "objectAtIndex:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v15 = v14;

      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", (uint64_t)(v11 * ((double)(3600 * v12) + v15 * 60.0)));
      v16 = (NSTimeZone *)objc_claimAutoreleasedReturnValue();
      timeZone = self->_timeZone;
      self->_timeZone = v16;

    }
    else
    {
      v18 = metadataLog;
      if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG))
      {
        v32 = 138412290;
        v33 = v5;
        _os_log_debug_impl(&dword_1A16EE000, v18, OS_LOG_TYPE_DEBUG, "ERROR: timezone offset string has invalid format (%@).", (uint8_t *)&v32, 0xCu);
      }
    }

  }
  if (!self->_timeZone)
  {
    if ((self->_options & 0x80) != 0)
      goto LABEL_18;
    -[PFMetadata longitude](self, "longitude");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFMetadata latitude](self, "latitude");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19 && v20)
    {
      objc_msgSend(v20, "doubleValue");
      v23 = v22;
      objc_msgSend(v19, "doubleValue");
      v25 = CLLocationCoordinate2DMake(v23, v24);
      -[PFMetadata timeZoneLookup](self, "timeZoneLookup");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "timeZoneNameForCoordinate:", v25.latitude, v25.longitude);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v27);
        v28 = (NSTimeZone *)objc_claimAutoreleasedReturnValue();
        v29 = self->_timeZone;
        self->_timeZone = v28;

      }
    }

    if (!self->_timeZone)
    {
LABEL_18:
      objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
      v30 = (NSTimeZone *)objc_claimAutoreleasedReturnValue();
      v31 = self->_timeZone;
      self->_timeZone = v30;

    }
  }

}

- (void)_computeUnqualifiedDateFromDateString:(id)a3 subSecondString:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *creationDateString;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  NSDate *v18;
  NSDate *utcCreationDate;
  NSDate *v20;
  NSDate *v21;
  NSDate *v22;
  NSTimeZone *v23;
  NSTimeZone *timeZone;
  NSTimeZone *v25;
  NSDate *v26;
  NSDate *creationDate;
  NSString *v28;
  NSString *v29;
  id v30;

  v30 = a3;
  v7 = a4;
  if (v30)
  {
    objc_storeStrong((id *)&self->_creationDateString, a3);
    PFGMTTimeZone();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PFDateFromStringTimeZoneFormat(v30, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    self->_creationDateSource = 1;
  }
  else
  {
    v9 = 0;
  }
  -[PFMetadata gpsDateTime](self, "gpsDateTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v9 && v10)
  {
    PFStringFromDateTimeZoneFormat(v10, self->_timeZone, 0);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    creationDateString = self->_creationDateString;
    self->_creationDateString = v12;

    PFDateFromGMTDateTimeZone(v11, self->_timeZone);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_creationDateSource = 2;
  }
  if (v9)
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0.%@"), v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      v16 = v15;

      objc_msgSend(v9, "dateByAddingTimeInterval:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v17;
    }
    PFGMTDateFromDateTimeZone(v9, self->_timeZone);
    v18 = (NSDate *)objc_claimAutoreleasedReturnValue();
    utcCreationDate = self->_utcCreationDate;
    self->_utcCreationDate = v18;

  }
  v20 = self->_utcCreationDate;
  if (v20)
    goto LABEL_13;
  -[PFMetadata fileCreationDate](self, "fileCreationDate");
  v21 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v22 = self->_utcCreationDate;
  self->_utcCreationDate = v21;

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v23 = (NSTimeZone *)objc_claimAutoreleasedReturnValue();
  timeZone = self->_timeZone;
  self->_timeZone = v23;

  self->_creationDateSource = 3;
  v20 = self->_utcCreationDate;
  if (v20)
  {
LABEL_13:
    v25 = self->_timeZone;
    if (v25)
    {
      PFDateFromGMTDateTimeZone(v20, v25);
      v26 = (NSDate *)objc_claimAutoreleasedReturnValue();
      creationDate = self->_creationDate;
      self->_creationDate = v26;

      if (!self->_creationDateString)
      {
        PFStringFromDate(self->_creationDate);
        v28 = (NSString *)objc_claimAutoreleasedReturnValue();
        v29 = self->_creationDateString;
        self->_creationDateString = v28;

      }
    }
  }

}

- (void)_computeGPSLocation
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  CLLocation *v23;
  CLLocation *gpsLocation;
  id v25;

  -[PFMetadata latitude](self, "latitude");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[PFMetadata longitude](self, "longitude");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25 && v3)
  {
    objc_msgSend(v25, "doubleValue");
    v5 = v4;
    objc_msgSend(v3, "doubleValue");
    v7 = v6;
    -[PFMetadata gpsHPositioningError](self, "gpsHPositioningError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;

    if (v10 == 0.0)
      v10 = -1.0;
    v11 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    -[PFMetadata altitude](self, "altitude");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;
    -[PFMetadata imageDirection](self, "imageDirection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;
    -[PFMetadata speed](self, "speed");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;
    -[PFMetadata gpsDateTime](self, "gpsDateTime");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (!v21)
    {
      -[PFMetadata creationDate](self, "creationDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23 = (CLLocation *)objc_msgSend(v11, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v22, v5, v7, v14, v10, 0.0, v17, v20);
    gpsLocation = self->_gpsLocation;
    self->_gpsLocation = v23;

    if (!v21)
  }

}

- (void)computeGPSValues
{
  id v3;

  -[PFMetadata _makeGPSProperties](self, "_makeGPSProperties");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PFMetadata _computeLattitudeLongitude:](self, "_computeLattitudeLongitude:", v3);
  -[PFMetadata _computeGPSTimeStamp:](self, "_computeGPSTimeStamp:", v3);
  -[PFMetadata _computeAlttitude:](self, "_computeAlttitude:", v3);
  -[PFMetadata _computeSpeed:](self, "_computeSpeed:", v3);

}

- (void)_computeLattitudeLongitude:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  double v14;
  double v15;
  void *v16;
  void *v17;
  NSNumber *v18;
  NSNumber *latitude;
  double v20;
  double v21;
  void *v22;
  NSNumber *v23;
  NSNumber *longitude;
  id v25;
  CLLocationCoordinate2D v26;

  v25 = a3;
  -[PFMetadataTypeVerifier valueForKey:fromProperties:](self->_typeVerifier, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCD90], v25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFMetadataTypeVerifier valueForKey:fromProperties:](self->_typeVerifier, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCDA0], v25);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    objc_msgSend(v4, "doubleValue");
    v9 = v8;
    objc_msgSend(v6, "doubleValue");
    v11 = v10;
    v26.latitude = v9;
    v26.longitude = v11;
    if (CLLocationCoordinate2DIsValid(v26))
    {
      v12 = v9 != 0.0;
      if (v11 != 0.0)
        v12 = 1;
      if (v12 && (v9 != 40.0 || v11 != -100.0))
      {
        objc_msgSend(v4, "doubleValue");
        v15 = v14;
        -[PFMetadataTypeVerifier valueForKey:fromProperties:](self->_typeVerifier, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCD98], v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16 && (objc_msgSend(v16, "isEqualToString:", CFSTR("S")) & (v15 > 0.0)) != 0)
          v15 = -v15;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
        v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        latitude = self->_latitude;
        self->_latitude = v18;

        objc_msgSend(v6, "doubleValue");
        v21 = v20;
        -[PFMetadataTypeVerifier valueForKey:fromProperties:](self->_typeVerifier, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCDA8], v25);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22 && (objc_msgSend(v22, "isEqualToString:", CFSTR("W")) & (v21 > 0.0)) != 0)
          v21 = -v21;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
        v23 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        longitude = self->_longitude;
        self->_longitude = v23;

      }
    }
  }

}

- (void)_computeGPSTimeStamp:(id)a3
{
  PFMetadataTypeVerifier *typeVerifier;
  uint64_t v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  NSDate *v11;
  void *v12;
  NSDate *gpsDateTime;
  id v14;

  typeVerifier = self->_typeVerifier;
  v5 = *MEMORY[0x1E0CBCDE8];
  v6 = a3;
  -[PFMetadataTypeVerifier valueForKey:fromProperties:](typeVerifier, "valueForKey:fromProperties:", v5, v6);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[PFMetadataTypeVerifier valueForKey:fromProperties:](self->_typeVerifier, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCD20], v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v14 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v7, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PFGMTTimeZone();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PFDateFromStringTimeZoneFormat(v9, v10, CFSTR("yyyy:MM:dd HH:mm:ss.SSSS"));
    v11 = (NSDate *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      PFGMTTimeZone();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PFDateFromStringTimeZoneFormat(v9, v12, 0);
      v11 = (NSDate *)objc_claimAutoreleasedReturnValue();

    }
    gpsDateTime = self->_gpsDateTime;
    self->_gpsDateTime = v11;

  }
}

- (void)_computeAlttitude:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v12;
  id v13;

  v13 = a3;
  -[PFMetadataTypeVerifier valueForKey:fromProperties:](self->_typeVerifier, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCD00]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    v7 = v6;
    -[PFMetadataTypeVerifier valueForKey:fromProperties:](self->_typeVerifier, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCD08], v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "integerValue");
      if (v7 > 0.0 && v10 == 1)
        v7 = -v7;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFMetadata setAltitude:](self, "setAltitude:", v12);

  }
}

- (void)_computeSpeed:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  int v11;
  void *v12;
  id v13;

  v13 = a3;
  -[PFMetadataTypeVerifier valueForKey:fromProperties:](self->_typeVerifier, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCDD0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    v7 = v6;
    -[PFMetadataTypeVerifier valueForKey:fromProperties:](self->_typeVerifier, "valueForKey:fromProperties:", *MEMORY[0x1E0CBCDD8], v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("K")) & 1) != 0)
      {
        v10 = 0.277777778;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("M")) & 1) != 0)
      {
        v10 = 0.44704;
      }
      else
      {
        v11 = objc_msgSend(v9, "isEqualToString:", CFSTR("N"));
        v10 = 0.51444;
        if (!v11)
          v10 = 1.0;
      }
    }
    else
    {
      v10 = 1.0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7 * v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFMetadata setSpeed:](self, "setSpeed:", v12);

  }
}

- (id)_makeGPSProperties
{
  return 0;
}

- (id)_makeDateTimeProperties
{
  return 0;
}

- (id)_makeGeometryProperties
{
  return 0;
}

- (id)_dateTimeOriginalForSyndicationProperties
{
  void *v3;
  PFMetadataTypeVerifier *typeVerifier;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata _makeDateTimeProperties](self, "_makeDateTimeProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  typeVerifier = self->_typeVerifier;
  v5 = *MEMORY[0x1E0CBCB40];
  v11[0] = *MEMORY[0x1E0CBCB50];
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFMetadataTypeVerifier valueForKeyPath:fromProperties:](typeVerifier, "valueForKeyPath:fromProperties:", v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    PFDateFromString(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_dateTimeOffsetOriginalForSyndicationProperties
{
  void *v3;
  PFMetadataTypeVerifier *typeVerifier;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  double v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata _makeDateTimeProperties](self, "_makeDateTimeProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  typeVerifier = self->_typeVerifier;
  v5 = *MEMORY[0x1E0CBCC20];
  v13[0] = *MEMORY[0x1E0CBCB50];
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFMetadataTypeVerifier valueForKeyPath:fromProperties:](typeVerifier, "valueForKeyPath:fromProperties:", v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v12 = 0.0;
    v9 = -[PFMetadata _convertTimeZoneOffsetString:toSeconds:](self, "_convertTimeZoneOffsetString:toSeconds:", v8, &v12);
    v10 = 0;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_dateTimeSubsecOriginalForSyndicationProperties
{
  void *v3;
  PFMetadataTypeVerifier *typeVerifier;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  -[PFMetadata _makeDateTimeProperties](self, "_makeDateTimeProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  typeVerifier = self->_typeVerifier;
  v5 = *MEMORY[0x1E0CBCCA0];
  v13[0] = *MEMORY[0x1E0CBCB50];
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFMetadataTypeVerifier valueForKeyPath:fromProperties:](typeVerifier, "valueForKeyPath:fromProperties:", v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0.%@"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    objc_msgSend(v9, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_convertTimeZoneOffsetString:(id)a3 toSeconds:(double *)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(":"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6 == 2)
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    objc_msgSend(v5, "objectAtIndex:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    if (a4)
    {
      v13 = 1.0;
      if ((uint64_t)v9 < 0)
        v13 = -1.0;
      *a4 = v13 * (v12 * 60.0 + (double)(uint64_t)(v13 * (double)(uint64_t)v9) * 3600.0);
    }
  }

  return v6 == 2;
}

- (id)hdrGainFromValue:(id)a3
{
  void *v3;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "floatValue");
  objc_msgSend(v3, "numberWithFloat:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)metadataForImagePropertiesAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)propertyListRepresentationData
{
  void *v2;
  void *v3;

  -[PFMetadata plistForEncoding](self, "plistForEncoding");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFMetadata encodedDataWithPropertyListObject:](PFMetadata, "encodedDataWithPropertyListObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)plistForEncoding
{
  void *v3;
  NSURL *fileURL;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  __CFString *v16;
  void *v17;
  int64_t v18;
  const __CFString *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  fileURL = self->_fileURL;
  if (fileURL)
  {
    -[NSURL path](fileURL, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, PFMetadataPlistFilePath);

  }
  -[UTType identifier](self->_contentType, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UTType identifier](self->_contentType, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, PFMetadataPlistContentTypeIdentifier);

  }
  -[PFMetadata creationDate](self, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PFMetadata creationDate](self, "creationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, PFMetadataPlistCreationDate);

  }
  -[PFMetadata fileSystemProperties](self, "fileSystemProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PFMetadata fileSystemProperties](self, "fileSystemProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, PFMetadataPlistFileSystemProperties);

  }
  v12 = -[PFMetadata orientation](self, "orientation");
  if ((unint64_t)(v12 - 1) >= 8)
    v13 = 0;
  else
    v13 = v12;

  v14 = -[PFMetadata orientation](self, "orientation");
  if ((unint64_t)(v14 - 1) >= 8)
    v15 = 0;
  else
    v15 = v14;
  v16 = PFOrientationName_names[v15];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, PFMetadataPlistOrientation);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PFMetadata sourceType](self, "sourceType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, PFMetadataPlistSourceType);

  v18 = -[PFMetadata sourceType](self, "sourceType");
  if ((unint64_t)(v18 - 1) > 0xA)
    v19 = CFSTR("Unknown");
  else
    v19 = off_1E45A2278[v18 - 1];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, PFMetadataPlistSourceTypeName);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_options);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, PFMetadataPlistOptions);

  PFMetadataStringForMetadataLoadOptions(self->_options);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, PFMetadataPlistOptionsString);

  return v3;
}

- (id)jsonFormattedDescriptionWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v11[3];
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PFMetadata plistForEncoding](self, "plistForEncoding");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  cleanJSON(v5);
  v11[0] = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 1, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11[0];
  if (!v6)
  {
    v9 = metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_error_impl(&dword_1A16EE000, v9, OS_LOG_TYPE_ERROR, "Invalid JSON output from metadata description. Error: %@", buf, 0xCu);
      if (a3)
        goto LABEL_5;
    }
    else if (a3)
    {
LABEL_5:
      v8 = 0;
      *a3 = objc_retainAutorelease(v7);
      goto LABEL_8;
    }
    v8 = 0;
    goto LABEL_8;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
LABEL_8:

  return v8;
}

- (id)ptpMediaMetadata
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 40), self->_cachedTimeZoneLookup);
  *(_WORD *)(v4 + 32) = self->_options;
  objc_storeStrong((id *)(v4 + 64), self->_fileURL);
  objc_storeStrong((id *)(v4 + 72), self->_contentType);
  -[PFMetadata fileSystemProperties](self, "fileSystemProperties");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v5;

  return (id)v4;
}

- (id)description
{
  void *v2;
  void *v3;

  -[PFMetadata plistForEncoding](self, "plistForEncoding");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PFMetadata *v4;
  PFMetadata *v5;
  PFMetadata *v6;
  PFMetadata *v7;
  int options;
  NSURL *fileURL;
  UTType *contentType;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  BOOL v21;
  void *v22;
  NSObject *v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  const char *v29;
  void *v30;
  const __CFString *v31;
  const __CFString *v32;
  void *v33;
  NSURL *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  const __CFString *v38;
  __CFString *v39;
  const __CFString *v40;
  void *v41;
  UTType *v42;
  void *v44;
  int v45;
  void *v46;
  __int16 v47;
  const __CFString *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = (PFMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    v7 = v6;
    options = self->_options;
    if (options == v6->_options)
    {
      fileURL = self->_fileURL;
      if ((fileURL != 0) != (v6->_fileURL == 0))
      {
        if (fileURL && (-[NSURL isEqual:](self->_fileURL, "isEqual:") & 1) == 0)
        {
          v33 = (void *)metadataLog;
          if (!os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG))
            goto LABEL_46;
          v34 = self->_fileURL;
          v23 = v33;
          -[PFMetadata fileURL](v7, "fileURL");
          v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v45 = 138412546;
          v46 = v34;
          v47 = 2112;
          v48 = v24;
          v29 = "PFMetadata object not equal: fileURL %@ != %@";
        }
        else
        {
          contentType = self->_contentType;
          if ((contentType != 0) != (v7->_contentType == 0))
          {
            if (!contentType
              || (-[PFMetadata contentType](v7, "contentType"),
                  v11 = (void *)objc_claimAutoreleasedReturnValue(),
                  v12 = -[UTType isEqual:](contentType, "isEqual:", v11),
                  v11,
                  (v12 & 1) != 0))
            {
              -[PFMetadata fileSystemProperties](self, "fileSystemProperties");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              -[PFMetadata fileSystemProperties](v7, "fileSystemProperties");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = (v13 == 0) ^ (v14 != 0);

              if ((v15 & 1) != 0)
              {
                -[PFMetadata fileSystemProperties](self, "fileSystemProperties");
                v16 = objc_claimAutoreleasedReturnValue();
                if (!v16)
                  goto LABEL_12;
                v17 = (void *)v16;
                -[PFMetadata fileSystemProperties](self, "fileSystemProperties");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                -[PFMetadata fileSystemProperties](v7, "fileSystemProperties");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v18, "isEqual:", v19);

                if ((v20 & 1) != 0)
                {
LABEL_12:
                  v21 = 1;
LABEL_47:

                  goto LABEL_48;
                }
                v44 = (void *)metadataLog;
                if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG))
                {
                  v36 = v44;
                  -[PFMetadata fileSystemProperties](self, "fileSystemProperties");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PFMetadata fileSystemProperties](v7, "fileSystemProperties");
                  v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  v45 = 138412546;
                  v46 = v37;
                  v47 = 2112;
                  v48 = v39;
LABEL_51:
                  _os_log_debug_impl(&dword_1A16EE000, v36, OS_LOG_TYPE_DEBUG, "PFMetadata object not equal: fileSystemProperties %@ != %@", (uint8_t *)&v45, 0x16u);

                }
              }
              else
              {
                v35 = (void *)metadataLog;
                if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG))
                {
                  v36 = v35;
                  -[PFMetadata fileSystemProperties](self, "fileSystemProperties");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v37)
                    v38 = CFSTR("not nil");
                  else
                    v38 = CFSTR("nil");
                  -[PFMetadata fileSystemProperties](v7, "fileSystemProperties");
                  v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  if (v39)
                    v40 = CFSTR("not nil");
                  else
                    v40 = CFSTR("nil");
                  v45 = 138412546;
                  v46 = (void *)v38;
                  v47 = 2112;
                  v48 = v40;
                  goto LABEL_51;
                }
              }
LABEL_46:
              v21 = 0;
              goto LABEL_47;
            }
            v41 = (void *)metadataLog;
            if (!os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG))
              goto LABEL_46;
            v42 = self->_contentType;
            v23 = v41;
            -[PFMetadata contentType](v7, "contentType");
            v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v45 = 138412546;
            v46 = v42;
            v47 = 2112;
            v48 = v24;
            v29 = "PFMetadata object not equal: contentType %@ != %@";
          }
          else
          {
            v30 = (void *)metadataLog;
            if (!os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG))
              goto LABEL_46;
            if (contentType)
              v31 = CFSTR("not nil");
            else
              v31 = CFSTR("nil");
            v23 = v30;
            -[PFMetadata contentType](v7, "contentType");
            v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (v24)
              v32 = CFSTR("not nil");
            else
              v32 = CFSTR("nil");
            v45 = 138412546;
            v46 = (void *)v31;
            v47 = 2112;
            v48 = v32;
            v29 = "PFMetadata object not equal: contentType %@ != %@";
          }
        }
      }
      else
      {
        v26 = (void *)metadataLog;
        if (!os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG))
          goto LABEL_46;
        if (fileURL)
          v27 = CFSTR("not nil");
        else
          v27 = CFSTR("nil");
        v23 = v26;
        -[PFMetadata fileURL](v7, "fileURL");
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v24)
          v28 = CFSTR("not nil");
        else
          v28 = CFSTR("nil");
        v45 = 138412546;
        v46 = (void *)v27;
        v47 = 2112;
        v48 = v28;
        v29 = "PFMetadata object not equal: fileURL %@ != %@";
      }
      _os_log_debug_impl(&dword_1A16EE000, v23, OS_LOG_TYPE_DEBUG, v29, (uint8_t *)&v45, 0x16u);
    }
    else
    {
      v22 = (void *)metadataLog;
      if (!os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_DEBUG))
        goto LABEL_46;
      v23 = v22;
      PFMetadataStringForMetadataLoadOptions(options);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      PFMetadataStringForMetadataLoadOptions(v7->_options);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v45 = 138412546;
      v46 = v24;
      v47 = 2112;
      v48 = v25;
      _os_log_debug_impl(&dword_1A16EE000, v23, OS_LOG_TYPE_DEBUG, "PFMetadata object not equal: detail %@ != %@", (uint8_t *)&v45, 0x16u);

    }
    goto LABEL_46;
  }
  v21 = 1;
LABEL_48:

  return v21;
}

- (id)sourceTypeName
{
  int64_t v2;

  v2 = -[PFMetadata sourceType](self, "sourceType");
  if ((unint64_t)(v2 - 1) > 0xA)
    return CFSTR("Unknown");
  else
    return off_1E45A2278[v2 - 1];
}

- (id)exifDictionary
{
  return 0;
}

- (id)exifAuxDictionary
{
  return 0;
}

- (id)makerAppleDictionary
{
  return 0;
}

- (id)makerNikonDictionary
{
  return 0;
}

- (id)makerCanonDictionary
{
  return 0;
}

- (id)ciffDictionary
{
  return 0;
}

- (id)gifDictionary
{
  return 0;
}

- (id)gpsDictionary
{
  return 0;
}

- (id)tiffDictionary
{
  return 0;
}

- (id)iptcDictionary
{
  return 0;
}

- (void)loadMetadataWithCompletionHandler:(id)a3
{
  void (**v3)(_QWORD);
  NSObject *v4;
  uint8_t v5[16];

  v3 = (void (**)(_QWORD))a3;
  v4 = metadataLog;
  if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1A16EE000, v4, OS_LOG_TYPE_ERROR, "Called on base class. This should not happen.", v5, 2u);
    if (!v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v3)
LABEL_3:
    v3[2](v3);
LABEL_4:

}

- (void)setFileSystemProperties:(id)a3
{
  objc_storeStrong((id *)&self->_fileSystemProperties, a3);
}

- (unsigned)options
{
  return self->_options;
}

- (void)setTimeZoneLookup:(id)a3
{
  objc_storeStrong((id *)&self->_cachedTimeZoneLookup, a3);
}

- (PFMetadataTypeVerifier)typeVerifier
{
  return self->_typeVerifier;
}

- (void)setTypeVerifier:(id)a3
{
  objc_storeStrong((id *)&self->_typeVerifier, a3);
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

- (void)setContentType:(id)a3
{
  objc_storeStrong((id *)&self->_contentType, a3);
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (void)setUtcCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_utcCreationDate, a3);
}

- (void)setCreationDateSource:(int64_t)a3
{
  self->_creationDateSource = a3;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (void)setCreationDateString:(id)a3
{
  objc_storeStrong((id *)&self->_creationDateString, a3);
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (void)setGpsLocation:(id)a3
{
  objc_storeStrong((id *)&self->_gpsLocation, a3);
}

- (void)setLatitude:(id)a3
{
  objc_storeStrong((id *)&self->_latitude, a3);
}

- (void)setLongitude:(id)a3
{
  objc_storeStrong((id *)&self->_longitude, a3);
}

- (void)setAltitude:(id)a3
{
  objc_storeStrong((id *)&self->_altitude, a3);
}

- (void)setSpeed:(id)a3
{
  objc_storeStrong((id *)&self->_speed, a3);
}

- (void)setGpsDateTime:(id)a3
{
  objc_storeStrong((id *)&self->_gpsDateTime, a3);
}

- (BOOL)useJpegFastPath
{
  return self->_useJpegFastPath;
}

void __57__PFMetadata_initWithContentType_options_timeZoneLookup___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.photosformats.pfmetadata", "PFMetadata");
  v1 = (void *)metadataLog;
  metadataLog = (uint64_t)v0;

}

+ (id)originatingAssetIdentifierMetadataKey
{
  return (id)*MEMORY[0x1E0C89CC8];
}

+ (id)originatingAssetIdentifierMetadataIdentifier
{
  return +[PFMetadataIdentifier quickTimeMetadataOriginatingSignature](PFMetadataIdentifier, "quickTimeMetadataOriginatingSignature");
}

+ (id)renderOriginatingAssetIdentifierMetadataKey
{
  return (id)*MEMORY[0x1E0C89CD8];
}

+ (id)renderOriginatingAssetIdentifierMetadataIdentifier
{
  return +[PFMetadataIdentifier quickTimeMetadataRenderOriginatingSignature](PFMetadataIdentifier, "quickTimeMetadataRenderOriginatingSignature");
}

+ (id)livePhotoPairingIdentifierMetadataKey
{
  return (id)*MEMORY[0x1E0C89C70];
}

+ (id)livePhotoPairingIdentifierMetadataIdentifier
{
  return +[PFMetadataIdentifier quickTimeMetadataContentIdentifier](PFMetadataIdentifier, "quickTimeMetadataContentIdentifier");
}

+ (id)spatialOverCaptureIdentifierMetadataKey
{
  return (id)*MEMORY[0x1E0C89D48];
}

+ (id)spatialOverCaptureIdentifierMetadataIdentifier
{
  return +[PFMetadataIdentifier quickTimeMetadataSpatialOverCaptureGroupIdentifier](PFMetadataIdentifier, "quickTimeMetadataSpatialOverCaptureGroupIdentifier");
}

+ (id)playbackVariationMetadataKey
{
  return (id)*MEMORY[0x1E0C89CD0];
}

+ (id)playbackVariationMetadataIdentifier
{
  return +[PFMetadataIdentifier quickTimeMetadataVariationIdentifier](PFMetadataIdentifier, "quickTimeMetadataVariationIdentifier");
}

+ (id)photoProcessingFlagsMetadataKey
{
  return (id)*MEMORY[0x1E0C89CB8];
}

+ (id)photosFeatureFlagsMetadataKey
{
  return (id)*MEMORY[0x1E0C89CC0];
}

+ (id)burstUuidMetadataKey
{
  return (id)*MEMORY[0x1E0C89C78];
}

+ (id)hdrGainMetadataKey
{
  return (id)*MEMORY[0x1E0D03D40];
}

+ (void)metadataForAsset:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  PFMetadata *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  PFMetadata *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = -[PFMetadata initWithAVAsset:options:timeZoneLookup:]([PFMetadata alloc], "initWithAVAsset:options:timeZoneLookup:", v5, 4, 0);
    if (v7)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __49__PFMetadata_metadataForAsset_completionHandler___block_invoke;
      v12[3] = &unk_1E45A4590;
      v14 = v6;
      v13 = v7;
      -[PFMetadata loadMetadataWithCompletionHandler:](v13, "loadMetadataWithCompletionHandler:", v12);

      v8 = v14;
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to get metadata for asset %@"), v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v11);

    }
  }

}

+ (void)setDefaultTimeZoneLookup:(id)a3
{
  objc_storeWeak(&gDefaultTimeZoneLookup, a3);
}

+ (id)encodedDataWithPropertyListObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB38B0];
  objc_msgSend(a1, "_filterPropertyListObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v5, "dataWithPropertyList:format:options:error:", v6, 200, 0, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;

  if (!v7)
  {
    v9 = (void *)metadataLog;
    if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
    {
      v11 = v9;
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v16 = 0;
      v17 = 2114;
      v18 = v13;
      v19 = 2050;
      v20 = v4;
      v21 = 2114;
      v22 = v8;
      _os_log_error_impl(&dword_1A16EE000, v11, OS_LOG_TYPE_ERROR, "Failed to encode data: %{public}@ for object <%{public}@:%{public}p> error: %{public}@", buf, 0x2Au);

    }
  }

  return v7;
}

+ (id)_filterDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11, (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_filterPropertyListObject:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
    v14 = v5;
  else
    v14 = 0;
  v15 = v14;

  return v15;
}

+ (id)_filterArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "_filterPropertyListObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10), (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
    v12 = v5;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

+ (id)_filterPropertyListObject:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "_filterDictionary:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "_filterArray:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(a1, "_canEncodeInPropertyList:", v4))
      {
        v6 = 0;
        goto LABEL_8;
      }
      v5 = v4;
    }
  }
  v6 = v5;
LABEL_8:

  return v6;
}

+ (BOOL)_canEncodeInPropertyList:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (id)propertyListObjectFromEncodedData:(id)a3 expectedClass:(Class)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (objc_msgSend(v9, "length"))
  {
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v9, a5, 0, &v22);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v22;
    v12 = v11;
    if (v10)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a6)
        {
          v13 = (void *)MEMORY[0x1E0CB35C8];
          v14 = *MEMORY[0x1E0CB28A8];
          v23 = *MEMORY[0x1E0CB2D68];
          v15 = (void *)MEMORY[0x1E0CB3940];
          v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromClass(a4);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringWithFormat:", CFSTR("Deserialized object was of class %@, expected class %@"), v17, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 2048, v20);
          *a6 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_10;
      }
    }
    else
    {
      if (!a6)
      {
LABEL_10:
        v10 = 0;
        goto LABEL_11;
      }
      v10 = 0;
      *a6 = objc_retainAutorelease(v11);
    }
LABEL_11:

    goto LABEL_12;
  }
  v10 = objc_alloc_init(a4);
LABEL_12:

  return v10;
}

+ (AudioStreamBasicDescription)audioStreamBasicDescriptionForAsset:(SEL)a3
{
  return +[PFMetadataMovie audioStreamBasicDescriptionForAsset:](PFMetadataMovie, "audioStreamBasicDescriptionForAsset:", a4);
}

+ (id)defaultOptionsForCGImageSource
{
  return +[PFMetadataImage defaultOptionsForCGImageSource](PFMetadataImage, "defaultOptionsForCGImageSource");
}

+ (BOOL)parseISO6709String:(id)a3 outLatitude:(double *)a4 outLongitude:(double *)a5
{
  return +[PFMetadataMovie parseISO6709String:outLatitude:outLongitude:](PFMetadataMovie, "parseISO6709String:outLatitude:outLongitude:", a3, a4, a5);
}

+ (id)exifTimezoneOffsetFromDateString:(id)a3 offsetInSeconds:(int64_t *)a4
{
  return +[PFMetadataMovie exifTimezoneOffsetFromDateString:offsetInSeconds:](PFMetadataMovie, "exifTimezoneOffsetFromDateString:offsetInSeconds:", a3, a4);
}

+ (id)differencesBetweenDictionary:(id)a3 andDictionary:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E08];
  v8 = a3;
  objc_msgSend(v7, "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__PFMetadata_differencesBetweenDictionary_andDictionary___block_invoke;
  v15[3] = &unk_1E45A2230;
  v16 = v6;
  v10 = v9;
  v17 = v10;
  v18 = a1;
  v11 = v6;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v15);

  v12 = v17;
  v13 = v10;

  return v13;
}

+ (void)firstVideoTrackForAsset:(id)a3 resultBlock:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__PFMetadata_firstVideoTrackForAsset_resultBlock___block_invoke;
  v7[3] = &unk_1E45A2258;
  v8 = v5;
  v6 = v5;
  +[PFMetadataMovie firstVideoTrackForAsset:resultBlock:](PFMetadataMovie, "firstVideoTrackForAsset:resultBlock:", a3, v7);

}

+ (void)firstAudioTrackForAsset:(id)a3 resultBlock:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__PFMetadata_firstAudioTrackForAsset_resultBlock___block_invoke;
  v7[3] = &unk_1E45A2258;
  v8 = v5;
  v6 = v5;
  +[PFMetadataMovie firstAudioTrackForAsset:resultBlock:](PFMetadataMovie, "firstAudioTrackForAsset:resultBlock:", a3, v7);

}

uint64_t __50__PFMetadata_firstAudioTrackForAsset_resultBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50__PFMetadata_firstVideoTrackForAsset_resultBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__PFMetadata_differencesBetweenDictionary_andDictionary___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = a1[5];
    objc_msgSend(a1[6], "differencesBetweenDictionary:andDictionary:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addEntriesFromDictionary:", v9);

  }
  else if ((objc_msgSend(v6, "isEqual:", v7) & 1) == 0)
  {
    v10 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13[0] = v10;
    v11 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v12, v5);

    if (v7)
    {
      if (v6)
        goto LABEL_10;
    }
    else
    {

      if (v6)
        goto LABEL_10;
    }

  }
LABEL_10:

}

uint64_t __49__PFMetadata_metadataForAsset_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

@end
