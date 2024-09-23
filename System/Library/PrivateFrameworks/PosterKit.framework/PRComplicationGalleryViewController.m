@implementation PRComplicationGalleryViewController

- (PRComplicationGalleryViewController)initWithSuggestionSets:(id)a3 applicationWidgetCollections:(id)a4 listLayoutProvider:(id)a5 iconViewProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PRComplicationGalleryViewController *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *widgetHostViewControllersPerReason;
  uint64_t v17;
  NSArray *suggestionSets;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PRComplicationGalleryViewController;
  v14 = -[PRComplicationGalleryViewController initWithNibName:bundle:](&v20, sel_initWithNibName_bundle_, 0, 0);
  if (v14)
  {
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    widgetHostViewControllersPerReason = v14->_widgetHostViewControllersPerReason;
    v14->_widgetHostViewControllersPerReason = v15;

    objc_msgSend(v10, "bs_compactMap:", &__block_literal_global_6);
    v17 = objc_claimAutoreleasedReturnValue();
    suggestionSets = v14->_suggestionSets;
    v14->_suggestionSets = (NSArray *)v17;

    objc_storeStrong((id *)&v14->_applicationWidgetCollections, a4);
    objc_storeStrong((id *)&v14->_listLayoutProvider, a5);
    objc_storeStrong((id *)&v14->_iconViewProvider, a6);
  }

  return v14;
}

PRComplicationSuggestionSet *__127__PRComplicationGalleryViewController_initWithSuggestionSets_applicationWidgetCollections_listLayoutProvider_iconViewProvider___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  PRComplicationSuggestionSet *v8;

  v2 = a2;
  objc_msgSend(v2, "complications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(v2, "complications");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bs_compactMap:", &__block_literal_global_9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "localizedTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PRComplicationSuggestionSet initWithDescriptors:localizedTitle:]([PRComplicationSuggestionSet alloc], "initWithDescriptors:localizedTitle:", v6, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

PRComplicationDescriptor *__127__PRComplicationGalleryViewController_initWithSuggestionSets_applicationWidgetCollections_listLayoutProvider_iconViewProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  PRComplicationDescriptor *v9;
  void *v10;
  void *v11;
  PRComplicationDescriptor *v12;
  NSObject *v13;

  v2 = a2;
  PRSharedWidgetDescriptorProvider();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptorForPersonality:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    PRLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __133__PRWidgetSuggestionsViewController_initWithSuggestionSets_listLayoutProvider_iconViewProvider_widgetDragHandler_usingSidebarLayout___block_invoke_2_cold_1(v13);
    goto LABEL_8;
  }
  v5 = objc_msgSend(v4, "supportedFamilies");
  objc_msgSend(v2, "widgetFamily");
  if ((CHSWidgetFamilyMaskFromWidgetFamily() & v5) == 0)
  {
    PRLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __127__PRComplicationGalleryViewController_initWithSuggestionSets_applicationWidgetCollections_listLayoutProvider_iconViewProvider___block_invoke_2_cold_2((uint64_t)v4, v2);
LABEL_8:

    v12 = 0;
    goto LABEL_9;
  }
  v6 = objc_msgSend(v2, "widgetFamily");
  objc_msgSend(v2, "intent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetForFamily:intent:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [PRComplicationDescriptor alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PRComplicationDescriptor initWithUniqueIdentifier:widget:](v9, "initWithUniqueIdentifier:widget:", v11, v8);

  -[PRComplicationDescriptor setSuggestedComplication:](v12, "setSuggestedComplication:", v2);
LABEL_9:

  return v12;
}

- (void)loadView
{
  PRComplicationGalleryView *v3;
  PRComplicationGalleryView *v4;
  PRComplicationGalleryView *complicationGalleryView;

  v3 = [PRComplicationGalleryView alloc];
  v4 = -[PRComplicationGalleryView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  complicationGalleryView = self->_complicationGalleryView;
  self->_complicationGalleryView = v4;

  -[PRComplicationGalleryView setDelegate:](self->_complicationGalleryView, "setDelegate:", self);
  -[PRComplicationGalleryViewController setView:](self, "setView:", self->_complicationGalleryView);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  UICollectionViewDiffableDataSource *v22;
  UICollectionViewDiffableDataSource *dataSource;
  UICollectionViewDiffableDataSource *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id (*v28)(_QWORD *, uint64_t, void *, void *);
  void *v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id location;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)PRComplicationGalleryViewController;
  -[PRComplicationGalleryViewController viewDidLoad](&v38, sel_viewDidLoad);
  -[PRComplicationGalleryViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_setManualScrollEdgeAppearanceProgress:", 0.0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 24, self, sel__closeButtonTapped_);
  objc_msgSend(v5, "setRightBarButtonItem:", v6);
  PRBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("COMPLICATION_GALLERY_TITLE"), &stru_1E2186E08, CFSTR("PosterKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRComplicationGalleryViewController setTitle:](self, "setTitle:", v8);

  objc_initWeak(&location, self);
  v9 = (void *)MEMORY[0x1E0DC35C8];
  v10 = objc_opt_class();
  v11 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __50__PRComplicationGalleryViewController_viewDidLoad__block_invoke;
  v35[3] = &unk_1E2183B40;
  objc_copyWeak(&v36, &location);
  objc_msgSend(v9, "registrationWithCellClass:configurationHandler:", v10, v35);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRComplicationGalleryView collectionView](self->_complicationGalleryView, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", self);
  v14 = (void *)MEMORY[0x1E0DC35C8];
  v15 = objc_opt_class();
  v33[0] = v11;
  v33[1] = 3221225472;
  v33[2] = __50__PRComplicationGalleryViewController_viewDidLoad__block_invoke_2;
  v33[3] = &unk_1E2183D38;
  v16 = v13;
  v34 = v16;
  objc_msgSend(v14, "registrationWithCellClass:configurationHandler:", v15, v33);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x1E0DC35E8]);
  v26 = v11;
  v27 = 3221225472;
  v28 = __50__PRComplicationGalleryViewController_viewDidLoad__block_invoke_4;
  v29 = &unk_1E2183D60;
  v19 = v16;
  v30 = v19;
  v20 = v17;
  v31 = v20;
  v21 = v12;
  v32 = v21;
  v22 = (UICollectionViewDiffableDataSource *)objc_msgSend(v18, "initWithCollectionView:cellProvider:", v19, &v26);
  dataSource = self->_dataSource;
  self->_dataSource = v22;

  objc_msgSend(v19, "setContentInset:", 8.0, 0.0, 0.0, 0.0, v26, v27, v28, v29);
  v24 = self->_dataSource;
  -[PRComplicationGalleryViewController _buildSnapshot](self, "_buildSnapshot");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](v24, "applySnapshot:animatingDifferences:", v25, 0);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

}

void __50__PRComplicationGalleryViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_configureWidgetCell:forItem:atIndexPath:", v9, v7, v8);

}

void __50__PRComplicationGalleryViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "icon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = v9;
  objc_msgSend(v10, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:", v12);

  objc_msgSend(v11, "applicationBundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(v9, "iconImageApplicationBundleIdentifier");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  +[PRComplicationGalleryApplicationTitleView iconImageSize](PRComplicationGalleryApplicationTitleView, "iconImageSize");
  v19 = v18;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __50__PRComplicationGalleryViewController_viewDidLoad__block_invoke_3;
  v22[3] = &unk_1E2183BF8;
  v23 = *(id *)(a1 + 32);
  v24 = v7;
  v25 = v8;
  v20 = v8;
  v21 = v7;
  +[PRComplicationGalleryIconProvider loadIconImageForApplicationBundleIdentifier:atWidth:completion:](PRComplicationGalleryIconProvider, "loadIconImageForApplicationBundleIdentifier:atWidth:completion:", v17, v22, v19);
  objc_msgSend(v21, "setSeparatorVisible:", objc_msgSend(v20, "item") != objc_msgSend(*(id *)(a1 + 32), "numberOfItemsInSection:", objc_msgSend(v20, "section"))- 1);

}

void __50__PRComplicationGalleryViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "indexPathForCell:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 48));

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "titleView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIconImage:", v6);

  }
}

id __50__PRComplicationGalleryViewController_viewDidLoad__block_invoke_4(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  v9 = v7;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  objc_msgSend(v11, "applicationWidgetCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)a1[4];
  if (v12)
  {
    v14 = a1[5];
    objc_msgSend(v11, "applicationWidgetCollection");
  }
  else
  {
    v14 = a1[6];
    objc_msgSend(v11, "widgetItem");
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", v14, v6, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)setApplicationWidgetCollections:(id)a3
{
  UICollectionViewDiffableDataSource *dataSource;
  void *v6;
  id v7;

  v7 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_applicationWidgetCollections, a3);
    dataSource = self->_dataSource;
    -[PRComplicationGalleryViewController _buildSnapshot](self, "_buildSnapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](dataSource, "applySnapshot:animatingDifferences:", v6, 0);

  }
}

- (id)_buildSnapshot
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  if (-[NSArray count](self->_suggestionSets, "count"))
  {
    -[NSArray bs_map:](self->_suggestionSets, "bs_map:", &__block_literal_global_38_0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bs_flatten");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__PRComplicationGalleryViewController__buildSnapshot__block_invoke_2;
    v11[3] = &unk_1E2183DA8;
    v11[4] = self;
    objc_msgSend(v5, "bs_map:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = CFSTR("PRComplicationSuggestionsSectionIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendSectionsWithIdentifiers:", v7);

    objc_msgSend(v3, "appendItemsWithIdentifiers:", v6);
  }
  -[NSArray bs_map:](self->_applicationWidgetCollections, "bs_map:", &__block_literal_global_42);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("PRComplicationApplicationsSectionIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v9);

  objc_msgSend(v3, "appendItemsWithIdentifiers:", v8);
  return v3;
}

uint64_t __53__PRComplicationGalleryViewController__buildSnapshot__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "descriptors");
}

uint64_t __53__PRComplicationGalleryViewController__buildSnapshot__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_galleryItemForComplicationDescriptor:iconImageHidden:", a2, 0);
}

PRComplicationGalleryItem *__53__PRComplicationGalleryViewController__buildSnapshot__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  PRComplicationGalleryItem *v3;

  v2 = a2;
  v3 = -[PRComplicationGalleryItem initWithApplicationWidgetCollection:]([PRComplicationGalleryItem alloc], "initWithApplicationWidgetCollection:", v2);

  return v3;
}

- (id)_galleryItemForComplicationDescriptor:(id)a3 iconImageHidden:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  PRComplicationDescriptor *v7;
  void *v8;
  void *v9;
  PRComplicationDescriptor *v10;
  void *v11;
  PRComplicationGalleryWidgetItem *v12;
  void *v13;
  void *v14;
  void *v15;
  PRComplicationGalleryWidgetItem *v16;
  PRComplicationGalleryItem *v17;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "widget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [PRComplicationDescriptor alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PRComplicationDescriptor initWithUniqueIdentifier:widget:](v7, "initWithUniqueIdentifier:widget:", v9, v6);

  objc_msgSend(v5, "suggestedComplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRComplicationDescriptor setSuggestedComplication:](v10, "setSuggestedComplication:", v11);
  v12 = [PRComplicationGalleryWidgetItem alloc];
  PRSharedWidgetDescriptorProvider();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "descriptorForPersonality:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PRComplicationGalleryWidgetItem initWithDisplayName:selected:iconImageHidden:descriptor:](v12, "initWithDisplayName:selected:iconImageHidden:descriptor:", v15, 0, v4, v10);

  v17 = -[PRComplicationGalleryItem initWithWidgetItem:]([PRComplicationGalleryItem alloc], "initWithWidgetItem:", v16);
  return v17;
}

- (id)_galleryItemsForWidgetDescriptors:(id)a3 iconImageHidden:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v13, "supportedFamilies", (_QWORD)v18) & 0x400) != 0)
        {
          -[PRComplicationGalleryViewController _galleryItemForWidgetDescriptor:family:iconImageHidden:](self, "_galleryItemForWidgetDescriptor:family:iconImageHidden:", v13, 10, v4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
        if ((objc_msgSend(v13, "supportedFamilies") & 0x800) != 0)
        {
          -[PRComplicationGalleryViewController _galleryItemForWidgetDescriptor:family:iconImageHidden:](self, "_galleryItemForWidgetDescriptor:family:iconImageHidden:", v13, 11, v4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_msgSend(v7, "copy");
  return v16;
}

- (id)_galleryItemForWidgetDescriptor:(id)a3 family:(int64_t)a4 iconImageHidden:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  PRComplicationDescriptor *v9;
  void *v10;
  void *v11;
  PRComplicationDescriptor *v12;
  PRComplicationGalleryWidgetItem *v13;
  void *v14;
  PRComplicationGalleryWidgetItem *v15;
  PRComplicationGalleryItem *v16;

  v5 = a5;
  v7 = a3;
  objc_msgSend(v7, "widgetForFamily:intent:", a4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [PRComplicationDescriptor alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PRComplicationDescriptor initWithUniqueIdentifier:widget:](v9, "initWithUniqueIdentifier:widget:", v11, v8);

  v13 = [PRComplicationGalleryWidgetItem alloc];
  objc_msgSend(v7, "displayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[PRComplicationGalleryWidgetItem initWithDisplayName:selected:iconImageHidden:descriptor:](v13, "initWithDisplayName:selected:iconImageHidden:descriptor:", v14, 0, v5, v12);
  v16 = -[PRComplicationGalleryItem initWithWidgetItem:]([PRComplicationGalleryItem alloc], "initWithWidgetItem:", v15);

  return v16;
}

- (void)_configureWidgetCell:(id)a3 forItem:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;

  v8 = a3;
  v9 = a5;
  objc_msgSend(a4, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "widget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  PRSharedWidgetDescriptorProvider();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptorForPersonality:", v11);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x1E0DAA5A0]);
  -[PRComplicationGalleryViewController listLayoutProvider](self, "listLayoutProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRComplicationGalleryViewController iconViewProvider](self, "iconViewProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithGalleryItem:titleAndSubtitleVisible:listLayoutProvider:iconViewProvider:", v32, 0, v14, v15);

  objc_msgSend(v16, "setSelectedSizeClass:", objc_msgSend(v11, "family"));
  objc_msgSend(v16, "setDelegate:", self);
  objc_msgSend(v16, "setUsesAmbientScaleFactorForRemovableBackgroundItems:", 0);
  objc_msgSend(v16, "wrapperView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundType:", 0);

  objc_msgSend(v16, "wrapperView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCornerRadius:", PRWidgetPlatterCornerRadius());

  objc_msgSend(v8, "setWidgetWrapperViewController:", v16);
  +[PRWidgetMetricsProvider sharedInstance](PRWidgetMetricsProvider, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "systemMetricsForWidget:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRComplicationGalleryViewController traitCollection](self, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "displayScale");
  v23 = v22;

  objc_msgSend(v20, "_effectiveSizePixelAlignedForDisplayScale:", v23);
  objc_msgSend(v8, "setContentSize:");
  -[PRComplicationGalleryView collectionView](self->_complicationGalleryView, "collectionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "extensionIdentity");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "extensionBundleIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __80__PRComplicationGalleryViewController__configureWidgetCell_forItem_atIndexPath___block_invoke;
  v33[3] = &unk_1E2183BF8;
  v34 = v24;
  v35 = v8;
  v36 = v9;
  v27 = v9;
  v28 = v8;
  v29 = v24;
  +[PRComplicationGalleryIconProvider loadIconImageForExtensionBundleIdentifier:atWidth:completion:](PRComplicationGalleryIconProvider, "loadIconImageForExtensionBundleIdentifier:atWidth:completion:", v26, v33, 20.0);

  objc_msgSend(v16, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "superview");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRComplicationGalleryViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", v16, v31);

}

void __80__PRComplicationGalleryViewController__configureWidgetCell_forItem_atIndexPath___block_invoke(uint64_t a1, void *a2)
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
  void *v12;
  NSObject *v13;

  v5 = a3;
  objc_msgSend(a4, "widget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PRSharedWidgetDescriptorProvider();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptorForPersonality:", v6);
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
    objc_msgSend(v8, "defaultIntent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v6, "widgetByReplacingIntent:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setWidget:", v13);
    }
    else
    {
      PRLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[PRComplicationGalleryViewController _configureWidgetHostViewController:forWidgetDescriptor:].cold.1(v6);
    }

  }
  else
  {
    objc_msgSend(v5, "setWidget:", v6);
  }

}

- (void)_closeButtonTapped:(id)a3
{
  id WeakRetained;

  -[PRComplicationGalleryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "complicationGalleryViewControllerDidFinish:", self);

}

- (id)_descriptorFromWidgetIcon:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PRComplicationDescriptor *v12;
  void *v13;
  void *v14;
  PRComplicationDescriptor *v15;

  v3 = a3;
  objc_msgSend(v3, "activeWidget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gridSizeClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = PRWidgetFamilyForIconGridSizeClass(v5);
  v7 = objc_alloc(MEMORY[0x1E0D10148]);
  objc_msgSend(v4, "extensionBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:family:intent:", v8, v9, v10, v6, 0);

  v12 = [PRComplicationDescriptor alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PRComplicationDescriptor initWithUniqueIdentifier:widget:](v12, "initWithUniqueIdentifier:widget:", v14, v11);

  return v15;
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
  v7 = v6 != CFSTR("PRComplicationSuggestionsSectionIdentifier");

  return v7;
}

- (void)addWidgetSheetViewController:(id)a3 didSelectWidgetIconView:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  objc_msgSend(v12, "icon");
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

  v10 = v12;
  if (v9)
  {
    -[PRComplicationGalleryViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "complicationGalleryViewController:didSelectWidgetIconView:", self, v12);

    v10 = v12;
  }

}

- (void)addWidgetSheetViewControllerDidCancel:(id)a3
{
  void *v4;
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
  -[PRComplicationGalleryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PRComplicationGalleryView collectionView](self->_complicationGalleryView, "collectionView", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedItems");
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
        -[PRComplicationGalleryView collectionView](self->_complicationGalleryView, "collectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "deselectItemAtIndexPath:animated:", v10, 1);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;

  v17 = a3;
  v5 = a4;
  objc_msgSend(v17, "cellForItemAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v8 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  objc_msgSend(v10, "setSeparatorVisible:", 0);
  if (objc_msgSend(v5, "item") >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v5, "item") - 1, objc_msgSend(v5, "section"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cellForItemAtIndexPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    v14 = v12;
    if (v13)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
    v16 = v15;

    objc_msgSend(v16, "setSeparatorVisible:", 0);
  }

}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;

  v17 = a3;
  v5 = a4;
  objc_msgSend(v17, "cellForItemAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v8 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  objc_msgSend(v10, "setSeparatorVisible:", objc_msgSend(v5, "item") != objc_msgSend(v17, "numberOfItemsInSection:", objc_msgSend(v5, "section")) - 1);
  if (objc_msgSend(v5, "item") >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v5, "item") - 1, objc_msgSend(v5, "section"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cellForItemAtIndexPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    v14 = v12;
    if (v13)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
    v16 = v15;

    objc_msgSend(v16, "setSeparatorVisible:", 1);
  }

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  PRComplicationGalleryDetailViewController *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v10 = v8;
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  objc_msgSend(v12, "applicationWidgetCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v52 = v7;
    objc_msgSend(v6, "cellForItemAtIndexPath:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_class();
    v16 = v14;
    v53 = v6;
    if (v15)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
    }
    else
    {
      v17 = 0;
    }
    v18 = v17;

    -[SBIconListLayoutProvider layoutForIconLocation:](self->_listLayoutProvider, "layoutForIconLocation:", *MEMORY[0x1E0DAA9E8]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "iconImageInfo");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAA498]), "initWithName:iconImageInfo:", CFSTR("iconImages"), v21, v23, v25, v27);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "userInterfaceIdiom");

    v50 = (void *)v28;
    v31 = -[SBHAddWidgetSheetViewControllerBase initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:]([PRComplicationGalleryDetailViewController alloc], "initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:", self->_listLayoutProvider, self->_iconViewProvider, 3072, 256, v28, (v30 & 0xFFFFFFFFFFFFFFFBLL) == 1);
    objc_msgSend(v12, "applicationWidgetCollection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationGalleryDetailViewController setApplicationWidgetCollection:](v31, "setApplicationWidgetCollection:", v32);
    objc_msgSend(v32, "icon");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (!v33)
      v33 = v32;
    objc_msgSend(v33, "displayName");
    v35 = objc_claimAutoreleasedReturnValue();
    -[SBHAddWidgetSheetViewControllerBase setDelegate:](v31, "setDelegate:", self);
    v49 = (void *)v35;
    -[PRComplicationGalleryDetailViewController setAppName:](v31, "setAppName:", v35);
    v51 = v18;
    objc_msgSend(v18, "titleView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "iconImage");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationGalleryDetailViewController setIconImage:](v31, "setIconImage:", v37);

    -[PRComplicationGalleryDetailViewController presentationController](v31, "presentationController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_opt_class();
    v40 = v38;
    if (v39)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v41 = v40;
      else
        v41 = 0;
    }
    else
    {
      v41 = 0;
    }
    v42 = v41;

    objc_msgSend(MEMORY[0x1E0DC3C78], "customDetentWithIdentifier:resolver:", CFSTR("ComplicationGalleryDodge"), &__block_literal_global_59);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setDetents:", v44);

    objc_msgSend(v42, "setLargestUndimmedDetentIdentifier:", CFSTR("ComplicationGalleryDodge"));
    objc_msgSend(v42, "setPreferredCornerRadius:", PRSheetCornerRadius());
    objc_msgSend(v42, "dimmingView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "layer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setHitTestsAsOpaque:", 0);

    objc_msgSend(v42, "_confinedDimmingView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "layer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setHitTestsAsOpaque:", 0);

    objc_msgSend(v42, "setDelegate:", self);
    -[PRComplicationGalleryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v31, 1, 0);

    v7 = v52;
    v6 = v53;
  }

}

double __79__PRComplicationGalleryViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "maximumDetentValue");
  return v2 * 0.6;
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
    -[PRComplicationGalleryViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setManualScrollEdgeAppearanceProgress:", v7);
  }

}

- (void)presentationControllerWillDismiss:(id)a3
{
  void *v4;
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
  -[PRComplicationGalleryView collectionView](self->_complicationGalleryView, "collectionView", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedItems");
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
        -[PRComplicationGalleryView collectionView](self->_complicationGalleryView, "collectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "deselectItemAtIndexPath:animated:", v10, 1);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)didBeginDraggingWidgetIcon:(id)a3
{
  void *v4;
  id v5;

  -[PRComplicationGalleryViewController _descriptorFromWidgetIcon:](self, "_descriptorFromWidgetIcon:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PRComplicationGalleryViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "complicationGalleryViewController:didBeginDraggingComplication:", self, v5);

}

- (id)widgetIconForGalleryItem:(id)a3 sizeClass:(int64_t)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = objc_opt_class();
  v8 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  if (v10)
  {
    -[PRComplicationGalleryViewController widgetIconForDescriptor:sizeClass:](self, "widgetIconForDescriptor:sizeClass:", v10, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)widgetIconForDescriptor:(id)a3 sizeClass:(int64_t)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = (objc_class *)MEMORY[0x1E0DAA580];
  v6 = a3;
  v7 = [v5 alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "kind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensionIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "extensionBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensionIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "containerBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v7, "initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:", v9, v10, v12, v14);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA678]), "initWithWidget:", v15);
  PRIconGridSizeClassForWidgetFamily(a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setGridSizeClass:", v17);

  return v16;
}

- (id)widgetIconForDescriptors:(id)a3 sizeClass:(int64_t)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRComplicationGalleryViewController.m"), 511, CFSTR("We shouldn't be showing widget stacks in the lock screen widget gallery"));

  return 0;
}

- (id)backgroundViewMatchingMaterialBeneathWrapperViewController:(id)a3
{
  return 0;
}

- (void)iconTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "wrapperView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PRComplicationGalleryViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "complicationGalleryViewController:didSelectWidgetIconView:", self, v6);

  }
}

- (PRComplicationGalleryViewControllerDelegate)delegate
{
  return (PRComplicationGalleryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)applicationWidgetCollections
{
  return self->_applicationWidgetCollections;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (void)setListLayoutProvider:(id)a3
{
  objc_storeStrong((id *)&self->_listLayoutProvider, a3);
}

- (SBIconViewProviding)iconViewProvider
{
  return self->_iconViewProvider;
}

- (void)setIconViewProvider:(id)a3
{
  objc_storeStrong((id *)&self->_iconViewProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationWidgetCollections, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconViewProvider, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_widgetHostViewControllersPerReason, 0);
  objc_storeStrong((id *)&self->_suggestionSets, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_complicationGalleryView, 0);
}

void __127__PRComplicationGalleryViewController_initWithSuggestionSets_applicationWidgetCollections_listLayoutProvider_iconViewProvider___block_invoke_2_cold_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "widgetFamily");
  NSStringFromWidgetFamily();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_18B634000, v2, v3, "Suggested complication %@ does not support provided widget family %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)_configureWidgetHostViewController:(void *)a1 forWidgetDescriptor:.cold.1(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a1, "extensionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "kind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_18B634000, v3, v4, "Default intent asked for but not provided: %@ - %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_1();
}

@end
