@implementation _TVModalPageTemplateController

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v3 = objc_alloc(MEMORY[0x24BDF6F90]);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v11 = (id)objc_msgSend(v3, "initWithFrame:");

  -[IKViewElement style](self->_backgroundElement, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tv_backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v11, "setBackgroundColor:", v10);
  -[_TVModalPageTemplateController setView:](self, "setView:", v11);

}

- (void)viewDidLoad
{
  UIPageViewController *v3;
  UIPageViewController *pageViewController;
  void *v5;
  void *v6;
  void *v7;
  UIPageViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)_TVModalPageTemplateController;
  -[_TVModalPageTemplateController viewDidLoad](&v13, sel_viewDidLoad);
  v3 = (UIPageViewController *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6C30]), "initWithTransitionStyle:navigationOrientation:options:", 1, 0, 0);
  pageViewController = self->_pageViewController;
  self->_pageViewController = v3;

  -[UIPageViewController setDataSource:](self->_pageViewController, "setDataSource:", self);
  -[UIPageViewController view](self->_pageViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVModalPageTemplateController addChildViewController:](self, "addChildViewController:", self->_pageViewController);
  -[_TVModalPageTemplateController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v5, "setFrame:");

  objc_msgSend(v5, "setAutoresizingMask:", 18);
  -[_TVModalPageTemplateController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v5);

  -[UIPageViewController didMoveToParentViewController:](self->_pageViewController, "didMoveToParentViewController:", self);
  if (-[NSArray count](self->_viewControllers, "count"))
  {
    v8 = self->_pageViewController;
    -[NSArray firstObject](self->_bezelViewControllers, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPageViewController setViewControllers:direction:animated:completion:](v8, "setViewControllers:direction:animated:completion:", v10, 0, 0, 0);

  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__tapAction_);
  -[_TVModalPageTemplateController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addGestureRecognizer:", v11);

}

- (void)didMoveToParentViewController:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "setOpaque:", 0);

}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  void *v5;

  if (-[NSArray indexOfObjectIdenticalTo:](self->_bezelViewControllers, "indexOfObjectIdenticalTo:", a4) - 1 > 0x7FFFFFFFFFFFFFFDLL)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_bezelViewControllers, "objectAtIndex:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;

  v5 = -[NSArray indexOfObjectIdenticalTo:](self->_bezelViewControllers, "indexOfObjectIdenticalTo:", a4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || (v6 = v5, v5 >= -[NSArray count](self->_bezelViewControllers, "count") - 1))
  {
    v7 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_bezelViewControllers, "objectAtIndex:", v6 + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)_tapAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_TVModalPageTemplateController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVModalPageTemplateController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v6);
  objc_msgSend(v5, "hitTest:withEvent:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_bezelViewControllers;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v11)
        objc_enumerationMutation(v8);
      objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "contentViewController", (_QWORD)v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isViewLoaded"))
      {
        objc_msgSend(v13, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v7, "isDescendantOfView:", v14);

        if ((v15 & 1) != 0)
          goto LABEL_14;
      }

      if (v10 == ++v12)
      {
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  +[_TVModalPresenter presenter](_TVModalPresenter, "presenter");
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  -[NSArray presentedViewController](v8, "presentedViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[NSArray presentedViewController](v8, "presentedViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray hideController:animated:withCompletion:](v8, "hideController:animated:withCompletion:", v13, 1, 0);
LABEL_14:

    goto LABEL_15;
  }
  -[_TVModalPageTemplateController presentingViewController](self, "presentingViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[_TVModalPageTemplateController presentingViewController](self, "presentingViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dismissViewControllerAnimated:completion:", 1, 0);
    goto LABEL_14;
  }
LABEL_15:

}

- (void)updateWithViewElement:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  _TVModalPageBezelViewController *v22;
  NSArray *v23;
  NSArray *bezelViewControllers;
  UIPageViewController *pageViewController;
  void *v26;
  void *v27;
  IKViewElement **v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  NSArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  void *v41;
  void *v42;
  NSArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  void *v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  NSArray *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t n;
  _BOOL4 v59;
  id v60;
  IKViewElement **p_viewElement;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
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
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  void *v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v60 = a3;
  objc_msgSend(v60, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
  if (!v5)
  {
    v7 = 0;
    v8 = 0;
    goto LABEL_15;
  }
  v6 = v5;
  v7 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v82;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v82 != v9)
        objc_enumerationMutation(v4);
      v11 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
      v12 = objc_msgSend(v11, "tv_elementType");
      if (v12 == 4)
      {
        v13 = v7;
        v7 = v11;
      }
      else
      {
        if (v12 != 10)
          continue;
        v13 = v8;
        v8 = v11;
      }
      v14 = v11;

    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
  }
  while (v6);
LABEL_15:

  p_viewElement = &self->_viewElement;
  objc_storeStrong((id *)&self->_viewElement, a3);
  objc_storeStrong((id *)&self->_collectionListElement, v8);
  objc_storeStrong((id *)&self->_backgroundElement, v7);
  v59 = -[_TVModalPageTemplateController _updateWithCollectionListElement:](self, "_updateWithCollectionListElement:", self->_collectionListElement);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSArray count](self->_viewControllers, "count"));
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v16 = self->_viewControllers;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v78;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v78 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * j);
        v22 = objc_alloc_init(_TVModalPageBezelViewController);
        -[_TVModalPageBezelViewController setContentViewController:](v22, "setContentViewController:", v21);
        objc_msgSend(v15, "addObject:", v22);

      }
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
    }
    while (v18);
  }

  v23 = (NSArray *)objc_msgSend(v15, "copy");
  bezelViewControllers = self->_bezelViewControllers;
  self->_bezelViewControllers = v23;

  if (v59)
  {
    pageViewController = self->_pageViewController;
    -[NSArray firstObject](self->_bezelViewControllers, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v88, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPageViewController setViewControllers:direction:animated:completion:](pageViewController, "setViewControllers:direction:animated:completion:", v27, 0, 0, 0);

  }
  v28 = &self->_viewElement;
  if (-[_TVModalPageTemplateController isViewLoaded](self, "isViewLoaded"))
  {
    -[IKViewElement style](self->_backgroundElement, "style");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "tv_backgroundColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "color");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      -[_TVModalPageTemplateController view](self, "view");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setBackgroundColor:", v31);

    }
  }
  v75 = TVCornerRadiiZero;
  v76 = *(_OWORD *)&qword_222E77538;
  if (+[TVMLUtilities _cornerRadiiFromElement:cornerRadii:circle:](TVMLUtilities, "_cornerRadiiFromElement:cornerRadii:circle:", *p_viewElement, &v75, 0))
  {
    +[TVCornerUtilities radiusFromCornerRadii:](TVCornerUtilities, "radiusFromCornerRadii:", v75, v76);
    v34 = v33;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v35 = self->_bezelViewControllers;
    v36 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v72;
      do
      {
        for (k = 0; k != v37; ++k)
        {
          if (*(_QWORD *)v72 != v38)
            objc_enumerationMutation(v35);
          objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * k), "setBezelCornerRadius:", v34);
        }
        v37 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
      }
      while (v37);
    }

  }
  -[IKViewElement style](*p_viewElement, "style");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "tv_backgroundColor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "color");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v43 = self->_bezelViewControllers;
    v44 = -[NSArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v67, v86, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v68;
      do
      {
        for (m = 0; m != v45; ++m)
        {
          if (*(_QWORD *)v68 != v46)
            objc_enumerationMutation(v43);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * m), "setBezelBackgroundColor:", v42);
        }
        v45 = -[NSArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v67, v86, 16);
      }
      while (v45);
    }

    v28 = &self->_viewElement;
  }
  -[IKViewElement style](*v28, "style");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "tv_width");
  v50 = v49;

  -[IKViewElement style](*v28, "style");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "tv_height");
  v53 = v52;

  if (v50 > 0.0 && v53 > 0.0)
  {
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v54 = self->_bezelViewControllers;
    v55 = -[NSArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v63, v85, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v64;
      do
      {
        for (n = 0; n != v56; ++n)
        {
          if (*(_QWORD *)v64 != v57)
            objc_enumerationMutation(v54);
          objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * n), "setContentSize:", v50, v53);
        }
        v56 = -[NSArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v63, v85, 16);
      }
      while (v56);
    }

  }
}

- (BOOL)_updateWithCollectionListElement:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double Width;
  id v12;
  void *v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  _TVShadowViewElementID *v23;
  _TVShadowViewElementID *v24;
  id v25;
  void *v26;
  double v27;
  double v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  uint64_t v36;
  NSArray *viewControllers;
  id v39;
  void *v40;
  id obj;
  _TVModalPageTemplateController *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t v47;
  __int128 v48;
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
  _QWORD v60[5];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;
  CGRect v65;

  v64 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "updateType") == 2
    && (objc_msgSend(v4, "children"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v7 = -[NSArray count](self->_viewControllers, "count"),
        v5,
        v6 == v7))
  {
    objc_msgSend(v4, "children");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = MEMORY[0x24BDAC760];
    v60[1] = 3221225472;
    v60[2] = __67___TVModalPageTemplateController__updateWithCollectionListElement___block_invoke;
    v60[3] = &unk_24EB86488;
    v60[4] = self;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v60);

    LOBYTE(v9) = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    Width = CGRectGetWidth(v65);

    v12 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v4, "children");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v12, "initWithCapacity:", objc_msgSend(v13, "count"));

    v44 = (void *)-[NSArray mutableCopy](self->_viewControllers, "mutableCopy");
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v39 = v4;
    objc_msgSend(v4, "children");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v42 = self;
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    v9 = 0;
    if (v45)
    {
      v43 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          v15 = v9;
          if (*(_QWORD *)v57 != v43)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          v17 = v44;
          v18 = (id)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
          if (v18)
          {
            v46 = v9;
            v47 = i;
            v19 = *(_QWORD *)v53;
            while (2)
            {
              for (j = 0; j != v18; j = (char *)j + 1)
              {
                if (*(_QWORD *)v53 != v19)
                  objc_enumerationMutation(v17);
                v21 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)j);
                objc_msgSend(v21, "tv_associatedIKViewElement");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = -[_TVShadowViewElementID initWithViewElement:]([_TVShadowViewElementID alloc], "initWithViewElement:", v22);
                v24 = -[_TVShadowViewElementID initWithViewElement:]([_TVShadowViewElementID alloc], "initWithViewElement:", v16);
                if (-[_TVShadowViewElementID isEqual:](v23, "isEqual:", v24))
                {
                  v18 = v21;

                  goto LABEL_19;
                }

              }
              v18 = (id)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
              if (v18)
                continue;
              break;
            }
LABEL_19:
            self = v42;
            i = v47;
            v15 = v46;
          }

          -[_TVModalPageTemplateController _viewControllerWithElement:existingController:](self, "_viewControllerWithElement:existingController:", v16, v18);
          v25 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "view");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "tv_sizeThatFits:", Width, 0.0);
          v28 = v27;

          if (v28 == 0.0)
          {

            v25 = 0;
          }
          else if (v25)
          {
            objc_msgSend(v40, "addObject:", v25);
          }
          v9 = 1;
          if (v18 && v18 == v25)
          {
            objc_msgSend(v17, "removeObjectIdenticalTo:", v18);
            v9 = v15;
          }

        }
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      }
      while (v45);
    }

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v29 = v44;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    v4 = v39;
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v49;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v49 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * k);
          objc_msgSend(v34, "willMoveToParentViewController:", 0);
          objc_msgSend(v34, "view");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "removeFromSuperview");

          objc_msgSend(v34, "removeFromParentViewController");
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
      }
      while (v31);
    }

    v36 = objc_msgSend(v40, "copy");
    viewControllers = v42->_viewControllers;
    v42->_viewControllers = (NSArray *)v36;

  }
  return v9 & 1;
}

- (id)_viewControllerWithElement:(id)a3 existingController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _TVModalPageSupplementalViewController *v12;

  v5 = a3;
  v6 = a4;
  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_viewControllerFromElement:existingController:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_viewFromElement:existingView:", v5, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = (_TVModalPageSupplementalViewController *)v6;
      else
        v12 = objc_alloc_init(_TVModalPageSupplementalViewController);
      v8 = v12;
      -[_TVModalPageSupplementalViewController setView:](v12, "setView:", v11);
      objc_msgSend(v8, "tv_setAssociatedIKViewElement:", v5);
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_pageViewController, 0);
  objc_storeStrong((id *)&self->_collectionListElement, 0);
  objc_storeStrong((id *)&self->_bezelViewControllers, 0);
  objc_storeStrong((id *)&self->_backgroundElement, 0);
}

@end
