@implementation WFDrawerDragTracker

- (WFDrawerDragTracker)initWithGestureCoordinator:(id)a3
{
  id v5;
  WFDrawerDragTracker *v6;
  WFDrawerDragTracker *v7;
  WFDrawerDragTracker *v8;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDrawerDragTracker.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gestureCoordinator"));

  }
  v11.receiver = self;
  v11.super_class = (Class)WFDrawerDragTracker;
  v6 = -[WFDrawerDragTracker init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_gestureCoordinator, v5);
    v8 = v7;
  }

  return v7;
}

- (void)beginDragging
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double initialHeight;
  double v8;
  id v9;

  self->_tracking = 1;
  -[WFDrawerDragTracker gestureCoordinator](self, "gestureCoordinator");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "beginDragging");
  objc_msgSend(v9, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDrawerDragTracker currentHeight](self, "currentHeight");
  v5 = v4;
  self->_initialHeight = v4;
  objc_msgSend(v3, "maximumDrawerHeight");
  self->_minTranslationY = v5 - v6;
  initialHeight = self->_initialHeight;
  objc_msgSend(v3, "minimumDrawerHeight");
  self->_maxTranslationY = initialHeight - v8;

}

- (void)endDragging
{
  void *v3;

  if (self->_tracking)
  {
    -[WFDrawerDragTracker gestureCoordinator](self, "gestureCoordinator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDraggingWithAnimation:", 0);

    self->_tracking = 0;
  }
}

- (void)endDraggingWithAnimation:(id)a3
{
  id v4;
  void *v5;

  if (self->_tracking)
  {
    v4 = a3;
    -[WFDrawerDragTracker gestureCoordinator](self, "gestureCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDraggingWithAnimation:", v4);

    self->_tracking = 0;
  }
}

- (void)updateDragForVerticalTranslation:(double)a3
{
  double v5;
  double v6;
  id v7;

  if (self->_tracking)
  {
    -[WFDrawerDragTracker currentHeight](self, "currentHeight");
    v6 = self->_initialHeight - a3 - v5;
    if (v6 != 0.0)
    {
      -[WFDrawerDragTracker gestureCoordinator](self, "gestureCoordinator");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dragTranslatedWithVerticalDelta:", v6);

    }
  }
}

- (double)currentHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[WFDrawerDragTracker gestureCoordinator](self, "gestureCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "drawerHeight");
  v5 = v4;

  return v5;
}

- (double)minTranslationY
{
  return self->_minTranslationY;
}

- (double)maxTranslationY
{
  return self->_maxTranslationY;
}

- (WFDrawerGestureCoordinator)gestureCoordinator
{
  return (WFDrawerGestureCoordinator *)objc_loadWeakRetained((id *)&self->_gestureCoordinator);
}

- (double)initialHeight
{
  return self->_initialHeight;
}

- (BOOL)tracking
{
  return self->_tracking;
}

- (void)setTracking:(BOOL)a3
{
  self->_tracking = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_gestureCoordinator);
}

@end
