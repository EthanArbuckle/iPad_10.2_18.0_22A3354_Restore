@implementation CRLCanvasKnobAccessibilityElement

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  unsigned __int8 v9;
  float v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxInteractiveCanvasController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  if (!objc_msgSend(v5, "crlaxIsSupported"))
  {
    v8 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crlaxCanvasViewController"));
  if (objc_msgSend(v7, "crlaxIsInEyeDropperMode"))
  {

    v8 = 0;
LABEL_8:

    goto LABEL_9;
  }
  v9 = objc_msgSend(v4, "crlaxDocumentIsSharedReadOnly");

  if ((v9 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxLayer"));
    objc_msgSend(v6, "opacity");
    v8 = v10 > 0.00000011921;
    goto LABEL_8;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxLabel"));

  return v3;
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxHint"));

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxValue"));

  return v3;
}

- (unint64_t)accessibilityTraits
{
  UIAccessibilityTraits v3;
  void *v4;
  unsigned int v5;
  UIAccessibilityTraits *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;

  v3 = UIAccessibilityTraitNone;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep"));
  v5 = objc_msgSend(v4, "crlaxIsLocked");

  if (v5)
  {
    v6 = &UIAccessibilityTraitNotEnabled;
LABEL_7:
    v3 |= *v6;
    return v3;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  v8 = objc_msgSend(v7, "crlaxIsAdjustable");

  if (v8)
  {
    v6 = &UIAccessibilityTraitAdjustable;
    goto LABEL_7;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  v10 = objc_msgSend(v9, "crlaxIsButton");

  if (v10)
  {
    v6 = &UIAccessibilityTraitButton;
    goto LABEL_7;
  }
  return v3;
}

- (CGRect)accessibilityFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  objc_msgSend(v2, "crlaxFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  v3 = objc_msgSend(v2, "crlaxIsButton");

  return v3;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  v4 = objc_msgSend(v3, "crlaxIsButton");

  if (!v4)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  v6 = objc_msgSend(v5, "crlaxActivateButton");

  return v6;
}

- (void)accessibilityIncrement
{
  void *v3;
  unsigned int v4;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep"));
    v4 = objc_msgSend(v3, "crlaxInReadOnlyMode");

    if (v4)
    {
      ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Trying to increment a knob while in read-only mode. This shouldn't happen."), v6, v7, v8, v9, v10, v11))abort();
    }
  }
  v12 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  if (objc_msgSend(v12, "crlaxAdjustmentResizesShape"))
  {
    objc_msgSend(v12, "crlaxCalculatedNextPositionInRepForAdjustable:", 1);
    objc_msgSend(v12, "crlaxMoveKnobToRepPositionInNaturalSpace:");
    CRLAccessibilityPostLayoutChangedNotification(self);
  }
  else
  {
    -[CRLCanvasKnobAccessibilityElement _performAccessibilityIncrementDecrementForControlKnob:](self, "_performAccessibilityIncrementDecrementForControlKnob:", 1);
  }

}

- (void)accessibilityDecrement
{
  void *v3;
  unsigned int v4;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  id v16;

  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep"));
    v4 = objc_msgSend(v3, "crlaxInReadOnlyMode");

    if (v4)
    {
      ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Trying to decrement a knob while in read-only mode. This shouldn't happen."), v6, v7, v8, v9, v10, v15))abort();
    }
  }
  v16 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  if (objc_msgSend(v16, "crlaxAdjustmentResizesShape"))
  {
    objc_msgSend(v16, "crlaxCalculatedNextPositionInRepForAdjustable:", 0);
    v12 = v11;
    v14 = v13;
    if (-[CRLCanvasKnobAccessibilityElement _isValidToDecrementTag:toNextPosition:](self, "_isValidToDecrementTag:toNextPosition:", objc_msgSend(v16, "crlaxKnobTag"), v11, v13))
    {
      objc_msgSend(v16, "crlaxMoveKnobToRepPositionInNaturalSpace:", v12, v14);
      CRLAccessibilityPostLayoutChangedNotification(self);
    }
  }
  else
  {
    -[CRLCanvasKnobAccessibilityElement _performAccessibilityIncrementDecrementForControlKnob:](self, "_performAccessibilityIncrementDecrementForControlKnob:", 0);
  }

}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  void *v35;
  void *v36;
  id v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  _QWORD v54[5];
  id v55;
  _QWORD v56[4];
  id v57;
  id v58[2];
  _QWORD v59[4];
  id v60;
  id v61[2];
  _QWORD v62[4];
  id v63;
  id v64[2];
  _QWORD v65[4];
  id v66;
  id v67[2];
  id location;
  objc_super v69;
  _QWORD v70[4];

  v69.receiver = self;
  v69.super_class = (Class)CRLCanvasKnobAccessibilityElement;
  v3 = -[CRLCanvasKnobAccessibilityElement accessibilityCustomActions](&v69, "accessibilityCustomActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v53 = objc_msgSend(v4, "mutableCopy");

  if (!v53)
    v53 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", &__NSArray0__struct);
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  objc_initWeak(&location, self);
  if (objc_msgSend(v52, "crlaxOffersCustomActionsForMovement"))
  {
    -[CRLCanvasKnobAccessibilityElement crlaxMoveActionOffsetDistance](self, "crlaxMoveActionOffsetDistance");
    v6 = v5;
    v7 = objc_alloc((Class)UIAccessibilityCustomAction);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Move up"), 0, 0));
    v9 = objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 30.0));
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("arrow.up.circle.fill"), v9));
    v44 = v8;
    v45 = (void *)v9;
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_1000228E0;
    v65[3] = &unk_10122D4E8;
    v10 = v52;
    v66 = v10;
    objc_copyWeak(v67, &location);
    v67[1] = v6;
    v11 = objc_msgSend(v7, "initWithName:image:actionHandler:", v51, v50, v65);
    v70[0] = v11;
    v12 = objc_alloc((Class)UIAccessibilityCustomAction);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Move down"), 0, 0));
    v14 = objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 30.0));
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("arrow.down.circle.fill"), v14));
    v42 = v13;
    v43 = (void *)v14;
    v40 = v11;
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_100022A00;
    v62[3] = &unk_10122D4E8;
    v15 = v10;
    v63 = v15;
    objc_copyWeak(v64, &location);
    v64[1] = v6;
    v16 = objc_msgSend(v12, "initWithName:image:actionHandler:", v49, v48, v62);
    v70[1] = v16;
    v17 = objc_alloc((Class)UIAccessibilityCustomAction);
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("Move left"), 0, 0));
    v18 = objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 30.0));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("arrow.left.circle.fill"), v18));
    v41 = (void *)v18;
    v39 = v16;
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_100022B20;
    v59[3] = &unk_10122D4E8;
    v20 = v15;
    v60 = v20;
    objc_copyWeak(v61, &location);
    v61[1] = v6;
    v21 = objc_msgSend(v17, "initWithName:image:actionHandler:", v46, v19, v59);
    v70[2] = v21;
    v22 = objc_alloc((Class)UIAccessibilityCustomAction);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Move right"), 0, 0));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 30.0));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("arrow.right.circle.fill"), v25));
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_100022C40;
    v56[3] = &unk_10122D4E8;
    v57 = v20;
    objc_copyWeak(v58, &location);
    v58[1] = v6;
    v27 = objc_msgSend(v22, "initWithName:image:actionHandler:", v24, v26, v56);
    v70[3] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v70, 4));
    objc_msgSend(v53, "addObjectsFromArray:", v28);

    objc_destroyWeak(v58);
    objc_destroyWeak(v61);

    objc_destroyWeak(v64);
    objc_destroyWeak(v67);

  }
  if (objc_msgSend(v52, "crlaxIsConnectionLineCreationKnob"))
  {
    v29 = objc_alloc((Class)UIAccessibilityCustomAction);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasKnobAccessibilityElement actionNameForInsertConnectedDuplicateFromParentWithText:](CRLCanvasKnobAccessibilityElement, "actionNameForInsertConnectedDuplicateFromParentWithText:", -[CRLCanvasKnobAccessibilityElement isOnShapeWithText](self, "isOnShapeWithText")));
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100022D60;
    v54[3] = &unk_10122D510;
    objc_copyWeak(&v55, &location);
    v54[4] = self;
    v31 = objc_msgSend(v29, "initWithName:actionHandler:", v30, v54);
    objc_msgSend(v53, "addObject:", v31);

    objc_destroyWeak(&v55);
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep"));
  if ((objc_msgSend(v32, "crlaxIsLocked") & 1) != 0)
    goto LABEL_10;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep"));
  v34 = objc_msgSend(v33, "crlaxInReadOnlyMode");

  if ((v34 & 1) == 0)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement makeCustomActionsForConnectingToNearbyElements](self, "makeCustomActionsForConnectingToNearbyElements"));
    objc_msgSend(v53, "addObjectsFromArray:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement _actionToDisconnectConnectionLineFromRep](self, "_actionToDisconnectConnectionLineFromRep"));
    objc_msgSend(v53, "crl_addNonNilObject:", v36);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement makeCustomActionsForMagnetSnapping](self, "makeCustomActionsForMagnetSnapping"));
    objc_msgSend(v53, "addObjectsFromArray:", v32);
LABEL_10:

  }
  v37 = objc_msgSend(v53, "copy");
  objc_destroyWeak(&location);

  return v37;
}

- (id)newActionWithName:(id)a3 toConnectToRep:(id)a4 byDraggingToPoint:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  _QWORD v26[5];
  id v27;
  CGFloat v28;
  CGFloat v29;
  _QWORD v30[7];

  y = a5.y;
  x = a5.x;
  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  v12 = objc_msgSend(v11, "crlaxIsConnectionLineCreationKnob");

  if (v12)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100023044;
    v30[3] = &unk_10122D538;
    v30[4] = self;
    *(CGFloat *)&v30[5] = x;
    *(CGFloat *)&v30[6] = y;
    v13 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomAction), "initWithName:actionHandler:", v9, v30);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Add Connections"), 0, 0));
    objc_msgSend(v13, "setLocalizedActionRotorCategory:", v15);

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
    v17 = objc_msgSend(v16, "crlaxIsConnectionLineEndpointKnob");

    if (!v17)
    {
      v13 = 0;
      goto LABEL_10;
    }
    v18 = objc_alloc((Class)UIAccessibilityCustomAction);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000230F4;
    v26[3] = &unk_10122D560;
    v26[4] = self;
    v28 = x;
    v29 = y;
    v27 = v10;
    v13 = objc_msgSend(v18, "initWithName:actionHandler:", v9, v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
    v20 = objc_msgSend(v19, "crlaxIsConnectionLineEndpointHandleWithConnection");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v22 = v21;
    if (v20)
      v23 = CFSTR("Replacement Connections");
    else
      v23 = CFSTR("Available Connections");
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", v23, 0, 0));
    objc_msgSend(v13, "setLocalizedActionRotorCategory:", v24);

    v14 = v27;
  }

LABEL_10:
  return v13;
}

- (id)newActionWithName:(id)a3 toSnapToMagnet:(unint64_t)a4 usingUnscaledCanvasPoint:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[7];

  y = a5.y;
  x = a5.x;
  v8 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002323C;
  v13[3] = &unk_10122D538;
  v13[4] = self;
  *(CGFloat *)&v13[5] = x;
  *(CGFloat *)&v13[6] = y;
  v9 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomAction), "initWithName:actionHandler:", v8, v13);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Reposition Connection"), 0, 0));
  objc_msgSend(v9, "setLocalizedActionRotorCategory:", v11);

  return v9;
}

- (void)accessibilityElementDidBecomeFocused
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRLCanvasKnobAccessibilityElement;
  -[CRLCanvasKnobAccessibilityElement accessibilityElementDidBecomeFocused](&v10, "accessibilityElementDidBecomeFocused");
  v9 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  v5 = (objc_class *)objc_opt_class(CRLCanvasButtonKnob, v4);
  v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v3, 1, &v9);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v9)
    abort();
  v8 = (void *)v7;

  if (v8)
    objc_msgSend(v8, "setHighlighted:", 1);

}

- (void)accessibilityElementDidLoseFocus
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRLCanvasKnobAccessibilityElement;
  -[CRLCanvasKnobAccessibilityElement accessibilityElementDidLoseFocus](&v10, "accessibilityElementDidLoseFocus");
  v9 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  v5 = (objc_class *)objc_opt_class(CRLCanvasButtonKnob, v4);
  v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v3, 1, &v9);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v9)
    abort();
  v8 = (void *)v7;

  if (v8)
    objc_msgSend(v8, "setHighlighted:", 0);

}

- (BOOL)_accessibilityShouldIncludeParentCustomContent
{
  return 0;
}

- (BOOL)_accessibilityShouldIncludeParentCustomActions
{
  return 0;
}

- (void)_performAccessibilityIncrementDecrementForControlKnob:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  char v26;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxTarget"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rep"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement _crlaxSmartPathSourceForAdjustment](self, "_crlaxSmartPathSourceForAdjustment"));
  v26 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "crlaxInteractiveCanvasController"));

  v12 = (objc_class *)objc_opt_class(CRLInteractiveCanvasController, v11);
  v13 = __CRLAccessibilityCastAsClass(v12, (uint64_t)v10, 1, &v26);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (v26
    || (v15 = (void *)v14,
        v10,
        v26 = 0,
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layout")),
        v18 = (void *)objc_opt_class(CRLCanvasLayoutAccessibility, v17),
        v19 = __CRLAccessibilityCastAsSafeCategory(v18, (uint64_t)v16, 1, &v26),
        v20 = objc_claimAutoreleasedReturnValue(v19),
        v26))
  {
    abort();
  }
  v21 = (void *)v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "crlaxCommandForAccessibilityIncrementDecrement:forKnobTag:inSmartPathSource:", v3, objc_msgSend(v22, "crlaxKnobTag"), v8));

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "commandController"));
    objc_msgSend(v24, "enqueueCommand:", v23);

  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000235A4;
  v25[3] = &unk_10122D110;
  v25[4] = self;
  CRLAccessibilityPerformBlockOnMainThreadAfterDelay(v25, 0.5);

}

- (id)_crlaxSmartPathSourceForAdjustment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  objc_class *v24;
  void *v25;
  uint64_t v26;
  char v28;
  char v29;
  char v30;
  char v31;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rep"));

  v31 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layout"));
  v7 = (objc_class *)objc_opt_class(CRLShapeLayout, v6);
  v8 = __CRLAccessibilityCastAsClass(v7, (uint64_t)v5, 1, &v31);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (v31)
    goto LABEL_9;
  v10 = (void *)v9;

  if (!v10)
  {
    v29 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxValueForKey:", CFSTR("maskInfo")));
    v19 = (objc_class *)objc_opt_class(CRLMaskInfo, v18);
    v20 = __CRLAccessibilityCastAsClass(v19, (uint64_t)v17, 1, &v29);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (!v29)
    {
      v11 = (void *)v21;

      v28 = 0;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pathSource"));
      v24 = (objc_class *)objc_opt_class(CRLPathSource, v23);
      v25 = __CRLAccessibilityCastAsClassAndProtocol(v24, (Protocol *)&OBJC_PROTOCOL___CRLSmartPathSource, v22, 1, &v28);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (!v28)
      {
        v16 = (void *)v26;

        goto LABEL_8;
      }
    }
LABEL_9:
    abort();
  }
  v30 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pathSource"));
  v13 = (objc_class *)objc_opt_class(CRLPathSource, v12);
  v14 = __CRLAccessibilityCastAsClassAndProtocol(v13, (Protocol *)&OBJC_PROTOCOL___CRLSmartPathSource, v11, 1, &v30);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (v30)
    goto LABEL_9;
  v16 = (void *)v15;
LABEL_8:

  return v16;
}

- (id)_actionToDisconnectConnectionLineFromRep
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  v4 = objc_msgSend(v3, "crlaxIsConnectionLineEndpointHandleWithConnection");

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Disconnect"), 0, 0));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100023830;
  v9[3] = &unk_10122D588;
  v9[4] = self;
  v7 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomAction), "initWithName:actionHandler:", v6, v9);

  return v7;
}

- (BOOL)_isValidToDecrementTag:(unint64_t)a3 toNextPosition:(CGPoint)a4
{
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  x = a4.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob", a3));
  objc_msgSend(v6, "crlaxPosition");
  v9 = sub_1000603B8(v7, v8, x);
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep"));
  objc_msgSend(v12, "crlaxFrameInUnscaledCanvas");
  sub_1000603B8(v13, v14, 10.0);

  v15 = sub_10005FDDC();
  return sub_100060030(v15, v16, v17, v18, fabs(v9), fabs(v11));
}

+ (id)actionNameForInsertConnectedDuplicateFromParentWithText:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3)
    v6 = CFSTR("Duplicate, excluding text, and connect");
  else
    v6 = CFSTR("Duplicate and connect");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, 0, 0));

  return v7;
}

- (CRLCanvasKnobAccessibilityElement)initWithKnobTag:(unint64_t)a3 nodeIndex:(unint64_t)a4 parentRep:(id)a5 identifier:(id)a6
{
  id v10;
  id v11;
  CRLCanvasKnobAccessibilityElement *v12;
  CRLCanvasKnobAccessibilityElement *v13;
  objc_super v15;

  v10 = a5;
  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CRLCanvasKnobAccessibilityElement;
  v12 = -[CRLAccessibilityElement initWithAccessibilityParent:](&v15, "initWithAccessibilityParent:", v10);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_parentRep, v10);
    v13->_knobTag = a3;
    v13->_knobNodeIndex = a4;
    objc_storeStrong((id *)&v13->_crlaxIdentifier, a6);
  }

  return v13;
}

- (CRLCanvasKnobAccessibilityElement)initWithAccessibilityParent:(id)a3
{
  id v4;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CRLCanvasKnobAccessibilityElement *v11;
  uint64_t v13;

  v4 = a3;
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Use designated initializer!"), v6, v7, v8, v9, v10, v13))abort();
  }
  v11 = -[CRLCanvasKnobAccessibilityElement initWithKnobTag:nodeIndex:parentRep:identifier:](self, "initWithKnobTag:nodeIndex:parentRep:identifier:", 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0);

  return v11;
}

- (id)accessibilityUserInputLabels
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxUserInputLabels"));

  return v3;
}

- (BOOL)isEqualToKnob:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  unsigned __int8 v13;

  v4 = a3;
  v5 = -[CRLCanvasKnobAccessibilityElement knobTag](self, "knobTag");
  if (v5 == objc_msgSend(v4, "crlaxKnobTag")
    && (v6 = -[CRLCanvasKnobAccessibilityElement knobNodeIndex](self, "knobNodeIndex"),
        v6 == objc_msgSend(v4, "crlaxNodeIndex")))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxIdentifier"));
    v10 = v8;
    v11 = v9;
    v12 = v11;
    if (v10 == v11)
    {
      v13 = 1;
    }
    else
    {
      v13 = 0;
      if (v10 && v11)
        v13 = objc_msgSend(v10, "isEqualToString:", v11);
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (CGPoint)crlaxKnobPositionAdjustedByDistance:(double)a3 inDirection:(int)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  long double v15;
  void *v16;
  void *v17;
  void *v18;
  long double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  long double v24;
  long double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  long double v30;
  long double v31;
  void *v32;
  void *v33;
  void *v34;
  long double v35;
  long double v36;
  double v37;
  double v38;
  CGPoint result;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  objc_msgSend(v7, "crlaxPosition");
  v9 = v8;
  v11 = v10;

  switch(a4)
  {
    case 0:
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "crlaxLayout"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crlaxInspectorGeometry"));
      objc_msgSend(v14, "crlaxAngleInRadians");
      v9 = v9 + sin(v15) * a3;

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "crlaxLayout"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "crlaxInspectorGeometry"));
      objc_msgSend(v18, "crlaxAngleInRadians");
      v20 = cos(v19);
      goto LABEL_5;
    case 1:
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "crlaxLayout"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "crlaxInspectorGeometry"));
      objc_msgSend(v23, "crlaxAngleInRadians");
      v9 = v9 - sin(v24) * a3;

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "crlaxLayout"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "crlaxInspectorGeometry"));
      objc_msgSend(v18, "crlaxAngleInRadians");
      v26 = cos(v25);
      goto LABEL_7;
    case 2:
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "crlaxLayout"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "crlaxInspectorGeometry"));
      objc_msgSend(v29, "crlaxAngleInRadians");
      v9 = v9 - cos(v30) * a3;

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "crlaxLayout"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "crlaxInspectorGeometry"));
      objc_msgSend(v18, "crlaxAngleInRadians");
      v20 = sin(v31);
LABEL_5:
      v26 = -v20;
      goto LABEL_7;
    case 3:
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "crlaxLayout"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "crlaxInspectorGeometry"));
      objc_msgSend(v34, "crlaxAngleInRadians");
      v9 = v9 + cos(v35) * a3;

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "crlaxLayout"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "crlaxInspectorGeometry"));
      objc_msgSend(v18, "crlaxAngleInRadians");
      v26 = sin(v36);
LABEL_7:
      v11 = v11 + v26 * a3;

      break;
    default:
      break;
  }
  v37 = v9;
  v38 = v11;
  result.y = v38;
  result.x = v37;
  return result;
}

- (id)makeCustomActionsForConnectingToNearbyElements
{
  CRLCanvasKnobAccessibilityElement *v2;
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  uint64_t v17;
  void **p_cache;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  objc_class *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  CRLCanvasKnobAccessibilityElement *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void **v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  BOOL v53;
  void *v54;
  void *v55;
  unsigned int v56;
  void *v57;
  id v58;
  void *v59;
  char *v60;
  void *v61;
  unint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  objc_class *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void **v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  unsigned __int8 v85;
  void *v86;
  void *v87;
  unsigned int v88;
  void *v89;
  char *v90;
  char *v91;
  id v92;
  void *v93;
  NSString *v94;
  id v95;
  id v96;
  id v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  id v105;
  void *v106;
  char *v107;
  const __CFString *v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  void *v112;
  CRLCanvasKnobAccessibilityElement *v113;
  unsigned int v114;
  void *v115;
  unsigned int v116;
  void *v117;
  void *v118;
  id obj;
  void *v120;
  uint64_t v121;
  id v122;
  void *v123;
  void *v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  char v129;
  _BYTE v130[128];

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  v4 = objc_msgSend(v3, "crlaxIsConnectionLineCreationKnob");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](v2, "knob"));
  v6 = objc_msgSend(v5, "crlaxIsConnectionLineEndpointKnob");

  v114 = v4;
  if ((v4 & 1) == 0 && !(_DWORD)v6)
    return 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement _makeInitialConnectionActionsTemplates](v2, "_makeInitialConnectionActionsTemplates"));
  -[CRLCanvasKnobAccessibilityElement _trackRepOcclusionsWithConnectionActionTemplates:](v2, "_trackRepOcclusionsWithConnectionActionTemplates:", v8);
  v9 = objc_alloc((Class)NSSet);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement _layoutsForConnectionActionNames](v2, "_layoutsForConnectionActionNames"));
  v11 = objc_msgSend(v9, "initWithArray:", v10);
  v120 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRepAccessibility crlaxDisambiguatedConnectionDescriptionsForSet:](CRLCanvasRepAccessibility, "crlaxDisambiguatedConnectionDescriptionsForSet:", v11));

  v118 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement _targetUnscaledCanvasPointsForConnectionActionsByRepForConnectingFromActionTemplates:](v2, "_targetUnscaledCanvasPointsForConnectionActionsByRepForConnectingFromActionTemplates:", v8));
  v111 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Connect to %@"), 0, 0));

  v129 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](v2, "parentRep"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crlaxInteractiveCanvasController"));

  objc_opt_class(CRLInteractiveCanvasController, v15);
  v17 = __CRLAccessibilityCastAsClass(v16, (uint64_t)v14, 1, &v129);
  v112 = (void *)objc_claimAutoreleasedReturnValue(v17);
  if (v129)
LABEL_66:
    abort();

  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  obj = v8;
  p_cache = CRLWPMutableRangeArray.cache;
  v122 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v130, 16);
  if (v122)
  {
    v121 = *(_QWORD *)v126;
    v113 = v2;
    v116 = v6;
    do
    {
      for (i = 0; i != v122; i = (char *)i + 1)
      {
        if (*(_QWORD *)v126 != v121)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * (_QWORD)i);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "repAXForConnecting"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "crlaxTarget"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layout"));

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_cache + 83, "crlaxBoardItemIDForLayout:", v23));
        if (v24)
        {
          v124 = v23;
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "objectForKeyedSubscript:", v24));
          v123 = v25;
          if ((_DWORD)v6)
          {
            v26 = (unint64_t)v6;
            v129 = 0;
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](v2, "parentRep"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "crlaxLayout"));

            objc_opt_class(CRLConnectionLineAbstractLayout, v29);
            v31 = __CRLAccessibilityCastAsClass(v30, (uint64_t)v28, 1, &v129);
            v32 = objc_claimAutoreleasedReturnValue(v31);
            if (v129)
              goto LABEL_66;
            v33 = (void *)v32;

            if (v33)
            {
              v115 = v24;
              v34 = v2;
              v129 = 0;
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "connectedFrom"));
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "repForLayout:", v35));

              objc_opt_class(p_cache + 83, v37);
              v39 = __CRLAccessibilityCastAsSafeCategory(v38, (uint64_t)v36, 1, &v129);
              v40 = objc_claimAutoreleasedReturnValue(v39);
              if (v129)
                goto LABEL_66;
              v41 = (id)v40;
              v42 = p_cache;

              v129 = 0;
              v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "connectedTo"));
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "repForLayout:", v43));

              objc_opt_class(v42 + 83, v45);
              v47 = __CRLAccessibilityCastAsSafeCategory(v46, (uint64_t)v44, 1, &v129);
              v48 = objc_claimAutoreleasedReturnValue(v47);
              if (v129)
                goto LABEL_66;
              v49 = (void *)v48;

              v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "repAXForConnecting"));
              v2 = v34;
              if ((id)v50 != v41)
              {
                v51 = (void *)v50;
                v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "repAXForConnecting"));

                v53 = v52 == v49;
                v26 = v116;
                p_cache = CRLWPMutableRangeArray.cache;
                v25 = v123;
                v24 = v115;
                if (!v53)
                  goto LABEL_18;
LABEL_61:

                v6 = (id)v26;
                v23 = v124;
                goto LABEL_62;
              }
              v89 = v41;
              v24 = v115;
LABEL_59:

              goto LABEL_60;
            }
LABEL_18:

            v6 = (id)v26;
          }
          if (!+[CRLAccessibility isVoiceOverEnabled](CRLAccessibility, "isVoiceOverEnabled")
            && !+[CRLAccessibility isSwitchControlEnabled](CRLAccessibility, "isSwitchControlEnabled"))
          {
            v26 = (unint64_t)v6;
            goto LABEL_34;
          }
          if (v114)
          {
            v54 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](v2, "parentRep"));
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "crlaxConnectedLayouts"));
            v56 = objc_msgSend(v55, "containsObject:", v124);

            if (v56)
            {
              v57 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](v2, "parentRep"));
              v58 = objc_msgSend(v57, "clraxNumberOfStrictlyInboundConnectionsFromLayout:", v124);

              v59 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](v2, "parentRep"));
              v60 = (char *)objc_msgSend(v59, "clraxNumberOfStrictlyOutboundConnectionsToLayout:", v124);

              v61 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](v2, "parentRep"));
              v62 = (unint64_t)objc_msgSend(v61, "clraxNumberOfBidirectionalSingleConnectionsForLayout:", v124);
              goto LABEL_39;
            }
LABEL_32:
            v62 = 0;
            v60 = 0;
            v58 = 0;
          }
          else
          {
            if (!(_DWORD)v6)
              goto LABEL_32;
            v129 = 0;
            v63 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](v2, "parentRep"));
            v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "crlaxLayout"));

            objc_opt_class(CRLConnectionLineAbstractLayout, v65);
            v67 = __CRLAccessibilityCastAsClass(v66, (uint64_t)v64, 1, &v129);
            v68 = objc_claimAutoreleasedReturnValue(v67);
            if (v129)
              goto LABEL_66;
            v61 = (void *)v68;

            if (v61)
            {
              v129 = 0;
              v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "connectedFrom"));
              v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "repForLayout:", v69));

              objc_opt_class(p_cache + 83, v71);
              v73 = __CRLAccessibilityCastAsSafeCategory(v72, (uint64_t)v70, 1, &v129);
              v74 = objc_claimAutoreleasedReturnValue(v73);
              if (v129)
                goto LABEL_66;
              v75 = p_cache;
              v76 = (void *)v74;

              v129 = 0;
              v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "connectedTo"));
              v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "repForLayout:", v77));

              objc_opt_class(v75 + 83, v79);
              v81 = __CRLAccessibilityCastAsSafeCategory(v80, (uint64_t)v78, 1, &v129);
              v82 = objc_claimAutoreleasedReturnValue(v81);
              if (v129)
                goto LABEL_66;
              v83 = (void *)v82;

              v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "crlaxConnectedLayouts"));
              v85 = objc_msgSend(v84, "containsObject:", v124);

              v86 = v76;
              if ((v85 & 1) != 0
                || (v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "crlaxConnectedLayouts")),
                    v88 = objc_msgSend(v87, "containsObject:", v124),
                    v87,
                    v86 = v83,
                    v88))
              {
                v58 = objc_msgSend(v86, "clraxNumberOfStrictlyInboundConnectionsFromLayout:", v124);
                v60 = (char *)objc_msgSend(v86, "clraxNumberOfStrictlyOutboundConnectionsToLayout:", v124);
                v62 = (unint64_t)objc_msgSend(v86, "clraxNumberOfBidirectionalSingleConnectionsForLayout:", v124);
              }
              else
              {
                v62 = 0;
                v60 = 0;
                v58 = 0;
              }

            }
            else
            {
              v62 = 0;
              v60 = 0;
              v58 = 0;
            }
LABEL_39:

          }
          v90 = &v60[(_QWORD)v58];
          v91 = &v60[(_QWORD)v58 + v62];
          if (!v91)
          {
            v33 = 0;
            v2 = v113;
            v26 = v116;
            v25 = v123;
            goto LABEL_55;
          }
          if (v58 != v91 && v90 && v60 != v91)
          {
            v92 = CRLAccessibilityStringsDictKey(CFSTR("full.connections.summary"));
            v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
            v94 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v93, &v60[(_QWORD)v58 + v62], v58, v60, v62);
            goto LABEL_53;
          }
          if (v58 == v91)
          {
            v96 = CRLAccessibilityStringsDictKey(CFSTR("inbound.connections.count"));
            v93 = (void *)objc_claimAutoreleasedReturnValue(v96);
            v107 = (char *)v58;
          }
          else
          {
            if (v60 != v91)
            {
              v2 = v113;
              v26 = v116;
              v25 = v123;
              if (!v90)
              {
                v95 = CRLAccessibilityStringsDictKey(CFSTR("bidirectional.connections.count"));
                v93 = (void *)objc_claimAutoreleasedReturnValue(v95);
                v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v93, v62));
                goto LABEL_54;
              }
LABEL_34:
              v33 = 0;
LABEL_55:
              v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v117, v25));
              v108 = CFSTR("__CRLAccessibilityStringForVariablesSentinel");
              v105 = __CRLAccessibilityStringForVariables(1, v98, v99, v100, v101, v102, v103, v104, (uint64_t)v33);
              v89 = (void *)objc_claimAutoreleasedReturnValue(v105);

              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "objectForKeyedSubscript:", v24));
              if (objc_msgSend(v89, "length") && v49)
              {
                v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "repAXForConnecting"));
                objc_msgSend(v49, "CGPointValue");
                v41 = -[CRLCanvasKnobAccessibilityElement newActionWithName:toConnectToRep:byDraggingToPoint:](v2, "newActionWithName:toConnectToRep:byDraggingToPoint:", v89, v106);

                if (v41)
                  objc_msgSend(v111, "addObject:", v41);
                goto LABEL_59;
              }
LABEL_60:

              p_cache = (void **)(CRLWPMutableRangeArray + 16);
              goto LABEL_61;
            }
            v97 = CRLAccessibilityStringsDictKey(CFSTR("outbound.connections.count"));
            v93 = (void *)objc_claimAutoreleasedReturnValue(v97);
            v107 = v60;
          }
          v94 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v93, v107, v108, v109, v110);
LABEL_53:
          v33 = (void *)objc_claimAutoreleasedReturnValue(v94);
          v2 = v113;
          v26 = v116;
          v25 = v123;
LABEL_54:

          goto LABEL_55;
        }
LABEL_62:

      }
      v122 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v130, 16);
    }
    while (v122);
  }

  return v111;
}

- (BOOL)i_crlaxEnsureReciprocalConnectionsAfterConnectingConnectionLineToRep:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  BOOL v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  char v41;

  v4 = a3;
  v41 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxLayout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crlaxTarget"));

  objc_opt_class(CRLConnectionLineAbstractLayout, v8);
  v10 = __CRLAccessibilityCastAsClass(v9, (uint64_t)v7, 1, &v41);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (v41)
    goto LABEL_15;
  v12 = (void *)v11;

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxLayout"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crlaxTarget"));
    objc_msgSend(v14, "addConnectedLayout:", v12);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "connectedTo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxLayout"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "crlaxTarget"));
    if (v15 == v17)
    {
      v21 = 1;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "connectedFrom"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxLayout"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "crlaxTarget"));
      v21 = v18 == v20;

    }
    if (!CRLAccessibilityShouldPerformValidationChecks()
      || v21
      || (v23 = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch(),
          !__CRLAccessibilityHandleValidationErrorWithDescription(v23, 0, (uint64_t)CFSTR("Unable to connect connection line to rep"), v24, v25, v26, v27, v28, v40)))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxLayout"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "crlaxTarget"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "connectedLayouts"));
      v32 = objc_msgSend(v31, "containsObject:", v12);

      if (!CRLAccessibilityShouldPerformValidationChecks()
        || (v32 & 1) != 0
        || (ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch(),
            !__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Unable to connect rep back to connection line"), v34, v35, v36, v37, v38, v40)))
      {
        v22 = v21 & v32;
        goto LABEL_14;
      }
    }
LABEL_15:
    abort();
  }
  v22 = 0;
LABEL_14:

  return v22;
}

- (BOOL)disconnectConnectedConnectionLineEndIfNecessary
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *i;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  void *j;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  id v60;
  id v61;
  id v62;
  char v63;
  uint64_t v64;
  void *k;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  double v70;
  double v71;
  _BOOL4 v72;
  void *v73;
  void *v74;
  CRLCanvasKnobAccessibilityElement *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  void *v82;
  id v83;
  uint64_t v84;
  double v85;
  double v86;
  id obj;
  CGFloat v88;
  CGFloat v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  char v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  CGPoint v111;
  CGRect v112;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  v4 = objc_msgSend(v3, "crlaxIsConnectionLineEndpointHandleWithConnection");

  if (!v4)
  {
    LOBYTE(v72) = 0;
    return v72;
  }
  v106 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxInteractiveCanvasController"));

  objc_opt_class(CRLInteractiveCanvasController, v7);
  v9 = __CRLAccessibilityCastAsClass(v8, (uint64_t)v6, 1, &v106);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (v106)
    abort();
  v11 = (void *)v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvas"));
  objc_msgSend(v12, "visibleUnscaledRectForClippingReps");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v79 = v11;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvas"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allRepsOrdered"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_10124CC78));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "filteredArrayUsingPredicate:", v23));

  v25 = 2 * (_QWORD)objc_msgSend(v24, "count") + 3;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", v25));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", v25));
  v88 = v16;
  v89 = v14;
  v28 = v18;
  v29 = v20;
  +[CRLCanvasKnobAccessibilityElement _addBoundariesFromRect:toXBoundarySet:andYBoundarySet:](CRLCanvasKnobAccessibilityElement, "_addBoundariesFromRect:toXBoundarySet:andYBoundarySet:", v26, v27, v14, v16, v18, v20);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  objc_msgSend(v30, "crlaxPositionInUnscaledCanvas");
  v32 = v31;
  v34 = v33;

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber crl_numberWithCGFloat:](NSNumber, "crl_numberWithCGFloat:", v32));
  objc_msgSend(v26, "addObject:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber crl_numberWithCGFloat:](NSNumber, "crl_numberWithCGFloat:", v34));
  objc_msgSend(v27, "addObject:", v36);

  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  obj = v24;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v103;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(_QWORD *)v103 != v39)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)i), "crlaxFrameInUnscaledCanvas");
        +[CRLCanvasKnobAccessibilityElement _addBoundariesFromRect:toXBoundarySet:andYBoundarySet:](CRLCanvasKnobAccessibilityElement, "_addBoundariesFromRect:toXBoundarySet:andYBoundarySet:", v26, v27);
      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
    }
    while (v38);
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  objc_msgSend(v41, "crlaxConnectionLineMagnetSnapRadius");
  v78 = v26;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasKnobAccessibilityElement _disconnectionActionTestValuesFromBoundaries:withCanvasSnapRadius:](CRLCanvasKnobAccessibilityElement, "_disconnectionActionTestValuesFromBoundaries:withCanvasSnapRadius:", v26));

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  objc_msgSend(v43, "crlaxConnectionLineMagnetSnapRadius");
  v77 = v27;
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasKnobAccessibilityElement _disconnectionActionTestValuesFromBoundaries:withCanvasSnapRadius:](CRLCanvasKnobAccessibilityElement, "_disconnectionActionTestValuesFromBoundaries:withCanvasSnapRadius:", v27));

  v76 = self;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  objc_msgSend(v44, "crlaxConnectionLineMagnetSnapRadius");
  v46 = v45;

  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v80 = v42;
  v83 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v98, v109, 16);
  if (!v83)
  {
    v85 = 1.79769313e308;
    v86 = 1.79769313e308;
    goto LABEL_48;
  }
  v81 = *(_QWORD *)v99;
  v47 = 1.79769313e308;
  v85 = 1.79769313e308;
  v86 = 1.79769313e308;
  do
  {
    v48 = 0;
    do
    {
      if (*(_QWORD *)v99 != v81)
        objc_enumerationMutation(v80);
      v84 = v48;
      v49 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v48);
      v94 = 0u;
      v95 = 0u;
      v96 = 0u;
      v97 = 0u;
      v50 = v82;
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v94, v108, 16);
      if (v51)
      {
        v52 = v51;
        v53 = *(_QWORD *)v95;
        do
        {
          for (j = 0; j != v52; j = (char *)j + 1)
          {
            if (*(_QWORD *)v95 != v53)
              objc_enumerationMutation(v50);
            v55 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)j);
            objc_msgSend(v49, "crl_CGFloatValue");
            v57 = v56;
            objc_msgSend(v55, "crl_CGFloatValue");
            v59 = v58;
            if (!sub_10005FE60(v57, v58, v32, v34))
            {
              v112.origin.y = v88;
              v112.origin.x = v89;
              v112.size.width = v28;
              v112.size.height = v29;
              v111.x = v57;
              v111.y = v59;
              if (CGRectContainsPoint(v112, v111))
              {
                v92 = 0u;
                v93 = 0u;
                v90 = 0u;
                v91 = 0u;
                v60 = obj;
                v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v90, v107, 16);
                if (!v61)
                {

LABEL_32:
                  v70 = sub_10006108C(v57, v59, v32, v34);
                  v71 = vabdd_f64(v70, v47);
                  if (v70 < v47 && v71 >= 0.00999999978
                    || (v70 == v47 || v71 < 0.00999999978)
                    && (v57 == v32
                     || vabdd_f64(v57, v32) < 0.00999999978
                     || v59 == v34
                     || vabdd_f64(v59, v34) < 0.00999999978))
                  {
                    v85 = v59;
                    v86 = v57;
                    v47 = v70;
                  }
                  continue;
                }
                v62 = v61;
                v63 = 0;
                v64 = *(_QWORD *)v91;
                do
                {
                  for (k = 0; k != v62; k = (char *)k + 1)
                  {
                    if (*(_QWORD *)v91 != v64)
                      objc_enumerationMutation(v60);
                    objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)k), "crlaxFrameInUnscaledCanvas");
                    v63 |= sub_1000610A4(v57, v59, v66, v67, v68, v69) <= v46;
                  }
                  v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v90, v107, 16);
                }
                while (v62);

                if ((v63 & 1) == 0)
                  goto LABEL_32;
              }
            }
          }
          v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v94, v108, 16);
        }
        while (v52);
      }

      v48 = v84 + 1;
    }
    while ((id)(v84 + 1) != v83);
    v83 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v98, v109, 16);
  }
  while (v83);
LABEL_48:

  v72 = v85 != 1.79769313e308 || v86 != 1.79769313e308;
  if (v72)
  {
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](v76, "knob"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](v76, "parentRep"));
    objc_msgSend(v74, "crlaxConvertNaturalPointFromUnscaledCanvas:", v86, v85);
    objc_msgSend(v73, "crlaxMoveKnobToRepPositionInNaturalSpace:");

  }
  return v72;
}

- (id)makeCustomActionsForMagnetSnapping
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  v4 = objc_msgSend(v3, "crlaxIsConnectionLineEndpointHandleWithConnection");

  if (v4)
  {
    v29 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
    v6 = objc_msgSend(v5, "crlaxConnectionMagnetType");

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v6));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v8 = objc_msgSend(&off_1012CB860, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(&off_1012CB860);
          v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v11);
          v13 = objc_msgSend(v7, "unsignedIntegerValue");
          if (v13 != objc_msgSend(v12, "unsignedIntegerValue"))
          {
            v14 = objc_msgSend(v12, "unsignedIntegerValue");
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "crlaxUnscaledCanvasPointForSnappingKnobToConnectionMagnetType:", v14));

            if (v16)
            {
              objc_msgSend(v16, "CGPointValue");
              v18 = v17;
              v20 = v19;
              v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
              v22 = objc_msgSend(v21, "crlaxCanSnapKnobToConnectionMagnetAtUnscaledCanvasPoint:", v18, v20);

              if (v22)
              {
                switch((unint64_t)v14)
                {
                  case 1uLL:
                    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                    v24 = v23;
                    v25 = CFSTR("Snap to center");
                    goto LABEL_17;
                  case 2uLL:
                    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                    v24 = v23;
                    v25 = CFSTR("Snap to middle of top edge");
                    goto LABEL_17;
                  case 3uLL:
                    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                    v24 = v23;
                    v25 = CFSTR("Snap to middle of right edge");
                    goto LABEL_17;
                  case 4uLL:
                    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                    v24 = v23;
                    v25 = CFSTR("Snap to middle of bottom edge");
                    goto LABEL_17;
                  case 5uLL:
                    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                    v24 = v23;
                    v25 = CFSTR("Snap to middle of left edge");
LABEL_17:
                    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", v25, 0, 0));

                    break;
                  default:
                    v26 = 0;
                    break;
                }
                v27 = -[CRLCanvasKnobAccessibilityElement newActionWithName:toSnapToMagnet:usingUnscaledCanvasPoint:](self, "newActionWithName:toSnapToMagnet:usingUnscaledCanvasPoint:", v26, v14, v18, v20);
                objc_msgSend(v29, "crl_addNonNilObject:", v27);

              }
            }

          }
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(&off_1012CB860, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v9);
    }

  }
  else
  {
    v29 = 0;
  }
  return v29;
}

- (CRLCanvasKnobAccessibility)knob
{
  id WeakRetained;
  unint64_t knobTag;
  unint64_t knobNodeIndex;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentRep);
  knobTag = self->_knobTag;
  knobNodeIndex = self->_knobNodeIndex;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement crlaxIdentifier](self, "crlaxIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "crlaxKnobForTag:index:identifier:", knobTag, knobNodeIndex, v6));

  return (CRLCanvasKnobAccessibility *)v7;
}

- (BOOL)isOnShapeWithText
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  char v13;

  v13 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentRep);
  objc_opt_class(CRLWPShapeRepAccessibility, v3);
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)WeakRetained, 1, &v13);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (v13)
    abort();
  v7 = (void *)v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxContainedRep"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crlaxStorage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "crlaxString"));
  v11 = objc_msgSend(v10, "length") != 0;

  return v11;
}

- (double)crlaxMoveActionOffsetDistance
{
  void *v2;
  double v3;
  double v4;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](self, "knob"));
  objc_msgSend(v2, "crlaxCurrentGridSnapDistance");
  v4 = v3;

  result = 10.0;
  if (v4 != 0.0)
    return v4;
  return result;
}

+ (id)crlaxSortKnobElements:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v3);

  objc_msgSend(v4, "sortUsingComparator:", &stru_10124CCB8);
  v5 = objc_msgSend(v4, "copy");

  return v5;
}

+ (int)_crlaxCategoryRankForKnobElement:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "knob"));
  if ((objc_msgSend(v4, "crlaxIsConnectionLineCreationKnob") & 1) != 0)
  {
    v5 = 0;
  }
  else if ((objc_msgSend(v4, "crlaxIs3DObjectPlayPauseKnob") & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "crlaxIsShapeControlKnob") & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(v4, "crlaxIs3DReorientationKnob") & 1) != 0)
  {
    v5 = 4;
  }
  else if ((char *)objc_msgSend(v3, "knobTag") - 1 >= (char *)0xB)
  {
    v5 = 3;
  }
  else
  {
    v5 = 5;
  }

  return v5;
}

- (id)_makeInitialConnectionActionsTemplates
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  objc_class *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  objc_class *v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  void *i;
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  CRLCanvasConnectionKnobConnectionActionTemplate *v56;
  void *v58;
  id v59;
  CRLCanvasKnobAccessibilityElement *v60;
  uint64_t v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  char v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  void *v72;
  _BYTE v73[128];
  _BYTE v74[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxAvailableRepsForConnecting"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v69;
    v60 = self;
    v61 = *(_QWORD *)v69;
    v58 = v3;
    do
    {
      v9 = 0;
      v62 = v7;
      do
      {
        if (*(_QWORD *)v69 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep", v58));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crlaxTarget"));

        if (v10 != v12)
        {
          v67 = 0;
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crlaxLayout"));

          objc_opt_class(CRLConnectionLineLayout, v15);
          v17 = __CRLAccessibilityCastAsClass(v16, (uint64_t)v14, 1, &v67);
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (v67)
            goto LABEL_32;
          v19 = (void *)v18;

          if (v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "connectedFrom"));
            v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layout"));
            if (v20 != (void *)v21)
            {
              v22 = (void *)v21;
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "connectedTo"));
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layout"));

              v25 = v23 == v24;
              v8 = v61;
              v7 = v62;
              if (!v25)
                goto LABEL_11;
LABEL_28:

              goto LABEL_29;
            }
            v54 = v20;
          }
          else
          {
LABEL_11:
            v67 = 0;
            v26 = v10;
            objc_opt_class(CRLCanvasRepAccessibility, v27);
            v29 = __CRLAccessibilityCastAsSafeCategory(v28, (uint64_t)v26, 1, &v67);
            v30 = objc_claimAutoreleasedReturnValue(v29);
            if (v67)
              goto LABEL_32;
            v20 = (void *)v30;

            objc_opt_class(CRLGroupRep, v31);
            if ((objc_opt_isKindOfClass(v26, v32) & 1) != 0)
            {
              v67 = 0;
              v33 = v26;
              objc_opt_class(CRLGroupRep, v34);
              v36 = __CRLAccessibilityCastAsClass(v35, (uint64_t)v33, 1, &v67);
              v37 = objc_claimAutoreleasedReturnValue(v36);
              if (v67)
                goto LABEL_32;
              v38 = (void *)v37;

              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "allRepsContainedInGroup"));
              v59 = objc_alloc((Class)NSMutableSet);
              v67 = 0;
              v40 = v39;
              objc_opt_class(NSArray, v41);
              v43 = __CRLAccessibilityCastAsClass(v42, (uint64_t)v40, 1, &v67);
              v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
              if (v67)
LABEL_32:
                abort();
              v65 = 0u;
              v66 = 0u;
              v63 = 0u;
              v64 = 0u;
              v45 = v44;
              v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
              if (v46)
              {
                v48 = v46;
                v49 = *(_QWORD *)v64;
                do
                {
                  for (i = 0; i != v48; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v64 != v49)
                      objc_enumerationMutation(v45);
                    v51 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i);
                    objc_opt_class(CRLCanvasRepAccessibility, v47);
                    v53 = (id)__CRLAccessibilityCastAsSafeCategory(v52, v51, 1, &v67);
                    if (v67)
                      goto LABEL_32;
                  }
                  v48 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
                }
                while (v48);
              }

              v54 = objc_msgSend(v59, "initWithArray:", v45);
              v3 = v58;
              v8 = v61;
              v7 = v62;
            }
            else
            {
              v55 = objc_alloc((Class)NSMutableSet);
              v72 = v20;
              v40 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v72, 1));
              v54 = objc_msgSend(v55, "initWithArray:", v40);
            }

            v56 = -[CRLCanvasConnectionKnobConnectionActionTemplate initWithRepForConnecting:andRepsForDragging:]([CRLCanvasConnectionKnobConnectionActionTemplate alloc], "initWithRepForConnecting:andRepsForDragging:", v20, v54);
            objc_msgSend(v3, "addObject:", v56);

            self = v60;
          }

          goto LABEL_28;
        }
LABEL_29:
        v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
    }
    while (v7);
  }

  return v3;
}

- (void)_trackRepOcclusionsWithConnectionActionTemplates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void **p_cache;
  __objc2_class_ro **p_info;
  uint64_t v16;
  void *v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  char isKindOfClass;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  void **v48;
  void *v49;
  id v50;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id obj;
  uint64_t v62;
  id v63;
  uint64_t v64;
  void *v65;
  id v66;
  uint64_t v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  char v77;
  _BYTE v78[128];
  _BYTE v79[128];
  CGRect v80;
  CGRect v81;

  v4 = a3;
  v77 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxInteractiveCanvasController"));

  objc_opt_class(CRLInteractiveCanvasController, v7);
  v9 = __CRLAccessibilityCastAsClass(v8, (uint64_t)v6, 1, &v77);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (v77)
LABEL_36:
    abort();
  v11 = (void *)v10;

  v60 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvas"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allRepsOrdered"));

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v4;
  v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
  if (v63)
  {
    v62 = *(_QWORD *)v74;
    p_cache = CRLWPMutableRangeArray.cache;
    p_info = &OBJC_METACLASS___CRLShapeLibraryShape.info;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v74 != v62)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v16);
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v64 = v16;
        v65 = v17;
        v66 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "repAccessibilitiesForDragging"));
        v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
        if (v68)
        {
          v67 = *(_QWORD *)v70;
          do
          {
            for (i = 0; i != v68; i = (char *)i + 1)
            {
              if (*(_QWORD *)v70 != v67)
                objc_enumerationMutation(v66);
              v19 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i);
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "crlaxTarget"));
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "layout"));
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_cache + 83, "crlaxBoardItemIDForLayout:", v21));

              if (v22)
              {
                objc_msgSend(v19, "crlaxFrameInUnscaledCanvas");
                v24 = v23;
                v26 = v25;
                v28 = v27;
                v30 = v29;
                if (objc_msgSend(v13, "count"))
                {
                  v31 = 0;
                  while (1)
                  {
                    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v31));
                    v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "crlaxTarget"));
                    v35 = v32;
                    if ((void *)v33 == v32)
                      goto LABEL_29;
                    v36 = (void *)v33;
                    objc_opt_class(p_info + 431, v34);
                    isKindOfClass = objc_opt_isKindOfClass(v32, v37);

                    if ((isKindOfClass & 1) == 0)
                      break;
LABEL_30:

                    if (++v31 >= (unint64_t)objc_msgSend(v13, "count"))
                      goto LABEL_31;
                  }
                  v77 = 0;
                  v39 = v32;
                  objc_opt_class(p_cache + 83, v40);
                  v42 = __CRLAccessibilityCastAsSafeCategory(v41, (uint64_t)v39, 1, &v77);
                  v43 = objc_claimAutoreleasedReturnValue(v42);
                  if (v77)
                    goto LABEL_36;
                  v35 = (void *)v43;

                  if (v35)
                  {
                    if ((objc_msgSend(v35, "crlaxIsContainedTextRep") & 1) == 0)
                    {
                      objc_msgSend(v39, "frameInUnscaledCanvas");
                      v81.origin.x = v44;
                      v81.origin.y = v45;
                      v81.size.width = v46;
                      v81.size.height = v47;
                      v80.origin.x = v24;
                      v80.origin.y = v26;
                      v80.size.width = v28;
                      v80.size.height = v30;
                      if (CGRectIntersectsRect(v80, v81))
                      {
                        v48 = p_cache;
                        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "crlaxTarget"));
                        v50 = objc_msgSend(v13, "indexOfObject:", v49);

                        if (CRLAccessibilityShouldPerformValidationChecks()
                          && v50 == (id)0x7FFFFFFFFFFFFFFFLL)
                        {
                          ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
                          p_cache = v48;
                          p_info = (__objc2_class_ro **)(&OBJC_METACLASS___CRLShapeLibraryShape + 32);
                          if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Found an occluding rep that had no index within allRepsOrdered"), v52, v53, v54, v55, v56, v59))goto LABEL_36;
                        }
                        else
                        {
                          p_cache = v48;
                          if (v50 != (id)0x7FFFFFFFFFFFFFFFLL && (unint64_t)v50 < v31)
                          {
                            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "occludingRepAccessibilitiesByUUID"));
                            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectForKeyedSubscript:", v22));
                            objc_msgSend(v58, "addObject:", v35);

                            p_cache = v48;
                          }
                          p_info = (__objc2_class_ro **)(&OBJC_METACLASS___CRLShapeLibraryShape + 32);
                        }
                      }
                    }
                  }
LABEL_29:

                  goto LABEL_30;
                }
              }
LABEL_31:

            }
            v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
          }
          while (v68);
        }

        v16 = v64 + 1;
      }
      while ((id)(v64 + 1) != v63);
      v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
    }
    while (v63);
  }

}

- (id)_targetUnscaledCanvasPointsForConnectionActionsByRepForConnectingFromActionTemplates:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v17;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = a3;
  v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v3, "count")));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "repAXForConnecting", v19));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "crlaxTarget"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layout"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRepAccessibility crlaxBoardItemIDForLayout:](CRLCanvasRepAccessibility, "crlaxBoardItemIDForLayout:", v12));

        if (v13)
        {
          -[CRLCanvasKnobAccessibilityElement _targetUnscaledCanvasPointForConnectionActionByActionTemplate:](self, "_targetUnscaledCanvasPointForConnectionActionByActionTemplate:", v9);
          if (v15 != 1.79769313e308 || v14 != 1.79769313e308)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:"));
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, v13);

          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  return v19;
}

- (CGPoint)_targetUnscaledCanvasPointForConnectionActionByActionTemplate:(id)a3
{
  double v3;
  double v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *i;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  int v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  id v58;
  void *j;
  void *v60;
  double v61;
  double v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  char isKindOfClass;
  void *v67;
  void *v68;
  double v69;
  double v70;
  id v71;
  id v72;
  id v73;
  uint64_t v74;
  double v75;
  void *k;
  int v77;
  double v78;
  double v79;
  double v80;
  double v81;
  id obj;
  id v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  CRLCanvasKnobAccessibilityElement *v94;
  void *v95;
  uint64_t v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  char v118;
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  CGPoint result;
  CGPoint v125;
  CGPoint v126;
  CGPoint v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;

  v6 = a3;
  v118 = 0;
  v94 = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxInteractiveCanvasController"));

  objc_opt_class(CRLInteractiveCanvasController, v9);
  v11 = __CRLAccessibilityCastAsClass(v10, (uint64_t)v8, 1, &v118);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (v118)
    abort();
  v13 = (void *)v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "canvas"));
  objc_msgSend(v14, "visibleUnscaledRectForClippingReps");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "repAccessibilitiesForDragging"));
  v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v123, 16);
  if (v88)
  {
    v87 = *(_QWORD *)v115;
    v83 = v6;
LABEL_4:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v115 != v87)
        objc_enumerationMutation(obj);
      v24 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "crlaxTarget"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "layout"));
      v27 = objc_claimAutoreleasedReturnValue(+[CRLCanvasRepAccessibility crlaxBoardItemIDForLayout:](CRLCanvasRepAccessibility, "crlaxBoardItemIDForLayout:", v26));

      if (v27)
      {
        v91 = v23;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "occludingRepAccessibilitiesByUUID"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v27));

        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "occludingRepAccessibilitiesByUUID"));
        v90 = (void *)v27;
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", v27));
        v32 = 2 * (_QWORD)objc_msgSend(v31, "count") + 4;

        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", v32));
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", v32));
        +[CRLCanvasKnobAccessibilityElement _addBoundariesFromRect:toXBoundarySet:andYBoundarySet:](CRLCanvasKnobAccessibilityElement, "_addBoundariesFromRect:toXBoundarySet:andYBoundarySet:", v33, v34, v16, v18, v20, v22);
        objc_msgSend(v24, "crlaxFrameInUnscaledCanvas");
        +[CRLCanvasKnobAccessibilityElement _addBoundariesFromRect:toXBoundarySet:andYBoundarySet:](CRLCanvasKnobAccessibilityElement, "_addBoundariesFromRect:toXBoundarySet:andYBoundarySet:", v33, v34);
        v112 = 0u;
        v113 = 0u;
        v110 = 0u;
        v111 = 0u;
        v35 = v29;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v110, v122, 16);
        v37 = v24;
        if (v36)
        {
          v38 = v36;
          v39 = *(_QWORD *)v111;
          do
          {
            for (i = 0; i != v38; i = (char *)i + 1)
            {
              if (*(_QWORD *)v111 != v39)
                objc_enumerationMutation(v35);
              objc_msgSend(*(id *)(*((_QWORD *)&v110 + 1) + 8 * (_QWORD)i), "crlaxFrameInUnscaledCanvas");
              +[CRLCanvasKnobAccessibilityElement _addBoundariesFromRect:toXBoundarySet:andYBoundarySet:](CRLCanvasKnobAccessibilityElement, "_addBoundariesFromRect:toXBoundarySet:andYBoundarySet:", v33, v34);
            }
            v38 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v110, v122, 16);
          }
          while (v38);
        }

        v41 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasKnobAccessibilityElement _connectionActionMidpointsFromBoundaries:](CRLCanvasKnobAccessibilityElement, "_connectionActionMidpointsFromBoundaries:", v33));
        v42 = objc_msgSend(v41, "mutableCopy");

        v43 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasKnobAccessibilityElement _connectionActionMidpointsFromBoundaries:](CRLCanvasKnobAccessibilityElement, "_connectionActionMidpointsFromBoundaries:", v34));
        v44 = objc_msgSend(v43, "mutableCopy");

        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "crlaxLayout"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "crlaxTarget"));
        v47 = 1;
        objc_msgSend(v46, "getCardinalPositionFromType:", 1);
        v49 = v48;
        v51 = v50;

        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber crl_numberWithCGFloat:](NSNumber, "crl_numberWithCGFloat:", v49));
        objc_msgSend(v42, "insertObject:atIndex:", v52, 0);

        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber crl_numberWithCGFloat:](NSNumber, "crl_numberWithCGFloat:", v51));
        v92 = v44;
        objc_msgSend(v44, "insertObject:atIndex:", v53, 0);

        v108 = 0u;
        v109 = 0u;
        v106 = 0u;
        v107 = 0u;
        v54 = v42;
        v85 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v106, v121, 16);
        if (v85)
        {
          v55 = *(_QWORD *)v107;
          v89 = v54;
          v84 = *(_QWORD *)v107;
          do
          {
            v56 = 0;
            do
            {
              if (*(_QWORD *)v107 != v55)
                objc_enumerationMutation(v54);
              v86 = v56;
              v57 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v56);
              v102 = 0u;
              v103 = 0u;
              v104 = 0u;
              v105 = 0u;
              v58 = v92;
              v97 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v102, v120, 16);
              if (v97)
              {
                v95 = v58;
                v96 = *(_QWORD *)v103;
                v93 = v57;
                while (2)
                {
                  for (j = 0; j != v97; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v103 != v96)
                      objc_enumerationMutation(v58);
                    v60 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)j);
                    objc_msgSend(v57, "crl_CGFloatValue");
                    v3 = v61;
                    objc_msgSend(v60, "crl_CGFloatValue");
                    v4 = v62;
                    v128.origin.x = v16;
                    v128.origin.y = v18;
                    v128.size.width = v20;
                    v128.size.height = v22;
                    v125.x = v3;
                    v125.y = v4;
                    if (CGRectContainsPoint(v128, v125))
                    {
                      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "crlaxInfo"));
                      objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v64);
                      isKindOfClass = objc_opt_isKindOfClass(v63, v65);

                      if ((isKindOfClass & 1) != 0)
                      {
                        objc_msgSend(v37, "crlaxFrameInUnscaledCanvas");
                        v126.x = v3;
                        v126.y = v4;
                        if (CGRectContainsPoint(v129, v126))
                          goto LABEL_30;
                      }
                      else if (objc_msgSend(v37, "crlaxBezierPathContainsUnscaledCanvasPoint:", v3, v4))
                      {
LABEL_30:
                        v67 = v37;
                        v68 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement knob](v94, "knob"));
                        objc_msgSend(v68, "crlaxConnectionLineMagnetSnapRadius");
                        v70 = v69;

                        v100 = 0u;
                        v101 = 0u;
                        v98 = 0u;
                        v99 = 0u;
                        v71 = v35;
                        v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v98, v119, 16);
                        if (v72)
                        {
                          v73 = v72;
                          v74 = *(_QWORD *)v99;
                          v75 = -v70;
                          while (2)
                          {
                            for (k = 0; k != v73; k = (char *)k + 1)
                            {
                              if (*(_QWORD *)v99 != v74)
                                objc_enumerationMutation(v71);
                              objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)k), "crlaxFrameInUnscaledCanvas");
                              v131 = CGRectInset(v130, v75, v75);
                              v127.x = v3;
                              v127.y = v4;
                              if (CGRectContainsPoint(v131, v127))
                              {

                                v37 = v67;
                                v58 = v95;
                                v57 = v93;
                                goto LABEL_40;
                              }
                            }
                            v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v98, v119, 16);
                            if (v73)
                              continue;
                            break;
                          }
                        }

                        v47 = 0;
                        v77 = 1;
                        v54 = v89;
                        goto LABEL_47;
                      }
                    }
LABEL_40:
                    ;
                  }
                  v97 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v102, v120, 16);
                  if (v97)
                    continue;
                  break;
                }
              }

              v56 = v86 + 1;
              v54 = v89;
              v55 = v84;
            }
            while ((id)(v86 + 1) != v85);
            v77 = 0;
            v47 = 1;
            v85 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v106, v121, 16);
          }
          while (v85);
        }
        else
        {
          v77 = 0;
        }
LABEL_47:

        v6 = v83;
        v23 = v91;
        if (!v47)
          break;
      }
      if ((id)++v23 == v88)
      {
        v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v123, 16);
        if (v88)
          goto LABEL_4;
        v77 = 0;
        break;
      }
    }
  }
  else
  {
    v77 = 0;
  }

  if (v77)
    v78 = v4;
  else
    v78 = 1.79769313e308;
  if (v77)
    v79 = v3;
  else
    v79 = 1.79769313e308;

  v80 = v79;
  v81 = v78;
  result.y = v81;
  result.x = v80;
  return result;
}

+ (id)_connectionActionMidpointsFromBoundaries:(id)a3
{
  void *v3;
  void *v4;
  char *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "crl_sortedArray"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)objc_msgSend(v3, "count") - 1));
  if (objc_msgSend(v3, "count") != (id)1)
  {
    v5 = 0;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v5));
      objc_msgSend(v6, "crl_CGFloatValue");
      v8 = v7;

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v5 + 1));
      objc_msgSend(v9, "crl_CGFloatValue");
      v11 = v10;

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber crl_numberWithCGFloat:](NSNumber, "crl_numberWithCGFloat:", (v8 + v11) * 0.5));
      objc_msgSend(v4, "setObject:atIndexedSubscript:", v12, v5);

      ++v5;
    }
    while (v5 < (char *)objc_msgSend(v3, "count") - 1);
  }

  return v4;
}

+ (id)_disconnectionActionTestValuesFromBoundaries:(id)a3 withCanvasSnapRadius:(double)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  double v10;
  uint64_t v11;
  void *i;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[3];
  _BYTE v25[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "crl_sortedArray"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 3 * (_QWORD)objc_msgSend(v5, "count")));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = a4 + 1.0;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "crl_CGFloatValue", (_QWORD)v20);
        v15 = v10 + v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber crl_numberWithCGFloat:](NSNumber, "crl_numberWithCGFloat:", v14 - v10));
        v24[0] = v16;
        v24[1] = v13;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber crl_numberWithCGFloat:](NSNumber, "crl_numberWithCGFloat:", v15));
        v24[2] = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 3));
        objc_msgSend(v6, "addObjectsFromArray:", v18);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)_layoutsForConnectionActionNames
{
  void *v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;
  _BYTE v24[128];

  v23 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobAccessibilityElement parentRep](self, "parentRep"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxInteractiveCanvasController"));

  objc_opt_class(CRLInteractiveCanvasController, v4);
  v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v3, 1, &v23);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v23)
    abort();
  v8 = (void *)v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvas"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allRepsOrdered"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v10, "count")));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v16), "layout", (_QWORD)v19));
        objc_msgSend(v11, "addObject:", v17);

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v14);
  }

  return v11;
}

+ (void)_addBoundariesFromRect:(CGRect)a3 toXBoundarySet:(id)a4 andYBoundarySet:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a5;
  v11 = a4;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v12 = +[NSNumber crl_numberWithCGFloat:](NSNumber, "crl_numberWithCGFloat:", CGRectGetMinX(v20));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v11, "addObject:", v13);

  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v14 = +[NSNumber crl_numberWithCGFloat:](NSNumber, "crl_numberWithCGFloat:", CGRectGetMaxX(v21));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v11, "addObject:", v15);

  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v16 = +[NSNumber crl_numberWithCGFloat:](NSNumber, "crl_numberWithCGFloat:", CGRectGetMinY(v22));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v10, "addObject:", v17);

  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v18 = +[NSNumber crl_numberWithCGFloat:](NSNumber, "crl_numberWithCGFloat:", CGRectGetMaxY(v23));
  v19 = (id)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v10, "addObject:", v19);

}

- (CRLCanvasRepAccessibility)parentRep
{
  return (CRLCanvasRepAccessibility *)objc_loadWeakRetained((id *)&self->_parentRep);
}

- (void)setParentRep:(id)a3
{
  objc_storeWeak((id *)&self->_parentRep, a3);
}

- (unint64_t)knobTag
{
  return self->_knobTag;
}

- (void)setKnobTag:(unint64_t)a3
{
  self->_knobTag = a3;
}

- (unint64_t)knobNodeIndex
{
  return self->_knobNodeIndex;
}

- (void)setKnobNodeIndex:(unint64_t)a3
{
  self->_knobNodeIndex = a3;
}

- (NSString)crlaxIdentifier
{
  return self->_crlaxIdentifier;
}

- (void)setCrlaxIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_crlaxIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crlaxIdentifier, 0);
  objc_destroyWeak((id *)&self->_parentRep);
}

@end
