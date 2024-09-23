@implementation UIView(PKDashboardAppearance)

- (void)pkui_setMaskType:()PKDashboardAppearance
{
  void *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  id v8;

  objc_msgSend(a1, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v5 = 0;
  v6 = 0.0;
  v7 = 15;
  switch(a3)
  {
    case 0:
      goto LABEL_6;
    case 1:
      v6 = 10.0;
      v5 = 1;
      v7 = 3;
      goto LABEL_6;
    case 2:
      v6 = 10.0;
      v5 = 1;
      v7 = 12;
      goto LABEL_6;
    case 3:
      v6 = 10.0;
      v5 = 1;
      v7 = 15;
LABEL_6:
      objc_msgSend(v4, "setMaskedCorners:", v7);
      v4 = v8;
      break;
    default:
      v6 = 10.0;
      v5 = 1;
      break;
  }
  objc_msgSend(v4, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
  objc_msgSend(v8, "setCornerRadius:", v6);
  objc_msgSend(v8, "setMasksToBounds:", v5);

}

@end
