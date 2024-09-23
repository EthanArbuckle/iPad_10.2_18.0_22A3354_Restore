@implementation UIInteractionProgress

- (UIInteractionProgress)init
{
  UIInteractionProgress *v2;
  uint64_t v3;
  NSPointerArray *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIInteractionProgress;
  v2 = -[UIInteractionProgress init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSPointerArray *)v3;

    v2->_previousUpdateTime = CACurrentMediaTime();
  }
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[UIInteractionProgress percentComplete](self, "percentComplete");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSPointerArray count](self->_observers, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p - percentComplete: %@, num observers: %@>"), v4, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setPercentComplete:(double)a3
{
  double percentComplete;
  double mostRecentUpdateTime;
  int64_t atLeastTwoUpdates;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  percentComplete = self->_percentComplete;
  self->_percentComplete = a3;
  mostRecentUpdateTime = self->_mostRecentUpdateTime;
  self->_previousPercentComplete = percentComplete;
  self->_previousUpdateTime = mostRecentUpdateTime;
  self->_mostRecentUpdateTime = CACurrentMediaTime();
  atLeastTwoUpdates = self->_atLeastTwoUpdates;
  if (atLeastTwoUpdates <= 1)
    self->_atLeastTwoUpdates = atLeastTwoUpdates + 1;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)-[NSPointerArray copy](self->_observers, "copy", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EDE32790)
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v12, "interactionProgressDidUpdate:", self);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (double)velocity
{
  double result;
  double v3;

  result = 0.0;
  if (self->_atLeastTwoUpdates >= 2)
  {
    v3 = self->_mostRecentUpdateTime - self->_previousUpdateTime;
    if (v3 > 0.000000001)
      return (self->_percentComplete - self->_previousPercentComplete) / v3;
  }
  return result;
}

- (void)endInteraction:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  _BOOL4 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v10 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)-[NSPointerArray copy](self->_observers, "copy");
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
        if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE0CEB88)
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          -[UIInteractionProgress velocity](self, "velocity");
          objc_msgSend(v9, "interactionProgress:didEnd:finalVelocity:", self, v10);
        }
        else if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EDE32790)
               && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v9, "interactionProgress:didEnd:", self, v10);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (unint64_t)_indexOfObserver:(id)a3
{
  id v4;
  NSUInteger v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  v4 = a3;
  v5 = -[NSPointerArray count](self->_observers, "count");
  v6 = v5 - 1;
  if ((uint64_t)(v5 - 1) >= 0)
  {
    v7 = v5;
    while (1)
    {
      -[NSPointerArray pointerAtIndex:](self->_observers, "pointerAtIndex:", --v7);
      v8 = objc_claimAutoreleasedReturnValue();
      if ((id)v8 == v4)
        break;
      v9 = (void *)v8;
      if (!v8)
        -[NSPointerArray removePointerAtIndex:](self->_observers, "removePointerAtIndex:", v7);

      if (v7 <= 0)
      {
        v6 = -1;
        goto LABEL_9;
      }
    }

    v6 = v7;
  }
LABEL_9:
  if (v6 >= 0x7FFFFFFFFFFFFFFFLL)
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v10 = v6;

  return v10;
}

- (void)addProgressObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (-[UIInteractionProgress _indexOfObserver:](self, "_indexOfObserver:") == 0x7FFFFFFFFFFFFFFFLL)
    -[NSPointerArray addPointer:](self->_observers, "addPointer:", v4);

}

- (void)removeProgressObserver:(id)a3
{
  unint64_t v4;

  v4 = -[UIInteractionProgress _indexOfObserver:](self, "_indexOfObserver:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSPointerArray removePointerAtIndex:](self->_observers, "removePointerAtIndex:", v4);
}

- (int64_t)numberOfObservers
{
  -[NSPointerArray compact](self->_observers, "compact");
  return -[NSPointerArray count](self->_observers, "count");
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
