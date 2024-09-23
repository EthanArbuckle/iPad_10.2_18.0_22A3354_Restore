@implementation WFLinkActionPhotoItemCollectionParameterDefinition

- (WFLinkActionPhotoItemCollectionParameterDefinition)initWithParameterMetadata:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  WFLinkActionPhotoItemCollectionParameterDefinition *v7;
  objc_super v9;

  v4 = (void *)MEMORY[0x1E0D43C00];
  v5 = a3;
  objc_msgSend(v4, "photoItemCollectionValueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionPhotoItemCollectionParameterDefinition;
  v7 = -[WFLinkActionParameterDefinition initWithValueType:parameterMetadata:](&v9, sel_initWithValueType_parameterMetadata_, v6, v5);

  return v7;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (id)parameterDefinitionDictionary
{
  int64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = -[WFLinkActionParameterDefinition integerForTypeSpecificMetadataKey:defaultValue:](self, "integerForTypeSpecificMetadataKey:defaultValue:", *MEMORY[0x1E0D43B48], 1);
  -[WFLinkActionParameterDefinition objectForTypeSpecificMetadataKey:ofClass:](self, "objectForTypeSpecificMetadataKey:ofClass:", *MEMORY[0x1E0D43B40], objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("PhotoItemCollectionPickerSelectionLimit"));

  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("PhotoItemCollectionPickerMode"));
  v10.receiver = self;
  v10.super_class = (Class)WFLinkActionPhotoItemCollectionParameterDefinition;
  -[WFLinkActionParameterDefinition parameterDefinitionDictionary](&v10, sel_parameterDefinitionDictionary);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "definitionByAddingEntriesInDictionary:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)localizedTitleForLinkValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _BYTE buf[24];
  void *v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "items");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0D14088], "sharedLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      objc_msgSend(v6, "systemPhotoLibraryWithError:", &v18);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v18;

      if (v7)
      {
        objc_msgSend(v7, "librarySpecificFetchOptions");
        v9 = objc_claimAutoreleasedReturnValue();
        v19 = 0;
        v20 = &v19;
        v21 = 0x2050000000;
        v10 = (void *)getPHAssetCollectionClass_softClass;
        v22 = getPHAssetCollectionClass_softClass;
        if (!getPHAssetCollectionClass_softClass)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __getPHAssetCollectionClass_block_invoke;
          v25 = &unk_1E7AF9520;
          v26 = &v19;
          __getPHAssetCollectionClass_block_invoke((uint64_t)buf);
          v10 = (void *)v20[3];
        }
        v11 = objc_retainAutorelease(v10);
        _Block_object_dispose(&v19, 8);
        objc_msgSend(v5, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "fetchAssetCollectionsWithLocalIdentifiers:options:", v13, v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "localizedTitle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        getWFGeneralLogObject();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[WFLinkActionPhotoItemCollectionParameterDefinition localizedTitleForLinkValue:]";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v8;
          _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_ERROR, "%s Unable to get library: %@", buf, 0x16u);
        }
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {

    v16 = 0;
  }

  return v16;
}

- (id)linkValueFromParameterState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, void *, _QWORD);
  void *v15;
  id v16;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, void *, _QWORD))a7;
  v16 = v11;
  if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v15, 0);

  }
  else
  {

    v14[2](v14, 0, 0);
  }

}

- (id)parameterStateFromLinkValue:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  char isKindOfClass;
  void *v12;
  id v13;
  WFPhotoItemCollectionParameterState *v14;

  objc_msgSend(a3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[WFLinkActionParameterDefinition valueType](self, "valueType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "objectIsMemberOfType:", v4);

    if ((v6 & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1E0C99DA0];
      v8 = *MEMORY[0x1E0C99768];
      -[WFLinkActionParameterDefinition valueType](self, "valueType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v10 = v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v12 = v10;
    else
      v12 = 0;
    v13 = v12;

    v14 = 0;
    if ((isKindOfClass & 1) != 0)
      v14 = -[WFVariableSubstitutableParameterState initWithValue:]([WFPhotoItemCollectionParameterState alloc], "initWithValue:", v10);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
