@implementation PXInboxTableViewCellLayoutCoordinator

- (void)layoutInCell:(id)a3
{
  id v4;

  v4 = a3;
  -[PXInboxTableViewCellLayoutCoordinator _layoutSubviewsInCell:](self, "_layoutSubviewsInCell:", v4);
  -[PXInboxTableViewCellLayoutCoordinator _toggleShownSubviewsInCell:](self, "_toggleShownSubviewsInCell:", v4);

}

- (void)_layoutSubviewsInCell:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  NSString *v13;
  _BOOL4 IsAccessibilityCategory;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double MinX;
  double MaxY;
  double v32;
  double v33;
  void *v34;
  void *v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  id v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v49 = a3;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");

  objc_msgSend(v49, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  +[PXInboxTableViewCellLayoutCoordinator dynamicCellHeight](PXInboxTableViewCellLayoutCoordinator, "dynamicCellHeight");
  v10 = v9;
  v11 = v6 + -10.0;
  objc_msgSend(v49, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferredContentSizeCategory");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v13);

  v15 = (v8 + -60.0) * 0.5;
  objc_msgSend(v49, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "subtitleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 12.0;
  if (!IsAccessibilityCategory)
    v18 = (v8 + -60.0) * 0.5;
  v47 = v18;
  v19 = v11 + -72.0;
  if (IsAccessibilityCategory)
    v20 = v11;
  else
    v20 = v11 + -72.0;
  objc_msgSend(v16, "sizeThatFits:", v20, 1.79769313e308);
  v22 = v21;
  v48 = v20;
  objc_msgSend(v17, "sizeThatFits:", v20, 1.79769313e308);
  v24 = v23;
  +[PXInboxTableViewCellLayoutCoordinator dynamicDistanceFromFirstBaselineToSecondBaseline](PXInboxTableViewCellLayoutCoordinator, "dynamicDistanceFromFirstBaselineToSecondBaseline");
  v26 = v25;
  objc_msgSend(v16, "font");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "descender");
  v29 = v28;

  if (IsAccessibilityCategory)
  {
    v50.origin.x = 10.0;
    v50.origin.y = 12.0;
    v50.size.width = 60.0;
    v50.size.height = 60.0;
    MinX = CGRectGetMinX(v50);
    v51.origin.x = 10.0;
    v51.origin.y = 12.0;
    v51.size.width = 60.0;
    v51.size.height = 60.0;
    MaxY = CGRectGetMaxY(v51);
    v52.origin.x = MinX;
    v52.origin.y = MaxY;
    v52.size.width = v11;
    v52.size.height = v22;
    v32 = CGRectGetMaxY(v52);
  }
  else
  {
    v33 = v26 + v22 + v29;
    v53.size.width = 60.0;
    v53.origin.x = 10.0;
    v53.origin.y = v15;
    v53.size.height = 60.0;
    MinX = CGRectGetMaxX(v53) + 12.0;
    MaxY = (v10 - v33) * 0.5;
    v32 = v10 - MaxY - v24;
    v11 = v19;
  }
  v46 = v32;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "traitCollection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "layoutDirection");

  if (v36 == 1)
  {
    v54.origin.x = 10.0;
    v54.origin.y = v47;
    v54.size.width = 60.0;
    v54.size.height = 60.0;
    CGRectGetWidth(v54);
    v55.origin.x = 10.0;
    v55.origin.y = v47;
    v55.size.width = 60.0;
    v55.size.height = 60.0;
    CGRectGetMinX(v55);
    v56.origin.x = MinX;
    v56.origin.y = MaxY;
    v56.size.width = v11;
    v56.size.height = v22;
    CGRectGetWidth(v56);
    v57.origin.x = MinX;
    v57.origin.y = MaxY;
    v57.size.width = v11;
    v57.size.height = v22;
    CGRectGetMinX(v57);
    v58.origin.x = MinX;
    v58.origin.y = v46;
    v58.size.width = v48;
    v58.size.height = v24;
    CGRectGetWidth(v58);
    v59.origin.x = MinX;
    v59.origin.y = v46;
    v59.size.width = v48;
    v59.size.height = v24;
    CGRectGetMinX(v59);
  }
  PXRectRoundToPixel();
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v44 = v43;
  objc_msgSend(v49, "thumbnailView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setFrame:", v38, v40, v42, v44);

  PXRectRoundToPixel();
  objc_msgSend(v16, "setFrame:");
  PXRectRoundToPixel();
  objc_msgSend(v17, "setFrame:");

}

- (void)_toggleShownSubviewsInCell:(id)a3
{
  id v3;
  uint64_t v4;
  _BOOL8 v6;
  void *v7;
  id v8;

  v3 = a3;
  objc_msgSend(v3, "model");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v8, "inboxModelType");
  v6 = v4 == 2 || v4 == 8;
  objc_msgSend(v3, "thumbnailView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setShowBadge:", v6);
}

+ (double)dynamicCellHeight
{
  void *v2;
  NSString *v3;
  double result;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  UIContentSizeCategoryIsAccessibilityCategory(v3);

  PXScaledValueForTextStyleWithSymbolicTraits();
  return result;
}

+ (double)dynamicDistanceFromFirstBaselineToSecondBaseline
{
  double result;

  PXScaledValueForTextStyleWithSymbolicTraits();
  return result;
}

@end
