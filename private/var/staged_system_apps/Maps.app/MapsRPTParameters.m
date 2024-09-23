@implementation MapsRPTParameters

- (MapsRPTParameters)initWithTestName:(id)a3 view:(id)a4 completionHandler:(id)a5 testActions:(id)a6 actionDuration:(double)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MapsRPTParameters *v17;
  id v18;
  id completionHandler;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v26;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v26.receiver = self;
  v26.super_class = (Class)MapsRPTParameters;
  v17 = -[MapsRPTParameters init](&v26, "init");
  if (v17)
  {
    v18 = objc_msgSend(v15, "copy");
    completionHandler = v17->_completionHandler;
    v17->_completionHandler = v18;

    objc_storeStrong((id *)&v17->_testName, a3);
    objc_storeStrong((id *)&v17->_testActions, a6);
    objc_storeStrong((id *)&v17->_view, a4);
    objc_msgSend(v14, "bounds");
    v21 = v20 * 0.5;
    v17->_dragDist = v21;
    v17->_center.x = v24 + v21;
    v17->_center.y = v23 + v22 * 0.5;
    v17->_actionDuration = a7;
  }

  return v17;
}

- (id)composerBlock
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1005218A0;
  v3[3] = &unk_1011BA240;
  v3[4] = self;
  return objc_retainBlock(v3);
}

- (void)prepareWithComposer:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRPTParameters window](self, "window", a3));
  v4 = objc_opt_class(UIView);
  v5 = sub_1005222CC(v3, v4);
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (double)dragDist
{
  return self->_dragDist;
}

- (void)setDragDist:(double)a3
{
  self->_dragDist = a3;
}

- (CGPoint)center
{
  double x;
  double y;
  CGPoint result;

  x = self->_center.x;
  y = self->_center.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (double)duration
{
  return self->_duration;
}

- (VKMapView)view
{
  return self->_view;
}

- (NSArray)testActions
{
  return self->_testActions;
}

- (double)actionDuration
{
  return self->_actionDuration;
}

- (void)setActionDuration:(double)a3
{
  self->_actionDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testActions, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
