@implementation UISnapBehavior

+ (BOOL)_isPrimitiveBehavior
{
  return 1;
}

- (UISnapBehavior)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("init is undefined for objects of type %@"), objc_opt_class());

  return 0;
}

- (UISnapBehavior)initWithItem:(id)item snapToPoint:(CGPoint)point
{
  CGFloat y;
  CGFloat x;
  id v7;
  UISnapBehavior *v8;
  UISnapBehavior *v9;
  objc_super v11;

  y = point.y;
  x = point.x;
  v7 = item;
  v11.receiver = self;
  v11.super_class = (Class)UISnapBehavior;
  v8 = -[UIDynamicBehavior init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[UIDynamicBehavior _addItem:](v8, "_addItem:", v7);
    v9->_anchorPoint.x = x;
    v9->_anchorPoint.y = y;
    v9->_damping = 0.5;
    v9->_distance = 50.0;
    v9->_frequency = 4.0;
    *(_BYTE *)&v9->_stateFlags &= ~1u;
  }

  return v9;
}

- (double)_distance
{
  return self->_distance;
}

- (void)_setDistance:(double)a3
{
  self->_distance = a3;
}

- (double)_frequency
{
  return self->_frequency;
}

- (void)_setFrequency:(double)a3
{
  if (self->_frequency != a3)
  {
    self->_frequency = a3;
    -[UIDynamicBehavior _changedParameterForBody:](self, "_changedParameterForBody:", 0);
  }
}

- (void)setSnapPoint:(CGPoint)snapPoint
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (snapPoint.x != self->_anchorPoint.x || snapPoint.y != self->_anchorPoint.y)
  {
    self->_anchorPoint = snapPoint;
    -[PKPhysicsBody setPosition:](self->_anchorBody, "setPosition:");
    -[UIDynamicBehavior _changedParameterForBody:](self, "_changedParameterForBody:", self->_anchorBody);
    -[UIDynamicBehavior _context](self, "_context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDynamicBehavior _items](self, "_items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_bodyForItem:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setResting:", 0);
  }
}

- (CGPoint)snapPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorPoint.x;
  y = self->_anchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_associate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double frequency;
  double distance;
  double v14;
  double v15;
  double v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  UISnapBehavior *v24;
  id v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;

  -[UIDynamicBehavior _items](self, "_items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDynamicBehavior _context](self, "_context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_registerBodyForItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bounds");
  +[PKExtendedPhysicsBody bodyWithRectangleOfSize:](PKExtendedPhysicsBody, "bodyWithRectangleOfSize:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPosition:", self->_anchorPoint.x, self->_anchorPoint.y);
  objc_msgSend(v9, "setDynamic:", 0);
  -[UIDynamicBehavior _context](self, "_context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_world");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addBody:", v9);
  frequency = self->_frequency;
  distance = self->_distance;
  objc_msgSend(v4, "bounds");
  v15 = v14 * 0.5;
  objc_msgSend(v4, "bounds");
  v21[1] = 3221225472;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[2] = __28__UISnapBehavior__associate__block_invoke;
  v21[3] = &unk_1E16C4B88;
  v22 = v6;
  v23 = v9;
  v27 = v15;
  v28 = v16 * 0.5;
  v29 = distance;
  v30 = frequency;
  v24 = self;
  v25 = v4;
  v26 = v11;
  v17 = v11;
  v18 = v4;
  v19 = v9;
  v20 = v6;
  objc_msgSend(v17, "_runBlockOutsideOfTimeStep:", v21);

}

void __28__UISnapBehavior__associate__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;

  objc_msgSend(MEMORY[0x1E0D7D308], "jointWithBodyA:bodyB:localAnchorA:localAnchorB:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), -*(double *)(a1 + 72), -*(double *)(a1 + 80), -*(double *)(a1 + 72) - *(double *)(a1 + 88), -*(double *)(a1 + 80));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDamping:", *(double *)(*(_QWORD *)(a1 + 48) + 64));
  objc_msgSend(v2, "setFrequency:", *(double *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 56), "bounds");
  objc_msgSend(v2, "setLength:", v3 * 0.5);
  objc_msgSend(*(id *)(a1 + 64), "addJoint:", v2);
  objc_msgSend(MEMORY[0x1E0D7D308], "jointWithBodyA:bodyB:localAnchorA:localAnchorB:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), -*(double *)(a1 + 72), -*(double *)(a1 + 80), -*(double *)(a1 + 72), -*(double *)(a1 + 80) - *(double *)(a1 + 88));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDamping:", *(double *)(*(_QWORD *)(a1 + 48) + 64));
  objc_msgSend(v4, "setFrequency:", *(double *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 56), "bounds");
  objc_msgSend(v4, "setLength:", v5 * 0.5);
  objc_msgSend(*(id *)(a1 + 64), "addJoint:", v4);
  objc_msgSend(MEMORY[0x1E0D7D308], "jointWithBodyA:bodyB:localAnchorA:localAnchorB:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 72) + *(double *)(a1 + 88), *(double *)(a1 + 80));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDamping:", *(double *)(*(_QWORD *)(a1 + 48) + 64));
  objc_msgSend(v6, "setFrequency:", *(double *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 64), "addJoint:", v6);
  objc_msgSend(MEMORY[0x1E0D7D308], "jointWithBodyA:bodyB:localAnchorA:localAnchorB:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 72), *(double *)(a1 + 80) + *(double *)(a1 + 88));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDamping:", *(double *)(*(_QWORD *)(a1 + 48) + 64));
  objc_msgSend(v7, "setFrequency:", *(double *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 64), "addJoint:", v7);
  v8 = dispatch_time(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__UISnapBehavior__associate__block_invoke_2;
  block[3] = &unk_1E16B2900;
  v9 = v2;
  v18 = v9;
  v22 = *(_QWORD *)(a1 + 88);
  v10 = v4;
  v19 = v10;
  v11 = v6;
  v20 = v11;
  v12 = v7;
  v21 = v12;
  dispatch_after(v8, MEMORY[0x1E0C80D38], block);
  v13 = *(_QWORD *)(a1 + 48);
  if (!*(_QWORD *)(v13 + 96))
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = *(_QWORD *)(a1 + 48);
    v16 = *(void **)(v15 + 96);
    *(_QWORD *)(v15 + 96) = v14;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 96), "addObject:", v9);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 96), "addObject:", v10);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 96), "addObject:", v11);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 96), "addObject:", v12);
    v13 = *(_QWORD *)(a1 + 48);
  }
  objc_storeStrong((id *)(v13 + 104), *(id *)(a1 + 40));

}

uint64_t __28__UISnapBehavior__associate__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setLength:", *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 40), "setLength:", *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 48), "setLength:", *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 56), "setLength:", *(double *)(a1 + 64));
}

- (void)_dissociate
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  PKPhysicsBody *anchorBody;
  NSMutableArray *joints;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[UIDynamicBehavior _context](self, "_context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_world");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_joints;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "removeJoint:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9++), (_QWORD)v15);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "removeBody:", self->_anchorBody);
  -[UIDynamicBehavior _items](self, "_items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDynamicBehavior _context](self, "_context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_unregisterBodyForItem:action:", v11, 0);

  anchorBody = self->_anchorBody;
  self->_anchorBody = 0;

  joints = self->_joints;
  self->_joints = 0;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v10.receiver = self;
  v10.super_class = (Class)UISnapBehavior;
  -[UIDynamicBehavior description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDynamicBehavior _items](self, "_items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR(" %@ <-"), v7);
  if ((*(_BYTE *)&self->_stateFlags & 2) != 0)
    objc_msgSend(v5, "appendFormat:", CFSTR("(D:%f)"), *(_QWORD *)&self->_damping);
  NSStringFromCGPoint(self->_anchorPoint);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("-> %@"), v8);

  return v5;
}

- (CGFloat)damping
{
  return self->_damping;
}

- (void)setDamping:(CGFloat)damping
{
  self->_damping = damping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorBody, 0);
  objc_storeStrong((id *)&self->_joints, 0);
}

@end
