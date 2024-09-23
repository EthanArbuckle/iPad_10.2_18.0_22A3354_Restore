@implementation GEORoadDescription

- (UIColor)accentColor
{
  void *v2;

  switch(-[GEORoadDescription navigationFriendliness](self, "navigationFriendliness"))
  {
    case 0u:
    case 1u:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
      break;
    case 2u:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
      break;
    case 3u:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
      break;
    default:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
      break;
  }
  return (UIColor *)v2;
}

@end
