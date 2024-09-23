@implementation IMTouchInsetsButtonAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("IMTouchInsetsButton");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory, a2);
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v13;
  double v14;
  double v15;
  double v16;
  _QWORD v17[6];
  uint64_t v18;
  double *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x4010000000;
  v21 = &unk_2180C6;
  v22 = 0u;
  v23 = 0u;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_56CD4;
  v17[3] = &unk_28B700;
  v17[4] = self;
  v17[5] = &v18;
  IMAXAccessibilityPerformSafeBlock(v17);
  -[IMTouchInsetsButtonAccessibility bounds](self, "bounds");
  v3 = v19[4];
  v4 = v19[5];
  v24.origin.x = v5 + v4;
  v24.origin.y = v6 + v3;
  v24.size.width = v7 - (v4 + v19[7]);
  v24.size.height = v8 - (v3 + v19[6]);
  v25 = UIAccessibilityConvertFrameToScreenCoordinates(v24, (UIView *)self);
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  _Block_object_dispose(&v18, 8);
  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

@end
