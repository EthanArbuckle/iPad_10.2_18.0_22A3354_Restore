@implementation THWReviewRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWReviewRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THTSDRepAccessibility, a2);
}

- (unint64_t)thaxQuestionIndex
{
  return (unint64_t)-[THTSDLayoutAccessibility tsaxUnsignedIntegerValueForKey:](-[THTSDRepAccessibility tsaxLayout](self, "tsaxLayout"), "tsaxUnsignedIntegerValueForKey:", CFSTR("questionIndex"));
}

- (unint64_t)thaxQuestionCount
{
  return (unint64_t)-[THTSDLayoutAccessibility tsaxUnsignedIntegerValueForKey:](-[THTSDRepAccessibility tsaxLayout](self, "tsaxLayout"), "tsaxUnsignedIntegerValueForKey:", CFSTR("questionCount"));
}

- (void)p_checkQuestionAnswer:(id)a3
{
  id v5;
  void *v6;
  Class v7;
  char v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THWReviewRepAccessibility;
  -[THWReviewRepAccessibility p_checkQuestionAnswer:](&v9, "p_checkQuestionAnswer:");
  v5 = -[THWReviewRepAccessibility _thaxRepForQuestion:](self, "_thaxRepForQuestion:", a3);
  v8 = 0;
  v6 = (void *)objc_opt_class(THWReviewInfoAccessibility);
  v7 = __TSAccessibilityCastAsSafeCategory(v6, (uint64_t)-[TSDRepAccessibility tsaxInfo](self, "tsaxInfo"), 1, &v8);
  if (v8)
    abort();
  TSAccessibilityPostHighPriorityAnnouncementNotification(0, (uint64_t)-[objc_class thaxLocalizedDescriptionForQuestionState:](v7, "thaxLocalizedDescriptionForQuestionState:", objc_msgSend(v5, "questionState")));
}

- (id)_thaxRepForQuestion:(id)a3
{
  void *v3;
  id result;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_257FC8;
  v10 = sub_257FD8;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_257FE4;
  v5[3] = &unk_427D68;
  v5[5] = a3;
  v5[6] = &v6;
  v5[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  LOBYTE(v6) = 0;
  result = __TSAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___THWReviewQuestionRep, v3, 1, &v6);
  if ((_BYTE)v6)
    abort();
  return result;
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  void *v6;
  Class v7;
  Class v8;
  void *v9;
  Class v10;
  char v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)THWReviewRepAccessibility;
  -[THWReviewRepAccessibility control:repWasAdded:](&v12, "control:repWasAdded:", a3);
  v6 = (void *)objc_opt_class(THWScrollableCanvasControllerAccessibility);
  v7 = __TSAccessibilityCastAsSafeCategory(v6, (uint64_t)a4, 0, 0);
  if (v7)
  {
    v8 = v7;
    v11 = 0;
    v9 = (void *)objc_opt_class(THUIScrollViewAccessibility);
    v10 = __TSAccessibilityCastAsSafeCategory(v9, (uint64_t)-[objc_class thaxScrollView](v8, "thaxScrollView"), 1, &v11);
    if (v11)
      abort();
    -[objc_class thaxSetScrollingDelegate:](v10, "thaxSetScrollingDelegate:", self);
  }
}

- (void)control:(id)a3 repWillBeRemoved:(id)a4
{
  void *v5;
  Class v6;
  Class v7;
  void *v8;
  Class v9;
  char v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)THWReviewRepAccessibility;
  -[THWReviewRepAccessibility control:repWillBeRemoved:](&v11, "control:repWillBeRemoved:", a3);
  v5 = (void *)objc_opt_class(THWScrollableCanvasControllerAccessibility);
  v6 = __TSAccessibilityCastAsSafeCategory(v5, (uint64_t)a4, 0, 0);
  if (v6)
  {
    v7 = v6;
    v10 = 0;
    v8 = (void *)objc_opt_class(THUIScrollViewAccessibility);
    v9 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)-[objc_class thaxScrollView](v7, "thaxScrollView"), 1, &v10);
    if (v10)
      abort();
    -[objc_class thaxSetScrollingDelegate:](v9, "thaxSetScrollingDelegate:", 0);
  }
}

- (BOOL)thaxShouldPreventPageScrolledNotificationForScrollView:(id)a3
{
  return 1;
}

- (id)thaxScrollStatusStringForScrollView:(id)a3
{
  NSString *v4;
  id v5;

  v4 = THAccessibilityLocalizedString((uint64_t)CFSTR("widgets.review.question.number %@ %@"));
  v5 = TSAccessibilityLocalizedUnsignedInteger((uint64_t)-[THWReviewRepAccessibility thaxQuestionIndex](self, "thaxQuestionIndex") + 1);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5, TSAccessibilityLocalizedUnsignedInteger(-[THWReviewRepAccessibility thaxQuestionCount](self, "thaxQuestionCount")));
}

@end
