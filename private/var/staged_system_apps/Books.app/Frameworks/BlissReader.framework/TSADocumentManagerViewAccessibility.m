@implementation TSADocumentManagerViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSADocumentManagerView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)_tsaxShouldEnterIntermediateStateUponScrolling
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5439B4);
}

- (void)_tsaxSetShouldEnterIntermediateStateUponScrolling:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_5439B4, a3);
}

- (void)_accessibilityScrollToFrame:(CGRect)a3 forView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v10;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[TSADocumentManagerViewAccessibility _tsaxShouldEnterIntermediateStateUponScrolling](self, "_tsaxShouldEnterIntermediateStateUponScrolling");
  -[TSADocumentManagerViewAccessibility _tsaxSetShouldEnterIntermediateStateUponScrolling:](self, "_tsaxSetShouldEnterIntermediateStateUponScrolling:", 1);
  v11.receiver = self;
  v11.super_class = (Class)TSADocumentManagerViewAccessibility;
  -[TSADocumentManagerViewAccessibility _accessibilityScrollToFrame:forView:](&v11, "_accessibilityScrollToFrame:forView:", a4, x, y, width, height);
  -[TSADocumentManagerViewAccessibility _tsaxSetShouldEnterIntermediateStateUponScrolling:](self, "_tsaxSetShouldEnterIntermediateStateUponScrolling:", v10);
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  objc_super v8;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  if (-[TSADocumentManagerViewAccessibility _tsaxShouldEnterIntermediateStateUponScrolling](self, "_tsaxShouldEnterIntermediateStateUponScrolling"))
  {
    -[TSADocumentManagerViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_enterIntermediateState"));
  }
  v8.receiver = self;
  v8.super_class = (Class)TSADocumentManagerViewAccessibility;
  -[TSADocumentManagerViewAccessibility setContentOffset:animated:](&v8, "setContentOffset:animated:", v4, x, y);
}

- (BOOL)shouldReuseCells
{
  objc_super v4;

  if (UIAccessibilityIsVoiceOverRunning())
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)TSADocumentManagerViewAccessibility;
  return -[TSADocumentManagerViewAccessibility shouldReuseCells](&v4, "shouldReuseCells");
}

- (void)_tsaxPerformBlockCaringAboutReusingCells:(id)a3
{
  TSADocumentManagerViewAccessibility *v4;

  if (UIAccessibilityIsVoiceOverRunning()
    && -[TSADocumentManagerViewAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("_shouldReuseCells")))
  {
    v4 = self;
    -[TSADocumentManagerViewAccessibility setValue:forKey:](self, "setValue:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), CFSTR("_shouldReuseCells"));
    (*((void (**)(id))a3 + 2))(a3);
    -[TSADocumentManagerViewAccessibility setValue:forKey:](self, "setValue:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), CFSTR("_shouldReuseCells"));

  }
  else
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_246E9C;
  v3[3] = &unk_426E28;
  v3[4] = a3;
  v3[5] = self;
  -[TSADocumentManagerViewAccessibility _tsaxPerformBlockCaringAboutReusingCells:](self, "_tsaxPerformBlockCaringAboutReusingCells:", v3);
}

- (void)_loadCells
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_246F70;
  v2[3] = &unk_426DD0;
  v2[4] = self;
  -[TSADocumentManagerViewAccessibility _tsaxPerformBlockCaringAboutReusingCells:](self, "_tsaxPerformBlockCaringAboutReusingCells:", v2);
}

- (id)dequeueReusableCellWithIdentifier:(id)a3
{
  objc_super v6;

  if (UIAccessibilityIsVoiceOverRunning())
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)TSADocumentManagerViewAccessibility;
  return -[TSADocumentManagerViewAccessibility dequeueReusableCellWithIdentifier:](&v6, "dequeueReusableCellWithIdentifier:", a3);
}

- (void)_detachCell:(id)a3 assignedCellsIndex:(unint64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSADocumentManagerViewAccessibility;
  -[TSADocumentManagerViewAccessibility _detachCell:assignedCellsIndex:](&v5, "_detachCell:assignedCellsIndex:", a3, a4);
  if (UIAccessibilityIsVoiceOverRunning())
    objc_msgSend(-[TSADocumentManagerViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_reusableCells")), "removeAllObjects");
}

- (void)_detachPlaceholderViewAtIndex:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSADocumentManagerViewAccessibility;
  -[TSADocumentManagerViewAccessibility _detachPlaceholderViewAtIndex:](&v4, "_detachPlaceholderViewAtIndex:", a3);
  if (UIAccessibilityIsVoiceOverRunning())
    objc_msgSend(-[TSADocumentManagerViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_placeholderViewPool")), "removeAllObjects");
}

- (void)_trimReusableCells
{
  objc_super v3;

  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_msgSend(-[TSADocumentManagerViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_reusableCells")), "removeAllObjects");
    objc_msgSend(-[TSADocumentManagerViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_placeholderViewPool")), "removeAllObjects");
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)TSADocumentManagerViewAccessibility;
    -[TSADocumentManagerViewAccessibility _trimReusableCells](&v3, "_trimReusableCells");
  }
}

@end
