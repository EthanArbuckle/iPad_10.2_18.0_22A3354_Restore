@implementation STDebouncer

- (STDebouncer)initWithMinCoalescenceInterval:(double)a3 maxCoalescenceInterval:(double)a4
{
  STDebouncer *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STDebouncer;
  result = -[STDebouncer init](&v7, sel_init);
  if (result)
  {
    result->_minCoalescenceInterval = a3;
    result->_maxCoalescenceInterval = a4;
  }
  return result;
}

- (void)bounce:(id)a3
{
  void *v5;
  id v6;

  v5 = (void *)MEMORY[0x1E0CB3978];
  v6 = a3;
  if ((objc_msgSend(v5, "isMainThread") & 1) != 0)
  {
    -[STDebouncer setValue:](self, "setValue:", v6);

    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__idle, 0);
    -[STDebouncer minCoalescenceInterval](self, "minCoalescenceInterval");
    -[STDebouncer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__idle, 0);
    -[STDebouncer maxCoalescenceInterval](self, "maxCoalescenceInterval");
    -[STDebouncer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__timeout, 0);
  }
  else
  {
    -[STDebouncer performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, v6, 0);

  }
}

- (void)_idle
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__timeout, 0);
  -[STDebouncer _delegate](self, "_delegate");
}

- (void)_timeout
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__idle, 0);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__timeout, 0);
  -[STDebouncer _delegate](self, "_delegate");
}

- (void)_delegate
{
  void *v3;
  id v4;

  -[STDebouncer delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[STDebouncer value](self, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "debouncer:didDebounce:", self, v3);

  }
}

- (STDebouncerDelegate)delegate
{
  return (STDebouncerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)minCoalescenceInterval
{
  return self->_minCoalescenceInterval;
}

- (void)setMinCoalescenceInterval:(double)a3
{
  self->_minCoalescenceInterval = a3;
}

- (double)maxCoalescenceInterval
{
  return self->_maxCoalescenceInterval;
}

- (void)setMaxCoalescenceInterval:(double)a3
{
  self->_maxCoalescenceInterval = a3;
}

- (id)value
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
