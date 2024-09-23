@implementation UITableViewCellLayoutManagerValue1

- (void)getTextLabelRect:(CGRect *)a3 detailTextLabelRect:(CGRect *)a4 forCell:(id)a5 rowWidth:(double)a6 forSizing:(BOOL)a7
{
  _BOOL8 v7;
  double v12;
  double v13;
  double v14;
  double v15;
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
  double v26;
  double v27;
  _DWORD *v28;
  _BOOL4 v29;
  double v30;
  double v31;
  double v32;
  double v33;
  int v34;
  double v35;
  CGFloat MinX;
  double v37;
  double v38;
  void *v39;
  uint64_t v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  double v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat x;
  CGFloat width;
  CGFloat height;
  CGFloat v66;
  CGFloat v67;
  double v68;
  CGFloat y;
  id v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v7 = a7;
  v70 = a5;
  -[UITableViewCellLayoutManager textRectForCell:rowWidth:forSizing:](self, "textRectForCell:rowWidth:forSizing:", v70, v7, a6);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v70, "_textLabel:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "_detailTextLabel:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x1E0C9D820];
  v23 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v24 = v23;
  v25 = *MEMORY[0x1E0C9D820];
  if (v20)
  {
    -[UITableViewCellLayoutManager optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:](self, "optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:", v20, 1, 0, v13, v15, v17, v19);
    v25 = v26;
    v24 = v27;
  }
  v28 = v70;
  if (v21)
  {
    v29 = -[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", v70);
    v30 = v17 - v25 + -6.0;
    if (v29)
      v30 = v17;
    if (v30 >= 0.0)
      v31 = v30;
    else
      v31 = 0.0;
    -[UITableViewCellLayoutManager optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:](self, "optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:", v21, 0, 0, 0.0, 0.0, v31, v19);
    v28 = v70;
    v22 = v32;
    v23 = v33;
  }
  v34 = v28[30];
  v67 = v23;
  v68 = v25;
  if (-[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:"))
  {
    if ((v34 & 0x80000) != 0)
    {
      v71.origin.x = v13;
      v71.origin.y = v15;
      v71.size.width = v17;
      v71.size.height = v19;
      v52 = CGRectGetMaxX(v71) - v25;
      v72.origin.x = v13;
      v72.origin.y = v15;
      v72.size.width = v17;
      v72.size.height = v19;
      v35 = v22;
      MinX = CGRectGetMaxX(v72) - v22;
      v38 = 0.0;
      v37 = v24 + 0.0;
      goto LABEL_23;
    }
    v35 = v22;
    MinX = 0.0;
    v37 = v24 + 0.0;
    v38 = 0.0;
    goto LABEL_21;
  }
  v66 = v15;
  v35 = v22;
  objc_msgSend(v70, "traitCollection");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "userInterfaceIdiom");

  v37 = 0.0;
  v38 = 0.0;
  if (v40 != 3)
  {
    objc_msgSend(v20, "font");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "ascender");
    v43 = v42;
    objc_msgSend(v21, "font");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "ascender");
    v46 = v45;

    if (v43 >= v46)
    {
      objc_msgSend(v20, "font");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "ascender");
      v54 = v53;
      objc_msgSend(v21, "font");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "ascender");
      v37 = round(v54 - v55);
    }
    else
    {
      objc_msgSend(v21, "font");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "ascender");
      v49 = v48;
      objc_msgSend(v20, "font");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "ascender");
      v38 = round(v49 - v51);
      v37 = 0.0;
    }

  }
  if ((v34 & 0x80000) == 0)
  {
    MinX = v17 - v35;
LABEL_21:
    v52 = 0.0;
    goto LABEL_23;
  }
  v73.origin.x = v13;
  v73.origin.y = v66;
  v73.size.width = v17;
  v73.size.height = v19;
  v56 = CGRectGetMaxX(v73) - v68;
  v74.origin.x = v13;
  v74.origin.y = v66;
  v52 = v56;
  v74.size.width = v17;
  v74.size.height = v19;
  MinX = CGRectGetMinX(v74);
LABEL_23:
  v75.origin.x = v52;
  v75.origin.y = v38;
  v75.size.width = v68;
  v75.size.height = v24;
  v57 = v52;
  v58 = MinX;
  v59 = v37;
  v60 = v35;
  v61 = v67;
  v76 = CGRectUnion(v75, *(CGRect *)&MinX);
  v62 = ceil((v19 - v76.size.height) * 0.5);
  if ((*(_QWORD *)&v34 & 0x80000) != 0)
    v13 = 0.0;
  v77.origin.x = v57;
  v77.origin.y = v38;
  v77.size.width = v68;
  v77.size.height = v24;
  v78 = CGRectOffset(v77, v13, v62);
  x = v78.origin.x;
  y = v78.origin.y;
  width = v78.size.width;
  height = v78.size.height;
  v78.origin.x = v58;
  v78.origin.y = v37;
  v78.size.width = v35;
  v78.size.height = v67;
  v79 = CGRectOffset(v78, v13, v62);
  if (a3)
  {
    a3->origin.x = x;
    a3->origin.y = y;
    a3->size.width = width;
    a3->size.height = height;
  }
  if (a4)
    *a4 = v79;

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
    v13.super_class = (Class)UITableViewCellLayoutManagerValue1;
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

- (void)layoutSubviewsOfCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)UITableViewCellLayoutManagerValue1;
  -[UITableViewCellLayoutManager layoutSubviewsOfCell:](&v26, sel_layoutSubviewsOfCell_, v4);
  objc_msgSend(v4, "_textLabel:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pointSize");
    v9 = v8;

    if (v9 == 0.0)
    {
      -[UITableViewCellLayoutManager defaultTextLabelFontForCell:](self, "defaultTextLabelFontForCell:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFont:", v10);

    }
    objc_msgSend(v6, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 && objc_msgSend(v11, "length"))
    {
      objc_msgSend(v6, "superview");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
LABEL_10:

        goto LABEL_11;
      }
      objc_msgSend(v4, "contentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSubview:", v6);
    }
    else
    {
      objc_msgSend(v6, "removeFromSuperview");
      v14 = v6;
      v6 = 0;
    }

    goto LABEL_10;
  }
LABEL_11:
  objc_msgSend(v4, "_detailTextLabel:", 0);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    if (-[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", v4))
    {
      v17 = 4;
    }
    else
    {
      v17 = 2;
    }
    if (v17 != objc_msgSend(v16, "textAlignment"))
      objc_msgSend(v16, "setTextAlignment:", v17);
    objc_msgSend(v16, "font");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pointSize");
    v20 = v19;

    if (v20 == 0.0)
    {
      -[UITableViewCellLayoutManagerValue1 defaultDetailTextLabelFontForCell:](self, "defaultDetailTextLabelFontForCell:", v4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFont:", v21);

    }
    objc_msgSend(v16, "text");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22 && objc_msgSend(v22, "length"))
    {
      objc_msgSend(v16, "superview");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
LABEL_25:

        goto LABEL_26;
      }
      objc_msgSend(v4, "contentView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addSubview:", v16);
    }
    else
    {
      objc_msgSend(v16, "removeFromSuperview");
      v25 = v16;
      v16 = 0;
    }

    goto LABEL_25;
  }
LABEL_26:

}

- (id)detailTextLabelForCell:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v15;

  v4 = a3;
  v5 = objc_opt_class();
  v15.receiver = self;
  v15.super_class = (Class)UITableViewCellLayoutManagerValue1;
  -[UITableViewCellLayoutManager defaultLabelForCell:ofClass:](&v15, sel_defaultLabelForCell_ofClass_, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_constants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "_cellStyle");
  objc_msgSend(v4, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultDetailTextColorForCellStyle:traitCollection:state:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v11);

  -[UITableViewCellLayoutManagerValue1 defaultDetailTextLabelFontForCell:](self, "defaultDetailTextLabelFontForCell:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v12);

  LODWORD(self) = -[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", v4);
  if ((_DWORD)self)
    v13 = 4;
  else
    v13 = 2;
  objc_msgSend(v6, "setTextAlignment:", v13);
  return v6;
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

- (id)textLabelForCell:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellLayoutManagerValue1;
  -[UITableViewCellLayoutManager defaultLabelForCell:](&v4, sel_defaultLabelForCell_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)defaultTextLabelFontSizeForCell:(id)a3
{
  return 17.0;
}

- (double)defaultDetailTextLabelFontSizeForCell:(id)a3
{
  return 17.0;
}

@end
