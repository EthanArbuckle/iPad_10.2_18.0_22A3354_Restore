@implementation _UISingleFingerTapExtensionGesture

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedEvents, 0);
}

- (BOOL)_gestureCanBeginWithEvent:(id)a3
{
  return 1;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UISingleFingerTapExtensionGesture;
  -[UITapGestureRecognizer touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
    -[UIGestureRecognizer setState:](self, "setState:", 3);
}

- (void)_resetGestureRecognizer
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UISingleFingerTapExtensionGesture;
  -[UITapGestureRecognizer _resetGestureRecognizer](&v3, sel__resetGestureRecognizer);
  -[NSMutableSet removeAllObjects](self->_trackedEvents, "removeAllObjects");
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  id v5;
  NSMutableSet *trackedEvents;
  NSMutableSet *v7;
  NSMutableSet *v8;

  v5 = a4;
  trackedEvents = self->_trackedEvents;
  if (!trackedEvents)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8 = self->_trackedEvents;
    self->_trackedEvents = v7;

    trackedEvents = self->_trackedEvents;
  }
  -[NSMutableSet addObject:](trackedEvents, "addObject:", v5);

  return 1;
}

- (int64_t)_modifierFlags
{
  int64_t v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)_UISingleFingerTapExtensionGesture;
  v3 = -[UIGestureRecognizer _modifierFlags](&v14, sel__modifierFlags);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_trackedEvents;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v3 |= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "_modifierFlags", (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

  return v3;
}

@end
