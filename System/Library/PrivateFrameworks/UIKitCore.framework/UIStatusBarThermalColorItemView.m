@implementation UIStatusBarThermalColorItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v5;
  int v6;
  _BOOL4 v7;
  int thermalColor;
  BOOL result;

  v5 = objc_msgSend(a3, "rawData");
  v6 = *(_DWORD *)(v5 + 2268);
  v7 = *(_BYTE *)(v5 + 2272) & 1;
  thermalColor = self->_thermalColor;
  result = v6 != thermalColor;
  if (v6 != thermalColor)
    self->_thermalColor = v6;
  if (v7 != self->_sunlightMode)
  {
    self->_sunlightMode = v7;
    return 1;
  }
  return result;
}

- (id)contentsImage
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  _QWORD *ContextStack;
  CGContext *v9;
  double v10;
  void *v11;
  _QWORD *v12;
  CGContext *v13;
  void *v14;
  void *v15;

  -[UIView bounds](self, "bounds");
  v4 = (v3 + -10.0) * 0.5;
  -[UIStatusBarItemView shadowPadding](self, "shadowPadding");
  v6 = v5;
  v7 = v5 + v5 + 10.0;
  -[UIStatusBarItemView beginImageContextWithMinimumWidth:](self, "beginImageContextWithMinimumWidth:", v7);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v9 = 0;
  else
    v9 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  v10 = floor(v4);
  CGContextSaveGState(v9);
  CGContextTranslateCTM(v9, v6, 0.0);
  -[UIStatusBarThermalColorItemView _color](self, "_color");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "set");

  if (self->_sunlightMode)
  {
    v12 = GetContextStack(0);
    if (*(int *)v12 < 1)
      v13 = 0;
    else
      v13 = (CGContext *)v12[3 * (*(_DWORD *)v12 - 1) + 1];
    CGContextSetLineWidth(v13, 3.0);
    UIRectFrameUsingOperation(1, 0.0, v10, 10.0, 10.0);
  }
  else
  {
    UIRectFillUsingOperation(1, 0.0, v10, 10.0, 10.0);
  }
  -[UIStatusBarItemView imageFromImageContextClippedToWidth:](self, "imageFromImageContextClippedToWidth:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CGContextRestoreGState(v9);
  -[UIStatusBarItemView endImageContext](self, "endImageContext");
  +[_UILegibilityImageSet imageFromImage:withShadowImage:](_UILegibilityImageSet, "imageFromImage:withShadowImage:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_color
{
  void *v2;
  id result;

  switch(self->_thermalColor)
  {
    case 1:
      +[UIColor yellowColor](UIColor, "yellowColor");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
      +[UIColor orangeColor](UIColor, "orangeColor");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      +[UIColor redColor](UIColor, "redColor");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4:
      +[UIColor purpleColor](UIColor, "purpleColor");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 5:
      +[UIColor blueColor](UIColor, "blueColor");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 6:
      +[UIColor whiteColor](UIColor, "whiteColor");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      result = v2;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

@end
