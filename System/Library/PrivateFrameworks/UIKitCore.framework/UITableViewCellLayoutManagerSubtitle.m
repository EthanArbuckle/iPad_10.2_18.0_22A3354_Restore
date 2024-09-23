@implementation UITableViewCellLayoutManagerSubtitle

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
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UITableViewCellLayoutManagerSubtitle;
  -[UITableViewCellLayoutManager layoutSubviewsOfCell:](&v25, sel_layoutSubviewsOfCell_, v4);
  objc_msgSend(v4, "_textLabel:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
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

      if (!v13)
      {
        objc_msgSend(v4, "contentView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSubview:", v6);

      }
    }
    else
    {
      objc_msgSend(v6, "removeFromSuperview");
    }

  }
  objc_msgSend(v4, "_detailTextLabel:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "font");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pointSize");
    v19 = v18;

    if (v19 == 0.0)
    {
      -[UITableViewCellLayoutManagerSubtitle defaultDetailTextLabelFontForCell:](self, "defaultDetailTextLabelFontForCell:", v4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFont:", v20);

    }
    objc_msgSend(v16, "text");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21 && objc_msgSend(v21, "length"))
    {
      objc_msgSend(v16, "superview");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        objc_msgSend(v4, "contentView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addSubview:", v16);

      }
    }
    else
    {
      objc_msgSend(v16, "removeFromSuperview");
    }

  }
}

- (id)imageViewForCell:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellLayoutManagerSubtitle;
  -[UITableViewCellLayoutManager defaultImageViewForCell:](&v4, sel_defaultImageViewForCell_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)textLabelForCell:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellLayoutManagerSubtitle;
  -[UITableViewCellLayoutManager defaultLabelForCell:](&v4, sel_defaultLabelForCell_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)detailTextLabelForCell:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v5 = objc_opt_class();
  v15.receiver = self;
  v15.super_class = (Class)UITableViewCellLayoutManagerSubtitle;
  -[UITableViewCellLayoutManager defaultLabelForCell:ofClass:](&v15, sel_defaultLabelForCell_ofClass_, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_constants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultDetailTextFontForCellStyle:", objc_msgSend(v4, "_cellStyle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v9);

  v10 = objc_msgSend(v4, "_cellStyle");
  objc_msgSend(v4, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[UICellConfigurationState _readonlyCellState:]((uint64_t)UICellConfigurationState, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultDetailTextColorForCellStyle:traitCollection:state:", v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v13);

  return v6;
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

- (double)defaultDetailTextLabelFontSizeForCell:(id)a3
{
  return 12.0;
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

- (double)_textLabelYAdjustmentForCell:(id)a3 totalTextRect:(CGRect)a4
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  double v18;

  v4 = a3;
  v5 = 0.0;
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(v4, "_constants");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "defaultTextLabelFontForCellStyle:", objc_msgSend(v4, "style"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pointSize");

    objc_msgSend(v4, "_textLabel:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "font");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pointSize");

    v10 = v4;
    objc_msgSend(v10, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if (v12 == 6)
    {
      objc_msgSend(v10, "_detailTextLabel:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "text");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length") != 0;

      objc_msgSend(v10, "_constants");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_tableView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "defaultRowHeightForTableView:cellStyle:hasDetailText:", v17, objc_msgSend(v10, "style"), v15);

    }
    UIRoundToViewScale(v10);
    v5 = v18;

  }
  return v5;
}

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
  double v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double y;
  CGFloat x;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  CGFloat height;
  CGFloat width;
  CGFloat rect;
  double rect_8;
  CGFloat rect_8a;
  double rect_16;
  double rect_24;
  _DWORD *v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v7 = a7;
  v52 = a5;
  -[UITableViewCellLayoutManager textRectForCell:rowWidth:forSizing:](self, "textRectForCell:rowWidth:forSizing:", v52, v7, a6);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v52, "_textLabel:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "_detailTextLabel:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x1E0C9D820];
  v22 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v24 = v22;
  v25 = *MEMORY[0x1E0C9D820];
  if (v20)
  {
    -[UITableViewCellLayoutManager optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:](self, "optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:", v20, 0, 1, v13, v15, v17, v19);
    v25 = v26;
  }
  rect_8 = v24;
  if (v21)
  {
    -[UITableViewCellLayoutManager optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:](self, "optimumSizeForLabel:inTotalTextRect:minimizeWidthOnVerticalOverflow:preferSingleLineWidth:", v21, 0, 1, v13, v15, v17, v19);
    v23 = v27;
    v22 = v28;
  }
  rect_16 = v17;
  rect_24 = v15;
  v29 = v13;
  v30 = 0.0;
  v31 = 0.0;
  if ((v52[30] & 0x80000) != 0)
  {
    v53.origin.x = v13;
    v53.origin.y = v15;
    v53.size.width = rect_16;
    v53.size.height = v19;
    v31 = CGRectGetMaxX(v53) - v25;
    v54.origin.x = v13;
    v54.origin.y = v15;
    v54.size.width = rect_16;
    v54.size.height = v19;
    v30 = CGRectGetMaxX(v54) - v23;
    v29 = 0.0;
  }
  rect = v30;
  v44 = v13;
  v32 = rect_8 + 0.0;
  v55.origin.y = 0.0;
  v55.origin.x = v31;
  v55.size.width = v25;
  v55.size.height = rect_8;
  v33 = rect_8 + 0.0;
  v34 = v23;
  v35 = v22;
  v56 = CGRectUnion(v55, *(CGRect *)&v30);
  v43 = v19;
  v36 = ceil((v19 - v56.size.height) * 0.5);
  v56.origin.y = 0.0;
  v56.origin.x = v31;
  v56.size.width = v25;
  v56.size.height = rect_8;
  v57 = CGRectOffset(v56, v29, v36);
  rect_8a = v57.origin.x;
  y = v57.origin.y;
  height = v57.size.height;
  width = v57.size.width;
  v57.origin.x = rect;
  v57.origin.y = v32;
  v57.size.width = v23;
  v57.size.height = v22;
  v58 = CGRectOffset(v57, v29, v36);
  x = v58.origin.x;
  v39 = v58.origin.y;
  v40 = v58.size.width;
  v41 = v58.size.height;
  if (v22 > 0.0)
  {
    -[UITableViewCellLayoutManagerSubtitle _textLabelYAdjustmentForCell:totalTextRect:](self, "_textLabelYAdjustmentForCell:totalTextRect:", v52, v44, rect_24, rect_16, v43);
    y = y + v42;
  }
  if (a3)
  {
    a3->origin.x = rect_8a;
    a3->origin.y = y;
    a3->size.width = width;
    a3->size.height = height;
  }
  if (a4)
  {
    a4->origin.x = x;
    a4->origin.y = v39;
    a4->size.width = v40;
    a4->size.height = v41;
  }

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
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    v7 = _UITableViewCellLayoutIntrinsicSizeForCellStackingLabels(self, v6, a4);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UITableViewCellLayoutManagerSubtitle;
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
