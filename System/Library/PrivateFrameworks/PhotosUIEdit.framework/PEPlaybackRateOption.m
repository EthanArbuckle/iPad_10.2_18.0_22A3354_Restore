@implementation PEPlaybackRateOption

- (PEPlaybackRateOption)initWithType:(unint64_t)a3
{
  return -[PEPlaybackRateOption initWithType:videoFrameRate:](self, "initWithType:videoFrameRate:", a3, 0);
}

- (PEPlaybackRateOption)initWithType:(unint64_t)a3 videoFrameRate:(unint64_t)a4
{
  PEPlaybackRateOption *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PEPlaybackRateOption;
  result = -[PEPlaybackRateOption init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_videoFrameRate = a4;
  }
  return result;
}

- (NSString)localizedTitle
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v3, "setNumberStyle:", 3);
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[PEPlaybackRateOption playbackRate](self, "playbackRate");
  objc_msgSend(v4, "numberWithFloat:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)localizedSubtitle
{
  void *v3;
  void *v4;

  if (-[PEPlaybackRateOption videoFrameRate](self, "videoFrameRate"))
  {
    -[PEPlaybackRateOption videoFrameRate](self, "videoFrameRate");
    -[PEPlaybackRateOption playbackRate](self, "playbackRate");
    PELocalizedString(CFSTR("PlaybackRateOptionFPS"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PEStringWithValidatedFormat();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (float)playbackRate
{
  unint64_t v2;
  float result;

  v2 = -[PEPlaybackRateOption type](self, "type");
  result = 1.0;
  if (v2 - 1 <= 4)
    return flt_20D197034[v2 - 1];
  return result;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)videoFrameRate
{
  return self->_videoFrameRate;
}

+ (id)playbackRateOptionsForEditSource:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  id v9;
  double v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x24BDB2378];
    objc_msgSend(v3, "videoURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetWithURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    objc_msgSend(MEMORY[0x24BE6C438], "nominalFrameRateForAsset:error:", v6, &v14);
    v8 = v7;
    v9 = v14;
    if (v9)
    {
      PLPhotoEditGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v9;
        _os_log_impl(&dword_20D13D000, v11, OS_LOG_TYPE_ERROR, "Failed to load frame rate for supportedPlaybackRatesForEditSource: %@", buf, 0xCu);
      }

      v12 = (void *)MEMORY[0x24BDBD1A8];
    }
    else
    {
      LODWORD(v10) = v8;
      +[PEPlaybackRateOption _playbackRateOptionsForFrameRate:](PEPlaybackRateOption, "_playbackRateOptionsForFrameRate:", objc_msgSend(MEMORY[0x24BE6C438], "nominalFrameRateRoundedToNearestTraditionalFrameRate:", v10));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v12;
}

+ (id)playbackRateOptionsForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "mediaType") == 2)
  {
    objc_msgSend(v3, "fetchPropertySetsIfNeeded");
    objc_msgSend(v3, "photosInfoPanelExtendedProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fps");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = v6;

    +[PEPlaybackRateOption _playbackRateOptionsForFrameRate:](PEPlaybackRateOption, "_playbackRateOptionsForFrameRate:", (unint64_t)v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v8;
}

+ (id)_playbackRateOptionsForFrameRate:(unint64_t)a3
{
  id v4;
  PEPlaybackRateOption *v5;
  PEPlaybackRateOption *v6;
  PEPlaybackRateOption *v7;
  PEPlaybackRateOption *v8;
  PEPlaybackRateOption *v9;
  PEPlaybackRateOption *v10;
  void *v11;

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (a3)
  {
    v5 = -[PEPlaybackRateOption initWithType:videoFrameRate:]([PEPlaybackRateOption alloc], "initWithType:videoFrameRate:", 0, a3);
    objc_msgSend(v4, "addObject:", v5);

    if (a3 >= 0x32)
    {
      v6 = -[PEPlaybackRateOption initWithType:videoFrameRate:]([PEPlaybackRateOption alloc], "initWithType:videoFrameRate:", 1, a3);
      objc_msgSend(v4, "addObject:", v6);

      if (a3 >= 0x64)
      {
        v7 = -[PEPlaybackRateOption initWithType:videoFrameRate:]([PEPlaybackRateOption alloc], "initWithType:videoFrameRate:", 2, a3);
        objc_msgSend(v4, "addObject:", v7);

        v8 = -[PEPlaybackRateOption initWithType:videoFrameRate:]([PEPlaybackRateOption alloc], "initWithType:videoFrameRate:", 3, a3);
        objc_msgSend(v4, "addObject:", v8);

        if (a3 >= 0xC8)
        {
          v9 = -[PEPlaybackRateOption initWithType:videoFrameRate:]([PEPlaybackRateOption alloc], "initWithType:videoFrameRate:", 4, a3);
          objc_msgSend(v4, "addObject:", v9);

          v10 = -[PEPlaybackRateOption initWithType:videoFrameRate:]([PEPlaybackRateOption alloc], "initWithType:videoFrameRate:", 5, a3);
          objc_msgSend(v4, "addObject:", v10);

        }
      }
    }
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
