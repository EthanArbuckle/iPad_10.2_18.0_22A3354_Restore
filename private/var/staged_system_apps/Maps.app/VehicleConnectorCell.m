@implementation VehicleConnectorCell

- (VehicleConnectorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  VehicleConnectorCell *v4;
  VehicleConnectorCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VehicleConnectorCell;
  v4 = -[VehicleConnectorCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[VehicleConnectorCell _setup](v4, "_setup");
    -[VehicleConnectorCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("VehicleConnectorCell"));
  }
  return v5;
}

- (void)_setup
{
  UIImageView *v3;
  UIImageView *iconView;
  void *v5;
  UILabel *v6;
  UILabel *nameLabel;
  void *v8;
  void *v9;
  UILabel *v10;
  UILabel *powerLabel;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[9];

  -[VehicleConnectorCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  v3 = objc_opt_new(UIImageView);
  iconView = self->_iconView;
  self->_iconView = v3;

  -[UIImageView setAccessibilityIdentifier:](self->_iconView, "setAccessibilityIdentifier:", CFSTR("IconView"));
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray2Color](UIColor, "systemGray2Color"));
  -[UIImageView setTintColor:](self->_iconView, "setTintColor:", v5);

  -[UIImageView setContentMode:](self->_iconView, "setContentMode:", 1);
  v6 = objc_opt_new(UILabel);
  nameLabel = self->_nameLabel;
  self->_nameLabel = v6;

  -[UILabel setAccessibilityIdentifier:](self->_nameLabel, "setAccessibilityIdentifier:", CFSTR("NameLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_nameLabel, "setTextColor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_nameLabel, "setFont:", v9);

  v10 = objc_opt_new(UILabel);
  powerLabel = self->_powerLabel;
  self->_powerLabel = v10;

  -[UILabel setAccessibilityIdentifier:](self->_powerLabel, "setAccessibilityIdentifier:", CFSTR("PowerLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_powerLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_powerLabel, "setTextColor:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
  -[UILabel setFont:](self->_powerLabel, "setFont:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorCell contentView](self, "contentView"));
  objc_msgSend(v14, "addSubview:", self->_iconView);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorCell contentView](self, "contentView"));
  objc_msgSend(v15, "addSubview:", self->_nameLabel);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorCell contentView](self, "contentView"));
  objc_msgSend(v16, "addSubview:", self->_powerLabel);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_iconView, "leadingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorCell contentView](self, "contentView"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "leadingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:constant:", v46, 16.0));
  v49[0] = v45;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_iconView, "centerYAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorCell contentView](self, "contentView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "centerYAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
  v49[1] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_iconView, "widthAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToConstant:", 30.0));
  v49[2] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_nameLabel, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_iconView, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, 10.0));
  v49[3] = v36;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_nameLabel, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorCell contentView](self, "contentView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, 16.0));
  v49[4] = v32;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_nameLabel, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorCell contentView](self, "contentView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, -16.0));
  v49[5] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_powerLabel, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_iconView, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v17, 10.0));
  v49[6] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_powerLabel, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_nameLabel, "bottomAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 3.0));
  v49[7] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_powerLabel, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorCell contentView](self, "contentView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, -16.0));
  v49[8] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 9));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);

}

- (void)setConnectorType:(unint64_t)a3
{
  NSBundle *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  const __CFString *v10;
  UIImage *v11;
  UIImage *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v21;

  if (self->_connectorType != a3)
  {
    self->_connectorType = a3;
    v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorCell traitCollection](self, "traitCollection"));
    v8 = v6;
    v9 = v7;
    if ((uint64_t)a3 > 31)
    {
LABEL_5:
      v11 = objc_opt_new(UIImage);
    }
    else
    {
      switch(a3)
      {
        case 1uLL:
          v10 = CFSTR("Plug_J1772");
          break;
        case 2uLL:
          v10 = CFSTR("Plug_CCS1");
          break;
        case 4uLL:
          v10 = CFSTR("Plug_CCS2");
          break;
        case 8uLL:
          v10 = CFSTR("Plug_CHAdeMO");
          break;
        default:
          goto LABEL_5;
      }
      v11 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:compatibleWithTraitCollection:](UIImage, "imageNamed:inBundle:compatibleWithTraitCollection:", v10, v8, v9));
    }
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorCell iconView](self, "iconView"));
    objc_msgSend(v13, "setImage:", v12);

    v14 = sub_1006EA788(a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorCell nameLabel](self, "nameLabel"));
    objc_msgSend(v16, "setText:", v15);

    v21 = 0;
    if ((uint64_t)a3 <= 31)
    {
      switch(a3)
      {
        case 1uLL:
          goto LABEL_21;
        case 2uLL:
        case 4uLL:
        case 8uLL:
          goto LABEL_16;
        case 3uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
          goto LABEL_23;
        default:
          if (a3 == 16)
            goto LABEL_21;
          break;
      }
      goto LABEL_23;
    }
    if ((uint64_t)a3 > 127)
    {
      if (a3 != 256 && a3 != 128)
        goto LABEL_23;
LABEL_21:
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v18 = v17;
      v19 = CFSTR("EV_Routing_AC_Power");
    }
    else if (a3 == 32)
    {
LABEL_16:
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v18 = v17;
      v19 = CFSTR("EV_Routing_DC_Fast_Power");
    }
    else
    {
      if (a3 != 64)
      {
LABEL_23:
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleConnectorCell powerLabel](self, "powerLabel"));
        objc_msgSend(v20, "setText:", v21);

        return;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v18 = v17;
      v19 = CFSTR("EV_Routing_DC_Power");
    }
    v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", v19, CFSTR("localized string not found"), 0));

    goto LABEL_23;
  }
}

- (void)setActive:(BOOL)a3
{
  uint64_t v3;

  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3)
      v3 = 3;
    else
      v3 = 0;
    -[VehicleConnectorCell setAccessoryType:](self, "setAccessoryType:", v3);
  }
}

- (unint64_t)connectorType
{
  return self->_connectorType;
}

- (BOOL)isActive
{
  return self->_active;
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UILabel)powerLabel
{
  return self->_powerLabel;
}

- (void)setPowerLabel:(id)a3
{
  objc_storeStrong((id *)&self->_powerLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
