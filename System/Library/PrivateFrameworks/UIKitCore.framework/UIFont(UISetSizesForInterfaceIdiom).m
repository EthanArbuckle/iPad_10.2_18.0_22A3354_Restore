@implementation UIFont(UISetSizesForInterfaceIdiom)

+ (uint64_t)_setDefaultFontSizesForUserInterfaceIdiom:()UISetSizesForInterfaceIdiom
{
  double v4;
  double v5;
  double v6;
  double v7;

  v6 = 0.0;
  v7 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  +[_UITextAttributeDefaults _getFontSizesForUserInterfaceIdiom:labelFontSize:buttonFontSize:systemFontSize:smallSystemFontSize:](_UITextAttributeDefaults, "_getFontSizesForUserInterfaceIdiom:labelFontSize:buttonFontSize:systemFontSize:smallSystemFontSize:", a3, &v7, &v6, &v5, &v4);
  objc_msgSend(off_1E167A828, "_setLabelFontSize:", v7);
  objc_msgSend(off_1E167A828, "_setButtonFontSize:", v6);
  objc_msgSend(off_1E167A828, "_setSystemFontSize:", v5);
  return objc_msgSend(off_1E167A828, "_setSmallSystemFontSize:", v4);
}

@end
