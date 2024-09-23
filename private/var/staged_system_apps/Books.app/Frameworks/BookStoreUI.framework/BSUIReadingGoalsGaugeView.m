@implementation BSUIReadingGoalsGaugeView

+ (id)renderModelWithIdentifier:(id)a3 metrics:(id)a4
{
  id v5;
  id v6;
  _BSUIRenderModelReadingGoalsGauge *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(_BSUIRenderModelReadingGoalsGauge);
  -[_BSUIRenderModelReadingGoalsGauge setMetrics:](v7, "setMetrics:", v5);

  v8 = objc_msgSend(objc_alloc((Class)TUIRenderModelView), "initWithReuseIdentifier:identifier:submodel:", CFSTR("BSUIReuseIdentifierReadingGoalsGaugeView"), v6, v7);
  return v8;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BSUIReadingGoalsGaugeView;
  v4 = a3;
  -[BSUIReadingGoalsGaugeView applyLayoutAttributes:](&v7, "applyLayoutAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderModel", v7.receiver, v7.super_class));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "submodel"));
  -[BSUIReadingGoalsGaugeView _configureWithModel:](self, "_configureWithModel:", v6);

}

- (void)dealloc
{
  objc_super v3;

  -[TUIDynamicProgress unregisterProgressObserver:](self->_dynamicProgress, "unregisterProgressObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)BSUIReadingGoalsGaugeView;
  -[BSUIReadingGoalsGaugeView dealloc](&v3, "dealloc");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BSUIReadingGoalsGaugeView;
  -[BSUIReadingGoalsGaugeView layoutSubviews](&v13, "layoutSubviews");
  -[BSUIReadingGoalsGaugeView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIReadingGoalsGaugeView hostingViewController](self, "hostingViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

}

- (void)_configureWithModel:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToRenderModel:", self->_renderModel) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_renderModel, a3);
    -[BSUIReadingGoalsGaugeView _configureHostingController](self, "_configureHostingController");
  }

}

- (void)_configureHostingController
{
  void *v3;
  _TtP11BookStoreUI34ReadingGaugeViewControllerProtocol_ *v4;
  _TtP11BookStoreUI34ReadingGaugeViewControllerProtocol_ *hostingViewController;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  TUIDynamicProgress *dynamicProgress;
  id v14;

  if (!self->_hostingViewController)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIRenderModelReadingGoalsGauge metrics](self->_renderModel, "metrics"));
    objc_msgSend(v3, "size");
    v4 = (_TtP11BookStoreUI34ReadingGaugeViewControllerProtocol_ *)objc_claimAutoreleasedReturnValue(+[BSUIReadingGoalsGaugeHostingControllerFactory createWith:](BSUIReadingGoalsGaugeHostingControllerFactory, "createWith:"));
    hostingViewController = self->_hostingViewController;
    self->_hostingViewController = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIReadingGoalsGaugeView hostingViewController](self, "hostingViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    -[BSUIReadingGoalsGaugeView addSubview:](self, "addSubview:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BSUITemplate manager](BSUITemplate, "manager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dynamicRegistry"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BCReadingTimeToday kind](BCReadingTimeToday, "kind"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "progressProviderForKind:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dynamicProgressForKind:instance:parameters:", v10, 0, 0));
    objc_msgSend(v12, "registerProgressObserver:", self);
    dynamicProgress = self->_dynamicProgress;
    self->_dynamicProgress = (TUIDynamicProgress *)v12;

  }
  v14 = (id)objc_claimAutoreleasedReturnValue(-[_BSUIRenderModelReadingGoalsGauge metrics](self->_renderModel, "metrics"));
  -[ReadingGaugeViewControllerProtocol setMetrics:](self->_hostingViewController, "setMetrics:", v14);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)dynamicProgressChanged:(id)a3
{
  id v4;
  void *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "progress"));

  if (v5)
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_A92C;
    block[3] = &unk_2E4170;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

- (BSUIReadingGoalsGaugeMetrics)metrics
{
  return self->_metrics;
}

- (_TtP11BookStoreUI34ReadingGaugeViewControllerProtocol_)hostingViewController
{
  return self->_hostingViewController;
}

- (void)setHostingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_hostingViewController, a3);
}

- (TUIDynamicProgress)dynamicProgress
{
  return self->_dynamicProgress;
}

- (void)setDynamicProgress:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicProgress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicProgress, 0);
  objc_storeStrong((id *)&self->_hostingViewController, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);
}

@end
