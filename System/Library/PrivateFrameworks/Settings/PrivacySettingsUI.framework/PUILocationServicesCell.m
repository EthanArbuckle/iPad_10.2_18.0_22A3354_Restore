@implementation PUILocationServicesCell

- (PUILocationServicesCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  PUILocationServicesCell *v5;
  PUILocationUsageMixin *v6;
  PUILocationUsageMixin *location;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUILocationServicesCell;
  v5 = -[PSSwitchTableCell initWithStyle:reuseIdentifier:specifier:](&v11, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  if (v5)
  {
    v6 = objc_alloc_init(PUILocationUsageMixin);
    location = v5->_location;
    v5->_location = v6;

    -[PUILocationServicesCell contentView](v5, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUILocationUsageMixin usageIndicator](v5->_location, "usageIndicator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  NSString *v10;
  _BOOL4 IsAccessibilityCategory;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  char v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double Height;
  double v25;
  double Width;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  char v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double MaxX;
  double MinX;
  double v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  double v52;
  objc_super v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  v53.receiver = self;
  v53.super_class = (Class)PUILocationServicesCell;
  -[PSSwitchTableCell layoutSubviews](&v53, sel_layoutSubviews);
  -[PUILocationUsageMixin usageIndicator](self->_location, "usageIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80568]);
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;
    -[PUILocationServicesCell traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferredContentSizeCategory");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);

    if (IsAccessibilityCategory)
    {
      objc_msgSend(v4, "frame");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v51 = v18;
      v19 = -[PUILocationServicesCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
      objc_msgSend(v3, "frame");
      v21 = v20;
      v23 = v22;
      objc_msgSend(v4, "frame");
      Height = CGRectGetHeight(v54);
      objc_msgSend(v3, "frame");
      v25 = v8 + (Height - CGRectGetHeight(v55)) * 0.5;
      if ((v19 & 1) != 0)
      {
        objc_msgSend(v4, "frame");
        Width = CGRectGetWidth(v56);
        objc_msgSend(v3, "frame");
        objc_msgSend(v3, "setFrame:", v6 + Width - CGRectGetWidth(v57), v25, v21, v23);
        objc_msgSend(v3, "frame");
        v27 = v13 - (CGRectGetWidth(v58) + 6.0);
      }
      else
      {
        objc_msgSend(v3, "setFrame:", v6, v25, v21, v23);
        objc_msgSend(v3, "frame");
        v27 = v13 + CGRectGetWidth(v63) + 6.0;
      }
      objc_msgSend(v4, "setFrame:", v27, v15, v17, v51);
      goto LABEL_14;
    }
    -[PUILocationServicesCell textLabel](self, "textLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "frame");
    v52 = v29;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v36 = -[PUILocationServicesCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    objc_msgSend(v3, "frame");
    v38 = v37;
    v40 = v39;
    objc_msgSend(v4, "frame");
    v41 = CGRectGetHeight(v59);
    objc_msgSend(v3, "frame");
    v42 = v8 + (v41 - CGRectGetHeight(v60)) * 0.5;
    if ((v36 & 1) != 0)
    {
      objc_msgSend(v3, "setFrame:", 6.0, v42, v38, v40);
      v61.origin.x = 6.0;
      v61.origin.y = v42;
      v61.size.width = v38;
      v61.size.height = v40;
      MaxX = CGRectGetMaxX(v61);
      v62.origin.x = v52;
      v62.origin.y = v31;
      v62.size.width = v33;
      v62.size.height = v35;
      MinX = CGRectGetMinX(v62);
      if (MinX + -6.0 < MaxX)
      {
        v45 = MaxX - MinX + 6.0;
        v46 = v52 + v45;
LABEL_12:
        objc_msgSend(v28, "setFrame:", v46, v31, v33 - v45, v35);
      }
    }
    else
    {
      -[PUILocationServicesCell frame](self, "frame");
      v47 = CGRectGetMaxX(v64) + -15.0 + -6.0;
      v65.origin.x = v6;
      v65.origin.y = v42;
      v65.size.width = v38;
      v65.size.height = v40;
      v48 = v47 - CGRectGetWidth(v65) + -51.0;
      objc_msgSend(v3, "setFrame:", v48, v42, v38, v40);
      v66.origin.x = v48;
      v66.origin.y = v42;
      v66.size.width = v38;
      v66.size.height = v40;
      v49 = CGRectGetMinX(v66);
      v46 = v52;
      v67.origin.x = v52;
      v67.origin.y = v31;
      v67.size.width = v33;
      v67.size.height = v35;
      v50 = CGRectGetMaxX(v67);
      if (v50 + 6.0 > v49)
      {
        v45 = v50 - v49 + 6.0;
        goto LABEL_12;
      }
    }

LABEL_14:
  }

}

- (PUILocationUsageMixin)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

@end
