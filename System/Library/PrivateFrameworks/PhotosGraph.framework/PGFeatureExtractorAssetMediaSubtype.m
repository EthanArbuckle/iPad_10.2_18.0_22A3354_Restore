@implementation PGFeatureExtractorAssetMediaSubtype

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("AssetMediaSubtype");
  return CFSTR("AssetMediaSubtype");
}

- (id)featureNames
{
  _QWORD v3[11];

  v3[10] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("MediaSubtypeNone");
  v3[1] = CFSTR("PhotoPanorama");
  v3[2] = CFSTR("PhotoHDR");
  v3[3] = CFSTR("PhotoScreenshot");
  v3[4] = CFSTR("PhotoLive");
  v3[5] = CFSTR("PhotoDepthEffect");
  v3[6] = CFSTR("SpatialOverCapture");
  v3[7] = CFSTR("VideoStreamed");
  v3[8] = CFSTR("VideoHighFrameRate");
  v3[9] = CFSTR("VideoTimelapse");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 10);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)featureLength
{
  return 10;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;

  v5 = (void *)MEMORY[0x1E0D42A48];
  v6 = a3;
  objc_msgSend(v5, "zerosOfCount:", -[PGFeatureExtractorAssetMediaSubtype featureLength](self, "featureLength"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "mediaSubtypes");

  if (!v8)
  {
    v10 = 0;
LABEL_20:
    LODWORD(v9) = 1.0;
    objc_msgSend(v7, "setFloat:atIndex:", v10, v9);
    return v7;
  }
  if ((v8 & 1) != 0)
  {
    LODWORD(v9) = 1.0;
    objc_msgSend(v7, "setFloat:atIndex:", 1, v9);
    if ((v8 & 2) == 0)
    {
LABEL_4:
      if ((v8 & 4) == 0)
        goto LABEL_5;
      goto LABEL_14;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_4;
  }
  LODWORD(v9) = 1.0;
  objc_msgSend(v7, "setFloat:atIndex:", 2, v9);
  if ((v8 & 4) == 0)
  {
LABEL_5:
    if ((v8 & 8) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  LODWORD(v9) = 1.0;
  objc_msgSend(v7, "setFloat:atIndex:", 3, v9);
  if ((v8 & 8) == 0)
  {
LABEL_6:
    if ((v8 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  LODWORD(v9) = 1.0;
  objc_msgSend(v7, "setFloat:atIndex:", 4, v9);
  if ((v8 & 0x10) == 0)
  {
LABEL_7:
    if ((v8 & 0x10000) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  LODWORD(v9) = 1.0;
  objc_msgSend(v7, "setFloat:atIndex:", 5, v9);
  if ((v8 & 0x10000) == 0)
  {
LABEL_8:
    if ((v8 & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  LODWORD(v9) = 1.0;
  objc_msgSend(v7, "setFloat:atIndex:", 7, v9);
  if ((v8 & 0x20000) == 0)
  {
LABEL_9:
    if ((v8 & 0x40000) == 0)
      return v7;
    goto LABEL_19;
  }
LABEL_18:
  LODWORD(v9) = 1.0;
  objc_msgSend(v7, "setFloat:atIndex:", 8, v9);
  if ((v8 & 0x40000) != 0)
  {
LABEL_19:
    v10 = 9;
    goto LABEL_20;
  }
  return v7;
}

@end
