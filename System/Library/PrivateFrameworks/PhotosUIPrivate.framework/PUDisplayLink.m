@implementation PUDisplayLink

- (PUDisplayLink)initWithUpdateHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  PUDisplayLink *v8;
  PUDisplayLink *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUDisplayLink;
  v8 = -[PUDisplayLink init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PUDisplayLink setUpdateHandler:](v8, "setUpdateHandler:", v6);
    -[PUDisplayLink setCompletionHandler:](v9, "setCompletionHandler:", v7);
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", v9, sel__update_);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D7CCE8], "highFramerateRequiresReasonAndRange"))
    {
      objc_msgSend(v10, "setHighFrameRateReason:", 2228228);
      PXFrameRateRangeTypeGetCAFrameRateRange();
      objc_msgSend(v10, "setPreferredFrameRateRange:");
    }
    -[PUDisplayLink setDisplayLink:](v9, "setDisplayLink:", v10);

  }
  return v9;
}

- (void)start
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("PUDisplayLinkStartedNotification"), self);

  -[PUDisplayLink displayLink](self, "displayLink");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addToRunLoop:forMode:", v4, *MEMORY[0x1E0C99860]);

}

- (void)stop
{
  void *v3;
  void (**v4)(void);
  void *v5;

  -[PUDisplayLink completionHandler](self, "completionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUDisplayLink completionHandler](self, "completionHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
  -[PUDisplayLink displayLink](self, "displayLink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[PUDisplayLink setDisplayLink:](self, "setDisplayLink:", 0);
  -[PUDisplayLink setUpdateHandler:](self, "setUpdateHandler:", 0);
  -[PUDisplayLink setCompletionHandler:](self, "setCompletionHandler:", 0);
}

- (void)_update:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  char v6;

  v6 = 0;
  -[PUDisplayLink updateHandler](self, "updateHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PUDisplayLink updateHandler](self, "updateHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, char *))v5)[2](v5, &v6);

    if (v6)
      -[PUDisplayLink stop](self, "stop");
  }
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
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
