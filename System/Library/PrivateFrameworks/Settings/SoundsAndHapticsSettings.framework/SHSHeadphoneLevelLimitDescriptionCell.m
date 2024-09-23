@implementation SHSHeadphoneLevelLimitDescriptionCell

+ (int64_t)cellStyle
{
  return 3;
}

- (SHSHeadphoneLevelLimitDescriptionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SHSHeadphoneLevelLimitDescriptionCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SHSHeadphoneLevelLimitDescriptionCell;
  v4 = -[SHSHeadphoneLevelLimitDescriptionCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSHeadphoneLevelLimitDescriptionCell detailTextLabel](v4, "detailTextLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v5);

    -[SHSHeadphoneLevelLimitDescriptionCell detailTextLabel](v4, "detailTextLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberOfLines:", 0);

    -[SHSHeadphoneLevelLimitDescriptionCell detailTextLabel](v4, "detailTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLineBreakMode:", 0);

  }
  return v4;
}

- (void)setSeparatorStyle:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SHSHeadphoneLevelLimitDescriptionCell;
  -[SHSHeadphoneLevelLimitDescriptionCell setSeparatorStyle:](&v3, sel_setSeparatorStyle_, 0);
}

@end
