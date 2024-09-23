@implementation UIColorPickerViewController

- (void)crl_ifVisuallyDifferentSetSelectedColor:(id)a3
{
  -[UIColorPickerViewController crl_ifVisuallyDifferentSetSelectedColor:preservingColorSpaceIfPossible:](self, "crl_ifVisuallyDifferentSetSelectedColor:preservingColorSpaceIfPossible:", a3, 0);
}

- (void)crl_ifVisuallyDifferentSetSelectedColor:(id)a3 preservingColorSpaceIfPossible:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  uint64_t v10;
  id v11;

  v4 = a4;
  v6 = a3;
  v11 = v6;
  if (!v6
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIColorPickerViewController selectedColor](self, "selectedColor")),
        v8 = objc_msgSend(v11, "_isSimilarToColor:withinPercentage:", v7, 0.0009765625),
        v7,
        v6 = v11,
        (v8 & 1) == 0))
  {
    v9 = v6;
    if (v4)
    {
      v10 = objc_claimAutoreleasedReturnValue(-[UIColorPickerViewController p_colorToSelectFromColorMatchingSelectedColorSpaceIfPossible:](self, "p_colorToSelectFromColorMatchingSelectedColorSpaceIfPossible:", v9));

      v9 = (id)v10;
    }
    -[UIColorPickerViewController setSelectedColor:](self, "setSelectedColor:", v9);

    v6 = v11;
  }

}

- (id)p_colorToSelectFromColorMatchingSelectedColorSpaceIfPossible:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  CGColor *v12;
  CGColorSpace *v13;
  CGColor *CopyByMatchingToColorSpace;

  v4 = a3;
  v5 = -[UIColorPickerViewController p_isColorSpaceP3ForColor:](self, "p_isColorSpaceP3ForColor:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIColorPickerViewController selectedColor](self, "selectedColor"));
  v7 = -[UIColorPickerViewController p_isColorSpaceP3ForColor:](self, "p_isColorSpaceP3ForColor:", v6);

  v8 = v4;
  v9 = v8;
  v10 = v8;
  if (v7)
  {
    v10 = v8;
    if ((v5 & 1) == 0)
    {
      v11 = objc_retainAutorelease(v8);
      v12 = (CGColor *)objc_msgSend(v11, "CGColor");
      v13 = (CGColorSpace *)sub_100011BA0();
      CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v13, kCGRenderingIntentDefault, v12, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", CopyByMatchingToColorSpace));

      CGColorRelease(CopyByMatchingToColorSpace);
    }
  }

  return v10;
}

- (BOOL)p_isColorSpaceP3ForColor:(id)a3
{
  CGColorSpace *ColorSpace;
  CFStringRef Name;

  ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(objc_retainAutorelease(a3), "CGColor"));
  Name = CGColorSpaceGetName(ColorSpace);
  if (Name)
    LOBYTE(Name) = CFEqual(Name, kCGColorSpaceDisplayP3) != 0;
  return (char)Name;
}

@end
