@implementation THWReviewImageAnswerChoiceStateAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWReviewImageAnswerChoiceState");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)thaxLabelForButtonControlRep:(id)a3
{
  unsigned int v4;
  const __CFString *v5;
  NSString *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;

  v4 = -[THWReviewImageAnswerChoiceStateAccessibility _thaxChoiceState](self, "_thaxChoiceState", a3);
  if (v4 == 1)
  {
    v5 = CFSTR("review.answer.correct");
    goto LABEL_5;
  }
  if (v4 == 2)
  {
    v5 = CFSTR("review.answer.incorrect");
LABEL_5:
    v6 = THAccessibilityLocalizedString((uint64_t)v5);
    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:
  v16 = 0;
  v7 = (objc_class *)objc_opt_class(NSString);
  v8 = (void *)__TSAccessibilityCastAsClass(v7, (uint64_t)-[THWReviewImageAnswerChoiceStateAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("choiceAccessibilityDescription")), 1, &v16);
  if (v16)
    abort();
  return __TSAccessibilityStringForVariables(1, v8, v9, v10, v11, v12, v13, v14, (uint64_t)v6);
}

- (BOOL)thaxButtonControlRepIsSelected:(id)a3
{
  return -[THWReviewImageAnswerChoiceStateAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("selected"));
}

- (int)_thaxChoiceState
{
  return objc_msgSend(-[THWReviewImageAnswerChoiceStateAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("choiceState")), "unsignedIntegerValue");
}

@end
