@implementation _UIActiveTimer

- (_UIActiveTimer)initWithDuration:(double)a3 updateHandler:(id)a4
{
  id v6;
  _UIActiveTimer *v7;
  CFTimeInterval v8;
  _UIActiveTimer *v9;
  id *v10;
  void *v11;
  id updateHandler;
  void *v13;
  uint64_t v14;
  CADisplayLink *displayLink;
  CADisplayLink *v16;
  void *v17;
  CADisplayLink *v18;
  void *v19;
  _QWORD block[4];
  id v22;
  _QWORD aBlock[4];
  _UIActiveTimer *v24;
  _QWORD v25[3];
  objc_super v26;

  v6 = a4;
  v26.receiver = self;
  v26.super_class = (Class)_UIActiveTimer;
  v7 = -[_UIActiveTimer init](&v26, sel_init);
  if (v7)
  {
    if (a3 <= 0.0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49___UIActiveTimer_initWithDuration_updateHandler___block_invoke_2;
      block[3] = &unk_1E16B1BF8;
      v10 = &v22;
      v22 = v6;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    else
    {
      v8 = CACurrentMediaTime();
      v9 = v7;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __49___UIActiveTimer_initWithDuration_updateHandler___block_invoke;
      aBlock[3] = &unk_1E16C4158;
      *(CFTimeInterval *)&v25[1] = v8;
      *(double *)&v25[2] = a3;
      v10 = (id *)v25;
      v24 = v9;
      v25[0] = v6;
      v11 = _Block_copy(aBlock);
      updateHandler = v9->_updateHandler;
      v9->_updateHandler = v11;

      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "displayLinkWithTarget:selector:", v9, sel__tick_);
      v14 = objc_claimAutoreleasedReturnValue();
      displayLink = v9->_displayLink;
      v9->_displayLink = (CADisplayLink *)v14;

      v16 = v9->_displayLink;
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v16, "addToRunLoop:forMode:", v17, *MEMORY[0x1E0C99860]);

      v18 = v9->_displayLink;
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v18, "addToRunLoop:forMode:", v19, CFSTR("UITrackingRunLoopMode"));

    }
  }

  return v7;
}

- (void)_tick:(id)a3
{
  void (**updateHandler)(void);

  updateHandler = (void (**)(void))self->_updateHandler;
  if (updateHandler)
    updateHandler[2]();
}

- (void)invalidate
{
  CADisplayLink *displayLink;
  id updateHandler;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  updateHandler = self->_updateHandler;
  self->_updateHandler = 0;

}

- (BOOL)isComplete
{
  return self->_updateHandler == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
