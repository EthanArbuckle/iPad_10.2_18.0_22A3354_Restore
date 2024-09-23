@implementation SCLMultilineTableViewCell

+ (int64_t)cellStyle
{
  return 1;
}

- (SCLMultilineTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  SCLMultilineTableViewCell *v5;
  SCLMultilineTableViewCell *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCLMultilineTableViewCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v9, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[PSTableCell titleLabel](v5, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberOfLines:", 0);
    objc_msgSend(v7, "setLineBreakMode:", 0);

  }
  return v6;
}

@end
