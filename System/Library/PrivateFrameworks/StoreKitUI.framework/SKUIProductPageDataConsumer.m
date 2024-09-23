@implementation SKUIProductPageDataConsumer

- (id)productPageWithDictionary:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  SKUIReleaseNote *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  SKUIInAppPurchase *v28;
  void *v29;
  SKUIProductPageProductInfo *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  SKUIPageComponentContext *v36;
  SKUISwooshPageComponent *v37;
  SKUISwooshPageComponent *v38;
  void *v39;
  SKUIReviewConfiguration *v40;
  void *v41;
  void *v42;
  void *v43;
  SKUIUber *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  SKUIProductPage *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[5];
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIProductPageDataConsumer productPageWithDictionary:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v50 = objc_alloc_init(SKUIProductPage);
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__87;
  v64 = __Block_byref_object_dispose__87;
  v65 = 0;
  objc_msgSend(v3, "objectForKey:", CFSTR("storePlatformPrewarmDataKey"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("storePlatformData"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v48, "objectForKey:", v49), (v47 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v48, "objectForKey:", CFSTR("product"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v47)
    {
      objc_msgSend(v48, "objectForKey:", CFSTR("product-dv-product"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v47, "objectForKey:", CFSTR("results"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __57__SKUIProductPageDataConsumer_productPageWithDictionary___block_invoke;
      v59[3] = &unk_1E73A8378;
      v59[4] = &v60;
      objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v59);
    }

  }
  if (v61[5])
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("versionHistory"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      +[SKUIReleaseNote dateFormatter](SKUIReleaseNote, "dateFormatter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v15 = v46;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v56;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v56 != v17)
              objc_enumerationMutation(v15);
            v19 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v18);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v20 = -[SKUIReleaseNote initWithReleaseNoteDictionary:dateFormatter:]([SKUIReleaseNote alloc], "initWithReleaseNoteDictionary:dateFormatter:", v19, v14);
              if (v20)
                objc_msgSend(v13, "addObject:", v20);

            }
            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
        }
        while (v16);
      }

      objc_msgSend((id)v61[5], "_setVersionHistory:", v13);
    }
    objc_msgSend(v3, "objectForKey:", CFSTR("topInAppPurchases"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v23 = v21;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v52;
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v52 != v25)
              objc_enumerationMutation(v23);
            v27 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v26);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v28 = -[SKUIInAppPurchase initWithInAppPurchaseDictionary:]([SKUIInAppPurchase alloc], "initWithInAppPurchaseDictionary:", v27);
              if (v28)
                objc_msgSend(v22, "addObject:", v28);

            }
            ++v26;
          }
          while (v24 != v26);
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
        }
        while (v24);
      }

      objc_msgSend((id)v61[5], "_setInAppPurchases:", v22);
    }
    -[SKUIProductPage setItem:](v50, "setItem:", v61[5]);

  }
  objc_msgSend(v3, "objectForKey:", CFSTR("infoSection"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = -[SKUIProductPageProductInfo initWithInfoSectionDictionaries:]([SKUIProductPageProductInfo alloc], "initWithInfoSectionDictionaries:", v29);
    if (-[SKUIProductPageProductInfo numberOfEntries](v30, "numberOfEntries") >= 1)
      -[SKUIProductPage setProductInformation:](v50, "setProductInformation:", v30);

  }
  objc_msgSend(v3, "objectForKey:", CFSTR("customersAlsoBought"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("moreByThisDeveloper"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v34 = objc_opt_class();
    SKUIStorePageItemsWithStorePlatformDictionary(v48, v49, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_alloc_init(SKUIPageComponentContext);
    -[SKUIPageComponentContext setItems:](v36, "setItems:", v35);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SKUIPageComponentContext setComponentDictionary:](v36, "setComponentDictionary:", v32);
      v37 = -[SKUISwooshPageComponent initWithRelatedContentContext:]([SKUISwooshPageComponent alloc], "initWithRelatedContentContext:", v36);
      objc_msgSend(v33, "addObject:", v37);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SKUIPageComponentContext setComponentDictionary:](v36, "setComponentDictionary:", v31);
      v38 = -[SKUISwooshPageComponent initWithRelatedContentContext:]([SKUISwooshPageComponent alloc], "initWithRelatedContentContext:", v36);
      objc_msgSend(v33, "addObject:", v38);

    }
    -[SKUIProductPage setRelatedContentSwooshes:](v50, "setRelatedContentSwooshes:", v33);

  }
  objc_msgSend(v3, "objectForKey:", CFSTR("reviewsUrlsData"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v40 = -[SKUIReviewConfiguration initWithConfigurationDictionary:]([SKUIReviewConfiguration alloc], "initWithConfigurationDictionary:", v39);
    -[SKUIProductPage setReviewConfiguration:](v50, "setReviewConfiguration:", v40);

  }
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF568]), "initWithStorePlatformData:", v3);
  -[SKUIProductPage setMetricsConfiguration:](v50, "setMetricsConfiguration:", v41);
  SSVGetMetricsPageDescriptionWithPlatformDictionary();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIProductPage setMetricsPageDescription:](v50, "setMetricsPageDescription:", v42);

  objc_msgSend(v3, "objectForKey:", CFSTR("uber"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v44 = -[SKUIUber initWithUberDictionary:]([SKUIUber alloc], "initWithUberDictionary:", v43);
    -[SKUIProductPage setUber:](v50, "setUber:", v44);

  }
  _Block_object_dispose(&v60, 8);

  return v50;
}

void __57__SKUIProductPageDataConsumer_productPageWithDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  SKUIProductPageItem *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[SKUIProductPageItem initWithLookupDictionary:]([SKUIProductPageItem alloc], "initWithLookupDictionary:", v9);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  *a4 = 1;

}

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  SKUIProductPage *v22;
  void *v23;
  uint64_t v24;
  id v26;

  v8 = a3;
  v9 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUIProductPageDataConsumer objectForData:response:error:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  objc_msgSend(v9, "allHeaderFields");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  ISDictionaryValueForCaseInsensitiveString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19 || (objc_msgSend(v9, "MIMEType"), (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (objc_msgSend(v19, "rangeOfString:options:", CFSTR("itml"), 1) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v22 = objc_alloc_init(SKUIProductPage);
      -[SKUIProductPage setITMLData:](v22, "setITMLData:", v8);
      -[SKUIProductPage setITMLResponse:](v22, "setITMLResponse:", v9);
      v21 = 0;
      if (!a5)
        goto LABEL_18;
      goto LABEL_16;
    }
  }
  v26 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, &v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v26;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (-[SKUIProductPageDataConsumer productPageWithDictionary:](self, "productPageWithDictionary:", v20),
        v22 = (SKUIProductPage *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "URL"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SKUIProductPage setPageURL:](v22, "setPageURL:", v23),
        v23,
        !v22))
  {
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("text/html")))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SKUIErrorDomain"), 1, 0);
      v24 = objc_claimAutoreleasedReturnValue();

      v22 = 0;
      v21 = (id)v24;
    }
    else
    {
      v22 = 0;
    }
  }

  if (a5)
  {
LABEL_16:
    if (!v22)
      *a5 = objc_retainAutorelease(v21);
  }
LABEL_18:

  return v22;
}

- (void)productPageWithDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)objectForData:(uint64_t)a3 response:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
