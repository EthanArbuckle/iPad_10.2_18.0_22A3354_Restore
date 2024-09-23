@implementation PGFeatureExtractorAssetImportSource

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("ImportSource");
  return CFSTR("ImportSource");
}

- (id)featureNames
{
  _QWORD v3[11];

  v3[10] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("ImportSourceUnknown");
  v3[1] = CFSTR("ImportSourceBackCamera");
  v3[2] = CFSTR("ImportSourceFrontCamera");
  v3[3] = CFSTR("ImportSourcePhotoKit");
  v3[4] = CFSTR("ImportSourceCameraConnectionKit");
  v3[5] = CFSTR("ImportSourcePhotosApp");
  v3[6] = CFSTR("ImportSourceLegacy");
  v3[7] = CFSTR("ImportSourceMomentShare");
  v3[8] = CFSTR("ImportSourcePhotoKitInternal");
  v3[9] = CFSTR("ImportSourceLegacyInternal");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 10);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)featureLength
{
  return 10;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  double v10;

  v5 = (void *)MEMORY[0x1E0D42A48];
  v6 = a3;
  objc_msgSend(v5, "zerosOfCount:", -[PGFeatureExtractorAssetImportSource featureLength](self, "featureLength"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "importProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "importedBy");
  if (v9 <= 0xC)
  {
    LODWORD(v10) = 1.0;
    objc_msgSend(v7, "setFloat:atIndex:", v9, v10);
  }

  return v7;
}

@end
