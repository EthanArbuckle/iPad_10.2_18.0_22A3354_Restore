@implementation PGFeatureExtractorAssetResolution

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("AssetResolution");
  return CFSTR("AssetResolution");
}

- (id)featureNames
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("AssetResolution");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)featureLength
{
  return 1;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  double v10;

  v5 = a3;
  v6 = objc_msgSend(v5, "pixelWidth");
  v7 = objc_msgSend(v5, "pixelHeight");

  v8 = (void *)MEMORY[0x1E0D42A20];
  v9 = -[PGFeatureExtractorAssetResolution featureLength](self, "featureLength");
  *(float *)&v10 = (float)(unint64_t)(v7 * v6);
  return (id)objc_msgSend(v8, "vectorRepeatingFloat:count:", v9, v10);
}

@end
