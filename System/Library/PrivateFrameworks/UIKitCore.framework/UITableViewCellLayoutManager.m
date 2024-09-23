@implementation UITableViewCellLayoutManager

- (void)_modern_layoutSubviewsOfCell:(id)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  double v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  BOOL v67;
  void *v68;
  unint64_t v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  BOOL v78;
  double v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  _BOOL4 v84;
  void *v85;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;

  objc_msgSend(a3, "_updateAccessoriesIfNeeded");
  objc_msgSend(a3, "_accessoryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  objc_msgSend(a3, "_accessoryManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(a3, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  if (_UITableViewCellUsesLayoutMarginBasedContentPadding())
  {
    objc_msgSend(a3, "_accessoryManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "leadingAccessories");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    v20 = 0.0;
    v21 = 0.0;
    if (v19)
    {
      objc_msgSend(a3, "_constants");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "defaultCellContentLeadingPaddingForSidebar:", 0);
      v21 = v23;

    }
    objc_msgSend(v17, "trailingAccessories");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v25)
    {
      objc_msgSend(a3, "_constants");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "defaultCellContentTrailingPadding");
      v20 = v27;

    }
    objc_msgSend(a3, "_setOverriddenDefaultContentViewLayoutMargins:", 0.0, v21, 0.0, v20);

  }
  v28 = objc_msgSend(a3, "currentStateMask") & 1;
  objc_msgSend(a3, "_badge:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCellLayoutManager backgroundEndingRectForCell:forNewEditingState:](self, "backgroundEndingRectForCell:forNewEditingState:", a3, v28);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  objc_msgSend(a3, "_backgroundView:", 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFrame:", v31, v33, v35, v37);
  objc_msgSend(v38, "layer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setContentsRect:", 0.0, 0.0, 1.0, 1.0);

  -[UITableViewCellLayoutManager selectedBackgroundEndingRectForCell:forNewEditingState:](self, "selectedBackgroundEndingRectForCell:forNewEditingState:", a3, v28);
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  objc_msgSend(a3, "_selectedBackgroundView:", 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);

  objc_msgSend(a3, "_imageView:", 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v49;
  if (v49)
  {
    objc_msgSend(v49, "image");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      objc_msgSend(v50, "superview");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v52)
      {
        objc_msgSend(a3, "contentView");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "addSubview:", v50);

      }
    }
    else
    {
      objc_msgSend(v50, "removeFromSuperview");
    }
    objc_msgSend(v50, "superview");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      -[UITableViewCellLayoutManager standardLayoutImageViewFrameForCell:forSizing:](self, "standardLayoutImageViewFrameForCell:forSizing:", a3, 0);
      v56 = v55;
      v58 = v57;
      v60 = v59;
      v62 = v61;
      objc_msgSend(v50, "frame");
      v94.origin.x = v63;
      v94.origin.y = v64;
      v94.size.width = v65;
      v94.size.height = v66;
      v91.origin.x = v56;
      v91.origin.y = v58;
      v91.size.width = v60;
      v91.size.height = v62;
      v67 = CGRectEqualToRect(v91, v94);
      objc_msgSend(v50, "setFrame:", v56, v58, v60, v62);
      if (!v67)
        objc_msgSend(a3, "_updateSeparatorContent:", 1);
    }
  }
  objc_msgSend(a3, "_textLabel:", 0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (unint64_t)v68;
  if (v68)
  {
    objc_msgSend(v68, "font");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "pointSize");
    v72 = v71;

    if (v72 == 0.0)
    {
      -[UITableViewCellLayoutManager defaultTextLabelFontForCell:](self, "defaultTextLabelFontForCell:", a3);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v69, "setFont:", v73);

    }
    objc_msgSend((id)v69, "text");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v74;
    if (v74 && objc_msgSend(v74, "length"))
    {
      objc_msgSend((id)v69, "superview");
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v76)
      {
        objc_msgSend(a3, "contentView");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "addSubview:", v69);

      }
    }
    else
    {
      objc_msgSend((id)v69, "removeFromSuperview");
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v78 = -[UITableViewCellLayoutManager shouldIncreaseMarginForImageViewInCell:](self, "shouldIncreaseMarginForImageViewInCell:", a3);
    v79 = 0.0;
    if (!v78)
    {
      objc_msgSend(a3, "bounds", 0.0);
      -[UITableViewCellLayoutManager requiredIndentationForFirstLineOfCell:rowWidth:](self, "requiredIndentationForFirstLineOfCell:rowWidth:", a3, CGRectGetWidth(v92));
    }
    objc_msgSend((id)v69, "_setFirstParagraphFirstLineHeadIndent:", v79);
  }
  objc_msgSend(a3, "_detailTextLabel:", 0);
  v80 = objc_claimAutoreleasedReturnValue();
  if (v69 | v80)
  {
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    objc_msgSend(a3, "bounds");
    -[UITableViewCellLayoutManager getTextLabelRect:detailTextLabelRect:forCell:rowWidth:forSizing:](self, "getTextLabelRect:detailTextLabelRect:forCell:rowWidth:forSizing:", &v89, &v87, a3, 0, CGRectGetWidth(v93));
    objc_msgSend((id)v69, "setFrame:", v89, v90);
    objc_msgSend((id)v80, "setFrame:", v87, v88);
  }
  if (-[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", a3))
  {
    objc_msgSend((id)v69, "frame");
    objc_msgSend((id)v69, "_capOffsetFromBoundsTop");
    objc_msgSend((id)v69, "font");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "capHeight");

  }
  objc_msgSend(v50, "superview");
  v82 = objc_claimAutoreleasedReturnValue();
  if (v82)
  {
    v83 = (void *)v82;
    v84 = -[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", a3);

    if (v84)
    {
      if (!-[UITableViewCellLayoutManager shouldIncreaseMarginForImageViewInCell:](self, "shouldIncreaseMarginForImageViewInCell:", a3))
      {
        objc_msgSend(a3, "contentView");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "bringSubviewToFront:", v50);

      }
      objc_msgSend(v50, "frame");
      objc_msgSend(v50, "setFrame:");
    }
  }
  if (!objc_msgSend(a3, "style"))
  {
    objc_msgSend(a3, "_detailTextLabel:", 0);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "removeFromSuperview");

  }
  -[UITableViewCellLayoutManager _layoutFocusGuidesForCell:](self, "_layoutFocusGuidesForCell:", a3);

}

- (BOOL)shouldIncreaseMarginForImageViewInCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  v4 = a3;
  objc_msgSend(v4, "_imageView:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_textLabel:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 1;
  if (v7)
  {
    if (v6)
    {
      if (-[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", v4))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "textAlignment") != 1)
        {
          objc_msgSend(v4, "_imageView:", 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "image");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "size");
          v12 = v11;

          objc_msgSend(v4, "_textLabel:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "font");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = v12 * 0.5;
          objc_msgSend(v14, "capHeight");
          v17 = v16 * 0.5;
          objc_msgSend(v14, "ascender");
          v19 = v18;
          objc_msgSend(v14, "capHeight");
          if (v15 <= v17 + v19 - v20)
          {
            objc_msgSend(v14, "capHeight");
            v22 = v21 * 0.5;
            objc_msgSend(v14, "descender");
            v8 = v15 > v22 - v23;
          }
          else
          {
            v8 = 1;
          }

        }
      }
    }
  }

  return v8;
}

- (BOOL)shouldApplyAccessibilityLargeTextLayoutForCell:(id)a3
{
  id v3;
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  objc_msgSend(v3, "_textLabel:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend((id)UIApp, "preferredContentSizeCategory");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (UIContentSizeCategoryIsAccessibilityCategory(v5) && dyld_program_sdk_at_least())
    {
      objc_msgSend(v4, "text");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "length"))
      {
        objc_msgSend(v3, "traitCollection");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "userInterfaceIdiom") != 3;

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_layoutFocusGuidesForCell:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_editingControlsFocusGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v4, "bounds");
    objc_msgSend(v3, "_setManualLayoutFrame:");
  }

}

- (void)getTextLabelRect:(CGRect *)a3 detailTextLabelRect:(CGRect *)a4 forCell:(id)a5 rowWidth:(double)a6 forSizing:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL4 v12;
  double v13;
  double x;
  double v15;
  double y;
  double v17;
  double width;
  double v19;
  double height;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGSize v27;
  _DWORD *v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v7 = a7;
  v28 = a5;
  v12 = -[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", v28);
  -[UITableViewCellLayoutManager textRectForCell:rowWidth:forSizing:](self, "textRectForCell:rowWidth:forSizing:", v28, v7, a6);
  x = v13;
  y = v15;
  width = v17;
  height = v19;
  if (v12)
  {
    objc_msgSend(v28, "_textLabel:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[UITableViewCellLayoutManager optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:](self, "optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:", v21, 0, 0, x, y, width, height);
      v23 = v22;
      v25 = v24;
    }
    else
    {
      v23 = *MEMORY[0x1E0C9D820];
      v25 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    v26 = ceil((height - v25) * 0.5);
    if ((v28[30] & 0x80000) != 0)
    {
      v29.origin.x = x;
      v29.origin.y = y;
      v29.size.width = width;
      v29.size.height = height;
      x = CGRectGetMaxX(v29) - v23;
    }
    v30.origin.x = 0.0;
    v30.origin.y = 0.0;
    v30.size.width = v23;
    v30.size.height = v25;
    v31 = CGRectOffset(v30, x, v26);
    x = v31.origin.x;
    y = v31.origin.y;
    width = v31.size.width;
    height = v31.size.height;

  }
  if (a3)
  {
    a3->origin.x = x;
    a3->origin.y = y;
    a3->size.width = width;
    a3->size.height = height;
  }
  if (a4)
  {
    v27 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    a4->origin = (CGPoint)*MEMORY[0x1E0C9D648];
    a4->size = v27;
  }

}

void __139__UITableViewCellLayoutManager_UITableViewCellLayoutManagerStatic___contentRectForCell_forEditingState_showingDeleteConfirmation_rowWidth___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_updateAccessoriesIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "_accessoryManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "_accessoryManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentFrame");
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;

}

- (CGRect)textRectForCell:(id)a3 rowWidth:(double)a4 forSizing:(BOOL)a5
{
  _BOOL8 v5;
  _DWORD *v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double MinX;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  int v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BOOL4 v52;
  _BOOL4 v53;
  CGFloat v54;
  double v55;
  double v56;
  double v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  double MaxX;
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
  int v73;
  double v74;
  double Width;
  double v76;
  double v77;
  double v78;
  double v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  double v86;
  double v87;
  CGFloat v88;
  CGFloat v89;
  double v90;
  char v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  CGFloat v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  CGFloat rect;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect result;

  v5 = a5;
  v8 = a3;
  -[UITableViewCellLayoutManager contentRectForCell:forState:rowWidth:](self, "contentRectForCell:forState:rowWidth:", v8, objc_msgSend(v8, "currentStateMask"), a4);
  v10 = v9;
  rect = v11;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v8, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "directionalLayoutMargins");
  v18 = v17;
  v20 = v19;

  v21 = v8[30];
  objc_msgSend(v8, "_effectiveSafeAreaInsets");
  v103 = v20;
  if ((v21 & 0x80000) != 0)
  {
    v27 = v23;
    v107.origin.x = v10;
    v107.origin.y = rect;
    v25 = v13;
    v107.size.width = v13;
    v107.size.height = v15;
    MinX = a4 - CGRectGetMaxX(v107);
    v24 = v27;
  }
  else
  {
    v24 = v22;
    v106.origin.x = v10;
    v106.origin.y = rect;
    v25 = v13;
    v106.size.width = v13;
    v106.size.height = v15;
    MinX = CGRectGetMinX(v106);
  }
  -[UITableViewCellLayoutManager contentIndentationForCell:](self, "contentIndentationForCell:", v8);
  v29 = v28;
  objc_msgSend(v8, "_marginWidth");
  v31 = v29 + v30 - fmax(v24, MinX);
  v32 = _UITableViewCellTextLabelUsesLeadingLayoutMargin();
  v33 = 15.0;
  if (v32)
    v33 = v18;
  v34 = fmax(v31, v33);
  objc_msgSend(v8, "_imageView:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "image");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v36
    || !-[UITableViewCellLayoutManager shouldIncreaseMarginForImageViewInCell:](self, "shouldIncreaseMarginForImageViewInCell:", v8))
  {
    goto LABEL_13;
  }
  v101 = v34;
  -[UITableViewCellLayoutManager standardLayoutImageViewFrameForCell:forSizing:](self, "standardLayoutImageViewFrameForCell:forSizing:", v8, v5);
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v44 = v43;
  objc_msgSend(v8, "traitCollection");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v45, "userInterfaceIdiom") == 3)
    v46 = 8.0;
  else
    v46 = 15.0;

  if ((v21 & 0x80000) == 0)
  {
    v108.origin.x = v38;
    v108.origin.y = v40;
    v108.size.width = v42;
    v108.size.height = v44;
    v34 = fmax(v101, v46 + CGRectGetMaxX(v108));
LABEL_13:
    v47 = v25;
    goto LABEL_14;
  }
  v112.origin.x = v10;
  v112.origin.y = rect;
  v99 = v44;
  v47 = v25;
  v112.size.width = v25;
  v112.size.height = v15;
  Width = CGRectGetWidth(v112);
  v113.origin.x = v38;
  v113.origin.y = v40;
  v113.size.width = v42;
  v113.size.height = v99;
  v34 = fmax(v101, Width - (CGRectGetMinX(v113) - v46));
LABEL_14:
  v48 = v103;
  v49 = MEMORY[0x1E0C9D538];
  if ((_UITableViewCellUsesLayoutMarginBasedContentPadding() & 1) != 0)
    goto LABEL_62;
  v50 = objc_msgSend(v8, "isEditing");
  v51 = objc_msgSend(v8, "showingDeleteConfirmation");
  v102 = v34;
  if ((_DWORD)v50)
    v52 = -[UITableViewCellLayoutManager editingAccessoryShouldAppearForCell:](self, "editingAccessoryShouldAppearForCell:", v8);
  else
    v52 = -[UITableViewCellLayoutManager accessoryShouldAppearForCell:](self, "accessoryShouldAppearForCell:", v8);
  v53 = v52;
  -[UITableViewCellLayoutManager _adjustedBackgroundRectForCell:](self, "_adjustedBackgroundRectForCell:", v8, *(_QWORD *)&v99);
  v58 = v54;
  v59 = v55;
  v60 = v56;
  v61 = v57;
  if ((v21 & 0x80000) != 0)
  {
    v110.origin.x = v10;
    v110.origin.y = rect;
    v110.size.width = v47;
    v110.size.height = v15;
    v100 = v47;
    v66 = v15;
    v67 = v10;
    v68 = CGRectGetMinX(v110);
    v111.origin.x = v58;
    v111.origin.y = v59;
    v111.size.width = v60;
    v111.size.height = v61;
    v69 = CGRectGetMinX(v111);
    objc_msgSend(v8, "_effectiveSafeAreaInsets");
    v65 = v68 - (v69 + v70);
    v10 = v67;
    v15 = v66;
    v48 = v103;
  }
  else
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v54);
    objc_msgSend(v8, "_effectiveSafeAreaInsets");
    v64 = MaxX - v63;
    v109.origin.x = v10;
    v109.origin.y = rect;
    v109.size.width = v47;
    v109.size.height = v15;
    v65 = v64 - CGRectGetMaxX(v109);
  }
  v34 = v102;
  if (!v53)
  {
    v73 = dyld_program_sdk_at_least();
    v74 = fmax(v48, 15.0);
    if (v73)
      v72 = v74;
    else
      v72 = 15.0;
LABEL_56:
    v71 = fmax(v72 - v65, 0.0);
    goto LABEL_57;
  }
  if (!-[UITableViewCellLayoutManager shouldStackAccessoryViewVerticallyForCell:editing:](self, "shouldStackAccessoryViewVerticallyForCell:editing:", v8, v50))
  {
    if ((_DWORD)v50)
      -[UITableViewCellLayoutManager editingAccessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:](self, "editingAccessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:", v8, 1, v51);
    else
      -[UITableViewCellLayoutManager accessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:](self, "accessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:", v8, 0, v51);
    if ((*(_QWORD *)&v21 & 0x80000) != 0)
      v80 = v76;
    else
      v80 = v10;
    if ((*(_QWORD *)&v21 & 0x80000) != 0)
      v81 = v77;
    else
      v81 = rect;
    if ((*(_QWORD *)&v21 & 0x80000) != 0)
      v82 = v78;
    else
      v82 = v47;
    if ((*(_QWORD *)&v21 & 0x80000) != 0)
      v83 = v79;
    else
      v83 = v15;
    if ((*(_QWORD *)&v21 & 0x80000) != 0)
      v84 = v10;
    else
      v84 = v76;
    v104 = v65;
    if ((*(_QWORD *)&v21 & 0x80000) != 0)
      v85 = rect;
    else
      v85 = v77;
    v86 = v15;
    v87 = v10;
    if ((*(_QWORD *)&v21 & 0x80000) != 0)
      v88 = v47;
    else
      v88 = v78;
    if ((*(_QWORD *)&v21 & 0x80000) != 0)
      v89 = v86;
    else
      v89 = v79;
    v114.origin.x = v80;
    v114.origin.y = v81;
    v114.size.width = v82;
    v114.size.height = v83;
    v90 = CGRectGetMaxX(v114);
    v115.origin.x = v84;
    v115.origin.y = v85;
    v115.size.width = v88;
    v10 = v87;
    v15 = v86;
    v115.size.height = v89;
    v34 = v102;
    v65 = v104;
    v72 = fmax(v90 - CGRectGetMinX(v115), 35.0);
    goto LABEL_56;
  }
  v71 = fmax(v48, 15.0);
  v72 = 0.0;
LABEL_57:
  v91 = !-[UITableViewCellLayoutManager _editControlOnSameSideAsReorderControlForCell:](self, "_editControlOnSameSideAsReorderControlForCell:", v8, *(_QWORD *)&v100)|| v53;
  v92 = fmax(v71, v72);
  if (((v50 ^ 1) & 1) != 0)
    v92 = v71;
  if ((v91 & 1) != 0)
    v48 = v71;
  else
    v48 = v92;
LABEL_62:
  v93 = *(double *)(v49 + 8);
  v94 = v47 - (v34 + v48);
  if ((v21 & 0x80000) != 0)
  {
    v116.origin.x = v10;
    v116.origin.y = rect;
    v116.size.width = v47;
    v116.size.height = v15;
    v34 = CGRectGetWidth(v116) - v94 - v34;
  }

  v95 = v34;
  v96 = v93;
  v97 = v94;
  v98 = v15;
  result.size.height = v98;
  result.size.width = v97;
  result.origin.y = v96;
  result.origin.x = v95;
  return result;
}

- (CGRect)contentRectForCell:(id)a3 forState:(unint64_t)a4 rowWidth:(double)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[UITableViewCellLayoutManager _contentRectForCell:forEditingState:showingDeleteConfirmation:rowWidth:](self, "_contentRectForCell:forEditingState:showingDeleteConfirmation:rowWidth:", a3, a4 & 1, 0, a5);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)standardLayoutImageViewFrameForCell:(id)a3 forSizing:(BOOL)a4
{
  _BOOL4 v4;
  _DWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double height;
  double width;
  double MaxX;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  CGFloat v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  CGFloat v69;
  CGFloat v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  CGFloat v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  uint64_t v83;
  uint64_t v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat rect;
  CGAffineTransform v88;
  CGAffineTransform v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect result;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "_imageView:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "image"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    v10 = v6[30];
    objc_msgSend(v6, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    if ((v10 & 0x80000) != 0)
    {
      v90.origin.x = v13;
      v90.origin.y = v15;
      v90.size.width = v17;
      v90.size.height = v19;
      MaxX = CGRectGetMaxX(v90);
      -[UITableViewCellLayoutManager contentIndentationForCell:](self, "contentIndentationForCell:", v6);
      v22 = MaxX - v27;
    }
    else
    {
      v20 = *MEMORY[0x1E0C9D648];
      -[UITableViewCellLayoutManager contentIndentationForCell:](self, "contentIndentationForCell:", v6);
      v22 = v20 + v21;
    }
    objc_msgSend(v8, "frame");
    objc_msgSend(v8, "sizeThatFits:", v28, v29);
    width = v30;
    height = v31;
    v86 = v13;
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      objc_msgSend(v8, "transform");
      if (!CGAffineTransformIsIdentity(&v89))
      {
        v32 = *MEMORY[0x1E0C9D538];
        v33 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        objc_msgSend(v8, "transform");
        v91.origin.x = v32;
        v91.origin.y = v33;
        v13 = v86;
        v91.size.width = width;
        v91.size.height = height;
        v92 = CGRectApplyAffineTransform(v91, &v88);
        width = v92.size.width;
        height = v92.size.height;
      }
    }
    if (height <= v19 || v4)
      v35 = 1.0;
    else
      v35 = v19 / height;
    objc_msgSend(v8, "_currentImage");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    rect = v15;
    v85 = v17;
    _UITableCellLineHeightCenteredImageInRect(v36, v35, v13, v15, v17, v19);
    v23 = v37;
    v39 = v38;
    v41 = v40;

    if (fabs(v35 + -1.0) > 2.22044605e-16)
    {
      height = v41;
      width = v39;
    }
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(v6, "_constants");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "traitCollection");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "defaultImageViewSymbolImageAndAccessoryLayoutWidthForSidebar:traitCollection:", 0, v43);
      v45 = v44;

      objc_msgSend(v8, "image");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "traitCollection");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0.0;
      if (_UITableCellShouldCenterImageHorizontallyForTraitCollection(v46, v47))
      {
        v93.origin.x = v22;
        v93.origin.y = v23;
        v93.size.width = width;
        v93.size.height = height;
        v48 = (v45 - CGRectGetWidth(v93)) * 0.5;
      }

      v49 = rect;
      if ((v10 & 0x80000) != 0)
      {
        v70 = v85;
        v69 = v86;
        v71 = v19;
        v72 = CGRectGetWidth(*(CGRect *)(&v49 - 1));
        v95.origin.x = v22;
        v95.origin.y = v23;
        v95.size.width = width;
        v95.size.height = height;
        v73 = v72 - CGRectGetWidth(v95);
        objc_msgSend(v6, "contentView");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "layoutMargins");
        v22 = v73 - v74 - v48;
      }
      else
      {
        objc_msgSend(v6, "contentView");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "layoutMargins");
        v22 = v48 + v51;
      }

    }
    else if (dyld_program_sdk_at_least())
    {
      objc_msgSend(v6, "_constants");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_tableView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v52, "imageViewOffsetByLayoutMarginsForCell:inTableView:", v6, v53);

      if (v54)
      {
        objc_msgSend(v6, "bounds");
        v82 = CGRectGetWidth(v94);
        -[UITableViewCellLayoutManager contentRectForCell:forState:rowWidth:](self, "contentRectForCell:forState:rowWidth:", v6, objc_msgSend(v6, "currentStateMask"), v82);
        v83 = v56;
        v84 = v55;
        v58 = v57;
        v60 = v59;
        objc_msgSend(v6, "directionalLayoutMargins");
        v62 = v61;
        objc_msgSend(v6, "_defaultLeadingMarginWidth");
        v63 = v58;
        v64 = v60;
        v66 = fmax(v62, v65);
        v68 = v83;
        v67 = v84;
        if ((v10 & 0x80000) != 0)
        {
          v76 = fmax(v66 - (v82 - CGRectGetMaxX(*(CGRect *)&v67)), 15.0);
          v96.origin.x = v86;
          v96.origin.y = rect;
          v96.size.width = v85;
          v96.size.height = v19;
          v77 = CGRectGetMaxX(v96) - v76;
          v97.origin.x = v22;
          v97.origin.y = v23;
          v97.size.width = width;
          v97.size.height = height;
          v22 = v77 - CGRectGetWidth(v97);
        }
        else
        {
          v22 = fmax(v66 - CGRectGetMinX(*(CGRect *)&v67), 15.0);
        }
      }
    }
    else
    {
      objc_msgSend(v6, "_defaultLeadingMarginWidth");
      v22 = v75;
    }
  }
  else
  {
    v22 = *MEMORY[0x1E0C9D648];
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v78 = v22;
  v79 = v23;
  v80 = width;
  v81 = height;
  result.size.height = v81;
  result.size.width = v80;
  result.origin.y = v79;
  result.origin.x = v78;
  return result;
}

- (double)contentIndentationForCell:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;

  v3 = a3;
  v4 = (double)objc_msgSend(v3, "indentationLevel");
  objc_msgSend(v3, "indentationWidth");
  v6 = v5;

  return v6 * v4;
}

- (CGSize)optimumSizeForLabel:(id)a3 inTotalTextRect:(CGRect)a4 minimizeWidthOnVerticalOverflow:(BOOL)a5 preferSingleLineWidth:(BOOL)a6
{
  _BOOL4 v7;
  double height;
  double width;
  id v10;
  uint64_t v11;
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
  double v25;
  CGSize result;

  v7 = a5;
  height = a4.size.height;
  width = a4.size.width;
  v10 = a3;
  v11 = objc_msgSend(v10, "numberOfLines");
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(v10, "sizeThatFits:", width, height);
    v14 = v13;
    if (v7 && v12 < width)
      v15 = v12;
    else
      v15 = width;
    if (width < v12)
      v12 = width;
    if (v14 <= height)
      width = v12;
    else
      width = v15;
  }
  else
  {
    objc_msgSend(v10, "setNumberOfLines:", 1);
    objc_msgSend(v10, "sizeThatFits:", width, height);
    v17 = v16;
    v19 = v18;
    objc_msgSend(v10, "setNumberOfLines:", 0);
    objc_msgSend(v10, "sizeThatFits:", width, height);
    v22 = v19 * (double)v11;
    if (v11 <= 0)
      v22 = 3.40282347e38;
    if (v21 >= v22)
      v14 = v22;
    else
      v14 = v21;
    if (v14 > height || v21 > v14)
    {
      if (width >= v17)
        v20 = v17;
      else
        v20 = width;
      if (v7)
        width = v20;
    }
    else if (v11 == 1 && a6)
    {
      width = v17;
    }
    else
    {
      width = v20;
    }
    objc_msgSend(v10, "setNumberOfLines:", v11, v20);
  }

  v24 = width;
  v25 = v14;
  result.height = v25;
  result.width = v24;
  return result;
}

- (BOOL)_editControlOnSameSideAsReorderControlForCell:(id)a3
{
  return 0;
}

- (BOOL)accessoryShouldAppearForCell:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "_accessoryView:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)layoutSubviewsOfCell:(id)a3
{
  if (objc_msgSend(a3, "_usesModernAccessoriesLayout"))
    -[UITableViewCellLayoutManager _modern_layoutSubviewsOfCell:](self, "_modern_layoutSubviewsOfCell:", a3);
  else
    -[UITableViewCellLayoutManager _legacy_layoutSubviewsOfCell:](self, "_legacy_layoutSubviewsOfCell:", a3);
}

- (CGRect)_contentRectForCell:(id)a3 forEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5 rowWidth:(double)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
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
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  double *v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  CGRect result;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  if (objc_msgSend(v10, "_usesModernAccessoriesLayout"))
  {
    v31 = 0;
    v32 = (double *)&v31;
    v33 = 0x4010000000;
    v34 = &unk_18685B0AF;
    v35 = 0u;
    v36 = 0u;
    v28 = MEMORY[0x1E0C809B0];
    v11 = v10;
    v29 = v11;
    v30 = &v31;
    objc_msgSend(v11, "frame", v28, 3221225472, __139__UITableViewCellLayoutManager_UITableViewCellLayoutManagerStatic___contentRectForCell_forEditingState_showingDeleteConfirmation_rowWidth___block_invoke, &unk_1E16BC3A0);
    if (v13 == a6)
    {
      __139__UITableViewCellLayoutManager_UITableViewCellLayoutManagerStatic___contentRectForCell_forEditingState_showingDeleteConfirmation_rowWidth___block_invoke((uint64_t)&v28);
    }
    else
    {
      v22 = v12;
      objc_msgSend(v11, "_accessoryManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "performWithEnforcedContainerSize:block:", &v28, a6, v22);

      v11 = v29;
    }
    v15 = v32[4];
    v17 = v32[5];
    v19 = v32[6];
    v21 = v32[7];

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    -[UITableViewCellLayoutManager _legacy_contentRectForCell:forEditingState:showingDeleteConfirmation:rowWidth:](self, "_legacy_contentRectForCell:forEditingState:showingDeleteConfirmation:rowWidth:", v10, v8, v7, a6);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
  }

  v24 = v15;
  v25 = v17;
  v26 = v19;
  v27 = v21;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)_adjustedBackgroundContentRectForCell:(id)a3 rowWidth:(double)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  void *v14;
  unsigned int v15;
  double v16;
  double v17;
  unint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect result;

  -[UITableViewCellLayoutManager _adjustedBackgroundRectForCell:rowWidth:](self, "_adjustedBackgroundRectForCell:rowWidth:", a4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = *((_DWORD *)a3 + 30);
  objc_msgSend(a3, "_tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(a3, "sectionLocation");
  v16 = 0.0;
  v17 = 0.0;
  if (objc_msgSend(a3, "separatorStyle"))
  {
    v18 = objc_msgSend(v14, "_tableStyle");
    if (v18 <= 0x10 && ((1 << v18) & 0x10006) != 0 && objc_msgSend(a3, "_insetsBackground"))
    {
      objc_msgSend(a3, "_separatorHeight");
      v17 = v19;
    }
  }
  v20 = 0.0;
  if (v14)
  {
    objc_msgSend(v14, "_sectionContentInset");
    v16 = v21 + 0.0;
  }
  if (((1 << v15) & 0x15) != 0)
    v22 = v16;
  else
    v22 = 0.0;
  if (v15 > 4)
    v22 = 0.0;
  v23 = v17 + v20;
  if (((1 << v15) & 0x19) == 0)
    v23 = v17;
  if (v15 > 4)
    v23 = v17;
  if ((*(_QWORD *)&v13 & 0x80000) != 0)
    v24 = v6 + 0.0;
  else
    v24 = 0.0;
  v25 = v8 + v22;
  v26 = v12 - (v22 + v23);

  v27 = v24;
  v28 = v25;
  v29 = v10;
  v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (CGRect)_adjustedBackgroundRectForCell:(id)a3 rowWidth:(double)a4
{
  _DWORD *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  v6 = a3;
  -[UITableViewCellLayoutManager _backgroundRectForCell:rowWidth:](self, "_backgroundRectForCell:rowWidth:", v6, a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "_tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "_isShowingIndex"))
  {
    objc_msgSend(v6, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "userInterfaceIdiom");

    if (v17 != 3)
    {
      objc_msgSend(v15, "_indexFrame");
      v18 = v6[30];
      v21 = v19 + v20;
      v22 = v8 + v12 - v19;
      if ((v18 & 0x80000) != 0)
        v22 = v21;
      if (v22 > 0.0)
      {
        if ((*(_QWORD *)&v18 & 0x80000) == 0)
          v21 = -0.0;
        v12 = v12 - v22;
        v8 = v8 + v21;
      }
    }
  }

  v23 = v8;
  v24 = v10;
  v25 = v12;
  v26 = v14;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CGRect)selectedBackgroundEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v4 = a4;
  v6 = a3;
  -[UITableViewCellLayoutManager backgroundEndingRectForCell:forNewEditingState:](self, "backgroundEndingRectForCell:forNewEditingState:", v6, v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if ((objc_msgSend(v6, "_isUsingOldStyleMultiselection") & 1) == 0)
  {
    objc_msgSend(v6, "multipleSelectionBackgroundView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {

    }
    else if ((objc_msgSend(v6, "_insetsBackground") & 1) == 0)
    {
      objc_msgSend(v6, "_separatorHeight");
      v10 = v10 - v16;
      v14 = v14 + v16 + v16;
    }
  }

  v17 = v8;
  v18 = v10;
  v19 = v12;
  v20 = v14;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)_backgroundRectForCell:(id)a3 rowWidth:(double)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v5 = a3;
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  if ((objc_msgSend(v5, "_insetsBackground") & 1) == 0 && objc_msgSend(v5, "separatorStyle"))
  {
    objc_msgSend(v5, "_separatorHeight");
    v9 = v9 - v10;
  }

  v11 = 0.0;
  v12 = v7;
  v13 = a4;
  v14 = v9;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)_backgroundRectForCell:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  -[UITableViewCellLayoutManager _backgroundRectForCell:rowWidth:](self, "_backgroundRectForCell:rowWidth:", v4, CGRectGetWidth(v17));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_adjustedBackgroundRectForCell:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  -[UITableViewCellLayoutManager _adjustedBackgroundRectForCell:rowWidth:](self, "_adjustedBackgroundRectForCell:rowWidth:", v4, CGRectGetWidth(v17));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGSize)intrinsicContentSizeForCell:(id)a3 rowWidth:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  _BOOL8 v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  __int128 v47;
  __int128 v48;
  CGSize result;
  CGRect v50;

  v6 = a3;
  objc_msgSend(v6, "_textLabel:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pointSize");
  v10 = v9;

  if (v10 == 0.0)
  {
    -[UITableViewCellLayoutManager defaultTextLabelFontForCell:](self, "defaultTextLabelFontForCell:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v11);

  }
  objc_msgSend(v6, "frame");
  v13 = v12;
  objc_msgSend(v6, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "numberOfLines");

  if (v7)
    objc_msgSend(v7, "font");
  else
    -[UITableViewCellLayoutManager defaultTextLabelFontForCell:](self, "defaultTextLabelFontForCell:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_detailTextLabel:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  if (v15 == 1)
  {
    objc_msgSend(v6, "traitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "userInterfaceIdiom");

    if (v21 == 5)
    {
      objc_msgSend(v6, "_constants");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_tableView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "defaultRowHeightForTableView:cellStyle:hasDetailText:", v23, objc_msgSend(v6, "_cellStyle"), v19 != 0);
      v25 = v24;

    }
    else
    {
      objc_msgSend(v16, "_bodyLeading");
      v25 = v37 + v37;
    }
    if ((dyld_program_sdk_at_least() & 1) != 0)
      goto LABEL_20;
  }
  else
  {
    objc_msgSend(v6, "imageView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "image");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "size");
    v29 = v28;

    v30 = 0.0;
    v31 = fmax(v29, 0.0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!-[UITableViewCellLayoutManager shouldIncreaseMarginForImageViewInCell:](self, "shouldIncreaseMarginForImageViewInCell:", v6))
      {
        -[UITableViewCellLayoutManager requiredIndentationForFirstLineOfCell:rowWidth:forSizing:](self, "requiredIndentationForFirstLineOfCell:rowWidth:forSizing:", v6, 1, a4);
        v30 = v32;
      }
      objc_msgSend(v7, "_setFirstParagraphFirstLineHeadIndent:", v30);
    }
    v47 = 0u;
    v48 = 0u;
    -[UITableViewCellLayoutManager getTextLabelRect:detailTextLabelRect:forCell:rowWidth:forSizing:](self, "getTextLabelRect:detailTextLabelRect:forCell:rowWidth:forSizing:", &v47, 0, v6, 1, a4);
    v47 = *MEMORY[0x1E0C9D538];
    *((_QWORD *)&v48 + 1) = 0x7FEFFFFFFFFFFFFFLL;
    objc_msgSend(v6, "textLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "textRectForBounds:limitedToNumberOfLines:", v15, v47, v48);
    v35 = v34;

    if (v35 <= v31)
      v35 = v31;
    objc_msgSend(v16, "_bodyLeading");
    v25 = v36 + v35;
  }
  if (objc_msgSend(v6, "separatorStyle"))
  {
    objc_msgSend(v6, "_separatorFrame");
    v25 = v25 + CGRectGetHeight(v50);
  }
LABEL_20:
  if (-[UITableViewCellLayoutManager shouldStackAccessoryViewVerticallyForCell:editing:](self, "shouldStackAccessoryViewVerticallyForCell:editing:", v6, objc_msgSend(v6, "isEditing")))
  {
    -[UITableViewCellLayoutManager customAccessoryViewForCell:editing:](self, "customAccessoryViewForCell:editing:", v6, objc_msgSend(v6, "isEditing"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "frame");
    v25 = v25 + v39;

  }
  v40 = v19 != 0;
  objc_msgSend(v6, "_constants");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_tableView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "defaultRowHeightForTableView:cellStyle:hasDetailText:", v42, objc_msgSend(v6, "_cellStyle"), v40);
  v44 = ceil(fmax(v43, v25));

  v45 = v13;
  v46 = v44;
  result.height = v46;
  result.width = v45;
  return result;
}

- (BOOL)shouldStackAccessoryViewVerticallyForCell:(id)a3 editing:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  char isKindOfClass;

  v4 = a4;
  v6 = a3;
  if (-[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", v6))
  {
    -[UITableViewCellLayoutManager customAccessoryViewForCell:editing:](self, "customAccessoryViewForCell:editing:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)defaultLabelForCell:(id)a3 ofClass:(Class)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  char v28;

  v6 = a3;
  v7 = objc_alloc_init(a4);
  +[UIColor clearColor](UIColor, "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "_changesOpaqueStateOfSubviews"))
  {
    objc_msgSend(v6, "_contentBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "alphaComponent");
    if (v10 == 1.0)
    {
      v11 = v9;

      v8 = v11;
    }

  }
  objc_msgSend(v7, "setBackgroundColor:", v8);
  -[UITableViewCellLayoutManager defaultTextLabelFontForCell:](self, "defaultTextLabelFontForCell:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v7, "_setDefaultFont:", v12);
  else
    objc_msgSend(v7, "setFont:", v12);
  objc_msgSend(v7, "setAdjustsFontForContentSizeCategory:", dyld_program_sdk_at_least());
  objc_msgSend(v6, "_constants");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v6, "_cellStyle");
  objc_msgSend(v6, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_inheritedInteractionTintColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "defaultTextColorForCellStyle:traitCollection:tintColor:state:", v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setTextColor:", v18);
  objc_msgSend(v6, "_constants");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v6, "_cellStyle");
  objc_msgSend(v6, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_inheritedInteractionTintColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICellConfigurationState _readonlyCellStateFromViewConfigurationState:]((uint64_t)UICellConfigurationState, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "defaultTextColorForCellStyle:traitCollection:tintColor:state:", v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = v18;
    v26 = v24;
    if (v25 == v26)
    {

      goto LABEL_16;
    }
    v27 = v26;
    if (v25)
    {
      v28 = objc_msgSend(v25, "isEqual:", v26);

      if ((v28 & 1) != 0)
        goto LABEL_16;
    }
    else
    {

    }
    objc_msgSend(v7, "setHighlightedTextColor:", v27);
  }
LABEL_16:

  objc_msgSend(v7, "setHighlighted:", objc_msgSend(v6, "_isHighlighted"));
  objc_msgSend(v7, "setEnabled:", objc_msgSend(v6, "isUserInteractionEnabled"));
  objc_msgSend(v7, "setOpaque:", objc_msgSend(v7, "isHighlighted") ^ 1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v7, "setTableCell:", v6);

  return v7;
}

- (id)defaultTextLabelFontForCell:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "_constants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_cellStyle");

  objc_msgSend(v4, "defaultTextLabelFontForCellStyle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGRect)accessoryEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
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
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  v6 = a4;
  v8 = a3;
  v9 = v8;
  if (v6 && a5)
  {
    objc_msgSend(v8, "_tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCellLayoutManager _accessoryRectForCell:offscreen:](self, "_accessoryRectForCell:offscreen:", v9, objc_msgSend(v10, "_isEditingForSwipeDeletion") ^ 1);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    v9 = v10;
  }
  else
  {
    -[UITableViewCellLayoutManager _accessoryRectForCell:offscreen:](self, "_accessoryRectForCell:offscreen:", v8, v6);
    v12 = v19;
    v14 = v20;
    v16 = v21;
    v18 = v22;
  }

  v23 = v12;
  v24 = v14;
  v25 = v16;
  v26 = v18;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CGRect)_accessoryRectForCell:(id)a3 offscreen:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect result;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "bounds");
  -[UITableViewCellLayoutManager _accessoryRectForCell:offscreen:rowWidth:](self, "_accessoryRectForCell:offscreen:rowWidth:", v6, v4, CGRectGetWidth(v19));
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_accessoryRectForCell:(id)a3 offscreen:(BOOL)a4 rowWidth:(double)a5
{
  _BOOL8 v6;
  _DWORD *v8;
  double *v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  void *v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double MaxY;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  uint64_t v42;
  void *v43;
  _BOOL4 v44;
  double v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  CGFloat v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  CGFloat v78;
  double v79;
  double v80;
  double v81;
  double v82;
  _BOOL4 v83;
  double v84;
  double v85;
  _BOOL4 v86;
  double MinX;
  double MaxX;
  double v89;
  double v90;
  _BOOL4 v91;
  double v92;
  CGFloat x;
  CGFloat v94;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  CGFloat v113;
  double v114;
  CGFloat v115;
  CGFloat v116;
  void *v117;
  double v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  void *v127;
  double v128;
  double rect;
  CGFloat recta;
  double v131;
  CGFloat v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect result;
  CGRect v153;

  v6 = a4;
  v8 = a3;
  v9 = (double *)MEMORY[0x1E0C9D648];
  v10 = *MEMORY[0x1E0C9D648];
  objc_msgSend(v8, "_customAccessoryView:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_accessoryView:", v11 == 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = v8[30];
  if (v11)
  {
    if (-[UITableViewCellLayoutManager shouldStackAccessoryViewVerticallyForCell:editing:](self, "shouldStackAccessoryViewVerticallyForCell:editing:", v8, 0))
    {
      -[UITableViewCellLayoutManager _adjustedBackgroundContentRectForCell:rowWidth:](self, "_adjustedBackgroundContentRectForCell:rowWidth:", v8, a5);
      v16 = v15;
      v18 = v17;
      objc_msgSend(v11, "bounds");
      v131 = v19;
      v21 = v20;
      objc_msgSend(v8, "_textLabel:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "frame");
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;
      objc_msgSend(v8, "_detailTextLabel:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "frame");
      v153.origin.x = v32;
      v153.origin.y = v33;
      v153.size.width = v34;
      v153.size.height = v35;
      v133.origin.x = v24;
      v133.origin.y = v26;
      v133.size.width = v28;
      v133.size.height = v30;
      v134 = CGRectUnion(v133, v153);
      MaxY = CGRectGetMaxY(v134);

      objc_msgSend(v8, "_marginWidth");
      v38 = v37;
      -[UITableViewCellLayoutManager contentIndentationForCell:](self, "contentIndentationForCell:", v8);
      v40 = fmax(v38 + v39, 15.0);
      objc_msgSend(v8, "_imageView:", 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "image");
      v42 = objc_claimAutoreleasedReturnValue();
      if (v42
        && (v43 = (void *)v42,
            v44 = -[UITableViewCellLayoutManager shouldIncreaseMarginForImageViewInCell:](self, "shouldIncreaseMarginForImageViewInCell:", v8), v43, v44))
      {
        rect = v18;
        objc_msgSend(v41, "frame");
        v46 = v45;
        v48 = v47;
        v50 = v49;
        v52 = v51;
        objc_msgSend(v8, "bounds");
        -[UITableViewCellLayoutManager _contentRectLeadingOffsetForCell:editingState:rowWidth:](self, "_contentRectLeadingOffsetForCell:editingState:rowWidth:", v8, v6, CGRectGetWidth(v135));
        v54 = v46 + v53;
        if ((v14 & 0x80000) != 0)
        {
          v119 = v48;
          v120 = v50;
          v121 = v52;
          v78 = v131;
          v10 = fmin(v16 + rect - v40, CGRectGetMinX(*(CGRect *)&v54) + -15.0) - v131;
          goto LABEL_51;
        }
        v55 = v48;
        v56 = v50;
        v57 = v52;
        v10 = v16 + fmax(v40, CGRectGetMaxX(*(CGRect *)&v54) + 15.0);
      }
      else
      {
        if ((v14 & 0x80000) != 0)
        {
          v78 = v131;
          objc_msgSend(v8, "bounds");
          -[UITableViewCellLayoutManager _contentRectLeadingOffsetForCell:editingState:rowWidth:](self, "_contentRectLeadingOffsetForCell:editingState:rowWidth:", v8, v6, CGRectGetWidth(v141));
          v10 = v16 + v18 - v131 - v40 - v89;
          goto LABEL_51;
        }
        objc_msgSend(v8, "bounds");
        -[UITableViewCellLayoutManager _contentRectLeadingOffsetForCell:editingState:rowWidth:](self, "_contentRectLeadingOffsetForCell:editingState:rowWidth:", v8, v6, CGRectGetWidth(v136));
        v10 = v16 + v40 + v77;
      }
      v78 = v131;
LABEL_51:

      goto LABEL_52;
    }
  }
  else if (!v12)
  {
    MaxY = v9[1];
    v78 = v9[2];
    v21 = v9[3];
    goto LABEL_52;
  }
  -[UITableViewCellLayoutManager _adjustedBackgroundContentRectForCell:rowWidth:](self, "_adjustedBackgroundContentRectForCell:rowWidth:", v8, a5);
  v59 = v58;
  v61 = v60;
  v63 = v62;
  v65 = v64;
  v66 = v64;
  v67 = v60;
  if (-[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", v8))
  {
    objc_msgSend(v8, "_textLabel:", 0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "frame");
    v70 = v69;
    objc_msgSend(v68, "_capOffsetFromBoundsTop");
    v67 = v61 + v71 + v70;
    objc_msgSend(v68, "font");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "capHeight");
    v66 = v73;

  }
  if (v11)
  {
    objc_msgSend(v11, "bounds");
    v10 = v74;
    v132 = v75;
    v21 = v76;
  }
  else
  {
    objc_msgSend(v13, "bounds");
    objc_msgSend(v13, "sizeThatFits:", v79, v80);
    v132 = v81;
    v21 = v82;
  }
  MaxY = round(v67 + (v66 - v21) * 0.5);
  if (!v6)
  {
    v86 = -[UITableViewCellLayoutManager reorderControlShouldAppearForCell:](self, "reorderControlShouldAppearForCell:", v8);
    if ((v14 & 0x80000) != 0)
    {
      if (v86)
      {
        -[UITableViewCellLayoutManager _reorderControlRectForCell:offscreen:](self, "_reorderControlRectForCell:offscreen:", v8, 0);
        MaxX = CGRectGetMaxX(v140);
      }
      else
      {
        v150.origin.x = v59;
        v150.origin.y = v61;
        v150.size.width = v63;
        v150.size.height = v65;
        MaxX = CGRectGetMinX(v150);
      }
      v101 = MaxX;
      v78 = v132;
      if ((dyld_program_sdk_at_least() & 1) != 0)
      {
        objc_msgSend(v8, "_effectiveSafeAreaInsets");
        v109 = v108;
        objc_msgSend(v8, "_defaultTrailingCellMarginWidth");
        v111 = fmax(v109, v110);
        objc_msgSend(v8, "directionalLayoutMargins");
        v10 = v101 + fmax(v112, v111);
        goto LABEL_52;
      }
    }
    else
    {
      if (v86)
      {
        -[UITableViewCellLayoutManager _reorderControlRectForCell:offscreen:](self, "_reorderControlRectForCell:offscreen:", v8, 0);
        MinX = CGRectGetMinX(v139);
      }
      else
      {
        v148.origin.x = v59;
        v148.origin.y = v61;
        v148.size.width = v63;
        v148.size.height = v65;
        MinX = CGRectGetMaxX(v148);
      }
      v100 = MinX;
      v78 = v132;
      v149.origin.x = v10;
      v149.origin.y = MaxY;
      v149.size.width = v132;
      v149.size.height = v21;
      v101 = v100 - CGRectGetWidth(v149);
      if (dyld_program_sdk_at_least())
      {
        objc_msgSend(v8, "_effectiveSafeAreaInsets");
        v103 = v102;
        objc_msgSend(v8, "_defaultTrailingCellMarginWidth");
        v105 = fmax(v103, v104);
        objc_msgSend(v8, "directionalLayoutMargins");
        v107 = fmax(v106, v105);
LABEL_45:
        v10 = v101 - v107;
        goto LABEL_52;
      }
    }
    objc_msgSend(v8, "_defaultTrailingCellMarginWidth");
    goto LABEL_45;
  }
  if (objc_msgSend(v8, "_hasEditingAccessoryView"))
  {
    v83 = -[UITableViewCellLayoutManager shouldStackAccessoryViewVerticallyForCell:editing:](self, "shouldStackAccessoryViewVerticallyForCell:editing:", v8, 1);
    if (v83 == -[UITableViewCellLayoutManager shouldStackAccessoryViewVerticallyForCell:editing:](self, "shouldStackAccessoryViewVerticallyForCell:editing:", v8, 0))
    {
      -[UITableViewCellLayoutManager _editingAccessoryRectForCell:offscreen:](self, "_editingAccessoryRectForCell:offscreen:", v8, 1);
      x = v144.origin.x;
      v94 = MaxY;
      recta = MaxY;
      y = v144.origin.y;
      width = v144.size.width;
      height = v144.size.height;
      MidX = CGRectGetMidX(v144);
      v145.origin.x = v10;
      v145.origin.y = v94;
      v78 = v132;
      v145.size.width = v132;
      v145.size.height = v21;
      v10 = MidX - CGRectGetWidth(v145) * 0.5;
      v146.origin.x = x;
      v146.origin.y = y;
      v146.size.width = width;
      v146.size.height = height;
      MidY = CGRectGetMidY(v146);
      v147.origin.x = v10;
      v147.origin.y = recta;
      v147.size.width = v132;
      v147.size.height = v21;
      MaxY = MidY - CGRectGetHeight(v147) * 0.5;
      goto LABEL_52;
    }
  }
  if (objc_msgSend(v8, "_usesRoundedGroups"))
  {
    if ((v14 & 0x80000) == 0)
    {
LABEL_21:
      v137.origin.x = v59;
      v137.origin.y = v61;
      v137.size.width = v63;
      v137.size.height = v65;
      v84 = CGRectGetMaxX(v137);
      v138.origin.x = v10;
      v138.origin.y = MaxY;
      v78 = v132;
      v138.size.width = v132;
      v138.size.height = v21;
      v85 = v84 - CGRectGetWidth(v138);
LABEL_32:
      v91 = -[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", v8);
      v92 = -fmin(MaxY - v61, 10.0);
      if (v91)
        v92 = -10.0;
      if ((*(_QWORD *)&v14 & 0x80000) != 0)
        v92 = -v92;
      v10 = v85 + v92;
      goto LABEL_52;
    }
LABEL_31:
    v142.origin.x = v59;
    v142.origin.y = v61;
    v142.size.width = v63;
    v142.size.height = v65;
    v90 = CGRectGetMinX(v142);
    v143.origin.x = v10;
    v143.origin.y = MaxY;
    v78 = v132;
    v143.size.width = v132;
    v143.size.height = v21;
    v85 = v90 + CGRectGetWidth(v143);
    goto LABEL_32;
  }
  if (-[UITableViewCellLayoutManager reorderControlShouldAppearForCell:](self, "reorderControlShouldAppearForCell:", v8))
  {
    if ((v14 & 0x80000) == 0)
      goto LABEL_21;
    goto LABEL_31;
  }
  v113 = v59;
  v114 = v61;
  v115 = v63;
  v116 = v65;
  if ((v14 & 0x80000) != 0)
  {
    v126 = CGRectGetMinX(*(CGRect *)&v113);
    v151.origin.x = v10;
    v151.origin.y = MaxY;
    v78 = v132;
    v151.size.width = v132;
    v151.size.height = v21;
    v10 = v126 - CGRectGetWidth(v151);
    if (!v11)
    {
      objc_msgSend(v8, "_constants");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "defaultContentAccessoryPadding");
      v10 = v10 + v128;

    }
  }
  else
  {
    v10 = CGRectGetMaxX(*(CGRect *)&v113);
    if (!v11)
    {
      objc_msgSend(v8, "_constants");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "defaultContentAccessoryPadding");
      v10 = v10 - v118;

    }
    v78 = v132;
  }
LABEL_52:

  v122 = v10;
  v123 = MaxY;
  v124 = v78;
  v125 = v21;
  result.size.height = v125;
  result.size.width = v124;
  result.origin.y = v123;
  result.origin.x = v122;
  return result;
}

- (BOOL)reorderControlShouldAppearForCell:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "wasSwiped") && !objc_msgSend(v3, "_allowsReorderingWhenNotEditing"))
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "showsReorderControl");

  return v4;
}

+ (id)layoutManagerForTableViewCellStyle:(int64_t)a3
{
  id v3;
  void *v4;
  UITableViewCellLayoutManagerEditable1 *v5;
  void *v6;
  UITableViewCellLayoutManagerValue1 *v7;
  void *v8;
  UITableViewCellLayoutManagerValue2 *v9;
  void *v10;
  UITableViewCellLayoutManagerSubtitle *v11;
  void *v12;

  switch((int)a3)
  {
    case 0:
      +[UITableViewCellLayoutManager sharedLayoutManager](UITableViewCellLayoutManager, "sharedLayoutManager");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      return v3;
    case 1:
      v4 = (void *)_MergedGlobals_21_9;
      if (!_MergedGlobals_21_9)
      {
        v7 = objc_alloc_init(UITableViewCellLayoutManagerValue1);
        v8 = (void *)_MergedGlobals_21_9;
        _MergedGlobals_21_9 = (uint64_t)v7;

        v4 = (void *)_MergedGlobals_21_9;
      }
      goto LABEL_12;
    case 2:
      v4 = (void *)qword_1ECD7C558;
      if (!qword_1ECD7C558)
      {
        v9 = objc_alloc_init(UITableViewCellLayoutManagerValue2);
        v10 = (void *)qword_1ECD7C558;
        qword_1ECD7C558 = (uint64_t)v9;

        v4 = (void *)qword_1ECD7C558;
      }
      goto LABEL_12;
    case 3:
      v4 = (void *)qword_1ECD7C560;
      if (!qword_1ECD7C560)
      {
        v11 = objc_alloc_init(UITableViewCellLayoutManagerSubtitle);
        v12 = (void *)qword_1ECD7C560;
        qword_1ECD7C560 = (uint64_t)v11;

        v4 = (void *)qword_1ECD7C560;
      }
      goto LABEL_12;
    default:
      if ((_DWORD)a3 == 1000)
      {
        v4 = (void *)qword_1ECD7C568;
        if (!qword_1ECD7C568)
        {
          v5 = objc_alloc_init(UITableViewCellLayoutManagerEditable1);
          v6 = (void *)qword_1ECD7C568;
          qword_1ECD7C568 = (uint64_t)v5;

          v4 = (void *)qword_1ECD7C568;
        }
LABEL_12:
        v3 = v4;
      }
      else
      {
        v3 = 0;
      }
      return v3;
  }
}

+ (BOOL)requiresLegacyLayout
{
  return 0;
}

+ (id)sharedLayoutManager
{
  void *v2;
  UITableViewCellLayoutManager *v3;
  void *v4;

  v2 = (void *)sharedLayoutManager_layoutManager;
  if (!sharedLayoutManager_layoutManager)
  {
    v3 = objc_alloc_init(UITableViewCellLayoutManager);
    v4 = (void *)sharedLayoutManager_layoutManager;
    sharedLayoutManager_layoutManager = (uint64_t)v3;

    v2 = (void *)sharedLayoutManager_layoutManager;
  }
  return v2;
}

- (id)defaultImageViewForCell:(id)a3
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (CGRect)contentRectForCell:(id)a3 forState:(unint64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect result;

  v6 = a3;
  objc_msgSend(v6, "bounds");
  -[UITableViewCellLayoutManager contentRectForCell:forState:rowWidth:](self, "contentRectForCell:forState:rowWidth:", v6, a4, CGRectGetWidth(v19));
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

+ (void)initialize
{
  id v3;
  __int128 v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  __int128 v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  _QWORD v19[22];

  v19[20] = *MEMORY[0x1E0C80C00];
  v3 = (id)objc_opt_class();
  if ((objc_msgSend(a1, "requiresLegacyLayout") & 1) == 0 && v3 != a1)
  {
    v5 = 0;
    v19[0] = sel_editControlShouldAppearForCell_;
    v19[1] = sel_editControlStartingRectForCell_forNewEditingState_;
    v19[2] = sel_editControlEndingRectForCell_forNewEditingState_;
    v19[3] = sel_editControlShouldFadeForCell_;
    v19[4] = sel_reorderControlShouldAppearForCell_;
    v19[5] = sel_reorderControlStartingRectForCell_forNewEditingState_showingDeleteConfirmation_;
    v19[6] = sel_reorderControlEndingRectForCell_forNewEditingState_showingDeleteConfirmation_;
    v19[7] = sel_reorderControlShouldFadeForCell_;
    v19[8] = sel_reorderSeparatorShouldAppearForCell_;
    v19[9] = sel_reorderSeparatorStartingRectForCell_forNewEditingState_showingDeleteConfirmation_;
    v19[10] = sel_reorderSeparatorEndingRectForCell_forNewEditingState_showingDeleteConfirmation_;
    v19[11] = sel_reorderSeparatorShouldFadeForCell_;
    v19[12] = sel_accessoryShouldAppearForCell_;
    v19[13] = sel_accessoryStartingRectForCell_forNewEditingState_showingDeleteConfirmation_;
    v19[14] = sel_accessoryEndingRectForCell_forNewEditingState_showingDeleteConfirmation_;
    v19[15] = sel_accessoryShouldFadeForCell_;
    v19[16] = sel_editingAccessoryShouldAppearForCell_;
    v19[17] = sel_editingAccessoryStartingRectForCell_forNewEditingState_showingDeleteConfirmation_;
    v19[18] = sel_editingAccessoryEndingRectForCell_forNewEditingState_showingDeleteConfirmation_;
    v19[19] = sel_editingAccessoryShouldFadeForCell_;
    *(_QWORD *)&v4 = 138412546;
    v14 = v4;
    do
    {
      v6 = (const char *)v19[v5];
      v7 = objc_msgSend(a1, "instanceMethodForSelector:", v6, v14);
      if (v7 != objc_msgSend((id)objc_msgSend(a1, "superclass"), "instanceMethodForSelector:", v6))
      {
        v8 = initialize___s_category_1;
        if (!initialize___s_category_1)
        {
          v8 = __UILogCategoryGetNode("UITableViewCellLayoutManager", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v8, (unint64_t *)&initialize___s_category_1);
        }
        v9 = *(NSObject **)(v8 + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = v9;
          v11 = (objc_class *)objc_opt_class();
          NSStringFromClass(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(v6);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v14;
          v16 = v12;
          v17 = 2112;
          v18 = v13;
          _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "%@ is implementing %@ without returning YES from requiresLegacyLayout. This method will be ignored.", buf, 0x16u);

        }
      }
      ++v5;
    }
    while (v5 != 20);
  }
}

- (CGRect)contentEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v4 = a4;
  v6 = a3;
  -[UITableViewCellLayoutManager _contentRectForCell:forEditingState:showingDeleteConfirmation:](self, "_contentRectForCell:forEditingState:showingDeleteConfirmation:", v6, v4, objc_msgSend(v6, "showingDeleteConfirmation"));
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_contentRectForCell:(id)a3 forEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect result;

  v5 = a5;
  v6 = a4;
  objc_msgSend(a3, "bounds");
  -[UITableViewCellLayoutManager _contentRectForCell:forEditingState:showingDeleteConfirmation:rowWidth:](self, "_contentRectForCell:forEditingState:showingDeleteConfirmation:rowWidth:", a3, v6, v5, CGRectGetWidth(v13));
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (id)defaultLabelForCell:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UITableViewCellLayoutManager defaultLabelForCell:ofClass:](self, "defaultLabelForCell:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGRect)_adjustedBackgroundContentRectForCell:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect v9;
  CGRect result;

  objc_msgSend(a3, "bounds");
  -[UITableViewCellLayoutManager _adjustedBackgroundContentRectForCell:rowWidth:](self, "_adjustedBackgroundContentRectForCell:rowWidth:", a3, CGRectGetWidth(v9));
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)_editControlRectForCell:(id)a3 offscreen:(BOOL)a4
{
  _BOOL8 v4;
  _DWORD *v6;
  void *v7;
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
  void *v18;
  double v19;
  double v20;
  int v21;
  _BOOL4 v22;
  int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double MinX;
  double v35;
  double v36;
  double v37;
  double v38;
  double Width;
  double v40;
  double MaxX;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGRect v49;
  CGRect result;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "_constants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultEditControlSizeForCell:inTableView:", v6, v8);
  v10 = v9;

  objc_msgSend(v6, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v6, "_constants");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "defaultEditControlPaddingForCell:inTableView:", v6, v18);
  v20 = v10 + v19;
  v21 = v6[30];
  v22 = -[UITableViewCellLayoutManager _editControlOnSameSideAsReorderControlForCell:](self, "_editControlOnSameSideAsReorderControlForCell:", v6);
  v23 = v22 ^ ((*(_QWORD *)&v21 & 0x80000) == 0);
  if (!v4)
  {
    if (v23)
    {
      objc_msgSend(v6, "_effectiveSafeAreaInsets");
      v27 = v12 + v28;
      if (!v22)
        goto LABEL_9;
    }
    else
    {
      objc_msgSend(v6, "_effectiveSafeAreaInsets");
      v27 = v12 + v14 - v20 - v38;
      if (!v22)
        goto LABEL_9;
    }
LABEL_13:
    if (-[UITableViewCellLayoutManager reorderControlShouldAppearForCell:](self, "reorderControlShouldAppearForCell:", v6))
    {
      -[UITableViewCellLayoutManager _reorderControlRectForCell:offscreen:](self, "_reorderControlRectForCell:offscreen:", v6, v4);
      Width = CGRectGetWidth(v49);
      objc_msgSend(v17, "defaultSpaceBetweenEditAndReorderControlsForCell:inTableView:", v6, v18);
      v27 = v27 - (Width + v40);
    }
    goto LABEL_16;
  }
  objc_msgSend(v17, "defaultContentEditPaddingForCell:inTableView:", v6, v18);
  v25 = v12 + v14 - v24;
  v26 = v12 - v20 + v24;
  if (v23)
    v27 = v26;
  else
    v27 = v25;
  if (v22)
    goto LABEL_13;
LABEL_9:
  if (!v4)
  {
    v29 = v10 + 20.0;
    v30 = 0;
    v31 = v27;
    v32 = v20;
    v33 = v16;
    if ((v21 & 0x80000) != 0)
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v31);
      objc_msgSend(v6, "directionalLayoutMargins");
      v43 = v42;
      objc_msgSend(v17, "defaultEditControlPaddingForCell:inTableView:", v6, v18);
      v27 = fmin(MaxX, v14 - (v43 - (v29 + v44 * 0.5))) - v20;
    }
    else
    {
      MinX = CGRectGetMinX(*(CGRect *)&v31);
      objc_msgSend(v6, "directionalLayoutMargins");
      v36 = v35;
      objc_msgSend(v17, "defaultEditControlPaddingForCell:inTableView:", v6, v18);
      v27 = fmax(MinX, v36 - (v29 + v37 * 0.5));
    }
  }
LABEL_16:

  v45 = 0.0;
  v46 = v27;
  v47 = v20;
  v48 = v16;
  result.size.height = v48;
  result.size.width = v47;
  result.origin.y = v45;
  result.origin.x = v46;
  return result;
}

- (CGRect)_reorderControlRectForCell:(id)a3 offscreen:(BOOL)a4
{
  _BOOL4 v4;
  _DWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  int v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGRect result;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "_constants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_constants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_accessoryBaseColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultReorderControlSizeForCell:withAccessoryBaseColor:", v6, v10);
  v12 = v11;

  objc_msgSend(v6, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = v6[30];
  if (objc_msgSend(v6, "_usesRoundedGroups"))
  {
    -[UITableViewCellLayoutManager _adjustedBackgroundContentRectForCell:](self, "_adjustedBackgroundContentRectForCell:", v6);
    if ((v19 & 0x80000) == 0)
    {
      v14 = v20 + v21 - v12 + -1.0;
      goto LABEL_27;
    }
    v14 = v20 + 1.0;
LABEL_31:
    objc_msgSend(v8, "_isShowingIndex");
    goto LABEL_32;
  }
  if (!v4)
  {
    if (objc_msgSend(v6, "layoutMarginsFollowReadableWidth"))
    {
      objc_msgSend(v6, "_tableView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_scrollView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "_safeAreaWidthExceedsReadableWidth");

      if ((v19 & 0x80000) == 0)
      {
        v28 = v14 + v16 - v12;
        if (v27)
        {
          objc_msgSend(v6, "directionalLayoutMargins");
LABEL_18:
          v14 = v28 - v29;
          goto LABEL_27;
        }
LABEL_17:
        objc_msgSend(v6, "_effectiveSafeAreaInsets");
        goto LABEL_18;
      }
      if (v27)
      {
        objc_msgSend(v6, "directionalLayoutMargins");
        v14 = v14 + v31;
        goto LABEL_31;
      }
    }
    else if ((v19 & 0x80000) == 0)
    {
      v28 = v14 + v16 - v12;
      goto LABEL_17;
    }
    objc_msgSend(v6, "_effectiveSafeAreaInsets");
    v14 = v14 + v32;
    goto LABEL_31;
  }
  if (-[UITableViewCellLayoutManager accessoryShouldAppearForCell:](self, "accessoryShouldAppearForCell:", v6)
    && !-[UITableViewCellLayoutManager editingAccessoryShouldAppearForCell:](self, "editingAccessoryShouldAppearForCell:", v6))
  {
    if ((v19 & 0x80000) == 0)
    {
      v14 = v14 + v16 - v12;
      goto LABEL_27;
    }
    goto LABEL_31;
  }
  v22 = -[UITableViewCellLayoutManager reorderSeparatorShouldAppearForCell:](self, "reorderSeparatorShouldAppearForCell:", v6);
  if ((v19 & 0x80000) != 0)
  {
    if (v22)
    {
      -[UITableViewCellLayoutManager _reorderSeparatorRectForCell:offscreen:](self, "_reorderSeparatorRectForCell:offscreen:", v6, 1);
      v14 = v30 - v12;
    }
    else
    {
      objc_msgSend(v7, "defaultContentReorderPaddingForCell:inTableView:", v6, v8);
      v14 = v14 - v12 + v35;
    }
    goto LABEL_31;
  }
  if (v22)
  {
    -[UITableViewCellLayoutManager _reorderSeparatorRectForCell:offscreen:](self, "_reorderSeparatorRectForCell:offscreen:", v6, 1);
    v14 = v23 + v24;
  }
  else
  {
    objc_msgSend(v7, "defaultContentReorderPaddingForCell:inTableView:", v6, v8);
    v14 = v14 + v16 - v33;
  }
LABEL_27:
  if (objc_msgSend(v8, "_isShowingIndex") && (v19 & 0x80000) == 0)
  {
    objc_msgSend(v8, "_indexFrame");
    v14 = v14 - (v12 + v14 - v34);
  }
LABEL_32:

  v36 = 0.0;
  v37 = v14;
  v38 = v12;
  v39 = v18;
  result.size.height = v39;
  result.size.width = v38;
  result.origin.y = v36;
  result.origin.x = v37;
  return result;
}

- (CGRect)_reorderSeparatorRectForCell:(id)a3 offscreen:(BOOL)a4
{
  _BOOL8 v4;
  _DWORD *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect result;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v6, "_currentScreenScale");
  v13 = v6[30];
  v15 = 1.0 / v14;
  if (objc_msgSend(v6, "_usesRoundedGroups"))
  {
    -[UITableViewCellLayoutManager _adjustedBackgroundRectForCell:](self, "_adjustedBackgroundRectForCell:", v6);
    v17 = v16;
    v19 = v18;
    -[UITableViewCellLayoutManager _reorderControlRectForCell:offscreen:](self, "_reorderControlRectForCell:offscreen:", v6, v4);
    v21 = v17 + v20 + 1.0;
    v22 = v17 + v19 - v20 - v15 + -1.0;
    goto LABEL_7;
  }
  if (v4)
  {
    if (!-[UITableViewCellLayoutManager editingAccessoryShouldAppearForCell:](self, "editingAccessoryShouldAppearForCell:", v6)|| -[UITableViewCellLayoutManager shouldStackAccessoryViewVerticallyForCell:editing:](self, "shouldStackAccessoryViewVerticallyForCell:editing:", v6, 1))
    {
      v21 = v8 - v15;
      v22 = v8 + v10;
LABEL_7:
      if ((v13 & 0x80000) != 0)
        v23 = v21;
      else
        v23 = v22;
      goto LABEL_15;
    }
    -[UITableViewCellLayoutManager _editingAccessoryRectForCell:offscreen:](self, "_editingAccessoryRectForCell:offscreen:", v6, 0);
    v26 = v28 - v15;
    v27 = v28 + v29;
  }
  else
  {
    -[UITableViewCellLayoutManager _reorderControlRectForCell:offscreen:](self, "_reorderControlRectForCell:offscreen:", v6, 0);
    v26 = v15 + v24 + v25;
    v27 = v24 - v15;
  }
  if ((v13 & 0x80000) != 0)
    v23 = v26;
  else
    v23 = v27;
LABEL_15:

  v30 = 0.0;
  v31 = v23;
  v32 = v15;
  v33 = v12;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v30;
  result.origin.x = v31;
  return result;
}

- (id)customAccessoryViewForCell:(id)a3 editing:(BOOL)a4
{
  if (a4)
    objc_msgSend(a3, "_customEditingAccessoryView:", 1);
  else
    objc_msgSend(a3, "_customAccessoryView:", 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGRect)_editingAccessoryRectForCell:(id)a3 offscreen:(BOOL)a4
{
  _BOOL8 v4;
  _DWORD *v6;
  double *v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  void *v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double MaxY;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  uint64_t v40;
  void *v41;
  _BOOL4 v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  uint64_t v76;
  double MinX;
  _BOOL4 v81;
  uint64_t v82;
  double v86;
  uint64_t v87;
  double v88;
  uint64_t v89;
  double v90;
  double v91;
  double v92;
  uint64_t v93;
  double v94;
  uint64_t v95;
  double v96;
  void *v97;
  double v98;
  double MaxX;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  _BOOL4 v115;
  double v116;
  double v117;
  double v118;
  double v119;
  uint64_t v120;
  double v121;
  uint64_t v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  BOOL v135;
  double v136;
  double v137;
  double v138;
  double v139;
  CGFloat rect;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect result;
  CGRect v155;

  v4 = a4;
  v6 = a3;
  v7 = (double *)MEMORY[0x1E0C9D648];
  v8 = *MEMORY[0x1E0C9D648];
  objc_msgSend(v6, "_customEditingAccessoryView:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_editingAccessoryView:", v9 == 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = v6[30];
  if (!v9)
  {
    if (!v10)
    {
      MaxY = v7[1];
      v18 = v7[2];
      rect = v7[3];
      goto LABEL_72;
    }
LABEL_8:
    -[UITableViewCellLayoutManager _adjustedBackgroundContentRectForCell:](self, "_adjustedBackgroundContentRectForCell:", v6);
    v53 = v52;
    v55 = v54;
    v57 = v56;
    v59 = v58;
    v60 = v58;
    v61 = v54;
    if (-[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", v6))
    {
      objc_msgSend(v6, "_textLabel:", 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "frame");
      v64 = v63;
      objc_msgSend(v62, "_capOffsetFromBoundsTop");
      v61 = v55 + v65 + v64;
      objc_msgSend(v62, "font");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "capHeight");
      v60 = v67;

    }
    if (v9)
    {
      objc_msgSend(v9, "bounds");
      v8 = v69;
      v18 = v70;
    }
    else
    {
      objc_msgSend(v11, "bounds");
      objc_msgSend(v11, "sizeThatFits:", v72, v73);
      v18 = v74;
      v68 = v75;
    }
    MaxY = round(v61 + (v60 - v68) * 0.5);
    rect = v68;
    if (v4)
    {
      if (-[UITableViewCellLayoutManager reorderSeparatorShouldAppearForCell:](self, "reorderSeparatorShouldAppearForCell:", v6))
      {
        -[UITableViewCellLayoutManager _reorderSeparatorRectForCell:offscreen:](self, "_reorderSeparatorRectForCell:offscreen:", v6, 0);
        if ((v12 & 0x80000) == 0)
        {
          MinX = CGRectGetMinX(*(CGRect *)&v76);
LABEL_28:
          v91 = MinX;
          v146.origin.x = v8;
          v146.origin.y = MaxY;
          v146.size.width = v18;
          v146.size.height = rect;
          v92 = v91 - CGRectGetWidth(v146);
          goto LABEL_37;
        }
        MaxX = CGRectGetMaxX(*(CGRect *)&v76);
      }
      else
      {
        v87 = v53;
        v88 = v55;
        v89 = v57;
        v90 = v59;
        if ((v12 & 0x80000) == 0)
        {
          MinX = CGRectGetMaxX(*(CGRect *)&v87);
          goto LABEL_28;
        }
        MaxX = CGRectGetMinX(*(CGRect *)&v87);
      }
      v92 = MaxX;
LABEL_37:
      if (dyld_program_sdk_at_least())
      {
        objc_msgSend(v6, "_effectiveSafeAreaInsets");
        v107 = v106;
        v109 = v108;
        objc_msgSend(v6, "_defaultTrailingCellMarginWidth");
        v111 = v110;
        objc_msgSend(v6, "directionalLayoutMargins");
        if ((*(_QWORD *)&v12 & 0x80000) != 0)
          v113 = v107;
        else
          v113 = v109;
        v114 = fmax(v112, fmax(v113, v111));
        if ((*(_QWORD *)&v12 & 0x80000) == 0)
          v114 = -v114;
      }
      else
      {
        v115 = -[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", v6);
        v116 = -fmin(MaxY - v55, 10.0);
        if (v115)
          v117 = -10.0;
        else
          v117 = v116;
        objc_msgSend(v6, "_effectiveSafeAreaInsets");
        if ((v12 & 0x80000) != 0)
          v114 = v118 - v117;
        else
          v114 = v117 - v119;
      }
LABEL_71:
      v8 = v92 + v114;
      goto LABEL_72;
    }
    if (objc_msgSend(v6, "_hasAccessoryView"))
    {
      v81 = -[UITableViewCellLayoutManager shouldStackAccessoryViewVerticallyForCell:editing:](self, "shouldStackAccessoryViewVerticallyForCell:editing:", v6, 1);
      if (v81 == -[UITableViewCellLayoutManager shouldStackAccessoryViewVerticallyForCell:editing:](self, "shouldStackAccessoryViewVerticallyForCell:editing:", v6, 0))
      {
        -[UITableViewCellLayoutManager _accessoryRectForCell:offscreen:](self, "_accessoryRectForCell:offscreen:", v6, 0);
        x = v147.origin.x;
        y = v147.origin.y;
        width = v147.size.width;
        height = v147.size.height;
        MidX = CGRectGetMidX(v147);
        v148.origin.x = v8;
        v148.origin.y = MaxY;
        v148.size.width = v18;
        v148.size.height = rect;
        v8 = MidX - CGRectGetWidth(v148) * 0.5;
        v149.origin.x = x;
        v149.origin.y = y;
        v149.size.width = width;
        v149.size.height = height;
        MidY = CGRectGetMidY(v149);
        v150.origin.x = v8;
        v150.origin.y = MaxY;
        v150.size.width = v18;
        v150.size.height = rect;
        MaxY = MidY - CGRectGetHeight(v150) * 0.5;
        goto LABEL_72;
      }
    }
    if (objc_msgSend(v6, "_usesRoundedGroups"))
    {
      if (-[UITableViewCellLayoutManager reorderSeparatorShouldAppearForCell:](self, "reorderSeparatorShouldAppearForCell:", v6))
      {
        -[UITableViewCellLayoutManager _reorderSeparatorRectForCell:offscreen:](self, "_reorderSeparatorRectForCell:offscreen:", v6, 0);
        if ((v12 & 0x80000) == 0)
        {
          v86 = CGRectGetMinX(*(CGRect *)&v82);
LABEL_52:
          v124 = v86;
          v151.origin.x = v8;
          v151.origin.y = MaxY;
          v151.size.width = v18;
          v151.size.height = rect;
          v92 = v124 - CGRectGetWidth(v151);
          goto LABEL_61;
        }
        v127 = CGRectGetMaxX(*(CGRect *)&v82);
      }
      else
      {
        v120 = v53;
        v121 = v55;
        v122 = v57;
        v123 = v59;
        if ((v12 & 0x80000) == 0)
        {
          v86 = CGRectGetMaxX(*(CGRect *)&v120);
          goto LABEL_52;
        }
        v127 = CGRectGetMinX(*(CGRect *)&v120);
      }
      v92 = v127;
    }
    else
    {
      v93 = v53;
      v94 = v55;
      v95 = v57;
      v96 = v59;
      if ((v12 & 0x80000) != 0)
      {
        v125 = CGRectGetMinX(*(CGRect *)&v93);
        v152.origin.x = v8;
        v152.origin.y = MaxY;
        v152.size.width = v18;
        v152.size.height = rect;
        v92 = v125 - CGRectGetWidth(v152);
        if (v9)
          goto LABEL_61;
        objc_msgSend(v6, "_constants");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "defaultContentAccessoryPadding");
        v92 = v92 + v126;
      }
      else
      {
        v92 = CGRectGetMaxX(*(CGRect *)&v93);
        if (v9)
          goto LABEL_61;
        objc_msgSend(v6, "_constants");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "defaultContentAccessoryPadding");
        v92 = v92 - v98;
      }

    }
LABEL_61:
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(v6, "_effectiveSafeAreaInsets");
      if ((*(_QWORD *)&v12 & 0x80000) != 0)
        v130 = v128;
      else
        v130 = v129;
      objc_msgSend(v6, "_defaultTrailingCellMarginWidth");
      v132 = fmax(v130, v131);
      objc_msgSend(v6, "directionalLayoutMargins");
      v134 = fmax(v133, v132);
    }
    else
    {
      v135 = -[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", v6);
      v114 = -10.0;
      if (v135)
        goto LABEL_69;
      v134 = fmin(MaxY - v55, 10.0);
    }
    v114 = -v134;
LABEL_69:
    if ((*(_QWORD *)&v12 & 0x80000) != 0)
      v114 = -v114;
    goto LABEL_71;
  }
  if (!-[UITableViewCellLayoutManager shouldStackAccessoryViewVerticallyForCell:editing:](self, "shouldStackAccessoryViewVerticallyForCell:editing:", v6, 1))goto LABEL_8;
  -[UITableViewCellLayoutManager _adjustedBackgroundContentRectForCell:](self, "_adjustedBackgroundContentRectForCell:", v6);
  v14 = v13;
  v16 = v15;
  objc_msgSend(v9, "bounds");
  v18 = v17;
  rect = v19;
  objc_msgSend(v6, "_textLabel:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "frame");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  objc_msgSend(v6, "_detailTextLabel:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "frame");
  v155.origin.x = v30;
  v155.origin.y = v31;
  v155.size.width = v32;
  v155.size.height = v33;
  v141.origin.x = v22;
  v141.origin.y = v24;
  v141.size.width = v26;
  v141.size.height = v28;
  v142 = CGRectUnion(v141, v155);
  MaxY = CGRectGetMaxY(v142);

  objc_msgSend(v6, "_marginWidth");
  v36 = v35;
  -[UITableViewCellLayoutManager contentIndentationForCell:](self, "contentIndentationForCell:", v6);
  v38 = fmax(v36 + v37, 15.0);
  objc_msgSend(v6, "_imageView:", 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "image");
  v40 = objc_claimAutoreleasedReturnValue();
  if (v40
    && (v41 = (void *)v40,
        v42 = -[UITableViewCellLayoutManager shouldIncreaseMarginForImageViewInCell:](self, "shouldIncreaseMarginForImageViewInCell:", v6), v41, v42))
  {
    objc_msgSend(v39, "frame");
    v44 = v43;
    v46 = v45;
    v48 = v47;
    v50 = v49;
    objc_msgSend(v6, "bounds");
    -[UITableViewCellLayoutManager _contentRectLeadingOffsetForCell:editingState:rowWidth:](self, "_contentRectLeadingOffsetForCell:editingState:rowWidth:", v6, v4, CGRectGetWidth(v143));
    if ((v12 & 0x80000) != 0)
    {
      v153.origin.x = v44 - v51;
      v153.origin.y = v46;
      v153.size.width = v48;
      v153.size.height = v50;
      v8 = fmin(-v38, CGRectGetMinX(v153) + -15.0);
    }
    else
    {
      v144.origin.x = v44 + v51;
      v144.origin.y = v46;
      v144.size.width = v48;
      v144.size.height = v50;
      v8 = v14 + fmax(v38, CGRectGetMaxX(v144) + 15.0);
    }
  }
  else
  {
    objc_msgSend(v6, "bounds");
    -[UITableViewCellLayoutManager _contentRectLeadingOffsetForCell:editingState:rowWidth:](self, "_contentRectLeadingOffsetForCell:editingState:rowWidth:", v6, v4, CGRectGetWidth(v145));
    if ((v12 & 0x80000) != 0)
      v8 = v14 + v16 - v18 - v38 - v71;
    else
      v8 = v14 + v38 + v71;
  }

LABEL_72:
  v136 = v8;
  v137 = MaxY;
  v138 = v18;
  v139 = rect;
  result.size.height = v139;
  result.size.width = v138;
  result.origin.y = v137;
  result.origin.x = v136;
  return result;
}

- (double)_contentRectLeadingOffsetForCell:(id)a3 editingState:(BOOL)a4 rowWidth:(double)a5
{
  _BOOL4 v6;
  _DWORD *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  int v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double MaxX;
  double v32;
  double v33;
  CGRect v35;
  CGRect v36;

  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "_constants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (v8[30] & 0x80000) == 0;
  v12 = -[UITableViewCellLayoutManager _editControlOnSameSideAsReorderControlForCell:](self, "_editControlOnSameSideAsReorderControlForCell:", v8);
  -[UITableViewCellLayoutManager _adjustedBackgroundContentRectForCell:rowWidth:](self, "_adjustedBackgroundContentRectForCell:rowWidth:", v8, a5);
  v17 = 0.0;
  if (v6)
  {
    v18 = v13;
    v19 = v14;
    v20 = v15;
    v21 = v16;
    if (-[UITableViewCellLayoutManager editControlShouldAppearForCell:](self, "editControlShouldAppearForCell:", v8))
    {
      v22 = v12 ^ v11;
      -[UITableViewCellLayoutManager _editControlRectForCell:offscreen:](self, "_editControlRectForCell:offscreen:", v8, 0);
      if (v22)
        v27 = v23;
      else
        v27 = v18;
      if (v22)
        v28 = v24;
      else
        v28 = v19;
      if (v22)
        v29 = v25;
      else
        v29 = v20;
      if (v22)
        v30 = v26;
      else
        v30 = v21;
      if (!v22)
      {
        v18 = v23;
        v19 = v24;
        v20 = v25;
        v21 = v26;
      }
      v35.origin.x = v27;
      v35.origin.y = v28;
      v35.size.width = v29;
      v35.size.height = v30;
      MaxX = CGRectGetMaxX(v35);
      v36.origin.x = v18;
      v36.origin.y = v19;
      v36.size.width = v20;
      v36.size.height = v21;
      v32 = MaxX - CGRectGetMinX(v36);
      objc_msgSend(v9, "defaultContentEditPaddingForCell:inTableView:", v8, v10);
      v17 = v32 - v33;
    }
  }

  return v17;
}

- (CGRect)_legacy_contentRectForCell:(id)a3 forEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5 rowWidth:(double)a6
{
  _BOOL8 v7;
  _DWORD *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double MaxX;
  double MinX;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  double v89;
  double v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  CGFloat rect;
  double recta;
  double rect_8;
  double rect_16;
  double rect_16a;
  double rect_24;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect result;

  v7 = a4;
  v9 = a3;
  objc_msgSend(v9, "_tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_constants");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCellLayoutManager _adjustedBackgroundContentRectForCell:rowWidth:](self, "_adjustedBackgroundContentRectForCell:rowWidth:", v9, a6);
  v13 = v12;
  rect_8 = v14;
  v16 = v15;
  rect_24 = v17;
  v18 = v9[30];
  v19 = -[UITableViewCellLayoutManager _editControlOnSameSideAsReorderControlForCell:](self, "_editControlOnSameSideAsReorderControlForCell:", v9) ^ ((*(_QWORD *)&v18 & 0x80000) == 0);
  -[UITableViewCellLayoutManager _contentRectLeadingOffsetForCell:editingState:rowWidth:](self, "_contentRectLeadingOffsetForCell:editingState:rowWidth:", v9, v7, a6);
  v21 = -0.0;
  if (v19)
    v21 = v20;
  v22 = v13 + v21;
  v23 = v16 - v20;
  if (v7 || objc_msgSend(v9, "_allowsReorderingWhenNotEditing"))
  {
    if (-[UITableViewCellLayoutManager reorderSeparatorShouldAppearForCell:](self, "reorderSeparatorShouldAppearForCell:", v9))
    {
      -[UITableViewCellLayoutManager _reorderSeparatorRectForCell:offscreen:](self, "_reorderSeparatorRectForCell:offscreen:", v9, 0);
      v28 = v24;
      v29 = v25;
      v30 = v26;
      v31 = v27;
      if ((v18 & 0x80000) == 0)
      {
        v112.origin.x = v22;
        v112.origin.y = rect_8;
        v112.size.width = v23;
        v112.size.height = rect_24;
        MaxX = CGRectGetMaxX(v112);
        v113.origin.x = v28;
        v113.origin.y = v29;
        v113.size.width = v30;
        v113.size.height = v31;
        MinX = CGRectGetMinX(v113);
LABEL_8:
        v34 = MaxX - MinX;
        v35 = -0.0;
LABEL_18:
        v23 = v23 - v34;
        v22 = v22 + v35;
        goto LABEL_19;
      }
      v55 = CGRectGetMaxX(*(CGRect *)&v24);
      v116.origin.x = v22;
      v116.origin.y = rect_8;
      v116.size.width = v23;
      v116.size.height = rect_24;
      v35 = v55 - CGRectGetMinX(v116);
    }
    else
    {
      if (!-[UITableViewCellLayoutManager reorderControlShouldAppearForCell:](self, "reorderControlShouldAppearForCell:", v9)|| -[UITableViewCellLayoutManager _editControlOnSameSideAsReorderControlForCell:](self, "_editControlOnSameSideAsReorderControlForCell:", v9))
      {
LABEL_19:
        if (v7
          && -[UITableViewCellLayoutManager editingAccessoryShouldAppearForCell:](self, "editingAccessoryShouldAppearForCell:", v9))
        {
          rect_16 = v22;
          -[UITableViewCellLayoutManager _editingAccessoryRectForCell:offscreen:](self, "_editingAccessoryRectForCell:offscreen:", v9, 1);
          v57 = v56;
          v59 = v58;
          v61 = v60;
          v63 = v62;
          if (-[UITableViewCellLayoutManager shouldStackAccessoryViewVerticallyForCell:editing:](self, "shouldStackAccessoryViewVerticallyForCell:editing:", v9, 1))
          {
            v53 = v23;
            v54 = a6;
            rect_24 = rect_24 - v63;
            v22 = rect_16;
            goto LABEL_24;
          }
          if ((*(_QWORD *)&v18 & 0x80000) != 0)
            v81 = v57;
          else
            v81 = rect_16;
          if ((*(_QWORD *)&v18 & 0x80000) != 0)
            v82 = v59;
          else
            v82 = rect_8;
          if ((*(_QWORD *)&v18 & 0x80000) != 0)
            v83 = v61;
          else
            v83 = v23;
          if ((*(_QWORD *)&v18 & 0x80000) != 0)
            v84 = v63;
          else
            v84 = rect_24;
          if ((*(_QWORD *)&v18 & 0x80000) != 0)
            v85 = rect_16;
          else
            v85 = v57;
          if ((*(_QWORD *)&v18 & 0x80000) != 0)
            v86 = rect_8;
          else
            v86 = v59;
          if ((*(_QWORD *)&v18 & 0x80000) != 0)
            v87 = v23;
          else
            v87 = v61;
          if ((*(_QWORD *)&v18 & 0x80000) != 0)
            v88 = rect_24;
          else
            v88 = v63;
          v89 = CGRectGetMaxX(*(CGRect *)&v81);
          v121.origin.x = v85;
          v121.origin.y = v86;
          v121.size.width = v87;
          v121.size.height = v88;
          v90 = v89 - CGRectGetMinX(v121);
          objc_msgSend(v9, "_customEditingAccessoryView:", 1);
          v91 = (void *)objc_claimAutoreleasedReturnValue();

          v92 = v23;
          goto LABEL_75;
        }
LABEL_23:
        v53 = v23;
        v54 = a6;
        goto LABEL_24;
      }
      -[UITableViewCellLayoutManager _reorderControlRectForCell:offscreen:](self, "_reorderControlRectForCell:offscreen:", v9, 0);
      v40 = v36;
      v41 = v37;
      v42 = v38;
      v43 = v39;
      if ((v18 & 0x80000) == 0)
      {
        v114.origin.x = v22;
        v114.origin.y = rect_8;
        v114.size.width = v23;
        v114.size.height = rect_24;
        v44 = CGRectGetMaxX(v114);
        v115.origin.x = v40;
        v115.origin.y = v41;
        v115.size.width = v42;
        v115.size.height = v43;
        MaxX = v44 - CGRectGetMinX(v115);
        objc_msgSend(v11, "defaultContentReorderPaddingForCell:inTableView:", v9, v10);
        goto LABEL_8;
      }
      v104 = CGRectGetMaxX(*(CGRect *)&v36);
      objc_msgSend(v11, "defaultContentReorderPaddingForCell:inTableView:", v9, v10);
      v35 = v104 + v105;
    }
    v34 = v35;
    goto LABEL_18;
  }
  if (!-[UITableViewCellLayoutManager accessoryShouldAppearForCell:](self, "accessoryShouldAppearForCell:", v9))
    goto LABEL_23;
  -[UITableViewCellLayoutManager _accessoryRectForCell:offscreen:rowWidth:](self, "_accessoryRectForCell:offscreen:rowWidth:", v9, 0, a6);
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v52 = v51;
  if (-[UITableViewCellLayoutManager shouldStackAccessoryViewVerticallyForCell:editing:](self, "shouldStackAccessoryViewVerticallyForCell:editing:", v9, 0))
  {
    v53 = v23;
    v54 = a6;
    rect_24 = rect_24 - v52;
    goto LABEL_24;
  }
  if ((*(_QWORD *)&v18 & 0x80000) != 0)
    v93 = v46;
  else
    v93 = v22;
  if ((*(_QWORD *)&v18 & 0x80000) != 0)
    v94 = v48;
  else
    v94 = rect_8;
  if ((*(_QWORD *)&v18 & 0x80000) != 0)
    v95 = v50;
  else
    v95 = v23;
  if ((*(_QWORD *)&v18 & 0x80000) != 0)
    v96 = v52;
  else
    v96 = rect_24;
  rect_16 = v22;
  if ((*(_QWORD *)&v18 & 0x80000) != 0)
    v97 = v22;
  else
    v97 = v46;
  rect = v97;
  if ((*(_QWORD *)&v18 & 0x80000) != 0)
    v98 = rect_8;
  else
    v98 = v48;
  v92 = v23;
  if ((*(_QWORD *)&v18 & 0x80000) != 0)
    v99 = v23;
  else
    v99 = v50;
  if ((*(_QWORD *)&v18 & 0x80000) != 0)
    v100 = rect_24;
  else
    v100 = v52;
  v101 = CGRectGetMaxX(*(CGRect *)&v93);
  v122.origin.x = rect;
  v122.origin.y = v98;
  v122.size.width = v99;
  v122.size.height = v100;
  v90 = v101 - CGRectGetMinX(v122);
  objc_msgSend(v9, "_customAccessoryView:", 1);
  v91 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_75:
  v54 = a6;
  if (!v91)
  {
    objc_msgSend(v11, "defaultContentAccessoryPadding");
    v90 = v90 + v102;
  }
  v53 = v92 - v90;
  v103 = -0.0;
  if ((*(_QWORD *)&v18 & 0x80000) != 0)
    v103 = v90;
  v22 = rect_16 + v103;
LABEL_24:
  rect_16a = v22;
  objc_msgSend(v9, "_effectiveSafeAreaInsets", *(_QWORD *)&rect);
  v65 = v64;
  recta = v66;
  objc_msgSend(v9, "bounds");
  v68 = v67;
  v70 = v69;
  v72 = v71;
  v117.origin.x = v22;
  v117.origin.y = rect_8;
  v117.size.width = v53;
  v117.size.height = rect_24;
  v73 = CGRectGetMinX(v117);
  v118.origin.x = v68;
  v118.origin.y = v70;
  v118.size.width = v54;
  v118.size.height = v72;
  v74 = fmax(v65 - fmax(v73 - CGRectGetMinX(v118), 0.0), 0.0);
  v119.origin.x = v68;
  v119.origin.y = v70;
  v119.size.width = v54;
  v119.size.height = v72;
  v75 = CGRectGetMaxX(v119);
  v120.origin.x = rect_16a;
  v120.origin.y = rect_8;
  v120.size.width = v53;
  v120.size.height = rect_24;
  v76 = v53 - (v74 + fmax(recta - fmax(v75 - CGRectGetMaxX(v120), 0.0), 0.0));

  v77 = rect_16a + v74;
  v78 = rect_8 + 0.0;
  v79 = v76;
  v80 = rect_24;
  result.size.height = v80;
  result.size.width = v79;
  result.origin.y = v78;
  result.origin.x = v77;
  return result;
}

- (void)_reconfigureCell:(id)a3
{
  int v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(v5, "_usesModernAccessoriesLayout");
  objc_msgSend(v5, "setLayoutManager:", self);
  if (v4)
    objc_msgSend(v5, "_setUsesModernAccessoriesLayout:", 1);
  -[UITableViewCellLayoutManager _resetTextLabelDefaultFontInCell:](self, "_resetTextLabelDefaultFontInCell:", v5);

}

- (void)_resetTextLabelDefaultFontInCell:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "_textLabel:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (objc_msgSend(v5, "usingDefaultFont"))
      {
        -[UITableViewCellLayoutManager defaultTextLabelFontForCell:](self, "defaultTextLabelFontForCell:", v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_setDefaultFont:", v6);

      }
    }
  }

}

- (double)defaultTextLabelFontSizeForCell:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;

  v3 = a3;
  objc_msgSend(v3, "_constants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_cellStyle");

  objc_msgSend(v4, "defaultTextLabelFontSizeForCellStyle:", v5);
  v7 = v6;

  return v7;
}

- (id)defaultDetailTextLabelFontForCell:(id)a3
{
  return 0;
}

- (id)defaultEditableTextFieldForCell:(id)a3
{
  id v3;
  UITextField *v4;
  void *v5;
  void *v6;
  double v7;
  id v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(UITextField);
  +[UIColor clearColor](UIColor, "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_changesOpaqueStateOfSubviews"))
  {
    objc_msgSend(v3, "_contentBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alphaComponent");
    if (v7 == 1.0)
    {
      v8 = v6;

      v5 = v8;
    }

  }
  -[UITextField setBackgroundColor:](v4, "setBackgroundColor:", v5);
  objc_msgSend(v3, "_constants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultTextLabelFontForCellStyle:", objc_msgSend(v3, "_cellStyle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](v4, "setFont:", v10);

  -[UITextField setAdjustsFontForContentSizeCategory:](v4, "setAdjustsFontForContentSizeCategory:", dyld_program_sdk_at_least());
  -[UITextField setHighlighted:](v4, "setHighlighted:", objc_msgSend(v3, "_isHighlighted"));
  -[UITextField setEnabled:](v4, "setEnabled:", objc_msgSend(v3, "isUserInteractionEnabled"));
  -[UIView setOpaque:](v4, "setOpaque:", -[UIControl isHighlighted](v4, "isHighlighted") ^ 1);

  return v4;
}

- (id)defaultBadgeForCell:(id)a3
{
  _UITableViewCellBadge *v3;

  v3 = [_UITableViewCellBadge alloc];
  return -[_UITableViewCellBadge initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (id)detailTextLabelForCell:(id)a3
{
  return 0;
}

- (id)editableTextFieldForCell:(id)a3
{
  return 0;
}

- (void)_legacy_layoutSubviewsOfCell:(id)a3
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  _BOOL8 v31;
  _BOOL8 v32;
  void *v33;
  double v34;
  _BOOL8 v35;
  double v36;
  _BOOL4 v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  BOOL v86;
  void *v87;
  void *v88;
  void *v89;
  double v90;
  double v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  BOOL v97;
  double v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  _BOOL4 v104;
  void *v105;
  uint64_t v106;
  double *v107;
  void *v108;
  _BOOL4 v109;
  double v110;
  double v111;
  double v112;
  double v113;
  uint64_t v114;
  void *v115;
  _BOOL4 v116;
  double v117;
  double v118;
  double v119;
  double v120;
  id v121;
  double v122;
  void *v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  id v140;
  _BOOL8 v141;
  _BOOL8 v142;
  id v143;
  double v144;
  double v145;
  double v146;
  double v147;
  _BOOL4 v148;
  void *v149;
  _BOOL4 v150;
  void *v151;
  unsigned int v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  _QWORD v159[4];
  id v160;
  double v161;
  double v162;
  double v163;
  double v164;
  _QWORD v165[4];
  id v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  _QWORD v171[4];
  id v172;
  _QWORD v173[4];
  id v174;
  char v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;

  v5 = objc_msgSend(a3, "currentStateMask");
  v6 = v5 & 1;
  v7 = objc_msgSend(a3, "showingDeleteConfirmation");
  objc_msgSend(a3, "_badge:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *((_DWORD *)a3 + 30);
  objc_msgSend(a3, "editingData:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCellLayoutManager backgroundEndingRectForCell:forNewEditingState:](self, "backgroundEndingRectForCell:forNewEditingState:", a3, v6);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(a3, "_backgroundView:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);
  v153 = v19;
  objc_msgSend(v19, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setContentsRect:", 0.0, 0.0, 1.0, 1.0);

  -[UITableViewCellLayoutManager selectedBackgroundEndingRectForCell:forNewEditingState:](self, "selectedBackgroundEndingRectForCell:forNewEditingState:", a3, v6);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  objc_msgSend(a3, "_selectedBackgroundView:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  objc_msgSend(v10, "editControl:", v6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    -[UITableViewCellLayoutManager editControlEndingRectForCell:forNewEditingState:](self, "editControlEndingRectForCell:forNewEditingState:", a3, v5 & 1);
    objc_msgSend(v30, "setFrame:");
  }
  v31 = +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock");
  v158 = v30;
  if ((v5 & 1) != 0)
  {
    v173[0] = MEMORY[0x1E0C809B0];
    v173[1] = 3221225472;
    v173[2] = __61__UITableViewCellLayoutManager__legacy_layoutSubviewsOfCell___block_invoke_2;
    v173[3] = &unk_1E16B1B78;
    v174 = v30;
    v175 = 0;
    +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", v31, &__block_literal_global_511, v173, 0);

  }
  else
  {
    if (-[UITableViewCellLayoutManager editControlShouldFadeForCell:](self, "editControlShouldFadeForCell:", a3))
    {
      v171[0] = MEMORY[0x1E0C809B0];
      v171[1] = 3221225472;
      v171[2] = __61__UITableViewCellLayoutManager__legacy_layoutSubviewsOfCell___block_invoke_4;
      v171[3] = &unk_1E16B1B28;
      v172 = v30;
      +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", v31, &__block_literal_global_85_1, v171, 0);

    }
    objc_msgSend(v30, "setRotated:animated:", 0, 1);
  }
  v32 = -[UITableViewCellLayoutManager reorderControlShouldAppearForCell:](self, "reorderControlShouldAppearForCell:", a3);
  objc_msgSend(v10, "reorderControl:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    -[UITableViewCellLayoutManager reorderControlEndingRectForCell:forNewEditingState:showingDeleteConfirmation:](self, "reorderControlEndingRectForCell:forNewEditingState:showingDeleteConfirmation:", a3, v5 & 1, v7);
    objc_msgSend(v33, "setFrame:");
    if ((v5 & 1) != 0 || objc_msgSend(a3, "_allowsReorderingWhenNotEditing"))
    {
      v34 = 0.0;
      if (v32)
        v34 = 1.0;
      goto LABEL_13;
    }
    if ((objc_msgSend(a3, "_allowsReorderingWhenNotEditing") & 1) == 0)
    {
      v150 = -[UITableViewCellLayoutManager reorderControlShouldFadeForCell:](self, "reorderControlShouldFadeForCell:", a3);
      v34 = 0.0;
      if (v150)
LABEL_13:
        objc_msgSend(v33, "setAlpha:", v34);
    }
  }
  v35 = -[UITableViewCellLayoutManager reorderSeparatorShouldAppearForCell:](self, "reorderSeparatorShouldAppearForCell:", a3);
  objc_msgSend(v10, "reorderSeparatorView:", v35);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v156)
    goto LABEL_21;
  -[UITableViewCellLayoutManager reorderSeparatorEndingRectForCell:forNewEditingState:showingDeleteConfirmation:](self, "reorderSeparatorEndingRectForCell:forNewEditingState:showingDeleteConfirmation:", a3, v5 & 1, v7);
  objc_msgSend(v156, "setFrame:");
  if ((v5 & 1) != 0)
  {
    v36 = 0.0;
    if (v35)
      v36 = 1.0;
  }
  else
  {
    v37 = -[UITableViewCellLayoutManager reorderSeparatorShouldFadeForCell:](self, "reorderSeparatorShouldFadeForCell:", a3);
    v36 = 0.0;
    if (!v37)
      goto LABEL_21;
  }
  objc_msgSend(v156, "setAlpha:", v36);
LABEL_21:
  objc_msgSend(a3, "_accessoryView:", (v5 & 1) == 0, v36);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "_editingAccessoryView:", v5 & 1);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCellLayoutManager contentEndingRectForCell:forNewEditingState:](self, "contentEndingRectForCell:forNewEditingState:", a3, v5 & 1);
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  objc_msgSend(a3, "contentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);

  if ((v9 & 0x80000) != 0)
  {
    objc_msgSend(a3, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "frame");
    CGRectGetWidth(v176);

  }
  -[UITableViewCellLayoutManager contentIndentationForCell:](self, "contentIndentationForCell:", a3);
  if (v8)
  {
    objc_msgSend(v8, "text");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "length");

    if (v49)
    {
      objc_msgSend(v8, "superview");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v50)
        objc_msgSend(a3, "addSubview:", v8);
    }
    else
    {
      objc_msgSend(v8, "removeFromSuperview");
    }
    objc_msgSend(v8, "superview");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      objc_msgSend(a3, "contentView");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "frame");
      v54 = v53;
      v56 = v55;
      v58 = v57;
      v60 = v59;

      objc_msgSend(v8, "frame");
      if (v62 > v60)
      {
        v61 = round(v61 * (v60 / v62));
        v62 = v60;
      }
      v63 = v54 + v58 - v61 + -15.0;
      if ((*(_QWORD *)&v9 & 0x80000) != 0)
        v63 = v54 + 15.0;
      v64 = floor((v60 - v62) * 0.5);
      v65 = v58 - (v61 + 15.0);
      if ((*(_QWORD *)&v9 & 0x80000) != 0)
        v66 = v61 + 15.0;
      else
        v66 = -0.0;
      objc_msgSend(v8, "setFrame:", v63, v64);
      objc_msgSend(a3, "contentView");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setFrame:", v54 + v66, v56, v65, v60);

    }
  }
  objc_msgSend(a3, "_imageView:", 0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v68;
  if (v68)
  {
    objc_msgSend(v68, "image");
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (v70)
    {
      objc_msgSend(v69, "superview");
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v71)
      {
        objc_msgSend(a3, "contentView");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "addSubview:", v69);

      }
    }
    else
    {
      objc_msgSend(v69, "removeFromSuperview");
    }
    objc_msgSend(v69, "superview");
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73)
    {
      -[UITableViewCellLayoutManager standardLayoutImageViewFrameForCell:forSizing:](self, "standardLayoutImageViewFrameForCell:forSizing:", a3, 0);
      v75 = v74;
      v77 = v76;
      v79 = v78;
      v81 = v80;
      objc_msgSend(v69, "frame");
      v180.origin.x = v82;
      v180.origin.y = v83;
      v180.size.width = v84;
      v180.size.height = v85;
      v177.origin.x = v75;
      v177.origin.y = v77;
      v177.size.width = v79;
      v177.size.height = v81;
      v86 = CGRectEqualToRect(v177, v180);
      objc_msgSend(v69, "setFrame:", v75, v77, v79, v81);
      if (!v86)
        objc_msgSend(a3, "_updateSeparatorContent:", 1);
    }
  }
  v154 = v8;
  objc_msgSend(a3, "_textLabel:", 0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v87;
  if (v87)
  {
    objc_msgSend(v87, "font");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "pointSize");
    v91 = v90;

    if (v91 == 0.0)
    {
      -[UITableViewCellLayoutManager defaultTextLabelFontForCell:](self, "defaultTextLabelFontForCell:", a3);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "setFont:", v92);

    }
    objc_msgSend(v88, "text");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v93;
    if (v93 && objc_msgSend(v93, "length"))
    {
      objc_msgSend(v88, "superview");
      v95 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v95)
      {
        objc_msgSend(a3, "contentView");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "addSubview:", v88);

      }
    }
    else
    {
      objc_msgSend(v88, "removeFromSuperview");
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v97 = -[UITableViewCellLayoutManager shouldIncreaseMarginForImageViewInCell:](self, "shouldIncreaseMarginForImageViewInCell:", a3);
    v98 = 0.0;
    if (!v97)
    {
      objc_msgSend(a3, "bounds", 0.0);
      -[UITableViewCellLayoutManager requiredIndentationForFirstLineOfCell:rowWidth:](self, "requiredIndentationForFirstLineOfCell:rowWidth:", a3, CGRectGetWidth(v178));
    }
    objc_msgSend(v88, "_setFirstParagraphFirstLineHeadIndent:", v98);
  }
  v152 = v7;
  v99 = v10;
  objc_msgSend(a3, "_detailTextLabel:", 0);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = 0u;
  v170 = 0u;
  v167 = 0u;
  v168 = 0u;
  objc_msgSend(a3, "bounds");
  -[UITableViewCellLayoutManager getTextLabelRect:detailTextLabelRect:forCell:rowWidth:forSizing:](self, "getTextLabelRect:detailTextLabelRect:forCell:rowWidth:forSizing:", &v169, &v167, a3, 0, CGRectGetWidth(v179));
  objc_msgSend(v88, "setFrame:", v169, v170);
  v151 = v100;
  objc_msgSend(v100, "setFrame:", v167, v168);
  if (-[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", a3))
  {
    objc_msgSend(v88, "frame");
    objc_msgSend(v88, "_capOffsetFromBoundsTop");
    objc_msgSend(v88, "font");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "capHeight");

  }
  objc_msgSend(v69, "superview");
  v102 = objc_claimAutoreleasedReturnValue();
  if (v102)
  {
    v103 = (void *)v102;
    v104 = -[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", a3);

    if (v104)
    {
      if (!-[UITableViewCellLayoutManager shouldIncreaseMarginForImageViewInCell:](self, "shouldIncreaseMarginForImageViewInCell:", a3))
      {
        objc_msgSend(a3, "contentView");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "bringSubviewToFront:", v69);

      }
      objc_msgSend(v69, "frame");
      objc_msgSend(v69, "setFrame:");
    }
  }
  objc_msgSend(v158, "superview");
  v106 = objc_claimAutoreleasedReturnValue();
  v107 = (double *)MEMORY[0x1E0C9D628];
  if (v106
    && (v108 = (void *)v106,
        v109 = -[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", a3), v108, v109))
  {
    objc_msgSend(v158, "frame");
    objc_msgSend(a3, "convertRect:toView:", v158);
  }
  else
  {
    v110 = *v107;
    v111 = v107[1];
    v112 = v107[2];
    v113 = v107[3];
  }
  objc_msgSend(v158, "adjustLayoutForFocalRect:", v110, v111, v112, v113);
  objc_msgSend(v33, "superview");
  v114 = objc_claimAutoreleasedReturnValue();
  if (v114
    && (v115 = (void *)v114,
        v116 = -[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", a3), v115, v116))
  {
    objc_msgSend(v33, "frame");
    objc_msgSend(a3, "convertRect:toView:", v33);
  }
  else
  {
    v117 = *v107;
    v118 = v107[1];
    v119 = v107[2];
    v120 = v107[3];
  }
  objc_msgSend(v33, "adjustLayoutForFocalRect:", v117, v118, v119, v120);
  v165[0] = MEMORY[0x1E0C809B0];
  v165[1] = 3221225472;
  v165[2] = __61__UITableViewCellLayoutManager__legacy_layoutSubviewsOfCell___block_invoke_5;
  v165[3] = &unk_1E16B1B28;
  v121 = v33;
  v166 = v121;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v165);
  v123 = v155;
  if (!v155)
  {
LABEL_77:
    if (!v157)
      goto LABEL_94;
    -[UITableViewCellLayoutManager editingAccessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:](self, "editingAccessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:", a3, v5 & 1, v152);
    v133 = v132;
    v135 = v134;
    v137 = v136;
    v139 = v138;
    if ((v5 & 1) != 0)
    {
      if (-[UITableViewCellLayoutManager editingAccessoryShouldAppearForCell:](self, "editingAccessoryShouldAppearForCell:", a3))
      {
        objc_msgSend(v157, "superview");
        v140 = (id)objc_claimAutoreleasedReturnValue();
        if (!v140)
        {
          v141 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
          +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
          objc_msgSend(v157, "setFrame:", v133, v135, v137, v139);
          v142 = v141;
          v123 = v155;
          +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v142);
        }
        objc_msgSend(v157, "_setHiddenForReuse:", 0);
        if (v140 != a3)
          objc_msgSend(a3, "addSubview:", v157);

      }
      objc_msgSend(v157, "setFrame:", v133, v135, v137, v139);
      v122 = 1.0;
LABEL_93:
      objc_msgSend(v157, "setAlpha:", v122);
      goto LABEL_94;
    }
LABEL_92:
    objc_msgSend(v157, "setFrame:", v133, v135, v137, v139);
    v148 = -[UITableViewCellLayoutManager editingAccessoryShouldFadeForCell:](self, "editingAccessoryShouldFadeForCell:", a3);
    v122 = 0.0;
    if (!v148)
      goto LABEL_94;
    goto LABEL_93;
  }
  -[UITableViewCellLayoutManager accessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:](self, "accessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:", a3, v5 & 1, v152);
  v128 = v124;
  v129 = v125;
  v130 = v126;
  v131 = v127;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v155, "setFrame:", v124, v125, v126, v127);
    if (-[UITableViewCellLayoutManager accessoryShouldFadeForCell:](self, "accessoryShouldFadeForCell:", a3))
      objc_msgSend(v155, "setAlpha:", 0.0);
    goto LABEL_77;
  }
  objc_msgSend(v155, "superview");
  v143 = (id)objc_claimAutoreleasedReturnValue();
  if (!v143)
  {
    v159[0] = MEMORY[0x1E0C809B0];
    v159[1] = 3221225472;
    v159[2] = __61__UITableViewCellLayoutManager__legacy_layoutSubviewsOfCell___block_invoke_6;
    v159[3] = &unk_1E16B20D8;
    v160 = v155;
    v161 = v128;
    v162 = v129;
    v163 = v130;
    v164 = v131;
    v123 = v155;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v159);

  }
  objc_msgSend(v123, "_setHiddenForReuse:", 0);
  if (v143 != a3)
    objc_msgSend(a3, "addSubview:", v123);

  objc_msgSend(v123, "setFrame:", v128, v129, v130, v131);
  objc_msgSend(v123, "setAlpha:", 1.0);
  if (v157)
  {
    -[UITableViewCellLayoutManager editingAccessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:](self, "editingAccessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:", a3, 0, v152);
    v133 = v144;
    v135 = v145;
    v137 = v146;
    v139 = v147;
    goto LABEL_92;
  }
LABEL_94:
  if (!objc_msgSend(a3, "style", v122))
  {
    objc_msgSend(a3, "_detailTextLabel:", 0);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "removeFromSuperview");

    v123 = v155;
  }
  -[UITableViewCellLayoutManager _layoutFocusGuidesForCell:](self, "_layoutFocusGuidesForCell:", a3);

}

uint64_t __61__UITableViewCellLayoutManager__legacy_layoutSubviewsOfCell___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 65600, a2, a3, 0.0, 0.0);
}

uint64_t __61__UITableViewCellLayoutManager__legacy_layoutSubviewsOfCell___block_invoke_2(uint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v1);
}

uint64_t __61__UITableViewCellLayoutManager__legacy_layoutSubviewsOfCell___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 131136, a2, a3, 0.0, 0.0);
}

uint64_t __61__UITableViewCellLayoutManager__legacy_layoutSubviewsOfCell___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __61__UITableViewCellLayoutManager__legacy_layoutSubviewsOfCell___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __61__UITableViewCellLayoutManager__legacy_layoutSubviewsOfCell___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)cell:(id)a3 willTransitionToState:(unint64_t)a4
{
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "_usesModernAccessoriesLayout") & 1) == 0)
    -[UITableViewCellLayoutManager _legacy_cell:willTransitionToState:](self, "_legacy_cell:willTransitionToState:", v6, a4);

}

- (void)_legacy_cell:(id)a3 willTransitionToState:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  UITableViewCellLayoutManager *v10;
  unint64_t v11;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__UITableViewCellLayoutManager__legacy_cell_willTransitionToState___block_invoke;
  v8[3] = &unk_1E16B1C28;
  v10 = self;
  v11 = a4;
  v9 = v6;
  v7 = v6;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);

}

void __67__UITableViewCellLayoutManager__legacy_cell_willTransitionToState___block_invoke(uint64_t a1)
{
  int v2;
  unint64_t v3;
  _BOOL4 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v2 = objc_msgSend(*(id *)(a1 + 32), "currentStateMask");
  v3 = *(_QWORD *)(a1 + 48);
  v4 = (v2 & 1) == 0;
  objc_msgSend(*(id *)(a1 + 32), "editingData:", 1);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "backgroundStartingRectForCell:forNewEditingState:", *(_QWORD *)(a1 + 32), v3 & 1);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "_backgroundView:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  objc_msgSend(*(id *)(a1 + 32), "_selectedBackgroundView:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v6, v8, v10, v12);

  if ((v3 & v4) == 1)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "editControlShouldAppearForCell:", *(_QWORD *)(a1 + 32)))
    {
      objc_msgSend(v20, "editControl:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "editControlStartingRectForCell:forNewEditingState:", *(_QWORD *)(a1 + 32), 1);
      objc_msgSend(v15, "setFrame:");
      if ((objc_msgSend(*(id *)(a1 + 32), "isEditing") & 1) == 0
        && objc_msgSend(*(id *)(a1 + 40), "editControlShouldFadeForCell:", *(_QWORD *)(a1 + 32)))
      {
        objc_msgSend(v15, "setAlpha:", 0.0);
      }

    }
  }
  else if ((v3 & 0x40000000) == 0 || (v2 & 0x40000000) != 0)
  {
    goto LABEL_21;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "reorderControlShouldAppearForCell:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v20, "reorderControl:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "reorderControlStartingRectForCell:forNewEditingState:showingDeleteConfirmation:", *(_QWORD *)(a1 + 32), v3 & 1, (v3 >> 1) & 1);
    objc_msgSend(v16, "setFrame:");
    if ((v3 & 1) != 0
      && (objc_msgSend(*(id *)(a1 + 32), "isEditing") & 1) == 0
      && objc_msgSend(*(id *)(a1 + 40), "reorderControlShouldFadeForCell:", *(_QWORD *)(a1 + 32)))
    {
      objc_msgSend(v16, "setAlpha:", 0.0);
    }

  }
  if (objc_msgSend(*(id *)(a1 + 40), "reorderSeparatorShouldAppearForCell:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v20, "reorderSeparatorView:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "reorderSeparatorStartingRectForCell:forNewEditingState:showingDeleteConfirmation:", *(_QWORD *)(a1 + 32), v3 & 1, (v3 >> 1) & 1);
    objc_msgSend(v17, "setFrame:");
    if ((v3 & 1) != 0
      && (objc_msgSend(*(id *)(a1 + 32), "isEditing") & 1) == 0
      && objc_msgSend(*(id *)(a1 + 40), "reorderSeparatorShouldFadeForCell:", *(_QWORD *)(a1 + 32)))
    {
      objc_msgSend(v17, "setAlpha:", 0.0);
    }

  }
LABEL_21:
  if ((v3 & 1) == 0
    && (v2 & 1) != 0
    && objc_msgSend(*(id *)(a1 + 40), "accessoryShouldAppearForCell:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 32), "_accessoryView:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addSubview:", v18);
    objc_msgSend(*(id *)(a1 + 40), "accessoryStartingRectForCell:forNewEditingState:showingDeleteConfirmation:", *(_QWORD *)(a1 + 32), 0, (v3 >> 1) & 1);
    objc_msgSend(v18, "setFrame:");
    if ((objc_msgSend(*(id *)(a1 + 32), "isEditing") & 1) == 0
      && objc_msgSend(*(id *)(a1 + 40), "accessoryShouldFadeForCell:", *(_QWORD *)(a1 + 32))
      && (v3 & 2) == 0)
    {
      objc_msgSend(v18, "setAlpha:", 0.0);
    }

  }
  if ((v3 & v4) != 0
    && objc_msgSend(*(id *)(a1 + 40), "editingAccessoryShouldAppearForCell:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 32), "_editingAccessoryView:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addSubview:", v19);
    objc_msgSend(*(id *)(a1 + 40), "editingAccessoryStartingRectForCell:forNewEditingState:showingDeleteConfirmation:", *(_QWORD *)(a1 + 32), 1, (v3 >> 1) & 1);
    objc_msgSend(v19, "setFrame:");
    if ((objc_msgSend(*(id *)(a1 + 32), "isEditing") & 1) == 0
      && objc_msgSend(*(id *)(a1 + 40), "editingAccessoryShouldFadeForCell:", *(_QWORD *)(a1 + 32)))
    {
      objc_msgSend(v19, "setAlpha:", 0.0);
    }

  }
}

- (void)cell:(id)a3 didTransitionToState:(unint64_t)a4
{
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "_usesModernAccessoriesLayout"))
    -[UITableViewCellLayoutManager _modern_cell:didTransitionToState:](self, "_modern_cell:didTransitionToState:", v6, a4);
  else
    -[UITableViewCellLayoutManager _legacy_cell:didTransitionToState:](self, "_legacy_cell:didTransitionToState:", v6, a4);

}

- (void)_modern_cell:(id)a3 didTransitionToState:(unint64_t)a4
{
  char v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  if ((v4 & 1) == 0
    && (objc_msgSend(v7, "isEditing") & 1) == 0
    && (objc_msgSend(v7, "_allowsReorderingWhenNotEditing") & 1) == 0)
  {
    objc_msgSend(v7, "removeEditingData");
  }
  objc_msgSend(v7, "_focusSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[UITableViewCellLayoutManager _updateFocusGuidesForCell:editing:](self, "_updateFocusGuidesForCell:editing:", v7, v4 & 1);

}

- (void)_legacy_cell:(id)a3 didTransitionToState:(unint64_t)a4
{
  char v4;
  _BOOL8 v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a4;
  v19 = a3;
  v6 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
  v7 = objc_msgSend(v19, "isEditing");
  if ((v4 & 1) != 0)
  {
    if (v7)
    {
      objc_msgSend(v19, "_accessoryView:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_editingAccessoryView:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 != v9)
      {
        objc_msgSend(v19, "_accessoryView:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
        v13 = v10;
        objc_msgSend(v10, "removeFromSuperview");

      }
    }
  }
  else if ((v7 & 1) == 0 && (objc_msgSend(v19, "_allowsReorderingWhenNotEditing") & 1) == 0)
  {
    objc_msgSend(v19, "removeEditingData");
    objc_msgSend(v19, "_accessoryView:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_editingAccessoryView:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 != v12)
    {
      objc_msgSend(v19, "_editingAccessoryView:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  objc_msgSend(v19, "_focusSystem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    -[UITableViewCellLayoutManager _updateFocusGuidesForCell:editing:](self, "_updateFocusGuidesForCell:editing:", v19, v4 & 1);
  objc_msgSend(v19, "_accessoryView:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(v16, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "clearHasBeenCommitted");

    }
  }
  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v6);

}

- (void)_updateFocusGuidesForCell:(id)a3 editing:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  UIFocusContainerGuide *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a4;
  v16 = a3;
  objc_msgSend(v16, "_focusSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v4)
  {
    objc_msgSend(v16, "_editingControlsFocusGuide");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = objc_alloc_init(UIFocusContainerGuide);
      objc_msgSend(v16, "_setEditingControlsFocusGuide:", v8);

      objc_msgSend(v16, "_editingControlsFocusGuide");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setIdentifier:", CFSTR("UITableViewCellEditingFocusGuide"));

      objc_msgSend(v16, "_editingControlsFocusGuide");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addLayoutGuide:", v10);

    }
    -[UITableViewCellLayoutManager _layoutFocusGuidesForCell:](self, "_layoutFocusGuidesForCell:", v16);
    goto LABEL_11;
  }
  objc_msgSend(v16, "_focusSystem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && v4)
  {

LABEL_11:
    v14 = v16;
    goto LABEL_12;
  }
  objc_msgSend(v16, "_editingControlsFocusGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v16;
  if (v13)
  {
    objc_msgSend(v16, "_editingControlsFocusGuide");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeLayoutGuide:", v15);

    objc_msgSend(v16, "_setEditingControlsFocusGuide:", 0);
    goto LABEL_11;
  }
LABEL_12:

}

- (BOOL)editControlShouldAppearForCell:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "wasSwiped") & 1) != 0)
  {
    v4 = 0;
  }
  else if (objc_msgSend(v3, "editingStyle"))
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "shouldIndentWhileEditing");
  }

  return v4;
}

- (CGRect)editControlEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[UITableViewCellLayoutManager _editControlRectForCell:offscreen:](self, "_editControlRectForCell:offscreen:", a3, !a4);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (BOOL)editControlShouldFadeForCell:(id)a3
{
  return 1;
}

- (CGRect)reorderControlStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[UITableViewCellLayoutManager _reorderControlRectForCell:offscreen:](self, "_reorderControlRectForCell:offscreen:", a3, a4 & ~a5);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)reorderControlEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
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

  v5 = a5;
  v8 = a3;
  v9 = objc_msgSend(v8, "showsReorderControl") ^ 1;
  if ((v9 & 1) == 0 && !a4)
    v9 = (objc_msgSend(v8, "_allowsReorderingWhenNotEditing") | v5) ^ 1;
  -[UITableViewCellLayoutManager _reorderControlRectForCell:offscreen:](self, "_reorderControlRectForCell:offscreen:", v8, v9);
  v11 = v10;
  v13 = v12;
  v15 = v14;
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

- (BOOL)reorderControlShouldFadeForCell:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "_tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isShowingIndex");

  v7 = (v6 & 1) != 0
    || -[UITableViewCellLayoutManager accessoryShouldAppearForCell:](self, "accessoryShouldAppearForCell:", v4)
    && !-[UITableViewCellLayoutManager editingAccessoryShouldAppearForCell:](self, "editingAccessoryShouldAppearForCell:", v4);

  return v7;
}

- (BOOL)reorderSeparatorShouldAppearForCell:(id)a3
{
  id v4;
  BOOL v5;
  void *v7;

  v4 = a3;
  if (-[UITableViewCellLayoutManager reorderControlShouldAppearForCell:](self, "reorderControlShouldAppearForCell:", v4)&& (objc_msgSend(v4, "_allowsReorderingWhenNotEditing") & 1) == 0)
  {
    if (objc_msgSend(v4, "editingAccessoryType"))
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v4, "_editingAccessoryView:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v7 != 0;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CGRect)reorderSeparatorStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[UITableViewCellLayoutManager _reorderSeparatorRectForCell:offscreen:](self, "_reorderSeparatorRectForCell:offscreen:", a3, a4 & ~a5);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)reorderSeparatorEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[UITableViewCellLayoutManager _reorderSeparatorRectForCell:offscreen:](self, "_reorderSeparatorRectForCell:offscreen:", a3, !a4 && !a5);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)reorderSeparatorShouldFadeForCell:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "_tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isShowingIndex");

  return v4;
}

- (CGRect)accessoryStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[UITableViewCellLayoutManager _accessoryRectForCell:offscreen:](self, "_accessoryRectForCell:offscreen:", a3, !a4 && !a5);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)accessoryShouldFadeForCell:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  void *v11;
  char v12;
  BOOL v13;

  v4 = a3;
  objc_msgSend(v4, "_customAccessoryView:", 0);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_customEditingAccessoryView:", 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "accessoryType");
  v8 = objc_msgSend(v4, "editingAccessoryType");
  if (v5 && v6)
  {
    if (v5 == v6)
    {
LABEL_16:
      v13 = 0;
      goto LABEL_17;
    }
  }
  else if (v5 || v6 || !v7 || !v8)
  {
    v9 = v5 | v7;
    v10 = (v5 | v7) != 0;
    if ((!v9 || !(v6 | v8))
      && (v10 & -[UITableViewCellLayoutManager reorderControlShouldAppearForCell:](self, "reorderControlShouldAppearForCell:", v4) & 1) == 0)
    {
      objc_msgSend(v4, "_tableView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "_isShowingIndex");

      if ((v12 & 1) == 0)
        goto LABEL_16;
    }
  }
  else if (v7 == v8)
  {
    goto LABEL_16;
  }
  v13 = 1;
LABEL_17:

  return v13;
}

- (BOOL)editingAccessoryShouldAppearForCell:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  objc_msgSend(v3, "_editingAccessoryView:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = objc_msgSend(v3, "showingDeleteConfirmation") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (CGRect)editingAccessoryStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[UITableViewCellLayoutManager _editingAccessoryRectForCell:offscreen:](self, "_editingAccessoryRectForCell:offscreen:", a3, !a4 && !a5);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)editingAccessoryEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[UITableViewCellLayoutManager _editingAccessoryRectForCell:offscreen:](self, "_editingAccessoryRectForCell:offscreen:", a3, a4 | a5);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)editingAccessoryShouldFadeForCell:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  BOOL v10;

  v3 = a3;
  objc_msgSend(v3, "_customAccessoryView:", 0);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_customEditingAccessoryView:", 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "accessoryType");
  v7 = objc_msgSend(v3, "editingAccessoryType");
  if (v4 && v5)
  {
    if (v4 == v5)
    {
LABEL_15:
      v10 = 0;
      goto LABEL_16;
    }
  }
  else if (v4 || v5 || !v6 || !v7)
  {
    if (!(v4 | v6) || !(v5 | v7))
    {
      objc_msgSend(v3, "_tableView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "_isShowingIndex");

      if ((v9 & 1) == 0)
        goto LABEL_15;
    }
  }
  else if (v6 == v7)
  {
    goto LABEL_15;
  }
  v10 = 1;
LABEL_16:

  return v10;
}

- (CGRect)contentStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4
{
  _BOOL8 v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v5 = !a4;
  v6 = a3;
  -[UITableViewCellLayoutManager _contentRectForCell:forEditingState:showingDeleteConfirmation:](self, "_contentRectForCell:forEditingState:showingDeleteConfirmation:", v6, v5, objc_msgSend(v6, "showingDeleteConfirmation"));
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)contentStartingRectForCell:(id)a3 forDisplayOfDeleteConfirmation:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v4 = a4;
  v6 = a3;
  -[UITableViewCellLayoutManager _contentRectForCell:forEditingState:showingDeleteConfirmation:](self, "_contentRectForCell:forEditingState:showingDeleteConfirmation:", v6, objc_msgSend(v6, "currentStateMask") & 1, !v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)contentEndingRectForCell:(id)a3 forDisplayOfDeleteConfirmation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v4 = a4;
  v6 = a3;
  -[UITableViewCellLayoutManager _contentRectForCell:forEditingState:showingDeleteConfirmation:](self, "_contentRectForCell:forEditingState:showingDeleteConfirmation:", v6, objc_msgSend(v6, "currentStateMask") & 1, v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)textRectForCell:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  -[UITableViewCellLayoutManager textRectForCell:rowWidth:forSizing:](self, "textRectForCell:rowWidth:forSizing:", v4, 0, CGRectGetWidth(v17));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (double)requiredIndentationForFirstLineOfCell:(id)a3 rowWidth:(double)a4
{
  double result;

  -[UITableViewCellLayoutManager requiredIndentationForFirstLineOfCell:rowWidth:forSizing:](self, "requiredIndentationForFirstLineOfCell:rowWidth:forSizing:", a3, 0, a4);
  return result;
}

- (double)requiredIndentationForFirstLineOfCell:(id)a3 rowWidth:(double)a4 forSizing:(BOOL)a5
{
  _BOOL8 v5;
  _DWORD *v7;
  double v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  double v31;
  double v32;
  double v33;
  double v34;

  v5 = a5;
  v7 = a3;
  v8 = 0.0;
  if (!-[UITableViewCellLayoutManager shouldIncreaseMarginForImageViewInCell:](self, "shouldIncreaseMarginForImageViewInCell:", v7))
  {
    v9 = v7[30];
    objc_msgSend(v7, "_effectiveSafeAreaInsets");
    if ((*(_QWORD *)&v9 & 0x80000) != 0)
      v12 = v11;
    else
      v12 = v10;
    -[UITableViewCellLayoutManager contentIndentationForCell:](self, "contentIndentationForCell:", v7);
    v14 = v13;
    objc_msgSend(v7, "_marginWidth");
    v16 = v15;
    objc_msgSend(v7, "_imageView:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "image");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = fmax(v14 + v16 - v12, 15.0);
      objc_msgSend(v7, "_constants");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "traitCollection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "defaultImageViewSymbolImageAndAccessoryLayoutWidthForSidebar:traitCollection:", 0, v21);
      v23 = v22;

      -[UITableViewCellLayoutManager standardLayoutImageViewFrameForCell:forSizing:](self, "standardLayoutImageViewFrameForCell:forSizing:", v7, v5);
      v25 = v24;
      objc_msgSend(v17, "image");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "traitCollection");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (_UITableCellShouldCenterImageHorizontallyForTraitCollection(v26, v27))
        v25 = v23;

      objc_msgSend(v7, "_constants");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_tableView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "imageViewOffsetByLayoutMarginsForCell:inTableView:", v7, v29);

      if (v30)
      {
        objc_msgSend(v7, "directionalLayoutMargins");
        v32 = v31;
        objc_msgSend(v7, "_defaultLeadingMarginWidth");
        v34 = fmax(v32, v33) - v12;
      }
      else
      {
        -[UITableViewCellLayoutManager contentIndentationForCell:](self, "contentIndentationForCell:", v7);
      }
      v8 = fmax(v19, v25 + v34 + 15.0) - v19;
    }
    else
    {
      v8 = 0.0;
    }

  }
  return v8;
}

- (CGRect)textRectForCell:(id)a3 rowWidth:(double)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[UITableViewCellLayoutManager textRectForCell:rowWidth:forSizing:](self, "textRectForCell:rowWidth:forSizing:", a3, 0, a4);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (id)_externalTextColor
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

+ (id)_externalDetailTextColor
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

@end
