@implementation PSCapacityBarLegendView

- (PSCapacityBarLegendView)initWithCapacityBarCategory:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  PSCapacityBarLegendView *v9;
  PSCapacityBarLegendView *v10;
  PSLegendColorView *v11;
  void *v12;
  uint64_t v13;
  PSLegendColorView *legendColor;
  double v15;
  double v16;
  uint64_t v17;
  UILabel *legendLabel;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PSCapacityBarLegendView;
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = -[PSCapacityBarLegendView initWithFrame:](&v26, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v6, v7, v8);
  v10 = v9;
  if (v9)
  {
    -[PSCapacityBarLegendView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = [PSLegendColorView alloc];
    if (v4)
      objc_msgSend(v4, "color");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "systemMidGrayColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PSLegendColorView initWithColor:](v11, "initWithColor:", v12);
    legendColor = v10->_legendColor;
    v10->_legendColor = (PSLegendColorView *)v13;

    -[PSLegendColorView setTranslatesAutoresizingMaskIntoConstraints:](v10->_legendColor, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v15) = 1144750080;
    -[PSLegendColorView setContentCompressionResistancePriority:forAxis:](v10->_legendColor, "setContentCompressionResistancePriority:forAxis:", 0, v15);
    LODWORD(v16) = 1144750080;
    -[PSLegendColorView setContentCompressionResistancePriority:forAxis:](v10->_legendColor, "setContentCompressionResistancePriority:forAxis:", 1, v16);
    -[PSCapacityBarLegendView addSubview:](v10, "addSubview:", v10->_legendColor);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v5, v6, v7, v8);
    legendLabel = v10->_legendLabel;
    v10->_legendLabel = (UILabel *)v17;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_legendLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setLineBreakMode:](v10->_legendLabel, "setLineBreakMode:", 4);
    -[UILabel setNumberOfLines:](v10->_legendLabel, "setNumberOfLines:", 1);
    if (v4)
    {
      objc_msgSend(v4, "title");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v10->_legendLabel, "setText:", v19);

    }
    else
    {
      -[UILabel setText:](v10->_legendLabel, "setText:", CFSTR("????"));
    }
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB548]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10->_legendLabel, "setFont:", v20);

    -[UILabel setAdjustsFontForContentSizeCategory:](v10->_legendLabel, "setAdjustsFontForContentSizeCategory:", 1);
    LODWORD(v21) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](v10->_legendLabel, "setContentHuggingPriority:forAxis:", 0, v21);
    LODWORD(v22) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](v10->_legendLabel, "setContentHuggingPriority:forAxis:", 1, v22);
    -[PSCapacityBarLegendView addSubview:](v10, "addSubview:", v10->_legendLabel);
    LODWORD(v23) = 1144750080;
    -[PSCapacityBarLegendView setContentHuggingPriority:forAxis:](v10, "setContentHuggingPriority:forAxis:", 0, v23);
    LODWORD(v24) = 1144750080;
    -[PSCapacityBarLegendView setContentHuggingPriority:forAxis:](v10, "setContentHuggingPriority:forAxis:", 1, v24);
    -[PSCapacityBarLegendView createConstraints](v10, "createConstraints");
    -[PSCapacityBarLegendView setNeedsLayout](v10, "setNeedsLayout");
    -[PSCapacityBarLegendView layoutIfNeeded](v10, "layoutIfNeeded");
  }

  return v10;
}

- (void)createConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_legendLabel, 3, 0, self, 3, 1.0, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v3);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 8, 0, self->_legendLabel, 8, 1.0, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v4);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_legendColor, 8, 0, self->_legendLabel, 8, 0.5, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v5);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_legendColor, 7, 0, self->_legendColor, 8, 1.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_legendColor, 4, 0, self->_legendLabel, 12, 1.0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v7);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_legendColor, 5, 0, self, 5, 1.0, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v8);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_legendLabel, 5, 0, self->_legendColor, 6, 1.0, 6.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v9);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 6, 0, self->_legendLabel, 6, 1.0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v10);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v11);
}

- (void)setTextColor:(id)a3
{
  -[UILabel setTextColor:](self->_legendLabel, "setTextColor:", a3);
}

- (UIColor)textColor
{
  return -[UILabel textColor](self->_legendLabel, "textColor");
}

- (void)setText:(id)a3
{
  UILabel *legendLabel;
  id v5;

  legendLabel = self->_legendLabel;
  v5 = a3;
  -[UILabel setText:](legendLabel, "setText:", v5);
  -[PSCapacityBarLegendView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v5);

  -[PSCapacityBarLegendView setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)text
{
  return -[UILabel text](self->_legendLabel, "text");
}

- (void)setColor:(id)a3
{
  -[PSLegendColorView setColor:](self->_legendColor, "setColor:", a3);
}

- (UIColor)color
{
  return -[PSLegendColorView color](self->_legendColor, "color");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legendLabel, 0);
  objc_storeStrong((id *)&self->_legendColor, 0);
}

@end
