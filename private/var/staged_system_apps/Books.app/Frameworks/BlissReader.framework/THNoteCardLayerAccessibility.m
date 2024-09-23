@implementation THNoteCardLayerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THNoteCardLayer");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)accessibilityIncrement
{
  if (!-[THNoteCardsControllerAccessibility thaxIsShowingEmptyStudyCard](-[THNoteCardLayerAccessibility thaxDelegate](self, "thaxDelegate"), "thaxIsShowingEmptyStudyCard"))-[THNoteCardsControllerAccessibility thaxGotoNextCard](-[THNoteCardLayerAccessibility thaxDelegate](self, "thaxDelegate"), "thaxGotoNextCard");
}

- (void)accessibilityDecrement
{
  if (!-[THNoteCardsControllerAccessibility thaxIsShowingEmptyStudyCard](-[THNoteCardLayerAccessibility thaxDelegate](self, "thaxDelegate"), "thaxIsShowingEmptyStudyCard"))-[THNoteCardsControllerAccessibility thaxGotoPreviousCard](-[THNoteCardLayerAccessibility thaxDelegate](self, "thaxDelegate"), "thaxGotoPreviousCard");
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  unsigned int v4;
  UIAccessibilityTraits v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THNoteCardLayerAccessibility;
  v3 = -[THNoteCardLayerAccessibility accessibilityTraits](&v7, "accessibilityTraits");
  v4 = -[THNoteCardsControllerAccessibility thaxIsShowingEmptyStudyCard](-[THNoteCardLayerAccessibility thaxDelegate](self, "thaxDelegate"), "thaxIsShowingEmptyStudyCard");
  v5 = UIAccessibilityTraitAdjustable;
  if (v4)
    v5 = 0;
  return v5 | v3;
}

- (THNoteCardsControllerAccessibility)thaxDelegate
{
  void *v3;
  THNoteCardsControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THNoteCardsControllerAccessibility);
  result = (THNoteCardsControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THNoteCardLayerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_delegate")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (THNoteCardContentLayerAccessibility)thaxFrontLayer
{
  void *v3;
  THNoteCardContentLayerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THNoteCardContentLayerAccessibility);
  result = (THNoteCardContentLayerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THNoteCardLayerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("frontLayer")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (BOOL)thaxIsFlipped
{
  return -[THNoteCardLayerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isFlipped"));
}

- (BOOL)thaxIsTopCard
{
  return -[THNoteCardLayerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isTopCard"));
}

- (BOOL)thaxIsBottomCard
{
  return -[THNoteCardLayerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isBottomCard"));
}

- (id)accessibilityHint
{
  if (!-[THNoteCardLayerAccessibility thaxIsTopCard](self, "thaxIsTopCard")
    || -[THNoteCardsControllerAccessibility thaxIsShowingEmptyStudyCard](-[THNoteCardLayerAccessibility thaxDelegate](self, "thaxDelegate"), "thaxIsShowingEmptyStudyCard"))
  {
    return 0;
  }
  if (-[THNoteCardsControllerAccessibility thaxCanFlipTopCard](-[THNoteCardLayerAccessibility thaxDelegate](self, "thaxDelegate"), "thaxCanFlipTopCard")&& -[THNoteCardLayerAccessibility thaxIsFlipped](self, "thaxIsFlipped"))
  {
    return -[THAccessibilityNoteCardInfo thaxFrontHint](-[THNoteCardsControllerAccessibility thaxInfoForTopCard](-[THNoteCardLayerAccessibility thaxDelegate](self, "thaxDelegate"), "thaxInfoForTopCard"), "thaxFrontHint");
  }
  return -[THAccessibilityNoteCardInfo thaxBackHint](-[THNoteCardsControllerAccessibility thaxInfoForTopCard](-[THNoteCardLayerAccessibility thaxDelegate](self, "thaxDelegate"), "thaxInfoForTopCard"), "thaxBackHint");
}

- (id)accessibilityLabel
{
  id v3;
  void *v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (!-[THNoteCardLayerAccessibility thaxIsTopCard](self, "thaxIsTopCard"))
    return 0;
  if (-[THNoteCardsControllerAccessibility thaxCanFlipTopCard](-[THNoteCardLayerAccessibility thaxDelegate](self, "thaxDelegate"), "thaxCanFlipTopCard")&& -[THNoteCardLayerAccessibility thaxIsFlipped](self, "thaxIsFlipped"))
  {
    v3 = -[THAccessibilityNoteCardInfo thaxBackDescription](-[THNoteCardsControllerAccessibility thaxInfoForTopCard](-[THNoteCardLayerAccessibility thaxDelegate](self, "thaxDelegate"), "thaxInfoForTopCard"), "thaxBackDescription");
  }
  else if (-[THNoteCardsControllerAccessibility thaxIsShowingEmptyStudyCard](-[THNoteCardLayerAccessibility thaxDelegate](self, "thaxDelegate"), "thaxIsShowingEmptyStudyCard"))
  {
    v3 = -[THNoteCardLayerAccessibility _thaxEmptyCardAccessibilityLabel](self, "_thaxEmptyCardAccessibilityLabel");
  }
  else
  {
    v3 = -[THAccessibilityNoteCardInfo thaxFrontDescription](-[THNoteCardsControllerAccessibility thaxInfoForTopCard](-[THNoteCardLayerAccessibility thaxDelegate](self, "thaxDelegate"), "thaxInfoForTopCard"), "thaxFrontDescription");
  }
  v5 = v3;
  v6 = -[THNoteCardContentLayerAccessibility thaxCardNumberString](-[THNoteCardLayerAccessibility thaxFrontLayer](self, "thaxFrontLayer"), "thaxCardNumberString");
  return __TSAccessibilityStringForVariables(1, v5, v7, v8, v9, v10, v11, v12, (uint64_t)v6);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[THNoteCardLayerAccessibility thaxIsTopCard](self, "thaxIsTopCard");
  if (v5)
  {
    if (!-[THNoteCardsControllerAccessibility thaxIsShowingEmptyStudyCard](-[THNoteCardLayerAccessibility thaxDelegate](self, "thaxDelegate"), "thaxIsShowingEmptyStudyCard"))
    {
      if (a3 == 1)
      {
        -[THNoteCardsControllerAccessibility thaxGotoPreviousCard](-[THNoteCardLayerAccessibility thaxDelegate](self, "thaxDelegate"), "thaxGotoPreviousCard");
        goto LABEL_8;
      }
      if (a3 == 2)
      {
        -[THNoteCardsControllerAccessibility thaxGotoNextCard](-[THNoteCardLayerAccessibility thaxDelegate](self, "thaxDelegate"), "thaxGotoNextCard");
LABEL_8:
        LOBYTE(v5) = 1;
        return v5;
      }
    }
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)accessibilityUserInputLabels
{
  id v3;
  id v4;
  _QWORD v6[3];

  v3 = objc_alloc((Class)NSMutableArray);
  v6[0] = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Flip card"), &stru_43D7D8, 0);
  v6[1] = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Study card"), &stru_43D7D8, 0, v6[0]);
  v6[2] = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Flashcard"), &stru_43D7D8, 0);
  v4 = objc_msgSend(v3, "initWithArray:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 3));
  if (-[THNoteCardsControllerAccessibility thaxIsShowingEmptyStudyCard](-[THNoteCardLayerAccessibility thaxDelegate](self, "thaxDelegate"), "thaxIsShowingEmptyStudyCard"))
  {
    objc_msgSend(v4, "tsu_addNonNilObject:", -[THNoteCardLayerAccessibility accessibilityLabel](self, "accessibilityLabel"));
  }
  return v4;
}

- (id)_thaxEmptyCardAccessibilityLabel
{
  id v3;
  id v4;
  void *v5;
  Class v6;
  Class v7;
  void *v8;
  Class v9;
  Class v10;
  char v12;
  _QWORD v13[2];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = objc_msgSend(-[THNoteCardLayerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_frontLayer")), "tsaxValueForKey:", CFSTR("_bodyLayer"));
  v12 = 0;
  v5 = (void *)objc_opt_class(THMultiLineLabelAccessibility);
  v6 = __TSAccessibilityCastAsSafeCategory(v5, (uint64_t)objc_msgSend(v4, "tsaxValueForKey:", CFSTR("_headingLabel")), 1, &v12);
  if (v12
    || (v7 = v6,
        v12 = 0,
        v8 = (void *)objc_opt_class(THMultiLineLabelAccessibility),
        v9 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)objc_msgSend(v4, "tsaxValueForKey:", CFSTR("_bodyLabel")), 1, &v12), v12))
  {
    abort();
  }
  v10 = v9;
  v13[0] = -[objc_class thaxText](v7, "thaxText");
  v13[1] = -[objc_class thaxText](v10, "thaxText");
  objc_msgSend(v3, "tsu_addObjectsFromNonNilArray:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
  return objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
}

@end
