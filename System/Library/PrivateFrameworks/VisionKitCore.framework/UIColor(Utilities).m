@implementation UIColor(Utilities)

+ (uint64_t)vk_randomColor
{
  double v0;
  double v1;

  v0 = (double)arc4random_uniform(0xFFu) / 255.0;
  v1 = (double)arc4random_uniform(0xFFu) / 255.0;
  return objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v0, v1, (double)arc4random_uniform(0xFFu) / 255.0, 1.0);
}

- (uint64_t)vk_colorWith20PercentOpacity
{
  return objc_msgSend(a1, "colorWithAlphaComponent:", 0.2);
}

- (uint64_t)vk_colorWith40PercentOpacity
{
  return objc_msgSend(a1, "colorWithAlphaComponent:", 0.4);
}

- (uint64_t)vk_colorWith60PercentOpacity
{
  return objc_msgSend(a1, "colorWithAlphaComponent:", 0.6);
}

- (uint64_t)vk_colorWith80PercentOpacity
{
  return objc_msgSend(a1, "colorWithAlphaComponent:", 0.8);
}

- (id)vk_colorWithMaxSaturation
{
  double v2;
  double v3;
  uint64_t v4;
  double v5;

  v5 = 0.0;
  v3 = 0.0;
  v4 = 0;
  v2 = 0.0;
  objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v5, &v4, &v3, &v2);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithHue:saturation:brightness:alpha:", v5, 1.0, v3, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)vk_resolvedColor
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", objc_msgSend(objc_retainAutorelease(a1), "CGColor"));
}

@end
