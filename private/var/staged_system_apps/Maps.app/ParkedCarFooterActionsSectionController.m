@implementation ParkedCarFooterActionsSectionController

- (ParkedCarFooterActionsSectionController)initWithParkedCar:(id)a3
{
  ParkedCarFooterActionsSectionController *v3;
  ParkedCarFooterActionsSectionController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ParkedCarFooterActionsSectionController;
  v3 = -[ParkedCarSectionController initWithParkedCar:](&v6, "initWithParkedCar:", a3);
  v4 = v3;
  if (v3)
    -[ParkedCarFooterActionsSectionController _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  id v3;
  FooterContaineeAction *v4;
  FooterContaineeAction *removeAction;
  void *v6;
  void *v7;
  void *v8;
  MUPlaceSectionView *v9;
  MUPlaceSectionView *sectionView;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;
  FooterContaineeAction *v17;

  v3 = objc_msgSend(objc_alloc((Class)MUActionGroupSectionView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_initWeak(&location, self);
  v4 = objc_alloc_init(FooterContaineeAction);
  removeAction = self->_removeAction;
  self->_removeAction = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Remove Car [FindMyCar Place Card]"), CFSTR("localized string not found"), 0));
  -[SimpleContaineeAction setTitle:](self->_removeAction, "setTitle:", v7);

  -[SimpleContaineeAction setGlyph:](self->_removeAction, "setGlyph:", CFSTR("trash.fill"));
  -[SimpleContaineeAction setStyle:](self->_removeAction, "setStyle:", 1);
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_10065956C;
  v14 = &unk_1011BAB10;
  objc_copyWeak(&v15, &location);
  -[FooterContaineeAction setActionBlock:](self->_removeAction, "setActionBlock:", &v11);
  v17 = self->_removeAction;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1, v11, v12, v13, v14));
  objc_msgSend(v3, "setViewModels:", v8);

  v9 = (MUPlaceSectionView *)objc_claimAutoreleasedReturnValue(+[MUPlaceSectionView cardShadowSectionViewForContentView:sectionHeaderViewModel:](MUPlaceSectionView, "cardShadowSectionViewForContentView:sectionHeaderViewModel:", v3, 0));
  sectionView = self->_sectionView;
  self->_sectionView = v9;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (id)sectionView
{
  return self->_sectionView;
}

- (ParkedCarFooterActionsSectionControllerDelegate)actionDelegate
{
  return (ParkedCarFooterActionsSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_removeAction, 0);
}

@end
