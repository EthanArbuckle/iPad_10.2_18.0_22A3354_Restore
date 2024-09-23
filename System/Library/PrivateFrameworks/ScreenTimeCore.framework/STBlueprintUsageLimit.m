@implementation STBlueprintUsageLimit

- (void)awakeFromFetch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STBlueprintUsageLimit;
  -[STBlueprintUsageLimit awakeFromFetch](&v9, sel_awakeFromFetch);
  -[STBlueprintUsageLimit applicationIdentifiers](self, "applicationIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit categoryIdentifiers](self, "categoryIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit categoryIdentifiersVersion2](self, "categoryIdentifiersVersion2");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit websiteIdentifiers](self, "websiteIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit itemIdentifiers](self, "itemIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit usageItemType](self, "usageItemType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit _usageLimitDidChangeFromOldApplicationIdentifiers:oldCategoryIdentifiers:oldCategoryIdentifiersVersion2:oldWebDomains:oldItemIdentifiers:oldItemType:toNewApplicationIdentifiers:newCategoryIdentifiers:newCategoryIdentifiersVersion2:newWebDomains:newItemIdentifiers:newItemType:](self, "_usageLimitDidChangeFromOldApplicationIdentifiers:oldCategoryIdentifiers:oldCategoryIdentifiersVersion2:oldWebDomains:oldItemIdentifiers:oldItemType:toNewApplicationIdentifiers:newCategoryIdentifiers:newCategoryIdentifiersVersion2:newWebDomains:newItemIdentifiers:newItemType:", 0, 0, 0, 0, 0, 0, v3, v4, v5, v6, v7, v8);

}

- (void)setApplicationIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[STBlueprintUsageLimit applicationIdentifiers](self, "applicationIdentifiers");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit managedObjectOriginal_setApplicationIdentifiers:](self, "managedObjectOriginal_setApplicationIdentifiers:", v4);
  -[STBlueprintUsageLimit categoryIdentifiers](self, "categoryIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit categoryIdentifiersVersion2](self, "categoryIdentifiersVersion2");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit websiteIdentifiers](self, "websiteIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit itemIdentifiers](self, "itemIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit usageItemType](self, "usageItemType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit _usageLimitDidChangeFromOldApplicationIdentifiers:oldCategoryIdentifiers:oldCategoryIdentifiersVersion2:oldWebDomains:oldItemIdentifiers:oldItemType:toNewApplicationIdentifiers:newCategoryIdentifiers:newCategoryIdentifiersVersion2:newWebDomains:newItemIdentifiers:newItemType:](self, "_usageLimitDidChangeFromOldApplicationIdentifiers:oldCategoryIdentifiers:oldCategoryIdentifiersVersion2:oldWebDomains:oldItemIdentifiers:oldItemType:toNewApplicationIdentifiers:newCategoryIdentifiers:newCategoryIdentifiersVersion2:newWebDomains:newItemIdentifiers:newItemType:", v10, v5, v6, v7, v8, v9, v4, v5, v6, v7, v8, v9);

}

- (void)setCategoryIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[STBlueprintUsageLimit categoryIdentifiers](self, "categoryIdentifiers");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit managedObjectOriginal_setCategoryIdentifiers:](self, "managedObjectOriginal_setCategoryIdentifiers:", v4);
  -[STBlueprintUsageLimit categoryIdentifiersVersion2](self, "categoryIdentifiersVersion2");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit applicationIdentifiers](self, "applicationIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit websiteIdentifiers](self, "websiteIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit itemIdentifiers](self, "itemIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit usageItemType](self, "usageItemType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit _usageLimitDidChangeFromOldApplicationIdentifiers:oldCategoryIdentifiers:oldCategoryIdentifiersVersion2:oldWebDomains:oldItemIdentifiers:oldItemType:toNewApplicationIdentifiers:newCategoryIdentifiers:newCategoryIdentifiersVersion2:newWebDomains:newItemIdentifiers:newItemType:](self, "_usageLimitDidChangeFromOldApplicationIdentifiers:oldCategoryIdentifiers:oldCategoryIdentifiersVersion2:oldWebDomains:oldItemIdentifiers:oldItemType:toNewApplicationIdentifiers:newCategoryIdentifiers:newCategoryIdentifiersVersion2:newWebDomains:newItemIdentifiers:newItemType:", v6, v10, v5, v7, v8, v9, v6, v4, v5, v7, v8, v9);

}

- (void)setCategoryIdentifiersVersion2:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[STBlueprintUsageLimit categoryIdentifiersVersion2](self, "categoryIdentifiersVersion2");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit managedObjectOriginal_setCategoryIdentifiersVersion2:](self, "managedObjectOriginal_setCategoryIdentifiersVersion2:", v4);
  -[STBlueprintUsageLimit categoryIdentifiers](self, "categoryIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit applicationIdentifiers](self, "applicationIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit websiteIdentifiers](self, "websiteIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit itemIdentifiers](self, "itemIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit usageItemType](self, "usageItemType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit _usageLimitDidChangeFromOldApplicationIdentifiers:oldCategoryIdentifiers:oldCategoryIdentifiersVersion2:oldWebDomains:oldItemIdentifiers:oldItemType:toNewApplicationIdentifiers:newCategoryIdentifiers:newCategoryIdentifiersVersion2:newWebDomains:newItemIdentifiers:newItemType:](self, "_usageLimitDidChangeFromOldApplicationIdentifiers:oldCategoryIdentifiers:oldCategoryIdentifiersVersion2:oldWebDomains:oldItemIdentifiers:oldItemType:toNewApplicationIdentifiers:newCategoryIdentifiers:newCategoryIdentifiersVersion2:newWebDomains:newItemIdentifiers:newItemType:", v6, v5, v10, v7, v8, v9, v6, v5, v4, v7, v8, v9);

}

- (void)setWebsiteIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[STBlueprintUsageLimit websiteIdentifiers](self, "websiteIdentifiers");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit managedObjectOriginal_setWebsiteIdentifiers:](self, "managedObjectOriginal_setWebsiteIdentifiers:", v4);
  -[STBlueprintUsageLimit applicationIdentifiers](self, "applicationIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit categoryIdentifiers](self, "categoryIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit categoryIdentifiersVersion2](self, "categoryIdentifiersVersion2");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit itemIdentifiers](self, "itemIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit usageItemType](self, "usageItemType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit _usageLimitDidChangeFromOldApplicationIdentifiers:oldCategoryIdentifiers:oldCategoryIdentifiersVersion2:oldWebDomains:oldItemIdentifiers:oldItemType:toNewApplicationIdentifiers:newCategoryIdentifiers:newCategoryIdentifiersVersion2:newWebDomains:newItemIdentifiers:newItemType:](self, "_usageLimitDidChangeFromOldApplicationIdentifiers:oldCategoryIdentifiers:oldCategoryIdentifiersVersion2:oldWebDomains:oldItemIdentifiers:oldItemType:toNewApplicationIdentifiers:newCategoryIdentifiers:newCategoryIdentifiersVersion2:newWebDomains:newItemIdentifiers:newItemType:", v5, v6, v7, v10, v8, v9, v5, v6, v7, v4, v8, v9);

}

- (void)setItemIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[STBlueprintUsageLimit itemIdentifiers](self, "itemIdentifiers");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit managedObjectOriginal_setItemIdentifiers:](self, "managedObjectOriginal_setItemIdentifiers:", v4);
  -[STBlueprintUsageLimit applicationIdentifiers](self, "applicationIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit categoryIdentifiers](self, "categoryIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit categoryIdentifiersVersion2](self, "categoryIdentifiersVersion2");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit websiteIdentifiers](self, "websiteIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit usageItemType](self, "usageItemType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit _usageLimitDidChangeFromOldApplicationIdentifiers:oldCategoryIdentifiers:oldCategoryIdentifiersVersion2:oldWebDomains:oldItemIdentifiers:oldItemType:toNewApplicationIdentifiers:newCategoryIdentifiers:newCategoryIdentifiersVersion2:newWebDomains:newItemIdentifiers:newItemType:](self, "_usageLimitDidChangeFromOldApplicationIdentifiers:oldCategoryIdentifiers:oldCategoryIdentifiersVersion2:oldWebDomains:oldItemIdentifiers:oldItemType:toNewApplicationIdentifiers:newCategoryIdentifiers:newCategoryIdentifiersVersion2:newWebDomains:newItemIdentifiers:newItemType:", v5, v6, v7, v8, v10, v9, v5, v6, v7, v8, v4, v9);

}

- (void)setUsageItemType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[STBlueprintUsageLimit usageItemType](self, "usageItemType");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit managedObjectOriginal_setUsageItemType:](self, "managedObjectOriginal_setUsageItemType:", v4);
  -[STBlueprintUsageLimit applicationIdentifiers](self, "applicationIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit categoryIdentifiers](self, "categoryIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit categoryIdentifiersVersion2](self, "categoryIdentifiersVersion2");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit websiteIdentifiers](self, "websiteIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit itemIdentifiers](self, "itemIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit _usageLimitDidChangeFromOldApplicationIdentifiers:oldCategoryIdentifiers:oldCategoryIdentifiersVersion2:oldWebDomains:oldItemIdentifiers:oldItemType:toNewApplicationIdentifiers:newCategoryIdentifiers:newCategoryIdentifiersVersion2:newWebDomains:newItemIdentifiers:newItemType:](self, "_usageLimitDidChangeFromOldApplicationIdentifiers:oldCategoryIdentifiers:oldCategoryIdentifiersVersion2:oldWebDomains:oldItemIdentifiers:oldItemType:toNewApplicationIdentifiers:newCategoryIdentifiers:newCategoryIdentifiersVersion2:newWebDomains:newItemIdentifiers:newItemType:", v5, v6, v7, v8, v9, v10, v5, v6, v7, v8, v9, v4);

}

- (void)_usageLimitDidChangeFromOldApplicationIdentifiers:(id)a3 oldCategoryIdentifiers:(id)a4 oldCategoryIdentifiersVersion2:(id)a5 oldWebDomains:(id)a6 oldItemIdentifiers:(id)a7 oldItemType:(id)a8 toNewApplicationIdentifiers:(id)a9 newCategoryIdentifiers:(id)a10 newCategoryIdentifiersVersion2:(id)a11 newWebDomains:(id)a12 newItemIdentifiers:(id)a13 newItemType:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  char v29;
  void *v30;
  id v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
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
  void *v49;
  id v50;
  id v51;
  void *v52;
  _QWORD v53[2];
  _QWORD v54[3];

  v54[2] = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v51 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a11;
  v27 = a12;
  v28 = a13;
  v50 = a14;
  v52 = v19;
  if (objc_msgSend(v19, "count")
    || objc_msgSend(v20, "count")
    || objc_msgSend(v21, "count")
    || objc_msgSend(v51, "count")
    || (v29 = objc_msgSend(v23, "isEqualToString:", CFSTR("app")), v30 = v22, (v29 & 1) == 0))
  {
    v30 = v19;
  }
  v45 = v23;
  v46 = v22;
  v47 = v21;
  v49 = v20;
  v31 = v30;
  if (objc_msgSend(v24, "count")
    || objc_msgSend(v25, "count")
    || objc_msgSend(v26, "count")
    || objc_msgSend(v27, "count")
    || (v32 = objc_msgSend(v50, "isEqualToString:", CFSTR("app")), v33 = v28, (v32 & 1) == 0))
  {
    v33 = v24;
  }
  v34 = (void *)MEMORY[0x1E0C9AA60];
  v35 = v28;
  if (v31)
    v36 = v31;
  else
    v36 = (void *)MEMORY[0x1E0C9AA60];
  v37 = v33;
  v38 = v24;
  v39 = v27;
  if (v37)
    v40 = v37;
  else
    v40 = v34;
  v53[0] = CFSTR("OldBundleIdentifiers");
  v53[1] = CFSTR("NewBundleIdentifiers");
  v54[0] = v36;
  v54[1] = v40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit blueprint](self, "blueprint");
  v43 = v25;
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "postNotificationName:object:userInfo:", CFSTR("LimitedApplicationsDidChange"), v44, v41);

}

+ (id)limitKeyPaths
{
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("day0Limit");
  v3[1] = CFSTR("day1Limit");
  v3[2] = CFSTR("day2Limit");
  v3[3] = CFSTR("day3Limit");
  v3[4] = CFSTR("day4Limit");
  v3[5] = CFSTR("day5Limit");
  v3[6] = CFSTR("day6Limit");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)keyPathsForValuesAffectingBudgetLimitScheduleRepresentation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("day0Limit"), CFSTR("day1Limit"), CFSTR("day2Limit"), CFSTR("day3Limit"), CFSTR("day4Limit"), CFSTR("day5Limit"), CFSTR("day6Limit"), 0);
}

- (STBlueprintUsageLimitScheduleRepresentation)budgetLimitScheduleRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  int v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  +[STBlueprintUsageLimit limitKeyPaths](STBlueprintUsageLimit, "limitKeyPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(v3, "setCustomScheduleItems:", v4);
    v12 = 0;
LABEL_9:
    v13 = (void *)objc_opt_new();
    objc_msgSend(v12, "doubleValue");
    objc_msgSend(v13, "setBudgetLimit:");
    objc_msgSend(v3, "setSimpleSchedule:", v13);

    goto LABEL_10;
  }
  v6 = 0;
  v7 = 0;
  v8 = 1;
  do
  {
    v9 = (void *)objc_opt_new();
    v10 = v7 + 1;
    objc_msgSend(v9, "setDay:", v7 + 1);
    objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[STBlueprintUsageLimit valueForKey:](self, "valueForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "doubleValue");
    objc_msgSend(v9, "setBudgetLimit:");
    if (v6)
      v8 &= objc_msgSend(v6, "isEqual:", v12);

    objc_msgSend(v4, "addObject:", v9);
    v6 = v12;
    v7 = v10;
  }
  while (v10 < objc_msgSend(v5, "count"));
  objc_msgSend(v3, "setCustomScheduleItems:", v4);
  if ((v8 & 1) != 0)
    goto LABEL_9;
LABEL_10:

  return (STBlueprintUsageLimitScheduleRepresentation *)v3;
}

- (void)setBudgetLimit:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  +[STBlueprintUsageLimit limitKeyPaths](STBlueprintUsageLimit, "limitKeyPaths", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[STBlueprintUsageLimit setValue:forKeyPath:](self, "setValue:forKeyPath:", v11, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)setBudgetLimit:(double)a3 forDay:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v10;
  id v11;

  if (a4 - 8 <= 0xFFFFFFFFFFFFFFF8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STBlueprintUsageLimit.m"), 319, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("day >= 1 && day <= 7"));

  }
  +[STBlueprintUsageLimit limitKeyPaths](STBlueprintUsageLimit, "limitKeyPaths");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", a4 - 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit setValue:forKeyPath:](self, "setValue:forKeyPath:", v8, v7);

}

- (void)setBudgetLimitScheduleRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "simpleSchedule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "budgetLimit");
    -[STBlueprintUsageLimit setBudgetLimit:](self, "setBudgetLimit:");
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "customScheduleItems", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v12, "budgetLimit");
        -[STBlueprintUsageLimit setBudgetLimit:forDay:](self, "setBudgetLimit:forDay:", objc_msgSend(v12, "day"), v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("applicationIdentifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit setApplicationIdentifiers:](self, "setApplicationIdentifiers:", v5);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("categoryIdentifiers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit setCategoryIdentifiers:](self, "setCategoryIdentifiers:", v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("categoryIdentifiersVersion2"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit setCategoryIdentifiersVersion2:](self, "setCategoryIdentifiersVersion2:", v7);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("websiteIdentifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit setWebsiteIdentifiers:](self, "setWebsiteIdentifiers:", v8);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("itemIdentifiers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit setItemIdentifiers:](self, "setItemIdentifiers:", v9);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usageItemType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit setUsageItemType:](self, "setUsageItemType:", v10);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("notificationTimeInterval"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintUsageLimit setNotificationTimeInterval:](self, "setNotificationTimeInterval:", v11);

  +[STBlueprintUsageLimit limitKeyPaths](STBlueprintUsageLimit, "limitKeyPaths");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[STBlueprintUsageLimit setValue:forKeyPath:](self, "setValue:forKeyPath:", v18, v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  return 1;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[STBlueprintUsageLimit applicationIdentifiers](self, "applicationIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("applicationIdentifiers"));

  -[STBlueprintUsageLimit categoryIdentifiers](self, "categoryIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("categoryIdentifiers"));

  -[STBlueprintUsageLimit categoryIdentifiersVersion2](self, "categoryIdentifiersVersion2");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("categoryIdentifiersVersion2"));

  -[STBlueprintUsageLimit websiteIdentifiers](self, "websiteIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("websiteIdentifiers"));

  -[STBlueprintUsageLimit itemIdentifiers](self, "itemIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("itemIdentifiers"));

  -[STBlueprintUsageLimit usageItemType](self, "usageItemType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("usageItemType"));

  -[STBlueprintUsageLimit notificationTimeInterval](self, "notificationTimeInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("notificationTimeInterval"));

  +[STBlueprintUsageLimit limitKeyPaths](STBlueprintUsageLimit, "limitKeyPaths");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[STBlueprintUsageLimit valueForKeyPath:](self, "valueForKeyPath:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }
  v18 = (void *)objc_msgSend(v3, "copy");

  return v18;
}

@end
