@implementation UIGravityBehavior

+ (BOOL)_isPrimitiveBehavior
{
  return 1;
}

- (UIGravityBehavior)init
{
  return -[UIGravityBehavior initWithItems:](self, "initWithItems:", MEMORY[0x1E0C9AA60]);
}

- (UIGravityBehavior)initWithItems:(NSArray *)items
{
  NSArray *v4;
  UIGravityBehavior *v5;
  UIGravityBehavior *v6;
  void *v7;
  objc_super v9;

  v4 = items;
  v9.receiver = self;
  v9.super_class = (Class)UIGravityBehavior;
  v5 = -[UIDynamicBehavior init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_gravity = (CGPoint)xmmword_18666F250;
    v7 = (void *)-[NSArray mutableCopy](v4, "mutableCopy");
    -[UIDynamicBehavior _setItems:](v6, "_setItems:", v7);

  }
  return v6;
}

- (void)_addGravityItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[UIDynamicBehavior _context](self, "_context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_registerBodyForItem:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setUsesPreciseCollisionDetection:", 1);
  objc_msgSend(v6, "setAffectedByGravity:", 1);
  objc_msgSend(v6, "setResting:", 0);

}

- (void)addItem:(id)item
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = item;
  -[UIDynamicBehavior _items](self, "_items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v8);

  if ((v5 & 1) == 0)
  {
    -[UIDynamicBehavior _addItem:](self, "_addItem:", v8);
    -[UIDynamicBehavior _context](self, "_context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[UIGravityBehavior _addGravityItem:](self, "_addGravityItem:", v8);
      -[UIDynamicBehavior _context](self, "_context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_tickle");

    }
  }

}

- (void)removeItem:(id)item
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = item;
  -[UIDynamicBehavior _items](self, "_items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v8);

  if (v5)
  {
    -[UIDynamicBehavior _context](self, "_context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_unregisterBodyForItem:action:", v8, &__block_literal_global_177);

    -[UIDynamicBehavior _context](self, "_context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_tickle");

    -[UIDynamicBehavior _removeItem:](self, "_removeItem:", v8);
  }

}

void __32__UIGravityBehavior_removeItem___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setAffectedByGravity:", 0);
  objc_msgSend(v2, "setResting:", 0);

}

- (CGVector)gravityDirection
{
  double x;
  double y;
  CGVector result;

  x = self->_gravity.x;
  y = self->_gravity.y;
  result.dy = y;
  result.dx = x;
  return result;
}

- (CGPoint)gravity
{
  double x;
  double y;
  CGPoint result;

  x = self->_gravity.x;
  y = self->_gravity.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)denormalizedGravity
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[UIGravityBehavior gravity](self, "gravity");
  v4 = v3 * 10.0;
  -[UIGravityBehavior gravity](self, "gravity");
  v6 = v5 * 10.0;
  v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (double)yComponent
{
  double v2;

  -[UIGravityBehavior gravity](self, "gravity");
  return v2;
}

- (CGFloat)angle
{
  return atan2(self->_gravity.y, self->_gravity.x);
}

- (CGFloat)magnitude
{
  return sqrt(self->_gravity.x * self->_gravity.x + self->_gravity.y * self->_gravity.y);
}

- (void)setAngle:(CGFloat)angle
{
  double v5;

  -[UIGravityBehavior magnitude](self, "magnitude");
  -[UIGravityBehavior setAngle:magnitude:](self, "setAngle:magnitude:", angle, v5);
}

- (void)setMagnitude:(CGFloat)magnitude
{
  -[UIGravityBehavior angle](self, "angle");
  -[UIGravityBehavior setAngle:magnitude:](self, "setAngle:magnitude:");
}

- (void)setXComponent:(double)a3
{
  double v5;

  -[UIGravityBehavior yComponent](self, "yComponent");
  -[UIGravityBehavior setGravity:](self, "setGravity:", a3, v5);
}

- (void)setYComponent:(double)a3
{
  -[UIGravityBehavior xComponent](self, "xComponent");
  -[UIGravityBehavior setGravity:](self, "setGravity:");
}

- (void)_setAngle:(double)a3 magnitude:(double)a4
{
  float v6;
  __float2 v7;

  v6 = a3;
  v7 = __sincosf_stret(v6);
  -[UIGravityBehavior setGravity:](self, "setGravity:", v7.__cosval * a4, v7.__sinval * a4);
}

- (void)setAngle:(CGFloat)angle magnitude:(CGFloat)magnitude
{
  float v6;
  __float2 v7;

  v6 = angle;
  v7 = __sincosf_stret(v6);
  -[UIGravityBehavior setGravity:](self, "setGravity:", v7.__cosval * magnitude, v7.__sinval * magnitude);
}

- (void)setGravity:(CGPoint)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;

  if (a3.x != self->_gravity.x || a3.y != self->_gravity.y)
  {
    self->_gravity = a3;
    -[UIDynamicBehavior _context](self, "_context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_world");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIGravityBehavior gravity](self, "gravity");
    v8 = v7 * 10.0;
    -[UIGravityBehavior gravity](self, "gravity");
    objc_msgSend(v6, "setGravity:", v8, v9 * 10.0);

    -[UIDynamicBehavior _changedParameterForBody:](self, "_changedParameterForBody:", 0);
  }
}

- (NSArray)items
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D20];
  -[UIDynamicBehavior _items](self, "_items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)_associate
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[UIDynamicBehavior _context](self, "_context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_world");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGravityBehavior gravity](self, "gravity");
  v6 = v5 * 10.0;
  -[UIGravityBehavior gravity](self, "gravity");
  objc_msgSend(v4, "setGravity:", v6, v7 * 10.0);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UIDynamicBehavior _items](self, "_items", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[UIGravityBehavior _addGravityItem:](self, "_addGravityItem:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_dissociate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[UIDynamicBehavior _context](self, "_context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_world");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGravity:", 0.0, 0.0);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[UIDynamicBehavior _items](self, "_items", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        -[UIDynamicBehavior _context](self, "_context");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_unregisterBodyForItem:action:", v10, &__block_literal_global_1_11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

uint64_t __32__UIGravityBehavior__dissociate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAffectedByGravity:", 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)UIGravityBehavior;
  -[UIDynamicBehavior description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(self->_gravity);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDynamicBehavior _itemsDescription](self, "_itemsDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
