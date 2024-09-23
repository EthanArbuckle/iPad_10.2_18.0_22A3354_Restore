@implementation PGFeatureExtractorAssetPlaybackStyle

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("AssetPlaybackStyle");
  return CFSTR("AssetPlaybackStyle");
}

- (id)featureNames
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Unsupported");
  v3[1] = CFSTR("Image");
  v3[2] = CFSTR("ImageAnimated");
  v3[3] = CFSTR("LivePhoto");
  v3[4] = CFSTR("Video");
  v3[5] = CFSTR("VideoLooping");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)featureLength
{
  return 6;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  double v9;

  v5 = (void *)MEMORY[0x1E0D42A48];
  v6 = a3;
  objc_msgSend(v5, "zerosOfCount:", -[PGFeatureExtractorAssetPlaybackStyle featureLength](self, "featureLength"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "playbackStyle");

  if (v8 <= 5)
  {
    LODWORD(v9) = 1.0;
    objc_msgSend(v7, "setFloat:atIndex:", v8, v9);
  }
  return v7;
}

@end
