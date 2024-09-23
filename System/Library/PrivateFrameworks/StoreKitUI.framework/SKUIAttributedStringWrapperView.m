@implementation SKUIAttributedStringWrapperView

- (SKUIAttributedStringWrapperView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIAttributedStringWrapperView *v7;
  SKUIAttributedStringView *v8;
  SKUIAttributedStringView *delegateView;
  SKUIAttributedStringView *v10;
  void *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)SKUIAttributedStringWrapperView;
  v7 = -[SKUIAttributedStringView initWithFrame:](&v13, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[SKUIAttributedStringView initWithFrame:]([SKUIAttributedStringView alloc], "initWithFrame:", x, y, width, height);
    delegateView = v7->_delegateView;
    v7->_delegateView = v8;

    v10 = v7->_delegateView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIAttributedStringView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[SKUIAttributedStringWrapperView addSubview:](v7, "addSubview:", v7->_delegateView);
  }
  return v7;
}

- (void)viewWasRecycled
{
  -[SKUIAttributedStringView viewWasRecycled](self->_delegateView, "viewWasRecycled");
}

- (int64_t)badgePlacement
{
  return -[SKUIAttributedStringView badgePlacement](self->_delegateView, "badgePlacement");
}

- (double)baselineOffset
{
  double result;

  -[SKUIAttributedStringView baselineOffset](self->_delegateView, "baselineOffset");
  return result;
}

- (double)firstBaselineOffset
{
  double result;

  -[SKUIAttributedStringView firstBaselineOffset](self->_delegateView, "firstBaselineOffset");
  return result;
}

- (void)setBadgePlacement:(int64_t)a3
{
  -[SKUIAttributedStringView setBadgePlacement:](self->_delegateView, "setBadgePlacement:", a3);
}

- (void)setFirstLineTopInset:(int64_t)a3
{
  -[SKUIAttributedStringView setFirstLineTopInset:](self->_delegateView, "setFirstLineTopInset:", a3);
}

- (int64_t)firstLineTopInset
{
  return -[SKUIAttributedStringView firstLineTopInset](self->_delegateView, "firstLineTopInset");
}

- (void)setLayout:(id)a3
{
  -[SKUIAttributedStringView setLayout:](self->_delegateView, "setLayout:", a3);
}

- (id)layout
{
  return -[SKUIAttributedStringView layout](self->_delegateView, "layout");
}

- (void)setRequiredBadges:(id)a3
{
  -[SKUIAttributedStringView setRequiredBadges:](self->_delegateView, "setRequiredBadges:", a3);
}

- (id)requiredBadges
{
  return -[SKUIAttributedStringView requiredBadges](self->_delegateView, "requiredBadges");
}

- (void)setStringTreatment:(int64_t)a3
{
  -[SKUIAttributedStringView setStringTreatment:](self->_delegateView, "setStringTreatment:", a3);
}

- (int64_t)stringTreatment
{
  return -[SKUIAttributedStringView stringTreatment](self->_delegateView, "stringTreatment");
}

- (void)setTextColor:(id)a3
{
  -[SKUIAttributedStringView setTextColor:](self->_delegateView, "setTextColor:", a3);
}

- (id)textColor
{
  return -[SKUIAttributedStringView textColor](self->_delegateView, "textColor");
}

- (void)setTextColorFollowsTintColor:(BOOL)a3
{
  -[SKUIAttributedStringView setTextColorFollowsTintColor:](self->_delegateView, "setTextColorFollowsTintColor:", a3);
}

- (BOOL)textColorFollowsTintColor
{
  return -[SKUIAttributedStringView textColorFollowsTintColor](self->_delegateView, "textColorFollowsTintColor");
}

- (void)setTreatmentColor:(id)a3
{
  -[SKUIAttributedStringView setTreatmentColor:](self->_delegateView, "setTreatmentColor:", a3);
}

- (id)treatmentColor
{
  return -[SKUIAttributedStringView treatmentColor](self->_delegateView, "treatmentColor");
}

- (BOOL)usesTallCharacterSet
{
  return -[SKUIAttributedStringView usesTallCharacterSet](self->_delegateView, "usesTallCharacterSet");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SKUIAttributedStringWrapperView;
  -[SKUIAttributedStringWrapperView layoutSubviews](&v25, sel_layoutSubviews);
  -[SKUIAttributedStringWrapperView layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "edgeInsetsForShadow");
  v5 = -v4;

  -[SKUIAttributedStringWrapperView layout](self, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "edgeInsetsForShadow");
  v8 = -v7;

  -[SKUIAttributedStringWrapperView layout](self, "layout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "edgeInsetsForShadow");
  v11 = v10;
  -[SKUIAttributedStringWrapperView bounds](self, "bounds");
  v13 = v11 + v12;
  -[SKUIAttributedStringWrapperView layout](self, "layout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "edgeInsetsForShadow");
  v16 = v13 + v15;

  -[SKUIAttributedStringWrapperView layout](self, "layout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "edgeInsetsForShadow");
  v19 = v18;
  -[SKUIAttributedStringWrapperView bounds](self, "bounds");
  v21 = v19 + v20;
  -[SKUIAttributedStringWrapperView layout](self, "layout");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "edgeInsetsForShadow");
  v24 = v21 + v23;

  -[SKUIAttributedStringWrapperView sendSubviewToBack:](self, "sendSubviewToBack:", self->_delegateView);
  -[SKUIAttributedStringView setFrame:](self->_delegateView, "setFrame:", v5, v8, v16, v24);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[SKUIAttributedStringView sizeThatFits:](self->_delegateView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (SKUIAttributedStringView)delegateView
{
  return self->_delegateView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateView, 0);
}

@end
