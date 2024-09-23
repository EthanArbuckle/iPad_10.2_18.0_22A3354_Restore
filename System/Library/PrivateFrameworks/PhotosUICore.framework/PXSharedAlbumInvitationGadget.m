@implementation PXSharedAlbumInvitationGadget

- (PXSharedAlbumInvitationGadget)init
{
  PXSharedAlbumInvitationGadget *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXSharedAlbumInvitationGadget;
  v2 = -[PXSharedAlbumInvitationGadget init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

    +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addDeferredKeyObserver:", v2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)PXSharedAlbumInvitationGadget;
  -[PXSharedAlbumInvitationGadget dealloc](&v4, sel_dealloc);
}

- (PXSharedAlbumHeaderView)headerView
{
  PXSharedAlbumHeaderView *headerView;
  PXSharedAlbumHeaderView *v4;
  PXSharedAlbumHeaderView *v5;

  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = objc_alloc_init(PXSharedAlbumHeaderView);
    -[PXSharedAlbumHeaderView setLayoutStyle:](v4, "setLayoutStyle:", 2);
    v5 = self->_headerView;
    self->_headerView = v4;

    headerView = self->_headerView;
  }
  return headerView;
}

- (PXSharedAlbumInvitationView)invitationView
{
  PXSharedAlbumInvitationView *invitationView;
  PXSharedAlbumInvitationView *v4;
  PXSharedAlbumInvitationView *v5;

  invitationView = self->_invitationView;
  if (!invitationView)
  {
    v4 = objc_alloc_init(PXSharedAlbumInvitationView);
    -[PXSharedAlbumInvitationView setCornerRadius:](v4, "setCornerRadius:", 4.0);
    -[PXSharedAlbumInvitationView setDelegate:](v4, "setDelegate:", self);
    v5 = self->_invitationView;
    self->_invitationView = v4;

    invitationView = self->_invitationView;
  }
  return invitationView;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXSharedAlbumInvitationGadget;
  -[PXSharedAlbumInvitationGadget viewDidLoad](&v7, sel_viewDidLoad);
  -[PXSharedAlbumInvitationGadget view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[PXSharedAlbumInvitationGadget headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v5);

  -[PXSharedAlbumInvitationGadget invitationView](self, "invitationView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v6);

  -[PXSharedAlbumInvitationGadget _updateInvitationView](self, "_updateInvitationView");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXSharedAlbumInvitationGadget;
  -[PXSharedAlbumInvitationGadget viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  -[PXSharedAlbumInvitationGadget view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PXSharedAlbumInvitationGadget _performLayoutInRect:updateSubviewFrames:](self, "_performLayoutInRect:updateSubviewFrames:", 1);

}

- (void)setInvitationSectionInfo:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_invitationSectionInfo, a3);
  if (-[PXFeedSectionInfo isLoaded](self->_invitationSectionInfo, "isLoaded"))
    -[PXSharedAlbumInvitationGadget _updateInvitationView](self, "_updateInvitationView");

}

- (void)setGadgetSpec:(id)a3
{
  PXGadgetSpec *v5;
  PXGadgetSpec *v6;

  v5 = (PXGadgetSpec *)a3;
  if (self->_gadgetSpec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_gadgetSpec, a3);
    -[PXSharedAlbumInvitationGadget _updateInvitationView](self, "_updateInvitationView");
    v5 = v6;
  }

}

- (unint64_t)gadgetType
{
  return 3;
}

- (unint64_t)gadgetCapabilities
{
  return 2;
}

- (id)contentViewController
{
  void *v3;

  if (!-[PXSharedAlbumInvitationGadget loadedContentData](self, "loadedContentData"))
  {
    -[PXSharedAlbumInvitationGadget invitationSectionInfo](self, "invitationSectionInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isLoaded") & 1) == 0)
      objc_msgSend(v3, "reload");
    -[PXSharedAlbumInvitationGadget setLoadedContentData:](self, "setLoadedContentData:", 1);

  }
  return self;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PXSharedAlbumInvitationGadget _performLayoutInRect:updateSubviewFrames:](self, "_performLayoutInRect:updateSubviewFrames:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)uniqueGadgetIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[PXSharedAlbumInvitationGadget invitationSectionInfo](self, "invitationSectionInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedAlbum");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  id v4;

  -[PXSharedAlbumInvitationGadget _updateInvitationView](self, "_updateInvitationView", a3);
  -[PXSharedAlbumInvitationGadget delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gadget:didChange:", self, 64);

}

- (void)_updateInvitationView
{
  void *v3;
  void *v4;
  id v5;

  -[PXSharedAlbumInvitationGadget invitationSectionInfo](self, "invitationSectionInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumInvitationGadget headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSectionInfo:", v5);

  -[PXSharedAlbumInvitationGadget invitationView](self, "invitationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInvitationSectionInfo:", v5);

}

- (CGSize)_performLayoutInRect:(CGRect)a3 updateSubviewFrames:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, double);
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat MaxY;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  NSString *v26;
  _BOOL4 IsAccessibilityCategory;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  CGFloat x;
  CGFloat y;
  _QWORD aBlock[5];
  uint64_t v36;
  double *v37;
  uint64_t v38;
  uint64_t v39;
  CGSize result;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  x = a3.origin.x;
  y = a3.origin.y;
  -[PXSharedAlbumInvitationGadget traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");
  v10 = v9;

  if (v10 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");

  }
  -[PXSharedAlbumInvitationGadget headerView](self, "headerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumInvitationGadget invitationView](self, "invitationView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = (double *)&v36;
  v38 = 0x2020000000;
  v39 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PXSharedAlbumInvitationGadget__performLayoutInRect_updateSubviewFrames___block_invoke;
  aBlock[3] = &unk_1E5143A58;
  aBlock[4] = &v36;
  v14 = (void (**)(_QWORD, double))_Block_copy(aBlock);
  objc_msgSend(v12, "sizeThatFits:", width, height);
  v16 = v15;
  v17 = v37[3];
  v41.origin.x = 0.0;
  v41.origin.y = v17;
  v41.size.width = width;
  v41.size.height = v16;
  MaxY = CGRectGetMaxY(v41);
  v14[2](v14, MaxY);
  objc_msgSend(v13, "sizeThatFits:", width, height);
  v20 = v19;
  v22 = v21;
  v23 = v37[3];
  v42.origin.x = 0.0;
  v42.origin.y = v23;
  v42.size.width = v20;
  v42.size.height = v22;
  v24 = CGRectGetMaxY(v42);
  v14[2](v14, v24);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "preferredContentSizeCategory");
    v26 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v26);

    if (IsAccessibilityCategory)
    {
      v43.origin.x = x;
      v43.origin.y = y;
      v43.size.width = width;
      v43.size.height = height;
      v28 = CGRectGetHeight(v43);
      v44.origin.x = 0.0;
      v44.origin.y = v23;
      v44.size.width = v20;
      v44.size.height = v22;
      v29 = v28 - CGRectGetHeight(v44);
      v45.origin.x = 0.0;
      v45.origin.y = v29;
      v45.size.width = v20;
      v45.size.height = v22;
      CGRectGetMinY(v45);
      v46.origin.x = 0.0;
      v46.origin.y = v17;
      v46.size.width = width;
      v46.size.height = v16;
      CGRectGetMinY(v46);
    }
    PXRectRoundToPixel();
    objc_msgSend(v12, "setFrame:");
    PXRectRoundToPixel();
    objc_msgSend(v13, "setFrame:");
  }
  v30 = v37[3];

  _Block_object_dispose(&v36, 8);
  v31 = width;
  v32 = v30;
  result.height = v32;
  result.width = v31;
  return result;
}

- (void)_attemptToNavigateToSharedAlbum:(id)a3 hostingViewController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[UIViewController px_gridPresentation](self, "px_gridPresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CD13B8];
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pl_PHAssetCollectionForAssetContainer:photoLibrary:", v13, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v7, "createPhotosAlbumViewControllerForAlbum:withFetchResult:", v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "navigationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pushViewController:animated:", v11, 1);

    }
  }

}

- (void)sharedAlbumInvitationView:(id)a3 didAccept:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  dispatch_time_t v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id location;

  v4 = a4;
  v6 = a3;
  +[PXUserEventTracker sharedInstance](PXUserEventTracker, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    objc_msgSend(v7, "logForYouSharedAlbumInvitationAcceptedCount");
    v9 = CFSTR("com.apple.photos.CPAnalytics.sharedAlbumInvitationAccepted");
  }
  else
  {
    objc_msgSend(v7, "logForYouSharedAlbumInvitationDeclinedCount");
    v9 = CFSTR("com.apple.photos.CPAnalytics.sharedAlbumInvitationDeclined");
  }

  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", v9, MEMORY[0x1E0C9AA70]);
  -[PXSharedAlbumInvitationGadget delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "gadget:didAccept:", self, v4);
    if (v4)
    {
      objc_initWeak(&location, self);
      -[PXSharedAlbumInvitationGadget delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "gadgetViewControllerHostingGadget:", self);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = dispatch_time(0, 2000000000);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __69__PXSharedAlbumInvitationGadget_sharedAlbumInvitationView_didAccept___block_invoke;
      v15[3] = &unk_1E5147B18;
      objc_copyWeak(&v17, &location);
      v15[4] = self;
      v16 = v12;
      v14 = v12;
      dispatch_after(v13, MEMORY[0x1E0C80D38], v15);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }

}

- (void)sharedAlbumInvitationViewDidReportAsJunk:(id)a3
{
  void *v4;
  id v5;

  +[PXUserEventTracker sharedInstance](PXUserEventTracker, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logForYouSharedAlbumInvitationReportedAsJunkCount");

  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.sharedAlbumInvitationReportedAsJunk"), MEMORY[0x1E0C9AA70]);
  -[PXSharedAlbumInvitationGadget delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "gadgetDidReportJunk:", self);

}

- (void)sharedAlbumInvitationView:(id)a3 presentViewController:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[PXSharedAlbumInvitationGadget delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gadgetViewControllerHostingGadget:", self);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "presentViewController:animated:completion:", v5, 1, 0);
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  id v7;
  int v8;
  id v9;

  v9 = a3;
  v6 = a4;
  +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 != v9)
    goto LABEL_4;
  v8 = objc_msgSend(v6, "isEqualToString:", CFSTR("useSquareSharedAlbumActivity"));

  if (v8)
  {
    -[PXSharedAlbumInvitationGadget delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "gadget:didChange:", self, 64);
LABEL_4:

  }
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (PXGadgetDelegate)delegate
{
  return (PXGadgetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXFeedInvitationSectionInfo)invitationSectionInfo
{
  return self->_invitationSectionInfo;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (void)setInvitationView:(id)a3
{
  objc_storeStrong((id *)&self->_invitationView, a3);
}

- (BOOL)loadedContentData
{
  return self->_loadedContentData;
}

- (void)setLoadedContentData:(BOOL)a3
{
  self->_loadedContentData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_invitationSectionInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
}

void __69__PXSharedAlbumInvitationGadget_sharedAlbumInvitationView_didAccept___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "invitationSectionInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedAlbum");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_attemptToNavigateToSharedAlbum:hostingViewController:", v3, *(_QWORD *)(a1 + 40));

}

double __74__PXSharedAlbumInvitationGadget__performLayoutInRect_updateSubviewFrames___block_invoke(uint64_t a1, double result)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(double *)(v2 + 24) < result)
  {
    result = ceil(result);
    *(double *)(v2 + 24) = result;
  }
  return result;
}

+ (void)preloadResources
{
  +[PXSharedAlbumInvitationView preloadResources](PXSharedAlbumInvitationView, "preloadResources");
}

@end
