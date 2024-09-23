@implementation CarplayPaddingTableViewCell

- (CarplayPaddingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CarplayPaddingTableViewCell *v4;
  CarplayPaddingTableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CarplayPaddingTableViewCell;
  v4 = -[CarplayPaddingTableViewCell initWithStyle:reuseIdentifier:](&v10, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayPaddingTableViewCell heightAnchor](v4, "heightAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToConstant:", 20.0));
    objc_msgSend(v7, "setActive:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[CarplayPaddingTableViewCell setBackgroundColor:](v5, "setBackgroundColor:", v8);

    -[CarplayPaddingTableViewCell setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
  }
  return v5;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

@end
