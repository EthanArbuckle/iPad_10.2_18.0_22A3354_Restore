@implementation _TVDivTemplateController

- (_TVDivTemplateController)init
{
  _TVDivTemplateController *v2;
  UIImageView *v3;
  UIImageView *backgroundImageView;
  _TVOrganizerView *v5;
  _TVOrganizerView *contentView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_TVDivTemplateController;
  v2 = -[_TVDivTemplateController init](&v8, sel_init);
  if (v2)
  {
    v3 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
    backgroundImageView = v2->_backgroundImageView;
    v2->_backgroundImageView = v3;

    v5 = objc_alloc_init(_TVOrganizerView);
    contentView = v2->_contentView;
    v2->_contentView = v5;

  }
  return v2;
}

- (void)updateWithViewElement:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  uint64_t v24;
  _TVDivTemplateController *v25;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25 = self;
  v36.receiver = self;
  v36.super_class = (Class)_TVDivTemplateController;
  -[_TVBgImageLoadingViewController updateWithViewElement:](&v36, sel_updateWithViewElement_, v4);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v26 = v4;
  objc_msgSend(v4, "children");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v10, "tv_elementType") == 4)
        {
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          objc_msgSend(v10, "children");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v29;
            while (2)
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v29 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v26, "appDocument");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "tv_adjustedWindowSize");
                  v19 = v18;
                  v21 = v20;

                  v22 = (void *)objc_opt_new();
                  objc_msgSend(v22, "setImageSize:", v19, v21);
                  v23 = +[TVImageLayout layoutWithLayout:element:](TVImageLayout, "layoutWithLayout:element:", v22, v16);
                  objc_msgSend(v16, "tv_imageProxyWithLayout:", v22);
                  v24 = objc_claimAutoreleasedReturnValue();

                  v7 = (void *)v24;
                  goto LABEL_17;
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
              if (v13)
                continue;
              break;
            }
          }
LABEL_17:

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  -[_TVDivTemplateController setBackgroundImageProxy:](v25, "setBackgroundImageProxy:", v7);
  -[_TVDivTemplateController setViewElement:](v25, "setViewElement:", v26);
  -[_TVDivTemplateController _updateContentView](v25, "_updateContentView");

}

- (void)loadView
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  -[_TVDivTemplateController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  -[_TVDivTemplateController setView:](self, "setView:", v4);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_TVDivTemplateController;
  -[_TVBgImageLoadingViewController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  -[_TVDivTemplateController backgroundImageProxy](self, "backgroundImageProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVDivTemplateController backgroundImageView](self, "backgroundImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    -[_TVDivTemplateController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    objc_msgSend(v5, "setFrame:");

    -[_TVDivTemplateController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVDivTemplateController backgroundImageView](self, "backgroundImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertSubview:atIndex:", v7, 0);

  }
  else
  {
    objc_msgSend(v4, "removeFromSuperview");
  }

  -[_TVDivTemplateController contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVDivTemplateController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v8, "setFrame:");

}

- (id)preferredFocusEnvironments
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  -[_TVDivTemplateController contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGSize)_backgroundImageProxySize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[_TVDivTemplateController viewElement](self, "viewElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tv_adjustedWindowSize");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)_configureWithBgImage:(id)a3 backdropImage:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[_TVDivTemplateController backgroundImageView](self, "backgroundImageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

}

- (void)_updateContentView
{
  _TVDivTemplateController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void (**v14)(void *, void *);
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _TVDivTemplateController *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  _TVDivTemplateController *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void (**v54)(_QWORD, _QWORD);
  void (**v55)(void *, void *);
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  id obj;
  __int128 v62;
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
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v2 = self;
  v91 = *MEMORY[0x24BDAC8D0];
  -[_TVDivTemplateController viewElement](self, "viewElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVDivTemplateController contentView](v2, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v3, "tv_semanticContentAttribute");
  objc_msgSend(v4, "setSemanticContentAttribute:");
  -[_TVDivTemplateController viewControllers](v2, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = MEMORY[0x24BDAC760];
  v84[0] = MEMORY[0x24BDAC760];
  v84[1] = 3221225472;
  v84[2] = __46___TVDivTemplateController__updateContentView__block_invoke;
  v84[3] = &unk_24EB86DB8;
  v53 = v6;
  v85 = v53;
  v55 = (void (**)(void *, void *))MEMORY[0x22767F470](v84);
  v51 = v4;
  objc_msgSend(v4, "components");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v82[0] = v7;
  v82[1] = 3221225472;
  v82[2] = __46___TVDivTemplateController__updateContentView__block_invoke_2;
  v82[3] = &unk_24EB86E08;
  v50 = v9;
  v83 = v50;
  v54 = (void (**)(_QWORD, _QWORD))MEMORY[0x22767F470](v82);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v3;
  objc_msgSend(v3, "children");
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
  if (v10)
  {
    v11 = v10;
    v59 = 0;
    v12 = *(_QWORD *)v79;
    v13 = 0x24EB83000uLL;
    v14 = v55;
    do
    {
      v15 = 0;
      v60 = v11;
      do
      {
        if (*(_QWORD *)v79 != v12)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v15);
        if (objc_msgSend(v16, "tv_elementType") != 4)
        {
          v17 = v12;
          v18 = v2;
          objc_msgSend(v16, "autoHighlightIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
            objc_msgSend(v16, "resetProperty:", 1);
          v14[2](v14, v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v13 + 2344), "sharedInterfaceFactory");
          v21 = v13;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "_viewControllerFromElement:existingController:", v16, v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            if (v23 == v20)
              objc_msgSend(v53, "removeObject:", v20);
            objc_msgSend(v57, "addObject:", v23);
            objc_msgSend(v23, "view");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v54[2](v54, objc_msgSend(v16, "tv_elementType"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v21 + 2344), "sharedInterfaceFactory");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "_viewFromElement:existingView:", v16, v25);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v14 = v55;
          }
          v2 = v18;
          v12 = v17;
          if (v24)
          {
            objc_msgSend(v24, "setSemanticContentAttribute:", v56);
            objc_msgSend(v58, "addObject:", v24);
            v11 = v60;
            v13 = 0x24EB83000;
            if (!v59 && v19)
              v59 = v24;
          }
          else
          {
            v13 = 0x24EB83000;
            v11 = v60;
          }

        }
        ++v15;
      }
      while (v11 != v15);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
    }
    while (v11);
  }
  else
  {
    v59 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v57, "count"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v28 = v57;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v75 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
        objc_msgSend(v33, "parentViewController");
        v34 = (_TVDivTemplateController *)objc_claimAutoreleasedReturnValue();

        if (v34 != v2)
          objc_msgSend(v27, "addObject:", v33);
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
    }
    while (v30);
  }

  -[_TVDivTemplateController setViewControllers:](v2, "setViewControllers:", v28);
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v35 = v53;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v70, v88, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v71;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v71 != v38)
          objc_enumerationMutation(v35);
        objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * j), "willMoveToParentViewController:", 0);
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v70, v88, 16);
    }
    while (v37);
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v40 = v27;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v66, v87, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v67;
    do
    {
      for (k = 0; k != v42; ++k)
      {
        if (*(_QWORD *)v67 != v43)
          objc_enumerationMutation(v40);
        -[_TVDivTemplateController addChildViewController:](v2, "addChildViewController:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * k));
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v66, v87, 16);
    }
    while (v42);
  }

  objc_msgSend(v51, "setComponents:", v58);
  if (v59)
    objc_msgSend(v51, "setPreferredFocusedComponent:");
  objc_msgSend(v51, "transferLayoutStylesFromElement:", v52);
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v45 = v40;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v62, v86, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v63;
    do
    {
      for (m = 0; m != v47; ++m)
      {
        if (*(_QWORD *)v63 != v48)
          objc_enumerationMutation(v45);
        objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * m), "didMoveToParentViewController:", v2);
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v62, v86, 16);
    }
    while (v47);
  }

}

- (IKViewElement)viewElement
{
  return self->_viewElement;
}

- (void)setViewElement:(id)a3
{
  objc_storeStrong((id *)&self->_viewElement, a3);
}

- (TVImageProxy)backgroundImageProxy
{
  return self->_backgroundImageProxy;
}

- (void)setBackgroundImageProxy:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImageProxy, a3);
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImageView, a3);
}

- (_TVOrganizerView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (void)setViewControllers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_backgroundImageProxy, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
}

@end
