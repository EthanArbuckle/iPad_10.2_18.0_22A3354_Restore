@implementation WFTriggerSelectableCell

- (WFTriggerSelectableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFTriggerSelectableCell *v4;
  void *v5;
  void *v6;
  WFTriggerSelectableCell *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFTriggerSelectableCell;
  v4 = -[WFTriggerSelectableCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, 3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerSelectableCell detailTextLabel](v4, "detailTextLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v5);

    v7 = v4;
  }

  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFTriggerSelectableCell;
  -[WFTriggerSelectableCell prepareForReuse](&v5, sel_prepareForReuse);
  -[WFTriggerSelectableCell setAccessoryType:](self, "setAccessoryType:", 0);
  -[WFTriggerSelectableCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[WFTriggerSelectableCell detailTextLabel](self, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", 0);

}

@end
