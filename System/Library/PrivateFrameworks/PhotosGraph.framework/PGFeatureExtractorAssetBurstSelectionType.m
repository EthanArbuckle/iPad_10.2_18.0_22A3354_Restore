@implementation PGFeatureExtractorAssetBurstSelectionType

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("BurstSelectionType");
  return CFSTR("BurstSelectionType");
}

- (id)featureNames
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("BurstSelectionNone");
  v3[1] = CFSTR("AutoPick");
  v3[2] = CFSTR("UserPick");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)featureLength
{
  return 3;
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
  objc_msgSend(v5, "zerosOfCount:", -[PGFeatureExtractorAssetBurstSelectionType featureLength](self, "featureLength"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "burstSelectionTypes");

  if (!v8)
  {
    v10 = 0;
    goto LABEL_7;
  }
  if ((v8 & 1) != 0)
  {
    LODWORD(v9) = 1.0;
    objc_msgSend(v7, "setFloat:atIndex:", 1, v9);
  }
  if ((v8 & 2) != 0)
  {
    v10 = 2;
LABEL_7:
    LODWORD(v9) = 1.0;
    objc_msgSend(v7, "setFloat:atIndex:", v10, v9);
  }
  return v7;
}

@end
