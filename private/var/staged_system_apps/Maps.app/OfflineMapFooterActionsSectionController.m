@implementation OfflineMapFooterActionsSectionController

- (OfflineMapFooterActionsSectionController)initWithSubscriptionInfo:(id)a3
{
  OfflineMapFooterActionsSectionController *v3;
  OfflineMapFooterActionsSectionController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OfflineMapFooterActionsSectionController;
  v3 = -[OfflineMapSectionController initWithSubscriptionInfo:](&v6, "initWithSubscriptionInfo:", a3);
  v4 = v3;
  if (v3)
    -[OfflineMapFooterActionsSectionController _commonInit](v3, "_commonInit");
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
  void *v9;
  MUPlaceSectionView *v10;
  MUPlaceSectionView *sectionView;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;
  FooterContaineeAction *v18;

  v3 = objc_msgSend(objc_alloc((Class)MUActionGroupSectionView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("OfflineMapFooterActionsSection"));
  objc_initWeak(&location, self);
  v4 = objc_alloc_init(FooterContaineeAction);
  removeAction = self->_removeAction;
  self->_removeAction = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Delete Map"), CFSTR("localized string not found"), CFSTR("Offline")));
  -[SimpleContaineeAction setTitle:](self->_removeAction, "setTitle:", v7);

  -[SimpleContaineeAction setStyle:](self->_removeAction, "setStyle:", 1);
  -[FooterContaineeAction setCellStyle:](self->_removeAction, "setCellStyle:", 1);
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_1006D7E04;
  v15 = &unk_1011BAB10;
  objc_copyWeak(&v16, &location);
  -[FooterContaineeAction setActionBlock:](self->_removeAction, "setActionBlock:", &v12);
  -[SimpleContaineeAction setAccessibilityIdentifier:](self->_removeAction, "setAccessibilityIdentifier:", CFSTR("DeleteMapButton"), v12, v13, v14, v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeAction title](self->_removeAction, "title"));
  -[FooterContaineeAction setAccessibilityLabel:](self->_removeAction, "setAccessibilityLabel:", v8);

  v18 = self->_removeAction;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  objc_msgSend(v3, "setViewModels:", v9);

  v10 = (MUPlaceSectionView *)objc_claimAutoreleasedReturnValue(+[MUPlaceSectionView cardShadowSectionViewForContentView:sectionHeaderViewModel:](MUPlaceSectionView, "cardShadowSectionViewForContentView:sectionHeaderViewModel:", v3, 0));
  sectionView = self->_sectionView;
  self->_sectionView = v10;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (id)sectionView
{
  return self->_sectionView;
}

- (OfflineMapDetailsActionSectionControllerDelegate)actionDelegate
{
  return (OfflineMapDetailsActionSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
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
