@implementation CarCollectionCell

- (CarCollectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CarCollectionCell *v4;
  CarCollectionCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CarCollectionCell;
  v4 = -[CarCollectionCell initWithStyle:reuseIdentifier:](&v17, "initWithStyle:reuseIdentifier:", 3, a4);
  v5 = v4;
  if (v4)
  {
    -[CarCollectionCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("CarCollectionCell"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionCell textLabel](v5, "textLabel"));
    objc_msgSend(v6, "setNumberOfLines:", 2);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCallout, UIFontWeightMedium));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionCell textLabel](v5, "textLabel"));
    objc_msgSend(v8, "setFont:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionCell textLabel](v5, "textLabel"));
    objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionCell detailTextLabel](v5, "detailTextLabel"));
    objc_msgSend(v10, "setNumberOfLines:", 2);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:grade:](UIFont, "_mapsCar_fontForTextStyle:weight:grade:", UIFontTextStyleCaption2, 3, UIFontWeightRegular));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionCell detailTextLabel](v5, "detailTextLabel"));
    objc_msgSend(v12, "setFont:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionCell detailTextLabel](v5, "detailTextLabel"));
    objc_msgSend(v14, "setTextColor:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionCell detailTextLabel](v5, "detailTextLabel"));
    objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("DetailLabel"));

  }
  return v5;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarCollectionCell;
  -[CarCollectionCell prepareForReuse](&v5, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionCell textLabel](self, "textLabel"));
  objc_msgSend(v3, "setText:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v4, "setText:", 0);

}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CarCollectionCell;
  -[CarCollectionCell setHighlighted:animated:](&v12, "setHighlighted:animated:", a3, a4);
  if (v4)
    v6 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
  else
    v6 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v7 = (void *)v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionCell textLabel](self, "textLabel"));
  objc_msgSend(v8, "setTextColor:", v7);

  if (v4)
    v9 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusPrimaryColor](UIColor, "_carSystemFocusPrimaryColor"));
  else
    v9 = objc_claimAutoreleasedReturnValue(+[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor"));
  v10 = (void *)v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v11, "setTextColor:", v10);

}

+ (id)reuseIdentifier
{
  return CFSTR("CarCollectionCellReuseIdentifier");
}

- (void)setupWithCollectionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionCell textLabel](self, "textLabel"));
  objc_msgSend(v6, "setText:", v5);

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subtitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v7, "setText:", v8);

}

@end
