@implementation PREditingFontPickerCellView

+ (Class)fontPickerCellViewClassForRole:(id)a3
{
  objc_msgSend(a3, "isEqual:", CFSTR("PRPosterRoleIncomingCall"));
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (CGSize)defaultCellSizeUsingSmallerSizing:(BOOL)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 79.0;
  if (a3)
    v3 = 76.0;
  v4 = 64.0;
  if (a3)
    v4 = 62.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)cellSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "defaultCellSizeUsingSmallerSizing:", -[PREditingFontPickerCellView isUsingSmallerSizing](self, "isUsingSmallerSizing"));
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)configureWithFont:(id)a3 text:(id)a4
{
  UIFont *v6;
  NSString *v7;
  UIFont *contentFont;
  UIFont *v9;
  NSString *contentText;

  v6 = (UIFont *)a3;
  v7 = (NSString *)a4;
  contentFont = self->_contentFont;
  self->_contentFont = v6;
  v9 = v6;

  contentText = self->_contentText;
  self->_contentText = v7;

  -[PREditingFontPickerCellView _refreshHeightConstraint](self, "_refreshHeightConstraint");
  -[PREditingFontPickerCellView _refreshWidthConstraint](self, "_refreshWidthConstraint");
}

- (void)configureWithAttributedString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "attributesAtIndex:effectiveRange:", 0, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(v4, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PREditingFontPickerCellView configureWithFont:text:](self, "configureWithFont:text:", v8, v9);
}

- (void)setUsingSmallerSizing:(BOOL)a3
{
  if (self->_usingSmallerSizing != a3)
  {
    self->_usingSmallerSizing = a3;
    -[PREditingFontPickerCellView _refreshHeightConstraint](self, "_refreshHeightConstraint");
    -[PREditingFontPickerCellView _refreshWidthConstraint](self, "_refreshWidthConstraint");
  }
}

- (void)_refreshHeightConstraint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[PREditingFontPickerCellView heightCellConstraint](self, "heightCellConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[PREditingFontPickerCellView heightCellConstraint](self, "heightCellConstraint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v6);

  }
  -[PREditingFontPickerCellView heightAnchor](self, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingFontPickerCellView cellSize](self, "cellSize");
  objc_msgSend(v7, "constraintEqualToConstant:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingFontPickerCellView setHeightCellConstraint:](self, "setHeightCellConstraint:", v9);

  v10 = (void *)MEMORY[0x1E0CB3718];
  -[PREditingFontPickerCellView heightCellConstraint](self, "heightCellConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activateConstraints:", v12);

}

- (void)_refreshWidthConstraint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[PREditingFontPickerCellView widthCellConstraint](self, "widthCellConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[PREditingFontPickerCellView widthCellConstraint](self, "widthCellConstraint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v6);

  }
  -[PREditingFontPickerCellView widthAnchor](self, "widthAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingFontPickerCellView cellSize](self, "cellSize");
  objc_msgSend(v7, "constraintEqualToConstant:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingFontPickerCellView setWidthCellConstraint:](self, "setWidthCellConstraint:", v8);

  v9 = (void *)MEMORY[0x1E0CB3718];
  -[PREditingFontPickerCellView widthCellConstraint](self, "widthCellConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activateConstraints:", v11);

}

- (NSLayoutConstraint)widthCellConstraint
{
  return self->_widthCellConstraint;
}

- (void)setWidthCellConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_widthCellConstraint, a3);
}

- (NSLayoutConstraint)heightCellConstraint
{
  return self->_heightCellConstraint;
}

- (void)setHeightCellConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightCellConstraint, a3);
}

- (NSString)contentText
{
  return self->_contentText;
}

- (void)setContentText:(id)a3
{
  objc_storeStrong((id *)&self->_contentText, a3);
}

- (UIFont)contentFont
{
  return self->_contentFont;
}

- (void)setContentFont:(id)a3
{
  objc_storeStrong((id *)&self->_contentFont, a3);
}

- (BOOL)isUsingSmallerSizing
{
  return self->_usingSmallerSizing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentFont, 0);
  objc_storeStrong((id *)&self->_contentText, 0);
  objc_storeStrong((id *)&self->_heightCellConstraint, 0);
  objc_storeStrong((id *)&self->_widthCellConstraint, 0);
}

@end
