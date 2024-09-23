@implementation _TUIVisibilityUpdate

- (_TUIVisibilityUpdate)initWithTime:(double)a3 flags:(unint64_t)a4 block:(id)a5
{
  id v8;
  _TUIVisibilityUpdate *v9;
  _TUIVisibilityUpdate *v10;
  id v11;
  id block;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_TUIVisibilityUpdate;
  v9 = -[_TUIVisibilityUpdate init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    v9->_time = a3;
    v9->_flags = a4;
    v11 = objc_msgSend(v8, "copy");
    block = v10->_block;
    v10->_block = v11;

  }
  return v10;
}

- (double)time
{
  return self->_time;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
