@implementation PLMutablePTPAsset

- (void)setEvent:(id)a3
{
  NSData *v4;
  NSData *event;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  event = self->super._event;
  self->super._event = v4;

}

- (void)setAssetHandle:(id)a3
{
  objc_storeStrong((id *)&self->super._assetHandle, a3);
}

- (void)setFilename:(id)a3
{
  NSString *v4;
  NSString *filename;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  filename = self->super._filename;
  self->super._filename = v4;

}

- (void)setCreatedFilename:(id)a3
{
  NSString *v4;
  NSString *createdFilename;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  createdFilename = self->super._createdFilename;
  self->super._createdFilename = v4;

}

- (void)setDeleted:(BOOL)a3
{
  self->super._deleted = a3;
}

- (void)setOriginalFilename:(id)a3
{
  NSString *v4;
  NSString *originalFilename;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  originalFilename = self->super._originalFilename;
  self->super._originalFilename = v4;

}

- (void)setFullDirectoryPath:(id)a3
{
  NSString *v4;
  NSString *fullDirectoryPath;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  fullDirectoryPath = self->super._fullDirectoryPath;
  self->super._fullDirectoryPath = v4;

}

- (void)setExifAvailable:(BOOL)a3
{
  self->super._exifAvailable = a3;
}

- (void)setObjectCompressedSize:(id)a3
{
  NSNumber *v4;
  NSNumber *objectCompressedSize;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  objectCompressedSize = self->super._objectCompressedSize;
  self->super._objectCompressedSize = v4;

}

- (void)setFingerprint:(id)a3
{
  NSString *v4;
  NSString *fingerprint;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  fingerprint = self->super._fingerprint;
  self->super._fingerprint = v4;

}

- (void)setOriginatingAssetID:(id)a3
{
  NSString *v4;
  NSString *originatingAssetID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  originatingAssetID = self->super._originatingAssetID;
  self->super._originatingAssetID = v4;

}

- (void)setThumbOffset:(id)a3
{
  NSNumber *v4;
  NSNumber *thumbOffset;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  thumbOffset = self->super._thumbOffset;
  self->super._thumbOffset = v4;

}

- (void)setThumbCompressedSize:(id)a3
{
  NSNumber *v4;
  NSNumber *thumbCompressedSize;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  thumbCompressedSize = self->super._thumbCompressedSize;
  self->super._thumbCompressedSize = v4;

}

- (void)setImagePixSize:(CGSize)a3
{
  self->super._imagePixSize = a3;
}

- (void)setThumbPixSize:(CGSize)a3
{
  self->super._thumbPixSize = a3;
}

- (void)setDesiredOrientation:(int64_t)a3
{
  self->super._desiredOrientation = a3;
}

- (void)setModificationDateString:(id)a3
{
  NSString *v4;
  NSString *modificationDateString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  modificationDateString = self->super._modificationDateString;
  self->super._modificationDateString = v4;

}

- (void)setCaptureDateString:(id)a3
{
  NSString *v4;
  NSString *captureDateString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  captureDateString = self->super._captureDateString;
  self->super._captureDateString = v4;

}

- (void)setDurationString:(id)a3
{
  NSString *v4;
  NSString *durationString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  durationString = self->super._durationString;
  self->super._durationString = v4;

}

- (void)setLocationString:(id)a3
{
  NSString *v4;
  NSString *locationString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  locationString = self->super._locationString;
  self->super._locationString = v4;

}

- (void)setGroupUUID:(id)a3
{
  NSString *v4;
  NSString *groupUUID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  groupUUID = self->super._groupUUID;
  self->super._groupUUID = v4;

}

- (void)setBurstUUID:(id)a3
{
  NSString *v4;
  NSString *burstUUID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  burstUUID = self->super._burstUUID;
  self->super._burstUUID = v4;

}

- (void)setBurstPicked:(BOOL)a3
{
  self->super._burstPicked = a3;
}

- (void)setBurstFavorite:(BOOL)a3
{
  self->super._burstFavorite = a3;
}

- (void)setBurstFirstPicked:(BOOL)a3
{
  self->super._burstFirstPicked = a3;
}

- (void)setHighFrameRateVideo:(BOOL)a3
{
  self->super._highFrameRateVideo = a3;
}

- (void)setTimeLapseVideo:(BOOL)a3
{
  self->super._timeLapseVideo = a3;
}

- (void)setRelatedUUID:(id)a3
{
  NSString *v4;
  NSString *relatedUUID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  relatedUUID = self->super._relatedUUID;
  self->super._relatedUUID = v4;

}

- (void)setSpatialOverCaptureGroupIdentifier:(id)a3
{
  NSString *v4;
  NSString *spatialOverCaptureGroupIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  spatialOverCaptureGroupIdentifier = self->super._spatialOverCaptureGroupIdentifier;
  self->super._spatialOverCaptureGroupIdentifier = v4;

}

- (void)setConversionGroup:(int64_t)a3
{
  self->super._conversionGroup = a3;
}

- (void)setVideoCodec:(unsigned int)a3
{
  self->super._videoCodec = a3;
}

- (void)setContentType:(id)a3
{
  objc_storeStrong((id *)&self->super._contentType, a3);
}

- (void)setIsHDR:(BOOL)a3
{
  self->super._isHDR = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PLPTPAsset initWithPTPAsset:]([PLPTPAsset alloc], "initWithPTPAsset:", self);
}

@end
