@implementation PGFeatureExtractorStandardAspectRatio

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("StandardAspectRatio");
  return CFSTR("StandardAspectRatio");
}

- (id)featureNames
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("StandardAspectRatioFourByThree");
  v3[1] = CFSTR("StandardAspectRatioThreeByTwo");
  v3[2] = CFSTR("StandardAspectRatioSixteenByNine");
  v3[3] = CFSTR("StandardAspectRatioOthers");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)featureLength
{
  return 4;
}

- (float)precisionEpsilon
{
  return 0.05;
}

- (int64_t)standardAspectRatioFromFloatVector:(id)a3
{
  id v4;
  void *v5;
  char v6;
  int64_t v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  int v13;
  int v14;
  int v15;

  v4 = a3;
  v15 = 1068149419;
  v13 = 1071877689;
  v14 = 1069547520;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A20]), "initWithFloats:count:", &v15, 1);
  -[PGFeatureExtractorStandardAspectRatio precisionEpsilon](self, "precisionEpsilon");
  v6 = objc_msgSend(v4, "isApproximatelyEqualTo:epsilon:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v7 = 1;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A20]), "initWithFloats:count:", &v14, 1);
    -[PGFeatureExtractorStandardAspectRatio precisionEpsilon](self, "precisionEpsilon");
    v9 = objc_msgSend(v4, "isApproximatelyEqualTo:epsilon:", v8);

    if ((v9 & 1) == 0)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A20]), "initWithFloats:count:", &v13, 1);
      -[PGFeatureExtractorStandardAspectRatio precisionEpsilon](self, "precisionEpsilon");
      v11 = objc_msgSend(v4, "isApproximatelyEqualTo:epsilon:", v10);

      if (v11)
        v7 = 2;
      else
        v7 = 3;
    }
  }

  return v7;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v6;
  float v7;
  double v8;
  void *v9;
  unint64_t v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  if (objc_msgSend(v6, "pixelHeight"))
  {
    v7 = (float)(unint64_t)objc_msgSend(v6, "pixelWidth");
    *(float *)&v8 = v7 / (float)(unint64_t)objc_msgSend(v6, "pixelHeight");
    objc_msgSend(MEMORY[0x1E0D42A20], "vectorRepeatingFloat:count:", 1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PGFeatureExtractorStandardAspectRatio standardAspectRatioFromFloatVector:](self, "standardAspectRatioFromFloatVector:", v9);
    objc_msgSend(MEMORY[0x1E0D42A48], "zerosOfCount:", -[PGFeatureExtractorStandardAspectRatio featureLength](self, "featureLength"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11;
    if (v10 <= 3)
    {
      LODWORD(v12) = 1.0;
      objc_msgSend(v11, "setFloat:atIndex:", v10, v12);
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "localIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Divide by 0 is not a valid operation, in asset %@"), v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGFeatureExtractorStandardAspectRatio _generateError:withCode:andMessage:](self, "_generateError:withCode:andMessage:", a4, 0, v15);

    v13 = 0;
  }

  return v13;
}

- (BOOL)_generateError:(id *)a3 withCode:(int64_t)a4 andMessage:(id)a5
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2D50];
    v14[0] = a5;
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = a5;
    objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosGraph.PGFeatureExtractorPHAssetAttributes"), a4, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    *a3 = v11;
  }
  return 1;
}

@end
