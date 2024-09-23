@implementation UIStatusBarExternalForegroundStyleAttributes

- (double)scale
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;

  +[UIScreen _carScreen](UIScreen, "_carScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  objc_msgSend(v5, "scale");
  v7 = v6;

  return v7;
}

- (BOOL)usesVerticalLayout
{
  return 1;
}

- (double)standardPadding
{
  return 7.0;
}

- (double)middlePadding
{
  return 0.0;
}

- (double)leftEdgePadding
{
  return 0.0;
}

- (double)rightEdgePadding
{
  return 0.0;
}

- (UIEdgeInsets)edgeInsetsForBatteryInsides
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  -[UIStatusBarExternalForegroundStyleAttributes scale](self, "scale");
  if (v2 <= 2.5)
    v3 = 4.5;
  else
    v3 = 4.33333333;
  v4 = 2.0;
  v5 = 2.0;
  v6 = 2.0;
  result.right = v3;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)edgeInsetsForBluetoothBatteryInsides
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 6.5;
  v3 = 1.0;
  v4 = 6.0;
  v5 = 1.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (int64_t)activityIndicatorStyleWithSyncActivity:(BOOL)a3
{
  if (a3)
    return 18;
  else
    return 17;
}

- (id)makeTextFontForStyle:(int64_t)a3
{
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v6 = 12.0;
  switch(a3)
  {
    case 1:
      goto LABEL_4;
    case 3:
      v6 = 16.0;
      goto LABEL_4;
    case 4:
      v9 = off_1E167A828;
      v10 = *(double *)off_1E167DC70;
      v11 = 10.0;
      goto LABEL_7;
    case 5:
      v9 = off_1E167A828;
      v10 = *(double *)off_1E167DC78;
      v11 = 11.0;
LABEL_7:
      objc_msgSend(v9, "monospacedDigitSystemFontOfSize:weight:", v11, v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 12.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIStatusBarExternalForegroundStyleAttributes.m"), 99, CFSTR("font requested for style %ld but font size was not determined"), a3);

      v6 = 0.0;
LABEL_4:
      objc_msgSend(off_1E167A828, "systemFontOfSize:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v8;
}

- (double)textOffsetForStyle:(int64_t)a3
{
  return 1.0;
}

- (id)textForNetworkType:(int)a3
{
  __CFString *v3;
  void *v4;
  objc_super v6;

  if (a3)
  {
    if (a3 != 4)
    {
      v6.receiver = self;
      v6.super_class = (Class)UIStatusBarExternalForegroundStyleAttributes;
      -[UIStatusBarForegroundStyleAttributes textForNetworkType:](&v6, sel_textForNetworkType_);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
    v3 = CFSTR("LTE");
  }
  else
  {
    v3 = CFSTR("GPRS");
  }
  _UINSLocalizedStringWithDefaultValue(v3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

@end
