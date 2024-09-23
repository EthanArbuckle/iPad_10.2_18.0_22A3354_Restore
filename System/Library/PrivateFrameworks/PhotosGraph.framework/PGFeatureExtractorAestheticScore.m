@implementation PGFeatureExtractorAestheticScore

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("AestheticScore");
  return CFSTR("AestheticScore");
}

- (id)featureNames
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("AestheticScore");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)featureLength
{
  return 1;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  int v5;
  int v6;
  void *v7;
  int64_t v8;
  double v9;

  objc_msgSend(a3, "overallAestheticScore");
  v6 = v5;
  v7 = (void *)MEMORY[0x1E0D42A20];
  v8 = -[PGFeatureExtractorAestheticScore featureLength](self, "featureLength");
  LODWORD(v9) = v6;
  return (id)objc_msgSend(v7, "vectorRepeatingFloat:count:", v8, v9);
}

@end
