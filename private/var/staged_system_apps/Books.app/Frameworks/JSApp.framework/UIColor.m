@implementation UIColor

+ (id)jsa_colorWithHexString:(id)a3 alpha:(double)a4
{
  void *v5;
  void *v6;
  void *v7;
  unsigned int v9;

  if (a3)
  {
    v9 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("#")));
    objc_msgSend(v5, "setCharactersToBeSkipped:", v6);

    objc_msgSend(v5, "scanHexInt:", &v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _colorWithHexValue:alpha:](UIColor, "_colorWithHexValue:alpha:", v9, a4));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)_colorWithHexValue:(unint64_t)a3 alpha:(double)a4
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", (float)((float)BYTE2(a3) / 255.0), (float)((float)BYTE1(a3) / 255.0), (float)((float)a3 / 255.0), a4);
}

@end
