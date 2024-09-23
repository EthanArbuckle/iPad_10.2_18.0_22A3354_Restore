@implementation TLKLayoutUtilities

+ (id)controlsInView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "subviews", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v5, "addObject:", v11);
        objc_msgSend(a1, "controlsInView:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

+ (BOOL)isSuperLargeAccessibilitySize
{
  void *v2;
  void *v3;
  char IsAccessibilityContentSizeCategory;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

  return IsAccessibilityContentSizeCategory;
}

+ (BOOL)isWideScreen
{
  if (isWideScreen_onceToken != -1)
    dispatch_once(&isWideScreen_onceToken, &__block_literal_global);
  return isWideScreen_isWideScreen;
}

+ (CGSize)minimumButtonSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 44.0;
  v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __34__TLKLayoutUtilities_isWideScreen__block_invoke()
{
  id v0;
  CGRect v1;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_referenceBounds");
  isWideScreen_isWideScreen = CGRectGetHeight(v1) > 568.0;

}

+ (void)requireIntrinsicSizeForView:(id)a3
{
  double v3;

  LODWORD(v3) = 1148846080;
  objc_msgSend(a1, "requireIntrinsicSizeForView:withPriority:", a3, v3);
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

+ (double)ceilingValue:(double)a3 inView:(id)a4
{
  double v5;

  objc_msgSend(a4, "effectiveScreenScale");
  return ceil(v5 * a3) / v5;
}

+ (double)flooredValue:(double)a3 inView:(id)a4
{
  double v5;

  objc_msgSend(a4, "effectiveScreenScale");
  return floor(v5 * a3) / v5;
}

+ (double)roundedValue:(double)a3 inView:(id)a4
{
  double v5;

  objc_msgSend(a4, "tlks_scale");
  return round(v5 * a3) / v5;
}

+ (double)deviceScaledRoundedValue:(double)a3 forView:(id)a4
{
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a4, "tlks_screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale();
  v6 = v5;

  return v6;
}

+ (CGRect)deviceScaledRoundedRect:(CGRect)a3 forView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  objc_msgSend(a1, "deviceScaledRoundedValue:forView:", v9, x);
  v11 = v10;
  objc_msgSend(a1, "deviceScaledRoundedValue:forView:", v9, y);
  v13 = v12;
  objc_msgSend(a1, "deviceScaledRoundedValue:forView:", v9, width);
  v15 = v14;
  objc_msgSend(a1, "deviceScaledRoundedValue:forView:", v9, height);
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

+ (UIEdgeInsets)deviceScaledRoundedInsets:(UIEdgeInsets)a3 forView:(id)a4
{
  double right;
  double bottom;
  double left;
  double top;
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
  UIEdgeInsets result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v9 = a4;
  objc_msgSend(a1, "deviceScaledRoundedValue:forView:", v9, top);
  v11 = v10;
  objc_msgSend(a1, "deviceScaledRoundedValue:forView:", v9, left);
  v13 = v12;
  objc_msgSend(a1, "deviceScaledRoundedValue:forView:", v9, bottom);
  v15 = v14;
  objc_msgSend(a1, "deviceScaledRoundedValue:forView:", v9, right);
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

+ (CGSize)deviceScaledRoundedSize:(CGSize)a3 forView:(id)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  objc_msgSend(a1, "deviceScaledRoundedValue:forView:", v7, width);
  v9 = v8;
  objc_msgSend(a1, "deviceScaledRoundedValue:forView:", v7, height);
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (double)deviceScaledFlooredValue:(double)a3 forView:(id)a4
{
  double result;

  objc_msgSend(a4, "tlks_scale");
  UIFloorToScale();
  return result;
}

+ (double)scaledValueForValue:(double)a3 withFont:(id)a4 view:(id)a5
{
  id v8;
  double v9;
  double v10;

  v8 = a5;
  objc_msgSend(a4, "_scaledValueForValue:", a3);
  objc_msgSend(a1, "deviceScaledRoundedValue:forView:", v8);
  v10 = v9;

  return v10;
}

+ (void)setDynamicBaselineAlignmentsForLabel:(id)a3 top:(double)a4 bottom:(double)a5 view:(id)a6
{
  id v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  id v21;

  v10 = a6;
  v21 = a3;
  objc_msgSend(v21, "effectiveFirstBaselineOffsetFromTop");
  v12 = v11;
  objc_msgSend(v21, "font");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "scaledValueForValue:withFont:view:", v13, v10, a4);
  v15 = v12 - v14;
  objc_msgSend(v21, "effectiveBaselineOffsetFromBottom");
  v17 = v16;
  objc_msgSend(v21, "font");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "scaledValueForValue:withFont:view:", v18, v10, a5);
  v20 = v19;

  objc_msgSend(v21, "setCustomAlignmentRectInsets:", v15, 0.0, v17 - v20, 0.0);
}

+ (CGSize)idealImageSizeWithSize:(CGSize)result fittingSize:(CGSize)a4
{
  double v5;
  double v6;
  double v7;

  if (result.width >= a4.width || result.height >= a4.height)
  {
    v5 = a4.width / result.width;
    if (result.width == 0.0)
      v5 = 0.0;
    v6 = a4.height / result.height;
    if (result.height == 0.0)
      v6 = 0.0;
    v7 = fmin(v5, v6);
    result.width = result.width * v7;
    result.height = result.height * v7;
  }
  return result;
}

+ (BOOL)widthIsCompact:(double)a3
{
  return a3 < 318.0;
}

+ (void)applyRowBoundedSizingToImageView:(id)a3 isCompactWidth:(BOOL)a4
{
  _BOOL8 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  id v25;

  v4 = a4;
  v25 = a3;
  objc_msgSend((id)objc_opt_class(), "maxThumbnailSizeIsCompactWidth:", v4);
  v6 = v5;
  v8 = v7;
  objc_msgSend(v25, "tlkImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = v10;
  v13 = v12;

  v14 = *MEMORY[0x1E0C9D820];
  v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v11 <= 0.0 || v11 > 29.0 || v13 > 29.0)
  {
    v18 = v11 == v14 && v13 == v15;
    v19 = v25;
    if (v18)
    {
      objc_msgSend(v25, "tlkImage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "aspectRatio");
      if (v23 == 0.0)
        v24 = 1.0;
      else
        v24 = v23;

      v8 = v6 / v24;
      v19 = v25;
      v21 = v6;
      v20 = v8;
    }
    else
    {
      v20 = 0.0;
      v21 = v6;
    }
    objc_msgSend(v19, "setMinimumLayoutSize:", v21, v20);
  }
  else
  {
    objc_msgSend(v25, "setMinimumLayoutSize:", v14, v15);
    v6 = *MEMORY[0x1E0CFAA80];
    v8 = *(double *)(MEMORY[0x1E0CFAA80] + 8);
  }
  objc_msgSend(v25, "setMaximumLayoutSize:", v6, v8);

}

+ (CGSize)maxThumbnailSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(a1, "maxThumbnailSizeIsCompactWidth:", 0);
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)maxThumbnailSizeIsCompactWidth:(BOOL)a3
{
  double v3;
  double v4;
  int v5;
  CGSize result;

  if (a3)
  {
    v3 = 45.0;
    v4 = 40.0;
  }
  else
  {
    v5 = objc_msgSend(a1, "isWideScreen");
    v3 = 67.5;
    if (!v5)
      v3 = 45.0;
    v4 = 40.0;
    if (v5)
      v4 = 60.0;
  }
  result.height = v3;
  result.width = v4;
  return result;
}

+ (double)contentHeightOfTableView:(id)a3 forWidth:(double)a4 maxHeight:(double)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _BOOL4 v26;
  double v27;
  double v28;
  double v29;
  CGFloat MaxY;
  void *v31;
  double v33;
  double v34;
  CGRect v35;

  v7 = a3;
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  objc_msgSend(v7, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v10, v12, a4, a5);

  objc_msgSend(v7, "frame");
  v33 = v19;
  v34 = v18;
  v21 = v20;
  v23 = v22;
  objc_msgSend(v7, "contentSize");
  if (v24 == 0.0)
  {
    v26 = 0;
  }
  else
  {
    objc_msgSend(v7, "contentSize");
    v26 = v25 < a5;
    if (v25 < a5)
    {
      v27 = v25;
      do
      {
        objc_msgSend(v7, "frame");
        objc_msgSend(v7, "setFrame:");
        objc_msgSend(v7, "layoutIfNeeded");
        objc_msgSend(v7, "contentSize");
        if (v27 == v28)
          break;
        objc_msgSend(v7, "contentSize");
        v27 = v29;
      }
      while (v29 < a5);
    }
  }
  if (objc_msgSend(v7, "numberOfSections"))
  {
    objc_msgSend(v7, "rectForSection:", objc_msgSend(v7, "numberOfSections") - 1);
    MaxY = CGRectGetMaxY(v35);
    if (!v26)
      goto LABEL_11;
    goto LABEL_10;
  }
  MaxY = 0.0;
  if (v26)
LABEL_10:
    objc_msgSend(v7, "setFrame:", v34, v21, v23, v33);
LABEL_11:
  if (MaxY <= a5)
    a5 = MaxY;
  objc_msgSend(v7, "superview");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFrame:", v10, v12, v14, v16);

  return a5;
}

+ (id)tappableControlViewForPoint:(CGPoint)a3 inView:(id)a4 withEvent:(id)a5
{
  double y;
  double x;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  CGFloat v25;
  CGFloat v26;
  CGFloat width;
  CGFloat height;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  _UNKNOWN **v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  double MinY;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double MinX;
  double v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  _UNKNOWN **k;
  void *v111;
  void *v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  int v125;
  uint64_t v126;
  void *v127;
  void *v128;
  CGPoint v130;
  id v131;
  unint64_t v132;
  CGFloat v133;
  CGFloat v134;
  CGFloat v135;
  CGFloat v136;
  CGFloat v137;
  CGFloat v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  id obj;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  uint64_t v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;

  y = a3.y;
  x = a3.x;
  v164 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (!objc_msgSend(v8, "pointInside:withEvent:", v9, x, y))
    goto LABEL_68;
  v130.x = x;
  v130.y = y;
  v131 = v9;
  +[TLKLayoutUtilities minimumButtonSize](TLKLayoutUtilities, "minimumButtonSize");
  v145 = v10;
  v12 = v11;
  objc_msgSend((id)objc_opt_class(), "controlsInView:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = 0u;
  v158 = 0u;
  v159 = 0u;
  v160 = 0u;
  obj = v13;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v157, v163, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v158;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v158 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * i);
        v153 = 0u;
        v154 = 0u;
        v155 = 0u;
        v156 = 0u;
        v20 = obj;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v153, v162, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v154;
          while (2)
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v154 != v23)
                objc_enumerationMutation(v20);
              if (v19 != *(void **)(*((_QWORD *)&v153 + 1) + 8 * j)
                && (objc_msgSend(v19, "isDescendantOfView:") & 1) != 0)
              {
                v33 = v20;
                goto LABEL_26;
              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v153, v162, 16);
            if (v22)
              continue;
            break;
          }
        }

        if (objc_msgSend(v19, "isEnabled")
          && objc_msgSend((id)objc_opt_class(), "viewIsVisible:", v19))
        {
          objc_msgSend(v19, "bounds");
          v25 = v165.origin.x;
          v26 = v165.origin.y;
          width = v165.size.width;
          height = v165.size.height;
          v29 = CGRectGetWidth(v165) - v145;
          if (v29 >= 0.0)
            v30 = 0.0;
          else
            v30 = v29 * 0.5;
          v166.origin.x = v25;
          v166.origin.y = v26;
          v166.size.width = width;
          v166.size.height = height;
          v31 = CGRectGetHeight(v166) - v12;
          if (v31 >= 0.0)
            v32 = 0.0;
          else
            v32 = v31 * 0.5;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIEdgeInsets:", v32, v30, v32, v30);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKey:", v33, v19);
LABEL_26:

        }
      }
      v16 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v157, v163, 16);
    }
    while (v16);
  }

  objc_msgSend(v14, "keyEnumerator");
  v34 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "allObjects");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v35, "count"))
  {
    v36 = 0;
    v34 = &off_1E5C06000;
    while (1)
    {
      objc_msgSend(v35, "objectAtIndexedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v36 + 1;
      v132 = v36 + 1;
      if (v36 + 1 < (unint64_t)objc_msgSend(v35, "count"))
        break;
LABEL_53:

      ++v36;
      if (v132 >= objc_msgSend(v35, "count"))
        goto LABEL_54;
    }
    while (1)
    {
      objc_msgSend(v14, "objectForKey:", v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "UIEdgeInsetsValue");
      v41 = v40;
      v43 = v42;
      v45 = v44;
      v47 = v46;

      objc_msgSend(v37, "bounds");
      v146 = v45;
      v147 = v47;
      v143 = v41;
      v144 = v43;
      objc_msgSend(v8, "convertRect:fromView:", v37, v43 + v48, v41 + v49, v50 - (v43 + v47), v51 - (v41 + v45));
      v53 = v52;
      v55 = v54;
      v57 = v56;
      v59 = v58;
      objc_msgSend(v35, "objectAtIndexedSubscript:", v38);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "UIEdgeInsetsValue");
      v63 = v62;
      v65 = v64;
      v67 = v66;
      v69 = v68;

      objc_msgSend(v60, "bounds");
      v141 = v65;
      v142 = v63;
      v139 = v69;
      v140 = v67;
      objc_msgSend(v8, "convertRect:fromView:", v60, v65 + v70, v63 + v71, v72 - (v65 + v69), v73 - (v63 + v67));
      v175.origin.x = v74;
      v175.origin.y = v75;
      v175.size.width = v76;
      v175.size.height = v77;
      v137 = v53;
      v138 = v57;
      v167.origin.x = v53;
      v167.origin.y = v55;
      v167.size.width = v57;
      v167.size.height = v59;
      v135 = v175.origin.x;
      v136 = v175.size.width;
      v133 = v175.origin.y;
      v134 = v175.size.height;
      v168 = CGRectIntersection(v167, v175);
      v78 = v168.origin.x;
      v79 = v168.origin.y;
      v80 = v168.size.width;
      v81 = v168.size.height;
      +[TLKUtilities pixelWidthForView:](TLKUtilities, "pixelWidthForView:", v8);
      v83 = v82 + v82;
      v169.origin.x = v78;
      v169.origin.y = v79;
      v169.size.width = v80;
      v169.size.height = v81;
      v84 = CGRectGetWidth(v169) * 0.5 - v83;
      if (v84 >= 0.0)
        v85 = v84;
      else
        v85 = 0.0;
      v170.origin.x = v78;
      v170.origin.y = v79;
      v170.size.width = v80;
      v170.size.height = v81;
      v86 = CGRectGetHeight(v170) * 0.5 - v83;
      if (v86 >= 0.0)
        v87 = v86;
      else
        v87 = 0.0;
      if (v85 != 0.0 && v85 < v87)
      {
        v172.origin.x = v137;
        v172.size.width = v138;
        v172.origin.y = v55;
        v172.size.height = v59;
        MinX = CGRectGetMinX(v172);
        v173.origin.x = v135;
        v173.size.width = v136;
        v173.origin.y = v133;
        v173.size.height = v134;
        if (MinX >= CGRectGetMinX(v173))
        {
          v97 = v146;
          v100 = v144 + v85;
          v94 = v140;
          v95 = v139 + v85;
          v96 = v147;
          v99 = v142;
          v98 = v143;
LABEL_51:
          v102 = v141;
          goto LABEL_52;
        }
        v97 = v146;
        v96 = v147 + v85;
        v99 = v142;
        v102 = v141 + v85;
        v98 = v143;
        v100 = v144;
      }
      else
      {
        v89 = v137;
        v90 = v138;
        v91 = v55;
        v92 = v59;
        if (v87 != 0.0)
        {
          MinY = CGRectGetMinY(*(CGRect *)&v89);
          v171.origin.x = v135;
          v171.origin.y = v133;
          v171.size.width = v136;
          v171.size.height = v134;
          v95 = v139;
          v94 = v140;
          if (MinY >= CGRectGetMinY(v171))
          {
            v100 = v144;
            v98 = v143 + v87;
            v94 = v140 + v87;
            v97 = v146;
            v96 = v147;
            v99 = v142;
          }
          else
          {
            v96 = v147;
            v97 = v146 + v87;
            v98 = v143;
            v99 = v142 + v87;
            v100 = v144;
          }
          goto LABEL_51;
        }
        v97 = v146;
        v96 = v147;
        v98 = v143;
        v100 = v144;
        v102 = v141;
        v99 = v142;
      }
      v95 = v139;
      v94 = v140;
LABEL_52:
      v103 = (void *)MEMORY[0x1E0CB3B18];
      +[TLKLayoutUtilities deviceScaledRoundedInsets:forView:](TLKLayoutUtilities, "deviceScaledRoundedInsets:forView:", v8, v98, v100, v97, v96);
      objc_msgSend(v103, "valueWithUIEdgeInsets:");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v104, v37);

      v105 = (void *)MEMORY[0x1E0CB3B18];
      +[TLKLayoutUtilities deviceScaledRoundedInsets:forView:](TLKLayoutUtilities, "deviceScaledRoundedInsets:forView:", v8, v99, v102, v94, v95);
      objc_msgSend(v105, "valueWithUIEdgeInsets:");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v106, v60);

      if (++v38 >= (unint64_t)objc_msgSend(v35, "count"))
        goto LABEL_53;
    }
  }
LABEL_54:
  v151 = 0u;
  v152 = 0u;
  v149 = 0u;
  v150 = 0u;
  v107 = v35;
  v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v149, v161, 16);
  if (v108)
  {
    v34 = (_UNKNOWN **)v108;
    v109 = *(_QWORD *)v150;
    while (2)
    {
      for (k = 0; k != v34; k = (_UNKNOWN **)((char *)k + 1))
      {
        if (*(_QWORD *)v150 != v109)
          objc_enumerationMutation(v107);
        v111 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * (_QWORD)k);
        objc_msgSend(v14, "objectForKey:", v111);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "UIEdgeInsetsValue");
        v114 = v113;
        v116 = v115;
        v118 = v117;
        v120 = v119;

        objc_msgSend(v111, "bounds");
        objc_msgSend(v8, "convertRect:fromView:", v111, v116 + v121, v114 + v122, v123 - (v116 + v120), v124 - (v114 + v118));
        if (CGRectContainsPoint(v174, v130))
        {
          objc_msgSend(v111, "convertPoint:fromView:", v8, v130);
          v9 = v131;
          objc_msgSend(v111, "hitTest:withEvent:", v131);
          v126 = objc_claimAutoreleasedReturnValue();
          v127 = (void *)v126;
          if (v126)
            v128 = (void *)v126;
          else
            v128 = v111;
          v34 = v128;

          v125 = 0;
          goto LABEL_67;
        }
      }
      v34 = (_UNKNOWN **)objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v149, v161, 16);
      if (v34)
        continue;
      break;
    }
  }
  v125 = 1;
  v9 = v131;
LABEL_67:

  if (v125)
LABEL_68:
    v34 = 0;

  return v34;
}

+ (BOOL)viewIsVisible:(id)a3
{
  id v4;
  void *v5;
  double v6;
  char v7;
  CGRect v9;

  v4 = a3;
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isHidden") & 1) != 0
    || (objc_msgSend(v4, "alpha"), v6 <= 0.0)
    || (objc_msgSend(v4, "bounds"), CGRectEqualToRect(v9, *MEMORY[0x1E0C9D648])))
  {
    v7 = 0;
  }
  else if (v5)
  {
    v7 = objc_msgSend(a1, "viewIsVisible:", v5);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (BOOL)isLTR
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceLayoutDirection") == 0;

  return v3;
}

@end
