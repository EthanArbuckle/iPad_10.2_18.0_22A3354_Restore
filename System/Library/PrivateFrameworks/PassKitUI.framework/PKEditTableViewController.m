@implementation PKEditTableViewController

- (PKEditTableViewController)initWithStyle:(int64_t)a3 placeholders:(id)a4 isForWatch:(BOOL)a5
{
  id v8;
  PKEditTableViewController *v9;
  PKEditTableViewController *v10;
  NSCache *v11;
  NSCache *imageCache;
  id v13;
  void *v14;
  NSString *v15;
  _BOOL4 IsAccessibilityCategory;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queueCaching;
  NSMutableArray *v20;
  NSMutableArray *lowPriorityRequests;
  NSMutableArray *v22;
  NSMutableArray *highPriorityRequests;
  uint64_t v24;
  NSMutableArray *lastSnapshotDurations;
  CGFloat v26;
  CGFloat v27;
  objc_super v29;

  v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PKEditTableViewController;
  v9 = -[PKEditTableViewController initWithStyle:](&v29, sel_initWithStyle_, a3);
  v10 = v9;
  if (v9)
  {
    v9->_imagesToKeep = 200;
    v11 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    imageCache = v10->_imageCache;
    v10->_imageCache = v11;

    -[NSCache setCountLimit:](v10->_imageCache, "setCountLimit:", v10->_imagesToKeep);
    if (v8)
      v13 = (id)objc_msgSend(v8, "mutableCopy");
    else
      v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = v13;
    objc_storeStrong((id *)&v10->_placeholdersPerPassStyle, v13);

    objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v15);

    if (IsAccessibilityCategory)
      v10->_isAccessibilityCategory = 1;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.passkitui.edit-table-caching", v17);
    queueCaching = v10->_queueCaching;
    v10->_queueCaching = (OS_dispatch_queue *)v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    lowPriorityRequests = v10->_lowPriorityRequests;
    v10->_lowPriorityRequests = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    highPriorityRequests = v10->_highPriorityRequests;
    v10->_highPriorityRequests = v22;

    v10->_shouldProcessLowPriorityRequests = 1;
    v10->_shouldProcessHighPriorityRequests = 1;
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
    lastSnapshotDurations = v10->_lastSnapshotDurations;
    v10->_lastSnapshotDurations = (NSMutableArray *)v24;

    v10->_isForWatch = a5;
    +[PKEditPassesTableViewCell imageSizeNeeded](PKEditPassesTableViewCell, "imageSizeNeeded");
    v10->_imageSizeNeeded.width = v26;
    v10->_imageSizeNeeded.height = v27;
    v10->_needsFullPass = +[PKEditPassesTableViewCell needsFullPassImage](PKEditPassesTableViewCell, "needsFullPassImage");
    v10->_performanceTest = 0;
    v10->_testIteration = 0;
    objc_storeWeak((id *)&v10->_cachingDelegate, 0);

  }
  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  double v6;
  UITableView *v7;
  UITableView *tableView;
  UITableView *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKEditTableViewController;
  -[PKEditTableViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[PKEditTableViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  +[PKEditPassesTableViewCell height](PKEditPassesTableViewCell, "height");
  self->_visibleRows = vcvtpd_u64_f64(v5 / v6);

  -[PKEditTableViewController tableView](self, "tableView");
  v7 = (UITableView *)objc_claimAutoreleasedReturnValue();
  tableView = self->_tableView;
  self->_tableView = v7;

  -[UITableView setPrefetchDataSource:](self->_tableView, "setPrefetchDataSource:", self);
  v9 = self->_tableView;
  +[PKEditPassesTableViewCell height](PKEditPassesTableViewCell, "height");
  -[UITableView setEstimatedRowHeight:](v9, "setEstimatedRowHeight:");
  -[UITableView setRowHeight:](self->_tableView, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  -[UITableView setAllowsSelection:](self->_tableView, "setAllowsSelection:", 1);
  -[UITableView setAllowsSelectionDuringEditing:](self->_tableView, "setAllowsSelectionDuringEditing:", 1);
  -[UITableView setSeparatorStyle:](self->_tableView, "setSeparatorStyle:", 1);
  -[PKEditTableViewController setEditing:](self, "setEditing:", 1);
}

+ (void)loadPlaceholdersWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    if (_MergedGlobals_3_12 != -1)
      dispatch_once(&_MergedGlobals_3_12, &__block_literal_global_167);
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = qword_1EE4F9410;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__PKEditTableViewController_loadPlaceholdersWithCompletion___block_invoke_2;
    block[3] = &unk_1E3E6F560;
    v11 = a1;
    v9 = v5;
    v10 = v4;
    v7 = v5;
    dispatch_async(v6, block);

  }
}

void __60__PKEditTableViewController_loadPlaceholdersWithCompletion___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.passkitui.edit-table-placeholder", v2);
  v1 = (void *)qword_1EE4F9410;
  qword_1EE4F9410 = (uint64_t)v0;

}

void __60__PKEditTableViewController_loadPlaceholdersWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t i;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  for (i = 0; i != 12; ++i)
  {
    objc_msgSend(*(id *)(a1 + 48), "_generatePlaceholderImageForStyle:", i);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v3, v5);

  }
  v6 = *(_QWORD *)(a1 + 40);
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);

}

+ (id)_generatePlaceholderImageForStyle:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  long double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  long double v26;
  long double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  id v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v56;
  double v57;
  double v58;
  _QWORD v59[4];
  id v60;
  double v61;
  double v62;
  _QWORD v63[4];
  id v64;
  long double v65;
  double v66;
  double v67;

  +[PKEditPassesTableViewCell imageSizeNeeded](PKEditPassesTableViewCell, "imageSizeNeeded");
  v4 = v3;
  v6 = v5;
  v7 = +[PKEditPassesTableViewCell needsFullPassImage](PKEditPassesTableViewCell, "needsFullPassImage");
  if (v7)
    v8 = v6;
  else
    v8 = 1.79769313e308;
  if (v7)
    v6 = 1.79769313e308;
  PKPassFrontFaceContentSize();
  v10 = v9;
  v12 = v11;
  v13 = PKPassFaceShadowInsets();
  v14 = UIEdgeInsetsForPKEdgeInsets(v13);
  v17 = v10 + v15 + v16;
  v19 = v12;
  v20 = v12 + v14 + v18;
  v21 = fmin(v4 / v10, v8 / v19);
  PKSizeCeilToPixel();
  v57 = v22;
  v58 = v23;
  v56 = fmin(v23, v6);
  objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1A1AE621C]();
  v26 = log(v21);
  v27 = exp(v26 * 0.15 + 0.0);
  PKSizeCeilToPixel();
  v29 = v28;
  v31 = v30;
  PKPassGrayPlaceholderImage();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_alloc(MEMORY[0x1E0DC3828]);
  v34 = *MEMORY[0x1E0C9D538];
  v35 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v36 = (void *)objc_msgSend(v33, "initWithBounds:format:", v24, *MEMORY[0x1E0C9D538], v35, v29, v31);
  v37 = MEMORY[0x1E0C809B0];
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __PKEditPassesResizedPlaceholderImage_block_invoke;
  v63[3] = &unk_1E3E741B8;
  v64 = v32;
  v65 = v27;
  v66 = v17;
  v67 = v20;
  v38 = v32;
  objc_msgSend(v36, "imageWithActions:", v63);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v25);
  v40 = (void *)MEMORY[0x1A1AE621C]();
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithBounds:format:", v24, v34, v35, v57, v56);
  v59[0] = v37;
  v59[1] = 3221225472;
  v59[2] = __PKEditPassesResizedPlaceholderImage_block_invoke_2;
  v59[3] = &unk_1E3E741E0;
  v42 = v39;
  v60 = v42;
  v61 = v57;
  v62 = v58;
  objc_msgSend(v41, "imageWithActions:", v59);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v40);
  PKFloatRoundToPixel();
  v45 = v44;
  PKFloatRoundToPixel();
  v47 = v46;
  PKFloatRoundToPixel();
  v49 = v48;
  PKFloatRoundToPixel();
  v51 = v58 - v47 - v50;
  v52 = fmax(v51 - (v58 - v56), 0.0);
  if (v58 <= v56)
    v53 = v51;
  else
    v53 = v52;
  objc_msgSend(v43, "imageWithAlignmentRectInsets:", v47, v45, v53, v57 - v45 - v49);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  return v54;
}

- (void)_placeholderImageForStyle:(int64_t)a3 completion:(id)a4
{
  NSMutableDictionary *placeholdersPerPassStyle;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  void (**v11)(id, void *);

  v11 = (void (**)(id, void *))a4;
  placeholdersPerPassStyle = self->_placeholdersPerPassStyle;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](placeholdersPerPassStyle, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend((id)objc_opt_class(), "_generatePlaceholderImageForStyle:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_placeholdersPerPassStyle;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v8, v10);

  }
  v11[2](v11, v8);

}

- (NSDictionary)placeholders
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_placeholdersPerPassStyle, "copy");
}

- (void)setPlaceholders:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *placeholdersPerPassStyle;

  v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  placeholdersPerPassStyle = self->_placeholdersPerPassStyle;
  self->_placeholdersPerPassStyle = v4;

}

- (unint64_t)visibleRowsCount
{
  return self->_visibleRows;
}

- (void)loadContentAndImageSetFromExistingPassForPass:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(v9, "isContentLoaded") & 1) == 0)
  {
    -[PKEditTableViewController existingGroupsController](self, "existingGroupsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "passWithUniqueID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isContentLoaded"))
    {
      objc_msgSend(v6, "content");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setContent:", v7);

      if ((objc_msgSend(v9, "isImageSetLoaded:", 0) & 1) == 0)
      {
        if (objc_msgSend(v6, "isImageSetLoaded:", 0))
        {
          objc_msgSend(v6, "imageSetLoadedIfNeeded:", 0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setImageSet:forImageSetType:", v8, 0);

        }
      }
    }

  }
}

- (void)imageForPass:(id)a3 stacked:(BOOL)a4 synchronously:(BOOL)a5 placeholder:(id)a6 completion:(id)a7
{
  -[PKEditTableViewController _imageOfSize:forPass:fullPass:stacked:synchronously:preemptive:placeholder:completion:](self, "_imageOfSize:forPass:fullPass:stacked:synchronously:preemptive:placeholder:completion:", a3, self->_needsFullPass, a4, a5, 0, a6, self->_imageSizeNeeded.width, self->_imageSizeNeeded.height, a7);
}

- (void)preemptivelyCacheImagesForPass:(id)a3 stacked:(BOOL)a4
{
  -[PKEditTableViewController _imageOfSize:forPass:fullPass:stacked:synchronously:preemptive:placeholder:completion:](self, "_imageOfSize:forPass:fullPass:stacked:synchronously:preemptive:placeholder:completion:", a3, self->_needsFullPass, a4, 0, 1, 0, self->_imageSizeNeeded.width, self->_imageSizeNeeded.height, 0);
}

- (void)showNoPassesView:(BOOL)a3
{
  PKEditTableNoPassesView *noPassesView;
  double v5;
  double v6;
  double v7;
  double v8;
  PKEditTableNoPassesView *v9;
  PKEditTableNoPassesView *v10;
  PKEditTableNoPassesView *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  PKEditTableNoPassesView *v18;
  UITableView *tableView;
  id v20;

  self->_shouldShowNoPassesView = a3;
  noPassesView = self->_noPassesView;
  if (a3)
  {
    if (noPassesView)
    {
      v5 = *MEMORY[0x1E0C9D648];
      v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    else
    {
      v9 = [PKEditTableNoPassesView alloc];
      v5 = *MEMORY[0x1E0C9D648];
      v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v10 = -[PKEditTableNoPassesView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
      v11 = self->_noPassesView;
      self->_noPassesView = v10;

      -[PKEditTableNoPassesView setDelegate:](self->_noPassesView, "setDelegate:", self);
      -[PKEditTableViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", self->_noPassesView);

      -[PKEditTableViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v15 = v14;
      v17 = v16;

      -[PKEditTableNoPassesView sizeThatFits:](self->_noPassesView, "sizeThatFits:", v15 + -16.0, v17 + -16.0);
      v18 = self->_noPassesView;
      PKSizeAlignedInRect();
      -[PKEditTableNoPassesView setFrame:](v18, "setFrame:");
      noPassesView = self->_noPassesView;
    }
    -[PKEditTableNoPassesView setHidden:](noPassesView, "setHidden:", 0);
    tableView = self->_tableView;
    v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v5, v6, v7, v8);
    -[UITableView setTableFooterView:](tableView, "setTableFooterView:", v20);

  }
  else
  {
    if (noPassesView)
      -[PKEditTableNoPassesView setHidden:](noPassesView, "setHidden:", 1);
    -[UITableView setTableFooterView:](self->_tableView, "setTableFooterView:", 0);
  }
}

- (id)mostRecentPassInGroup:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "passes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (v7)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "ingestedDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "ingestedDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "compare:", v12);

          if (v13 != -1)
            continue;
        }
        v14 = v10;

        v7 = v14;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_imageOfSize:(CGSize)a3 forPass:(id)a4 fullPass:(BOOL)a5 stacked:(BOOL)a6 synchronously:(BOOL)a7 preemptive:(BOOL)a8 placeholder:(id)a9 completion:(id)a10
{
  _BOOL4 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  double height;
  double width;
  id v17;
  id v18;
  id v19;
  void *v20;
  __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  PKEditPendingCacheRequest *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  _QWORD v30[4];
  id v31;
  _QWORD block[4];
  id v33;
  PKEditPendingCacheRequest *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  void *v38;
  PKEditTableViewController *v39;
  id v40;
  id v41;
  uint64_t *v42;
  double v43;
  double v44;
  BOOL v45;
  BOOL v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _QWORD v53[3];

  v29 = a8;
  v11 = a7;
  v12 = a6;
  v13 = a5;
  height = a3.height;
  width = a3.width;
  v53[1] = *MEMORY[0x1E0C80C00];
  v17 = a4;
  v18 = a9;
  v19 = a10;
  objc_msgSend(v17, "uniqueID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v21 = CFSTR("stack_");
  else
    v21 = CFSTR("single_");
  -[__CFString stringByAppendingString:](v21, "stringByAppendingString:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[NSCache objectForKey:](self->_imageCache, "objectForKey:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v19 && v23)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __115__PKEditTableViewController__imageOfSize_forPass_fullPass_stacked_synchronously_preemptive_placeholder_completion___block_invoke_2;
      block[3] = &unk_1E3E618A0;
      v34 = (PKEditPendingCacheRequest *)v19;
      v33 = v24;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      v25 = v34;
    }
    else
    {
      if (v23)
      {
LABEL_19:

        goto LABEL_20;
      }
      if (v18)
      {
        v26 = objc_msgSend(v17, "style");
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __115__PKEditTableViewController__imageOfSize_forPass_fullPass_stacked_synchronously_preemptive_placeholder_completion___block_invoke_3;
        v30[3] = &unk_1E3E74140;
        v31 = v18;
        -[PKEditTableViewController _placeholderImageForStyle:completion:](self, "_placeholderImageForStyle:completion:", v26, v30);

      }
      v25 = objc_alloc_init(PKEditPendingCacheRequest);
      -[PKEditPendingCacheRequest setStacked:](v25, "setStacked:", v12);
      -[PKEditPendingCacheRequest setCacheKey:](v25, "setCacheKey:", v22);
      -[PKEditPendingCacheRequest setPass:](v25, "setPass:", v17);
      if (v19)
      {
        v28 = (void *)objc_msgSend(v19, "copy");
        v53[0] = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKEditPendingCacheRequest setCompletionHandlers:](v25, "setCompletionHandlers:", v27);

      }
      else
      {
        -[PKEditPendingCacheRequest setCompletionHandlers:](v25, "setCompletionHandlers:", MEMORY[0x1E0C9AA60]);
      }
      -[PKEditPendingCacheRequest setImageSize:](v25, "setImageSize:", width, height);
      -[PKEditPendingCacheRequest setFullPass:](v25, "setFullPass:", v13);
      -[PKEditPendingCacheRequest setPriority:](v25, "setPriority:", !v29);
      -[PKEditTableViewController processCacheRequest:](self, "processCacheRequest:", v25);
    }

    goto LABEL_19;
  }
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__44;
  v51 = __Block_byref_object_dispose__44;
  v52 = 0;
  v35 = MEMORY[0x1E0C809B0];
  v36 = 3221225472;
  v37 = __115__PKEditTableViewController__imageOfSize_forPass_fullPass_stacked_synchronously_preemptive_placeholder_completion___block_invoke;
  v38 = &unk_1E3E74118;
  v42 = &v47;
  v39 = self;
  v40 = v17;
  v43 = width;
  v44 = height;
  v41 = v22;
  v45 = v13;
  v46 = v12;
  PKTimeToPerformBlock();
  if (v19)
    (*((void (**)(id, uint64_t))v19 + 2))(v19, v48[5]);

  _Block_object_dispose(&v47, 8);
LABEL_20:

}

void __115__PKEditTableViewController__imageOfSize_forPass_fullPass_stacked_synchronously_preemptive_placeholder_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_createImageForPass:imageSize:cacheKey:fullPass:stacked:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 80), *(unsigned __int8 *)(a1 + 81), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __115__PKEditTableViewController__imageOfSize_forPass_fullPass_stacked_synchronously_preemptive_placeholder_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0.0);
}

void __115__PKEditTableViewController__imageOfSize_forPass_fullPass_stacked_synchronously_preemptive_placeholder_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __115__PKEditTableViewController__imageOfSize_forPass_fullPass_stacked_synchronously_preemptive_placeholder_completion___block_invoke_4;
  v6[3] = &unk_1E3E618A0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __115__PKEditTableViewController__imageOfSize_forPass_fullPass_stacked_synchronously_preemptive_placeholder_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)processCacheRequest:(id)a3
{
  id v4;
  NSObject *queueCaching;
  id v6;
  _QWORD v7[4];
  id v8;
  PKEditTableViewController *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queueCaching = self->_queueCaching;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__PKEditTableViewController_processCacheRequest___block_invoke;
  v7[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v10, &location);
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queueCaching, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __49__PKEditTableViewController_processCacheRequest___block_invoke(uint64_t a1)
{
  char *WeakRetained;
  char *v3;
  id *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void (**v9)(void *, _QWORD, void *, uint64_t);
  uint64_t v10;
  uint64_t *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  char *v15;
  void (**v16)(void *, _QWORD, void *, uint64_t);
  uint64_t v17;
  _QWORD aBlock[5];

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_3;
  objc_msgSend(WeakRetained, "triageCacheRequest:", *(_QWORD *)(a1 + 32));
  if (*((_QWORD *)v3 + 138) || !v3[1112])
    goto LABEL_3;
  v4 = (id *)(v3 + 1120);
  objc_msgSend(*((id *)v3 + 140), "lastObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
LABEL_7:
    objc_msgSend(*v4, "removeLastObject");
    goto LABEL_8;
  }
  if (v3[1128])
  {
    v4 = (id *)(v3 + 1136);
    objc_msgSend(*((id *)v3 + 142), "lastObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_7;
  }
  else
  {
    v6 = 0;
  }
LABEL_8:
  v7 = (void *)*((_QWORD *)v3 + 138);
  *((_QWORD *)v3 + 138) = v6;

  if (*((_QWORD *)v3 + 138))
  {
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__PKEditTableViewController_processCacheRequest___block_invoke_2;
    aBlock[3] = &unk_1E3E74168;
    aBlock[4] = *(_QWORD *)(a1 + 40);
    v9 = (void (**)(void *, _QWORD, void *, uint64_t))_Block_copy(aBlock);
    if (v3[1128])
    {
      v10 = 1;
    }
    else
    {
      v11 = (uint64_t *)&framesToSkipForSlowDevices;
      if (*(double *)(*(_QWORD *)(a1 + 40) + 1168) <= 0.034)
        v11 = (uint64_t *)&framesToSkipForPerformantDevices;
      v10 = *v11;
    }
    objc_msgSend(*((id *)v3 + 138), "pass");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isContentLoaded") && objc_msgSend(v12, "isImageSetLoaded:", 0))
    {
      v9[2](v9, *((_QWORD *)v3 + 138), v12, v10);
    }
    else
    {
      v13[0] = v8;
      v13[1] = 3221225472;
      v13[2] = __49__PKEditTableViewController_processCacheRequest___block_invoke_5;
      v13[3] = &unk_1E3E64370;
      v14 = v12;
      v16 = v9;
      v15 = v3;
      v17 = v10;
      objc_msgSend(v14, "loadContentAsyncWithCompletion:", v13);

    }
  }
LABEL_3:

}

void __49__PKEditTableViewController_processCacheRequest___block_invoke_2(uint64_t a1, void *a2, void *a3, unint64_t a4)
{
  id v7;
  id v8;
  dispatch_time_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v7 = a2;
  v8 = a3;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v9 = dispatch_time(0, (uint64_t)((double)a4 * 17.0 * 1000000.0));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__PKEditTableViewController_processCacheRequest___block_invoke_3;
  v12[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v15, &location);
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_after(v9, MEMORY[0x1E0C80D38], v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __49__PKEditTableViewController_processCacheRequest___block_invoke_3(id *a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;
  int v6;
  id *v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(WeakRetained + 151);
    if (v4
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(a1[4], "uniqueID"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v4, "passExistsWithUniqueIdentifier:", v5),
          v5,
          !v6))
    {
      objc_msgSend(v3, "currentCacheRequestCompletedWithImage:duration:", 0, 0.0);
    }
    else
    {
      v9 = 0;
      v10 = &v9;
      v11 = 0x3032000000;
      v12 = __Block_byref_object_copy__44;
      v13 = __Block_byref_object_dispose__44;
      v14 = 0;
      v7 = v3;
      v8 = a1[5];
      PKTimeToPerformBlock();
      objc_msgSend(v7, "currentCacheRequestCompletedWithImage:duration:", v10[5]);

      _Block_object_dispose(&v9, 8);
    }

  }
}

void __49__PKEditTableViewController_processCacheRequest___block_invoke_4(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pass");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "imageSize");
  v4 = v3;
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 40), "cacheKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_createImageForPass:imageSize:cacheKey:fullPass:stacked:", v11, v7, objc_msgSend(*(id *)(a1 + 40), "fullPass"), objc_msgSend(*(id *)(a1 + 40), "stacked"), v4, v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __49__PKEditTableViewController_processCacheRequest___block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__PKEditTableViewController_processCacheRequest___block_invoke_6;
  v5[3] = &unk_1E3E74190;
  v8 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v7 = v3;
  v9 = v4;
  objc_msgSend(v2, "loadImageSetAsync:preheat:withCompletion:", 0, 1, v5);

}

uint64_t __49__PKEditTableViewController_processCacheRequest___block_invoke_6(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], *(_QWORD *)(a1[4] + 1104), a1[5], a1[7]);
}

- (void)currentCacheRequestCompletedWithImage:(id)a3 duration:(double)a4
{
  id v6;
  NSObject *queueCaching;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  queueCaching = self->_queueCaching;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__PKEditTableViewController_currentCacheRequestCompletedWithImage_duration___block_invoke;
  v9[3] = &unk_1E3E671C0;
  objc_copyWeak(v11, &location);
  v10 = v6;
  v11[1] = *(id *)&a4;
  v8 = v6;
  dispatch_async(queueCaching, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __76__PKEditTableViewController_currentCacheRequestCompletedWithImage_duration___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*((id *)WeakRetained + 138), "completionHandlers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__PKEditTableViewController_currentCacheRequestCompletedWithImage_duration___block_invoke_2;
    block[3] = &unk_1E3E63480;
    v9 = v5;
    v10 = *(id *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 48);
    v6 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    if (*(_QWORD *)(a1 + 32))
      objc_msgSend(v3, "updateAverageSnapshotDuration:", *(double *)(a1 + 48));
    v7 = (void *)v3[138];
    v3[138] = 0;

    objc_msgSend(v3, "processCacheRequest:", 0);
  }

}

void __76__PKEditTableViewController_currentCacheRequestCompletedWithImage_duration___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if (v7)
          (*(void (**)(uint64_t, _QWORD, double))(v7 + 16))(v7, *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)triageCacheRequest:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *lowPriorityRequests;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *highPriorityRequests;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  if (!v4)
    goto LABEL_15;
  v19 = v4;
  v5 = -[NSMutableArray indexOfObject:](self->_lowPriorityRequests, "indexOfObject:", v4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v5;
    v10 = objc_msgSend(v19, "priority");
    v4 = v19;
    if (v10 != 1)
      goto LABEL_15;
    -[NSMutableArray objectAtIndex:](self->_lowPriorityRequests, "objectAtIndex:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_lowPriorityRequests, "removeObjectAtIndex:", v9);
    objc_msgSend(v19, "completionHandlers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "completionHandlers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCompletionHandlers:", v14);

    highPriorityRequests = self->_highPriorityRequests;
LABEL_11:
    -[NSMutableArray addObject:](highPriorityRequests, "addObject:", v19);

LABEL_14:
    v4 = v19;
    goto LABEL_15;
  }
  v6 = -[NSMutableArray indexOfObject:](self->_highPriorityRequests, "indexOfObject:", v19);
  v7 = objc_msgSend(v19, "priority");
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = v19;
    if (v7 != 1)
      goto LABEL_15;
    -[NSMutableArray objectAtIndex:](self->_highPriorityRequests, "objectAtIndex:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_highPriorityRequests, "removeObjectAtIndex:", v6);
    objc_msgSend(v19, "completionHandlers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "completionHandlers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCompletionHandlers:", v18);

    highPriorityRequests = self->_highPriorityRequests;
    goto LABEL_11;
  }
  if (v7 == 1)
  {
    lowPriorityRequests = self->_highPriorityRequests;
    goto LABEL_13;
  }
  v4 = v19;
  if (!v7)
  {
    lowPriorityRequests = self->_lowPriorityRequests;
LABEL_13:
    -[NSMutableArray addObject:](lowPriorityRequests, "addObject:", v19);
    goto LABEL_14;
  }
LABEL_15:

}

- (void)moveHighPriorityToLowPriorityWithCacheKey:(id)a3
{
  id v4;
  NSObject *queueCaching;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queueCaching = self->_queueCaching;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PKEditTableViewController_moveHighPriorityToLowPriorityWithCacheKey___block_invoke;
  block[3] = &unk_1E3E61B68;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queueCaching, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __71__PKEditTableViewController_moveHighPriorityToLowPriorityWithCacheKey___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  PKEditPendingCacheRequest *v4;
  uint64_t v5;
  void *v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v4 = objc_alloc_init(PKEditPendingCacheRequest);
    -[PKEditPendingCacheRequest setCacheKey:](v4, "setCacheKey:", *(_QWORD *)(a1 + 32));
    v5 = objc_msgSend(v7[140], "indexOfObject:", v4);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v7[140], "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7[140], "removeObject:", v6);
      objc_msgSend(v6, "setPriority:", 0);
      objc_msgSend(v7[142], "addObject:", v6);

    }
    v3 = v7;
  }

}

- (void)removeRequestsWithCacheKey:(id)a3
{
  id v4;
  NSObject *queueCaching;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queueCaching = self->_queueCaching;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PKEditTableViewController_removeRequestsWithCacheKey___block_invoke;
  block[3] = &unk_1E3E61B68;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queueCaching, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__PKEditTableViewController_removeRequestsWithCacheKey___block_invoke(uint64_t a1)
{
  PKEditPendingCacheRequest *v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = objc_alloc_init(PKEditPendingCacheRequest);
    -[PKEditPendingCacheRequest setCacheKey:](v2, "setCacheKey:", *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained[140], "removeObject:", v2);
    objc_msgSend(WeakRetained[142], "removeObject:", v2);

  }
}

- (void)updateAverageSnapshotDuration:(double)a3
{
  NSMutableArray *lastSnapshotDurations;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  float v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)-[NSMutableArray count](self->_lastSnapshotDurations, "count") >= 0xA)
    -[NSMutableArray removeObjectAtIndex:](self->_lastSnapshotDurations, "removeObjectAtIndex:", 0);
  lastSnapshotDurations = self->_lastSnapshotDurations;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](lastSnapshotDurations, "addObject:", v6);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_lastSnapshotDurations;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "floatValue", (_QWORD)v14);
        v11 = v11 + v13;
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 0.0;
  }

  self->_snapshotDurationAverage = v11
                                 / (double)(unint64_t)-[NSMutableArray count](self->_lastSnapshotDurations, "count");
}

- (id)_createImageForPass:(id)a3 imageSize:(CGSize)a4 cacheKey:(id)a5 fullPass:(BOOL)a6 stacked:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  double height;
  double width;
  id v13;
  id v14;
  void *v15;
  void *v16;
  PKPassView *v17;
  PKPassView *v18;
  double v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  id v38;
  CGImage *v39;
  CGImage *v40;
  void *v41;
  double v42;
  double v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  CGRect v48;

  v7 = a7;
  v8 = a6;
  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a5;
  v15 = v14;
  v16 = 0;
  if (v13)
  {
    if (v14)
    {
      -[NSCache objectForKey:](self->_imageCache, "objectForKey:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        v17 = [PKPassView alloc];
        if (v8)
        {
          v18 = -[PKPassView initWithPass:content:suppressedContent:](v17, "initWithPass:content:suppressedContent:", v13, 4, 375);
          -[PKPassView setUserInteractionEnabled:](v18, "setUserInteractionEnabled:", 0);
          -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v18, "snapshotOfFrontFaceWithRequestedSize:", width, height);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = -[PKPassView initWithPass:content:suppressedContent:](v17, "initWithPass:content:suppressedContent:", v13, 4, 4087);
          -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v18, "snapshotOfFrontFaceWithRequestedSize:", width, 3.40282347e38);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "size");
          if (v19 > height)
          {
            v20 = v16;
            objc_msgSend(v20, "alignmentRectInsets");
            v22 = v21;
            v24 = v23;
            v26 = v25;
            v28 = v27;
            objc_msgSend(v20, "size");
            v30 = v29;
            v32 = v31;
            objc_msgSend(v20, "scale");
            v34 = v30 * v33;
            v35 = v32 * v33;
            v36 = fmin(v32 * v33, height * v33);
            v37 = fmax(v26 - (v35 - v36), 0.0);
            v38 = objc_retainAutorelease(v20);
            v39 = (CGImage *)objc_msgSend(v38, "CGImage");
            v48.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
            v48.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
            v48.size.width = v34;
            v48.size.height = v36;
            v40 = CGImageCreateWithImageInRect(v39, v48);
            v41 = (void *)MEMORY[0x1E0DC3870];
            objc_msgSend(v38, "scale");
            v43 = v42;
            v44 = objc_msgSend(v38, "imageOrientation");

            objc_msgSend(v41, "imageWithCGImage:scale:orientation:", v40, v44, v43);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            CGImageRelease(v40);
            objc_msgSend(v45, "imageWithAlignmentRectInsets:", fmin(v22, v36), v24, v37, v28);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }

        if (v7)
        {
          -[PKEditTableViewController _createPassStackWithPassImage:withHeight:](self, "_createPassStackWithPassImage:withHeight:", v16, height);
          v46 = objc_claimAutoreleasedReturnValue();

          v16 = (void *)v46;
        }
        -[NSCache setObject:forKey:](self->_imageCache, "setObject:forKey:", v16, v15);
      }
    }
  }

  return v16;
}

- (id)_createPassStackWithPassImage:(id)a3 withHeight:(double)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  CGSize v25;

  v5 = a3;
  objc_msgSend(v5, "alignmentRectInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "size");
  v15 = v14;
  v17 = v16;
  v18 = fmin(v16, a4);
  v19 = fmin(v7, v18);
  v20 = fmax(v11 - (v16 - v18) + -4.0, 0.0);
  v21 = PKUIScreenScale();
  v25.width = v15;
  v25.height = v17;
  UIGraphicsBeginImageContextWithOptions(v25, 0, v21);
  objc_msgSend(v5, "drawAtPoint:", 0.0, 0.0);
  objc_msgSend(v5, "drawAtPoint:", 0.0, 2.0);
  objc_msgSend(v5, "drawAtPoint:", 0.0, 4.0);

  UIGraphicsGetImageFromCurrentImageContext();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v22, "imageWithAlignmentRectInsets:", v19, v9, v20, v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void)clearImageCacheForPass:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    objc_msgSend(a3, "uniqueID");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("single_"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache removeObjectForKey:](self->_imageCache, "removeObjectForKey:", v4);
    -[PKEditTableViewController removeRequestsWithCacheKey:](self, "removeRequestsWithCacheKey:", v4);
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("stack_"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache removeObjectForKey:](self->_imageCache, "removeObjectForKey:", v5);
    -[PKEditTableViewController removeRequestsWithCacheKey:](self, "removeRequestsWithCacheKey:", v5);

  }
}

- (unint64_t)_imagesToKeepOutsideVisibleCells
{
  return self->_imagesToKeep;
}

- (void)_setShouldProcessLowPriorityRequests:(BOOL)a3
{
  NSObject *queueCaching;
  _QWORD block[4];
  id v7;
  BOOL v8;
  id location;

  objc_initWeak(&location, self);
  queueCaching = self->_queueCaching;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PKEditTableViewController__setShouldProcessLowPriorityRequests___block_invoke;
  block[3] = &unk_1E3E61C08;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  dispatch_async(queueCaching, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __66__PKEditTableViewController__setShouldProcessLowPriorityRequests___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v3;
  int v4;
  _QWORD block[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 != WeakRetained[1128])
    {
      WeakRetained[1128] = v4;
      if (v4)
      {
        WeakRetained[1112] = 1;
        objc_msgSend(WeakRetained, "processCacheRequest:", 0);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __66__PKEditTableViewController__setShouldProcessLowPriorityRequests___block_invoke_2;
        block[3] = &unk_1E3E612E8;
        v6 = v3;
        dispatch_async(MEMORY[0x1E0C80D38], block);

      }
    }
  }

}

void __66__PKEditTableViewController__setShouldProcessLowPriorityRequests___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t i;
  void *v9;
  void *v10;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1208));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v4 = objc_opt_respondsToSelector();
    v3 = v10;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "indexPathsForVisibleRows", v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      for (i = objc_msgSend(v6, "row") + 1;
            i < objc_msgSend(v6, "row") + 2 * *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1144) + 1;
            ++i)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", i, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v9);

      }
      objc_msgSend(v10, "prefetchItemsAtIndexPaths:", v7);

      v3 = v10;
    }
  }

}

- (void)_updateShouldProcessHighPriorityRequestsWithFastScrolling:(BOOL)a3
{
  NSObject *queueCaching;
  _QWORD block[4];
  id v7;
  BOOL v8;
  id location;

  objc_initWeak(&location, self);
  queueCaching = self->_queueCaching;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PKEditTableViewController__updateShouldProcessHighPriorityRequestsWithFastScrolling___block_invoke;
  block[3] = &unk_1E3E61C08;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  dispatch_async(queueCaching, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __87__PKEditTableViewController__updateShouldProcessHighPriorityRequestsWithFastScrolling___block_invoke(uint64_t a1)
{
  double *WeakRetained;
  double v3;
  int v4;
  double *v5;

  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v3 = WeakRetained[146];
      v4 = v3 <= 0.034;
      if (*((unsigned __int8 *)WeakRetained + 1112) == v4)
        goto LABEL_9;
      *((_BYTE *)WeakRetained + 1112) = v4;
      if (v3 > 0.034)
        goto LABEL_9;
    }
    else
    {
      if (*((_BYTE *)WeakRetained + 1112))
        goto LABEL_9;
      *((_BYTE *)WeakRetained + 1112) = 1;
    }
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "processCacheRequest:", 0);
    WeakRetained = v5;
  }
LABEL_9:

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v4 = a4;
  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKEditTableViewController;
  -[PKEditTableViewController setEditing:animated:](&v13, sel_setEditing_animated_);
  -[PKEditTableViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leftBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v9 = CFSTR("PASS_EDITING_CANCEL");
  else
    v9 = CFSTR("PASS_EDITING_EDIT");
  if (v5)
    v10 = CFSTR("PASS_EDITING_TITLE_EDITING");
  else
    v10 = CFSTR("PASS_EDITING_TITLE");
  PKLocalizedString(&v9->isa);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v11);

  PKLocalizedString(&v10->isa);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKEditTableViewController setTitle:](self, "setTitle:", v12);

  -[UITableView setEditing:animated:](self->_tableView, "setEditing:animated:", v5, v4);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellWithIdentifier:(id)a4
{
  id v6;
  PKEditPassesTableViewCell *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", v6);
  v7 = (PKEditPassesTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("cellActionEditIdentifier")))
    {
      v7 = (PKEditPassesTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, v6);
      -[PKEditPassesTableViewCell textLabel](v7, "textLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTextColor:", v9);

    }
    else
    {
      v7 = -[PKEditPassesTableViewCell initWithReuseIdentifier:showImage:]([PKEditPassesTableViewCell alloc], "initWithReuseIdentifier:showImage:", v6, !self->_isAccessibilityCategory);
      -[PKEditPassesTableViewCell setAccessoryType:](v7, "setAccessoryType:", 1);
      -[PKEditPassesTableViewCell setEditingAccessoryType:](v7, "setEditingAccessoryType:", 1);
    }
  }

  return v7;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cachingDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "prefetchItemsAtIndexPaths:", v6);

}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  id WeakRetained;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v7 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cachingDelegate);
  if (!WeakRetained || (objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_14;
  v9 = -[PKEditTableViewController _imagesToKeepOutsideVisibleCells](self, "_imagesToKeepOutsideVisibleCells");
  v10 = objc_msgSend(v7, "row");
  v11 = objc_msgSend(v7, "section");
  if (!self->_scrollingUp)
  {
    if (objc_msgSend(v7, "row") >= v9)
    {
      v13 = (void *)MEMORY[0x1E0CB36B0];
      v14 = v10 - v9;
      goto LABEL_10;
    }
    if (!self->_scrollingUp)
      goto LABEL_11;
  }
  v12 = v10 + v9;
  if (v12 < -[PKEditTableViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v22, v11))
  {
    v13 = (void *)MEMORY[0x1E0CB36B0];
    v14 = v12;
LABEL_10:
    objc_msgSend(v13, "indexPathForRow:inSection:", v14, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "passAtIndexPath:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKEditTableViewController clearImageCacheForPass:](self, "clearImageCacheForPass:", v16);

  }
LABEL_11:
  objc_msgSend(WeakRetained, "passAtIndexPath:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "uniqueID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("stack_"), "stringByAppendingString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKEditTableViewController moveHighPriorityToLowPriorityWithCacheKey:](self, "moveHighPriorityToLowPriorityWithCacheKey:", v20);

    objc_msgSend(CFSTR("single_"), "stringByAppendingString:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKEditTableViewController moveHighPriorityToLowPriorityWithCacheKey:](self, "moveHighPriorityToLowPriorityWithCacheKey:", v21);

  }
LABEL_14:

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[PKEditTableViewController _setShouldProcessLowPriorityRequests:](self, "_setShouldProcessLowPriorityRequests:", 0);
  objc_msgSend(v4, "panGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "translationInView:", v4);
  v7 = v6;

  self->_dragging = 1;
  if (v7 == 0.0)
    -[PKEditTableViewController resumeRequestIfNoScrollingAfterTimeInterval:](self, "resumeRequestIfNoScrollingAfterTimeInterval:", 0.2);
  self->_scrollingUp = v7 > 0.0;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  self->_dragging = 0;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[PKEditTableViewController _setShouldProcessLowPriorityRequests:](self, "_setShouldProcessLowPriorityRequests:", 1);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  id v12;

  v4 = a3;
  v12 = v4;
  if (self->_lastYOffsetTime == 0.0)
  {
    self->_lastYOffsetTime = (double)mach_absolute_time();
    objc_msgSend(v12, "contentOffset");
    self->_lastYOffset = v5;
  }
  else
  {
    objc_msgSend(v4, "contentOffset");
    v7 = v6;
    v8 = (double)mach_absolute_time();
    PKSecondsFromMachTimeInterval();
    v10 = fabs((v7 - self->_lastYOffset) / v9);
    v11 = v10 > 150.0;
    if (self->_scrollingFast != v11)
    {
      self->_scrollingFast = v11;
      -[PKEditTableViewController _updateShouldProcessHighPriorityRequestsWithFastScrolling:](self, "_updateShouldProcessHighPriorityRequestsWithFastScrolling:", v10 > 150.0);
    }
    self->_lastYOffset = v7;
    self->_lastYOffsetTime = v8;
    if (self->_dragging)
      -[PKEditTableViewController resumeRequestIfNoScrollingAfterTimeInterval:](self, "resumeRequestIfNoScrollingAfterTimeInterval:", 0.2);
  }

}

- (void)resumeRequestIfNoScrollingAfterTimeInterval:(double)a3
{
  dispatch_time_t v5;
  _QWORD v6[6];

  v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__PKEditTableViewController_resumeRequestIfNoScrollingAfterTimeInterval___block_invoke;
  v6[3] = &unk_1E3E62010;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_after(v5, MEMORY[0x1E0C80D38], v6);
}

uint64_t __73__PKEditTableViewController_resumeRequestIfNoScrollingAfterTimeInterval___block_invoke(uint64_t a1)
{
  uint64_t result;
  double v3;

  mach_absolute_time();
  result = PKSecondsFromMachTimeInterval();
  if (v3 >= *(double *)(a1 + 40) * 0.5)
    return objc_msgSend(*(id *)(a1 + 32), "_setShouldProcessLowPriorityRequests:", 1);
  return result;
}

- (void)findApps
{
  void *v2;
  id v3;

  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68328], 0);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *MEMORY[0x1E0D6A6A8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:options:completionHandler:", v2, MEMORY[0x1E0C9AA70], 0);

}

- (void)scanCode
{
  void *v2;
  id v3;

  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68320], 0);
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *MEMORY[0x1E0D6A818]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v2, 0);

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4;
  int64_t testIteration;
  id v6;

  v4 = a3;
  if (self->_performanceTest == 2)
  {
    v6 = v4;
    if (self->_scrollingUp)
    {
      testIteration = self->_testIteration;
      if (testIteration > 9)
      {
        -[PKEditTableViewController passedTest](self, "passedTest");
      }
      else
      {
        self->_testIteration = testIteration + 1;
        -[PKEditTableViewController scrollToLastRowOrFailTest](self, "scrollToLastRowOrFailTest");
      }
    }
    else
    {
      -[PKEditTableViewController scrollToFirstRowOrFailTest](self, "scrollToFirstRowOrFailTest");
    }
    v4 = v6;
  }

}

- (void)setPerformanceTest:(int64_t)a3
{
  self->_performanceTest = a3;
}

- (void)setPerformanceTestName:(id)a3
{
  objc_storeStrong((id *)&self->_performanceTestName, a3);
}

- (void)startedTestWithName:(id)a3
{
  id v4;
  id v5;

  objc_storeStrong((id *)&self->_performanceTestName, a3);
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startedTest:", v4);

}

- (void)passedTest
{
  void *v3;
  _QWORD v4[5];

  -[PKEditTableViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__PKEditTableViewController_passedTest__block_invoke;
  v4[3] = &unk_1E3E612E8;
  v4[4] = self;
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v4);

}

void __39__PKEditTableViewController_passedTest__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishedTest:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1232));

}

- (void)failedTestWithReason:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PKEditTableViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__PKEditTableViewController_failedTestWithReason___block_invoke;
  v7[3] = &unk_1E3E61388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v7);

}

void __50__PKEditTableViewController_failedTestWithReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "failedTest:withFailure:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1232), *(_QWORD *)(a1 + 40));

}

- (void)selectFirstRowOrFailTest
{
  id v3;

  if (-[UITableView numberOfRowsInSection:](self->_tableView, "numberOfRowsInSection:", 0) < 1)
  {
    -[PKEditTableViewController failedTestWithReason:](self, "failedTestWithReason:", CFSTR("No passes available..."));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[PKEditTableViewController tableView:didSelectRowAtIndexPath:](self, "tableView:didSelectRowAtIndexPath:", self->_tableView, v3);

  }
}

- (void)scrollToFirstRowOrFailTest
{
  UITableView *tableView;
  id v4;

  if (-[UITableView numberOfRowsInSection:](self->_tableView, "numberOfRowsInSection:", 0) < 1)
  {
    -[PKEditTableViewController failedTestWithReason:](self, "failedTestWithReason:", CFSTR("No passes available..."));
  }
  else
  {
    self->_scrollingUp = 1;
    tableView = self->_tableView;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UITableView scrollToRowAtIndexPath:atScrollPosition:animated:](tableView, "scrollToRowAtIndexPath:atScrollPosition:animated:", v4, 1, 1);

  }
}

- (void)scrollToLastRowOrFailTest
{
  uint64_t v3;
  UITableView *tableView;
  id v5;

  v3 = -[UITableView numberOfRowsInSection:](self->_tableView, "numberOfRowsInSection:", 0);
  if (v3 < 1)
  {
    -[PKEditTableViewController failedTestWithReason:](self, "failedTestWithReason:", CFSTR("No passes available..."));
  }
  else
  {
    self->_scrollingUp = 0;
    tableView = self->_tableView;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v3 - 1, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UITableView scrollToRowAtIndexPath:atScrollPosition:animated:](tableView, "scrollToRowAtIndexPath:atScrollPosition:animated:", v5, 3, 1);

  }
}

- (void)beginScrollingTestWithTestName:(id)a3
{
  self->_performanceTest = 2;
  -[PKEditTableViewController startedTestWithName:](self, "startedTestWithName:", a3);
  -[PKEditTableViewController scrollToLastRowOrFailTest](self, "scrollToLastRowOrFailTest");
}

- (void)beginPassSelectionTestWithTestName:(id)a3
{
  self->_performanceTest = 1;
  -[PKEditTableViewController startedTestWithName:](self, "startedTestWithName:", a3);
  -[PKEditTableViewController selectFirstRowOrFailTest](self, "selectFirstRowOrFailTest");
}

- (void)beginPassDeletionTestWithTestName:(id)a3
{
  self->_performanceTest = 3;
  -[PKEditTableViewController startedTestWithName:](self, "startedTestWithName:", a3);
  -[PKEditTableViewController selectFirstRowOrFailTest](self, "selectFirstRowOrFailTest");
}

- (PKEditTableViewControllerCachingDelegate)cachingDelegate
{
  return (PKEditTableViewControllerCachingDelegate *)objc_loadWeakRetained((id *)&self->_cachingDelegate);
}

- (void)setCachingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cachingDelegate, a3);
}

- (PKGroupsController)existingGroupsController
{
  return self->_existingGroupsController;
}

- (void)setExistingGroupsController:(id)a3
{
  objc_storeStrong((id *)&self->_existingGroupsController, a3);
}

- (int64_t)performanceTest
{
  return self->_performanceTest;
}

- (NSString)performanceTestName
{
  return self->_performanceTestName;
}

- (int64_t)testIteration
{
  return self->_testIteration;
}

- (void)setTestIteration:(int64_t)a3
{
  self->_testIteration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performanceTestName, 0);
  objc_storeStrong((id *)&self->_existingGroupsController, 0);
  objc_destroyWeak((id *)&self->_cachingDelegate);
  objc_storeStrong((id *)&self->_lastSnapshotDurations, 0);
  objc_storeStrong((id *)&self->_placeholdersPerPassStyle, 0);
  objc_storeStrong((id *)&self->_lowPriorityRequests, 0);
  objc_storeStrong((id *)&self->_highPriorityRequests, 0);
  objc_storeStrong((id *)&self->_currentCacheRequest, 0);
  objc_storeStrong((id *)&self->_queuePlaceholder, 0);
  objc_storeStrong((id *)&self->_queueCaching, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_noPassesView, 0);
}

@end
