@implementation PRInlineComplicationGalleryViewController

- (PRInlineComplicationGalleryViewController)initWithSuggestionSet:(id)a3 selectedComplication:(id)a4 alternateDateEnabled:(BOOL)a5
{
  id v8;
  id v9;
  PRInlineComplicationGalleryViewController *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *widgetHostViewControllers;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  APSubjectMonitorSubscription *appProtectionSubjectMonitorSubscription;
  _QWORD v21[4];
  PRInlineComplicationGalleryViewController *v22;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PRInlineComplicationGalleryViewController;
  v10 = -[PRInlineComplicationGalleryViewController init](&v23, sel_init);
  if (v10)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    widgetHostViewControllers = v10->_widgetHostViewControllers;
    v10->_widgetHostViewControllers = v11;

    objc_storeStrong((id *)&v10->_selectedComplication, a4);
    v10->_alternateDateEnabled = a5;
    if (v8)
    {
      objc_msgSend(v8, "complications");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __109__PRInlineComplicationGalleryViewController_initWithSuggestionSet_selectedComplication_alternateDateEnabled___block_invoke;
      v21[3] = &unk_1E2186498;
      v22 = v10;
      objc_msgSend(v13, "bs_compactMap:", v21);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
    if (v14)
      v15 = v14;
    else
      v15 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v10->_suggestionItems, v15);
    PRSharedWidgetExtensionProvider();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "registerObserver:", v10);

    objc_msgSend(MEMORY[0x1E0CF96A8], "subjectMonitorRegistry");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addMonitor:subjectMask:subscriptionOptions:", v10, 1, 1);
    v18 = objc_claimAutoreleasedReturnValue();
    appProtectionSubjectMonitorSubscription = v10->_appProtectionSubjectMonitorSubscription;
    v10->_appProtectionSubjectMonitorSubscription = (APSubjectMonitorSubscription *)v18;

  }
  return v10;
}

id __109__PRInlineComplicationGalleryViewController_initWithSuggestionSet_selectedComplication_alternateDateEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v3 = a2;
  objc_msgSend(v3, "widgetDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    PRLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __133__PRWidgetSuggestionsViewController_initWithSuggestionSets_listLayoutProvider_iconViewProvider_widgetDragHandler_usingSidebarLayout___block_invoke_2_cold_1(v10);
    goto LABEL_8;
  }
  v6 = objc_msgSend(v4, "supportedFamilies");
  objc_msgSend(v3, "widgetFamily");
  if ((CHSWidgetFamilyMaskFromWidgetFamily() & v6) == 0)
  {
    PRLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __109__PRInlineComplicationGalleryViewController_initWithSuggestionSet_selectedComplication_alternateDateEnabled___block_invoke_cold_2((uint64_t)v5, v3, v10);
LABEL_8:

    v9 = 0;
    goto LABEL_9;
  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v3, "intent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_galleryItemForWidgetDescriptor:intent:family:iconImageHidden:suggestedComplication:", v5, v8, objc_msgSend(v3, "widgetFamily"), 0, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  PRSharedWidgetExtensionProvider();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  -[APSubjectMonitorSubscription invalidate](self->_appProtectionSubjectMonitorSubscription, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)PRInlineComplicationGalleryViewController;
  -[PRInlineComplicationGalleryViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  PRInlineComplicationGalleryView *v3;
  PRInlineComplicationGalleryView *v4;
  PRInlineComplicationGalleryView *complicationGalleryView;

  v3 = [PRInlineComplicationGalleryView alloc];
  v4 = -[PRInlineComplicationGalleryView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  complicationGalleryView = self->_complicationGalleryView;
  self->_complicationGalleryView = v4;

  -[PRInlineComplicationGalleryView setDelegate:](self->_complicationGalleryView, "setDelegate:", self);
  -[PRInlineComplicationGalleryViewController setView:](self, "setView:", self->_complicationGalleryView);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  UICollectionViewDiffableDataSource *v20;
  UICollectionViewDiffableDataSource *dataSource;
  UICollectionViewDiffableDataSource *v22;
  id v23;
  id v24;
  UICollectionViewDiffableDataSource *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id location;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)PRInlineComplicationGalleryViewController;
  -[PRInlineComplicationGalleryViewController viewDidLoad](&v39, sel_viewDidLoad);
  -[PRInlineComplicationGalleryViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_setManualScrollEdgeAppearanceProgress:", 0.0);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 24, self, sel__closeButtonTapped_);
    objc_msgSend(v5, "setRightBarButtonItem:", v8);

  }
  PRBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("INLINE_COMPLICATION_GALLERY_TITLE"), &stru_1E2186E08, CFSTR("PosterKit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRInlineComplicationGalleryViewController setTitle:](self, "setTitle:", v10);

  objc_initWeak(&location, self);
  v11 = (void *)MEMORY[0x1E0DC35C8];
  v12 = objc_opt_class();
  v13 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __56__PRInlineComplicationGalleryViewController_viewDidLoad__block_invoke;
  v36[3] = &unk_1E21864C0;
  objc_copyWeak(&v37, &location);
  objc_msgSend(v11, "registrationWithCellClass:configurationHandler:", v12, v36);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRInlineComplicationGalleryViewController _makeSectionHeaderRegistration](self, "_makeSectionHeaderRegistration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRInlineComplicationGalleryView collectionView](self->_complicationGalleryView, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", self);
  v17 = objc_alloc(MEMORY[0x1E0DC35E8]);
  v33[0] = v13;
  v33[1] = 3221225472;
  v33[2] = __56__PRInlineComplicationGalleryViewController_viewDidLoad__block_invoke_2;
  v33[3] = &unk_1E2183B68;
  v18 = v16;
  v34 = v18;
  v19 = v14;
  v35 = v19;
  v20 = (UICollectionViewDiffableDataSource *)objc_msgSend(v17, "initWithCollectionView:cellProvider:", v18, v33);
  dataSource = self->_dataSource;
  self->_dataSource = v20;

  v22 = self->_dataSource;
  v27 = v13;
  v28 = 3221225472;
  v29 = __56__PRInlineComplicationGalleryViewController_viewDidLoad__block_invoke_3;
  v30 = &unk_1E21864E8;
  v23 = v18;
  v31 = v23;
  v24 = v15;
  v32 = v24;
  -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](v22, "setSupplementaryViewProvider:", &v27);
  objc_msgSend(v23, "setContentInset:", 8.0, 0.0, 16.0, 0.0, v27, v28, v29, v30);
  v25 = self->_dataSource;
  -[PRInlineComplicationGalleryViewController _buildSnapshot](self, "_buildSnapshot");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](v25, "applySnapshot:animatingDifferences:", v26, 0);

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);

}

void __56__PRInlineComplicationGalleryViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(v7, "widgetItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_configureWidgetCell:forItem:atIndexPath:", v9, v10, v8);
}

uint64_t __56__PRInlineComplicationGalleryViewController_viewDidLoad__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *(_QWORD *)(a1 + 40), a3, a4);
}

uint64_t __56__PRInlineComplicationGalleryViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dequeueConfiguredReusableSupplementaryViewWithRegistration:forIndexPath:", *(_QWORD *)(a1 + 40));
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRInlineComplicationGalleryViewController;
  -[PRInlineComplicationGalleryViewController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)PRInlineComplicationGalleryViewController;
  -[PRInlineComplicationGalleryViewController viewDidDisappear:](&v13, sel_viewDidDisappear_, a3);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMutableDictionary allValues](self->_widgetHostViewControllers, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "invalidate");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;
  CGRect v5;

  objc_msgSend(MEMORY[0x1E0D1BCB0], "frameForElements:", 4);
  v2 = CGRectGetWidth(v5) + 8.0 + 16.0 + 8.0 + 16.0;
  v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_buildSnapshot
{
  id v3;
  NSArray *suggestionItems;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  PRInlineComplicationGalleryViewController *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  PRInlineComplicationGalleryViewController *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id v57;
  id obj;
  id obja;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  void *v71;
  void *v72;
  _BYTE v73[128];
  uint64_t v74;
  void *v75;
  const __CFString *v76;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  id v80;
  _BYTE v81[128];
  _QWORD v82[4];

  v82[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  suggestionItems = self->_suggestionItems;
  if (suggestionItems && -[NSArray count](suggestionItems, "count"))
  {
    v82[0] = CFSTR("PRInlineComplicationSuggestionsSectionIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendSectionsWithIdentifiers:", v5);

    objc_msgSend(v3, "appendItemsWithIdentifiers:", self->_suggestionItems);
  }
  v53 = self;
  v54 = v3;
  v60 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  PRSharedWidgetExtensionProvider();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v66, v81, 16);
  if (v8)
  {
    v9 = v8;
    obj = *(id *)v67;
    v55 = v7;
    do
    {
      v10 = 0;
      v56 = v9;
      do
      {
        if (*(id *)v67 != obj)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v10);
        objc_msgSend(v11, "orderedDescriptors", v53, v54);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bs_filter:", &__block_literal_global_46);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "count"))
        {
          objc_msgSend(v11, "identity");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "containerBundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CF9688], "applicationWithBundleIdentifier:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v16, "isLocked") & 1) == 0 && (objc_msgSend(v16, "isHidden") & 1) == 0)
          {
            v17 = objc_alloc(MEMORY[0x1E0CA5848]);
            objc_msgSend(v11, "identity");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "extensionBundleIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = 0;
            v20 = (void *)objc_msgSend(v17, "initWithBundleIdentifier:error:", v19, &v65);
            v57 = v65;

            if (v20)
            {
              objc_msgSend(v20, "containingBundleRecord");
              v21 = objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                objc_msgSend(v60, "objectForKeyedSubscript:", v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = v22;
                if (!v22)
                  v22 = (void *)MEMORY[0x1E0C9AA60];
                objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v12);
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v60, "setObject:forKeyedSubscript:", v24, v21);
LABEL_17:

              }
            }
            else
            {
              PRLogCommon();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v11, "identity");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "extensionBundleIdentifier");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v78 = v24;
                v79 = 2112;
                v80 = v57;
                _os_log_error_impl(&dword_18B634000, v21, OS_LOG_TYPE_ERROR, "Failed to get application extension record for widget bundle identifier %@: %@", buf, 0x16u);

                goto LABEL_17;
              }
            }
            v7 = v55;

            v9 = v56;
          }

        }
        ++v10;
      }
      while (v9 != v10);
      v26 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v66, v81, 16);
      v9 = v26;
    }
    while (v26);
  }

  objc_msgSend(v60, "allKeys");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sortedArrayUsingComparator:", &__block_literal_global_47);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v53;
  v29 = v54;
  if ((objc_msgSend(v28, "bs_containsObjectPassingTest:", &__block_literal_global_49) & 1) == 0)
  {
    v76 = CFSTR("PRDateOptionsSectionIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "appendSectionsWithIdentifiers:", v31);

    -[PRInlineComplicationGalleryViewController _dateGalleryItem](v53, "_dateGalleryItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "appendItemsWithIdentifiers:", v33);

    -[PRInlineComplicationGalleryViewController _alternateCalendarGalleryItem](v53, "_alternateCalendarGalleryItem");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v34;
    if (v34)
    {
      v74 = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "appendItemsWithIdentifiers:", v36);

    }
  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  obja = v28;
  v37 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v62 != v39)
          objc_enumerationMutation(obja);
        v41 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_msgSend(v41, "bundleIdentifier", v53, v54);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = v42;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "appendSectionsWithIdentifiers:", v43);

        objc_msgSend(v41, "bundleIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v43) = objc_msgSend(v44, "isEqual:", CFSTR("com.apple.mobilecal"));

        if ((_DWORD)v43)
        {
          -[PRInlineComplicationGalleryViewController _dateGalleryItem](v30, "_dateGalleryItem");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v45;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "appendItemsWithIdentifiers:", v46);

          -[PRInlineComplicationGalleryViewController _alternateCalendarGalleryItem](v30, "_alternateCalendarGalleryItem");
          v47 = objc_claimAutoreleasedReturnValue();
          v48 = (void *)v47;
          if (v47)
          {
            v70 = v47;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "appendItemsWithIdentifiers:", v49);

          }
        }
        objc_msgSend(v60, "objectForKeyedSubscript:", v41);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRInlineComplicationGalleryViewController _inlineGalleryItemsForWidgetDescriptors:iconImageHidden:isSuggestion:](v30, "_inlineGalleryItemsForWidgetDescriptors:iconImageHidden:isSuggestion:", v50, 1, 0);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "appendItemsWithIdentifiers:", v51);

      }
      v38 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
    }
    while (v38);
  }

  return v29;
}

uint64_t __59__PRInlineComplicationGalleryViewController__buildSnapshot__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  unsigned int v3;
  int v4;

  v2 = a2;
  v3 = objc_msgSend(v2, "supportedFamilies");
  v4 = objc_msgSend(v2, "pr_shouldDisplayInGallery");

  return v4 & (v3 >> 12);
}

uint64_t __59__PRInlineComplicationGalleryViewController__buildSnapshot__block_invoke_45(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

uint64_t __59__PRInlineComplicationGalleryViewController__buildSnapshot__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", CFSTR("com.apple.mobilecal"));

  return v3;
}

- (id)_alternateCalendarIdentifier
{
  if (_alternateCalendarIdentifier_onceToken != -1)
    dispatch_once(&_alternateCalendarIdentifier_onceToken, &__block_literal_global_51);
  return (id)_alternateCalendarIdentifier_alternateCalendarIdentifier;
}

void __73__PRInlineComplicationGalleryViewController__alternateCalendarIdentifier__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "overlayCalendarID");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_alternateCalendarIdentifier_alternateCalendarIdentifier;
  _alternateCalendarIdentifier_alternateCalendarIdentifier = v1;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D0CB50];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", v3, 0, v4, &__block_literal_global_56);

}

void __73__PRInlineComplicationGalleryViewController__alternateCalendarIdentifier__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayCalendarID");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_alternateCalendarIdentifier_alternateCalendarIdentifier;
  _alternateCalendarIdentifier_alternateCalendarIdentifier = v0;

}

- (id)_alternateDateString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;

  -[PRInlineComplicationGalleryViewController _alternateCalendarIdentifier](self, "_alternateCalendarIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D48]), "initWithCalendarIdentifier:", v2);
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0D3EFB0], "localeForCalendarID:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v9 = MEMORY[0x1E0C809B0];
        v10 = 3221225472;
        v11 = __65__PRInlineComplicationGalleryViewController__alternateDateString__block_invoke;
        v12 = &unk_1E2183900;
        v13 = v3;
        v14 = v4;
        if (_alternateDateString_onceToken != -1)
          dispatch_once(&_alternateDateString_onceToken, &v9);
        v5 = (void *)_alternateDateString_alternateCalendarDateFormatter;
        objc_msgSend(MEMORY[0x1E0C99D68], "date", v9, v10, v11, v12);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringFromDate:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __65__PRInlineComplicationGalleryViewController__alternateDateString__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v3 = (void *)_alternateDateString_alternateCalendarDateFormatter;
  _alternateDateString_alternateCalendarDateFormatter = (uint64_t)v2;

  objc_msgSend((id)_alternateDateString_alternateCalendarDateFormatter, "setCalendar:", *(_QWORD *)(a1 + 32));
  objc_msgSend((id)_alternateDateString_alternateCalendarDateFormatter, "setLocale:", *(_QWORD *)(a1 + 40));
  objc_msgSend((id)_alternateDateString_alternateCalendarDateFormatter, "setDateStyle:", 2);
  return objc_msgSend((id)_alternateDateString_alternateCalendarDateFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("UMMMd"));
}

- (id)_dateGalleryItem
{
  void *v3;
  void *v4;
  void *v5;
  PRComplicationGalleryWidgetItem *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  PRComplicationGalleryWidgetItem *v10;
  PRComplicationGalleryItem *v11;

  if (_dateGalleryItem_onceToken[0] != -1)
    dispatch_once(_dateGalleryItem_onceToken, &__block_literal_global_63);
  v3 = (void *)_dateGalleryItem_dateFormatter;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [PRComplicationGalleryWidgetItem alloc];
  PRBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("COMPLICATION_GALLERY_DATE_ITEM_TITLE"), &stru_1E2186E08, CFSTR("PosterKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_selectedComplication)
    v9 = 0;
  else
    v9 = !self->_alternateDateEnabled;
  v10 = -[PRComplicationGalleryWidgetItem initWithDisplayName:selected:iconImageHidden:text:kind:](v6, "initWithDisplayName:selected:iconImageHidden:text:kind:", v8, v9, 1, v5, 1);

  v11 = -[PRComplicationGalleryItem initWithWidgetItem:]([PRComplicationGalleryItem alloc], "initWithWidgetItem:", v10);
  return v11;
}

void __61__PRInlineComplicationGalleryViewController__dateGalleryItem__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_dateGalleryItem_dateFormatter;
  _dateGalleryItem_dateFormatter = (uint64_t)v0;

  objc_msgSend((id)_dateGalleryItem_dateFormatter, "setFormattingContext:", 2);
  v2 = (void *)_dateGalleryItem_dateFormatter;
  v3 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateFormatFromTemplate:options:locale:", CFSTR("EEEEMMMMd"), 0, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDateFormat:", v4);

}

- (id)_alternateCalendarGalleryItem
{
  void *v3;
  PRComplicationGalleryWidgetItem *v4;
  void *v5;
  void *v6;
  _BOOL8 alternateDateEnabled;
  PRComplicationGalleryItem *v8;
  PRComplicationGalleryWidgetItem *v9;

  -[PRInlineComplicationGalleryViewController _alternateDateString](self, "_alternateDateString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [PRComplicationGalleryWidgetItem alloc];
    PRBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("COMPLICATION_GALLERY_ALTERNATE_DATE_ITEM_TITLE"), &stru_1E2186E08, CFSTR("PosterKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_selectedComplication)
      alternateDateEnabled = 0;
    else
      alternateDateEnabled = self->_alternateDateEnabled;
    v9 = -[PRComplicationGalleryWidgetItem initWithDisplayName:selected:iconImageHidden:text:kind:](v4, "initWithDisplayName:selected:iconImageHidden:text:kind:", v6, alternateDateEnabled, 1, v3, 2);

    v8 = -[PRComplicationGalleryItem initWithWidgetItem:]([PRComplicationGalleryItem alloc], "initWithWidgetItem:", v9);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_inlineGalleryItemsForWidgetDescriptors:(id)a3 iconImageHidden:(BOOL)a4 isSuggestion:(BOOL)a5
{
  void *v7;
  void *v8;
  _QWORD v10[5];
  BOOL v11;

  objc_msgSend(a3, "bs_filter:", &__block_literal_global_73, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __114__PRInlineComplicationGalleryViewController__inlineGalleryItemsForWidgetDescriptors_iconImageHidden_isSuggestion___block_invoke_2;
  v10[3] = &unk_1E21865F0;
  v10[4] = self;
  v11 = a4;
  objc_msgSend(v7, "bs_map:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

unint64_t __114__PRInlineComplicationGalleryViewController__inlineGalleryItemsForWidgetDescriptors_iconImageHidden_isSuggestion___block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "supportedFamilies") >> 12) & 1;
}

uint64_t __114__PRInlineComplicationGalleryViewController__inlineGalleryItemsForWidgetDescriptors_iconImageHidden_isSuggestion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_galleryItemForWidgetDescriptor:intent:family:iconImageHidden:suggestedComplication:", a2, 0, 12, *(unsigned __int8 *)(a1 + 40), 0);
}

- (id)_galleryItemForWidgetDescriptor:(id)a3 intent:(id)a4 family:(int64_t)a5 iconImageHidden:(BOOL)a6 suggestedComplication:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PRComplicationDescriptor *v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  PRComplicationGalleryWidgetItem *v23;
  void *v24;
  PRComplicationGalleryWidgetItem *v25;
  PRComplicationGalleryItem *v26;

  v7 = a6;
  v12 = a7;
  v13 = a3;
  objc_msgSend(v13, "widgetForFamily:intent:", a5, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v14, "extensionBundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "kind");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ - %@ - %@"), v16, v17, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[PRComplicationDescriptor initWithUniqueIdentifier:widget:]([PRComplicationDescriptor alloc], "initWithUniqueIdentifier:widget:", v18, v14);
  -[PRComplicationDescriptor setSuggestedComplication:](v19, "setSuggestedComplication:", v12);

  -[PRComplicationDescriptor widget](self->_selectedComplication, "widget");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v14, "matchesPersonality:", v20);
  if (v12)
    v22 = 0;
  else
    v22 = v21;

  v23 = [PRComplicationGalleryWidgetItem alloc];
  objc_msgSend(v13, "displayName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[PRComplicationGalleryWidgetItem initWithDisplayName:selected:iconImageHidden:descriptor:](v23, "initWithDisplayName:selected:iconImageHidden:descriptor:", v24, v22, v7, v19);
  v26 = -[PRComplicationGalleryItem initWithWidgetItem:]([PRComplicationGalleryItem alloc], "initWithWidgetItem:", v25);

  return v26;
}

- (id)_makeSectionHeaderRegistration
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3640];
  v3 = objc_opt_class();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__PRInlineComplicationGalleryViewController__makeSectionHeaderRegistration__block_invoke;
  v6[3] = &unk_1E2186618;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v2, "registrationWithSupplementaryClass:elementKind:configurationHandler:", v3, CFSTR("PRInlineComplicationGalleryTitleElementKind"), v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

void __75__PRInlineComplicationGalleryViewController__makeSectionHeaderRegistration__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id *WeakRetained;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;

  v6 = a2;
  v7 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[122], "snapshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sectionIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "isEqualToString:", CFSTR("PRInlineComplicationSuggestionsSectionIdentifier")))
    {
      PRBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = CFSTR("COMPLICATION_GALLERY_SUGGESTIONS_TITLE");
    }
    else
    {
      if (!objc_msgSend(v12, "isEqualToString:", CFSTR("PRDateOptionsSectionIdentifier")))
      {
        v28 = 0;
        objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v12, 1, &v28);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v28;
        if (v18)
        {
          PRLogCommon();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            __75__PRInlineComplicationGalleryViewController__makeSectionHeaderRegistration__block_invoke_cold_1((uint64_t)v12, (uint64_t)v18, v19);
        }
        else
        {
          objc_msgSend(v17, "localizedName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setTitle:", v20);

          objc_msgSend(v9[121], "collectionView");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[PRComplicationGallerySectionHeaderView iconImageSize](PRComplicationGallerySectionHeaderView, "iconImageSize");
          v23 = v22;
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __75__PRInlineComplicationGalleryViewController__makeSectionHeaderRegistration__block_invoke_87;
          v24[3] = &unk_1E2183BF8;
          v25 = v6;
          v26 = v21;
          v27 = v7;
          v19 = v21;
          +[PRComplicationGalleryIconProvider loadIconImageForApplicationBundleIdentifier:atWidth:completion:](PRComplicationGalleryIconProvider, "loadIconImageForApplicationBundleIdentifier:atWidth:completion:", v12, v24, v23);

        }
        goto LABEL_12;
      }
      PRBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = CFSTR("COMPLICATION_GALLERY_DATE_SECTION_TITLE");
    }
    objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_1E2186E08, CFSTR("PosterKit"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v16);

    objc_msgSend(v6, "setIconImage:", 0);
LABEL_12:

  }
}

void __75__PRInlineComplicationGalleryViewController__makeSectionHeaderRegistration__block_invoke_87(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "supplementaryViewForElementKind:atIndexPath:", CFSTR("PRInlineComplicationGalleryTitleElementKind"), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
    objc_msgSend(*(id *)(a1 + 32), "setIconImage:", v5);

}

- (id)_widgetHostViewControllerForDescriptor:(id)a3 shownAlongsideIcon:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v4 = a4;
  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_widgetHostViewControllers, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[PRWidgetMetricsProvider sharedInstance](PRWidgetMetricsProvider, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widget");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "systemMetricsForWidget:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "size");
    objc_msgSend(v10, "size");
    v12 = v11;
    if (v4)
      +[PRInlineComplicationGalleryItemCell suggestionInset](PRInlineComplicationGalleryItemCell, "suggestionInset");
    else
      +[PRInlineComplicationGalleryItemCell checkmarkInset](PRInlineComplicationGalleryItemCell, "checkmarkInset");
    v14 = v12 - v13;
    v15 = objc_alloc(MEMORY[0x1E0D101F0]);
    objc_msgSend(v10, "cornerRadius");
    v17 = v16;
    objc_msgSend(v10, "scaleFactor");
    v19 = v18;
    v20 = objc_msgSend(v10, "fontStyle");
    objc_msgSend(v10, "safeAreaInsets");
    v25 = (void *)objc_msgSend(v15, "initWithSize:cornerRadius:scaleFactor:fontStyle:safeAreaInsets:", v20, v14, 26.0, v17, v19, v21, v22, v23, v24);

    v26 = objc_alloc(MEMORY[0x1E0D10310]);
    objc_msgSend(v6, "widget");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v26, "initWithWidget:metrics:widgetConfigurationIdentifier:", v27, v25, 0);

    objc_msgSend(v7, "setShouldShareTouchesWithHost:", 1);
    objc_msgSend(v7, "setDrawSystemBackgroundMaterialIfNecessary:", 0);
    objc_msgSend(v7, "setVisibility:", 0);
    objc_msgSend(v7, "setCanAppearInSecureEnvironment:", 1);
    objc_msgSend(v7, "setContentType:", 1);
    objc_msgSend(v7, "setColorScheme:", 2);
    v28 = objc_alloc_init(MEMORY[0x1E0D10058]);
    objc_msgSend(v28, "setHorizontalAlignment:", 1);
    objc_msgSend(v28, "setSymbolScale:", 1);
    v29 = objc_alloc_init(MEMORY[0x1E0D10040]);
    objc_msgSend(v29, "setSize:", &unk_1E21DD358);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1438]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setWeight:", v30);

    objc_msgSend(v28, "setFontSpecification:", v29);
    objc_msgSend(v7, "setInlineTextParameters:", v28);
    v31 = objc_alloc(MEMORY[0x1E0D10258]);
    objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "BSColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v31, "initWithPrimaryTintColor:secondaryTintColor:filterStyle:fallbackFilterStyle:fraction:", 0, v33, 4, 4, 1.0);

    objc_msgSend(v7, "setTintParameters:", v34);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_widgetHostViewControllers, "objectForKeyedSubscript:", v6);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "invalidate");

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_widgetHostViewControllers, "setObject:forKeyedSubscript:", v7, v6);
  }
  -[PRInlineComplicationGalleryViewController _configureWidgetHostViewController:forWidgetDescriptor:](self, "_configureWidgetHostViewController:forWidgetDescriptor:", v7, v6);
  objc_msgSend(v7, "setPresentationMode:", 2);

  return v7;
}

- (void)_configureWidgetCell:(id)a3 forItem:(id)a4 atIndexPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  PRInlineComplicationGalleryViewController *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _PRInlineTextViewController *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "text");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v12)
  {
    -[PRInlineComplicationGalleryViewController _widgetHostViewControllerForDescriptor:shownAlongsideIcon:](self, "_widgetHostViewControllerForDescriptor:shownAlongsideIcon:", v12, objc_msgSend(v10, "isIconImageHidden") ^ 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 == v15)
      goto LABEL_10;
    objc_msgSend(v15, "parentViewController");
    v17 = (PRInlineComplicationGalleryViewController *)objc_claimAutoreleasedReturnValue();
    if (v17 == self)
    {
      objc_msgSend(v15, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeFromSuperview");

      objc_msgSend(v15, "removeFromParentViewController");
      v17 = 0;
    }
    objc_msgSend(v9, "setContentViewController:", v15);
    if (v17 != self)
    {
      objc_msgSend(v9, "contentViewController");
      v19 = v11;
      v20 = v12;
      v21 = v14;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "contentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRInlineComplicationGalleryViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", v22, v23);

      v14 = v21;
      v12 = v20;
      v11 = v19;
    }
    goto LABEL_9;
  }
  if (v13)
  {
    v24 = -[_PRInlineTextViewController initWithText:]([_PRInlineTextViewController alloc], "initWithText:", v13);
    objc_msgSend(v9, "setContentViewController:", v24);

    objc_msgSend(v9, "contentViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentView");
    v17 = (PRInlineComplicationGalleryViewController *)objc_claimAutoreleasedReturnValue();
    -[PRInlineComplicationGalleryViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", v15, v17);
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRInlineComplicationGalleryViewController.m"), 538, CFSTR("Descriptor and text of PRComplicationGalleryItem are both nil"));
LABEL_10:

  objc_msgSend(v10, "displayName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v25);

  if (objc_msgSend(v10, "isIconImageHidden"))
  {
    objc_msgSend(v9, "setIconImage:", 0);
  }
  else
  {
    -[PRInlineComplicationGalleryView collectionView](self->_complicationGalleryView, "collectionView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "widget");
    v33 = v12;
    v27 = v14;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "extensionBundleIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __86__PRInlineComplicationGalleryViewController__configureWidgetCell_forItem_atIndexPath___block_invoke;
    v34[3] = &unk_1E2183BF8;
    v35 = v26;
    v36 = v9;
    v37 = v11;
    v30 = v26;
    +[PRComplicationGalleryIconProvider loadIconImageForExtensionBundleIdentifier:atWidth:completion:](PRComplicationGalleryIconProvider, "loadIconImageForExtensionBundleIdentifier:atWidth:completion:", v29, v34, 40.0);

    v14 = v27;
    v12 = v33;

  }
  -[PRInlineComplicationGalleryView collectionView](self->_complicationGalleryView, "collectionView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "numberOfItemsInSection:", objc_msgSend(v11, "section")) - 1;

  objc_msgSend(v9, "setSeparatorVisible:", objc_msgSend(v11, "item") != v32);
  objc_msgSend(v9, "setShowsCheckmark:", objc_msgSend(v10, "isSelected"));

}

void __86__PRInlineComplicationGalleryViewController__configureWidgetCell_forItem_atIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "indexPathForCell:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 48));

  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "setIconImage:", v5);

}

- (void)_configureWidgetHostViewController:(id)a3 forWidgetDescriptor:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  objc_msgSend(a4, "widget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PRSharedWidgetExtensionProvider();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "widgetDescriptorForWidget:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "intentType");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9
    && (v10 = (void *)v9,
        objc_msgSend(v6, "intent"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        !v11))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __100__PRInlineComplicationGalleryViewController__configureWidgetHostViewController_forWidgetDescriptor___block_invoke;
    v12[3] = &unk_1E2186640;
    v13 = v6;
    v14 = v5;
    objc_msgSend(v8, "loadDefaultIntent:", v12);

  }
  else
  {
    objc_msgSend(v5, "setWidget:", v6);
  }

}

void __100__PRInlineComplicationGalleryViewController__configureWidgetHostViewController_forWidgetDescriptor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PRLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "extensionBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "kind");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_18B634000, v4, OS_LOG_TYPE_DEFAULT, "Loaded new default intent for widget(%@ - %@): %@", (uint8_t *)&v10, 0x20u);

  }
  if (!v3)
  {
    PRLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __100__PRInlineComplicationGalleryViewController__configureWidgetHostViewController_forWidgetDescriptor___block_invoke_cold_1(a1, v9);
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 40), "widget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "widgetByReplacingIntent:", v3);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setWidget:", v9);
LABEL_8:

  }
}

- (void)_closeButtonTapped:(id)a3
{
  id WeakRetained;

  -[PRInlineComplicationGalleryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "inlineComplicationGalleryViewControllerDidFinish:", self);

}

- (void)_setAlternateDateEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  if (self->_alternateDateEnabled != a3)
  {
    v3 = a3;
    self->_alternateDateEnabled = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "inlineComplicationGalleryViewController:didToggleAlternateDate:", self, v3);

  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  PRComplicationDescriptor *v11;
  PRComplicationDescriptor *selectedComplication;
  id WeakRetained;
  void *v14;
  UICollectionViewDiffableDataSource *dataSource;
  void *v16;
  id v17;

  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  objc_msgSend(v9, "widgetItem");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v10 = v17;
  if (v17)
  {
    objc_msgSend(v17, "descriptor");
    v11 = (PRComplicationDescriptor *)objc_claimAutoreleasedReturnValue();
    selectedComplication = self->_selectedComplication;
    self->_selectedComplication = v11;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v17, "descriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "inlineComplicationGalleryViewController:didSelectComplication:", self, v14);

    if (objc_msgSend(v17, "kind"))
      -[PRInlineComplicationGalleryViewController _setAlternateDateEnabled:](self, "_setAlternateDateEnabled:", objc_msgSend(v17, "kind") == 2);
    dataSource = self->_dataSource;
    -[PRInlineComplicationGalleryViewController _buildSnapshot](self, "_buildSnapshot");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](dataSource, "applySnapshot:animatingDifferences:", v16, 0);

    v10 = v17;
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if ((objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock") & 1) == 0)
  {
    objc_msgSend(v11, "adjustedContentInset");
    v5 = v4;
    objc_msgSend(v11, "contentOffset");
    v7 = fmin(fmax((v5 + v6) * 0.0625, 0.0), 1.0);
    -[PRInlineComplicationGalleryViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setManualScrollEdgeAppearanceProgress:", v7);
  }

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  v5 = a4;
  v6 = objc_opt_class();
  v14 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v14;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v8, "contentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  v11 = v9;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  objc_msgSend(v13, "setVisibility:", 2);
  objc_msgSend(v13, "setPresentationMode:", 2);

}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  id v16;

  v5 = a4;
  v6 = objc_opt_class();
  v16 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v16;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v8, "contentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  v11 = v9;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isDescendantOfView:", v16);

  if (v15)
  {
    objc_msgSend(v13, "setVisibility:", 0);
    objc_msgSend(v13, "setPresentationMode:", 1);
  }

}

- (int64_t)layoutStyleForSectionIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  int64_t v7;

  -[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != CFSTR("PRInlineComplicationSuggestionsSectionIdentifier");

  return v7;
}

- (void)extensionsDidChangeForExtensionProvider:(id)a3
{
  BSDispatchMain();
}

void __85__PRInlineComplicationGalleryViewController_extensionsDidChangeForExtensionProvider___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  id v3;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[122];
  objc_msgSend(v1, "_buildSnapshot");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applySnapshot:animatingDifferences:", v3, 0);

}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  BSDispatchMain();
}

void __90__PRInlineComplicationGalleryViewController_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  id v3;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[122];
  objc_msgSend(v1, "_buildSnapshot");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applySnapshot:animatingDifferences:", v3, 0);

}

- (BOOL)isAlternateDateEnabled
{
  return self->_alternateDateEnabled;
}

- (PRComplicationDescriptor)selectedComplication
{
  return self->_selectedComplication;
}

- (PRInlineComplicationGalleryViewControllerDelegate)delegate
{
  return (PRInlineComplicationGalleryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedComplication, 0);
  objc_storeStrong((id *)&self->_appProtectionSubjectMonitorSubscription, 0);
  objc_storeStrong((id *)&self->_widgetHostViewControllers, 0);
  objc_storeStrong((id *)&self->_suggestionItems, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_complicationGalleryView, 0);
}

void __109__PRInlineComplicationGalleryViewController_initWithSuggestionSet_selectedComplication_alternateDateEnabled___block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "widgetFamily");
  NSStringFromWidgetFamily();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_0_3(&dword_18B634000, a3, v6, "Suggested complication %@ does not support provided widget family %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_1_1();
}

void __75__PRInlineComplicationGalleryViewController__makeSectionHeaderRegistration__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_0_3(&dword_18B634000, a3, (uint64_t)a3, "Failed to create bundle record for bundle identifier %@: %@", (uint8_t *)&v3);
}

void __100__PRInlineComplicationGalleryViewController__configureWidgetHostViewController_forWidgetDescriptor___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_0_3(&dword_18B634000, a2, v6, "Default intent asked for but not provided: %@ - %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_1_1();
}

@end
