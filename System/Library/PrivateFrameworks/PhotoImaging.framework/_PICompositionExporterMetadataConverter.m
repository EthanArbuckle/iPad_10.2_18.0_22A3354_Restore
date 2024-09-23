@implementation _PICompositionExporterMetadataConverter

- (id)videoMetadataForVariation:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  objc_msgSend(v5, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D75148];
  objc_msgSend(MEMORY[0x1E0D75140], "playbackVariationMetadataIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "addQuickTimeMetadataItemsWithIdentifier:value:toItems:", v9, v6, v7);

  if (a4 && (v10 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0D75420];
    v18 = *MEMORY[0x1E0CB2938];
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0D75140], "playbackVariationMetadataIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Unable to create metadata for key '%@'"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 8, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)setImageVariation:(id)a3 properties:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0D75148];
  v8 = (void *)MEMORY[0x1E0D75140];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "playbackVariationMetadataKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "addMakerApplePropertyWithKey:value:toProperties:", v11, v10, v9);

  if (a5 && (v12 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D75420];
    v20 = *MEMORY[0x1E0CB2938];
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0D75140], "playbackVariationMetadataKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Unable to create metadata for key '%@'"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 8, v18);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)photoProcessingFlagsFromProperties:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0D75140];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithImageProperties:contentType:timeZoneLookup:", v6, 0, 0);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "photoProcessingFlags"));
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0D75420];
    v15 = *MEMORY[0x1E0CB2938];
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0D75140], "photoProcessingFlagsMetadataKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Unable to read metadata for key '%@'"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 8, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (BOOL)setPhotoProcessingFlags:(id)a3 properties:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0D75148];
  v8 = (void *)MEMORY[0x1E0D75140];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "photoProcessingFlagsMetadataKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "addMakerApplePropertyWithKey:value:toProperties:", v11, v10, v9);

  if (a5 && (v12 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D75420];
    v20 = *MEMORY[0x1E0CB2938];
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0D75140], "photoProcessingFlagsMetadataKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Unable to create metadata for key '%@'"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 8, v18);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)photoFeatureFlags:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0D75140];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithImageProperties:contentType:timeZoneLookup:", v6, 0, 0);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "photosAppFeatureFlags"));
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0D75420];
    v15 = *MEMORY[0x1E0CB2938];
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0D75140], "photosFeatureFlagsMetadataKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Unable to read metadata for key '%@'"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 8, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (BOOL)setPhotoFeatureFlags:(id)a3 properties:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0D75148];
  v8 = (void *)MEMORY[0x1E0D75140];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "photosFeatureFlagsMetadataKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "addMakerApplePropertyWithKey:value:toProperties:", v11, v10, v9);

  if (a5 && (v12 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D75420];
    v20 = *MEMORY[0x1E0CB2938];
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0D75140], "photosFeatureFlagsMetadataKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Unable to create metadata for key '%@'"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 8, v18);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (void)addSemanticStyleMakeNoteProperties:(id)a3 toImageProperties:(id)a4
{
  if (a3)
    objc_msgSend(MEMORY[0x1E0D75148], "addMakerApplePropertyWithKey:value:toProperties:", *MEMORY[0x1E0C89D10], a3, a4);
}

@end
