@implementation PTAssetCinematicReader

- (id)globals
{
  return -[PTAssetCinematicGlobals initWithAssetReader:]([PTAssetCinematicGlobals alloc], "initWithAssetReader:", self);
}

- (id)copyNextFrame
{
  void *v3;
  id v4;
  PTAssetCinematicFrame *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1CAA3ACDC](self, a2);
  v13.receiver = self;
  v13.super_class = (Class)PTAssetCinematicReader;
  v4 = -[PTAssetReader nextFrame](&v13, sel_nextFrame);
  if (v4)
  {
    v5 = -[PTAssetReaderFrame initWithAssetReaderFrame:]([PTAssetCinematicFrame alloc], "initWithAssetReaderFrame:", v4);
    objc_msgSend(v4, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.quicktime.cinematic-video.rendering"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTAssetCinematicFrame setRenderingMetadata:](v5, "setRenderingMetadata:", v7);

    objc_msgSend(v4, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("com.apple.quicktime.cinematic-video.stabilization"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTAssetCinematicFrame setStabilizationMetadata:](v5, "setStabilizationMetadata:", v9);

    objc_msgSend(v4, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("com.apple.quicktime.cinematic-video.cinematography"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTAssetCinematicFrame setCinematographyFrame:](v5, "setCinematographyFrame:", v11);

  }
  else
  {
    v5 = 0;
  }

  objc_autoreleasePoolPop(v3);
  return v5;
}

@end
