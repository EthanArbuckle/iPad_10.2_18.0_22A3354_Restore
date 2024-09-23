@implementation STTimeTitleDetailCell

- (STTimeTitleDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  STTimeTitleDetailCell *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STTimeTitleDetailCell;
  v5 = -[STTimeTitleDetailCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4, a5);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellBlueTextColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STTimeTitleDetailCell detailTextLabel](v5, "detailTextLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v6);

  }
  return v5;
}

@end
