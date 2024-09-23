@implementation PUFilmstripAsset

- (PUFilmstripAsset)init
{
  return -[PUFilmstripAsset initWithNormalizedTime:asset:](self, "initWithNormalizedTime:asset:", 0, 0.0);
}

- (PUFilmstripAsset)initWithNormalizedTime:(double)a3 asset:(id)a4
{
  PUFilmstripAsset *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUFilmstripAsset;
  result = -[PUFilmstripAsset init](&v7, sel_init);
  if (result)
  {
    *(int64x2_t *)&result->_pixelWidth = vdupq_n_s64(1uLL);
    result->__normalizedTime = a3;
    result->__isSourceTimeAccurate = 0;
    result->__asset = (AVAsset *)a4;
  }
  return result;
}

- (double)sourceTime
{
  void *v3;
  void *v4;
  double Seconds;
  double v6;
  CMTime time;

  if (!-[PUFilmstripAsset _isSourceTimeAccurate](self, "_isSourceTimeAccurate"))
  {
    -[PUFilmstripAsset _asset](self, "_asset");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      objc_msgSend(v3, "pu_duration");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);

    -[PUFilmstripAsset _normalizedTime](self, "_normalizedTime");
    self->_sourceTime = Seconds * v6;
    -[PUFilmstripAsset _setSourceTimeAccurate:](self, "_setSourceTimeAccurate:", 1);
  }
  return self->_sourceTime;
}

- (void)loadSourceTimeWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD, double);
  AVAsset *asset;
  _QWORD v6[4];
  void (**v7)(id, uint64_t, _QWORD, double);
  id v8;
  id location;

  v4 = (void (**)(id, uint64_t, _QWORD, double))a3;
  if (-[PUFilmstripAsset _isSourceTimeAccurate](self, "_isSourceTimeAccurate"))
  {
    if (v4)
      v4[2](v4, 1, 0, self->_sourceTime);
  }
  else
  {
    objc_initWeak(&location, self);
    asset = self->__asset;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__PUFilmstripAsset_loadSourceTimeWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E589F6E0;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    -[AVAsset pu_loadDurationWithCompletionHandler:](asset, "pu_loadDurationWithCompletionHandler:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

- (unint64_t)pixelWidth
{
  return self->_pixelHeight;
}

- (unint64_t)pixelHeight
{
  return self->_pixelHeight;
}

- (CLLocation)location
{
  return 0;
}

- (unint64_t)mediaType
{
  return 1;
}

- (unint64_t)mediaSubtypes
{
  return 0;
}

- (int64_t)playbackStyle
{
  return 1;
}

- (unsigned)playbackVariation
{
  return 0;
}

- (BOOL)isHidden
{
  return 0;
}

- (BOOL)isLivePhoto
{
  return 0;
}

- (BOOL)canPlayPhotoIris
{
  return 0;
}

- (BOOL)isPhotoIrisPlaceholder
{
  return 0;
}

- (BOOL)canPlayLoopingVideo
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisStillDisplayTime
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisVideoDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  return self;
}

- (double)duration
{
  return 0.0;
}

- (BOOL)isFavorite
{
  return 0;
}

- (BOOL)isAnimatedImage
{
  return 0;
}

- (NSDate)creationDate
{
  return 0;
}

- (NSDate)modificationDate
{
  return 0;
}

- (NSString)uuid
{
  return 0;
}

- (unint64_t)isContentEqualTo:(id)a3
{
  return 1;
}

- (double)aspectRatio
{
  double v3;

  v3 = (double)-[PUFilmstripAsset pixelWidth](self, "pixelWidth");
  return v3 / (double)-[PUFilmstripAsset pixelHeight](self, "pixelHeight");
}

- (NSString)localizedGeoDescription
{
  return 0;
}

- (BOOL)isTemporaryPlaceholder
{
  return 0;
}

- (BOOL)hasPhotoColorAdjustments
{
  return 0;
}

- (NSString)uniformTypeIdentifier
{
  return 0;
}

- (unint64_t)originalFilesize
{
  return 0;
}

- (BOOL)isGuestAsset
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  -[PUFilmstripAsset _normalizedTime](self, "_normalizedTime");
  v6 = v5;
  -[PUFilmstripAsset _asset](self, "_asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithNormalizedTime:asset:", v7, v6);

  return v8;
}

- (int64_t)compare:(id)a3
{
  double v4;
  double sourceTime;

  objc_msgSend(a3, "sourceTime");
  sourceTime = self->_sourceTime;
  if (v4 <= sourceTime)
    return v4 < sourceTime;
  else
    return -1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  AVAsset *v7;
  AVAsset *asset;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "_normalizedTime");
    v9 = v6 == self->__normalizedTime
      && (objc_msgSend(v5, "_asset"),
          v7 = (AVAsset *)objc_claimAutoreleasedReturnValue(),
          asset = self->__asset,
          v7,
          v7 == asset)
      && objc_msgSend(v5, "pixelHeight") == self->_pixelHeight
      && objc_msgSend(v5, "pixelWidth") == self->_pixelWidth;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return self->_pixelWidth ^ self->_pixelHeight ^ (unint64_t)self->__normalizedTime;
}

- (void)setSourceTime:(double)a3
{
  self->_sourceTime = a3;
}

- (AVAsset)_asset
{
  return self->__asset;
}

- (void)_setAsset:(id)a3
{
  self->__asset = (AVAsset *)a3;
}

- (double)_normalizedTime
{
  return self->__normalizedTime;
}

- (void)_setNormalizedTime:(double)a3
{
  self->__normalizedTime = a3;
}

- (BOOL)_isSourceTimeAccurate
{
  return self->__isSourceTimeAccurate;
}

- (void)_setSourceTimeAccurate:(BOOL)a3
{
  self->__isSourceTimeAccurate = a3;
}

void __56__PUFilmstripAsset_loadSourceTimeWithCompletionHandler___block_invoke(uint64_t a1, CMTime *a2, uint64_t a3, void *a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  double v10;
  NSObject *v11;
  uint64_t v12;
  CMTime v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if ((a3 & 1) != 0)
  {
    if (!WeakRetained)
      goto LABEL_11;
    if ((objc_msgSend(WeakRetained, "_isSourceTimeAccurate") & 1) == 0)
    {
      objc_msgSend(v9, "_normalizedTime");
      v13 = *a2;
      objc_msgSend(v9, "setSourceTime:", v10 * CMTimeGetSeconds(&v13));
      objc_msgSend(v9, "_setSourceTimeAccurate:", 1);
    }
  }
  else
  {
    PLOneUpGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v13.value) = 138412290;
      *(CMTimeValue *)((char *)&v13.value + 4) = (CMTimeValue)v7;
      _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_ERROR, "Failed to load video duration. Error: %@", (uint8_t *)&v13, 0xCu);
    }

  }
  v12 = *(_QWORD *)(a1 + 32);
  if (v12 && v9)
  {
    objc_msgSend(v9, "sourceTime");
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, a3, v7);
  }
LABEL_11:

}

@end
