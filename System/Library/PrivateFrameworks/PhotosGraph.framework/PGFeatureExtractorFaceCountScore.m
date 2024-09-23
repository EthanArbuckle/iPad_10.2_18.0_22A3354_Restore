@implementation PGFeatureExtractorFaceCountScore

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("FaceCountScore");
  return CFSTR("FaceCountScore");
}

- (id)featureNames
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("FaceCountScore");
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
  float v6;
  void *v7;
  int64_t v8;
  double v9;
  void *v10;

  objc_msgSend(a3, "mediaAnalysisProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (float)(unint64_t)objc_msgSend(v5, "faceCount");
  v7 = (void *)MEMORY[0x1E0D42A20];
  v8 = -[PGFeatureExtractorFaceCountScore featureLength](self, "featureLength");
  *(float *)&v9 = v6;
  objc_msgSend(v7, "vectorRepeatingFloat:count:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
