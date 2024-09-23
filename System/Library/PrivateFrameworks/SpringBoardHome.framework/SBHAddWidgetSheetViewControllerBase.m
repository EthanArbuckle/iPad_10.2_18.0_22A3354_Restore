@implementation SBHAddWidgetSheetViewControllerBase

- (SBHAddWidgetSheetViewControllerBase)initWithListLayoutProvider:(id)a3 iconViewProvider:(id)a4 allowedWidgets:(SBHWidgetFilteringParameters)a5 appCellIconImageCache:(id)a6 addWidgetSheetStyle:(unint64_t)a7
{
  uint64_t v8;
  unint64_t families;
  id v13;
  id v14;
  id v15;
  SBHAddWidgetSheetAppCollectionViewCellConfigurator *v16;
  SBHAddWidgetSheetViewControllerBase *v17;

  v8 = *(_QWORD *)&a5.includesNonStackable;
  families = a5.families;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = -[SBHAddWidgetSheetAppCollectionViewCellConfigurator initWithIconCache:]([SBHAddWidgetSheetAppCollectionViewCellConfigurator alloc], "initWithIconCache:", v13);

  v17 = -[SBHAddWidgetSheetViewControllerBase initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellConfigurator:addWidgetSheetStyle:](self, "initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellConfigurator:addWidgetSheetStyle:", v15, v14, families, v8, v16, a7);
  return v17;
}

- (SBHAddWidgetSheetViewControllerBase)initWithListLayoutProvider:(id)a3 iconViewProvider:(id)a4 allowedWidgets:(SBHWidgetFilteringParameters)a5 appCellConfigurator:(id)a6 addWidgetSheetStyle:(unint64_t)a7
{
  uint64_t v9;
  unint64_t families;
  id v14;
  id v15;
  id v16;
  SBHAddWidgetSheetViewControllerBase *v17;
  SBHAddWidgetSheetViewControllerBase *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  objc_super v28;
  _QWORD v29[2];

  v9 = *(_QWORD *)&a5.includesNonStackable;
  families = a5.families;
  v29[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v28.receiver = self;
  v28.super_class = (Class)SBHAddWidgetSheetViewControllerBase;
  v17 = -[SBHAddWidgetSheetViewControllerBase initWithNibName:bundle:](&v28, sel_initWithNibName_bundle_, 0, 0);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_listLayoutProvider, a3);
    objc_storeWeak((id *)&v18->_iconViewProvider, v15);
    v18->_allowedWidgets.families = families;
    *(_QWORD *)&v18->_allowedWidgets.includesNonStackable = v9;
    objc_storeStrong((id *)&v18->_appCellConfigurator, a6);
    v18->_addWidgetSheetStyle = a7;
    v19 = (void *)MEMORY[0x1E0DC3E88];
    -[SBHAddWidgetSheetViewControllerBase traitCollection](v18, "traitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sbh_iconImageAppearanceFromTraitCollection:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setIconImageAppearance:", v21);
    objc_opt_self();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __138__SBHAddWidgetSheetViewControllerBase_initWithListLayoutProvider_iconViewProvider_allowedWidgets_appCellConfigurator_addWidgetSheetStyle___block_invoke;
    v26[3] = &unk_1E8D8DA08;
    v27 = v16;
    v24 = (id)-[SBHAddWidgetSheetViewControllerBase registerForTraitChanges:withHandler:](v18, "registerForTraitChanges:withHandler:", v23, v26);

  }
  return v18;
}

void __138__SBHAddWidgetSheetViewControllerBase_initWithListLayoutProvider_iconViewProvider_allowedWidgets_appCellConfigurator_addWidgetSheetStyle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0DC3E88];
  objc_msgSend(a2, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sbh_iconImageAppearanceFromTraitCollection:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setIconImageAppearance:", v5);
}

- (UIEdgeInsets)preferredInsetsForSheetPresentationInInterfaceOrientation:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *MEMORY[0x1E0DC49E8];
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (int64_t)widgetWrapperViewControllerBackgroundType
{
  int64_t result;

  result = -[SBHAddWidgetSheetViewControllerBase addWidgetSheetWidgetBackgroundType](self, "addWidgetSheetWidgetBackgroundType");
  if (result != 2)
    return result == 1;
  return result;
}

- (SBHAddWidgetSheetViewControllerDelegate)delegate
{
  return (SBHAddWidgetSheetViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBHWidgetFilteringParameters)allowedWidgets
{
  SBHWidgetFilteringParameters *p_allowedWidgets;
  unint64_t families;
  uint64_t v4;
  SBHWidgetFilteringParameters result;

  p_allowedWidgets = &self->_allowedWidgets;
  families = self->_allowedWidgets.families;
  v4 = *(_QWORD *)&p_allowedWidgets->includesNonStackable;
  result.includesNonStackable = v4;
  result.requiresRemovableBackground = BYTE1(v4);
  result.families = families;
  return result;
}

- (BOOL)allowsFakeWidgets
{
  return self->_allowsFakeWidgets;
}

- (void)setAllowsFakeWidgets:(BOOL)a3
{
  self->_allowsFakeWidgets = a3;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (void)setListLayoutProvider:(id)a3
{
  objc_storeStrong((id *)&self->_listLayoutProvider, a3);
}

- (SBIconViewProviding)iconViewProvider
{
  return (SBIconViewProviding *)objc_loadWeakRetained((id *)&self->_iconViewProvider);
}

- (void)setIconViewProvider:(id)a3
{
  objc_storeWeak((id *)&self->_iconViewProvider, a3);
}

- (SBHAddWidgetSheetAppCollectionViewCellConfigurator)appCellConfigurator
{
  return self->_appCellConfigurator;
}

- (void)setAppCellConfigurator:(id)a3
{
  objc_storeStrong((id *)&self->_appCellConfigurator, a3);
}

- (MTMaterialView)externalBackgroundView
{
  return self->_externalBackgroundView;
}

- (void)setExternalBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_externalBackgroundView, a3);
}

- (unint64_t)addWidgetSheetStyle
{
  return self->_addWidgetSheetStyle;
}

- (void)setAddWidgetSheetStyle:(unint64_t)a3
{
  self->_addWidgetSheetStyle = a3;
}

- (unint64_t)addWidgetSheetLocation
{
  return self->_addWidgetSheetLocation;
}

- (void)setAddWidgetSheetLocation:(unint64_t)a3
{
  self->_addWidgetSheetLocation = a3;
}

- (unint64_t)addWidgetSheetWidgetBackgroundType
{
  return self->_addWidgetSheetWidgetBackgroundType;
}

- (void)setAddWidgetSheetWidgetBackgroundType:(unint64_t)a3
{
  self->_addWidgetSheetWidgetBackgroundType = a3;
}

- (BOOL)wantsBottomAttachedPresentation
{
  return self->_wantsBottomAttachedPresentation;
}

- (void)setWantsBottomAttachedPresentation:(BOOL)a3
{
  self->_wantsBottomAttachedPresentation = a3;
}

- (SBHPadAddWidgetSheetMetrics)addWidgetSheetMetrics
{
  CGSize scaledWidgetSize;
  __int128 v4;
  __int128 v5;

  scaledWidgetSize = self[9].scaledWidgetSize;
  *(_OWORD *)&retstr->scaledWidgetSize.height = *(_OWORD *)&self[9].topPadding;
  retstr->detailWidgetPadding = scaledWidgetSize;
  *(_OWORD *)&retstr->detailAddButtonTopSpacing = *(_OWORD *)&self[9].widgetColumns;
  retstr->detailPageControlTopSpacing = self[9].detailWidgetPadding.height;
  v4 = *(_OWORD *)&self[8].detailPageControlTopSpacing;
  *(_OWORD *)&retstr->sheetMargin = *(_OWORD *)&self[8].detailAddButtonTopSpacing;
  *(_OWORD *)&retstr->sidebarWidth = v4;
  v5 = *(_OWORD *)&self[9].gutterPadding;
  *(_OWORD *)&retstr->trailingPadding = *(_OWORD *)&self[9].leadingPadding;
  *(_OWORD *)&retstr->widgetScaleFactor = v5;
  return self;
}

- (void)setAddWidgetSheetMetrics:(SBHPadAddWidgetSheetMetrics *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  CGSize detailWidgetPadding;
  __int128 v8;

  v3 = *(_OWORD *)&a3->widgetScaleFactor;
  v5 = *(_OWORD *)&a3->sheetMargin;
  v4 = *(_OWORD *)&a3->sidebarWidth;
  *(_OWORD *)&self->_addWidgetSheetMetrics.trailingPadding = *(_OWORD *)&a3->trailingPadding;
  *(_OWORD *)&self->_addWidgetSheetMetrics.widgetScaleFactor = v3;
  *(_OWORD *)&self->_addWidgetSheetMetrics.sheetMargin = v5;
  *(_OWORD *)&self->_addWidgetSheetMetrics.sidebarWidth = v4;
  detailWidgetPadding = a3->detailWidgetPadding;
  v6 = *(_OWORD *)&a3->detailAddButtonTopSpacing;
  v8 = *(_OWORD *)&a3->scaledWidgetSize.height;
  self->_addWidgetSheetMetrics.detailPageControlTopSpacing = a3->detailPageControlTopSpacing;
  self->_addWidgetSheetMetrics.detailWidgetPadding = detailWidgetPadding;
  *(_OWORD *)&self->_addWidgetSheetMetrics.detailAddButtonTopSpacing = v6;
  *(_OWORD *)&self->_addWidgetSheetMetrics.scaledWidgetSize.height = v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalBackgroundView, 0);
  objc_storeStrong((id *)&self->_appCellConfigurator, 0);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
