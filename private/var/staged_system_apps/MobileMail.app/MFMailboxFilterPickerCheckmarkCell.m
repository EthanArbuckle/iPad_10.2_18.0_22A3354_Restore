@implementation MFMailboxFilterPickerCheckmarkCell

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFMailboxFilterPickerCheckmarkCell;
  -[MFMailboxFilterPickerCheckmarkCell setSelected:animated:](&v7, "setSelected:animated:", a3, a4);
  if (v4)
    v6 = 3;
  else
    v6 = 0;
  -[MFMailboxFilterPickerCheckmarkCell setAccessoryType:](self, "setAccessoryType:", v6);
}

@end
