@implementation SiriSharedUIStandardVisualEffectView

- (void)layoutSubviews
{
  UIView *backgroundView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriSharedUIStandardVisualEffectView;
  -[SiriSharedUIStandardVisualEffectView layoutSubviews](&v4, sel_layoutSubviews);
  backgroundView = self->_backgroundView;
  -[SiriSharedUIStandardVisualEffectView bounds](self, "bounds");
  -[UIView setFrame:](backgroundView, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
