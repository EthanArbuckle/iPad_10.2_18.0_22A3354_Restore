@implementation PRIsLowQualityDevice

void __PRIsLowQualityDevice_block_invoke()
{
  char v0;
  id v1;

  v1 = (id)MGGetStringAnswer();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("t8010")) & 1) != 0)
    v0 = 1;
  else
    v0 = objc_msgSend(v1, "isEqualToString:", CFSTR("t8011"));
  PRIsLowQualityDevice_isLowQualityDevice = v0;

}

@end
