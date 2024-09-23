@implementation UIPushBehavior

+ (BOOL)_isPrimitiveBehavior
{
  return 1;
}

- (UIPushBehavior)init
{
  return -[UIPushBehavior initWithItems:](self, "initWithItems:", 0);
}

- (UIPushBehavior)initWithItems:(NSArray *)items mode:(UIPushBehaviorMode)mode
{
  NSArray *v6;
  UIPushBehavior *v7;
  UIPushBehavior *v8;
  void *v9;
  objc_super v11;

  v6 = items;
  v11.receiver = self;
  v11.super_class = (Class)UIPushBehavior;
  v7 = -[UIDynamicBehavior init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_forceVector.dx = 0.0;
    v7->_forceVector.dy = 0.0;
    v7->_active = 1;
    v7->_mode = mode;
    v9 = (void *)-[NSArray mutableCopy](v6, "mutableCopy");
    -[UIDynamicBehavior _setItems:](v8, "_setItems:", v9);

  }
  return v8;
}

- (UIPushBehavior)initWithItems:(id)a3
{
  return -[UIPushBehavior initWithItems:mode:](self, "initWithItems:mode:", a3, 0);
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

- (void)setActive:(BOOL)active
{
  id v3;

  if (self->_active != active)
  {
    self->_active = active;
    -[UIDynamicBehavior _context](self, "_context");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_tickle");

  }
}

- (BOOL)active
{
  return self->_active;
}

- (UIPushBehaviorMode)mode
{
  return self->_mode;
}

- (void)addItem:(id)item
{
  void *v4;
  char v5;
  void *v6;
  id v7;
  id v8;

  v8 = item;
  -[UIDynamicBehavior _items](self, "_items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v8);

  if ((v5 & 1) == 0)
  {
    -[UIDynamicBehavior _context](self, "_context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "_registerBodyForItem:", v8);

    -[UIDynamicBehavior _addItem:](self, "_addItem:", v8);
  }

}

- (void)removeItem:(id)item
{
  void *v4;
  int v5;
  void *v6;
  NSMutableDictionary *targetPoints;
  void *v8;
  id v9;

  v9 = item;
  -[UIDynamicBehavior _items](self, "_items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v9);

  if (v5)
  {
    -[UIDynamicBehavior _context](self, "_context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_unregisterBodyForItem:action:", v9, 0);

    targetPoints = self->_targetPoints;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](targetPoints, "removeObjectForKey:", v8);

    -[UIDynamicBehavior _removeItem:](self, "_removeItem:", v9);
  }

}

- (CGPoint)targetPointForItem:(id)a3
{
  NSMutableDictionary *targetPoints;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  targetPoints = self->_targetPoints;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](targetPoints, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "CGPointValue");
    v7 = v6;
    v9 = v8;
  }
  else
  {
    v7 = 0.0;
    v9 = 0.0;
  }

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)setTargetPoint:(CGPoint)a3 forItem:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  NSMutableDictionary *targetPoints;
  BOOL v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    targetPoints = self->_targetPoints;
    v11 = *MEMORY[0x1E0C9D538] == x && v9 == y;
    v17 = v7;
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v7, *MEMORY[0x1E0C9D538], v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](targetPoints, "removeObjectForKey:", v16);

      if (-[NSMutableDictionary count](self->_targetPoints, "count"))
      {
LABEL_12:
        -[UIDynamicBehavior _changedParameterForBody:](self, "_changedParameterForBody:", 0);
        v8 = v17;
        goto LABEL_13;
      }
      v14 = self->_targetPoints;
      self->_targetPoints = 0;
    }
    else
    {
      if (!targetPoints)
      {
        v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v13 = self->_targetPoints;
        self->_targetPoints = v12;

        targetPoints = self->_targetPoints;
      }
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", x, y);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](targetPoints, "setObject:forKey:", v14, v15);

    }
    goto LABEL_12;
  }
LABEL_13:

}

- (void)_associate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UIDynamicBehavior _items](self, "_items", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        -[UIDynamicBehavior _context](self, "_context");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_registerBodyForItem:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "setUsesPreciseCollisionDetection:", 1);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)_dissociate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[UIDynamicBehavior _items](self, "_items", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[UIDynamicBehavior _context](self, "_context");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_unregisterBodyForItem:action:", v8, 0);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)setAngle:(CGFloat)angle magnitude:(CGFloat)magnitude
{
  CGVector *p_forceVector;
  double v6;
  float v7;
  __float2 v8;

  if (self->_magnitude != magnitude || self->_angle != angle)
  {
    self->_magnitude = magnitude;
    self->_angle = angle;
    p_forceVector = &self->_forceVector;
    v6 = self->_magnitude;
    v7 = angle;
    v8 = __sincosf_stret(v7);
    p_forceVector->dx = v6 * v8.__cosval;
    self->_forceVector.dy = v6 * v8.__sinval;
    -[UIDynamicBehavior _changedParameterForBody:](self, "_changedParameterForBody:", 0);
  }
}

- (void)setXComponent:(double)a3 yComponent:(double)a4
{
  if (self->_forceVector.dx != a3 || self->_forceVector.dy != a4)
  {
    self->_forceVector.dx = a3;
    self->_forceVector.dy = a4;
    self->_angle = atan2(a4, a3);
    self->_magnitude = sqrt(a3 * a3 + a4 * a4);
    -[UIDynamicBehavior _changedParameterForBody:](self, "_changedParameterForBody:", 0);
  }
}

- (CGVector)pushDirection
{
  double dx;
  double dy;
  CGVector result;

  dx = self->_forceVector.dx;
  dy = self->_forceVector.dy;
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (CGFloat)angle
{
  return self->_angle;
}

- (CGFloat)magnitude
{
  return self->_magnitude;
}

- (double)xComponent
{
  return self->_forceVector.dx;
}

- (double)yComponent
{
  return self->_forceVector.dy;
}

- (void)setXComponent:(double)a3
{
  double v5;

  -[UIPushBehavior yComponent](self, "yComponent");
  -[UIPushBehavior setXComponent:yComponent:](self, "setXComponent:yComponent:", a3, v5);
}

- (void)setYComponent:(double)a3
{
  -[UIPushBehavior xComponent](self, "xComponent");
  -[UIPushBehavior setXComponent:yComponent:](self, "setXComponent:yComponent:");
}

- (void)setAngle:(CGFloat)angle
{
  double v5;

  -[UIPushBehavior magnitude](self, "magnitude");
  -[UIPushBehavior setAngle:magnitude:](self, "setAngle:magnitude:", angle, v5);
}

- (void)setMagnitude:(CGFloat)magnitude
{
  -[UIPushBehavior angle](self, "angle");
  -[UIPushBehavior setAngle:magnitude:](self, "setAngle:magnitude:");
}

- (void)_step
{
  NSMutableDictionary *targetPoints;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double dx;
  double dy;
  double v24;
  double v25;
  double v26;
  double v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (self->_active)
  {
    targetPoints = self->_targetPoints;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[UIDynamicBehavior _items](self, "_items");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v30 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          -[UIDynamicBehavior _context](self, "_context");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "_bodyForItem:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (targetPoints)
          {
            v11 = self->_targetPoints;
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v8);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKey:](v11, "objectForKey:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              objc_msgSend(v13, "CGPointValue");
              v15 = v14;
              v17 = v16;
              objc_msgSend(v8, "center");
              v19 = v15 + v18;
              objc_msgSend(v8, "center");
              v21 = v17 + v20;
              dx = self->_forceVector.dx;
              dy = self->_forceVector.dy;
              if (self->_mode == 1)
                objc_msgSend(v10, "applyUnscaledImpulse:atPoint:", dx, dy, v19, v21);
              else
                objc_msgSend(v10, "applyUnscaledForce:atPoint:", dx, dy, v19, v21);
            }
            else
            {
              v26 = self->_forceVector.dx;
              v27 = self->_forceVector.dy;
              if (self->_mode == 1)
                objc_msgSend(v10, "applyUnscaledImpulse:", v26, v27);
              else
                objc_msgSend(v10, "applyUnscaledForce:", v26, v27);
            }

          }
          else
          {
            v24 = self->_forceVector.dx;
            v25 = self->_forceVector.dy;
            if (self->_mode == 1)
              objc_msgSend(v10, "applyUnscaledImpulse:", v24, v25);
            else
              objc_msgSend(v10, "applyUnscaledForce:", v24, v25);
          }

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v5);
    }

    if (self->_mode == 1)
      self->_active = 0;
  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
  uint64_t v13;
  NSMutableDictionary *targetPoints;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;
  CGPoint v26;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v23.receiver = self;
  v23.super_class = (Class)UIPushBehavior;
  -[UIDynamicBehavior description](&v23, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR(" {%f, %f} - <%f,%f> "), *(_QWORD *)&self->_forceVector.dx, *(_QWORD *)&self->_forceVector.dy, *(_QWORD *)&self->_magnitude, *(_QWORD *)&self->_angle);
  if (self->_targetPoints)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[UIDynamicBehavior _items](self, "_items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = v5;
      v10 = *(_QWORD *)v20;
      do
      {
        v11 = v6;
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v11);
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          targetPoints = self->_targetPoints;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](targetPoints, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v16, "CGPointValue");
            NSStringFromCGPoint(v26);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "appendFormat:", CFSTR("(%@ -> %@)"), v17, v13);

          }
        }
        v6 = v11;
        v8 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v8);
      v5 = v9;
    }
  }
  else
  {
    -[UIDynamicBehavior _itemsDescription](self, "_itemsDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v6);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetPoints, 0);
}

@end
