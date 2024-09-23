@implementation SBIconListViewIconSizeChangeAnimator

- (SBIconListViewIconSizeChangeAnimator)initWithIconView:(id)a3 widgetMetricsProvider:(id)a4
{
  id v7;
  id v8;
  SBIconListViewIconSizeChangeAnimator *v9;
  SBIconListViewIconSizeChangeAnimator *v10;
  uint64_t v11;
  SBIcon *priorIcon;
  uint64_t v13;
  SBLeafIconDataSource *priorIconActiveDataSource;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *priorGridSizeClass;
  void *v21;
  SBHWidgetIconResizeViewHelper *v22;
  SBHWidgetIconResizeViewHelper *viewHelper;
  void *v24;
  uint64_t v25;
  SBHIconEditingSettings *iconEditingSettings;
  objc_super v28;

  v7 = a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)SBIconListViewIconSizeChangeAnimator;
  v9 = -[SBIconListViewClusterAnimator init](&v28, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_iconView, a3);
    objc_msgSend(v7, "icon");
    v11 = objc_claimAutoreleasedReturnValue();
    priorIcon = v10->_priorIcon;
    v10->_priorIcon = (SBIcon *)v11;

    -[SBIcon activeDataSource](v10->_priorIcon, "activeDataSource");
    v13 = objc_claimAutoreleasedReturnValue();
    priorIconActiveDataSource = v10->_priorIconActiveDataSource;
    v10->_priorIconActiveDataSource = (SBLeafIconDataSource *)v13;

    objc_msgSend(v7, "center");
    v10->_priorIconViewPosition.x = v15;
    v10->_priorIconViewPosition.y = v16;
    objc_msgSend(v7, "icon");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "gridSizeClass");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    priorGridSizeClass = v10->_priorGridSizeClass;
    v10->_priorGridSizeClass = (NSString *)v19;

    objc_msgSend(v7, "listLayout");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[SBHWidgetIconResizeViewHelper initWithDelegate:listLayout:widgetMetricsProvider:]([SBHWidgetIconResizeViewHelper alloc], "initWithDelegate:listLayout:widgetMetricsProvider:", v10, v21, v8);
    viewHelper = v10->_viewHelper;
    v10->_viewHelper = v22;

    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "iconEditingSettings");
    v25 = objc_claimAutoreleasedReturnValue();
    iconEditingSettings = v10->_iconEditingSettings;
    v10->_iconEditingSettings = (SBHIconEditingSettings *)v25;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_iconViewContextMenuAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBIconListViewIconSizeChangeAnimator;
  -[SBIconListViewIconSizeChangeAnimator dealloc](&v3, sel_dealloc);
}

- (void)addAnimationCompletionHandler:(id)a3
{
  id v4;
  NSMutableArray *animationCompletionHandlers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  animationCompletionHandlers = self->_animationCompletionHandlers;
  v10 = v4;
  if (!animationCompletionHandlers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_animationCompletionHandlers;
    self->_animationCompletionHandlers = v6;

    v4 = v10;
    animationCompletionHandlers = self->_animationCompletionHandlers;
  }
  v8 = (void *)objc_msgSend(v4, "copy");
  v9 = _Block_copy(v8);
  -[NSMutableArray addObject:](animationCompletionHandlers, "addObject:", v9);

}

- (void)iconListView:(id)a3 wantsAnimatedLayoutForIconView:(id)a4 withParameters:(SBIconListLayoutAnimationParameters *)a5 alongsideAnimationBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  char v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  SBHIconGridSizeClassSet *v19;
  uint64_t v20;
  void *v21;
  SBWidgetIconResizeTransitionViewController *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  __int128 v43;
  SBIconCoordinate var4;
  __int128 v45;
  __int128 v46;
  SBWidgetIconResizeTransitionViewController *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  void *v51;
  id v52;
  unint64_t var7;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  SBHIconGridSizeClassSet *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[4];
  id v63;
  SBIconListViewIconSizeChangeAnimator *v64;
  SBWidgetIconResizeTransitionViewController *v65;
  _QWORD v66[4];
  SBWidgetIconResizeTransitionViewController *v67;
  id v68;
  id v69;
  id v70;
  CGPoint var0;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  SBIconCoordinate v75;
  __int128 v76;
  _OWORD v77[6];
  objc_super v78;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v11, "icon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListViewIconSizeChangeAnimator iconView](self, "iconView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14 != v11)
  {

LABEL_5:
    v78.receiver = self;
    v78.super_class = (Class)SBIconListViewIconSizeChangeAnimator;
    v48 = *(_OWORD *)&a5->var2.continuousCornerRadius;
    v77[2] = *(_OWORD *)&a5->var2.size.height;
    v77[3] = v48;
    v49 = *(_OWORD *)&a5->var5;
    v77[4] = a5->var4;
    v77[5] = v49;
    v50 = *(_OWORD *)&a5->var1;
    v77[0] = a5->var0;
    v77[1] = v50;
    -[SBIconListViewClusterAnimator iconListView:wantsAnimatedLayoutForIconView:withParameters:alongsideAnimationBlock:](&v78, sel_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock_, v10, v11, v77, v12);
    goto LABEL_6;
  }
  v15 = objc_msgSend(v13, "isLeafIcon");

  if ((v15 & 1) == 0)
    goto LABEL_5;
  -[SBIconListViewIconSizeChangeAnimator priorGridSizeClass](self, "priorGridSizeClass");
  v54 = v12;
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "icon");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "gridSizeClass");
  v18 = objc_claimAutoreleasedReturnValue();

  v52 = v13;
  objc_msgSend(v11, "gridSizeClassDomain");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v13;
  -[SBIconListViewIconSizeChangeAnimator viewHelper](self, "viewHelper");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = [SBHIconGridSizeClassSet alloc];
  v61 = v10;
  v20 = v18;
  v55 = (void *)v18;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v16, v18, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = -[SBHIconGridSizeClassSet initWithGridSizeClasses:](v19, "initWithGridSizeClasses:", v21);

  v22 = -[SBWidgetIconResizeTransitionViewController initWithLeafIcon:allowedGridSizeClasses:gridSizeClassDomain:viewHelper:options:]([SBWidgetIconResizeTransitionViewController alloc], "initWithLeafIcon:allowedGridSizeClasses:gridSizeClassDomain:viewHelper:options:", v52, v58, v59, v56, 1);
  -[SBWidgetIconResizeTransitionViewController setDelegate:](v22, "setDelegate:", self);
  v23 = (void *)v16;
  v12 = v54;
  v57 = v23;
  -[SBWidgetIconResizeTransitionViewController setStartingGridSizeClass:](v22, "setStartingGridSizeClass:", v23);
  -[SBWidgetIconResizeTransitionViewController setEndingGridSizeClass:](v22, "setEndingGridSizeClass:", v20);
  objc_msgSend(v11, "setOverrideCustomIconImageViewController:", v22);
  objc_msgSend(v11, "listLayout");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = SBHIconListLayoutIconImageInfoForGridSizeClass(v24, v23);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  -[SBIconListViewIconSizeChangeAnimator priorIconViewPosition](self, "priorIconViewPosition");
  v33 = v32;
  v35 = v34;
  objc_msgSend(v11, "disallowContextMenusForReason:", CFSTR("size change"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListViewIconSizeChangeAnimator setIconViewContextMenuAssertion:](self, "setIconViewContextMenuAssertion:", v36);

  -[SBWidgetIconResizeTransitionViewController view](v22, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIconImageInfo:", v25, v27, v29, v31);
  objc_msgSend(v11, "setCenter:", v33, v35);
  objc_msgSend(v11, "layoutIfNeeded");
  objc_msgSend(v37, "layoutIfNeeded");
  -[SBHIconEditingSettings defaultSpringDuration](self->_iconEditingSettings, "defaultSpringDuration");
  v39 = v38;
  -[SBHIconEditingSettings defaultSpringDampingRatio](self->_iconEditingSettings, "defaultSpringDampingRatio");
  v41 = v40;
  v51 = (void *)MEMORY[0x1E0DC3F10];
  var7 = a5->var7;
  v42 = MEMORY[0x1E0C809B0];
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __123__SBIconListViewIconSizeChangeAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke;
  v66[3] = &unk_1E8D8BF70;
  v67 = v22;
  v68 = v11;
  v69 = v61;
  v43 = *(_OWORD *)&a5->var2.size.height;
  var4 = a5->var4;
  v45 = *(_OWORD *)&a5->var5;
  v74 = *(_OWORD *)&a5->var2.continuousCornerRadius;
  v75 = var4;
  v76 = v45;
  v46 = *(_OWORD *)&a5->var1;
  var0 = a5->var0;
  v72 = v46;
  v73 = v43;
  v70 = v54;
  v62[0] = v42;
  v62[1] = 3221225472;
  v62[2] = __123__SBIconListViewIconSizeChangeAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_3;
  v62[3] = &unk_1E8D87728;
  v63 = v68;
  v64 = self;
  v65 = v67;
  v47 = v67;
  objc_msgSend(v51, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", var7, v66, v62, v39, 0.0, v41, 0.0);

  v13 = v60;
  v10 = v61;

LABEL_6:
}

void __123__SBIconListViewIconSizeChangeAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke(uint64_t a1)
{
  void *v2;
  float minimum;
  float maximum;
  float preferred;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CAFrameRateRange v23;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v23 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v23.minimum;
  maximum = v23.maximum;
  preferred = v23.preferred;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __123__SBIconListViewIconSizeChangeAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_2;
  v12[3] = &unk_1E8D8BF70;
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v6 = *(_OWORD *)(a1 + 112);
  v19 = *(_OWORD *)(a1 + 96);
  v20 = v6;
  v7 = *(_OWORD *)(a1 + 144);
  v21 = *(_OWORD *)(a1 + 128);
  v22 = v7;
  v8 = *(_OWORD *)(a1 + 80);
  v17 = *(_OWORD *)(a1 + 64);
  v18 = v8;
  v16 = *(id *)(a1 + 56);
  *(float *)&v9 = minimum;
  *(float *)&v10 = maximum;
  *(float *)&v11 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114131, v12, v9, v10, v11);

}

uint64_t __123__SBIconListViewIconSizeChangeAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t result;
  _OWORD v8[6];

  objc_msgSend(*(id *)(a1 + 32), "setTransitionProgress:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "clearIconImageInfo");
  objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  v3 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(a1 + 48);
  v4 = *(_OWORD *)(a1 + 112);
  v8[2] = *(_OWORD *)(a1 + 96);
  v8[3] = v4;
  v5 = *(_OWORD *)(a1 + 144);
  v8[4] = *(_OWORD *)(a1 + 128);
  v8[5] = v5;
  v6 = *(_OWORD *)(a1 + 80);
  v8[0] = *(_OWORD *)(a1 + 64);
  v8[1] = v6;
  objc_msgSend(v2, "performDefaultAnimatedLayoutUpdateForIconView:withParameters:", v3, v8);
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __123__SBIconListViewIconSizeChangeAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_3(id *a1)
{
  id v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  id v6;
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

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "setOverrideCustomIconImageViewController:", 0);
  v2 = *((id *)a1[5] + 3);
  v3 = a1[5];
  v4 = (void *)v3[3];
  v3[3] = 0;

  objc_msgSend(a1[5], "iconViewContextMenuAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");
  objc_msgSend(a1[5], "setIconViewContextMenuAssertion:", 0);
  objc_msgSend(a1[6], "invalidate");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v2;
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
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (id)snapshotViewBackgroundViewForIconView:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "customIconImageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "sbh_isWidgetStackViewController"))
  {
    v4 = v3;
    objc_msgSend(v4, "backgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "backgroundViewProvider");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (v6)
        (*(void (**)(uint64_t))(v6 + 16))(v6);
      else
        objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setClipsToBounds:", 0);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)iconResizeViewHelper:(id)a3 intentForWidget:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBIconListViewIconSizeChangeAnimator delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "iconSizeChangeAnimator:intentForWidget:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)iconResizeViewHelper:(id)a3 viewControllerForIconDataSource:(id)a4 icon:(id)a5 gridSizeClass:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[SBIconListViewIconSizeChangeAnimator delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "iconSizeChangeAnimator:viewControllerForIconDataSource:icon:gridSizeClass:", self, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)iconResizeTransitionViewController:(id)a3 willUseIcon:(id)a4 forViewControllerForGridSizeClass:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;

  v7 = a4;
  v8 = a5;
  -[SBIconListViewIconSizeChangeAnimator priorGridSizeClass](self, "priorGridSizeClass");
  v9 = objc_claimAutoreleasedReturnValue();
  if ((id)v9 == v8)
  {

  }
  else
  {
    v10 = (void *)v9;
    -[SBIconListViewIconSizeChangeAnimator priorGridSizeClass](self, "priorGridSizeClass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "isEqualToString:", v11);

    if (!v12)
      goto LABEL_6;
  }
  -[SBIconListViewIconSizeChangeAnimator priorIcon](self, "priorIcon");
  v13 = objc_claimAutoreleasedReturnValue();

  v7 = (id)v13;
LABEL_6:

  return v7;
}

- (id)iconResizeTransitionViewController:(id)a3 willUseIconDataSource:(id)a4 forViewControllerForGridSizeClass:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;

  v7 = a4;
  v8 = a5;
  -[SBIconListViewIconSizeChangeAnimator priorGridSizeClass](self, "priorGridSizeClass");
  v9 = objc_claimAutoreleasedReturnValue();
  if ((id)v9 == v8)
  {

  }
  else
  {
    v10 = (void *)v9;
    -[SBIconListViewIconSizeChangeAnimator priorGridSizeClass](self, "priorGridSizeClass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "isEqualToString:", v11);

    if (!v12)
      goto LABEL_6;
  }
  -[SBIconListViewIconSizeChangeAnimator priorIconActiveDataSource](self, "priorIconActiveDataSource");
  v13 = objc_claimAutoreleasedReturnValue();

  v7 = (id)v13;
LABEL_6:

  return v7;
}

- (SBIconView)iconView
{
  return self->_iconView;
}

- (SBIconListViewIconSizeChangeAnimatorDelegate)delegate
{
  return (SBIconListViewIconSizeChangeAnimatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBHIconEditingSettings)iconEditingSettings
{
  return self->_iconEditingSettings;
}

- (BSInvalidatable)iconViewContextMenuAssertion
{
  return self->_iconViewContextMenuAssertion;
}

- (void)setIconViewContextMenuAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_iconViewContextMenuAssertion, a3);
}

- (NSString)priorGridSizeClass
{
  return self->_priorGridSizeClass;
}

- (void)setPriorGridSizeClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (CGPoint)priorIconViewPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_priorIconViewPosition.x;
  y = self->_priorIconViewPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (SBIcon)priorIcon
{
  return self->_priorIcon;
}

- (SBLeafIconDataSource)priorIconActiveDataSource
{
  return self->_priorIconActiveDataSource;
}

- (SBHWidgetIconResizeViewHelper)viewHelper
{
  return self->_viewHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewHelper, 0);
  objc_storeStrong((id *)&self->_priorIconActiveDataSource, 0);
  objc_storeStrong((id *)&self->_priorIcon, 0);
  objc_storeStrong((id *)&self->_priorGridSizeClass, 0);
  objc_storeStrong((id *)&self->_iconViewContextMenuAssertion, 0);
  objc_storeStrong((id *)&self->_iconEditingSettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_animationCompletionHandlers, 0);
}

@end
