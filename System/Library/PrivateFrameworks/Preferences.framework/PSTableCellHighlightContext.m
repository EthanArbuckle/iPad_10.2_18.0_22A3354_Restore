@implementation PSTableCellHighlightContext

+ (PSTableCellHighlightContext)contextWithCell:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setCell:", v4);

  return (PSTableCellHighlightContext *)v5;
}

- (void)dealloc
{
  objc_super v3;

  -[PSTableCellHighlightContext _killTimer](self, "_killTimer");
  v3.receiver = self;
  v3.super_class = (Class)PSTableCellHighlightContext;
  -[PSTableCellHighlightContext dealloc](&v3, sel_dealloc);
}

- (void)performHighlightForDuration:(double)a3 animateUnhighlight:(BOOL)a4
{
  id WeakRetained;
  id v8;
  id v9;
  NSTimer *v10;
  NSTimer *timer;

  -[PSTableCellHighlightContext _killTimer](self, "_killTimer");
  self->_animateUnhighlight = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  self->_originalSelectionStyle = objc_msgSend(WeakRetained, "selectionStyle");

  self->_valid = 1;
  v8 = objc_loadWeakRetained((id *)&self->_cell);
  objc_msgSend(v8, "setSelectionStyle:", 3);

  v9 = objc_loadWeakRetained((id *)&self->_cell);
  objc_msgSend(v9, "setHighlighted:animated:", 1, 0);

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__timerFired, 0, 0, a3);
  v10 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  timer = self->_timer;
  self->_timer = v10;

}

- (void)_timerFired
{
  void (**v3)(_QWORD);
  _BOOL4 animateUnhighlight;
  id WeakRetained;
  void *v6;
  id v7;
  double v8;
  double v9;
  dispatch_time_t v10;
  _QWORD v11[5];

  if (self->_valid)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __42__PSTableCellHighlightContext__timerFired__block_invoke;
    v11[3] = &unk_1E4A654F0;
    v11[4] = self;
    v3 = (void (**)(_QWORD))MEMORY[0x1A8594D10](v11, a2);
    animateUnhighlight = self->_animateUnhighlight;
    WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
    v6 = WeakRetained;
    if (animateUnhighlight)
    {
      objc_msgSend(WeakRetained, "setHighlighted:animated:", 0, 1);

      v7 = objc_loadWeakRetained((id *)&self->_cell);
      objc_msgSend(v7, "selectionFadeDuration");
      v9 = v8;

      v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
      dispatch_after(v10, MEMORY[0x1E0C80D38], v3);
    }
    else
    {
      objc_msgSend(WeakRetained, "setHighlighted:animated:", 0, 0);

      v3[2](v3);
    }

  }
  -[PSTableCellHighlightContext _killTimer](self, "_killTimer");
}

void __42__PSTableCellHighlightContext__timerFired__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 17))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 24));
    v4 = objc_msgSend(WeakRetained, "selectionStyle");

    if (v4 == 3)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(v5 + 32);
      v7 = objc_loadWeakRetained((id *)(v5 + 24));
      objc_msgSend(v7, "setSelectionStyle:", v6);

    }
  }
}

- (void)invalidate
{
  -[PSTableCellHighlightContext _killTimer](self, "_killTimer");
  self->_valid = 0;
}

- (void)_killTimer
{
  NSTimer *timer;

  -[NSTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

}

- (UITableViewCell)cell
{
  return (UITableViewCell *)objc_loadWeakRetained((id *)&self->_cell);
}

- (void)setCell:(id)a3
{
  objc_storeWeak((id *)&self->_cell, a3);
}

- (BOOL)animateUnhighlight
{
  return self->_animateUnhighlight;
}

- (int64_t)originalSelectionStyle
{
  return self->_originalSelectionStyle;
}

- (void)setOriginalSelectionStyle:(int64_t)a3
{
  self->_originalSelectionStyle = a3;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cell);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
