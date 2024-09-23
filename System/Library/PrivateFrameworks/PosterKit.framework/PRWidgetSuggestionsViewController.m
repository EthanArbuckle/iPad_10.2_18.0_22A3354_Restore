@implementation PRWidgetSuggestionsViewController

- (PRWidgetSuggestionsViewController)initWithSuggestionSets:(id)a3 listLayoutProvider:(id)a4 iconViewProvider:(id)a5 widgetDragHandler:(id)a6 usingSidebarLayout:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PRWidgetSuggestionsViewController *v16;
  uint64_t v17;
  NSArray *suggestionSets;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PRWidgetSuggestionsViewController;
  v16 = -[PRWidgetSuggestionsViewController init](&v20, sel_init);
  if (v16)
  {
    objc_msgSend(v12, "bs_compactMap:", &__block_literal_global_2);
    v17 = objc_claimAutoreleasedReturnValue();
    suggestionSets = v16->_suggestionSets;
    v16->_suggestionSets = (NSArray *)v17;

    objc_storeStrong((id *)&v16->_listLayoutProvider, a4);
    objc_storeStrong((id *)&v16->_iconViewProvider, a5);
    objc_storeStrong((id *)&v16->_widgetDragHandler, a6);
    v16->_usingSidebarLayout = a7;
  }

  return v16;
}

PRComplicationSuggestionSet *__133__PRWidgetSuggestionsViewController_initWithSuggestionSets_listLayoutProvider_iconViewProvider_widgetDragHandler_usingSidebarLayout___block_invoke(uint64_t a1, void *a2)
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
    objc_msgSend(v5, "bs_compactMap:", &__block_literal_global_3_0);
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

PRComplicationDescriptor *__133__PRWidgetSuggestionsViewController_initWithSuggestionSets_listLayoutProvider_iconViewProvider_widgetDragHandler_usingSidebarLayout___block_invoke_2(uint64_t a1, void *a2)
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
      __133__PRWidgetSuggestionsViewController_initWithSuggestionSets_listLayoutProvider_iconViewProvider_widgetDragHandler_usingSidebarLayout___block_invoke_2_cold_2((uint64_t)v4, v2, v13);
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
  PRWidgetSuggestionsView *v3;
  PRWidgetSuggestionsView *widgetSuggestionsView;

  v3 = -[PRWidgetSuggestionsView initWithLayoutDelegate:usingSidebarLayout:]([PRWidgetSuggestionsView alloc], "initWithLayoutDelegate:usingSidebarLayout:", self, self->_usingSidebarLayout);
  widgetSuggestionsView = self->_widgetSuggestionsView;
  self->_widgetSuggestionsView = v3;

  -[PRWidgetSuggestionsViewController setView:](self, "setView:", self->_widgetSuggestionsView);
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  UICollectionViewDiffableDataSource *v11;
  UICollectionViewDiffableDataSource *dataSource;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id location;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0DC35C8];
  v4 = objc_opt_class();
  v5 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __48__PRWidgetSuggestionsViewController_viewDidLoad__block_invoke;
  v22[3] = &unk_1E2183B40;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v3, "registrationWithCellClass:configurationHandler:", v4, v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRWidgetSuggestionsView collectionView](self->_widgetSuggestionsView, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);
  v8 = objc_alloc(MEMORY[0x1E0DC35E8]);
  v19[0] = v5;
  v19[1] = 3221225472;
  v19[2] = __48__PRWidgetSuggestionsViewController_viewDidLoad__block_invoke_2;
  v19[3] = &unk_1E2183B68;
  v9 = v7;
  v20 = v9;
  v10 = v6;
  v21 = v10;
  v11 = (UICollectionViewDiffableDataSource *)objc_msgSend(v8, "initWithCollectionView:cellProvider:", v9, v19);
  dataSource = self->_dataSource;
  self->_dataSource = v11;

  v13 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  -[NSArray bs_map:](self->_suggestionSets, "bs_map:", &__block_literal_global_15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bs_flatten");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __48__PRWidgetSuggestionsViewController_viewDidLoad__block_invoke_4;
  v18[3] = &unk_1E2183BD0;
  v18[4] = self;
  objc_msgSend(v15, "bs_map:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = CFSTR("PRWidgetSuggestionsSectionIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendSectionsWithIdentifiers:", v17);

  objc_msgSend(v13, "appendItemsWithIdentifiers:", v16);
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v13, 0);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __48__PRWidgetSuggestionsViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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

id __48__PRWidgetSuggestionsViewController_viewDidLoad__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class();
  v9 = v6;
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

  objc_msgSend(*(id *)(a1 + 32), "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *(_QWORD *)(a1 + 40), v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __48__PRWidgetSuggestionsViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "descriptors");
}

uint64_t __48__PRWidgetSuggestionsViewController_viewDidLoad__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_galleryItemForComplicationDescriptor:iconImageHidden:", a2, 0);
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
  -[PRWidgetSuggestionsViewController listLayoutProvider](self, "listLayoutProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRWidgetSuggestionsViewController iconViewProvider](self, "iconViewProvider");
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

  -[PRWidgetSuggestionsViewController traitCollection](self, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "displayScale");
  v23 = v22;

  objc_msgSend(v20, "_effectiveSizePixelAlignedForDisplayScale:", v23);
  objc_msgSend(v8, "setContentSize:");
  -[PRWidgetSuggestionsView collectionView](self->_widgetSuggestionsView, "collectionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "extensionIdentity");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "extensionBundleIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __78__PRWidgetSuggestionsViewController__configureWidgetCell_forItem_atIndexPath___block_invoke;
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
  -[PRWidgetSuggestionsViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", v16, v31);

}

void __78__PRWidgetSuggestionsViewController__configureWidgetCell_forItem_atIndexPath___block_invoke(uint64_t a1, void *a2)
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

- (id)complicationDescriptorForItemAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SBHWidgetDragHandling)widgetDragHandler
{
  return self->_widgetDragHandler;
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
    -[PRWidgetSuggestionsViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "widgetSuggestionsViewController:didSelectWidgetIconView:", self, v6);

  }
}

- (PRWidgetSuggestionsViewControllerDelegate)delegate
{
  return (PRWidgetSuggestionsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PRWidgetSuggestionsView)widgetSuggestionsView
{
  return self->_widgetSuggestionsView;
}

- (void)setWidgetSuggestionsView:(id)a3
{
  objc_storeStrong((id *)&self->_widgetSuggestionsView, a3);
}

- (NSArray)suggestionSets
{
  return self->_suggestionSets;
}

- (void)setSuggestionSets:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionSets, a3);
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
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

- (BOOL)usingSidebarLayout
{
  return self->_usingSidebarLayout;
}

- (void)setUsingSidebarLayout:(BOOL)a3
{
  self->_usingSidebarLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconViewProvider, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_suggestionSets, 0);
  objc_storeStrong((id *)&self->_widgetSuggestionsView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_widgetDragHandler, 0);
}

void __133__PRWidgetSuggestionsViewController_initWithSuggestionSets_listLayoutProvider_iconViewProvider_widgetDragHandler_usingSidebarLayout___block_invoke_2_cold_1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = 0;
  _os_log_error_impl(&dword_18B634000, log, OS_LOG_TYPE_ERROR, "Suggested complication %@ not found in set of descriptors", (uint8_t *)&v1, 0xCu);
}

void __133__PRWidgetSuggestionsViewController_initWithSuggestionSets_listLayoutProvider_iconViewProvider_widgetDragHandler_usingSidebarLayout___block_invoke_2_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "widgetFamily");
  NSStringFromWidgetFamily();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_18B634000, a3, OS_LOG_TYPE_ERROR, "Suggested complication %@ does not support provided widget family %@", (uint8_t *)&v6, 0x16u);

}

@end
