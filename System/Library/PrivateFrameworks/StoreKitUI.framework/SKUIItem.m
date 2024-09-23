@implementation SKUIItem

- (id)initContainerItemWithItem:(id)a3
{
  id v4;
  SKUIItem *v5;
  uint64_t v6;
  NSString *artistName;
  uint64_t v8;
  SKUIArtworkProviding *artworksProvider;
  uint64_t v10;
  NSString *categoryName;
  uint64_t v12;
  NSString *productPageURLString;
  uint64_t v14;
  NSString *title;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v25;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIItem initContainerItemWithItem:].cold.1();
  }
  v25.receiver = self;
  v25.super_class = (Class)SKUIItem;
  v5 = -[SKUIItem init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "artistName");
    v6 = objc_claimAutoreleasedReturnValue();
    artistName = v5->_artistName;
    v5->_artistName = (NSString *)v6;

    objc_msgSend(v4, "artworksProvider");
    v8 = objc_claimAutoreleasedReturnValue();
    artworksProvider = v5->_artworksProvider;
    v5->_artworksProvider = (SKUIArtworkProviding *)v8;

    objc_msgSend(v4, "categoryName");
    v10 = objc_claimAutoreleasedReturnValue();
    categoryName = v5->_categoryName;
    v5->_categoryName = (NSString *)v10;

    objc_msgSend(v4, "productPageURLString");
    v12 = objc_claimAutoreleasedReturnValue();
    productPageURLString = v5->_productPageURLString;
    v5->_productPageURLString = (NSString *)v12;

    objc_msgSend(v4, "collectionName");
    v14 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v14;

    if (v5->_productPageURLString)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v5->_productPageURLString);
      objc_msgSend(v16, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v19 = objc_msgSend(v17, "rangeOfString:", CFSTR("/id"));
        if (v19 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v18, "substringFromIndex:", v19 + v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v5->_itemIdentifier = objc_msgSend(v21, "longLongValue");

        }
      }

    }
    v22 = objc_msgSend(v4, "itemKind");
    if (v22 == 13)
    {
      v23 = 7;
      goto LABEL_15;
    }
    if (v22 == 14)
    {
      v23 = 15;
LABEL_15:
      v5->_itemKind = v23;
    }
  }

  return v5;
}

- (SKUIItem)initWithLookupDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SKUIItem *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *categoryName;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *collectionName;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSArray *v32;
  NSArray *requiredCapabilities;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  uint64_t v40;
  NSArray *v41;
  void *v42;
  void *v43;
  SKUIItem *v44;
  uint64_t v45;
  NSString *itemKindString;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  SKUIArtworkProviding *artworksProvider;
  void *v51;
  uint64_t v52;
  SKUIArtworkProviding *newsstandArtworks;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  SKUIItemOffer *v68;
  SKUIItemOffer *itemOffer;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t j;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  int64_t itemKind;
  void *v86;
  _QWORD *v87;
  uint64_t v88;
  float v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  id v94;
  uint64_t v95;
  void *v96;
  id v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t k;
  uint64_t v103;
  SKUIVideo *v104;
  uint64_t v105;
  uint64_t v106;
  NSArray *videos;
  SKUIItem *v108;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  void *v122;
  SKUIItem *v123;
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
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  objc_super v140;
  _BYTE v141[128];
  void *v142;
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  uint64_t v146;

  v146 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
    v7 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    if (v7)
      -[SKUIItem initWithLookupDictionary:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
  v140.receiver = self;
  v140.super_class = (Class)SKUIItem;
  v15 = -[SKUIItem init](&v140, sel_init);

  if (!v15)
    goto LABEL_166;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAFAC0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&v15->_artistName, v16);
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAFAD8]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&v15->_bundleID, v17);
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAFB10]);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v18, "count"))
  {
    objc_msgSend(v18, "objectAtIndex:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_22;
    v18 = v19;
    categoryName = v15->_categoryName;
    v15->_categoryName = (NSString *)v18;
  }
  else
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("genres"));
    categoryName = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(categoryName, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v21, "objectForKey:", CFSTR("name"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_storeStrong((id *)&v15->_categoryName, v22);

      }
    }
  }

  v19 = v18;
LABEL_22:
  objc_msgSend(v4, "objectForKey:", CFSTR("collectionName"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = objc_msgSend(v23, "copy");
    collectionName = v15->_collectionName;
    v15->_collectionName = (NSString *)v24;

  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAFB30]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v15->_itemIdentifier = objc_msgSend(v26, "longLongValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("feedUrl"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&v15->_feedUrlString, v27);
  objc_msgSend(v4, "objectForKey:", CFSTR("appCount"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v15->_numberOfChildItems = objc_msgSend(v28, "integerValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("hasInAppPurchases"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v15->_hasInAppPurchases = objc_msgSend(v29, "BOOLValue");
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAFB60]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&v15->_productPageURLString, v30);
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAFB70]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v114 = v4;
  v123 = v15;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = v31;
    requiredCapabilities = v15->_requiredCapabilities;
    v15->_requiredCapabilities = v32;
LABEL_47:

    goto LABEL_48;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    requiredCapabilities = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v31, "componentsSeparatedByString:", CFSTR(" "));
    v136 = 0u;
    v137 = 0u;
    v138 = 0u;
    v139 = 0u;
    v34 = (id)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v136, v145, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v137;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v137 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * i);
          if (objc_msgSend(v39, "length"))
            -[NSArray addObject:](requiredCapabilities, "addObject:", v39);
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v136, v145, 16);
      }
      while (v36);
    }

    v40 = -[NSArray copy](requiredCapabilities, "copy");
    v15 = v123;
    v41 = v123->_requiredCapabilities;
    v123->_requiredCapabilities = (NSArray *)v40;

    v4 = v114;
    goto LABEL_47;
  }
LABEL_48:
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAFB08]);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&v15->_title, v42);
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAFB38]);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)&v15->_itemKindString, v43);
    v44 = v15;
    v45 = 0;
    itemKindString = v44->_itemKindString;
    while (!objc_msgSend((id)qword_1E73A1B20[v45 + 1], "isEqualToString:", itemKindString))
    {
      v45 += 2;
      if (v45 == 50)
      {
        v47 = 0;
        goto LABEL_56;
      }
    }
    v47 = qword_1E73A1B20[v45];
LABEL_56:
    v123->_itemKind = v47;
  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAFAD0]);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  +[SKUIArtworkProvidingFactory artworkProviderForStoreResponse:](SKUIArtworkProvidingFactory, "artworkProviderForStoreResponse:", v48);
  v49 = objc_claimAutoreleasedReturnValue();
  artworksProvider = v123->_artworksProvider;
  v123->_artworksProvider = (SKUIArtworkProviding *)v49;

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAFB48]);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v123;
  +[SKUIArtworkProvidingFactory artworkProviderForStoreResponse:](SKUIArtworkProvidingFactory, "artworkProviderForStoreResponse:", v51);
  v52 = objc_claimAutoreleasedReturnValue();
  newsstandArtworks = v123->_newsstandArtworks;
  v123->_newsstandArtworks = (SKUIArtworkProviding *)v52;

  if (v123->_newsstandArtworks)
    v123->_newsstandApp = 1;
  objc_msgSend(v4, "objectForKey:", CFSTR("hasMessagesExtension"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v123->_hasMessagesExtension = objc_msgSend(v54, "BOOLValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("isHiddenFromSpringBoard"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v123->_isHiddenFromSpringBoard = objc_msgSend(v55, "BOOLValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("isGameControllerSupported"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v123->_gameControllerSupported = objc_msgSend(v56, "BOOLValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("requiresGameController"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v123->_requiresGameController = objc_msgSend(v57, "BOOLValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("ageBand"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v58, "objectForKey:", CFSTR("maxAge"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "objectForKey:", CFSTR("minAge"));
    v113 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v113 = 0;
    v59 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v123->_ageBandRange.location = objc_msgSend(v113, "integerValue");
    v60 = objc_msgSend(v59, "integerValue") - v123->_ageBandRange.location;
  }
  else
  {
    v60 = 0;
    v123->_ageBandRange.location = 0x7FFFFFFFFFFFFFFFLL;
  }
  v123->_ageBandRange.length = v60;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAFAE0]);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v61, "objectForKey:", CFSTR("value"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    v118 = v62;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v123->_parentalControlsRank = objc_msgSend(v62, "integerValue");
  }
  else
  {
    v118 = v57;
  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAFB50]);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v117 = v63;
  v111 = v61;
  v112 = v59;
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v63, "count"))
  {
    objc_msgSend(v63, "objectAtIndex:", 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v64, "objectForKey:", CFSTR("version"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v65, "objectForKey:", CFSTR("display"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_storeStrong((id *)&v123->_versionString, v66);
        objc_msgSend(v65, "objectForKey:", CFSTR("externalId"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        v118 = v67;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v123->_versionIdentifier = objc_msgSend(v67, "longLongValue");
      }
      v68 = -[SKUIItemOffer initWithLookupDictionary:]([SKUIItemOffer alloc], "initWithLookupDictionary:", v64);
      itemOffer = v123->_itemOffer;
      v123->_itemOffer = v68;

      objc_msgSend(v4, "objectForKey:", CFSTR("fileSizeByDevice"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SKUIItemOffer _setFileSizeWithDeviceSizes:](v123->_itemOffer, "_setFileSizeWithDeviceSizes:", v70);

      v61 = v111;
      v59 = v112;
    }

    v63 = v117;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("deviceFamilies"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v71)
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAFBB0]);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v72, "objectForKey:", CFSTR("deviceFamilies"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v71 = 0;
    }

    v63 = v117;
  }
  objc_opt_class();
  v122 = v71;
  v110 = v58;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    v73 = v71;
    v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v132, v144, 16);
    if (!v74)
      goto LABEL_113;
    v75 = v74;
    v76 = *(_QWORD *)v133;
    while (1)
    {
      for (j = 0; j != v75; ++j)
      {
        if (*(_QWORD *)v133 != v76)
          objc_enumerationMutation(v73);
        v78 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ((objc_msgSend(v78, "isEqualToString:", CFSTR("ipad")) & 1) != 0)
          {
            v79 = 1;
          }
          else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("iphone")) & 1) != 0)
          {
            v79 = 2;
          }
          else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("ipod")) & 1) != 0)
          {
            v79 = 4;
          }
          else
          {
            if (!objc_msgSend(v78, "isEqualToString:", CFSTR("tvos")))
              continue;
            v79 = 8;
          }
          v123->_deviceFamilies |= v79;
        }
      }
      v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v132, v144, 16);
      if (!v75)
      {
LABEL_113:

        v4 = v114;
        v58 = v110;
        v61 = v111;
        v59 = v112;
        v63 = v117;
        v71 = v122;
        goto LABEL_115;
      }
    }
  }
  v123->_deviceFamilies = 15;
LABEL_115:
  objc_msgSend(v4, "objectForKey:", CFSTR("editorialBadgeInfo"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v115 = v80;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v80, "objectForKey:", CFSTR("nameForDisplay"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v123->_editorialBadge, v81);

    v63 = v117;
  }
  if (!v123->_versionIdentifier)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("version"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v123->_versionString, v82);
    objc_msgSend(v4, "objectForKey:", CFSTR("versionId"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    v118 = v83;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v123->_versionIdentifier = objc_msgSend(v83, "longLongValue");
    v63 = v117;
    v71 = v122;
  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAFBE8]);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v116 = v84;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    itemKind = v123->_itemKind;
    if (itemKind == 17 || itemKind == 12)
    {
      objc_msgSend(v84, "objectForKey:", *MEMORY[0x1E0DAFBE0]);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v123->_numberOfUserRatings = objc_msgSend(v86, "integerValue");
      v87 = (_QWORD *)MEMORY[0x1E0DAFBF8];
    }
    else
    {
      objc_msgSend(v84, "objectForKey:", *MEMORY[0x1E0DAFBD8]);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v123->_numberOfUserRatings = objc_msgSend(v86, "integerValue");
      v87 = (_QWORD *)MEMORY[0x1E0DAFBF0];
    }
    objc_msgSend(v84, "objectForKey:", *v87);
    v88 = objc_claimAutoreleasedReturnValue();

    v118 = (void *)v88;
    v63 = v117;
    v71 = v122;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v118, "floatValue");
      v123->_userRating = v89;
    }
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("videoPreviewByType"));
  v90 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v121 = (void *)v90;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v91, "userInterfaceIdiom");

    if (v92 == 1)
      v93 = &unk_1E749BA88;
    else
      v93 = &unk_1E749BAA0;
    v94 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v128 = 0u;
    v129 = 0u;
    v130 = 0u;
    v131 = 0u;
    v120 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v128, v143, 16);
    if (v120)
    {
      v119 = *(_QWORD *)v129;
LABEL_142:
      v95 = 0;
      while (1)
      {
        if (*(_QWORD *)v129 != v119)
          objc_enumerationMutation(v93);
        objc_msgSend(v121, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * v95));
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v97 = v96;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v142 = v96;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v142, 1);
            v97 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v97 = 0;
          }
        }
        v126 = 0u;
        v127 = 0u;
        v124 = 0u;
        v125 = 0u;
        v98 = v97;
        v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v124, v141, 16);
        if (v99)
        {
          v100 = v99;
          v101 = *(_QWORD *)v125;
          do
          {
            for (k = 0; k != v100; ++k)
            {
              if (*(_QWORD *)v125 != v101)
                objc_enumerationMutation(v98);
              v103 = *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v104 = -[SKUIVideo initWithVideoDictionary:]([SKUIVideo alloc], "initWithVideoDictionary:", v103);
                if (v104)
                  objc_msgSend(v94, "addObject:", v104);

              }
            }
            v100 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v124, v141, 16);
          }
          while (v100);
        }

        v105 = objc_msgSend(v94, "count");
        v71 = v122;
        v15 = v123;
        if (v105)
          break;
        if (++v95 == v120)
        {
          v120 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v128, v143, 16);
          if (v120)
            goto LABEL_142;
          break;
        }
      }
    }
    v106 = objc_msgSend(v94, "copy");
    videos = v15->_videos;
    v15->_videos = (NSArray *)v106;

    v4 = v114;
    v58 = v110;
    v61 = v111;
    v59 = v112;
    v63 = v117;
  }

LABEL_166:
  v108 = v15;

  return v108;
}

- (SKUIItem)initWithIdentifier:(id)a3 mediaResultDictionary:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIItem *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSArray *v25;
  NSArray *requiredCapabilities;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  uint64_t v33;
  NSArray *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  SKUIArtworkProviding *artworksProvider;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  SKUIItemOffer *v46;
  SKUIItemOffer *itemOffer;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  float v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  objc_super v76;
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v8)
        -[SKUIItem initWithIdentifier:mediaResultDictionary:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v76.receiver = self;
  v76.super_class = (Class)SKUIItem;
  v16 = -[SKUIItem init](&v76, sel_init);
  if (!v16)
    goto LABEL_74;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v16->_itemIdentifier = objc_msgSend(v6, "longLongValue");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("platformAttributes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ios"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("artistName"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&v16->_artistName, v19);
  objc_msgSend(v18, "objectForKey:", CFSTR("bundleId"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&v16->_bundleID, v20);
  objc_msgSend(v7, "objectForKey:", CFSTR("genreDisplayName"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&v16->_categoryName, v21);
  objc_msgSend(v18, "objectForKey:", CFSTR("hasInAppPurchases"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v16->_hasInAppPurchases = objc_msgSend(v22, "BOOLValue");
  objc_msgSend(v7, "objectForKey:", CFSTR("url"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&v16->_productPageURLString, v23);
  objc_msgSend(v18, "objectForKey:", CFSTR("requiredCapabilities"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = v24;
    requiredCapabilities = v16->_requiredCapabilities;
    v16->_requiredCapabilities = v25;
LABEL_31:

    goto LABEL_32;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v63 = v18;
    v64 = v7;
    v66 = v6;
    requiredCapabilities = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v24, "componentsSeparatedByString:", CFSTR(" "));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v73 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
          if (objc_msgSend(v32, "length"))
            -[NSArray addObject:](requiredCapabilities, "addObject:", v32);
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
      }
      while (v29);
    }
    v33 = -[NSArray copy](requiredCapabilities, "copy");
    v34 = v16->_requiredCapabilities;
    v16->_requiredCapabilities = (NSArray *)v33;

    v7 = v64;
    v6 = v66;
    v18 = v63;
    goto LABEL_31;
  }
LABEL_32:
  objc_msgSend(v7, "objectForKey:", CFSTR("name"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&v16->_title, v35);
  objc_msgSend(v18, "objectForKey:", CFSTR("artwork"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  +[SKUIArtworkProvidingFactory artworkProviderForStoreResponse:](SKUIArtworkProvidingFactory, "artworkProviderForStoreResponse:", v36);
  v37 = objc_claimAutoreleasedReturnValue();
  artworksProvider = v16->_artworksProvider;
  v16->_artworksProvider = (SKUIArtworkProviding *)v37;

  objc_msgSend(v18, "objectForKey:", CFSTR("hasMessagesExtension"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v16->_hasMessagesExtension = objc_msgSend(v39, "BOOLValue");
  objc_msgSend(v18, "objectForKey:", CFSTR("isHiddenFromSpringboard"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v16->_isHiddenFromSpringBoard = objc_msgSend(v40, "BOOLValue");
  objc_msgSend(v18, "objectForKey:", CFSTR("supportsGameController"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v16->_gameControllerSupported = objc_msgSend(v41, "BOOLValue");
  objc_msgSend(v18, "objectForKey:", CFSTR("requiresGameController"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v16->_requiresGameController = objc_msgSend(v42, "BOOLValue");
  objc_msgSend(v18, "objectForKey:", CFSTR("externalVersionId"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v16->_versionIdentifier = objc_msgSend(v43, "longLongValue");
  objc_msgSend(v18, "objectForKey:", CFSTR("offers"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v44, "count"))
  {
    objc_msgSend(v44, "objectAtIndex:", 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v46 = -[SKUIItemOffer initWithLookupDictionary:]([SKUIItemOffer alloc], "initWithLookupDictionary:", v45);
      itemOffer = v16->_itemOffer;
      v16->_itemOffer = v46;

    }
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("deviceFamilies"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v61 = v44;
    v62 = v43;
    v65 = v7;
    v67 = v6;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v60 = v48;
    v49 = v48;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
    if (!v50)
      goto LABEL_67;
    v51 = v50;
    v52 = *(_QWORD *)v69;
    while (1)
    {
      for (j = 0; j != v51; ++j)
      {
        if (*(_QWORD *)v69 != v52)
          objc_enumerationMutation(v49);
        v54 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ((objc_msgSend(v54, "isEqualToString:", CFSTR("ipad")) & 1) != 0)
          {
            v55 = 1;
          }
          else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("iphone")) & 1) != 0)
          {
            v55 = 2;
          }
          else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("ipod")) & 1) != 0)
          {
            v55 = 4;
          }
          else
          {
            if (!objc_msgSend(v54, "isEqualToString:", CFSTR("tvos")))
              continue;
            v55 = 8;
          }
          v16->_deviceFamilies |= v55;
        }
      }
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
      if (!v51)
      {
LABEL_67:

        v7 = v65;
        v6 = v67;
        v43 = v62;
        v48 = v60;
        v44 = v61;
        break;
      }
    }
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("userRating"), v60, v61);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v56, "objectForKey:", CFSTR("ratingCount"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16->_numberOfUserRatings = objc_msgSend(v57, "integerValue");
    objc_msgSend(v56, "objectForKey:", CFSTR("value"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v43, "floatValue");
      v16->_userRating = v58;
    }
  }

LABEL_74:
  return v16;
}

- (id)artworkURLForSize:(int64_t)a3
{
  return (id)-[SKUIArtworkProviding artworkURLForSize:](self->_artworksProvider, "artworkURLForSize:", a3);
}

- (UIImage)artworkImage
{
  return 0;
}

- (id)childItemForIdentifier:(id)a3
{
  return 0;
}

- (NSArray)childItemIdentifiers
{
  return 0;
}

- (NSURL)largestArtworkURL
{
  void *v2;
  void *v3;

  -[SKUIArtworkProviding largestArtwork](self->_artworksProvider, "largestArtwork");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSArray)loadedChildItems
{
  return 0;
}

- (SKUIStoreIdentifier)storeIdentifier
{
  SKUIStoreIdentifier *storeIdentifier;
  SKUIStoreIdentifier *v4;
  SKUIStoreIdentifier *v5;
  void *v6;

  storeIdentifier = self->_storeIdentifier;
  if (!storeIdentifier)
  {
    v4 = -[SKUIStoreIdentifier initWithLongLong:]([SKUIStoreIdentifier alloc], "initWithLongLong:", -[SKUIItem itemIdentifier](self, "itemIdentifier"));
    v5 = self->_storeIdentifier;
    self->_storeIdentifier = v4;

    -[SKUIItem bundleIdentifier](self, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStoreIdentifier setBundleIdentifier:](self->_storeIdentifier, "setBundleIdentifier:", v6);

    -[SKUIStoreIdentifier setPodcastFeedURLIdentifier:](self->_storeIdentifier, "setPodcastFeedURLIdentifier:", self->_feedUrlString);
    storeIdentifier = self->_storeIdentifier;
  }
  return storeIdentifier;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)setItemIdentifier:(int64_t)a3
{
  self->_itemIdentifier = a3;
}

- (void)setItemKind:(int64_t)a3
{
  self->_itemKind = a3;
}

- (void)addItemOfferParameterWithName:(id)a3 value:(id)a4
{
  -[SKUIItemOffer _addActionParameterWithName:value:](self->_itemOffer, "_addActionParameterWithName:value:", a3, a4);
}

- (id)lookupDictionary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int64_t v31;
  void *v32;
  void *v33;
  id v34;
  char v35;
  char v36;
  void *v37;
  id v38;
  int64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char isKindOfClass;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  char v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  const __CFString *v62;
  void *v63;
  _QWORD v64[2];

  v64[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SKUIItem ageBandRange](self, "ageBandRange");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v4;
    v7 = v5;
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("minAge"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6 + v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("maxAge"));

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("ageBand"));
  }
  -[SKUIItem artistName](self, "artistName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v3, "setObject:forKey:", v11, *MEMORY[0x1E0DAFAC0]);
  -[SKUIItem bundleIdentifier](self, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v3, "setObject:forKey:", v12, *MEMORY[0x1E0DAFAD8]);
  -[SKUIItem categoryName](self, "categoryName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v13, 0);
    objc_msgSend(v3, "setObject:forKey:", v14, *MEMORY[0x1E0DAFB10]);

  }
  -[SKUIItem collectionName](self, "collectionName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("collectionName"));
  if (-[SKUIItem hasInAppPurchases](self, "hasInAppPurchases"))
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("hasInAppPurchases"));
  v16 = -[SKUIItem itemIdentifier](self, "itemIdentifier");
  if (v16)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", v16);
    objc_msgSend(v3, "setObject:forKey:", v17, *MEMORY[0x1E0DAFB30]);

  }
  -[SKUIItem itemKindString](self, "itemKindString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    objc_msgSend(v3, "setObject:forKey:", v18, *MEMORY[0x1E0DAFB38]);
  -[SKUIItem primaryItemOffer](self, "primaryItemOffer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "lookupDictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, *MEMORY[0x1E0DAFB50]);

  }
  v23 = -[SKUIItem numberOfChildItems](self, "numberOfChildItems");
  if (v23 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("appCount"));

  }
  v25 = -[SKUIItem parentalControlsRank](self, "parentalControlsRank");
  if (v25)
  {
    v62 = CFSTR("value");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, *MEMORY[0x1E0DAFAE0]);

  }
  -[SKUIItem productPageURLString](self, "productPageURLString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
    objc_msgSend(v3, "setObject:forKey:", v28, *MEMORY[0x1E0DAFB60]);
  -[SKUIItem requiredCapabilities](self, "requiredCapabilities");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
    objc_msgSend(v3, "setObject:forKey:", v29, *MEMORY[0x1E0DAFB70]);
  -[SKUIItem title](self, "title");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
    objc_msgSend(v3, "setObject:forKey:", v30, *MEMORY[0x1E0DAFB08]);
  v31 = -[SKUIItem versionIdentifier](self, "versionIdentifier");
  if (v31)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("versionId"));

  }
  -[SKUIItem versionString](self, "versionString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("version"));
  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = -[SKUIItem deviceFamilies](self, "deviceFamilies");
  v36 = v35;
  if ((v35 & 1) != 0)
  {
    objc_msgSend(v34, "addObject:", CFSTR("ipad"));
    if ((v36 & 2) == 0)
    {
LABEL_35:
      if ((v36 & 4) == 0)
        goto LABEL_37;
      goto LABEL_36;
    }
  }
  else if ((v35 & 2) == 0)
  {
    goto LABEL_35;
  }
  objc_msgSend(v34, "addObject:", CFSTR("iphone"));
  if ((v36 & 4) != 0)
LABEL_36:
    objc_msgSend(v34, "addObject:", CFSTR("ipod"));
LABEL_37:
  if (objc_msgSend(v34, "count"))
  {
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v34, CFSTR("deviceFamilies"), 0);
    objc_msgSend(v3, "setObject:forKey:", v37, *MEMORY[0x1E0DAFBB0]);

  }
  v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v39 = -[SKUIItem itemKind](self, "itemKind");
  v40 = (_QWORD *)MEMORY[0x1E0DAFBF0];
  v41 = (_QWORD *)MEMORY[0x1E0DAFBD8];
  if (v39 == 17)
  {
    v41 = (_QWORD *)MEMORY[0x1E0DAFBE0];
    v40 = (_QWORD *)MEMORY[0x1E0DAFBF8];
  }
  if (v39 == 12)
    v42 = (_QWORD *)MEMORY[0x1E0DAFBE0];
  else
    v42 = v41;
  if (v39 == 12)
    v43 = (_QWORD *)MEMORY[0x1E0DAFBF8];
  else
    v43 = v40;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SKUIItem numberOfUserRatings](self, "numberOfUserRatings"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKey:", v44, *v42);

  v45 = (void *)MEMORY[0x1E0CB37E8];
  -[SKUIItem userRating](self, "userRating");
  objc_msgSend(v45, "numberWithFloat:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKey:", v46, *v43);

  objc_msgSend(v3, "setObject:forKey:", v38, *MEMORY[0x1E0DAFBE8]);
  -[SKUIItem artworksProvider](self, "artworksProvider");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[SKUIItem artworksProvider](self, "artworksProvider");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v49;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    v53 = objc_opt_isKindOfClass();

    if ((v53 & 1) == 0)
      goto LABEL_58;
    -[SKUIItem artworksProvider](self, "artworksProvider");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "_lookupArray");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v52, "count"))
      goto LABEL_56;
    goto LABEL_55;
  }
  objc_msgSend(v49, "urlTemplateString");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    objc_msgSend(v50, "_lookupDictionary");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_55:
    objc_msgSend(v3, "setObject:forKey:", v52, *MEMORY[0x1E0DAFAD0]);
LABEL_56:

  }
LABEL_58:
  -[SKUIItem newsstandArtworks](self, "newsstandArtworks");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v55 = objc_opt_isKindOfClass();

  -[SKUIItem newsstandArtworks](self, "newsstandArtworks");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56;
  if ((v55 & 1) != 0)
  {
    objc_msgSend(v56, "urlTemplateString");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v58)
    {
LABEL_65:

      goto LABEL_66;
    }
    objc_msgSend(v57, "_lookupDictionary");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_63;
  }
  objc_opt_class();
  v60 = objc_opt_isKindOfClass();

  if ((v60 & 1) != 0)
  {
    -[SKUIItem newsstandArtworks](self, "newsstandArtworks");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "_lookupArray");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v59, "count"))
    {
LABEL_64:

      goto LABEL_65;
    }
LABEL_63:
    objc_msgSend(v3, "setObject:forKey:", v59, *MEMORY[0x1E0DAFB48]);
    goto LABEL_64;
  }
LABEL_66:

  return v3;
}

- (NSString)_downloadKind
{
  unint64_t v2;
  id v3;

  v2 = -[SKUIItem itemKind](self, "itemKind");
  if (v2 <= 0x12)
    v3 = **((id **)&unk_1E73A1CB0 + v2);
  return (NSString *)v3;
}

- (void)_setHasInAppPurchases:(BOOL)a3
{
  self->_hasInAppPurchases = a3;
}

- (unint64_t)hash
{
  return self->_itemIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = objc_msgSend(v4, "itemIdentifier");
    v6 = v7 == -[SKUIItem itemIdentifier](self, "itemIdentifier");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (SKUIItem)initWithCacheRepresentation:(id)a3
{
  id v4;
  SKUIItem *v5;
  void *v6;
  uint64_t v7;
  NSString *artistName;
  void *v9;
  uint64_t v10;
  NSString *bundleID;
  void *v12;
  uint64_t v13;
  NSString *categoryName;
  void *v15;
  uint64_t v16;
  NSString *collectionName;
  void *v18;
  void *v19;
  void *v20;
  SKUIItemOffer *v21;
  SKUIItemOffer *itemOffer;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSString *productPageURLString;
  void *v29;
  uint64_t v30;
  NSArray *requiredCapabilities;
  void *v32;
  uint64_t v33;
  NSString *title;
  void *v35;
  float v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSString *versionString;
  void *v41;
  uint64_t v42;
  NSString *itemKindString;
  uint64_t v44;
  NSString *v45;
  uint64_t v46;
  NSString *v47;
  void *v48;
  void *v49;
  __objc2_class *v50;
  uint64_t v51;
  SKUIArtworkProviding *artworksProvider;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  objc_super v58;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v58.receiver = self;
    v58.super_class = (Class)SKUIItem;
    v5 = -[SKUIItem init](&v58, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("artistName"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = objc_msgSend(v6, "copy");
        artistName = v5->_artistName;
        v5->_artistName = (NSString *)v7;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("bid"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = objc_msgSend(v9, "copy");
        bundleID = v5->_bundleID;
        v5->_bundleID = (NSString *)v10;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("genre"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_msgSend(v12, "copy");
        categoryName = v5->_categoryName;
        v5->_categoryName = (NSString *)v13;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("col_name"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = objc_msgSend(v15, "copy");
        collectionName = v5->_collectionName;
        v5->_collectionName = (NSString *)v16;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("dev_fam"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5->_deviceFamilies = objc_msgSend(v18, "unsignedIntegerValue");
      objc_msgSend(v4, "objectForKey:", CFSTR("id"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5->_itemIdentifier = objc_msgSend(v19, "longLongValue");
      objc_msgSend(v4, "objectForKey:", CFSTR("offer"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = -[SKUIItemOffer initWithCacheRepresentation:]([SKUIItemOffer alloc], "initWithCacheRepresentation:", v20);
        itemOffer = v5->_itemOffer;
        v5->_itemOffer = v21;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("child_count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5->_numberOfChildItems = objc_msgSend(v23, "integerValue");
      objc_msgSend(v4, "objectForKey:", CFSTR("user_rating_count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5->_numberOfUserRatings = objc_msgSend(v24, "integerValue");
      objc_msgSend(v4, "objectForKey:", CFSTR("parental_rank"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5->_parentalControlsRank = objc_msgSend(v25, "integerValue");
      objc_msgSend(v4, "objectForKey:", CFSTR("url"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = objc_msgSend(v26, "copy");
        productPageURLString = v5->_productPageURLString;
        v5->_productPageURLString = (NSString *)v27;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("req_caps"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = objc_msgSend(v29, "copy");
        requiredCapabilities = v5->_requiredCapabilities;
        v5->_requiredCapabilities = (NSArray *)v30;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("name"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = objc_msgSend(v32, "copy");
        title = v5->_title;
        v5->_title = (NSString *)v33;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("user_rating"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v35, "floatValue");
        v5->_userRating = v36;
      }
      objc_msgSend(v4, "objectForKey:", CFSTR("version_id"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5->_versionIdentifier = objc_msgSend(v37, "longLongValue");
      objc_msgSend(v4, "objectForKey:", CFSTR("version"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v39 = objc_msgSend(v38, "copy");
        versionString = v5->_versionString;
        v5->_versionString = (NSString *)v39;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("kind"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v42 = objc_msgSend(v41, "copy");
        itemKindString = v5->_itemKindString;
        v5->_itemKindString = (NSString *)v42;

        v44 = 0;
        v45 = v5->_itemKindString;
        while (!objc_msgSend((id)qword_1E73A1B20[v44 + 1], "isEqualToString:", v45))
        {
          v44 += 2;
          if (v44 == 50)
          {
            v46 = 0;
            goto LABEL_43;
          }
        }
        v46 = qword_1E73A1B20[v44];
LABEL_43:
        v5->_itemKind = v46;
      }
      else
      {
        v47 = v5->_itemKindString;
        v5->_itemKind = 12;
        v5->_itemKindString = (NSString *)CFSTR("iosSoftware");

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("artwork"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "objectForKey:", CFSTR("artworkProvider"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && objc_msgSend(v49, "isEqualToString:", CFSTR("artworkTemplate")))
        {
          v50 = SKUIArtworkTemplate;
        }
        else
        {
          v50 = SKUIArtworkList;
        }
        v51 = objc_msgSend([v50 alloc], "initWithCacheRepresentation:", v48);
        artworksProvider = v5->_artworksProvider;
        v5->_artworksProvider = (SKUIArtworkProviding *)v51;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("ageblen"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("agebloc"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v55 = objc_msgSend(v54, "integerValue");
        v56 = objc_msgSend(v53, "integerValue");
        v5->_ageBandRange.location = v55;
      }
      else
      {
        v56 = 0;
        v5->_ageBandRange.location = 0x7FFFFFFFFFFFFFFFLL;
      }
      v5->_ageBandRange.length = v56;

    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (NSMutableDictionary)cacheRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  NSString *artistName;
  NSString *bundleID;
  NSString *categoryName;
  NSString *collectionName;
  NSString *itemKindString;
  NSString *productPageURLString;
  NSArray *requiredCapabilities;
  NSString *title;
  NSString *versionString;
  void *v23;
  void *v24;
  const __CFString *v25;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_ageBandRange.length);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("ageblen"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_ageBandRange.location);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("agebloc"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_deviceFamilies);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("dev_fam"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_itemIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("id"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfChildItems);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("child_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfUserRatings);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("user_rating_count"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_parentalControlsRank);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("parental_rank"));

  *(float *)&v11 = self->_userRating;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("user_rating"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_versionIdentifier);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("version_id"));

  artistName = self->_artistName;
  if (artistName)
    objc_msgSend(v3, "setObject:forKey:", artistName, CFSTR("artistName"));
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v3, "setObject:forKey:", bundleID, CFSTR("bid"));
  categoryName = self->_categoryName;
  if (categoryName)
    objc_msgSend(v3, "setObject:forKey:", categoryName, CFSTR("genre"));
  collectionName = self->_collectionName;
  if (collectionName)
    objc_msgSend(v3, "setObject:forKey:", collectionName, CFSTR("col_name"));
  itemKindString = self->_itemKindString;
  if (itemKindString)
    objc_msgSend(v3, "setObject:forKey:", itemKindString, CFSTR("kind"));
  productPageURLString = self->_productPageURLString;
  if (productPageURLString)
    objc_msgSend(v3, "setObject:forKey:", productPageURLString, CFSTR("url"));
  requiredCapabilities = self->_requiredCapabilities;
  if (requiredCapabilities)
    objc_msgSend(v3, "setObject:forKey:", requiredCapabilities, CFSTR("req_caps"));
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("name"));
  versionString = self->_versionString;
  if (versionString)
    objc_msgSend(v3, "setObject:forKey:", versionString, CFSTR("version"));
  -[SKUIItemOffer cacheRepresentation](self->_itemOffer, "cacheRepresentation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("offer"));
  -[SKUIArtworkProviding cacheRepresentation](self->_artworksProvider, "cacheRepresentation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("artwork"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = CFSTR("artworkTemplate");
LABEL_27:
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("artworkProvider"));
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = CFSTR("artworkList");
    goto LABEL_27;
  }
LABEL_28:

  return (NSMutableDictionary *)v3;
}

- (id)valueForMetricsField:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAFC50]))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_itemIdentifier);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAFC68]) & 1) != 0
         || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAFC60]))
  {
    -[SKUIItem title](self, "title");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAFC70]))
    {
      v6 = 0;
      goto LABEL_7;
    }
    -[SKUIItem itemKindString](self, "itemKindString");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

- (NSString)bundleIdentifier
{
  return self->_bundleID;
}

- (SKUIItemOffer)primaryItemOffer
{
  return self->_itemOffer;
}

- (_NSRange)ageBandRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_ageBandRange.length;
  location = self->_ageBandRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (SKUIArtworkProviding)artworksProvider
{
  return self->_artworksProvider;
}

- (int64_t)numberOfChildItems
{
  return self->_numberOfChildItems;
}

- (unint64_t)deviceFamilies
{
  return self->_deviceFamilies;
}

- (BOOL)hasPrerenderedArtwork
{
  return self->_prerenderedArtwork;
}

- (NSString)categoryName
{
  return self->_categoryName;
}

- (NSString)collectionName
{
  return self->_collectionName;
}

- (NSString)editorialBadge
{
  return self->_editorialBadge;
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (int64_t)itemKind
{
  return self->_itemKind;
}

- (NSString)itemKindString
{
  return self->_itemKindString;
}

- (int64_t)numberOfUserRatings
{
  return self->_numberOfUserRatings;
}

- (int64_t)parentalControlsRank
{
  return self->_parentalControlsRank;
}

- (NSString)productPageURLString
{
  return self->_productPageURLString;
}

- (NSArray)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (float)userRating
{
  return self->_userRating;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)versionIdentifier
{
  return self->_versionIdentifier;
}

- (NSString)versionString
{
  return self->_versionString;
}

- (NSArray)videos
{
  return self->_videos;
}

- (BOOL)hasInAppPurchases
{
  return self->_hasInAppPurchases;
}

- (BOOL)hasMessagesExtension
{
  return self->_hasMessagesExtension;
}

- (BOOL)isHiddenFromSpringBoard
{
  return self->_isHiddenFromSpringBoard;
}

- (BOOL)gameControllerSupported
{
  return self->_gameControllerSupported;
}

- (BOOL)requiresGameController
{
  return self->_requiresGameController;
}

- (BOOL)isNewsstandApp
{
  return self->_newsstandApp;
}

- (int64_t)newsstandBindingEdge
{
  return self->_newsstandBindingEdge;
}

- (int64_t)newsstandBindingType
{
  return self->_newsstandBindingType;
}

- (SKUIArtworkProviding)newsstandArtworks
{
  return self->_newsstandArtworks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newsstandArtworks, 0);
  objc_storeStrong((id *)&self->_editorialBadge, 0);
  objc_storeStrong((id *)&self->_artworksProvider, 0);
  objc_storeStrong((id *)&self->_videos, 0);
  objc_storeStrong((id *)&self->_versionString, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
  objc_storeStrong((id *)&self->_productPageURLString, 0);
  objc_storeStrong((id *)&self->_itemOffer, 0);
  objc_storeStrong((id *)&self->_itemKindString, 0);
  objc_storeStrong((id *)&self->_feedUrlString, 0);
  objc_storeStrong((id *)&self->_editorialBage, 0);
  objc_storeStrong((id *)&self->_collectionName, 0);
  objc_storeStrong((id *)&self->_categoryName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
}

- (void)initContainerItemWithItem:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIItem initContainerItemWithItem:]";
  OUTLINED_FUNCTION_1();
}

- (void)initWithLookupDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithIdentifier:(uint64_t)a3 mediaResultDictionary:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
