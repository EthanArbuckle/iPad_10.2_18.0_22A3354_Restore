@implementation ParkedCarHeaderButtonsSectionController

- (ParkedCarHeaderButtonsSectionController)initWithParkedCar:(id)a3
{
  ParkedCarHeaderButtonsSectionController *v3;
  ParkedCarHeaderButtonsSectionController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ParkedCarHeaderButtonsSectionController;
  v3 = -[ParkedCarSectionController initWithParkedCar:](&v6, "initWithParkedCar:", a3);
  v4 = v3;
  if (v3)
    -[ParkedCarHeaderButtonsSectionController _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  void *v3;
  MUGroupedActionsRowView *v4;
  MUGroupedActionsRowView *headerButtonsView;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;
  _QWORD v15[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MUGroupedActionsRowViewConfiguration defaultConfiguration](MUGroupedActionsRowViewConfiguration, "defaultConfiguration"));
  objc_msgSend(v3, "setUseVibrancy:", 0);
  v4 = (MUGroupedActionsRowView *)objc_msgSend(objc_alloc((Class)MUGroupedActionsRowView), "initWithConfiguration:", v3);
  headerButtonsView = self->_headerButtonsView;
  self->_headerButtonsView = v4;

  -[MUGroupedActionsRowView setPreservesSuperviewLayoutMargins:](self->_headerButtonsView, "setPreservesSuperviewLayoutMargins:", 0);
  -[MUGroupedActionsRowView setLayoutMargins:](self->_headerButtonsView, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  -[MUGroupedActionsRowView setDelegate:](self->_headerButtonsView, "setDelegate:", self);
  objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Move [Marked Location in Place Card]"), CFSTR("localized string not found"), 0));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100AEF26C;
  v12[3] = &unk_1011BAB10;
  objc_copyWeak(&v13, &location);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_MKPlaceActionButtonController actionButtonControllerWithTitle:subTitle:selectedBlock:disabled:symbolName:](_MKPlaceActionButtonController, "actionButtonControllerWithTitle:subTitle:selectedBlock:disabled:symbolName:", v7, 0, v12, 0, CFSTR("mappin.and.ellipse")));

  v9 = objc_msgSend(objc_alloc((Class)MUDirectionsActionRowItemViewModel), "initWithETAProvider:", 0);
  v10 = objc_msgSend(objc_alloc((Class)MUPlaceActionControlledItemViewModel), "initWithPlaceActionController:", v8);
  v15[0] = v9;
  v15[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
  -[MUGroupedActionsRowView setViewModels:](self->_headerButtonsView, "setViewModels:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (id)sectionView
{
  UIView *sectionView;
  UIView *v3;
  UIView *v5;
  UIView *v6;
  UIView *v7;

  sectionView = self->_sectionView;
  if (sectionView)
  {
    v3 = sectionView;
  }
  else
  {
    v5 = (UIView *)objc_msgSend(objc_alloc((Class)MUPlaceSectionView), "initWithStyle:sectionHeaderViewModel:", 1, 0);
    -[UIView attachViewToContentView:](v5, "attachViewToContentView:", self->_headerButtonsView);
    v6 = self->_sectionView;
    self->_sectionView = v5;
    v7 = v5;

    v3 = self->_sectionView;
  }
  return v3;
}

- (void)actionsRowView:(id)a3 didSelectViewModel:(id)a4 presentationOptions:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a4;
  v7 = a5;
  v8 = objc_opt_class(MUDirectionsActionRowItemViewModel);
  if ((objc_opt_isKindOfClass(v11, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ParkedCarHeaderButtonsSectionController actionDelegate](self, "actionDelegate"));
    objc_msgSend(v9, "parkedCarHeaderButtonsSectionControllerRequestsDirections:", self);

  }
  else
  {
    v10 = objc_opt_class(MUPlaceActionControlledItemViewModel);
    if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0)
      objc_msgSend(v11, "performWithPresentationOptions:", v7);
  }

}

- (ParkedCarHeaderButtonsDelegate)actionDelegate
{
  return (ParkedCarHeaderButtonsDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_headerButtonsView, 0);
}

@end
