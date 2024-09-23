@implementation _TVAlertTemplateController

- (void)updateWithViewElement:(id)a3
{
  id v5;
  id v6;
  IKImageElement **p_bgImageElement;
  IKImageElement *bgImageElement;
  IKImageElement **p_bgHeroImageElement;
  IKImageElement *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t i;
  void *v19;
  unint64_t v20;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  uint64_t v38;
  id *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSArray *collectionViewElements;
  uint64_t v49;
  uint64_t v50;
  NSIndexPath *lastFocusedIndexPath;
  unint64_t v52;
  NSIndexPath *v53;
  void *v54;
  int v55;
  void *v56;
  _TVAlertTemplateController *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  id obj;
  char v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  objc_super v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v73.receiver = self;
  v73.super_class = (Class)_TVAlertTemplateController;
  -[_TVBgImageLoadingViewController updateWithViewElement:](&v73, sel_updateWithViewElement_, v5);
  v55 = -[_TVAlertTemplateController isViewLoaded](self, "isViewLoaded");
  -[_TVAlertTemplateController view](self, "view");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v60 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_storeStrong((id *)&self->_templateElement, a3);
  p_bgImageElement = &self->_bgImageElement;
  bgImageElement = self->_bgImageElement;
  self->_bgImageElement = 0;

  v57 = self;
  p_bgHeroImageElement = &self->_bgHeroImageElement;
  v10 = *p_bgHeroImageElement;
  *p_bgHeroImageElement = 0;

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v58 = v5;
  objc_msgSend(v5, "children");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
  if (!v11)
  {
    v62 = 0;
    v16 = 0.0;
    v17 = 0.0;
    goto LABEL_42;
  }
  v12 = v11;
  v64 = 0;
  v62 = 0;
  v13 = *(_QWORD *)v70;
  v14 = *MEMORY[0x24BDBF148];
  v15 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v16 = 0.0;
  v17 = 0.0;
  v59 = v6;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v70 != v13)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
      v20 = objc_msgSend(v19, "tv_elementType");
      if (v20 > 0x17 || ((1 << v20) & 0x8000C0) == 0)
      {
        if (objc_msgSend(v19, "tv_elementType") == 4)
        {
          v67 = 0u;
          v68 = 0u;
          v65 = 0u;
          v66 = 0u;
          objc_msgSend(v19, "children");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v66;
            do
            {
              for (j = 0; j != v34; ++j)
              {
                if (*(_QWORD *)v66 != v35)
                  objc_enumerationMutation(v27);
                v37 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
                if (*p_bgImageElement
                  || (v38 = objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * j), "tv_imageType"),
                      v39 = (id *)p_bgImageElement,
                      v38))
                {
                  if (*p_bgHeroImageElement)
                    continue;
                  v40 = objc_msgSend(v37, "tv_imageType");
                  v39 = (id *)p_bgHeroImageElement;
                  if (v40 != 3)
                    continue;
                }
                objc_storeStrong(v39, v37);
              }
              v34 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
            }
            while (v34);
            v6 = v59;
          }
        }
        else
        {
          +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "_viewFromElement:existingView:", v19, 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            if (objc_msgSend(v6, "count"))
              v42 = v60;
            else
              v42 = v61;
            objc_msgSend(v42, "addObject:", v27);
          }
        }
      }
      else
      {
        v22 = v20;
        objc_msgSend(v6, "addObject:", v19);
        objc_msgSend(v19, "autoHighlightIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "length");

        if (v24)
        {
          if ((v64 & 1) == 0)
          {
            v25 = v19;

            v62 = v25;
          }
          objc_msgSend(v19, "resetProperty:", 2);
          v64 = 1;
        }
        if ((v22 & 0xFFFFFFFFFFFFFFFELL) == 6)
        {
          +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "_viewFromElement:existingView:", v19, 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v27, "tv_sizeThatFits:", v14, v15);
          v17 = fmax(v17, v28);
          v16 = fmax(v16, v29);
        }
        else
        {
          if (v17 != 0.0)
            continue;
          objc_msgSend(v19, "style");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "tv_width");
          v17 = v31;

          objc_msgSend(v19, "style");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "tv_height");
          v16 = v32;
        }
      }

    }
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
  }
  while (v12);
LABEL_42:

  objc_msgSend(v58, "style");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "tv_backgroundColor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "color");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setBackgroundColor:", v45);

  objc_msgSend(v58, "style");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "tv_padding");
  objc_msgSend(v56, "setPadding:");

  v47 = objc_msgSend(v6, "copy");
  collectionViewElements = v57->_collectionViewElements;
  v57->_collectionViewElements = (NSArray *)v47;

  if (v62)
  {
    v49 = objc_msgSend(v6, "indexOfObject:", v62);
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v49, 0);
    v50 = objc_claimAutoreleasedReturnValue();
    lastFocusedIndexPath = v57->_lastFocusedIndexPath;
    v57->_lastFocusedIndexPath = (NSIndexPath *)v50;

    if (v55)
      -[_TVAlertTemplateController _scrollToPreferredFocusView](v57, "_scrollToPreferredFocusView");
    else
      v57->_updateAutoHighlight = 1;
  }
  else
  {
    v52 = -[NSIndexPath item](v57->_lastFocusedIndexPath, "item");
    if (v52 >= -[NSArray count](v57->_collectionViewElements, "count"))
    {
      v53 = v57->_lastFocusedIndexPath;
      v57->_lastFocusedIndexPath = 0;

    }
  }
  objc_msgSend(v56, "setViewsAbove:", v61);
  objc_msgSend(v56, "setViewsBelow:", v60);
  if (v17 > 0.0 && v16 > 0.0)
  {
    -[_TVCollectionView collectionViewLayout](v57->_collectionView, "collectionViewLayout");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setItemSize:", v17, v16);

  }
  -[_TVCollectionView reloadData](v57->_collectionView, "reloadData");

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TVAlertTemplateController;
  -[_TVBgImageLoadingViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  if (self->_updateAutoHighlight)
  {
    -[_TVAlertTemplateController _scrollToPreferredFocusView](self, "_scrollToPreferredFocusView");
    self->_updateAutoHighlight = 0;
  }
}

- (id)preferredFocusEnvironments
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (self->_collectionView)
  {
    v4[0] = self->_collectionView;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v2;
}

- (void)loadView
{
  _TVAlertTemplateView *v3;
  void *v4;
  void *v5;
  _TVCollectionViewFlowLayout *v6;
  _TVCollectionView *v7;
  _TVCollectionView *v8;
  _TVCollectionView *collectionView;
  _TVCollectionView *v10;
  _TVAlertTemplateView *v11;

  v3 = [_TVAlertTemplateView alloc];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v11 = -[_TVAlertTemplateView initWithFrame:](v3, "initWithFrame:");

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVAlertTemplateView setBackgroundColor:](v11, "setBackgroundColor:", v5);

  v6 = objc_alloc_init(_TVCollectionViewFlowLayout);
  -[UICollectionViewFlowLayout setScrollDirection:](v6, "setScrollDirection:", 0);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v6, "setMinimumLineSpacing:", 14.0);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v6, "setMinimumInteritemSpacing:", 0.0);
  -[UICollectionViewFlowLayout setSectionInset:](v6, "setSectionInset:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
  v7 = [_TVCollectionView alloc];
  v8 = -[_TVCollectionView initWithFrame:collectionViewLayout:](v7, "initWithFrame:collectionViewLayout:", v6, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[_TVCollectionView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
  -[_TVCollectionView setDelegate:](v8, "setDelegate:", self);
  -[_TVCollectionView setDataSource:](v8, "setDataSource:", self);
  -[_TVCollectionView setBackgroundColor:](v8, "setBackgroundColor:", 0);
  -[_TVCollectionView setOpaque:](v8, "setOpaque:", 0);
  -[_TVCollectionView registerClass:forCellWithReuseIdentifier:](v8, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("TVAlertCellIdentifier"));
  -[_TVCollectionView registerClass:forCellWithReuseIdentifier:](v8, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("TVAlertListCellIdentifier"));
  collectionView = self->_collectionView;
  self->_collectionView = v8;
  v10 = v8;

  -[_TVAlertTemplateView setCollectionView:](v11, "setCollectionView:", v10);
  -[_TVAlertTemplateController setView:](self, "setView:", v11);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[NSArray count](self->_collectionViewElements, "count", a3, a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  NSArray *collectionViewElements;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSUInteger v15;
  double v16;
  void *v17;

  v6 = a4;
  collectionViewElements = self->_collectionViewElements;
  v8 = a3;
  -[NSArray objectAtIndex:](collectionViewElements, "objectAtIndex:", objc_msgSend(v6, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "tv_elementType") == 23)
  {
    objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("TVAlertListCellIdentifier"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "_viewFromElement:existingView:", v9, v10);
  }
  else
  {
    objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("TVAlertCellIdentifier"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_viewFromElement:existingView:", v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v14);

    objc_msgSend(v10, "setOpaque:", 0);
    v15 = -[NSArray count](self->_collectionViewElements, "count");
    v16 = (double)(v15 - objc_msgSend(v6, "item"));
    objc_msgSend(v10, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setZPosition:", v16);

    objc_msgSend(v10, "setButtonView:", v11);
    objc_msgSend(v11, "setAutoresizingMask:", 18);
  }

  objc_msgSend(v10, "setClipsToBounds:", 0);
  return v10;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 0;
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  return self->_lastFocusedIndexPath;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  void *v7;
  void *v8;
  NSIndexPath *v9;
  NSIndexPath *lastFocusedIndexPath;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(a4, "nextFocusedIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = (NSIndexPath *)objc_msgSend(v7, "copy");
    lastFocusedIndexPath = self->_lastFocusedIndexPath;
    self->_lastFocusedIndexPath = v9;

    -[NSArray objectAtIndex:](self->_collectionViewElements, "objectAtIndex:", objc_msgSend(v8, "row"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "tv_elementType") == 23)
    {
      objc_msgSend(v13, "cellForItemAtIndexPath:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", CFSTR("highlight"), 1, 1, 0, v12, 0);

    }
  }

}

- (void)collectionView:(id)a3 didReceivePhysicalPlayForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[NSArray objectAtIndex:](self->_collectionViewElements, "objectAtIndex:", objc_msgSend(v6, "row"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "tv_elementType") == 23)
  {
    objc_msgSend(v9, "cellForItemAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", CFSTR("play"), 1, 1, 0, v8, 0);

  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[NSArray objectAtIndex:](self->_collectionViewElements, "objectAtIndex:", objc_msgSend(v6, "row"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "tv_elementType") == 23)
  {
    objc_msgSend(v9, "cellForItemAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", CFSTR("select"), 1, 1, 0, v8, 0);

  }
}

- (CGSize)_backgroundImageProxySize
{
  IKImageElement *bgImageElement;
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  bgImageElement = self->_bgImageElement;
  if (bgImageElement || (bgImageElement = self->_bgHeroImageElement) != 0)
  {
    -[IKImageElement tv_imageScaleToSize](bgImageElement, "tv_imageScaleToSize");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_TVAlertTemplateController;
    -[_TVBgImageLoadingViewController _backgroundImageProxySize](&v5, sel__backgroundImageProxySize);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)_backgroundImageProxy
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  IKImageElement *bgHeroImageElement;

  if (self->_bgImageElement)
  {
    -[IKViewElement appDocument](self->_templateElement, "appDocument");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tv_adjustedWindowSize");
    v5 = v4;
    v7 = v6;

    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setImageSize:", v5, v7);
    v9 = +[TVImageLayout layoutWithLayout:element:](TVImageLayout, "layoutWithLayout:element:", v8, self->_bgImageElement);
    -[IKImageElement tv_imageProxyWithLayout:](self->_bgImageElement, "tv_imageProxyWithLayout:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    bgHeroImageElement = self->_bgHeroImageElement;
    if (bgHeroImageElement)
    {
      -[IKImageElement tv_imageProxy](bgHeroImageElement, "tv_imageProxy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  return v10;
}

- (BOOL)_backgroundImageRequiresBlur
{
  return !self->_bgImageElement && self->_bgHeroImageElement != 0;
}

- (int64_t)_blurEffectStyle
{
  if (+[TVMLUtilities interfaceStyleForTemplateElement:](TVMLUtilities, "interfaceStyleForTemplateElement:", self->_templateElement) == 1)return 4000;
  else
    return 4005;
}

- (void)_configureWithBgImage:(id)a3 backdropImage:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[_TVAlertTemplateController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBgImage:", v5);

}

- (void)_scrollToPreferredFocusView
{
  if (self->_lastFocusedIndexPath)
  {
    -[_TVCollectionView layoutIfNeeded](self->_collectionView, "layoutIfNeeded");
    -[_TVCollectionView scrollToItemAtIndexPath:atScrollPosition:animated:](self->_collectionView, "scrollToItemAtIndexPath:atScrollPosition:animated:", self->_lastFocusedIndexPath, 2, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFocusedIndexPath, 0);
  objc_storeStrong((id *)&self->_bgHeroImageElement, 0);
  objc_storeStrong((id *)&self->_bgImageElement, 0);
  objc_storeStrong((id *)&self->_collectionViewElements, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
}

@end
