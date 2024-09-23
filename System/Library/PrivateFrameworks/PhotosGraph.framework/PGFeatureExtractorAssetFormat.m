@implementation PGFeatureExtractorAssetFormat

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("AssetFormat");
  return CFSTR("AssetFormat");
}

- (id)featureNames
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Square");
  v3[1] = CFSTR("Portrait");
  v3[2] = CFSTR("Landscape");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)featureLength
{
  return 3;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  double v9;
  void *v10;
  uint64_t v11;

  v5 = a3;
  v6 = objc_msgSend(v5, "pixelWidth");
  v7 = objc_msgSend(v5, "pixelHeight");

  objc_msgSend(MEMORY[0x1E0D42A48], "zerosOfCount:", -[PGFeatureExtractorAssetFormat featureLength](self, "featureLength"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  if (v6 == v7)
  {
    v11 = 0;
LABEL_7:
    LODWORD(v9) = 1.0;
    objc_msgSend(v8, "setFloat:atIndex:", v11, v9);
    return v10;
  }
  if (v7 > v6)
  {
    v11 = 1;
    goto LABEL_7;
  }
  if (v6 > v7)
  {
    v11 = 2;
    goto LABEL_7;
  }
  return v10;
}

@end
