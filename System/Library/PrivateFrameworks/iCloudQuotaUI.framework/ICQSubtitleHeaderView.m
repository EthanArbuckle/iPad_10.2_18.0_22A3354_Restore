@implementation ICQSubtitleHeaderView

- (ICQSubtitleHeaderView)initWithSpecifier:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  ICQSubtitleHeaderView *v7;
  uint64_t v8;
  UILabel *titleLabel;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  NSMutableArray *v16;
  NSMutableArray *subtitleLabels;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ICQSubtitleHeaderView;
  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v7 = -[ICQSubtitleHeaderView initWithFrame:](&v19, sel_initWithFrame_, a3, *MEMORY[0x24BDBF090], v4, v5, v6);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v3, v4, v5, v6);
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = (UILabel *)v8;

    v10 = v7->_titleLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v11);

    v12 = v7->_titleLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "darkGrayColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    v14 = v7->_titleLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v14, "setBackgroundColor:", v15);

    -[ICQSubtitleHeaderView addSubview:](v7, "addSubview:", v7->_titleLabel);
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    subtitleLabels = v7->_subtitleLabels;
    v7->_subtitleLabels = v16;

  }
  return v7;
}

- (id)subtitleAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSMutableArray count](self->_subtitleLabels, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_subtitleLabels, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)addSubtitle
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BEBD708]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v6);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v7);

  objc_msgSend(v4, "setNumberOfLines:", 0);
  objc_msgSend(v4, "setLineBreakMode:", 0);
  -[NSMutableArray addObject:](self->_subtitleLabels, "addObject:", v4);
  -[ICQSubtitleHeaderView addSubview:](self, "addSubview:", v4);
  -[ICQSubtitleHeaderView setNeedsLayout](self, "setNeedsLayout");
  return v4;
}

- (void)removeSubtitleAtIndex:(unint64_t)a3
{
  -[NSMutableArray removeObjectAtIndex:](self->_subtitleLabels, "removeObjectAtIndex:", a3);
}

- (double)preferredHeightForWidth:(double)a3
{
  void *v3;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  char isKindOfClass;
  double v22;
  double v23;
  double v24;
  double v25;
  float v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v32;
  NSMutableArray *obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  PSTextViewInsets();
  v32 = v6;
  -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
  -[UILabel bounds](self->_titleLabel, "bounds");
  v8 = v7;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = self->_subtitleLabels;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v13, "frame");
        v15 = v14;
        v17 = v16;
        objc_msgSend(v13, "text");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "font");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICQSubtitleHeaderView superview](self, "superview");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v22 = 15.0;
        if ((isKindOfClass & 1) != 0)
        {
          -[ICQSubtitleHeaderView superview](self, "superview", 15.0);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "_backgroundInset");
          v24 = v23;
          if (PSIsN56())
          {
            PSTableViewSideInset();
          }
          else
          {
            PreferencesTableViewCellLeftPad();
            v25 = v26;
          }
          v22 = v24 + v25 - v32;
        }
        objc_msgSend(v18, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v19, objc_msgSend(v13, "lineBreakMode"), a3 + v22 * -2.0, 1.79769313e308);
        v28 = v27;
        v30 = v29;
        if ((isKindOfClass & 1) != 0)

        objc_msgSend(v13, "setFrame:", v15, v17, v28, v30);
        v8 = v8 + v30 + 4.0;
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v10);
  }

  return v8 + 5.0 + 6.0;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  double v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t i;
  void *v27;
  double v28;
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  PSTextViewInsets();
  v4 = v3;
  -[ICQSubtitleHeaderView superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v6 = 15.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ICQSubtitleHeaderView superview](self, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_backgroundInset");
    v9 = v8;
    if (PSIsN56())
    {
      PSTableViewSideInset();
    }
    else
    {
      PreferencesTableViewCellLeftPad();
      v10 = v11;
    }
    v6 = v9 + v10 - v4;

  }
  -[ICQSubtitleHeaderView bounds](self, "bounds");
  v13 = v12;
  -[UILabel frame](self->_titleLabel, "frame");
  v15 = v14;
  v17 = v16;
  v18 = -[ICQSubtitleHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v19 = v13 - v6 - v15;
  if (!v18)
    v19 = v6;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v19, 5.0, v15, v17);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = self->_subtitleLabels;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v21)
  {
    v22 = v21;
    v23 = v17 + 5.0 + 4.0;
    v24 = *(_QWORD *)v31;
    v25 = v13 + v6 * -2.0;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(v20);
        v27 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v27, "frame", (_QWORD)v30);
        v29 = v28;
        objc_msgSend(v27, "setFrame:", v6, v23, v25);
        v23 = v23 + v29 + 4.0;
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v22);
  }

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (NSArray)subtitleLabels
{
  return &self->_subtitleLabels->super;
}

- (void)setSubtitleLabels:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabels, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
