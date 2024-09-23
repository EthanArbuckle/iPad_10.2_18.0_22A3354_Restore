@implementation _UIPlatterMenuPanningTransformer

- (_UIPlatterMenuPanningTransformer)initWithAxisTransitionZonePosition:(CGPoint)a3 axisTransitionZoneSize:(CGSize)a4
{
  double height;
  double width;
  double y;
  double x;
  _UIPlatterMenuPanningTransformer *v8;
  _UIPlatterMenuPanningTransformer *v9;
  _UIVelocityIntegrator *v10;
  _UIVelocityIntegrator *velocityIntegrator;
  objc_super v13;

  height = a4.height;
  width = a4.width;
  y = a3.y;
  x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)_UIPlatterMenuPanningTransformer;
  v8 = -[_UIPlatterMenuPanningTransformer init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_overrideLockAxis = 0;
    v8->_transitionZonePosition.x = x;
    v8->_transitionZonePosition.y = y;
    v8->_transitionZoneSize.width = width;
    v8->_transitionZoneSize.height = height;
    v8->_transitionZoneRect.origin.x = round(x - width * 0.5);
    v8->_transitionZoneRect.origin.y = round(y - (height + height) * 0.5);
    v8->_transitionZoneRect.size.width = width;
    v8->_transitionZoneRect.size.height = height + height;
    v10 = objc_alloc_init(_UIVelocityIntegrator);
    velocityIntegrator = v9->_velocityIntegrator;
    v9->_velocityIntegrator = v10;

  }
  return v9;
}

+ (_UIPlatterMenuPanningTransformer)transformerWithAxisTransitionZonePosition:(CGPoint)a3 axisTransitionZoneSize:(CGSize)a4
{
  return (_UIPlatterMenuPanningTransformer *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithAxisTransitionZonePosition:axisTransitionZoneSize:", a3.x, a3.y, a4.width, a4.height);
}

- (double)timeIntervalSinceLastDirectionChange
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[_UIPlatterMenuPanningTransformer timeForLastDirectionalChange](self, "timeForLastDirectionalChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuPanningTransformer timeForLastDirectionalChange](self, "timeForLastDirectionalChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  return v7;
}

- (void)lockIntoYAxis
{
  -[_UIPlatterMenuPanningTransformer setOverrideLockAxis:](self, "setOverrideLockAxis:", 2);
}

- (void)_enterYLockedState
{
  -[_UIPlatterMenuPanningTransformer setAxisLock:](self, "setAxisLock:", 2);
}

- (CGVector)offset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGVector result;

  -[_UIPlatterMenuPanningTransformer transitionZonePosition](self, "transitionZonePosition");
  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v6 = 0.0;
  v8 = v7 == *MEMORY[0x1E0C9D538] && v3 == v5;
  v9 = 0.0;
  if (!v8)
  {
    -[_UIPlatterMenuPanningTransformer lastTransformedPoint](self, "lastTransformedPoint");
    v12 = v11 == v4 && v10 == v5;
    v9 = 0.0;
    if (!v12)
    {
      -[_UIPlatterMenuPanningTransformer transitionZonePosition](self, "transitionZonePosition");
      v14 = v13;
      -[_UIPlatterMenuPanningTransformer lastTransformedPoint](self, "lastTransformedPoint");
      v6 = v14 - v15;
      -[_UIPlatterMenuPanningTransformer transitionZonePosition](self, "transitionZonePosition");
      v17 = v16;
      -[_UIPlatterMenuPanningTransformer lastTransformedPoint](self, "lastTransformedPoint");
      v9 = v17 - v18;
    }
  }
  v19 = v6;
  result.dy = v9;
  result.dx = v19;
  return result;
}

- (CGVector)velocity
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGVector result;

  -[_UIPlatterMenuPanningTransformer velocityIntegrator](self, "velocityIntegrator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "velocity");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.dy = v8;
  result.dx = v7;
  return result;
}

- (void)didBeginPanningWithTouchPosition:(CGPoint)a3 currentTransformedPosition:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  -[_UIPlatterMenuPanningTransformer setLastDirectionChangeTouchPosition:](self, "setLastDirectionChangeTouchPosition:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[_UIPlatterMenuPanningTransformer setPanBeginTouchPosition:](self, "setPanBeginTouchPosition:", v7, v6);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuPanningTransformer setPanBeginTime:](self, "setPanBeginTime:", v9);

  if (-[_UIPlatterMenuPanningTransformer overrideLockAxis](self, "overrideLockAxis"))
    -[_UIPlatterMenuPanningTransformer setAxisLock:](self, "setAxisLock:", -[_UIPlatterMenuPanningTransformer overrideLockAxis](self, "overrideLockAxis"));
  -[_UIPlatterMenuPanningTransformer velocityIntegrator](self, "velocityIntegrator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reset");

  -[_UIPlatterMenuPanningTransformer velocityIntegrator](self, "velocityIntegrator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSample:", v7, v6);

  -[_UIPlatterMenuPanningTransformer setTimeForLastDirectionalChange:](self, "setTimeForLastDirectionalChange:", 0);
  -[_UIPlatterMenuPanningTransformer setLastTransformedPoint:](self, "setLastTransformedPoint:", x, y);
  -[_UIPlatterMenuPanningTransformer setLastTouchPosition:](self, "setLastTouchPosition:", v7, v6);
  -[_UIPlatterMenuPanningTransformer setLastOffset:](self, "setLastOffset:", 0.0, 0.0);
  -[_UIPlatterMenuPanningTransformer delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "panningTransformer:didBeginPanToTransformedPosition:", self, x, y);

}

- (void)didPanWithTouchPosition:(CGPoint)a3 currentTransformedPosition:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  BOOL v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v35;
  double v36;
  double v37;
  double v38;
  int v40;
  uint64_t v41;
  double v42;
  double v43;
  BOOL v44;
  void *v45;
  void *v46;
  unint64_t v47;
  void *v48;
  _BOOL8 v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  _BOOL4 v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  id v65;
  CGPoint v66;
  CGRect v67;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  -[_UIPlatterMenuPanningTransformer lastTouchPosition](self, "lastTouchPosition");
  v10 = v9;
  -[_UIPlatterMenuPanningTransformer lastTouchPosition](self, "lastTouchPosition");
  v12 = v11;
  if (-[_UIPlatterMenuPanningTransformer overrideLockAxis](self, "overrideLockAxis"))
    -[_UIPlatterMenuPanningTransformer setAxisLock:](self, "setAxisLock:", -[_UIPlatterMenuPanningTransformer overrideLockAxis](self, "overrideLockAxis"));
  v13 = v6 - v12;
  v14 = -[_UIPlatterMenuPanningTransformer axisLock](self, "axisLock");
  if (-[_UIPlatterMenuPanningTransformer overrideLockAxis](self, "overrideLockAxis"))
    goto LABEL_4;
  -[_UIPlatterMenuPanningTransformer transitionZoneRect](self, "transitionZoneRect");
  v66.x = x;
  v66.y = y;
  if (!CGRectContainsPoint(v67, v66))
  {
    if (-[_UIPlatterMenuPanningTransformer axisLock](self, "axisLock"))
      goto LABEL_4;
  }
  -[_UIPlatterMenuPanningTransformer panBeginTouchPosition](self, "panBeginTouchPosition");
  v29 = v28;
  v31 = v30;
  -[_UIPlatterMenuPanningTransformer lastDirectionChangeTouchPosition](self, "lastDirectionChangeTouchPosition");
  if (v33 != *MEMORY[0x1E0C9D538] || v32 != *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    -[_UIPlatterMenuPanningTransformer lastDirectionChangeTouchPosition](self, "lastDirectionChangeTouchPosition");
    v29 = v35;
    v31 = v36;
  }
  v37 = v7 - v29 >= 0.0 ? v7 - v29 : -(v7 - v29);
  v38 = v6 - v31 >= 0.0 ? v6 - v31 : -(v6 - v31);
  if (v37 <= 3.0 && v38 <= 3.0)
    goto LABEL_4;
  if (v37 >= 2.22044605e-16)
  {
    if (v38 >= 2.22044605e-16)
    {
      v54 = atan(v38 / v37) / 0.0174532925;
      if (v37 <= v38)
      {
        if (v54 > 45.0)
          goto LABEL_42;
      }
      else if (v54 <= 45.0)
      {
        v41 = 1;
        v40 = 1;
        goto LABEL_67;
      }
    }
    else if (v37 > v38)
    {
      v40 = 1;
      v41 = 1;
      goto LABEL_67;
    }
LABEL_80:
    -[_UIPlatterMenuPanningTransformer axisLock](self, "axisLock");
    goto LABEL_4;
  }
  if (v37 > v38)
    goto LABEL_80;
LABEL_42:
  v40 = 0;
  v41 = 2;
LABEL_67:
  if (-[_UIPlatterMenuPanningTransformer axisLock](self, "axisLock") == v41)
    goto LABEL_4;
  v55 = CACurrentMediaTime();
  -[_UIPlatterMenuPanningTransformer lastAxisLockTime](self, "lastAxisLockTime");
  v57 = v55 - v56;
  -[_UIPlatterMenuPanningTransformer lastAxisLockTime](self, "lastAxisLockTime");
  v59 = v57 >= 0.35 || v58 <= 0.0;
  if ((v40 & v59) != 1
    || (-[_UIPlatterMenuPanningTransformer minimumXVelocityForAxisLock](self, "minimumXVelocityForAxisLock"), v60 <= 0.0))
  {
    if (!v59)
      goto LABEL_4;
    goto LABEL_78;
  }
  -[_UIPlatterMenuPanningTransformer velocityIntegrator](self, "velocityIntegrator");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "velocity");
  v63 = v62;

  if (v63 < 0.0)
    v63 = -v63;
  -[_UIPlatterMenuPanningTransformer minimumXVelocityForAxisLock](self, "minimumXVelocityForAxisLock");
  if (v63 >= v64)
  {
LABEL_78:
    -[_UIPlatterMenuPanningTransformer setAxisLock:](self, "setAxisLock:", v41);
    -[_UIPlatterMenuPanningTransformer setLastAxisLockTime:](self, "setLastAxisLockTime:", CACurrentMediaTime());
  }
LABEL_4:
  v15 = y + v13;
  if (-[_UIPlatterMenuPanningTransformer axisLock](self, "axisLock") == 2)
  {
    -[_UIPlatterMenuPanningTransformer transitionZonePosition](self, "transitionZonePosition");
    v17 = v16;
    v18 = 0.0;
  }
  else
  {
    v18 = v7 - v10;
    v17 = x + v18;
    if (-[_UIPlatterMenuPanningTransformer axisLock](self, "axisLock") == 1)
    {
      -[_UIPlatterMenuPanningTransformer transitionZonePosition](self, "transitionZonePosition");
      v15 = v19;
      v13 = 0.0;
    }
  }
  -[_UIPlatterMenuPanningTransformer setLastTouchPosition:](self, "setLastTouchPosition:", v7, v6);
  if (-[_UIPlatterMenuPanningTransformer axisLock](self, "axisLock"))
  {
    -[_UIPlatterMenuPanningTransformer velocityIntegrator](self, "velocityIntegrator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "velocity");
    v22 = v21;
    v24 = v23;

    if (-[_UIPlatterMenuPanningTransformer axisLock](self, "axisLock") == 1)
    {
      v25 = -v22;
      if (v22 >= 0.0)
        v25 = v22;
      if (v25 <= 2.22044605e-16)
        goto LABEL_57;
      v26 = -v18;
      if (v18 >= 0.0)
        v26 = v18;
      v27 = v22 < 0.0 && v18 < 0.0;
      if (v26 <= 2.22044605e-16 || v27 || v22 > 0.0 && v18 > 0.0)
        goto LABEL_57;
    }
    else
    {
      if (-[_UIPlatterMenuPanningTransformer axisLock](self, "axisLock") != 2)
        goto LABEL_57;
      v42 = -v24;
      if (v24 >= 0.0)
        v42 = v24;
      if (v42 <= 2.22044605e-16)
        goto LABEL_57;
      v43 = -v13;
      if (v13 >= 0.0)
        v43 = v13;
      v44 = v24 < 0.0 && v13 < 0.0;
      if (v43 <= 2.22044605e-16 || v44 || v24 > 0.0 && v13 > 0.0)
        goto LABEL_57;
    }
    -[_UIPlatterMenuPanningTransformer setLastDirectionChangeTouchPosition:](self, "setLastDirectionChangeTouchPosition:", v7, v6);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPlatterMenuPanningTransformer setTimeForLastDirectionalChange:](self, "setTimeForLastDirectionalChange:", v45);

    -[_UIPlatterMenuPanningTransformer velocityIntegrator](self, "velocityIntegrator");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "reset");

LABEL_57:
    -[_UIPlatterMenuPanningTransformer setLastOffset:](self, "setLastOffset:", v18, v13);
    -[_UIPlatterMenuPanningTransformer setLastTransformedPoint:](self, "setLastTransformedPoint:", v17, v15);
    v47 = -[_UIPlatterMenuPanningTransformer axisLock](self, "axisLock");
    if (v47 != v14)
    {
      -[_UIPlatterMenuPanningTransformer setLastDirectionChangeTouchPosition:](self, "setLastDirectionChangeTouchPosition:", v7, v6);
      -[_UIPlatterMenuPanningTransformer velocityIntegrator](self, "velocityIntegrator");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "reset");

    }
    v49 = v47 != v14;
    -[_UIPlatterMenuPanningTransformer delegate](self, "delegate");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPlatterMenuPanningTransformer velocityIntegrator](self, "velocityIntegrator");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "velocity");
    objc_msgSend(v50, "panningTransformer:didPanToTransformedPosition:offsetFromPrevious:touchPosition:velocity:didChangeAxis:axisLock:", self, v49, -[_UIPlatterMenuPanningTransformer axisLock](self, "axisLock"), v17, v15, v18, v13, v7, v6, v52, v53);

  }
  -[_UIPlatterMenuPanningTransformer velocityIntegrator](self, "velocityIntegrator");
  v65 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "addSample:", v7, v6);

}

- (void)didEndPanningWithTouchPosition:(CGPoint)a3 currentTransformedPosition:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  id v17;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  -[_UIPlatterMenuPanningTransformer velocityIntegrator](self, "velocityIntegrator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSample:", v7, v6);

  -[_UIPlatterMenuPanningTransformer delegate](self, "delegate");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterMenuPanningTransformer lastOffset](self, "lastOffset");
  v11 = v10;
  v13 = v12;
  -[_UIPlatterMenuPanningTransformer velocityIntegrator](self, "velocityIntegrator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "velocity");
  objc_msgSend(v17, "panningTransformer:didEndPanToTransformedPosition:offsetFromPrevious:velocity:", self, x, y, v11, v13, v15, v16);

}

- (_UIPlatterMenuPanningTransformerDelegate)delegate
{
  return (_UIPlatterMenuPanningTransformerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)minimumXVelocityForAxisLock
{
  return self->_minimumXVelocityForAxisLock;
}

- (void)setMinimumXVelocityForAxisLock:(double)a3
{
  self->_minimumXVelocityForAxisLock = a3;
}

- (CGPoint)transitionZonePosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_transitionZonePosition.x;
  y = self->_transitionZonePosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTransitionZonePosition:(CGPoint)a3
{
  self->_transitionZonePosition = a3;
}

- (CGSize)transitionZoneSize
{
  double width;
  double height;
  CGSize result;

  width = self->_transitionZoneSize.width;
  height = self->_transitionZoneSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTransitionZoneSize:(CGSize)a3
{
  self->_transitionZoneSize = a3;
}

- (CGPoint)lastTouchPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastTouchPosition.x;
  y = self->_lastTouchPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastTouchPosition:(CGPoint)a3
{
  self->_lastTouchPosition = a3;
}

- (CGRect)transitionZoneRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_transitionZoneRect.origin.x;
  y = self->_transitionZoneRect.origin.y;
  width = self->_transitionZoneRect.size.width;
  height = self->_transitionZoneRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTransitionZoneRect:(CGRect)a3
{
  self->_transitionZoneRect = a3;
}

- (unint64_t)axisLock
{
  return self->_axisLock;
}

- (void)setAxisLock:(unint64_t)a3
{
  self->_axisLock = a3;
}

- (unint64_t)overrideLockAxis
{
  return self->_overrideLockAxis;
}

- (void)setOverrideLockAxis:(unint64_t)a3
{
  self->_overrideLockAxis = a3;
}

- (double)lastAxisLockTime
{
  return self->_lastAxisLockTime;
}

- (void)setLastAxisLockTime:(double)a3
{
  self->_lastAxisLockTime = a3;
}

- (CGVector)lastOffset
{
  double dx;
  double dy;
  CGVector result;

  dx = self->_lastOffset.dx;
  dy = self->_lastOffset.dy;
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (void)setLastOffset:(CGVector)a3
{
  self->_lastOffset = a3;
}

- (NSDate)timeForLastDirectionalChange
{
  return self->_timeForLastDirectionalChange;
}

- (void)setTimeForLastDirectionalChange:(id)a3
{
  objc_storeStrong((id *)&self->_timeForLastDirectionalChange, a3);
}

- (CGPoint)lastTransformedPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastTransformedPoint.x;
  y = self->_lastTransformedPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastTransformedPoint:(CGPoint)a3
{
  self->_lastTransformedPoint = a3;
}

- (CGPoint)panBeginTouchPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_panBeginTouchPosition.x;
  y = self->_panBeginTouchPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPanBeginTouchPosition:(CGPoint)a3
{
  self->_panBeginTouchPosition = a3;
}

- (CGPoint)lastDirectionChangeTouchPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastDirectionChangeTouchPosition.x;
  y = self->_lastDirectionChangeTouchPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastDirectionChangeTouchPosition:(CGPoint)a3
{
  self->_lastDirectionChangeTouchPosition = a3;
}

- (NSDate)panBeginTime
{
  return self->_panBeginTime;
}

- (void)setPanBeginTime:(id)a3
{
  objc_storeStrong((id *)&self->_panBeginTime, a3);
}

- (_UIVelocityIntegrator)velocityIntegrator
{
  return self->_velocityIntegrator;
}

- (void)setVelocityIntegrator:(id)a3
{
  objc_storeStrong((id *)&self->_velocityIntegrator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_velocityIntegrator, 0);
  objc_storeStrong((id *)&self->_panBeginTime, 0);
  objc_storeStrong((id *)&self->_timeForLastDirectionalChange, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
