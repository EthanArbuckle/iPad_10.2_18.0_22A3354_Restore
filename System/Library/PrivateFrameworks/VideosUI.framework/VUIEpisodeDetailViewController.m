@implementation VUIEpisodeDetailViewController

- (VUIEpisodeDetailViewController)initWithMediaItem:(id)a3
{
  id v5;
  VUIEpisodeDetailViewController *v6;
  VUIEpisodeDetailViewController *v7;
  VUIViewControllerContentPresenter *v8;
  VUIViewControllerContentPresenter *contentPresenter;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VUIEpisodeDetailViewController;
  v6 = -[VUIEpisodeDetailViewController init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaItem, a3);
    v8 = objc_alloc_init(VUIViewControllerContentPresenter);
    contentPresenter = v7->_contentPresenter;
    v7->_contentPresenter = v8;

    -[VUIViewControllerContentPresenter setLogName:](v7->_contentPresenter, "setLogName:", CFSTR("VUIEpisodeDetailViewController"));
    objc_initWeak(&location, v7);
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__VUIEpisodeDetailViewController_initWithMediaItem___block_invoke;
    v13[3] = &unk_1E9F99F98;
    objc_copyWeak(&v14, &location);
    v11 = (id)-[VUIEpisodeDetailViewController registerForTraitChanges:withHandler:](v7, "registerForTraitChanges:withHandler:", v10, v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __52__VUIEpisodeDetailViewController_initWithMediaItem___block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;

  objc_msgSend(WeakRetained, "detailView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "mediaItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIEpisodeDetailView configureEpisodeDetailView:withMedia:viewSize:](VUIEpisodeDetailView, "configureEpisodeDetailView:withMedia:viewSize:", v6, v7, v3, v5);

  objc_msgSend(WeakRetained, "detailView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", v3, v5);
  v10 = v9;
  v12 = v11;

  objc_msgSend(WeakRetained, "detailView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContentSize:", v10, v12);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIEpisodeDetailViewController;
  -[VUIEpisodeDetailViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  VUIEpisodeDetailView *v4;
  VUIEpisodeDetailView *v5;
  VUIEpisodeDetailView *detailView;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VUIEpisodeDetailViewController;
  -[VUIEpisodeDetailViewController viewDidLoad](&v16, sel_viewDidLoad);
  -[VUIEpisodeDetailViewController _configureNavigationBar](self, "_configureNavigationBar");
  -[VUIEpisodeDetailViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLargeTitleDisplayMode:", 2);
  v4 = [VUIEpisodeDetailView alloc];
  v5 = -[VUIEpisodeDetailView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  detailView = self->_detailView;
  self->_detailView = v5;

  -[VUIEpisodeDetailView setEpisodeViewDelegate:](self->_detailView, "setEpisodeViewDelegate:", self);
  -[VUIEpisodeDetailViewController contentPresenter](self, "contentPresenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentView:", self->_detailView);

  -[VUIEpisodeDetailViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  +[VUIEpisodeDetailView configureEpisodeDetailView:withMedia:viewSize:](VUIEpisodeDetailView, "configureEpisodeDetailView:withMedia:viewSize:", self->_detailView, self->_mediaItem, v10, v12);
  -[VUIEpisodeDetailViewController contentPresenter](self, "contentPresenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCurrentContentViewType:", 3);

  -[VUIEpisodeDetailViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC6960], "makeAccessibilityIdentifierString:additionalString:", *MEMORY[0x1E0DC6AA0], CFSTR("Library.id=\"EpisodeDetail\"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccessibilityIdentifier:", v15);

}

- (void)viewDidAppear:(BOOL)a3
{
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUIEpisodeDetailViewController;
  -[VUIEpisodeDetailViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  if (!self->_tapGestureRecognizer)
  {
    v4 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_dismissTapped_);
    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v4;

    -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_tapGestureRecognizer, "setNumberOfTapsRequired:", 1);
    -[UITapGestureRecognizer setCancelsTouchesInView:](self->_tapGestureRecognizer, "setCancelsTouchesInView:", 0);
    -[UITapGestureRecognizer setDelegate:](self->_tapGestureRecognizer, "setDelegate:", self);
    -[VUIEpisodeDetailViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addGestureRecognizer:", self->_tapGestureRecognizer);

  }
  -[VUIEpisodeDetailViewController reportMetricsPageEvent](self, "reportMetricsPageEvent");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  UITapGestureRecognizer *tapGestureRecognizer;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUIEpisodeDetailViewController;
  -[VUIEpisodeDetailViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  if (self->_tapGestureRecognizer)
  {
    -[VUIEpisodeDetailViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeGestureRecognizer:", self->_tapGestureRecognizer);

    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = 0;

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)VUIEpisodeDetailViewController;
  v7 = a4;
  -[VUIEpisodeDetailViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__VUIEpisodeDetailViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E9F99FC0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

uint64_t __85__VUIEpisodeDetailViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureNavigationBar");
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIEpisodeDetailViewController;
  -[VUIEpisodeDetailViewController loadView](&v4, sel_loadView);
  -[VUIEpisodeDetailViewController contentPresenter](self, "contentPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRootViewForViewController:", self);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIEpisodeDetailViewController;
  -[VUIEpisodeDetailViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[VUIEpisodeDetailViewController contentPresenter](self, "contentPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIEpisodeDetailViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "configureCurrentViewFrameForBounds:");

}

- (void)reportMetricsPageEvent
{
  +[VUILibraryMetrics recordPageEventWithPageType:](VUILibraryMetrics, "recordPageEventWithPageType:", CFSTR("LibraryEpisodeDetails"));
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)dismissTapped:(id)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  BOOL v16;
  void *v17;
  void *v18;
  id v19;
  CGPoint v20;
  CGRect v21;

  v19 = a3;
  if (objc_msgSend(v19, "state") == 3)
  {
    -[VUIEpisodeDetailViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[VUIEpisodeDetailViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "locationInView:", v13);
    v20.x = v14;
    v20.y = v15;
    v21.origin.x = v6;
    v21.origin.y = v8;
    v21.size.width = v10;
    v21.size.height = v12;
    v16 = CGRectContainsPoint(v21, v20);

    if (!v16)
    {
      -[VUIEpisodeDetailViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "window");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeGestureRecognizer:", v19);

      -[VUIEpisodeDetailViewController dismissPopover](self, "dismissPopover");
    }
  }

}

- (void)didTapPlay
{
  VUIMediaItem *v3;
  uint64_t v4;
  VUIMediaItem *v5;
  void (**v6)(_QWORD);
  void *v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);
  _QWORD aBlock[4];
  VUIMediaItem *v11;

  v3 = self->_mediaItem;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__VUIEpisodeDetailViewController_didTapPlay__block_invoke;
  aBlock[3] = &unk_1E9F98DF0;
  v5 = v3;
  v11 = v5;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[VUIEpisodeDetailViewController presentingViewController](self, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __44__VUIEpisodeDetailViewController_didTapPlay__block_invoke_35;
    v8[3] = &unk_1E9F98E68;
    v9 = v6;
    -[VUIEpisodeDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v8);

  }
  else
  {
    v6[2](v6);
  }

}

void __44__VUIEpisodeDetailViewController_didTapPlay__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  VUIMediaInfo *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  VUIMediaInfo *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*v1, "videosPlayable");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = [VUIMediaInfo alloc];
      v12[0] = v2;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[VUIMediaInfo initWithPlaybackContext:videosPlayables:imageProxies:storeDictionary:](v3, "initWithPlaybackContext:videosPlayables:imageProxies:storeDictionary:", 3, v4, 0, 0);

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setUserPlaybackInitiationDate:openURLCompletionDate:](v5, "setUserPlaybackInitiationDate:openURLCompletionDate:", v6, 0);

      if (!v5)
        goto LABEL_10;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_10;
      v7 = [VUIMediaInfo alloc];
      v11 = *v1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[VUIMediaInfo initWithPlaybackContext:vuiMediaItems:](v7, "initWithPlaybackContext:vuiMediaItems:", 3, v8);

      -[NSObject setIntent:](v5, "setIntent:", 1);
      -[NSObject setAutomaticPlaybackStart:](v5, "setAutomaticPlaybackStart:", 0);
      if (!v5)
      {
LABEL_10:
        VUIDefaultLogObject();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          __44__VUIEpisodeDetailViewController_didTapPlay__block_invoke_cold_2((uint64_t *)v1, v5);
        goto LABEL_12;
      }
    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__VUIEpisodeDetailViewController_didTapPlay__block_invoke_2;
    v9[3] = &unk_1E9F98DF0;
    v10 = *v1;
    +[VUIActionPlay playMediaInfo:watchType:isRentAndWatchNow:completion:](VUIActionPlay, "playMediaInfo:watchType:isRentAndWatchNow:completion:", v5, 0, 0, v9);

    goto LABEL_12;
  }
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __44__VUIEpisodeDetailViewController_didTapPlay__block_invoke_cold_1(v5);
LABEL_12:

}

uint64_t __44__VUIEpisodeDetailViewController_didTapPlay__block_invoke_2(uint64_t a1)
{
  return +[VUILibraryMetrics recordPlayOfMediaEntity:isLaunchingExtras:](VUILibraryMetrics, "recordPlayOfMediaEntity:isLaunchingExtras:", *(_QWORD *)(a1 + 32), 0);
}

uint64_t __44__VUIEpisodeDetailViewController_didTapPlay__block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dismissPopover
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  VUIEpisodeDetailViewController *v7;

  -[VUIEpisodeDetailViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__VUIEpisodeDetailViewController_dismissPopover__block_invoke;
  v5[3] = &unk_1E9F98FD8;
  v6 = v3;
  v7 = self;
  v4 = v3;
  -[VUIEpisodeDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5);

}

uint64_t __48__VUIEpisodeDetailViewController_dismissPopover__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "episodeDetailViewControllerWasDismissed:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_configureNavigationBar
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  if (+[VUIUtilities isIpadInterface](VUIUtilities, "isIpadInterface"))
  {
    -[VUIEpisodeDetailViewController navigationController](self, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v3;
    v4 = 1;
  }
  else
  {
    -[VUIEpisodeDetailViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (v6 == 1)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismissPopover);
      -[VUIEpisodeDetailViewController navigationItem](self, "navigationItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRightBarButtonItem:", v7);

    }
    -[VUIEpisodeDetailViewController navigationController](self, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v3;
    v4 = 0;
  }
  objc_msgSend(v3, "setNavigationBarHidden:", v4);

}

- (VUIMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItem, a3);
}

- (VUIViewControllerContentPresenter)contentPresenter
{
  return self->_contentPresenter;
}

- (void)setContentPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_contentPresenter, a3);
}

- (VUIEpisodeDetailViewControllerDelegate)delegate
{
  return (VUIEpisodeDetailViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VUIEpisodeDetailView)detailView
{
  return self->_detailView;
}

- (void)setDetailView:(id)a3
{
  objc_storeStrong((id *)&self->_detailView, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_detailView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentPresenter, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
}

void __44__VUIEpisodeDetailViewController_didTapPlay__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "Unable to present nil media item", v1, 2u);
}

void __44__VUIEpisodeDetailViewController_didTapPlay__block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1D96EE000, a2, OS_LOG_TYPE_ERROR, "Unable to start playback because mediaInfo is nil; mediaEntity: %@",
    (uint8_t *)&v3,
    0xCu);
}

@end
