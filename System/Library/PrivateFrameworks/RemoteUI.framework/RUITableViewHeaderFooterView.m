@implementation RUITableViewHeaderFooterView

- (BOOL)_useLegacyLayout
{
  void *v2;
  BOOL v3;

  -[RUITableViewHeaderFooterView tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "style") != 2;

  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
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
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)RUITableViewHeaderFooterView;
  -[RUITableViewHeaderFooterView layoutSubviews](&v46, sel_layoutSubviews);
  -[RUITableViewHeaderFooterView headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[RUITableViewHeaderFooterView footerView](self, "footerView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(v6, "bounds");
  if (-[RUITableViewHeaderFooterView _useLegacyLayout](self, "_useLegacyLayout"))
  {
    -[RUITableViewHeaderFooterView contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[RUITableViewHeaderFooterView insetsForHeaderFooter](self, "insetsForHeaderFooter");
    v17 = v9 + v16;
    v19 = v11 + v18;
    v21 = v13 - (v16 + v20);
    v23 = v15 - (v18 + v22);
    -[RUITableViewHeaderFooterView contentView](self, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

    -[RUITableViewHeaderFooterView contentView](self, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bounds");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
  }
  else
  {
    v34 = *MEMORY[0x24BEBE158];
    v35 = *(double *)(MEMORY[0x24BEBE158] + 16);
    -[RUITableViewHeaderFooterView contentView](self, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "layoutMargins");
    v38 = v37;

    -[RUITableViewHeaderFooterView contentView](self, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "layoutMargins");
    v41 = v40;

    -[RUITableViewHeaderFooterView contentView](self, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bounds");
    v27 = v38 + v42;
    v29 = v34 + v43;
    v31 = v44 - (v38 + v41);
    v33 = v45 - (v34 + v35);
  }

  objc_msgSend(v6, "setFrame:", v27, v29, v31, v33);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
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
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[RUITableViewHeaderFooterView headerView](self, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

    goto LABEL_4;
  }
  -[RUITableViewHeaderFooterView footerView](self, "footerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_4:
    if (-[RUITableViewHeaderFooterView _useLegacyLayout](self, "_useLegacyLayout"))
    {
      -[RUITableViewHeaderFooterView insetsForHeaderFooter](self, "insetsForHeaderFooter");
      v10 = v9;
      v12 = v11;
      v14 = v13;
    }
    else
    {
      v10 = *MEMORY[0x24BEBE158];
      v15 = *(double *)(MEMORY[0x24BEBE158] + 8);
      v14 = *(double *)(MEMORY[0x24BEBE158] + 16);
      v16 = *(double *)(MEMORY[0x24BEBE158] + 24);
      -[RUITableViewHeaderFooterView layoutMargins](self, "layoutMargins");
      v12 = v15 + v17;
      -[RUITableViewHeaderFooterView layoutMargins](self, "layoutMargins");
      v8 = v16 + v18;
    }
    v19 = width - (v8 + v12);
    -[RUITableViewHeaderFooterView headerView](self, "headerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[RUITableViewHeaderFooterView headerView](self, "headerView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[RUITableViewHeaderFooterView tableView](self, "tableView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "headerHeightForWidth:inView:", v22, v19);
LABEL_18:
        height = v23;

        goto LABEL_19;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[RUITableViewHeaderFooterView tableView](self, "tableView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "headerHeightForWidth:inTableView:", v22, v19);
        goto LABEL_18;
      }
    }
    else
    {
      -[RUITableViewHeaderFooterView footerView](self, "footerView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
LABEL_20:
        v25 = v14 + v10 + height;
        goto LABEL_21;
      }
      -[RUITableViewHeaderFooterView footerView](self, "footerView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[RUITableViewHeaderFooterView tableView](self, "tableView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "footerHeightForWidth:inView:", v22, v19);
        goto LABEL_18;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[RUITableViewHeaderFooterView tableView](self, "tableView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "footerHeightForWidth:inTableView:", v22, v19);
        goto LABEL_18;
      }
    }
LABEL_19:

    goto LABEL_20;
  }
  v28.receiver = self;
  v28.super_class = (Class)RUITableViewHeaderFooterView;
  -[RUITableViewHeaderFooterView sizeThatFits:](&v28, sel_sizeThatFits_, width, height);
  width = v26;
LABEL_21:
  v27 = width;
  result.height = v25;
  result.width = v27;
  return result;
}

- (void)removeEmbeddedView
{
  void *v3;
  void *v4;

  -[RUITableViewHeaderFooterView headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[RUITableViewHeaderFooterView footerView](self, "footerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[RUITableViewHeaderFooterView setHeaderView:](self, "setHeaderView:", 0);
  -[RUITableViewHeaderFooterView setFooterView:](self, "setFooterView:", 0);
}

- (void)embedHeaderView:(id)a3
{
  id v4;

  v4 = a3;
  -[RUITableViewHeaderFooterView removeEmbeddedView](self, "removeEmbeddedView");
  -[RUITableViewHeaderFooterView setHeaderView:](self, "setHeaderView:", v4);
  -[RUITableViewHeaderFooterView _embedContentView:](self, "_embedContentView:", v4);

}

- (void)embedFooterView:(id)a3
{
  id v4;

  v4 = a3;
  -[RUITableViewHeaderFooterView removeEmbeddedView](self, "removeEmbeddedView");
  -[RUITableViewHeaderFooterView setFooterView:](self, "setFooterView:", v4);
  -[RUITableViewHeaderFooterView _embedContentView:](self, "_embedContentView:", v4);

}

- (void)_embedContentView:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[RUITableViewHeaderFooterView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  -[RUITableViewHeaderFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (UIEdgeInsets)insetsForHeaderFooter
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  -[RUITableViewHeaderFooterView tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "separatorInset");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[RUITableViewHeaderFooterView tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "style");

  if (v13 == 2)
  {
    if (insetsForHeaderFooter_onceToken != -1)
      dispatch_once(&insetsForHeaderFooter_onceToken, &__block_literal_global_6);
    v5 = insetsForHeaderFooter__insets_0;
    v14 = *(double *)&insetsForHeaderFooter__insets_1;
    v9 = insetsForHeaderFooter__insets_2;
    v15 = *(double *)&insetsForHeaderFooter__insets_3;
  }
  else
  {
    v15 = v7 + v11;
    v14 = v7 + v11;
  }
  v16 = *(double *)&v5;
  v17 = *(double *)&v9;
  result.right = v15;
  result.bottom = v17;
  result.left = v14;
  result.top = v16;
  return result;
}

void __53__RUITableViewHeaderFooterView_insetsForHeaderFooter__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, 0);
  objc_msgSend(v4, "separatorInset");
  insetsForHeaderFooter__insets_0 = v0;
  insetsForHeaderFooter__insets_1 = v1;
  insetsForHeaderFooter__insets_2 = v2;
  insetsForHeaderFooter__insets_3 = v3;

}

- (RUIHeader)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (RemoteUITableFooter)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_footerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
