@implementation _SingleMemoryDebugViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  PXMemoriesFeedWidgetDataSourceManager *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  PXMemoryViewModel *v12;
  id v13;
  PXMemoryView *v14;
  PXMemoryView *memoryView;
  _QWORD v16[4];
  id v17;
  _OWORD v18[2];
  __int128 v19;
  __int128 v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)_SingleMemoryDebugViewController;
  -[_SingleMemoryDebugViewController viewDidLoad](&v21, sel_viewDidLoad);
  -[_SingleMemoryDebugViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[UIViewController px_enableExtendedTraitCollection](self, "px_enableExtendedTraitCollection");
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXMemoriesFeedDataSourceManagerBase initWithPhotoLibrary:]([PXMemoriesFeedWidgetDataSourceManager alloc], "initWithPhotoLibrary:", v5);
  -[PXMemoriesFeedWidgetDataSourceManager setMaxCount:](v6, "setMaxCount:", 1);
  -[PXMemoriesFeedWidgetDataSourceManager startGeneratingMemories](v6, "startGeneratingMemories");
  -[PXSectionedDataSourceManager dataSource](v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v19 = 0u;
  v20 = 0u;
  if (v7)
  {
    objc_msgSend(v7, "firstItemIndexPath");
    v9 = v19;
  }
  else
  {
    v9 = 0;
  }
  if (v9 != *(_QWORD *)off_1E50B7E98)
  {
    v18[0] = v19;
    v18[1] = v20;
    objc_msgSend(v8, "objectAtIndexPath:", v18);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = objc_alloc_init(PXMemoryViewModel);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __47___SingleMemoryDebugViewController_viewDidLoad__block_invoke;
      v16[3] = &unk_1E5142090;
      v17 = v11;
      v13 = v11;
      -[PXMemoryViewModel performChanges:](v12, "performChanges:", v16);
      v14 = objc_alloc_init(PXMemoryView);
      memoryView = self->_memoryView;
      self->_memoryView = v14;

      -[PXMemoryView setViewModel:](self->_memoryView, "setViewModel:", v12);
      objc_msgSend(v3, "addSubview:", self->_memoryView);

    }
  }

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[4];
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v28;
  CGRect v29;

  v28.receiver = self;
  v28.super_class = (Class)_SingleMemoryDebugViewController;
  -[_SingleMemoryDebugViewController viewWillLayoutSubviews](&v28, sel_viewWillLayoutSubviews);
  -[_SingleMemoryDebugViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  PXEdgeInsetsMake();
  v21 = v12;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v29.origin.x = v5;
  v29.origin.y = v7;
  v29.size.width = v9;
  v29.size.height = v11;
  -[PXMemoryView setFrame:](self->_memoryView, "setFrame:", 20.0, CGRectGetMidY(v29) + (v9 + -40.0) / 3.0 * -0.5, (v9 + -40.0) / 3.0, (v9 + -40.0) / 3.0);
  -[UIViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "userInterfaceIdiom");
  objc_msgSend(v19, "layoutSizeClass");
  objc_msgSend(v19, "layoutOrientation");
  -[PXMemoryView viewModel](self->_memoryView, "viewModel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __58___SingleMemoryDebugViewController_viewWillLayoutSubviews__block_invoke;
  v22[3] = &__block_descriptor_80_e36_v16__0___PXMutableMemoryViewModel__8l;
  v23 = xmmword_1A7BA05F0;
  v24 = v21;
  v25 = v14;
  v26 = v16;
  v27 = v18;
  objc_msgSend(v20, "performChanges:", v22);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryView, 0);
}

@end
