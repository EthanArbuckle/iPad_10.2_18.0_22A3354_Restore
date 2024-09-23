@implementation MFBrush

- (int)selectInto:(id)a3
{
  objc_msgSend(a3, "setBrush:", self);
  return 0;
}

@end
