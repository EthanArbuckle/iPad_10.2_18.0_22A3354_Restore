@implementation MTATimerBaseCell

+ (double)estimatedCellHeightForTimerWithTitle:(id)a3
{
  return 110.0;
}

- (void)awakeFromNib
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTATimerBaseCell;
  -[MTATimerBaseCell awakeFromNib](&v2, "awakeFromNib");
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTATimerBaseCell;
  -[MTATimerBaseCell setSelected:animated:](&v4, "setSelected:animated:", a3, a4);
}

@end
