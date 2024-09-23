@implementation PKPassSemanticTileFactory

+ (PKPassSemanticTileFactory)sharedInstance
{
  if (_MergedGlobals_679 != -1)
    dispatch_once(&_MergedGlobals_679, &__block_literal_global_137);
  return (PKPassSemanticTileFactory *)(id)qword_1ED06C770;
}

void __43__PKPassSemanticTileFactory_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PKPassSemanticTileFactory _init]([PKPassSemanticTileFactory alloc], "_init");
  v1 = (void *)qword_1ED06C770;
  qword_1ED06C770 = (uint64_t)v0;

}

+ (BOOL)supportsSemanticTilesForPass:(id)a3
{
  return objc_msgSend(a3, "style") == 9;
}

- (id)_init
{
  PKPassSemanticTileFactory *v2;
  NSCache *v3;
  NSCache *tileContentCache;
  NSMutableDictionary *v5;
  NSMutableDictionary *outstandingTileUpdates;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *workQueue;
  void *v10;
  uint64_t v11;
  PKWebServiceTicketingFeature *featureOverrides;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKPassSemanticTileFactory;
  v2 = -[PKPassSemanticTileFactory init](&v14, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    tileContentCache = v2->_tileContentCache;
    v2->_tileContentCache = v3;

    -[NSCache setEvictsObjectsWhenApplicationEntersBackground:](v2->_tileContentCache, "setEvictsObjectsWhenApplicationEntersBackground:", 0);
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    outstandingTileUpdates = v2->_outstandingTileUpdates;
    v2->_outstandingTileUpdates = v5;

    v2->_tileUpdatesLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.passkitui.semantictilefactory", v7);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "supportedRegionFeatureOfType:didFailOSVersionRequirements:", 18, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    featureOverrides = v2->_featureOverrides;
    v2->_featureOverrides = (PKWebServiceTicketingFeature *)v11;

  }
  return v2;
}

- (id)createTilesForPass:(id)a3 context:(int64_t)a4 tileUpdateBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a5;
  if (+[PKPassSemanticTileFactory supportsSemanticTilesForPass:](PKPassSemanticTileFactory, "supportsSemanticTilesForPass:", v8))
  {
    -[PKPassSemanticTileFactory _generatedTicketTilesWithPass:context:tileUpdateBlock:](self, "_generatedTicketTilesWithPass:context:tileUpdateBlock:", v8, a4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)prewarmTileContentForPass:(id)a3 context:(int64_t)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a3;
  if (a4 == 2)
  {
    v9 = v6;
    v8 = -[PKPassSemanticTileFactory _eventGuideTilesForPass:prewarm:tileUpdateBlock:](self, "_eventGuideTilesForPass:prewarm:tileUpdateBlock:", v6, 1, 0);
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    v9 = v6;
    v7 = -[PKPassSemanticTileFactory _dashboardTilesForPass:prewarm:tileUpdateBlock:](self, "_dashboardTilesForPass:prewarm:tileUpdateBlock:", v6, 1, 0);
LABEL_5:
    v6 = v9;
  }

}

- (id)analyticsTileAvailabilityForPass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  id v34;
  id obj;
  uint64_t v36;
  PKPassSemanticTileFactory *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[PKPassSemanticTileFactory supportsSemanticTilesForPass:](PKPassSemanticTileFactory, "supportsSemanticTilesForPass:", v4))
  {
    -[PKPassSemanticTileFactory createTilesForPass:context:tileUpdateBlock:](self, "createTilesForPass:context:tileUpdateBlock:", v4, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = self;
    v38 = v4;
    -[PKPassSemanticTileFactory createTilesForPass:context:tileUpdateBlock:](self, "createTilesForPass:context:tileUpdateBlock:", v4, 2, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = v5;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v52 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          objc_msgSend(v12, "tiles");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v48;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v48 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "analyticsIdentifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "safelyAddObject:", v18);

              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
            }
            while (v15);
          }

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
      }
      while (v9);
    }

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v34 = v6;
    v19 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
    if (v19)
    {
      v20 = v19;
      v36 = *(_QWORD *)v44;
      v21 = &stru_1E3E7D690;
      v22 = *MEMORY[0x1E0D68778];
      do
      {
        v23 = 0;
        v24 = v21;
        do
        {
          if (*(_QWORD *)v44 != v36)
            objc_enumerationMutation(v34);
          v25 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v23);
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          objc_msgSend(v25, "tiles");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v40;
            do
            {
              for (k = 0; k != v28; ++k)
              {
                if (*(_QWORD *)v40 != v29)
                  objc_enumerationMutation(v26);
                objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * k), "analyticsIdentifier");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "safelyAddObject:", v31);

              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
            }
            while (v28);
          }

          v4 = v38;
          objc_msgSend(v38, "allSemantics");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[PKPassSemanticTileFactory _passSupportsMusicTileWithSemantics:](v37, "_passSupportsMusicTileWithSemantics:", v32))
          {
            objc_msgSend(v7, "addObject:", CFSTR("musicTile"));
          }
          if (-[PKPassSemanticTileFactory _passSupportsWeatherTile:](v37, "_passSupportsWeatherTile:", v38))
            objc_msgSend(v7, "addObject:", CFSTR("weatherTile"));
          objc_msgSend(v7, "componentsJoinedByString:", v22);
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v23;
          v24 = v21;
        }
        while (v23 != v20);
        v20 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
      }
      while (v20);
    }
    else
    {
      v21 = &stru_1E3E7D690;
      v4 = v38;
    }

  }
  else
  {
    v21 = &stru_1E3E7D690;
  }

  return v21;
}

- (id)_generatedTicketTilesWithPass:(id)a3 context:(int64_t)a4 tileUpdateBlock:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v8 = a3;
  v9 = a5;
  switch(a4)
  {
    case 3:
      -[PKPassSemanticTileFactory _additionalTicketInfoTilesForPass:](self, "_additionalTicketInfoTilesForPass:", v8);
      v10 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[PKPassSemanticTileFactory _eventGuideTilesForPass:prewarm:tileUpdateBlock:](self, "_eventGuideTilesForPass:prewarm:tileUpdateBlock:", v8, 0, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[PKPassSemanticTileFactory _dashboardTilesForPass:prewarm:tileUpdateBlock:](self, "_dashboardTilesForPass:prewarm:tileUpdateBlock:", v8, 0, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      v11 = 0;
      goto LABEL_9;
  }
  v11 = (void *)v10;
LABEL_9:

  return v11;
}

- (id)_dashboardTilesForPass:(id)a3 prewarm:(BOOL)a4 tileUpdateBlock:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  PKWebServiceTicketingFeature *featureOverrides;
  int v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  BOOL v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  BOOL v91;
  void *v92;
  uint64_t v93;
  char v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  double v108;
  UIImage *v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  void *v119;
  void *v120;
  void *v122;
  _BOOL4 v123;
  void *v124;
  void *v125;
  PKPassSemanticTileFactory *v126;
  void *v127;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  _QWORD v134[4];

  v6 = a4;
  v134[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "allSemantics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v28 = 0;
    goto LABEL_39;
  }
  v123 = v6;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v8, "additionalInfoFields");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = v9;
  v130 = v11;
  v127 = v10;
  v128 = v12;
  v126 = self;
  if (objc_msgSend(v12, "count") == 1)
  {
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0D66F70];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "_createMetadataForType:identifier:context:", 0, v18, 1);

    objc_msgSend(v19, "setPreferredStyle:", 0);
    v20 = (void *)objc_msgSend(MEMORY[0x1E0D66F78], "createResolvedStateWithType:", 1);
    objc_msgSend(v20, "setPreferredStyle:", 4);
    v21 = (void *)MEMORY[0x1E0D66F98];
    objc_msgSend(v13, "label");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "createWithContent:", v22);
    objc_msgSend(v20, "setTitle:", v23);

    v24 = (void *)MEMORY[0x1E0D66F98];
    objc_msgSend(v13, "value");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "createWithContent:", v25);
    objc_msgSend(v20, "setFooter:", v26);

    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66F50]), "_initWithMetadata:childTiles:stateIdentifier:state:inProgress:", v19, 0, v15, v20, 0);
    objc_msgSend(v27, "setAnalyticsIdentifier:", CFSTR("additionalInfoTile"));
    objc_msgSend(v11, "safelyAddObject:", v27);

LABEL_10:
    self = v126;
    goto LABEL_11;
  }
  if ((unint64_t)objc_msgSend(v12, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "UUIDString");
    v124 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x1E0D66F70];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "UUIDString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v30, "_createMetadataForType:identifier:context:", 0, v32, 1);

    v122 = v33;
    objc_msgSend(v33, "setPreferredStyle:", 0);
    v34 = (void *)objc_msgSend(MEMORY[0x1E0D66F78], "createResolvedStateWithType:", 1);
    objc_msgSend(v34, "setPreferredStyle:", 4);
    v35 = (void *)MEMORY[0x1E0D66F98];
    PKLocalizedTicketingString(CFSTR("TILE_ADDITIONAL_TICKET_INFO_TITLE"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v35, "createWithContent:", v36);
    objc_msgSend(v34, "setTitle:", v37);

    if ((unint64_t)objc_msgSend(v12, "count") < 3)
    {
      v48 = (void *)MEMORY[0x1E0D66F98];
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "label");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "label");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedTicketingString(CFSTR("TILE_ADDITIONAL_TICKET_INFO_TWO_ITEMS"), CFSTR("%@%@"), v50, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)objc_msgSend(v48, "createWithContent:", v53);

    }
    else
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "label");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v134[0] = v39;
      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "label");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v134[1] = v41;
      PKLocalizedTicketingString(CFSTR("TILE_ADDITIONAL_TICKET_INFO_AND_MORE"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v134[2] = v42;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 3);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = (void *)MEMORY[0x1E0D66F98];
      PKLocalizedTicketingString(CFSTR("TILE_ADDITIONAL_TICKET_INFO_LIST_DELIMITER"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "componentsJoinedByString:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)objc_msgSend(v44, "createWithContent:", v46);

    }
    objc_msgSend(v34, "setFooter:", v47);
    v54 = (void *)objc_msgSend(MEMORY[0x1E0D66F60], "createDefaultDisclosureAccessoryImage");
    objc_msgSend(v34, "setAccessory:", v54);

    v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D671D0]), "_initWithContext:", 3);
    v133 = v55;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v133, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setActions:", v56);

    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66F50]), "_initWithMetadata:childTiles:stateIdentifier:state:inProgress:", v122, 0, v124, v34, 0);
    objc_msgSend(v57, "setAnalyticsIdentifier:", CFSTR("additionalInfoTile"));
    objc_msgSend(v11, "safelyAddObject:", v57);

    v10 = v127;
    goto LABEL_10;
  }
LABEL_11:
  featureOverrides = self->_featureOverrides;
  if (featureOverrides)
    v59 = -[PKWebServiceTicketingFeature isIntegrationTypeSupported:](featureOverrides, "isIntegrationTypeSupported:", 0);
  else
    v59 = 1;
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D6AAA8]);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "stringValue");
  v61 = objc_claimAutoreleasedReturnValue();

  v125 = (void *)v61;
  if (v59 && v61)
  {
    v62 = (void *)objc_msgSend(MEMORY[0x1E0D66F70], "_createMetadataForType:identifier:context:", 0, CFSTR("PKPassSemanticTileMapsIdentifier"), 1);
    objc_msgSend(v62, "setPreferredStyle:", 1);
    v63 = (void *)objc_msgSend(MEMORY[0x1E0D66F78], "createResolvedStateWithType:", 1);
    objc_msgSend(v63, "setPreferredStyle:", 5);
    v64 = (void *)objc_msgSend(MEMORY[0x1E0D66F98], "createWithContent:", v61);
    objc_msgSend(v63, "setTitle:", v64);

    v65 = (void *)MEMORY[0x1E0D66F98];
    PKLocalizedTicketingString(CFSTR("TILE_VIEW_IN_MAPS"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (void *)objc_msgSend(v65, "createWithContent:", v66);
    objc_msgSend(v63, "setFooter:", v67);

    v68 = (void *)objc_msgSend(MEMORY[0x1E0D66F68], "createWithSymbolName:tintColor:", CFSTR("mappin.circle.fill"), 23);
    objc_msgSend(v63, "setIcon:", v68);

    objc_msgSend(v8, "uniqueID");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassSemanticTileFactory _cachedTileContentForPassUniqueID:contentIdentifier:](self, "_cachedTileContentForPassUniqueID:contentIdentifier:", v69, CFSTR("MapsContentIdentifier"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (v70)
    {
      objc_msgSend(v70, "mapItem");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CC17D0], "imageForMapItem:size:forScale:format:fallbackToBundleIcon:", v71, 5, 0, 0, PKUIScreenScale());
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_alloc(MEMORY[0x1E0D66DF8]);
      v74 = objc_retainAutorelease(v72);
      v75 = (void *)objc_msgSend(v73, "initWithCGImage:scale:orientation:", objc_msgSend(v74, "CGImage"), 1, PKUIScreenScale());
      v76 = (void *)objc_msgSend(MEMORY[0x1E0D66F68], "createImageWithImage:tintColor:hasColorContent:", v75, 0, 1);
      objc_msgSend(v63, "setIcon:", v76);

      objc_msgSend(MEMORY[0x1E0CC1828], "urlForMapItem:options:", v71, 0);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = (void *)MEMORY[0x1E0D66F98];
      objc_msgSend(v71, "name");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = (void *)objc_msgSend(v78, "createWithContent:", v79);
      objc_msgSend(v63, "setTitle:", v80);

      v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D671D0]), "_initWithExternalURL:", v77);
      v132 = v81;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v132, 1);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setActions:", v82);

      self = v126;
    }
    else if (v129 || v123)
    {
      -[PKPassSemanticTileFactory _reloadMapsInformationForPass:tileUpdateBlock:](self, "_reloadMapsInformationForPass:tileUpdateBlock:", v8, v129);
    }
    v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66F50]), "_initWithMetadata:childTiles:stateIdentifier:state:inProgress:", v62, 0, CFSTR("PKPassSemanticTileMapsIdentifier"), v63, 0);
    objc_msgSend(v83, "setAnalyticsIdentifier:", CFSTR("mapsTile"));
    objc_msgSend(v130, "safelyAddObject:", v83);

    v10 = v127;
  }
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D6A9E8]);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "stringValue");
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  if (v85)
    v86 = objc_msgSend(v85, "length") == 0;
  else
    v86 = 1;
  -[PKPassSemanticTileFactory _issuerActionTilesForPass:](self, "_issuerActionTilesForPass:", v8);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v87, "count");

  objc_msgSend(v8, "relevantDates");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v89, "count"))
  {
    objc_msgSend(v8, "eventLocation");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v90 == 0;

  }
  else
  {
    v91 = 1;
  }

  -[PKPassSemanticTileFactory _eventInformationItemsForPass:semantics:](self, "_eventInformationItemsForPass:semantics:", v8, v10);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v92, "count");

  if (v88)
    v94 = v86;
  else
    v94 = 1;
  if ((v94 & 1) == 0 && !v91 && v93)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "UUIDString");
    v96 = (void *)objc_claimAutoreleasedReturnValue();

    v97 = (void *)MEMORY[0x1E0D66F70];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "UUIDString");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = (void *)objc_msgSend(v97, "_createMetadataForType:identifier:context:", 0, v99, 1);

    objc_msgSend(v100, "setPreferredStyle:", 1);
    v101 = (void *)objc_msgSend(MEMORY[0x1E0D66F78], "createResolvedStateWithType:", 1);
    objc_msgSend(v101, "setPreferredStyle:", 5);
    v102 = (void *)objc_msgSend(MEMORY[0x1E0D66F98], "createWithContent:", v85);
    objc_msgSend(v101, "setTitle:", v102);

    v103 = (void *)MEMORY[0x1E0D66F98];
    PKLocalizedTicketingString(CFSTR("TILE_EVENT_GUIDE"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = (void *)objc_msgSend(v103, "createWithContent:", v104);
    objc_msgSend(v101, "setFooter:", v105);

    PKPassKitUIBundle();
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "URLForResource:withExtension:", CFSTR("Event_Guide_Star_Glyph"), CFSTR("pdf"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();

    v108 = PKUIScreenScale();
    PKUIImageFromPDF(v107, 60.0, 60.0, v108);
    v109 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v110 = objc_alloc(MEMORY[0x1E0D66DF8]);
    UIImagePNGRepresentation(v109);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = (void *)objc_msgSend(v110, "initWithData:scale:", v111, PKUIScreenScale());

    v113 = (void *)objc_msgSend(MEMORY[0x1E0D66F68], "createImageWithImage:tintColor:hasColorContent:", v112, 0, 1);
    objc_msgSend(v101, "setIcon:", v113);

    v114 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D671D0]), "_initWithContext:", 2);
    v131 = v114;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v131, 1);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setActions:", v115);

    v116 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66F50]), "_initWithMetadata:childTiles:stateIdentifier:state:inProgress:", v100, 0, v96, v101, 0);
    objc_msgSend(v116, "setAnalyticsIdentifier:", CFSTR("eventGuideTile"));
    objc_msgSend(v130, "safelyAddObject:", v116);

    v10 = v127;
  }
  if (objc_msgSend(v130, "count"))
  {
    v117 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v118 = (void *)objc_msgSend(MEMORY[0x1E0D66F70], "_createMetadataForType:identifier:context:", 2, CFSTR("PKPassSemanticTileDashboardGroupIdentifier"), 1);
    objc_msgSend(v118, "setPreferredStyle:", 1);
    objc_msgSend(v118, "setShowInPrearm:", 0);
    objc_msgSend(v118, "setColumns:", 2);
    objc_msgSend(v118, "setMaximumRows:", 3);
    objc_msgSend(v118, "setWidthClass:", 2);
    objc_msgSend(v118, "setHeightClass:", 3);
    objc_msgSend(v118, "setGroupStyle:", 0);
    v119 = (void *)objc_msgSend(MEMORY[0x1E0D66F78], "createResolvedStateWithType:", 3);
    v120 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66F50]), "_initWithMetadata:childTiles:stateIdentifier:state:inProgress:", v118, v130, CFSTR("PKPassSemanticTileDashboardGroupIdentifier"), v119, 0);
    objc_msgSend(v117, "safelyAddObject:", v120);

  }
  else
  {
    v117 = 0;
  }
  v28 = (void *)objc_msgSend(v117, "copy");

  v9 = v129;
LABEL_39:

  return v28;
}

- (void)_reloadMapsInformationForPass:(id)a3 tileUpdateBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PKPassSemanticTileFactory__reloadMapsInformationForPass_tileUpdateBlock___block_invoke;
  block[3] = &unk_1E3E65388;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

void __75__PKPassSemanticTileFactory__reloadMapsInformationForPass_tileUpdateBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  id location;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "_coalesceOutstandingRequestForPassUniqueID:contentIdentifier:tileUpdateBlock:", v3, CFSTR("MapsContentIdentifier"), *(_QWORD *)(a1 + 48));

  if ((v2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "eventLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "allSemantics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", *MEMORY[0x1E0D6AAA8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(v4, "name");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    v11 = objc_alloc_init(MEMORY[0x1E0CC1808]);
    v12 = v11;
    if (v10)
      objc_msgSend(v11, "setNaturalLanguageQuery:", v10);
    if (v4)
    {
      MEMORY[0x1A1AE38DC](objc_msgSend(v4, "coordinate"));
      objc_msgSend(v12, "setRegion:");
    }
    objc_initWeak(&location, *(id *)(a1 + 32));
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC17F0]), "initWithRequest:", v12);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __75__PKPassSemanticTileFactory__reloadMapsInformationForPass_tileUpdateBlock___block_invoke_2;
    v16[3] = &unk_1E3E70870;
    objc_copyWeak(&v19, &location);
    v14 = *(id *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 32);
    v17 = v14;
    v18 = v15;
    objc_msgSend(v13, "startWithCompletionHandler:", v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
}

void __75__PKPassSemanticTileFactory__reloadMapsInformationForPass_tileUpdateBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  PKPassSemanticTileFactoryMapItem *v6;
  void *v7;
  void *v8;
  PKPassSemanticTileFactoryMapItem *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [PKPassSemanticTileFactoryMapItem alloc];
    objc_msgSend(v3, "mapItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKPassSemanticTileFactoryMapItem initWithMapItem:](v6, "initWithMapItem:", v8);

    if (v9)
      objc_msgSend(WeakRetained, "_cacheTileContent:forPassUniqueID:contentIdentifier:", v9, v5, CFSTR("MapsContentIdentifier"));
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __75__PKPassSemanticTileFactory__reloadMapsInformationForPass_tileUpdateBlock___block_invoke_3;
    v12[3] = &unk_1E3E62460;
    v10 = *(void **)(a1 + 32);
    v12[4] = *(_QWORD *)(a1 + 40);
    v13 = v5;
    v14 = WeakRetained;
    v15 = v10;
    v11 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v12);

  }
}

void __75__PKPassSemanticTileFactory__reloadMapsInformationForPass_tileUpdateBlock___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "_dashboardTilesForPass:prewarm:tileUpdateBlock:", *(_QWORD *)(a1 + 56), 0, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_perfomOutstandingUpdatesForPassUniqueID:contentIdentifier:updatedTiles:", v2, CFSTR("MapsContentIdentifier"), v3);

}

- (id)_additionalTicketInfoTilesForPass:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "additionalInfoFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "pk_arrayByApplyingBlock:", &__block_literal_global_142);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0D66F80];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __63__PKPassSemanticTileFactory__additionalTicketInfoTilesForPass___block_invoke_2;
    v23[3] = &unk_1E3E708D8;
    v24 = v6;
    v22 = v6;
    v20 = (void *)objc_msgSend(v7, "createWithPreferredStyle:hostedViewProvider:", 4, v23);
    objc_msgSend(v20, "setFullBleed:", 1);
    v8 = v5;
    v21 = (void *)v5;
    v9 = (void *)objc_msgSend(MEMORY[0x1E0D66F70], "_createMetadataForType:identifier:context:", 0, v5, 3);
    objc_msgSend(v9, "setPreferredStyle:", 0);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66F50]), "_initWithMetadata:childTiles:stateIdentifier:state:inProgress:", v9, 0, v8, v20, 0);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(MEMORY[0x1E0D66F70], "_createMetadataForType:identifier:context:", 2, v12, 3);
    objc_msgSend(v13, "setPreferredStyle:", 0);
    objc_msgSend(v13, "setColumns:", 1);
    objc_msgSend(v13, "setMaximumRows:", 1);
    objc_msgSend(v13, "setWidthClass:", 1);
    objc_msgSend(v13, "setHeightClass:", 3);
    objc_msgSend(v13, "setGroupStyle:", 2);
    v14 = (void *)objc_msgSend(MEMORY[0x1E0D66F78], "createResolvedStateWithType:", 3);
    v15 = objc_alloc(MEMORY[0x1E0D66F50]);
    v26[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "_initWithMetadata:childTiles:stateIdentifier:state:inProgress:", v13, v16, v12, v14, 0);

    v25 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

PKEventDetailsListViewItem *__63__PKPassSemanticTileFactory__additionalTicketInfoTilesForPass___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKEventDetailsListViewItem *v3;
  void *v4;
  void *v5;
  void *v6;
  PKEventDetailsListViewItem *v7;

  v2 = a2;
  v3 = [PKEventDetailsListViewItem alloc];
  objc_msgSend(v2, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PKEventDetailsListViewItem initWithTitle:detail:layoutStyle:axID:](v3, "initWithTitle:detail:layoutStyle:axID:", v4, v5, 0, v6);
  return v7;
}

uint64_t __63__PKPassSemanticTileFactory__additionalTicketInfoTilesForPass___block_invoke_2(uint64_t a1)
{
  +[PKEventDetailsListView createWithItems:](PKEventDetailsListView, "createWithItems:", *(_QWORD *)(a1 + 32));
  return objc_claimAutoreleasedReturnValue();
}

- (id)_footerValueForTicketInfoField:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0D66F88];
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "createWithContent:dateStyle:timeStyle:ignoresTimeZone:isRelative:", v5, objc_msgSend(v3, "dateStyle"), objc_msgSend(v3, "timeStyle"), objc_msgSend(v3, "ignoresTimeZone"), objc_msgSend(v3, "isRelative"));
LABEL_6:
    v9 = (void *)v6;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0D66F98];
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v10, "createWithContent:", v5);
    goto LABEL_6;
  }
  v7 = (void *)MEMORY[0x1E0D66F90];
  objc_msgSend(v3, "unformattedValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currencyCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "createWithContent:currencyCode:numberStyle:", v5, v8, objc_msgSend(v3, "numberStyle"));

LABEL_7:
  return v9;
}

- (id)_eventGuideTilesForPass:(id)a3 prewarm:(BOOL)a4 tileUpdateBlock:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  uint64_t v95;
  void *v96;
  id v97;
  void *v98;
  uint64_t v99;
  void *v100;
  unint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  _BOOL4 v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  void *v129;
  id v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  id v138;
  PKPassSemanticTileFactory *v139;
  void *v140;
  id v141;
  _QWORD v142[4];
  id v143;
  _QWORD v144[4];
  id v145;
  _QWORD v146[4];
  id v147;
  void *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  _QWORD v156[3];

  v6 = a4;
  v156[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "allSemantics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v141 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[PKPassSemanticTileFactory _issuerActionTilesForPass:](self, "_issuerActionTilesForPass:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    v13 = 0x1E0CB3000uLL;
    v131 = v11;
    if (v11)
    {
      v14 = v12;
      if (v12 >= 2)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "UUIDString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = (void *)objc_msgSend(MEMORY[0x1E0D66F70], "_createMetadataForType:identifier:context:", 2, v16, 2);
        objc_msgSend(v17, "setPreferredStyle:", 1);
        objc_msgSend(v17, "setShowInPrearm:", 0);
        if (v14 >= 4)
          v18 = 4;
        else
          v18 = v14;
        objc_msgSend(v17, "setColumns:", v18);
        objc_msgSend(v17, "setMaximumRows:", 1);
        objc_msgSend(v17, "setWidthClass:", 2);
        objc_msgSend(v17, "setHeightClass:", 3);
        objc_msgSend(v17, "setGroupStyle:", 1);
        v19 = (void *)objc_msgSend(MEMORY[0x1E0D66F78], "createResolvedStateWithType:", 3);
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66F50]), "_initWithMetadata:childTiles:stateIdentifier:state:inProgress:", v17, v131, v16, v19, 0);
        objc_msgSend(v141, "safelyAddObject:", v20);

      }
    }
    v137 = v10;
    v138 = v9;
    v139 = self;
    v130 = v8;
    v121 = v6;
    if (-[PKPassSemanticTileFactory _passSupportsWeatherTile:](self, "_passSupportsWeatherTile:", v8))
    {
      objc_msgSend(v8, "uniqueID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassSemanticTileFactory _cachedTileContentForPassUniqueID:contentIdentifier:](self, "_cachedTileContentForPassUniqueID:contentIdentifier:", v21, CFSTR("WeatherContentIdentifier"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v22, "weatherInformation");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x1E0D66F80];
        v146[0] = MEMORY[0x1E0C809B0];
        v146[1] = 3221225472;
        v146[2] = __77__PKPassSemanticTileFactory__eventGuideTilesForPass_prewarm_tileUpdateBlock___block_invoke;
        v146[3] = &unk_1E3E708D8;
        v25 = v23;
        v147 = v25;
        v26 = (void *)objc_msgSend(v24, "createWithPreferredStyle:hostedViewProvider:", 4, v146);
        objc_msgSend(v25, "weatherURL");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D671D0]), "_initWithExternalURL:", v27);
          v156[0] = v28;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v156, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setActions:", v29);

        }
        v30 = (void *)objc_msgSend(MEMORY[0x1E0D66F70], "_createMetadataForType:identifier:context:", 0, CFSTR("PKPassSemanticTileWeatherIdentifier"), 2);
        objc_msgSend(v30, "setPreferredStyle:", 0);
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66F50]), "_initWithMetadata:childTiles:stateIdentifier:state:inProgress:", v30, 0, CFSTR("PKPassSemanticTileWeatherIdentifier"), v26, 0);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "UUIDString");
        v135 = v26;
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = (void *)objc_msgSend(MEMORY[0x1E0D66F70], "_createMetadataForType:identifier:context:", 2, v33, 2);
        objc_msgSend(v34, "setPreferredStyle:", 0);
        objc_msgSend(v34, "setShowInPrearm:", 0);
        objc_msgSend(v34, "setColumns:", 1);
        objc_msgSend(v34, "setMaximumRows:", 1);
        objc_msgSend(v34, "setWidthClass:", 1);
        objc_msgSend(v34, "setHeightClass:", 3);
        v35 = (void *)objc_msgSend(MEMORY[0x1E0D66F78], "createResolvedStateWithType:", 3);
        v36 = objc_alloc(MEMORY[0x1E0D66F50]);
        v155 = v31;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v155, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)objc_msgSend(v36, "_initWithMetadata:childTiles:stateIdentifier:state:inProgress:", v34, v37, v33, v35, 0);

        objc_msgSend(v141, "addObject:", v38);
        v13 = 0x1E0CB3000;

        v8 = v130;
        v10 = v137;
        v9 = v138;
        self = v139;
      }
      else if (v9 || v6)
      {
        -[PKPassSemanticTileFactory _reloadWeatherInformationForPass:tileUpdateBlock:](self, "_reloadWeatherInformationForPass:tileUpdateBlock:", v8, v9);
      }

    }
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D6AAA8]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stringValue");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "venueMapImage");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    if (v136)
    {
      objc_msgSend(*(id *)(v13 + 2600), "UUID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "UUIDString");
      v43 = objc_claimAutoreleasedReturnValue();

      v44 = (void *)objc_msgSend(MEMORY[0x1E0D66F70], "_createMetadataForType:identifier:context:", 0, v43, 1);
      objc_msgSend(v44, "setPreferredStyle:", 0);
      v45 = (void *)objc_msgSend(MEMORY[0x1E0D66F78], "createResolvedStateWithType:", 1);
      objc_msgSend(v45, "setPreferredStyle:", 4);
      objc_msgSend(v45, "setFullBleed:", 1);
      v46 = (void *)objc_msgSend(MEMORY[0x1E0D66F68], "createImageWithImage:tintColor:hasColorContent:", v136, 0, 1);
      objc_msgSend(v45, "setBodyImage:", v46);

      v128 = (void *)objc_msgSend(MEMORY[0x1E0D66F68], "createWithSymbolName:tintColor:", CFSTR("arrow.up.backward.and.arrow.down.forward"), 5);
      v47 = (void *)objc_msgSend(MEMORY[0x1E0D66F60], "createAccessoryImageWithImage:");
      objc_msgSend(v45, "setSecondaryAccessory:", v47);

      v132 = (void *)v43;
      v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66F50]), "_initWithMetadata:childTiles:stateIdentifier:state:inProgress:", v44, 0, v43, v45, 0);
      objc_msgSend(v48, "setAnalyticsIdentifier:", CFSTR("venueMapTile"));
      v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D671D0]), "_initWithImage:title:", v136, v41);
      v154 = v49;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v154, 1);
      v50 = v41;
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setActions:", v51);

      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "UUIDString");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      v54 = (void *)objc_msgSend(MEMORY[0x1E0D66F70], "_createMetadataForType:identifier:context:", 2, v53, 2);
      objc_msgSend(v54, "setPreferredStyle:", 0);
      objc_msgSend(v54, "setShowInPrearm:", 0);
      objc_msgSend(v54, "setColumns:", 1);
      objc_msgSend(v54, "setMaximumRows:", 1);
      objc_msgSend(v54, "setWidthClass:", 1);
      objc_msgSend(v54, "setHeightClass:", 3);
      objc_msgSend(v54, "setGroupStyle:", 2);
      v55 = (void *)objc_msgSend(MEMORY[0x1E0D66F78], "createResolvedStateWithType:", 3);
      v56 = v55;
      if (v50)
        objc_msgSend(v55, "setHeader:", v50);
      v57 = objc_alloc(MEMORY[0x1E0D66F50]);
      v153 = v48;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v153, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (void *)objc_msgSend(v57, "_initWithMetadata:childTiles:stateIdentifier:state:inProgress:", v54, v58, v53, v56, 0);

      objc_msgSend(v141, "safelyAddObject:", v59);
      v8 = v130;
      v10 = v137;
      v9 = v138;
      self = v139;
      v41 = v50;
      v13 = 0x1E0CB3000uLL;
    }
    -[PKPassSemanticTileFactory _eventInformationItemsForPass:semantics:](self, "_eventInformationItemsForPass:semantics:", v8, v10);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = v41;
    if (objc_msgSend(v133, "count") >= 2)
    {
      objc_msgSend(*(id *)(v13 + 2600), "UUID");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "UUIDString");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      v62 = (void *)MEMORY[0x1E0D66F80];
      v144[0] = MEMORY[0x1E0C809B0];
      v144[1] = 3221225472;
      v144[2] = __77__PKPassSemanticTileFactory__eventGuideTilesForPass_prewarm_tileUpdateBlock___block_invoke_2;
      v144[3] = &unk_1E3E708D8;
      v145 = v133;
      v63 = (void *)objc_msgSend(v62, "createWithPreferredStyle:hostedViewProvider:", 4, v144);
      objc_msgSend(v63, "setFullBleed:", 1);
      v64 = (void *)objc_msgSend(MEMORY[0x1E0D66F70], "_createMetadataForType:identifier:context:", 0, v61, 2);
      objc_msgSend(v64, "setPreferredStyle:", 0);
      v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66F50]), "_initWithMetadata:childTiles:stateIdentifier:state:inProgress:", v64, 0, v61, v63, 0);
      objc_msgSend(v65, "setAnalyticsIdentifier:", CFSTR("additionalInformationTile"));
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "UUIDString");
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      v68 = (void *)objc_msgSend(MEMORY[0x1E0D66F70], "_createMetadataForType:identifier:context:", 2, v67, 2);
      objc_msgSend(v68, "setPreferredStyle:", 0);
      objc_msgSend(v68, "setShowInPrearm:", 0);
      objc_msgSend(v68, "setColumns:", 1);
      objc_msgSend(v68, "setMaximumRows:", 1);
      objc_msgSend(v68, "setWidthClass:", 1);
      objc_msgSend(v68, "setHeightClass:", 3);
      v69 = (void *)objc_msgSend(MEMORY[0x1E0D66F78], "createResolvedStateWithType:", 3);
      v70 = objc_alloc(MEMORY[0x1E0D66F50]);
      v152 = v65;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v152, 1);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = (void *)objc_msgSend(v70, "_initWithMetadata:childTiles:stateIdentifier:state:inProgress:", v68, v71, v67, v69, 0);

      v10 = v137;
      objc_msgSend(v141, "addObject:", v72);

      v13 = 0x1E0CB3000uLL;
      v41 = v134;

      v9 = v138;
    }
    objc_msgSend(*(id *)(v13 + 2600), "UUID");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "UUIDString");
    v74 = objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      v75 = v41;
    }
    else
    {
      PKLocalizedTicketingString(CFSTR("TILE_FIND_FRIENDS_FOOTER_VENUE_FALLBACK"));
      v75 = (id)objc_claimAutoreleasedReturnValue();
    }
    v76 = (void *)MEMORY[0x1E0D66F80];
    v142[0] = MEMORY[0x1E0C809B0];
    v142[1] = 3221225472;
    v142[2] = __77__PKPassSemanticTileFactory__eventGuideTilesForPass_prewarm_tileUpdateBlock___block_invoke_3;
    v142[3] = &unk_1E3E708D8;
    v127 = v75;
    v143 = v127;
    v77 = (void *)objc_msgSend(v76, "createWithPreferredStyle:hostedViewProvider:", 4, v142);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("findmy://friend/"));
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D671D0]), "_initWithExternalURL:", v125);
    v151 = v124;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v151, 1);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setActions:", v78);

    v79 = (void *)objc_msgSend(MEMORY[0x1E0D66F70], "_createMetadataForType:identifier:context:", 0, v74, 2);
    objc_msgSend(v79, "setPreferredStyle:", 0);
    v123 = v79;
    v129 = (void *)v74;
    v126 = v77;
    v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66F50]), "_initWithMetadata:childTiles:stateIdentifier:state:inProgress:", v79, 0, v74, v77, 0);
    objc_msgSend(v80, "setAnalyticsIdentifier:", CFSTR("findMyTile"));
    objc_msgSend(*(id *)(v13 + 2600), "UUID");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "UUIDString");
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    v83 = (void *)objc_msgSend(MEMORY[0x1E0D66F70], "_createMetadataForType:identifier:context:", 2, v82, 2);
    objc_msgSend(v83, "setPreferredStyle:", 0);
    objc_msgSend(v83, "setShowInPrearm:", 0);
    objc_msgSend(v83, "setColumns:", 1);
    objc_msgSend(v83, "setMaximumRows:", 1);
    objc_msgSend(v83, "setWidthClass:", 1);
    objc_msgSend(v83, "setHeightClass:", 3);
    v84 = (void *)objc_msgSend(MEMORY[0x1E0D66F78], "createResolvedStateWithType:", 3);
    v85 = objc_alloc(MEMORY[0x1E0D66F50]);
    v150 = v80;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v150, 1);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = (void *)objc_msgSend(v85, "_initWithMetadata:childTiles:stateIdentifier:state:inProgress:", v83, v86, v82, v84, 0);

    objc_msgSend(v141, "addObject:", v87);
    if (!-[PKPassSemanticTileFactory _passSupportsMusicTileWithSemantics:](v139, "_passSupportsMusicTileWithSemantics:", v10))goto LABEL_39;
    v120 = v80;
    objc_msgSend(v8, "uniqueID");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassSemanticTileFactory _cachedTileContentForPassUniqueID:contentIdentifier:](v139, "_cachedTileContentForPassUniqueID:contentIdentifier:", v88, CFSTR("MusicContentIdentifier"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    if (v89)
    {
      v118 = v89;
      v119 = v87;
      objc_msgSend(v89, "musicItem");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = (void *)objc_msgSend(MEMORY[0x1E0D66F78], "createResolvedStateWithType:", 1);
      v92 = (void *)objc_msgSend(MEMORY[0x1E0D66F78], "createResolvedStateWithType:", 3);
      v93 = objc_alloc(MEMORY[0x1E0D66DF8]);
      objc_msgSend(v90, "artwork");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend(v93, "initWithData:scale:", v94, PKUIScreenScale());

      objc_msgSend(v91, "setFullBleed:", 1);
      objc_msgSend(v91, "setPreferredStyle:", 4);
      v140 = (void *)v95;
      v96 = (void *)objc_msgSend(MEMORY[0x1E0D66F68], "createImageWithImage:tintColor:hasColorContent:", v95, 0, 1);
      objc_msgSend(v91, "setBodyImage:", v96);

      v97 = objc_alloc(MEMORY[0x1E0D671D0]);
      objc_msgSend(v90, "musicURL");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend(v97, "_initWithExternalURL:", v98);

      v117 = (void *)v99;
      v149 = v99;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v149, 1);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setActions:", v100);

      v101 = objc_msgSend(v90, "type");
      v102 = 0;
      if (v101 <= 2)
      {
        PKLocalizedTicketingString(&off_1E3E70970[v101]->isa);
        v102 = objc_claimAutoreleasedReturnValue();
      }
      v122 = v84;
      v116 = (void *)v102;
      objc_msgSend(v92, "setHeader:", v102);
      if ((objc_msgSend(v90, "appleCurated") & 1) == 0)
      {
        PKLocalizedTicketingString(CFSTR("TILE_MUSIC_HEADER_ATTRIBUTION"));
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "setHeaderActionTitle:", v103);

      }
      objc_msgSend(v90, "displayName");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "setFooterActionTitle:", v104);

      objc_msgSend(v90, "itemDescription");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "setFooter:", v105);

      v106 = (void *)objc_msgSend(MEMORY[0x1E0D66F70], "_createMetadataForType:identifier:context:", 0, CFSTR("PKPassSemanticTileMusicIdentifier"), 2);
      objc_msgSend(v106, "setPreferredStyle:", 0);
      v107 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66F50]), "_initWithMetadata:childTiles:stateIdentifier:state:inProgress:", v106, 0, CFSTR("PKPassSemanticTileWeatherIdentifier"), v91, 0);
      v108 = (void *)objc_msgSend(MEMORY[0x1E0D66F70], "_createMetadataForType:identifier:context:", 2, CFSTR("PKPassSemanticTileMusicGroupStateIdentifier"), 2);
      objc_msgSend(v108, "setPreferredStyle:", 0);
      objc_msgSend(v108, "setShowInPrearm:", 0);
      objc_msgSend(v108, "setColumns:", 1);
      objc_msgSend(v108, "setMaximumRows:", 1);
      objc_msgSend(v108, "setWidthClass:", 1);
      objc_msgSend(v108, "setHeightClass:", 3);
      objc_msgSend(v108, "setGroupStyle:", 0);
      v109 = objc_alloc(MEMORY[0x1E0D66F50]);
      v148 = v107;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v148, 1);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = (void *)objc_msgSend(v109, "_initWithMetadata:childTiles:stateIdentifier:state:inProgress:", v108, v110, CFSTR("PKPassSemanticTileMusicGroupStateIdentifier"), v92, 0);

      objc_msgSend(v141, "safelyAddObject:", v111);
      v8 = v130;
      v10 = v137;
      v9 = v138;
    }
    else
    {
      if (!v9 && !v121)
        goto LABEL_38;
      v118 = 0;
      v119 = v87;
      v122 = v84;
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AAD0]);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "stringsValue");
      v90 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AAC8]);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "stringsValue");
      v91 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AAD8]);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "stringsValue");
      v92 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKPassSemanticTileFactory _reloadMusicInformationForPass:playlistIDs:albumIDs:artistIDs:tileUpdateBlock:](v139, "_reloadMusicInformationForPass:playlistIDs:albumIDs:artistIDs:tileUpdateBlock:", v8, v92, v91, v90, v9);
    }

    v84 = v122;
    v89 = v118;
    v87 = v119;
LABEL_38:

    v80 = v120;
LABEL_39:
    v39 = (void *)objc_msgSend(v141, "copy");

    goto LABEL_40;
  }
  v39 = 0;
LABEL_40:

  return v39;
}

uint64_t __77__PKPassSemanticTileFactory__eventGuideTilesForPass_prewarm_tileUpdateBlock___block_invoke(uint64_t a1)
{
  +[PKWeatherEventViewHost createWithWeatherInformation:](PKWeatherEventViewHost, "createWithWeatherInformation:", *(_QWORD *)(a1 + 32));
  return objc_claimAutoreleasedReturnValue();
}

uint64_t __77__PKPassSemanticTileFactory__eventGuideTilesForPass_prewarm_tileUpdateBlock___block_invoke_2(uint64_t a1)
{
  +[PKEventDetailsListView createWithItems:](PKEventDetailsListView, "createWithItems:", *(_QWORD *)(a1 + 32));
  return objc_claimAutoreleasedReturnValue();
}

uint64_t __77__PKPassSemanticTileFactory__eventGuideTilesForPass_prewarm_tileUpdateBlock___block_invoke_3(uint64_t a1)
{
  +[PKFindMyEventLinkView createWithEventName:](PKFindMyEventLinkView, "createWithEventName:", *(_QWORD *)(a1 + 32));
  return objc_claimAutoreleasedReturnValue();
}

- (void)_reloadWeatherInformationForPass:(id)a3 tileUpdateBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PKPassSemanticTileFactory__reloadWeatherInformationForPass_tileUpdateBlock___block_invoke;
  block[3] = &unk_1E3E65388;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

void __78__PKPassSemanticTileFactory__reloadWeatherInformationForPass_tileUpdateBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _TtC9PassKitUI26PassLocationWeatherManager *v4;
  uint64_t v5;
  _TtC9PassKitUI26PassLocationWeatherManager *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  _TtC9PassKitUI26PassLocationWeatherManager *v10;
  id v11;
  uint64_t v12;
  id v13;
  id location;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "_coalesceOutstandingRequestForPassUniqueID:contentIdentifier:tileUpdateBlock:", v3, CFSTR("WeatherContentIdentifier"), *(_QWORD *)(a1 + 48));

  if ((v2 & 1) == 0)
  {
    v4 = objc_alloc_init(_TtC9PassKitUI26PassLocationWeatherManager);
    objc_initWeak(&location, *(id *)(a1 + 32));
    v5 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __78__PKPassSemanticTileFactory__reloadWeatherInformationForPass_tileUpdateBlock___block_invoke_2;
    v9[3] = &unk_1E3E70900;
    v6 = v4;
    v10 = v6;
    objc_copyWeak(&v13, &location);
    v7 = *(id *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 32);
    v11 = v7;
    v12 = v8;
    -[PassLocationWeatherManager fetchWeatherDisplayInformationFor:completion:](v6, "fetchWeatherDisplayInformationFor:completion:", v5, v9);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
}

void __78__PKPassSemanticTileFactory__reloadWeatherInformationForPass_tileUpdateBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  PKPassCachedWeatherInformation *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 40), "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v6 = -[PKPassCachedWeatherInformation initWithWeatherInformation:]([PKPassCachedWeatherInformation alloc], "initWithWeatherInformation:", v3);
      objc_msgSend(WeakRetained, "_cacheTileContent:forPassUniqueID:contentIdentifier:", v6, v5, CFSTR("WeatherContentIdentifier"));

    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __78__PKPassSemanticTileFactory__reloadWeatherInformationForPass_tileUpdateBlock___block_invoke_3;
    v9[3] = &unk_1E3E62460;
    v7 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 48);
    v10 = v5;
    v11 = WeakRetained;
    v12 = v7;
    v8 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
}

void __78__PKPassSemanticTileFactory__reloadWeatherInformationForPass_tileUpdateBlock___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "_eventGuideTilesForPass:prewarm:tileUpdateBlock:", *(_QWORD *)(a1 + 56), 0, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_perfomOutstandingUpdatesForPassUniqueID:contentIdentifier:updatedTiles:", v2, CFSTR("WeatherContentIdentifier"), v3);

}

- (void)_reloadMusicInformationForPass:(id)a3 playlistIDs:(id)a4 albumIDs:(id)a5 artistIDs:(id)a6 tileUpdateBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *workQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  workQueue = self->_workQueue;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __107__PKPassSemanticTileFactory__reloadMusicInformationForPass_playlistIDs_albumIDs_artistIDs_tileUpdateBlock___block_invoke;
  v23[3] = &unk_1E3E70950;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v16;
  v22 = v12;
  dispatch_async(workQueue, v23);

}

void __107__PKPassSemanticTileFactory__reloadMusicInformationForPass_playlistIDs_albumIDs_artistIDs_tileUpdateBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  PKAMSMediaItemsService *v4;
  PKAMSMediaRequestArtworkConfiguration *v5;
  PKAMSMediaRequestMusicItem *v6;
  void *v7;
  uint64_t v8;
  PKAMSMediaRequestMusicItem *v9;
  PKAMSMediaRequestMusicItem *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  PKAMSMediaItemsService *v16;
  id v17;
  uint64_t v18;
  id v19;
  id location;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "_coalesceOutstandingRequestForPassUniqueID:contentIdentifier:tileUpdateBlock:", v3, CFSTR("MusicContentIdentifier"), *(_QWORD *)(a1 + 72));

  if ((v2 & 1) == 0)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v4 = objc_alloc_init(PKAMSMediaItemsService);
    v5 = -[PKAMSMediaRequestArtworkConfiguration initWithArtworkSize:artworkCropType:animatedArtworkType:]([PKAMSMediaRequestArtworkConfiguration alloc], "initWithArtworkSize:artworkCropType:animatedArtworkType:", 0, 1, 2048.0, 2048.0);
    if (objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      v6 = [PKAMSMediaRequestMusicItem alloc];
      v7 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
      v8 = -[PKAMSMediaRequestMusicItem initWithType:musicIDs:artworkConfiguration:](v6, "initWithType:musicIDs:artworkConfiguration:", 1, v7, v5);
    }
    else if (objc_msgSend(*(id *)(a1 + 56), "count"))
    {
      v9 = [PKAMSMediaRequestMusicItem alloc];
      v7 = (void *)objc_msgSend(*(id *)(a1 + 56), "copy");
      v8 = -[PKAMSMediaRequestMusicItem initWithType:musicIDs:artworkConfiguration:](v9, "initWithType:musicIDs:artworkConfiguration:", 0, v7, v5);
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 64), "count"))
      {
LABEL_10:

        objc_destroyWeak(&location);
        return;
      }
      v10 = [PKAMSMediaRequestMusicItem alloc];
      v7 = (void *)objc_msgSend(*(id *)(a1 + 64), "copy");
      v8 = -[PKAMSMediaRequestMusicItem initWithType:musicIDs:artworkConfiguration:](v10, "initWithType:musicIDs:artworkConfiguration:", 2, v7, v5);
    }
    v11 = (void *)v8;

    if (v11)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __107__PKPassSemanticTileFactory__reloadMusicInformationForPass_playlistIDs_albumIDs_artistIDs_tileUpdateBlock___block_invoke_2;
      v15[3] = &unk_1E3E70928;
      v16 = v4;
      objc_copyWeak(&v19, &location);
      v12 = *(id *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 32);
      v17 = v12;
      v18 = v13;
      v14 = -[PKAMSMediaItemsService fetchItemsWithRequest:completion:](v16, "fetchItemsWithRequest:completion:", v11, v15);

      objc_destroyWeak(&v19);
    }
    goto LABEL_10;
  }
}

void __107__PKPassSemanticTileFactory__reloadMusicInformationForPass_playlistIDs_albumIDs_artistIDs_tileUpdateBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  PKCachedAMSMediaLookupItemMusic *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 40), "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v3, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "musicItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = -[PKCachedAMSMediaLookupItemMusic initWithMusicLookupItem:]([PKCachedAMSMediaLookupItemMusic alloc], "initWithMusicLookupItem:", v7);
        objc_msgSend(WeakRetained, "_cacheTileContent:forPassUniqueID:contentIdentifier:", v8, v5, CFSTR("MusicContentIdentifier"));

      }
    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __107__PKPassSemanticTileFactory__reloadMusicInformationForPass_playlistIDs_albumIDs_artistIDs_tileUpdateBlock___block_invoke_3;
    v11[3] = &unk_1E3E62460;
    v9 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 48);
    v12 = v5;
    v13 = WeakRetained;
    v14 = v9;
    v10 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
}

void __107__PKPassSemanticTileFactory__reloadMusicInformationForPass_playlistIDs_albumIDs_artistIDs_tileUpdateBlock___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "_eventGuideTilesForPass:prewarm:tileUpdateBlock:", *(_QWORD *)(a1 + 56), 0, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_perfomOutstandingUpdatesForPassUniqueID:contentIdentifier:updatedTiles:", v2, CFSTR("MusicContentIdentifier"), v3);

}

- (id)_issuerActionTilesForPass:(id)a3
{
  unint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  id v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = 0;
  while (2)
  {
    v4 = v28;
    v5 = v4;
    v6 = v4;
    switch(v3)
    {
      case 0uLL:
        objc_msgSend(v4, "bagPolicyURL");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 1uLL:
        objc_msgSend(v4, "orderFoodURL");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 2uLL:
        objc_msgSend(v4, "transitInformationURL");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 3uLL:
        objc_msgSend(v4, "parkingInformationURL");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 4uLL:
        objc_msgSend(v4, "directionsInformationURL");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 5uLL:
        objc_msgSend(v4, "merchandiseURL");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 6uLL:
        objc_msgSend(v4, "accessibilityURL");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 7uLL:
        objc_msgSend(v4, "purchaseParkingURL");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 8uLL:
        objc_msgSend(v4, "partnerAddOnURL");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 9uLL:
        objc_msgSend(v4, "contactVenuePhoneNumber");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 0xAuLL:
        objc_msgSend(v4, "contactVenueEmail");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 0xBuLL:
        objc_msgSend(v4, "contactVenueWebsite");
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_15:
        v6 = (void *)v7;

        if (!v6)
          goto LABEL_37;
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D671D0]), "_initWithExternalURL:", v6);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "UUIDString");
        v9 = objc_claimAutoreleasedReturnValue();

        v29 = (void *)v9;
        v10 = (void *)objc_msgSend(MEMORY[0x1E0D66F70], "_createMetadataForType:identifier:context:", 0, v9, 2);
        objc_msgSend(v10, "setPreferredStyle:", 1);
        v11 = (void *)objc_msgSend(MEMORY[0x1E0D66F78], "createResolvedStateWithType:", 1);
        objc_msgSend(v11, "setPreferredStyle:", 5);
        v12 = 0;
        v13 = (void *)MEMORY[0x1E0D66F98];
        if (v3 <= 0xB)
        {
          PKLocalizedTicketingString(&off_1E3E70988[v3]->isa);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v14 = (void *)objc_msgSend(v13, "createWithContent:", v12, v27);
        objc_msgSend(v11, "setBody:", v14);

        v15 = (void *)MEMORY[0x1E0D66F68];
        PKPassTileDescriptorIssuerActionSymbolForType(v3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        PKPassTileDescriptorIssuerActionSymbolForType(v3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "pathExtension");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "isEqualToString:", CFSTR("fill")))
        {
          objc_msgSend(v17, "stringByDeletingPathExtension");
          v19 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = v17;
        }
        v20 = v19;

        v21 = (void *)objc_msgSend(v15, "createWithSymbolName:contextMenuSymbolName:tintColor:", v16, v20, 5);
        objc_msgSend(v11, "setIcon:", v21);

        v31[0] = v30;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setActions:", v22);

        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66F50]), "_initWithMetadata:childTiles:stateIdentifier:state:inProgress:", v10, 0, v29, v11, 0);
        v24 = v23;
        switch(v3)
        {
          case 0uLL:
            objc_msgSend(v23, "setAnalyticsIdentifier:", CFSTR("bagPolicyTile"));
            v25 = (_QWORD *)MEMORY[0x1E0D67ED0];
            break;
          case 1uLL:
            objc_msgSend(v23, "setAnalyticsIdentifier:", CFSTR("foodTile"));
            v25 = (_QWORD *)MEMORY[0x1E0D67C10];
            break;
          case 2uLL:
            objc_msgSend(v23, "setAnalyticsIdentifier:", CFSTR("transitTile"));
            v25 = (_QWORD *)MEMORY[0x1E0D68168];
            break;
          case 3uLL:
            objc_msgSend(v23, "setAnalyticsIdentifier:", CFSTR("parkingTile"));
            v25 = (_QWORD *)MEMORY[0x1E0D67DD0];
            break;
          case 4uLL:
            objc_msgSend(v23, "setAnalyticsIdentifier:", CFSTR("navigationTile"));
            v25 = (_QWORD *)MEMORY[0x1E0D67D80];
            break;
          case 5uLL:
            objc_msgSend(v23, "setAnalyticsIdentifier:", CFSTR("merchandiseTile"));
            v25 = (_QWORD *)MEMORY[0x1E0D67D40];
            break;
          case 6uLL:
            objc_msgSend(v23, "setAnalyticsIdentifier:", CFSTR("accessibilityTile"));
            v25 = (_QWORD *)MEMORY[0x1E0D67800];
            break;
          case 7uLL:
            objc_msgSend(v23, "setAnalyticsIdentifier:", CFSTR("parkingTile"));
            v25 = (_QWORD *)MEMORY[0x1E0D67F20];
            break;
          case 8uLL:
            objc_msgSend(v23, "setAnalyticsIdentifier:", CFSTR("addOnTile"));
            v25 = (_QWORD *)MEMORY[0x1E0D67858];
            break;
          case 9uLL:
            objc_msgSend(v23, "setAnalyticsIdentifier:", CFSTR("venuePhoneTile"));
            v25 = (_QWORD *)MEMORY[0x1E0D67E98];
            break;
          case 0xAuLL:
            objc_msgSend(v23, "setAnalyticsIdentifier:", CFSTR("venueEmailTile"));
            v25 = (_QWORD *)MEMORY[0x1E0D67B38];
            break;
          case 0xBuLL:
            objc_msgSend(v23, "setAnalyticsIdentifier:", CFSTR("venueWebsiteTile"));
            v25 = (_QWORD *)MEMORY[0x1E0D681D8];
            break;
          default:
            objc_msgSend(v23, "setAnalyticsIdentifier:", 0);
            v25 = (_QWORD *)MEMORY[0x1E0D68188];
            break;
        }
        objc_msgSend(v24, "setAxID:", *v25);
        objc_msgSend(v27, "addObject:", v24);

LABEL_36:
LABEL_37:
        if (++v3 != 12)
          continue;

        return v27;
      default:
        goto LABEL_36;
    }
  }
}

- (id)_eventInformationItemsForPass:(id)a3 semantics:(id)a4
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PKEventDetailsListViewItem *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  PKEventDetailsListViewItem *v15;
  void *v16;
  uint64_t v17;
  PKEventDetailsListViewItem *v18;
  void *v19;
  void *v20;
  PKEventDetailsListViewItem *v21;
  void *v22;
  uint64_t v23;
  PKEventDetailsListViewItem *v24;
  void *v25;
  void *v26;
  PKEventDetailsListViewItem *v27;
  void *v28;
  uint64_t v29;
  PKEventDetailsListViewItem *v30;
  void *v31;
  void *v32;
  PKEventDetailsListViewItem *v33;
  void *v34;
  void *v35;
  PKEventDetailsListViewItem *v36;
  void *v37;
  void *v38;
  PKEventDetailsListViewItem *v39;
  void *v40;
  void *v41;
  PKEventDetailsListViewItem *v42;
  void *v43;
  void *v44;
  PKEventDetailsListViewItem *v45;
  void *v46;
  void *v47;
  PKEventDetailsListViewItem *v48;
  void *v49;
  void *v50;
  PKEventDetailsListViewItem *v51;
  void *v52;
  void *v53;
  PKEventDetailsListViewItem *v54;
  void *v55;
  void *v56;
  PKEventDetailsListViewItem *v57;
  void *v58;
  void *v59;
  PKEventDetailsListViewItem *v60;
  void *v61;
  PKEventDetailsListViewItem *v62;
  void *v63;
  void *v65;
  void *v66;
  void *v67;
  void *v68;

  v4 = a4;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v6, "setDateStyle:", 0);
  objc_msgSend(v6, "setTimeStyle:", 1);
  objc_msgSend(v6, "setDoesRelativeDateFormatting:", 0);
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocale:", v7);

  objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCalendar:", v8);

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A8D0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = [PKEventDetailsListViewItem alloc];
    PKLocalizedTicketingString(CFSTR("TILE_EVENT_INFORMATION_TAILGATING_TITLE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "BOOLValue"))
      v13 = CFSTR("TILE_EVENT_INFORMATION_TAILGATING_ALLOWED");
    else
      v13 = CFSTR("TILE_EVENT_INFORMATION_TAILGATING_NOT_ALLOWED");
    PKLocalizedTicketingString(&v13->isa);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PKEventDetailsListViewItem initWithTitle:detail:layoutStyle:axID:](v11, "initWithTitle:detail:layoutStyle:axID:", v12, v14, 1, *MEMORY[0x1E0D680E8]);
    objc_msgSend(v5, "addObject:", v15);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A870]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dateValue");
  v17 = objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = [PKEventDetailsListViewItem alloc];
    PKLocalizedTicketingString(CFSTR("TILE_EVENT_INFORMATION_DOORS_OPEN_TITLE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[PKEventDetailsListViewItem initWithTitle:detail:layoutStyle:axID:](v18, "initWithTitle:detail:layoutStyle:axID:", v19, v20, 1, *MEMORY[0x1E0D67B10]);
    objc_msgSend(v5, "addObject:", v21);

  }
  v67 = (void *)v17;
  v68 = v10;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A880]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dateValue");
  v23 = objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = [PKEventDetailsListViewItem alloc];
    PKLocalizedTicketingString(CFSTR("TILE_EVENT_INFORMATION_GATES_OPEN_TITLE"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[PKEventDetailsListViewItem initWithTitle:detail:layoutStyle:axID:](v24, "initWithTitle:detail:layoutStyle:axID:", v25, v26, 1, *MEMORY[0x1E0D67C38]);
    objc_msgSend(v5, "addObject:", v27);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A890]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dateValue");
  v29 = objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = [PKEventDetailsListViewItem alloc];
    PKLocalizedTicketingString(CFSTR("TILE_EVENT_INFORMATION_PARKING_OPEN_TITLE"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[PKEventDetailsListViewItem initWithTitle:detail:layoutStyle:axID:](v30, "initWithTitle:detail:layoutStyle:axID:", v31, v32, 1, *MEMORY[0x1E0D67DD8]);
    objc_msgSend(v5, "addObject:", v33);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A860], v29);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "dateValue");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v36 = [PKEventDetailsListViewItem alloc];
    PKLocalizedTicketingString(CFSTR("TILE_EVENT_INFORMATION_BOX_OFFICE_OPEN_TITLE"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v35);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[PKEventDetailsListViewItem initWithTitle:detail:layoutStyle:axID:](v36, "initWithTitle:detail:layoutStyle:axID:", v37, v38, 1, *MEMORY[0x1E0D67988]);
    objc_msgSend(v5, "addObject:", v39);

  }
  v66 = (void *)v23;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A878]);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "dateValue");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    v42 = [PKEventDetailsListViewItem alloc];
    PKLocalizedTicketingString(CFSTR("TILE_EVENT_INFORMATION_FAN_ZONE_OPEN_TITLE"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v41);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -[PKEventDetailsListViewItem initWithTitle:detail:layoutStyle:axID:](v42, "initWithTitle:detail:layoutStyle:axID:", v43, v44, 1, *MEMORY[0x1E0D67BD0]);
    objc_msgSend(v5, "addObject:", v45);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A888]);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "dateValue");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    v48 = [PKEventDetailsListViewItem alloc];
    PKLocalizedTicketingString(CFSTR("TILE_EVENT_INFORMATION_VENUE_OPEN_TITLE"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v47);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[PKEventDetailsListViewItem initWithTitle:detail:layoutStyle:axID:](v48, "initWithTitle:detail:layoutStyle:axID:", v49, v50, 1, *MEMORY[0x1E0D681C8]);
    objc_msgSend(v5, "addObject:", v51);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A868]);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "dateValue");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    v54 = [PKEventDetailsListViewItem alloc];
    PKLocalizedTicketingString(CFSTR("TILE_EVENT_INFORMATION_VENUE_CURFEW_TITLE"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v53);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = -[PKEventDetailsListViewItem initWithTitle:detail:layoutStyle:axID:](v54, "initWithTitle:detail:layoutStyle:axID:", v55, v56, 1, *MEMORY[0x1E0D681C0]);
    objc_msgSend(v5, "addObject:", v57);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A9D8]);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "stringValue");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    v60 = [PKEventDetailsListViewItem alloc];
    PKLocalizedTicketingString(CFSTR("TILE_EVENT_INFORMATION_ENTRANCE_INFORMATION"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = -[PKEventDetailsListViewItem initWithTitle:detail:layoutStyle:axID:](v60, "initWithTitle:detail:layoutStyle:axID:", v61, v59, 1, *MEMORY[0x1E0D67B60]);
    objc_msgSend(v5, "addObject:", v62);

  }
  v63 = (void *)objc_msgSend(v5, "copy");

  return v63;
}

- (BOOL)_passSupportsWeatherTile:(id)a3
{
  id v4;
  PKWebServiceTicketingFeature *featureOverrides;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  featureOverrides = self->_featureOverrides;
  if (featureOverrides
    && !-[PKWebServiceTicketingFeature isIntegrationTypeSupported:](featureOverrides, "isIntegrationTypeSupported:", 1))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v4, "eventLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "relevantDates");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 != 0;

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (BOOL)_passSupportsMusicTileWithSemantics:(id)a3
{
  id v4;
  PKWebServiceTicketingFeature *featureOverrides;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  featureOverrides = self->_featureOverrides;
  if (featureOverrides
    && !-[PKWebServiceTicketingFeature isIntegrationTypeSupported:](featureOverrides, "isIntegrationTypeSupported:", 2))
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AAD0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringsValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AAC8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringsValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AAD8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringsValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v7, "count") || objc_msgSend(v9, "count") || objc_msgSend(v11, "count") != 0;
  }

  return v12;
}

- (id)_cachedTileContentForPassUniqueID:(id)a3 contentIdentifier:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PKPassSemanticTileFactory _cacheKeyForPassUniqueID:contentIdentifier:](self, "_cacheKeyForPassUniqueID:contentIdentifier:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSCache objectForKey:](self->_tileContentCache, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend(v6, "isContentDiscarded"))
    v7 = 0;
  else
    v7 = v6;
  v8 = v7;

  return v8;
}

- (void)_cacheTileContent:(id)a3 forPassUniqueID:(id)a4 contentIdentifier:(id)a5
{
  void *v8;
  id v9;

  v9 = a3;
  -[PKPassSemanticTileFactory _cacheKeyForPassUniqueID:contentIdentifier:](self, "_cacheKeyForPassUniqueID:contentIdentifier:", a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && v8)
    -[NSCache setObject:forKey:](self->_tileContentCache, "setObject:forKey:", v9, v8);

}

- (id)_cacheKeyForPassUniqueID:(id)a3 contentIdentifier:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a4;
  objc_msgSend(a3, "hash");
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pk_stringWithInteger:", PKCombinedHash());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_coalesceOutstandingRequestForPassUniqueID:(id)a3 contentIdentifier:(id)a4 tileUpdateBlock:(id)a5
{
  id v8;
  os_unfair_lock_s *p_tileUpdatesLock;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSMutableDictionary *outstandingTileUpdates;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  p_tileUpdatesLock = &self->_tileUpdatesLock;
  v10 = a4;
  v11 = a3;
  os_unfair_lock_lock(&self->_tileUpdatesLock);
  -[PKPassSemanticTileFactory _cacheKeyForPassUniqueID:contentIdentifier:](self, "_cacheKeyForPassUniqueID:contentIdentifier:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_outstandingTileUpdates, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (v8)
    {
      outstandingTileUpdates = self->_outstandingTileUpdates;
      v15 = _Block_copy(v8);
      objc_msgSend(v13, "arrayByAddingObject:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](outstandingTileUpdates, "setObject:forKey:", v16, v12);

    }
    v17 = v13;
  }
  else
  {
    if (v8)
    {
      v18 = _Block_copy(v8);
      v20[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = (void *)MEMORY[0x1E0C9AA60];
    }
    -[NSMutableDictionary setObject:forKey:](self->_outstandingTileUpdates, "setObject:forKey:", v17, v12);
  }
  os_unfair_lock_unlock(p_tileUpdatesLock);

  return v13 != 0;
}

- (void)_perfomOutstandingUpdatesForPassUniqueID:(id)a3 contentIdentifier:(id)a4 updatedTiles:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_unfair_lock_lock(&self->_tileUpdatesLock);
  -[PKPassSemanticTileFactory _cacheKeyForPassUniqueID:contentIdentifier:](self, "_cacheKeyForPassUniqueID:contentIdentifier:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_outstandingTileUpdates, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_outstandingTileUpdates, "removeObjectForKey:", v11);
  os_unfair_lock_unlock(&self->_tileUpdatesLock);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17) + 16))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17));
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureOverrides, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_outstandingTileUpdates, 0);
  objc_storeStrong((id *)&self->_tileContentCache, 0);
}

@end
