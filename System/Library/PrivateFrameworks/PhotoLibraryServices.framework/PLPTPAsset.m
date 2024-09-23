@implementation PLPTPAsset

- (PLPTPAsset)initWithPTPAsset:(id)a3
{
  id *v5;
  PLPTPAsset *v6;
  uint64_t v7;
  NSData *event;
  uint64_t v9;
  NSString *filename;
  uint64_t v11;
  NSString *createdFilename;
  uint64_t v13;
  NSString *originalFilename;
  uint64_t v15;
  NSString *fullDirectoryPath;
  uint64_t v17;
  NSNumber *objectCompressedSize;
  uint64_t v19;
  NSString *fingerprint;
  uint64_t v21;
  NSString *originatingAssetID;
  uint64_t v23;
  NSNumber *thumbOffset;
  uint64_t v25;
  NSNumber *thumbCompressedSize;
  uint64_t v27;
  NSString *modificationDateString;
  uint64_t v29;
  NSString *captureDateString;
  uint64_t v31;
  NSString *durationString;
  uint64_t v33;
  NSString *locationString;
  uint64_t v35;
  NSString *groupUUID;
  uint64_t v37;
  NSString *burstUUID;
  uint64_t v39;
  NSString *relatedUUID;
  uint64_t v41;
  NSString *spatialOverCaptureGroupIdentifier;
  PLPTPAsset *v43;
  void *v45;
  objc_super v46;

  v5 = (id *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPAsset.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset != nil"));

  }
  v46.receiver = self;
  v46.super_class = (Class)PLPTPAsset;
  v6 = -[PLPTPAsset init](&v46, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5[1], "copy");
    event = v6->_event;
    v6->_event = (NSData *)v7;

    objc_storeStrong((id *)&v6->_assetHandle, v5[2]);
    v9 = objc_msgSend(v5[3], "copy");
    filename = v6->_filename;
    v6->_filename = (NSString *)v9;

    v11 = objc_msgSend(v5[4], "copy");
    createdFilename = v6->_createdFilename;
    v6->_createdFilename = (NSString *)v11;

    v6->_deleted = *((_BYTE *)v5 + 40);
    v13 = objc_msgSend(v5[6], "copy");
    originalFilename = v6->_originalFilename;
    v6->_originalFilename = (NSString *)v13;

    v15 = objc_msgSend(v5[7], "copy");
    fullDirectoryPath = v6->_fullDirectoryPath;
    v6->_fullDirectoryPath = (NSString *)v15;

    v6->_exifAvailable = *((_BYTE *)v5 + 64);
    v17 = objc_msgSend(v5[9], "copy");
    objectCompressedSize = v6->_objectCompressedSize;
    v6->_objectCompressedSize = (NSNumber *)v17;

    v19 = objc_msgSend(v5[10], "copy");
    fingerprint = v6->_fingerprint;
    v6->_fingerprint = (NSString *)v19;

    v21 = objc_msgSend(v5[11], "copy");
    originatingAssetID = v6->_originatingAssetID;
    v6->_originatingAssetID = (NSString *)v21;

    v23 = objc_msgSend(v5[12], "copy");
    thumbOffset = v6->_thumbOffset;
    v6->_thumbOffset = (NSNumber *)v23;

    v25 = objc_msgSend(v5[13], "copy");
    thumbCompressedSize = v6->_thumbCompressedSize;
    v6->_thumbCompressedSize = (NSNumber *)v25;

    v6->_imagePixSize = (CGSize)*((_OWORD *)v5 + 7);
    v6->_thumbPixSize = (CGSize)*((_OWORD *)v5 + 8);
    v6->_desiredOrientation = (int64_t)v5[18];
    v27 = objc_msgSend(v5[19], "copy");
    modificationDateString = v6->_modificationDateString;
    v6->_modificationDateString = (NSString *)v27;

    v29 = objc_msgSend(v5[20], "copy");
    captureDateString = v6->_captureDateString;
    v6->_captureDateString = (NSString *)v29;

    v31 = objc_msgSend(v5[21], "copy");
    durationString = v6->_durationString;
    v6->_durationString = (NSString *)v31;

    v33 = objc_msgSend(v5[22], "copy");
    locationString = v6->_locationString;
    v6->_locationString = (NSString *)v33;

    v35 = objc_msgSend(v5[23], "copy");
    groupUUID = v6->_groupUUID;
    v6->_groupUUID = (NSString *)v35;

    v37 = objc_msgSend(v5[24], "copy");
    burstUUID = v6->_burstUUID;
    v6->_burstUUID = (NSString *)v37;

    v6->_burstPicked = *((_BYTE *)v5 + 200);
    v6->_burstFavorite = *((_BYTE *)v5 + 201);
    v6->_burstFirstPicked = *((_BYTE *)v5 + 202);
    v6->_highFrameRateVideo = *((_BYTE *)v5 + 203);
    v6->_timeLapseVideo = *((_BYTE *)v5 + 204);
    v39 = objc_msgSend(v5[26], "copy");
    relatedUUID = v6->_relatedUUID;
    v6->_relatedUUID = (NSString *)v39;

    v41 = objc_msgSend(v5[27], "copy");
    spatialOverCaptureGroupIdentifier = v6->_spatialOverCaptureGroupIdentifier;
    v6->_spatialOverCaptureGroupIdentifier = (NSString *)v41;

    v6->_conversionGroup = (int64_t)v5[28];
    v6->_videoCodec = *((_DWORD *)v5 + 58);
    objc_storeStrong((id *)&v6->_contentType, v5[30]);
    v6->_isHDR = *((_BYTE *)v5 + 248);
    v43 = v6;
  }

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PLPTPAsset initWithPTPAsset:]([PLMutablePTPAsset alloc], "initWithPTPAsset:", self);
}

- (id)description
{
  return -[PLPTPAsset _pl_prettyDescriptionWithIndent:](self, "_pl_prettyDescriptionWithIndent:", 0);
}

- (NSString)cacheKey
{
  void *v3;
  NSString *relatedUUID;
  int64_t v5;
  const __CFString *modificationDateString;

  v3 = (void *)MEMORY[0x1E0CB3940];
  relatedUUID = self->_relatedUUID;
  v5 = -[PLPTPAssetHandle type](self->_assetHandle, "type");
  modificationDateString = (const __CFString *)self->_modificationDateString;
  if (!modificationDateString)
    modificationDateString = CFSTR("unknown");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%ld-%@"), relatedUUID, v5, modificationDateString);
}

- (id)_pl_prettyDescriptionWithIndent:(int64_t)a3
{
  void *v4;
  void *v5;

  +[PLDescriptionBuilder prettyMultiLineDescriptionBuilderWithObject:indent:](PLDescriptionBuilder, "prettyMultiLineDescriptionBuilderWithObject:indent:", self, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("event"), "@", &self->_event);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("assetHandle"), "@", &self->_assetHandle);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("filename"), "@", &self->_filename);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("createdFilename"), "@", &self->_createdFilename);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("deleted"), "B", &self->_deleted);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("originalFilename"), "@", &self->_originalFilename);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("fullDirectoryPath"), "@", &self->_fullDirectoryPath);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("exifAvailable"), "B", &self->_exifAvailable);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("objectCompressedSize"), "@", &self->_objectCompressedSize);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("fingerprint"), "@", &self->_fingerprint);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("originatingAssetID"), "@", &self->_originatingAssetID);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("thumbOffset"), "@", &self->_thumbOffset);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("thumbCompressedSize"), "@", &self->_thumbCompressedSize);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("imagePixSize"), "{CGSize=dd}", &self->_imagePixSize);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("thumbPixSize"), "{CGSize=dd}", &self->_thumbPixSize);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("desiredOrientation"), "q", &self->_desiredOrientation);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("modificationDateString"), "@", &self->_modificationDateString);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("captureDateString"), "@", &self->_captureDateString);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("durationString"), "@", &self->_durationString);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("locationString"), "@", &self->_locationString);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("groupUUID"), "@", &self->_groupUUID);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("burstUUID"), "@", &self->_burstUUID);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("burstPicked"), "B", &self->_burstPicked);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("burstFavorite"), "B", &self->_burstFavorite);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("burstFirstPicked"), "B", &self->_burstFirstPicked);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("highFrameRateVideo"), "B", &self->_highFrameRateVideo);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("timeLapseVideo"), "B", &self->_timeLapseVideo);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("relatedUUID"), "@", &self->_relatedUUID);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("conversionGroup"), "q", &self->_conversionGroup);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("videoCodec"), "I", &self->_videoCodec);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("contentType"), "@", &self->_contentType);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("isHDR"), "B", &self->_isHDR);
  objc_msgSend(v4, "appendName:typeCode:value:", CFSTR("spatialOverCaptureGroupIdentifier"), "@", &self->_spatialOverCaptureGroupIdentifier);
  objc_msgSend(v4, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PLPTPAssetHandle)assetHandle
{
  return self->_assetHandle;
}

- (NSString)filename
{
  return self->_filename;
}

- (NSString)createdFilename
{
  return self->_createdFilename;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (NSString)fullDirectoryPath
{
  return self->_fullDirectoryPath;
}

- (BOOL)isExifAvailable
{
  return self->_exifAvailable;
}

- (NSNumber)objectCompressedSize
{
  return self->_objectCompressedSize;
}

- (NSString)fingerprint
{
  return self->_fingerprint;
}

- (NSString)originatingAssetID
{
  return self->_originatingAssetID;
}

- (NSNumber)thumbOffset
{
  return self->_thumbOffset;
}

- (NSNumber)thumbCompressedSize
{
  return self->_thumbCompressedSize;
}

- (CGSize)imagePixSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imagePixSize.width;
  height = self->_imagePixSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)thumbPixSize
{
  double width;
  double height;
  CGSize result;

  width = self->_thumbPixSize.width;
  height = self->_thumbPixSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)desiredOrientation
{
  return self->_desiredOrientation;
}

- (NSString)modificationDateString
{
  return self->_modificationDateString;
}

- (NSString)captureDateString
{
  return self->_captureDateString;
}

- (NSString)durationString
{
  return self->_durationString;
}

- (NSString)locationString
{
  return self->_locationString;
}

- (NSString)groupUUID
{
  return self->_groupUUID;
}

- (NSString)spatialOverCaptureGroupIdentifier
{
  return self->_spatialOverCaptureGroupIdentifier;
}

- (NSString)burstUUID
{
  return self->_burstUUID;
}

- (BOOL)isBurstPicked
{
  return self->_burstPicked;
}

- (BOOL)isBurstFavorite
{
  return self->_burstFavorite;
}

- (BOOL)isBurstFirstPicked
{
  return self->_burstFirstPicked;
}

- (BOOL)isHighFrameRateVideo
{
  return self->_highFrameRateVideo;
}

- (BOOL)isTimeLapseVideo
{
  return self->_timeLapseVideo;
}

- (NSString)relatedUUID
{
  return self->_relatedUUID;
}

- (int64_t)conversionGroup
{
  return self->_conversionGroup;
}

- (unsigned)videoCodec
{
  return self->_videoCodec;
}

- (UTType)contentType
{
  return self->_contentType;
}

- (BOOL)isHDR
{
  return self->_isHDR;
}

- (NSData)event
{
  return self->_event;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_spatialOverCaptureGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_relatedUUID, 0);
  objc_storeStrong((id *)&self->_burstUUID, 0);
  objc_storeStrong((id *)&self->_groupUUID, 0);
  objc_storeStrong((id *)&self->_locationString, 0);
  objc_storeStrong((id *)&self->_durationString, 0);
  objc_storeStrong((id *)&self->_captureDateString, 0);
  objc_storeStrong((id *)&self->_modificationDateString, 0);
  objc_storeStrong((id *)&self->_thumbCompressedSize, 0);
  objc_storeStrong((id *)&self->_thumbOffset, 0);
  objc_storeStrong((id *)&self->_originatingAssetID, 0);
  objc_storeStrong((id *)&self->_fingerprint, 0);
  objc_storeStrong((id *)&self->_objectCompressedSize, 0);
  objc_storeStrong((id *)&self->_fullDirectoryPath, 0);
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_createdFilename, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_assetHandle, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
