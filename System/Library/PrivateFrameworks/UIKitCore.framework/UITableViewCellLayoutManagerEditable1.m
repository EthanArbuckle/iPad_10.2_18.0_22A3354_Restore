@implementation UITableViewCellLayoutManagerEditable1

- (double)defaultTextFieldFontSizeForCell:(id)a3
{
  double result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellLayoutManagerEditable1;
  -[UITableViewCellLayoutManager defaultDetailTextLabelFontSizeForCell:](&v4, sel_defaultDetailTextLabelFontSizeForCell_, a3);
  return result;
}

- (void)layoutSubviewsOfCell:(id)a3
{
  _DWORD *v4;
  void *v5;
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
  double *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  int v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
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
  double v57;
  void *v58;
  double v59;
  CGFloat v60;
  CGFloat MaxX;
  double v62;
  double v63;
  double v64;
  double v65;
  CGFloat v66;
  CGFloat v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  CGFloat v73;
  double width;
  double height;
  double x;
  double y;
  double v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  double v83;
  double v84;
  double rect;
  double recta;
  CGFloat rect_8;
  CGFloat rect_16;
  double rect_24;
  double rect_24a;
  objc_super v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;

  v4 = a3;
  v91.receiver = self;
  v91.super_class = (Class)UITableViewCellLayoutManagerEditable1;
  -[UITableViewCellLayoutManager layoutSubviewsOfCell:](&v91, sel_layoutSubviewsOfCell_, v4);
  objc_msgSend(v4, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  objc_msgSend(v4, "bounds");
  -[UITableViewCellLayoutManager textRectForCell:rowWidth:forSizing:](self, "textRectForCell:rowWidth:forSizing:", v4, 0, CGRectGetWidth(v92));
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (double *)MEMORY[0x1E0C9D820];
  objc_msgSend(v4, "_textLabel:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "font");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pointSize");
    v21 = v20;

    if (v21 == 0.0)
    {
      -[UITableViewCellLayoutManager defaultTextLabelFontForCell:](self, "defaultTextLabelFontForCell:", v4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFont:", v22);

    }
    objc_msgSend(v18, "text");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23 && objc_msgSend(v23, "length"))
    {
      objc_msgSend(v18, "superview");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        objc_msgSend(v4, "contentView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addSubview:", v18);

      }
    }
    else
    {
      objc_msgSend(v18, "removeFromSuperview");
    }

  }
  v27 = v16[1];
  objc_msgSend(v4, "_editableTextField:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  v30 = v27;
  if (v28)
  {
    objc_msgSend(v28, "font");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "pointSize");
    v33 = v32;

    if (v33 == 0.0)
    {
      -[UITableViewCellLayoutManagerEditable1 defaultTextFieldFontSizeForCell:](self, "defaultTextFieldFontSizeForCell:", v4);
      objc_msgSend(off_1E167A828, "systemFontOfSize:");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setFont:", v34);

    }
    objc_msgSend(v29, "setFrame:", 0.0, 0.0, v13, v15);
    objc_msgSend(v29, "sizeThatFits:", v13, v15);
    v30 = v35;
    objc_msgSend(v4, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSubview:", v29);

  }
  rect_24 = v15;
  v37 = *v16;
  v38 = v27;
  v39 = *v16;
  if (v18)
  {
    -[UITableViewCellLayoutManager optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:](self, "optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:", v18, 0, 0, v9, v11, v13, rect_24);
    v39 = v40;
  }
  v84 = v38;
  if (v29)
  {
    if (-[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", v4))
    {
      v27 = v30;
      v37 = v13;
    }
    else
    {
      if (v39 <= 0.0)
        v41 = 0.0;
      else
        v41 = v39 + 6.0;
      v93.origin.x = v9;
      v93.origin.y = v11;
      v93.size.width = v13;
      v93.size.height = rect_24;
      v37 = CGRectGetWidth(v93) - v41;
      v27 = v30;
    }
  }
  v42 = v4[30];
  v83 = v7;
  rect_16 = v27;
  if (-[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", v4))
  {
    if ((v42 & 0x80000) != 0)
    {
      v94.origin.x = v9;
      v94.origin.y = v11;
      v94.size.width = v13;
      v94.size.height = rect_24;
      v60 = CGRectGetMaxX(v94) - v39;
      v95.origin.x = v9;
      v95.origin.y = v11;
      v95.size.width = v13;
      v95.size.height = rect_24;
      MaxX = CGRectGetMaxX(v95);
      v48 = v60;
      v43 = v37;
      v44 = MaxX - v37;
      v47 = 0.0;
      v45 = v84;
      v46 = v84 + 0.0;
    }
    else
    {
      v43 = v37;
      v44 = 0.0;
      v45 = v84;
      v46 = v84 + 0.0;
      v47 = 0.0;
      v48 = 0.0;
    }
  }
  else
  {
    rect_8 = v13;
    v43 = v37;
    objc_msgSend(v18, "font");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "ascender");
    v51 = v50;
    objc_msgSend(v29, "font");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "ascender");
    v54 = v53;

    if (v51 >= v54)
    {
      objc_msgSend(v18, "font");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "ascender");
      v63 = v62;
      objc_msgSend(v29, "font");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "ascender");
      v46 = round(v63 - v64);
      v47 = 0.0;
    }
    else
    {
      objc_msgSend(v29, "font");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "ascender");
      v57 = v56;
      objc_msgSend(v18, "font");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "ascender");
      v47 = round(v57 - v59);
      v46 = 0.0;
    }

    if ((v42 & 0x80000) != 0)
    {
      v96.origin.x = v9;
      v96.origin.y = v11;
      v96.size.width = rect_8;
      v96.size.height = rect_24;
      v48 = CGRectGetMaxX(v96) - v39;
      if (v39 <= 0.0)
      {
        v97.origin.x = v9;
        v97.origin.y = v11;
        v65 = v48;
        v97.size.width = rect_8;
        v97.size.height = rect_24;
        v66 = CGRectGetMaxX(v97);
        v48 = v65;
        v44 = v66 - v37;
      }
      else
      {
        v44 = v48 - v37 + -6.0;
      }
      v45 = v84;
    }
    else
    {
      v48 = 0.0;
      if (v39 <= 0.0)
        v44 = 0.0;
      else
        v44 = v39 + 0.0 + 6.0;
      v45 = v84;
    }
  }
  rect = v48;
  v98.origin.x = v48;
  v98.origin.y = v47;
  v98.size.width = v39;
  v98.size.height = v45;
  v102.origin.x = v44;
  v102.origin.y = v46;
  v67 = v43;
  v102.size.width = v43;
  v102.size.height = rect_16;
  v99 = CGRectUnion(v98, v102);
  v68 = ceil((rect_24 - v99.size.height) * 0.5);
  v69 = v47;
  v70 = 0.0;
  if ((*(_QWORD *)&v42 & 0x80000) != 0)
    v9 = 0.0;
  v71 = rect;
  v72 = v39;
  v73 = v45;
  v100 = CGRectOffset(*(CGRect *)(&v69 - 1), v9, v68);
  rect_24a = v100.origin.x;
  recta = v100.origin.y;
  width = v100.size.width;
  height = v100.size.height;
  v100.origin.x = v44;
  v100.origin.y = v46;
  v100.size.width = v67;
  v100.size.height = rect_16;
  v101 = CGRectOffset(v100, v9, v68);
  x = v101.origin.x;
  y = v101.origin.y;
  v78 = v101.size.width;
  v79 = v101.size.height;
  if (!-[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", v4))
  {
    objc_msgSend(v4, "textFieldOffset");
    v70 = v80;
  }
  if ((v42 & 0x80000) != 0)
  {
    if (x + v78 > v83 - v70)
      v78 = v78 - (x + v78 - (v83 - v70));
  }
  else if (x < v70)
  {
    v78 = v78 - (v70 - x);
    x = v70;
  }
  objc_msgSend(v18, "superview", *(_QWORD *)&v83);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  if (v81)
    objc_msgSend(v18, "setFrame:", rect_24a, recta, width, height);
  objc_msgSend(v29, "superview");
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  if (v82)
    objc_msgSend(v29, "setFrame:", x, y, v78, v79);

}

- (id)detailTextLabelForCell:(id)a3
{
  return 0;
}

- (id)editableTextFieldForCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UITableViewCellLayoutManagerEditable1;
  -[UITableViewCellLayoutManager defaultEditableTextFieldForCell:](&v8, sel_defaultEditableTextFieldForCell_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(off_1E167A828, "systemFontOfSize:", 17.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  +[UIColor clearColor](UIColor, "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v6);

  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__textFieldStartEditing_, 0x10000);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__textFieldEndEditing_, 0x40000);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__textFieldEndEditingOnReturn_, 0x80000);
  return v4;
}

- (CGSize)intrinsicContentSizeForCell:(id)a3 rowWidth:(double)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGSize result;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UITableViewCellLayoutManagerEditable1;
  -[UITableViewCellLayoutManager intrinsicContentSizeForCell:rowWidth:](&v15, sel_intrinsicContentSizeForCell_rowWidth_, v6, a4);
  v8 = v7;
  v10 = v9;
  if (-[UITableViewCellLayoutManager shouldApplyAccessibilityLargeTextLayoutForCell:](self, "shouldApplyAccessibilityLargeTextLayoutForCell:", v6))
  {
    objc_msgSend(v6, "_editableTextField:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sizeThatFits:", a4, 3.40282347e38);
    v10 = v10 + v12;

  }
  v13 = v8;
  v14 = v10;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v3, "superview");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
    }
    while (v4);
  }
  objc_msgSend(v3, "_tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_updateCell:withValue:", v3, v6);

}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)_textFieldStartEditing:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__textValueChanged_, CFSTR("UITextFieldTextDidChangeNotification"), v5);

}

- (void)_textFieldEndEditing:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("UITextFieldTextDidChangeNotification"), v5);

}

@end
