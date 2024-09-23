@implementation UIWheelEvent

- (void)_setHIDEvent:(__IOHIDEvent *)a3
{
  NSMutableArray *v4;
  NSMutableArray *recentScrollEvents;
  int64_t lastSubtype;
  double v7;
  double v8;
  void *v9;
  uint64_t IntegerValue;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[6];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)UIWheelEvent;
  -[UIEvent _setHIDEvent:](&v17, sel__setHIDEvent_);
  if (-[UIEvent _hidEvent](self, "_hidEvent") && -[UIWheelEvent _canHaveVelocity](self, "_canHaveVelocity"))
  {
    if (!self->_recentScrollEvents)
    {
      v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      recentScrollEvents = self->_recentScrollEvents;
      self->_recentScrollEvents = v4;

    }
    lastSubtype = self->lastSubtype;
    if (lastSubtype != -[UIWheelEvent subtype](self, "subtype"))
    {
      -[NSMutableArray removeAllObjects](self->_recentScrollEvents, "removeAllObjects");
      self->_recentScrollDistance = 0;
      self->lastSubtype = -[UIWheelEvent subtype](self, "subtype");
    }
    -[UIEvent timestamp](self, "timestamp");
    v8 = v7 + -0.5;
    v9 = (void *)-[NSMutableArray copy](self->_recentScrollEvents, "copy");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __29__UIWheelEvent__setHIDEvent___block_invoke;
    v16[3] = &unk_1E16DF198;
    *(double *)&v16[5] = v8;
    v16[4] = self;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v16);
    IntegerValue = IOHIDEventGetIntegerValue();
    self->_recentScrollDistance += IntegerValue;
    v11 = objc_alloc(MEMORY[0x1E0C99D80]);
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[UIEvent timestamp](self, "timestamp");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", IntegerValue);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v11, "initWithObjectsAndKeys:", v13, CFSTR("scrollTimestamp"), v14, CFSTR("scrollAmount"), 0);

    -[NSMutableArray addObject:](self->_recentScrollEvents, "addObject:", v15);
  }
}

void __29__UIWheelEvent__setHIDEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "objectForKey:", CFSTR("scrollTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  if (v8 >= *(double *)(a1 + 40))
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("scrollAmount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeObject:", v11);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) -= v10;
  }

}

- (int64_t)type
{
  return 7;
}

- (int64_t)subtype
{
  -[UIEvent _hidEvent](self, "_hidEvent");
  if (IOHIDEventGetType() != 6)
    return 0;
  -[UIEvent _hidEvent](self, "_hidEvent");
  if (IOHIDEventGetIntegerValue() >= 0)
    return 200;
  else
    return 201;
}

- (void)_sendEventToResponder:(id)a3
{
  objc_msgSend(a3, "_wheelChangedWithEvent:", self);
}

- (BOOL)_canHaveVelocity
{
  return (-[UIWheelEvent subtype](self, "subtype") & 0xFFFFFFFFFFFFFFFELL) == 200;
}

- (double)_wheelVelocity
{
  double result;
  objc_super v4;

  if (-[UIWheelEvent _canHaveVelocity](self, "_canHaveVelocity"))
    return (double)self->_recentScrollDistance + (double)self->_recentScrollDistance;
  v4.receiver = self;
  v4.super_class = (Class)UIWheelEvent;
  -[UIEvent _wheelVelocity](&v4, sel__wheelVelocity);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentScrollEvents, 0);
}

@end
