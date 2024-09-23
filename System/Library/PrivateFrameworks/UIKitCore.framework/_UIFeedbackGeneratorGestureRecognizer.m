@implementation _UIFeedbackGeneratorGestureRecognizer

- (_UIFeedbackGeneratorGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIFeedbackGeneratorGestureRecognizer *v4;
  uint64_t v5;
  NSMutableSet *trackedTouches;
  uint64_t v7;
  NSMutableSet *completedInteractions;
  uint64_t v9;
  NSHashTable *feedbackGenerators;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIFeedbackGeneratorGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v12, sel_initWithTarget_action_, a3, a4);
  if (v4)
  {
    v5 = objc_opt_new();
    trackedTouches = v4->_trackedTouches;
    v4->_trackedTouches = (NSMutableSet *)v5;

    v7 = objc_opt_new();
    completedInteractions = v4->_completedInteractions;
    v4->_completedInteractions = (NSMutableSet *)v7;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 514);
    v9 = objc_claimAutoreleasedReturnValue();
    feedbackGenerators = v4->_feedbackGenerators;
    v4->_feedbackGenerators = (NSHashTable *)v9;

    -[UIGestureRecognizer setCancelsTouchesInView:](v4, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setDelaysTouchesEnded:](v4, "setDelaysTouchesEnded:", 0);
    -[UIGestureRecognizer setAllowedTouchTypes:](v4, "setAllowedTouchTypes:", &unk_1E1A954C8);
    -[UIGestureRecognizer setAllowedPressTypes:](v4, "setAllowedPressTypes:", MEMORY[0x1E0C9AA60]);
    -[UIGestureRecognizer setRequiresExclusiveTouchType:](v4, "setRequiresExclusiveTouchType:", 0);
    *(_QWORD *)&v4->super._gestureFlags |= 0x100000000000uLL;
  }
  return v4;
}

+ (id)gestureRecognizerForView:(void *)a3 feedbackGenerator:
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "gestureRecognizers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
          objc_msgSend(v12[37], "addObject:", v5);

          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }

  v12 = (id *)objc_opt_new();
  objc_msgSend(v4, "addGestureRecognizer:", v12);
  objc_msgSend(v12[37], "addObject:", v5);
LABEL_11:

  return v12;
}

- (void)cleanupGestureRecognizerForFeedbackGenerator:(id *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    objc_msgSend(a1[37], "removeObject:", v3);
    v4 = objc_msgSend(a1[37], "count");
    v3 = v6;
    if (!v4)
    {
      objc_msgSend(a1, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeGestureRecognizer:", a1);

      v3 = v6;
    }
  }

}

- (uint64_t)hasDeviceInputForLocation:(uint64_t *)a3 type:(double)a4 senderID:(double)a5
{
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  char *v25;
  unint64_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  const char *ClassName;
  char *v32;
  char *v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  uint64_t v38;
  unint64_t v39;
  NSObject *v40;
  const char *v41;
  const char *v42;
  NSObject *v43;
  uint32_t v44;
  char isKindOfClass;
  uint64_t v46;
  unint64_t v47;
  NSObject *v48;
  unint64_t v49;
  NSObject *v50;
  unint64_t v51;
  NSObject *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  unsigned __int8 v57;
  uint8_t buf[4];
  const char *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v9 = result;
    v10 = (void *)objc_msgSend(*(id *)(result + 272), "mutableCopy");
    objc_msgSend(v10, "unionSet:", *(_QWORD *)(v9 + 304));
    if (*(_BYTE *)(v9 + 320))
      objc_msgSend(v10, "unionSet:", *(_QWORD *)(v9 + 312));
    if (*(_QWORD *)(v9 + 280))
      objc_msgSend(v10, "addObject:");
    if (*(_QWORD *)(v9 + 288))
      objc_msgSend(v10, "addObject:");
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v54;
      v16 = 1.79769313e308;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v54 != v15)
            objc_enumerationMutation(v11);
          v18 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend((id)v9, "view");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "locationInView:", v19);
          v21 = v20;
          v23 = v22;

          v24 = sqrt((a4 - v21) * (a4 - v21) + (a5 - v23) * (a5 - v23));
          if (v24 < v16)
          {
            v25 = v18;

            v14 = v25;
            v16 = v24;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
      }
      while (v13);
    }
    else
    {
      v14 = 0;
    }

    if (!_UIFeedbackLoggingDisabled)
    {
      v26 = _MergedGlobals_15_7;
      if (!_MergedGlobals_15_7)
      {
        v26 = __UILogCategoryGetNode("FeedbackGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v26, (unint64_t *)&_MergedGlobals_15_7);
      }
      v27 = *(NSObject **)(v26 + 8);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = v27;
        objc_msgSend((id)v9, "view");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)MEMORY[0x1E0CB3940];
        ClassName = object_getClassName(v29);
        objc_msgSend(v30, "stringWithFormat:", CFSTR("<%s: %p>"), ClassName, v29, (_QWORD)v53);
        v32 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v59 = v32;
        _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_DEFAULT, "finding interaction on view (%@)", buf, 0xCu);

      }
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      if (v14)
      {
        if (a2)
          *a2 = 1;
        if (a3)
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          v46 = 8;
          if ((isKindOfClass & 1) != 0)
            v46 = 80;
          *a3 = *(_QWORD *)&v14[v46];
        }
        if (!_UIFeedbackLoggingDisabled)
        {
          v47 = qword_1ECD7C6F8;
          if (!qword_1ECD7C6F8)
          {
            v47 = __UILogCategoryGetNode("FeedbackGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v47, (unint64_t *)&qword_1ECD7C6F8);
          }
          v48 = *(NSObject **)(v47 + 8);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_185066000, v48, OS_LOG_TYPE_DEFAULT, "closest interaction is trackpad event", buf, 2u);
          }
        }
        v57 = 1;
      }
      else
      {
        if (!_UIFeedbackLoggingDisabled)
        {
          v51 = qword_1ECD7C700;
          if (!qword_1ECD7C700)
          {
            v51 = __UILogCategoryGetNode("FeedbackGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v51, (unint64_t *)&qword_1ECD7C700);
          }
          v52 = *(NSObject **)(v51 + 8);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_185066000, v52, OS_LOG_TYPE_DEFAULT, "no closest event found", buf, 2u);
          }
        }
        v57 = 0;
      }
      goto LABEL_69;
    }
    v33 = v14;
    v34 = objc_msgSend(v33, "type");
    v35 = objc_msgSend(v33, "_isPointerTouch");
    if (v34 == 2)
      v36 = 1;
    else
      v36 = v35;
    if (v36 == 1)
    {
      v37 = v35;
      if (a2)
        *a2 = v34 != 2;
      if (a3)
      {
        if (!v35 || (v38 = objc_msgSend(v33, "_pointerSenderID")) == 0)
          v38 = objc_msgSend(v33, "_senderID");
        *a3 = v38;
      }
      if (_UIFeedbackLoggingDisabled)
        goto LABEL_62;
      v39 = qword_1ECD7C6E8;
      if (!qword_1ECD7C6E8)
      {
        v39 = __UILogCategoryGetNode("FeedbackGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v39, (unint64_t *)&qword_1ECD7C6E8);
      }
      v40 = *(NSObject **)(v39 + 8);
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        goto LABEL_62;
      v41 = "pencil";
      if (v37)
        v41 = "pointer";
      *(_DWORD *)buf = 136315138;
      v59 = v41;
      v42 = "closest interaction is %s touch";
      v43 = v40;
      v44 = 12;
    }
    else
    {
      if (_UIFeedbackLoggingDisabled)
        goto LABEL_62;
      v49 = qword_1ECD7C6F0;
      if (!qword_1ECD7C6F0)
      {
        v49 = __UILogCategoryGetNode("FeedbackGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v49, (unint64_t *)&qword_1ECD7C6F0);
      }
      v50 = *(NSObject **)(v49 + 8);
      if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        goto LABEL_62;
      *(_WORD *)buf = 0;
      v42 = "closest interaction is other touch";
      v43 = v50;
      v44 = 2;
    }
    _os_log_impl(&dword_185066000, v43, OS_LOG_TYPE_DEFAULT, v42, buf, v44);
LABEL_62:
    v57 = v36;

LABEL_69:
    return v57;
  }
  return result;
}

- (void)__completeIfNecessary
{
  if (!-[NSMutableSet count](self->_trackedTouches, "count")
    && !self->_trackedScrollEvent
    && !self->_trackedTransformEvent)
  {
    -[UIGestureRecognizer setState:](self, "setState:", 5);
  }
}

- (void)__removeCompletedInteractionsAfterDelay:(id)a3
{
  id v4;
  dispatch_time_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = dispatch_time(0, 50000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81___UIFeedbackGeneratorGestureRecognizer___removeCompletedInteractionsAfterDelay___block_invoke;
  block[3] = &unk_1E16B1500;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_after(v5, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)__moveEventToCompleted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[UIGestureRecognizer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIFeedbackGeneratorGestureRecognizerCompletedEvent completedEventFromEvent:inView:](_UIFeedbackGeneratorGestureRecognizerCompletedEvent, "completedEventFromEvent:inView:", v4, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet addObject:](self->_completedInteractions, "addObject:", v7);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFeedbackGeneratorGestureRecognizer __removeCompletedInteractionsAfterDelay:](self, "__removeCompletedInteractionsAfterDelay:", v6);

}

- (void)_transformChangedWithEvent:(id)a3
{
  uint64_t v5;
  UITransformEvent *trackedTransformEvent;
  id v7;

  v7 = a3;
  v5 = objc_msgSend(v7, "phase");
  switch(v5)
  {
    case 4:
      goto LABEL_6;
    case 3:
      -[_UIFeedbackGeneratorGestureRecognizer __moveEventToCompleted:](self, "__moveEventToCompleted:", v7);
LABEL_6:
      trackedTransformEvent = self->_trackedTransformEvent;
      self->_trackedTransformEvent = 0;

      -[_UIFeedbackGeneratorGestureRecognizer __completeIfNecessary](self, "__completeIfNecessary");
      break;
    case 1:
      objc_storeStrong((id *)&self->_trackedTransformEvent, a3);
      break;
  }

}

- (void)_scrollingChangedWithEvent:(id)a3
{
  uint64_t v5;
  UIScrollEvent *trackedScrollEvent;
  id v7;

  v7 = a3;
  v5 = objc_msgSend(v7, "phase");
  switch(v5)
  {
    case 5:
      goto LABEL_6;
    case 4:
      -[_UIFeedbackGeneratorGestureRecognizer __moveEventToCompleted:](self, "__moveEventToCompleted:", v7);
LABEL_6:
      trackedScrollEvent = self->_trackedScrollEvent;
      self->_trackedScrollEvent = 0;

      -[_UIFeedbackGeneratorGestureRecognizer __completeIfNecessary](self, "__completeIfNecessary");
      break;
    case 2:
      objc_storeStrong((id *)&self->_trackedScrollEvent, a3);
      break;
  }

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[NSMutableSet unionSet:](self->_trackedTouches, "unionSet:", a3, a4);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  -[NSMutableSet unionSet:](self->_trackedTouches, "unionSet:", a3, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  NSMutableSet *trackedTouches;
  id v6;
  id v7;

  trackedTouches = self->_trackedTouches;
  v6 = a3;
  -[NSMutableSet minusSet:](trackedTouches, "minusSet:", v6);
  -[_UIFeedbackGeneratorGestureRecognizer __completeIfNecessary](self, "__completeIfNecessary");
  objc_msgSend(v6, "bs_map:", &__block_literal_global_694);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet unionSet:](self->_completedInteractions, "unionSet:", v7);
  -[_UIFeedbackGeneratorGestureRecognizer __removeCompletedInteractionsAfterDelay:](self, "__removeCompletedInteractionsAfterDelay:", v7);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  NSSet *v5;
  NSSet *potentialDragTouches;
  id v7;

  v7 = a3;
  -[NSMutableSet minusSet:](self->_trackedTouches, "minusSet:");
  if (!-[NSMutableSet count](self->_trackedTouches, "count"))
  {
    objc_msgSend(v7, "bs_map:", &__block_literal_global_112_4);
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    potentialDragTouches = self->_potentialDragTouches;
    self->_potentialDragTouches = v5;

    -[UIGestureRecognizer setState:](self, "setState:", 5);
  }

}

- (BOOL)_affectedByGesture:(id)a3
{
  return 0;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)_wantsPartialTouchSequences
{
  return 1;
}

- (void)_stopTrackingDragEvent:(uint64_t)a1
{
  void *v3;
  id v4;

  if (a1)
  {
    *(_BYTE *)(a1 + 320) = 0;
    v3 = *(void **)(a1 + 312);
    *(_QWORD *)(a1 + 312) = 0;
    v4 = a2;

    objc_msgSend(*(id *)(a1 + 176), "removeObject:", v4);
  }
}

- (void)_trackDragEvent:(uint64_t)a1
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 320) = 1;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = *(id *)(a1 + 312);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_msgSend(v9, "window", (_QWORD)v11);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "locationInView:", v10);
          objc_msgSend(v9, "setLocationInWindow:");

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

- (void)_draggingEnteredWithEvent:(id)a3
{
  -[_UIFeedbackGeneratorGestureRecognizer _trackDragEvent:]((uint64_t)self, a3);
}

- (void)_draggingUpdatedWithEvent:(id)a3
{
  -[_UIFeedbackGeneratorGestureRecognizer _trackDragEvent:]((uint64_t)self, a3);
}

- (void)_draggingExitedWithEvent:(id)a3
{
  -[_UIFeedbackGeneratorGestureRecognizer _stopTrackingDragEvent:]((uint64_t)self, a3);
}

- (void)_draggingEndedWithEvent:(id)a3
{
  -[_UIFeedbackGeneratorGestureRecognizer _stopTrackingDragEvent:]((uint64_t)self, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedTransformEvent, 0);
  objc_storeStrong((id *)&self->_completedScrollEvent, 0);
  objc_storeStrong((id *)&self->_potentialDragTouches, 0);
  objc_storeStrong((id *)&self->_completedInteractions, 0);
  objc_storeStrong((id *)&self->_feedbackGenerators, 0);
  objc_storeStrong((id *)&self->_trackedTransformEvent, 0);
  objc_storeStrong((id *)&self->_trackedScrollEvent, 0);
  objc_storeStrong((id *)&self->_trackedTouches, 0);
}

@end
