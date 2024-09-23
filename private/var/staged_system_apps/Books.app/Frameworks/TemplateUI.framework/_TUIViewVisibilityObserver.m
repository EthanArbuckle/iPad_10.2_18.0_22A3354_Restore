@implementation _TUIViewVisibilityObserver

- (_TUIViewVisibilityObserver)initWithView:(id)a3 options:(id)a4 kind:(unint64_t)a5 block:(id)a6
{
  UIView *v10;
  id v11;
  id v12;
  _TUIViewVisibilityObserver *v13;
  _TUIViewVisibilityObserver *v14;
  id v15;
  id block;
  objc_super v18;

  v10 = (UIView *)a3;
  v11 = a4;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_TUIViewVisibilityObserver;
  v13 = -[_TUIViewVisibilityObserver init](&v18, "init");
  v14 = v13;
  if (v13)
  {
    v13->_view = v10;
    objc_storeStrong((id *)&v13->_options, a4);
    v15 = objc_msgSend(v12, "copy");
    block = v14->_block;
    v14->_block = v15;

    v14->_kind = a5;
  }

  return v14;
}

- (void)updatePopoverLayout
{
  (*((void (**)(id, UIView *, BOOL, uint64_t))self->_block + 2))(self->_block, self->_view, self->_computedVisible, 1);
}

- (BOOL)updateVisible:(BOOL)a3 time:(double)a4
{
  int v4;
  int visible;
  double v7;

  v4 = a3;
  visible = self->_visible;
  if (visible == a3)
  {
    -[_TUIViewVisibilityObserver updateTime:](self, "updateTime:", a4);
  }
  else
  {
    self->_visible = a3;
    if (a3)
    {
      self->_time = a4;
      -[TUIVisibilityOptions duration](self->_options, "duration");
      if (v7 == 0.0 && !self->_computedVisible)
      {
        self->_computedVisible = 1;
LABEL_9:
        -[_TUIViewVisibilityObserver _notify](self, "_notify");
      }
    }
    else if (self->_computedVisible)
    {
      self->_computedVisible = 0;
      goto LABEL_9;
    }
  }
  return visible != v4;
}

- (void)updateTime:(double)a3
{
  double time;
  double v6;

  if (self->_visible && !self->_computedVisible)
  {
    time = self->_time;
    -[TUIVisibilityOptions duration](self->_options, "duration");
    if (time + v6 <= a3)
    {
      self->_computedVisible = 1;
      -[_TUIViewVisibilityObserver _notify](self, "_notify");
    }
  }
}

- (BOOL)needsTimer
{
  return self->_visible && !self->_computedVisible;
}

- (void)_notify
{
  (*((void (**)(id, UIView *, BOOL, _QWORD))self->_block + 2))(self->_block, self->_view, self->_computedVisible, 0);
}

- (UIView)view
{
  return self->_view;
}

- (TUIVisibilityOptions)options
{
  return self->_options;
}

- (id)block
{
  return self->_block;
}

- (BOOL)visible
{
  return self->_visible;
}

- (double)time
{
  return self->_time;
}

- (BOOL)computedVisible
{
  return self->_computedVisible;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
