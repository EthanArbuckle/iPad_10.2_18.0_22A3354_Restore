@implementation UITextPhraseBoundaryInteraction

- (UITextPhraseBoundaryInteraction)initWithTextInput:(id)a3
{
  id v4;
  UITextPhraseBoundaryInteraction *v5;
  UITextPhraseBoundaryInteraction *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITextPhraseBoundaryInteraction;
  v5 = -[UITextInteraction init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[UITextInteraction setTextInput:](v5, "setTextInput:", v4);
    -[UITextPhraseBoundaryInteraction _phraseBoundaryGestureRecognizer](v6, "_phraseBoundaryGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInteraction addGestureRecognizer:withName:](v6, "addGestureRecognizer:withName:", v7, 0x1E17788E0);

  }
  return v6;
}

- (void)didMoveToView:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITextPhraseBoundaryInteraction;
  v4 = a3;
  -[UITextInteraction didMoveToView:](&v5, sel_didMoveToView_, v4);
  -[UITextGestureTuning setContainerCoordinateSpace:](self->_gestureTuning, "setContainerCoordinateSpace:", v4, v5.receiver, v5.super_class);

}

- (CGPoint)pointIfPlacedCarefully:(CGPoint)result
{
  UITextGestureTuning *gestureTuning;

  gestureTuning = self->_gestureTuning;
  if (gestureTuning)
    -[UITextGestureTuning pointIfPlacedCarefully:](gestureTuning, "pointIfPlacedCarefully:", result.x, result.y);
  return result;
}

- (CGPoint)touchAlignedPointForPoint:(CGPoint)result translation:(CGPoint)a4
{
  UITextGestureTuning *gestureTuning;

  gestureTuning = self->_gestureTuning;
  if (gestureTuning)
    -[UITextGestureTuning touchAlignedPointForPoint:translation:](gestureTuning, "touchAlignedPointForPoint:translation:", result.x, result.y, a4.x, a4.y);
  return result;
}

- (void)_createGestureTuningIfNecessary
{
  void *v3;
  void *v4;
  int v5;
  UITextGestureTuning *v6;
  UITextGestureTuning *gestureTuning;
  void *v8;

  if (!self->_gestureTuning)
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferencesActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLForPreferenceKey:", CFSTR("YukonMagnifiersDisabled"));

    if (v5)
    {
      v6 = objc_alloc_init(UITextGestureTuning);
      gestureTuning = self->_gestureTuning;
      self->_gestureTuning = v6;

      -[UITextInteraction view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextGestureTuning setContainerCoordinateSpace:](self->_gestureTuning, "setContainerCoordinateSpace:", v8);

      -[UITextGestureTuning setShouldUseLineThreshold:](self->_gestureTuning, "setShouldUseLineThreshold:", 1);
    }
  }
}

- (void)updateVisibilityOffsetForGesture:(id)a3
{
  id v4;
  UITextGestureTuning *gestureTuning;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[UITextPhraseBoundaryInteraction _createGestureTuningIfNecessary](self, "_createGestureTuningIfNecessary");
  gestureTuning = self->_gestureTuning;
  objc_msgSend(v4, "_allActiveTouches");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "state");

  -[UITextGestureTuning updateWithTouches:gestureState:](gestureTuning, "updateWithTouches:gestureState:", v7, v6);
}

- (id)_phraseBoundaryGestureRecognizer
{
  UIPhraseBoundaryGestureRecognizer *v3;
  void *v4;

  v3 = -[UIPhraseBoundaryGestureRecognizer initWithTarget:action:]([UIPhraseBoundaryGestureRecognizer alloc], "initWithTarget:action:", self, sel__phraseBoundaryGesture_);
  -[UITextInteraction textInput](self, "textInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPhraseBoundaryGestureRecognizer setTextInput:](v3, "setTextInput:", v4);

  -[UILongPressGestureRecognizer setDelay:](v3, "setDelay:", 0.0);
  -[UIPhraseBoundaryGestureRecognizer setSecondDelay:](v3, "setSecondDelay:", 0.2);
  -[UILongPressGestureRecognizer setNumberOfTouchesRequired:](v3, "setNumberOfTouchesRequired:", 1);
  -[UIGestureRecognizer setDelaysTouchesEnded:](v3, "setDelaysTouchesEnded:", 0);
  -[UILongPressGestureRecognizer setAllowableMovement:](v3, "setAllowableMovement:", 1.79769313e308);
  return v3;
}

- (void)_phraseBoundaryGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  int v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void (**v20)(void *, uint64_t, void *);
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  UITextCursorAssertion *v35;
  UITextCursorAssertion *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  UITextCursorAssertion *blinkAssertion;
  void *v74;
  id v75;
  id v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  char v96;
  void *v97;
  void *v98;
  void (**v99)(void *, uint64_t, void *);
  id v100;
  void *v101;
  _QWORD aBlock[4];
  id v103;
  id v104;
  id v105;

  v4 = a3;
  -[UITextInteraction _textInput](self, "_textInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextPhraseBoundaryInteraction updateVisibilityOffsetForGesture:](self, "updateVisibilityOffsetForGesture:", v4);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isFirstResponder") & 1) == 0)
  {
    objc_msgSend(v7, "inputDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5 != v10;

    if (v6)
      goto LABEL_3;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v8 = 0;
  if (!v6)
    goto LABEL_5;
LABEL_3:
  v9 = objc_msgSend(v6, "useGesturesForEditableContent") ^ 1;
LABEL_6:
  if (((v8 | v9) & 1) == 0 && (objc_msgSend(v5, "_hasMarkedText") & 1) != 0)
  {
    if (objc_msgSend(v5, "_usesAsynchronousProtocol"))
    {
      objc_msgSend(v4, "centroid");
      v12 = v11;
      v14 = v13;
      if (objc_msgSend(v4, "state") == 1)
      {
        objc_msgSend(v5, "inputDelegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "selectionWillChange:", v5);

      }
      else
      {
        objc_msgSend(v5, "textInputView");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "_translationInView:", v37);
        v39 = v38;
        v41 = v40;

        -[UITextPhraseBoundaryInteraction touchAlignedPointForPoint:translation:](self, "touchAlignedPointForPoint:translation:", v12, v14, v39, v41);
        v12 = v42;
        v14 = v43;
      }
      if (objc_msgSend(v5, "conformsToProtocolCached:", &unk_1EE0CE288))
      {
        v16 = v5;
        objc_msgSend(v16, "textInputView");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "view");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "convertPoint:fromView:", v45, v12, v14);
        v47 = v46;
        v49 = v48;

        objc_msgSend(v16, "updateCurrentSelectionTo:fromGesture:inState:", 14, objc_msgSend(v4, "state"), v47, v49);
      }
      else
      {
        objc_msgSend(v5, "conformsToProtocolCached:", &unk_1EE0CE228);
        objc_msgSend(v6, "view");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "textInputView");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "view");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "convertPoint:fromView:", v51, v12, v14);
        objc_msgSend(v16, "changeSelectionWithGestureAt:withGesture:withState:", 14, objc_msgSend(v4, "state"), v52, v53);

      }
      goto LABEL_32;
    }
    objc_msgSend(v4, "userData");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "markedTextRange");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__UITextPhraseBoundaryInteraction__phraseBoundaryGesture___block_invoke;
    aBlock[3] = &unk_1E16E5810;
    v18 = v5;
    v103 = v18;
    v19 = v17;
    v104 = v19;
    v105 = v7;
    v20 = (void (**)(void *, uint64_t, void *))_Block_copy(aBlock);
    v21 = objc_msgSend(v4, "state");
    if ((unint64_t)(v21 - 3) < 2)
    {
      objc_msgSend(v18, "textInputView");
      v101 = v16;
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "centroid");
      v56 = v55;
      v58 = v57;
      objc_msgSend(v4, "view");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "convertPoint:fromView:", v59, v56, v58);
      v61 = v60;
      v63 = v62;

      objc_msgSend(v18, "textInputView");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_translationInView:", v64);
      v66 = v65;
      v68 = v67;

      -[UITextPhraseBoundaryInteraction touchAlignedPointForPoint:translation:](self, "touchAlignedPointForPoint:translation:", v61, v63, v66, v68);
      objc_msgSend(v18, "closestPositionToPoint:withinRange:", v19);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "caretRectForPosition:", v33);
      v70 = v69;
      v72 = v71;
      v20[2](v20, 1, v33);
      if (v101)
      {
        objc_msgSend(v101, "setMagnificationPoint:", v70, v72);
        objc_msgSend(v101, "stopMagnifying:", 1);
        objc_msgSend(v4, "setUserData:", 0);
      }
      -[UITextCursorAssertion invalidate](self->_blinkAssertion, "invalidate");
      blinkAssertion = self->_blinkAssertion;
      self->_blinkAssertion = 0;

      objc_msgSend(v18, "inputDelegate");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "selectionDidChange:", v18);

      v16 = v101;
      objc_msgSend(v6, "cancelAutoscroll");
      -[UITextInteraction setInGesture:](self, "setInGesture:", 0);
    }
    else if (v21 == 2)
    {
      objc_msgSend(v18, "textInputView");
      v99 = v20;
      v75 = v19;
      v76 = v16;
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "centroid");
      v79 = v78;
      v81 = v80;
      objc_msgSend(v4, "view");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "convertPoint:fromView:", v82, v79, v81);
      v84 = v83;
      v86 = v85;

      objc_msgSend(v18, "textInputView");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_translationInView:", v87);
      v89 = v88;
      v91 = v90;

      v16 = v76;
      v19 = v75;
      v20 = v99;
      -[UITextPhraseBoundaryInteraction touchAlignedPointForPoint:translation:](self, "touchAlignedPointForPoint:translation:", v84, v86, v89, v91);
      objc_msgSend(v18, "closestPositionToPoint:withinRange:", v19);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "caretRectForPosition:", v33);
      v93 = v92;
      v95 = v94;
      v96 = ((uint64_t (*)(void *, uint64_t, void *))v20[2])(v20, 1, v33);
      if (v16)
      {
        objc_msgSend(v16, "setMagnificationPoint:", v93, v95);
      }
      else if ((v96 & 1) != 0 || (objc_msgSend(v4, "secondDelayElapsed") & 1) != 0)
      {
        +[UITextMagnifierRanged sharedRangedMagnifier](UITextMagnifierRanged, "sharedRangedMagnifier");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setUserData:", v97);
        objc_msgSend(v18, "textInputView");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "beginMagnifyingTarget:text:magnificationPoint:offset:animated:", v98, v18, 1, v93, v95, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

        v16 = v97;
      }
      else
      {
        v16 = 0;
      }
      objc_msgSend(v6, "startAutoscroll:", v93, v95);
    }
    else
    {
      if (v21 != 1)
      {
LABEL_31:

LABEL_32:
        goto LABEL_33;
      }
      -[UITextInteraction setInGesture:](self, "setInGesture:", 1);
      objc_msgSend(v18, "inputDelegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "selectionWillChange:", v18);

      objc_msgSend(v18, "textInputView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "centroid");
      v25 = v24;
      v27 = v26;
      objc_msgSend(v4, "view");
      v100 = v16;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "convertPoint:fromView:", v28, v25, v27);
      v30 = v29;
      v32 = v31;

      objc_msgSend(v18, "closestPositionToPoint:withinRange:", v19, v30, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2](v20, 0, v33);
      -[UITextInteraction _assertionController](self, "_assertionController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "nonBlinkingAssertionWithReason:", CFSTR("Phrase Boundary gesture"));
      v35 = (UITextCursorAssertion *)objc_claimAutoreleasedReturnValue();
      v36 = self->_blinkAssertion;
      self->_blinkAssertion = v35;

      v16 = v100;
    }

    goto LABEL_31;
  }
  NSLog(CFSTR("Warning: phrase boundary gesture handler is somehow installed when there is no marked text"));
  -[UITextInteraction setInGesture:](self, "setInGesture:", 0);
  objc_msgSend(v6, "setGestureRecognizers");
LABEL_33:

}

uint64_t __58__UITextPhraseBoundaryInteraction__phraseBoundaryGesture___block_invoke(id *a1, int a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a3;
  if (a2)
  {
    v6 = a1[4];
    objc_msgSend(a1[5], "start");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "selectedTextRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "start");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "offsetFromPosition:toPosition:", v7, v9);

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(a1[4], "textRangeFromPosition:toPosition:", v5, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setSelectedTextRange:", v11);

  v12 = a1[4];
  objc_msgSend(a1[5], "start");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "offsetFromPosition:toPosition:", v13, v5);

  if (v14 == v10)
    v15 = a2 ^ 1u;
  else
    v15 = 1;
  if ((_DWORD)v15 == 1)
    objc_msgSend(a1[6], "didChangePhraseBoundary");

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blinkAssertion, 0);
  objc_storeStrong((id *)&self->_gestureTuning, 0);
}

@end
