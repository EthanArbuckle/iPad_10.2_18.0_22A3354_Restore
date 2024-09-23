@implementation PSReversedSubtitleDisclosureTableCell

- (void)_valueLabelForSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v4 = a3;
  if (v4)
  {
    v21 = v4;
    -[PSTableCell value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSReversedSubtitleDisclosureTableCell detailTextLabel](self, "detailTextLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);

    -[PSSubtitleDisclosureTableCell valueLabel](self, "valueLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0CEA700]);
      v9 = (void *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[PSSubtitleDisclosureTableCell setValueLabel:](self, "setValueLabel:", v9);

      v10 = (void *)objc_opt_new();
      objc_msgSend(v10, "detailTextLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "font");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSubtitleDisclosureTableCell valueLabel](self, "valueLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFont:", v12);

      -[PSSubtitleDisclosureTableCell valueLabel](self, "valueLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setNumberOfLines:", 0);

      -[PSSubtitleDisclosureTableCell valueLabel](self, "valueLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setLineBreakMode:", 0);

      -[PSSubtitleDisclosureTableCell valueLabel](self, "valueLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setEnabled:", 0);

      -[PSReversedSubtitleDisclosureTableCell contentView](self, "contentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSubtitleDisclosureTableCell valueLabel](self, "valueLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addSubview:", v18);

    }
    objc_msgSend(v21, "propertyForKey:", CFSTR("cellSubtitleText"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSubtitleDisclosureTableCell valueLabel](self, "valueLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v19);

    v4 = v21;
  }

}

@end
