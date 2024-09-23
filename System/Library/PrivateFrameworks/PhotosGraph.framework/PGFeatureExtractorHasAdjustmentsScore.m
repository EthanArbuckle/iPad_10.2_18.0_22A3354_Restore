@implementation PGFeatureExtractorHasAdjustmentsScore

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("HasAdjustments");
  return CFSTR("HasAdjustments");
}

- (id)featureNames
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("HasAdjustments");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)featureLength
{
  return 1;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  float v5;
  void *v6;
  int64_t v7;
  double v8;

  v5 = (float)objc_msgSend(a3, "hasAdjustments");
  v6 = (void *)MEMORY[0x1E0D42A20];
  v7 = -[PGFeatureExtractorHasAdjustmentsScore featureLength](self, "featureLength");
  *(float *)&v8 = v5;
  return (id)objc_msgSend(v6, "vectorRepeatingFloat:count:", v7, v8);
}

@end
