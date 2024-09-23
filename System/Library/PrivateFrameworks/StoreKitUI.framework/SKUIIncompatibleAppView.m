@implementation SKUIIncompatibleAppView

- (id)addButtonWithTitle:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *buttons;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIncompatibleAppView addButtonWithTitle:].cold.1();
  }
  if (!self->_buttons)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    buttons = self->_buttons;
    self->_buttons = v5;

  }
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v4, 0);

  objc_msgSend(v7, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v9);

  objc_msgSend(v7, "sizeToFit");
  -[SKUIIncompatibleAppView addSubview:](self, "addSubview:", v7);
  -[NSMutableArray addObject:](self->_buttons, "addObject:", v7);
  return v7;
}

- (UIImage)iconImage
{
  return -[UIImageView image](self->_iconView, "image");
}

- (NSString)message
{
  return -[UILabel text](self->_messageLabel, "text");
}

- (void)removeButtonTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = self->_buttons;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "removeTarget:action:forControlEvents:", v8, a4, a5, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)setIconImage:(id)a3
{
  id v4;
  UIImageView *iconView;
  UIImageView *v6;
  UIImageView *v7;
  UIImageView *v8;
  void *v9;
  UIImageView *v10;
  id v11;

  v4 = a3;
  iconView = self->_iconView;
  v11 = v4;
  if (v4)
  {
    if (!iconView)
    {
      v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      v7 = self->_iconView;
      self->_iconView = v6;

      v8 = self->_iconView;
      -[SKUIIncompatibleAppView backgroundColor](self, "backgroundColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setBackgroundColor:](v8, "setBackgroundColor:", v9);

      -[SKUIIncompatibleAppView addSubview:](self, "addSubview:", self->_iconView);
      iconView = self->_iconView;
    }
    -[UIImageView setImage:](iconView, "setImage:", v11);
    -[UIImageView sizeToFit](self->_iconView, "sizeToFit");
    -[SKUIIncompatibleAppView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[UIImageView removeFromSuperview](iconView, "removeFromSuperview");
    v10 = self->_iconView;
    self->_iconView = 0;

  }
}

- (void)setMessage:(id)a3
{
  id v4;
  UILabel *messageLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  id v15;

  v4 = a3;
  messageLabel = self->_messageLabel;
  v15 = v4;
  if (v4)
  {
    if (!messageLabel)
    {
      v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      v7 = self->_messageLabel;
      self->_messageLabel = v6;

      v8 = self->_messageLabel;
      -[SKUIIncompatibleAppView backgroundColor](self, "backgroundColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

      v10 = self->_messageLabel;
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v10, "setFont:", v11);

      -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", 0);
      -[UILabel setTextAlignment:](self->_messageLabel, "setTextAlignment:", 1);
      v12 = self->_messageLabel;
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v12, "setTextColor:", v13);

      -[SKUIIncompatibleAppView addSubview:](self, "addSubview:", self->_messageLabel);
      messageLabel = self->_messageLabel;
    }
    -[UILabel setText:](messageLabel, "setText:", v15);
    -[SKUIIncompatibleAppView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[UILabel removeFromSuperview](messageLabel, "removeFromSuperview");
    v14 = self->_messageLabel;
    self->_messageLabel = 0;

  }
}

- (void)setTitle:(id)a3
{
  id v4;
  UILabel *titleLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  id v15;

  v4 = a3;
  titleLabel = self->_titleLabel;
  v15 = v4;
  if (v4)
  {
    if (!titleLabel)
    {
      v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      v7 = self->_titleLabel;
      self->_titleLabel = v6;

      v8 = self->_titleLabel;
      -[SKUIIncompatibleAppView backgroundColor](self, "backgroundColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

      v10 = self->_titleLabel;
      objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 17.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v10, "setFont:", v11);

      -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
      -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
      v12 = self->_titleLabel;
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v12, "setTextColor:", v13);

      -[SKUIIncompatibleAppView addSubview:](self, "addSubview:", self->_titleLabel);
      titleLabel = self->_titleLabel;
    }
    -[UILabel setText:](titleLabel, "setText:", v15);
    -[SKUIIncompatibleAppView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
    v14 = self->_titleLabel;
    self->_titleLabel = 0;

  }
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UILabel *messageLabel;
  double v10;
  double v11;
  UILabel *titleLabel;
  double v13;
  double *v14;
  UIImageView *iconView;
  double v16;
  double v17;
  NSMutableArray *buttons;
  float v19;
  double v20;
  UIImageView *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  float v26;
  CGFloat v27;
  UILabel *v28;
  float v29;
  CGFloat v30;
  UILabel *v31;
  float v32;
  CGFloat v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  float v43;
  CGFloat v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  uint64_t v50;
  double *v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE v54[128];
  uint64_t v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v55 = *MEMORY[0x1E0C80C00];
  -[SKUIIncompatibleAppView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = v3 + -30.0;
  v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  messageLabel = self->_messageLabel;
  v10 = v8;
  if (messageLabel)
  {
    -[UILabel sizeThatFits:](messageLabel, "sizeThatFits:", v3 + -30.0, 1.79769313e308);
    v10 = v11;
  }
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", v7, 1.79769313e308);
    v8 = v13;
  }
  v14 = (double *)&v50;
  v50 = 0;
  v51 = (double *)&v50;
  v52 = 0x2020000000;
  v53 = 0;
  iconView = self->_iconView;
  if (iconView)
  {
    -[UIImageView bounds](iconView, "bounds");
    v14 = v51;
    v17 = v16 + 20.0 + v51[3];
    v51[3] = v17;
  }
  else
  {
    v17 = 0.0;
  }
  if (v8 > 0.00000011920929)
  {
    v17 = v8 + 9.0 + v17;
    v14[3] = v17;
  }
  if (v10 > 0.00000011920929)
    v14[3] = v10 + 19.0 + v17;
  buttons = self->_buttons;
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __41__SKUIIncompatibleAppView_layoutSubviews__block_invoke;
  v49[3] = &unk_1E73A9790;
  v49[4] = &v50;
  -[NSMutableArray enumerateObjectsUsingBlock:](buttons, "enumerateObjectsUsingBlock:", v49);
  v19 = (v6 - v51[3]) * 0.5;
  v20 = floorf(v19);
  v21 = self->_iconView;
  if (v21)
  {
    -[UIImageView frame](v21, "frame");
    v23 = v22;
    v25 = v24;
    v26 = (v4 - v22) * 0.5;
    v27 = floorf(v26);
    -[UIImageView setFrame:](self->_iconView, "setFrame:", v27, v20);
    v56.origin.x = v27;
    v56.origin.y = v20;
    v56.size.width = v23;
    v56.size.height = v25;
    v20 = CGRectGetMaxY(v56) + 20.0;
  }
  v28 = self->_titleLabel;
  if (v28)
  {
    -[UILabel frame](v28, "frame");
    v29 = v8;
    v30 = ceilf(v29);
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", 15.0, v20, v7, v30);
    v57.origin.x = 15.0;
    v57.origin.y = v20;
    v57.size.width = v7;
    v57.size.height = v30;
    v20 = CGRectGetMaxY(v57) + 9.0;
  }
  v31 = self->_messageLabel;
  if (v31)
  {
    -[UILabel frame](v31, "frame");
    v32 = v10;
    v33 = ceilf(v32);
    -[UILabel setFrame:](self->_messageLabel, "setFrame:", 15.0, v20, v7, v33);
    v58.origin.x = 15.0;
    v58.origin.y = v20;
    v58.size.width = v7;
    v58.size.height = v33;
    v20 = CGRectGetMaxY(v58) + 19.0;
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v34 = self->_buttons;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v46 != v36)
          objc_enumerationMutation(v34);
        v38 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v38, "frame", (_QWORD)v45);
        v40 = v39;
        v42 = v41;
        v43 = (v4 - v39) * 0.5;
        v44 = floorf(v43);
        objc_msgSend(v38, "setFrame:", v44, v20);
        v59.origin.x = v44;
        v59.origin.y = v20;
        v59.size.width = v40;
        v59.size.height = v42;
        v20 = CGRectGetMaxY(v59) + 13.0;
      }
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v35);
  }

  _Block_object_dispose(&v50, 8);
}

double __41__SKUIIncompatibleAppView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  double v5;
  double result;

  if (a3)
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                            + 24)
                                                                + 13.0;
  objc_msgSend(a2, "bounds");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v5 + *(double *)(v4 + 24);
  *(double *)(v4 + 24) = result;
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  NSMutableArray *buttons;
  id v6;
  objc_super v7;

  buttons = self->_buttons;
  v6 = a3;
  -[NSMutableArray makeObjectsPerformSelector:withObject:](buttons, "makeObjectsPerformSelector:withObject:", a2, v6);
  -[UIImageView setBackgroundColor:](self->_iconView, "setBackgroundColor:", v6);
  -[UILabel setBackgroundColor:](self->_messageLabel, "setBackgroundColor:", v6);
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v6);
  v7.receiver = self;
  v7.super_class = (Class)SKUIIncompatibleAppView;
  -[SKUIIncompatibleAppView setBackgroundColor:](&v7, sel_setBackgroundColor_, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
}

- (void)addButtonWithTitle:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIIncompatibleAppView addButtonWithTitle:]";
}

@end
