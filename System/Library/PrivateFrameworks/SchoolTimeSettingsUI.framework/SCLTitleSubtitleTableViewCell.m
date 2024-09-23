@implementation SCLTitleSubtitleTableViewCell

+ (int64_t)cellStyle
{
  return 3;
}

- (SCLTitleSubtitleTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  SCLTitleSubtitleTableViewCell *v5;
  SCLTitleSubtitleTableViewCell *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SCLTitleSubtitleTableViewCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v12, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[SCLTitleSubtitleTableViewCell textLabel](v5, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberOfLines:", 0);

    -[SCLTitleSubtitleTableViewCell detailTextLabel](v6, "detailTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 0);

    -[SCLTitleSubtitleTableViewCell detailTextLabel](v6, "detailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v10);

  }
  return v6;
}

@end
