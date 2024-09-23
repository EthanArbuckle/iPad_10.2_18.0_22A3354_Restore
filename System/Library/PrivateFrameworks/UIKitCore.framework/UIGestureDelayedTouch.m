@implementation UIGestureDelayedTouch

- (int64_t)phaseForDelivery
{
  uint64_t v2;

  v2 = 40;
  if (!self->_clonedForSecondDelivery)
    v2 = 32;
  return objc_msgSend(*(id *)((char *)&self->super.isa + v2), "phase");
}

- (uint64_t)saveCurrentTouchState
{
  uint64_t v1;
  UITouch *v2;
  void *v3;

  if (result)
  {
    v1 = result;
    v2 = objc_alloc_init(UITouch);
    v3 = *(void **)(v1 + 40);
    *(_QWORD *)(v1 + 40) = v2;

    return objc_msgSend(*(id *)(v1 + 40), "_loadStateFromTouch:", *(_QWORD *)(v1 + 24));
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIGestureDelayedTouch *v4;
  UITouch *v5;
  UITouch *stateWhenDelayed;
  UITouch *v7;

  v4 = -[UIGestureDelayedTouch init](+[UIGestureDelayedTouch allocWithZone:](UIGestureDelayedTouch, "allocWithZone:", a3), "init");
  v5 = objc_alloc_init(UITouch);
  objc_storeStrong((id *)&v4->_touch, self->_touch);
  objc_storeStrong((id *)&v4->_event, self->_event);
  stateWhenDelayed = v4->_stateWhenDelayed;
  v4->_stateWhenDelayed = v5;
  v7 = v5;

  v4->_clonedForSecondDelivery = self->_clonedForSecondDelivery;
  -[UITouch _loadStateFromTouch:](v7, "_loadStateFromTouch:", self->_stateWhenDelayed);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_stateWhenDelivered, 0);
  objc_storeStrong((id *)&self->_stateWhenDelayed, 0);
  objc_storeStrong((id *)&self->_touch, 0);
}

- (double)timestampForDelivery
{
  uint64_t v2;
  double result;

  v2 = 40;
  if (!self->_clonedForSecondDelivery)
    v2 = 32;
  objc_msgSend(*(id *)((char *)&self->super.isa + v2), "timestamp");
  return result;
}

- (id)initWithEvent:(void *)a3 touch:
{
  id v6;
  id v7;
  id *v8;
  UITouch *v9;
  id v10;
  objc_super v12;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)UIGestureDelayedTouch;
    v8 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 6, a2);
      objc_storeStrong(a1 + 3, a3);
      v9 = objc_alloc_init(UITouch);
      v10 = a1[4];
      a1[4] = v9;

    }
  }

  return a1;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  UITouch *touch;
  void *v6;
  UITouch *v7;
  objc_class *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  UITouch *stateWhenDelivered;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  touch = self->_touch;
  if (touch)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = touch;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p>"), v9, v7);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = CFSTR("(nil)");
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; touch = %@"), v4, self, v10);

  if (self->_clonedForSecondDelivery)
    objc_msgSend(v3, "appendString:", CFSTR("; clone = YES"));
  -[UITouch _phaseDescription](self->_stateWhenDelayed, "_phaseDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; delayed phase = %@"), v11);

  if (self->_clonedForSecondDelivery)
  {
    stateWhenDelivered = self->_stateWhenDelivered;
    if (stateWhenDelivered)
    {
      -[UITouch _phaseDescription](stateWhenDelivered, "_phaseDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("; current phase = %@"), v13);

    }
  }
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

@end
