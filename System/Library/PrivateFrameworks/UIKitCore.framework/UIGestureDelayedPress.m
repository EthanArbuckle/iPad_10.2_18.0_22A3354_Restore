@implementation UIGestureDelayedPress

- (id)initWithEvent:(void *)a3 press:
{
  id v6;
  id v7;
  id *v8;
  UIPress *v9;
  id v10;
  objc_super v12;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)UIGestureDelayedPress;
    v8 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 6, a2);
      objc_storeStrong(a1 + 3, a3);
      v9 = objc_alloc_init(UIPress);
      v10 = a1[4];
      a1[4] = v9;

    }
  }

  return a1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIGestureDelayedPress *v4;
  UIPress *v5;
  UIPress *stateWhenDelayed;
  UIPress *v7;

  v4 = -[UIGestureDelayedPress init](+[UIGestureDelayedPress allocWithZone:](UIGestureDelayedPress, "allocWithZone:", a3), "init");
  v5 = objc_alloc_init(UIPress);
  objc_storeStrong((id *)&v4->_press, self->_press);
  objc_storeStrong((id *)&v4->_event, self->_event);
  stateWhenDelayed = v4->_stateWhenDelayed;
  v4->_stateWhenDelayed = v5;
  v7 = v5;

  v4->_clonedForSecondDelivery = self->_clonedForSecondDelivery;
  -[UIPress _loadStateFromPress:](v7, "_loadStateFromPress:", self->_stateWhenDelayed);

  return v4;
}

- (uint64_t)saveCurrentPressState
{
  uint64_t v1;
  UIPress *v2;
  void *v3;

  if (result)
  {
    v1 = result;
    v2 = objc_alloc_init(UIPress);
    v3 = *(void **)(v1 + 40);
    *(_QWORD *)(v1 + 40) = v2;

    return objc_msgSend(*(id *)(v1 + 40), "_loadStateFromPress:", *(_QWORD *)(v1 + 24));
  }
  return result;
}

- (int64_t)phaseForDelivery
{
  uint64_t v2;

  v2 = 40;
  if (!self->_clonedForSecondDelivery)
    v2 = 32;
  return objc_msgSend(*(id *)((char *)&self->super.isa + v2), "phase");
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

- (NSString)description
{
  void *v3;
  void *v4;
  UIPress *stateWhenDelivered;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  if (self && self->_clonedForSecondDelivery)
    objc_msgSend(v3, "appendString:", CFSTR("; clone = YES"));
  -[UIPress _phaseDescription](self->_stateWhenDelayed, "_phaseDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; delayed phase = %@"), v4);

  if (self->_clonedForSecondDelivery)
  {
    stateWhenDelivered = self->_stateWhenDelivered;
    if (stateWhenDelivered)
    {
      -[UIPress _phaseDescription](stateWhenDelivered, "_phaseDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("; current phase = %@"), v6);

    }
  }
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_stateWhenDelivered, 0);
  objc_storeStrong((id *)&self->_stateWhenDelayed, 0);
  objc_storeStrong((id *)&self->_press, 0);
}

@end
