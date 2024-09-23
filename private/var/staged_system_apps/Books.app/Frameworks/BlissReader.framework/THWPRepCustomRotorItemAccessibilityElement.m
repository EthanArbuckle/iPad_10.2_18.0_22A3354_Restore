@implementation THWPRepCustomRotorItemAccessibilityElement

- (THWPRepCustomRotorItemAccessibilityElement)initWithParentRep:(id)a3 rangeInRep:(_NSRange)a4 label:(id)a5 hint:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  THWPRepCustomRotorItemAccessibilityElement *v10;
  objc_super v12;

  length = a4.length;
  location = a4.location;
  v12.receiver = self;
  v12.super_class = (Class)THWPRepCustomRotorItemAccessibilityElement;
  v10 = -[THWPRepCustomRotorItemAccessibilityElement initWithAccessibilityContainer:](&v12, "initWithAccessibilityContainer:", a3);
  v10->_rangeInRep.location = location;
  v10->_rangeInRep.length = length;
  -[THWPRepCustomRotorItemAccessibilityElement setAccessibilityLabel:](v10, "setAccessibilityLabel:", a5);
  -[THWPRepCustomRotorItemAccessibilityElement setAccessibilityHint:](v10, "setAccessibilityHint:", a6);
  return v10;
}

- (THWPRepAccessibility)parentRep
{
  void *v3;
  THWPRepAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWPRepAccessibility);
  result = (THWPRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THWPRepCustomRotorItemAccessibilityElement accessibilityContainer](self, "accessibilityContainer"), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (TSWPHyperlinkFieldAccessibility)linkField
{
  THWPRepAccessibility *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  TSWPHyperlinkFieldAccessibility *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;

  v3 = -[THWPRepCustomRotorItemAccessibilityElement parentRep](self, "parentRep");
  v4 = -[THWPRepCustomRotorItemAccessibilityElement rangeInRep](self, "rangeInRep");
  v6 = -[TSWPRepAccessibility tsaxStorageRangeWithRepRange:](v3, "tsaxStorageRangeWithRepRange:", v4, v5);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = sub_26C814;
  v15 = sub_26C824;
  v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_26C830;
  v10[3] = &unk_43C8C8;
  v10[4] = &v11;
  -[TSWPStorageAccessibility tsaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:](-[TSWPRepAccessibility tsaxStorage](-[THWPRepCustomRotorItemAccessibilityElement parentRep](self, "parentRep"), "tsaxStorage"), "tsaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, v6, v7, v10);
  v8 = (TSWPHyperlinkFieldAccessibility *)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  Class v4;
  Class v5;
  TSWPHyperlinkFieldAccessibility *v6;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  char v15;

  v15 = 0;
  v3 = (void *)objc_opt_class(THInteractiveCanvasControllerAccessibility);
  v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSWPRepAccessibility tsaxInteractiveCanvasController](-[THWPRepCustomRotorItemAccessibilityElement parentRep](self, "parentRep"), "tsaxInteractiveCanvasController"), 1, &v15);
  if (v15)
    goto LABEL_7;
  v5 = v4;
  v6 = -[THWPRepCustomRotorItemAccessibilityElement linkField](self, "linkField");
  if (v6)
  {
    -[objc_class thaxHandleHyperlink:hitRep:](v5, "thaxHandleHyperlink:hitRep:", -[THWPRepCustomRotorItemAccessibilityElement linkField](self, "linkField"), -[THWPRepCustomRotorItemAccessibilityElement parentRep](self, "parentRep"));
    return v6 != 0;
  }
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Could not perform AX activate on link item, falling back to tap"), v8, v9, v10, v11, v12, v14))LABEL_7:abort();
  }
  return v6 != 0;
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSWPRepAccessibility _accessibilityBoundsForRange:](-[THWPRepCustomRotorItemAccessibilityElement parentRep](self, "parentRep"), "_accessibilityBoundsForRange:", self->_rangeInRep.location, self->_rangeInRep.length);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)_accessibilityRoleDescription
{
  NSString *v3;
  objc_super v5;

  v3 = -[THWPRepCustomRotorItemAccessibilityElement roleDescription](self, "roleDescription");
  if (!-[NSString length](v3, "length"))
  {
    v5.receiver = self;
    v5.super_class = (Class)THWPRepCustomRotorItemAccessibilityElement;
    return -[THWPRepCustomRotorItemAccessibilityElement _accessibilityRoleDescription](&v5, "_accessibilityRoleDescription");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWPRepCustomRotorItemAccessibilityElement;
  -[THWPRepCustomRotorItemAccessibilityElement dealloc](&v3, "dealloc");
}

- (NSString)roleDescription
{
  return self->_roleDescription;
}

- (void)setRoleDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (_NSRange)rangeInRep
{
  _NSRange *p_rangeInRep;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_rangeInRep = &self->_rangeInRep;
  location = self->_rangeInRep.location;
  length = p_rangeInRep->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRangeInRep:(_NSRange)a3
{
  self->_rangeInRep = a3;
}

@end
