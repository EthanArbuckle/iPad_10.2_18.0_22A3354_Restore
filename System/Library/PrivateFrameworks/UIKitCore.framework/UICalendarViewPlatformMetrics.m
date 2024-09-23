@implementation UICalendarViewPlatformMetrics

double __38___UICalendarViewPlatformMetrics_init__block_invoke(double a1, double a2, double a3, double a4)
{
  return a4 + a2 + 375.0;
}

double __38___UICalendarViewPlatformMetrics_init__block_invoke_2()
{
  return 16.0;
}

double __38___UICalendarViewPlatformMetrics_init__block_invoke_3()
{
  return 0.0;
}

double __38___UICalendarViewPlatformMetrics_init__block_invoke_4(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "headerViewDefaultButtonConfiguration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contentInsets");

  return 0.0;
}

id __38___UICalendarViewPlatformMetrics_init__block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  return _UICalendarFont((uint64_t)CFSTR("UICTFontTextStyleHeadline"), a3, 2, a2, 0.0);
}

id __38___UICalendarViewPlatformMetrics_init__block_invoke_6(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  _UICalendarFont((uint64_t)CFSTR("UICTFontTextStyleBody"), a2, 2, 0, 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __38___UICalendarViewPlatformMetrics_init__block_invoke_7(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  _UICalendarFont((uint64_t)CFSTR("UICTFontTextStyleTitle3"), a2, 0, 0, *(double *)off_1E167DC78);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UICalendarViewPlatformMetrics _headerViewDefaultButtonConfiguration](_UICalendarViewPlatformMetrics, "_headerViewDefaultButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v2, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreferredSymbolConfigurationForImage:", v4);

  return v3;
}

id __38___UICalendarViewPlatformMetrics_init__block_invoke_8()
{
  void *v0;
  void *v1;
  void *v2;

  +[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor clearColor](UIColor, "clearColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "background");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v1);

  return v0;
}

id __38___UICalendarViewPlatformMetrics_init__block_invoke_9()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_opt_new();
  objc_msgSend(v0, "setUserInteractionEnabled:", 1);
  objc_msgSend(v0, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setCornerRadius:", 4.0);

  return v0;
}

id __38___UICalendarViewPlatformMetrics_init__block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;

  v2 = a2;
  if (objc_msgSend(v2, "isOutOfRange"))
  {
    +[UIColor quaternaryLabelColor](UIColor, "quaternaryLabelColor");
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v8 = (void *)v3;
    goto LABEL_17;
  }
  if (objc_msgSend(v2, "isOverhangMonth"))
  {
    +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (!objc_msgSend(v2, "isSelected")
    || !objc_msgSend(v2, "isToday")
    || !objc_msgSend(v2, "highlightsToday"))
  {
    if (objc_msgSend(v2, "isSelected")
      || objc_msgSend(v2, "isToday")
      && ((objc_msgSend(v2, "isHighlighted") & 1) != 0 || (objc_msgSend(v2, "isSelected") & 1) == 0))
    {
      +[UIColor tintColor](UIColor, "tintColor");
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[UIColor labelColor](UIColor, "labelColor");
      v3 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_16;
  }
  +[UIColor tintColor](UIColor, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedColorWithTraitCollection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_luminance");
  if (v7 <= 0.8)
    +[UIColor whiteColor](UIColor, "whiteColor");
  else
    +[UIColor blackColor](UIColor, "blackColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v8;
}

id __38___UICalendarViewPlatformMetrics_init__block_invoke_11(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;

  v2 = a2;
  if (objc_msgSend(v2, "isSelected")
    && objc_msgSend(v2, "isToday")
    && objc_msgSend(v2, "highlightsToday"))
  {
    +[UIColor tintColor](UIColor, "tintColor");
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v7 = (void *)v3;
    goto LABEL_12;
  }
  if (objc_msgSend(v2, "isSelected"))
  {
    +[UIColor tintColor](UIColor, "tintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = 0.12;
  }
  else
  {
    if (!objc_msgSend(v2, "isHighlighted"))
    {
      +[UIColor clearColor](UIColor, "clearColor");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    +[UIColor tintColor](UIColor, "tintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = 0.06;
  }
  objc_msgSend(v4, "colorWithAlphaComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v7;
}

id __38___UICalendarViewPlatformMetrics_init__block_invoke_12(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  double *v9;
  int v10;
  void *v11;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v6, "forceEmphasizedFont"))
  {
    objc_msgSend(v6, "isSelected");
    v9 = (double *)off_1E167DC78;
  }
  else
  {
    if (_AXSDifferentiateWithoutColorEnabled())
      v10 = objc_msgSend(v6, "isToday");
    else
      v10 = 0;
    if (objc_msgSend(v6, "isSelected") | v10)
      v9 = (double *)off_1E167DC78;
    else
      v9 = (double *)off_1E167DC70;
  }
  _UICalendarFont((uint64_t)CFSTR("UICTFontTextStyleTitle3"), (uint64_t)v8, 0, v7, *v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
