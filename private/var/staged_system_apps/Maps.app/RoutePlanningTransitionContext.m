@implementation RoutePlanningTransitionContext

- (RoutePlanningTransitionContext)initWithFullTableHeight:(double)a3 initiatedFromFullLayout:(BOOL)a4 withInitialOffsetY:(double)a5 heightToFrame:(double)a6 originToFrameHandler:(id)a7
{
  _BOOL8 v9;
  id v12;
  RoutePlanningTransitionContext *v13;
  RoutePlanningTransitionContext *v14;
  objc_super v16;

  v9 = a4;
  v12 = a7;
  v16.receiver = self;
  v16.super_class = (Class)RoutePlanningTransitionContext;
  v13 = -[RoutePlanningTransitionContext init](&v16, "init");
  v14 = v13;
  if (v13)
  {
    -[RoutePlanningTransitionContext setTableViewHeightForFullLayout:](v13, "setTableViewHeightForFullLayout:", a3);
    -[RoutePlanningTransitionContext setHeightToFrame:](v14, "setHeightToFrame:", a6);
    -[RoutePlanningTransitionContext setInitialOffsetY:](v14, "setInitialOffsetY:", a5);
    -[RoutePlanningTransitionContext setInitiatedFromFullLayout:](v14, "setInitiatedFromFullLayout:", v9);
    -[RoutePlanningTransitionContext setOriginToFrameHandler:](v14, "setOriginToFrameHandler:", v12);
  }

  return v14;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RoutePlanningTransitionContext;
  v3 = -[RoutePlanningTransitionContext description](&v10, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[RoutePlanningTransitionContext tableViewHeightForFullLayout](self, "tableViewHeightForFullLayout");
  v6 = v5;
  -[RoutePlanningTransitionContext heightToFrame](self, "heightToFrame");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (tableViewHeightForFullLayout: %#.5lf, heightToFrame: %#.5lf)"), v4, v6, v7));

  return v8;
}

- (double)currentFrameOrigin
{
  void *v3;
  double (**v4)(void);
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionContext originToFrameHandler](self, "originToFrameHandler"));
  if (v3)
  {
    v4 = (double (**)(void))objc_claimAutoreleasedReturnValue(-[RoutePlanningTransitionContext originToFrameHandler](self, "originToFrameHandler"));
    v5 = v4[2]();

  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)tableViewHeightForFullLayout
{
  return self->_tableViewHeightForFullLayout;
}

- (void)setTableViewHeightForFullLayout:(double)a3
{
  self->_tableViewHeightForFullLayout = a3;
}

- (double)heightToFrame
{
  return self->_heightToFrame;
}

- (void)setHeightToFrame:(double)a3
{
  self->_heightToFrame = a3;
}

- (double)initialOffsetY
{
  return self->_initialOffsetY;
}

- (void)setInitialOffsetY:(double)a3
{
  self->_initialOffsetY = a3;
}

- (BOOL)initiatedFromFullLayout
{
  return self->_initiatedFromFullLayout;
}

- (void)setInitiatedFromFullLayout:(BOOL)a3
{
  self->_initiatedFromFullLayout = a3;
}

- (id)originToFrameHandler
{
  return self->_originToFrameHandler;
}

- (void)setOriginToFrameHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_originToFrameHandler, 0);
}

@end
