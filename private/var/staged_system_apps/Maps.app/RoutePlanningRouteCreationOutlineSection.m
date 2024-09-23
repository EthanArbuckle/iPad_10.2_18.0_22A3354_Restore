@implementation RoutePlanningRouteCreationOutlineSection

- (RoutePlanningRouteCreationOutlineSection)initWithCollectionView:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  RoutePlanningRouteCreationOutlineSection *v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RoutePlanningRouteCreationOutlineSection;
  v7 = -[RoutePlanningOutlineSection initWithCollectionView:sectionIdentifier:](&v9, "initWithCollectionView:sectionIdentifier:", v6, a4);
  if (v7)
    objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(RoutePlanningOverviewRouteCreationCell), CFSTR("RouteCreation"));

  return v7;
}

- (id)listLayoutSectionConfigurationAtIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v5;
  void *v6;
  double Width;
  void *v8;
  objc_super v10;
  CGRect v11;

  v10.receiver = self;
  v10.super_class = (Class)RoutePlanningRouteCreationOutlineSection;
  v5 = -[RoutePlanningOutlineSection listLayoutSectionConfigurationAtIndex:layoutEnvironment:](&v10, "listLayoutSectionConfigurationAtIndex:layoutEnvironment:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v6, "setSeparatorStyle:", 0);
  objc_msgSend(v6, "setEstimatedRowHeight:", 0.0);
  -[UICollectionView frame](self->super._collectionView, "frame");
  Width = CGRectGetWidth(v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView traitCollection](self->super._collectionView, "traitCollection"));
  +[RoutePlanningOverviewRouteCreationCell heightForWidth:traitCollection:](RoutePlanningOverviewRouteCreationCell, "heightForWidth:traitCollection:", v8, Width);
  objc_msgSend(v6, "setRowHeight:");

  return v6;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return 1;
}

- (id)cellForItemAtIndexPath:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](self->super._collectionView, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("RouteCreation"), a3));
  -[RoutePlanningRouteCreationOutlineSection _configureCell:](self, "_configureCell:", v4);
  return v4;
}

- (void)_configureCell:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningRouteCreationOutlineSection routeCreationDelegate](self, "routeCreationDelegate"));
  objc_msgSend(v4, "setDelegate:", v5);

}

- (RoutePlanningOverviewRouteCreationCellDelegate)routeCreationDelegate
{
  return (RoutePlanningOverviewRouteCreationCellDelegate *)objc_loadWeakRetained((id *)&self->_routeCreationDelegate);
}

- (void)setRouteCreationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_routeCreationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_routeCreationDelegate);
}

@end
