@implementation _UIFocusMoveTest

- (_UIFocusMoveTest)initWithIdentifier:(id)a3
{
  _UIFocusMoveTest *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIFocusMoveTest;
  result = -[_UIFocusTest initWithIdentifier:](&v4, sel_initWithIdentifier_, a3);
  if (result)
  {
    result->_numberOfIterations = 1;
    result->_maximumMovesPerIteration = -1;
    result->_movementDelay = 0.0;
    result->_movementHeading = 8;
    result->_resetsFocusBeforeIterations = 1;
  }
  return result;
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFocusMoveTest;
  -[_UIFocusTest reset](&v3, sel_reset);
  self->_activeNumberOfIterations = 0;
  self->_currentMove = 0;
  self->_currentIteration = 0;
}

- (void)prepareWithCompletionHandler:(id)a3
{
  void *v5;
  void *v6;
  void (**v7)(void);

  v7 = (void (**)(void))a3;
  -[_UIFocusMoveTest containerFocusEnvironment](self, "containerFocusEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMoveTest.m"), 69, CFSTR("Focus move test must having a container focus environment before being run."));

  }
  self->_activeNumberOfIterations = -[_UIFocusMoveTest _dataSourceNumberOfIterations](self, "_dataSourceNumberOfIterations");
  v7[2]();

}

- (void)main
{
  if (self->_activeNumberOfIterations)
    -[_UIFocusMoveTest _performFocusMovementAfterDelayForMove:iteration:](self, "_performFocusMovementAfterDelayForMove:iteration:", 0, 0);
}

- (void)_performFocusMovementAfterDelayForMove:(unint64_t)a3 iteration:(unint64_t)a4
{
  double v7;
  double v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[_UIFocusMoveTest _dataSourceDelayBeforeMove:duringIteration:](self, "_dataSourceDelayBeforeMove:duringIteration:");
  v8 = v7;
  if (!a3)
  {
    -[_UIFocusMoveTest _resetFocusIfNecessaryBeforeIteration:](self, "_resetFocusIfNecessaryBeforeIteration:", a4);
    -[_UIFocusMoveTest _notifyDelegateWillStartIteration:](self, "_notifyDelegateWillStartIteration:", a4);
  }
  self->_currentMove = a3;
  self->_currentIteration = a4;
  v10[0] = *MEMORY[0x1E0C99860];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusMoveTest performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__performFocusMovement, 0, v9, v8);

}

- (void)_performFocusMovement
{
  unint64_t currentMove;
  unint64_t currentIteration;
  unint64_t v5;
  id WeakRetained;
  unint64_t v7;
  void *v8;
  void *v9;
  _UIFocusMovementRequest *v10;
  void *v11;
  unsigned int v12;
  unint64_t v13;
  id v14;

  if (-[_UIFocusTest state](self, "state") == 2)
  {
    currentMove = self->_currentMove;
    currentIteration = self->_currentIteration;
    v5 = -[_UIFocusMoveTest _dataSourceMaximumNumberOfMovesDuringIteration:](self, "_dataSourceMaximumNumberOfMovesDuringIteration:", currentIteration);
    WeakRetained = objc_loadWeakRetained((id *)&self->_containerFocusEnvironment);
    +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", WeakRetained);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v7 = -[_UIFocusMoveTest _dataSourceHeadingForMove:duringIteration:](self, "_dataSourceHeadingForMove:duringIteration:", currentMove, currentIteration);
    objc_msgSend((id)UIApp, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[_UIFocusMovementRequest initWithFocusSystem:]([_UIFocusMovementRequest alloc], "initWithFocusSystem:", v14);
    +[_UIFocusMovementInfo _movementWithHeading:isInitial:](_UIFocusMovementInfo, "_movementWithHeading:isInitial:", v7, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFocusMovementRequest setMovementInfo:](v10, "setMovementInfo:", v11);

    -[_UIFocusMoveTest _notifyDelegateWillMoveFocusAlongHeading:forMove:duringIteration:](self, "_notifyDelegateWillMoveFocusAlongHeading:forMove:duringIteration:", v7, currentMove, currentIteration);
    v12 = objc_msgSend(v14, "_performFocusMovement:", v10);
    -[_UIFocusMoveTest _notifyDelegateDidMoveFocusAlongHeading:forMove:duringIteration:](self, "_notifyDelegateDidMoveFocusAlongHeading:forMove:duringIteration:", v7, currentMove, currentIteration);
    if (!v12 || (v13 = currentMove + v12, v13 == v5))
    {
      -[_UIFocusMoveTest _notifyDelegateDidFinishIteration:](self, "_notifyDelegateDidFinishIteration:", ++currentIteration);
      v13 = 0;
    }
    if (currentIteration == self->_activeNumberOfIterations)
      -[_UIFocusTest stop](self, "stop", v13);
    else
      -[_UIFocusMoveTest _performFocusMovementAfterDelayForMove:iteration:](self, "_performFocusMovementAfterDelayForMove:iteration:", v13, currentIteration);

  }
}

- (void)_resetFocusIfNecessaryBeforeIteration:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  if (-[_UIFocusMoveTest _dataSourceShouldResetFocusBeforeIteration:](self, "_dataSourceShouldResetFocusBeforeIteration:", a3))
  {
    -[_UIFocusMoveTest containerFocusEnvironment](self, "containerFocusEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[_UIFocusMoveTest containerFocusEnvironment](self, "containerFocusEnvironment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requestFocusUpdateToEnvironment:", v5);

    objc_msgSend(v6, "updateFocusIfNeeded");
  }
}

- (_UIFocusMoveTestDelegate)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFocusMoveTest;
  -[_UIFocusTest delegate](&v3, sel_delegate);
  return (_UIFocusMoveTestDelegate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  objc_super v10;

  v4 = a3;
  -[_UIFocusMoveTest delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v10.receiver = self;
  v10.super_class = (Class)_UIFocusMoveTest;
  -[_UIFocusTest setDelegate:](&v10, sel_setDelegate_, v4);
  if (v5 != v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 2;
    else
      v6 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 4;
    else
      v7 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 8;
    else
      v8 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 16;
    else
      v9 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v9;
  }

}

- (void)_notifyDelegateWillStartIteration:(unint64_t)a3
{
  void *v5;
  id v6;

  -[_UIFocusMoveTest delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (*(_WORD *)&self->_flags & 2) != 0)
  {
    v6 = v5;
    objc_msgSend(v5, "_focusMoveTest:willStartIteration:", self, a3);
    v5 = v6;
  }

}

- (void)_notifyDelegateDidFinishIteration:(unint64_t)a3
{
  void *v5;
  id v6;

  -[_UIFocusMoveTest delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (*(_WORD *)&self->_flags & 4) != 0)
  {
    v6 = v5;
    objc_msgSend(v5, "_focusMoveTest:didFinishIteration:", self, a3);
    v5 = v6;
  }

}

- (void)_notifyDelegateWillMoveFocusAlongHeading:(unint64_t)a3 forMove:(unint64_t)a4 duringIteration:(unint64_t)a5
{
  void *v9;
  id v10;

  -[_UIFocusMoveTest delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (*(_WORD *)&self->_flags & 8) != 0)
  {
    v10 = v9;
    objc_msgSend(v9, "_focusMoveTest:willMoveFocusAlongHeading:forMove:duringIteration:", self, a3, a4, a5);
    v9 = v10;
  }

}

- (void)_notifyDelegateDidMoveFocusAlongHeading:(unint64_t)a3 forMove:(unint64_t)a4 duringIteration:(unint64_t)a5
{
  void *v9;
  id v10;

  -[_UIFocusMoveTest delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (*(_WORD *)&self->_flags & 0x10) != 0)
  {
    v10 = v9;
    objc_msgSend(v9, "_focusMoveTest:didMoveFocusAlongHeading:forMove:duringIteration:", self, a3, a4, a5);
    v9 = v10;
  }

}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 32;
    else
      v5 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 64;
    else
      v6 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 128;
    else
      v7 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 256;
    else
      v8 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 512;
    else
      v9 = 0;
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFDFF | v9;
  }

}

- (unint64_t)_dataSourceNumberOfIterations
{
  unint64_t v3;
  void *v4;
  void *v5;

  v3 = -[_UIFocusMoveTest numberOfIterations](self, "numberOfIterations");
  -[_UIFocusMoveTest dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (*(_WORD *)&self->_flags & 0x20) != 0)
    v3 = objc_msgSend(v4, "_numberOfIterationsInFocusMoveTest:", self);

  return v3;
}

- (unint64_t)_dataSourceMaximumNumberOfMovesDuringIteration:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;

  v5 = -[_UIFocusMoveTest maximumMovesPerIteration](self, "maximumMovesPerIteration");
  -[_UIFocusMoveTest dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (*(_WORD *)&self->_flags & 0x40) != 0)
    v5 = objc_msgSend(v6, "_focusMoveTest:maximumNumberOfMovesDuringIteration:", self, a3);

  return v5;
}

- (double)_dataSourceDelayBeforeMove:(unint64_t)a3 duringIteration:(unint64_t)a4
{
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;

  -[_UIFocusMoveTest movementDelay](self, "movementDelay");
  v8 = v7;
  -[_UIFocusMoveTest dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && (*(_WORD *)&self->_flags & 0x80) != 0)
  {
    objc_msgSend(v9, "_focusMoveTest:delayBeforeMove:duringIteration:", self, a3, a4);
    v8 = v11;
  }

  return v8;
}

- (unint64_t)_dataSourceHeadingForMove:(unint64_t)a3 duringIteration:(unint64_t)a4
{
  unint64_t v7;
  void *v8;
  void *v9;

  v7 = -[_UIFocusMoveTest movementHeading](self, "movementHeading");
  -[_UIFocusMoveTest dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && (*(_WORD *)&self->_flags & 0x100) != 0)
    v7 = objc_msgSend(v8, "_focusMoveTest:headingForMove:duringIteration:", self, a3, a4);

  return v7;
}

- (BOOL)_dataSourceShouldResetFocusBeforeIteration:(unint64_t)a3
{
  char v5;
  void *v6;
  void *v7;

  v5 = -[_UIFocusMoveTest resetsFocusBeforeIterations](self, "resetsFocusBeforeIterations");
  -[_UIFocusMoveTest dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (*(_WORD *)&self->_flags & 0x200) != 0)
    v5 = objc_msgSend(v6, "_focusMoveTest:shouldResetFocusBeforeIteration:", self, a3);

  return v5;
}

- (UIFocusEnvironment)containerFocusEnvironment
{
  return (UIFocusEnvironment *)objc_loadWeakRetained((id *)&self->_containerFocusEnvironment);
}

- (void)setContainerFocusEnvironment:(id)a3
{
  objc_storeWeak((id *)&self->_containerFocusEnvironment, a3);
}

- (unint64_t)numberOfIterations
{
  return self->_numberOfIterations;
}

- (void)setNumberOfIterations:(unint64_t)a3
{
  self->_numberOfIterations = a3;
}

- (unint64_t)maximumMovesPerIteration
{
  return self->_maximumMovesPerIteration;
}

- (void)setMaximumMovesPerIteration:(unint64_t)a3
{
  self->_maximumMovesPerIteration = a3;
}

- (double)movementDelay
{
  return self->_movementDelay;
}

- (void)setMovementDelay:(double)a3
{
  self->_movementDelay = a3;
}

- (unint64_t)movementHeading
{
  return self->_movementHeading;
}

- (void)setMovementHeading:(unint64_t)a3
{
  self->_movementHeading = a3;
}

- (BOOL)resetsFocusBeforeIterations
{
  return self->_resetsFocusBeforeIterations;
}

- (void)setResetsFocusBeforeIterations:(BOOL)a3
{
  self->_resetsFocusBeforeIterations = a3;
}

- (_UIFocusMoveTestDataSource)dataSource
{
  return (_UIFocusMoveTestDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_containerFocusEnvironment);
}

@end
