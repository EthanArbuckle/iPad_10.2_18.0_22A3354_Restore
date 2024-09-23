@implementation UIColor

id __54__UIColor_WorkflowUI__wf_usableColorWithPaletteColor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_msgSend(a2, "userInterfaceStyle");
  v4 = *(void **)(a1 + 32);
  if (v3 == 2)
    objc_msgSend(v4, "darkBaseColor");
  else
    objc_msgSend(v4, "baseColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UIColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __51__UIColor_WorkflowUI__wf_libraryCellSelectionColor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  double v3;

  v2 = objc_msgSend(a2, "userInterfaceStyle");
  v3 = 1.0;
  if (v2 == 2)
    v3 = 0.0;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", v3, 0.300000012);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __47__UIColor_WorkflowUI__wf_wizardBackgroundColor__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
  {
    v2 = 0.0;
    v3 = 0.0;
    v4 = 0.0;
    v5 = 1.0;
  }
  else
  {
    v2 = 0.937254906;
    v4 = 0.952941179;
    v5 = 1.0;
    v3 = 0.937254906;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", v2, v3, v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
