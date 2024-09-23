@implementation PGFeatureExtractorImageAspectRatio

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("ImageAspectRatio");
  return CFSTR("ImageAspectRatio");
}

- (id)featureNames
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("ImageAspectRatio");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)featureLength
{
  return 1;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  float v8;
  void *v9;
  int64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  if (objc_msgSend(v6, "pixelHeight"))
  {
    v7 = objc_msgSend(v6, "pixelWidth");
    v8 = (float)(v7 / objc_msgSend(v6, "pixelHeight"));
    v9 = (void *)MEMORY[0x1E0D42A20];
    v10 = -[PGFeatureExtractorImageAspectRatio featureLength](self, "featureLength");
    *(float *)&v11 = v8;
    objc_msgSend(v9, "vectorRepeatingFloat:count:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "localIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Divide by 0 is not a valid operation, in asset %@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGFeatureExtractorImageAspectRatio _generateError:withCode:andMessage:](self, "_generateError:withCode:andMessage:", a4, 0, v15);

    v12 = 0;
  }

  return v12;
}

- (BOOL)_generateError:(id *)a3 withCode:(int64_t)a4 andMessage:(id)a5
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v13 = CFSTR("message");
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
