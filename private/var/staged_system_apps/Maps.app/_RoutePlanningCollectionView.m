@implementation _RoutePlanningCollectionView

- (void)layoutSubviews
{
  void *v3;
  void (**v4)(void);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_RoutePlanningCollectionView;
  -[_RoutePlanningCollectionView layoutSubviews](&v5, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_RoutePlanningCollectionView layoutHandler](self, "layoutHandler"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[_RoutePlanningCollectionView layoutHandler](self, "layoutHandler"));
    v4[2]();

  }
}

- (id)layoutHandler
{
  return self->_layoutHandler;
}

- (void)setLayoutHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_layoutHandler, 0);
}

@end
