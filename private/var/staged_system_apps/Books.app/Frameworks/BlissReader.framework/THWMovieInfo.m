@implementation THWMovieInfo

- (Class)layoutClass
{
  __objc2_class **v2;

  if (self->TSDMovieInfo_opaque[OBJC_IVAR___TSDMovieInfo_mAudioOnly])
    v2 = off_424EE8;
  else
    v2 = off_424F00;
  return (Class)objc_opt_class(*v2, a2);
}

- (Class)repClass
{
  __objc2_class **v2;

  if (self->TSDMovieInfo_opaque[OBJC_IVAR___TSDMovieInfo_mAudioOnly])
    v2 = off_424EF0;
  else
    v2 = off_424EF8;
  return (Class)objc_opt_class(*v2, a2);
}

- (THWMovieInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5
{
  THWMovieInfo *v5;
  THWMovieInfo *v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THWMovieInfo;
  v5 = -[THWMovieInfo initWithContext:geometry:style:](&v9, "initWithContext:geometry:style:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[THWMovieInfo setAllowsAirPlayVideo:](v5, "setAllowsAirPlayVideo:", 1);
    -[THWMovieInfo setUsesAirPlayVideoWhileAirPlayScreenIsActive:](v6, "setUsesAirPlayVideoWhileAirPlayScreenIsActive:", 1);
    LODWORD(v7) = 1.0;
    -[THWMovieInfo setStoppedVolume:](v6, "setStoppedVolume:", v7);
  }
  return v6;
}

- (THWMovieInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 movieRemoteURL:(id)a6 loadedAsset:(id)a7
{
  THWMovieInfo *v13;
  THWMovieInfo *v14;
  double v15;
  objc_super v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (a7)
  {
    objc_msgSend(a7, "duration");
  }
  else
  {
    v18 = 0;
    v19 = 0;
    v20 = 0;
  }
  objc_msgSend(a7, "tracks");
  v17.receiver = self;
  v17.super_class = (Class)THWMovieInfo;
  v13 = -[THWMovieInfo initWithContext:geometry:style:movieRemoteURL:loadedAsset:](&v17, "initWithContext:geometry:style:movieRemoteURL:loadedAsset:", a3, a4, a5, a6, a7);
  v14 = v13;
  if (v13)
  {
    -[THWMovieInfo setAllowsAirPlayVideo:](v13, "setAllowsAirPlayVideo:", 1);
    -[THWMovieInfo setUsesAirPlayVideoWhileAirPlayScreenIsActive:](v14, "setUsesAirPlayVideoWhileAirPlayScreenIsActive:", 1);
    LODWORD(v15) = 1.0;
    -[THWMovieInfo setStoppedVolume:](v14, "setStoppedVolume:", v15);
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_stoppedImage);
  v3.receiver = self;
  v3.super_class = (Class)THWMovieInfo;
  -[THWMovieInfo dealloc](&v3, "dealloc");
}

- (void)setStoppedImage:(CGImage *)a3
{
  CGImageRelease(self->_stoppedImage);
  self->_stoppedImage = a3;
  CGImageRetain(a3);
}

- (CGImage)stoppedImage
{
  return self->_stoppedImage;
}

- (void)setPosterImageInfo:(id)a3
{
  TSDImageInfo *posterImageInfo;
  TSDImageInfo *v6;

  posterImageInfo = self->_posterImageInfo;
  if (posterImageInfo != a3)
  {
    -[TSDImageInfo setParentInfo:](posterImageInfo, "setParentInfo:", 0);

    v6 = (TSDImageInfo *)a3;
    self->_posterImageInfo = v6;
    -[TSDImageInfo setParentInfo:](v6, "setParentInfo:", self);
  }
}

- (id)childInfos
{
  id result;

  result = -[THWMovieInfo posterImageInfo](self, "posterImageInfo");
  if (result)
    return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", -[THWMovieInfo posterImageInfo](self, "posterImageInfo"));
  return result;
}

- (NSString)progressKitID
{
  return self->_progressKitID;
}

- (void)setProgressKitID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)progressKitSectionID
{
  return self->_progressKitSectionID;
}

- (void)setProgressKitSectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (TSDImageInfo)posterImageInfo
{
  return self->_posterImageInfo;
}

- (double)stoppedTime
{
  return self->_stoppedTime;
}

- (void)setStoppedTime:(double)a3
{
  self->_stoppedTime = a3;
}

- (float)stoppedVolume
{
  return self->_stoppedVolume;
}

- (void)setStoppedVolume:(float)a3
{
  self->_stoppedVolume = a3;
}

- (THWAutoplayConfig)autoplayConfig
{
  return self->_autoplayConfig;
}

- (void)setAutoplayConfig:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

@end
