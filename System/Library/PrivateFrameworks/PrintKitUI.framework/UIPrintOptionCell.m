@implementation UIPrintOptionCell

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPrintOptionCell;
  -[UIPrintOptionCell prepareForReuse](&v3, sel_prepareForReuse);
  -[UIPrintOptionCell setAccessoryView:](self, "setAccessoryView:", 0);
  -[UIPrintOptionCell setContentConfiguration:](self, "setContentConfiguration:", 0);
}

@end
