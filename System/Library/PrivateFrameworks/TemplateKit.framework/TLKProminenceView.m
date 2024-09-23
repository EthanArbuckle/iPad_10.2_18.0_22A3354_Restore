@implementation TLKProminenceView

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLKProminenceView;
  -[TLKProminenceView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[TLKProminenceView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[TLKProminenceView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TLKProminenceView;
  -[TLKProminenceView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  void *v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TLKProminenceView;
  -[UIView tlk_updateForAppearance:](&v13, sel_tlk_updateForAppearance_, v4);
  objc_msgSend(v4, "colorForProminence:", -[TLKProminenceView prominence](self, "prominence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKProminenceView customColorAlpha](self, "customColorAlpha");
  if (v6 != 0.0)
  {
    -[TLKProminenceView customColorAlpha](self, "customColorAlpha");
    objc_msgSend(v5, "colorWithAlphaComponent:");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  -[TLKProminenceView borderWidth](self, "borderWidth");
  v9 = v8;
  if (v8 == 0.0)
    v10 = v5;
  else
    v10 = 0;
  -[TLKProminenceView setBackgroundColor:](self, "setBackgroundColor:", v10);
  if (v9 == 0.0)
    v11 = 0;
  else
    v11 = objc_msgSend(objc_retainAutorelease(v5), "CGColor");
  -[TLKProminenceView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBorderColor:", v11);

  objc_msgSend(v4, "enableAppearanceForView:", self);
}

- (double)borderWidth
{
  void *v2;
  double v3;
  double v4;

  -[TLKProminenceView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "borderWidth");
  v4 = v3;

  return v4;
}

- (unint64_t)prominence
{
  return self->_prominence;
}

- (double)customColorAlpha
{
  return self->_customColorAlpha;
}

- (void)setCustomColorAlpha:(double)a3
{
  if (self->_customColorAlpha != a3)
  {
    self->_customColorAlpha = a3;
    -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  }
}

- (void)setProminence:(unint64_t)a3
{
  if (self->_prominence != a3)
  {
    self->_prominence = a3;
    -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  }
}

- (void)setBorderWidth:(double)a3
{
  void *v5;

  -[TLKProminenceView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderWidth:", a3);

  -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

+ (TLKProminenceView)viewWithProminence:(unint64_t)a3
{
  return (TLKProminenceView *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithProminence:", a3);
}

- (TLKProminenceView)initWithProminence:(unint64_t)a3
{
  TLKProminenceView *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TLKProminenceView;
  result = -[TLKProminenceView init](&v5, sel_init);
  if (result)
    result->_prominence = a3;
  return result;
}

- (TLKProminenceView)init
{
  return -[TLKProminenceView initWithProminence:](self, "initWithProminence:", 1);
}

@end
