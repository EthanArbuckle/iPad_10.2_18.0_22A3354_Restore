@implementation UIContextMenuPlatformMetrics

id __37___UIContextMenuPlatformMetrics_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIVibrancyEffect effectForBlurEffect:style:](UIVibrancyEffect, "effectForBlurEffect:style:", v4, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEffect:", v5);

  +[UIColor whiteColor](UIColor, "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentBackgroundColor:", v6);

  objc_msgSend(v3, "setBackgroundShape:", v2);
  return v3;
}

id __37___UIContextMenuPlatformMetrics_init__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id *v3;

  v2 = objc_msgSend(a2, "userInterfaceStyle");
  v3 = (id *)MEMORY[0x1E0CD2E98];
  if (v2 == 2)
    v3 = (id *)MEMORY[0x1E0CD2EA0];
  return *v3;
}

UIColor *__37___UIContextMenuPlatformMetrics_init__block_invoke_3(uint64_t a1, void *a2)
{
  _BOOL4 v2;

  v2 = objc_msgSend(a2, "userInterfaceStyle") == 2;
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", dbl_186684660[v2], dbl_186684660[v2], dbl_186684660[v2], 1.0);
}

UIColor *__37___UIContextMenuPlatformMetrics_init__block_invoke_4(uint64_t a1, void *a2)
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, dbl_186685BA0[objc_msgSend(a2, "userInterfaceStyle") == 2]);
}

double __37___UIContextMenuPlatformMetrics_init__block_invoke_5(double a1, double a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int HaveAllBeenCommitted;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  void *v45;
  void *v46;

  v8 = a4;
  v9 = a5;
  v10 = v8;
  v11 = v9;
  objc_msgSend(v10, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentationLayer");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    objc_msgSend(v13, "presentationLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 && (_UILayerAncestorsHaveAllBeenCommitted(v12) & 1) != 0)
    {
      HaveAllBeenCommitted = _UILayerAncestorsHaveAllBeenCommitted(v13);

      if (!HaveAllBeenCommitted)
        goto LABEL_8;
      objc_msgSend(v12, "presentationLayer");
      v18 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "presentationLayer");
      v15 = v13;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)v18;
    }
    else
    {

    }
  }
LABEL_8:
  objc_msgSend(v10, "_window");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_window");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "windowScene");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "windowScene");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v19 == v20)
  {
    objc_msgSend(v12, "convertPoint:toLayer:", v13, a1, a2);
    v34 = v35;
  }
  else if (v22 && v21 && v21 != (void *)v22)
  {
    objc_msgSend(v21, "screen");
    v24 = v12;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "fixedCoordinateSpace");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "convertPoint:fromCoordinateSpace:", v10, a1, a2);
    v28 = v27;
    v30 = v29;

    objc_msgSend(v23, "screen");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "fixedCoordinateSpace");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "convertPoint:fromCoordinateSpace:", v32, v28, v30);
    v34 = v33;

    v12 = v24;
  }
  else
  {
    v46 = v13;
    objc_msgSend(v19, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "presentationLayer");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      v39 = (void *)v38;
      v45 = v12;
      objc_msgSend(v37, "presentationLayer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        objc_msgSend(v36, "presentationLayer");
        v41 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v37, "presentationLayer");
        v42 = objc_claimAutoreleasedReturnValue();

        v37 = (void *)v42;
        v36 = (void *)v41;
      }
      v12 = v45;
    }
    objc_msgSend(v12, "convertPoint:toLayer:", v36, a1, a2);
    objc_msgSend(v46, "convertPoint:fromLayer:", v37);
    v34 = v43;

    v13 = v46;
  }

  return v34;
}

id __37___UIContextMenuPlatformMetrics_init__block_invoke_6(uint64_t a1, char a2)
{
  if ((a2 & 2) != 0)
    +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
  else
    +[UIColor labelColor](UIColor, "labelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

UIColor *__37___UIContextMenuPlatformMetrics_init__block_invoke_7()
{
  return +[UIColor systemRedColor](UIColor, "systemRedColor");
}

double __37___UIContextMenuPlatformMetrics_init__block_invoke_8(double a1, double a2)
{
  double result;

  result = (45.0 - a2) * 0.5;
  if (result < 4.0)
    return 4.0;
  return result;
}

BOOL __37___UIContextMenuPlatformMetrics_init__block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "verticalSizeClass") == 1;
}

@end
