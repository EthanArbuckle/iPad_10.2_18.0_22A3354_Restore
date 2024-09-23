@implementation PTUIChoiceRowTableViewCell

+ (int64_t)cellStyleForRow:(id)a3
{
  return 1;
}

- (PTUIChoiceRowTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PTUIChoiceRowTableViewCell *v4;
  PTUIChoiceRowTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PTUIChoiceRowTableViewCell;
  v4 = -[PTUIChoiceRowTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[PTUIChoiceRowTableViewCell setAccessoryType:](v4, "setAccessoryType:", 1);
  return v5;
}

- (void)updateDisplayedValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  -[PTUIRowTableViewCell row](self, "row");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "indexPathForValue:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "row");
  v6 = objc_msgSend(v4, "section");
  objc_msgSend(v12, "shortTitleForRow:inSection:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v12, "titleForRow:inSection:", v5, v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  -[PTUIChoiceRowTableViewCell detailTextLabel](self, "detailTextLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

}

@end
