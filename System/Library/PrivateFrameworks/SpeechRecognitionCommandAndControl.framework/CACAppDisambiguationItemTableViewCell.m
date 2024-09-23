@implementation CACAppDisambiguationItemTableViewCell

- (CACAppDisambiguationItemTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CACAppDisambiguationItemTableViewCell;
  return -[CACAppDisambiguationItemTableViewCell initWithStyle:reuseIdentifier:](&v5, sel_initWithStyle_reuseIdentifier_, 0, a4);
}

- (void)awakeFromNib
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CACAppDisambiguationItemTableViewCell;
  -[CACAppDisambiguationItemTableViewCell awakeFromNib](&v2, sel_awakeFromNib);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CACAppDisambiguationItemTableViewCell;
  -[CACAppDisambiguationItemTableViewCell setSelected:animated:](&v4, sel_setSelected_animated_, a3, a4);
}

@end
