@implementation TSDSwatchPickerControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDSwatchPickerController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)_tsaxResetSwatchGridViews
{
  id v3;
  char *v4;
  char *v5;
  char *v6;
  char *i;
  uint64_t v8;
  void *v9;
  Class v10;
  Class v11;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  v3 = -[TSDSwatchPickerControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("pageControl"));
  v4 = (char *)objc_msgSend(v3, "tsaxIntegerValueForKey:", CFSTR("currentPage"));
  v5 = (char *)-[TSDSwatchPickerControllerAccessibility tsaxIntegerValueForKey:](self, "tsaxIntegerValueForKey:", CFSTR("pageCount"));
  if ((uint64_t)v5 >= 1)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x3052000000;
      v16 = sub_246064;
      v17 = sub_246074;
      v18 = 0;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_246080;
      v12[3] = &unk_428E60;
      v12[4] = self;
      v12[5] = &v13;
      v12[6] = i;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v12))
        abort();
      v8 = v14[5];
      _Block_object_dispose(&v13, 8);
      LOBYTE(v13) = 0;
      v9 = (void *)objc_opt_class(TSDSwatchGridViewAccessibility);
      v10 = __TSAccessibilityCastAsSafeCategory(v9, v8, 1, &v13);
      if ((_BYTE)v13)
        abort();
      v11 = v10;
      -[objc_class tsaxInvalidateChildrenImmediately](v10, "tsaxInvalidateChildrenImmediately");
      if (v3)
        -[objc_class setAccessibilityElementsHidden:](v11, "setAccessibilityElementsHidden:", v4 != i);
    }
  }
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

- (void)loadView
{
  objc_class *v3;
  void *v4;
  char v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDSwatchPickerControllerAccessibility;
  -[TSDSwatchPickerControllerAccessibility loadView](&v6, "loadView");
  if (-[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom") == UIUserInterfaceIdiomPhone)
  {
    v5 = 0;
    v3 = (objc_class *)objc_opt_class(UIScrollView);
    v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSDSwatchPickerControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("swatchesScrollView")), 1, &v5);
    if (v5)
      abort();
    objc_msgSend(v4, "tsaxSetScrollStatusPrefersHorizontal:", 1);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDSwatchPickerControllerAccessibility;
  -[TSDSwatchPickerControllerAccessibility viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[TSDSwatchPickerControllerAccessibility _tsaxResetSwatchGridViews](self, "_tsaxResetSwatchGridViews");
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDSwatchPickerControllerAccessibility;
  -[TSDSwatchPickerControllerAccessibility scrollViewDidEndScrollingAnimation:](&v4, "scrollViewDidEndScrollingAnimation:", a3);
  -[TSDSwatchPickerControllerAccessibility _tsaxResetSwatchGridViews](self, "_tsaxResetSwatchGridViews");
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDSwatchPickerControllerAccessibility;
  -[TSDSwatchPickerControllerAccessibility scrollViewDidEndDecelerating:](&v4, "scrollViewDidEndDecelerating:", a3);
  -[TSDSwatchPickerControllerAccessibility _tsaxResetSwatchGridViews](self, "_tsaxResetSwatchGridViews");
}

- (void)p_loadScrollViewWithPage:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDSwatchPickerControllerAccessibility;
  -[TSDSwatchPickerControllerAccessibility p_loadScrollViewWithPage:](&v4, "p_loadScrollViewWithPage:", a3);
  -[TSDSwatchPickerControllerAccessibility _tsaxResetSwatchGridViews](self, "_tsaxResetSwatchGridViews");
}

@end
