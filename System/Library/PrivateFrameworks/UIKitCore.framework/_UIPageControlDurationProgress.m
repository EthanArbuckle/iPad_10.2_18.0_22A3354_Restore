@implementation _UIPageControlDurationProgress

- (_UIPageControlDurationProgress)initWithPageDuration:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPageControlDurationProgress;
  return -[UIPageControlTimerProgress initWithPreferredDuration:](&v4, sel_initWithPreferredDuration_, a3);
}

- (void)setDelegate:(id)a3
{
  id v4;
  char v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPageControlDurationProgress;
  v4 = a3;
  -[UIPageControlTimerProgress setDelegate:](&v6, sel_setDelegate_, v4);
  v5 = objc_opt_respondsToSelector();

  *(_BYTE *)&self->_delegateImplements = *(_BYTE *)&self->_delegateImplements & 0xFE | v5 & 1;
}

- (BOOL)_shouldAdvanceToPage:(int64_t)a3
{
  void *v6;
  char v7;
  objc_super v8;

  if ((*(_BYTE *)&self->_delegateImplements & 1) != 0)
  {
    -[UIPageControlProgress delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_pageControlDurationProgress:shouldAdvanceToPage:", self, a3);

    return v7;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIPageControlDurationProgress;
    return -[UIPageControlTimerProgress _shouldAdvanceToPage:](&v8, sel__shouldAdvanceToPage_, a3);
  }
}

@end
