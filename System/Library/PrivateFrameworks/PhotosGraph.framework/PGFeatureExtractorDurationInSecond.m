@implementation PGFeatureExtractorDurationInSecond

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("DurationInSecond");
  return CFSTR("DurationInSecond");
}

- (id)featureNames
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("DurationInSecond");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)featureLength
{
  return 1;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  double v5;
  float v6;
  void *v7;
  int64_t v8;
  double v9;

  objc_msgSend(a3, "duration");
  v6 = v5;
  v7 = (void *)MEMORY[0x1E0D42A20];
  v8 = -[PGFeatureExtractorDurationInSecond featureLength](self, "featureLength");
  *(float *)&v9 = v6;
  return (id)objc_msgSend(v7, "vectorRepeatingFloat:count:", v8, v9);
}

@end
