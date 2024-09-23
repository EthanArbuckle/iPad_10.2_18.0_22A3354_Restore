@implementation TUIImpressionOverlayView

- (TUIImpressionOverlayView)initWithFrame:(CGRect)a3
{
  TUIImpressionOverlayView *v3;
  TUIImpressionOverlayView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIImpressionOverlayView;
  v3 = -[TUIImpressionOverlayView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TUIImpressionOverlayView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TUIImpressionOverlayView;
  v4 = a3;
  -[TUIReusableBaseView applyLayoutAttributes:](&v12, "applyLayoutAttributes:", v4);
  v5 = objc_opt_class(TUIImpression);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "generic", v12.receiver, v12.super_class));

  v7 = TUIDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (objc_msgSend(v8, "timingCount"))
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor greenColor](UIColor, "greenColor"));
  else
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorWithAlphaComponent:", 0.3));

  -[TUIImpressionOverlayView setBackgroundColor:](self, "setBackgroundColor:", v11);
}

@end
