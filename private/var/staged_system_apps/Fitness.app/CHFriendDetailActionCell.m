@implementation CHFriendDetailActionCell

- (CHFriendDetailActionCell)initWithFrame:(CGRect)a3
{
  return (CHFriendDetailActionCell *)sub_1002FBC4C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (double)preferredCellHeight
{
  return 42.0;
}

- (CHFriendDetailActionCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002FC494();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CHFriendDetailActionCell_accessoryImageView));
}

@end
