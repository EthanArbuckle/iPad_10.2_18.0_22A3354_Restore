@implementation SBSwitcherModifier

- (SBSwitcherModifier)init
{
  SBSwitcherModifier *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSwitcherModifier;
  v2 = -[SBChainableModifier init](&v5, sel_init);
  if (v2)
  {
    +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_verifyModifierStackCoherencyCheckAfterHandlingEvent = objc_msgSend(v3, "isInternalInstall");

  }
  return v2;
}

- (BOOL)runsInternalVerificationAfterEventDispatch
{
  return self->_verifyModifierStackCoherencyCheckAfterHandlingEvent;
}

- (id)_handleEvent:(id)a3
{
  id v4;
  id v5;
  SBSwitcherModifier *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBSwitcherModifier;
  v5 = -[SBChainableModifier _handleEvent:](&v8, sel__handleEvent_, v4);
  switch(objc_msgSend(v4, "type"))
  {
    case 0:
      -[SBSwitcherModifier handleInitialSetupEvent:](self, "handleInitialSetupEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 1:
      -[SBSwitcherModifier handleTransitionEvent:](self, "handleTransitionEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 2:
    case 3:
    case 4:
    case 5:
    case 31:
      -[SBSwitcherModifier handleGestureEvent:](self, "handleGestureEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 6:
      -[SBSwitcherModifier handleReduceMotionChangedEvent:](self, "handleReduceMotionChangedEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 7:
      -[SBSwitcherModifier handleSwitcherSettingsChangedEvent:](self, "handleSwitcherSettingsChangedEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 8:
      -[SBSwitcherModifier handleHomeGestureSettingsChangedEvent:](self, "handleHomeGestureSettingsChangedEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 9:
      -[SBSwitcherModifier handleMedusaSettingsChangedEvent:](self, "handleMedusaSettingsChangedEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 10:
      -[SBSwitcherModifier handleHomeGrabberSettingsChangedEvent:](self, "handleHomeGrabberSettingsChangedEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 11:
      -[SBSwitcherModifier handleHighlightEvent:](self, "handleHighlightEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 12:
      -[SBSwitcherModifier handleSwipeToKillEvent:](self, "handleSwipeToKillEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 13:
      -[SBSwitcherModifier handleInsertionEvent:](self, "handleInsertionEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 14:
      -[SBSwitcherModifier handleRemovalEvent:](self, "handleRemovalEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 15:
      -[SBSwitcherModifier handleTimerEvent:](self, "handleTimerEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 16:
      -[SBSwitcherModifier handleTapOutsideToDismissEvent:](self, "handleTapOutsideToDismissEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 17:
      -[SBSwitcherModifier handleTapAppLayoutEvent:](self, "handleTapAppLayoutEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 18:
      -[SBSwitcherModifier handleTapSlideOverTongueEvent:](self, "handleTapSlideOverTongueEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 19:
      -[SBSwitcherModifier handleScrollEvent:](self, "handleScrollEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 20:
      -[SBSwitcherModifier handleUpdateFocusedAppLayoutEvent:](self, "handleUpdateFocusedAppLayoutEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 21:
      -[SBSwitcherModifier handleResizeProgressEvent:](self, "handleResizeProgressEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 22:
      -[SBSwitcherModifier handleBlurProgressEvent:](self, "handleBlurProgressEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 23:
      -[SBSwitcherModifier handleRepositionProgressEvent:](self, "handleRepositionProgressEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 24:
      -[SBSwitcherModifier handleSceneReadyEvent:](self, "handleSceneReadyEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 25:
      -[SBSwitcherModifier handleSwitcherDropEvent:](self, "handleSwitcherDropEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 26:
      -[SBSwitcherModifier handleSlideOverEdgeProtectTongueEvent:](self, "handleSlideOverEdgeProtectTongueEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 27:
      -[SBSwitcherModifier handleHideMorphToPIPAppLayoutEvent:](self, "handleHideMorphToPIPAppLayoutEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 28:
      -[SBSwitcherModifier handleAnimatablePropertyChangedEvent:](self, "handleAnimatablePropertyChangedEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 29:
      -[SBSwitcherModifier handleShelfFocusedDisplayItemsChangedEvent:](self, "handleShelfFocusedDisplayItemsChangedEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 30:
      -[SBSwitcherModifier handlePrepareForSceneUpdateEvent:](self, "handlePrepareForSceneUpdateEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 32:
      -[SBSwitcherModifier handleHoverEvent:](self, "handleHoverEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 33:
      -[SBSwitcherModifier handleUpdateWindowingModeEvent:](self, "handleUpdateWindowingModeEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 34:
      -[SBSwitcherModifier handleContinuousExposeIdentifiersChangedEvent:](self, "handleContinuousExposeIdentifiersChangedEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 35:
      -[SBSwitcherModifier handleContinuousExposeStripEdgeProtectTongueEvent:](self, "handleContinuousExposeStripEdgeProtectTongueEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 36:
      -[SBSwitcherModifier handleTapAppLayoutHeaderEvent:](self, "handleTapAppLayoutHeaderEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 37:
      -[SBSwitcherModifier handlePointerCrossedDisplayBoundaryEvent:](self, "handlePointerCrossedDisplayBoundaryEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 38:
      -[SBSwitcherModifier handleAssistantPresentationChangedEvent:](self, "handleAssistantPresentationChangedEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 39:
      -[SBSwitcherModifier handleHardwareButtonDropletAnimationEvent:](self, "handleHardwareButtonDropletAnimationEvent:", v4);
      v6 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
LABEL_3:
      self = v6;
      break;
    default:
      break;
  }

  return self;
}

- (id)handleTransitionEvent:(id)a3
{
  return 0;
}

- (id)handleSceneReadyEvent:(id)a3
{
  return 0;
}

- (id)handleTimerEvent:(id)a3
{
  return 0;
}

- (id)defaultAppLayoutsToCacheSnapshots
{
  void *v3;
  NSUInteger v4;
  void *v5;
  NSRange v6;
  void *v7;
  NSRange v9;
  NSRange v10;

  if (-[SBSwitcherModifier isDevicePad](self, "isDevicePad"))
  {
    -[SBSwitcherModifier switcherSettings](self, "switcherSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "numberOfSnapshotsToAlwaysKeepAround");

    -[SBSwitcherModifier appLayouts](self, "appLayouts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10.length = objc_msgSend(v5, "count");
    v9.location = 0;
    v9.length = v4;
    v10.location = 0;
    v6 = NSIntersectionRange(v9, v10);
    objc_msgSend(v5, "subarrayWithRange:", v6.location, v6.length);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v7;
}

- (double)distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:(unint64_t)a3 numberOfRows:(unint64_t)a4 padding:(double)a5 layoutDirection:(unint64_t)a6
{
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  char v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  double v19;
  void *v21;
  int v22;
  unint64_t v23;
  void *v25;
  char v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  double MaxX;
  CGAffineTransform v48;
  CGRect v49;
  CGRect v50;

  -[SBSwitcherModifier appLayouts](self, "appLayouts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  -[SBSwitcherModifier visibleAppLayouts](self, "visibleAppLayouts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v12)
      a3 = v12 - 1;
    else
      a3 = 0;
  }
  else
  {
    objc_msgSend(v11, "objectAtIndex:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "containsObject:", v14);

    v16 = v12 - 1;
    if (!v12)
      v16 = 0;
    if ((v15 & 1) == 0)
      a3 = v16;
  }
  v17 = a3 % a4;
  if (a6)
    v18 = a4;
  else
    v18 = -(uint64_t)a4;
  v19 = 0.0;
  if ((uint64_t)a3 >= v17 && a3 < v12)
  {
    objc_msgSend(v11, "objectAtIndex:", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v13, "containsObject:", v21);

    v23 = 0x7FFFFFFFFFFFFFFFLL;
    if (v22)
    {
      do
      {
        v23 = a3;
        a3 += v18;
        if ((uint64_t)a3 < v17 || a3 >= v12)
          break;
        objc_msgSend(v11, "objectAtIndex:", a3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v13, "containsObject:", v25);

      }
      while ((v26 & 1) != 0);
    }
    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[SBSwitcherModifier frameForIndex:](self, "frameForIndex:", v23);
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v34 = v33;
      -[SBSwitcherModifier scaleForIndex:](self, "scaleForIndex:", v23);
      v36 = v35;
      UIRectGetCenter();
      CGAffineTransformMakeScale(&v48, v36, v36);
      v49.origin.x = v28;
      v49.origin.y = v30;
      v49.size.width = v32;
      v49.size.height = v34;
      CGRectApplyAffineTransform(v49, &v48);
      SBUnintegralizedRectCenteredAboutPoint();
      v38 = v37;
      v40 = v39;
      v42 = v41;
      v44 = v43;
      if (-[SBSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
      {
        -[SBSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
        MaxX = v45 - v38;
      }
      else
      {
        v50.origin.x = v38;
        v50.origin.y = v40;
        v50.size.width = v42;
        v50.size.height = v44;
        MaxX = CGRectGetMaxX(v50);
      }
      v19 = MaxX + a5;
    }
  }

  return v19;
}

- (CGRect)scaledFrameForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[SBSwitcherModifier frameForIndex:](self, "frameForIndex:");
  -[SBSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
  SBTransformedRectWithScale();
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)scaledFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  char v21;
  id *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect result;

  v8 = a4;
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    -[SBSwitcherModifier frameForIndex:](self, "frameForIndex:", a5);
    -[SBSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a5);
    v14 = v13;
    SBTransformedRectWithScale();
    v10 = v15;
    v9 = v16;
    v11 = v17;
    v12 = v18;
    v19 = -[SBSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
    if (a3 == 1 && v19 == 0)
    {
      v21 = 1;
    }
    else if (a3 == 2)
    {
      v21 = v19;
    }
    else
    {
      v21 = 0;
    }
    if (objc_msgSend(v8, "isSplitConfiguration"))
    {
      v22 = (id *)MEMORY[0x1E0CEB258];
      if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
        v23 = 2;
      else
        v23 = 1;
      v24 = objc_msgSend(*v22, "userInterfaceLayoutDirection");
      -[SBSwitcherModifier containerViewBounds](self, "containerViewBounds");
      -[SBSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](self, "frameForLayoutRole:inAppLayout:withBounds:", v23, v8);
      SBTransformedRectWithScale();
      v11 = v26;
      if ((v21 & 1) != 0)
      {
        v12 = v25;
      }
      else
      {
        if (v24 == 1)
          v27 = 1;
        else
          v27 = 2;
        -[SBSwitcherModifier containerViewBounds](self, "containerViewBounds");
        -[SBSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](self, "frameForLayoutRole:inAppLayout:withBounds:", v27, v8);
        SBTransformedRectWithScale();
        v29 = v28;
        v12 = v30;
        -[SBSwitcherModifier separatorViewWidth](self, "separatorViewWidth");
        v10 = v10 + v11 + v31 * v14;
        v11 = v29;
      }
    }
  }

  v32 = v10;
  v33 = v9;
  v34 = v11;
  v35 = v12;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (id)appLayoutsToCacheSnapshotsWithVisibleRange:(_NSRange)a3 numberOfSnapshotsToCache:(unint64_t)a4 biasForward:(BOOL)a5
{
  _BOOL4 v5;
  NSUInteger length;
  NSUInteger location;
  void *v9;
  NSUInteger v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  NSUInteger v15;
  BOOL v16;
  NSUInteger v17;
  NSRange v18;
  NSRange v19;
  NSRange v20;
  NSRange v21;
  NSUInteger v22;
  void *v23;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  _BOOL4 v56;
  NSUInteger v57;
  NSUInteger v58;
  NSUInteger v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;
  NSRange v66;
  NSRange v67;

  v5 = a5;
  v56 = a5;
  length = a3.length;
  location = a3.location;
  v65 = *MEMORY[0x1E0C80C00];
  -[SBSwitcherModifier appLayouts](self, "appLayouts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v11 = a4 - length;
  if (a4 < length)
    v11 = 0;
  v12 = (double)v11 * 0.5;
  v13 = ceil(v12);
  v14 = floor(v12);
  if (!v5)
    v14 = v13;
  v15 = (unint64_t)v14;
  v16 = v11 >= (unint64_t)v14;
  v17 = v11 - (unint64_t)v14;
  if (v16)
    v18.length = v17;
  else
    v18.length = 0;
  v18.location = location + length;
  v66.location = 0;
  v66.length = v10;
  v19 = NSIntersectionRange(v18, v66);
  if (location >= v15)
    v20.location = location - v15;
  else
    v20.location = 0;
  v20.length = v15;
  v67.location = 0;
  v67.length = v10;
  v21 = NSIntersectionRange(v20, v67);
  v22 = v19.location + v19.length;
  v23 = v9;
  if (v19.location + v19.length <= location + length)
    v22 = location + length;
  v59 = v22;
  v16 = v10 >= v22;
  v24 = v10 - v22;
  if (v16)
    v25 = v24;
  else
    v25 = 0;
  if (v21.location >= location)
    v26 = location;
  else
    v26 = v21.location;
  v57 = v26;
  v58 = v25;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subarrayWithRange:", location, length);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v56)
  {
    objc_msgSend(v27, "addObjectsFromArray:", v28);

    objc_msgSend(v9, "subarrayWithRange:", v19.location, v19.length);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObjectsFromArray:", v30);

    objc_msgSend(v9, "subarrayWithRange:", v21.location, v21.length);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "reverseObjectEnumerator");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "allObjects");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObjectsFromArray:", v33);

    objc_msgSend(v23, "subarrayWithRange:", v59, v58);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObjectsFromArray:", v34);

    objc_msgSend(v23, "subarrayWithRange:", 0, v57);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "reverseObjectEnumerator");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "allObjects");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObjectsFromArray:", v37);

  }
  else
  {
    objc_msgSend(v28, "reverseObjectEnumerator");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "allObjects");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObjectsFromArray:", v39);

    objc_msgSend(v23, "subarrayWithRange:", v21.location, v21.length);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "reverseObjectEnumerator");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "allObjects");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObjectsFromArray:", v42);

    objc_msgSend(v23, "subarrayWithRange:", v19.location, v19.length);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObjectsFromArray:", v43);

    objc_msgSend(v23, "subarrayWithRange:", 0, v57);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "reverseObjectEnumerator");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "allObjects");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObjectsFromArray:", v46);

    objc_msgSend(v23, "subarrayWithRange:", v59, v58);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObjectsFromArray:", v35);
  }
  v47 = v23;

  v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v49 = v27;
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v61;
LABEL_24:
    v53 = 0;
    while (1)
    {
      if (*(_QWORD *)v61 != v52)
        objc_enumerationMutation(v49);
      v54 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v53);
      if (objc_msgSend(v48, "count") >= a4)
        break;
      if (!objc_msgSend(v54, "type"))
        objc_msgSend(v48, "addObject:", v54);
      if (v51 == ++v53)
      {
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
        if (v51)
          goto LABEL_24;
        break;
      }
    }
  }

  return v48;
}

- (unint64_t)indexOfFirstMainAppLayoutFromAppLayouts:(id)a3
{
  id v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __87__SBSwitcherModifier_SharedModifierUtilities__indexOfFirstMainAppLayoutFromAppLayouts___block_invoke;
  v6[3] = &unk_1E8EA5FF0;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __87__SBSwitcherModifier_SharedModifierUtilities__indexOfFirstMainAppLayoutFromAppLayouts___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "environment");
  if (result == 1)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (unint64_t)indexOfFirstFloatingAppFromAppLayouts:(id)a3
{
  id v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__SBSwitcherModifier_SharedModifierUtilities__indexOfFirstFloatingAppFromAppLayouts___block_invoke;
  v6[3] = &unk_1E8EA5FF0;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __85__SBSwitcherModifier_SharedModifierUtilities__indexOfFirstFloatingAppFromAppLayouts___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "environment");
  if (result == 2)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  else
    *a4 = 1;
  return result;
}

- (void)performWithTemporarilyInsertedAppLayout:(id)a3 atIndex:(unint64_t)a4 block:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  SBOverrideAppLayoutsSwitcherModifier *v12;
  void *v13;
  id v14;

  v14 = a3;
  v9 = a5;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherModifierUtilities.m"), 212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout"));

  }
  -[SBSwitcherModifier appLayouts](self, "appLayouts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "insertObject:atIndex:", v14, a4);
  v12 = -[SBOverrideAppLayoutsSwitcherModifier initWithAppLayouts:]([SBOverrideAppLayoutsSwitcherModifier alloc], "initWithAppLayouts:", v11);
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v12, v9);

}

- (id)autoLayoutSpaceForAppLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v4 = a3;
  -[SBSwitcherModifier displayItemLayoutAttributesCalculator](self, "displayItemLayoutAttributesCalculator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SBSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
  -[SBSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherModifier floatingDockHeight](self, "floatingDockHeight");
  v10 = v9;
  -[SBSwitcherModifier screenScale](self, "screenScale");
  v12 = v11;
  -[SBSwitcherModifier containerViewBounds](self, "containerViewBounds");
  objc_msgSend(v5, "autoLayoutSpaceForAppLayout:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:", v6, v7, v8, -[SBSwitcherModifier prefersStripHidden](self, "prefersStripHidden"), -[SBSwitcherModifier prefersDockHidden](self, "prefersDockHidden"), v10, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)appLayoutContainsFullScreenDisplayItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(v4, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 1)
  {
    -[SBSwitcherModifier appLayouts](self, "appLayouts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "indexOfObject:", v4);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[SBSwitcherModifier containerViewBounds](self, "containerViewBounds");
    }
    else
    {
      v10 = v8;
      -[SBSwitcherModifier frameForIndex:](self, "frameForIndex:", v8);
      -[SBSwitcherModifier scaleForIndex:](self, "scaleForIndex:", v10);
    }
    SBRectWithSize();
    -[SBSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](self, "frameForLayoutRole:inAppLayout:withBounds:", 1, v4);
    -[SBSwitcherModifier scaleForLayoutRole:inAppLayout:](self, "scaleForLayoutRole:inAppLayout:", 1, v4);
    -[SBSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v9 = BSSizeEqualToSize();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (CGRect)frameForContinuousExposePeekingDisplayItem:(id)a3 inAppLayout:(id)a4 bounds:(CGRect)a5 defaultFrameForLayoutRole:(CGRect)a6
{
  double width;
  CGFloat y;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  CGFloat v21;
  uint64_t v22;
  SBDisplayItemLayoutAttributes *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  int v50;
  int v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  uint64_t v62;
  void *v63;
  CGFloat height;
  CGRect result;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  v10 = a3;
  v11 = a4;
  -[SBSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v11, "itemForLayoutRole:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = height;
  }
  else
  {
    +[SBDisplayItem displayItemWithType:bundleIdentifier:uniqueIdentifier:](SBDisplayItem, "displayItemWithType:bundleIdentifier:uniqueIdentifier:", 0, CFSTR("com.apple.springboard.PeekPlacholderItem"), CFSTR("com.apple.springboard.PeekPlacholderItem.1"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc_init(SBDisplayItemLayoutAttributes);
    v63 = (void *)v22;
    objc_msgSend(v11, "appLayoutByInsertingItem:withLayoutAttributes:inLayoutRole:", v22, v23, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBSwitcherModifier displayItemLayoutAttributesCalculator](self, "displayItemLayoutAttributesCalculator");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "layoutRoleForItem:", v10);
    v27 = -[SBSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
    -[SBSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherModifier floatingDockHeight](self, "floatingDockHeight");
    v29 = v15;
    v31 = v30;
    -[SBSwitcherModifier screenScale](self, "screenScale");
    v33 = v32;
    v34 = -[SBSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled");
    v35 = -[SBSwitcherModifier prefersStripHidden](self, "prefersStripHidden");
    LOBYTE(v62) = -[SBSwitcherModifier prefersDockHidden](self, "prefersDockHidden");
    objc_msgSend(v25, "frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:", v26, v24, v27, v28, v34, v35, v13, v29, v17, v19, v31, v33, v62);
    width = v36;
    v21 = v37;

    if (SBRectEqualsRect())
    {
      UIRectCenteredYInRect();
      y = v38;
      width = v39;
      v21 = v40;
    }

  }
  -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", v11);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "zOrderedItems");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "firstObject");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "autoLayoutItemForDisplayItem:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "position");
  v46 = v45;
  objc_msgSend(v41, "configuration");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "containerBounds");
  UIRectGetCenter();
  v49 = v48;

  v50 = objc_msgSend(v43, "isEqual:", v10);
  if (v46 >= v49)
    v51 = v50 ^ 1;
  else
    v51 = v50;
  -[SBSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "screenEdgePadding");
  v54 = v53 + v53;

  objc_msgSend(v41, "boundingBox");
  v56 = v13 + v17 - v54;
  if (v51)
    v56 = v13 - width + v54;
  v57 = v56 - v55;

  v58 = v57;
  v59 = y;
  v60 = width;
  v61 = v21;
  result.size.height = v61;
  result.size.width = v60;
  result.origin.y = v59;
  result.origin.x = v58;
  return result;
}

- (BOOL)shouldZoomToSystemApertureForEvent:(id)a3 activeLayout:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  if ((-[SBSwitcherModifier isReduceMotionEnabled](self, "isReduceMotionEnabled") & 1) != 0
    || !-[SBSwitcherModifier isJindoEnabled](self, "isJindoEnabled"))
  {
    v10 = 0;
  }
  else
  {
    v8 = objc_msgSend(v6, "fromEnvironmentMode");
    v9 = objc_msgSend(v6, "toEnvironmentMode");
    v10 = 0;
    if ((v8 & 0xFFFFFFFFFFFFFFFELL) == 2 && v9 == 1)
    {
      objc_msgSend(v7, "itemForLayoutRole:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[SBSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation") == 1;
      objc_msgSend(v11, "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SBSwitcherModifier isSystemApertureTransitionTargetForSceneIdentifier:bundleIdentifier:isPortrait:](self, "isSystemApertureTransitionTargetForSceneIdentifier:bundleIdentifier:isPortrait:", v13, v14, v12);

    }
  }

  return v10;
}

- (BOOL)isAssistantEffectivelyPresentedForSAETypeToSiri
{
  int v3;
  BOOL v4;
  uint64_t v5;
  char v6;
  BOOL v7;

  v3 = -[SBSwitcherModifier isSystemAssistantExperienceEnabled](self, "isSystemAssistantExperienceEnabled");
  v4 = -[SBSwitcherModifier assistantPresentationState](self, "assistantPresentationState") != 2
    && -[SBSwitcherModifier assistantPresentationState](self, "assistantPresentationState") != 3;
  v5 = -[SBSwitcherModifier assistantModality](self, "assistantModality");
  v6 = -[SBSwitcherModifier isAssistantKeyboardVisible](self, "isAssistantKeyboardVisible");
  if (v5 == 2)
    v7 = v6;
  else
    v7 = 0;
  if (v4)
    v7 = 0;
  return v3 && v7;
}

+ (id)contextProtocol
{
  return &unk_1EFC6A238;
}

+ (id)queryProtocol
{
  return &unk_1EFC69018;
}

+ (id)newEventResponse
{
  return objc_alloc_init(SBSwitcherModifierEventResponse);
}

- (id)stackDescription
{
  return -[SBSwitcherModifier stackDescriptionWithPrefix:](self, "stackDescriptionWithPrefix:", &stru_1E8EC7EC0);
}

- (id)stackDescriptionWithPrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[SBSwitcherModifier displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  objc_msgSend(v4, "stringByAppendingString:", CFSTR("    "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__SBSwitcherModifier_stackDescriptionWithPrefix___block_invoke;
  v14[3] = &unk_1E8EBBFE8;
  v15 = v5;
  v16 = v9;
  v10 = v9;
  v11 = v5;
  -[SBChainableModifier enumerateChildModifiersWithBlock:](self, "enumerateChildModifiersWithBlock:", v14);
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __49__SBSwitcherModifier_stackDescriptionWithPrefix___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "stackDescriptionWithPrefix:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)displayName
{
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = objc_msgSend(&unk_1E91CEFC8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(&unk_1E91CEFC8);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v3, "hasPrefix:", v9))
        {
          v10 = objc_msgSend(v9, "length");
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(&unk_1E91CEFC8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = objc_msgSend(&unk_1E91CEFE0, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    while (2)
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(&unk_1E91CEFE0);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
        if (objc_msgSend(v3, "hasSuffix:", v15))
        {
          v16 = objc_msgSend(v3, "length");
          v4 = v16 - objc_msgSend(v15, "length");
          goto LABEL_21;
        }
      }
      v12 = objc_msgSend(&unk_1E91CEFE0, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_21:
  objc_msgSend(v3, "substringWithRange:", v10, v4 - v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)handleInitialSetupEvent:(id)a3
{
  return 0;
}

- (id)handleGestureEvent:(id)a3
{
  return 0;
}

- (id)handleReduceMotionChangedEvent:(id)a3
{
  return 0;
}

- (id)handleSwitcherSettingsChangedEvent:(id)a3
{
  return 0;
}

- (id)handleHomeGestureSettingsChangedEvent:(id)a3
{
  return 0;
}

- (id)handleMedusaSettingsChangedEvent:(id)a3
{
  return 0;
}

- (id)handleHomeGrabberSettingsChangedEvent:(id)a3
{
  return 0;
}

- (id)handleSwipeToKillEvent:(id)a3
{
  return 0;
}

- (id)handleHighlightEvent:(id)a3
{
  return 0;
}

- (id)handleInsertionEvent:(id)a3
{
  return 0;
}

- (id)handleRemovalEvent:(id)a3
{
  return 0;
}

- (id)handleTapOutsideToDismissEvent:(id)a3
{
  return 0;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  return 0;
}

- (id)handleTapSlideOverTongueEvent:(id)a3
{
  return 0;
}

- (id)handleScrollEvent:(id)a3
{
  return 0;
}

- (id)handleUpdateFocusedAppLayoutEvent:(id)a3
{
  return 0;
}

- (id)handleResizeProgressEvent:(id)a3
{
  return 0;
}

- (id)handleBlurProgressEvent:(id)a3
{
  return 0;
}

- (id)handleRepositionProgressEvent:(id)a3
{
  return 0;
}

- (id)handleSwitcherDropEvent:(id)a3
{
  return 0;
}

- (id)handleSlideOverEdgeProtectTongueEvent:(id)a3
{
  return 0;
}

- (id)handleHideMorphToPIPAppLayoutEvent:(id)a3
{
  return 0;
}

- (id)handleAnimatablePropertyChangedEvent:(id)a3
{
  return 0;
}

- (id)handleShelfFocusedDisplayItemsChangedEvent:(id)a3
{
  return 0;
}

- (id)handlePrepareForSceneUpdateEvent:(id)a3
{
  return 0;
}

- (id)handleHoverEvent:(id)a3
{
  return 0;
}

- (id)handleUpdateWindowingModeEvent:(id)a3
{
  return 0;
}

- (id)handleContinuousExposeIdentifiersChangedEvent:(id)a3
{
  return 0;
}

- (id)handleContinuousExposeStripEdgeProtectTongueEvent:(id)a3
{
  return 0;
}

- (id)handleTapAppLayoutHeaderEvent:(id)a3
{
  return 0;
}

- (id)handlePointerCrossedDisplayBoundaryEvent:(id)a3
{
  return 0;
}

- (id)handleAssistantPresentationChangedEvent:(id)a3
{
  return 0;
}

- (id)handleHardwareButtonDropletAnimationEvent:(id)a3
{
  return 0;
}

@end
