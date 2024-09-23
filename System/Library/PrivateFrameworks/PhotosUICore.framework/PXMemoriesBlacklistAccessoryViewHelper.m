@implementation PXMemoriesBlacklistAccessoryViewHelper

+ (id)avatarViewWithFrame:(CGRect)a3 person:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  PXPeopleScalableAvatarView *v9;

  if (a4)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    v8 = a4;
    v9 = -[PXPeopleScalableAvatarView initWithFrame:]([PXPeopleScalableAvatarView alloc], "initWithFrame:", x, y, width, height);
    -[PXPeopleScalableAvatarView setPerson:](v9, "setPerson:", v8);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

@end
