@implementation UIFont(PVAdditions)

+ (id)pv_fontWithName:()PVAdditions size:transform:
{
  id v6;

  v6 = 0;
  OZXCreateFontWithName(a3, a5, a4, (const __CTFont **)&v6);
  return v6;
}

@end
