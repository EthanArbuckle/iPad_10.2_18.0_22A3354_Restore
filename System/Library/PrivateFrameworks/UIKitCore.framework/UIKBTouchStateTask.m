@implementation UIKBTouchStateTask

+ (id)touchStateTaskForTouchState:(id)a3 andTask:(id)a4
{
  id v5;
  id v6;
  UIKBTouchStateTask *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[UIKBTouchStateTask initWithTouchState:andTask:]([UIKBTouchStateTask alloc], "initWithTouchState:andTask:", v6, v5);

  return v7;
}

- (UIKBTouchStateTask)initWithTouchState:(id)a3 andTask:(id)a4
{
  id v7;
  id v8;
  UIKBTouchStateTask *v9;
  UIKBTouchStateTask *v10;
  uint64_t v11;
  id task;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIKBTouchStateTask;
  v9 = -[UIKBTouchStateTask init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_touchState, a3);
    v11 = objc_msgSend(v8, "copy");
    task = v10->_task;
    v10->_task = (id)v11;

  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIKBTouchStateTask *v4;
  uint64_t v5;
  id task;

  v4 = objc_alloc_init(UIKBTouchStateTask);
  objc_storeStrong((id *)&v4->_touchState, self->_touchState);
  v5 = objc_msgSend(self->_task, "copy");
  task = v4->_task;
  v4->_task = (id)v5;

  return v4;
}

- (int64_t)compare:(id)a3
{
  id v4;
  int v5;
  void *v6;
  int v7;
  int64_t v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;

  v4 = a3;
  v5 = -[UIKBTouchState phase](self->_touchState, "phase");
  objc_msgSend(v4, "touchState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 - objc_msgSend(v6, "phase");

  if (v7 <= 0)
  {
    if (v7 < 0)
    {
      v8 = -1;
    }
    else
    {
      -[UIKBTouchState timestamp](self->_touchState, "timestamp");
      v10 = v9;
      objc_msgSend(v4, "touchState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timestamp");
      v13 = v10 - v12;

      if (v13 >= 0.0)
        v14 = 0;
      else
        v14 = -1;
      if (v13 > 0.0)
        v8 = 1;
      else
        v8 = v14;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (UIKBTouchState)touchState
{
  return self->_touchState;
}

- (id)task
{
  return self->_task;
}

- (BOOL)isBusy
{
  return self->_isBusy;
}

- (void)setIsBusy:(BOOL)a3
{
  self->_isBusy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_task, 0);
  objc_storeStrong((id *)&self->_touchState, 0);
}

@end
