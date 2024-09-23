@implementation TSDiOSCanvasViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDiOSCanvasViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSArray)tsaxEditMenuItems
{
  UIMenuController *v3;
  NSArray *v4;
  NSArray *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  NSArray *result;
  char v10;
  _QWORD v11[7];

  if (!-[TSDiOSCanvasViewControllerAccessibility _tsaxIsEditMenuAllowedToAppear](self, "_tsaxIsEditMenuAllowedToAppear"))return 0;
  v3 = +[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController");
  if (-[UIMenuController isMenuVisible](v3, "isMenuVisible"))
    return -[UIMenuController menuItems](v3, "menuItems");
  result = -[TSDInteractiveCanvasControllerAccessibility tsaxCanvasSelection](-[TSDiOSCanvasViewControllerAccessibility _tsaxInteractiveCanvasController](self, "_tsaxInteractiveCanvasController"), "tsaxCanvasSelection");
  if (result)
  {
    v4 = result;
    v5 = (NSArray *)+[NSMutableArray array](NSMutableArray, "array");
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_247DE0;
    v11[3] = &unk_426F18;
    v11[4] = self;
    v11[5] = v5;
    v11[6] = v4;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v11)
      || (v10 = 0,
          v6 = (objc_class *)objc_opt_class(NSArray),
          v7 = (void *)__TSAccessibilityCastAsClass(v6, (uint64_t)-[TSDiOSCanvasViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("extraMenuItems")), 1, &v10), v10))
    {
      abort();
    }
    v8 = v7;
    if (objc_msgSend(v7, "count"))
      -[NSArray addObjectsFromArray:](v5, "addObjectsFromArray:", v8);
    if (-[NSArray count](v5, "count"))
      return v5;
    else
      return 0;
  }
  return result;
}

- (void)showEditMenuForSelection:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_247E5C;
  v3[3] = &unk_426E28;
  v3[4] = a3;
  v3[5] = self;
  -[UIMenuController tsaxPerformBlockPreventingMakingVisible:](+[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController"), "tsaxPerformBlockPreventingMakingVisible:", v3);
}

- (TSDInteractiveCanvasControllerAccessibility)_tsaxInteractiveCanvasController
{
  void *v3;
  TSDInteractiveCanvasControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDInteractiveCanvasControllerAccessibility);
  result = (TSDInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDiOSCanvasViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("interactiveCanvasController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (BOOL)_tsaxIsEditMenuAllowedToAppear
{
  id v2;
  SEL v3;

  v2 = -[TSDiOSCanvasViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("delegate"));
  v3 = NSSelectorFromString(CFSTR("allowEditMenuToAppear"));
  if ((objc_opt_respondsToSelector(v2, v3) & 1) != 0)
    return objc_msgSend(v2, "tsaxBoolValueForKey:", CFSTR("allowEditMenuToAppear"));
  else
    return 0;
}

@end
