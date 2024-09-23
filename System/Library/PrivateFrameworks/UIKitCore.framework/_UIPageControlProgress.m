@implementation _UIPageControlProgress

- (void)setDelegate:(id)a3
{
  id v4;
  char v5;
  char v6;
  char v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIPageControlProgress;
  v4 = a3;
  -[UIPageControlProgress setDelegate:](&v8, sel_setDelegate_, v4);
  *(_BYTE *)&self->_delegateImplements = *(_BYTE *)&self->_delegateImplements & 0xFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = 2;
  else
    v5 = 0;
  *(_BYTE *)&self->_delegateImplements = *(_BYTE *)&self->_delegateImplements & 0xFD | v5;
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
    v7 = 4;
  else
    v7 = 0;
  *(_BYTE *)&self->_delegateImplements = *(_BYTE *)&self->_delegateImplements & 0xFB | v7;
}

- (void)_progressVisibilityChanged:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UIPageControlProgress;
  -[UIPageControlProgress _progressVisibilityChanged:](&v5, sel__progressVisibilityChanged_);
  if (v3)
    -[_UIPageControlProgress _resumePageProgress](self, "_resumePageProgress");
  else
    -[_UIPageControlProgress _pausePageProgress](self, "_pausePageProgress");
}

- (void)_pausePageProgress
{
  id v3;

  if ((*(_BYTE *)&self->_delegateImplements & 2) != 0)
  {
    -[UIPageControlProgress delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_pageControlProgressDidPause:", self);

  }
}

- (void)_resumePageProgress
{
  id v3;

  if ((*(_BYTE *)&self->_delegateImplements & 4) != 0)
  {
    -[UIPageControlProgress delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_pageControlProgressDidResume:", self);

  }
}

@end
