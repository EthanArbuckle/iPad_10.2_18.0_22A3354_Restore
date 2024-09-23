@implementation ISDisplayLink

- (ISDisplayLink)initWithUpdateHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  ISDisplayLink *v8;
  ISDisplayLink *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ISDisplayLink;
  v8 = -[ISDisplayLink init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ISDisplayLink setUpdateHandler:](v8, "setUpdateHandler:", v6);
    -[ISDisplayLink setCompletionHandler:](v9, "setCompletionHandler:", v7);
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", v9, sel__update_);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISDisplayLink setDisplayLink:](v9, "setDisplayLink:", v10);

  }
  return v9;
}

- (void)start
{
  void *v2;
  id v3;

  -[ISDisplayLink displayLink](self, "displayLink");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addToRunLoop:forMode:", v2, *MEMORY[0x1E0C99860]);

}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  id v4;
  CAFrameRateRange v5;

  self->_preferredFramesPerSecond = a3;
  -[ISDisplayLink displayLink](self, "displayLink");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = CAFrameRateRangeMake((float)a3, (float)a3, (float)a3);
  objc_msgSend(v4, "setPreferredFrameRateRange:", *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);

}

- (void)stop
{
  void *v3;
  void (**v4)(void);

  -[ISDisplayLink completionHandler](self, "completionHandler");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v4)
    v4[2]();
  -[ISDisplayLink displayLink](self, "displayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[ISDisplayLink setDisplayLink:](self, "setDisplayLink:", 0);
  -[ISDisplayLink setUpdateHandler:](self, "setUpdateHandler:", 0);
  -[ISDisplayLink setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (void)_callUpdateHandler
{
  uint64_t v3;
  void *v4;
  char v5;

  -[ISDisplayLink updateHandler](self, "updateHandler");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v5 = 0;
    (*(void (**)(uint64_t, char *))(v3 + 16))(v3, &v5);
    if (v5)
      -[ISDisplayLink stop](self, "stop");
  }

}

- (int64_t)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_updateHandler, 0);
}

@end
