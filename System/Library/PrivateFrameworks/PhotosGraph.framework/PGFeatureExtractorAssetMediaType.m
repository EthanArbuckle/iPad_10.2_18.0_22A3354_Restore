@implementation PGFeatureExtractorAssetMediaType

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("AssetMediaType");
  return CFSTR("AssetMediaType");
}

- (id)featureNames
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("MediaTypeUnknown");
  v3[1] = CFSTR("Image");
  v3[2] = CFSTR("Video");
  v3[3] = CFSTR("Audio");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)featureLength
{
  return 4;
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
  objc_msgSend(v5, "zerosOfCount:", -[PGFeatureExtractorAssetMediaType featureLength](self, "featureLength"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "mediaType");

  if (v8 <= 3)
  {
    LODWORD(v9) = 1.0;
    objc_msgSend(v7, "setFloat:atIndex:", v8, v9);
  }
  return v7;
}

@end
