@implementation QLDiskCacheAllThumbnailPerFileEnumerator

- (QLDiskCacheAllThumbnailPerFileEnumerator)initWithDiskCache:(id)a3 fileIdentifier:(id)a4
{
  id v7;
  QLDiskCacheAllThumbnailPerFileEnumerator *v8;
  QLCacheBlobInfo *v9;
  QLCacheBlobInfo *bitmapDataBlobInfo;
  QLCacheBlobInfo *v11;
  QLCacheBlobInfo *metadataBlobInfo;

  v7 = a4;
  v8 = -[QLDiskCacheEnumerator initWithDiskCache:](self, "initWithDiskCache:", a3);
  if (v8)
  {
    v9 = objc_alloc_init(QLCacheBlobInfo);
    bitmapDataBlobInfo = v8->_bitmapDataBlobInfo;
    v8->_bitmapDataBlobInfo = v9;

    v11 = objc_alloc_init(QLCacheBlobInfo);
    metadataBlobInfo = v8->_metadataBlobInfo;
    v8->_metadataBlobInfo = v11;

    objc_storeStrong((id *)&v8->_fileIdentifier, a4);
  }

  return v8;
}

- (void)_createNewCacheIndexDatabaseEnumeratorWithFileIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  QLCacheIndexFileRequest *v6;
  void *v7;
  QLCacheIndexDatabaseQueryEnumerator *v8;
  QLCacheIndexDatabaseQueryEnumerator *cacheIndexDatabaseEnumerator;
  id v10;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v10 = objc_alloc_init(v4);
  v6 = -[QLCacheIndexFileRequest initWithFileIdentifier:]([QLCacheIndexFileRequest alloc], "initWithFileIdentifier:", v5);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, v5);

  -[QLDiskCache indexDatabase](self->super._diskCache, "indexDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryCacheForFileRequests:", v10);
  v8 = (QLCacheIndexDatabaseQueryEnumerator *)objc_claimAutoreleasedReturnValue();
  cacheIndexDatabaseEnumerator = self->_cacheIndexDatabaseEnumerator;
  self->_cacheIndexDatabaseEnumerator = v8;

}

- (id)nextThumbnailData
{
  QLCacheThumbnailData *thumbnailData;
  QLCacheBlobInfo *bitmapDataBlobInfo;
  QLCacheBlobInfo *metadataBlobInfo;
  void *v6;
  uint64_t v7;
  QLCacheBlobInfo *v8;
  QLCacheBlobInfo *v9;
  QLCacheBlobInfo *v10;
  QLCacheBlobInfo *v11;
  void *v12;
  void *v13;
  NSData *v14;
  NSData *bitmapData;
  void *v16;
  void *v17;
  NSData *v18;
  NSData *metadata;
  void *v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  NSData *v25;
  NSData *v26;
  int v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  unint64_t v36;
  unint64_t v37;
  double v38;
  QLCacheThumbnailData *v39;
  QLCacheThumbnailData *v40;
  int v41;
  int v42;
  int64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  void *v48;
  double v49;
  QLCacheThumbnailData *v50;
  QLCacheThumbnailData *v51;
  uint64_t v53;
  uint64_t v54;
  unsigned int v55;
  int64_t v56;
  _BOOL4 v57;
  _BOOL4 v58;
  unint64_t v59;
  unint64_t v60;
  QLCacheThumbnailData *v61;
  QLCacheThumbnailData *v62;

  if (!self->_cacheIndexDatabaseEnumerator)
    -[QLDiskCacheAllThumbnailPerFileEnumerator _createNewCacheIndexDatabaseEnumeratorWithFileIdentifier:](self, "_createNewCacheIndexDatabaseEnumeratorWithFileIdentifier:", self->_fileIdentifier);
  thumbnailData = self->_thumbnailData;
  self->_thumbnailData = 0;

  bitmapDataBlobInfo = self->_bitmapDataBlobInfo;
  self->_bitmapDataBlobInfo = 0;

  metadataBlobInfo = self->_metadataBlobInfo;
  self->_metadataBlobInfo = 0;

  if (-[QLCacheIndexDatabaseQueryEnumerator nextThumbnailInfo](self->_cacheIndexDatabaseEnumerator, "nextThumbnailInfo"))
  {
    -[QLCacheIndexDatabaseQueryEnumerator bitmapDataBlobInfo](self->_cacheIndexDatabaseEnumerator, "bitmapDataBlobInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      -[QLCacheIndexDatabaseQueryEnumerator bitmapDataBlobInfo](self->_cacheIndexDatabaseEnumerator, "bitmapDataBlobInfo");
      v8 = (QLCacheBlobInfo *)objc_claimAutoreleasedReturnValue();
      v9 = self->_bitmapDataBlobInfo;
      self->_bitmapDataBlobInfo = v8;

      -[QLCacheIndexDatabaseQueryEnumerator metadataBlobInfo](self->_cacheIndexDatabaseEnumerator, "metadataBlobInfo");
      v10 = (QLCacheBlobInfo *)objc_claimAutoreleasedReturnValue();
      v11 = self->_metadataBlobInfo;
      self->_metadataBlobInfo = v10;

      -[QLDiskCache blobDatabase](self->super._diskCache, "blobDatabase");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLCacheIndexDatabaseQueryEnumerator bitmapDataBlobInfo](self->_cacheIndexDatabaseEnumerator, "bitmapDataBlobInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (NSData *)objc_msgSend(v12, "copyBlobWithInfo:", v13);
      bitmapData = self->_bitmapData;
      self->_bitmapData = v14;

      -[QLDiskCache blobDatabase](self->super._diskCache, "blobDatabase");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLCacheIndexDatabaseQueryEnumerator metadataBlobInfo](self->_cacheIndexDatabaseEnumerator, "metadataBlobInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (NSData *)objc_msgSend(v16, "copyBlobWithInfo:", v17);
      metadata = self->_metadata;
      self->_metadata = v18;

      v61 = [QLCacheThumbnailData alloc];
      v59 = -[QLCacheIndexDatabaseQueryEnumerator cacheId](self->_cacheIndexDatabaseEnumerator, "cacheId");
      -[QLCacheIndexDatabaseQueryEnumerator fileIdentifier](self->_cacheIndexDatabaseEnumerator, "fileIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLCacheIndexDatabaseQueryEnumerator size](self->_cacheIndexDatabaseEnumerator, "size");
      v22 = v21;
      v57 = -[QLCacheIndexDatabaseQueryEnumerator iconMode](self->_cacheIndexDatabaseEnumerator, "iconMode") != 0;
      v56 = -[QLCacheIndexDatabaseQueryEnumerator iconVariant](self->_cacheIndexDatabaseEnumerator, "iconVariant");
      v55 = -[QLCacheIndexDatabaseQueryEnumerator interpolationQuality](self->_cacheIndexDatabaseEnumerator, "interpolationQuality");
      v54 = -[QLCacheIndexDatabaseQueryEnumerator hitCount](self->_cacheIndexDatabaseEnumerator, "hitCount");
      -[QLCacheIndexDatabaseQueryEnumerator lastHitDate](self->_cacheIndexDatabaseEnumerator, "lastHitDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLCacheIndexDatabaseQueryEnumerator bitmapFormat](self->_cacheIndexDatabaseEnumerator, "bitmapFormat");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = self->_bitmapData;
      v26 = self->_metadata;
      v27 = -[QLCacheIndexDatabaseQueryEnumerator flavor](self->_cacheIndexDatabaseEnumerator, "flavor");
      -[QLCacheIndexDatabaseQueryEnumerator contentRect](self->_cacheIndexDatabaseEnumerator, "contentRect");
      v29 = v28;
      v31 = v30;
      v33 = v32;
      v35 = v34;
      v36 = -[QLCacheIndexDatabaseQueryEnumerator badgeType](self->_cacheIndexDatabaseEnumerator, "badgeType");
      v37 = -[QLCacheIndexDatabaseQueryEnumerator externalGeneratorDataHash](self->_cacheIndexDatabaseEnumerator, "externalGeneratorDataHash");
      LODWORD(v53) = v27;
      LODWORD(v38) = v22;
      v39 = -[QLCacheThumbnailData initWithCacheId:fileIdentifier:version:size:iconMode:iconVariant:interpolationQuality:hitCount:lastHitDate:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:externalGeneratorDataHash:](v61, "initWithCacheId:fileIdentifier:version:size:iconMode:iconVariant:interpolationQuality:hitCount:lastHitDate:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:externalGeneratorDataHash:", v59, v20, 0, v57, v56, v55, v38, v29, v31, v33, v35, v54, v23, v24, v25, v26,
              v53,
              v36,
              v37);
      v40 = self->_thumbnailData;
      self->_thumbnailData = v39;

    }
    else
    {
      v62 = [QLCacheThumbnailData alloc];
      v60 = -[QLCacheIndexDatabaseQueryEnumerator cacheId](self->_cacheIndexDatabaseEnumerator, "cacheId");
      -[QLCacheIndexDatabaseQueryEnumerator fileIdentifier](self->_cacheIndexDatabaseEnumerator, "fileIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLCacheIndexDatabaseQueryEnumerator size](self->_cacheIndexDatabaseEnumerator, "size");
      v42 = v41;
      v58 = -[QLCacheIndexDatabaseQueryEnumerator iconMode](self->_cacheIndexDatabaseEnumerator, "iconMode") != 0;
      v43 = -[QLCacheIndexDatabaseQueryEnumerator iconVariant](self->_cacheIndexDatabaseEnumerator, "iconVariant");
      v44 = -[QLCacheIndexDatabaseQueryEnumerator interpolationQuality](self->_cacheIndexDatabaseEnumerator, "interpolationQuality");
      v45 = -[QLCacheIndexDatabaseQueryEnumerator badgeType](self->_cacheIndexDatabaseEnumerator, "badgeType");
      v46 = -[QLCacheIndexDatabaseQueryEnumerator externalGeneratorDataHash](self->_cacheIndexDatabaseEnumerator, "externalGeneratorDataHash");
      v47 = -[QLCacheIndexDatabaseQueryEnumerator hitCount](self->_cacheIndexDatabaseEnumerator, "hitCount");
      -[QLCacheIndexDatabaseQueryEnumerator lastHitDate](self->_cacheIndexDatabaseEnumerator, "lastHitDate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v49) = v42;
      v50 = -[QLCacheThumbnailData initWithCacheId:fileIdentifier:version:size:iconMode:iconVariant:interpolationQuality:badgeType:externalGeneratorDataHash:hitCount:lastHitDate:](v62, "initWithCacheId:fileIdentifier:version:size:iconMode:iconVariant:interpolationQuality:badgeType:externalGeneratorDataHash:hitCount:lastHitDate:", v60, v20, 0, v58, v43, v44, v49, v45, v46, v47, v48);
      v51 = self->_thumbnailData;
      self->_thumbnailData = v50;

    }
  }
  else
  {
    v20 = self->_thumbnailData;
    self->_thumbnailData = 0;
  }

  return self->_thumbnailData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataBlobInfo, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_bitmapDataBlobInfo, 0);
  objc_storeStrong((id *)&self->_bitmapData, 0);
  objc_storeStrong((id *)&self->_thumbnailData, 0);
  objc_storeStrong((id *)&self->_cacheIndexDatabaseEnumerator, 0);
  objc_storeStrong((id *)&self->_fileIdentifier, 0);
}

@end
