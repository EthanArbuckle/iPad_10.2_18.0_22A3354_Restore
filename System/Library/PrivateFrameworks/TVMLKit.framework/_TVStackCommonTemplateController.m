@implementation _TVStackCommonTemplateController

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[_TVStackCommonTemplateController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDataSource:", 0);

  -[_TVStackCommonTemplateController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  -[_TVStackCommonTemplateController viewElement](self, "viewElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVTemplateFeaturesManager featuresManagerForAppDocument:](TVTemplateFeaturesManager, "featuresManagerForAppDocument:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "popContext:forFeature:", self, &unk_2557BDFC8);
  -[_TVStackCommonTemplateController setMediaPlayer:](self, "setMediaPlayer:", 0);

  v8.receiver = self;
  v8.super_class = (Class)_TVStackCommonTemplateController;
  -[_TVBgImageLoadingViewController dealloc](&v8, sel_dealloc);
}

- (void)updateWithViewElement:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  UIView *overlayView;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  id v48;
  void *v49;
  double v50;
  UIView *v51;
  UIView *v52;
  void *v53;
  id v54;
  void *v55;
  _TVStackCommonTemplateController *v56;
  void *v57;
  id obj;
  id v59;
  int v60;
  id v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  objc_super v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v54 = a3;
  v4 = a3;
  v94.receiver = self;
  v94.super_class = (Class)_TVStackCommonTemplateController;
  -[_TVBgImageLoadingViewController updateWithViewElement:](&v94, sel_updateWithViewElement_, v4);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v55 = v4;
  objc_msgSend(v4, "children");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
  if (v64)
  {
    v71 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v62 = 0;
    v63 = *(_QWORD *)v91;
    v10 = 1;
    v56 = self;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v91 != v63)
        {
          v12 = v11;
          objc_enumerationMutation(obj);
          v11 = v12;
        }
        v65 = v11;
        v68 = *(id *)(*((_QWORD *)&v90 + 1) + 8 * v11);
        v13 = objc_msgSend(v68, "tv_elementType", v54);
        if (v13 == 10)
        {
          v25 = v68;

          v10 = 0;
          v62 = v25;
        }
        else if (v13 == 4)
        {
          v60 = v10;
          v14 = v68;

          v88 = 0u;
          v89 = 0u;
          v86 = 0u;
          v87 = 0u;
          v59 = v14;
          objc_msgSend(v14, "children");
          v69 = (id)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v86, v98, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v87;
            do
            {
              v18 = 0;
              v66 = v16;
              do
              {
                if (*(_QWORD *)v87 != v17)
                  objc_enumerationMutation(v69);
                v19 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v18);
                if (!v7
                  && objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * v18), "tv_elementType") == 16
                  && objc_msgSend(v19, "tv_imageType") == 3)
                {
                  v7 = v19;
                }
                else if (v6 || objc_msgSend(v19, "tv_elementType") != 16)
                {
                  if (objc_msgSend(v19, "tv_elementType") == 35)
                  {
                    v72 = v6;
                    v20 = v19;
                    objc_msgSend(v20, "children");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                      overlayView = self->_overlayView;
                    else
                      overlayView = 0;
                    +[TVMLViewFactory organizerViewWithElements:existingView:](TVMLViewFactory, "organizerViewWithElements:existingView:", v21, overlayView);
                    v23 = objc_claimAutoreleasedReturnValue();

                    v71 = (void *)v23;
                    v6 = v72;
                    v16 = v66;
                  }
                  else if (!v8)
                  {
                    if (objc_msgSend(v19, "tv_elementType") == 81)
                      v8 = v19;
                    else
                      v8 = 0;
                  }
                }
                else
                {
                  v6 = v19;
                }
                ++v18;
              }
              while (v16 != v18);
              v24 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v86, v98, 16);
              v16 = v24;
            }
            while (v24);
          }

          v9 = v59;
          v10 = v60;
        }
        else if ((v10 & 1) != 0)
        {
          v26 = v68;
          if (objc_msgSend(v68, "tv_elementType") == 12)
          {
            v61 = v8;
            v67 = v9;
            v73 = v6;
            v84 = 0u;
            v85 = 0u;
            v82 = 0u;
            v83 = 0u;
            objc_msgSend(v68, "children");
            v70 = (id)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v82, v97, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v83;
              do
              {
                for (i = 0; i != v28; ++i)
                {
                  if (*(_QWORD *)v83 != v29)
                    objc_enumerationMutation(v70);
                  v31 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
                  if (!v7
                    && objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * i), "tv_elementType") == 16
                    && objc_msgSend(v31, "tv_imageType") == 3)
                  {
                    v7 = v31;
                  }
                  else if (objc_msgSend(v31, "tv_elementType") == 4)
                  {
                    v80 = 0u;
                    v81 = 0u;
                    v78 = 0u;
                    v79 = 0u;
                    objc_msgSend(v31, "children");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v78, v96, 16);
                    if (v33)
                    {
                      v34 = v33;
                      v35 = *(_QWORD *)v79;
                      do
                      {
                        for (j = 0; j != v34; ++j)
                        {
                          if (*(_QWORD *)v79 != v35)
                            objc_enumerationMutation(v32);
                          v37 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
                          if (objc_msgSend(v37, "tv_elementType") == 16 && !objc_msgSend(v37, "tv_imageType"))
                          {
                            v38 = v37;

                            v5 = v38;
                          }
                        }
                        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v78, v96, 16);
                      }
                      while (v34);
                    }

                  }
                }
                v28 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v82, v97, 16);
              }
              while (v28);
            }

            self = v56;
            v6 = v73;
            v9 = v67;
            v26 = v68;
            v8 = v61;
          }
          objc_msgSend(v57, "addObject:", v26);
          v10 = 1;
        }
        else
        {
          v10 = 0;
        }
        v11 = v65 + 1;
      }
      while (v65 + 1 != v64);
      v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
    }
    while (v64);

    if (!v8)
      goto LABEL_83;

    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    objc_msgSend(v8, "children");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v95, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v75;
LABEL_67:
      v42 = 0;
      while (1)
      {
        if (*(_QWORD *)v75 != v41)
          objc_enumerationMutation(obj);
        v43 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v42);
        if (objc_msgSend(v43, "tv_elementType") == 16 && objc_msgSend(v43, "tv_imageType") == 3)
          break;
        v46 = objc_msgSend(v43, "tv_elementType");
        v45 = 0;
        v47 = 0;
        v7 = 0;
        v44 = (unint64_t)v43;
        if (v46 == 16)
          goto LABEL_74;
LABEL_75:
        if (v47 | v7)
        {
          self = v56;
          v6 = (id)v47;
          goto LABEL_82;
        }
        ++v42;
        self = v56;
        if (v40 == v42)
        {
          v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v95, 16);
          if (v40)
            goto LABEL_67;
          goto LABEL_80;
        }
      }
      v44 = 0;
      v45 = (unint64_t)v43;
LABEL_74:
      v48 = v43;
      v47 = v44;
      v7 = v45;
      goto LABEL_75;
    }
  }
  else
  {
    v62 = 0;
    v9 = 0;
    v8 = 0;
    v5 = 0;
    v71 = 0;
  }
LABEL_80:
  v6 = 0;
  v7 = 0;
LABEL_82:

LABEL_83:
  objc_storeStrong((id *)&self->_viewElement, v54);
  objc_msgSend(v55, "appDocument");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "impressionThreshold");
  self->_impressionThreshold = v50;

  objc_storeStrong((id *)&self->_collectionListElement, v62);
  objc_storeStrong((id *)&self->_backgroundElement, v9);
  objc_storeStrong((id *)&self->_heroImgElement, (id)v7);
  objc_storeStrong((id *)&self->_bgImgElement, v6);
  objc_storeStrong((id *)&self->_uberImgElement, v5);
  objc_storeStrong((id *)&self->_bgMediaContentElement, v8);
  if (v71)
  {
    v51 = v71;
  }
  else
  {
    -[UIView removeFromSuperview](self->_overlayView, "removeFromSuperview");
    v51 = 0;
  }
  v52 = self->_overlayView;
  self->_overlayView = v51;

  -[_TVStackCommonTemplateController updateCollectionViewControllersAndForceReload:](self, "updateCollectionViewControllersAndForceReload:", -[_TVStackCommonTemplateController _updateSupplementaryViewControllersWithElements:updateStyles:](self, "_updateSupplementaryViewControllersWithElements:updateStyles:", v57, objc_msgSend(v55, "updateType") == 2));
  -[_TVStackCommonTemplateController parentViewController](self, "parentViewController");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVStackCommonTemplateController _disableScrollingIfNecessary:](self, "_disableScrollingIfNecessary:", v53);

  if (-[_TVStackCommonTemplateController isViewLoaded](self, "isViewLoaded"))
  {
    -[_TVStackCommonTemplateController _updateBackgroundViews](self, "_updateBackgroundViews");
    -[_TVStackCommonTemplateController _updateViewOverlay](self, "_updateViewOverlay");
    -[_TVStackCommonTemplateController _updateViewSupplementaryViews](self, "_updateViewSupplementaryViews");
    -[_TVStackCommonTemplateController _updateViewLayout](self, "_updateViewLayout");
  }

}

- (void)loadView
{
  _TVStackWrappingView *v3;
  void *v4;
  _TVStackWrappingView *v5;
  _TVStackViewFlowLayout *v6;
  _TVStackCollectionView *v7;
  _TVStackCollectionView *v8;
  TVObservableEventController *v9;
  TVObservableEventController *observableEventController;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id location;

  v3 = [_TVStackWrappingView alloc];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[_TVStackWrappingView initWithFrame:](v3, "initWithFrame:");

  -[_TVStackCommonTemplateController setView:](self, "setView:", v5);
  objc_initWeak(&location, self);
  v6 = objc_alloc_init(_TVStackViewFlowLayout);
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __44___TVStackCommonTemplateController_loadView__block_invoke;
  v18 = &unk_24EB86420;
  objc_copyWeak(&v19, &location);
  -[_TVStackViewFlowLayout setOnPrepareLayout:](v6, "setOnPrepareLayout:", &v15);
  v7 = [_TVStackCollectionView alloc];
  -[_TVStackWrappingView bounds](v5, "bounds", v15, v16, v17, v18);
  v8 = -[_TVStackCollectionView initWithFrame:collectionViewLayout:](v7, "initWithFrame:collectionViewLayout:", v6);
  -[_TVStackCollectionView registerClass:forCellWithReuseIdentifier:](v8, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("TVStackViewCollectionCellIdentifier"));
  -[_TVStackCollectionView setDelegate:](v8, "setDelegate:", self);
  -[_TVStackCollectionView setDataSource:](v8, "setDataSource:", self);
  -[_TVStackCollectionView setBackgroundColor:](v8, "setBackgroundColor:", 0);
  -[_TVStackCollectionView setOpaque:](v8, "setOpaque:", 0);
  -[_TVStackCollectionView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
  -[_TVStackCollectionView setShowsVerticalScrollIndicator:](v8, "setShowsVerticalScrollIndicator:", 0);
  -[_TVStackCollectionView setShowsHorizontalScrollIndicator:](v8, "setShowsHorizontalScrollIndicator:", 0);
  -[_TVStackCollectionView setAlwaysBounceVertical:](v8, "setAlwaysBounceVertical:", 1);
  -[_TVStackCollectionView _setContentInsetAdjustmentBehavior:](v8, "_setContentInsetAdjustmentBehavior:", 2);
  -[_TVStackWrappingView setStackView:](v5, "setStackView:", v8);
  -[_TVStackCommonTemplateController setCollectionView:](self, "setCollectionView:", v8);
  -[_TVStackCommonTemplateController _updateBackgroundViews](self, "_updateBackgroundViews");
  -[_TVStackCommonTemplateController _updateViewOverlay](self, "_updateViewOverlay");
  -[_TVStackCommonTemplateController _updateViewSupplementaryViews](self, "_updateViewSupplementaryViews");
  -[_TVStackCommonTemplateController _updateViewLayout](self, "_updateViewLayout");
  v9 = objc_alloc_init(TVObservableEventController);
  observableEventController = self->_observableEventController;
  self->_observableEventController = v9;

  -[_TVStackCommonTemplateController viewElement](self, "viewElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appDocument");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVTemplateFeaturesManager featuresManagerForAppDocument:](TVTemplateFeaturesManager, "featuresManagerForAppDocument:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "pushContext:forFeature:", self, &unk_2557BDFC8);
  objc_msgSend(v13, "currentContextForFeature:", &unk_2557D1F48);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVStackCommonTemplateController setMediaPlayer:](self, "setMediaPlayer:", v14);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)traitCollectionDidChange:(id)a3
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
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)_TVStackCommonTemplateController;
  v4 = a3;
  -[_TVStackCommonTemplateController traitCollectionDidChange:](&v20, sel_traitCollectionDidChange_, v4);
  -[_TVStackCommonTemplateController popoverPresentationController](self, "popoverPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "presenting"))
    goto LABEL_8;
  -[_TVStackCommonTemplateController popoverPresentationController](self, "popoverPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", self))
  {

LABEL_6:
    -[_TVStackCommonTemplateController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = 0;
    goto LABEL_10;
  }
  -[_TVStackCommonTemplateController popoverPresentationController](self, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_TVModalPresenter presenter](_TVModalPresenter, "presenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "modalRootViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqual:", v11))
  {

LABEL_8:
    goto LABEL_9;
  }
  -[_TVStackCommonTemplateController _modalPresenterPresentedViewController](self, "_modalPresenterPresentedViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[_TVStackCommonTemplateController isEqual:](self, "isEqual:", v12);

  if (v19)
    goto LABEL_6;
LABEL_9:
  -[_TVStackCommonTemplateController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = 1;
LABEL_10:
  objc_msgSend(v13, "setAlwaysBounceVertical:", v15);

  -[_TVStackCommonTemplateController traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "userInterfaceStyle");
  v18 = objc_msgSend(v4, "userInterfaceStyle");

  if (v17 != v18)
    -[_TVStackCommonTemplateController updateBackgroundAndBackdrop](self, "updateBackgroundAndBackdrop");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVStackCommonTemplateController;
  -[_TVBgImageLoadingViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[_TVStackCommonTemplateController _updateImpressions](self, "_updateImpressions");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVStackCommonTemplateController;
  -[_TVBgImageLoadingViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[_TVStackCommonTemplateController _cancelImpressionsUpdate](self, "_cancelImpressionsUpdate");
}

- (id)preferredFocusEnvironments
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (-[IKViewElement isDisabled](self->_viewElement, "isDisabled"))
  {
    if (self->_disabledTemplateFocusCaptureView)
    {
      v10[0] = self->_disabledTemplateFocusCaptureView;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return MEMORY[0x24BDBD1A8];
    }
  }
  else
  {
    -[_TVStackCommonTemplateController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutIfNeeded");

    -[_TVStackCommonTemplateController _preferredFocusedSupplementaryView](self, "_preferredFocusedSupplementaryView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[_TVStackCommonTemplateController _preferredFocusedSupplementaryView](self, "_preferredFocusedSupplementaryView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)_TVStackCommonTemplateController;
      -[_TVStackCommonTemplateController preferredFocusEnvironments](&v8, sel_preferredFocusEnvironments);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    return v7;
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusedView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_TVStackCommonTemplateController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isDescendantOfView:", v7);

    if (v8)
    {
      -[_TVStackCommonTemplateController focusedSupplementaryViewController](self, "focusedSupplementaryViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v6, "isDescendantOfView:", v10);

      if ((v11 & 1) == 0)
      {
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        -[_TVStackCommonTemplateController supplementaryViewControllers](self, "supplementaryViewControllers", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v20;
          while (2)
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v12);
              v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
              objc_msgSend(v16, "view");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v6, "isDescendantOfView:", v17);

              if (v18)
              {
                v13 = v16;
                goto LABEL_14;
              }
            }
            v13 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
            if (v13)
              continue;
            break;
          }
        }
LABEL_14:

        -[_TVStackCommonTemplateController setFocusedSupplementaryViewController:](self, "setFocusedSupplementaryViewController:", v13);
      }
    }
  }

}

- (void)scrollToTop
{
  id v2;

  -[_TVStackCommonTemplateController collectionView](self, "collectionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scrollToTopIfPossible:", 1);

}

- (BOOL)automaticallyAdjustsScrollViewInsets
{
  return 0;
}

- (void)setMediaPlayer:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mediaPlayer);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_mediaPlayer);
    objc_msgSend(v5, "removeObserver:", self);

    v6 = objc_storeWeak((id *)&self->_mediaPlayer, obj);
    objc_msgSend(obj, "addObserver:forEvent:", self, CFSTR("TVMediaPlayingStateDidChangeEvent"));

    v7 = objc_loadWeakRetained((id *)&self->_mediaPlayer);
    objc_msgSend(v7, "addObserver:forEvent:", self, CFSTR("TVMediaPlayingCoverImageDidChangeEvent"));

    -[_TVStackCommonTemplateController _mediaPlayerStateDidChange](self, "_mediaPlayerStateDidChange");
    -[_TVStackCommonTemplateController _mediaPlayerCoverImageDidChange](self, "_mediaPlayerCoverImageDidChange");
  }

}

- (void)setSelectedMediaInfo:(id)a3
{
  TVMediaInfo *v5;
  TVMediaInfo *selectedMediaInfo;
  BOOL v7;
  void *v8;
  TVMediaInfo *v9;

  v5 = (TVMediaInfo *)a3;
  selectedMediaInfo = self->_selectedMediaInfo;
  if (selectedMediaInfo != v5)
  {
    v9 = v5;
    v7 = -[TVMediaInfo isEqual:](selectedMediaInfo, "isEqual:", v5);
    v5 = v9;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_selectedMediaInfo, a3);
      -[_TVStackCommonTemplateController observableEventController](self, "observableEventController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dispatchEvent:sender:withUserInfo:", CFSTR("TVSelectedMediaInfoDidChangeEvent"), self, 0);

      v5 = v9;
    }
  }

}

- (void)handleEvent:(id)a3 sender:(id)a4 withUserInfo:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;

  v10 = (__CFString *)a3;
  v8 = a4;
  v9 = a5;
  if (CFSTR("TVMediaPlayingStateDidChangeEvent") == v10)
  {
    -[_TVStackCommonTemplateController _mediaPlayerStateDidChange](self, "_mediaPlayerStateDidChange");
  }
  else if (CFSTR("TVMediaPlayingCoverImageDidChangeEvent") == v10)
  {
    -[_TVStackCommonTemplateController _mediaPlayerCoverImageDidChange](self, "_mediaPlayerCoverImageDidChange");
  }

}

- (void)addObserver:(id)a3 forEvent:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_TVStackCommonTemplateController observableEventController](self, "observableEventController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:forEvent:", v7, v6);

}

- (void)removeObserver:(id)a3 forEvent:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_TVStackCommonTemplateController observableEventController](self, "observableEventController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:forEvent:", v7, v6);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_TVStackCommonTemplateController observableEventController](self, "observableEventController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[_TVStackCommonTemplateController supplementaryViewControllers](self, "supplementaryViewControllers", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[_TVStackCommonTemplateController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("TVStackViewCollectionCellIdentifier"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_TVStackCommonTemplateController supplementaryViewControllers](self, "supplementaryViewControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v5, "item"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setViewController:", v9);
  }

  return v7;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;

  -[_TVStackCommonTemplateController updateBackgroundAndBackdropMaskFactor](self, "updateBackgroundAndBackdropMaskFactor", a3);
  -[_TVStackCommonTemplateController _updateImpressions](self, "_updateImpressions");
  if (self->_impressionThreshold > 0.0)
  {
    -[_TVStackCollectionView visibleCells](self->_collectionView, "visibleCells");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_23);

  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  void *v6;
  char v7;
  id v8;

  objc_msgSend(a4, "viewController", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_TVStackCommonTemplateController childViewControllers](self, "childViewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v8);

    if ((v7 & 1) == 0)
    {
      -[_TVStackCommonTemplateController addChildViewController:](self, "addChildViewController:", v8);
      objc_msgSend(v8, "didMoveToParentViewController:", self);
    }
  }

}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a4;
  objc_msgSend(v10, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_TVStackCommonTemplateController childViewControllers](self, "childViewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "containsObject:", v6) & 1) != 0)
    {
      objc_msgSend(v6, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isDescendantOfView:", v10);

      if (v9)
      {
        objc_msgSend(v6, "willMoveToParentViewController:", 0);
        objc_msgSend(v6, "removeFromParentViewController");
      }
    }
    else
    {

    }
  }

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  -[_TVStackCommonTemplateController _dispatchEvent:forItemAtIndexPath:](self, "_dispatchEvent:forItemAtIndexPath:", CFSTR("select"), a4);
}

- (void)collectionView:(id)a3 didReceivePhysicalPlayForItemAtIndexPath:(id)a4
{
  -[_TVStackCommonTemplateController _dispatchEvent:forItemAtIndexPath:](self, "_dispatchEvent:forItemAtIndexPath:", CFSTR("play"), a4);
}

- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4
{
  -[_TVStackCommonTemplateController _dispatchEvent:forItemAtIndexPath:](self, "_dispatchEvent:forItemAtIndexPath:", CFSTR("holdselect"), a4);
}

- (BOOL)collectionView:(id)a3 shouldHandleLongPressForItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)updateBackgroundAndBackdrop
{
  void *v3;
  void *v4;
  int v5;
  int64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  id v14;

  -[_TVStackCommonTemplateController stackWrappingView](self, "stackWrappingView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[IKImageElement style](self->_bgImgElement, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tv_imageTreatment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("blurOverlay"));

  if (v5)
  {
    v6 = -[_TVStackCommonTemplateController _blurEffectStyle](self, "_blurEffectStyle");
    v7 = -[_TVStackCommonTemplateController _backgroundImageRequiresBlur](self, "_backgroundImageRequiresBlur");
    v8 = 4014;
    if (v6 != 4000)
      v8 = 4015;
    if (v7)
      v9 = v8;
    else
      v9 = v6;
    objc_msgSend(v14, "setBackdropBlurEffectStyle:", v9);
    objc_msgSend(v14, "bounds");
    v11 = v10;
    -[IKImageElement style](self->_bgImgElement, "style");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tv_padding");
    objc_msgSend(v14, "setBackdropInitialPeek:", v11 - v13);

    objc_msgSend(v14, "setBackdropPeekGradient:", 0.0);
  }
  else
  {
    objc_msgSend(v14, "setBackdropBlurEffectStyle:", 0x8000000000000000);
  }

}

- (void)updateBackgroundAndBackdropMaskFactor
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  -[_TVStackCommonTemplateController stackWrappingView](self, "stackWrappingView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v3 = v2;
  objc_msgSend(v15, "stackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentOffset");
  v6 = v5;

  objc_msgSend(v15, "stackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentInset");
  v9 = v8;

  objc_msgSend(v15, "backdropInitialPeek");
  v11 = v3 - v10;
  v12 = 1.0;
  v13 = 1.0;
  if (v11 > 0.0)
    v13 = (v11 - v9 - v6) / v11;
  v14 = 0.0;
  if (v13 >= 0.0)
    v14 = v13;
  if (v14 <= 1.0)
    v12 = v14;
  objc_msgSend(v15, "setBackdropMaskFactor:", v12);

}

- (id)parsedMediaInfo
{
  TVBackgroundMediaInfo *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  -[_TVStackCommonTemplateController bgMediaContentElement](self, "bgMediaContentElement");
  v3 = (TVBackgroundMediaInfo *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v3 = objc_alloc_init(TVBackgroundMediaInfo);
    -[_TVStackCommonTemplateController viewElement](self, "viewElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "style");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tv_backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "color");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVMediaInfo setBackgroundColor:](v3, "setBackgroundColor:", v7);

    -[_TVStackCommonTemplateController bgMediaContentElement](self, "bgMediaContentElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playerBridge");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVBackgroundMediaInfo setPlayerBridge:](v3, "setPlayerBridge:", v9);

    -[_TVStackCommonTemplateController _backgroundImageProxy](self, "_backgroundImageProxy");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
    {
      v14[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVMediaInfo setImageProxies:](v3, "setImageProxies:", v12);

    }
  }
  return v3;
}

- (void)_updateImpressions
{
  -[_TVStackCommonTemplateController _cancelImpressionsUpdate](self, "_cancelImpressionsUpdate");
  if (self->_impressionThreshold > 0.0)
    -[_TVStackCommonTemplateController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__recordImpressionsForVisibleView, 0);
}

- (void)_cancelImpressionsUpdate
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__recordImpressionsForVisibleView, 0);
}

- (void)_recordImpressionsForVisibleView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_TVStackCommonTemplateController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IKViewElement appDocument](self->_viewElement, "appDocument");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[_TVStackCommonTemplateController impressionableElementsContainedInDocument:](self, "impressionableElementsContainedInDocument:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
      objc_msgSend(v6, "recordImpressionsForViewElements:", v5);

  }
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IKViewElement appDocument](self->_viewElement, "appDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if (v6)
  {
    -[_TVStackCollectionView visibleCells](self->_collectionView, "visibleCells");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_TVStackCommonTemplateController isViewLoaded](self, "isViewLoaded"))
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v25 = v7;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v31;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v31 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v13), "viewController");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "tv_impressionableElementsForDocument:", v4);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObjectsFromArray:", v15);

            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        }
        while (v11);
      }

      -[_TVStackCollectionView visibleSupplementaryViewsOfKind:](self->_collectionView, "visibleSupplementaryViewsOfKind:", CFSTR("TVStackElementKindHeader"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v27;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v27 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v20), "viewController");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "tv_impressionableElementsForDocument:", v4);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObjectsFromArray:", v22);

            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        }
        while (v18);
      }

      v7 = v25;
    }
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (CGSize)_backgroundImageProxySize
{
  IKImageElement *heroImgElement;
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  heroImgElement = self->_heroImgElement;
  if (heroImgElement || (heroImgElement = self->_bgImgElement) != 0)
  {
    -[IKImageElement tv_imageScaleToSize](heroImgElement, "tv_imageScaleToSize");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_TVStackCommonTemplateController;
    -[_TVBgImageLoadingViewController _backgroundImageProxySize](&v5, sel__backgroundImageProxySize);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)_backgroundImageProxy
{
  void *v3;
  uint64_t v4;
  IKImageElement *heroImgElement;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_graphicsQuality");

  if (v4 == 10)
    return 0;
  heroImgElement = self->_heroImgElement;
  if (heroImgElement)
  {
    -[IKImageElement tv_imageProxy](heroImgElement, "tv_imageProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!self->_bgImgElement)
      return 0;
    -[IKViewElement appDocument](self->_viewElement, "appDocument");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tv_adjustedWindowSize");
    v10 = v9;
    v12 = v11;

    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "setImageSize:", v10, v12);
    v14 = +[TVImageLayout layoutWithLayout:element:](TVImageLayout, "layoutWithLayout:element:", v13, self->_bgImgElement);
    -[IKImageElement tv_imageProxyWithLayout:](self->_bgImgElement, "tv_imageProxyWithLayout:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)_backgroundImageRequiresBlur
{
  return self->_heroImgElement != 0;
}

- (int64_t)_blurEffectStyle
{
  if (+[TVMLUtilities interfaceStyleForTemplateElement:](TVMLUtilities, "interfaceStyleForTemplateElement:", self->_viewElement) == 1)return 4000;
  else
    return 4005;
}

- (BOOL)_isBackdropNeeded
{
  return 0;
}

- (void)_configureWithBgImage:(id)a3 backdropImage:(id)a4
{
  -[_TVStackCommonTemplateController setBgImage:](self, "setBgImage:", a3, a4);
  if (-[_TVStackCommonTemplateController isViewLoaded](self, "isViewLoaded"))
    -[_TVStackCommonTemplateController _updateBackgroundViews](self, "_updateBackgroundViews");
}

- (BOOL)_shouldLoadBackgroundImageAsynchronously
{
  void *v2;
  char v3;

  -[_TVStackCommonTemplateController _backgroundImageProxy](self, "_backgroundImageProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isImageAvailable") ^ 1;

  return v3;
}

- (id)viewControllerWithElement:(id)a3 layout:(id)a4 existingController:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _TVStackWrappingViewController *v15;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_viewControllerFromElement:layout:existingController:", v7, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_viewFromElement:existingView:", v7, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = (_TVStackWrappingViewController *)v8;
      else
        v15 = objc_alloc_init(_TVStackWrappingViewController);
      v11 = v15;
      -[_TVStackWrappingViewController setView:](v15, "setView:", v14);
      objc_msgSend(v11, "tv_setAssociatedIKViewElement:", v7);
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (BOOL)_updateSupplementaryViewControllersWithElements:(id)a3 updateStyles:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  id v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  _TVStackCommonTemplateController *v34;
  void *v35;
  uint64_t v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  id obj;
  _TVStackCommonTemplateController *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[5];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v4 = a4;
  v65 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (!v4
    || (v8 = objc_msgSend(v6, "count"),
        -[_TVStackCommonTemplateController supplementaryViewControllers](self, "supplementaryViewControllers"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "count"),
        v9,
        v8 != v10))
  {
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    -[_TVStackCommonTemplateController supplementaryViewControllers](self, "supplementaryViewControllers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v12, "mutableCopy");

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v41 = v7;
    obj = v7;
    v43 = self;
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
    v13 = 0;
    if (v47)
    {
      v45 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v47; ++i)
        {
          if (*(_QWORD *)v58 != v45)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          objc_msgSend(v15, "autoHighlightIdentifier", v41);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
            objc_msgSend(v15, "resetProperty:", 2);
          v55 = 0u;
          v56 = 0u;
          v53 = 0u;
          v54 = 0u;
          v17 = v46;
          v18 = (id)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
          if (v18)
          {
            v48 = v13;
            v19 = *(_QWORD *)v54;
            while (2)
            {
              for (j = 0; j != v18; j = (char *)j + 1)
              {
                if (*(_QWORD *)v54 != v19)
                  objc_enumerationMutation(v17);
                v21 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)j);
                objc_msgSend(v21, "tv_associatedIKViewElement");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v22, "tv_elementType");

                if (v23 == objc_msgSend(v15, "tv_elementType"))
                {
                  v18 = v21;
                  goto LABEL_21;
                }
              }
              v18 = (id)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
              if (v18)
                continue;
              break;
            }
LABEL_21:
            self = v43;
            v13 = v48;
          }

          -[_TVStackCommonTemplateController viewControllerWithElement:layout:existingController:](self, "viewControllerWithElement:layout:existingController:", v15, 0, v18);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v24)
          {
            if (!v13 && v16)
              v13 = v24;
            objc_msgSend(v44, "addObject:", v25);
          }
          if (v18 && v18 == v25)
            objc_msgSend(v17, "removeObjectIdenticalTo:", v18);

        }
        v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
      }
      while (v47);
    }
    v26 = v13;

    v11 = objc_msgSend(v46, "count") != 0;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v27 = v46;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v50;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v50 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * k);
          objc_msgSend(v32, "willMoveToParentViewController:", 0, v41);
          objc_msgSend(v32, "view");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "removeFromSuperview");

          objc_msgSend(v32, "removeFromParentViewController");
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
      }
      while (v29);
    }

    self = v43;
    -[_TVStackCommonTemplateController setSupplementaryViewControllers:](v43, "setSupplementaryViewControllers:", v44);
    v34 = v43;
    if (v26)
    {
      v35 = v26;
    }
    else
    {
      -[_TVStackCommonTemplateController focusedSupplementaryViewController](v43, "focusedSupplementaryViewController");
      v37 = objc_claimAutoreleasedReturnValue();
      if (!v37)
        goto LABEL_42;
      v38 = (void *)v37;
      -[_TVStackCommonTemplateController focusedSupplementaryViewController](v43, "focusedSupplementaryViewController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v44, "containsObject:", v39);

      if ((v40 & 1) != 0)
        goto LABEL_42;
      v34 = v43;
      v35 = 0;
    }
    -[_TVStackCommonTemplateController setFocusedSupplementaryViewController:](v34, "setFocusedSupplementaryViewController:", v35, v41);
LABEL_42:

    v7 = v41;
    goto LABEL_43;
  }
  v61[0] = MEMORY[0x24BDAC760];
  v61[1] = 3221225472;
  v61[2] = __97___TVStackCommonTemplateController__updateSupplementaryViewControllersWithElements_updateStyles___block_invoke;
  v61[3] = &unk_24EB86488;
  v61[4] = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v61);
  v11 = 0;
LABEL_43:
  -[_TVStackCommonTemplateController didUpdateSupplementarySectionInfo](self, "didUpdateSupplementarySectionInfo", v41);

  return v11;
}

- (id)_flowLayout
{
  void *v2;
  void *v3;

  -[_TVStackCommonTemplateController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_overlayView
{
  return self->_overlayView;
}

- (void)_updateViewOverlay
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UIView setComponentsNeedUpdate](self->_overlayView, "setComponentsNeedUpdate");
  -[_TVStackCommonTemplateController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_overlayView);

  -[UIView sizeToFit](self->_overlayView, "sizeToFit");
}

- (void)_updateBackgroundViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[_TVStackCommonTemplateController parsedMediaInfo](self, "parsedMediaInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVStackCommonTemplateController setSelectedMediaInfo:](self, "setSelectedMediaInfo:", v3);

  -[_TVStackCommonTemplateController stackWrappingView](self, "stackWrappingView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[_TVStackCommonTemplateController selectedMediaInfo](self, "selectedMediaInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVStackCommonTemplateController mediaPlayer](self, "mediaPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coverImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[_TVStackCommonTemplateController bgImage](self, "bgImage");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v15, "setBackgroundImage:", v9);
  objc_msgSend(v15, "setUsesBackgroundImage:", v4 == 0);
  -[_TVStackCommonTemplateController viewElement](self, "viewElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tv_backgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "color");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v13);

  -[_TVStackCommonTemplateController mediaPlayer](self, "mediaPlayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v14, "isPlaying");

  objc_msgSend(v15, "setBackdropImage:", v9);
  objc_msgSend(v15, "setUsesBackdropImage:", v11 ^ 1);
  -[_TVStackCommonTemplateController updateBackgroundAndBackdrop](self, "updateBackgroundAndBackdrop");

}

- (void)_updateViewSupplementaryViews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];

  -[_TVStackCommonTemplateController stackWrappingView](self, "stackWrappingView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_TVStackCommonTemplateController supplementaryViewControllers](self, "supplementaryViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVStackCommonTemplateController viewElement](self, "viewElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "tv_semanticContentAttribute");

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65___TVStackCommonTemplateController__updateViewSupplementaryViews__block_invoke;
  v8[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
  v8[4] = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);
  objc_msgSend(v7, "setHeaderSupplementaryViews:", v4);

}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_TVStackCommonTemplateController;
  -[_TVStackCommonTemplateController viewSafeAreaInsetsDidChange](&v10, sel_viewSafeAreaInsetsDidChange);
  -[_TVStackCommonTemplateController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  -[_TVStackCommonTemplateController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaInsets");
  v8 = v7;

  -[_TVStackCommonTemplateController stackWrappingView](self, "stackWrappingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configureSupplementaryCellLayoutAttributesWithAutomaticInsets:sectionIndex:", -[_TVStackCommonTemplateController _supplementaryViewSectionIndex](self, "_supplementaryViewSectionIndex"), v5, 0.0, v8, 0.0);

}

- (void)_updateViewLayout
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[_TVStackCommonTemplateController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVStackCommonTemplateController viewElement](self, "viewElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSemanticContentAttribute:", objc_msgSend(v4, "tv_semanticContentAttribute"));

  -[_TVStackCommonTemplateController stackWrappingView](self, "stackWrappingView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[_TVStackCommonTemplateController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaInsets");
  v7 = v6;
  -[_TVStackCommonTemplateController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeAreaInsets");
  v10 = v9;

  -[_TVStackCommonTemplateController updateBackgroundAndBackdropMaskFactor](self, "updateBackgroundAndBackdropMaskFactor");
  -[_TVStackCommonTemplateController viewElement](self, "viewElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "transferLayoutStylesFromElement:", v11);

  objc_msgSend(v14, "stackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVStackCommonTemplateController collectionListElement](self, "collectionListElement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transferLayoutStylesFromElement:", v13);

  objc_msgSend(v14, "configureSupplementaryCellLayoutAttributesWithAutomaticInsets:sectionIndex:", -[_TVStackCommonTemplateController _supplementaryViewSectionIndex](self, "_supplementaryViewSectionIndex"), v7, 0.0, v10, 0.0);
}

- (id)_modalPresenterPresentedViewController
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[_TVModalPresenter presenter](_TVModalPresenter, "presenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "templateViewController");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (void)_disableScrollingIfNecessary:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _BOOL8 v21;
  void *v22;
  id v23;

  v4 = a3;
  v23 = v4;
  if (v4)
  {
    objc_msgSend(v4, "popoverPresentationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v23, "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "popoverPresentationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v8 == 0;

    }
  }
  else
  {
    v6 = 1;
  }
  -[_TVStackCommonTemplateController viewElement](self, "viewElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("disableScrolling"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (!v6 && v12)
  {
    -[_TVStackCommonTemplateController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stackView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "collectionViewLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "collectionViewContentSize");
    v17 = v16;

    objc_msgSend(v14, "contentInset");
    v19 = v18;
    objc_msgSend(v13, "bounds");
    v21 = v20 - v19 - v17 <= 8.0;
    -[_TVStackCommonTemplateController collectionView](self, "collectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setScrollEnabled:", v21);

  }
}

- (id)_preferredFocusedSupplementaryView
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[_TVStackCommonTemplateController focusedSupplementaryViewController](self, "focusedSupplementaryViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[_TVStackCommonTemplateController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPathForLastFocusedItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v4 = 0;
      goto LABEL_26;
    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[_TVStackCommonTemplateController supplementaryViewControllers](self, "supplementaryViewControllers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (!v8)
    {
      v4 = 0;
      goto LABEL_25;
    }
    v9 = v8;
    v4 = 0;
    v10 = *(_QWORD *)v21;
LABEL_7:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
      if (v4)
        goto LABEL_16;
      objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "canBecomeFocused") & 1) != 0)
      {
        v14 = -[_TVStackCommonTemplateController numberOfCollections](self, "numberOfCollections");

        if (!v14)
        {
          v4 = v12;
          goto LABEL_16;
        }
      }
      else
      {

      }
      v4 = 0;
LABEL_16:
      objc_msgSend(v12, "tv_associatedIKViewElement");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "tv_elementType");

      if (v16 == 57 || v16 == 45)
      {
        v17 = v12;

        v4 = v17;
      }
      if (v16 == 45 || v16 == 57)
        goto LABEL_25;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (!v9)
        {
LABEL_25:

          goto LABEL_26;
        }
        goto LABEL_7;
      }
    }
  }
  -[_TVStackCommonTemplateController focusedSupplementaryViewController](self, "focusedSupplementaryViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:
  objc_msgSend(v4, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)_dispatchEvent:(id)a3 forItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[_TVStackCommonTemplateController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItemAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tv_associatedIKViewElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && (objc_msgSend(v10, "isDisabled") & 1) == 0)
    objc_msgSend(v10, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", v11, 1, 1, 0, v8, 0);

}

- (void)_mediaPlayerStateDidChange
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[_TVStackCommonTemplateController mediaPlayer](self, "mediaPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPlaying");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[_TVStackCommonTemplateController childViewControllers](self, "childViewControllers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[_TVStackCommonTemplateController setOverrideTraitCollection:forChildViewController:](self, "setOverrideTraitCollection:forChildViewController:", v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[_TVStackCommonTemplateController _updateBackgroundViews](self, "_updateBackgroundViews");
}

- (IKViewElement)viewElement
{
  return self->_viewElement;
}

- (void)setViewElement:(id)a3
{
  objc_storeStrong((id *)&self->_viewElement, a3);
}

- (_TVStackCollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (IKViewElement)collectionListElement
{
  return self->_collectionListElement;
}

- (void)setCollectionListElement:(id)a3
{
  objc_storeStrong((id *)&self->_collectionListElement, a3);
}

- (TVObservableEventController)observableEventController
{
  return self->_observableEventController;
}

- (IKAudioElement)audioElement
{
  return self->_audioElement;
}

- (void)setAudioElement:(id)a3
{
  objc_storeStrong((id *)&self->_audioElement, a3);
}

- (IKViewElement)backgroundElement
{
  return self->_backgroundElement;
}

- (void)setBackgroundElement:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundElement, a3);
}

- (IKImageElement)heroImgElement
{
  return self->_heroImgElement;
}

- (void)setHeroImgElement:(id)a3
{
  objc_storeStrong((id *)&self->_heroImgElement, a3);
}

- (IKImageElement)bgImgElement
{
  return self->_bgImgElement;
}

- (void)setBgImgElement:(id)a3
{
  objc_storeStrong((id *)&self->_bgImgElement, a3);
}

- (IKImageElement)uberImgElement
{
  return self->_uberImgElement;
}

- (void)setUberImgElement:(id)a3
{
  objc_storeStrong((id *)&self->_uberImgElement, a3);
}

- (IKMediaContentElement)bgMediaContentElement
{
  return self->_bgMediaContentElement;
}

- (void)setBgMediaContentElement:(id)a3
{
  objc_storeStrong((id *)&self->_bgMediaContentElement, a3);
}

- (UIImage)bgImage
{
  return self->_bgImage;
}

- (void)setBgImage:(id)a3
{
  objc_storeStrong((id *)&self->_bgImage, a3);
}

- (TVMediaPlaying)mediaPlayer
{
  return (TVMediaPlaying *)objc_loadWeakRetained((id *)&self->_mediaPlayer);
}

- (TVMediaInfo)selectedMediaInfo
{
  return self->_selectedMediaInfo;
}

- (NSArray)supplementaryViewControllers
{
  return self->_supplementaryViewControllers;
}

- (void)setSupplementaryViewControllers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1144);
}

- (UIViewController)focusedSupplementaryViewController
{
  return self->_focusedSupplementaryViewController;
}

- (void)setFocusedSupplementaryViewController:(id)a3
{
  objc_storeStrong((id *)&self->_focusedSupplementaryViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedSupplementaryViewController, 0);
  objc_storeStrong((id *)&self->_supplementaryViewControllers, 0);
  objc_storeStrong((id *)&self->_selectedMediaInfo, 0);
  objc_destroyWeak((id *)&self->_mediaPlayer);
  objc_storeStrong((id *)&self->_bgImage, 0);
  objc_storeStrong((id *)&self->_bgMediaContentElement, 0);
  objc_storeStrong((id *)&self->_uberImgElement, 0);
  objc_storeStrong((id *)&self->_bgImgElement, 0);
  objc_storeStrong((id *)&self->_heroImgElement, 0);
  objc_storeStrong((id *)&self->_backgroundElement, 0);
  objc_storeStrong((id *)&self->_audioElement, 0);
  objc_storeStrong((id *)&self->_observableEventController, 0);
  objc_storeStrong((id *)&self->_collectionListElement, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_disabledTemplateFocusCaptureView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
}

@end
