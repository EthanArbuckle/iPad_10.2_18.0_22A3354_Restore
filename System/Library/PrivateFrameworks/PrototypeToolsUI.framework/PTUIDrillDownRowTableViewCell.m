@implementation PTUIDrillDownRowTableViewCell

+ (int64_t)cellStyleForRow:(id)a3
{
  return 1;
}

- (PTUIDrillDownRowTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PTUIDrillDownRowTableViewCell *v4;
  PTUIDrillDownRowTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PTUIDrillDownRowTableViewCell;
  v4 = -[PTUIDrillDownRowTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[PTUIDrillDownRowTableViewCell setAccessoryType:](v4, "setAccessoryType:", 1);
  return v5;
}

- (void)updateDisplayedValue
{
  void *v3;
  void *v4;
  id v5;

  -[PTUIRowTableViewCell row](self, "row");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PTUIDrillDownRowTableViewCell detailTextLabel](self, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

}

@end
