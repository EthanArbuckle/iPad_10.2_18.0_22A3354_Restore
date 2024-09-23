@implementation WFTriggerButtonCell

- (WFTriggerButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFTriggerButtonCell *v4;
  void *v5;
  void *v6;
  WFTriggerButtonCell *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFTriggerButtonCell;
  v4 = -[WFTriggerButtonCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, 1, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerButtonCell detailTextLabel](v4, "detailTextLabel");
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
  v5.super_class = (Class)WFTriggerButtonCell;
  -[WFTriggerButtonCell prepareForReuse](&v5, sel_prepareForReuse);
  -[WFTriggerButtonCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[WFTriggerButtonCell detailTextLabel](self, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", 0);

}

@end
