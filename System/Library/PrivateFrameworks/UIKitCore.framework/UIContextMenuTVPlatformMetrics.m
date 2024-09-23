@implementation UIContextMenuTVPlatformMetrics

UIColor *__39___UIContextMenuTVPlatformMetrics_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  BOOL v3;
  double v4;

  v2 = objc_msgSend(a2, "userInterfaceStyle");
  v3 = v2 == 1000 || v2 == 2;
  v4 = 0.25;
  if (!v3)
    v4 = 0.08;
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, v4);
}

id __39___UIContextMenuTVPlatformMetrics_init__block_invoke_2(uint64_t a1, void *a2, char a3)
{
  uint64_t v3;
  id *v4;

  if ((a3 & 8) != 0)
    return 0;
  v3 = objc_msgSend(a2, "userInterfaceStyle");
  v4 = (id *)MEMORY[0x1E0CD2EA0];
  if (v3 != 2)
    v4 = (id *)MEMORY[0x1E0CD2E98];
  return *v4;
}

id __39___UIContextMenuTVPlatformMetrics_init__block_invoke_3(uint64_t a1, char a2, char a3)
{
  void *v3;

  if ((a2 & 9) != 0)
  {
    if ((a3 & 1) != 0)
      +[UIColor systemRedColor](UIColor, "systemRedColor");
    else
      +[UIColor whiteColor](UIColor, "whiteColor");
  }
  else if ((a2 & 4) != 0)
  {
    +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &__block_literal_global_7_4);
  }
  else
  {
    +[UIColor clearColor](UIColor, "clearColor");
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

UIColor *__39___UIContextMenuTVPlatformMetrics_init__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  BOOL v3;
  double v4;

  v2 = objc_msgSend(a2, "userInterfaceStyle");
  v3 = v2 == 1000 || v2 == 2;
  v4 = 0.0;
  if (v3)
    v4 = 1.0;
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v4, 0.15);
}

id __39___UIContextMenuTVPlatformMetrics_init__block_invoke_5(uint64_t a1, char a2)
{
  void *v2;

  if ((a2 & 2) != 0)
  {
    +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((a2 & 9) != 0)
      +[UIColor blackColor](UIColor, "blackColor");
    else
      +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &__block_literal_global_10_2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

UIColor *__39___UIContextMenuTVPlatformMetrics_init__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2;
  BOOL v3;
  double v4;

  v2 = objc_msgSend(a2, "userInterfaceStyle");
  v3 = v2 == 1000 || v2 == 2;
  v4 = 0.501960784;
  if (v3)
    v4 = 0.48627451;
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v4, 1.0);
}

id __39___UIContextMenuTVPlatformMetrics_init__block_invoke_7(uint64_t a1, char a2)
{
  if ((a2 & 8) != 0)
    +[UIColor whiteColor](UIColor, "whiteColor");
  else
    +[UIColor systemRedColor](UIColor, "systemRedColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

UIColor *__39___UIContextMenuTVPlatformMetrics_init__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2;
  BOOL v3;
  double v4;

  v2 = objc_msgSend(a2, "userInterfaceStyle");
  v3 = v2 == 1000 || v2 == 2;
  v4 = 0.62745098;
  if (v3)
    v4 = 0.48627451;
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v4, 1.0);
}

id __39___UIContextMenuTVPlatformMetrics_init__block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v2;
  id *v3;

  v2 = objc_msgSend(a2, "userInterfaceStyle");
  v3 = (id *)MEMORY[0x1E0CD2E98];
  if (v2 == 2)
    v3 = (id *)MEMORY[0x1E0CD2EA0];
  return *v3;
}

id __39___UIContextMenuTVPlatformMetrics_init__block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v2;
  int v3;
  void *v4;
  double v5;
  BOOL v6;
  int v7;
  double v8;

  v2 = objc_msgSend(a2, "userInterfaceStyle");
  v3 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76508, (uint64_t)CFSTR("TVContextMenu_DarkModeBackgroundHairlineAlpha"));
  v4 = 0;
  if (v3)
    v5 = 0.5;
  else
    v5 = *(double *)&qword_1ECD76510;
  v6 = v2 == 1000 || v2 == 2;
  if (v6 && v5 > 0.0)
  {
    v7 = _UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_909, (uint64_t)CFSTR("TVContextMenu_DarkModeBackgroundHairlineWhite"));
    v8 = *(double *)&qword_1ECD76500;
    if (v7)
      v8 = 0.4;
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v8, v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

BOOL __39___UIContextMenuTVPlatformMetrics_init__block_invoke_11(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveShadowPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

BOOL __39___UIContextMenuTVPlatformMetrics_init__block_invoke_12(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visiblePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

uint64_t __39___UIContextMenuTVPlatformMetrics_init__block_invoke_13()
{
  return 2;
}

uint64_t __39___UIContextMenuTVPlatformMetrics_init__block_invoke_14(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = 1;
  if (a3)
    v3 = 2;
  return v3 & (a2 << 60 >> 63);
}

double __39___UIContextMenuTVPlatformMetrics_init__block_invoke_15()
{
  return 20.0;
}

double __39___UIContextMenuTVPlatformMetrics_init__block_invoke_16()
{
  return 13.0;
}

BOOL __39___UIContextMenuTVPlatformMetrics_init__block_invoke_17(double a1)
{
  return a1 < 1300.0;
}

@end
