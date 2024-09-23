@implementation _TVInspectorHighlightMetadataView

- (_TVInspectorHighlightMetadataView)initWithFrame:(CGRect)a3
{
  _TVInspectorHighlightMetadataView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UILabel *descriptionLabel;
  uint64_t v11;
  UILabel *frameLabel;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_TVInspectorHighlightMetadataView;
  v3 = -[_TVInspectorHighlightMetadataView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6B68]);
    v5 = *MEMORY[0x24BDBF090];
    v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], v6, v7, v8);
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = (UILabel *)v9;

    -[UILabel setLineBreakMode:](v3->_descriptionLabel, "setLineBreakMode:", 4);
    -[UILabel setNumberOfLines:](v3->_descriptionLabel, "setNumberOfLines:", 1);
    -[_TVInspectorHighlightMetadataView addSubview:](v3, "addSubview:", v3->_descriptionLabel);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v5, v6, v7, v8);
    frameLabel = v3->_frameLabel;
    v3->_frameLabel = (UILabel *)v11;

    -[UILabel setNumberOfLines:](v3->_frameLabel, "setNumberOfLines:", 1);
    -[_TVInspectorHighlightMetadataView addSubview:](v3, "addSubview:", v3->_frameLabel);
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[_TVInspectorHighlightMetadataView frameLabel](self, "frameLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v8 = v7;
  v10 = v9;

  -[_TVInspectorHighlightMetadataView descriptionLabel](self, "descriptionLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", width, height);
  v13 = v12;
  v15 = v14;

  v16 = v8 + 5.0 + 5.0;
  v17 = v16 + 100.0 + 5.0;
  if (v16 + v13 + 5.0 <= width)
    v17 = v16 + v13 + 5.0;
  if (v10 >= v15)
    v18 = v10;
  else
    v18 = v15;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  CGFloat v19;
  void *v20;
  CGFloat v21;
  void *v22;
  double v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v24.receiver = self;
  v24.super_class = (Class)_TVInspectorHighlightMetadataView;
  -[_TVInspectorHighlightMetadataView layoutSubviews](&v24, sel_layoutSubviews);
  -[_TVInspectorHighlightMetadataView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_TVInspectorHighlightMetadataView frameLabel](self, "frameLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", v8, v10);
  v13 = v12;
  v15 = v14;

  -[_TVInspectorHighlightMetadataView descriptionLabel](self, "descriptionLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sizeThatFits:", v8, v10);
  v23 = v17;

  -[_TVInspectorHighlightMetadataView frameLabel](self, "frameLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  v19 = CGRectGetMaxX(v25) + -5.0 - v13;
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  objc_msgSend(v18, "setFrame:", v19, CGRectGetMidY(v26) - v15 * 0.5, v13, v15);

  -[_TVInspectorHighlightMetadataView descriptionLabel](self, "descriptionLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  v21 = CGRectGetMidY(v27) - v23 * 0.5;
  -[_TVInspectorHighlightMetadataView frameLabel](self, "frameLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "frame");
  objc_msgSend(v20, "setFrame:", 5.0, v21, CGRectGetMinX(v28) + -5.0 + -5.0, v23);

}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (UILabel)frameLabel
{
  return self->_frameLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameLabel, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
}

@end
