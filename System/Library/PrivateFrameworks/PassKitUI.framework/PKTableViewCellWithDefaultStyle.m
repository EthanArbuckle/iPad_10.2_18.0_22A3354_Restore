@implementation PKTableViewCellWithDefaultStyle

- (PKTableViewCellWithDefaultStyle)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKTableViewCellWithDefaultStyle *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKTableViewCellWithDefaultStyle;
  v4 = -[PKTableViewCellWithDefaultStyle initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, 0, a4);
  -[PKTableViewCellWithDefaultStyle textLabel](v4, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);

  -[PKTableViewCellWithDefaultStyle detailTextLabel](v4, "detailTextLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);

  return v4;
}

@end
