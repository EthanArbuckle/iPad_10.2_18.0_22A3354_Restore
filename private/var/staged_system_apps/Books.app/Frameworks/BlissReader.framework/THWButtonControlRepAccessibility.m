@implementation THWButtonControlRepAccessibility

- (BOOL)isAccessibilityElement
{
  if ((objc_opt_respondsToSelector(-[THWButtonControlRepAccessibility thaxDelegate](self, "thaxDelegate"), "thaxButtonControlRepIsIgnored:") & 1) != 0)return objc_msgSend(-[THWButtonControlRepAccessibility thaxDelegate](self, "thaxDelegate"), "thaxButtonControlRepIsIgnored:", self) ^ 1;
  else
    return 1;
}

- (id)accessibilityHint
{
  return -[THWButtonControlRepAccessibility thaxHint](self, "thaxHint");
}

- (unint64_t)accessibilityTraits
{
  UIAccessibilityTraits v3;
  unsigned int v4;
  UIAccessibilityTraits v5;
  UIAccessibilityTraits v6;
  unsigned int v7;
  UIAccessibilityTraits v8;

  v3 = UIAccessibilityTraitButton;
  v4 = -[THWButtonControlRepAccessibility thaxIsSelected](self, "thaxIsSelected");
  v5 = UIAccessibilityTraitSelected;
  if (!v4)
    v5 = 0;
  v6 = v5 | v3;
  v7 = -[THWButtonControlRepAccessibility thaxIsDisabled](self, "thaxIsDisabled");
  v8 = UIAccessibilityTraitNotEnabled;
  if (!v7)
    v8 = 0;
  return v6 | v8;
}

- (BOOL)thaxIsRepPressable
{
  return !-[THWButtonControlRepAccessibility thaxIsDisabled](self, "thaxIsDisabled");
}

+ (id)tsaxTargetClassName
{
  return CFSTR("THWButtonControlRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THTSDRepAccessibility, a2);
}

- (NSString)thaxHint
{
  if (objc_msgSend(0, "length")
    || (objc_opt_respondsToSelector(-[THWButtonControlRepAccessibility thaxDelegate](self, "thaxDelegate"), "thaxHintForButtonControlRep:") & 1) == 0)
  {
    return 0;
  }
  else
  {
    return (NSString *)objc_msgSend(-[THWButtonControlRepAccessibility thaxDelegate](self, "thaxDelegate"), "thaxHintForButtonControlRep:", self);
  }
}

- (BOOL)thaxIsDisabled
{
  return -[THWButtonControlRepAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("p_interactionEnabled")) ^ 1;
}

- (NSString)tsaxLabel
{
  if (objc_msgSend(0, "length")
    || (objc_opt_respondsToSelector(-[THWButtonControlRepAccessibility thaxDelegate](self, "thaxDelegate"), "thaxLabelForButtonControlRep:") & 1) == 0)
  {
    return 0;
  }
  else
  {
    return (NSString *)objc_msgSend(-[THWButtonControlRepAccessibility thaxDelegate](self, "thaxDelegate"), "thaxLabelForButtonControlRep:", self);
  }
}

- (BOOL)thaxIsSelected
{
  if ((objc_opt_respondsToSelector(-[THWButtonControlRepAccessibility thaxDelegate](self, "thaxDelegate"), "thaxButtonControlRepIsSelected:") & 1) != 0)return objc_msgSend(-[THWButtonControlRepAccessibility thaxDelegate](self, "thaxDelegate"), "thaxButtonControlRepIsSelected:", self);
  else
    return 0;
}

- (id)thaxDelegate
{
  return -[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("delegate"));
}

- (id)thaxLayout
{
  return -[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("layout"));
}

- (unint64_t)thaxTag
{
  return (unint64_t)objc_msgSend(-[THWButtonControlRepAccessibility thaxLayout](self, "thaxLayout"), "tsaxUnsignedIntegerValueForKey:", CFSTR("tag"));
}

- (unint64_t)thaxIndex
{
  return (unint64_t)objc_msgSend(-[THWButtonControlRepAccessibility thaxLayout](self, "thaxLayout"), "tsaxUnsignedIntegerValueForKey:", CFSTR("index"));
}

- (BOOL)thaxPressRep
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_2671F4;
  v3[3] = &unk_426DD0;
  v3[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
  return 1;
}

@end
