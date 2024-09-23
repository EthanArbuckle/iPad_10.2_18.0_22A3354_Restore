@implementation THWReviewControlsRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWReviewControlsRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (int)thaxCheckAnswerButtonState
{
  return objc_msgSend(-[THWReviewControlsRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("checkAnswerButtonState")), "unsignedIntegerValue");
}

- (id)thaxLabelForButtonControlRep:(id)a3
{
  char *v4;
  const __CFString *v5;
  unsigned int v6;

  v4 = (char *)objc_msgSend(a3, "thaxTag");
  if (!v4)
  {
    v5 = CFSTR("widgets.review.previous.description");
    return THAccessibilityLocalizedString((uint64_t)v5);
  }
  if (v4 == (_BYTE *)&dword_0 + 2)
  {
    v6 = -[THWReviewControlsRepAccessibility thaxCheckAnswerButtonState](self, "thaxCheckAnswerButtonState");
    if (v6 <= 3)
    {
      v5 = off_43C3F0[v6];
      return THAccessibilityLocalizedString((uint64_t)v5);
    }
  }
  else if (v4 == (_BYTE *)&dword_0 + 1)
  {
    v5 = CFSTR("widgets.review.next.description");
    return THAccessibilityLocalizedString((uint64_t)v5);
  }
  return 0;
}

- (BOOL)thaxButtonControlRepIsIgnored:(id)a3
{
  char *v4;

  v4 = (char *)objc_msgSend(a3, "thaxTag");
  if (v4 == (_BYTE *)&dword_0 + 1)
    return -[THWReviewControlsRepAccessibility _thaxNextButtonHidden](self, "_thaxNextButtonHidden");
  if (v4)
    return 0;
  return -[THWReviewControlsRepAccessibility _thaxPrevButtonHidden](self, "_thaxPrevButtonHidden");
}

- (BOOL)_thaxPrevButtonHidden
{
  return -[THWReviewControlsRepAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("prevButtonHidden"));
}

- (BOOL)_thaxNextButtonHidden
{
  return -[THWReviewControlsRepAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("nextButtonHidden"));
}

@end
