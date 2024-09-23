@implementation PUILocationServicesSubDirectoryCell

- (PUILocationServicesSubDirectoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  PUILocationServicesSubDirectoryCell *v5;
  PUILocationUsageMixin *v6;
  PUILocationUsageMixin *location;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUILocationServicesSubDirectoryCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v11, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  if (v5)
  {
    v6 = objc_alloc_init(PUILocationUsageMixin);
    location = v5->_location;
    v5->_location = v6;

    -[PUILocationServicesSubDirectoryCell contentView](v5, "contentView");
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
  void *v4;
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
  double v43;
  CGFloat v44;
  double MaxX;
  double MinX;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGFloat v56;
  double v57;
  double v58;
  objc_super v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v59.receiver = self;
  v59.super_class = (Class)PUILocationServicesSubDirectoryCell;
  -[PSTableCell layoutSubviews](&v59, sel_layoutSubviews);
  -[PUILocationUsageMixin usageIndicator](self->_location, "usageIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isHidden") & 1) == 0)
  {
    -[PUILocationServicesSubDirectoryCell detailTextLabel](self, "detailTextLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;
    -[PUILocationServicesSubDirectoryCell traitCollection](self, "traitCollection");
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
      v57 = v18;
      v19 = -[PUILocationServicesSubDirectoryCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
      objc_msgSend(v3, "frame");
      v21 = v20;
      v23 = v22;
      objc_msgSend(v4, "frame");
      Height = CGRectGetHeight(v60);
      objc_msgSend(v3, "frame");
      v25 = v8 + (Height - CGRectGetHeight(v61)) * 0.5;
      if ((v19 & 1) != 0)
      {
        objc_msgSend(v4, "frame");
        Width = CGRectGetWidth(v62);
        objc_msgSend(v3, "frame");
        objc_msgSend(v3, "setFrame:", v6 + Width - CGRectGetWidth(v63), v25, v21, v23);
        objc_msgSend(v3, "frame");
        v27 = v13 - (CGRectGetWidth(v64) + 6.0);
      }
      else
      {
        objc_msgSend(v3, "setFrame:", v6, v25, v21, v23);
        objc_msgSend(v3, "frame");
        v27 = v13 + CGRectGetWidth(v70) + 6.0;
      }
      objc_msgSend(v4, "setFrame:", v27, v15, v17, v57);
      goto LABEL_19;
    }
    -[PUILocationServicesSubDirectoryCell textLabel](self, "textLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "frame");
    v58 = v29;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v36 = -[PUILocationServicesSubDirectoryCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    objc_msgSend(v3, "frame");
    v38 = v37;
    v40 = v39;
    objc_msgSend(v4, "frame");
    v41 = CGRectGetHeight(v65);
    objc_msgSend(v3, "frame");
    v42 = v8 + (v41 - CGRectGetHeight(v66)) * 0.5;
    objc_msgSend(v4, "frame");
    v43 = CGRectGetWidth(v67);
    if ((v36 & 1) != 0)
    {
      v44 = v6 + v43 + 6.0;
      objc_msgSend(v3, "setFrame:", v44, v42, v38, v40);
      v68.origin.x = v44;
      v68.origin.y = v42;
      v68.size.width = v38;
      v68.size.height = v40;
      MaxX = CGRectGetMaxX(v68);
      v69.origin.x = v58;
      v69.origin.y = v31;
      v69.size.width = v33;
      v69.size.height = v35;
      MinX = CGRectGetMinX(v69);
      if (MinX + -6.0 >= MaxX)
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      v47 = MaxX - MinX + 6.0;
      v48 = v58 + v47;
    }
    else
    {
      if (v43 >= 51.0)
        v49 = v43;
      else
        v49 = 51.0;
      -[PUILocationServicesSubDirectoryCell frame](self, "frame", *(_QWORD *)&v31);
      v50 = CGRectGetMaxX(v71) + -15.0 + -6.0;
      v72.origin.x = v6;
      v72.origin.y = v42;
      v72.size.width = v38;
      v72.size.height = v40;
      v51 = v50 - CGRectGetWidth(v72) - v49;
      v73.origin.x = v51;
      v73.origin.y = v42;
      v73.size.width = v38;
      v73.size.height = v40;
      v52 = CGRectGetMaxX(v73);
      objc_msgSend(v4, "frame");
      v53 = CGRectGetMinX(v74);
      if (v53 - v52 < 6.0)
      {
        v75.origin.x = v51;
        v75.origin.y = v42;
        v75.size.width = v38;
        v75.size.height = v40;
        v51 = v53 - CGRectGetWidth(v75) + -6.0;
      }
      objc_msgSend(v3, "setFrame:", v51, v42, v38, v40);
      v76.origin.x = v51;
      v76.origin.y = v42;
      v76.size.width = v38;
      v76.size.height = v40;
      v54 = CGRectGetMinX(v76);
      v48 = v58;
      v77.origin.x = v58;
      v77.origin.y = v56;
      v77.size.width = v33;
      v77.size.height = v35;
      v55 = CGRectGetMaxX(v77);
      if (v55 + 6.0 <= v54)
        goto LABEL_18;
      v31 = v56;
      v47 = v55 - v54 + 6.0;
    }
    objc_msgSend(v28, "setFrame:", v48, v31, v33 - v47, v35);
    goto LABEL_18;
  }
LABEL_20:

}

- (BOOL)canReload
{
  return 1;
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
