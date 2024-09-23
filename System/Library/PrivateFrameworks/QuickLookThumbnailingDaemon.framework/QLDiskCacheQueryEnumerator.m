@implementation QLDiskCacheQueryEnumerator

- (void)_findThumbnailRequestsToProcess
{
  void *v2;
  void *v4;
  _BOOL4 v5;
  __int128 v6;
  void *v7;
  QLCacheFileIdentifier *fileIdentifier;
  int iconMode;
  unint64_t badgeType;
  int64_t iconVariant;
  int interpolationQuality;
  unint64_t externalGeneratorDataHash;
  void *v14;
  void *v15;
  QLCacheFileIdentifier *v16;
  QLCacheFileIdentifier *v17;
  float v18;
  QLTBitmapFormat *v19;
  QLTBitmapFormat *bitmapFormat;
  QLCacheBlobInfo *v21;
  QLCacheBlobInfo *bitmapDataBlobInfo;
  QLCacheBlobInfo *v23;
  QLCacheBlobInfo *metadataBlobInfo;
  NSData *metadata;
  NSData *bitmapData;
  CGSize v27;
  NSObject *v28;
  QLCacheFileIdentifier *v29;
  unint64_t v30;
  const __CFString *v31;
  double size;
  __int128 v33;
  _QWORD v34[5];
  _QWORD v35[5];
  uint8_t buf[4];
  QLCacheFileIdentifier *v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  unint64_t v41;
  __int16 v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[QLCacheIndexDatabaseQueryEnumerator fileIdentifier](self->_cacheIndexDatabaseEnumerator, "fileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    || (v5 = -[QLCacheIndexDatabaseQueryEnumerator nextThumbnailInfo](self->_cacheIndexDatabaseEnumerator, "nextThumbnailInfo"), self->_valueFound = v5, v5))
  {
    if (!-[NSMutableArray count](self->_sameGeneratorRequests, "count"))
    {
      *(_QWORD *)&v6 = 138413058;
      v33 = v6;
      do
      {
        if (!self->_valueFound)
          return;
        if (self->_fileIdentifier)
        {
          -[QLCacheIndexDatabaseQueryEnumerator fileIdentifier](self->_cacheIndexDatabaseEnumerator, "fileIdentifier");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (v7)
          {
            fileIdentifier = self->_fileIdentifier;
            -[QLCacheIndexDatabaseQueryEnumerator fileIdentifier](self->_cacheIndexDatabaseEnumerator, "fileIdentifier");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            if (!-[QLCacheFileIdentifier isEqual:](fileIdentifier, "isEqual:", v2)
              || (iconMode = self->_iconMode,
                  iconMode != -[QLCacheIndexDatabaseQueryEnumerator iconMode](self->_cacheIndexDatabaseEnumerator, "iconMode"))|| (badgeType = self->_badgeType, badgeType != -[QLCacheIndexDatabaseQueryEnumerator badgeType](self->_cacheIndexDatabaseEnumerator, "badgeType"))|| (iconVariant = self->_iconVariant, iconVariant != -[QLCacheIndexDatabaseQueryEnumerator iconVariant](self->_cacheIndexDatabaseEnumerator, "iconVariant"))|| (interpolationQuality = self->_interpolationQuality, interpolationQuality != -[QLCacheIndexDatabaseQueryEnumerator interpolationQuality](self->_cacheIndexDatabaseEnumerator, "interpolationQuality"))|| (externalGeneratorDataHash = self->_externalGeneratorDataHash, externalGeneratorDataHash != -[QLCacheIndexDatabaseQueryEnumerator externalGeneratorDataHash](self->_cacheIndexDatabaseEnumerator, "externalGeneratorDataHash")))
            {

LABEL_20:
              v35[0] = MEMORY[0x1E0C809B0];
              v35[1] = 3221225472;
              v35[2] = __61__QLDiskCacheQueryEnumerator__findThumbnailRequestsToProcess__block_invoke;
              v35[3] = &unk_1E99D2F98;
              v35[4] = self;
              -[QLDiskCacheQueryEnumerator moveThumbnailRequestsFromBeingProcessedToSameRequestIfTheyMatch:](self, "moveThumbnailRequestsFromBeingProcessedToSameRequestIfTheyMatch:", v35, v33);
              goto LABEL_21;
            }
          }
          -[QLCacheIndexDatabaseQueryEnumerator fileIdentifier](self->_cacheIndexDatabaseEnumerator, "fileIdentifier", v33);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7)
          {

          }
          if (!v14)
            goto LABEL_20;
        }
LABEL_21:
        -[QLCacheIndexDatabaseQueryEnumerator fileIdentifier](self->_cacheIndexDatabaseEnumerator, "fileIdentifier", v33);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {

LABEL_24:
          if (!-[NSMutableArray count](self->_sameGeneratorRequests, "count"))
          {
            -[QLDiskCacheQueryEnumerator _cleanUpValues](self, "_cleanUpValues");
            self->_cacheId = -[QLCacheIndexDatabaseQueryEnumerator cacheId](self->_cacheIndexDatabaseEnumerator, "cacheId");
            -[QLCacheIndexDatabaseQueryEnumerator fileIdentifier](self->_cacheIndexDatabaseEnumerator, "fileIdentifier");
            v16 = (QLCacheFileIdentifier *)objc_claimAutoreleasedReturnValue();
            v17 = self->_fileIdentifier;
            self->_fileIdentifier = v16;

            self->_iconMode = -[QLCacheIndexDatabaseQueryEnumerator iconMode](self->_cacheIndexDatabaseEnumerator, "iconMode") != 0;
            self->_iconVariant = -[QLCacheIndexDatabaseQueryEnumerator iconVariant](self->_cacheIndexDatabaseEnumerator, "iconVariant");
            self->_interpolationQuality = -[QLCacheIndexDatabaseQueryEnumerator interpolationQuality](self->_cacheIndexDatabaseEnumerator, "interpolationQuality");
            -[QLCacheIndexDatabaseQueryEnumerator size](self->_cacheIndexDatabaseEnumerator, "size");
            self->_size = v18;
            -[QLCacheIndexDatabaseQueryEnumerator bitmapFormat](self->_cacheIndexDatabaseEnumerator, "bitmapFormat");
            v19 = (QLTBitmapFormat *)objc_claimAutoreleasedReturnValue();
            bitmapFormat = self->_bitmapFormat;
            self->_bitmapFormat = v19;

            -[QLCacheIndexDatabaseQueryEnumerator bitmapDataBlobInfo](self->_cacheIndexDatabaseEnumerator, "bitmapDataBlobInfo");
            v21 = (QLCacheBlobInfo *)objc_claimAutoreleasedReturnValue();
            bitmapDataBlobInfo = self->_bitmapDataBlobInfo;
            self->_bitmapDataBlobInfo = v21;

            -[QLCacheIndexDatabaseQueryEnumerator metadataBlobInfo](self->_cacheIndexDatabaseEnumerator, "metadataBlobInfo");
            v23 = (QLCacheBlobInfo *)objc_claimAutoreleasedReturnValue();
            metadataBlobInfo = self->_metadataBlobInfo;
            self->_metadataBlobInfo = v23;

            metadata = self->_metadata;
            self->_metadata = 0;

            bitmapData = self->_bitmapData;
            self->_bitmapData = 0;

            self->_badgeType = -[QLCacheIndexDatabaseQueryEnumerator badgeType](self->_cacheIndexDatabaseEnumerator, "badgeType");
            self->_externalGeneratorDataHash = -[QLCacheIndexDatabaseQueryEnumerator externalGeneratorDataHash](self->_cacheIndexDatabaseEnumerator, "externalGeneratorDataHash");
            self->_flavor = 0;
            v27 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
            self->_contentRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
            self->_contentRect.size = v27;
            _log_5();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              v29 = self->_fileIdentifier;
              v30 = self->_badgeType;
              v31 = CFSTR("YES");
              if (!self->_iconMode)
                v31 = CFSTR("NO");
              size = self->_size;
              *(_DWORD *)buf = v33;
              v37 = v29;
              v38 = 2112;
              v39 = v31;
              v40 = 2048;
              v41 = v30;
              v42 = 2048;
              v43 = size;
              _os_log_debug_impl(&dword_1D54AE000, v28, OS_LOG_TYPE_DEBUG, "processing from database %@ icon mode %@ badgeType %lu size %.1f", buf, 0x2Au);
            }

            v34[0] = MEMORY[0x1E0C809B0];
            v34[1] = 3221225472;
            v34[2] = __61__QLDiskCacheQueryEnumerator__findThumbnailRequestsToProcess__block_invoke_20;
            v34[3] = &unk_1E99D2F98;
            v34[4] = self;
            -[QLDiskCacheQueryEnumerator moveThumbnailRequestsFromBeingProcessedToSameRequestIfTheyMatch:](self, "moveThumbnailRequestsFromBeingProcessedToSameRequestIfTheyMatch:", v34);
            -[QLCacheIndexDatabaseQueryEnumerator nextThumbnailInfo](self->_cacheIndexDatabaseEnumerator, "nextThumbnailInfo");
          }
          continue;
        }
        if (-[NSMutableArray count](self->_sameGeneratorRequests, "count"))
          goto LABEL_24;
        -[QLDiskCacheQueryEnumerator _cleanUpValues](self, "_cleanUpValues");
        self->_valueFound = 0;
      }
      while (!-[NSMutableArray count](self->_sameGeneratorRequests, "count"));
    }
  }
}

- (void)moveThumbnailRequestsFromBeingProcessedToSameRequestIfTheyMatch:(id)a3
{
  unsigned int (**v4)(id, void *);
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = (unsigned int (**)(id, void *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_generatorRequestBeingProcessed, "objectForKeyedSubscript:", self->_fileIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    _log_5();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[QLDiskCacheQueryEnumerator moveThumbnailRequestsFromBeingProcessedToSameRequestIfTheyMatch:].cold.1((uint64_t *)&self->_fileIdentifier, (uint64_t)self, v6);

    v7 = objc_msgSend(v5, "count");
    if (v7 >= 1)
    {
      v8 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4[2](v4, v9))
        {
          -[NSMutableArray addObject:](self->_sameGeneratorRequests, "addObject:", v9);
          objc_msgSend(v5, "removeObjectAtIndex:", v8);
          --v7;
        }
        else
        {
          ++v8;
        }

      }
      while (v8 < v7);
    }
    if (!v7)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_generatorRequestBeingProcessed, "setObject:forKeyedSubscript:", 0, self->_fileIdentifier);
  }

}

- (void)_cleanUpValues
{
  QLCacheFileIdentifier *fileIdentifier;
  QLCacheBlobInfo *bitmapDataBlobInfo;
  QLCacheBlobInfo *metadataBlobInfo;

  fileIdentifier = self->_fileIdentifier;
  self->_fileIdentifier = 0;

  self->_size = 0.0;
  bitmapDataBlobInfo = self->_bitmapDataBlobInfo;
  self->_bitmapDataBlobInfo = 0;

  metadataBlobInfo = self->_metadataBlobInfo;
  self->_metadataBlobInfo = 0;

  self->_badgeType = 0;
  self->_externalGeneratorDataHash = 0;
}

void __68__QLDiskCacheQueryEnumerator__createNewCacheIndexDatabaseEnumerator__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  QLCacheIndexFileRequest *v21;
  void *v22;
  void *v23;
  QLCacheIndexFileRequest *v24;
  void *v25;
  void *v26;
  double v27;
  float v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  QLCacheIndexFileRequest *v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v45;
  QLCacheIndexFileRequest *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  *a4 = 0;
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v10)
  {
    v11 = v10;
    v41 = v6;
    v42 = v8;
    v46 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v48;
    do
    {
      v14 = 0;
      v43 = v11;
      do
      {
        if (*(_QWORD *)v48 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v14);
        objc_msgSend(v15, "request", v41);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          objc_msgSend(v15, "request");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "fileIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "fileIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 32), "generatorRequestBeingProcessed");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v42, v12);

        }
        if ((objc_msgSend(v15, "cancelled") & 1) == 0)
        {
          v45 = v12;
          v20 = v13;
          v21 = v46;
          if (!v46)
          {
            objc_msgSend(v16, "fileIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "version");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v24 = [QLCacheIndexFileRequest alloc];
            objc_msgSend(v16, "fileIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "fileIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = -[QLCacheIndexFileRequest initWithFileIdentifier:version:](v24, "initWithFileIdentifier:version:", v26, v23);

          }
          objc_msgSend((id)objc_opt_class(), "_expectedThumbnailSizeForRequest:", v16);
          v28 = v27;
          objc_msgSend(v16, "minimumDimension");
          v30 = v29;
          objc_msgSend(v16, "scale");
          *(float *)&v30 = v30 * v31;
          v32 = objc_msgSend(v16, "iconMode");
          v33 = objc_msgSend(v15, "needsLowQualityThumbnailGeneration");
          v34 = objc_msgSend(v15, "badgeType");
          v35 = objc_msgSend(v16, "iconVariant");
          v36 = objc_msgSend(v16, "interpolationQuality");
          v37 = objc_msgSend(v16, "externalThumbnailGeneratorDataHash");
          v46 = v21;
          *(float *)&v38 = v28;
          LODWORD(v39) = LODWORD(v30);
          -[QLCacheIndexFileRequest appendSize:minimumSize:withIconMode:lowQuality:badgeType:iconVariant:interpolationQuality:externalGeneratorDataHash:](v21, "appendSize:minimumSize:withIconMode:lowQuality:badgeType:iconVariant:interpolationQuality:externalGeneratorDataHash:", v32, v33, v34, v35, v36, v37, v38, v39);
          v13 = v20;
          v12 = v45;
          v11 = v43;
        }

        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v11);

    v40 = v46;
    if (v46)
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v46, v12);
      v8 = v42;
      objc_msgSend(v42, "sortUsingSelector:", sel_compare_);
      v6 = v41;
    }
    else
    {
      v6 = v41;
      v8 = v42;
    }
  }
  else
  {

    v12 = 0;
    v40 = 0;
  }

}

- (NSMutableDictionary)generatorRequestBeingProcessed
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (float)size
{
  return self->_size;
}

- (int)interpolationQuality
{
  return self->_interpolationQuality;
}

- (int64_t)iconVariant
{
  return self->_iconVariant;
}

- (BOOL)iconMode
{
  return self->_iconMode;
}

- (unint64_t)externalGeneratorDataHash
{
  return self->_externalGeneratorDataHash;
}

- (unint64_t)badgeType
{
  return self->_badgeType;
}

- (id)nextThumbnailRequestWithThumbnailData:(id *)a3
{
  QLTGeneratorThumbnailRequest *generatorRequest;
  QLTGeneratorThumbnailRequest *v6;
  QLTGeneratorThumbnailRequest *v7;
  QLCacheThumbnailData *thumbnailData;
  QLTGeneratorThumbnailRequest *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  NSData *v16;
  NSData *bitmapData;
  void *v18;
  NSData *v19;
  NSData *metadata;
  NSObject *v21;
  unint64_t v22;
  unint64_t v23;
  QLCacheThumbnailData *v24;
  NSObject *v25;
  float size;
  QLTBitmapFormat *bitmapFormat;
  NSData *v28;
  NSData *v29;
  uint64_t flavor;
  unint64_t v31;
  double v32;
  QLCacheThumbnailData *v33;
  NSMutableDictionary *generatorRequestBeingProcessed;
  NSObject *v35;
  QLCacheFileIdentifier *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  QLCacheThumbnailData *v40;
  unint64_t v41;
  float v42;
  unint64_t v43;
  double v44;
  QLCacheThumbnailData *v45;
  QLCacheFileIdentifier *v47;
  unint64_t v48;
  NSData *v49;
  unint64_t v50;
  const char *v51;
  QLCacheFileIdentifier *v52;
  unint64_t v53;
  const void *v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t cacheId;
  QLCacheFileIdentifier *fileIdentifier;
  QLCacheThumbnailData *v60;
  _QWORD v61[5];
  uint8_t buf[4];
  QLCacheFileIdentifier *v63;
  __int16 v64;
  unint64_t v65;
  __int16 v66;
  unint64_t v67;
  __int16 v68;
  unint64_t v69;
  __int16 v70;
  unint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  generatorRequest = self->_generatorRequest;
  if (generatorRequest)
  {
    self->_generatorRequest = 0;

  }
  if (self->_valueFound && !-[NSMutableArray count](self->_sameGeneratorRequests, "count"))
  {
    if (-[NSMutableDictionary count](self->_generatorRequestBeingProcessed, "count"))
    {
      -[QLDiskCacheQueryEnumerator _findThumbnailRequestsToProcess](self, "_findThumbnailRequestsToProcess");
      if (!-[NSMutableArray count](self->_sameGeneratorRequests, "count"))
      {
        generatorRequestBeingProcessed = self->_generatorRequestBeingProcessed;
        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __68__QLDiskCacheQueryEnumerator_nextThumbnailRequestWithThumbnailData___block_invoke;
        v61[3] = &unk_1E99D2FC0;
        v61[4] = self;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](generatorRequestBeingProcessed, "enumerateKeysAndObjectsUsingBlock:", v61);
        -[NSMutableDictionary removeAllObjects](self->_generatorRequestBeingProcessed, "removeAllObjects");
      }
    }
  }
  if (-[NSMutableArray count](self->_sameGeneratorRequests, "count"))
  {
    -[NSMutableArray lastObject](self->_sameGeneratorRequests, "lastObject");
    v6 = (QLTGeneratorThumbnailRequest *)objc_claimAutoreleasedReturnValue();
    v7 = self->_generatorRequest;
    self->_generatorRequest = v6;

    -[NSMutableArray removeLastObject](self->_sameGeneratorRequests, "removeLastObject");
  }
  thumbnailData = self->_thumbnailData;
  self->_thumbnailData = 0;

  v9 = self->_generatorRequest;
  if (v9)
  {
    if (!-[QLTGeneratorThumbnailRequest cancelled](v9, "cancelled") && self->_valueFound)
    {
      if (-[QLCacheBlobInfo length](self->_bitmapDataBlobInfo, "length")
        || (v10 = self->_size,
            v11 = (void *)objc_opt_class(),
            -[QLTGeneratorThumbnailRequest request](self->_generatorRequest, "request"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v11, "_expectedThumbnailSizeForRequest:", v12),
            v14 = v13,
            v12,
            v14 <= v10))
      {
        if (-[QLCacheBlobInfo length](self->_bitmapDataBlobInfo, "length"))
        {
          if (!self->_bitmapData && -[QLCacheBlobInfo length](self->_bitmapDataBlobInfo, "length"))
          {
            -[QLDiskCache blobDatabase](self->super._diskCache, "blobDatabase");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (NSData *)objc_msgSend(v15, "copyBlobWithInfo:", self->_bitmapDataBlobInfo);
            bitmapData = self->_bitmapData;
            self->_bitmapData = v16;

          }
          if (!self->_metadata && -[QLCacheBlobInfo length](self->_metadataBlobInfo, "length"))
          {
            -[QLDiskCache blobDatabase](self->super._diskCache, "blobDatabase");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (NSData *)objc_msgSend(v18, "copyBlobWithInfo:", self->_metadataBlobInfo);
            metadata = self->_metadata;
            self->_metadata = v19;

          }
          _log_5();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            fileIdentifier = self->_fileIdentifier;
            v57 = -[QLCacheBlobInfo location](self->_bitmapDataBlobInfo, "location");
            v56 = -[QLCacheBlobInfo length](self->_bitmapDataBlobInfo, "length");
            v22 = -[QLCacheBlobInfo location](self->_metadataBlobInfo, "location");
            v23 = -[QLCacheBlobInfo length](self->_metadataBlobInfo, "length");
            *(_DWORD *)buf = 138413314;
            v63 = fileIdentifier;
            v64 = 2048;
            v65 = v57;
            v66 = 2048;
            v67 = v56;
            v68 = 2048;
            v69 = v22;
            v70 = 2048;
            v71 = v23;
            _os_log_impl(&dword_1D54AE000, v21, OS_LOG_TYPE_INFO, "data for %@ thumbnail location : %llu length : %llu contentRect location : %llu length : %llu", buf, 0x34u);
          }

          if (!self->_metadata && -[QLCacheBlobInfo length](self->_metadataBlobInfo, "length"))
          {
            _log_5();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              v47 = -[NSData bytes](self->_metadata, "bytes");
              v48 = -[QLCacheBlobInfo length](self->_metadataBlobInfo, "length");
              v49 = self->_bitmapData;
              v50 = -[QLCacheBlobInfo length](self->_bitmapDataBlobInfo, "length");
              *(_DWORD *)buf = 134218752;
              v63 = v47;
              v64 = 2048;
              v65 = v48;
              v66 = 2048;
              v67 = (unint64_t)v49;
              v68 = 2048;
              v69 = v50;
              v51 = "We can't get the plist buffer, so we will pretend we don't have this thumbnail plist %p length %llu "
                    "bitmap data %p length %llu";
LABEL_39:
              _os_log_impl(&dword_1D54AE000, v25, OS_LOG_TYPE_INFO, v51, buf, 0x2Au);
              goto LABEL_31;
            }
            goto LABEL_31;
          }
          if (!self->_bitmapData && -[QLCacheBlobInfo length](self->_bitmapDataBlobInfo, "length"))
          {
            _log_5();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              v52 = -[NSData bytes](self->_metadata, "bytes");
              v53 = -[QLCacheBlobInfo length](self->_metadataBlobInfo, "length");
              v54 = -[NSData bytes](self->_bitmapData, "bytes");
              v55 = -[QLCacheBlobInfo length](self->_bitmapDataBlobInfo, "length");
              *(_DWORD *)buf = 134218752;
              v63 = v52;
              v64 = 2048;
              v65 = v53;
              v66 = 2048;
              v67 = (unint64_t)v54;
              v68 = 2048;
              v69 = v55;
              v51 = "We can't get the bitmap data, so we will pretend we don't have this thumbnail plist %p length %llu b"
                    "itmap data %p length %llu";
              goto LABEL_39;
            }
LABEL_31:

            goto LABEL_32;
          }
          v24 = [QLCacheThumbnailData alloc];
          cacheId = self->_cacheId;
          v60 = v24;
          -[QLTGeneratorThumbnailRequest request](self->_generatorRequest, "request");
          v25 = objc_claimAutoreleasedReturnValue();
          size = self->_size;
          bitmapFormat = self->_bitmapFormat;
          v28 = self->_bitmapData;
          v29 = self->_metadata;
          flavor = self->_flavor;
          v31 = -[QLTGeneratorThumbnailRequest badgeType](self->_generatorRequest, "badgeType");
          *(float *)&v32 = size;
          v33 = -[QLCacheThumbnailData initWithCacheId:thumbnailRequest:size:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:](v60, "initWithCacheId:thumbnailRequest:size:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:", cacheId, v25, bitmapFormat, v28, v29, flavor, v32, self->_contentRect.origin.x, self->_contentRect.origin.y, self->_contentRect.size.width, self->_contentRect.size.height, v31);
        }
        else
        {
          _log_5();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            v36 = self->_fileIdentifier;
            v37 = (void *)objc_opt_class();
            -[QLTGeneratorThumbnailRequest request](self->_generatorRequest, "request");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "_expectedThumbnailSizeForRequest:", v38);
            *(_DWORD *)buf = 138412546;
            v63 = v36;
            v64 = 2048;
            v65 = v39;
            _os_log_impl(&dword_1D54AE000, v35, OS_LOG_TYPE_INFO, "no data for %@ %f", buf, 0x16u);

          }
          v40 = [QLCacheThumbnailData alloc];
          v41 = self->_cacheId;
          -[QLTGeneratorThumbnailRequest request](self->_generatorRequest, "request");
          v25 = objc_claimAutoreleasedReturnValue();
          v42 = self->_size;
          v43 = -[QLTGeneratorThumbnailRequest badgeType](self->_generatorRequest, "badgeType");
          *(float *)&v44 = v42;
          v33 = -[QLCacheThumbnailData initWithCacheId:thumbnailRequest:size:badgeType:](v40, "initWithCacheId:thumbnailRequest:size:badgeType:", v41, v25, v43, v44);
        }
        v45 = self->_thumbnailData;
        self->_thumbnailData = v33;

        goto LABEL_31;
      }
    }
  }
LABEL_32:
  *a3 = objc_retainAutorelease(self->_thumbnailData);
  return self->_generatorRequest;
}

- (void)dealloc
{
  objc_super v3;

  -[QLDiskCacheQueryEnumerator _cleanUpValues](self, "_cleanUpValues");
  v3.receiver = self;
  v3.super_class = (Class)QLDiskCacheQueryEnumerator;
  -[QLDiskCacheQueryEnumerator dealloc](&v3, sel_dealloc);
}

- (QLDiskCacheQueryEnumerator)initWithDiskCache:(id)a3 thumbnailRequests:(id)a4
{
  id v7;
  QLDiskCacheQueryEnumerator *v8;
  QLDiskCacheQueryEnumerator *v9;
  uint64_t v10;
  NSMutableDictionary *generatorRequestBeingProcessed;
  NSMutableArray *v12;
  NSMutableArray *sameGeneratorRequests;
  QLTGeneratorThumbnailRequest *generatorRequest;
  QLCacheBlobInfo *v15;
  QLCacheBlobInfo *bitmapDataBlobInfo;
  QLCacheBlobInfo *v17;
  QLCacheBlobInfo *metadataBlobInfo;

  v7 = a4;
  v8 = -[QLDiskCacheEnumerator initWithDiskCache:](self, "initWithDiskCache:", a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_generatorRequests, a4);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
    generatorRequestBeingProcessed = v9->_generatorRequestBeingProcessed;
    v9->_generatorRequestBeingProcessed = (NSMutableDictionary *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sameGeneratorRequests = v9->_sameGeneratorRequests;
    v9->_sameGeneratorRequests = v12;

    generatorRequest = v9->_generatorRequest;
    v9->_generatorRequest = 0;

    v15 = objc_alloc_init(QLCacheBlobInfo);
    bitmapDataBlobInfo = v9->_bitmapDataBlobInfo;
    v9->_bitmapDataBlobInfo = v15;

    v17 = objc_alloc_init(QLCacheBlobInfo);
    metadataBlobInfo = v9->_metadataBlobInfo;
    v9->_metadataBlobInfo = v17;

    v9->_valueFound = 1;
    -[QLDiskCacheQueryEnumerator _createNewCacheIndexDatabaseEnumerator](v9, "_createNewCacheIndexDatabaseEnumerator");
  }

  return v9;
}

- (void)_createNewCacheIndexDatabaseEnumerator
{
  id v3;
  NSDictionary *generatorRequests;
  void *v5;
  QLCacheIndexDatabaseQueryEnumerator *v6;
  QLCacheIndexDatabaseQueryEnumerator *cacheIndexDatabaseEnumerator;
  id v8;
  _QWORD v9[5];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  generatorRequests = self->_generatorRequests;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__QLDiskCacheQueryEnumerator__createNewCacheIndexDatabaseEnumerator__block_invoke;
  v9[3] = &unk_1E99D2F70;
  v9[4] = self;
  v8 = v3;
  v10 = v8;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](generatorRequests, "enumerateKeysAndObjectsUsingBlock:", v9);
  if (objc_msgSend(v8, "count"))
  {
    -[QLDiskCache indexDatabase](self->super._diskCache, "indexDatabase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queryCacheForFileRequests:", v8);
    v6 = (QLCacheIndexDatabaseQueryEnumerator *)objc_claimAutoreleasedReturnValue();
    cacheIndexDatabaseEnumerator = self->_cacheIndexDatabaseEnumerator;
    self->_cacheIndexDatabaseEnumerator = v6;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataBlobInfo, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_bitmapDataBlobInfo, 0);
  objc_storeStrong((id *)&self->_bitmapData, 0);
  objc_storeStrong((id *)&self->_bitmapFormat, 0);
  objc_storeStrong((id *)&self->_fileIdentifier, 0);
  objc_storeStrong((id *)&self->_generatorRequest, 0);
  objc_storeStrong((id *)&self->_thumbnailData, 0);
  objc_storeStrong((id *)&self->_sameGeneratorRequests, 0);
  objc_storeStrong((id *)&self->_cacheIndexDatabaseEnumerator, 0);
  objc_storeStrong((id *)&self->_generatorRequestBeingProcessed, 0);
  objc_storeStrong((id *)&self->_generatorRequests, 0);
}

void __68__QLDiskCacheQueryEnumerator_nextThumbnailRequestWithThumbnailData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  objc_msgSend(v3, "sameGeneratorRequests");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v4);

}

- (NSMutableArray)sameGeneratorRequests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

BOOL __61__QLDiskCacheQueryEnumerator__findThumbnailRequestsToProcess__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;
  _BOOL8 v11;

  v3 = a2;
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "iconMode");
  if (v5 == objc_msgSend(v4, "iconMode")
    && objc_msgSend(v3, "needsLowQualityThumbnailGeneration")
    && (objc_msgSend(*(id *)(a1 + 32), "size"),
        objc_msgSend(v4, "minimumDimension"),
        objc_msgSend(v4, "maximumPixelSize"),
        QLSThumbnailSizeIsSufficientForLowQuality())
    && (v6 = objc_msgSend(*(id *)(a1 + 32), "badgeType"), v6 == objc_msgSend(v3, "badgeType"))
    && (v7 = objc_msgSend(*(id *)(a1 + 32), "iconVariant"), v7 == objc_msgSend(v4, "iconVariant"))
    && (v8 = objc_msgSend(*(id *)(a1 + 32), "interpolationQuality"),
        v8 == objc_msgSend(v4, "interpolationQuality")))
  {
    objc_msgSend(*(id *)(a1 + 32), "bitmapDataBlobInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "externalGeneratorDataHash");
      v11 = v10 == objc_msgSend(v4, "externalThumbnailGeneratorDataHash");
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

BOOL __61__QLDiskCacheQueryEnumerator__findThumbnailRequestsToProcess__block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  float v12;
  _BOOL8 v13;
  float v14;
  void *v15;

  v3 = a2;
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_expectedThumbnailSizeForRequest:", v4);
  v6 = v5;
  v7 = objc_msgSend(*(id *)(a1 + 32), "iconMode");
  if (v7 != objc_msgSend(v4, "iconMode"))
    goto LABEL_11;
  v8 = objc_msgSend(*(id *)(a1 + 32), "badgeType");
  if (v8 != objc_msgSend(v3, "badgeType"))
    goto LABEL_11;
  v9 = objc_msgSend(*(id *)(a1 + 32), "iconVariant");
  if (v9 != objc_msgSend(v4, "iconVariant"))
    goto LABEL_11;
  v10 = objc_msgSend(*(id *)(a1 + 32), "interpolationQuality");
  if (v10 != objc_msgSend(v4, "interpolationQuality"))
    goto LABEL_11;
  v11 = objc_msgSend(*(id *)(a1 + 32), "externalGeneratorDataHash");
  if (v11 != objc_msgSend(v4, "externalThumbnailGeneratorDataHash"))
    goto LABEL_11;
  objc_msgSend(*(id *)(a1 + 32), "size");
  if (v6 != v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "size");
    if (v6 < v14 && objc_msgSend(v3, "needsLowQualityThumbnailGeneration"))
    {
      objc_msgSend(*(id *)(a1 + 32), "bitmapDataBlobInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v15, "length") != 0;

      goto LABEL_12;
    }
LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  v13 = 1;
LABEL_12:

  return v13;
}

- (void)setGeneratorRequestBeingProcessed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (QLCacheBlobInfo)bitmapDataBlobInfo
{
  return (QLCacheBlobInfo *)objc_getProperty(self, a2, 136, 1);
}

- (void)setBitmapDataBlobInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void)setSameGeneratorRequests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setIconMode:(BOOL)a3
{
  self->_iconMode = a3;
}

- (void)setBadgeType:(unint64_t)a3
{
  self->_badgeType = a3;
}

- (void)setIconVariant:(int64_t)a3
{
  self->_iconVariant = a3;
}

- (void)setInterpolationQuality:(int)a3
{
  self->_interpolationQuality = a3;
}

- (void)setExternalGeneratorDataHash:(unint64_t)a3
{
  self->_externalGeneratorDataHash = a3;
}

- (void)setSize:(float)a3
{
  self->_size = a3;
}

- (double)moveThumbnailRequestsFromBeingProcessedToSameRequestIfTheyMatch:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double result;
  int v8;
  uint64_t v9;
  __int16 v10;
  const __CFString *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("YES");
  v4 = *a1;
  v5 = *(_QWORD *)(a2 + 88);
  if (!*(_BYTE *)(a2 + 65))
    v3 = CFSTR("NO");
  v6 = *(float *)(a2 + 112);
  v8 = 138413058;
  v9 = v4;
  v10 = 2112;
  v11 = v3;
  v12 = 2048;
  v13 = v5;
  v14 = 2048;
  v15 = v6;
  _os_log_debug_impl(&dword_1D54AE000, log, OS_LOG_TYPE_DEBUG, "make sure we are done with %@ icon mode %@ badge type %lu size %.1f", (uint8_t *)&v8, 0x2Au);
  return result;
}

@end
