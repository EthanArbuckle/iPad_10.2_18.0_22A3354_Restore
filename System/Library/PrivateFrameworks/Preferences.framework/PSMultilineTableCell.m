@implementation PSMultilineTableCell

- (void)updateConfigurationUsingState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  _QWORD v34[4];
  id v35;

  v4 = a3;
  -[PSTableCell specifier](self, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("enabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("enabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    v10 = v9 ^ 1u;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v6, "setDisabled:", v10);
  objc_msgSend(MEMORY[0x1E0CEA718], "valueCellConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updatedConfigurationForState:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *MEMORY[0x1E0CEB990];
  objc_msgSend(v12, "imageProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setReservedLayoutSize:", 0.0, v13);

  objc_msgSend(v5, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v15);

  -[PSTableCell value](self, "value");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PSTableCell value](self, "value");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSecondaryText:", v18);

  }
  else
  {
    objc_msgSend(v12, "setSecondaryText:", 0);
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("useLazyIcons"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iconImage"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSMultilineTableCell setIconImage:](self, "setIconImage:", v20);

  }
  -[PSMultilineTableCell iconImage](self, "iconImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:", v21);

  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __54__PSMultilineTableCell_updateConfigurationUsingState___block_invoke;
  v34[3] = &unk_1E4A659D8;
  v35 = v4;
  v22 = v4;
  objc_msgSend(v12, "textProperties");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setColorTransformer:", v34);

  -[PSMultilineTableCell traitCollection](self, "traitCollection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "layoutDirection");

  -[PSMultilineTableCell directionalLayoutMargins](self, "directionalLayoutMargins");
  v27 = v26;
  -[PSMultilineTableCell safeAreaInsets](self, "safeAreaInsets");
  if (v25 == 1)
    v30 = v29;
  else
    v30 = v28;
  v31 = v27 - v30;
  objc_msgSend(v12, "directionalLayoutMargins");
  if (v32 < v31)
  {
    objc_msgSend(v12, "directionalLayoutMargins");
    objc_msgSend(v12, "setDirectionalLayoutMargins:");
  }
  objc_msgSend(v5, "identifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSMultilineTableCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v33);

  -[PSMultilineTableCell setContentConfiguration:](self, "setContentConfiguration:", v12);
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void)setIcon:(id)a3
{
  -[PSMultilineTableCell setIconImage:](self, "setIconImage:", a3);
  -[PSMultilineTableCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)setIconImage:(id)a3
{
  objc_storeStrong((id *)&self->_iconImage, a3);
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSMultilineTableCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v4, sel_refreshCellContentsWithSpecifier_, a3);
  -[PSMultilineTableCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

id __54__PSMultilineTableCell_updateConfigurationUsingState___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "isSelected") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PSListController appearance](PSListController, "appearance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "textColor");
    v1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImage, 0);
}

@end
