@implementation UIImageView

+ (id)ic_defaultListAccessoryViewImage
{
  return +[UIImage ic_systemImageNamed:textStyle:scale:](UIImage, "ic_systemImageNamed:textStyle:scale:", CFSTR("chevron.forward"), UIFontTextStyleHeadline, 1);
}

+ (id)ic_accessibilityListAccessoryViewImage
{
  return +[UIImage ic_systemImageNamed:textStyle:scale:](UIImage, "ic_systemImageNamed:textStyle:scale:", CFSTR("chevron.forward.circle.fill"), UIFontTextStyleHeadline, 2);
}

@end
