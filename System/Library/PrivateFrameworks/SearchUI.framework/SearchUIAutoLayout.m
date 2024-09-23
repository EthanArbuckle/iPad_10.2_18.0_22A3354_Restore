@implementation SearchUIAutoLayout

+ (id)alignLeadingView:(id)a3 toTrailingView:(id)a4 spacing:(double)a5 minimum:(BOOL)a6 priority:(float)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  int v14;
  int v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v8 = a6;
  v12 = a4;
  v13 = a3;
  v14 = objc_msgSend(v13, "searchui_isContainedByItem:", v12);
  v15 = objc_msgSend(v12, "searchui_isContainedByItem:", v13);
  if (v14)
    v17 = 6;
  else
    v17 = 5;
  if (v15)
    v18 = 5;
  else
    v18 = 6;
  *(float *)&v16 = a7;
  objc_msgSend(a1, "alignView:attribute:relatedBy:toView:attribute:constant:priority:", v12, v17, v8, v13, v18, a5, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)alignView:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toView:(id)a6 attribute:(int64_t)a7 constant:(double)a8 priority:(float)a9
{
  id v16;
  id v17;
  void *v18;
  void *v19;
  void **v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  _QWORD v26[2];
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a6;
  v18 = v17;
  if (!v16)
  {
    v23 = 0;
    goto LABEL_8;
  }
  if (v17 && (objc_msgSend(v16, "searchui_isContainedByItem:", v17) & 1) == 0)
  {
    if ((objc_msgSend(v18, "searchui_isContainedByItem:", v16) & 1) == 0)
    {
      v26[0] = v16;
      v26[1] = v18;
      v19 = (void *)MEMORY[0x1E0C99D20];
      v20 = (void **)v26;
      v21 = 2;
      goto LABEL_6;
    }
    v27 = v18;
    v19 = (void *)MEMORY[0x1E0C99D20];
    v20 = &v27;
  }
  else
  {
    v28[0] = v16;
    v19 = (void *)MEMORY[0x1E0C99D20];
    v20 = (void **)v28;
  }
  v21 = 1;
LABEL_6:
  objc_msgSend(v19, "arrayWithObjects:count:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "enableAutoLayoutForItems:", v22);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, a4, a5, v18, a7, 1.0, a8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v24 = a9;
  objc_msgSend(v23, "setPriority:", v24);
  objc_msgSend(v23, "setActive:", 1);
LABEL_8:

  return v23;
}

+ (void)enableAutoLayoutForItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "searchui_view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        objc_msgSend(v8, "searchui_view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "searchui_view");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "textAlignment");

          if (v12)
            continue;
          objc_msgSend(v8, "searchui_view");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setTextAlignment:", 4);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

+ (void)fillContainerWithView:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "spanContainerWidthForView:", v4);
  objc_msgSend(a1, "spanContainerHeightForView:", v4);

}

+ (void)spanContainerHeightForView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double MinY;
  void *v9;
  double Height;
  id v11;
  CGRect v12;
  CGRect v13;

  v11 = a3;
  objc_msgSend(v11, "frame");
  v4 = v3;
  v6 = v5;
  objc_msgSend(v11, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  MinY = CGRectGetMinY(v12);

  objc_msgSend(v11, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  Height = CGRectGetHeight(v13);

  objc_msgSend(v11, "setFrame:", v4, MinY, v6, Height);
  objc_msgSend(v11, "setAutoresizingMask:", objc_msgSend(v11, "autoresizingMask") | 0x10);

}

+ (void)spanContainerWidthForView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double MinX;
  void *v9;
  double Width;
  id v11;
  CGRect v12;
  CGRect v13;

  v11 = a3;
  objc_msgSend(v11, "frame");
  v4 = v3;
  v6 = v5;
  objc_msgSend(v11, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  MinX = CGRectGetMinX(v12);

  objc_msgSend(v11, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  Width = CGRectGetWidth(v13);

  objc_msgSend(v11, "setFrame:", MinX, v4, Width, v6);
  objc_msgSend(v11, "setAutoresizingMask:", objc_msgSend(v11, "autoresizingMask") | 2);

}

+ (double)sectionCornerRadius
{
  int v2;
  double result;

  v2 = TLKSnippetModernizationEnabled();
  result = 13.5;
  if (v2)
    return 20.0;
  return result;
}

+ (double)selectionBorderWidth
{
  int v2;
  double result;

  v2 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
  result = 3.0;
  if (v2)
    return 2.0;
  return result;
}

+ (void)constrainViewToContainer:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "constrainViewWidthToContainer:", v4);
  objc_msgSend(a1, "constrainViewHeightContainer:", v4);

}

+ (void)constrainViewHeightContainer:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "searchui_containingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(a1, "alignView:toView:withAttribute:", v8, v4, 4);

  objc_msgSend(v8, "searchui_containingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(a1, "alignView:toView:withAttribute:", v8, v6, 3);

}

+ (id)alignView:(id)a3 toView:(id)a4 withAttribute:(int64_t)a5
{
  return (id)objc_msgSend(a1, "alignView:attribute:toView:attribute:constant:", a3, a5, a4, 0.0);
}

+ (id)alignView:(id)a3 attribute:(int64_t)a4 toView:(id)a5 attribute:(int64_t)a6 constant:(double)a7
{
  return (id)objc_msgSend(a1, "alignView:attribute:relatedBy:toView:attribute:constant:", a3, a4, 0, a5, a6, a7);
}

+ (id)alignView:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toView:(id)a6 attribute:(int64_t)a7 constant:(double)a8
{
  double v8;

  LODWORD(v8) = 1148846080;
  return (id)objc_msgSend(a1, "alignView:attribute:relatedBy:toView:attribute:constant:priority:", a3, a4, a5, a6, a7, a8, v8);
}

+ (void)constrainViewWidthToContainer:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "searchui_containingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(a1, "alignLeadingView:toTrailingView:", v4, v8);

  objc_msgSend(v8, "searchui_containingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(a1, "alignLeadingView:toTrailingView:", v8, v6);

}

+ (id)alignLeadingView:(id)a3 toTrailingView:(id)a4 spacing:(double)a5 priority:(float)a6
{
  return (id)objc_msgSend(a1, "alignLeadingView:toTrailingView:spacing:minimum:priority:", a3, a4, 0, a5);
}

+ (id)alignLeadingView:(id)a3 toTrailingView:(id)a4 spacing:(double)a5
{
  double v5;

  LODWORD(v5) = 1148846080;
  return (id)objc_msgSend(a1, "alignLeadingView:toTrailingView:spacing:priority:", a3, a4, a5, v5);
}

+ (id)alignLeadingView:(id)a3 toTrailingView:(id)a4
{
  return (id)objc_msgSend(a1, "alignLeadingView:toTrailingView:spacing:", a3, a4, 0.0);
}

+ (id)alignLeadingView:(id)a3 toTrailingView:(id)a4 priority:(float)a5
{
  double v5;

  *(float *)&v5 = a5;
  return (id)objc_msgSend(a1, "alignLeadingView:toTrailingView:spacing:minimum:priority:", a3, a4, 0, 0.0, v5);
}

+ (void)requireIntrinsicSizeForView:(id)a3 withPriority:(float)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  *(float *)&v5 = a4;
  objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 0, v5);
  *(float *)&v6 = a4;
  objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 1, v6);
  *(float *)&v7 = a4;
  objc_msgSend(v9, "setContentHuggingPriority:forAxis:", 0, v7);
  *(float *)&v8 = a4;
  objc_msgSend(v9, "setContentHuggingPriority:forAxis:", 1, v8);

}

+ (void)requireIntrinsicSizeForView:(id)a3
{
  double v3;

  LODWORD(v3) = 1148846080;
  objc_msgSend(a1, "requireIntrinsicSizeForView:withPriority:", a3, v3);
}

+ (BOOL)view:(id)a3 isVisibleInBounds:(CGRect)a4 ofView:(id)a5
{
  id v7;
  id v8;
  char v9;

  v7 = a3;
  v8 = a5;
  if ((objc_msgSend(v7, "isHidden") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v7, "bounds");
    objc_msgSend(v8, "convertRect:fromView:", v7);
    v9 = objc_msgSend(a1, "frame:isVisibleInBounds:");
  }

  return v9;
}

+ (BOOL)frame:(CGRect)a3 isVisibleInBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat rect;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = CGRectIntersection(a3, a4);
  v8 = v15.origin.y;
  v9 = v15.size.width;
  v10 = v15.size.height;
  rect = v15.origin.x;
  v11 = CGRectGetHeight(v15);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  if (v11 / CGRectGetHeight(v16) <= 0.5)
    return 0;
  v17.origin.x = rect;
  v17.origin.y = v8;
  v17.size.width = v9;
  v17.size.height = v10;
  v12 = CGRectGetWidth(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  return v12 / CGRectGetWidth(v18) > 0.5;
}

+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4
{
  return (id)objc_msgSend(a1, "baselineAlignBottomView:toTopView:spacing:", a3, a4, 0.0);
}

+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 spacing:(double)a5
{
  double v5;

  LODWORD(v5) = 1148846080;
  return (id)objc_msgSend(a1, "baselineAlignBottomView:toTopView:spacing:priority:", a3, a4, a5, v5);
}

+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 spacing:(double)a5 priority:(float)a6
{
  return (id)objc_msgSend(a1, "baselineAlignBottomView:toTopView:spacing:isDynamic:forFont:minimum:priority:", a3, a4, 0, 0, 0, a5);
}

+ (id)alignView:(id)a3 toView:(id)a4 withAttribute:(int64_t)a5 priority:(float)a6
{
  double v6;

  *(float *)&v6 = a6;
  return (id)objc_msgSend(a1, "alignView:attribute:relatedBy:toView:attribute:constant:priority:", a3, a5, 0, a4, a5, 0.0, v6);
}

+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 spacing:(double)a5 isDynamic:(BOOL)a6 forFont:(id)a7 minimum:(BOOL)a8 priority:(float)a9
{
  _BOOL4 v11;
  id v15;
  id v16;
  id v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  void *v42;
  id v44;
  uint64_t v45;
  int v46;
  _BOOL4 v47;
  void *v48;

  v47 = a8;
  v11 = a6;
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = objc_msgSend(v15, "searchui_isContainedByItem:", v16);
  v46 = objc_msgSend(v16, "searchui_isContainedByItem:", v15);
  if ((v46 & 1) == 0)
  {
    objc_msgSend(v15, "searchui_view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v15, "searchui_view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "viewForFirstBaselineLayout");
      v19 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = v15;
    }

    if ((v18 & 1) == 0)
      goto LABEL_3;
LABEL_11:
    v22 = v16;
    v25 = 3;
    goto LABEL_12;
  }
  v19 = v15;
  if ((v18 & 1) != 0)
    goto LABEL_11;
LABEL_3:
  objc_msgSend(v16, "searchui_view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v16, "searchui_view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "viewForLastBaselineLayout");
    v22 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = v16;
  }

  v25 = 4;
LABEL_12:
  v45 = v25;
  v48 = v19;
  v26 = objc_opt_respondsToSelector();
  v27 = objc_opt_respondsToSelector();
  v28 = v27;
  if (!v17 && v11)
  {
    if (((v26 | v27) & 1) != 0)
    {
      if ((v26 & 1) != 0)
        v29 = v48;
      else
        v29 = v22;
      objc_msgSend(v29, "font");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
  }
  v30 = (void *)MEMORY[0x1E0DBD9B0];
  objc_msgSend(v15, "searchui_view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    objc_msgSend(v30, "scaledValueForValue:withFont:view:", v17, v31, a5);
    v33 = v32;
  }
  else
  {
    objc_msgSend(v16, "searchui_view");
    v44 = a1;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "scaledValueForValue:withFont:view:", v17, v34, a5);
    v33 = v35;

    a1 = v44;
  }
  v36 = a5 > 0.0;
  if ((v36 & v28) != 0)
    v37 = 11;
  else
    v37 = v45;
  v38 = 3;
  if (v46)
    v38 = 4;
  if ((v36 & v26) != 0)
    v39 = 12;
  else
    v39 = v38;

  if (v11)
    v41 = v33;
  else
    v41 = a5;
  *(float *)&v40 = a9;
  objc_msgSend(a1, "alignView:attribute:relatedBy:toView:attribute:constant:priority:", v48, v39, v47, v22, v37, v41, v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

+ (id)installConstraintsWithVisualFormat:(id)a3 views:(id)a4
{
  return (id)objc_msgSend(a1, "installConstraintsWithVisualFormat:withViews:metrics:options:", a3, a4, 0, 0);
}

+ (id)installConstraintsWithVisualFormat:(id)a3 views:(id)a4 options:(unint64_t)a5
{
  return (id)objc_msgSend(a1, "installConstraintsWithVisualFormat:withViews:metrics:options:", a3, a4, 0, a5);
}

+ (id)installConstraintsWithVisualFormat:(id)a3 views:(id)a4 metrics:(id)a5
{
  return (id)objc_msgSend(a1, "installConstraintsWithVisualFormat:withViews:metrics:options:", a3, a4, a5, 0);
}

+ (id)installConstraintsWithVisualFormat:(id)a3 withViews:(id)a4 metrics:(id)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v11, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "enableAutoLayoutForItems:", v13);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", v12, a6, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v14);
  return v14;
}

+ (id)alignView:(id)a3 toView:(id)a4 withAttribute:(int64_t)a5 constant:(double)a6
{
  return (id)objc_msgSend(a1, "alignView:attribute:toView:attribute:constant:", a3, a5, a4, a6);
}

+ (id)alignView:(id)a3 toView:(id)a4 withAttribute:(int64_t)a5 relatedBy:(int64_t)a6
{
  double v6;

  LODWORD(v6) = 1148846080;
  return (id)objc_msgSend(a1, "alignView:attribute:relatedBy:toView:attribute:constant:priority:", a3, a5, a6, a4, a5, 0.0, v6);
}

+ (id)alignView:(id)a3 attribute:(int64_t)a4 toView:(id)a5 attribute:(int64_t)a6
{
  double v6;

  LODWORD(v6) = 1148846080;
  return (id)objc_msgSend(a1, "alignView:attribute:toView:attribute:priority:", a3, a4, a5, a6, v6);
}

+ (id)alignView:(id)a3 attribute:(int64_t)a4 toView:(id)a5 attribute:(int64_t)a6 priority:(float)a7
{
  double v7;

  *(float *)&v7 = a7;
  return (id)objc_msgSend(a1, "alignView:attribute:relatedBy:toView:attribute:constant:priority:", a3, a4, 0, a5, a6, 0.0, v7);
}

+ (id)alignLeadingView:(id)a3 toTrailingView:(id)a4 spacing:(double)a5 minimum:(BOOL)a6
{
  double v6;

  LODWORD(v6) = 1148846080;
  return (id)objc_msgSend(a1, "alignLeadingView:toTrailingView:spacing:minimum:priority:", a3, a4, a6, a5, v6);
}

+ (id)setWidth:(double)a3 forView:(id)a4
{
  return (id)objc_msgSend(a1, "alignView:toView:withAttribute:constant:", a4, 0, 7, a3);
}

+ (id)setHeight:(double)a3 forView:(id)a4
{
  return (id)objc_msgSend(a1, "alignView:toView:withAttribute:constant:", a4, 0, 8, a3);
}

+ (void)setSize:(CGSize)a3 forView:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;
  id v9;

  height = a3.height;
  width = a3.width;
  v9 = a4;
  v7 = (id)objc_msgSend(a1, "setWidth:forView:", v9, width);
  v8 = (id)objc_msgSend(a1, "setHeight:forView:", v9, height);

}

+ (void)alignViews:(id)a3 withAttribute:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        if (v13 != v7)
          v14 = (id)objc_msgSend(a1, "alignView:toView:withAttribute:", v13, v7, a4, (_QWORD)v15);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 spacing:(double)a5 minimum:(BOOL)a6
{
  return (id)objc_msgSend(a1, "baselineAlignBottomView:toTopView:spacing:isDynamic:forFont:minimum:", a3, a4, 0, 0, a6, a5);
}

+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 dynamicSpacing:(double)a5
{
  double v5;

  LODWORD(v5) = 1148846080;
  return (id)objc_msgSend(a1, "baselineAlignBottomView:toTopView:dynamicSpacing:priority:", a3, a4, a5, v5);
}

+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 dynamicSpacing:(double)a5 priority:(float)a6
{
  return (id)objc_msgSend(a1, "baselineAlignBottomView:toTopView:spacing:isDynamic:forFont:minimum:priority:", a3, a4, 1, 0, 0, a5);
}

+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 dynamicSpacing:(double)a5 minimum:(BOOL)a6
{
  return (id)objc_msgSend(a1, "baselineAlignBottomView:toTopView:dynamicSpacing:forFont:minimum:", a3, a4, 0, a6, a5);
}

+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 dynamicSpacing:(double)a5 forFont:(id)a6
{
  return (id)objc_msgSend(a1, "baselineAlignBottomView:toTopView:dynamicSpacing:forFont:minimum:", a3, a4, a6, 0, a5);
}

+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 dynamicSpacing:(double)a5 forFont:(id)a6 minimum:(BOOL)a7
{
  return (id)objc_msgSend(a1, "baselineAlignBottomView:toTopView:spacing:isDynamic:forFont:minimum:", a3, a4, 1, a6, a7, a5);
}

+ (id)baselineAlignBottomView:(id)a3 toTopView:(id)a4 spacing:(double)a5 isDynamic:(BOOL)a6 forFont:(id)a7 minimum:(BOOL)a8
{
  double v8;

  LODWORD(v8) = 1148846080;
  return (id)objc_msgSend(a1, "baselineAlignBottomView:toTopView:spacing:isDynamic:forFont:minimum:priority:", a3, a4, a6, a7, a8, a5, v8);
}

+ (void)setVisibility:(BOOL)a3 forView:(id)a4
{
  _BOOL4 v4;
  float v5;
  double v6;
  double v7;
  id v8;

  v4 = a3;
  if (a3)
    v5 = 1000.0;
  else
    v5 = 0.0;
  v8 = a4;
  *(float *)&v6 = v5;
  objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 0, v6);
  *(float *)&v7 = v5;
  objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 1, v7);
  objc_msgSend(v8, "setHidden:", !v4);

}

+ (double)roundedItemCornerRadius
{
  return 10.0;
}

+ (CGRect)rect:(CGRect)a3 insettedBy:(NSDirectionalEdgeInsets)a4 isLTR:(BOOL)a5
{
  double leading;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  if (a5)
    leading = a4.leading;
  else
    leading = a4.trailing;
  v6 = a3.size.height - a4.top - a4.bottom;
  v7 = a3.size.width - a4.leading - a4.trailing;
  v8 = a3.origin.y + a4.top;
  v9 = a3.origin.x + leading;
  result.size.height = v6;
  result.size.width = v7;
  result.origin.y = v8;
  result.origin.x = v9;
  return result;
}

@end
