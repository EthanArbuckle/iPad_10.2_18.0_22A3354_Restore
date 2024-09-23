@implementation RoutePlanningOutlineSection

- (RoutePlanningOutlineSection)initWithCollectionView:(id)a3 sectionIdentifier:(id)a4
{
  id v7;
  id v8;
  RoutePlanningOutlineSection *v9;
  RoutePlanningOutlineSection *v10;
  NSString *v11;
  NSString *sectionIdentifier;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RoutePlanningOutlineSection;
  v9 = -[RoutePlanningOutlineSection init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    v9->_active = 1;
    v11 = (NSString *)objc_msgSend(v8, "copy");
    sectionIdentifier = v10->_sectionIdentifier;
    v10->_sectionIdentifier = v11;

    objc_storeStrong((id *)&v10->_collectionView, a3);
  }

  return v10;
}

- (id)layoutSectionAtIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOutlineSection listLayoutSectionConfigurationAtIndex:layoutEnvironment:](self, "listLayoutSectionConfigurationAtIndex:layoutEnvironment:", a3, v6));
  if (sub_1002A8AA0(self->_collectionView) == 5)
  {
    objc_msgSend(v7, "setSeparatorStyle:", 0);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_separatorConfiguration"));
    v9 = objc_msgSend(v8, "copy");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView theme](self->_collectionView, "theme"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dynamicHairlineColor"));
    objc_msgSend(v9, "_setColor:", v11);

    objc_msgSend(v7, "_setSeparatorConfiguration:", v9);
  }
  v12 = objc_msgSend(objc_alloc((Class)_UICollectionViewListLayoutSection), "initWithConfiguration:layoutEnvironment:", v7, v6);

  return v12;
}

- (id)listLayoutSectionConfigurationAtIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = objc_msgSend(objc_alloc((Class)_UICollectionViewListLayoutSectionConfiguration), "initWithAppearanceStyle:layoutEnvironment:", 0, v5);

  -[RoutePlanningOutlineSection estimatedItemHeight](self, "estimatedItemHeight");
  objc_msgSend(v6, "setEstimatedRowHeight:");
  objc_msgSend(v6, "setSeparatorStyle:", 1);
  return v6;
}

- (double)estimatedItemHeight
{
  return _UICollectionViewListLayoutSectionAutomaticDimension;
}

- (BOOL)wantsDefaultPaddingAboveSection
{
  return 1;
}

- (id)cellForItemAtIndexPath:(id)a3
{
  -[RoutePlanningOutlineSection doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return objc_msgSend(objc_alloc((Class)UICollectionViewCell), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  -[RoutePlanningOutlineSection doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)shouldHighlightItemAtIndexPath:(id)a3
{
  return 1;
}

- (BOOL)shouldSelectItemAtIndexPath:(id)a3
{
  return 1;
}

- (BOOL)selectionFollowsFocusForItemAtIndexPath:(id)a3
{
  return 0;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (RoutePlanningOutlineSectionHosting)host
{
  return (RoutePlanningOutlineSectionHosting *)objc_loadWeakRetained((id *)&self->_host);
}

- (void)setHost:(id)a3
{
  objc_storeWeak((id *)&self->_host, a3);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
