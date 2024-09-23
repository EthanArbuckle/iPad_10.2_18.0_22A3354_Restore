@implementation PNPhotosChallengeUtils

+ (id)titleWithoutFormattingForTitle:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_251481610);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
