@implementation _UIColorPickerColorQueue

- (_UIColorPickerColorQueue)init
{
  _UIColorPickerColorQueue *v2;
  void *v3;
  uint64_t v4;
  CADisplayLink *displayLink;
  CADisplayLink *v6;
  void *v7;
  CADisplayLink *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UIColorPickerColorQueue;
  v2 = -[_UIColorPickerColorQueue init](&v11, sel_init);
  if (v2)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayLinkWithTarget:selector:", v2, sel__displayLinkFired);
    v4 = objc_claimAutoreleasedReturnValue();
    displayLink = v2->_displayLink;
    v2->_displayLink = (CADisplayLink *)v4;

    v6 = v2->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v6, "addToRunLoop:forMode:", v7, *MEMORY[0x1E0C99860]);

    v8 = v2->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v8, "addToRunLoop:forMode:", v9, CFSTR("UITrackingRunLoopMode"));

    -[CADisplayLink setPaused:](v2->_displayLink, "setPaused:", 1);
  }
  return v2;
}

- (void)_displayLinkFired
{
  _UIColorPickerColorQueueContainer *latestObject;

  if (self->_latestObject)
  {
    -[_UIColorPickerColorQueue _forwardToDelegate:](self, "_forwardToDelegate:");
    latestObject = self->_latestObject;
    self->_latestObject = 0;

  }
  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 1);
}

- (void)_forwardToDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  -[_UIColorPickerColorQueue delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isVolatile");

  objc_msgSend(v8, "_dequeue_pickerDidSelectColor:colorSpace:isVolatile:", v5, v6, v7);
}

- (void)_pickerDidSelectColor:(id)a3 colorSpace:(id)a4 isVolatile:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _UIColorPickerColorQueueContainer *v10;
  _UIColorPickerColorQueueContainer *latestObject;
  _UIColorPickerColorQueueContainer *v12;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(_UIColorPickerColorQueueContainer);
  -[_UIColorPickerColorQueueContainer setColor:](v10, "setColor:", v9);

  -[_UIColorPickerColorQueueContainer setColorSpace:](v10, "setColorSpace:", v8);
  -[_UIColorPickerColorQueueContainer setIsVolatile:](v10, "setIsVolatile:", v5);
  latestObject = self->_latestObject;
  self->_latestObject = v10;
  v12 = v10;

  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 0);
}

- (_UIColorPickerColorQueueDelegate)delegate
{
  return (_UIColorPickerColorQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (_UIColorPickerColorQueueContainer)latestObject
{
  return self->_latestObject;
}

- (void)setLatestObject:(id)a3
{
  objc_storeStrong((id *)&self->_latestObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestObject, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
