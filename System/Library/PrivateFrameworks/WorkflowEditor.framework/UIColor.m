@implementation UIColor

id __58__UIColor_WorkflowEditor__wf_moduleWarningBackgroundColor__block_invoke(uint64_t a1, void *a2)
{
  _BOOL4 v2;

  v2 = objc_msgSend(a2, "userInterfaceStyle") == 2;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.23137255, 0.188235298, dbl_2268AB410[v2]);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __50__UIColor_WorkflowEditor__wf_moduleSeparatorColor__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
  {
    objc_msgSend(MEMORY[0x24BEC1398], "colorWithRGBAValue:", 960052223);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "UIColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.140000001);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

id __54__UIColor_WorkflowEditor__wf_moduleHeadingButtonColor__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
  {
    v2 = 0.278431386;
    v3 = 0.282352954;
  }
  else
  {
    v2 = 0.87843138;
    v3 = 0.890196085;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", v2, v2, v3, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __61__UIColor_WorkflowEditor__wf_moduleCommentHeadingButtonColor__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
  {
    v2 = 0.372549027;
    v3 = 0.352941185;
    v4 = 0.313725501;
    v5 = 1.0;
  }
  else
  {
    v2 = 0.87843138;
    v4 = 0.890196085;
    v5 = 1.0;
    v3 = 0.87843138;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", v2, v3, v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __68__UIColor_WorkflowEditor__wf_moduleCommentParametersBackgroundColor__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  double v4;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
  {
    v2 = 0.164705887;
    v3 = 0.141176477;
    v4 = 0.0862745121;
  }
  else
  {
    v2 = 0.984313726;
    v3 = 0.960784316;
    v4 = 0.909803927;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", v2, v3, v4, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __67__UIColor_WorkflowEditor__wf_moduleCommentParametersSeparatorColor__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  double v4;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
  {
    v2 = 0.164705887;
    v3 = 0.141176477;
    v4 = 0.0862745121;
  }
  else
  {
    v2 = 0.913725495;
    v3 = 0.827450991;
    v4 = 0.631372571;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", v2, v3, v4, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __52__UIColor_WorkflowEditor__wf_moduleCommentCellColor__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  double v4;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
  {
    v2 = 0.164705887;
    v3 = 0.141176477;
    v4 = 0.0862745121;
  }
  else
  {
    v2 = 0.972549021;
    v3 = 0.925490201;
    v4 = 0.819607854;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", v2, v3, v4, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __50__UIColor_WorkflowEditor__wf_moduleCellTitleColor__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
  {
    v2 = 0.596078455;
    v3 = 0.600000024;
  }
  else
  {
    v2 = 0.580392182;
    v3 = 0.588235319;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", v2, v2, v3, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __58__UIColor_WorkflowEditor__wf_moduleCellRunningShadowColor__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEC1398], "colorWithP3RGBAValue:", 413675775);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UIColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorWithAlphaComponent:", 0.200000003);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

@end
