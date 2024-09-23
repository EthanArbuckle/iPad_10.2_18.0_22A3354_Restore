@implementation THNSObjectAccessibility

+ (void)tsaxAddSafeCategoryDependenciesToCollection:(id)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___THNSObjectAccessibility;
  objc_msgSendSuper2(&v4, "tsaxAddSafeCategoryDependenciesToCollection:");
  objc_msgSend(a3, "addObject:", CFSTR("TSNSObjectAccessibility_iOS"));
}

- (void)_axEnumerateAncestorsUsingBlock:(id)a3
{
  THNSObjectAccessibility *v4;
  char v5;

  v5 = 0;
  if (self)
  {
    v4 = self;
    do
    {
      (*((void (**)(id, THNSObjectAccessibility *, char *))a3 + 2))(a3, v4, &v5);
      if (v5)
        break;
      v4 = (THNSObjectAccessibility *)-[THNSObjectAccessibility tsaxValueForKey:](v4, "tsaxValueForKey:", CFSTR("accessibilityContainer"));
    }
    while (v4);
  }
}

- (id)_axAncestorPassingTest:(id)a3
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_263FF8;
  v10 = sub_264008;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_264014;
  v5[3] = &unk_43C768;
  v5[4] = a3;
  v5[5] = &v6;
  -[THNSObjectAccessibility _axEnumerateAncestorsUsingBlock:](self, "_axEnumerateAncestorsUsingBlock:", v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)accessibilityElementDidBecomeFocused
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THNSObjectAccessibility;
  -[THNSObjectAccessibility accessibilityElementDidBecomeFocused](&v3, "accessibilityElementDidBecomeFocused");
  if (-[TSAccessibility _firstElementForUpcomingPageTurn](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "_firstElementForUpcomingPageTurn") == self)-[THNSObjectAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_accessibilityScrollToVisible"));
  -[THNSObjectAccessibility _axHandleCustomItemDidBecomeFocused](self, "_axHandleCustomItemDidBecomeFocused");
}

- (BOOL)_accessibilityUsesScrollParentForOrdering
{
  id v3;
  Class v4;
  objc_super v6;

  v3 = -[THNSObjectAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("accessibilityContainer"));
  v4 = NSClassFromString(CFSTR("TSDCanvasView"));
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)THNSObjectAccessibility;
  return -[THNSObjectAccessibility _accessibilityUsesScrollParentForOrdering](&v6, "_accessibilityUsesScrollParentForOrdering");
}

- (BOOL)_accessibilityUsesChildrenFramesForSorting
{
  return -[THNSObjectAccessibility thaxUsesChildrenFramesForSorting](self, "thaxUsesChildrenFramesForSorting");
}

- (id)thaxParentRep
{
  return 0;
}

- (BOOL)_axShouldTreatAsCustomItemForTextElement
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  objc_super v4;

  if (-[THNSObjectAccessibility _axShouldTreatAsCustomItemForTextElement](self, "_axShouldTreatAsCustomItemForTextElement"))
  {
    return -[THNSObjectAccessibility thaxParentRep](self, "thaxParentRep") != 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)THNSObjectAccessibility;
  return -[THNSObjectAccessibility isAccessibilityElement](&v4, "isAccessibilityElement");
}

- (id)_accessibilityScrollAncestorForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  if (!-[THNSObjectAccessibility _axShouldTreatAsCustomItemForTextElement](self, "_axShouldTreatAsCustomItemForTextElement")|| (result = objc_msgSend(-[THNSObjectAccessibility thaxParentRep](self, "thaxParentRep"), "_accessibilityScrollAncestorForSelector:", a3)) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)THNSObjectAccessibility;
    return -[THNSObjectAccessibility _accessibilityScrollAncestorForSelector:](&v6, "_accessibilityScrollAncestorForSelector:", a3);
  }
  return result;
}

- (id)accessibilityContainer
{
  id v3;
  objc_super v5;

  if (-[THNSObjectAccessibility _axShouldTreatAsCustomItemForTextElement](self, "_axShouldTreatAsCustomItemForTextElement"))
  {
    v3 = -[THNSObjectAccessibility thaxParentRep](self, "thaxParentRep");
    if ((objc_msgSend(v3, "isAccessibilityElement") & 1) == 0)
      return objc_msgSend(v3, "tsaxValueForKey:", CFSTR("accessibilityContainer"));
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)THNSObjectAccessibility;
    return -[THNSObjectAccessibility accessibilityContainer](&v5, "accessibilityContainer");
  }
  return v3;
}

- (id)_accessibilityContainerForAccumulatingCustomRotorItems
{
  id result;
  objc_super v4;

  if (!-[THNSObjectAccessibility _axShouldTreatAsCustomItemForTextElement](self, "_axShouldTreatAsCustomItemForTextElement")|| (result = -[THNSObjectAccessibility thaxParentRep](self, "thaxParentRep")) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)THNSObjectAccessibility;
    return -[THNSObjectAccessibility _accessibilityContainerForAccumulatingCustomRotorItems](&v4, "_accessibilityContainerForAccumulatingCustomRotorItems");
  }
  return result;
}

- (id)tsaxAncestorView
{
  id result;
  objc_super v4;

  if (!-[THNSObjectAccessibility _axShouldTreatAsCustomItemForTextElement](self, "_axShouldTreatAsCustomItemForTextElement")|| (result = objc_msgSend(-[THNSObjectAccessibility thaxParentRep](self, "thaxParentRep"), "tsaxValueForKey:", CFSTR("accessibilityContainer"))) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)THNSObjectAccessibility;
    return -[THNSObjectAccessibility tsaxAncestorView](&v4, "tsaxAncestorView");
  }
  return result;
}

- (void)_axHandleCustomItemDidBecomeFocused
{
  id v3;

  if (-[THNSObjectAccessibility _axShouldTreatAsCustomItemForTextElement](self, "_axShouldTreatAsCustomItemForTextElement"))
  {
    v3 = -[THNSObjectAccessibility thaxParentRep](self, "thaxParentRep");
    if ((objc_opt_respondsToSelector(v3, "_axSelectedTextRange") & 1) != 0
      && (objc_opt_respondsToSelector(v3, "_axSetSelectedTextRange:") & 1) != 0)
    {
      objc_msgSend(v3, "_axSetSelectedTextRange:", objc_msgSend(v3, "_axSelectedTextRange"), 0);
    }
  }
}

+ (id)tsaxTargetClassName
{
  return CFSTR("NSObject");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

@end
