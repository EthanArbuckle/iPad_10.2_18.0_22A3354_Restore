@implementation PKMerchantCategoryCodeMap

- (PKMerchantCategoryCodeMap)init
{
  PKMerchantCategoryCodeMap *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  NSObject *v14;
  PKMerchantCategoryCodeMap *v15;
  uint64_t v16;
  NSDictionary *mccCodeToMerchantCategory;
  _QWORD v19[4];
  id v20;
  uint8_t buf[16];
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PKMerchantCategoryCodeMap;
  v2 = -[PKMerchantCategoryCodeMap init](&v22, sel_init);
  if (!v2)
    goto LABEL_17;
  PKPassKitCoreBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("MCCMapping"), CFSTR("json"));
  v4 = objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v4);
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __33__PKMerchantCategoryCodeMap_init__block_invoke;
      v19[3] = &unk_1E2AC28C8;
      v9 = v8;
      v20 = v9;
      objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v19);
      v10 = objc_msgSend(v9, "count");
      PKLogFacilityTypeGetObject(6uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v12)
        {
          *(_WORD *)buf = 0;
          v13 = "Successfully generated MCC code to category map";
LABEL_15:
          _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
        }
      }
      else if (v12)
      {
        *(_WORD *)buf = 0;
        v13 = "Error generating MCC code to category map";
        goto LABEL_15;
      }

      v16 = objc_msgSend(v9, "copy");
      mccCodeToMerchantCategory = v2->_mccCodeToMerchantCategory;
      v2->_mccCodeToMerchantCategory = (NSDictionary *)v16;

LABEL_17:
      v15 = v2;
      goto LABEL_18;
    }
    PKLogFacilityTypeGetObject(6uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Error creating PKMerchantCategoryCodeMap: resourceData is nil", buf, 2u);
    }

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Error creating PKMerchantCategoryCodeMap: resourceURL is nil", buf, 2u);
    }
  }

  v15 = 0;
LABEL_18:

  return v15;
}

void __33__PKMerchantCategoryCodeMap_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = objc_msgSend(a2, "integerValue");
  v7 = PKMerchantCategoryFromString(v5);

  if (v6 >= 1)
  {
    if (v7)
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v10, v9);

    }
  }
}

- (int64_t)categoryForIndustryCode:(int64_t)a3
{
  NSDictionary *mccCodeToMerchantCategory;
  void *v4;
  void *v5;
  int64_t v6;

  if (a3 < 1)
    return 0;
  mccCodeToMerchantCategory = self->_mccCodeToMerchantCategory;
  if (!mccCodeToMerchantCategory)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](mccCodeToMerchantCategory, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mccCodeToMerchantCategory, 0);
}

@end
