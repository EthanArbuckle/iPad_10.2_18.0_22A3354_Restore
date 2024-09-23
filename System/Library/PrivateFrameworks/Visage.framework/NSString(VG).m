@implementation NSString(VG)

+ (id)vg_descriptionForFourCharCode:()VG
{
  int v3;
  _BYTE v5[5];

  if (a3 == 32)
    v3 = 1095911234;
  else
    v3 = a3;
  v5[0] = HIBYTE(v3);
  v5[1] = BYTE2(v3);
  v5[2] = BYTE1(v3);
  v5[3] = v3;
  v5[4] = 0;
  objc_msgSend(a1, "stringWithCString:encoding:", v5, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
