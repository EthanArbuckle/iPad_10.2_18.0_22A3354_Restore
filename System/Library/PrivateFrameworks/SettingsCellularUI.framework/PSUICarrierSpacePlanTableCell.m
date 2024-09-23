@implementation PSUICarrierSpacePlanTableCell

+ (id)checkIcon
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = (void *)checkIcon_check;
  if (!checkIcon_check)
  {
    objc_msgSend(MEMORY[0x24BEBB528], "defaultFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE1D0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v4, 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithFont:scale:", v5, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)checkIcon_check;
    checkIcon_check = v7;

    v2 = (void *)checkIcon_check;
  }
  return v2;
}

+ (id)spacerIcon
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  CGSize v9;

  v3 = (void *)spacerIcon_spacer;
  if (!spacerIcon_spacer)
  {
    objc_msgSend(a1, "checkIcon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "size");
      UIGraphicsBeginImageContextWithOptions(v9, 0, 0.0);
      UIGraphicsGetImageFromCurrentImageContext();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)spacerIcon_spacer;
      spacerIcon_spacer = v6;

      UIGraphicsEndImageContext();
    }

    v3 = (void *)spacerIcon_spacer;
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  v6.receiver = self;
  v6.super_class = (Class)PSUICarrierSpacePlanTableCell;
  -[PSUICarrierSpacePlanTableCell sizeThatFits:](&v6, sel_sizeThatFits_, a3.width, a3.height);
  v5 = v4 + -12.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (PSUICarrierSpacePlanTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSUICarrierSpacePlanTableCell;
  return -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v6, sel_initWithStyle_reuseIdentifier_specifier_, 3, a4, a5);
}

- (BOOL)canBeChecked
{
  void *v2;
  void *v3;
  char v4;

  -[PSTableCell specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyForKey:", CFSTR("PSUICellularCellCanBeChecked"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)primaryText
{
  void *v2;
  void *v3;

  -[PSTableCell specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyForKey:", CFSTR("PSUICellularCellPrimaryText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)detailText
{
  void *v2;
  void *v3;

  -[PSTableCell specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyForKey:", CFSTR("PSUICellularCellDetailText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessoryText
{
  return 0;
}

- (void)setChecked:(BOOL)a3
{
  uint64_t v3;
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (int)*MEMORY[0x24BE75770];
  if (*((_BYTE *)&self->super.super.super.super.super.isa + v3) != a3)
  {
    v4 = a3;
    -[PSTableCell specifier](self, "specifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v7, CFSTR("PSUICellularCellIsChecked"));

    *((_BYTE *)&self->super.super.super.super.super.isa + v3) = v4;
    v8 = (void *)objc_opt_class();
    if (v4)
      objc_msgSend(v8, "checkIcon");
    else
      objc_msgSend(v8, "spacerIcon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell setIcon:](self, "setIcon:", v9);

    -[PSUICarrierSpacePlanTableCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PSUICarrierSpacePlanTableCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v18, sel_refreshCellContentsWithSpecifier_, a3);
  -[PSTableCell specifier](self, "specifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("PSUICellularCellIsChecked"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v5, "BOOLValue"))
  {
    objc_msgSend((id)objc_opt_class(), "checkIcon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 1;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "spacerIcon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
  }
  -[PSTableCell setIcon:](self, "setIcon:", v6);

  -[PSUICarrierSpacePlanTableCell setChecked:](self, "setChecked:", v7);
  -[PSUICarrierSpacePlanTableCell primaryText](self, "primaryText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICarrierSpacePlanTableCell textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  -[PSUICarrierSpacePlanTableCell detailText](self, "detailText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICarrierSpacePlanTableCell detailTextLabel](self, "detailTextLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  v12 = -[PSUICarrierSpacePlanTableCell canBeChecked](self, "canBeChecked");
  -[PSTableCell titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEnabled:", v12);

  -[PSUICarrierSpacePlanTableCell detailTextLabel](self, "detailTextLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEnabled:", v12);

  -[PSUICarrierSpacePlanTableCell accessoryText](self, "accessoryText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
  {
    v16 = objc_alloc(MEMORY[0x24BEBD708]);
    v17 = (void *)objc_msgSend(v16, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v17, "setText:", v15);
    objc_msgSend(v17, "sizeToFit");
    -[PSUICarrierSpacePlanTableCell setAccessoryView:](self, "setAccessoryView:", v17);

  }
}

@end
