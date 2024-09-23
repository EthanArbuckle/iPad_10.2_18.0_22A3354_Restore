@implementation DBSDisplayTableViewCell

- (DBSDisplayTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  DBSDisplayTableViewCell *v6;
  DBSDisplayTableViewCell *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DBSDisplayTableViewCell;
  v6 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v11, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v7 = v6;
  if (a3 == 1 && v6)
  {
    v8 = (void *)objc_opt_new();
    -[DBSDisplayTableViewCell setLayoutManager:](v7, "setLayoutManager:", v8);

    -[DBSDisplayTableViewCell imageView](v7, "imageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentMode:", 1);

  }
  return v7;
}

@end
