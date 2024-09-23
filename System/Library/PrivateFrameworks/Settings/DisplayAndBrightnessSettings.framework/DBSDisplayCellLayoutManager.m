@implementation DBSDisplayCellLayoutManager

- (CGRect)standardLayoutImageViewFrameForCell:(id)a3 forSizing:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  CGFloat v11;
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
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  CGFloat v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  objc_super v34;
  CGRect v35;
  CGRect result;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceLayoutDirection");

  objc_msgSend(v6, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v34.receiver = self;
  v34.super_class = (Class)DBSDisplayCellLayoutManager;
  -[UITableViewCellLayoutManager standardLayoutImageViewFrameForCell:forSizing:](&v34, sel_standardLayoutImageViewFrameForCell_forSizing_, v6, v4);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v8 == 1)
    {
      v35.origin.x = v11;
      v35.origin.y = v13;
      v35.size.width = v15;
      v35.size.height = v17;
      v26 = CGRectGetWidth(v35) + -60.0;
      objc_msgSend(v6, "contentView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "layoutMargins");
      v19 = v26 - v28;
    }
    else
    {
      objc_msgSend(v6, "contentView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "layoutMargins");
      v19 = v29;
    }

    *(double *)&v23 = 60.0;
  }

  v30 = v19;
  v31 = v21;
  v32 = *(double *)&v23;
  v33 = v25;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

@end
