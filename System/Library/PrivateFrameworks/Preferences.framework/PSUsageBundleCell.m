@implementation PSUsageBundleCell

- (BOOL)canReload
{
  return 1;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PSUsageBundleCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v10, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", CFSTR("DELETING"), v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v5, "BOOLValue");
  if ((_DWORD)v4)
  {
    PS_LocalizedString(CFSTR("DELETING"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUsageBundleCell textLabel](self, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    -[PSUsageBundleCell imageView](self, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", 0.5);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, 0.0, 20.0, 43.0);
    -[PSUsageBundleCell setAccessoryView:](self, "setAccessoryView:", v9);

    -[PSUsageBundleCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
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
  double v21;
  double v22;
  double v23;
  int v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double MinX;
  double Width;
  double v37;
  double MaxX;
  CGFloat v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  objc_super v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v45.receiver = self;
  v45.super_class = (Class)PSUsageBundleCell;
  -[PSTableCell layoutSubviews](&v45, sel_layoutSubviews);
  -[PSUsageBundleCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[PSUsageBundleCell detailTextLabel](self, "detailTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v43 = v12;
  v44 = v11;
  v14 = v13;

  -[PSUsageBundleCell textLabel](self, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = -[PSUsageBundleCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[PSUsageBundleCell detailTextLabel](self, "detailTextLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sizeThatFits:", v5, v7);
  v27 = v26;

  if (v14 < v27)
  {
    v28 = ceil(v27 - v14);
    v14 = v14 + v28;
    v29 = v10 - v28;
    if (v24)
      v30 = v10;
    else
      v30 = v10 - v28;
    v42 = v30;
    if ((v24 & 1) != 0)
    {
      v31 = v17;
      v32 = v19;
      v33 = v21;
      v34 = v23;
    }
    else
    {
      v31 = v29;
      v34 = v43;
      v32 = v44;
      v33 = v14;
    }
    MinX = CGRectGetMinX(*(CGRect *)&v31);
    v46.origin.x = v17;
    v46.origin.y = v19;
    v46.size.width = v21;
    v46.size.height = v23;
    if (MinX - CGRectGetMaxX(v46) >= 6.0)
    {
      v29 = v42;
      goto LABEL_14;
    }
    v47.origin.x = v17;
    v47.origin.y = v19;
    v47.size.width = v21;
    v47.size.height = v23;
    Width = CGRectGetWidth(v47);
    if ((v24 & 1) == 0)
    {
      v51.origin.x = v29;
      v51.size.height = v43;
      v51.origin.y = v44;
      v51.size.width = v14;
      v39 = CGRectGetMinX(v51) + -6.0;
      v52.origin.x = v17;
      v52.origin.y = v19;
      v52.size.width = v21;
      v52.size.height = v23;
      v21 = v39 - CGRectGetMinX(v52);
      goto LABEL_14;
    }
    v37 = Width;
    v48.origin.x = v17;
    v48.origin.y = v19;
    v48.size.width = v21;
    v48.size.height = v23;
    MaxX = CGRectGetMaxX(v48);
    v49.origin.x = v10;
    v49.size.height = v43;
    v49.origin.y = v44;
    v49.size.width = v14;
    v21 = MaxX - CGRectGetMaxX(v49) + -6.0;
    v50.origin.x = v17;
    v50.origin.y = v19;
    v50.size.width = v21;
    v50.size.height = v23;
    v17 = v17 + v37 - CGRectGetWidth(v50);
  }
  v29 = v10;
LABEL_14:
  -[PSUsageBundleCell detailTextLabel](self, "detailTextLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFrame:", v29, v44, v14, v43);

  -[PSUsageBundleCell textLabel](self, "textLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setFrame:", v17, v19, v21, v23);

}

@end
