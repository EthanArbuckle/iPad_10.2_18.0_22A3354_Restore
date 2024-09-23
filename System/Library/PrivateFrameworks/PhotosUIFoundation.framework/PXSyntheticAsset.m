@implementation PXSyntheticAsset

- (PXSyntheticAsset)init
{
  return -[PXSyntheticAsset initWithConfiguration:](self, "initWithConfiguration:", &__block_literal_global_5572);
}

- (PXSyntheticAsset)initWithConfiguration:(id)a3
{
  void (**v4)(id, id);
  char *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __int128 *v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = (void (**)(id, id))a3;
  v18.receiver = self;
  v18.super_class = (Class)PXSyntheticAsset;
  v5 = -[PXSyntheticAsset init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v7;

    v9 = (__int128 *)MEMORY[0x24BDBF070];
    *(int64x2_t *)(v5 + 120) = vdupq_n_s64(0x407F400000000000uLL);
    v10 = *v9;
    v11 = v9[1];
    *(_OWORD *)(v5 + 136) = *v9;
    *(_OWORD *)(v5 + 152) = v11;
    *(_OWORD *)(v5 + 168) = v10;
    *(_OWORD *)(v5 + 184) = v11;
    *(_OWORD *)(v5 + 200) = v10;
    *(_OWORD *)(v5 + 216) = v11;
    *(_OWORD *)(v5 + 232) = v10;
    *(_OWORD *)(v5 + 248) = v11;
    *((_QWORD *)v5 + 3) = 1;
    *((_OWORD *)v5 + 3) = xmmword_24438A5B0;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v5 + 8);
    *((_QWORD *)v5 + 8) = v12;

    *((_DWORD *)v5 + 3) = 1056964608;
    objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v14;

    v4[2](v4, v5);
    objc_msgSend(v5, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v5 + 14) = objc_msgSend(v16, "hash");

  }
  return (PXSyntheticAsset *)v5;
}

- (void)setUuid:(id)a3
{
  NSString *v4;
  NSString *uuid;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  uuid = self->_uuid;
  self->_uuid = v4;

}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void)setPreferredCropRect:(CGRect)a3
{
  self->_preferredCropRect = a3;
}

- (void)setAcceptableCropRect:(CGRect)a3
{
  self->_acceptableCropRect = a3;
}

- (void)setBestPlaybackRect:(CGRect)a3
{
  self->_bestPlaybackRect = a3;
}

- (void)setFaceAreaRect:(CGRect)a3
{
  self->_faceAreaRect = a3;
}

- (CGRect)preferredCropAssetRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[PXSyntheticAsset preferredCropRect](self, "preferredCropRect");
  -[PXSyntheticAsset _cropAssetRectFromCropRect:](self, "_cropAssetRectFromCropRect:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)acceptableCropAssetRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[PXSyntheticAsset acceptableCropRect](self, "acceptableCropRect");
  -[PXSyntheticAsset _cropAssetRectFromCropRect:](self, "_cropAssetRectFromCropRect:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)bestPlaybackAssetRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[PXSyntheticAsset bestPlaybackRect](self, "bestPlaybackRect");
  -[PXSyntheticAsset _cropAssetRectFromCropRect:](self, "_cropAssetRectFromCropRect:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)faceAreaAssetRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[PXSyntheticAsset faceAreaRect](self, "faceAreaRect");
  -[PXSyntheticAsset _cropAssetRectFromCropRect:](self, "_cropAssetRectFromCropRect:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setPreferredCropAssetRect:(CGRect)a3
{
  -[PXSyntheticAsset _cropRectFromCropAssetRect:](self, "_cropRectFromCropAssetRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PXSyntheticAsset setPreferredCropRect:](self, "setPreferredCropRect:");
}

- (void)setAcceptableCropAssetRect:(CGRect)a3
{
  -[PXSyntheticAsset _cropRectFromCropAssetRect:](self, "_cropRectFromCropAssetRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PXSyntheticAsset setAcceptableCropRect:](self, "setAcceptableCropRect:");
}

- (void)setBestPlaybackAssetRect:(CGRect)a3
{
  -[PXSyntheticAsset _cropRectFromCropAssetRect:](self, "_cropRectFromCropAssetRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PXSyntheticAsset setBestPlaybackRect:](self, "setBestPlaybackRect:");
}

- (void)setFaceAreaAssetRect:(CGRect)a3
{
  -[PXSyntheticAsset _cropRectFromCropAssetRect:](self, "_cropRectFromCropAssetRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PXSyntheticAsset setFaceAreaRect:](self, "setFaceAreaRect:");
}

- (CGRect)_cropAssetRectFromCropRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsNull(a3))
  {
    v8 = *MEMORY[0x24BDBF070];
    v9 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v10 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v11 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }
  else
  {
    -[PXSyntheticAsset size](self, "size");
    v13 = v12;
    v15 = v14;
    v8 = *MEMORY[0x24BDBEFB0] + x * v12;
    v9 = *(double *)(MEMORY[0x24BDBEFB0] + 8) + (1.0 - (y + height)) * v14;
    v10 = width * v13;
    v11 = height * v15;
  }
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)_cropRectFromCropAssetRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsNull(a3))
  {
    v8 = *MEMORY[0x24BDBF070];
    v9 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v10 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v11 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }
  else
  {
    -[PXSyntheticAsset size](self, "size");
    v14 = v13;
    v8 = x - *MEMORY[0x24BDBEFB0];
    v11 = 0.0;
    v10 = 0.0;
    if (v14 != 0.0)
    {
      v8 = v8 / v14;
      v10 = width / v14;
    }
    v15 = y - *(double *)(MEMORY[0x24BDBEFB0] + 8);
    if (v12 != 0.0)
    {
      v15 = v15 / v12;
      v11 = height / v12;
    }
    v9 = 1.0 - (v15 + v11);
  }
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)setPlaybackStyle:(int64_t)a3
{
  self->_playbackStyle = a3;
}

- (void)setLabel:(id)a3
{
  NSString *v4;
  NSString *label;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  label = self->_label;
  self->_label = v4;

}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void)setAudioScore:(float)a3
{
  self->_audioScore = a3;
}

- (NSString)serializableDescription
{
  void *v4;
  id v5;
  void *v6;
  void *v8;
  id v9;

  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSyntheticAsset.m"), 179, CFSTR("failed to archive data: %@"), v5);

  }
  objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setSceneClassifications:(id)a3
{
  id v4;
  NSSet *v5;
  NSSet *sceneClassifications;
  id v7;

  v4 = a3;
  v5 = (NSSet *)objc_msgSend(v4, "copy");
  sceneClassifications = self->_sceneClassifications;
  self->_sceneClassifications = v5;

  objc_msgSend(v4, "objectsPassingTest:", &__block_literal_global_13);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  self->_hasPeopleSceneMidOrGreaterConfidence = objc_msgSend(v7, "count") != 0;
}

- (void)setCurationScore:(double)a3
{
  self->_curationScore = a3;
}

- (void)setFaceCount:(int64_t)a3
{
  self->_faceCount = a3;
}

- (void)setLocalizedGeoDescription:(id)a3
{
  NSString *v4;
  NSString *localizedGeoDescription;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  localizedGeoDescription = self->_localizedGeoDescription;
  self->_localizedGeoDescription = v4;

}

- (void)setLocalCreationDate:(id)a3
{
  NSDate *v4;
  NSDate *localCreationDate;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  localCreationDate = self->_localCreationDate;
  self->_localCreationDate = v4;

}

- (void)encodeWithCoder:(id)a3
{
  NSString *uuid;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t playbackStyle;
  void *v13;
  NSString *label;
  void *v15;
  UIColor *tintColor;
  void *v17;
  float audioScore;
  double v19;
  id v20;

  uuid = self->_uuid;
  v5 = a3;
  NSStringFromSelector(sel_uuid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", uuid, v6);

  NSStringFromSelector(sel_size);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeCGSize:forKey:", v7, self->_size.width, self->_size.height);

  NSStringFromSelector(sel_preferredCropRect);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeCGRect:forKey:", v8, self->_preferredCropRect.origin.x, self->_preferredCropRect.origin.y, self->_preferredCropRect.size.width, self->_preferredCropRect.size.height);

  NSStringFromSelector(sel_acceptableCropRect);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeCGRect:forKey:", v9, self->_acceptableCropRect.origin.x, self->_acceptableCropRect.origin.y, self->_acceptableCropRect.size.width, self->_acceptableCropRect.size.height);

  NSStringFromSelector(sel_bestPlaybackRect);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeCGRect:forKey:", v10, self->_bestPlaybackRect.origin.x, self->_bestPlaybackRect.origin.y, self->_bestPlaybackRect.size.width, self->_bestPlaybackRect.size.height);

  NSStringFromSelector(sel_faceAreaRect);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeCGRect:forKey:", v11, self->_faceAreaRect.origin.x, self->_faceAreaRect.origin.y, self->_faceAreaRect.size.width, self->_faceAreaRect.size.height);

  playbackStyle = self->_playbackStyle;
  NSStringFromSelector(sel_playbackStyle);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", playbackStyle, v13);

  label = self->_label;
  NSStringFromSelector(sel_label);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", label, v15);

  tintColor = self->_tintColor;
  NSStringFromSelector(sel_tintColor);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", tintColor, v17);

  audioScore = self->_audioScore;
  NSStringFromSelector(sel_audioScore);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v19 = audioScore;
  objc_msgSend(v5, "encodeFloat:forKey:", v20, v19);

}

- (PXSyntheticAsset)initWithCoder:(id)a3
{
  id v4;
  PXSyntheticAsset *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *uuid;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  void *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  void *v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSString *label;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  UIColor *tintColor;
  void *v42;
  float v43;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)PXSyntheticAsset;
  v5 = -[PXSyntheticAsset init](&v45, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_uuid);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v8;

    NSStringFromSelector(sel_size);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeCGSizeForKey:", v10);
    v5->_size.width = v11;
    v5->_size.height = v12;

    NSStringFromSelector(sel_preferredCropRect);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeCGRectForKey:", v13);
    v5->_preferredCropRect.origin.x = v14;
    v5->_preferredCropRect.origin.y = v15;
    v5->_preferredCropRect.size.width = v16;
    v5->_preferredCropRect.size.height = v17;

    NSStringFromSelector(sel_acceptableCropRect);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeCGRectForKey:", v18);
    v5->_acceptableCropRect.origin.x = v19;
    v5->_acceptableCropRect.origin.y = v20;
    v5->_acceptableCropRect.size.width = v21;
    v5->_acceptableCropRect.size.height = v22;

    NSStringFromSelector(sel_bestPlaybackRect);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeCGRectForKey:", v23);
    v5->_bestPlaybackRect.origin.x = v24;
    v5->_bestPlaybackRect.origin.y = v25;
    v5->_bestPlaybackRect.size.width = v26;
    v5->_bestPlaybackRect.size.height = v27;

    NSStringFromSelector(sel_faceAreaRect);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeCGRectForKey:", v28);
    v5->_faceAreaRect.origin.x = v29;
    v5->_faceAreaRect.origin.y = v30;
    v5->_faceAreaRect.size.width = v31;
    v5->_faceAreaRect.size.height = v32;

    NSStringFromSelector(sel_playbackStyle);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_playbackStyle = objc_msgSend(v4, "decodeIntegerForKey:", v33);

    v34 = objc_opt_class();
    NSStringFromSelector(sel_label);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v34, v35);
    v36 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v36;

    v38 = objc_opt_class();
    NSStringFromSelector(sel_tintColor);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v38, v39);
    v40 = objc_claimAutoreleasedReturnValue();
    tintColor = v5->_tintColor;
    v5->_tintColor = (UIColor *)v40;

    NSStringFromSelector(sel_audioScore);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeFloatForKey:", v42);
    v5->_audioScore = v43;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PXSyntheticAsset *v4;
  PXSyntheticAsset *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (PXSyntheticAsset *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXSyntheticAsset uuid](self, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSyntheticAsset uuid](v5, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
        v8 = 1;
      else
        v8 = objc_msgSend(v6, "isEqualToString:", v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)pixelWidth
{
  double v2;

  -[PXSyntheticAsset size](self, "size");
  return (unint64_t)v2;
}

- (unint64_t)pixelHeight
{
  double v2;

  -[PXSyntheticAsset size](self, "size");
  return (unint64_t)v2;
}

- (double)aspectRatio
{
  double v2;
  double v3;

  -[PXSyntheticAsset size](self, "size");
  if (v2 == 0.0 || v3 == 0.0)
    return 1.0;
  if (v2 == *MEMORY[0x24BE71BF0] && v3 == *(double *)(MEMORY[0x24BE71BF0] + 8))
    return 1.0;
  else
    return fabs(v2 / v3);
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (void)setMediaSubtypes:(unint64_t)a3
{
  self->_mediaSubtypes = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)localCreationDate
{
  NSDate *localCreationDate;

  localCreationDate = self->_localCreationDate;
  if (localCreationDate)
    return localCreationDate;
  -[PXSyntheticAsset creationDate](self, "creationDate");
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isFavorite
{
  return 0;
}

- (BOOL)representsBurst
{
  return 0;
}

- (BOOL)isInCloud
{
  return 0;
}

- (BOOL)isInSharedLibrary
{
  return 0;
}

- (BOOL)isEligibleForAutoPlayback
{
  return 0;
}

- (unint64_t)thumbnailIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (Class)defaultImageProviderClass
{
  return (Class)objc_opt_class();
}

- (int64_t)isContentEqualTo:(id)a3
{
  if (-[PXSyntheticAsset isEqual:](self, "isEqual:", a3))
    return 2;
  else
    return 1;
}

- (double)duration
{
  return 0.0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoVideoDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x24BDC0D40];
  return self;
}

- (CGRect)bestCropRectForAspectRatio:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[PXSyntheticAsset bestCropRectForAspectRatio:verticalContentMode:cropMode:](self, "bestCropRectForAspectRatio:verticalContentMode:cropMode:", 0, 3, a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)bestCropRectForAspectRatio:(double)a3 verticalContentMode:(int64_t)a4 cropMode:(int64_t)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id PFCropUtilitiesCoreClass;
  unint64_t v17;
  unint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect result;

  -[PXSyntheticAsset faceAreaRect](self, "faceAreaRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = 1.0 - (v14 + v12);
  PFCropUtilitiesCoreClass = getPFCropUtilitiesCoreClass();
  v17 = -[PXSyntheticAsset pixelWidth](self, "pixelWidth");
  v18 = -[PXSyntheticAsset pixelHeight](self, "pixelHeight");
  -[PXSyntheticAsset preferredCropRect](self, "preferredCropRect");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[PXSyntheticAsset acceptableCropRect](self, "acceptableCropRect");
  objc_msgSend(PFCropUtilitiesCoreClass, "bestCropRectForAspectRatio:verticalContentMode:cropMode:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:", a4, a5, v17, v18, a3, v20, v22, v24, v26, v27, v28, v29, v30, v9, *(_QWORD *)&v15, v11,
    *(_QWORD *)&v13);
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (CGRect)bestCropRectForAspectRatioV2:(double)a3 verticalContentMode:(int64_t)a4 cropMode:(int64_t)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id PFCropUtilitiesCoreClass;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect result;

  -[PXSyntheticAsset faceAreaRect](self, "faceAreaRect", a4, a5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = 1.0 - (v12 + v10);
  PFCropUtilitiesCoreClass = getPFCropUtilitiesCoreClass();
  v15 = -[PXSyntheticAsset pixelWidth](self, "pixelWidth");
  v16 = -[PXSyntheticAsset pixelHeight](self, "pixelHeight");
  -[PXSyntheticAsset preferredCropRect](self, "preferredCropRect");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[PXSyntheticAsset acceptableCropRect](self, "acceptableCropRect");
  objc_msgSend(PFCropUtilitiesCoreClass, "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:", v15, v16, 0, a3, *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24), v18, v20, v22, v24, v25, v26, v27, v28,
    v7,
    *(_QWORD *)&v13,
    v9,
    *(_QWORD *)&v11);
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (CGRect)suggestedCropForTargetSize:(CGSize)a3 withFocusRegion:(CGRect)a4
{
  double height;
  double width;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id PFCropUtilitiesCoreClass;
  double v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  CGRect result;

  height = a3.height;
  width = a3.width;
  -[PXSyntheticAsset faceAreaRect](self, "faceAreaRect");
  v45 = v7;
  v9 = v8;
  v11 = v10;
  v13 = 1.0 - (v12 + v10);
  PFCropUtilitiesCoreClass = getPFCropUtilitiesCoreClass();
  PXSizeGetAspectRatio(width, height);
  v16 = v15;
  v17 = -[PXSyntheticAsset pixelWidth](self, "pixelWidth");
  v18 = -[PXSyntheticAsset pixelHeight](self, "pixelHeight");
  -[PXSyntheticAsset preferredCropRect](self, "preferredCropRect");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[PXSyntheticAsset acceptableCropRect](self, "acceptableCropRect");
  objc_msgSend(PFCropUtilitiesCoreClass, "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:", v17, v18, 0, v16, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, v20, v22, v24, v26, v27, v28, v29, v30,
    v45,
    *(_QWORD *)&v13,
    v9,
    *(_QWORD *)&v11);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  -[PXSyntheticAsset size](self, "size");
  v40 = v36 * v39;
  v42 = v38 * v41;
  v43 = *MEMORY[0x24BDBEFB0] + v32 * v39;
  v44 = *(double *)(MEMORY[0x24BDBEFB0] + 8) + v34 * v41;
  result.size.height = v42;
  result.size.width = v40;
  result.origin.y = v44;
  result.origin.x = v43;
  return result;
}

- (CGRect)suggestedCropForTargetSize:(CGSize)a3 withOcclusionRegion:(CGRect)a4 andOutputCropScore:(double *)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  v5 = *MEMORY[0x24BDBF070];
  v6 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v7 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v8 = *(double *)(MEMORY[0x24BDBF070] + 24);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (double)weight
{
  return 1.0;
}

- (CGAffineTransform)transform
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x24BDBD8B8];
  v4 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
}

- (CGPoint)positionOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x24BDBEFB0];
  v3 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGRect)acceptableCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (CGRectIsNull(self->_acceptableCropRect))
  {
    -[PXSyntheticAsset preferredCropRect](self, "preferredCropRect");
  }
  else
  {
    x = self->_acceptableCropRect.origin.x;
    y = self->_acceptableCropRect.origin.y;
    width = self->_acceptableCropRect.size.width;
    height = self->_acceptableCropRect.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)photoLibrary
{
  return 0;
}

- (BOOL)hasAdjustments
{
  return 0;
}

- (id)localIdentifier
{
  return self->_uuid;
}

- (id)vcp_fingerprint:(id)a3
{
  return 0;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (int64_t)playbackStyle
{
  return self->_playbackStyle;
}

- (NSString)label
{
  return self->_label;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (unint64_t)mediaSubtypes
{
  return self->_mediaSubtypes;
}

- (NSSet)sceneClassifications
{
  return self->_sceneClassifications;
}

- (double)curationScore
{
  return self->_curationScore;
}

- (int64_t)faceCount
{
  return self->_faceCount;
}

- (NSString)localizedGeoDescription
{
  return self->_localizedGeoDescription;
}

- (float)audioScore
{
  return self->_audioScore;
}

- (BOOL)hasPeopleSceneMidOrGreaterConfidence
{
  return self->_hasPeopleSceneMidOrGreaterConfidence;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGRect)preferredCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_preferredCropRect.origin.x;
  y = self->_preferredCropRect.origin.y;
  width = self->_preferredCropRect.size.width;
  height = self->_preferredCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)bestPlaybackRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bestPlaybackRect.origin.x;
  y = self->_bestPlaybackRect.origin.y;
  width = self->_bestPlaybackRect.size.width;
  height = self->_bestPlaybackRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)faceAreaRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_faceAreaRect.origin.x;
  y = self->_faceAreaRect.origin.y;
  width = self->_faceAreaRect.size.width;
  height = self->_faceAreaRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localCreationDate, 0);
  objc_storeStrong((id *)&self->_localizedGeoDescription, 0);
  objc_storeStrong((id *)&self->_sceneClassifications, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

BOOL __44__PXSyntheticAsset_setSceneClassifications___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  _BOOL8 v4;

  v2 = a2;
  if (objc_msgSend(v2, "sceneIdentifier") == 881)
  {
    objc_msgSend(v2, "confidence");
    v4 = v3 >= 0.5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)syntheticAssetWithSerializableDescription:(id)a3
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;
  id v12;

  v5 = (objc_class *)MEMORY[0x24BDBCE50];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithBase64EncodedString:options:", v6, 0);

  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSyntheticAsset.m"), 172, CFSTR("failed to unarchive data: %@"), v9);

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
