@implementation SKUIProductPageItem

- (SKUIProductPageItem)initWithIdentifier:(id)a3 mediaResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  SKUIProductPageItem *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *copyrightString;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSString *lastUpdateDateString;
  void *v21;
  uint64_t v22;
  NSString *shortenedProductPageURLString;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  char v32;
  SKUIItemContentRating *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  SKUIItemContentRating *contentRating;
  uint64_t v39;
  NSArray *secondaryContentRatings;
  void *v41;
  SKUIStoreNotes *v42;
  SKUIStoreNotes *storeNotes;
  uint64_t v44;
  void *v45;
  void *v47;
  void *v48;
  SKUIProductPageItem *v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIProductPageItem initWithIdentifier:mediaResult:].cold.1();
  }
  objc_msgSend(v7, "responseDataItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("attributes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = 0;
LABEL_32:

    goto LABEL_33;
  }
  v58.receiver = self;
  v58.super_class = (Class)SKUIProductPageItem;
  v11 = -[SKUIItem initWithIdentifier:mediaResultDictionary:](&v58, sel_initWithIdentifier_mediaResultDictionary_, v6, v10);
  if (v11)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("platformAttributes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ios"));
    self = (SKUIProductPageItem *)objc_claimAutoreleasedReturnValue();

    -[SKUIProductPageItem objectForKey:](self, "objectForKey:", CFSTR("copyright"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = objc_msgSend(v13, "copy");
      copyrightString = v11->_copyrightString;
      v11->_copyrightString = (NSString *)v14;

    }
    -[SKUIProductPageItem objectForKey:](self, "objectForKey:", CFSTR("releaseDate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(v17, "setDateFormat:", CFSTR("yyyy-MM-dd"));
      objc_msgSend(v17, "dateFromString:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setDateFormat:", 0);
      objc_msgSend(v17, "setDateStyle:", 2);
      objc_msgSend(v17, "setTimeStyle:", 0);
      objc_msgSend(v17, "stringFromDate:", v18);
      v19 = objc_claimAutoreleasedReturnValue();
      lastUpdateDateString = v11->_lastUpdateDateString;
      v11->_lastUpdateDateString = (NSString *)v19;

    }
    objc_msgSend(v10, "objectForKey:", CFSTR("url"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = objc_msgSend(v21, "copy");
      shortenedProductPageURLString = v11->_shortenedProductPageURLString;
      v11->_shortenedProductPageURLString = (NSString *)v22;

    }
    objc_msgSend(v10, "objectForKey:", CFSTR("contentRatingsBySystem"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v53 = v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = v21;
      v48 = v10;
      v49 = self;
      v50 = v7;
      v51 = v6;
      objc_msgSend(v24, "keyEnumerator");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v26 = v25;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v55 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("appsApple"));
              v33 = [SKUIItemContentRating alloc];
              objc_msgSend(v53, "objectForKey:", v31);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = (void *)objc_msgSend(v31, "copy");
              v36 = -[SKUIItemContentRating initWithContentRatingDictionary:systemName:](v33, "initWithContentRatingDictionary:systemName:", v34, v35);
              v37 = (void *)v36;
              if ((v32 & 1) != 0)
              {
                contentRating = v11->_contentRating;
                v11->_contentRating = (SKUIItemContentRating *)v36;

                v37 = v34;
              }
              else
              {

                objc_msgSend(v52, "addObject:", v37);
              }

            }
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
        }
        while (v28);
      }

      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v52);
      v39 = objc_claimAutoreleasedReturnValue();
      secondaryContentRatings = v11->_secondaryContentRatings;
      v11->_secondaryContentRatings = (NSArray *)v39;

      v7 = v50;
      v6 = v51;
      v10 = v48;
      self = v49;
      v21 = v47;
    }
    -[SKUIProductPageItem objectForKey:](self, "objectForKey:", CFSTR("editorialNotes"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = objc_alloc_init(SKUIStoreNotes);
      storeNotes = v11->_storeNotes;
      v11->_storeNotes = v42;

      objc_msgSend(v41, "objectForKey:", CFSTR("tagline"));
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = v21;
      v21 = (void *)v44;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SKUIStoreNotes setStandardNotes:](v11->_storeNotes, "setStandardNotes:", v21);
    }

    goto LABEL_32;
  }
LABEL_33:

  return v11;
}

- (SKUIProductPageItem)initWithLookupDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  SKUIProductPageItem *v7;
  void *v8;
  uint64_t v9;
  NSURL *artistPageURL;
  void *v11;
  uint64_t v12;
  NSString *copyrightString;
  void *v14;
  uint64_t v15;
  NSString *regularPriceString;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  NSString *lastUpdateDateString;
  void *v22;
  uint64_t v23;
  NSString *shortenedProductPageURLString;
  void *v25;
  uint64_t v26;
  NSArray *childItemIdentifiers;
  void *v28;
  NSMutableDictionary *v29;
  NSMutableDictionary *loadedChildItems;
  NSArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  SKUIItem *v39;
  void *v40;
  uint64_t v41;
  NSArray *parentBundleItemIdentifiers;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  char v51;
  SKUIItemContentRating *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  SKUIItemContentRating *contentRating;
  SKUIItemContentRating *v58;
  uint64_t v59;
  NSArray *secondaryContentRatings;
  SKUIItemContentRating *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  NSString *itemDescription;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  NSString *licenseAgreementURLString;
  void *v71;
  uint64_t v72;
  NSString *privacyPolicyURLString;
  void *v74;
  uint64_t v75;
  NSString *installationRequirementsDescription;
  void *v77;
  uint64_t v78;
  NSString *supportURLString;
  void *v80;
  void *v81;
  SKUIDeveloperInfo *v82;
  SKUIDeveloperInfo *developerInfo;
  SKUIDeveloperInfo *v84;
  void *v85;
  uint64_t v86;
  NSString *sellerName;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  SKUIStoreNotes *v96;
  SKUIStoreNotes *storeNotes;
  void *v98;
  uint64_t v99;
  NSArray *screenshots;
  id v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t k;
  uint64_t v107;
  SKUIScreenshot *v108;
  uint64_t v109;
  NSArray *v110;
  SKUIProductPageItem *v111;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  void *v119;
  SKUIItemContentRating *v120;
  SKUIProductPageItem *v121;
  void *v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  objc_super v135;
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  uint64_t v139;

  v139 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[SKUIProductPageItem initWithLookupDictionary:].cold.1();

  }
  v135.receiver = self;
  v135.super_class = (Class)SKUIProductPageItem;
  v7 = -[SKUIItem initWithLookupDictionary:](&v135, sel_initWithLookupDictionary_, v4);

  if (v7)
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAFAC8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v8);
      artistPageURL = v7->_artistPageURL;
      v7->_artistPageURL = (NSURL *)v9;

    }
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAFAF0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = objc_msgSend(v11, "copy");
      copyrightString = v7->_copyrightString;
      v7->_copyrightString = (NSString *)v12;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("regularPriceFormatted"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = objc_msgSend(v14, "copy");
      regularPriceString = v7->_regularPriceString;
      v7->_regularPriceString = (NSString *)v15;

    }
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAFB68]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(v18, "setDateFormat:", CFSTR("yyyy-MM-dd"));
      objc_msgSend(v18, "dateFromString:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_msgSend(v18, "setDateFormat:", 0);
        objc_msgSend(v18, "setDateStyle:", 2);
        objc_msgSend(v18, "setTimeStyle:", 0);
        objc_msgSend(v18, "stringFromDate:", v19);
        v20 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = objc_msgSend(v17, "copy");
      }
      lastUpdateDateString = v7->_lastUpdateDateString;
      v7->_lastUpdateDateString = (NSString *)v20;

    }
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAFBA8]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = objc_msgSend(v22, "copy");
      shortenedProductPageURLString = v7->_shortenedProductPageURLString;
      v7->_shortenedProductPageURLString = (NSString *)v23;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("childrenIds"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v119 = v25;
    v117 = v4;
    v121 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = objc_msgSend(v25, "copy");
      childItemIdentifiers = v7->_childItemIdentifiers;
      v7->_childItemIdentifiers = (NSArray *)v26;

      objc_msgSend(v4, "objectForKey:", CFSTR("children"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v114 = v22;
        v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        loadedChildItems = v7->_loadedChildItems;
        v7->_loadedChildItems = v29;

        v133 = 0u;
        v134 = 0u;
        v131 = 0u;
        v132 = 0u;
        v31 = v7->_childItemIdentifiers;
        v32 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v131, v138, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v132;
          do
          {
            for (i = 0; i != v33; ++i)
            {
              if (*(_QWORD *)v132 != v34)
                objc_enumerationMutation(v31);
              v36 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * i);
              objc_msgSend(v36, "stringValue");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "objectForKey:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v39 = -[SKUIItem initWithLookupDictionary:]([SKUIItem alloc], "initWithLookupDictionary:", v38);
                if (v39)
                  -[NSMutableDictionary setObject:forKey:](v7->_loadedChildItems, "setObject:forKey:", v39, v36);

              }
            }
            v33 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v131, v138, 16);
          }
          while (v33);
        }

        v22 = v114;
        v4 = v117;
      }

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("appBundleAdamIds"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v118 = v40;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = objc_msgSend(v40, "copy");
      parentBundleItemIdentifiers = v7->_parentBundleItemIdentifiers;
      v7->_parentBundleItemIdentifiers = (NSArray *)v41;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("contentRatingsBySystem"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v122 = v43;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v115 = v22;
      objc_msgSend(v43, "keyEnumerator");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = (SKUIItemContentRating *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v127 = 0u;
      v128 = 0u;
      v129 = 0u;
      v130 = 0u;
      v45 = v44;
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v127, v137, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v128;
        do
        {
          for (j = 0; j != v47; ++j)
          {
            if (*(_QWORD *)v128 != v48)
              objc_enumerationMutation(v45);
            v50 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v51 = objc_msgSend(v50, "isEqualToString:", CFSTR("appsApple"));
              v52 = [SKUIItemContentRating alloc];
              objc_msgSend(v122, "objectForKey:", v50);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = (void *)objc_msgSend(v50, "copy");
              v55 = -[SKUIItemContentRating initWithContentRatingDictionary:systemName:](v52, "initWithContentRatingDictionary:systemName:", v53, v54);
              v56 = (void *)v55;
              if ((v51 & 1) != 0)
              {
                contentRating = v121->_contentRating;
                v121->_contentRating = (SKUIItemContentRating *)v55;

                v56 = v53;
              }
              else
              {

                -[SKUIItemContentRating addObject:](v120, "addObject:", v56);
              }

            }
          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v127, v137, 16);
        }
        while (v47);
      }

      v58 = v120;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v120);
      v59 = objc_claimAutoreleasedReturnValue();
      v7 = v121;
      secondaryContentRatings = v121->_secondaryContentRatings;
      v121->_secondaryContentRatings = (NSArray *)v59;

      v22 = v115;
      v4 = v117;
    }
    else
    {
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAFAE0]);
      v45 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_54:

        objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAFAF8]);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v62, "objectForKey:", *MEMORY[0x1E0DAFB00]);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v64 = objc_msgSend(v63, "copy");
            itemDescription = v7->_itemDescription;
            v7->_itemDescription = (NSString *)v64;

          }
        }
        else
        {
          v63 = v22;
        }
        objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAFBB0]);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v66, "objectForKey:", *MEMORY[0x1E0DAFB28]);
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v67, "BOOLValue"))
            v7->_supportedFeatures |= 1uLL;
          objc_msgSend(v66, "objectForKey:", *MEMORY[0x1E0DAFB40]);
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v69 = objc_msgSend(v68, "copy");
            licenseAgreementURLString = v7->_licenseAgreementURLString;
            v7->_licenseAgreementURLString = (NSString *)v69;

          }
          objc_msgSend(v66, "objectForKey:", *MEMORY[0x1E0DAFB58]);
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v72 = objc_msgSend(v71, "copy");
            privacyPolicyURLString = v7->_privacyPolicyURLString;
            v7->_privacyPolicyURLString = (NSString *)v72;

          }
          objc_msgSend(v66, "objectForKey:", *MEMORY[0x1E0DAFB78]);
          v74 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v75 = objc_msgSend(v74, "copy");
            installationRequirementsDescription = v7->_installationRequirementsDescription;
            v7->_installationRequirementsDescription = (NSString *)v75;

          }
          objc_msgSend(v66, "objectForKey:", *MEMORY[0x1E0DAFBD0]);
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v78 = objc_msgSend(v77, "copy");
            supportURLString = v7->_supportURLString;
            v7->_supportURLString = (NSString *)v78;

          }
          objc_msgSend(v66, "objectForKey:", *MEMORY[0x1E0DAFB18]);
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_opt_respondsToSelector() & 1) != 0)
            -[SKUIItem _setHasInAppPurchases:](v7, "_setHasInAppPurchases:", objc_msgSend(v80, "BOOLValue"));
          objc_msgSend(v66, "objectForKey:", CFSTR("developerInfo"));
          v81 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v82 = -[SKUIDeveloperInfo initWithDeveloperDictionary:]([SKUIDeveloperInfo alloc], "initWithDeveloperDictionary:", v81);
            developerInfo = v7->_developerInfo;
            v7->_developerInfo = v82;

            v84 = v7->_developerInfo;
            -[SKUIItem artistName](v7, "artistName");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            -[SKUIDeveloperInfo setTradeName:](v84, "setTradeName:", v85);

          }
          objc_msgSend(v66, "objectForKey:", CFSTR("seller"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v86 = objc_msgSend(v63, "copy");
            sellerName = v7->_sellerName;
            v7->_sellerName = (NSString *)v86;

          }
        }
        objc_msgSend(v4, "objectForKey:", CFSTR("supportsPassbook"));
        v88 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v88, "BOOLValue"))
          v7->_supportedFeatures |= 4uLL;
        if (-[SKUIItem isNewsstandApp](v7, "isNewsstandApp"))
          v7->_supportedFeatures |= 8uLL;
        objc_msgSend(v4, "objectForKey:", CFSTR("gameCenterInfo"));
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v89, "objectForKey:", CFSTR("hasLiveAchievements"));
          v90 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v90, "BOOLValue"))
            v7->_supportedGameCenterFeatures |= 2uLL;
          v91 = v89;
          objc_msgSend(v89, "objectForKey:", CFSTR("hasLiveLeaderboards"));
          v92 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v92, "BOOLValue"))
            v7->_supportedGameCenterFeatures |= 4uLL;
          objc_msgSend(v91, "objectForKey:", CFSTR("usesGameControllerAPI"));
          v93 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v93, "BOOLValue"))
            v7->_supportedGameCenterFeatures |= 1uLL;
          objc_msgSend(v91, "objectForKey:", CFSTR("usesMultiplayerAPI"));
          v94 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v94, "BOOLValue"))
            v7->_supportedGameCenterFeatures |= 8uLL;
          objc_msgSend(v91, "objectForKey:", CFSTR("usesTurnBasedAPI"));
          v88 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v88, "BOOLValue"))
            v7->_supportedGameCenterFeatures |= 0x10uLL;
          v89 = v91;
        }
        objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAFBC8]);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v96 = objc_alloc_init(SKUIStoreNotes);
          storeNotes = v7->_storeNotes;
          v7->_storeNotes = v96;

          objc_msgSend(v95, "objectForKey:", *MEMORY[0x1E0DAFBB8]);
          v98 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[SKUIStoreNotes setStandardNotes:](v7->_storeNotes, "setStandardNotes:", v98);
        }
        else
        {
          v98 = v88;
        }
        SKUIItemScreenshotsForDictionary(v4);
        v99 = objc_claimAutoreleasedReturnValue();
        screenshots = v7->_screenshots;
        v7->_screenshots = (NSArray *)v99;

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v113 = v89;
          v116 = v66;
          v101 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v123 = 0u;
          v124 = 0u;
          v125 = 0u;
          v126 = 0u;
          v102 = v98;
          v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v123, v136, 16);
          if (v103)
          {
            v104 = v103;
            v105 = *(_QWORD *)v124;
            do
            {
              for (k = 0; k != v104; ++k)
              {
                if (*(_QWORD *)v124 != v105)
                  objc_enumerationMutation(v102);
                v107 = *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * k);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v108 = -[SKUIScreenshot initWithScreenshotDictionary:]([SKUIScreenshot alloc], "initWithScreenshotDictionary:", v107);
                  if (v108)
                    objc_msgSend(v101, "addObject:", v108);

                }
              }
              v104 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v123, v136, 16);
            }
            while (v104);
          }

          v109 = objc_msgSend(v101, "copy");
          v7 = v121;
          v110 = v121->_screenshots;
          v121->_screenshots = (NSArray *)v109;

          v66 = v116;
          v4 = v117;
          v89 = v113;
        }

        goto LABEL_116;
      }
      v61 = -[SKUIItemContentRating initWithContentRatingDictionary:systemName:]([SKUIItemContentRating alloc], "initWithContentRatingDictionary:systemName:", v45, CFSTR("appsApple"));
      v58 = v7->_contentRating;
      v7->_contentRating = v61;
    }

    goto LABEL_54;
  }
LABEL_116:
  v111 = v7;

  return v111;
}

- (id)childItemForIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_loadedChildItems, "objectForKey:", a3);
}

- (id)loadedChildItems
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_childItemIdentifiers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKey:](self->_loadedChildItems, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (int64_t)numberOfChildItems
{
  objc_super v3;

  if (self->_childItemIdentifiers)
    return -[NSArray count](self->_childItemIdentifiers, "count");
  v3.receiver = self;
  v3.super_class = (Class)SKUIProductPageItem;
  return -[SKUIItem numberOfChildItems](&v3, sel_numberOfChildItems);
}

- (void)_setVersionHistory:(id)a3
{
  NSString *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *lastUpdateDateString;
  NSString *v10;
  NSString *updateDescription;
  NSArray *releaseNotes;
  id v13;

  v13 = a3;
  if (objc_msgSend(v13, "count"))
  {
    v5 = (NSString *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    -[NSString setDateStyle:](v5, "setDateStyle:", 2);
    -[NSString setTimeStyle:](v5, "setTimeStyle:", 0);
    objc_msgSend(v13, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringFromDate:](v5, "stringFromDate:", v7);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    lastUpdateDateString = self->_lastUpdateDateString;
    self->_lastUpdateDateString = v8;

    objc_storeStrong((id *)&self->_releaseNotes, a3);
    objc_msgSend(v6, "changeNotes");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    updateDescription = self->_updateDescription;
    self->_updateDescription = v10;

  }
  else
  {
    releaseNotes = self->_releaseNotes;
    self->_releaseNotes = 0;

    v5 = self->_updateDescription;
    self->_updateDescription = 0;
  }

}

- (void)_setInAppPurchases:(id)a3
{
  objc_storeStrong((id *)&self->_inAppPurchases, a3);
}

- (NSURL)artistPageURL
{
  return self->_artistPageURL;
}

- (id)childItemIdentifiers
{
  return self->_childItemIdentifiers;
}

- (SKUIItemContentRating)contentRating
{
  return self->_contentRating;
}

- (NSString)copyrightString
{
  return self->_copyrightString;
}

- (SKUIDeveloperInfo)developerInfo
{
  return self->_developerInfo;
}

- (NSArray)inAppPurchases
{
  return self->_inAppPurchases;
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (NSString)lastUpdateDateString
{
  return self->_lastUpdateDateString;
}

- (NSString)licenseAgreementURLString
{
  return self->_licenseAgreementURLString;
}

- (NSArray)parentBundleItemIdentifiers
{
  return self->_parentBundleItemIdentifiers;
}

- (NSString)privacyPolicyURLString
{
  return self->_privacyPolicyURLString;
}

- (NSString)regularPriceString
{
  return self->_regularPriceString;
}

- (NSArray)releaseNotes
{
  return self->_releaseNotes;
}

- (NSString)reviewsURLString
{
  return self->_reviewsURLString;
}

- (NSArray)screenshots
{
  return self->_screenshots;
}

- (NSArray)secondaryContentRatings
{
  return self->_secondaryContentRatings;
}

- (NSString)sellerName
{
  return self->_sellerName;
}

- (NSString)shortenedProductPageURLString
{
  return self->_shortenedProductPageURLString;
}

- (SKUIStoreNotes)storeNotes
{
  return self->_storeNotes;
}

- (int64_t)supportedFeatures
{
  return self->_supportedFeatures;
}

- (unint64_t)supportedGameCenterFeatures
{
  return self->_supportedGameCenterFeatures;
}

- (NSString)supportURLString
{
  return self->_supportURLString;
}

- (NSString)updateDescription
{
  return self->_updateDescription;
}

- (NSString)installationRequirementsDescription
{
  return self->_installationRequirementsDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateDescription, 0);
  objc_storeStrong((id *)&self->_supportURLString, 0);
  objc_storeStrong((id *)&self->_storeNotes, 0);
  objc_storeStrong((id *)&self->_shortenedProductPageURLString, 0);
  objc_storeStrong((id *)&self->_sellerName, 0);
  objc_storeStrong((id *)&self->_secondaryContentRatings, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
  objc_storeStrong((id *)&self->_reviewsURLString, 0);
  objc_storeStrong((id *)&self->_releaseNotes, 0);
  objc_storeStrong((id *)&self->_regularPriceString, 0);
  objc_storeStrong((id *)&self->_privacyPolicyURLString, 0);
  objc_storeStrong((id *)&self->_parentBundleItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_loadedChildItems, 0);
  objc_storeStrong((id *)&self->_licenseAgreementURLString, 0);
  objc_storeStrong((id *)&self->_lastUpdateDateString, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_installationRequirementsDescription, 0);
  objc_storeStrong((id *)&self->_inAppPurchases, 0);
  objc_storeStrong((id *)&self->_developerInfo, 0);
  objc_storeStrong((id *)&self->_copyrightString, 0);
  objc_storeStrong((id *)&self->_contentRating, 0);
  objc_storeStrong((id *)&self->_childItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_artistPageURL, 0);
}

- (void)initWithIdentifier:mediaResult:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIProductPageItem initWithIdentifier:mediaResult:]";
}

- (void)initWithLookupDictionary:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIProductPageItem initWithLookupDictionary:]";
}

@end
