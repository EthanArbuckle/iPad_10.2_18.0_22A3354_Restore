@implementation PXPhotosExportConfiguration

+ (id)containerConfigurationWithShouldIncludeLocation:(BOOL)a3
{
  _QWORD *v4;

  v4 = objc_alloc_init((Class)a1);
  v4[2] = 4;
  *((_BYTE *)v4 + 8) = a3;
  return v4;
}

+ (id)configurationWithQueryItems:(id)a3 possibleContentType:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  _QWORD *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  objc_class *v40;
  id v41;
  uint64_t v42;
  void *v43;
  char v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v40 = (objc_class *)a1;
  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v41 = a4;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v6)
  {
    v7 = v6;
    v44 = 0;
    v42 = 0;
    v43 = 0;
    v45 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v47;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v11, "name", v40);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[PXPhotosFileProviderRegister urlQueryItemItemTypeKey](PXPhotosFileProviderRegister, "urlQueryItemItemTypeKey");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if (v14)
        {
          objc_msgSend(v11, "value");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v15, "integerValue");
        }
        else
        {
          objc_msgSend(v11, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[PXPhotosFileProviderRegister urlQueryItemClientEncodingPolicyKey](PXPhotosFileProviderRegister, "urlQueryItemClientEncodingPolicyKey");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqualToString:", v17);

          if (v18)
          {
            objc_msgSend(v11, "value");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v15, "integerValue");
          }
          else
          {
            objc_msgSend(v11, "name");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            +[PXPhotosFileProviderRegister urlQueryItemIncludeLocationKey](PXPhotosFileProviderRegister, "urlQueryItemIncludeLocationKey");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v19, "isEqualToString:", v20);

            if (v21)
            {
              objc_msgSend(v11, "value");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(v15, "BOOLValue");
            }
            else
            {
              objc_msgSend(v11, "name");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              +[PXPhotosFileProviderRegister urlQueryItemIncludeCaptionKey](PXPhotosFileProviderRegister, "urlQueryItemIncludeCaptionKey");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v22, "isEqualToString:", v23);

              if (v24)
              {
                objc_msgSend(v11, "value");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                BYTE4(v42) = objc_msgSend(v15, "BOOLValue");
              }
              else
              {
                objc_msgSend(v11, "name");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                +[PXPhotosFileProviderRegister urlQueryItemDownscalingTargetDimensionKey](PXPhotosFileProviderRegister, "urlQueryItemDownscalingTargetDimensionKey");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v25, "isEqualToString:", v26);

                if (v27)
                {
                  objc_msgSend(v11, "value");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v15, "integerValue") < 1)
                  {
                    v30 = 0;
                    v29 = v43;
                  }
                  else
                  {
                    v28 = (void *)MEMORY[0x1E0CB37E8];
                    objc_msgSend(v11, "value");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "numberWithInteger:", objc_msgSend(v29, "integerValue"));
                    v30 = objc_claimAutoreleasedReturnValue();

                  }
                  v43 = (void *)v30;
                }
                else
                {
                  objc_msgSend(v11, "name");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PXPhotosFileProviderRegister urlQueryItemVideoPresetKey](PXPhotosFileProviderRegister, "urlQueryItemVideoPresetKey");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 = objc_msgSend(v31, "isEqualToString:", v32);

                  if (!v33)
                    continue;
                  objc_msgSend(v11, "value");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  LOBYTE(v42) = objc_msgSend(v15, "integerValue") == 1;
                }
              }
            }
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      if (!v7)
        goto LABEL_26;
    }
  }
  v44 = 0;
  v42 = 0;
  v43 = 0;
  v45 = 0;
  v8 = 0;
LABEL_26:
  v34 = objc_alloc_init(v40);
  v34[2] = v8;
  v34[3] = v45;
  *((_BYTE *)v34 + 8) = v44 & 1;
  *((_BYTE *)v34 + 9) = BYTE4(v42) & 1;
  v35 = (void *)v34[4];
  v34[4] = v43;
  v36 = v43;

  *((_BYTE *)v34 + 10) = v42 & 1;
  v37 = (void *)v34[5];
  v34[5] = v41;
  v38 = v41;

  return v34;
}

- (id)variantToRequest:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v12;

  v6 = a3;
  v7 = a4;
  PXPhotosFileProviderVariantsSortedByClientEncodingPolicy(-[PXPhotosExportConfiguration encodingPolicy](self, "encodingPolicy"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v6;
  PXFind();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v12 = v9;
    PXFind();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)debugDescription
{
  void *v3;
  unint64_t v4;
  int64_t v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[PXPhotosExportConfiguration itemType](self, "itemType");
  v5 = -[PXPhotosExportConfiguration encodingPolicy](self, "encodingPolicy");
  if (-[PXPhotosExportConfiguration shouldIncludeLocation](self, "shouldIncludeLocation"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = v6;
  if (-[PXPhotosExportConfiguration shouldIncludeCaption](self, "shouldIncludeCaption"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = v8;
  -[PXPhotosExportConfiguration downscalingTargetDimension](self, "downscalingTargetDimension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ItemType: %ld, EncodingPolicy: %ld, IncludeLocation: %@, IncludeCaption: %@, DownscalingTargetDimension: %@"), v4, v5, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (int64_t)encodingPolicy
{
  return self->_encodingPolicy;
}

- (BOOL)shouldIncludeLocation
{
  return self->_shouldIncludeLocation;
}

- (BOOL)shouldIncludeCaption
{
  return self->_shouldIncludeCaption;
}

- (BOOL)shouldExportForMail
{
  return self->_shouldExportForMail;
}

- (NSNumber)downscalingTargetDimension
{
  return self->_downscalingTargetDimension;
}

- (UTType)possibleContentType
{
  return self->_possibleContentType;
}

- (NSString)activityTypeForAssetExportAnalytics
{
  return self->_activityTypeForAssetExportAnalytics;
}

- (void)setActivityTypeForAssetExportAnalytics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityTypeForAssetExportAnalytics, 0);
  objc_storeStrong((id *)&self->_possibleContentType, 0);
  objc_storeStrong((id *)&self->_downscalingTargetDimension, 0);
}

uint64_t __54__PXPhotosExportConfiguration_variantToRequest_asset___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "possibleContentType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "conformsToType:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

BOOL __54__PXPhotosExportConfiguration_variantToRequest_asset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

@end
