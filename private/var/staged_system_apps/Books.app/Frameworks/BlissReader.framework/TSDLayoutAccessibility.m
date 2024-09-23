@implementation TSDLayoutAccessibility

- (void)dragBy:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  const __CFString *v16;
  NSString *v17;
  double v18;
  const __CFString *v19;
  NSString *v20;
  NSString *v21;
  uint64_t v22;
  NSMutableString *v23;
  objc_super v24;

  y = a3.y;
  x = a3.x;
  v24.receiver = self;
  v24.super_class = (Class)TSDLayoutAccessibility;
  -[TSDLayoutAccessibility dragBy:](&v24, "dragBy:");
  +[TSDRepAccessibility tsaxCurrentRepDragOffset](TSDRepAccessibility, "tsaxCurrentRepDragOffset");
  v14 = vabdd_f64(v11, x) <= 2.0;
  v13 = vabdd_f64(v12, y);
  v14 = v14 && v13 <= 2.0;
  if (!v14)
  {
    v15 = fabs(x);
    if (x == 0.0)
    {
      v17 = 0;
    }
    else
    {
      if (x <= 0.0)
        v16 = CFSTR("moving.object.left");
      else
        v16 = CFSTR("moving.object.right");
      v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)v16), *(_QWORD *)&v15);
    }
    if (y == 0.0)
    {
      v20 = 0;
      v18 = fabs(y);
    }
    else
    {
      v18 = fabs(y);
      if (y <= 0.0)
        v19 = CFSTR("moving.object.up");
      else
        v19 = CFSTR("moving.object.down");
      v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)v19), *(_QWORD *)&v18);
    }
    if (v15 <= v18)
      v21 = v20;
    else
      v21 = v17;
    if (v15 <= v18)
      v22 = (uint64_t)v17;
    else
      v22 = (uint64_t)v20;
    v23 = __TSAccessibilityStringForVariables(1, v21, v5, v6, v7, v8, v9, v10, v22);
    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v23);
    UIAccessibilityPostNotification(TSAccessibilityElementMovedNotification, 0);
    +[TSDRepAccessibility tsaxSetCurrentRepDragOffset:](TSDRepAccessibility, "tsaxSetCurrentRepDragOffset:", x, y);
  }
}

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDLayout");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (TSDLayoutGeometryAccessibility)tsaxInspectorGeometry
{
  void *v3;
  TSDLayoutGeometryAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDLayoutGeometryAccessibility);
  result = (TSDLayoutGeometryAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDLayoutAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("inspectorGeometry")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (TSWPStorageAccessibility)tsaxStorage
{
  return 0;
}

- (TSDRepAccessibility)tsaxRepForLayout
{
  void *v3;
  Class v4;
  Class v5;
  void *v6;
  char v8;

  v8 = 0;
  v3 = (void *)objc_opt_class(TSDCanvasAccessibility);
  v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)objc_msgSend(-[TSDLayoutAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("layoutController")), "tsaxValueForKey:", CFSTR("canvas")), 1, &v8);
  if (v8)
    abort();
  v5 = v4;
  v6 = (void *)objc_opt_class(TSWPInteractiveCanvasControllerAccessibility);
  return (TSDRepAccessibility *)-[objc_class tsaxRepForLayout:](__TSAccessibilityCastAsSafeCategory(v6, (uint64_t)-[objc_class tsaxInteractiveCanvasController](v5, "tsaxInteractiveCanvasController"), 0, 0), "tsaxRepForLayout:", self);
}

- (void)invalidate
{
  TSWPStorageAccessibility *v3;
  TSWPStorageAccessibility *v4;
  void *v5;
  Class v6;
  Class v7;
  void *v8;
  Class v9;
  Class v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  char v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TSDLayoutAccessibility;
  -[TSDLayoutAccessibility invalidate](&v15, "invalidate");
  v3 = -[TSDLayoutAccessibility tsaxStorage](self, "tsaxStorage");
  if (v3)
  {
    v4 = v3;
    v14 = 0;
    v5 = (void *)objc_opt_class(TSDCanvasAccessibility);
    v6 = __TSAccessibilityCastAsSafeCategory(v5, (uint64_t)objc_msgSend(-[TSDLayoutAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("layoutController")), "tsaxValueForKey:", CFSTR("canvas")), 1, &v14);
    if (v14)
      abort();
    v7 = v6;
    v8 = (void *)objc_opt_class(TSWPInteractiveCanvasControllerAccessibility);
    v9 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)-[objc_class tsaxInteractiveCanvasController](v7, "tsaxInteractiveCanvasController"), 0, 0);
    if (v9)
    {
      v10 = v9;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_2444EC;
      v13[3] = &unk_43BA90;
      v13[4] = v9;
      -[TSWPStorageAccessibility tsaxEnumerateAttachmentsUsingBlock:](v4, "tsaxEnumerateAttachmentsUsingBlock:", v13);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_2444F8;
      v12[3] = &unk_43BAB8;
      v12[4] = v10;
      -[TSWPStorageAccessibility tsaxEnumerateFootnoteReferenceAttachmentsUsingBlock:](v4, "tsaxEnumerateFootnoteReferenceAttachmentsUsingBlock:", v12);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_244504;
      v11[3] = &unk_43BAE0;
      v11[4] = v10;
      -[TSWPStorageAccessibility tsaxEnumerateSmartFieldsUsingBlock:](v4, "tsaxEnumerateSmartFieldsUsingBlock:", v11);
    }
  }
}

@end
