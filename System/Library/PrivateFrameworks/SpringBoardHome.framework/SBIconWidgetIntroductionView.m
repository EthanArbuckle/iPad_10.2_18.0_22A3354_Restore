@implementation SBIconWidgetIntroductionView

- (SBIconWidgetIntroductionView)initWithWidgetIcons:(id)a3
{
  id v4;
  SBIconWidgetIntroductionView *v5;
  uint64_t v6;
  NSArray *widgetIcons;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBIconWidgetIntroductionView;
  v5 = -[SBIconWidgetIntroductionView init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    widgetIcons = v5->_widgetIcons;
    v5->_widgetIcons = (NSArray *)v6;

  }
  return v5;
}

- (NSArray)widgetIcons
{
  return self->_widgetIcons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetIcons, 0);
}

@end
