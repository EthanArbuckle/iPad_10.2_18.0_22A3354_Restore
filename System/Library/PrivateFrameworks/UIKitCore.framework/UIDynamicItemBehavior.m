@implementation UIDynamicItemBehavior

+ (BOOL)_isPrimitiveBehavior
{
  return 1;
}

- (UIDynamicItemBehavior)init
{
  return -[UIDynamicItemBehavior initWithItems:](self, "initWithItems:", MEMORY[0x1E0C9AA60]);
}

- (UIDynamicItemBehavior)initWithItems:(NSArray *)items
{
  NSArray *v4;
  UIDynamicItemBehavior *v5;
  UIDynamicItemBehavior *v6;
  void *v7;
  objc_super v9;

  v4 = items;
  v9.receiver = self;
  v9.super_class = (Class)UIDynamicItemBehavior;
  v5 = -[UIDynamicBehavior init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_elasticity = 0.2;
    v5->_friction = 0.2;
    v5->_density = 1.0;
    v5->_resistance = 0.1;
    v5->_angularResistance = 0.1;
    v5->_allowsRotation = 1;
    v5->_useDefaultViewPropertiesApplier = 1;
    v5->_anchored = 0;
    v5->_charge = 0.0;
    v7 = (void *)-[NSArray mutableCopy](v4, "mutableCopy");
    -[UIDynamicBehavior _setItems:](v6, "_setItems:", v7);

  }
  return v6;
}

- (void)_configureBody:(id)a3 forView:(id)a4
{
  id v6;
  __int16 stateFlags;
  id v8;

  v8 = a3;
  v6 = a4;
  stateFlags = (__int16)self->_stateFlags;
  if ((stateFlags & 1) != 0)
  {
    -[UIDynamicItemBehavior elasticity](self, "elasticity");
    objc_msgSend(v8, "setRestitution:");
    stateFlags = (__int16)self->_stateFlags;
    if ((stateFlags & 2) == 0)
    {
LABEL_3:
      if ((stateFlags & 4) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((stateFlags & 2) == 0)
  {
    goto LABEL_3;
  }
  -[UIDynamicItemBehavior friction](self, "friction");
  objc_msgSend(v8, "setFriction:");
  stateFlags = (__int16)self->_stateFlags;
  if ((stateFlags & 4) == 0)
  {
LABEL_4:
    if ((stateFlags & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  -[UIDynamicItemBehavior density](self, "density");
  objc_msgSend(v8, "setNormalizedDensity:");
  stateFlags = (__int16)self->_stateFlags;
  if ((stateFlags & 8) == 0)
  {
LABEL_5:
    if ((stateFlags & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  -[UIDynamicItemBehavior resistance](self, "resistance");
  objc_msgSend(v8, "setLinearDamping:");
  stateFlags = (__int16)self->_stateFlags;
  if ((stateFlags & 0x10) == 0)
  {
LABEL_6:
    if ((stateFlags & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  -[UIDynamicItemBehavior angularResistance](self, "angularResistance");
  objc_msgSend(v8, "setAngularDamping:");
  stateFlags = (__int16)self->_stateFlags;
  if ((stateFlags & 0x20) == 0)
  {
LABEL_7:
    if ((stateFlags & 0x100) == 0)
      goto LABEL_8;
LABEL_17:
    objc_msgSend(v8, "setDynamic:", -[UIDynamicItemBehavior isAnchored](self, "isAnchored") ^ 1);
    if ((*(_WORD *)&self->_stateFlags & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  objc_msgSend(v8, "setAllowsRotation:", -[UIDynamicItemBehavior allowsRotation](self, "allowsRotation"));
  stateFlags = (__int16)self->_stateFlags;
  if ((stateFlags & 0x100) != 0)
    goto LABEL_17;
LABEL_8:
  if ((stateFlags & 0x80) != 0)
  {
LABEL_9:
    -[UIDynamicItemBehavior charge](self, "charge");
    objc_msgSend(v8, "setCharge:");
  }
LABEL_10:

}

- (void)addItem:(id)item
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = item;
  -[UIDynamicBehavior _items](self, "_items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v10);

  if ((v5 & 1) == 0)
  {
    -[UIDynamicBehavior _addItem:](self, "_addItem:", v10);
    -[UIDynamicBehavior _context](self, "_context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[UIDynamicBehavior _context](self, "_context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_registerBodyForItem:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIDynamicItemBehavior _configureBody:forView:](self, "_configureBody:forView:", v8, v10);
      -[UIDynamicBehavior _context](self, "_context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_shouldReevaluateLocalBehaviors");

    }
  }

}

- (void)removeItem:(id)item
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
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

    if (v6)
    {
      -[UIDynamicBehavior _context](self, "_context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_unregisterBodyForItem:action:", v9, 0);

      -[UIDynamicBehavior _context](self, "_context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_shouldReevaluateLocalBehaviors");

    }
    -[NSMapTable removeObjectForKey:](self->_cachedLinearVelocities, "removeObjectForKey:", v9);
    -[NSMapTable removeObjectForKey:](self->_cachedAngularVelocities, "removeObjectForKey:", v9);
    -[UIDynamicBehavior _removeItem:](self, "_removeItem:", v9);
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

- (void)setElasticity:(CGFloat)elasticity
{
  id v3;

  if (self->_elasticity != elasticity)
  {
    self->_elasticity = elasticity;
    *(_WORD *)&self->_stateFlags |= 1u;
    -[UIDynamicBehavior _context](self, "_context");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_shouldReevaluateLocalBehaviors");

  }
}

- (void)setFriction:(CGFloat)friction
{
  id v3;

  if (self->_friction != friction)
  {
    self->_friction = friction;
    *(_WORD *)&self->_stateFlags |= 2u;
    -[UIDynamicBehavior _context](self, "_context");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_shouldReevaluateLocalBehaviors");

  }
}

- (void)setDensity:(CGFloat)density
{
  id v3;

  if (self->_density != density)
  {
    self->_density = density;
    *(_WORD *)&self->_stateFlags |= 4u;
    -[UIDynamicBehavior _context](self, "_context");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_shouldReevaluateLocalBehaviors");

  }
}

- (void)setResistance:(CGFloat)resistance
{
  id v3;

  if (self->_resistance != resistance)
  {
    self->_resistance = resistance;
    *(_WORD *)&self->_stateFlags |= 8u;
    -[UIDynamicBehavior _context](self, "_context");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_shouldReevaluateLocalBehaviors");

  }
}

- (void)setAngularResistance:(CGFloat)angularResistance
{
  id v3;

  if (self->_angularResistance != angularResistance)
  {
    self->_angularResistance = angularResistance;
    *(_WORD *)&self->_stateFlags |= 0x10u;
    -[UIDynamicBehavior _context](self, "_context");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_shouldReevaluateLocalBehaviors");

  }
}

- (void)setAnchored:(BOOL)anchored
{
  id v3;

  if (self->_anchored != anchored)
  {
    self->_anchored = anchored;
    *(_WORD *)&self->_stateFlags |= 0x100u;
    -[UIDynamicBehavior _context](self, "_context");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_shouldReevaluateLocalBehaviors");

  }
}

- (void)setCharge:(CGFloat)charge
{
  id v3;

  if (self->_charge != charge)
  {
    self->_charge = charge;
    *(_WORD *)&self->_stateFlags |= 0x80u;
    -[UIDynamicBehavior _context](self, "_context");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_shouldReevaluateLocalBehaviors");

  }
}

- (void)setAllowsRotation:(BOOL)allowsRotation
{
  id v3;

  if (self->_allowsRotation != allowsRotation)
  {
    self->_allowsRotation = allowsRotation;
    *(_WORD *)&self->_stateFlags |= 0x20u;
    -[UIDynamicBehavior _context](self, "_context");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_shouldReevaluateLocalBehaviors");

  }
}

- (void)addLinearVelocity:(CGPoint)velocity forItem:(id)item
{
  double y;
  double x;
  id v7;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  NSMapTable *cachedLinearVelocities;
  NSMapTable *v18;
  NSMapTable *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  NSMapTable *v25;
  void *v26;
  void *v27;
  id v28;

  y = velocity.y;
  x = velocity.x;
  v7 = item;
  if (x != *MEMORY[0x1E0C9D538] || y != *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    v28 = v7;
    -[UIDynamicBehavior _items](self, "_items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v28);

    v7 = v28;
    if (v10)
    {
      -[UIDynamicBehavior _context](self, "_context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[UIDynamicBehavior _context](self, "_context");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_bodyForItem:", v28);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "velocity");
        v15 = x + v14;
        objc_msgSend(v13, "velocity");
        objc_msgSend(v13, "setVelocity:", v15, y + v16);
        -[UIDynamicBehavior _changedParameterForBody:](self, "_changedParameterForBody:", v13);
      }
      else
      {
        cachedLinearVelocities = self->_cachedLinearVelocities;
        if (!cachedLinearVelocities)
        {
          v18 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 512, 0);
          v19 = self->_cachedLinearVelocities;
          self->_cachedLinearVelocities = v18;

          cachedLinearVelocities = self->_cachedLinearVelocities;
        }
        -[NSMapTable objectForKey:](cachedLinearVelocities, "objectForKey:", v28);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v20;
        if (v20)
        {
          objc_msgSend(v20, "CGPointValue");
          v22 = x + v21;
          v24 = y + v23;
          v25 = self->_cachedLinearVelocities;
          v26 = (void *)MEMORY[0x1E0CB3B18];
        }
        else
        {
          v25 = self->_cachedLinearVelocities;
          v26 = (void *)MEMORY[0x1E0CB3B18];
          v22 = x;
          v24 = y;
        }
        objc_msgSend(v26, "valueWithCGPoint:", v22, v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](v25, "setObject:forKey:", v27, v28);

      }
      v7 = v28;
    }
  }

}

- (CGPoint)linearVelocityForItem:(id)item
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  v4 = item;
  -[UIDynamicBehavior _items](self, "_items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) != 0)
  {
    -[UIDynamicBehavior _context](self, "_context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_bodyForItem:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "velocity");
    v10 = v9;
    objc_msgSend(v8, "velocity");
    v12 = v11;

  }
  else
  {
    v10 = *MEMORY[0x1E0C9D538];
    v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)_setPosition:(CGPoint)a3 forItem:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIDynamicBehavior _context](self, "_context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_bodyForItem:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPosition:", x, y);
  -[UIDynamicBehavior _changedParameterForBody:](self, "_changedParameterForBody:", v9);

}

- (CGPoint)_positionForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  v4 = a3;
  -[UIDynamicBehavior _context](self, "_context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_bodyForItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "position");
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)_setAngle:(double)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[UIDynamicBehavior _context](self, "_context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_bodyForItem:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setRotation:", a3);
  -[UIDynamicBehavior _changedParameterForBody:](self, "_changedParameterForBody:", v8);

}

- (double)_angleForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  -[UIDynamicBehavior _context](self, "_context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_bodyForItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "rotation");
  v8 = v7;

  return v8;
}

- (void)addAngularVelocity:(CGFloat)velocity forItem:(id)item
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  NSMapTable *cachedAngularVelocities;
  NSMapTable *v14;
  NSMapTable *v15;
  void *v16;
  float v17;
  CGFloat v18;
  NSMapTable *v19;
  double v20;
  id v21;

  v6 = item;
  if (velocity != 0.0)
  {
    v21 = v6;
    -[UIDynamicBehavior _items](self, "_items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v21);

    v6 = v21;
    if (v8)
    {
      -[UIDynamicBehavior _context](self, "_context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[UIDynamicBehavior _context](self, "_context");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_bodyForItem:", v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "angularVelocity");
        objc_msgSend(v11, "setAngularVelocity:", v12 + velocity);
        -[UIDynamicBehavior _changedParameterForBody:](self, "_changedParameterForBody:", v11);
      }
      else
      {
        cachedAngularVelocities = self->_cachedAngularVelocities;
        if (!cachedAngularVelocities)
        {
          v14 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 512, 0);
          v15 = self->_cachedAngularVelocities;
          self->_cachedAngularVelocities = v14;

          cachedAngularVelocities = self->_cachedAngularVelocities;
        }
        -[NSMapTable objectForKey:](cachedAngularVelocities, "objectForKey:", v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "floatValue");
        v18 = v17 + velocity;

        v19 = self->_cachedAngularVelocities;
        *(float *)&v20 = v18;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](v19, "setObject:forKey:", v11, v21);
      }

      v6 = v21;
    }
  }

}

- (CGFloat)angularVelocityForItem:(id)item
{
  id v4;
  void *v5;
  int v6;
  double v7;
  void *v8;
  void *v9;
  double v10;

  v4 = item;
  -[UIDynamicBehavior _items](self, "_items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  v7 = 0.0;
  if (v6)
  {
    -[UIDynamicBehavior _context](self, "_context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_bodyForItem:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "angularVelocity");
    v7 = v10;

  }
  return v7;
}

- (double)_elasticityForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  -[UIDynamicBehavior _context](self, "_context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_bodyForItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "restitution");
  v8 = v7;

  return v8;
}

- (double)_frictionForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  -[UIDynamicBehavior _context](self, "_context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_bodyForItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "friction");
  v8 = v7;

  return v8;
}

- (double)_densityForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  -[UIDynamicBehavior _context](self, "_context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_bodyForItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "normalizedDensity");
  v8 = v7;

  return v8;
}

- (double)_resistanceForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  -[UIDynamicBehavior _context](self, "_context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_bodyForItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "linearDamping");
  v8 = v7;

  return v8;
}

- (double)_angularResistanceForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  -[UIDynamicBehavior _context](self, "_context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_bodyForItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "angularDamping");
  v8 = v7;

  return v8;
}

- (double)_massForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  -[UIDynamicBehavior _context](self, "_context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_bodyForItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "mass");
  v8 = v7;

  return v8;
}

- (BOOL)_rotationEnabledForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIDynamicBehavior _context](self, "_context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_bodyForItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "allowsRotation");
  return (char)v5;
}

- (void)applyImpulse:(CGPoint)a3 toItem:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIDynamicBehavior _context](self, "_context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_bodyForItem:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "applyImpulse:", x, y);
  -[UIDynamicBehavior _changedParameterForBody:](self, "_changedParameterForBody:", v9);

}

- (void)_reevaluate:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[UIDynamicBehavior _items](self, "_items", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          -[UIDynamicBehavior _context](self, "_context");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (a3 == 2)
            objc_msgSend(v11, "_registerBodyForItem:", v10);
          else
            objc_msgSend(v11, "_bodyForItem:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          -[UIDynamicItemBehavior _configureBody:forView:](self, "_configureBody:forView:", v13, v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
}

- (void)_associate
{
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  NSMapTable *cachedLinearVelocities;
  NSMapTable *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  float v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  NSMapTable *cachedAngularVelocities;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  -[UIDynamicItemBehavior _reevaluate:](self, "_reevaluate:", 2);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v3 = self->_cachedLinearVelocities;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v38 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_cachedLinearVelocities, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "CGPointValue");
        v11 = v10;
        v13 = v12;
        -[UIDynamicBehavior _context](self, "_context");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_bodyForItem:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "velocity");
        v17 = v11 + v16;
        objc_msgSend(v15, "velocity");
        objc_msgSend(v15, "setVelocity:", v17, v13 + v18);
        -[UIDynamicBehavior _changedParameterForBody:](self, "_changedParameterForBody:", v15);

      }
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v5);
  }

  cachedLinearVelocities = self->_cachedLinearVelocities;
  self->_cachedLinearVelocities = 0;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v20 = self->_cachedAngularVelocities;
  v21 = -[NSMapTable countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
        -[NSMapTable objectForKey:](self->_cachedAngularVelocities, "objectForKey:", v25, (_QWORD)v33);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "floatValue");
        v28 = v27;
        -[UIDynamicBehavior _context](self, "_context");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "_bodyForItem:", v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v30, "angularVelocity");
        objc_msgSend(v30, "setAngularVelocity:", v31 + v28);
        -[UIDynamicBehavior _changedParameterForBody:](self, "_changedParameterForBody:", v30);

      }
      v22 = -[NSMapTable countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v22);
  }

  cachedAngularVelocities = self->_cachedAngularVelocities;
  self->_cachedAngularVelocities = 0;

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
        objc_msgSend(v9, "_unregisterBodyForItem:action:", v8, &__block_literal_global_176);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

void __36__UIDynamicItemBehavior__dissociate__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setRestitution:", 0.2);
  objc_msgSend(v2, "setFriction:", 0.2);
  objc_msgSend(v2, "setNormalizedDensity:", 1.0);
  objc_msgSend(v2, "setLinearDamping:", 0.1);
  objc_msgSend(v2, "setAngularDamping:", 0.1);
  objc_msgSend(v2, "setAllowsRotation:", 1);

}

- (BOOL)useDefaultViewPropertiesApplier
{
  return self->_useDefaultViewPropertiesApplier;
}

- (void)setUseDefaultViewPropertiesApplier:(BOOL)a3
{
  id v3;

  if (self->_useDefaultViewPropertiesApplier != a3)
  {
    self->_useDefaultViewPropertiesApplier = a3;
    *(_WORD *)&self->_stateFlags |= 0x40u;
    -[UIDynamicBehavior _context](self, "_context");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_shouldReevaluateLocalBehaviors");

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  __int16 stateFlags;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v14.receiver = self;
  v14.super_class = (Class)UIDynamicItemBehavior;
  -[UIDynamicBehavior description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  stateFlags = (__int16)self->_stateFlags;
  if ((stateFlags & 1) != 0)
  {
    -[UIDynamicItemBehavior elasticity](self, "elasticity");
    objc_msgSend(v5, "appendFormat:", CFSTR(" E=%f"), v10);
    stateFlags = (__int16)self->_stateFlags;
    if ((stateFlags & 2) == 0)
    {
LABEL_3:
      if ((stateFlags & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((stateFlags & 2) == 0)
  {
    goto LABEL_3;
  }
  -[UIDynamicItemBehavior friction](self, "friction");
  objc_msgSend(v5, "appendFormat:", CFSTR(" F=%f"), v11);
  stateFlags = (__int16)self->_stateFlags;
  if ((stateFlags & 4) == 0)
  {
LABEL_4:
    if ((stateFlags & 8) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  -[UIDynamicItemBehavior density](self, "density");
  objc_msgSend(v5, "appendFormat:", CFSTR(" D=%f"), v12);
  stateFlags = (__int16)self->_stateFlags;
  if ((stateFlags & 8) == 0)
  {
LABEL_5:
    if ((stateFlags & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_17:
  -[UIDynamicItemBehavior resistance](self, "resistance");
  objc_msgSend(v5, "appendFormat:", CFSTR(" R=%f"), v13);
  if ((*(_WORD *)&self->_stateFlags & 0x10) != 0)
  {
LABEL_6:
    -[UIDynamicItemBehavior angularResistance](self, "angularResistance");
    objc_msgSend(v5, "appendFormat:", CFSTR(" AR=%f"), v7);
  }
LABEL_7:
  if (!-[UIDynamicItemBehavior allowsRotation](self, "allowsRotation"))
    objc_msgSend(v5, "appendString:", CFSTR(" !Rotation"));
  if (!self->_useDefaultViewPropertiesApplier)
    objc_msgSend(v5, "appendString:", CFSTR(" !DefaultApplier"));
  if (self->_anchored)
    objc_msgSend(v5, "appendString:", CFSTR(" Anchored"));
  objc_msgSend(v5, "appendString:", CFSTR(" "));
  -[UIDynamicBehavior _itemsDescription](self, "_itemsDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v8);

  return v5;
}

- (CGFloat)elasticity
{
  return self->_elasticity;
}

- (CGFloat)friction
{
  return self->_friction;
}

- (CGFloat)density
{
  return self->_density;
}

- (CGFloat)resistance
{
  return self->_resistance;
}

- (CGFloat)angularResistance
{
  return self->_angularResistance;
}

- (CGFloat)charge
{
  return self->_charge;
}

- (BOOL)isAnchored
{
  return self->_anchored;
}

- (BOOL)allowsRotation
{
  return self->_allowsRotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedLinearVelocities, 0);
  objc_storeStrong((id *)&self->_cachedAngularVelocities, 0);
}

@end
