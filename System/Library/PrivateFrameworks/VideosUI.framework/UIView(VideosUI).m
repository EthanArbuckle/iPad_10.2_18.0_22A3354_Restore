@implementation UIView(VideosUI)

- (BOOL)vui_shouldRecomputeCachedSizeThatFits:()VideosUI previousTargetSize:previousTraitCollection:newTargetSize:
{
  id v16;
  BOOL v17;
  void *v18;
  _BOOL8 v19;
  uint64_t v20;
  BOOL v21;

  v16 = a9;
  v17 = a3 == *(double *)(MEMORY[0x1E0C9D820] + 8) && a2 == *MEMORY[0x1E0C9D820];
  objc_msgSend(a1, "vuiTraitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 1;
  if (v16 && !v17)
  {
    v20 = objc_msgSend(v16, "legibilityWeight");
    if (v20 != objc_msgSend(v18, "legibilityWeight"))
    {
      v19 = 1;
      goto LABEL_20;
    }
    if (a4 == a6 && a5 == a7)
      goto LABEL_9;
    if (a6 > a4)
    {
      v21 = a2 < a4;
      goto LABEL_17;
    }
    if (a6 < a4)
    {
      v21 = a2 < a6;
      goto LABEL_17;
    }
    if (a7 == 0.0)
    {
LABEL_16:
      v21 = a3 < a5;
LABEL_17:
      v19 = !v21;
      goto LABEL_20;
    }
    if (a5 != 0.0)
    {
      if (a7 > a5)
        goto LABEL_16;
      if (a7 >= a5)
      {
LABEL_9:
        v19 = 0;
        goto LABEL_20;
      }
    }
    v19 = a3 > a7;
  }
LABEL_20:

  return v19;
}

- (double)vui_sizeThatFits:()VideosUI layout:withSizeCalculation:
{
  double (**v8)(_QWORD, double, double);
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v24;

  v8 = a6;
  v9 = a5;
  objc_msgSend(v9, "minWidth");
  v11 = v10;
  objc_msgSend(v9, "minHeight");
  objc_msgSend(v9, "maxWidth");
  v13 = v12;
  objc_msgSend(v9, "maxHeight");
  v15 = v14;
  objc_msgSend(v9, "width");
  v17 = v16;
  objc_msgSend(v9, "height");
  v19 = v18;

  if (v17 <= 0.0 || v19 <= 0.0)
  {
    v20 = v17;
    v21 = v17;
    if (v17 <= 0.0)
    {
      if (a1 > 0.0 && (a1 < v13 || v13 <= 0.0))
      {
        v17 = a1;
        v20 = v11;
        v21 = a1;
      }
      else
      {
        if (v13 <= 0.0)
          v17 = a1;
        else
          v17 = v13;
        v20 = v11;
        v21 = v13;
      }
    }
    if (v19 <= 0.0)
    {
      if (a2 > 0.0 && (a2 < v15 || v15 <= 0.0))
      {
        v19 = a2;
      }
      else if (v15 > 0.0)
      {
        v19 = v15;
      }
      else
      {
        v19 = a2;
      }
    }
    v22 = v8[2](v8, v17, v19);
    if (v22 <= v21 || v21 <= 0.0)
      v24 = v22;
    else
      v24 = v21;
    if (v22 >= v20)
      v17 = v24;
    else
      v17 = v20;
  }

  return v17;
}

- (uint64_t)vui_sizeThatFits:()VideosUI layout:
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__UIView_VideosUI__vui_sizeThatFits_layout___block_invoke;
  v4[3] = &unk_1E9F9A4C0;
  v4[4] = a1;
  return objc_msgSend(a1, "vui_sizeThatFits:layout:withSizeCalculation:", a3, v4);
}

- (double)topMarginWithBaselineMargin:()VideosUI maximumContentSizeCategory:
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)MEMORY[0x1E0DC69B0];
  objc_msgSend(a1, "vuiTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaleContentSizeValue:forTraitCollection:", v4, a2);
  v6 = v5;

  return v6;
}

- (uint64_t)topMarginWithBaselineMargin:()VideosUI
{
  return objc_msgSend(a1, "topMarginWithBaselineMargin:maximumContentSizeCategory:", 0);
}

- (uint64_t)bottomMarginWithBaselineMargin:()VideosUI
{
  return objc_msgSend(a1, "bottomMarginWithBaselineMargin:maximumContentSizeCategory:", 0);
}

- (double)bottomMarginWithBaselineMargin:()VideosUI maximumContentSizeCategory:
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)MEMORY[0x1E0DC69B0];
  objc_msgSend(a1, "vuiTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaleContentSizeValue:forTraitCollection:", v4, a2);
  v6 = v5;

  return v6;
}

@end
