@implementation PKInk

+ (BOOL)crl_isSixChannelBlendingUsedByInkType:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", PKInkTypeMarker) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", PKInkTypeWatercolor);

  return v4;
}

@end
