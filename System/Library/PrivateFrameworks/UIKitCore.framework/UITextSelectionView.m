@implementation UITextSelectionView

- (UITextSelectionView)initWithInteractionAssistant:(id)a3
{
  id v4;
  UITextSelectionView *v5;
  UITextSelectionView *v6;
  UITextSelectionView *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITextSelectionView;
  v5 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    v5->_viewDidStopNotification = -1;
    v5->_viewDidCommitNotification = -1;
    -[UITextSelectionView validateWithInteractionAssistant:](v5, "validateWithInteractionAssistant:", v4);
    -[UIView _setDisableDictationTouchCancellation:](v6, "_setDisableDictationTouchCancellation:", 1);
    v7 = v6;
  }

  return v6;
}

- (void)_unregisterForNotifications
{
  id v2;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("UITextInputCurrentInputModeDidChangeNotification"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("UIKeyboardDidHideNotification"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("UIKeyboardWillHideNotification"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("UIKeyboardDidShowNotification"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("UIKeyboardWillShowNotification"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("UIKeyboardDidChangeFrameNotification"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("UIKeyboardWillChangeFrameNotification"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("_UIWindowDidBecomeApplicationKeyNotification"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("_UIWindowDidResignApplicationKeyNotification"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("UIWindowDidRotateNotification"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("UIWindowWillRotateNotification"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("UITextSelectionDidTranslateForReachability"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("UITextSelectionWillTranslateForReachability"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("UITextSelectionDidInteractiveMove"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("UITextSelectionWillInteractiveMove"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("UITextSelectionDidZoom"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("UITextSelectionWillZoom"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("UITextSelectionDidScroll"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("UITextSelectionWillScroll"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("UITextSelectionViewActivatedNotification"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("UITextEffectsWindowOffsetDidChangeNotification"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("_UIAlertWillAppearNotification"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("_UIAlertDidDisappearNotification"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("_UIApplicationWillAddDeactivationReasonNotification"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("UIApplicationWillResignActiveNotification"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, 0x1E1712780, 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, 0x1E17127A0, 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("_UISheetWillAppearNotification"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, CFSTR("_UISheetDidDisappearNotification"), 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, 0x1E170FCA0, 0);
    objc_msgSend(v2, "removeObserver:name:object:", a1, 0x1E170FCC0, 0);

  }
}

- (void)validateWithInteractionAssistant:(id)a3
{
  __CFRunLoop *Current;
  id v5;

  objc_storeWeak((id *)&self->m_interactionAssistant, a3);
  if (self->m_observer)
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveObserver(Current, self->m_observer, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRelease(self->m_observer);
    self->m_observer = 0;
  }
  self->m_deferSelectionCommands = 0;
  -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  -[UITextSelectionView setVisible:](self, "setVisible:", 1);
  -[UITextSelectionView setCaretBlinks:](self, "setCaretBlinks:", 1);
  -[UITextSelectionView setCaretVisible:](self, "setCaretVisible:", 1);
  -[UIView setClipsToBounds:](self, "setClipsToBounds:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextSelectionView _unregisterForNotifications]((uint64_t)self);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_didSuspend_, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_willResume_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_updateSelectionDots, CFSTR("UITextEffectsWindowOffsetDidChangeNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_textSelectionViewActivated_, CFSTR("UITextSelectionViewActivatedNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_selectionWillScroll_, CFSTR("UITextSelectionWillScroll"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_selectionDidScroll_, CFSTR("UITextSelectionDidScroll"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_scaleWillChange_, CFSTR("UITextSelectionWillZoom"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_scaleDidChange_, CFSTR("UITextSelectionDidZoom"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_inputViewWillAnimate, CFSTR("UITextSelectionWillInteractiveMove"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_inputViewDidAnimate, CFSTR("UITextSelectionDidInteractiveMove"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_selectionWillTranslateForReachability_, CFSTR("UITextSelectionWillTranslateForReachability"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_selectionDidTranslateForReachability_, CFSTR("UITextSelectionDidTranslateForReachability"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_willRotate_, CFSTR("UIWindowWillRotateNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_didRotate_, CFSTR("UIWindowDidRotateNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_windowDidResignOrBecomeKey, CFSTR("_UIWindowDidResignApplicationKeyNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_windowDidResignOrBecomeKey, CFSTR("_UIWindowDidBecomeApplicationKeyNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_inputViewWillMove_, CFSTR("UIKeyboardWillChangeFrameNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_inputViewDidMove, CFSTR("UIKeyboardDidChangeFrameNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_inputViewWillAnimate, CFSTR("UIKeyboardWillShowNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_inputViewDidAnimate, CFSTR("UIKeyboardDidShowNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_inputViewWillAnimate, CFSTR("UIKeyboardWillHideNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_inputViewDidAnimate, CFSTR("UIKeyboardDidHideNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_inputModeDidChange_, CFSTR("UITextInputCurrentInputModeDidChangeNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_mustFlattenForAlert_, CFSTR("_UIAlertWillAppearNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_canExpandAfterAlert_, CFSTR("_UIAlertDidDisappearNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_saveDeactivationReason_, CFSTR("_UIApplicationWillAddDeactivationReasonNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_mustFlattenForResignActive_, CFSTR("UIApplicationWillResignActiveNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_canExpandAfterBecomeActive_, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_mustFlattenForNavigationTransition_, 0x1E1712780, 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_canExpandAfterNavigationTransition_, 0x1E17127A0, 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_mustFlattenForSheet_, CFSTR("_UISheetWillAppearNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_canExpandAfterSheet_, CFSTR("_UISheetDidDisappearNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_mustFlattenForPopover_, 0x1E170FCA0, 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_canExpandAfterPopover_, 0x1E170FCC0, 0);

}

- (void)invalidate
{
  __CFRunLoop *Current;
  UITextSelection *m_selection;
  NSArray *m_replacements;

  if (self->m_observer)
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveObserver(Current, self->m_observer, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRelease(self->m_observer);
    self->m_observer = 0;
  }
  -[UITextSelectionView _unregisterForNotifications]((uint64_t)self);
  -[UITextSelectionView _unregisterForViewAnimationNotificationsIfNecessary](self, "_unregisterForViewAnimationNotificationsIfNecessary");
  -[UITextSelectionView deactivate](self, "deactivate");
  -[UITextSelection invalidate](self->m_selection, "invalidate");
  m_selection = self->m_selection;
  self->m_selection = 0;

  m_replacements = self->m_replacements;
  self->m_replacements = 0;

  objc_storeWeak((id *)&self->m_interactionAssistant, 0);
}

- (BOOL)isValid
{
  id WeakRetained;
  BOOL m_activated;

  WeakRetained = objc_loadWeakRetained((id *)&self->m_interactionAssistant);
  if (WeakRetained)
    m_activated = self->m_activated;
  else
    m_activated = 0;

  return m_activated;
}

- (void)dealloc
{
  objc_super v3;

  -[UITextSelectionView invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)UITextSelectionView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)activate
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containerAllowsSelection");

  if (v4)
  {
    -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containerAllowsSelectionTintOnly");

    if (v6)
      -[UITextSelectionView configureForHighlightMode](self, "configureForHighlightMode");
    self->m_activated = 1;
    -[UITextSelectionView _updateViewAnimateNotificationObservationIfNecessary](self, "_updateViewAnimateNotificationObservationIfNecessary");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("UITextSelectionViewActivatedNotification"), self);
    -[UITextSelectionView selection](self, "selection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectionChanged");
    -[UITextSelectionView appearOrFadeIfNecessary](self, "appearOrFadeIfNecessary");
    -[UITextSelectionView deferredUpdateSelectionRects](self, "deferredUpdateSelectionRects");

  }
}

- (void)deactivate
{
  -[UITextSelectionView deactivateAndCollapseSelection:](self, "deactivateAndCollapseSelection:", 0);
}

- (void)deactivateAndCollapseSelection:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  v3 = a3;
  self->m_activated = 0;
  -[UITextSelectionView _updateViewAnimateNotificationObservationIfNecessary](self, "_updateViewAnimateNotificationObservationIfNecessary");
  if (v3)
  {
    -[UITextSelectionView selection](self, "selection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collapseSelection");

    -[UITextSelectionView selection](self, "selection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "commit");

  }
  -[UITextSelectionView removeFromSuperview](self, "removeFromSuperview");
}

- (void)windowDidResignOrBecomeKey
{
  if (self->m_activated)
    -[UITextSelectionView appearOrFadeIfNecessary](self, "appearOrFadeIfNecessary");
}

- (void)inputModeDidChange:(id)a3
{
  if (-[UITextSelectionView selectionCommandsShowing](self, "selectionCommandsShowing", a3))
    -[UITextSelectionView deferredUpdateSelectionCommands](self, "deferredUpdateSelectionCommands");
}

- (void)viewAnimate:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;

  v20 = a3;
  -[UIView superview](self->m_rangeView, "superview");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v20, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", 0x1E16F0BE0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
        {
          v11 = 0;
          goto LABEL_17;
        }
        objc_msgSend(v9, "view");
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = v10;
      if (v10)
      {
        -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "textInputView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "containsView:", v14) & 1) == 0)
        {

LABEL_16:
          goto LABEL_17;
        }
        objc_msgSend(v11, "_layer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "animationKeys");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v20, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", 0x1E178A7C0);

          -[UITextSelectionView rangeView](self, "rangeView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v19;
          if (v18)
            objc_msgSend(v19, "startAnimating");
          else
            objc_msgSend(v19, "performSelector:withObject:afterDelay:", sel_stopAnimating, 0, 0.1);
          goto LABEL_16;
        }
      }
LABEL_17:

    }
  }

}

- (void)_updateViewAnimateNotificationObservationIfNecessary
{
  void *v3;

  if (self->m_activated
    && -[UITextSelectionView visible](self, "visible")
    && (-[UIView superview](self, "superview"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    -[UITextSelectionView _registerForViewAnimationNotificationsIfNecessary](self, "_registerForViewAnimationNotificationsIfNecessary");
  }
  else
  {
    -[UITextSelectionView _unregisterForViewAnimationNotificationsIfNecessary](self, "_unregisterForViewAnimationNotificationsIfNecessary");
  }
}

- (void)_registerForViewAnimationNotificationsIfNecessary
{
  void *v3;
  id v4;
  id v5;

  +[NSNotificationCenter uikitInternalCenter]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_viewDidStopNotification == -1)
  {
    v4 = v3;
    self->_viewDidStopNotification = objc_msgSend(v3, "_addObserver:selector:name:object:options:", self, sel_viewAnimate_, 0x1E178A7E0, 0, 1024);
    v3 = v4;
  }
  if (self->_viewDidCommitNotification == -1)
  {
    v5 = v3;
    self->_viewDidCommitNotification = objc_msgSend(v3, "_addObserver:selector:name:object:options:", self, sel_viewAnimate_, 0x1E178A7C0, 0, 1024);
    v3 = v5;
  }

}

- (void)_unregisterForViewAnimationNotificationsIfNecessary
{
  void *v3;
  id v4;

  +[NSNotificationCenter uikitInternalCenter]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_viewDidStopNotification != -1)
  {
    objc_msgSend(v3, "_removeObserver:");
    v3 = v4;
    self->_viewDidStopNotification = -1;
  }
  if (self->_viewDidCommitNotification != -1)
  {
    objc_msgSend(v4, "_removeObserver:");
    v3 = v4;
    self->_viewDidCommitNotification = -1;
  }

}

- (void)selectionWillScroll:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[UITextSelectionView visible](self, "visible"))
  {
    -[UIView superview](self, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if (-[UITextSelectionView affectedByScrollerNotification:](self, "affectedByScrollerNotification:", v11))
      {
        v5 = self->m_wasShowingCommands
          || -[UITextSelectionView selectionCommandsShowing](self, "selectionCommandsShowing");
        self->m_wasShowingCommands = v5;
        -[UITextSelectionView hideSelectionCommands](self, "hideSelectionCommands");
        -[UITextSelectionView selection](self, "selection");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "selectedRange");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "_isRanged");

        if (v8)
        {
          -[UITextSelectionView rangeView](self, "rangeView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "willScroll");

        }
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "hideDictationMenuIfNeeded:", 0);

      }
    }
  }

}

- (void)selectionDidScroll:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (-[UITextSelectionView visible](self, "visible"))
  {
    -[UIView superview](self, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if (-[UITextSelectionView affectedByScrollerNotification:](self, "affectedByScrollerNotification:", v14))
      {
        -[UITextSelectionView selection](self, "selection");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "selectedRange");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "_isRanged");

        v8 = -[UITextSelectionView selectionCommandsShowing](self, "selectionCommandsShowing");
        if (v7)
        {
          if (v8)
          {
            -[UITextSelectionView menuInteraction](self, "menuInteraction");
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            if (v9)
            {
              -[UITextSelectionView menuInteraction](self, "menuInteraction");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "updateVisibleMenuPosition");

            }
            else
            {
              -[UITextSelectionView hideSelectionCommands](self, "hideSelectionCommands");
              self->m_wasShowingCommands = 1;
            }
          }
          if (self->m_wasShowingCommands)
            -[UITextSelectionView showCalloutBarAfterDelay:](self, "showCalloutBarAfterDelay:", 0.1);
          -[UITextSelectionView rangeView](self, "rangeView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "didScroll");
        }
        else
        {
          if (!v8)
            goto LABEL_16;
          -[UITextSelectionView menuInteraction](self, "menuInteraction");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
            goto LABEL_16;
          -[UITextSelectionView menuInteraction](self, "menuInteraction");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "updateVisibleMenuPosition");
        }

LABEL_16:
        self->m_wasShowingCommands = 0;
        -[UITextSelectionView deferredUpdateSelectionRects](self, "deferredUpdateSelectionRects");
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "showDictationMenuIfNeeded");

      }
    }
  }

}

- (BOOL)affectedByScrollerNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textInputView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textInputView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v4, "containsView:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)inputViewWillChange
{
  int m_showingCommandsCounter;
  BOOL v4;
  void *v5;
  id v6;

  m_showingCommandsCounter = self->m_showingCommandsCounter;
  self->m_showingCommandsCounter = m_showingCommandsCounter + 1;
  if (!m_showingCommandsCounter)
  {
    v4 = self->m_delayShowingCommands
      || -[UITextSelectionView selectionCommandsShowing](self, "selectionCommandsShowing");
    self->m_wasShowingCommands = v4;
    -[UITextSelectionView cancelDelayedCommandRequests](self, "cancelDelayedCommandRequests");
    -[UITextSelectionView hideSelectionCommandsAfterDelay:reason:](self, "hideSelectionCommandsAfterDelay:reason:", 1, 0.1);
    -[UITextSelectionView rangeView](self, "rangeView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputViewWillChange");

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hideDictationMenuIfNeeded:", 1);

  }
}

- (void)inputViewDidChange
{
  int v2;
  void *v4;
  id v5;

  v2 = self->m_showingCommandsCounter - 1;
  self->m_showingCommandsCounter = v2;
  if (!v2)
  {
    if (self->m_wasShowingCommands)
      -[UITextSelectionView showCalloutBarAfterDelay:](self, "showCalloutBarAfterDelay:", 0.1);
    self->m_wasShowingCommands = 0;
    -[UITextSelectionView rangeView](self, "rangeView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputViewDidChange");

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "showDictationMenuIfNeeded");

  }
}

- (void)inputViewWillMove:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  id v24;
  CGRect v25;
  CGRect v26;

  v24 = a3;
  if (self->m_activated)
  {
    if (-[UITextSelectionView shouldBeVisible](self, "shouldBeVisible"))
    {
      objc_msgSend(v24, "userInfo");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("UIKeyboardFrameBeginUserInfoKey"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "CGRectValue");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;

      objc_msgSend(v24, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", CFSTR("UIKeyboardFrameEndUserInfoKey"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "CGRectValue");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;

      v25.origin.x = v7;
      v25.origin.y = v9;
      v25.size.width = v11;
      v25.size.height = v13;
      v26.origin.x = v17;
      v26.origin.y = v19;
      v26.size.width = v21;
      v26.size.height = v23;
      if (!CGRectEqualToRect(v25, v26))
        -[UITextSelectionView inputViewWillChange](self, "inputViewWillChange");
    }
  }

}

- (void)inputViewDidMove
{
  if (self->m_showingCommandsCounter)
    -[UITextSelectionView inputViewDidChange](self, "inputViewDidChange");
}

- (void)inputViewWillAnimate
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  _BOOL4 v6;
  void *v7;

  -[UIView keyboardSceneDelegate](self, "keyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->m_activated)
  {
    v7 = v3;
    v4 = -[UITextSelectionView shouldBeVisible](self, "shouldBeVisible");
    v3 = v7;
    if (v4)
    {
      objc_msgSend(v7, "containerView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[UIView isDescendantOfView:](self, "isDescendantOfView:", v5);

      v3 = v7;
      if (v6)
      {
        -[UITextSelectionView inputViewWillChange](self, "inputViewWillChange");
        v3 = v7;
      }
    }
  }

}

- (void)inputViewDidAnimate
{
  void *v3;
  int v4;
  void *v5;
  _BOOL4 v6;
  id v7;

  -[UIView keyboardSceneDelegate](self, "keyboardSceneDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isOnScreen"))
  {
    if (!self->m_activated)
    {
      -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "externalTextInput");

      if (v4)
        -[UITextSelectionView activate](self, "activate");
    }
  }
  if (self->m_showingCommandsCounter)
  {
    objc_msgSend(v7, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UIView isDescendantOfView:](self, "isDescendantOfView:", v5);

    if (v6)
      -[UITextSelectionView inputViewDidChange](self, "inputViewDidChange");
  }

}

- (void)selectionWillTranslateForReachability:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;

  v4 = a3;
  if (self->m_activated)
  {
    v6 = v4;
    v5 = -[UITextSelectionView shouldBeVisible](self, "shouldBeVisible");
    v4 = v6;
    if (v5)
    {
      -[UITextSelectionView inputViewWillChange](self, "inputViewWillChange");
      v4 = v6;
    }
  }

}

- (void)selectionDidTranslateForReachability:(id)a3
{
  if (self->m_showingCommandsCounter)
    -[UITextSelectionView inputViewDidChange](self, "inputViewDidChange", a3);
}

- (void)textSelectionViewActivated:(id)a3
{
  UITextSelectionView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UITextSelectionView *v13;

  objc_msgSend(a3, "object");
  v4 = (UITextSelectionView *)objc_claimAutoreleasedReturnValue();
  if (v4 != self)
  {
    v13 = v4;
    -[UITextSelectionView interactionAssistant](v4, "interactionAssistant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textInputView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textInputView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v13;
    if (v8 == v12)
    {
      -[UITextSelectionView deactivateAndCollapseSelection:](self, "deactivateAndCollapseSelection:", 1);
      v4 = v13;
    }
  }

}

- (void)willMoveToWindow:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITextSelectionView;
  -[UIView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (!a3)
  {
    if (-[UITextSelectionView _editMenuIsVisible](self, "_editMenuIsVisible"))
      -[UITextSelectionView hideSelectionCommands](self, "hideSelectionCommands");
  }
}

- (void)removeFromSuperview
{
  void *v3;
  UIView *m_floatingCaretView;
  UIView *m_caretView;
  UITextRangeView *m_rangeView;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[UITextSelectionView hideSelectionCommands](self, "hideSelectionCommands");
  -[UITextSelectionView detach](self, "detach");
  -[UIView removeFromSuperview](self->m_floatingCaretView, "removeFromSuperview");
  m_floatingCaretView = self->m_floatingCaretView;
  self->m_floatingCaretView = 0;

  m_caretView = self->m_caretView;
  if (m_caretView)
  {
    -[UITextSelectionView clearCaret](self, "clearCaret");
    m_caretView = self->m_caretView;
  }
  self->m_caretView = 0;

  m_rangeView = self->m_rangeView;
  if (m_rangeView)
  {
    -[UITextSelectionView clearRangeAnimated:](self, "clearRangeAnimated:", 0);
    m_rangeView = self->m_rangeView;
  }
  self->m_rangeView = 0;

  if ((*(_QWORD *)&self->super._viewFlags & 0x1000) == 0)
  {
    -[UIView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "animationKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      -[UIView layer](self, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeAllAnimations");

    }
  }
  -[UITextSelectionView _updateViewAnimateNotificationObservationIfNecessary](self, "_updateViewAnimateNotificationObservationIfNecessary");
  v11.receiver = self;
  v11.super_class = (Class)UITextSelectionView;
  -[UIView removeFromSuperview](&v11, sel_removeFromSuperview);
}

- (void)clearRangeAnimated:(BOOL)a3
{
  -[UITextRangeView clearRangeAnimated:](self->m_rangeView, "clearRangeAnimated:", a3);
}

- (BOOL)_viewUsesAsynchronousProtocol
{
  void *v2;
  char v3;

  -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "viewConformsToAsynchronousInteractionProtocol");

  return v3;
}

- (BOOL)isInstalledInSelectionContainerView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "textInputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "selectionContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_customSelectionContainerView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "textInputView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "selectionContainerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[UITextSelectionView _viewUsesAsynchronousProtocol](self, "_viewUsesAsynchronousProtocol"))
  {
    objc_msgSend(v5, "unscaledView");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  return v6;
}

- (BOOL)_activeAndVisible
{
  double v3;
  void *v4;
  char v5;

  if (!self->m_activated)
    return 0;
  -[UIView alpha](self, "alpha");
  if (v3 <= 0.0)
    return 0;
  -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containerAllowsSelection");

  return v5;
}

- (void)installIfNecessary
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  if (-[UITextSelectionView _activeAndVisible](self, "_activeAndVisible"))
  {
    -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "textInputView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSelectionView _customSelectionContainerView](self, "_customSelectionContainerView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5)
      v5 = v4;
    -[UIView superview](self, "superview");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 != v5)
      objc_msgSend(v5, "addSubview:", self);

  }
}

- (id)_actingParentViewForGestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;

  -[UITextSelectionView _customSelectionContainerView](self, "_customSelectionContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)selectionChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;

  -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textInputView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (-[UITextRangeView mode](self->m_rangeView, "mode") == 2)
    {
      -[UITextSelectionView updateRangeViewForSelectionMode](self, "updateRangeViewForSelectionMode");
    }
    else if (-[UITextRangeView mode](self->m_rangeView, "mode") == 1)
    {
      -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "containerAllowsSelectionTintOnly"))
      {

      }
      else
      {
        -[UITextSelectionView selection](self, "selection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isRangedSelectionSpanningDocument");

        if ((v9 & 1) == 0)
          -[UITextRangeView setMode:](self->m_rangeView, "setMode:", 0);
      }
    }
    -[UITextSelectionView selection](self, "selection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectionChanged");

    -[UITextSelectionView selection](self, "selection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isCommitting"))
    {

LABEL_14:
      -[UITextSelectionView updateSelectionRects](self, "updateSelectionRects");
      return;
    }
    -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "expectingCommit");

    if ((v13 & 1) != 0)
      goto LABEL_14;
    -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "requiresImmediateUpdate");

    if (v15)
      goto LABEL_14;
    -[UITextSelectionView deferredUpdateSelectionRects](self, "deferredUpdateSelectionRects");
  }
}

- (void)updateSelectionRects
{
  __CFRunLoop *Current;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  _BOOL4 m_activeCaret;
  void *v11;
  void *v12;
  BOOL v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  UIView *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double width;
  double v57;
  double v58;
  uint64_t v59;
  void *v60;
  void *v61;
  char v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  uint64_t v72;
  void *v73;
  void *v74;
  char v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double x;
  CGFloat v84;
  BOOL v85;
  CGFloat MinX;
  double v87;
  double v88;
  double v89;
  double MaxX;
  double height;
  double y;
  uint64_t v93;
  void *v94;
  void *v95;
  UIView *v96;
  void *v97;
  double v98;
  CGFloat r2;
  _QWORD v100[4];
  UIView *v101;
  double v102;
  double v103;
  double v104;
  double v105;
  _QWORD v106[4];
  UIView *v107;
  double v108;
  double v109;
  double v110;
  double v111;
  _QWORD v112[4];
  UIView *v113;
  double v114;
  double v115;
  double v116;
  double v117;
  _QWORD v118[2];
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;

  v118[1] = *MEMORY[0x1E0C80C00];
  if (!-[UITextSelectionView _activeAndVisible](self, "_activeAndVisible"))
  {
    -[UITextSelectionView removeFromSuperview](self, "removeFromSuperview");
    return;
  }
  if (self->m_observer && !self->m_deferSelectionCommands)
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveObserver(Current, self->m_observer, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRelease(self->m_observer);
    self->m_observer = 0;
  }
  -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextSelectionView selection](self, "selection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[UITextSelectionView clearCaret](self, "clearCaret");
    -[UITextSelectionView clearRangeAnimated:](self, "clearRangeAnimated:", 0);
    -[UITextSelectionView removeFromSuperview](self, "removeFromSuperview");
    goto LABEL_28;
  }
  -[UITextSelectionView selection](self, "selection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "_isCaret"))
  {
    v9 = -[UITextSelectionView forceRangeView](self, "forceRangeView");

    if (!v9)
    {
      m_activeCaret = self->m_activeCaret;
      -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "textDocument");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = +[UIDictationController shouldHideCursorForTextView:](UIDictationController, "shouldHideCursorForTextView:", v12);

      if (!v13)
      {
        v14 = 1;
        -[UITextSelectionView clearRangeAnimated:](self, "clearRangeAnimated:", 1);
        -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "isEditable") & 1) == 0)
        {
          -[UITextSelectionView selection](self, "selection");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v17, "hasEditableSelection");

        }
        -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "externalInteractions");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "textInteractionMode");

        -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "inGesture"))
        {
          -[UITextSelectionView rangeView](self, "rangeView");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "mode") != 1;

        }
        else
        {
          v23 = 0;
        }

        if ((v14 | v23) != 1 || v20 == 1)
        {
          -[UITextSelectionView clearCaret](self, "clearCaret");
          goto LABEL_28;
        }
        -[UITextSelectionView installIfNecessary](self, "installIfNecessary");
        -[UITextSelectionView selection](self, "selection");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "caretRect");
        v42 = v41;
        v44 = v43;
        v46 = v45;
        v48 = v47;

        -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "view");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "textInputView");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "convertRect:toView:", self, v42, v44, v46, v48);
        v98 = v52;
        v54 = v53;
        width = v55;
        v58 = v57;

        objc_msgSend(v4, "view");
        v59 = objc_claimAutoreleasedReturnValue();
        if (v59
          && (v60 = (void *)v59,
              objc_msgSend(v4, "view"),
              v61 = (void *)objc_claimAutoreleasedReturnValue(),
              v62 = objc_opt_respondsToSelector(),
              v61,
              v60,
              (v62 & 1) != 0))
        {
          objc_msgSend(v4, "view");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "selectionClipRect");
        }
        else
        {
          v68 = *MEMORY[0x1E0C9D628];
          v69 = *(double *)(MEMORY[0x1E0C9D628] + 8);
          v70 = *(double *)(MEMORY[0x1E0C9D628] + 16);
          v71 = *(double *)(MEMORY[0x1E0C9D628] + 24);
          objc_msgSend(v4, "view");
          v72 = objc_claimAutoreleasedReturnValue();
          if (!v72)
            goto LABEL_40;
          v73 = (void *)v72;
          objc_msgSend(v4, "view");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = objc_opt_respondsToSelector();

          if ((v75 & 1) == 0)
            goto LABEL_40;
          objc_msgSend(v4, "view");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "_selectionClipRect");
        }
        v68 = v64;
        v69 = v65;
        v70 = v66;
        v71 = v67;

LABEL_40:
        v119.origin.x = v68;
        v119.origin.y = v69;
        v119.size.width = v70;
        v119.size.height = v71;
        if (!CGRectIsNull(v119))
        {
          -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "view");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "textInputView");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "convertRect:toView:", self, v68, v69, v70, v71);
          v68 = v79;
          v69 = v80;
          v70 = v81;
          v71 = v82;

        }
        -[UITextSelectionView caretView](self, "caretView");
        v31 = (UIView *)objc_claimAutoreleasedReturnValue();
        v120.origin.x = v68;
        v120.origin.y = v69;
        v120.size.width = v70;
        v120.size.height = v71;
        r2 = v54;
        if (CGRectIsNull(v120))
        {
          x = v98;
          v84 = v58;
        }
        else
        {
          v121.origin.x = v68;
          v121.origin.y = v69;
          v121.size.width = v70;
          v121.size.height = v71;
          v85 = v98 < CGRectGetMinX(v121);
          MinX = v98;
          if (v85)
          {
            v122.origin.x = v68;
            v122.origin.y = v69;
            v122.size.width = v70;
            v122.size.height = v71;
            MinX = CGRectGetMinX(v122);
          }
          x = MinX;
          v87 = v54;
          v88 = width;
          v84 = v58;
          v89 = v58;
          MaxX = CGRectGetMaxX(*(CGRect *)&MinX);
          v123.origin.x = v68;
          v123.origin.y = v69;
          v123.size.width = v70;
          v123.size.height = v71;
          if (MaxX > CGRectGetMaxX(v123))
          {
            v124.origin.x = v68;
            v124.origin.y = v69;
            v124.size.width = v70;
            v124.size.height = v71;
            x = CGRectGetMaxX(v124) - width;
          }
        }
        v125.origin.x = v68;
        v125.origin.y = v69;
        v125.size.width = v70;
        v125.size.height = v71;
        if (CGRectIsNull(v125))
        {
          height = v84;
          y = r2;
        }
        else
        {
          v126.origin.x = v68;
          v126.origin.y = v69;
          v126.size.width = v70;
          v126.size.height = v71;
          v130.origin.x = x;
          v130.origin.y = r2;
          v130.size.width = width;
          v130.size.height = v84;
          v127 = CGRectIntersection(v126, v130);
          x = v127.origin.x;
          y = v127.origin.y;
          width = v127.size.width;
          height = v127.size.height;
        }
        v128.origin.x = x;
        v128.origin.y = y;
        v128.size.width = width;
        v128.size.height = height;
        if (CGRectIsEmpty(v128) || !UIRectIsDiscrete(x, y, width, height))
        {
          -[UITextSelectionView clearCaret](self, "clearCaret");
        }
        else
        {
          -[UITextSelectionView dynamicCaret](self, "dynamicCaret");
          v93 = objc_claimAutoreleasedReturnValue();
          if (v93
            && (v94 = (void *)v93,
                -[UIView superview](v31, "superview"),
                v95 = (void *)objc_claimAutoreleasedReturnValue(),
                v95,
                v94,
                v95))
          {
            v112[0] = MEMORY[0x1E0C809B0];
            v112[1] = 3221225472;
            v112[2] = __43__UITextSelectionView_updateSelectionRects__block_invoke;
            v112[3] = &unk_1E16B20D8;
            v113 = v31;
            v114 = x;
            v115 = y;
            v116 = width;
            v117 = height;
            +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v112, 0.2);
            v96 = v113;
          }
          else if (self->m_caretAnimating)
          {
            v106[0] = MEMORY[0x1E0C809B0];
            v106[1] = 3221225472;
            v106[2] = __43__UITextSelectionView_updateSelectionRects__block_invoke_2;
            v106[3] = &unk_1E16B20D8;
            v107 = v31;
            v108 = x;
            v109 = y;
            v110 = width;
            v111 = height;
            +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 50331648, v106, 0, 0.05, 0.0);
            v96 = v107;
          }
          else
          {
            v100[0] = MEMORY[0x1E0C809B0];
            v100[1] = 3221225472;
            v100[2] = __43__UITextSelectionView_updateSelectionRects__block_invoke_3;
            v100[3] = &unk_1E16B20D8;
            v101 = v31;
            v102 = x;
            v103 = y;
            v104 = width;
            v105 = height;
            +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v100);
            v96 = v101;
          }

          -[UIView superview](v31, "superview");
          v97 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v97)
            -[UITextSelectionView addCaretToSubview](self, "addCaretToSubview");
          if (m_activeCaret)
            -[UITextSelectionView showCaret:](self, "showCaret:", 0);
          else
            -[UITextSelectionView showInitialCaret](self, "showInitialCaret");
          -[UITextSelectionView _setCaretBlinkAnimationEnabled:](self, "_setCaretBlinkAnimationEnabled:", self->m_caretBlinks);
          +[UIDictationController updateLandingView](UIDictationController, "updateLandingView");
          if (_AXSZoomTouchEnabled())
          {
            -[UIView bounds](v31, "bounds");
            UIAccessibilityZoomFocusChanged(UIAccessibilityZoomTypeInsertionPoint, v129, v31);
          }
        }
LABEL_27:

        goto LABEL_28;
      }
      goto LABEL_28;
    }
  }
  else
  {

  }
  -[UITextSelectionView selection](self, "selection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "selectedRange");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v25, "_isRanged") & 1) != 0)
  {

  }
  else
  {
    v26 = -[UITextSelectionView forceRangeView](self, "forceRangeView");

    if (!v26)
      goto LABEL_28;
  }
  -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "textDocument");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = +[UIDictationController shouldHideSelectionUIForTextView:](UIDictationController, "shouldHideSelectionUIForTextView:", v28);

  if (!v29)
  {
    -[UITextSelectionView clearCaret](self, "clearCaret");
    -[UITextSelectionView installIfNecessary](self, "installIfNecessary");
    -[UITextSelectionView selection](self, "selection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "selectionRects");
    v31 = (UIView *)objc_claimAutoreleasedReturnValue();

    if (!-[UIView count](v31, "count"))
    {
      -[UITextSelectionView selection](self, "selection");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "caretRect");
      +[_UITextSelectionCaretRect selectionRectWithRect:](_UITextSelectionCaretRect, "selectionRectWithRect:");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v118[0] = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 1);
      v34 = objc_claimAutoreleasedReturnValue();

      v31 = (UIView *)v34;
    }
    -[UITextSelectionView rangeView](self, "rangeView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "superview");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
      -[UIView addSubview:](self, "addSubview:", v35);
    objc_msgSend(v35, "setRects:", v31);
    -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "textInputView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "bounds");
    -[UIView setFrame:](self, "setFrame:");

    if (self->m_shouldEmphasizeNextSelectionRects)
    {
      objc_msgSend(v35, "animateHighlighterExpanderAnimation");
      self->m_shouldEmphasizeNextSelectionRects = 0;
    }

    goto LABEL_27;
  }
LABEL_28:

}

uint64_t __43__UITextSelectionView_updateSelectionRects__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __43__UITextSelectionView_updateSelectionRects__block_invoke_2(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(double *)(a1 + 56) * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCornerRadius:", v2);

}

void __43__UITextSelectionView_updateSelectionRects__block_invoke_3(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(double *)(a1 + 56) * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCornerRadius:", v2);

}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITextSelectionView;
  -[UIView tintColorDidChange](&v4, sel_tintColorDidChange);
  if (self->m_caretView)
  {
    -[UITextSelectionView caretViewColor](self, "caretViewColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->m_caretView, "setBackgroundColor:", v3);

  }
}

- (void)didSuspend:(id)a3
{
  self->m_isSuspended = 1;
}

- (void)willResume:(id)a3
{
  self->m_isSuspended = 0;
  -[UITextSelectionView updateSelectionRects](self, "updateSelectionRects", a3);
}

- (void)deferredUpdateSelectionRects
{
  __CFRunLoop *Current;
  _QWORD v4[4];
  id v5;
  id location;

  if (!self->m_observer && !self->m_isSuspended)
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __51__UITextSelectionView_deferredUpdateSelectionRects__block_invoke;
    v4[3] = &unk_1E16B4F18;
    objc_copyWeak(&v5, &location);
    self->m_observer = CFRunLoopObserverCreateWithHandler(0, 4uLL, 0, 0, v4);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddObserver(Current, self->m_observer, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __51__UITextSelectionView_deferredUpdateSelectionRects__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateSelectionRectsIfNeeded");

}

- (void)setEmphasisOnNextSelectionRects
{
  self->m_shouldEmphasizeNextSelectionRects = 1;
}

- (void)deferredUpdateSelectionCommands
{
  self->m_deferSelectionCommands = 1;
  -[UITextSelectionView deferredUpdateSelectionRects](self, "deferredUpdateSelectionRects");
}

- (void)updateSelectionRectsIfNeeded
{
  __CFRunLoop *Current;

  if (self->m_observer)
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveObserver(Current, self->m_observer, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRelease(self->m_observer);
    self->m_observer = 0;
    -[UITextSelectionView updateSelectionRects](self, "updateSelectionRects");
    if (self->m_deferSelectionCommands)
      -[UITextSelectionView showCommandsWithReplacements:](self, "showCommandsWithReplacements:", 0);
  }
}

- (void)updateSelectionDots
{
  void *v3;
  void *v4;
  int v5;

  if (-[UITextSelectionView visible](self, "visible"))
  {
    -[UITextSelectionView selection](self, "selection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "selectedRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_isRanged");

    if (v5)
      -[UITextRangeView updateDots](self->m_rangeView, "updateDots");
  }
}

- (void)appearOrFadeIfNecessary
{
  _BOOL4 v3;
  double v4;
  double v6;
  char v7;
  _QWORD v8[5];

  v3 = -[UITextSelectionView shouldBeVisible](self, "shouldBeVisible");
  -[UIView alpha](self, "alpha");
  if (v4 != 0.0 || !v3)
  {
    -[UIView alpha](self, "alpha");
    v7 = v6 == 0.0 || v3;
    if ((v7 & 1) == 0)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __46__UITextSelectionView_appearOrFadeIfNecessary__block_invoke;
      v8[3] = &unk_1E16B1B28;
      v8[4] = self;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v8, 0, 0.25, 0.0);
    }
  }
  else
  {
    -[UIView setAlpha:](self, "setAlpha:", 1.0);
    -[UITextSelectionView deferredUpdateSelectionRects](self, "deferredUpdateSelectionRects");
    -[UIView setUserInteractionEnabled:](self->m_rangeView, "setUserInteractionEnabled:", 1);
  }
}

uint64_t __46__UITextSelectionView_appearOrFadeIfNecessary__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "updateDots");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setUserInteractionEnabled:", 0);
}

- (void)setVisible:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;

  v3 = a3;
  self->m_visible = a3;
  -[UITextSelectionView _updateViewAnimateNotificationObservationIfNecessary](self, "_updateViewAnimateNotificationObservationIfNecessary");
  -[UITextSelectionView appearOrFadeIfNecessary](self, "appearOrFadeIfNecessary");
  v5 = v3 && self->m_caretBlinks;
  -[UITextSelectionView _setCaretBlinkAnimationEnabled:](self, "_setCaretBlinkAnimationEnabled:", v5);
}

- (BOOL)visible
{
  return self->m_visible;
}

- (void)setCaretBlinks:(BOOL)a3
{
  uint64_t v3;

  v3 = a3;
  if (_UIDeviceHasExternalTouchInput())
    v3 = objc_msgSend((id)UIApp, "_overridesDynamicCaret") & v3;
  if (self->m_caretBlinks != (_DWORD)v3 || !self->_caretBlinkAnimation)
  {
    self->m_caretBlinks = v3;
    if (self->m_caretShowingNow)
      -[UITextSelectionView _setCaretBlinkAnimationEnabled:](self, "_setCaretBlinkAnimationEnabled:", v3);
  }
}

- (BOOL)caretBlinks
{
  return self->m_caretBlinks;
}

- (BOOL)caretVisible
{
  return self->m_caretVisible;
}

- (void)setCaretVisible:(BOOL)a3
{
  void *v4;
  void *v5;
  char v6;

  if (self->m_caretVisible != a3)
  {
    self->m_caretVisible = a3;
    if (a3)
    {
      -[UITextSelectionView addCaretToSubview](self, "addCaretToSubview");
      -[UITextSelectionView selection](self, "selection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "selectedRange");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "_isRanged");

      if ((v6 & 1) == 0)
        -[UITextSelectionView showCaret:](self, "showCaret:", 0);
      -[UITextSelectionView updateSelectionDots](self, "updateSelectionDots");
    }
    else
    {
      -[UITextSelectionView clearCaret](self, "clearCaret");
    }
  }
}

- (BOOL)ghostAppearance
{
  return self->m_ghostApperarance;
}

- (void)setGhostAppearance:(BOOL)a3
{
  id v4;

  if (self->m_ghostApperarance != a3)
  {
    self->m_ghostApperarance = a3;
    -[UITextSelectionView caretViewColor](self, "caretViewColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->m_caretView, "setBackgroundColor:", v4);

  }
}

- (BOOL)_updateEditMenuPositionForPreferredArrowDirection:(int64_t)a3 replacements:(id)a4
{
  id v6;

  v6 = a4;
  if (-[UITextSelectionView _editMenuIsVisible](self, "_editMenuIsVisible"))
    -[UITextSelectionView _presentEditMenuWithPreferredDirection:replacements:](self, "_presentEditMenuWithPreferredDirection:replacements:", a3, v6);

  return 1;
}

- (void)showCommandsWithReplacements:(id)a3
{
  -[UITextSelectionView _showCommandsWithReplacements:forDictation:afterDelay:](self, "_showCommandsWithReplacements:forDictation:afterDelay:", a3, 0, 0.0);
}

- (void)_showCommandsWithReplacements:(id)a3 forDictation:(BOOL)a4 afterDelay:(double)a5
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  BOOL m_delayShowingCommands;
  dispatch_time_t v14;
  _QWORD v15[5];
  id v16;
  BOOL v17;
  _QWORD aBlock[5];
  id v19;
  BOOL v20;

  v8 = a3;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__UITextSelectionView__showCommandsWithReplacements_forDictation_afterDelay___block_invoke;
  aBlock[3] = &unk_1E16B4008;
  aBlock[4] = self;
  v10 = v8;
  v19 = v10;
  v20 = a4;
  v11 = _Block_copy(aBlock);
  v12 = v11;
  if (a5 == 0.0)
  {
    (*((void (**)(void *))v11 + 2))(v11);
  }
  else
  {
    m_delayShowingCommands = self->m_delayShowingCommands;
    v14 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __77__UITextSelectionView__showCommandsWithReplacements_forDictation_afterDelay___block_invoke_3;
    v15[3] = &unk_1E16BAFE8;
    v17 = m_delayShowingCommands;
    v15[4] = self;
    v16 = v12;
    dispatch_after(v14, MEMORY[0x1E0C80D38], v15);

  }
}

void __77__UITextSelectionView__showCommandsWithReplacements_forDictation_afterDelay___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "interactionAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "_viewUsesAsynchronousProtocol")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __77__UITextSelectionView__showCommandsWithReplacements_forDictation_afterDelay___block_invoke_2;
    v5[3] = &unk_1E16C2A08;
    v4 = *(void **)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    v7 = *(_BYTE *)(a1 + 48);
    objc_msgSend(v3, "requestPreferredArrowDirectionForEditMenuWithCompletionHandler:", v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_showCommandsWithReplacements:isForContextMenu:forDictation:arrowDirection:", *(_QWORD *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 48), 0);
  }

}

uint64_t __77__UITextSelectionView__showCommandsWithReplacements_forDictation_afterDelay___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if ((unint64_t)(a2 - 1) >= 4)
    v2 = 0;
  else
    v2 = a2;
  return objc_msgSend(*(id *)(a1 + 32), "_showCommandsWithReplacements:isForContextMenu:forDictation:arrowDirection:", *(_QWORD *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 48), v2);
}

uint64_t __77__UITextSelectionView__showCommandsWithReplacements_forDictation_afterDelay___block_invoke_3(uint64_t result)
{
  if (*(unsigned __int8 *)(result + 48) == *(unsigned __int8 *)(*(_QWORD *)(result + 32) + 464))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 40) + 16))();
  return result;
}

- (void)_showCommandsWithReplacements:(id)a3 isForContextMenu:(BOOL)a4 forDictation:(BOOL)a5 arrowDirection:(int64_t)a6
{
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v7 = a5;
  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  self->m_showingCommandsCounter = 0;
  self->m_showingCommandsCounterForRotate = 0;
  -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textDocument");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[UIDictationController shouldHideSelectionUIForTextView:](UIDictationController, "shouldHideSelectionUIForTextView:", v12);
  if ((v13 & 1) == 0 && !a4)
  {
    -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v14, "shouldSuppressSelectionCommands");

  }
  if ((v13 & 1) == 0)
  {
    -[UITextSelectionView cancelDelayedCommandRequests](self, "cancelDelayedCommandRequests");
    if (-[UITextSelectionView selectionCommandsShowing](self, "selectionCommandsShowing"))
    {
      if (!-[UITextSelectionView _updateEditMenuPositionForPreferredArrowDirection:replacements:](self, "_updateEditMenuPositionForPreferredArrowDirection:replacements:", a6, v10))-[UITextSelectionView hideSelectionCommands](self, "hideSelectionCommands");
    }
    else
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hasMarkedText");

      if ((v16 & 1) == 0)
      {
        v17 = objc_msgSend(v10, "indexOfObjectPassingTest:", &__block_literal_global_560);
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isPredictionViewControllerVisible");

        if (v7 && v17 == 0x7FFFFFFFFFFFFFFFLL)
        {
          +[UIDevice currentDevice](UIDevice, "currentDevice");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "userInterfaceIdiom");

          if ((v21 & 0xFFFFFFFFFFFFFFFBLL) != 1)
          {
            v22 = objc_msgSend(v10, "count") ? v19 : 0;
            if (v22 == 1)
            {
              +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "autocorrectionController");
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = 0u;
              v34 = 0u;
              v35 = 0u;
              v36 = 0u;
              v25 = v10;
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
              if (v26)
              {
                v27 = v26;
                v28 = *(_QWORD *)v34;
                do
                {
                  for (i = 0; i != v27; ++i)
                  {
                    if (*(_QWORD *)v34 != v28)
                      objc_enumerationMutation(v25);
                    +[UITextReplacementCandidate textReplacementCandidateForTextReplacement:](UITextReplacementCandidate, "textReplacementCandidateForTextReplacement:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "addObject:", v30);

                  }
                  v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
                }
                while (v27);
              }

              objc_msgSend(MEMORY[0x1E0DBDB48], "listWithAutocorrection:predictions:", 0, v24);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "setAutocorrectionList:", v31);

            }
          }
        }
        -[UITextSelectionView _presentEditMenuWithPreferredDirection:replacements:](self, "_presentEditMenuWithPreferredDirection:replacements:", a6, v10);
      }
    }
  }

}

uint64_t __98__UITextSelectionView__showCommandsWithReplacements_isForContextMenu_forDictation_arrowDirection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_isNoReplacementsFoundItem");
}

- (id)_editMenuSourceWindow
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;

  -[UIView keyboardSceneDelegate](self, "keyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isRemoteKeyboardWindow");

  if (v6)
  {
    -[UIView window](self, "window");
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  return v4;
}

- (id)menuInteraction
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->m_interactionAssistant);
  objc_msgSend(WeakRetained, "_editMenuAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "menuInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_editMenuIsVisible
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->m_interactionAssistant);
  objc_msgSend(WeakRetained, "_editMenuAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_editMenuIsVisible");

  return v4;
}

- (void)_presentEditMenuWithPreferredDirection:(int64_t)a3 replacements:(id)a4
{
  UITextInteractionAssistant **p_m_interactionAssistant;
  id v6;
  void *v7;
  id WeakRetained;

  p_m_interactionAssistant = &self->m_interactionAssistant;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_m_interactionAssistant);
  objc_msgSend(WeakRetained, "_editMenuAssistant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_presentEditMenuWithPreferredDirection:replacements:", a3, v6);

}

- (void)updateSelectionCommands
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  if (-[UITextSelectionView selectionCommandsShowing](self, "selectionCommandsShowing"))
  {
    -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[UITextSelectionView _viewUsesAsynchronousProtocol](self, "_viewUsesAsynchronousProtocol")
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __46__UITextSelectionView_updateSelectionCommands__block_invoke;
      v6[3] = &unk_1E16B42D0;
      v6[4] = self;
      objc_msgSend(v4, "requestPreferredArrowDirectionForEditMenuWithCompletionHandler:", v6);
    }
    else
    {
      -[UITextSelectionView replacements](self, "replacements");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextSelectionView _updateEditMenuPositionForPreferredArrowDirection:replacements:](self, "_updateEditMenuPositionForPreferredArrowDirection:replacements:", 0, v5);

    }
  }
}

void __46__UITextSelectionView_updateSelectionCommands__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  if ((unint64_t)(a2 - 1) >= 4)
    v3 = 0;
  else
    v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "replacements");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateEditMenuPositionForPreferredArrowDirection:replacements:", v3, v4);

}

- (void)cancelDelayedCommandRequests
{
  id hideSelectionCommandsWorkItem;
  id v4;

  self->m_delayShowingCommands = 0;
  self->m_deferSelectionCommands = 0;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  hideSelectionCommandsWorkItem = self->_hideSelectionCommandsWorkItem;
  if (hideSelectionCommandsWorkItem)
  {
    dispatch_block_cancel(hideSelectionCommandsWorkItem);
    v4 = self->_hideSelectionCommandsWorkItem;
    self->_hideSelectionCommandsWorkItem = 0;

  }
}

- (void)showCalloutBarAfterDelay:(double)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->m_interactionAssistant);
  objc_msgSend(WeakRetained, "_editMenuAssistant");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v11, "_editMenuDismissedRecently")
    || objc_msgSend(v11, "_editMenuDismissedByActionSelection"))
  {
    -[UITextSelectionView cancelDelayedCommandRequests](self, "cancelDelayedCommandRequests");
    self->m_delayShowingCommands = 1;
    -[UITextSelectionView replacements](self, "replacements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSelectionView _showCommandsWithReplacements:forDictation:afterDelay:](self, "_showCommandsWithReplacements:forDictation:afterDelay:", v6, 0, a3);

    -[UITextSelectionView replacements](self, "replacements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      if (self->m_dictationReplacementsMode)
        v9 = 3;
      else
        v9 = 2;
    }
    else
    {
      v9 = 0;
    }
    -[UITextSelectionView rangeView](self, "rangeView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMode:", v9);

  }
}

- (void)showSelectionCommandsAfterDelay:(double)a3
{
  void *v5;
  void *v6;
  BOOL v7;

  -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[UIDictationController shouldHideSelectionUIForTextView:](UIDictationController, "shouldHideSelectionUIForTextView:", v6);

  if (!v7)
  {
    -[UITextSelectionView setReplacements:](self, "setReplacements:", 0);
    -[UITextSelectionView showCalloutBarAfterDelay:](self, "showCalloutBarAfterDelay:", a3);
  }
}

- (void)showSelectionCommands
{
  -[UITextSelectionView _showSelectionCommandsForContextMenu:](self, "_showSelectionCommandsForContextMenu:", 0);
}

- (void)updateRangeViewForSelectionMode
{
  id v2;

  -[UITextSelectionView rangeView](self, "rangeView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMode:", 0);

}

- (void)_showSelectionCommandsForContextMenu:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  int v9;

  v3 = a3;
  -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[UIDictationController shouldHideSelectionUIForTextView:](UIDictationController, "shouldHideSelectionUIForTextView:", v6);

  if (!v7)
  {
    -[UITextSelectionView selection](self, "selection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isCommitting");

    if (v9)
    {
      -[UITextSelectionView showCommandsWithReplacements:](self, "showCommandsWithReplacements:", 0);
    }
    else if (v3)
    {
      -[UITextSelectionView _showCommandsWithReplacements:isForContextMenu:forDictation:arrowDirection:](self, "_showCommandsWithReplacements:isForContextMenu:forDictation:arrowDirection:", 0, 1, self->m_dictationReplacementsMode, 0);
    }
    else
    {
      -[UITextSelectionView deferredUpdateSelectionCommands](self, "deferredUpdateSelectionCommands");
    }
    self->m_dictationReplacementsMode = 0;
    -[UITextSelectionView updateRangeViewForSelectionMode](self, "updateRangeViewForSelectionMode");
  }
}

- (void)calculateReplacementsWithGenerator:(id)a3 andShowAfterDelay:(double)a4
{
  id v6;

  objc_msgSend(a3, "replacements");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
    -[UITextSelectionView _showCommandsWithReplacements:forDictation:afterDelay:](self, "_showCommandsWithReplacements:forDictation:afterDelay:", v6, 0, a4);

}

- (void)showReplacementsWithGenerator:(id)a3 forDictation:(BOOL)a4 afterDelay:(double)a5
{
  _BOOL4 v6;
  id v8;
  char v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  UITextSelectionView *v25;
  id v26;

  v6 = a4;
  v8 = a3;
  -[UITextSelectionView cancelDelayedCommandRequests](self, "cancelDelayedCommandRequests");
  self->m_dictationReplacementsMode = v6;
  if (v6)
  {
    v9 = 0;
    v10 = 3;
  }
  else
  {
    v11 = objc_msgSend(v8, "isStringToReplaceMisspelled");
    v9 = v11;
    if (v11)
      v10 = 2;
    else
      v10 = 0;
  }
  -[UITextSelectionView rangeView](self, "rangeView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMode:", v10);

  if ((v9 & 1) != 0 || v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:", CFSTR("UIKeyboardPredictionsAvailable"), 0);

  }
  -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "conformsToProtocol:", &unk_1EE0CE648);

  if (v16)
  {
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __77__UITextSelectionView_showReplacementsWithGenerator_forDictation_afterDelay___block_invoke;
    v24 = &unk_1E16BB0D8;
    v25 = self;
    v26 = v8;
    v17 = _Block_copy(&v21);
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance", v21, v22, v23, v24, v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "taskQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v19, "scheduleTask:timeInterval:repeats:", v17, 0, a5);

  }
  else
  {
    -[UITextSelectionView calculateReplacementsWithGenerator:andShowAfterDelay:](self, "calculateReplacementsWithGenerator:andShowAfterDelay:", v8, a5);
  }

}

void __77__UITextSelectionView_showReplacementsWithGenerator_forDictation_afterDelay___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "calculateReplacementsWithGenerator:andShowAfterDelay:", v3, 0.0);
  objc_msgSend(v4, "returnExecutionToParent");

}

- (void)hideSelectionCommandsAfterDelay:(double)a3 reason:(int64_t)a4
{
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  id hideSelectionCommandsWorkItem;
  dispatch_time_t v11;
  _QWORD v12[6];

  -[UITextSelectionView cancelDelayedCommandRequests](self, "cancelDelayedCommandRequests");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__UITextSelectionView_hideSelectionCommandsAfterDelay_reason___block_invoke;
  v12[3] = &unk_1E16B1888;
  v12[4] = self;
  v12[5] = a4;
  v7 = (void (**)(_QWORD))dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v12);
  v8 = v7;
  if (a3 == 0.0)
  {
    v7[2](v7);
  }
  else
  {
    v9 = _Block_copy(v7);
    hideSelectionCommandsWorkItem = self->_hideSelectionCommandsWorkItem;
    self->_hideSelectionCommandsWorkItem = v9;

    v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_after(v11, MEMORY[0x1E0C80D38], v8);
  }

}

uint64_t __62__UITextSelectionView_hideSelectionCommandsAfterDelay_reason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hideSelectionCommandsWithReason:", *(_QWORD *)(a1 + 40));
}

- (void)hideSelectionCommands
{
  -[UITextSelectionView _hideSelectionCommandsWithReason:](self, "_hideSelectionCommandsWithReason:", 0);
}

- (void)_hideSelectionCommandsWithReason:(int64_t)a3
{
  id v5;

  -[UITextSelectionView cancelDelayedCommandRequests](self, "cancelDelayedCommandRequests");
  -[UITextSelectionView menuInteraction](self, "menuInteraction");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissSelectionCommandsWithReason:", a3);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  UITextRangeView *m_rangeView;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UITextSelectionView dynamicCaret](self, "dynamicCaret");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_3;
  -[UITextSelectionView caretView](self, "caretView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextSelectionView caretView](self, "caretView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertPoint:fromView:", self, x, y);
  objc_msgSend(v9, "convertPoint:fromView:", 0);
  v13 = v12;
  v15 = v14;

  -[UITextSelectionView caretView](self, "caretView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hitTest:withEvent:", v7, v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
LABEL_3:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = !-[UITextSelectionView shouldSuppressSelectionHandles](self, "shouldSuppressSelectionHandles");
    else
      v18 = 1;
    -[UITextSelectionView selection](self, "selection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "selectedRange");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "_isRanged") & 1) != 0)
    {
      -[UIView _window](self->m_rangeView, "_window");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
        v18 = 0;

      if (v18 == 1)
      {
        m_rangeView = self->m_rangeView;
        -[UIView _window](m_rangeView, "_window");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "convertPoint:fromView:", self, x, y);
        -[UIView convertPoint:fromView:](m_rangeView, "convertPoint:fromView:", 0);
        v25 = v24;
        v27 = v26;

        -[UIView hitTest:withEvent:](self->m_rangeView, "hitTest:withEvent:", v7, v25, v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    else
    {

    }
    v17 = 0;
  }
LABEL_13:

  return v17;
}

- (void)configureForSelectionMode
{
  id v2;

  -[UITextSelectionView rangeView](self, "rangeView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMode:", 0);

}

- (void)configureForHighlightMode
{
  id v2;

  -[UITextSelectionView rangeView](self, "rangeView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMode:", 1);

}

- (void)configureForReplacementMode
{
  uint64_t v2;
  id v3;

  if (self->m_dictationReplacementsMode)
    v2 = 3;
  else
    v2 = 2;
  -[UITextSelectionView rangeView](self, "rangeView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMode:", v2);

}

- (void)configureForPencilHighlightMode
{
  id v2;

  -[UITextSelectionView rangeView](self, "rangeView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMode:", 4);

}

- (void)configureForPencilDeletionPreviewMode
{
  id v2;

  -[UITextSelectionView rangeView](self, "rangeView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMode:", 5);

}

- (BOOL)activeCaret
{
  return self->m_activeCaret;
}

- (void)clearCaret
{
  void *v3;

  self->m_activeCaret = 0;
  -[UITextSelectionView hideCaret:](self, "hideCaret:", 0);
  -[UITextSelectionView caretView](self, "caretView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  if (self->m_caretAnimating)
    -[UITextSelectionView endFloatingCursor](self, "endFloatingCursor");
}

- (void)_hideCaret:(int)a3
{
  void *v4;
  double v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  UITextSelectionView *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  UITextSelectionView *v16;

  switch(a3)
  {
    case 2:
      if (!self->m_caretShowingNow)
        break;
      v7 = MEMORY[0x1E0C809B0];
      v8 = 3221225472;
      v9 = __34__UITextSelectionView__hideCaret___block_invoke_2;
      v10 = &unk_1E16B1B28;
      v11 = self;
      v5 = 0.15;
      v6 = &v7;
LABEL_9:
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 117440512, v6, 0, v5, 0.0, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
      break;
    case 1:
      if (!self->m_caretShowingNow)
        break;
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __34__UITextSelectionView__hideCaret___block_invoke;
      v15 = &unk_1E16B1B28;
      v16 = self;
      v5 = 0.25;
      v6 = &v12;
      goto LABEL_9;
    case 0:
      -[UITextSelectionView caretView](self, "caretView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAlpha:", 0.0);

      break;
  }
  self->m_caretShowingNow = 0;
}

void __34__UITextSelectionView__hideCaret___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "caretView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __34__UITextSelectionView__hideCaret___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "caretView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

- (void)animateBoxShrinkOn:(id)a3
{
  id v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "frame");
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrameInterval:", 0.0166666667);
  objc_msgSend(v6, "setDuration:", 0.125);
  objc_msgSend(v6, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v6, "keyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAnimation:forKey:", v6, v7);

  LODWORD(v8) = 1.0;
  objc_msgSend(v3, "setOpacity:", v8);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("bounds.size.width"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrameInterval:", 0.0166666667);
  objc_msgSend(v9, "setDuration:", 0.125);
  v10 = *MEMORY[0x1E0CD2B50];
  objc_msgSend(v9, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5 * 7.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValues:", v13);

  objc_msgSend(v9, "keyPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAnimation:forKey:", v9, v14);

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position.x"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrameInterval:", 0.0166666667);
  objc_msgSend(v15, "setDuration:", 0.125);
  objc_msgSend(v15, "setFillMode:", v10);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5 * 7.0 * 0.5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  v19[1] = &unk_1E1A9A770;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setValues:", v17);

  objc_msgSend(v15, "setAdditive:", 1);
  objc_msgSend(v15, "keyPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAnimation:forKey:", v15, v18);

}

- (void)animateExpanderOn:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrameInterval:", 0.0166666667);
  objc_msgSend(v28, "setDuration:", 0.125);
  v8 = *MEMORY[0x1E0CD2B50];
  objc_msgSend(v28, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(v28, "setValues:", &unk_1E1A94D60);
  objc_msgSend(v28, "keyPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAnimation:forKey:", v28, v9);

  LODWORD(v10) = 1.0;
  objc_msgSend(v3, "setOpacity:", v10);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("bounds.size.width"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrameInterval:", 0.0166666667);
  v12 = *MEMORY[0x1E0CD2928];
  objc_msgSend(v11, "setCalculationMode:", *MEMORY[0x1E0CD2928]);
  objc_msgSend(v11, "setDuration:", 0.300000012);
  objc_msgSend(v11, "setFillMode:", v8);
  objc_msgSend(v11, "setKeyTimes:", &unk_1E1A94D78);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5 * 3.5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5 * 0.5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValues:", v17);

  objc_msgSend(v11, "keyPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAnimation:forKey:", v11, v18);

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("bounds.size.height"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrameInterval:", 0.0166666667);
  objc_msgSend(v19, "setCalculationMode:", v12);
  objc_msgSend(v19, "setDuration:", 0.300000012);
  objc_msgSend(v19, "setFillMode:", v8);
  objc_msgSend(v19, "setKeyTimes:", &unk_1E1A94D90);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7 * 0.1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7 * 1.25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7 * 0.75);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setValues:", v24);

  objc_msgSend(v19, "keyPath");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAnimation:forKey:", v19, v25);

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrameInterval:", 0.0166666667);
  objc_msgSend(v26, "setDuration:", 0.600000024);
  objc_msgSend(v26, "setFillMode:", v8);
  objc_msgSend(v26, "setValues:", &unk_1E1A94DA8);
  objc_msgSend(v26, "setKeyTimes:", &unk_1E1A94DC0);
  objc_msgSend(v26, "setBeginTime:", 0.0925);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTimingFunction:", v27);

  objc_msgSend(v3, "addAnimation:forKey:", v26, CFSTR("opacity2"));
}

- (void)showInitialCaret
{
  void *v3;
  void *v4;
  int v5;

  if (-[UITextSelectionView visible](self, "visible") && !self->m_caretAnimating && self->m_caretVisible)
  {
    -[UIView keyboardSceneDelegate](self, "keyboardSceneDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "containerWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_isFullscreen");

    if (v5)
    {
      -[UITextSelectionView showCaret:](self, "showCaret:", 0);
    }
    else
    {
      -[UITextSelectionView _setCaretBlinkAnimationEnabled:](self, "_setCaretBlinkAnimationEnabled:", self->m_caretBlinks);
      self->m_activeCaret = 1;
    }
  }
}

- (void)showCaret:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[UITextSelectionView visible](self, "visible") && !self->m_caretAnimating && self->m_caretVisible)
    -[UITextSelectionView _showCaret:](self, "_showCaret:", v3);
}

- (void)_showCaret:(int)a3
{
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  UITextSelectionView *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  UITextSelectionView *v15;

  switch(a3)
  {
    case 2:
      if (self->m_caretShowingNow)
        break;
      v6 = MEMORY[0x1E0C809B0];
      v7 = 3221225472;
      v8 = __34__UITextSelectionView__showCaret___block_invoke_2;
      v9 = &unk_1E16B1B28;
      v10 = self;
      v5 = &v6;
LABEL_9:
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 117440512, v5, 0, 0.15, 0.0, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
      break;
    case 1:
      if (self->m_caretShowingNow)
        break;
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __34__UITextSelectionView__showCaret___block_invoke;
      v14 = &unk_1E16B1B28;
      v15 = self;
      v5 = &v11;
      goto LABEL_9;
    case 0:
      -[UITextSelectionView caretView](self, "caretView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAlpha:", 1.0);

      break;
  }
  self->m_caretShowingNow = 1;
  self->m_activeCaret = 1;
}

void __34__UITextSelectionView__showCaret___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "caretView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __34__UITextSelectionView__showCaret___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "caretView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)_setCaretBlinkAnimationEnabled:(BOOL)a3
{
  CAKeyframeAnimation *v4;
  CAKeyframeAnimation *caretBlinkAnimation;
  double v6;
  void *v7;
  void *v8;
  CAKeyframeAnimation *v9;
  void *v10;

  if (a3 && -[UITextSelectionView visible](self, "visible"))
  {
    if (!self->_caretBlinkAnimation)
    {
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
      v4 = (CAKeyframeAnimation *)objc_claimAutoreleasedReturnValue();
      caretBlinkAnimation = self->_caretBlinkAnimation;
      self->_caretBlinkAnimation = v4;

      -[CAKeyframeAnimation setCalculationMode:](self->_caretBlinkAnimation, "setCalculationMode:", *MEMORY[0x1E0CD2930]);
      -[CAKeyframeAnimation setValues:](self->_caretBlinkAnimation, "setValues:", &unk_1E1A94DD8);
      -[CAKeyframeAnimation setKeyTimes:](self->_caretBlinkAnimation, "setKeyTimes:", &unk_1E1A94DF0);
      -[CAKeyframeAnimation setDuration:](self->_caretBlinkAnimation, "setDuration:", 1.0);
      LODWORD(v6) = 2139095039;
      -[CAKeyframeAnimation setRepeatCount:](self->_caretBlinkAnimation, "setRepeatCount:", v6);
    }
    -[UIView layer](self->m_caretView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAnimation:forKey:", self->_caretBlinkAnimation, CFSTR("UITextSelectionViewCaretBlinkAnimation"));

  }
  else if (self->_caretBlinkAnimation)
  {
    -[UIView layer](self->m_floatingCaretView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeAnimationForKey:", CFSTR("UITextSelectionViewCaretBlinkAnimation"));

    -[UIView layer](self->m_caretView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeAnimationForKey:", CFSTR("UITextSelectionViewCaretBlinkAnimation"));

    v9 = self->_caretBlinkAnimation;
    self->_caretBlinkAnimation = 0;

  }
}

- (id)ghostCaretViewColor
{
  return +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &__block_literal_global_366);
}

id __42__UITextSelectionView_ghostCaretViewColor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  double v3;

  v2 = objc_msgSend(a2, "userInterfaceStyle");
  v3 = 0.0;
  if (v2 == 2)
    v3 = 1.0;
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v3, 0.3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)caretViewColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->m_ghostApperarance)
  {
    -[UITextSelectionView ghostCaretViewColor](self, "ghostCaretViewColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "insertionPointColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[UIColor insertionPointColor](UIColor, "insertionPointColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v3;
}

- (void)addCaretToSubview
{
  id v3;

  -[UITextSelectionView caretView](self, "caretView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](self, "addSubview:", v3);

}

- (UIView)caretView
{
  UIView *v3;
  UIView *v4;
  UIView *v5;
  void *v6;
  void *v7;
  UIDynamicCaret *v8;
  UIView *v9;
  UIView *m_caretView;

  if (!self->m_caretView)
  {
    if (_UIDeviceHasExternalTouchInput() && (objc_msgSend((id)UIApp, "_overridesDynamicCaret") & 1) == 0)
    {
      v8 = [UIDynamicCaret alloc];
      v9 = -[UIDynamicCaret initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      m_caretView = self->m_caretView;
      self->m_caretView = v9;

      -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
    }
    else
    {
      v3 = [UIView alloc];
      v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v5 = self->m_caretView;
      self->m_caretView = v4;

      -[UIView setUserInteractionEnabled:](self->m_caretView, "setUserInteractionEnabled:", 0);
      -[UITextSelectionView caretViewColor](self, "caretViewColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->m_caretView, "setBackgroundColor:", v6);

      -[UIView setAlpha:](self->m_caretView, "setAlpha:", 0.0);
      -[UIView layer](self->m_caretView, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCornerRadius:", 1.0);

    }
  }
  return self->m_caretView;
}

- (BOOL)point:(CGPoint)a3 isNearCursorRect:(CGRect)a4
{
  BOOL v4;

  v4 = vabdd_f64(a4.origin.x + a4.size.width * 0.5, a3.x) < 15.0;
  return vabdd_f64(a4.origin.y + a4.size.height * 0.5, a3.y) < 30.0 && v4;
}

- (void)beginFloatingCaretView
{
  UIView *v3;
  UIView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  UIView **p_m_floatingCaretView;
  UIView *m_caretView;
  UIView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  id v45;

  v3 = [UIView alloc];
  v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
  -[UITextSelectionView ghostCaretViewColor](self, "ghostCaretViewColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v5);

  -[UIView layer](v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", 1.0);

  -[UITextSelectionView caretView](self, "caretView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIView frame](self->m_caretView, "frame");
    -[UIView setFrame:](v4, "setFrame:");
    -[UIView layer](self->m_caretView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cornerRadius");
    v11 = v10;
    -[UIView layer](v4, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", v11);

    -[UIView addSubview:](self, "addSubview:", v4);
  }
  p_m_floatingCaretView = &self->m_floatingCaretView;
  -[UIView removeFromSuperview](self->m_floatingCaretView, "removeFromSuperview");
  objc_storeStrong((id *)&self->m_floatingCaretView, self->m_caretView);
  m_caretView = self->m_caretView;
  self->m_caretView = v4;
  v15 = v4;

  -[UITextSelectionView floatingCaretView](self, "floatingCaretView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    -[UITextSelectionView selection](self, "selection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "selectedRange");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "start");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[UITextSelectionView selection](self, "selection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "document");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "caretRectForPosition:", v20);
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;

      -[UITextSelectionView floatingCaretView](self, "floatingCaretView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setFrame:", v24, v26, v28, v30);

      -[UITextSelectionView floatingCaretView](self, "floatingCaretView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "layer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setCornerRadius:", v28 * 0.5);

    }
    -[UITextSelectionView floatingCaretView](self, "floatingCaretView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](self, "addSubview:", v34);

  }
  -[UITextSelectionView floatingCaretViewColor](self, "floatingCaretViewColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](*p_m_floatingCaretView, "setBackgroundColor:", v35);

  -[UIView bounds](*p_m_floatingCaretView, "bounds");
  +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
  v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v37 = objc_msgSend(v36, "CGPath");
  -[UIView layer](*p_m_floatingCaretView, "layer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setShadowPath:", v37);

  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.274509804, 0.431372549, 0.725490196, 1.0);
  v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v40 = objc_msgSend(v39, "CGColor");
  -[UIView layer](*p_m_floatingCaretView, "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setShadowColor:", v40);

  -[UIView layer](*p_m_floatingCaretView, "layer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setShadowOffset:", 0.0, 10.0);

  -[UIView layer](*p_m_floatingCaretView, "layer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setShadowRadius:", 3.0);

  -[UIView layer](*p_m_floatingCaretView, "layer");
  v45 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v44) = 1051931443;
  objc_msgSend(v45, "setShadowOpacity:", v44);

}

- (void)animatePulsingIndirectCaret:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0CD2848];
  v4 = a3;
  objc_msgSend(v3, "animationWithKeyPath:", CFSTR("transform.scale"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrameInterval:", 0.0166666667);
  v5 = *MEMORY[0x1E0CD2B50];
  objc_msgSend(v8, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(v8, "setFromValue:", &unk_1E1A9A770);
  objc_msgSend(v8, "setToValue:", &unk_1E1A961B0);
  objc_msgSend(v8, "setAdditive:", 1);
  objc_msgSend(v8, "setMass:", 1.0);
  objc_msgSend(v8, "setStiffness:", 734.0);
  objc_msgSend(v8, "setDamping:", 33.0);
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrameInterval:", 0.0166666667);
  objc_msgSend(v6, "setFillMode:", v5);
  objc_msgSend(v6, "setFromValue:", &unk_1E1A9A770);
  objc_msgSend(v6, "setToValue:", &unk_1E1A96260);
  objc_msgSend(v6, "setAdditive:", 1);
  objc_msgSend(v6, "setMass:", 1.0);
  objc_msgSend(v6, "setStiffness:", 155.0);
  objc_msgSend(v6, "setDamping:", 14.0);
  objc_msgSend(v6, "settlingDuration");
  objc_msgSend(v6, "setDuration:");
  objc_msgSend(v6, "setBeginTime:", CACurrentMediaTime() + 0.12);
  objc_msgSend(v6, "settlingDuration");
  objc_msgSend(v8, "setDuration:", v7 + 0.12);
  objc_msgSend(v4, "addAnimation:forKey:", v6, 0);
  objc_msgSend(v4, "addAnimation:forKey:", v8, 0);

}

- (void)animatePulsingDirectCaret:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v3 = a3;
  objc_msgSend(v3, "bounds");
  v5 = v4;
  objc_msgSend(v3, "bounds");
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("bounds"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFromValue:", v8);

  v9 = v7 * 1.5;
  v10 = v5 * 1.8;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setToValue:", v11);

  objc_msgSend(v12, "setMass:", 1.0);
  objc_msgSend(v12, "setStiffness:", 300.0);
  objc_msgSend(v12, "setDamping:", 25.82);
  objc_msgSend(v12, "settlingDuration");
  objc_msgSend(v12, "setDuration:");
  objc_msgSend(v3, "addAnimation:forKey:", v12, CFSTR("bounds"));
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(v3, "setBounds:", 0.0, 0.0, v9, v10);

  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 0);
}

- (void)willBeginFloatingCursor:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[UIView frame](self->m_caretView, "frame");
  -[UITextSelectionView setStashedCaretRect:](self, "setStashedCaretRect:");
  -[UIView frame](self->m_caretView, "frame");
  -[UITextSelectionView setPreviousGhostCaretRect:](self, "setPreviousGhostCaretRect:");
  -[UITextSelectionView setIsIndirectFloatingCaret:](self, "setIsIndirectFloatingCaret:", v3);
}

- (BOOL)_shouldUseIndirectFloatingCaret
{
  double v2;

  -[UIView frame](self->m_caretView, "frame");
  return v2 > 40.0;
}

- (void)beginFloatingCursorAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 m_caretAnimating;
  void *v10;
  _BOOL4 IsEmpty;
  void *v12;
  void *v13;
  void *v14;
  id floatingCaretBlinkAssertion;
  void *v16;
  _BOOL4 m_shouldEmphasizeNextSelectionRects;
  void *v18;
  void *v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  -[UITextSelectionView selection](self, "selection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UITextSelectionView floatingCaretView](self, "floatingCaretView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8 || (m_caretAnimating = self->m_caretAnimating, v8, !m_caretAnimating))
    {
      -[UITextSelectionView caretView](self, "caretView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "frame");
      IsEmpty = CGRectIsEmpty(v20);

      if (IsEmpty)
        -[UITextSelectionView updateSelectionRects](self, "updateSelectionRects");
      -[UITextSelectionView hideSelectionCommands](self, "hideSelectionCommands");
      -[UITextSelectionView showCaret:](self, "showCaret:", 0);
      self->m_caretAnimating = 1;
      -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_assertionController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "nonBlinkingAssertionWithReason:", CFSTR("Floating cursor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      floatingCaretBlinkAssertion = self->_floatingCaretBlinkAssertion;
      self->_floatingCaretBlinkAssertion = v14;

      -[UITextSelectionView beginFloatingCaretView](self, "beginFloatingCaretView");
      -[UITextSelectionView selection](self, "selection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "granularity"))
      {
        m_shouldEmphasizeNextSelectionRects = self->m_shouldEmphasizeNextSelectionRects;

        if (m_shouldEmphasizeNextSelectionRects)
        {
LABEL_15:
          -[UITextSelectionView updateFloatingCursorAtPoint:](self, "updateFloatingCursorAtPoint:", x, y);
          return;
        }
      }
      else
      {

      }
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      if (-[UITextSelectionView isIndirectFloatingCaret](self, "isIndirectFloatingCaret")
        || -[UITextSelectionView _shouldUseIndirectFloatingCaret](self, "_shouldUseIndirectFloatingCaret"))
      {
        -[UITextSelectionView floatingCaretView](self, "floatingCaretView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "layer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextSelectionView animatePulsingIndirectCaret:](self, "animatePulsingIndirectCaret:", v19);

      }
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      goto LABEL_15;
    }
  }
}

- (CGPoint)floatingCursorPositionForPoint:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[UITextSelectionView floatingCursorPositionForPoint:lineSnapping:](self, "floatingCursorPositionForPoint:lineSnapping:", 1, a3.x, a3.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)floatingCursorPositionForPoint:(CGPoint)a3 lineSnapping:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  char v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGPoint result;
  CGRect v56;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(v12, "_selectionClipRect");
LABEL_5:
    v19 = v14;
    v20 = v15;
    v21 = v16;
    v22 = v17;

    goto LABEL_7;
  }
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "selectionClipRect");
    goto LABEL_5;
  }
  v19 = *MEMORY[0x1E0C9D628];
  v20 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v21 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v22 = *(double *)(MEMORY[0x1E0C9D628] + 24);
LABEL_7:
  v56.origin.x = v19;
  v56.origin.y = v20;
  v56.size.width = v21;
  v56.size.height = v22;
  if (CGRectIsNull(v56))
  {
    -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "textInputView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bounds");
    v19 = v26;
    v20 = v27;
    v21 = v28;
    v22 = v29;

  }
  -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "textInputView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", v32, v19, v20, v21, v22);
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;

  -[UITextSelectionView floatingCaretView](self, "floatingCaretView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "size");
  v43 = v42 * 0.5;

  -[UITextSelectionView floatingCaretView](self, "floatingCaretView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "size");
  v46 = v45 * 0.5;

  v47 = v38 - (v43 + v43);
  v48 = v40 - (v46 + v46);
  if (v47 >= 0.0)
  {
    if (x >= v34 + v43)
    {
      v49 = v34 + v43 + v47;
      if (x > v49)
        x = v49;
    }
    else
    {
      x = v34 + v43;
    }
  }
  if (v48 >= 0.0)
  {
    if (y >= v36 + v46)
    {
      v50 = v36 + v46 + v48;
      if (y > v50)
        y = v50;
    }
    else
    {
      y = v36 + v46;
    }
  }
  if (v4)
  {
    -[UIView frame](self->m_caretView, "frame");
    y = v52 + v51 * 0.5 + (y - (v52 + v51 * 0.5)) * 0.3;
  }
  v53 = x;
  v54 = y;
  result.y = v54;
  result.x = v53;
  return result;
}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3
{
  -[UITextSelectionView updateFloatingCursorAtPoint:animated:](self, "updateFloatingCursorAtPoint:animated:", 0, a3.x, a3.y);
}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  _QWORD v19[7];
  _QWORD v20[7];
  CGRect v21;

  v4 = a4;
  self->m_caretAnimating = 1;
  -[UITextSelectionView floatingCursorPositionForPoint:](self, "floatingCursorPositionForPoint:", a3.x, a3.y);
  v7 = v6;
  v9 = v8;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferencesActions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLForPreferenceKey:", CFSTR("YukonMagnifiersDisabled"));

  if (v12)
  {
    -[UIView frame](self->m_caretView, "frame");
    if (-[UITextSelectionView point:isNearCursorRect:](self, "point:isNearCursorRect:", v7, v9, v13, v14, v15, v16))
    {
      if (self->m_caretShowingNow)
        -[UITextSelectionView _hideCaret:](self, "_hideCaret:", 2);
    }
    else if (!self->m_caretShowingNow)
    {
      -[UITextSelectionView _showCaret:](self, "_showCaret:", 2);
    }
    -[UITextSelectionView previousGhostCaretRect](self, "previousGhostCaretRect");
    CGRectGetMidY(v21);
    if (v4)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __60__UITextSelectionView_updateFloatingCursorAtPoint_animated___block_invoke;
      v20[3] = &unk_1E16B4E70;
      v20[4] = self;
      *(double *)&v20[5] = v7;
      *(double *)&v20[6] = v9;
      +[UIView _animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:](UIView, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 4, v20, &__block_literal_global_383, 0.0, 0.0);
    }
    else
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __60__UITextSelectionView_updateFloatingCursorAtPoint_animated___block_invoke_3;
      v19[3] = &unk_1E16B4E70;
      v19[4] = self;
      *(double *)&v19[5] = v7;
      *(double *)&v19[6] = v9;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v19);
    }
    -[UIView frame](self->m_caretView, "frame");
    -[UITextSelectionView setPreviousGhostCaretRect:](self, "setPreviousGhostCaretRect:");
  }
  else
  {
    -[UITextSelectionView floatingCaretView](self, "floatingCaretView");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPosition:", v7, v9);

  }
}

void __60__UITextSelectionView_updateFloatingCursorAtPoint_animated___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  id v3;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "floatingCaretView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCenter:", v1, v2);

}

void __60__UITextSelectionView_updateFloatingCursorAtPoint_animated___block_invoke_3(uint64_t a1)
{
  double v1;
  double v2;
  id v3;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "floatingCaretView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCenter:", v1, v2);

}

- (void)animateCaret:(id)a3 toPosition:(CGPoint)a4 withSize:(CGSize)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  height = a5.height;
  width = a5.width;
  y = a4.y;
  x = a4.x;
  v9 = (void *)MEMORY[0x1E0CD27D0];
  v10 = a3;
  LODWORD(v11) = 1048911544;
  LODWORD(v12) = 1054615798;
  LODWORD(v13) = 1065520988;
  LODWORD(v14) = 0;
  objc_msgSend(v9, "functionWithControlPoints::::", v11, v14, v12, v13);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("position"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrameInterval:", 0.0166666667);
  objc_msgSend(v15, "setDuration:", 0.15);
  objc_msgSend(v15, "setTimingFunction:", v29);
  v16 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v10, "position");
  objc_msgSend(v16, "valueWithCGPoint:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFromValue:", v17);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", x, y);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setToValue:", v18);

  objc_msgSend(v15, "keyPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAnimation:forKey:", v15, v19);

  objc_msgSend(v10, "setPosition:", x, y);
  objc_msgSend(v10, "bounds");
  v21 = v20;
  v23 = v22;
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("bounds"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrameInterval:", 0.0166666667);
  objc_msgSend(v24, "setDuration:", 0.15);
  objc_msgSend(v24, "setTimingFunction:", v29);
  v25 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v10, "bounds");
  objc_msgSend(v25, "valueWithCGRect:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFromValue:", v26);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v21, v23, width, height);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setToValue:", v27);

  objc_msgSend(v24, "keyPath");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAnimation:forKey:", v24, v28);

  objc_msgSend(v10, "setBounds:", v21, v23, width, height);
}

- (void)endFloatingCaretView
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  UIView *m_floatingCaretView;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferencesActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForPreferenceKey:", CFSTR("YukonMagnifiersDisabled"));

  if (v5 && !self->m_caretShowingNow)
    -[UITextSelectionView showCaret:](self, "showCaret:", 2);
  -[UITextSelectionView caretViewColor](self, "caretViewColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->m_floatingCaretView, "setBackgroundColor:", v6);

  -[UIView layer](self->m_floatingCaretView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShadowColor:", 0);

  -[UIView layer](self->m_floatingCaretView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShadowPath:", 0);

  -[UIView layer](self->m_floatingCaretView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 0;
  objc_msgSend(v9, "setShadowOpacity:", v10);

  -[UIView removeFromSuperview](self->m_caretView, "removeFromSuperview");
  objc_storeStrong((id *)&self->m_caretView, self->m_floatingCaretView);
  m_floatingCaretView = self->m_floatingCaretView;
  self->m_floatingCaretView = 0;

}

- (void)endFloatingCursor
{
  id floatingCaretBlinkAssertion;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  floatingCaretBlinkAssertion = self->_floatingCaretBlinkAssertion;
  self->_floatingCaretBlinkAssertion = 0;

  -[UITextSelectionView caretView](self, "caretView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __40__UITextSelectionView_endFloatingCursor__block_invoke;
    v16[3] = &unk_1E16B1B28;
    v16[4] = self;
    objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v16);
    -[UITextSelectionView floatingCaretView](self, "floatingCaretView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSelectionView caretView](self, "caretView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "position");
    v11 = v10;
    v13 = v12;
    -[UITextSelectionView caretView](self, "caretView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    -[UITextSelectionView animateCaret:toPosition:withSize:](self, "animateCaret:toPosition:withSize:", v7, v11, v13);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  else
  {
    -[UITextSelectionView floatingCaretView](self, "floatingCaretView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeFromSuperview");

    self->m_caretAnimating = 0;
  }
  -[UITextSelectionView endFloatingCaretView](self, "endFloatingCaretView");
}

uint64_t __40__UITextSelectionView_endFloatingCursor__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 458) = 0;
  return result;
}

- (id)obtainGrabberSuppressionAssertion
{
  ++self->_activeGrabberSuppressionAssertions;
  return -[UITextSelectionGrabberSuppressionAssertion initWithSelectionView:]([UITextSelectionGrabberSuppressionAssertion alloc], "initWithSelectionView:", self);
}

- (BOOL)shouldSuppressSelectionHandles
{
  return self->_activeGrabberSuppressionAssertions != 0;
}

- (void)releaseGrabberHandleSuppressionAssertion:(id)a3
{
  unint64_t activeGrabberSuppressionAssertions;
  dispatch_time_t v5;
  _QWORD block[5];

  activeGrabberSuppressionAssertions = self->_activeGrabberSuppressionAssertions;
  if (activeGrabberSuppressionAssertions)
  {
    self->_activeGrabberSuppressionAssertions = activeGrabberSuppressionAssertions - 1;
    v5 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__UITextSelectionView_releaseGrabberHandleSuppressionAssertion___block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    dispatch_after(v5, MEMORY[0x1E0C80D38], block);
  }
}

void __64__UITextSelectionView_releaseGrabberHandleSuppressionAssertion___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "shouldSuppressSelectionHandles") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "rangeView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "areSelectionRectsVisible");

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "rangeView");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "updateGrabbers");

    }
  }
}

- (id)dynamicCaret
{
  UIView *m_caretView;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    m_caretView = self->m_caretView;
  else
    m_caretView = 0;
  return m_caretView;
}

- (id)dynamicCaretList
{
  UIView *v3;

  if (-[UIView conformsToProtocol:](self->m_caretView, "conformsToProtocol:", &unk_1EDF6E390))
    v3 = self->m_caretView;
  else
    v3 = 0;
  return v3;
}

- (void)updateDocumentHasContent:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[UIView conformsToProtocol:](self->m_caretView, "conformsToProtocol:", &unk_1EE0367A0))
    -[UIView setDocumentHasContent:](self->m_caretView, "setDocumentHasContent:", v3);
}

- (UITextRangeView)rangeView
{
  UITextRangeView *m_rangeView;
  UITextRangeView *v4;
  UITextRangeView *v5;
  UITextRangeView *v6;

  m_rangeView = self->m_rangeView;
  if (!m_rangeView)
  {
    v4 = [UITextRangeView alloc];
    v5 = -[UITextRangeView initWithFrame:selectionView:](v4, "initWithFrame:selectionView:", self, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->m_rangeView;
    self->m_rangeView = v5;

    m_rangeView = self->m_rangeView;
  }
  return m_rangeView;
}

- (UITextSelection)selection
{
  void *v2;
  void *v3;
  void *v4;

  -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeSelectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextSelection *)v4;
}

- (CGRect)selectionBoundingBox
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  double v7;
  double v8;
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
  CGRect result;

  -[UITextSelectionView selection](self, "selection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isRanged");

  if ((v5 & 1) != 0)
  {
    -[UITextRangeView rects](self->m_rangeView, "rects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSelectionView selectionBoundingBoxForRects:](self, "selectionBoundingBoxForRects:", v6);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

  }
  else
  {
    v8 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)selectionBoundingBoxForRects:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  double x;
  double y;
  double width;
  double height;
  void *v26;
  void *v27;
  void *v28;
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
  double v40;
  _BYTE v41[32];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect result;
  CGRect v52;
  CGRect v53;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  *(_QWORD *)v41 = *MEMORY[0x1E0C9D648];
  *(_QWORD *)&v41[8] = *(_QWORD *)(MEMORY[0x1E0C9D648] + 8);
  *(_QWORD *)&v41[16] = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
  *(_QWORD *)&v41[24] = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
  -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInputView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "visibleBounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v16 = v4;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v43;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v43 != v20)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v21), "rect", *(_QWORD *)v41, *(_QWORD *)&v41[8], *(_QWORD *)&v41[16], *(_QWORD *)&v41[24], (_QWORD)v42);
        x = v48.origin.x;
        y = v48.origin.y;
        width = v48.size.width;
        height = v48.size.height;
        v52.origin.x = v9;
        v52.origin.y = v11;
        v52.size.width = v13;
        v52.size.height = v15;
        v49 = CGRectIntersection(v48, v52);
        if (!CGRectIsNull(v49))
        {
          -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "view");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "textInputView");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "convertRect:toView:", self, x, y, width, height);
          v30 = v29;
          v32 = v31;
          v34 = v33;
          v36 = v35;

          if (v19)
          {
            v53.origin.x = v30;
            v53.origin.y = v32;
            v53.size.width = v34;
            v53.size.height = v36;
            v50 = CGRectUnion(*(CGRect *)v41, v53);
            v30 = v50.origin.x;
            v32 = v50.origin.y;
            v34 = v50.size.width;
            v36 = v50.size.height;
          }
          ++v19;
          *(CGFloat *)&v41[16] = v34;
          *(CGFloat *)&v41[24] = v36;
          *(CGFloat *)v41 = v30;
          *(CGFloat *)&v41[8] = v32;
        }
        ++v21;
      }
      while (v18 != v21);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v18);
  }

  v37 = *(double *)v41;
  v38 = *(double *)&v41[8];
  v39 = *(double *)&v41[16];
  v40 = *(double *)&v41[24];
  result.size.height = v40;
  result.size.width = v39;
  result.origin.y = v38;
  result.origin.x = v37;
  return result;
}

- (void)layoutChangedByScrolling:(BOOL)a3
{
  -[UITextSelectionView updateSelectionRects](self, "updateSelectionRects", a3);
  -[UITextSelectionView updateSelectionCommands](self, "updateSelectionCommands");
}

- (void)prepareForMagnification
{
  void *v3;
  void *v4;
  id v5;

  -[UITextSelectionView rangeView](self, "rangeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UITextSelectionView rangeView](self, "rangeView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prepareForMagnification");

  }
}

- (void)doneMagnifying
{
  void *v3;
  void *v4;
  id v5;

  -[UITextSelectionView rangeView](self, "rangeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UITextSelectionView rangeView](self, "rangeView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doneMagnifying");

  }
}

- (void)scaleWillChange:(id)a3
{
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = -[UITextSelectionView affectedByScrollerNotification:](self, "affectedByScrollerNotification:", v12);
  v5 = v12;
  if (v4)
  {
    objc_msgSend(v12, "userInfo");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_4;
    v7 = (void *)v6;
    objc_msgSend(v12, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("UITextSelectionZoomScaleDidChange"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (v10)
    {
LABEL_4:
      self->m_wasShowingCommands |= -[UITextSelectionView selectionCommandsShowing](self, "selectionCommandsShowing");
      -[UITextSelectionView hideSelectionCommands](self, "hideSelectionCommands");
    }
    -[UIView superview](self->m_rangeView, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v12;
    if (v11)
    {
      -[UITextRangeView scaleWillChange](self->m_rangeView, "scaleWillChange");
      v5 = v12;
    }
  }

}

- (void)scaleDidChange:(id)a3
{
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = -[UITextSelectionView affectedByScrollerNotification:](self, "affectedByScrollerNotification:", v15);
  v5 = v15;
  if (v4)
  {
    objc_msgSend(v15, "userInfo");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_4;
    v7 = (void *)v6;
    objc_msgSend(v15, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("UITextSelectionZoomScaleDidChange"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (v10)
    {
LABEL_4:
      -[UITextSelectionView selection](self, "selection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "selectedRange");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "_isRanged");

      if (v13 && self->m_wasShowingCommands)
        -[UITextSelectionView showCalloutBarAfterDelay:](self, "showCalloutBarAfterDelay:", 0.1);
      self->m_wasShowingCommands = 0;
    }
    -[UIView superview](self->m_rangeView, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v15;
    if (v14)
    {
      -[UITextRangeView scaleDidChange](self->m_rangeView, "scaleDidChange");
      v5 = v15;
    }
  }

}

- (void)willRotate:(id)a3
{
  int m_showingCommandsCounterForRotate;
  BOOL v5;
  void *v6;
  id v7;

  v7 = a3;
  if (self->m_activated && -[UITextSelectionView shouldBeVisible](self, "shouldBeVisible"))
  {
    m_showingCommandsCounterForRotate = self->m_showingCommandsCounterForRotate;
    self->m_showingCommandsCounterForRotate = m_showingCommandsCounterForRotate + 1;
    if (!m_showingCommandsCounterForRotate)
    {
      v5 = self->m_delayShowingCommands
        || -[UITextSelectionView selectionCommandsShowing](self, "selectionCommandsShowing");
      self->m_wasShowingCommands = v5;
      -[UITextSelectionView cancelDelayedCommandRequests](self, "cancelDelayedCommandRequests");
      -[UITextSelectionView hideSelectionCommands](self, "hideSelectionCommands");
    }
    -[UIView superview](self->m_rangeView, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[UITextRangeView willRotate](self->m_rangeView, "willRotate");
  }

}

- (void)didRotate:(id)a3
{
  void *v4;
  int m_showingCommandsCounterForRotate;
  int v6;

  -[UIView superview](self->m_rangeView, "superview", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[UITextRangeView didRotate](self->m_rangeView, "didRotate");
  m_showingCommandsCounterForRotate = self->m_showingCommandsCounterForRotate;
  if (m_showingCommandsCounterForRotate)
  {
    v6 = m_showingCommandsCounterForRotate - 1;
    self->m_showingCommandsCounterForRotate = v6;
    if (!v6 && self->m_wasShowingCommands)
    {
      -[UITextSelectionView showCalloutBarAfterDelay:](self, "showCalloutBarAfterDelay:", 0.1);
      self->m_wasShowingCommands = 0;
    }
  }
}

- (void)updateBaseIsStartWithDocumentPoint:(CGPoint)a3
{
  UITextRangeView *m_rangeView;

  m_rangeView = self->m_rangeView;
  if (m_rangeView)
    -[UITextRangeView updateBaseIsStartWithDocumentPoint:](m_rangeView, "updateBaseIsStartWithDocumentPoint:", a3.x, a3.y);
}

- (void)updateSelectionWithDocumentPoint:(CGPoint)a3
{
  UITextRangeView *m_rangeView;

  m_rangeView = self->m_rangeView;
  if (m_rangeView)
    -[UITextRangeView updateSelectionWithDocumentPoint:](m_rangeView, "updateSelectionWithDocumentPoint:", a3.x, a3.y);
}

- (id)scrollView
{
  void *v2;
  void *v3;
  id v4;

  -[UIView _scroller](self, "_scroller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (CGRect)clippedTargetRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
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
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  void *v87;
  int v88;
  void *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect result;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textInputView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "visibleBounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "textInputView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v21, v12, v14, v16, v18);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    v98.origin.x = v23;
    v98.origin.y = v25;
    v98.size.width = v27;
    v98.size.height = v29;
    v108.origin.x = x;
    v108.origin.y = y;
    v108.size.width = width;
    v108.size.height = height;
    v99 = CGRectIntersection(v98, v108);
    v30 = v99.origin.x;
    v31 = v99.origin.y;
    v32 = v99.size.width;
    v33 = v99.size.height;
    -[UIView window](self, "window");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView _screen](self, "_screen");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bounds");
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v43 = v42;
    -[UIView _screen](self, "_screen");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "coordinateSpace");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "convertRect:fromCoordinateSpace:", v45, v37, v39, v41, v43);
    v47 = v46;
    v49 = v48;
    v51 = v50;
    v53 = v52;

    -[UIView window](self, "window");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v54, v47, v49, v51, v53);
    v56 = v55;
    v58 = v57;
    v60 = v59;
    v62 = v61;

    v100.origin.x = v56;
    v100.origin.y = v58;
    v100.size.width = v60;
    v100.size.height = v62;
    v109.origin.x = v30;
    v109.origin.y = v31;
    v109.size.width = v32;
    v109.size.height = v33;
    if (!CGRectIntersectsRect(v100, v109))
    {
      v63 = v56 + v60;
      if (v30 + v32 < v56 + 10.0)
        v64 = v56 - v32 + 10.0;
      else
        v64 = v30;
      if (v63 < v30 + 10.0)
        v30 = v63 + -10.0;
      else
        v30 = v64;
      if (v58 + v62 >= v31 + 10.0)
      {
        if (v31 + v33 < v58 + 10.0)
          v31 = v58 - v33 + 10.0;
      }
      else
      {
        v31 = v58 + v62 + -10.0;
      }
    }
    v101.origin.x = v56;
    v101.origin.y = v58;
    v101.size.width = v60;
    v101.size.height = v62;
    v110.origin.x = v30;
    v110.origin.y = v31;
    v110.size.width = v32;
    v110.size.height = v33;
    v102 = CGRectIntersection(v101, v110);
    x = v102.origin.x;
    y = v102.origin.y;
    width = v102.size.width;
    height = v102.size.height;
    -[UITextSelectionView scrollView](self, "scrollView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (v65)
    {
      -[UIView convertRect:toView:](self, "convertRect:toView:", v65, x, y, width, height);
      v67 = v66;
      v69 = v68;
      v71 = v70;
      v73 = v72;
      objc_msgSend(v65, "bounds");
      v111.origin.x = v67;
      v111.origin.y = v69;
      v111.size.width = v71;
      v111.size.height = v73;
      v104 = CGRectIntersection(v103, v111);
      v74 = v104.origin.x;
      v75 = v104.origin.y;
      v76 = v104.size.width;
      v77 = v104.size.height;
      if (CGRectIsEmpty(v104))
      {
        x = *MEMORY[0x1E0C9D648];
        y = *(double *)(MEMORY[0x1E0C9D648] + 8);
        width = *(double *)(MEMORY[0x1E0C9D648] + 16);
        height = *(double *)(MEMORY[0x1E0C9D648] + 24);
      }
      else
      {
        -[UIView convertRect:fromView:](self, "convertRect:fromView:", v65, v74, v75, v76, v77);
        v82 = v78;
        v83 = v79;
        v84 = v80;
        v85 = v81;
        if (v81 >= height)
        {
          x = v78;
          y = v79;
          width = v80;
          height = v81;
        }
        else
        {
          if (height >= 40.0)
          {
            -[UITextSelectionView interactionAssistant](self, "interactionAssistant");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "view");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = objc_msgSend(v87, "isEditing");

            if (v88)
            {
              +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "subtractKeyboardFrameFromRect:inView:", self, v82, v83, v84, v85);
              v82 = v90;
              v83 = v91;
              v84 = v92;
              v85 = v93;

            }
            v106.origin.x = v82;
            v106.origin.y = v83;
            v106.size.width = v84;
            v106.size.height = v85;
            v105 = CGRectInset(v106, 0.0, -10.0);
          }
          else
          {
            v112.origin.x = x;
            v112.origin.y = y;
            v112.size.width = width;
            v112.size.height = height;
            v105 = CGRectUnion(*(CGRect *)&v78, v112);
          }
          x = v105.origin.x;
          y = v105.origin.y;
          width = v105.size.width;
          height = v105.size.height;
        }
      }
    }

  }
  v94 = x;
  v95 = y;
  v96 = width;
  v97 = height;
  result.size.height = v97;
  result.size.width = v96;
  result.origin.y = v95;
  result.origin.x = v94;
  return result;
}

- (void)mustFlattenForAlert:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UITextSelectionView setAlertFlattened:](self, "setAlertFlattened:", 0);
  }
  else
  {
    objc_msgSend(v6, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    -[UITextSelectionView setAlertFlattened:](self, "setAlertFlattened:", (objc_opt_isKindOfClass() & 1) == 0);

  }
  -[UITextSelectionView updateSelectionDots](self, "updateSelectionDots");

}

- (void)canExpandAfterAlert:(id)a3
{
  -[UITextSelectionView setAlertFlattened:](self, "setAlertFlattened:", 0);
  -[UITextSelectionView updateSelectionDots](self, "updateSelectionDots");
}

- (void)mustFlattenForSheet:(id)a3
{
  -[UITextSelectionView setSheetFlattened:](self, "setSheetFlattened:", 1);
  -[UITextSelectionView updateSelectionDots](self, "updateSelectionDots");
}

- (void)canExpandAfterSheet:(id)a3
{
  -[UITextSelectionView setSheetFlattened:](self, "setSheetFlattened:", 0);
  -[UITextSelectionView updateSelectionDots](self, "updateSelectionDots");
}

- (void)mustFlattenForPopover:(id)a3
{
  -[UITextSelectionView setPopoverFlattened:](self, "setPopoverFlattened:", 1);
  -[UITextSelectionView updateSelectionDots](self, "updateSelectionDots");
}

- (void)canExpandAfterPopover:(id)a3
{
  -[UITextSelectionView setPopoverFlattened:](self, "setPopoverFlattened:", 0);
  -[UITextSelectionView updateSelectionDots](self, "updateSelectionDots");
}

- (void)saveDeactivationReason:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("_UIApplicationDeactivationReasonUserInfoKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextSelectionView setApplicationDeactivationReason:](self, "setApplicationDeactivationReason:", objc_msgSend(v4, "intValue"));

}

- (void)mustFlattenForResignActive:(id)a3
{
  if (-[UITextSelectionView applicationDeactivationReason](self, "applicationDeactivationReason", a3) != 11)
  {
    if (-[UITextSelectionView applicationDeactivationReason](self, "applicationDeactivationReason"))
    {
      -[UITextSelectionView setActiveFlattened:](self, "setActiveFlattened:", 1);
      -[UITextSelectionView updateSelectionDots](self, "updateSelectionDots");
    }
  }
}

- (void)canExpandAfterBecomeActive:(id)a3
{
  -[UITextSelectionView setActiveFlattened:](self, "setActiveFlattened:", 0);
  -[UITextSelectionView updateSelectionDots](self, "updateSelectionDots");
}

- (void)mustFlattenForNavigationTransition:(id)a3
{
  -[UITextSelectionView setNavigationTransitionFlattened:](self, "setNavigationTransitionFlattened:", 1);
  -[UITextSelectionView updateSelectionDots](self, "updateSelectionDots");
}

- (void)canExpandAfterNavigationTransition:(id)a3
{
  -[UITextSelectionView setNavigationTransitionFlattened:](self, "setNavigationTransitionFlattened:", 0);
  -[UITextSelectionView updateSelectionDots](self, "updateSelectionDots");
}

- (UIView)floatingCaretView
{
  return self->m_floatingCaretView;
}

- (UITextInteractionAssistant)interactionAssistant
{
  return (UITextInteractionAssistant *)objc_loadWeakRetained((id *)&self->m_interactionAssistant);
}

- (BOOL)forceRangeView
{
  return self->m_forceRangeView;
}

- (void)setForceRangeView:(BOOL)a3
{
  self->m_forceRangeView = a3;
}

- (NSArray)replacements
{
  return self->m_replacements;
}

- (void)setReplacements:(id)a3
{
  objc_storeStrong((id *)&self->m_replacements, a3);
}

- (BOOL)activeFlattened
{
  return self->_activeFlattened;
}

- (void)setActiveFlattened:(BOOL)a3
{
  self->_activeFlattened = a3;
}

- (BOOL)alertFlattened
{
  return self->_alertFlattened;
}

- (void)setAlertFlattened:(BOOL)a3
{
  self->_alertFlattened = a3;
}

- (BOOL)sheetFlattened
{
  return self->_sheetFlattened;
}

- (void)setSheetFlattened:(BOOL)a3
{
  self->_sheetFlattened = a3;
}

- (BOOL)popoverFlattened
{
  return self->_popoverFlattened;
}

- (void)setPopoverFlattened:(BOOL)a3
{
  self->_popoverFlattened = a3;
}

- (BOOL)navigationTransitionFlattened
{
  return self->_navigationTransitionFlattened;
}

- (void)setNavigationTransitionFlattened:(BOOL)a3
{
  self->_navigationTransitionFlattened = a3;
}

- (int)applicationDeactivationReason
{
  return self->_applicationDeactivationReason;
}

- (void)setApplicationDeactivationReason:(int)a3
{
  self->_applicationDeactivationReason = a3;
}

- (CGRect)stashedCaretRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_stashedCaretRect.origin.x;
  y = self->_stashedCaretRect.origin.y;
  width = self->_stashedCaretRect.size.width;
  height = self->_stashedCaretRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setStashedCaretRect:(CGRect)a3
{
  self->_stashedCaretRect = a3;
}

- (BOOL)isIndirectFloatingCaret
{
  return self->_isIndirectFloatingCaret;
}

- (void)setIsIndirectFloatingCaret:(BOOL)a3
{
  self->_isIndirectFloatingCaret = a3;
}

- (CGRect)previousGhostCaretRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_previousGhostCaretRect.origin.x;
  y = self->_previousGhostCaretRect.origin.y;
  width = self->_previousGhostCaretRect.size.width;
  height = self->_previousGhostCaretRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPreviousGhostCaretRect:(CGRect)a3
{
  self->_previousGhostCaretRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hideSelectionCommandsWorkItem, 0);
  objc_storeStrong(&self->_floatingCaretBlinkAssertion, 0);
  objc_storeStrong((id *)&self->_caretBlinkAnimation, 0);
  objc_storeStrong((id *)&self->m_replacements, 0);
  objc_storeStrong((id *)&self->m_rangeView, 0);
  objc_storeStrong((id *)&self->m_floatingCaretView, 0);
  objc_storeStrong((id *)&self->m_caretView, 0);
  objc_storeStrong((id *)&self->m_selection, 0);
  objc_destroyWeak((id *)&self->m_interactionAssistant);
}

@end
