@implementation STHorizontalDivider

- (STHorizontalDivider)initWithTintColor:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  STHorizontalDivider *v8;
  id v9;
  void *v10;
  uint64_t v11;
  UIImageView *horizontalLine;
  uint64_t v13;
  NSLayoutXAxisAnchor *horizontalLineRightAnchor;
  uint64_t v15;
  UILabel *label;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;
  _QWORD v42[8];

  v42[6] = *MEMORY[0x24BDAC8D0];
  v41.receiver = self;
  v41.super_class = (Class)STHorizontalDivider;
  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v7 = a3;
  v8 = -[STHorizontalDivider initWithFrame:](&v41, sel_initWithFrame_, v3, v4, v5, v6);
  v9 = objc_alloc(MEMORY[0x24BEBD668]);
  -[STHorizontalDivider horizontalLineImage](v8, "horizontalLineImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "initWithImage:", v10);
  horizontalLine = v8->_horizontalLine;
  v8->_horizontalLine = (UIImageView *)v11;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v8->_horizontalLine, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setTintColor:](v8->_horizontalLine, "setTintColor:", v7);

  -[UIImageView rightAnchor](v8->_horizontalLine, "rightAnchor");
  v13 = objc_claimAutoreleasedReturnValue();
  horizontalLineRightAnchor = v8->_horizontalLineRightAnchor;
  v8->_horizontalLineRightAnchor = (NSLayoutXAxisAnchor *)v13;

  -[STHorizontalDivider addSubview:](v8, "addSubview:", v8->_horizontalLine);
  v15 = objc_opt_new();
  label = v8->_label;
  v8->_label = (UILabel *)v15;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v8->_label, "setFont:", v17);

  objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v8->_label, "setTextColor:", v18);

  LODWORD(v19) = 1144750080;
  -[UILabel setContentHuggingPriority:forAxis:](v8->_label, "setContentHuggingPriority:forAxis:", 0, v19);
  LODWORD(v20) = 1144766464;
  -[UILabel setContentCompressionResistancePriority:forAxis:](v8->_label, "setContentCompressionResistancePriority:forAxis:", 0, v20);
  -[STHorizontalDivider addSubview:](v8, "addSubview:", v8->_label);
  v33 = (void *)MEMORY[0x24BDD1628];
  -[UIImageView leftAnchor](v8->_horizontalLine, "leftAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[STHorizontalDivider leftAnchor](v8, "leftAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v38;
  -[UIImageView centerYAnchor](v8->_horizontalLine, "centerYAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[STHorizontalDivider centerYAnchor](v8, "centerYAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v35;
  -[UILabel topAnchor](v8->_label, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[STHorizontalDivider topAnchor](v8, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v31;
  -[UILabel leftAnchor](v8->_label, "leftAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v8->_horizontalLineRightAnchor, 4.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v22;
  -[UILabel bottomAnchor](v8->_label, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[STHorizontalDivider bottomAnchor](v8, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v25;
  -[UILabel rightAnchor](v8->_label, "rightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[STHorizontalDivider rightAnchor](v8, "rightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activateConstraints:", v29);

  return v8;
}

- (UIImage)horizontalLineImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__STHorizontalDivider_horizontalLineImage__block_invoke;
  block[3] = &unk_24DB86440;
  block[4] = self;
  if (horizontalLineImage_onceToken != -1)
    dispatch_once(&horizontalLineImage_onceToken, block);
  return (UIImage *)(id)horizontalLineImage_horizontalLineImage;
}

void __42__STHorizontalDivider_horizontalLineImage__block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayScale");
  v3 = 1.0 / v2;

  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD618]), "initWithSize:", v3, v3);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __42__STHorizontalDivider_horizontalLineImage__block_invoke_2;
  v11[3] = &__block_descriptor_40_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(double *)&v11[4] = v3;
  objc_msgSend(v10, "imageWithActions:", v11);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)horizontalLineImage_horizontalLineImage;
  horizontalLineImage_horizontalLineImage = v4;

  objc_msgSend((id)horizontalLineImage_horizontalLineImage, "resizableImageWithCapInsets:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)horizontalLineImage_horizontalLineImage;
  horizontalLineImage_horizontalLineImage = v6;

  objc_msgSend((id)horizontalLineImage_horizontalLineImage, "imageWithRenderingMode:", 2);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)horizontalLineImage_horizontalLineImage;
  horizontalLineImage_horizontalLineImage = v8;

}

void __42__STHorizontalDivider_horizontalLineImage__block_invoke_2(uint64_t a1, void *a2)
{
  CGContext *v3;
  CGRect v4;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  v4.size.width = *(CGFloat *)(a1 + 32);
  v4.origin.x = 0.0;
  v4.origin.y = 0.0;
  v4.size.height = v4.size.width;
  CGContextFillRect(v3, v4);
}

- (UILabel)label
{
  return (UILabel *)objc_getProperty(self, a2, 416, 1);
}

- (NSLayoutXAxisAnchor)horizontalLineRightAnchor
{
  return (NSLayoutXAxisAnchor *)objc_getProperty(self, a2, 424, 1);
}

- (UIImageView)horizontalLine
{
  return (UIImageView *)objc_getProperty(self, a2, 432, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalLine, 0);
  objc_storeStrong((id *)&self->_horizontalLineRightAnchor, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
