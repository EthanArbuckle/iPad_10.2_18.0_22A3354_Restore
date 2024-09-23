@implementation PKDiscoveryInlineMediaCaptionView

- (PKDiscoveryInlineMediaCaptionView)initWithCaptionText:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  PKDiscoveryInlineMediaCaptionView *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  UILabel *captionLabel;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKDiscoveryInlineMediaCaptionView;
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = -[PKDiscoveryShelfView initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v7, v8, v9);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryInlineMediaCaptionView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v10->_captionText, a3);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v6, v7, v8, v9);
    captionLabel = v10->_captionLabel;
    v10->_captionLabel = (UILabel *)v13;

    v15 = v10->_captionLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[UILabel setFont:](v10->_captionLabel, "setFont:", v12);
    v17 = v10->_captionLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v17, "setTextColor:", v18);

    -[UILabel setNumberOfLines:](v10->_captionLabel, "setNumberOfLines:", 0);
    -[UILabel setText:](v10->_captionLabel, "setText:", v5);
    -[PKDiscoveryInlineMediaCaptionView addSubview:](v10, "addSubview:", v10->_captionLabel);

  }
  return v10;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKDiscoveryInlineMediaCaptionView;
  -[PKDiscoveryInlineMediaCaptionView layoutSubviews](&v15, sel_layoutSubviews);
  -[PKDiscoveryInlineMediaCaptionView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKDiscoveryShelfView contentInsets](self, "contentInsets");
  -[UILabel setFrame:](self->_captionLabel, "setFrame:", v4 + v14, v6 + v11, v8 - (v14 + v12), v10 - (v11 + v13));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  _QWORD v21[2];
  CGSize result;

  height = a3.height;
  width = a3.width;
  v21[1] = *MEMORY[0x1E0C80C00];
  -[PKDiscoveryShelfView contentInsets](self, "contentInsets");
  v8 = width - (v6 + v7);
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lineHeight");
  v11 = v10;
  v20 = *MEMORY[0x1E0DC1138];
  v21[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", self->_captionText, v12);
  objc_msgSend(v13, "pkui_sizeThatFits:withNumberOfLines:", 0, v8, height);
  v15 = v14;
  v17 = v16;

  v18 = v17 + v11 * 0.75 * 2.0;
  v19 = v15;
  result.height = v18;
  result.width = v19;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captionText, 0);
  objc_storeStrong((id *)&self->_captionLabel, 0);
}

@end
