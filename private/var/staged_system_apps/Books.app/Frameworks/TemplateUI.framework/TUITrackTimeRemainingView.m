@implementation TUITrackTimeRemainingView

+ (id)renderModelWithIdentifier:(id)a3 dynamicProgress:(id)a4 style:(id)a5
{
  id v7;
  id v8;
  id v9;
  _TUITrackTimeRemainingRenderModel *v10;
  TUIRenderModelView *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(_TUITrackTimeRemainingRenderModel);
  -[_TUITrackTimeRemainingRenderModel setDynamicProgress:](v10, "setDynamicProgress:", v8);

  -[_TUITrackTimeRemainingRenderModel setStyle:](v10, "setStyle:", v7);
  v11 = -[TUIRenderModelView initWithReuseIdentifier:identifier:submodel:]([TUIRenderModelView alloc], "initWithReuseIdentifier:identifier:submodel:", CFSTR("TUIReuseIdentifierTrackTimeRemainingView"), v9, v10);

  return v11;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  _TUITrackTimeRemainingRenderModel *v6;
  _TUITrackTimeRemainingRenderModel *renderModel;
  TUIDynamicProgress *v8;
  TUIDynamicProgress *dynamicProgress;
  TUITextContentStyler *v10;
  TUITextContentStyler *style;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TUITrackTimeRemainingView;
  v4 = a3;
  -[TUIReusableBaseView applyLayoutAttributes:](&v15, "applyLayoutAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderModel", v15.receiver, v15.super_class));

  v6 = (_TUITrackTimeRemainingRenderModel *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "submodel"));
  renderModel = self->_renderModel;
  self->_renderModel = v6;

  v8 = (TUIDynamicProgress *)objc_claimAutoreleasedReturnValue(-[_TUITrackTimeRemainingRenderModel dynamicProgress](self->_renderModel, "dynamicProgress"));
  dynamicProgress = self->_dynamicProgress;
  self->_dynamicProgress = v8;

  v10 = (TUITextContentStyler *)objc_claimAutoreleasedReturnValue(-[_TUITrackTimeRemainingRenderModel style](self->_renderModel, "style"));
  style = self->_style;
  self->_style = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUITextContentStyler textColor](self->_style, "textColor"));
  -[UILabel setTextColor:](self->_textView, "setTextColor:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUITextContentStyler font](self->_style, "font"));
  -[UILabel setFont:](self->_textView, "setFont:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUITrackTimeRemainingView dynamicProgress](self, "dynamicProgress"));
  objc_msgSend(v14, "registerProgressObserver:", self);

}

- (TUITrackTimeRemainingView)initWithFrame:(CGRect)a3
{
  TUITrackTimeRemainingView *v3;
  id v4;
  UILabel *v5;
  UILabel *textView;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TUITrackTimeRemainingView;
  v3 = -[TUITrackTimeRemainingView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc((Class)UILabel);
    -[TUITrackTimeRemainingView bounds](v3, "bounds");
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:");
    textView = v3->_textView;
    v3->_textView = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v3->_textView, "setBackgroundColor:", v7);

    -[UILabel setAutoresizingMask:](v3->_textView, "setAutoresizingMask:", 18);
    -[UILabel setBaselineAdjustment:](v3->_textView, "setBaselineAdjustment:", 1);
    -[TUITrackTimeRemainingView addSubview:](v3, "addSubview:", v3->_textView);
  }
  return v3;
}

- (void)dynamicProgressChanged:(id)a3
{
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "formattedProgress"));
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E5A54;
  block[3] = &unk_23DA20;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUITrackTimeRemainingView dynamicProgress](self, "dynamicProgress"));
  objc_msgSend(v3, "unregisterProgressObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TUITrackTimeRemainingView;
  -[TUITrackTimeRemainingView dealloc](&v4, "dealloc");
}

- (_TUITrackTimeRemainingRenderModel)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
  objc_storeStrong((id *)&self->_renderModel, a3);
}

- (TUIDynamicProgress)dynamicProgress
{
  return self->_dynamicProgress;
}

- (void)setDynamicProgress:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicProgress, a3);
}

- (TUITextContentStyler)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (UILabel)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_dynamicProgress, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);
}

@end
