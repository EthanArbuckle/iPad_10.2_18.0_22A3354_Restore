@implementation NCAppPickerContentProvider

+ (NCAppPickerContentProvider)providerWithPreviousBundleIdentifiersSelection:(id)a3 numDaysForAverageNotificationCount:(id)a4 onMainQueue:(id)a5
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NCAppPickerContentProvider *result;
  _QWORD v15[4];
  id v16;
  id v17;

  v7 = a3;
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0CF8DD8];
  v10 = a4;
  v11 = objc_alloc_init(v9);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __124__NCAppPickerContentProvider_providerWithPreviousBundleIdentifiersSelection_numDaysForAverageNotificationCount_onMainQueue___block_invoke;
  v15[3] = &unk_1E8D1EB80;
  v16 = v7;
  v17 = v8;
  v12 = v8;
  v13 = v7;
  objc_msgSend(v11, "appsSortedByNotificationsReceivedInPreviousNumDaysRaw:completionHandler:", v10, v15);

  return result;
}

void __124__NCAppPickerContentProvider_providerWithPreviousBundleIdentifiersSelection_numDaysForAverageNotificationCount_onMainQueue___block_invoke(uint64_t a1, void *a2, char a3, uint64_t a4)
{
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  char v14;

  v7 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __124__NCAppPickerContentProvider_providerWithPreviousBundleIdentifiersSelection_numDaysForAverageNotificationCount_onMainQueue___block_invoke_2;
  block[3] = &unk_1E8D1EB58;
  v14 = a3;
  v10 = v7;
  v13 = a4;
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __124__NCAppPickerContentProvider_providerWithPreviousBundleIdentifiersSelection_numDaysForAverageNotificationCount_onMainQueue___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    v3 = -[NCAppPickerContentProvider _initWithATXDigestSetupEntities:containsMessageAndTimeSensitiveData:numberOfDays:previousBundleIdentifiersSelection:]([NCAppPickerContentProvider alloc], "_initWithATXDigestSetupEntities:containsMessageAndTimeSensitiveData:numberOfDays:previousBundleIdentifiersSelection:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    v2 = *MEMORY[0x1E0DC5FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5FA0], OS_LOG_TYPE_ERROR))
      __124__NCAppPickerContentProvider_providerWithPreviousBundleIdentifiersSelection_numDaysForAverageNotificationCount_onMainQueue___block_invoke_2_cold_1(v2);
  }
}

- (id)_initWithATXDigestSetupEntities:(id)a3 containsMessageAndTimeSensitiveData:(BOOL)a4 numberOfDays:(unint64_t)a5 previousBundleIdentifiersSelection:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  NSMutableSet *v26;
  NSMutableSet *selectedApps;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NCAppPickerContentProviderAppObject *v39;
  void *v40;
  unint64_t v41;
  id v42;
  unint64_t v43;
  unint64_t maxAvgNumberOfNotifications;
  NSObject *v45;
  NSObject *v46;
  uint64_t v47;
  NSString *longestAppName;
  NSArray *appsSortedByAvgNumberOfNotificationsDescending;
  NSArray *v50;
  uint64_t v51;
  NSArray *appsSortedByNameAscending;
  BOOL v53;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  NSArray *v61;
  unint64_t v62;
  uint64_t v63;
  NCAppPickerContentProvider *v64;
  void *v65;
  void *v66;
  id v67;
  id obj;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  objc_super v81;
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  uint64_t v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a6;
  v81.receiver = self;
  v81.super_class = (Class)NCAppPickerContentProvider;
  v64 = -[NCAppPickerContentProvider init](&v81, sel_init);
  if (v64)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D036D8]);
    v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v58 = v8;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v78 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * i), "bundleId");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
      }
      while (v14);
    }

    v56 = v10;
    objc_msgSend(v10, "effectiveSectionInfoForSectionIDs:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    obj = v18;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v74;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v74 != v22)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
          objc_msgSend(v24, "sectionID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setValue:forKey:", v24, v25);

        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
      }
      while (v21);
    }

    v64->_maxAvgNumberOfNotifications = 0;
    v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    selectedApps = v64->_selectedApps;
    v64->_selectedApps = v26;

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v59 = 0;
    }
    v55 = v11;
    v57 = v9;
    v61 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v67 = v12;
    v28 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v69, v86, 16);
    if (!v28)
    {
      v65 = 0;
      goto LABEL_49;
    }
    v29 = v28;
    v65 = 0;
    v30 = *(_QWORD *)v70;
    while (1)
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v70 != v30)
          objc_enumerationMutation(v67);
        v32 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * k);
        objc_msgSend(v32, "bundleId");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CA5870], "unkit_applicationRecordIfEligibleToDeliverNotificationsForBundleIdentifier:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "localizedName");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          if (v33)
          {
            objc_msgSend(v19, "objectForKey:", v33);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v36;
            if (v36
              && objc_msgSend(v36, "authorizationStatus") != 1
              && (objc_msgSend(v37, "suppressFromSettings") & 1) == 0
              && (objc_msgSend(v37, "isRestricted") & 1) == 0)
            {
              v38 = objc_msgSend(v32, "numBasicNotifications");
              v39 = objc_alloc_init(NCAppPickerContentProviderAppObject);
              -[NCAppPickerContentProviderAppObject setName:](v39, "setName:", v35);
              v40 = v65;
              if (!v65 || (v62 = objc_msgSend(v65, "length"), v41 = objc_msgSend(v35, "length"), v40 = v65, v62 < v41))
              {
                v66 = v40;
                v63 = v38;
                v42 = v35;

                v65 = v42;
                v38 = v63;
              }
              v43 = 7 * v38 / a5;
              -[NCAppPickerContentProviderAppObject setBundleIdentifier:](v39, "setBundleIdentifier:", v33);
              -[NCAppPickerContentProviderAppObject setAvgNumberOfNotifications:](v39, "setAvgNumberOfNotifications:", v43);
              -[NSArray addObject:](v61, "addObject:", v39);
              if (objc_msgSend(v37, "scheduledDeliverySetting") == 2
                || objc_msgSend(v59, "containsObject:", v33))
              {
                -[NSMutableSet addObject:](v64->_selectedApps, "addObject:", v39);
              }
              maxAvgNumberOfNotifications = v64->_maxAvgNumberOfNotifications;
              if (maxAvgNumberOfNotifications <= v43)
                maxAvgNumberOfNotifications = v43;
              v64->_maxAvgNumberOfNotifications = maxAvgNumberOfNotifications;

LABEL_44:
              goto LABEL_45;
            }
          }
          else
          {
            v37 = 0;
          }
          v46 = *MEMORY[0x1E0DC5FA0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5FA0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v83 = v33;
            _os_log_impl(&dword_1CFC3D000, v46, OS_LOG_TYPE_DEFAULT, "Ignoring bundle %@ for digest onboarding since it is not authorized to post notifications", buf, 0xCu);
          }
          goto LABEL_44;
        }
        v45 = *MEMORY[0x1E0DC5FA0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5FA0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v83 = v33;
          v84 = 2112;
          v85 = 0;
          _os_log_error_impl(&dword_1CFC3D000, v45, OS_LOG_TYPE_ERROR, "Error getting LSApplicationRecord for %@. Error: %@", buf, 0x16u);
        }
LABEL_45:

      }
      v29 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v69, v86, 16);
      if (!v29)
      {
LABEL_49:

        v47 = objc_msgSend(v65, "copy");
        longestAppName = v64->_longestAppName;
        v64->_longestAppName = (NSString *)v47;

        appsSortedByAvgNumberOfNotificationsDescending = v64->_appsSortedByAvgNumberOfNotificationsDescending;
        v64->_appsSortedByAvgNumberOfNotificationsDescending = v61;
        v50 = v61;

        -[NSArray sortedArrayUsingComparator:](v50, "sortedArrayUsingComparator:", &__block_literal_global_33);
        v51 = objc_claimAutoreleasedReturnValue();
        appsSortedByNameAscending = v64->_appsSortedByNameAscending;
        v64->_appsSortedByNameAscending = (NSArray *)v51;

        v53 = v64->_maxAvgNumberOfNotifications != 0;
        v64->_ableToSortByAvgNumberOfNotifications = v53;
        v64->_sortedByAvgNumberOfNotifications = v53;

        v9 = v57;
        v8 = v58;
        break;
      }
    }
  }

  return v64;
}

uint64_t __146__NCAppPickerContentProvider__initWithATXDigestSetupEntities_containsMessageAndTimeSensitiveData_numberOfDays_previousBundleIdentifiersSelection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

- (unint64_t)totalCount
{
  return -[NSArray count](self->_appsSortedByNameAscending, "count");
}

- (unint64_t)selectedCount
{
  return -[NSMutableSet count](self->_selectedApps, "count");
}

- (NSArray)selectedBundleIdentifiers
{
  id v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_selectedApps;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "bundleIdentifier", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)nameForIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[NCAppPickerContentProvider _appForIndex:](self, "_appForIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)avgNumberOfNotificationsForIndex:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[NCAppPickerContentProvider _appForIndex:](self, "_appForIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "avgNumberOfNotifications");

  return v4;
}

- (id)imageForIndex:(unint64_t)a3 size:(CGSize)a4
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v27[2];

  height = a4.height;
  width = a4.width;
  v27[1] = *MEMORY[0x1E0C80C00];
  -[NCAppPickerContentProvider _appForIndex:](self, "_appForIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0D3A830]);
  objc_msgSend(v8, "scale");
  v11 = (void *)objc_msgSend(v9, "initWithSize:scale:", width, height, v10);
  objc_msgSend(v8, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceStyle");

  if (v13 == 2)
    objc_msgSend(v11, "setAppearance:", 1);
  v14 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.mobilecal"));
  v15 = objc_alloc(MEMORY[0x1E0D3A820]);
  v16 = v15;
  if (!v14)
  {
    v25 = (void *)objc_msgSend(v15, "initWithBundleIdentifier:", v7);
    objc_msgSend(v25, "prepareImageForDescriptor:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      goto LABEL_5;
LABEL_7:
    v24 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithDate:calendar:format:", v17, v18, 0);

  v27[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "prepareImagesForImageDescriptors:", v20);

  objc_msgSend(v19, "imageForDescriptor:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
    goto LABEL_7;
LABEL_5:
  v22 = (void *)MEMORY[0x1E0DC3870];
  v23 = objc_msgSend(v21, "CGImage");
  objc_msgSend(v21, "scale");
  objc_msgSend(v22, "imageWithCGImage:scale:orientation:", v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v24;
}

- (BOOL)isSelectedForIndex:(unint64_t)a3
{
  NCAppPickerContentProvider *v3;
  void *v4;

  v3 = self;
  -[NCAppPickerContentProvider _appForIndex:](self, "_appForIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[NSMutableSet containsObject:](v3->_selectedApps, "containsObject:", v4);

  return (char)v3;
}

- (void)toggleSelectedForIndex:(unint64_t)a3
{
  int v4;
  NSMutableSet *selectedApps;
  id v6;

  -[NCAppPickerContentProvider _appForIndex:](self, "_appForIndex:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[NSMutableSet containsObject:](self->_selectedApps, "containsObject:");
  selectedApps = self->_selectedApps;
  if (v4)
    -[NSMutableSet removeObject:](selectedApps, "removeObject:", v6);
  else
    -[NSMutableSet addObject:](selectedApps, "addObject:", v6);

}

- (id)bundleIdentifierForIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[NCAppPickerContentProvider _appForIndex:](self, "_appForIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)sortByName
{
  if (self->_ableToSortByAvgNumberOfNotifications)
    self->_sortedByAvgNumberOfNotifications = 0;
}

- (void)sortByAvgNumberOfNotifications
{
  if (self->_ableToSortByAvgNumberOfNotifications)
    self->_sortedByAvgNumberOfNotifications = 1;
}

- (id)_appForIndex:(unint64_t)a3
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = 8;
  if (!self->_sortedByAvgNumberOfNotifications)
    v4 = 16;
  v5 = *(id *)((char *)&self->super.isa + v4);
  if (objc_msgSend(v5, "count") <= a3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (unint64_t)maxAvgNumberOfNotifications
{
  return self->_maxAvgNumberOfNotifications;
}

- (BOOL)isSortedByAvgNumberOfNotifications
{
  return self->_sortedByAvgNumberOfNotifications;
}

- (BOOL)isAbleToSortByAvgNumberOfNotifications
{
  return self->_ableToSortByAvgNumberOfNotifications;
}

- (NSString)longestAppName
{
  return self->_longestAppName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longestAppName, 0);
  objc_storeStrong((id *)&self->_selectedApps, 0);
  objc_storeStrong((id *)&self->_appsSortedByNameAscending, 0);
  objc_storeStrong((id *)&self->_appsSortedByAvgNumberOfNotificationsDescending, 0);
}

void __124__NCAppPickerContentProvider_providerWithPreviousBundleIdentifiersSelection_numDaysForAverageNotificationCount_onMainQueue___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CFC3D000, log, OS_LOG_TYPE_ERROR, "Error getting ATXDigestSetupResponses", v1, 2u);
}

@end
