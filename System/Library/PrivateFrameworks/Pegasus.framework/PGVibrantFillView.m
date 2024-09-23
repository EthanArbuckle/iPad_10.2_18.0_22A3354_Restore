@implementation PGVibrantFillView

- (void)PG_updateVibrancyEffectForTintColor
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  -[PGVibrantFillView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "PG_wantsVibrancyEffect");
  v5 = (void *)*MEMORY[0x1E0CD2EA0];
  if (!v4)
    v5 = 0;
  v10 = v5;

  -[PGVibrantFillView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "compositingFilter");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEqualToString:", v10) & 1) == 0 && v7 != v10)
  {
    -[PGVibrantFillView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCompositingFilter:", v10);

  }
  -[PGVibrantFillView tintColor](self, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGVibrantFillView setBackgroundColor:](self, "setBackgroundColor:", v9);

}

- (PGVibrantFillView)initWithFrame:(CGRect)a3
{
  PGVibrantFillView *v3;
  PGVibrantFillView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGVibrantFillView;
  v3 = -[PGVibrantFillView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PGVibrantFillView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  PGVibrantFillView *v5;
  PGVibrantFillView *v6;
  PGVibrantFillView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PGVibrantFillView;
  -[PGVibrantFillView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (PGVibrantFillView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v5 = 0;
  v7 = v5;

  return v7;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGVibrantFillView;
  -[PGVibrantFillView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[PGVibrantFillView PG_updateVibrancyEffectForTintColor](self, "PG_updateVibrancyEffectForTintColor");
}

@end
