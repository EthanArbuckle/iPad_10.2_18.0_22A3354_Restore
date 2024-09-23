@implementation SBSUIHomeScreenSilhouetteViewBuilder

- (SBSUIHomeScreenSilhouetteViewBuilder)initWithSilhouetteLayout:(id)a3 viewSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  SBSUIHomeScreenSilhouetteViewBuilder *v8;
  uint64_t v9;
  SBSHomeScreenSilhouetteLayout *silhouetteLayout;
  objc_super v12;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBSUIHomeScreenSilhouetteViewBuilder;
  v8 = -[SBSUIHomeScreenSilhouetteViewBuilder init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    silhouetteLayout = v8->_silhouetteLayout;
    v8->_silhouetteLayout = (SBSHomeScreenSilhouetteLayout *)v9;

    v8->_viewSize.width = width;
    v8->_viewSize.height = height;
    v8->_includesDock = 1;
  }

  return v8;
}

- (id)buildView
{
  double v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  void *v35;
  double v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;
  CGRect v43;
  CGRect v44;

  v42 = *MEMORY[0x1E0C80C00];
  -[SBSUIHomeScreenSilhouetteViewBuilder viewSize](self, "viewSize");
  v36 = v3;
  -[SBSUIHomeScreenSilhouetteViewBuilder makeRootView](self, "makeRootView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSUIHomeScreenSilhouetteViewBuilder silhouetteLayout](self, "silhouetteLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBSUIHomeScreenSilhouetteViewBuilder includesDock](self, "includesDock");
  objc_msgSend(v5, "dock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && v6)
  {
    -[SBSUIHomeScreenSilhouetteViewBuilder makeDockView](self, "makeDockView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v7, "frame");
      -[SBSUIHomeScreenSilhouetteViewBuilder frameForNormalizedFrame:](self, "frameForNormalizedFrame:");
      objc_msgSend(v8, "setFrame:");
      objc_msgSend(v7, "cornerRadius");
      objc_msgSend(v8, "_setContinuousCornerRadius:", v36 * v9);
      objc_msgSend(v4, "addSubview:", v8);
    }

  }
  objc_msgSend(v7, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v35 = v5;
  objc_msgSend(v5, "icons");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v38 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v23, "frame");
        v25 = v24;
        v27 = v26;
        v29 = v28;
        v31 = v30;
        if (v6)
          goto LABEL_13;
        v43.origin.x = v11;
        v43.origin.y = v13;
        v43.size.width = v15;
        v43.size.height = v17;
        v44.origin.x = v25;
        v44.origin.y = v27;
        v44.size.width = v29;
        v44.size.height = v31;
        if (!CGRectContainsRect(v43, v44))
        {
LABEL_13:
          -[SBSUIHomeScreenSilhouetteViewBuilder makeIconView](self, "makeIconView");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            -[SBSUIHomeScreenSilhouetteViewBuilder frameForNormalizedFrame:](self, "frameForNormalizedFrame:", v25, v27, v29, v31);
            objc_msgSend(v32, "setFrame:");
            objc_msgSend(v23, "cornerRadius");
            objc_msgSend(v32, "_setContinuousCornerRadius:", v36 * v33);
            objc_msgSend(v4, "addSubview:", v32);
          }

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v20);
  }

  return v4;
}

- (id)makeRootView
{
  void (**v3)(_QWORD, __n128, __n128);
  __n128 v4;
  __n128 v5;
  void *v6;
  id v7;

  -[SBSUIHomeScreenSilhouetteViewBuilder rootViewBuilder](self, "rootViewBuilder");
  v3 = (void (**)(_QWORD, __n128, __n128))objc_claimAutoreleasedReturnValue();
  -[SBSUIHomeScreenSilhouetteViewBuilder viewSize](self, "viewSize");
  if (v3)
  {
    v3[2](v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("A view must be returned from the rootViewBuilder"), 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v7);
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, 0.0, v4.n128_f64[0], v5.n128_f64[0]);
  }

  return v6;
}

- (id)makeDockView
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;

  -[SBSUIHomeScreenSilhouetteViewBuilder dockViewBuilder](self, "dockViewBuilder");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    (*(void (**)(uint64_t))(v2 + 16))(v2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.8, 0.6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v5);

  }
  return v4;
}

- (id)makeIconView
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;

  -[SBSUIHomeScreenSilhouetteViewBuilder iconViewBuilder](self, "iconViewBuilder");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    (*(void (**)(uint64_t))(v2 + 16))(v2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v5);

  }
  return v4;
}

- (CGRect)frameForNormalizedFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double MinX;
  double MinY;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBSUIHomeScreenSilhouetteViewBuilder viewSize](self, "viewSize");
  v8 = v7;
  v10 = v9;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  MinX = CGRectGetMinX(v22);
  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  v23.size.width = v8;
  v23.size.height = v10;
  v21 = MinX * CGRectGetWidth(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MinY = CGRectGetMinY(v24);
  v25.origin.x = 0.0;
  v25.origin.y = 0.0;
  v25.size.width = v8;
  v25.size.height = v10;
  v13 = MinY * CGRectGetHeight(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v14 = CGRectGetWidth(v26);
  v27.origin.x = 0.0;
  v27.origin.y = 0.0;
  v27.size.width = v8;
  v27.size.height = v10;
  v15 = v14 * CGRectGetWidth(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v16 = CGRectGetHeight(v28);
  v29.origin.x = 0.0;
  v29.origin.y = 0.0;
  v29.size.width = v8;
  v29.size.height = v10;
  v17 = v16 * CGRectGetHeight(v29);
  v18 = v21;
  v19 = v13;
  v20 = v15;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (SBSHomeScreenSilhouetteLayout)silhouetteLayout
{
  return self->_silhouetteLayout;
}

- (CGSize)viewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewSize.width;
  height = self->_viewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)rootViewBuilder
{
  return self->_rootViewBuilder;
}

- (void)setRootViewBuilder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)iconViewBuilder
{
  return self->_iconViewBuilder;
}

- (void)setIconViewBuilder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)dockViewBuilder
{
  return self->_dockViewBuilder;
}

- (void)setDockViewBuilder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)includesDock
{
  return self->_includesDock;
}

- (void)setIncludesDock:(BOOL)a3
{
  self->_includesDock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dockViewBuilder, 0);
  objc_storeStrong(&self->_iconViewBuilder, 0);
  objc_storeStrong(&self->_rootViewBuilder, 0);
  objc_storeStrong((id *)&self->_silhouetteLayout, 0);
}

@end
