@implementation UIView(NCPlatterShadowAdditions)

- (BOOL)nc_isPlatterSubordinateIconShadowEnabled
{
  void *v1;
  double v2;
  double v3;
  _BOOL8 v4;
  double v5;
  CGColor *v6;
  id v7;

  objc_msgSend(a1, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shadowOpacity");
  if (!BSFloatEqualToFloat())
    goto LABEL_7;
  objc_msgSend(v1, "shadowRadius");
  if (v2 != 7.0)
    goto LABEL_7;
  objc_msgSend(v1, "shadowOffset");
  v4 = 0;
  if (v5 == 0.0 && v3 == 3.0)
  {
    if (objc_msgSend(v1, "shadowColor"))
    {
      v6 = (CGColor *)objc_msgSend(v1, "shadowColor");
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v4 = CGColorEqualToColor(v6, (CGColorRef)objc_msgSend(v7, "CGColor"));

      goto LABEL_8;
    }
LABEL_7:
    v4 = 0;
  }
LABEL_8:

  return v4;
}

- (void)nc_setPlatterSubordinateIconShadowEnabled:()NCPlatterShadowAdditions
{
  void *v4;
  double v5;
  id v6;
  double v7;
  id v8;

  objc_msgSend(a1, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (a3)
  {
    objc_msgSend(v4, "setShadowPathIsBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "setShadowColor:", objc_msgSend(v6, "CGColor"));

    LODWORD(v7) = 1045220557;
    objc_msgSend(v8, "setShadowOpacity:", v7);
    objc_msgSend(v8, "setShadowOffset:", 0.0, 3.0);
    objc_msgSend(v8, "setShadowRadius:", 7.0);
  }
  else
  {
    LODWORD(v5) = 0;
    objc_msgSend(v4, "setShadowOpacity:", v5);
  }

}

@end
