@implementation SKUIReportAConcernDetailsCell

- (SKUIReportAConcernDetailsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  SKUIReportAConcernDetailsCell *v7;
  id v8;
  uint64_t v9;
  UITextView *textView;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIReportAConcernDetailsCell initWithStyle:reuseIdentifier:].cold.1();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIReportAConcernDetailsCell;
  v7 = -[SKUIReportAConcernDetailsCell initWithStyle:reuseIdentifier:](&v15, sel_initWithStyle_reuseIdentifier_, a3, v6);
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0DC3E50]);
    v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    textView = v7->_textView;
    v7->_textView = (UITextView *)v9;

    -[SKUIReportAConcernDetailsCell textLabel](v7, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v7->_textView, "setFont:", v12);

    -[SKUIReportAConcernDetailsCell contentView](v7, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v7->_textView);

  }
  return v7;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double MinY;
  double MinX;
  double MaxY;
  double v29;
  double MaxX;
  double v31;
  void *v32;
  CGFloat rect_8;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  objc_super v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v38.receiver = self;
  v38.super_class = (Class)SKUIReportAConcernDetailsCell;
  -[SKUIReportAConcernDetailsCell layoutSubviews](&v38, sel_layoutSubviews);
  -[SKUIReportAConcernDetailsCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "readableContentGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[SKUIReportAConcernDetailsCell textView](self, "textView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lineFragmentPadding");
  v37 = v15;

  -[SKUIReportAConcernDetailsCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  rect_8 = v21;
  v24 = v23;

  -[SKUIReportAConcernDetailsCell textView](self, "textView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

  v34 = v6;
  v39.origin.x = v6;
  v39.origin.y = v8;
  v39.size.width = v10;
  v39.size.height = v12;
  MinY = CGRectGetMinY(v39);
  v40.origin.x = v18;
  v40.origin.y = v20;
  v40.size.width = rect_8;
  v40.size.height = v24;
  v36 = MinY - CGRectGetMinY(v40);
  v41.origin.x = v6;
  v41.origin.y = v8;
  v41.size.width = v10;
  v41.size.height = v12;
  MinX = CGRectGetMinX(v41);
  v42.origin.x = v18;
  v42.origin.y = v20;
  v42.size.width = rect_8;
  v42.size.height = v24;
  v35 = MinX - CGRectGetMinX(v42) - v37;
  v43.origin.x = v18;
  v43.origin.y = v20;
  v43.size.width = rect_8;
  v43.size.height = v24;
  MaxY = CGRectGetMaxY(v43);
  v44.origin.x = v34;
  v44.origin.y = v8;
  v44.size.width = v10;
  v44.size.height = v12;
  v29 = MaxY - CGRectGetMaxY(v44);
  v45.origin.x = v18;
  v45.origin.y = v20;
  v45.size.width = rect_8;
  v45.size.height = v24;
  MaxX = CGRectGetMaxX(v45);
  v46.origin.x = v34;
  v46.origin.y = v8;
  v46.size.width = v10;
  v46.size.height = v12;
  v31 = MaxX - CGRectGetMaxX(v46) - v37;
  -[SKUIReportAConcernDetailsCell textView](self, "textView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTextContainerInset:", v36, v35, v29, v31);

}

- (void)setPlaceholderText:(id)a3
{
  void *v5;

  objc_storeStrong((id *)&self->_placeholderText, a3);
  if (a3)
  {
    -[SKUIReportAConcernDetailsCell textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);

    -[SKUIReportAConcernDetailsCell updatePlaceholderText:](self, "updatePlaceholderText:", 0);
  }
}

- (NSString)text
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  -[SKUIReportAConcernDetailsCell textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReportAConcernDetailsCell placeholderText](self, "placeholderText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[SKUIReportAConcernDetailsCell textView](self, "textView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v7;
}

- (void)textViewDidBeginEditing:(id)a3
{
  -[SKUIReportAConcernDetailsCell updatePlaceholderText:](self, "updatePlaceholderText:", 1);
}

- (void)textViewDidEndEditing:(id)a3
{
  -[SKUIReportAConcernDetailsCell updatePlaceholderText:](self, "updatePlaceholderText:", 0);
}

- (void)updatePlaceholderText:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v3 = a3;
  -[SKUIReportAConcernDetailsCell textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    -[SKUIReportAConcernDetailsCell placeholderText](self, "placeholderText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (v9)
    {
      -[SKUIReportAConcernDetailsCell textView](self, "textView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", &stru_1E73A9FB0);

      -[SKUIReportAConcernDetailsCell textLabel](self, "textLabel");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "textColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIReportAConcernDetailsCell textView](self, "textView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTextColor:", v11);

LABEL_7:
    }
  }
  else
  {
    v13 = objc_msgSend(v6, "length");

    if (!v13)
    {
      -[SKUIReportAConcernDetailsCell placeholderText](self, "placeholderText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIReportAConcernDetailsCell textView](self, "textView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setText:", v14);

      objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      -[SKUIReportAConcernDetailsCell textView](self, "textView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTextColor:", v16);
      goto LABEL_7;
    }
  }
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_placeholderText, 0);
}

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIReportAConcernDetailsCell initWithStyle:reuseIdentifier:]";
}

@end
