@implementation UIKeyboardTypingStyleEstimator

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)_setTypingStyleEstimation:(unint64_t)a3
{
  unint64_t v5;
  id WeakRetained;
  char v7;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  NSObject *v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_currentTypingStyle != a3)
  {
    self->_currentTypingStyle = a3;
    v5 = _setTypingStyleEstimation____s_category;
    if (!_setTypingStyleEstimation____s_category)
    {
      v5 = __UILogCategoryGetNode("TypingStyleDebug", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&_setTypingStyleEstimation____s_category);
    }
    if ((*(_BYTE *)v5 & 1) != 0)
    {
      v9 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        if (a3 - 1 > 2)
          v10 = CFSTR("(None)");
        else
          v10 = off_1E16D9260[a3 - 1];
        v12 = 138412290;
        v13 = v10;
        v11 = v9;
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "TypingStyle: guessing %@", (uint8_t *)&v12, 0xCu);

      }
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "typingStyleEstimator:didChangeTypingStyleEstimate:", self, a3);

    }
  }
}

- (void)beganContinuousPath
{
  CFAbsoluteTime Current;

  -[NSTimer invalidate](self->_tapTypingFlipTimer, "invalidate");
  Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_lastContinuousPathEvent < 1.0)
    -[UIKeyboardTypingStyleEstimator _setTypingStyleEstimation:](self, "_setTypingStyleEstimation:", 3);
  self->_lastContinuousPathEvent = Current;
}

- (void)endedContinuousPath
{
  void *v3;
  NSTimer *v4;
  NSTimer *tapTypingFlipTimer;
  _QWORD v6[5];
  id v7;
  id location;

  -[UIKeyboardTypingStyleEstimator _setTypingStyleEstimation:](self, "_setTypingStyleEstimation:", 3);
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0C99E88];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__UIKeyboardTypingStyleEstimator_endedContinuousPath__block_invoke;
  v6[3] = &unk_1E16D9240;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, v6, 1.0);
  v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  tapTypingFlipTimer = self->_tapTypingFlipTimer;
  self->_tapTypingFlipTimer = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __53__UIKeyboardTypingStyleEstimator_endedContinuousPath__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_msgSend(WeakRetained, "currentTypingStyleEstimation");

  if (v3 != 1)
    objc_msgSend(*(id *)(a1 + 32), "_setTypingStyleEstimation:", 2);
}

- (void)cancelContinuousPath
{
  NSTimer *v3;
  NSTimer *tapTypingFlipTimer;
  _QWORD v5[5];
  id location;

  -[UIKeyboardTypingStyleEstimator _setTypingStyleEstimation:](self, "_setTypingStyleEstimation:", 1);
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__UIKeyboardTypingStyleEstimator_cancelContinuousPath__block_invoke;
  v5[3] = &unk_1E16C4358;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v5, 1.0);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  tapTypingFlipTimer = self->_tapTypingFlipTimer;
  self->_tapTypingFlipTimer = v3;

  objc_destroyWeak(&location);
}

uint64_t __54__UIKeyboardTypingStyleEstimator_cancelContinuousPath__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setTypingStyleEstimation:", 2);
}

- (void)tapTypedKey
{
  -[UIKeyboardTypingStyleEstimator _setTypingStyleEstimation:](self, "_setTypingStyleEstimation:", 1);
}

- (unint64_t)currentTypingStyleEstimation
{
  return self->_currentTypingStyle;
}

- (UIKeyboardTypingStyleEstimatorDelegate)delegate
{
  return (UIKeyboardTypingStyleEstimatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tapTypingFlipTimer, 0);
}

@end
