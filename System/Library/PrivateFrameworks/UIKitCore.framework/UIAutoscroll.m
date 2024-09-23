@implementation UIAutoscroll

- (void)dealloc
{
  objc_super v3;

  -[UIAutoscroll invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)UIAutoscroll;
  -[UIAutoscroll dealloc](&v3, sel_dealloc);
}

- (BOOL)startAutoscroll:(id)a3 scrollContainer:(id)a4 point:(CGPoint)a5 directions:(int)a6 repeatInterval:(double)a7
{
  uint64_t v8;
  double y;
  double x;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  id v25;
  double v26;
  double v27;
  BOOL v28;
  char v30;
  void *v31;
  NSTimer *m_timer;
  NSTimer *v33;
  NSTimer *v34;
  void *v35;

  v8 = *(_QWORD *)&a6;
  y = a5.y;
  x = a5.x;
  v13 = a3;
  v14 = a4;
  -[UIAutoscroll scrollContainer](self, "scrollContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAutoscroll point](self, "point");
  objc_msgSend(v15, "convertPoint:toView:", 0);
  v17 = v16;
  v19 = v18;

  objc_msgSend(v14, "convertPoint:toView:", 0, x, y);
  if (!self->m_timer)
    goto LABEL_10;
  v22 = v20;
  v23 = v21;
  -[UIAutoscroll target](self, "target");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (v24 != v13)
  {
LABEL_9:

    goto LABEL_10;
  }
  -[UIAutoscroll scrollContainer](self, "scrollContainer");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if (v25 != v14
    || sqrt((v22 - v17) * (v22 - v17) + (v23 - v19) * (v23 - v19)) >= 70.0
    || -[UIAutoscroll directions](self, "directions") != (_DWORD)v8)
  {

    v24 = v13;
    goto LABEL_9;
  }
  -[UIAutoscroll repeatInterval](self, "repeatInterval");
  v27 = v26;

  if (v27 == a7)
  {
    -[UIAutoscroll setPoint:](self, "setPoint:", x, y);
    v28 = 1;
    goto LABEL_13;
  }
LABEL_10:
  if ((objc_opt_respondsToSelector() & 1) == 0 || -[UIAutoscroll disabled](self, "disabled"))
    goto LABEL_12;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v30 = objc_msgSend(v14, "shouldAutoscroll");
    if (!v14 || (v30 & 1) == 0)
      goto LABEL_12;
  }
  else if (!v14)
  {
LABEL_12:
    -[UIAutoscroll invalidate](self, "invalidate");
    v28 = 0;
    goto LABEL_13;
  }
  if (!(_DWORD)v8 || a7 == 0.0)
    goto LABEL_12;
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", 0.0);
  m_timer = self->m_timer;
  if (m_timer)
  {
    -[NSTimer setFireDate:](m_timer, "setFireDate:", v31);
  }
  else
  {
    v33 = (NSTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E88]), "initWithFireDate:interval:target:selector:userInfo:repeats:", v31, self, sel_timerFired_, 0, 1, a7);
    v34 = self->m_timer;
    self->m_timer = v33;

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addTimer:forMode:", self->m_timer, *MEMORY[0x1E0C99748]);

  }
  if (-[UIAutoscroll directions](self, "directions") != (_DWORD)v8)
    -[UIAutoscroll setCount:](self, "setCount:", 0);
  -[UIAutoscroll setTarget:](self, "setTarget:", v13);
  -[UIAutoscroll setScrollContainer:](self, "setScrollContainer:", v14);
  -[UIAutoscroll setPoint:](self, "setPoint:", x, y);
  -[UIAutoscroll setDirections:](self, "setDirections:", v8);
  -[UIAutoscroll setRepeatInterval:](self, "setRepeatInterval:", a7);
  v28 = 1;
  -[UIAutoscroll setActive:](self, "setActive:", 1);

LABEL_13:
  return v28;
}

- (void)invalidate
{
  NSTimer *m_timer;
  NSTimer *v5;

  if (pthread_main_np())
  {
    m_timer = self->m_timer;
    if (m_timer)
    {
      self->m_timer = 0;
      v5 = m_timer;

      -[NSTimer invalidate](v5, "invalidate");
    }
    -[UIAutoscroll setTarget:](self, "setTarget:", 0);
    -[UIAutoscroll setPoint:](self, "setPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    -[UIAutoscroll setScrollContainer:](self, "setScrollContainer:", 0);
    -[UIAutoscroll setDirections:](self, "setDirections:", 0);
    -[UIAutoscroll setRepeatInterval:](self, "setRepeatInterval:", 0.0);
    -[UIAutoscroll setActive:](self, "setActive:", 0);
    -[UIAutoscroll setCount:](self, "setCount:", 0);
  }
  else
  {
    -[UIAutoscroll performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

- (void)timerFired:(id)a3
{
  id v4;

  -[UIAutoscroll target](self, "target", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIAutoscroll setCount:](self, "setCount:", -[UIAutoscroll count](self, "count") + 1);
    objc_msgSend(v4, "updateAutoscroll:", self);
  }
  else
  {
    -[UIAutoscroll invalidate](self, "invalidate");
  }

}

- (UIAutoscrollContainer)scrollContainer
{
  return self->m_scrollContainer;
}

- (void)setScrollContainer:(id)a3
{
  objc_storeStrong((id *)&self->m_scrollContainer, a3);
}

- (CGPoint)point
{
  double x;
  double y;
  CGPoint result;

  x = self->m_point.x;
  y = self->m_point.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  self->m_point = a3;
}

- (int)directions
{
  return self->m_directions;
}

- (void)setDirections:(int)a3
{
  self->m_directions = a3;
}

- (double)repeatInterval
{
  return self->m_repeatInterval;
}

- (void)setRepeatInterval:(double)a3
{
  self->m_repeatInterval = a3;
}

- (unint64_t)count
{
  return self->m_count;
}

- (void)setCount:(unint64_t)a3
{
  self->m_count = a3;
}

- (BOOL)active
{
  return self->m_active;
}

- (void)setActive:(BOOL)a3
{
  self->m_active = a3;
}

- (BOOL)disabled
{
  return self->m_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->m_disabled = a3;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->m_timer, 0);
  objc_storeStrong((id *)&self->m_scrollContainer, 0);
  objc_storeStrong(&self->m_target, 0);
}

@end
