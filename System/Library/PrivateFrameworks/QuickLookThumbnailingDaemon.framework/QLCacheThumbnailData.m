@implementation QLCacheThumbnailData

- (QLCacheThumbnailData)initWithCacheId:(unint64_t)a3 thumbnailRequest:(id)a4 size:(float)a5 bitmapFormat:(id)a6 bitmapData:(id)a7 metadata:(id)a8 flavor:(int)a9 contentRect:(CGRect)a10 badgeType:(unint64_t)a11
{
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  QLCacheThumbnailData *v30;
  uint64_t v32;
  id v33;
  void *v36;

  height = a10.size.height;
  width = a10.size.width;
  y = a10.origin.y;
  x = a10.origin.x;
  v33 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a4;
  objc_msgSend(v21, "fileIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "fileIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fileIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "version");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v21, "iconMode");
  v26 = objc_msgSend(v21, "iconVariant");
  v27 = objc_msgSend(v21, "interpolationQuality");
  v28 = objc_msgSend(v21, "externalThumbnailGeneratorDataHash");

  LODWORD(v32) = a9;
  *(float *)&v29 = a5;
  v30 = -[QLCacheThumbnailData initWithCacheId:fileIdentifier:version:size:iconMode:iconVariant:interpolationQuality:hitCount:lastHitDate:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:externalGeneratorDataHash:](self, "initWithCacheId:fileIdentifier:version:size:iconMode:iconVariant:interpolationQuality:hitCount:lastHitDate:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:externalGeneratorDataHash:", a3, v22, v24, v25, v26, v27, v29, x, y, width, height, 0, 0, v20, v19, v33,
          v32,
          a11,
          v28);

  return v30;
}

- (QLCacheThumbnailData)initWithCacheId:(unint64_t)a3 fileIdentifier:(id)a4 version:(id)a5 size:(float)a6 iconMode:(BOOL)a7 iconVariant:(int64_t)a8 interpolationQuality:(int)a9 hitCount:(unint64_t)a10 lastHitDate:(id)a11 bitmapFormat:(id)a12 bitmapData:(id)a13 metadata:(id)a14 flavor:(int)a15 contentRect:(CGRect)a16 badgeType:(unint64_t)a17 externalGeneratorDataHash:(unint64_t)a18
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  QLCacheThumbnailData *v32;
  QLCacheThumbnailData *v33;
  dispatch_queue_t v34;
  OS_dispatch_queue *queue;
  id obj;
  id v41;
  objc_super v42;

  height = a16.size.height;
  width = a16.size.width;
  y = a16.origin.y;
  x = a16.origin.x;
  v27 = a4;
  obj = a5;
  v28 = a5;
  v29 = a11;
  v30 = a12;
  v31 = a13;
  v41 = a14;
  v42.receiver = self;
  v42.super_class = (Class)QLCacheThumbnailData;
  v32 = -[QLCacheThumbnailData init](&v42, sel_init);
  v33 = v32;
  if (v32)
  {
    v32->_cacheId = a3;
    objc_storeStrong((id *)&v32->_fileIdentifier, a4);
    objc_storeStrong((id *)&v33->_version, obj);
    v33->_size = a6;
    v33->_iconMode = a7;
    v33->_interpolationQuality = a9;
    v33->_iconVariant = a8;
    v33->_badgeType = a17;
    v33->_hitCount = a10;
    objc_storeStrong((id *)&v33->_lastHitDate, a11);
    objc_storeStrong((id *)&v33->_bitmapFormat, a12);
    objc_storeStrong((id *)&v33->_bitmapData, a13);
    objc_storeStrong((id *)&v33->_metadata, a14);
    v33->_flavor = a15;
    v33->_contentRect.origin.x = x;
    v33->_contentRect.origin.y = y;
    v33->_contentRect.size.width = width;
    v33->_contentRect.size.height = height;
    v33->_externalGeneratorDataHash = a18;
    v34 = dispatch_queue_create("quicklookd.thumbnail", 0);
    queue = v33->_queue;
    v33->_queue = (OS_dispatch_queue *)v34;

    v33->_state = a3 != 0;
  }

  return v33;
}

- (QLCacheFileIdentifier)fileIdentifier
{
  return self->_fileIdentifier;
}

- (float)size
{
  return self->_size;
}

- (BOOL)iconMode
{
  return self->_iconMode;
}

- (unint64_t)badgeType
{
  return self->_badgeType;
}

- (NSData)bitmapData
{
  return self->_bitmapData;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (BOOL)hasData
{
  return self->_bitmapData != 0;
}

- (int)flavor
{
  return self->_flavor;
}

- (unint64_t)externalGeneratorDataHash
{
  return self->_externalGeneratorDataHash;
}

- (CGRect)contentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentRect.origin.x;
  y = self->_contentRect.origin.y;
  width = self->_contentRect.size.width;
  height = self->_contentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (QLTBitmapFormat)bitmapFormat
{
  return self->_bitmapFormat;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)QLCacheThumbnailData;
  -[QLCacheThumbnailData dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastHitDate, 0);
  objc_storeStrong((id *)&self->_metadataToValidate, 0);
  objc_storeStrong((id *)&self->_bitmapDataToValidate, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_bitmapData, 0);
  objc_storeStrong((id *)&self->_bitmapFormat, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_fileIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (QLCacheThumbnailData)initWithCacheId:(unint64_t)a3 fileIdentifier:(id)a4 version:(id)a5 size:(float)a6 iconMode:(BOOL)a7 iconVariant:(int64_t)a8 interpolationQuality:(int)a9 badgeType:(unint64_t)a10 externalGeneratorDataHash:(unint64_t)a11 hitCount:(unint64_t)a12 lastHitDate:(id)a13
{
  _BOOL8 v13;
  id v19;
  id v20;
  id v21;
  void *v22;
  double v23;
  QLCacheThumbnailData *v24;
  uint64_t v26;

  v13 = a7;
  v19 = a13;
  v20 = a5;
  v21 = a4;
  v22 = (void *)objc_opt_new();
  LODWORD(v26) = 0;
  *(float *)&v23 = a6;
  v24 = -[QLCacheThumbnailData initWithCacheId:fileIdentifier:version:size:iconMode:iconVariant:interpolationQuality:hitCount:lastHitDate:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:externalGeneratorDataHash:](self, "initWithCacheId:fileIdentifier:version:size:iconMode:iconVariant:interpolationQuality:hitCount:lastHitDate:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:externalGeneratorDataHash:", a3, v21, v20, v13, a8, a9, v23, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), a12, v19, v22, 0, 0,
          v26,
          a10,
          a11);

  return v24;
}

- (QLCacheThumbnailData)initWithCacheId:(unint64_t)a3 thumbnailRequest:(id)a4 size:(float)a5 badgeType:(unint64_t)a6
{
  id v10;
  void *v11;
  double v12;
  QLCacheThumbnailData *v13;

  v10 = a4;
  v11 = (void *)objc_opt_new();
  *(float *)&v12 = a5;
  v13 = -[QLCacheThumbnailData initWithCacheId:thumbnailRequest:size:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:](self, "initWithCacheId:thumbnailRequest:size:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:", a3, v10, v11, 0, 0, 0, v12, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), a6);

  return v13;
}

- (QLCacheThumbnailData)initWithUnsavedDataForThumbnailRequest:(id)a3 size:(float)a4 bitmapFormat:(id)a5 bitmapData:(id)a6 reservationInfo:(id)a7 metadata:(id)a8 reservationInfo:(id)a9 flavor:(int)a10 contentRect:(CGRect)a11 badgeType:(unint64_t)a12
{
  double height;
  double width;
  double y;
  double x;
  id v24;
  double v25;
  QLCacheThumbnailData *v26;
  QLCacheThumbnailData *v27;
  id v29;

  height = a11.size.height;
  width = a11.size.width;
  y = a11.origin.y;
  x = a11.origin.x;
  v29 = a7;
  v24 = a9;
  *(float *)&v25 = a4;
  v26 = -[QLCacheThumbnailData initWithCacheId:thumbnailRequest:size:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:](self, "initWithCacheId:thumbnailRequest:size:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:", 0, a3, a5, a6, a8, a10, v25, x, y, width, height, a12);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_bitmapDataToValidate, a7);
    objc_storeStrong((id *)&v27->_metadataToValidate, a9);
  }

  return v27;
}

- (BOOL)setState:(unint64_t)a3
{
  return -[QLCacheThumbnailData setState:changedState:](self, "setState:changedState:", a3, 0);
}

- (BOOL)setState:(unint64_t)a3 changedState:(BOOL *)a4
{
  NSObject *queue;
  char v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__QLCacheThumbnailData_setState_changedState___block_invoke;
  v7[3] = &unk_1E99D2F28;
  v7[6] = a4;
  v7[7] = a3;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(queue, v7);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __46__QLCacheThumbnailData_setState_changedState___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t result;
  _BYTE *v5;
  uint64_t v6;

  v2 = *(_BYTE **)(a1 + 48);
  if (v2)
    *v2 = 1;
  v3 = *(_QWORD *)(a1 + 56);
  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if (v3 == result)
  {
    v5 = *(_BYTE **)(a1 + 48);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    if (v5)
      *v5 = 0;
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 56);
    if (v6 == 1 || v6 == 2)
    {
      result = objc_msgSend(*(id *)(a1 + 32), "state");
      if (!result)
      {
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = *(_QWORD *)(a1 + 56);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      }
    }
  }
  return result;
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)totalBufferSize
{
  return self->_totalBufferSize;
}

- (QLThumbnailVersion)version
{
  return self->_version;
}

- (unint64_t)cacheId
{
  return self->_cacheId;
}

- (int64_t)iconVariant
{
  return self->_iconVariant;
}

- (int)interpolationQuality
{
  return self->_interpolationQuality;
}

- (QLCacheBlobInfo)bitmapDataToValidate
{
  return self->_bitmapDataToValidate;
}

- (void)setBitmapDataToValidate:(id)a3
{
  objc_storeStrong((id *)&self->_bitmapDataToValidate, a3);
}

- (QLCacheBlobInfo)metadataToValidate
{
  return self->_metadataToValidate;
}

- (void)setMetadataToValidate:(id)a3
{
  objc_storeStrong((id *)&self->_metadataToValidate, a3);
}

- (unint64_t)hitCount
{
  return self->_hitCount;
}

- (NSDate)lastHitDate
{
  return self->_lastHitDate;
}

@end
