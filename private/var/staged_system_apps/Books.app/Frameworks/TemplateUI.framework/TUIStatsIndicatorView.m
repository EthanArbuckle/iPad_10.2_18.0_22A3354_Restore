@implementation TUIStatsIndicatorView

+ (id)renderModelWithIdentifier:(id)a3 stats:(id)a4 uid:(id)a5
{
  id v7;
  id v8;
  id v9;
  TUIStatsIndicatorRenderModel *v10;
  TUIRenderModelView *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[TUIStatsIndicatorRenderModel initWithStats:uid:]([TUIStatsIndicatorRenderModel alloc], "initWithStats:uid:", v8, v7);

  v11 = -[TUIRenderModelView initWithReuseIdentifier:identifier:submodel:]([TUIRenderModelView alloc], "initWithReuseIdentifier:identifier:submodel:", CFSTR("TUIReuseIdentifierStatsIndicatorView"), v9, v10);
  -[TUIRenderModelView setSize:](v11, "setSize:", 180.0, 40.0);

  return v11;
}

- (TUIStatsIndicatorView)initWithFrame:(CGRect)a3
{
  TUIStatsIndicatorView *v3;
  id v4;
  UIButton *v5;
  UIButton *button;
  void *v7;
  void *v8;
  void *v9;
  UIButton *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TUIStatsIndicatorView;
  v3 = -[TUIStatsIndicatorView initWithFrame:](&v15, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc((Class)UIButton);
    -[TUIStatsIndicatorView bounds](v3, "bounds");
    v5 = (UIButton *)objc_msgSend(v4, "initWithFrame:");
    button = v3->_button;
    v3->_button = v5;

    -[UIButton setAutoresizingMask:](v3->_button, "setAutoresizingMask:", 18);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[UIButton setTintColor:](v3->_button, "setTintColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.3, 0.5));
    -[UIButton setBackgroundColor:](v3->_button, "setBackgroundColor:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v3->_button, "layer"));
    objc_msgSend(v9, "setCornerRadius:", 6.0);

    v10 = v3->_button;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[UIButton setTitleColor:forState:](v10, "setTitleColor:forState:", v11, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 18.0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v3->_button, "titleLabel"));
    objc_msgSend(v13, "setFont:", v12);

    -[UIButton addTarget:action:forControlEvents:](v3->_button, "addTarget:action:forControlEvents:", v3, "_showStats:", 64);
    -[TUIStatsIndicatorView addSubview:](v3, "addSubview:", v3->_button);
  }
  return v3;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  TUIStatsIndicatorRenderModel *v6;
  TUIStatsIndicatorRenderModel *statsModel;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)TUIStatsIndicatorView;
  v4 = a3;
  -[TUIReusableBaseView applyLayoutAttributes:](&v22, "applyLayoutAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderModel"));

  v6 = (TUIStatsIndicatorRenderModel *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "submodel"));
  statsModel = self->_statsModel;
  self->_statsModel = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsIndicatorRenderModel stats](self->_statsModel, "stats"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "entries"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsIndicatorRenderModel uid](self->_statsModel, "uid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));

  v12 = objc_alloc((Class)NSString);
  objc_msgSend(v11, "elapsedTimeForPhase:", 0);
  v14 = v13 * 1000.0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "passes"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastObject"));
  objc_msgSend(v16, "elapsedTimeForPhase:", 0);
  v18 = v17 * 1000.0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "numberOfFullPasses")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "numberOfPartialPasses")));
  v21 = objc_msgSend(v12, "initWithFormat:", CFSTR("σ %.1fms/%.1fms/%@/%@"), *(_QWORD *)&v14, *(_QWORD *)&v18, v19, v20, v22.receiver, v22.super_class);

  -[UIButton setTitle:forState:](self->_button, "setTitle:forState:", v21, 0);
}

- (id)_presentedViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsIndicatorView window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootViewController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));
  if (v4)
  {
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));

      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));
      v3 = v5;
    }
    while (v6);
  }
  else
  {
    v5 = v3;
  }
  return v5;
}

- (void)_showStats:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsIndicatorRenderModel stats](self->_statsModel, "stats", a3));
  v5 = +[TUIStatsViewControllerFactory newViewControllerWithFeed:](TUIStatsViewControllerFactory, "newViewControllerWithFeed:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsIndicatorRenderModel stats](self->_statsModel, "stats"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entries"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsIndicatorRenderModel uid](self->_statsModel, "uid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));
  v10 = +[TUIStatsViewControllerFactory newViewControllerWithFeedEntry:](TUIStatsViewControllerFactory, "newViewControllerWithFeedEntry:", v9);

  v11 = objc_alloc_init((Class)UINavigationController);
  v14[0] = v5;
  v14[1] = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
  objc_msgSend(v11, "setViewControllers:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStatsIndicatorView _presentedViewController](self, "_presentedViewController"));
  objc_msgSend(v13, "presentViewController:animated:completion:", v11, 1, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorsVC, 0);
  objc_storeStrong((id *)&self->_statsModel, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
