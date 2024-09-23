@implementation UIColor(Weather)

+ (id)wa_colorFromHexString:()Weather
{
  void *v0;
  void *v1;
  int v3;

  v3 = 0;
  objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setScanLocation:", 1);
  objc_msgSend(v0, "scanHexInt:", &v3);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", (double)BYTE2(v3) / 255.0, (double)BYTE1(v3) / 255.0, (double)v3 / 255.0, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
