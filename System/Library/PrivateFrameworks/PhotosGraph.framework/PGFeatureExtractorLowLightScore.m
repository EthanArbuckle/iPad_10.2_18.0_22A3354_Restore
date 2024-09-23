@implementation PGFeatureExtractorLowLightScore

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("LowLightScore");
  return CFSTR("LowLightScore");
}

- (id)featureNames
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("LowLightScore");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)featureLength
{
  return 1;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  void *v5;
  int v6;
  int v7;
  void *v8;
  int64_t v9;
  double v10;
  void *v11;

  objc_msgSend(a3, "aestheticProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowLight");
  v7 = v6;
  v8 = (void *)MEMORY[0x1E0D42A20];
  v9 = -[PGFeatureExtractorLowLightScore featureLength](self, "featureLength");
  LODWORD(v10) = v7;
  objc_msgSend(v8, "vectorRepeatingFloat:count:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
