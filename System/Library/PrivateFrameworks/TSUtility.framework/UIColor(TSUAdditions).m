@implementation UIColor(TSUAdditions)

+ (uint64_t)checkerboardColorWithColor:()TSUAdditions andColor:squareSize:
{
  CGFloat width;
  CGFloat height;
  UIImage *ImageFromCurrentImageContext;
  CGSize v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v14.width = a1 + a1;
  width = v14.width;
  v14.height = a2 + a2;
  height = v14.height;
  UIGraphicsBeginImageContext(v14);
  objc_msgSend(a5, "setFill");
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.width = width;
  v15.size.height = height;
  UIRectFill(v15);
  objc_msgSend(a6, "setFill");
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = a1;
  v16.size.height = a2;
  UIRectFill(v16);
  v17.origin.x = a1;
  v17.origin.y = a2;
  v17.size.width = a1;
  v17.size.height = a2;
  UIRectFill(v17);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  if (ImageFromCurrentImageContext)
    return objc_msgSend(MEMORY[0x24BDF6950], "colorWithPatternImage:", ImageFromCurrentImageContext);
  else
    return 0;
}

+ (id)grayCheckerboardColor
{
  id result;
  uint64_t v3;

  result = (id)grayCheckerboardColor_sColor;
  if (!grayCheckerboardColor_sColor)
  {
    v3 = objc_msgSend(MEMORY[0x24BDF6950], "darkGrayColor");
    result = (id)objc_msgSend(a1, "checkerboardColorWithColor:andColor:squareSize:", v3, objc_msgSend(MEMORY[0x24BDF6950], "lightGrayColor"), 16.0, 16.0);
    grayCheckerboardColor_sColor = (uint64_t)result;
  }
  return result;
}

+ (id)transparentGrayCheckerboardColor
{
  id result;
  uint64_t v3;

  result = (id)transparentGrayCheckerboardColor_sColor;
  if (!transparentGrayCheckerboardColor_sColor)
  {
    v3 = objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.25);
    result = (id)objc_msgSend(a1, "checkerboardColorWithColor:andColor:squareSize:", v3, objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.25), 16.0, 16.0);
    transparentGrayCheckerboardColor_sColor = (uint64_t)result;
  }
  return result;
}

+ (uint64_t)tableViewCellDarkBlueTextColor
{
  uint64_t result;

  result = tableViewCellDarkBlueTextColor_sColor;
  if (!tableViewCellDarkBlueTextColor_sColor)
  {
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDF6950]), "initWithRed:green:blue:alpha:", 0.219607843, 0.329411765, 0.529411765, 1.0);
    tableViewCellDarkBlueTextColor_sColor = result;
  }
  return result;
}

@end
