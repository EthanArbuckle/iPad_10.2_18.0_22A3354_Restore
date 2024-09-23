@implementation _UIInterruptScrollDecelerationGestureRecognizer

- (_UIInterruptScrollDecelerationGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIInterruptScrollDecelerationGestureRecognizer *v4;
  _UIInterruptScrollDecelerationGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIInterruptScrollDecelerationGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
    -[UIGestureRecognizer _setAcceptsFailureRequiments:](v4, "_setAcceptsFailureRequiments:", 0);
  return v5;
}

- (void)reset
{
  UIHoverEvent *currentHoverEvent;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIInterruptScrollDecelerationGestureRecognizer;
  -[UIGestureRecognizer reset](&v4, sel_reset);
  currentHoverEvent = self->_currentHoverEvent;
  self->_currentHoverEvent = 0;

  self->_previousTrackpadFingerDownCount = 0;
  self->_trackpadFingerDownCount = 0;
}

- (BOOL)_shouldReceiveTouch:(id)a3 forEvent:(id)a4 recognizerView:(id)a5
{
  uint64_t v9;
  objc_super v11;

  v9 = objc_msgSend(a4, "type");
  if (v9)
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIInterruptScrollDecelerationGestureRecognizer;
    LOBYTE(v9) = -[UIGestureRecognizer _shouldReceiveTouch:forEvent:recognizerView:](&v11, sel__shouldReceiveTouch_forEvent_recognizerView_, a3, a4, a5);
  }
  return v9;
}

- (BOOL)_shouldReceivePress:(id)a3
{
  return 0;
}

- (void)_hoverEntered:(id)a3 withEvent:(id)a4
{
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  int64_t trackpadFingerDownCount;
  int v13;
  int64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = _MergedGlobals_3_16;
  if (!_MergedGlobals_3_16)
  {
    v7 = __UILogCategoryGetNode("InterruptScrollGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v7, (unint64_t *)&_MergedGlobals_3_16);
  }
  if ((*(_BYTE *)v7 & 1) != 0)
  {
    v10 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412546;
      v14 = (int64_t)a3;
      v15 = 2112;
      v16 = a4;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "_hoverEntered: %@ withEvent: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  if (!self->_currentHoverEvent)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)&self->_currentHoverEvent, a4);
      v8 = -[UIEvent _trackpadFingerDownCount](self->_currentHoverEvent, "_trackpadFingerDownCount");
      self->_trackpadFingerDownCount = v8;
      self->_previousTrackpadFingerDownCount = v8;
      v9 = qword_1ECD7A698;
      if (!qword_1ECD7A698)
      {
        v9 = __UILogCategoryGetNode("InterruptScrollGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&qword_1ECD7A698);
      }
      if ((*(_BYTE *)v9 & 1) != 0)
      {
        v11 = *(NSObject **)(v9 + 8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          trackpadFingerDownCount = self->_trackpadFingerDownCount;
          v13 = 134217984;
          v14 = trackpadFingerDownCount;
          _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "trackpadFingerDownCount (and previous) changed to %ld", (uint8_t *)&v13, 0xCu);
        }
      }
    }
  }
}

- (void)_hoverMoved:(id)a3 withEvent:(id)a4
{
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  int64_t previousTrackpadFingerDownCount;
  int64_t trackpadFingerDownCount;
  NSObject *v15;
  int v16;
  int64_t v17;
  __int16 v18;
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = qword_1ECD7A6A0;
  if (!qword_1ECD7A6A0)
  {
    v7 = __UILogCategoryGetNode("InterruptScrollGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v7, (unint64_t *)&qword_1ECD7A6A0);
  }
  if ((*(_BYTE *)v7 & 1) != 0)
  {
    v11 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412546;
      v17 = (int64_t)a3;
      v18 = 2112;
      v19 = (int64_t)a4;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "_hoverMoved: %@ withEvent: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  if (self->_currentHoverEvent == a4)
  {
    self->_previousTrackpadFingerDownCount = self->_trackpadFingerDownCount;
    v8 = objc_msgSend(a4, "_trackpadFingerDownCount");
    self->_trackpadFingerDownCount = v8;
    if (self->_previousTrackpadFingerDownCount != v8)
    {
      v9 = qword_1ECD7A6A8;
      if (!qword_1ECD7A6A8)
      {
        v9 = __UILogCategoryGetNode("InterruptScrollGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&qword_1ECD7A6A8);
      }
      if ((*(_BYTE *)v9 & 1) != 0)
      {
        v12 = *(NSObject **)(v9 + 8);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          previousTrackpadFingerDownCount = self->_previousTrackpadFingerDownCount;
          trackpadFingerDownCount = self->_trackpadFingerDownCount;
          v16 = 134218240;
          v17 = previousTrackpadFingerDownCount;
          v18 = 2048;
          v19 = trackpadFingerDownCount;
          _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "trackpadFingerDownCount changed from %ld to %ld", (uint8_t *)&v16, 0x16u);
        }
      }
      if (!self->_previousTrackpadFingerDownCount && self->_trackpadFingerDownCount == 1)
      {
        v10 = qword_1ECD7A6B0;
        if (!qword_1ECD7A6B0)
        {
          v10 = __UILogCategoryGetNode("InterruptScrollGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v10, (unint64_t *)&qword_1ECD7A6B0);
        }
        if ((*(_BYTE *)v10 & 1) != 0)
        {
          v15 = *(NSObject **)(v10 + 8);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = 138412290;
            v17 = (int64_t)self;
            _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Trackpad finger down count went from 0 to 1, so recognizing: %@", (uint8_t *)&v16, 0xCu);
          }
        }
        -[UIGestureRecognizer setState:](self, "setState:", 3);
      }
    }
  }
}

- (void)_hoverExited:(id)a3 withEvent:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = qword_1ECD7A6B8;
  if (!qword_1ECD7A6B8)
  {
    v7 = __UILogCategoryGetNode("InterruptScrollGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v7, (unint64_t *)&qword_1ECD7A6B8);
  }
  if ((*(_BYTE *)v7 & 1) != 0)
  {
    v9 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412546;
      v12 = a3;
      v13 = 2112;
      v14 = a4;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "_hoverExited: %@ withEvent: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  if (self->_currentHoverEvent == a4)
  {
    -[UIGestureRecognizer setState:](self, "setState:", 5);
    v8 = qword_1ECD7A6C0;
    if (!qword_1ECD7A6C0)
    {
      v8 = __UILogCategoryGetNode("InterruptScrollGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&qword_1ECD7A6C0);
    }
    if ((*(_BYTE *)v8 & 1) != 0)
    {
      v10 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = 138412290;
        v12 = self;
        _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Failed: %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)_hoverCancelled:(id)a3 withEvent:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = qword_1ECD7A6C8;
  if (!qword_1ECD7A6C8)
  {
    v7 = __UILogCategoryGetNode("InterruptScrollGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v7, (unint64_t *)&qword_1ECD7A6C8);
  }
  if ((*(_BYTE *)v7 & 1) != 0)
  {
    v9 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412546;
      v12 = a3;
      v13 = 2112;
      v14 = a4;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "_hoverCancelled: %@ withEvent: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  if (self->_currentHoverEvent == a4)
  {
    -[UIGestureRecognizer setState:](self, "setState:", 5);
    v8 = qword_1ECD7A6D0;
    if (!qword_1ECD7A6D0)
    {
      v8 = __UILogCategoryGetNode("InterruptScrollGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&qword_1ECD7A6D0);
    }
    if ((*(_BYTE *)v8 & 1) != 0)
    {
      v10 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = 138412290;
        v12 = self;
        _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Failed: %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)_scrollingChangedWithEvent:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = qword_1ECD7A6D8;
  if (!qword_1ECD7A6D8)
  {
    v5 = __UILogCategoryGetNode("InterruptScrollGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&qword_1ECD7A6D8);
  }
  if ((*(_BYTE *)v5 & 1) != 0)
  {
    v7 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = a3;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "_scrollingChangedWithEvent: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  if (objc_msgSend(a3, "phase") == 1)
  {
    v6 = qword_1ECD7A6E0;
    if (!qword_1ECD7A6E0)
    {
      v6 = __UILogCategoryGetNode("InterruptScrollGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&qword_1ECD7A6E0);
    }
    if ((*(_BYTE *)v6 & 1) != 0)
    {
      v8 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = 138412290;
        v10 = self;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Scroll event phase is MayBegin, so recognizing: %@", (uint8_t *)&v9, 0xCu);
      }
    }
    -[UIGestureRecognizer setState:](self, "setState:", 3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentHoverEvent, 0);
}

@end
