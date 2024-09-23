@implementation STDashedVerticalDivider

- (STDashedVerticalDivider)initWithTintColor:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  STDashedVerticalDivider *v8;
  id v9;
  void *v10;
  uint64_t v11;
  UIImageView *dashedLine;
  uint64_t v13;
  UILabel *label;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSLayoutYAxisAnchor *labelTopAnchor;
  uint64_t v28;
  NSLayoutXAxisAnchor *dashedLineCenterXAnchor;
  void *v30;
  void *v31;
  uint64_t v32;
  NSLayoutConstraint *labelLeftConstraint;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  objc_super v59;
  _QWORD v60[10];

  v60[8] = *MEMORY[0x24BDAC8D0];
  v59.receiver = self;
  v59.super_class = (Class)STDashedVerticalDivider;
  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v7 = a3;
  v8 = -[STDashedVerticalDivider initWithFrame:](&v59, sel_initWithFrame_, v3, v4, v5, v6);
  v9 = objc_alloc(MEMORY[0x24BEBD668]);
  -[STDashedVerticalDivider dashedLineImage](v8, "dashedLineImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "initWithImage:", v10);
  dashedLine = v8->_dashedLine;
  v8->_dashedLine = (UIImageView *)v11;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v8->_dashedLine, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setTintColor:](v8->_dashedLine, "setTintColor:", v7);

  -[STDashedVerticalDivider addSubview:](v8, "addSubview:", v8->_dashedLine);
  v13 = objc_opt_new();
  label = v8->_label;
  v8->_label = (UILabel *)v13;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v8->_label, "setFont:", v15);

  objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v8->_label, "setTextColor:", v16);

  LODWORD(v17) = 1144750080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](v8->_label, "setContentCompressionResistancePriority:forAxis:", 0, v17);
  LODWORD(v18) = 1144750080;
  -[UILabel setContentHuggingPriority:forAxis:](v8->_label, "setContentHuggingPriority:forAxis:", 1, v18);
  LODWORD(v19) = 1144766464;
  -[UILabel setContentCompressionResistancePriority:forAxis:](v8->_label, "setContentCompressionResistancePriority:forAxis:", 1, v19);
  -[STDashedVerticalDivider addSubview:](v8, "addSubview:", v8->_label);
  -[UILabel bottomAnchor](v8->_label, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](v8->_dashedLine, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  -[UILabel rightAnchor](v8->_label, "rightAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDashedVerticalDivider rightAnchor](v8, "rightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  -[UILabel topAnchor](v8->_label, "topAnchor");
  v26 = objc_claimAutoreleasedReturnValue();
  labelTopAnchor = v8->_labelTopAnchor;
  v8->_labelTopAnchor = (NSLayoutYAxisAnchor *)v26;

  -[UIImageView centerXAnchor](v8->_dashedLine, "centerXAnchor");
  v28 = objc_claimAutoreleasedReturnValue();
  dashedLineCenterXAnchor = v8->_dashedLineCenterXAnchor;
  v8->_dashedLineCenterXAnchor = (NSLayoutXAxisAnchor *)v28;

  -[UILabel leftAnchor](v8->_label, "leftAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView rightAnchor](v8->_dashedLine, "rightAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v31);
  v32 = objc_claimAutoreleasedReturnValue();
  labelLeftConstraint = v8->_labelLeftConstraint;
  v8->_labelLeftConstraint = (NSLayoutConstraint *)v32;

  v49 = (void *)MEMORY[0x24BDD1628];
  v60[0] = v8->_labelLeftConstraint;
  -[UILabel bottomAnchor](v8->_label, "bottomAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](v8->_dashedLine, "bottomAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v57);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v56;
  -[UILabel rightAnchor](v8->_label, "rightAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDashedVerticalDivider rightAnchor](v8, "rightAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v53;
  -[UIImageView topAnchor](v8->_dashedLine, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDashedVerticalDivider topAnchor](v8, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v60[3] = v50;
  -[UIImageView leftAnchor](v8->_dashedLine, "leftAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDashedVerticalDivider leftAnchor](v8, "leftAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v60[4] = v46;
  -[UIImageView bottomAnchor](v8->_dashedLine, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDashedVerticalDivider bottomAnchor](v8, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v44);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v60[5] = v34;
  -[UIImageView widthAnchor](v8->_dashedLine, "widthAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDashedVerticalDivider traitCollection](v8, "traitCollection");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "displayScale");
  objc_msgSend(v35, "constraintEqualToConstant:", 1.0 / v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v60[6] = v38;
  -[UILabel rightAnchor](v8->_label, "rightAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDashedVerticalDivider rightAnchor](v8, "rightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v60[7] = v41;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 8);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "activateConstraints:", v42);

  return v8;
}

- (void)setLabelText:(id)a3
{
  id v4;
  NSString *v5;
  NSString *labelText;
  void *v7;
  uint64_t v8;
  double v9;
  id v10;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  labelText = self->_labelText;
  self->_labelText = v5;

  -[STDashedVerticalDivider label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v4);

  v8 = objc_msgSend(v4, "length");
  if (v8)
    v9 = 4.0;
  else
    v9 = 0.0;
  -[STDashedVerticalDivider labelLeftConstraint](self, "labelLeftConstraint");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConstant:", v9);

}

- (void)setSelected:(BOOL)a3
{
  void *v4;
  id v5;

  self->_selected = a3;
  if (a3)
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemDarkMidGrayColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[STDashedVerticalDivider label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

}

- (UIImage)dashedLineImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__STDashedVerticalDivider_dashedLineImage__block_invoke;
  block[3] = &unk_24DB86440;
  block[4] = self;
  if (dashedLineImage_onceToken != -1)
    dispatch_once(&dashedLineImage_onceToken, block);
  return (UIImage *)(id)dashedLineImage_dashedLineImage;
}

void __42__STDashedVerticalDivider_dashedLineImage__block_invoke(uint64_t a1)
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

  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD618]), "initWithSize:", v3, 4.0);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __42__STDashedVerticalDivider_dashedLineImage__block_invoke_2;
  v11[3] = &__block_descriptor_40_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(double *)&v11[4] = v3;
  objc_msgSend(v10, "imageWithActions:", v11);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)dashedLineImage_dashedLineImage;
  dashedLineImage_dashedLineImage = v4;

  objc_msgSend((id)dashedLineImage_dashedLineImage, "resizableImageWithCapInsets:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)dashedLineImage_dashedLineImage;
  dashedLineImage_dashedLineImage = v6;

  objc_msgSend((id)dashedLineImage_dashedLineImage, "imageWithRenderingMode:", 2);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)dashedLineImage_dashedLineImage;
  dashedLineImage_dashedLineImage = v8;

}

void __42__STDashedVerticalDivider_dashedLineImage__block_invoke_2(uint64_t a1, void *a2)
{
  CGContext *v3;
  CGPoint v4;
  CGFloat x;
  uint64_t v6;
  CGFloat lengths[3];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  CGContextSetLineWidth(v3, *(CGFloat *)(a1 + 32));
  *(_OWORD *)lengths = xmmword_219BA4CA0;
  CGContextSetLineDash(v3, 0.0, lengths, 2uLL);
  v4.x = *(double *)(a1 + 32) * 0.5;
  v4.y = 0.0;
  x = v4.x;
  v6 = 0x4010000000000000;
  CGContextAddLines(v3, &v4, 2uLL);
  CGContextStrokeLineSegments(v3, &v4, 2uLL);
}

- (NSString)labelText
{
  return self->_labelText;
}

- (NSLayoutXAxisAnchor)dashedLineCenterXAnchor
{
  return (NSLayoutXAxisAnchor *)objc_getProperty(self, a2, 432, 1);
}

- (NSLayoutYAxisAnchor)labelTopAnchor
{
  return (NSLayoutYAxisAnchor *)objc_getProperty(self, a2, 440, 1);
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (UIImageView)dashedLine
{
  return self->_dashedLine;
}

- (void)setDashedLine:(id)a3
{
  objc_storeStrong((id *)&self->_dashedLine, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSLayoutConstraint)labelLeftConstraint
{
  return self->_labelLeftConstraint;
}

- (void)setLabelLeftConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_labelLeftConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelLeftConstraint, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dashedLine, 0);
  objc_storeStrong((id *)&self->_labelTopAnchor, 0);
  objc_storeStrong((id *)&self->_dashedLineCenterXAnchor, 0);
  objc_storeStrong((id *)&self->_labelText, 0);
}

@end
