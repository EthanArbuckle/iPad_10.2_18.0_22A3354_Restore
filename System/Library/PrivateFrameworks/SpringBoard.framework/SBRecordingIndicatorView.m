@implementation SBRecordingIndicatorView

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBRecordingIndicatorView;
  -[SBRecordingIndicatorView layoutSubviews](&v8, sel_layoutSubviews);
  if (-[SBRecordingIndicatorView indicatorType](self, "indicatorType") > 1)
  {
    -[SBRecordingIndicatorView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0.0;
  }
  else
  {
    -[SBRecordingIndicatorView bounds](self, "bounds");
    v4 = v3 * 0.5;
    -[SBRecordingIndicatorView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = v4;
  }
  objc_msgSend(v5, "setCornerRadius:", v7);

  -[SBRecordingIndicatorView _setAllowsHighContrastForBackgroundColor:](self, "_setAllowsHighContrastForBackgroundColor:", 1);
}

- (unint64_t)indicatorType
{
  return self->_indicatorType;
}

- (void)setIndicatorType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_indicatorType != a3)
  {
    self->_indicatorType = a3;
    -[SBRecordingIndicatorView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CAPrivacyIndicatorTypeForIndicatorType((id)a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "privacyIndicatorType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 != v7)
    {
      SBLogStatusBarish();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] updating secure indicator type for view-dot to %@", (uint8_t *)&v9, 0xCu);
      }

      objc_msgSend(v5, "setPrivacyIndicatorType:", v6);
      -[SBRecordingIndicatorView setNeedsLayout](self, "setNeedsLayout");
      -[SBRecordingIndicatorView layoutIfNeeded](self, "layoutIfNeeded");
    }

  }
}

- (SBRecordingIndicatorView)initWithFrame:(CGRect)a3
{
  SBRecordingIndicatorView *v3;
  SBRecordingIndicatorView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBRecordingIndicatorView;
  v3 = -[SBRecordingIndicatorView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SBRecordingIndicatorView _resetSecureLayerIndicatorType]((id *)&v3->super.super.super.isa);
  return v4;
}

- (void)_resetSecureLayerIndicatorType
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  if (a1)
  {
    CAPrivacyIndicatorTypeForIndicatorType(a1[52]);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v2 = objc_opt_class();
    objc_msgSend(a1, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v2, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setPrivacyIndicatorType:", v5);
  }
}

- (SBRecordingIndicatorView)initWithCoder:(id)a3
{
  SBRecordingIndicatorView *v3;
  SBRecordingIndicatorView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBRecordingIndicatorView;
  v3 = -[SBRecordingIndicatorView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[SBRecordingIndicatorView _resetSecureLayerIndicatorType]((id *)&v3->super.super.super.isa);
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
