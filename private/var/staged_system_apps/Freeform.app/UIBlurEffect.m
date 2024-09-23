@implementation UIBlurEffect

+ (int64_t)crl_standardVibrantBackgroundStyle
{
  return 9;
}

+ (id)crl_standardVibrantBackgroundEffect
{
  return +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", objc_msgSend(a1, "crl_standardVibrantBackgroundStyle"));
}

+ (id)crl_popoverVibrantBackgroundEffect
{
  return +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", objc_msgSend(a1, "crl_popoverVibrantBackgroundStyle"));
}

@end
