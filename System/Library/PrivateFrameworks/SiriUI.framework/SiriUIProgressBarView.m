@implementation SiriUIProgressBarView

- (SiriUIProgressBarView)initWithFrame:(CGRect)a3
{
  SiriUIProgressBarView *v3;
  id v4;
  uint64_t v5;
  UIView *progressBar;
  UIView *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SiriUIProgressBarView;
  v3 = -[SiriUIProgressBarView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6F90]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    progressBar = v3->_progressBar;
    v3->_progressBar = (UIView *)v5;

    v7 = v3->_progressBar;
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colorWithAlphaComponent:", 0.3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v9);

    -[SiriUIProgressBarView addSubview:](v3, "addSubview:", v3->_progressBar);
    -[SiriUIProgressBarView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    v3->_progressState = 0;
  }
  return v3;
}

- (void)layoutSubviews
{
  unint64_t progressState;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriUIProgressBarView;
  -[SiriUIProgressBarView layoutSubviews](&v4, sel_layoutSubviews);
  -[SiriUIProgressBarView bounds](self, "bounds");
  progressState = self->_progressState;
  if (progressState != 1)
    -[UIView setFrame:](self->_progressBar, "setFrame:");
}

- (void)beginProgressAnimationWithDuration:(double)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  if (!self->_progressState)
  {
    self->_progressState = 1;
    v3[4] = self;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __60__SiriUIProgressBarView_beginProgressAnimationWithDuration___block_invoke;
    v4[3] = &unk_24D7D91F8;
    v4[4] = self;
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __60__SiriUIProgressBarView_beginProgressAnimationWithDuration___block_invoke_2;
    v3[3] = &unk_24D7D9270;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v4, v3, a3);
  }
}

uint64_t __60__SiriUIProgressBarView_beginProgressAnimationWithDuration___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[52];
  objc_msgSend(v1, "bounds");
  return objc_msgSend(v2, "setFrame:");
}

uint64_t __60__SiriUIProgressBarView_beginProgressAnimationWithDuration___block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 424) = 2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBar, 0);
}

@end
