@implementation TSDMovieInfo

- (TSPData)movieData
{
  return self->mMovieData;
}

- (void)setMovieData:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mMovieData = (TSPData *)a3;
}

- (NSURL)movieRemoteURL
{
  return self->mMovieRemoteURL;
}

- (void)setMovieRemoteURL:(id)a3
{
  NSURL *v5;

  -[TSPObject willModify](self, "willModify");
  v5 = (NSURL *)objc_msgSend(a3, "copy");

  self->mMovieRemoteURL = v5;
}

- (TSPData)importedAuxiliaryMovieData
{
  return self->mImportedAuxiliaryMovieData;
}

- (void)setImportedAuxiliaryMovieData:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mImportedAuxiliaryMovieData = (TSPData *)a3;
}

- (TSPData)audioOnlyImageData
{
  return self->mAudioOnlyImageData;
}

- (void)setAudioOnlyImageData:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mAudioOnlyImageData = (TSPData *)a3;
}

- (double)startTime
{
  return self->mStartTime;
}

- (void)setStartTime:(double)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mStartTime = a3;
}

- (double)endTime
{
  return self->mEndTime;
}

- (void)setEndTime:(double)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mEndTime = a3;
}

- (double)posterTime
{
  return self->mPosterTime;
}

- (void)setPosterTime:(double)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mPosterTime = a3;
}

- (unint64_t)loopOption
{
  return self->mLoopOption;
}

- (void)setLoopOption:(unint64_t)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mLoopOption = a3;
}

- (float)volume
{
  return self->mVolume;
}

- (void)setVolume:(float)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mVolume = a3;
}

- (BOOL)isAudioOnly
{
  return self->mAudioOnly;
}

- (void)setAudioOnly:(BOOL)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mAudioOnly = a3;
}

- (BOOL)allowsAirPlayVideo
{
  return self->mAllowsAirPlayVideo;
}

- (void)setAllowsAirPlayVideo:(BOOL)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mAllowsAirPlayVideo = a3;
}

- (BOOL)usesAirPlayVideoWhileAirPlayScreenIsActive
{
  return self->mUsesAirPlayVideoWhileAirPlayScreenIsActive;
}

- (void)setUsesAirPlayVideoWhileAirPlayScreenIsActive:(BOOL)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mUsesAirPlayVideoWhileAirPlayScreenIsActive = a3;
}

- (int)controlStyle
{
  return self->mControlStyle;
}

- (void)setControlStyle:(int)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mControlStyle = a3;
}

- (NSURL)urlForMPMPC
{
  return self->mURLForMPMPC;
}

- (void)setUrlForMPMPC:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mURLForMPMPC = (NSURL *)a3;
}

+ (double)defaultPosterTimeForDuration:(double)a3
{
  return a3 * 0.0;
}

- (TSDMovieInfo)initWithContext:(id)a3 geometry:(id)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieInfo initWithContext:geometry:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieInfo.m"), 81, CFSTR("please call the other init methods"));
  return 0;
}

- (TSDMovieInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5
{
  TSDMovieInfo *v6;
  TSDMovieInfo *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSDMovieInfo;
  v6 = -[TSDMediaInfo initWithContext:geometry:](&v9, sel_initWithContext_geometry_, a3, a4);
  v7 = v6;
  if (v6)
  {
    -[TSDMovieInfo setStyle:](v6, "setStyle:", a5);
    v7->mVolume = 1.0;
  }
  return v7;
}

- (TSDMovieInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 movieData:(id)a6 loadedAsset:(id)a7
{
  TSDMovieInfo *v9;

  v9 = -[TSDMovieInfo initWithContext:geometry:style:](self, "initWithContext:geometry:style:", a3, a4, a5);
  if (v9)
  {
    v9->mMovieData = (TSPData *)a6;
    -[TSDMovieInfo p_setPropertiesFromLoadedAsset:](v9, "p_setPropertiesFromLoadedAsset:", a7);
  }
  return v9;
}

- (TSDMovieInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 movieRemoteURL:(id)a6 loadedAsset:(id)a7
{
  TSDMovieInfo *v9;

  v9 = -[TSDMovieInfo initWithContext:geometry:style:](self, "initWithContext:geometry:style:", a3, a4, a5);
  if (v9)
  {
    v9->mMovieRemoteURL = (NSURL *)objc_msgSend(a6, "copy");
    -[TSDMovieInfo p_setPropertiesFromLoadedAsset:](v9, "p_setPropertiesFromLoadedAsset:", a7);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDMovieInfo;
  -[TSDDrawableInfo dealloc](&v3, sel_dealloc);
}

- (id)copyWithContext:(id)a3
{
  return -[TSDMovieInfo copyWithContext:stylesheet:](self, "copyWithContext:stylesheet:", a3, 0);
}

- (id)copyWithContext:(id)a3 stylesheet:(id)a4
{
  char *v7;
  TSPObjectContext *v8;
  TSSStylesheet *v9;
  void *v10;
  uint64_t v11;
  TSSStyleMapper *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TSDMovieInfo;
  v7 = -[TSDMediaInfo copyWithContext:](&v14, sel_copyWithContext_);
  if (v7)
  {
    *((_QWORD *)v7 + 21) = -[TSPData copyWithContext:](self->mMovieData, "copyWithContext:", a3);
    *((_QWORD *)v7 + 22) = -[NSURL copy](self->mMovieRemoteURL, "copy");
    *((_QWORD *)v7 + 25) = *(_QWORD *)&self->mStartTime;
    *((_QWORD *)v7 + 26) = *(_QWORD *)&self->mEndTime;
    *((_QWORD *)v7 + 27) = *(_QWORD *)&self->mPosterTime;
    *((_QWORD *)v7 + 31) = self->mLoopOption;
    *((_DWORD *)v7 + 64) = LODWORD(self->mVolume);
    v7[288] = self->mAudioOnly;
    v7[260] = self->mStreaming;
    *((_QWORD *)v7 + 24) = -[TSPData copyWithContext:](self->mAudioOnlyImageData, "copyWithContext:", a3);
    *((_QWORD *)v7 + 28) = -[TSPData copyWithContext:](self->mPosterImageData, "copyWithContext:", a3);
    *(CGSize *)(v7 + 232) = self->mNaturalSize;
    v7[268] = self->mAllowsAirPlayVideo;
    v7[269] = self->mUsesAirPlayVideoWhileAirPlayScreenIsActive;
    *((_DWORD *)v7 + 66) = self->mControlStyle;
    *((_QWORD *)v7 + 34) = -[NSURL copy](self->mURLForMPMPC, "copy");
    if (a4)
    {
LABEL_11:
      v12 = -[TSSStyleMapper initWithTargetStylesheet:newStyleDOLCContext:]([TSSStyleMapper alloc], "initWithTargetStylesheet:newStyleDOLCContext:", a4, 0);
      objc_opt_class();
      -[TSSStyleMapper mappedStyleForStyle:](v12, "mappedStyleForStyle:", self->mStyle);
      *((_QWORD *)v7 + 35) = (id)TSUDynamicCast();

      return v7;
    }
    objc_msgSend(a3, "documentObject");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = (TSPObjectContext *)a3;
    }
    else
    {
      -[TSPObjectContext documentObject](-[TSPObject context](self, "context"), "documentObject");
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v9 = -[TSSStyle stylesheet](self->mStyle, "stylesheet");
LABEL_9:
        a4 = v9;
        if (!v9)
        {
          v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieInfo copyWithContext:stylesheet:]");
          objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieInfo.m"), 188, CFSTR("invalid nil value for '%s'"), "stylesheet");
          a4 = 0;
        }
        goto LABEL_11;
      }
      v8 = -[TSPObject context](self, "context");
    }
    v9 = (TSSStylesheet *)-[TSPObject performSelector:](-[TSPObjectContext documentObject](v8, "documentObject"), "performSelector:", sel_stylesheet);
    goto LABEL_9;
  }
  return v7;
}

- (id)mediaDisplayName
{
  if (-[TSDMovieInfo movieData](self, "movieData"))
    return -[TSPData filename](-[TSDMovieInfo movieData](self, "movieData"), "filename");
  else
    return -[NSURL lastPathComponent](-[TSDMovieInfo movieRemoteURL](self, "movieRemoteURL"), "lastPathComponent");
}

- (id)mediaFileType
{
  NSURL *v4;
  void *v5;

  if (-[TSDMovieInfo movieData](self, "movieData"))
    return -[TSPData type](-[TSDMovieInfo movieData](self, "movieData"), "type");
  v5 = 0;
  v4 = -[TSDMovieInfo movieRemoteURL](self, "movieRemoteURL");
  -[NSURL getResourceValue:forKey:error:](v4, "getResourceValue:forKey:error:", &v5, *MEMORY[0x24BDBCCF0], 0);
  return v5;
}

+ (id)presetKinds
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", String);
}

- (void)setStyle:(id)a3
{
  id v5;

  if (self->mStyle != a3)
  {
    -[TSDDrawableInfo willChangeProperties:](self, "willChangeProperties:", +[TSDMediaStyle properties](TSDMediaStyle, "properties"));
    -[TSPObject willModify](self, "willModify");
    v5 = a3;

    self->mStyle = (TSDMediaStyle *)a3;
  }
}

- (id)presetKind
{
  void *v3;
  void *v4;

  v3 = (void *)String;
  objc_opt_class();
  -[TSDMovieInfo style](self, "style");
  v4 = (void *)TSUDynamicCast();
  if (v4)
    return (id)objc_msgSend(v4, "presetKind");
  else
    return v3;
}

- (void)setPosterImageData:(id)a3
{
  id v5;

  if (self->mPosterImageData != a3)
  {
    -[TSPObject willModify](self, "willModify");
    v5 = a3;

    self->mPosterImageData = (TSPData *)a3;
  }
}

- (CGSize)rawDataSize
{
  double width;
  double height;
  CGSize result;

  width = self->mNaturalSize.width;
  height = self->mNaturalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)p_setPropertiesFromLoadedAsset:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double Seconds;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CMTime time;
  CMTime v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieInfo p_setPropertiesFromLoadedAsset:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieInfo.m"), 276, CFSTR("invalid nil value for '%s'"), "asset");
  }
  if (objc_msgSend(a3, "statusOfValueForKey:error:", CFSTR("duration"), 0) != 2)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieInfo p_setPropertiesFromLoadedAsset:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieInfo.m"), 277, CFSTR("Invalid parameter not satisfying: %s"), "[asset statusOfValueForKey:@\"duration\" error:NULL] == AVKeyValueStatusLoaded");
  }
  if (objc_msgSend(a3, "statusOfValueForKey:error:", CFSTR("tracks"), 0) != 2)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieInfo p_setPropertiesFromLoadedAsset:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieInfo.m"), 278, CFSTR("Invalid parameter not satisfying: %s"), "[asset statusOfValueForKey:@\"tracks\" error:NULL] == AVKeyValueStatusLoaded");
  }
  memset(&v25, 0, sizeof(v25));
  if (a3)
    objc_msgSend(a3, "duration");
  else
    v25 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  time = v25;
  Seconds = CMTimeGetSeconds(&time);
  -[TSDMovieInfo setStartTime:](self, "setStartTime:", 0.0);
  -[TSDMovieInfo setEndTime:](self, "setEndTime:", Seconds);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = (void *)objc_msgSend(a3, "tracks");
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    v16 = *MEMORY[0x24BDB1CE8];
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v18, "isEnabled")
          && (objc_msgSend(v18, "hasMediaCharacteristic:", v16) & 1) != 0)
        {
          v19 = 0;
          goto LABEL_21;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      if (v14)
        continue;
      break;
    }
  }
  v19 = 1;
LABEL_21:
  -[TSDMovieInfo setAudioOnly:](self, "setAudioOnly:", v19);
}

- (Class)styleClass
{
  return (Class)objc_opt_class();
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (Class)editorClass
{
  return 0;
}

- (BOOL)canChangeWrapType
{
  return !self->mAudioOnly;
}

- (void)setStreaming:(BOOL)a3
{
  _BOOL4 v3;

  if (self->mStreaming != a3)
  {
    v3 = a3;
    -[TSPObject willModify](self, "willModify");
    self->mStreaming = v3;
    if (v3)
      -[TSDDrawableInfo setAspectRatioLocked:](self, "setAspectRatioLocked:", 0);
  }
}

- (id)animationFilters
{
  void *v3;
  __CFString **v4;
  _BOOL4 v5;

  if (-[TSDMovieInfo isAudioOnly](self, "isAudioOnly"))
  {
    v3 = (void *)MEMORY[0x24BDBCF20];
    v4 = &kTSDAnimationFilterAudio;
    return (id)objc_msgSend(v3, "setWithObject:", *v4);
  }
  v5 = -[TSDMovieInfo isStreaming](self, "isStreaming");
  v3 = (void *)MEMORY[0x24BDBCF20];
  if (v5)
  {
    v4 = &kTSDAnimationFilterMovie;
    return (id)objc_msgSend(v3, "setWithObject:", *v4);
  }
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", kTSDAnimationFilterStandard, kTSDAnimationFilterMovie, 0);
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__TSDMovieInfo_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_24D82B868;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __37__TSDMovieInfo_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieInfo mixingTypeWithObject:]_block_invoke");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieInfo.m"), 370, CFSTR("nil object after cast"));
  }
  if (objc_msgSend(*(id *)(a1 + 40), "movieData"))
  {
    v5 = objc_msgSend(v2, "movieData");
    if (v5 == objc_msgSend(*(id *)(a1 + 40), "movieData"))
      v6 = 5;
    else
      v6 = 1;
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "movieRemoteURL"))
  {
    if (objc_msgSend((id)objc_msgSend(v2, "movieRemoteURL"), "isEqual:", objc_msgSend(*(id *)(a1 + 40), "movieRemoteURL")))v6 = 5;
    else
      v6 = 1;
  }
  else
  {
    v6 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "posterTime");
  v8 = v7;
  objc_msgSend(v2, "posterTime");
  if (v8 != v9)
    v6 = TSDMixingTypeBestFromMixingTypes(v6, 2);
  return TSDMixingTypeBestFromMixingTypes(v6, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "geometry"), "mixingTypeWithObject:", objc_msgSend(v2, "geometry")));
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__TSDMovieInfo_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_24D82B890;
  *(double *)&v5[6] = a3;
  v5[4] = self;
  v5[5] = a4;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

id __49__TSDMovieInfo_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = 40;
  if (*(double *)(a1 + 48) < 1.0)
    v1 = 32;
  return *(id *)(a1 + v1);
}

- (void)acceptVisitor:(id)a3
{
  objc_msgSend(a3, "visitTSDMovieInfo:", self);
}

- (id)makeAVAsset
{
  return -[TSDMovieInfo makeAVAssetWithOptions:](self, "makeAVAssetWithOptions:", 0);
}

- (id)makeAVAssetWithOptions:(id)a3
{
  TSPData *v5;
  id result;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = -[TSDMovieInfo movieData](self, "movieData");
  if (v5)
    return -[TSPData AVAssetWithOptions:](v5, "AVAssetWithOptions:", a3);
  result = -[TSDMovieInfo movieRemoteURL](self, "movieRemoteURL");
  if (result)
  {
    v7 = result;
    v10 = *MEMORY[0x24BDB21E0];
    v11[0] = &unk_24D8FAC80;
    v8 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1), "mutableCopy");
    v9 = v8;
    if (a3)
      objc_msgSend(v8, "addEntriesFromDictionary:", a3);
    return (id)objc_msgSend(MEMORY[0x24BDB26C8], "URLAssetWithURL:options:", v7, v9);
  }
  return result;
}

- (id)makePosterImageGeneratorWithAVAsset:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB23B0]), "initWithAsset:", a3);
  v9 = *MEMORY[0x24BDC0D88];
  v6 = v9;
  v10 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  v4 = v10;
  objc_msgSend(v3, "setRequestedTimeToleranceAfter:", &v9);
  v7 = v6;
  v8 = v4;
  objc_msgSend(v3, "setRequestedTimeToleranceBefore:", &v7);
  objc_msgSend(v3, "setAppliesPreferredTrackTransform:", 1);
  return v3;
}

- (id)generateEmptyPosterImageForContext:(id)a3
{
  double v4;
  double v5;
  CGContext *v6;
  CGImage *Image;
  id v8;
  void *v10;
  uint64_t v11;
  CGRect v12;

  -[TSDMediaInfo originalSize](self, "originalSize");
  if (v4 <= 0.0 || v5 <= 0.0)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMovieInfo generateEmptyPosterImageForContext:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieInfo.m"), 474, CFSTR("Movie's oriignal size should be nonzero."));
    return 0;
  }
  else
  {
    v6 = TSDBitmapContextCreate(3, v4);
    CGContextSetFillColorWithColor(v6, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "blackColor"), "CGColor"));
    v12.origin.x = TSDRectWithSize();
    CGContextFillRect(v6, v12);
    Image = CGBitmapContextCreateImage(v6);
    v8 = +[TSPData dataFromNSData:filename:context:](TSPData, "dataFromNSData:filename:context:", MEMORY[0x219A14D7C](), CFSTR("posterImage.png"), a3);
    CGImageRelease(Image);
    CGContextRelease(v6);
    return v8;
  }
}

- (id)synchronouslyGenerateDefaultPosterImageForContext:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  CGImage *v8;
  id v9;
  void *v10;
  CMTime v12;
  CMTime duration;
  CMTimeRange range;
  CMTime time;
  CMTime v16;
  id v17;

  v5 = -[TSDMovieInfo makeAVAsset](self, "makeAVAsset");
  v6 = -[TSDMovieInfo makePosterImageGeneratorWithAVAsset:](self, "makePosterImageGeneratorWithAVAsset:", v5);
  v17 = 0;
  CMTimeMakeWithSeconds(&time, self->mPosterTime, 90000);
  if (v5)
    objc_msgSend(v5, "duration");
  else
    memset(&duration, 0, sizeof(duration));
  v12 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  CMTimeRangeMake(&range, &v12, &duration);
  CMTimeClampToRange(&v16, &time, &range);
  v7 = objc_msgSend(v6, "copyCGImageAtTime:actualTime:error:", &v16, 0, &v17);
  if (v7)
  {
    v8 = (CGImage *)v7;
    v9 = +[TSPData dataFromNSData:filename:context:](TSPData, "dataFromNSData:filename:context:", MEMORY[0x219A14D7C](), CFSTR("posterImage.png"), a3);
    CGImageRelease(v8);
  }
  else if (v17
         && objc_msgSend(v17, "code") == -11832
         && (v10 = (void *)objc_msgSend(v17, "domain"),
             objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDB1C58])))
  {
    return -[TSDMovieInfo generateEmptyPosterImageForContext:](self, "generateEmptyPosterImageForContext:", a3);
  }
  else
  {
    return 0;
  }
  return v9;
}

- (BOOL)supportsAttachedComments
{
  return !-[TSDMovieInfo isAudioOnly](self, "isAudioOnly");
}

- (BOOL)containsProperty:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if ((a3 - 532) < 7)
    return 1;
  v7 = v3;
  v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)TSDMovieInfo;
  return -[TSDDrawableInfo containsProperty:](&v6, sel_containsProperty_);
}

- (id)objectForProperty:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 == 533)
    return -[TSDMovieInfo posterImageData](self, "posterImageData");
  if (a3 == 532)
    return -[TSDMovieInfo movieData](self, "movieData");
  v7 = v3;
  v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)TSDMovieInfo;
  return -[TSDStyledInfo objectForProperty:](&v6, sel_objectForProperty_);
}

- (double)doubleValueForProperty:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  double result;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  switch(a3)
  {
    case 536:
      -[TSDMovieInfo posterTime](self, "posterTime");
      break;
    case 535:
      -[TSDMovieInfo endTime](self, "endTime");
      break;
    case 534:
      -[TSDMovieInfo startTime](self, "startTime");
      break;
    default:
      v7 = v3;
      v8 = v4;
      v6.receiver = self;
      v6.super_class = (Class)TSDMovieInfo;
      -[TSDDrawableInfo doubleValueForProperty:](&v6, sel_doubleValueForProperty_);
      break;
  }
  return result;
}

- (float)floatValueForProperty:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  float result;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 == 538)
  {
    -[TSDMovieInfo volume](self, "volume");
  }
  else
  {
    v7 = v3;
    v8 = v4;
    v6.receiver = self;
    v6.super_class = (Class)TSDMovieInfo;
    -[TSDDrawableInfo floatValueForProperty:](&v6, sel_floatValueForProperty_);
  }
  return result;
}

- (int)intValueForProperty:(int)a3
{
  objc_super v4;

  if (a3 == 537)
    return -[TSDMovieInfo loopOption](self, "loopOption");
  v4.receiver = self;
  v4.super_class = (Class)TSDMovieInfo;
  return -[TSDDrawableInfo intValueForProperty:](&v4, sel_intValueForProperty_);
}

- (BOOL)supportsHyperlinks
{
  return !self->mAudioOnly;
}

- (id)style
{
  return self->mStyle;
}

- (TSPData)posterImageData
{
  return self->mPosterImageData;
}

- (BOOL)isStreaming
{
  return self->mStreaming;
}

@end
