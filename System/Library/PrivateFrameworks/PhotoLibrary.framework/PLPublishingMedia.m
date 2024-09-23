@implementation PLPublishingMedia

- (PLPublishingMedia)init
{
  return -[PLPublishingMedia initWithAsset:](self, "initWithAsset:", 0);
}

- (PLPublishingMedia)initWithAsset:(id)a3
{
  id v3;

  v3 = a3;
  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPublishingMedia.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));
  if (!+[PLPublishingMedia isValidPublishingMedia:](PLPublishingMedia, "isValidPublishingMedia:", v3))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPublishingMedia.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[PLPublishingMedia isValidPublishingMedia:asset]"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (id)objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[PLPublishingMedia initWithManagedAsset:](self, "initWithManagedAsset:", v3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[PLPublishingMedia initWithAVURLAsset:](self, "initWithAVURLAsset:", v3);
  else
    return 0;
}

- (PLPublishingMedia)initWithManagedAsset:(id)a3
{
  PLPublishingMedia *v5;
  PLPublishingMedia *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  objc_super v13;

  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPublishingMedia.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("managedAsset"));
  v13.receiver = self;
  v13.super_class = (Class)PLPublishingMedia;
  v5 = -[PLPublishingMedia init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PLPublishingMedia setAsset:](v5, "setAsset:", a3);
    v7 = objc_msgSend(a3, "isVideo");
    v8 = objc_msgSend(a3, "pathForVideoFile");
    v9 = objc_msgSend(a3, "isHDVideo");
    objc_msgSend(MEMORY[0x1E0D71B20], "durationForManagedAsset:applyVideoAdjustments:", a3, 1);
    v11 = v10;
    -[PLPublishingMedia setIsVideo:](v6, "setIsVideo:", v7);
    -[PLPublishingMedia setPathForVideoFile:](v6, "setPathForVideoFile:", v8);
    -[PLPublishingMedia setAssetURL:](v6, "setAssetURL:", objc_msgSend(a3, "assetURL"));
    -[PLPublishingMedia setIsHDVideo:](v6, "setIsHDVideo:", v9);
    -[PLPublishingMedia setDuration:](v6, "setDuration:", v11);
  }
  return v6;
}

- (PLPublishingMedia)initWithAVURLAsset:(id)a3
{
  PLPublishingMedia *v5;
  PLPublishingMedia *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  _BOOL8 v14;
  double value;
  CMTime v17;
  CMTime time;
  objc_super v19;

  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPublishingMedia.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("avAsset"));
  v19.receiver = self;
  v19.super_class = (Class)PLPublishingMedia;
  v5 = -[PLPublishingMedia init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PLPublishingMedia setAsset:](v5, "setAsset:", a3);
    v7 = (void *)objc_msgSend(a3, "URL");
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", objc_msgSend(v7, "pathExtension"));
    v9 = objc_msgSend(v8, "conformsToType:", *MEMORY[0x1E0CEC568]);
    v10 = objc_msgSend((id)objc_msgSend(a3, "URL"), "path");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], a3), "firstObject"), "naturalSize");
    if (v11 < 720.0 || v12 < 1280.0)
    {
      v14 = v12 >= 720.0 && v11 >= 1280.0;
      if (!a3)
        goto LABEL_15;
    }
    else
    {
      v14 = 1;
      if (!a3)
      {
LABEL_15:
        memset(&time, 0, sizeof(time));
        goto LABEL_16;
      }
    }
    objc_msgSend(a3, "duration");
LABEL_16:
    CMTimeConvertScale(&v17, &time, 1, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    value = (double)v17.value;
    -[PLPublishingMedia setIsVideo:](v6, "setIsVideo:", v9);
    -[PLPublishingMedia setPathForVideoFile:](v6, "setPathForVideoFile:", v10);
    -[PLPublishingMedia setAssetURL:](v6, "setAssetURL:", v7);
    -[PLPublishingMedia setIsHDVideo:](v6, "setIsHDVideo:", v14);
    -[PLPublishingMedia setDuration:](v6, "setDuration:", value);
  }
  return v6;
}

- (unint64_t)hash
{
  return objc_msgSend(self->_asset, "hash");
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(self->_asset, "isEqual:", objc_msgSend(a3, "asset"));
  else
    return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLPublishingMedia;
  -[PLPublishingMedia dealloc](&v3, sel_dealloc);
}

- (id)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (void)setIsVideo:(BOOL)a3
{
  self->_isVideo = a3;
}

- (NSString)pathForVideoFile
{
  return self->_pathForVideoFile;
}

- (void)setPathForVideoFile:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (void)setAssetURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (BOOL)isHDVideo
{
  return self->_isHDVideo;
}

- (void)setIsHDVideo:(BOOL)a3
{
  self->_isHDVideo = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

+ (BOOL)isValidPublishingMedia:(id)a3
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
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

@end
