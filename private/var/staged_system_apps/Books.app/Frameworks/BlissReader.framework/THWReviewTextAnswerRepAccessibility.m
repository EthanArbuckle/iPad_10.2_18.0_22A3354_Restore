@implementation THWReviewTextAnswerRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWReviewTextAnswerRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDContainerRepAccessibility, a2);
}

- (NSString)thaxAnswerStateDescription
{
  unsigned int v2;

  v2 = -[THWReviewTextAnswerRepAccessibility _thaxState](self, "_thaxState");
  if (v2 == 1)
    return THAccessibilityLocalizedString((uint64_t)CFSTR("review.answer.correct"));
  if (v2 == 2)
    return THAccessibilityLocalizedString((uint64_t)CFSTR("review.answer.incorrect"));
  return 0;
}

- (BOOL)thaxIsSelected
{
  return -[THWReviewTextAnswerRepAccessibility _thaxRadioState](self, "_thaxRadioState") == 2;
}

- (NSString)thaxAnswerTextWithAccessibilityDescription
{
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[THWReviewTextAnswerRepAccessibility thaxAnswerAccessibilityDescription](self, "thaxAnswerAccessibilityDescription");
  v4 = -[THWReviewTextAnswerRepAccessibility thaxAnswerText](self, "thaxAnswerText");
  if (-[NSString isEqualToString:](v3, "isEqualToString:", v4))
    return v3;
  else
    return (NSString *)__TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
}

- (NSString)thaxAnswerAccessibilityDescription
{
  objc_class *v3;
  NSString *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSString);
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("p_answerAccessibilityDescription")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (NSString)thaxAnswerText
{
  objc_class *v3;
  NSString *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSString);
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("p_answerText")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (NSString)thaxAnswerLetter
{
  unint64_t v2;
  uint64_t v3;
  NSString *v4;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = (unint64_t)-[TSDLayoutAccessibility tsaxUnsignedIntegerValueForKey:](-[TSDRepAccessibility tsaxLayout](self, "tsaxLayout"), "tsaxUnsignedIntegerValueForKey:", CFSTR("index"));
  v3 = v2;
  if (v2 > 5)
    v4 = 0;
  else
    v4 = THAccessibilityLocalizedString((uint64_t)off_43C730[v2]);
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    if (!-[NSString length](v4, "length"))
    {
      ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("No letter provided for quiz answer at index: %lu"), v6, v7, v8, v9, v10, v3))abort();
    }
  }
  return v4;
}

- (void)thaxSelectAnswer
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_261664;
  v2[3] = &unk_426DD0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (int)_thaxState
{
  return objc_msgSend(-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("state")), "unsignedIntegerValue");
}

- (int)_thaxRadioState
{
  return objc_msgSend(-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("radioState")), "unsignedIntegerValue");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  UIAccessibilityTraits v2;
  unsigned int v3;
  UIAccessibilityTraits v4;

  v2 = UIAccessibilityTraitButton;
  v3 = -[THWReviewTextAnswerRepAccessibility thaxIsSelected](self, "thaxIsSelected");
  v4 = UIAccessibilityTraitSelected;
  if (!v3)
    v4 = 0;
  return v4 | v2;
}

- (id)accessibilityLabel
{
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[THWReviewTextAnswerRepAccessibility thaxAnswerLetter](self, "thaxAnswerLetter");
  v4 = -[THWReviewTextAnswerRepAccessibility thaxAnswerTextWithAccessibilityDescription](self, "thaxAnswerTextWithAccessibilityDescription");
  -[THWReviewTextAnswerRepAccessibility thaxAnswerStateDescription](self, "thaxAnswerStateDescription");
  return __TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
}

- (BOOL)thaxShouldHideChildReps
{
  return 1;
}

@end
