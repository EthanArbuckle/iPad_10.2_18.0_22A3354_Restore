@implementation SBHWidgetWrapperBackgroundView

- (SBHWidgetWrapperBackgroundView)initWithUnderlyingBackgroundView:(id)a3 widgetBackgroundView:(id)a4
{
  id v7;
  id v8;
  SBHWidgetWrapperBackgroundView *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBHWidgetWrapperBackgroundView;
  v9 = -[SBHWidgetWrapperBackgroundView init](&v11, sel_init);
  if (v9)
  {
    objc_msgSend(v7, "setAutoresizingMask:", 18);
    -[SBHWidgetWrapperBackgroundView addSubview:](v9, "addSubview:", v7);
    objc_storeStrong((id *)&v9->_underlyingBackgroundView, a3);
    objc_msgSend(v8, "setAutoresizingMask:", 18);
    -[SBHWidgetWrapperBackgroundView addSubview:](v9, "addSubview:", v8);
    objc_storeStrong((id *)&v9->_widgetBackgroundView, a4);
  }

  return v9;
}

- (UIView)underlyingBackgroundView
{
  return self->_underlyingBackgroundView;
}

- (UIView)widgetBackgroundView
{
  return self->_widgetBackgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetBackgroundView, 0);
  objc_storeStrong((id *)&self->_underlyingBackgroundView, 0);
}

@end
