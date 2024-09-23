@implementation PGFeatureExtractorAssetSourceType

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("AssetSourceType");
  return CFSTR("AssetSourceType");
}

- (id)featureNames
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("SourceTypeNone");
  v3[1] = CFSTR("UserLibrary");
  v3[2] = CFSTR("CloudShared");
  v3[3] = CFSTR("iTunesSynced");
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
  uint64_t v8;
  double v9;
  uint64_t v10;

  v5 = (void *)MEMORY[0x1E0D42A48];
  v6 = a3;
  objc_msgSend(v5, "zerosOfCount:", -[PGFeatureExtractorAssetSourceType featureLength](self, "featureLength"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "sourceType");

  if (!v8)
  {
    v10 = 0;
LABEL_10:
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
        return v7;
      goto LABEL_9;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_4;
  }
  LODWORD(v9) = 1.0;
  objc_msgSend(v7, "setFloat:atIndex:", 2, v9);
  if ((v8 & 4) != 0)
  {
LABEL_9:
    v10 = 3;
    goto LABEL_10;
  }
  return v7;
}

@end
