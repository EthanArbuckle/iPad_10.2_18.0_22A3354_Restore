@implementation PTUIButtonRowTableViewCell

- (PTUIButtonRowTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PTUIButtonRowTableViewCell *v4;
  PTUIButtonRowTableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PTUIButtonRowTableViewCell;
  v4 = -[PTUIButtonRowTableViewCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PTUIButtonRowTableViewCell textLabel](v4, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTUIButtonRowTableViewCell _tableView](v5, "_tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v8);

    -[PTUIButtonRowTableViewCell textLabel](v5, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 18.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v10);

    -[PTUIButtonRowTableViewCell textLabel](v5, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextAlignment:", 1);

  }
  return v5;
}

@end
