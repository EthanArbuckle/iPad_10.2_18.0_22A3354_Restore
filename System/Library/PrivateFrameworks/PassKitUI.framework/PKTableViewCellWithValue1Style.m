@implementation PKTableViewCellWithValue1Style

- (PKTableViewCellWithValue1Style)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKTableViewCellWithValue1Style *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKTableViewCellWithValue1Style;
  v4 = -[PKTableViewCellWithValue1Style initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, 1, a4);
  -[PKTableViewCellWithValue1Style textLabel](v4, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);

  -[PKTableViewCellWithValue1Style detailTextLabel](v4, "detailTextLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);

  return v4;
}

@end
