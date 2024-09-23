@implementation RoutePlanningWaypointTableView

- (void)layoutSubviews
{
  void *v3;
  void (**v4)(void);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RoutePlanningWaypointTableView;
  -[RoutePlanningWaypointTableView layoutSubviews](&v5, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointTableView postLayoutHandler](self, "postLayoutHandler"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointTableView postLayoutHandler](self, "postLayoutHandler"));
    v4[2]();

  }
}

- (id)postLayoutHandler
{
  return self->_postLayoutHandler;
}

- (void)setPostLayoutHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_postLayoutHandler, 0);
}

@end
