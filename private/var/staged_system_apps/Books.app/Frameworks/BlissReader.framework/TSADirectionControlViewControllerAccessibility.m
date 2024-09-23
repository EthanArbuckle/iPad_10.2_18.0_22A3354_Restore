@implementation TSADirectionControlViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSADirectionControlViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (TSADirectionControlViewAccessibilityElement)_tsaxDirectionElement
{
  return (TSADirectionControlViewAccessibilityElement *)__TSAccessibilityGetAssociatedObject(self, &unk_543883);
}

- (void)_tsaxSetDirectionElement:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_543883, a3);
}

- (UIButton)_tsaxLastSelectedButton
{
  return (UIButton *)__TSAccessibilityGetAssociatedObject(self, &unk_543884);
}

- (void)_tsaxSetLastSelectedButton:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_543884, a3);
}

- (id)tsaxDirectionView
{
  objc_class *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIView);
  result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSADirectionControlViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("directionView")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSADirectionControlViewControllerAccessibility;
  -[TSADirectionControlViewControllerAccessibility viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[TSADirectionControlViewControllerAccessibility _tsaxApplyAccessibilityInfo](self, "_tsaxApplyAccessibilityInfo");
}

- (void)p_selectDetentForButton:(id)a3 forEvent:(id)a4
{
  UIButton *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSADirectionControlViewControllerAccessibility;
  -[TSADirectionControlViewControllerAccessibility p_selectDetentForButton:forEvent:](&v6, "p_selectDetentForButton:forEvent:", a3, a4);
  v5 = -[TSADirectionControlViewControllerAccessibility _tsaxSelectedButton](self, "_tsaxSelectedButton");
  if (v5 != -[TSADirectionControlViewControllerAccessibility _tsaxLastSelectedButton](self, "_tsaxLastSelectedButton"))
  {
    TSAccessibilityPostHighPriorityAnnouncementNotification((uint64_t)self, (uint64_t)-[TSADirectionControlViewControllerAccessibility _tsaxStringForDirection:](self, "_tsaxStringForDirection:", -[TSADirectionControlViewControllerAccessibility _tsaxDirectionForButton:](self, "_tsaxDirectionForButton:", v5)));
    -[TSADirectionControlViewControllerAccessibility _tsaxSetLastSelectedButton:](self, "_tsaxSetLastSelectedButton:", v5);
  }
}

- (void)touchUpInsideButton:(id)a3 forEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSADirectionControlViewControllerAccessibility;
  -[TSADirectionControlViewControllerAccessibility touchUpInsideButton:forEvent:](&v5, "touchUpInsideButton:forEvent:", a3, a4);
  TSAccessibilityPostHighPriorityAnnouncementNotification((uint64_t)self, (uint64_t)-[TSADirectionControlViewControllerAccessibility accessibilityValue](self, "accessibilityValue"));
  -[TSADirectionControlViewControllerAccessibility _tsaxSetLastSelectedButton:](self, "_tsaxSetLastSelectedButton:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[TSADirectionControlViewAccessibilityElement setDirectionViewController:](-[TSADirectionControlViewControllerAccessibility _tsaxDirectionElement](self, "_tsaxDirectionElement"), "setDirectionViewController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TSADirectionControlViewControllerAccessibility;
  -[TSADirectionControlViewControllerAccessibility dealloc](&v3, "dealloc");
}

- (id)accessibilityValue
{
  return -[TSADirectionControlViewControllerAccessibility _tsaxStringForDirection:](self, "_tsaxStringForDirection:", -[TSADirectionControlViewControllerAccessibility _tsaxDirection](self, "_tsaxDirection"));
}

- (void)accessibilityIncrement
{
  -[TSADirectionControlViewControllerAccessibility _tsaxBumpValue:](self, "_tsaxBumpValue:", 1);
}

- (void)accessibilityDecrement
{
  -[TSADirectionControlViewControllerAccessibility _tsaxBumpValue:](self, "_tsaxBumpValue:", 0);
}

- (void)tsaxLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSADirectionControlViewControllerAccessibility;
  -[TSADirectionControlViewControllerAccessibility tsaxLoadAccessibilityInformation](&v3, "tsaxLoadAccessibilityInformation");
  -[TSADirectionControlViewControllerAccessibility _tsaxApplyAccessibilityInfo](self, "_tsaxApplyAccessibilityInfo");
}

- (unint64_t)_tsaxDirection
{
  return (unint64_t)-[TSADirectionControlViewControllerAccessibility tsaxUnsignedIntegerValueForKey:](self, "tsaxUnsignedIntegerValueForKey:", CFSTR("direction"));
}

- (unint64_t)_tsaxDirectionType
{
  return (unint64_t)-[TSADirectionControlViewControllerAccessibility tsaxUnsignedIntegerValueForKey:](self, "tsaxUnsignedIntegerValueForKey:", CFSTR("directionType"));
}

- (NSArray)_tsaxAllButtons
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  Class v11;
  Class v12;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v4 = objc_msgSend(-[TSADirectionControlViewControllerAccessibility tsaxDirectionView](self, "tsaxDirectionView"), "subviews");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v14 = 0;
        v10 = (void *)objc_opt_class(UIButton);
        v11 = __TSAccessibilityCastAsSafeCategory(v10, v9, 1, &v14);
        if (v14)
          abort();
        v12 = v11;
        if (v11 != (Class)-[TSADirectionControlViewControllerAccessibility _tsaxArrowButton](self, "_tsaxArrowButton")
          && v12 != (Class)-[TSADirectionControlViewControllerAccessibility _tsaxBackgroundButton](self, "_tsaxBackgroundButton"))
        {
          objc_msgSend(v3, "tsaxAddObjectIfNotNil:", v12);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v3);
}

- (UIButton)_tsaxSelectedButton
{
  NSArray *v2;
  id v3;
  id v4;
  UIButton *v5;
  uint64_t v6;
  void *i;
  UIButton *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v2 = -[TSADirectionControlViewControllerAccessibility _tsaxAllButtons](self, "_tsaxAllButtons");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(v2);
      v8 = *(UIButton **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
      if (-[UIButton isSelected](v8, "isSelected"))
        v5 = v8;
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v4);
  return v5;
}

- (UIButton)_tsaxArrowButton
{
  objc_class *v3;
  UIButton *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIButton);
  result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSADirectionControlViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("arrowButton")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (UIButton)_tsaxBackgroundButton
{
  objc_class *v3;
  UIButton *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIButton);
  result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSADirectionControlViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("backgroundButton")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (UIButton)_tsaxUpButton
{
  objc_class *v3;
  UIButton *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIButton);
  result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSADirectionControlViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("upButton")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (UIButton)_tsaxDownButton
{
  objc_class *v3;
  UIButton *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIButton);
  result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSADirectionControlViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("downButton")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (UIButton)_tsaxLeftButton
{
  objc_class *v3;
  UIButton *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIButton);
  result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSADirectionControlViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("leftButton")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (UIButton)_tsaxRightButton
{
  objc_class *v3;
  UIButton *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIButton);
  result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSADirectionControlViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("rightButton")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (UIButton)_tsaxTopLeftButton
{
  objc_class *v3;
  UIButton *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIButton);
  result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSADirectionControlViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("topLeftButton")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (UIButton)_tsaxTopRightButton
{
  objc_class *v3;
  UIButton *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIButton);
  result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSADirectionControlViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("topRightButton")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (UIButton)_tsaxBottomLeftButton
{
  objc_class *v3;
  UIButton *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIButton);
  result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSADirectionControlViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("bottomLeftButton")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (UIButton)_tsaxBottomRightButton
{
  objc_class *v3;
  UIButton *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIButton);
  result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSADirectionControlViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("bottomRightButton")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (void)_tsaxBumpValue:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  unint64_t v6;
  int v7;
  int v8;
  _QWORD v9[6];

  v3 = a3;
  v5 = -[TSADirectionControlViewControllerAccessibility _tsaxDirectionType](self, "_tsaxDirectionType");
  v6 = -[TSADirectionControlViewControllerAccessibility _tsaxDirection](self, "_tsaxDirection");
  if (v5 <= 4 && ((0x1Du >> v5) & 1) != 0)
  {
    v7 = dword_31FEC0[2 * v5];
    v8 = dword_31FEE8[2 * v5];
    if (v6 <= 7)
      LOBYTE(v7) = v6;
    if (!v3)
      v8 = -v8;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_2370C8;
    v9[3] = &unk_427240;
    v9[4] = self;
    v9[5] = ((_BYTE)v8 + (_BYTE)v7) & 7;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v9))
      abort();
  }
}

- (void)_tsaxApplyAccessibilityInfo
{
  TSADirectionControlViewAccessibilityElement *v3;
  TSADirectionControlViewAccessibilityElement *v4;

  if (!-[TSADirectionControlViewControllerAccessibility _tsaxDirectionElement](self, "_tsaxDirectionElement"))
  {
    v3 = -[TSADirectionControlViewAccessibilityElement initWithAccessibilityContainer:]([TSADirectionControlViewAccessibilityElement alloc], "initWithAccessibilityContainer:", -[TSADirectionControlViewControllerAccessibility tsaxDirectionView](self, "tsaxDirectionView"));
    -[TSADirectionControlViewAccessibilityElement setDirectionViewController:](v3, "setDirectionViewController:", self);
    -[TSADirectionControlViewControllerAccessibility _tsaxSetDirectionElement:](self, "_tsaxSetDirectionElement:", v3);
    v4 = v3;
    objc_msgSend(-[TSADirectionControlViewControllerAccessibility tsaxDirectionView](self, "tsaxDirectionView"), "setAccessibilityElements:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v4, 1));
  }
}

- (id)_tsaxStringForDirection:(unint64_t)a3
{
  if (a3 > 7)
    return TSAccessibilityLocalizedString((uint64_t)CFSTR("cardinal.Undefined"));
  else
    return TSAccessibilityLocalizedString((uint64_t)off_43BC90[a3]);
}

- (unint64_t)_tsaxDirectionForButton:(id)a3
{
  if (-[TSADirectionControlViewControllerAccessibility _tsaxUpButton](self, "_tsaxUpButton") == a3)
    return 0;
  if (-[TSADirectionControlViewControllerAccessibility _tsaxTopRightButton](self, "_tsaxTopRightButton") == a3)
    return 1;
  if (-[TSADirectionControlViewControllerAccessibility _tsaxRightButton](self, "_tsaxRightButton") == a3)
    return 2;
  if (-[TSADirectionControlViewControllerAccessibility _tsaxBottomRightButton](self, "_tsaxBottomRightButton") == a3)
    return 3;
  if (-[TSADirectionControlViewControllerAccessibility _tsaxDownButton](self, "_tsaxDownButton") == a3)
    return 4;
  if (-[TSADirectionControlViewControllerAccessibility _tsaxBottomLeftButton](self, "_tsaxBottomLeftButton") == a3)
    return 5;
  if (-[TSADirectionControlViewControllerAccessibility _tsaxLeftButton](self, "_tsaxLeftButton") == a3)
    return 6;
  if (-[TSADirectionControlViewControllerAccessibility _tsaxTopLeftButton](self, "_tsaxTopLeftButton") == a3)
    return 7;
  return 16;
}

@end
