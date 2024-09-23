@implementation IMCustomSliderAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("IMCustomSlider");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory, a2);
}

- (id)_imaxTarget
{
  objc_class *v3;
  id v4;
  void *v5;
  char v7;

  v7 = 0;
  v3 = (objc_class *)objc_opt_class(IMCustomSlider);
  v4 = __IMAccessibilityCastAsClass(v3, self, 1, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v7)
    abort();
  return v5;
}

- (id)_imaxDelegate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSliderAccessibility _imaxTarget](self, "_imaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));

  return v3;
}

- (id)accessibilityLabel
{
  id v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMCustomSliderAccessibility;
  v3 = -[IMCustomSliderAccessibility accessibilityLabel](&v7, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (-[IMCustomSliderAccessibility _imaxSliderRepresentsBookPosition](self, "_imaxSliderRepresentsBookPosition"))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[IMCustomSliderAccessibility bookPositionAccessibilityLabel](self, "bookPositionAccessibilityLabel"));

    v4 = (void *)v5;
  }
  return v4;
}

- (id)accessibilityValue
{
  id v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMCustomSliderAccessibility;
  v3 = -[IMCustomSliderAccessibility accessibilityValue](&v7, "accessibilityValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (-[IMCustomSliderAccessibility _imaxSliderRepresentsBookPosition](self, "_imaxSliderRepresentsBookPosition"))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[IMCustomSliderAccessibility bookPositionAccessibilityValue](self, "bookPositionAccessibilityValue"));

    v4 = (void *)v5;
  }
  return v4;
}

- (double)_accessibilityIncreaseAmount:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  float v6;
  float v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  float v12;
  float v13;
  float v14;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSliderAccessibility _imaxTarget](self, "_imaxTarget"));
  objc_msgSend(v5, "minimumValue");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSliderAccessibility _imaxTarget](self, "_imaxTarget"));
  objc_msgSend(v8, "maximumValue");
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSliderAccessibility _imaxTarget](self, "_imaxTarget"));
  objc_msgSend(v11, "value");
  v13 = v12;

  v14 = (float)(v10 - v7) / 20.0;
  if (!v3)
    v14 = -v14;
  return (float)(v14 + v13);
}

- (void)accessibilityIncrement
{
  void *v3;
  unsigned int v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSliderAccessibility _imaxTarget](self, "_imaxTarget"));
  v4 = objc_msgSend(v3, "isUserInteractionEnabled");

  if (v4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_6E620;
    v5[3] = &unk_28B960;
    v5[4] = self;
    if (__IMAccessibilityPerformSafeBlock(v5))
      abort();
  }
}

- (void)accessibilityDecrement
{
  void *v3;
  unsigned int v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSliderAccessibility _imaxTarget](self, "_imaxTarget"));
  v4 = objc_msgSend(v3, "isUserInteractionEnabled");

  if (v4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_6E6B4;
    v5[3] = &unk_28B960;
    v5[4] = self;
    if (__IMAccessibilityPerformSafeBlock(v5))
      abort();
  }
}

- (id)bookPositionAccessibilityLabel
{
  return IMAXLocString(CFSTR("book.position.label"));
}

- (id)bookPositionAccessibilityValue
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMCustomSliderAccessibility;
  v2 = -[IMCustomSliderAccessibility accessibilityValue](&v4, "accessibilityValue");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (id)_imaxDurationStringForDuration:(double)a3
{
  NSDateComponentsFormatter *v5;
  void *v6;

  v5 = objc_opt_new(NSDateComponentsFormatter);
  -[NSDateComponentsFormatter setZeroFormattingBehavior:](v5, "setZeroFormattingBehavior:", 1);
  -[NSDateComponentsFormatter setUnitsStyle:](v5, "setUnitsStyle:", 4);
  -[NSDateComponentsFormatter setAllowedUnits:](v5, "setAllowedUnits:", 224);
  if ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
    v6 = 0;
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateComponentsFormatter stringFromTimeInterval:](v5, "stringFromTimeInterval:", a3));

  return v6;
}

- (BOOL)_imaxSliderRepresentsBookPosition
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSliderAccessibility _imaxDelegate](self, "_imaxDelegate"));
  if ((objc_opt_respondsToSelector(v3, "sliderIsProgressSlider:") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSliderAccessibility _imaxTarget](self, "_imaxTarget"));
    v5 = objc_msgSend(v3, "sliderIsProgressSlider:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
