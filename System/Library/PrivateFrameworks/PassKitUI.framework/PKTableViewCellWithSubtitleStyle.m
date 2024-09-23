@implementation PKTableViewCellWithSubtitleStyle

- (PKTableViewCellWithSubtitleStyle)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKTableViewCellWithSubtitleStyle *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKTableViewCellWithSubtitleStyle;
  v4 = -[PKTableViewCellWithSubtitleStyle initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, 3, a4);
  -[PKTableViewCellWithSubtitleStyle textLabel](v4, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);

  -[PKTableViewCellWithSubtitleStyle detailTextLabel](v4, "detailTextLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);

  return v4;
}

@end
