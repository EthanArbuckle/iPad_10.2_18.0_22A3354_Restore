@implementation SBPinchInteractionProgress

- (SBPinchInteractionProgress)initWithPinchGesture:(id)a3 minPinchScale:(double)a4
{
  id v7;
  SBPinchInteractionProgress *v8;
  SBPinchInteractionProgress *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBPinchInteractionProgress;
  v8 = -[UIInteractionProgress init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pinchGesture, a3);
    objc_msgSend(v7, "addTarget:action:", v9, sel__handlePinchGesture_);
    v9->_pinchInterval.start.value = 1.0;
    v9->_pinchInterval.start.inclusive = 1;
    *(_DWORD *)(&v9->_pinchInterval.start.inclusive + 1) = 0;
    *((_DWORD *)&v9->_pinchInterval.start.inclusive + 1) = 0;
    v9->_pinchInterval.end.value = a4;
    v9->_pinchInterval.end.inclusive = 1;
    *(_DWORD *)(&v9->_pinchInterval.end.inclusive + 1) = 0;
    *((_DWORD *)&v9->_pinchInterval.end.inclusive + 1) = 0;
    objc_msgSend(v7, "scale");
    -[SBPinchInteractionProgress _updatePinchScale:](v9, "_updatePinchScale:");
  }

  return v9;
}

- (double)minPinchScale
{
  return self->_pinchInterval.end.value;
}

- (void)_handlePinchGesture:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  SBPinchInteractionProgress *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  -[SBPinchInteractionProgress pinchGesture](self, "pinchGesture");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v10;
  if (v4 == v10)
  {
    v6 = objc_msgSend(v10, "state");
    if (v6 == 4)
    {
      objc_msgSend(v10, "removeTarget:action:", self, sel__handlePinchGesture_);
    }
    else
    {
      if (v6 != 3)
      {
        v7 = v6 == 2;
        v5 = v10;
        if (!v7)
          goto LABEL_13;
        objc_msgSend(v10, "scale");
        -[SBPinchInteractionProgress _updatePinchScale:](self, "_updatePinchScale:");
        goto LABEL_12;
      }
      objc_msgSend(v10, "velocity");
      objc_msgSend(v10, "removeTarget:action:", self, sel__handlePinchGesture_);
      if (!BSFloatGreaterThanFloat())
      {
        v8 = self;
        v9 = 1;
        goto LABEL_11;
      }
    }
    v8 = self;
    v9 = 0;
LABEL_11:
    -[UIInteractionProgress endInteraction:](v8, "endInteraction:", v9);
LABEL_12:
    v5 = v10;
  }
LABEL_13:

}

- (void)_updatePinchScale:(double)a3
{
  double v4;
  double v5;
  void *v6;
  $DCA72CBAB2CDF67DA9370D0153CCCF3D start;
  $DCA72CBAB2CDF67DA9370D0153CCCF3D end;

  -[SBPinchInteractionProgress minPinchScale](self, "minPinchScale");
  if (BSFloatGreaterThanFloat())
  {
    start = self->_pinchInterval.start;
    end = self->_pinchInterval.end;
    BSIntervalFractionForValue();
    v5 = v4;
    -[UIInteractionProgress percentComplete](self, "percentComplete", start, end);
    if ((BSFloatEqualToFloat() & 1) == 0)
      -[UIInteractionProgress setPercentComplete:](self, "setPercentComplete:", v5);
  }
  else
  {
    -[SBPinchInteractionProgress pinchGesture](self, "pinchGesture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeTarget:action:", self, sel__handlePinchGesture_);

    -[UIInteractionProgress endInteraction:](self, "endInteraction:", 1);
  }
}

- (UIPinchGestureRecognizer)pinchGesture
{
  return self->_pinchGesture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinchGesture, 0);
}

@end
