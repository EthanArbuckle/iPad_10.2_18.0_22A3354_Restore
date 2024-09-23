@implementation _UIPreviewPresentationAnimator

- (_UIPreviewPresentationAnimator)init
{

  return 0;
}

- (_UIPreviewPresentationAnimator)initWithDuration:(double)a3 advanceBlock:(id)a4
{
  id v6;
  _UIPreviewPresentationAnimator *v7;
  _UIPreviewPresentationAnimator *v8;
  void *v9;
  void *v10;
  void *v11;
  _UIPreviewPresentationAnimator *v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UIPreviewPresentationAnimator;
  v7 = -[_UIPreviewPresentationAnimator init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    -[_UIPreviewPresentationAnimator setStartMediaTime:](v7, "setStartMediaTime:", 1.79769313e308);
    -[_UIPreviewPresentationAnimator setDuration:](v8, "setDuration:", a3);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewPresentationAnimator setMediaTimingFunction:](v8, "setMediaTimingFunction:", v9);

    -[_UIPreviewPresentationAnimator setAdvanceBlock:](v8, "setAdvanceBlock:", v6);
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", v8, sel__advanceFromDisplayLink_);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addToRunLoop:forMode:", v11, *MEMORY[0x1E0C99860]);

    -[_UIPreviewPresentationAnimator setDisplayLink:](v8, "setDisplayLink:", v10);
    v12 = v8;

  }
  return v8;
}

- (void)stopAnimation
{
  void *v3;

  -[_UIPreviewPresentationAnimator displayLink](self, "displayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[_UIPreviewPresentationAnimator setDisplayLink:](self, "setDisplayLink:", 0);
  -[_UIPreviewPresentationAnimator setAdvanceBlock:](self, "setAdvanceBlock:", 0);
}

- (void)_advanceFromDisplayLink:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  float v12;
  double v13;
  void (**v14)(double);

  v4 = CACurrentMediaTime();
  -[_UIPreviewPresentationAnimator startMediaTime](self, "startMediaTime");
  v6 = v5;
  if (v5 == 1.79769313e308)
  {
    -[_UIPreviewPresentationAnimator setStartMediaTime:](self, "setStartMediaTime:", v4);
    v6 = v4;
  }
  -[_UIPreviewPresentationAnimator duration](self, "duration");
  v8 = v4 - v6;
  if (v4 - v6 >= v7)
    v8 = v7;
  v9 = v8 / v7;
  -[_UIPreviewPresentationAnimator mediaTimingFunction](self, "mediaTimingFunction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v11 = v9;
  objc_msgSend(v10, "_solveForInput:", v11);
  *(float *)&v9 = v12;
  v13 = v12;

  -[_UIPreviewPresentationAnimator advanceBlock](self, "advanceBlock");
  v14 = (void (**)(double))objc_claimAutoreleasedReturnValue();
  v14[2](v13);

  if (*(float *)&v9 >= 1.0)
    -[_UIPreviewPresentationAnimator stopAnimation](self, "stopAnimation");
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (CAMediaTimingFunction)mediaTimingFunction
{
  return self->_mediaTimingFunction;
}

- (void)setMediaTimingFunction:(id)a3
{
  objc_storeStrong((id *)&self->_mediaTimingFunction, a3);
}

- (double)startMediaTime
{
  return self->_startMediaTime;
}

- (void)setStartMediaTime:(double)a3
{
  self->_startMediaTime = a3;
}

- (id)advanceBlock
{
  return self->_advanceBlock;
}

- (void)setAdvanceBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CADisplayLink)displayLink
{
  return (CADisplayLink *)objc_loadWeakRetained((id *)&self->_displayLink);
}

- (void)setDisplayLink:(id)a3
{
  objc_storeWeak((id *)&self->_displayLink, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_displayLink);
  objc_storeStrong(&self->_advanceBlock, 0);
  objc_storeStrong((id *)&self->_mediaTimingFunction, 0);
}

@end
