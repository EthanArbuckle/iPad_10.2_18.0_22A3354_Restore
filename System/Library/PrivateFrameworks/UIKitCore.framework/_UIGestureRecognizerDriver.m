@implementation _UIGestureRecognizerDriver

- (_UIGestureRecognizerDriver)init
{
  _UIGestureRecognizerDriver *v2;
  objc_class *v3;
  IMP MethodImplementation;
  objc_class *v5;
  objc_class *v6;
  IMP v7;
  objc_class *v8;
  objc_class *v9;
  IMP v10;
  objc_class *v11;
  objc_class *v12;
  IMP v13;
  objc_class *v14;
  objc_class *v15;
  IMP v16;
  objc_class *v17;
  IMP v18;
  $6FF5F18925EDE1B3D0A1797B7431039E flags;
  int v20;
  char v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)_UIGestureRecognizerDriver;
  v2 = -[_UIGestureRecognizerDriver init](&v23, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v3, sel_touchesBegan_withEvent_);
    v5 = (objc_class *)objc_opt_class();
    *(_BYTE *)&v2->_flags |= MethodImplementation != class_getMethodImplementation(v5, sel_touchesBegan_withEvent_);
    v6 = (objc_class *)objc_opt_class();
    v7 = class_getMethodImplementation(v6, sel_touchesMoved_withEvent_);
    v8 = (objc_class *)objc_opt_class();
    *(_BYTE *)&v2->_flags |= v7 != class_getMethodImplementation(v8, sel_touchesMoved_withEvent_);
    v9 = (objc_class *)objc_opt_class();
    v10 = class_getMethodImplementation(v9, sel_touchesEnded_withEvent_);
    v11 = (objc_class *)objc_opt_class();
    *(_BYTE *)&v2->_flags |= v10 != class_getMethodImplementation(v11, sel_touchesEnded_withEvent_);
    v12 = (objc_class *)objc_opt_class();
    v13 = class_getMethodImplementation(v12, sel_touchesCancelled_withEvent_);
    v14 = (objc_class *)objc_opt_class();
    *(_BYTE *)&v2->_flags |= v13 != class_getMethodImplementation(v14, sel_touchesCancelled_withEvent_);
    v15 = (objc_class *)objc_opt_class();
    v16 = class_getMethodImplementation(v15, sel_transformChangedWithEvent_);
    v17 = (objc_class *)objc_opt_class();
    v18 = class_getMethodImplementation(v17, sel_transformChangedWithEvent_);
    flags = v2->_flags;
    v20 = (*(unsigned int *)&flags >> 1) & 1;
    if (v16 != v18)
      v20 = 1;
    if (v20)
      v21 = 2;
    else
      v21 = 0;
    *(_BYTE *)&v2->_flags = v21 | *(_BYTE *)&flags & 0xFD;
  }
  return v2;
}

- (void)_setState:(int)a3 notifyDelegate:
{
  uint64_t v5;
  id WeakRetained;

  if (a1)
  {
    v5 = *(_QWORD *)(a1 + 8);
    if (v5 != a2 || v5 == 1)
    {
      *(_QWORD *)(a1 + 8) = a2;
      objc_msgSend((id)a1, "didUpdateState:previousState:", a2, v5);
      if (a3)
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
        objc_msgSend(WeakRetained, "_gestureRecognizerDriver:didUpdateState:previousState:", a1, a2, v5);

      }
    }
  }
}

- (int64_t)state
{
  return self->_state;
}

- (void)reset
{
  if (self)
  {
    if (self->_state)
    {
      self->_state = 0;
      -[_UIGestureRecognizerDriver didUpdateState:previousState:](self, "didUpdateState:previousState:", 0);
    }
  }
}

- (void)fail
{
  if (self)
  {
    if (self->_state != 3)
    {
      self->_state = 3;
      -[_UIGestureRecognizerDriver didUpdateState:previousState:](self, "didUpdateState:previousState:", 3);
    }
  }
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  return !objc_msgSend(a3, "type") && (*(_BYTE *)&self->_flags & 1) != 0
      || objc_msgSend(a3, "type") == 14 && (*(_BYTE *)&self->_flags & 2) != 0;
}

- (BOOL)shouldReceiveComponent:(id)a3 withEvent:(id)a4
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIGestureRecognizerDriver;
  -[_UIGestureRecognizerDriver description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
    v5 = self->_state - 1;
    if (v5 > 2)
      v6 = CFSTR("possible");
    else
      v6 = off_1E16D8C90[v5];
    objc_msgSend(v4, "appendFormat:", CFSTR("; state = %@>"), v6);
  }
  return v4;
}

- (_UIGestureRecognizerDriverContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (_UIGestureRecognizerDriverDelegate)delegate
{
  return (_UIGestureRecognizerDriverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
