@implementation SDCoreSpotlightFeedbackHandler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_6);
  return (id)sharedInstance_handler;
}

void __48__SDCoreSpotlightFeedbackHandler_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_handler;
  sharedInstance_handler = v0;

}

- (SDCoreSpotlightFeedbackHandler)init
{
  SDCoreSpotlightFeedbackHandler *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SDCoreSpotlightFeedbackHandler;
  v2 = -[SDCoreSpotlightFeedbackHandler init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.searchd"));
    -[SDCoreSpotlightFeedbackHandler setIgnoreResultEngagements:](v2, "setIgnoreResultEngagements:", objc_msgSend(v3, "BOOLForKey:", CFSTR("ignoreResultEngagements")));
    -[SDCoreSpotlightFeedbackHandler setClientRankAndBlend:](v2, "setClientRankAndBlend:", _os_feature_enabled_impl());

  }
  return v2;
}

- (void)didEngageSection:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "section");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "triggerEvent");

  -[SDCoreSpotlightFeedbackHandler didEngageSection:withEvent:](self, "didEngageSection:withEvent:", v6, v5);
}

- (void)didEngageSection:(id)a3 withEvent:(unint64_t)a4
{
  id v5;

  objc_msgSend(a3, "bundleIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[SPCoreAnalyticsManager logEngagementWithBundleIdentifier:forEvent:](SPCoreAnalyticsManager, "logEngagementWithBundleIdentifier:forEvent:", v5, a4);

}

- (void)didStartSearch:(id)a3
{
  char isKindOfClass;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  NSMutableArray *analyticsItems;
  id v11;

  v11 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v11;
    if (objc_msgSend(v6, "indexType") == 1)
    {
      if (objc_msgSend(v6, "triggerEvent") == 23)
      {
        objc_msgSend(v6, "input");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          objc_msgSend(MEMORY[0x24BEB02F8], "cacheSearchString:", v7);

      }
      objc_msgSend(v6, "input");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SDCoreSpotlightFeedbackHandler setLastQuery:](self, "setLastQuery:", v8);

      v9 = (NSMutableArray *)objc_opt_new();
      analyticsItems = self->_analyticsItems;
      self->_analyticsItems = v9;

    }
    v5 = v11;
  }

}

- (void)didRankSections:(id)a3
{
  id v4;
  NSMutableArray *topAnalyticsItemPerSection;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  SPAnalyticsItem *v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  char v27;
  SPAnalyticsItem *v28;
  SPAnalyticsItem *v29;
  SPAnalyticsItem *v30;
  void *v31;
  uint64_t v32;
  SDCoreSpotlightFeedbackHandler *v33;
  uint64_t v34;
  id obj;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  topAnalyticsItemPerSection = self->_topAnalyticsItemPerSection;
  self->_topAnalyticsItemPerSection = 0;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v31 = v4;
  objc_msgSend(v4, "sections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v45;
    v32 = *(_QWORD *)v45;
    v33 = self;
    do
    {
      v9 = 0;
      v34 = v7;
      do
      {
        if (*(_QWORD *)v45 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v9);
        objc_msgSend(v10, "section");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
          goto LABEL_33;
        v37 = v9;
        if (!self->_topAnalyticsItemPerSection)
        {
          v12 = (NSMutableArray *)objc_opt_new();
          v13 = self->_topAnalyticsItemPerSection;
          self->_topAnalyticsItemPerSection = v12;

        }
        objc_msgSend(v10, "results");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)objc_opt_new();
        v38 = objc_msgSend(v11, "maxInitiallyVisibleResults");
        objc_msgSend(v11, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.spotlight.tophits"))
          || (objc_msgSend(v11, "isInitiallyHidden") & 1) != 0)
        {
          goto LABEL_13;
        }
        objc_msgSend(v11, "results");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (v38 != v17)
        {
          objc_msgSend(v11, "results");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v15, "count");
LABEL_13:

        }
        v36 = v11;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v18 = v14;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        if (v19)
        {
          v20 = v19;
          v21 = 0;
          v22 = 0;
          v23 = *(_QWORD *)v41;
          while (2)
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v41 != v23)
                objc_enumerationMutation(v18);
              objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "result");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "type");
              if ((SSResultTypeIsSuggestion() & 1) == 0)
              {
                objc_msgSend(v25, "sectionBundleIdentifier");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.spotlightui.search-through"));

                if ((v27 & 1) == 0)
                {
                  v28 = -[SPAnalyticsItem initWithResult:]([SPAnalyticsItem alloc], "initWithResult:", v25);
                  v29 = v28;
                  if (!v21)
                  {
                    v30 = v28;

                    v22 = v30;
                  }
                  objc_msgSend(v39, "addObject:", v29);
                  ++v21;

                  if (v21 == v38)
                  {

                    goto LABEL_28;
                  }
                }
              }

            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
            if (v20)
              continue;
            break;
          }
LABEL_28:

          self = v33;
          if (v22)
            -[NSMutableArray addObject:](v33->_topAnalyticsItemPerSection, "addObject:", v22);
          v8 = v32;
          v7 = v34;
        }
        else
        {

          v22 = 0;
        }
        v9 = v37;
        -[NSMutableArray addObjectsFromArray:](self->_analyticsItems, "addObjectsFromArray:", v39);

        v11 = v36;
LABEL_33:

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v7);
  }

}

- (BOOL)_isSafari:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Safari"));

  return v4;
}

- (id)_remapSafariSyntheticBookmarkID:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", SyntheticBookmarkPrefix))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend((id)SyntheticBookmarkPrefix, "length"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (void)didPerformCommand:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  uint64_t v16;
  char v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_ignoreResultEngagements)
  {
    NSLog(CFSTR("Skipping feedback; in debug mode"));
  }
  else
  {
    v36 = v4;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v6 = self->_analyticsItems;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v38;
LABEL_5:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v10);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if ((v14 & 1) != 0)
          break;
        if (v8 == ++v10)
        {
          v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          if (v8)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
      v16 = -[NSMutableArray indexOfObject:](self->_analyticsItems, "indexOfObject:", v11);
      v15 = v11;

      if (!v15)
        goto LABEL_14;
      +[SPCoreAnalyticsManager computeEngagementMatrixForEngagedItem:topAnalyticsItemsPerSection:](SPCoreAnalyticsManager, "computeEngagementMatrixForEngagedItem:topAnalyticsItemsPerSection:", v15, self->_topAnalyticsItemPerSection);
      v17 = 0;
    }
    else
    {
LABEL_11:

      v15 = 0;
      v16 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:
      v17 = 1;
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applicationBundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[SDCoreSpotlightFeedbackHandler _isSafari:](self, "_isSafari:", v19);

    if (v20)
    {
      objc_msgSend(v5, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SDCoreSpotlightFeedbackHandler _remapSafariSyntheticBookmarkID:](self, "_remapSafariSyntheticBookmarkID:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setIdentifier:", v22);

    }
    if ((PRSRankingSDEnabledFlagState() & 2) != 0)
    {
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.searchd"));
      objc_msgSend(v25, "doubleForKey:", CFSTR("RankingFeaturesTestFirstQueryTime"));
      v27 = v26;
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("RankingFeaturesTest: RankingFeaturesTestFirstQueryTime = %f"), *(_QWORD *)&v26);
      NSLog(CFSTR("%@"), v28);

      v29 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v18, "timeIntervalSinceReferenceDate");
      v31 = (void *)objc_msgSend(v29, "initWithFormat:", CFSTR("RankingFeaturesTest: currentTime = %f"), v30);
      NSLog(CFSTR("%@"), v31);

      if (v27 == 0.0)
      {
        objc_msgSend(v18, "timeIntervalSinceReferenceDate");
        objc_msgSend(v25, "setDouble:forKey:", CFSTR("RankingFeaturesTestFirstQueryTime"));
        NSLog(CFSTR("RankingFeaturesTest: updated RankingFeaturesTestFirstQueryTime to currentTime"));
      }
      else
      {
        v32 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceReferenceDate:", v27);

        v18 = (void *)v32;
        NSLog(CFSTR("RankingFeaturesTest: updated currentTime to RankingFeaturesTestFirstQueryTime"));
      }
      v33 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v18, "timeIntervalSinceReferenceDate");
      v35 = (void *)objc_msgSend(v33, "initWithFormat:", CFSTR("RankingFeaturesTest: currentTime = %f"), v34);
      NSLog(CFSTR("%@"), v35);

    }
    v4 = v36;
    if ((v17 & 1) == 0)
    {
      v23 = objc_msgSend(v36, "triggerEvent");
      -[SDCoreSpotlightFeedbackHandler lastQuery](self, "lastQuery");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SDCoreSpotlightFeedbackHandler didEngageResult:engagedAnalyticsItem:atPosition:withEvent:forQuery:currentTime:](self, "didEngageResult:engagedAnalyticsItem:atPosition:withEvent:forQuery:currentTime:", v5, v15, v16, v23, v24, v18);

    }
  }

}

- (void)didEngageResult:(id)a3 engagedAnalyticsItem:(id)a4 atPosition:(unint64_t)a5 withEvent:(unint64_t)a6 forQuery:(id)a7 currentTime:(id)a8
{
  id v14;
  id v15;
  id v16;

  v16 = a3;
  v14 = a7;
  v15 = a8;
  +[SPCoreAnalyticsManager logEngagementWithItem:atPosition:forEvent:](SPCoreAnalyticsManager, "logEngagementWithItem:atPosition:forEvent:", a4, a5, a6);
  if (a6 != 5)
  {
    -[SDCoreSpotlightFeedbackHandler updateRankingSectionItemsForResult:withQuery:](self, "updateRankingSectionItemsForResult:withQuery:", v16, v14);
    -[SDCoreSpotlightFeedbackHandler updateSpotlightUsageCount](self, "updateSpotlightUsageCount");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SDCoreSpotlightFeedbackHandler updateShortcutForResult:withQuery:currentTime:](self, "updateShortcutForResult:withQuery:currentTime:", v16, v14, v15);
  }

}

- (void)searchViewDidDisappear:(id)a3
{
  NSMutableArray *analyticsItems;

  analyticsItems = self->_analyticsItems;
  self->_analyticsItems = 0;

}

- (void)updateSpotlightUsageCount
{
  NSObject *v2;

  dispatch_get_global_queue(17, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_89_0);

}

void __59__SDCoreSpotlightFeedbackHandler_updateSpotlightUsageCount__block_invoke()
{
  void *v0;
  uint64_t v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.searchd"));
  objc_msgSend(v2, "objectForKey:", CFSTR("usedCount"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();

  if (v0)
    v1 = objc_msgSend(v2, "integerForKey:", CFSTR("usedCount")) + 1;
  else
    v1 = 1;
  objc_msgSend(v2, "setInteger:forKey:", v1, CFSTR("usedCount"));

}

- (void)indexEngagementItem:(id)a3 currentTime:(id)a4 externalIdentifier:(id)a5 protectionClass:(id)a6 expire:(BOOL)a7 shortcutString:(id)a8 update:(BOOL)a9
{
  _BOOL4 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  objc_class *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id *v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v33[3];
  _QWORD v34[4];

  v10 = a7;
  v34[3] = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a8;
  v19 = (objc_class *)MEMORY[0x24BDC2478];
  v20 = a5;
  v21 = objc_alloc_init(v19);
  objc_msgSend(v21, "setUniqueIdentifier:", v20);

  objc_msgSend(v21, "setBundleID:", v15);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 2592000.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setExpirationDate:", v22);

  }
  v23 = objc_alloc(MEMORY[0x24BDC2480]);
  v33[0] = CFSTR("_kMDItemShortcutLastUsedDate");
  v33[1] = CFSTR("kMDItemLastUsedDate");
  v34[0] = v16;
  v34[1] = v16;
  v33[2] = CFSTR("_kMDItemLaunchString");
  v34[2] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithAttributes:", v24);
  objc_msgSend(v21, "setAttributeSet:", v25);

  if (!a9)
  {
    objc_msgSend(v21, "attributeSet");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDisplayName:", v18);

  }
  objc_msgSend(v21, "setIsUpdate:", a9);
  if (self->_clientRankAndBlend)
  {
    objc_msgSend(MEMORY[0x24BDC2470], "defaultSearchableIndex");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v21;
    v28 = (void *)MEMORY[0x24BDBCE30];
    v29 = &v32;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB00A8], "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v21;
    v28 = (void *)MEMORY[0x24BDBCE30];
    v29 = &v31;
  }
  objc_msgSend(v28, "arrayWithObjects:count:", v29, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", v30, 0, 0, v17, v15, 0, 0);

}

- (void)deleteEngagementItem:(id)a3 externalIdentifier:(id)a4 protectionClass:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  if (self->_clientRankAndBlend)
  {
    v8 = (void *)MEMORY[0x24BDC2470];
    v9 = a5;
    v10 = a4;
    v11 = a3;
    objc_msgSend(v8, "defaultSearchableIndex");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    v13 = (void *)MEMORY[0x24BDBCE30];
    v14 = (id *)v18;
  }
  else
  {
    v15 = (void *)MEMORY[0x24BEB00A8];
    v9 = a5;
    v10 = a4;
    v11 = a3;
    objc_msgSend(v15, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v10;
    v13 = (void *)MEMORY[0x24BDBCE30];
    v14 = &v17;
  }
  objc_msgSend(v13, "arrayWithObjects:count:", v14, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", 0, v16, 0, v9, v11, 0, 0);
}

- (void)updateShortcutForResult:(id)a3 withQuery:(id)a4 currentTime:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  uint64_t v14;
  unsigned int v15;
  id v16;
  int v17;
  int v18;
  char v19;
  uint64_t v20;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  NSLog(CFSTR("updateShortcutForResult %@"), v7);
  objc_msgSend(v7, "getStableServerResultIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "feedbackSectionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB0200], "getSPMLSharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "type") == 36 || objc_msgSend(v7, "type") == 37;
  objc_msgSend(v7, "protectionClass");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!_os_feature_enabled_impl())
  {
    v14 = 0;
    goto LABEL_12;
  }
  if ((objc_msgSend(v11, "isEqual:", *MEMORY[0x24BEB06B0]) & 1) != 0
    || (objc_msgSend(v11, "isEqual:", *MEMORY[0x24BEB06A8]) & 1) != 0
    || (objc_msgSend(v11, "isEqual:", *MEMORY[0x24BEB0670]) & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    v14 = objc_msgSend(v11, "isEqual:", *MEMORY[0x24BEB0660]);
    if (!(_DWORD)v14)
      goto LABEL_12;
  }
  if (!v13)
  {
    v13 = (id)*MEMORY[0x24BDD0CE0];
    v14 = 1;
  }
LABEL_12:
  v15 = objc_msgSend(v7, "type");
  if (v8)
  {
    v16 = v8;
    goto LABEL_15;
  }
  objc_msgSend(v7, "userInput");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
LABEL_15:
    v17 = objc_msgSend(v11, "isEqual:", *MEMORY[0x24BEB0720]);
    if (v15 == 20)
      v18 = v17;
    else
      v18 = 0;
    if (v10 && v11 && v13)
    {
      v19 = v15 == 2 || v12;
      if ((v19 & 1) != 0 || v15 <= 7 && ((1 << v15) & 0xD0) != 0 || (v14 | v18) == 1)
      {
        objc_msgSend(v22, "addCategoryAndGroupNameToTrainCategories:groupName:", v11, v11);
        LOBYTE(v20) = 1;
        -[SDCoreSpotlightFeedbackHandler indexEngagementItem:currentTime:externalIdentifier:protectionClass:expire:shortcutString:update:](self, "indexEngagementItem:currentTime:externalIdentifier:protectionClass:expire:shortcutString:update:", v11, v9, v10, v13, v14, v16, v20);
      }
    }
    if (updateShortcutForResult_withQuery_currentTime__onceToken == -1)
    {
      if (!v11)
        goto LABEL_39;
    }
    else
    {
      dispatch_once(&updateShortcutForResult_withQuery_currentTime__onceToken, &__block_literal_global_108);
      if (!v11)
        goto LABEL_39;
    }
    if ((objc_msgSend((id)updateShortcutForResult_withQuery_currentTime__priorityBundleIds, "containsObject:", v11) & 1) != 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v24 = v11;
        v25 = 2112;
        v26 = v16;
        _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Clear non-priority engagement for %@ (%@)", buf, 0x16u);
      }
      -[SDCoreSpotlightFeedbackHandler deleteEngagementItem:externalIdentifier:protectionClass:](self, "deleteEngagementItem:externalIdentifier:protectionClass:", CFSTR("com.apple.searchd.engagement"), v16, CFSTR("Priority"));
LABEL_42:

      goto LABEL_43;
    }
LABEL_39:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v11;
      v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_213202000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Capture non-priority engagement for %@ (%@)", buf, 0x16u);
    }
    LOBYTE(v20) = 0;
    -[SDCoreSpotlightFeedbackHandler indexEngagementItem:currentTime:externalIdentifier:protectionClass:expire:shortcutString:update:](self, "indexEngagementItem:currentTime:externalIdentifier:protectionClass:expire:shortcutString:update:", CFSTR("com.apple.searchd.engagement"), v9, v16, CFSTR("Priority"), 1, v16, v20);
    goto LABEL_42;
  }
LABEL_43:

}

void __80__SDCoreSpotlightFeedbackHandler_updateShortcutForResult_withQuery_currentTime___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24CF6FE60);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)updateShortcutForResult_withQuery_currentTime__priorityBundleIds;
  updateShortcutForResult_withQuery_currentTime__priorityBundleIds = v0;

}

- (void)updateRankingSectionItemsForResult:(id)a3 withQuery:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id *v10;
  id v11;
  const __CFString **v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  const __CFString *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  const __CFString *v29;
  void *v30;
  _QWORD v31[2];
  id v32;
  _QWORD v33[4];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "feedbackSectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.application")) & 1) != 0 || !v8)
  {

  }
  else
  {

    if (v6)
    {
      if (self->_clientRankAndBlend)
      {
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __79__SDCoreSpotlightFeedbackHandler_updateRankingSectionItemsForResult_withQuery___block_invoke;
        v26[3] = &unk_24CF63F58;
        v27 = v6;
        v10 = &v28;
        v11 = v8;
        v12 = &v29;
        v28 = v11;
        v29 = CFSTR("com.apple.spotlight.category");
        v13 = (void *)MEMORY[0x2199AE320](v26);
        objc_msgSend(MEMORY[0x24BDC2470], "defaultSearchableIndex");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *MEMORY[0x24BDC2128];
        v33[0] = *MEMORY[0x24BDC2130];
        v33[1] = v15;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *MEMORY[0x24BDD0CD0];
        v32 = v11;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v17;
        v20 = &v27;
        objc_msgSend(v14, "slowFetchAttributes:protectionClass:bundleID:identifiers:completionHandler:", v16, v19, CFSTR("com.apple.spotlight.category"), v18, v13);

      }
      else
      {
        objc_msgSend(MEMORY[0x24BEB00A8], "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *MEMORY[0x24BDD0CD0];
        v22 = *MEMORY[0x24BDC2128];
        v31[0] = *MEMORY[0x24BDC2130];
        v31[1] = v22;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v8;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = &v23;
        v23 = v8;
        v10 = &v24;
        v12 = &v25;
        v24 = v6;
        v25 = CFSTR("com.apple.spotlight.category");
        objc_msgSend(v13, "fetchAttributesForProtectionClass:attributes:bundleID:identifiers:completion:", v21, v14);
      }

    }
  }

}

void __79__SDCoreSpotlightFeedbackHandler_updateRankingSectionItemsForResult_withQuery___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count")
    && (objc_msgSend(v3, "objectAtIndexedSubscript:", 0), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v29;
        while (2)
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v29 != v9)
              objc_enumerationMutation(v6);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v11 = v6;
              goto LABEL_16;
            }
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
          if (v8)
            continue;
          break;
        }
      }

      v11 = 0;
LABEL_16:

    }
    else
    {
      v11 = 0;
    }

    if (v11)
    {
      objc_msgSend(v11, "firstObject");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", 1);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_opt_new();
      v15 = (void *)objc_opt_new();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v14, "addObjectsFromArray:", v12);
        objc_msgSend(v15, "addObjectsFromArray:", v13);
      }
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", a1[4]);
      objc_msgSend(v15, "addObject:", v26);
      v27 = (void *)v13;
      v16 = (void *)objc_opt_new();
      objc_msgSend(v16, "setUniqueIdentifier:", a1[5]);
      objc_msgSend(v16, "setBundleID:", a1[6]);
      v17 = objc_alloc(MEMORY[0x24BDC2480]);
      v18 = *MEMORY[0x24BDC2128];
      v33[0] = *MEMORY[0x24BDC2130];
      v33[1] = v18;
      v34[0] = v14;
      v34[1] = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
      v25 = (void *)v12;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v17, "initWithAttributes:", v19);
      objc_msgSend(v16, "setAttributeSet:", v20);

      objc_msgSend(MEMORY[0x24BDC2470], "defaultSearchableIndex");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *MEMORY[0x24BDD0CD0];
      objc_msgSend(v16, "bundleID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", v22, 0, 0, v23, v24, 0, 0);

    }
  }
  else
  {
    v5 = 0;
  }

}

void __79__SDCoreSpotlightFeedbackHandler_updateRankingSectionItemsForResult_withQuery___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "valueForKey:", a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 1);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "addObjectsFromArray:", v4);
    objc_msgSend(v7, "addObjectsFromArray:", v5);
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.0);
  v18 = (void *)v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", a1[5]);
  objc_msgSend(v7, "addObject:", v8);
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setUniqueIdentifier:", a1[4]);
  objc_msgSend(v9, "setBundleID:", a1[6]);
  v10 = objc_alloc(MEMORY[0x24BDC2480]);
  v11 = *MEMORY[0x24BDC2128];
  v20[0] = *MEMORY[0x24BDC2130];
  v20[1] = v11;
  v21[0] = v6;
  v21[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithAttributes:", v12);
  objc_msgSend(v9, "setAttributeSet:", v13);

  objc_msgSend(MEMORY[0x24BEB00A8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BDD0CD0];
  objc_msgSend(v9, "bundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", v15, 0, 0, v16, v17, 0, 0);

}

- (NSMutableArray)analyticsItems
{
  return self->_analyticsItems;
}

- (void)setAnalyticsItems:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsItems, a3);
}

- (NSMutableArray)topAnalyticsItemPerSection
{
  return self->_topAnalyticsItemPerSection;
}

- (void)setTopAnalyticsItemPerSection:(id)a3
{
  objc_storeStrong((id *)&self->_topAnalyticsItemPerSection, a3);
}

- (NSString)lastQuery
{
  return self->_lastQuery;
}

- (void)setLastQuery:(id)a3
{
  objc_storeStrong((id *)&self->_lastQuery, a3);
}

- (BOOL)ignoreResultEngagements
{
  return self->_ignoreResultEngagements;
}

- (void)setIgnoreResultEngagements:(BOOL)a3
{
  self->_ignoreResultEngagements = a3;
}

- (BOOL)clientRankAndBlend
{
  return self->_clientRankAndBlend;
}

- (void)setClientRankAndBlend:(BOOL)a3
{
  self->_clientRankAndBlend = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastQuery, 0);
  objc_storeStrong((id *)&self->_topAnalyticsItemPerSection, 0);
  objc_storeStrong((id *)&self->_analyticsItems, 0);
}

@end
