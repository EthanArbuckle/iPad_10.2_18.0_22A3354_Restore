@implementation _UIInterfaceActionBlendingBorderView

+ (BOOL)isBorderView
{
  return 1;
}

+ (id)newWithRoundedCornerPosition:(unint64_t)a3 continuousCornerRadius:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = objc_alloc((Class)objc_opt_class());
  +[UIColor _vibrantLightDividerBurnColor](UIColor, "_vibrantLightDividerBurnColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor _vibrantLightDividerDarkeningColor](UIColor, "_vibrantLightDividerDarkeningColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithCompositingBurnColor:plusDColor:", v7, v8);

  if (a3)
  {
    objc_msgSend(v9, "setRoundedCornerPosition:", a3);
    objc_msgSend(v9, "_setContinuousCornerRadius:", a4);
  }
  return v9;
}

@end
