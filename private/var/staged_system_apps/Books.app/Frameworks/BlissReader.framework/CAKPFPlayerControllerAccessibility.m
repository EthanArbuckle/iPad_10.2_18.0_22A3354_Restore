@implementation CAKPFPlayerControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("CAKPFPlayerController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (CAKPFPlayerControllerAccessibilityDelegate)thaxAccessibilityDelegate
{
  return (CAKPFPlayerControllerAccessibilityDelegate *)__TSAccessibilityGetAssociatedObject(self, &unk_543A32);
}

- (void)thaxSetAccessibilityDelegate:(id)a3
{
  __TSAccessibilitySetAssociatedNonRetainedObject(self, &unk_543A32, a3);
}

- (void)_thaxDidRenderNewEvent
{
  CAKPFPlayerControllerAccessibilityDelegate *v3;

  v3 = -[CAKPFPlayerControllerAccessibility thaxAccessibilityDelegate](self, "thaxAccessibilityDelegate");
  if ((objc_opt_respondsToSelector(v3, "thaxPlayerControllerDidRenderNewEvent:") & 1) != 0)
    -[CAKPFPlayerControllerAccessibilityDelegate thaxPlayerControllerDidRenderNewEvent:](v3, "thaxPlayerControllerDidRenderNewEvent:", self);
}

- (void)prepareWithEndShowHandler:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  objc_super v13;
  id v14;

  if (TSAccessibilityShouldPerformValidationChecks())
  {
    v14 = objc_msgSend(&stru_43C808, "copy");
    v5 = (void *)objc_opt_class(__TSAccessibilityValidateBlockSignatureSentinel);
    v11 = __TSAccessibilityValidateBlockSignature((uint64_t)a3, (uint64_t)v14, v5, v6, v7, v8, v9, v10, v12, (uint64_t)v13.receiver);

    if (v11)
      abort();
  }
  v13.receiver = self;
  v13.super_class = (Class)CAKPFPlayerControllerAccessibility;
  -[CAKPFPlayerControllerAccessibility prepareWithEndShowHandler:](&v13, "prepareWithEndShowHandler:", a3);
  -[CAKPFPlayerControllerAccessibility _thaxDidRenderNewEvent](self, "_thaxDidRenderNewEvent");
}

- (void)gotoPreviousEvent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAKPFPlayerControllerAccessibility;
  -[CAKPFPlayerControllerAccessibility gotoPreviousEvent](&v3, "gotoPreviousEvent");
  -[CAKPFPlayerControllerAccessibility _thaxDidRenderNewEvent](self, "_thaxDidRenderNewEvent");
}

- (void)gotoPreviousSlide
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAKPFPlayerControllerAccessibility;
  -[CAKPFPlayerControllerAccessibility gotoPreviousSlide](&v3, "gotoPreviousSlide");
  -[CAKPFPlayerControllerAccessibility _thaxDidRenderNewEvent](self, "_thaxDidRenderNewEvent");
}

- (void)p_gotoEventIndex:(unint64_t)a3 skipBreadCrumb:(BOOL)a4 shouldAutoPlay:(BOOL)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAKPFPlayerControllerAccessibility;
  -[CAKPFPlayerControllerAccessibility p_gotoEventIndex:skipBreadCrumb:shouldAutoPlay:](&v6, "p_gotoEventIndex:skipBreadCrumb:shouldAutoPlay:", a3, a4, a5);
  -[CAKPFPlayerControllerAccessibility _thaxDidRenderNewEvent](self, "_thaxDidRenderNewEvent");
}

- (void)p_triggerNextEvent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAKPFPlayerControllerAccessibility;
  -[CAKPFPlayerControllerAccessibility p_triggerNextEvent](&v3, "p_triggerNextEvent");
  -[CAKPFPlayerControllerAccessibility _thaxDidRenderNewEvent](self, "_thaxDidRenderNewEvent");
}

- (id)thaxDescriptionForTouchAtLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  id v6;
  id v7;
  int *v8;
  int *v9;
  unsigned int v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSString *v16;
  id result;
  const __CFString *v18;
  const __CFString *v19;
  _QWORD v20[7];
  _QWORD v21[8];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;

  y = a3.y;
  x = a3.x;
  v6 = -[CAKPFPlayerControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mSession"));
  v7 = objc_msgSend(v6, "tsaxValueForKey:", CFSTR("currentEvent"));
  v8 = (int *)objc_msgSend(objc_msgSend(v6, "tsaxValueForKey:", CFSTR("playbackStatus")), "unsignedIntegerValue");
  if (v8 == &dword_4
    || ((v9 = v8,
         v10 = objc_msgSend(v7, "tsaxBoolValueForKey:", CFSTR("isAutomatic")),
         v9 != (int *)((char *)&dword_0 + 3))
      ? (v11 = v10 == 0)
      : (v11 = 1),
        !v11))
  {
    v7 = objc_msgSend(v6, "tsaxValueForKey:", CFSTR("nextEvent"));
  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x3052000000;
  v25 = sub_268FE0;
  v26 = sub_268FF0;
  v27 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_268FFC;
  v21[3] = &unk_43B930;
  v21[4] = v7;
  v21[5] = &v22;
  *(CGFloat *)&v21[6] = x;
  *(CGFloat *)&v21[7] = y;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v21))
    abort();
  v12 = (void *)v23[5];
  _Block_object_dispose(&v22, 8);
  if (v12)
  {
    if (objc_msgSend(v12, "hasPrefix:", CFSTR("?slide=")))
    {
      v13 = (int)(objc_msgSend(objc_msgSend(v12, "substringFromIndex:", objc_msgSend(CFSTR("?slide="), "length")), "intValue")- 1);
      v14 = objc_msgSend(v6, "tsaxValueForKey:", CFSTR("KPFDocument"));
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = 0;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_269030;
      v20[3] = &unk_428E60;
      v20[4] = v14;
      v20[5] = &v22;
      v20[6] = v13;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v20))
        abort();
      v15 = v23[3];
      _Block_object_dispose(&v22, 8);
      if (v15)
      {
        v16 = THAccessibilityLocalizedString((uint64_t)CFSTR("widgets.keynote.gotostep %@"));
        result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, TSAccessibilityLocalizedNumber((uint64_t)+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v15)));
        if (result)
          return result;
        goto LABEL_18;
      }
      v18 = CFSTR("widgets.keynote.gotofirststep");
LABEL_17:
      result = THAccessibilityLocalizedString((uint64_t)v18);
      if (result)
        return result;
      goto LABEL_18;
    }
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("?action=retreat")))
    {
      v18 = CFSTR("widgets.keynote.gotopreviousstep");
      goto LABEL_17;
    }
  }
LABEL_18:
  if (-[CAKPFPlayerControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("transportControlCloneCanGotoNext")))v19 = CFSTR("widgets.keynote.gotonextstep");
  else
    v19 = CFSTR("widgets.keynote.gotofirststep");
  return THAccessibilityLocalizedString((uint64_t)v19);
}

@end
