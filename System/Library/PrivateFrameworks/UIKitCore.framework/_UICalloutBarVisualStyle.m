@implementation _UICalloutBarVisualStyle

- (_UICalloutBarVisualStyle)initWithCalloutBar:(id)a3
{
  id v4;
  _UICalloutBarVisualStyle *v5;
  _UICalloutBarVisualStyle *v6;
  _UICalloutBarMetrics *v7;
  _UICalloutBarMetrics *barMetrics;
  id WeakRetained;
  void *v10;
  NSString *v11;
  id v12;
  double v13;
  _UICalloutBarButtonMetrics *v14;
  _UICalloutBarButtonMetrics *buttonMetrics;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UICalloutBarVisualStyle;
  v5 = -[_UICalloutBarVisualStyle init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_calloutBar, v4);
    v7 = objc_alloc_init(_UICalloutBarMetrics);
    barMetrics = v6->_barMetrics;
    v6->_barMetrics = v7;

    if (dyld_program_sdk_at_least())
    {
      WeakRetained = objc_loadWeakRetained((id *)&v6->_calloutBar);
      objc_msgSend(WeakRetained, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "preferredContentSizeCategory");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (UIContentSizeCategoryIsAccessibilityCategory(v11))
      {
        v12 = objc_loadWeakRetained((id *)&v6->_calloutBar);
        objc_msgSend(v12, "textEffectsWindowSafeArea");
        -[_UICalloutBarMetrics setIsVerticallyAligned:](v6->_barMetrics, "setIsVerticallyAligned:", v13 <= 414.0);

      }
      else
      {
        -[_UICalloutBarMetrics setIsVerticallyAligned:](v6->_barMetrics, "setIsVerticallyAligned:", 0);
      }

    }
    v14 = objc_alloc_init(_UICalloutBarButtonMetrics);
    buttonMetrics = v6->_buttonMetrics;
    v6->_buttonMetrics = v14;

  }
  return v6;
}

- (UICalloutBar)calloutBar
{
  return (UICalloutBar *)objc_loadWeakRetained((id *)&self->_calloutBar);
}

- (_UICalloutBarMetrics)barMetrics
{
  return self->_barMetrics;
}

- (_UICalloutBarButtonMetrics)buttonMetrics
{
  return self->_buttonMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonMetrics, 0);
  objc_storeStrong((id *)&self->_barMetrics, 0);
  objc_destroyWeak((id *)&self->_calloutBar);
}

@end
