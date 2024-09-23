@implementation UITableViewCellLayoutManagerValue2

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

- (double)defaultDetailTextLabelFontSizeForCell:(id)a3
{
  return 18.0;
}

- (id)imageViewForCell:(id)a3
{
  return 0;
}

- (id)textLabelForCell:(id)a3
{
  UITableViewCellLayoutManagerValue2 *v3;
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v3 = self;
  v8.receiver = self;
  v8.super_class = (Class)UITableViewCellLayoutManagerValue2;
  v4 = a3;
  -[UITableViewCellLayoutManager defaultLabelForCell:](&v8, sel_defaultLabelForCell_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = -[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](v3, "shouldApplyAccessibilityLargeTextLayoutForCell:", v4, v8.receiver, v8.super_class);

  if ((_DWORD)v3)
    v6 = 4;
  else
    v6 = 2;
  objc_msgSend(v5, "setTextAlignment:", v6);
  return v5;
}

- (id)detailTextLabelForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UITableViewCellLayoutManagerValue2;
  v4 = a3;
  -[UITableViewCellLayoutManager defaultLabelForCell:](&v13, sel_defaultLabelForCell_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCellLayoutManagerValue2 defaultDetailTextLabelFontForCell:](self, "defaultDetailTextLabelFontForCell:", v4, v13.receiver, v13.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  objc_msgSend(v4, "_constants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "_cellStyle");
  objc_msgSend(v4, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultDetailTextColorForCellStyle:traitCollection:state:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v11);

  return v5;
}

- (id)defaultDetailTextLabelFontForCell:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "_constants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_cellStyle");

  objc_msgSend(v4, "defaultDetailTextFontForCellStyle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)getTextLabelRect:(CGRect *)a3 detailTextLabelRect:(CGRect *)a4 forCell:(id)a5 rowWidth:(double)a6 forSizing:(BOOL)a7
{
  _BOOL8 v7;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  _DWORD *v33;
  _BOOL4 v34;
  double v35;
  double v36;
  double v37;
  double v38;
  int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  CGFloat MinX;
  CGFloat v62;
  double v63;
  CGFloat v64;
  CGFloat v65;
  double v66;
  double v67;
  CGFloat x;
  CGFloat width;
  CGFloat height;
  CGFloat rect;
  double v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat y;
  CGFloat v76;
  id v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  v7 = a7;
  v77 = a5;
  -[UITableViewCellLayoutManager textRectForCell:rowWidth:forSizing:](self, "textRectForCell:rowWidth:forSizing:", v77, v7, a6);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v77, "_textLabel:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "_detailTextLabel:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x1E0C9D820];
  v22 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v24 = v22;
  v25 = *MEMORY[0x1E0C9D820];
  if (v20)
  {
    objc_msgSend(v20, "font");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "pointSize");
    v28 = v27;

    if (v28 == 0.0)
    {
      -[UITableViewCellLayoutManager defaultTextLabelFontForCell:](self, "defaultTextLabelFontForCell:", v77);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setFont:", v29);

    }
    objc_msgSend(v20, "sizeThatFits:", v17, v19);
    v31 = v30;
    if (-[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", v77))
    {
      v25 = v31;
    }
    else
    {
      v25 = 91.0;
    }
    -[UITableViewCellLayoutManager optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:](self, "optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:", v20, 0, 0, 0.0, 0.0, v25, v19);
    v24 = v32;
  }
  v33 = v77;
  if (v21)
  {
    v34 = -[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", v77);
    v35 = 0.0;
    if (v17 >= 0.0)
      v35 = v17;
    if (v34)
      v36 = v35;
    else
      v36 = v17 - v25 + -6.0;
    -[UITableViewCellLayoutManager optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:](self, "optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:", v21, 0, 0, 0.0, 0.0, v36, v19);
    v33 = v77;
    v23 = v37;
    v22 = v38;
  }
  v39 = v33[30];
  v74 = v13;
  v76 = v22;
  if (-[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:"))
  {
    if ((v39 & 0x80000) != 0)
    {
      v78.origin.x = v13;
      v78.origin.y = v15;
      v78.size.width = v17;
      v78.size.height = v19;
      v57 = CGRectGetMaxX(v78) - v25;
      v79.origin.x = v13;
      v79.origin.y = v15;
      v79.size.width = v17;
      v44 = v57;
      v79.size.height = v19;
      v40 = CGRectGetMaxX(v79) - v23;
      v43 = 0.0;
      v41 = v23;
      v42 = v24 + 0.0;
    }
    else
    {
      v40 = 0.0;
      v41 = v23;
      v42 = v24 + 0.0;
      v43 = 0.0;
      v44 = 0.0;
    }
  }
  else
  {
    v72 = v25;
    v45 = v24;
    rect = v15;
    objc_msgSend(v20, "font");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "ascender");
    v48 = v47;
    objc_msgSend(v21, "font");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "ascender");
    v51 = v50;

    if (v48 >= v51)
    {
      objc_msgSend(v20, "font");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "ascender");
      v59 = v58;
      objc_msgSend(v21, "font");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "ascender");
      v42 = round(v59 - v60);
      v43 = 0.0;
    }
    else
    {
      objc_msgSend(v21, "font");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "ascender");
      v54 = v53;
      objc_msgSend(v20, "font");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "ascender");
      v43 = round(v54 - v56);
      v42 = 0.0;
    }

    v24 = v45;
    if ((v39 & 0x80000) != 0)
    {
      v80.origin.x = v13;
      v80.origin.y = rect;
      v80.size.width = v17;
      v80.size.height = v19;
      v25 = v72;
      v44 = CGRectGetMaxX(v80) - v72;
      v81.origin.x = v44;
      v81.origin.y = v43;
      v81.size.width = v72;
      v81.size.height = v24;
      MinX = CGRectGetMinX(v81);
      v41 = v23;
      v40 = MinX - v23 + -6.0;
    }
    else
    {
      v25 = v72;
      v40 = v72 + 6.0;
      v44 = 0.0;
      v41 = v23;
    }
  }
  v73 = v42;
  v82.origin.x = v44;
  v82.origin.y = v43;
  v82.size.width = v25;
  v82.size.height = v24;
  v62 = v40;
  v63 = v42;
  v64 = v41;
  v65 = v76;
  v83 = CGRectUnion(v82, *(CGRect *)&v40);
  v66 = ceil((v19 - v83.size.height) * 0.5);
  if ((*(_QWORD *)&v39 & 0x80000) != 0)
    v67 = 0.0;
  else
    v67 = v74;
  v84.origin.x = v44;
  v84.origin.y = v43;
  v84.size.width = v25;
  v84.size.height = v24;
  v85 = CGRectOffset(v84, v67, v66);
  x = v85.origin.x;
  y = v85.origin.y;
  width = v85.size.width;
  height = v85.size.height;
  v85.origin.x = v62;
  v85.origin.y = v73;
  v85.size.width = v64;
  v85.size.height = v76;
  v86 = CGRectOffset(v85, v67, v66);
  if (a3)
  {
    a3->origin.x = x;
    a3->origin.y = y;
    a3->size.width = width;
    a3->size.height = height;
  }
  if (a4)
    *a4 = v86;

}

- (void)layoutSubviewsOfCell:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)UITableViewCellLayoutManagerValue2;
  -[UITableViewCellLayoutManager layoutSubviewsOfCell:](&v22, sel_layoutSubviewsOfCell_, v4);
  objc_msgSend(v4, "_textLabel:", 0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    if (-[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", v4))
    {
      v7 = 4;
    }
    else
    {
      v7 = 2;
    }
    if (v7 != objc_msgSend(v6, "textAlignment"))
      objc_msgSend(v6, "setTextAlignment:", v7);
    objc_msgSend(v6, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && objc_msgSend(v8, "length"))
    {
      objc_msgSend(v6, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(v4, "contentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", v6);
    }
    else
    {
      objc_msgSend(v6, "removeFromSuperview");
      v11 = v6;
      v6 = 0;
    }

    goto LABEL_13;
  }
LABEL_14:
  objc_msgSend(v4, "_detailTextLabel:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, "font");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pointSize");
    v16 = v15;

    if (v16 == 0.0)
    {
      -[UITableViewCellLayoutManagerValue2 defaultDetailTextLabelFontForCell:](self, "defaultDetailTextLabelFontForCell:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFont:", v17);

    }
    objc_msgSend(v13, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18 && objc_msgSend(v18, "length"))
    {
      objc_msgSend(v13, "superview");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
LABEL_23:

        goto LABEL_24;
      }
      objc_msgSend(v4, "contentView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addSubview:", v13);
    }
    else
    {
      objc_msgSend(v13, "removeFromSuperview");
      v21 = v13;
      v13 = 0;
    }

    goto LABEL_23;
  }
LABEL_24:

}

- (CGSize)intrinsicContentSizeForCell:(id)a3 rowWidth:(double)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  v6 = a3;
  if (-[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", v6))
  {
    v7 = _UITableViewCellLayoutIntrinsicSizeForCellStackingLabels(self, v6, a4);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UITableViewCellLayoutManagerValue2;
    -[UITableViewCellLayoutManager intrinsicContentSizeForCell:rowWidth:](&v13, sel_intrinsicContentSizeForCell_rowWidth_, v6, a4);
  }
  v9 = v7;
  v10 = v8;

  v11 = v9;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

@end
