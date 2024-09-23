@implementation PXOneUpSharePlayAsset

- (PXOneUpSharePlayAsset)initWithUUID:(id)a3 mediaType:(int64_t)a4 mediaSubtypes:(unint64_t)a5 spatialMediaType:(signed __int16)a6 isSpatialPresentation:(BOOL)a7 playbackStyle:(int64_t)a8 pixelWidth:(unint64_t)a9 pixelHeight:(unint64_t)a10 duration:(double)a11 hdrGain:(id)a12 photoIrisStillDisplayTime:(id *)a13 photoIrisVideoDuration:(id *)a14 localizedGeoDescription:(id)a15 creationDate:(id)a16
{
  _BOOL8 v18;
  uint64_t v19;
  id v23;
  id v24;
  id v25;
  PXOneUpSharePlayAsset *v26;
  PXOneUpSharePlayAsset *v27;
  id v29;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v30;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v31;
  objc_super v32;

  v18 = a7;
  v19 = a6;
  v29 = a3;
  v23 = a12;
  v24 = a15;
  v25 = a16;
  v32.receiver = self;
  v32.super_class = (Class)PXOneUpSharePlayAsset;
  v26 = -[PXOneUpSharePlayAsset init](&v32, sel_init);
  v27 = v26;
  if (v26)
  {
    -[PXOneUpSharePlayAsset setUuid:](v26, "setUuid:", v29);
    -[PXOneUpSharePlayAsset setMediaType:](v27, "setMediaType:", a4);
    -[PXOneUpSharePlayAsset setMediaSubtypes:](v27, "setMediaSubtypes:", a5);
    -[PXOneUpSharePlayAsset setSpatialMediaType:](v27, "setSpatialMediaType:", v19);
    -[PXOneUpSharePlayAsset setIsSpatialPresentation:](v27, "setIsSpatialPresentation:", v18);
    -[PXOneUpSharePlayAsset setPlaybackStyle:](v27, "setPlaybackStyle:", a8);
    -[PXOneUpSharePlayAsset setPixelWidth:](v27, "setPixelWidth:", a9);
    -[PXOneUpSharePlayAsset setPixelHeight:](v27, "setPixelHeight:", a10);
    -[PXOneUpSharePlayAsset setDuration:](v27, "setDuration:", a11);
    -[PXOneUpSharePlayAsset setHdrGain:](v27, "setHdrGain:", v23);
    v31 = *a13;
    -[PXOneUpSharePlayAsset setPhotoIrisStillDisplayTime:](v27, "setPhotoIrisStillDisplayTime:", &v31);
    v30 = *a14;
    -[PXOneUpSharePlayAsset setPhotoIrisVideoDuration:](v27, "setPhotoIrisVideoDuration:", &v30);
    -[PXOneUpSharePlayAsset setLocalizedGeoDescription:](v27, "setLocalizedGeoDescription:", v24);
    -[PXOneUpSharePlayAsset setCreationDate:](v27, "setCreationDate:", v25);
  }

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  PXOneUpSharePlayAsset *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (PXOneUpSharePlayAsset *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PXOneUpSharePlayAsset uuid](self, "uuid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXOneUpSharePlayAsset uuid](v4, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSString)debugDescription
{
  void *v2;
  void *v3;

  -[PXOneUpSharePlayAsset uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isSpatialMedia
{
  return -[PXOneUpSharePlayAsset spatialMediaType](self, "spatialMediaType") != 0;
}

- (NSDate)localCreationDate
{
  return 0;
}

- (BOOL)isFavorite
{
  return 0;
}

- (BOOL)isEligibleForAutoPlayback
{
  return 0;
}

- (BOOL)isInCloud
{
  return 0;
}

- (BOOL)isPartOfStack
{
  return 0;
}

- (Class)defaultImageProviderClass
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXOneUpSharePlayAsset.m"), 110, CFSTR("Not Supported"));

  return 0;
}

- (unint64_t)thumbnailIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (CGRect)preferredCropRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0D71110];
  v3 = *(double *)(MEMORY[0x1E0D71110] + 8);
  v4 = *(double *)(MEMORY[0x1E0D71110] + 16);
  v5 = *(double *)(MEMORY[0x1E0D71110] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)representsBurst
{
  return 0;
}

- (CGRect)faceAreaRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isInSharedLibrary
{
  return 0;
}

- (float)audioScore
{
  return 0.0;
}

- (CGRect)acceptableCropRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0D71110];
  v3 = *(double *)(MEMORY[0x1E0D71110] + 8);
  v4 = *(double *)(MEMORY[0x1E0D71110] + 16);
  v5 = *(double *)(MEMORY[0x1E0D71110] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (int64_t)isContentEqualTo:(id)a3
{
  return 0;
}

- (double)aspectRatio
{
  unint64_t v3;
  unint64_t v4;
  double result;
  double v6;

  v3 = -[PXOneUpSharePlayAsset pixelWidth](self, "pixelWidth");
  v4 = -[PXOneUpSharePlayAsset pixelHeight](self, "pixelHeight");
  result = 1.0;
  if (v3 && v4)
  {
    v6 = (double)v4;
    if (*MEMORY[0x1E0D71130] != (double)v3 || *(double *)(MEMORY[0x1E0D71130] + 8) != v6)
      return (double)v3 / v6;
  }
  return result;
}

- (BOOL)isHidden
{
  return 0;
}

- (BOOL)isGuestAsset
{
  return 0;
}

- (BOOL)isTemporaryPlaceholder
{
  return 0;
}

- (BOOL)isLivePhoto
{
  return (-[PXOneUpSharePlayAsset mediaSubtypes](self, "mediaSubtypes") >> 3) & 1;
}

- (BOOL)canPlayPhotoIris
{
  return -[PXOneUpSharePlayAsset playbackStyle](self, "playbackStyle") == 3;
}

- (BOOL)isPhotoIrisPlaceholder
{
  return 0;
}

- (BOOL)canPlayLoopingVideo
{
  return -[PXOneUpSharePlayAsset playbackStyle](self, "playbackStyle") == 5;
}

- (BOOL)isAnimatedImage
{
  return -[PXOneUpSharePlayAsset playbackStyle](self, "playbackStyle") == 2;
}

- (BOOL)hasPhotoColorAdjustments
{
  return 0;
}

- (id)modificationDate
{
  return 0;
}

- (int64_t)originalFilesize
{
  return 0;
}

- (id)uniformTypeIdentifier
{
  return 0;
}

- (BOOL)hasPeopleSceneMidOrGreaterConfidence
{
  return 0;
}

- (signed)spatialMediaType
{
  return self->_spatialMediaType;
}

- (void)setSpatialMediaType:(signed __int16)a3
{
  self->_spatialMediaType = a3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (unint64_t)mediaSubtypes
{
  return self->_mediaSubtypes;
}

- (void)setMediaSubtypes:(unint64_t)a3
{
  self->_mediaSubtypes = a3;
}

- (BOOL)isSpatialPresentation
{
  return self->_isSpatialPresentation;
}

- (void)setIsSpatialPresentation:(BOOL)a3
{
  self->_isSpatialPresentation = a3;
}

- (int64_t)playbackStyle
{
  return self->_playbackStyle;
}

- (void)setPlaybackStyle:(int64_t)a3
{
  self->_playbackStyle = a3;
}

- (unint64_t)pixelWidth
{
  return self->_pixelWidth;
}

- (void)setPixelWidth:(unint64_t)a3
{
  self->_pixelWidth = a3;
}

- (unint64_t)pixelHeight
{
  return self->_pixelHeight;
}

- (void)setPixelHeight:(unint64_t)a3
{
  self->_pixelHeight = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSNumber)hdrGain
{
  return self->_hdrGain;
}

- (void)setHdrGain:(id)a3
{
  objc_storeStrong((id *)&self->_hdrGain, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisStillDisplayTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (void)setPhotoIrisStillDisplayTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_photoIrisStillDisplayTime.epoch = a3->var3;
  *(_OWORD *)&self->_photoIrisStillDisplayTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisVideoDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- (void)setPhotoIrisVideoDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_photoIrisVideoDuration.epoch = a3->var3;
  *(_OWORD *)&self->_photoIrisVideoDuration.value = v3;
}

- (NSString)localizedGeoDescription
{
  return self->_localizedGeoDescription;
}

- (void)setLocalizedGeoDescription:(id)a3
{
  objc_storeStrong((id *)&self->_localizedGeoDescription, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_localizedGeoDescription, 0);
  objc_storeStrong((id *)&self->_hdrGain, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
