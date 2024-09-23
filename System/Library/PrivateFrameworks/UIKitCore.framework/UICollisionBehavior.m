@implementation UICollisionBehavior

+ (BOOL)_isPrimitiveBehavior
{
  return 1;
}

- (UICollisionBehavior)init
{
  return -[UICollisionBehavior initWithItems:](self, "initWithItems:", MEMORY[0x1E0C9AA60]);
}

- (UICollisionBehavior)initWithItems:(NSArray *)items
{
  NSArray *v4;
  UICollisionBehavior *v5;
  void *v6;
  objc_super v8;

  v4 = items;
  v8.receiver = self;
  v8.super_class = (Class)UICollisionBehavior;
  v5 = -[UIDynamicBehavior init](&v8, sel_init);
  if (v5)
  {
    v6 = (void *)-[NSArray mutableCopy](v4, "mutableCopy");
    -[UIDynamicBehavior _setItems:](v5, "_setItems:", v6);

    v5->_collisionMode = -1;
  }

  return v5;
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

- (void)_addCollisionItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[UIDynamicBehavior _context](self, "_context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_registerBodyForItem:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[UICollisionBehavior _setCollisions:forBody:isEdge:](self, "_setCollisions:forBody:isEdge:", 1, v6, 0);
}

- (void)addItem:(id)item
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = item;
  -[UIDynamicBehavior _items](self, "_items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v7);

  if ((v5 & 1) == 0)
  {
    -[UIDynamicBehavior _addItem:](self, "_addItem:", v7);
    -[UIDynamicBehavior _context](self, "_context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[UICollisionBehavior _addCollisionItem:](self, "_addCollisionItem:", v7);
  }

}

- (void)removeItem:(id)item
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v4 = item;
  -[UIDynamicBehavior _items](self, "_items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    -[UIDynamicBehavior _context](self, "_context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[UIDynamicBehavior _context](self, "_context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __34__UICollisionBehavior_removeItem___block_invoke;
      v9[3] = &unk_1E16C4868;
      v9[4] = self;
      objc_msgSend(v8, "_unregisterBodyForItem:action:", v4, v9);

    }
    -[UIDynamicBehavior _removeItem:](self, "_removeItem:", v4);
  }

}

uint64_t __34__UICollisionBehavior_removeItem___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setCollisions:forBody:isEdge:", 0, a2, 0);
}

- (void)_applySettings
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[UIDynamicBehavior _items](self, "_items", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[UICollisionBehavior _addCollisionItem:](self, "_addCollisionItem:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (UICollisionBehaviorMode)collisionMode
{
  return self->_collisionMode;
}

- (void)setCollisionMode:(UICollisionBehaviorMode)collisionMode
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (self->_collisionMode != collisionMode)
  {
    self->_collisionMode = collisionMode;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[UIDynamicBehavior _items](self, "_items");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          -[UIDynamicBehavior _context](self, "_context");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_bodyForItem:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          -[UICollisionBehavior _setCollisions:forBody:isEdge:](self, "_setCollisions:forBody:isEdge:", 1, v11, 0);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v6);
    }

    -[UICollisionBehavior _setCollisions:forBody:isEdge:](self, "_setCollisions:forBody:isEdge:", 1, self->_implicitBoundsBody, 1);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = self->_boundaryBodies;
    v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          -[NSMutableDictionary objectForKey:](self->_boundaryBodies, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), (_QWORD)v18);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[UICollisionBehavior _setCollisions:forBody:isEdge:](self, "_setCollisions:forBody:isEdge:", 0, v17, 0);

        }
        v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v14);
    }

  }
}

- (void)_setCollisions:(BOOL)a3 forBody:(id)a4 isEdge:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v7;
  int v8;
  UICollisionBehaviorMode v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  if (!a4)
    return;
  v5 = a3;
  v7 = 4;
  if (a5)
    v7 = 3;
  v8 = *(_DWORD *)((char *)&self->super.super.isa + OBJC_IVAR___UICollisionBehavior__collisionMode[v7]);
  v14 = a4;
  v9 = -[UICollisionBehavior collisionMode](self, "collisionMode");
  if (v9 == 1)
  {
    v10 = 128;
  }
  else
  {
    if (v9 != 2)
    {
      v11 = self->_groupBID | self->_groupVID;
      goto LABEL_11;
    }
    v10 = 132;
  }
  v11 = *(_DWORD *)((char *)&self->super.super.isa + v10);
LABEL_11:
  v12 = objc_msgSend(v14, "collisionBitMask") & ~(self->_groupBID | self->_groupVID);
  if (v5)
  {
    v12 = v12 | v11;
    objc_msgSend(v14, "setCollisionBitMask:", v12);
    v13 = objc_msgSend(v14, "categoryBitMask") & ~(self->_groupBID | self->_groupVID) | v8;
  }
  else
  {
    objc_msgSend(v14, "setCollisionBitMask:", v12);
    v13 = objc_msgSend(v14, "categoryBitMask") & ~(self->_groupBID | self->_groupVID);
  }
  objc_msgSend(v14, "setCategoryBitMask:", v13);
  objc_msgSend(v14, "setContactTestBitMask:", v12);
  -[UIDynamicBehavior _changedParameterForBody:](self, "_changedParameterForBody:", v14);

}

- (void)_didBeginContact:(id)a3
{
  PKExtendedPhysicsBody *v4;
  PKExtendedPhysicsBody *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  PKExtendedPhysicsBody *implicitBoundsBody;
  NSMutableDictionary *boundaryBodies;
  id WeakRetained;
  void *v15;
  UICollisionBehavior *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  PKExtendedPhysicsBody *v20;
  UICollisionBehavior *v21;
  id v22;
  id v23;
  PKExtendedPhysicsBody *v24;
  id v25;

  v18 = a3;
  objc_msgSend(v18, "bodyA");
  v4 = (PKExtendedPhysicsBody *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bodyB");
  v5 = (PKExtendedPhysicsBody *)objc_claimAutoreleasedReturnValue();
  -[PKExtendedPhysicsBody representedObject](v4, "representedObject");
  v6 = objc_claimAutoreleasedReturnValue();
  -[PKExtendedPhysicsBody representedObject](v5, "representedObject");
  v7 = objc_claimAutoreleasedReturnValue();
  -[UIDynamicBehavior _items](self, "_items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if ((v9 & 1) == 0)
  {

    v6 = 0;
  }
  -[UIDynamicBehavior _items](self, "_items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v7);

  if ((v11 & 1) == 0)
  {

    v7 = 0;
  }
  if (!(v6 | v7))
    goto LABEL_22;
  if (v6 && v7 && (*(_BYTE *)&self->_collisionBehaviorFlags & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_collisionDelegate);
    objc_msgSend(v18, "contactPoint");
    objc_msgSend(WeakRetained, "collisionBehavior:beganContactForItem:withItem:atPoint:", self, v6, v7);
    goto LABEL_21;
  }
  implicitBoundsBody = self->_implicitBoundsBody;
  if (v4 == implicitBoundsBody)
  {
    if ((*(_BYTE *)&self->_collisionBehaviorFlags & 4) == 0 || !v7)
      goto LABEL_22;
    WeakRetained = objc_loadWeakRetained((id *)&self->_collisionDelegate);
    objc_msgSend(v18, "contactPoint");
    v15 = WeakRetained;
    v16 = self;
    v17 = v7;
LABEL_20:
    objc_msgSend(v15, "collisionBehavior:beganContactForItem:withBoundaryIdentifier:atPoint:", v16, v17, 0);
    goto LABEL_21;
  }
  if (v5 == implicitBoundsBody)
  {
    if (!v6 || (*(_BYTE *)&self->_collisionBehaviorFlags & 4) == 0)
      goto LABEL_22;
    WeakRetained = objc_loadWeakRetained((id *)&self->_collisionDelegate);
    objc_msgSend(v18, "contactPoint");
    v15 = WeakRetained;
    v16 = self;
    v17 = v6;
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_collisionBehaviorFlags & 4) != 0)
  {
    boundaryBodies = self->_boundaryBodies;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __40__UICollisionBehavior__didBeginContact___block_invoke;
    v19[3] = &unk_1E16C4890;
    v20 = v4;
    v21 = self;
    v22 = (id)v7;
    v23 = v18;
    v24 = v5;
    v25 = (id)v6;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](boundaryBodies, "enumerateKeysAndObjectsUsingBlock:", v19);

    WeakRetained = v20;
LABEL_21:

  }
LABEL_22:

}

void __40__UICollisionBehavior__didBeginContact___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = v7;
  if (*(id *)(a1 + 32) == v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 120));
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    goto LABEL_5;
  }
  if (*(id *)(a1 + 64) == v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 120));
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 72);
LABEL_5:
    objc_msgSend(*(id *)(a1 + 56), "contactPoint");
    objc_msgSend(WeakRetained, "collisionBehavior:beganContactForItem:withBoundaryIdentifier:atPoint:", v10, v11, v12);

    *a4 = 1;
  }

}

- (id)collisionDelegate
{
  return objc_loadWeakRetained((id *)&self->_collisionDelegate);
}

- (void)setCollisionDelegate:(id)collisionDelegate
{
  UICollisionBehaviorDelegate **p_collisionDelegate;
  id v5;
  char v6;
  char v7;
  char v8;
  char v9;

  p_collisionDelegate = &self->_collisionDelegate;
  v5 = collisionDelegate;
  objc_storeWeak((id *)p_collisionDelegate, v5);
  *(_BYTE *)&self->_collisionBehaviorFlags = *(_BYTE *)&self->_collisionBehaviorFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 2;
  else
    v6 = 0;
  *(_BYTE *)&self->_collisionBehaviorFlags = *(_BYTE *)&self->_collisionBehaviorFlags & 0xFD | v6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = 4;
  else
    v7 = 0;
  *(_BYTE *)&self->_collisionBehaviorFlags = *(_BYTE *)&self->_collisionBehaviorFlags & 0xFB | v7;
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
    v9 = 8;
  else
    v9 = 0;
  *(_BYTE *)&self->_collisionBehaviorFlags = *(_BYTE *)&self->_collisionBehaviorFlags & 0xF7 | v9;
}

- (void)_didEndContact:(id)a3
{
  id v4;
  PKExtendedPhysicsBody *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  id WeakRetained;
  PKExtendedPhysicsBody *implicitBoundsBody;
  NSMutableDictionary *boundaryBodies;
  id v15;
  UICollisionBehavior *v16;
  uint64_t v17;
  PKExtendedPhysicsBody *v18;
  _QWORD v19[4];
  PKExtendedPhysicsBody *v20;
  UICollisionBehavior *v21;
  id v22;
  PKExtendedPhysicsBody *v23;
  id v24;

  v4 = a3;
  objc_msgSend(v4, "bodyA");
  v18 = (PKExtendedPhysicsBody *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bodyB");
  v5 = (PKExtendedPhysicsBody *)objc_claimAutoreleasedReturnValue();

  -[PKExtendedPhysicsBody representedObject](v18, "representedObject");
  v6 = objc_claimAutoreleasedReturnValue();
  -[PKExtendedPhysicsBody representedObject](v5, "representedObject");
  v7 = objc_claimAutoreleasedReturnValue();
  -[UIDynamicBehavior _items](self, "_items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if ((v9 & 1) == 0)
  {

    v6 = 0;
  }
  -[UIDynamicBehavior _items](self, "_items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v7);

  if ((v11 & 1) == 0)
  {

    v7 = 0;
  }
  if (!(v6 | v7))
    goto LABEL_21;
  if (v6 && v7)
  {
    if ((*(_BYTE *)&self->_collisionBehaviorFlags & 2) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_collisionDelegate);
      objc_msgSend(WeakRetained, "collisionBehavior:endedContactForItem:withItem:", self, v6, v7);
LABEL_20:

      goto LABEL_21;
    }
    goto LABEL_21;
  }
  implicitBoundsBody = self->_implicitBoundsBody;
  if (v18 == implicitBoundsBody)
  {
    if ((*(_BYTE *)&self->_collisionBehaviorFlags & 8) == 0 || !v7)
      goto LABEL_21;
    v15 = objc_loadWeakRetained((id *)&self->_collisionDelegate);
    WeakRetained = v15;
    v16 = self;
    v17 = v7;
LABEL_19:
    objc_msgSend(v15, "collisionBehavior:endedContactForItem:withBoundaryIdentifier:", v16, v17, 0);
    goto LABEL_20;
  }
  if (v5 != implicitBoundsBody)
  {
    boundaryBodies = self->_boundaryBodies;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __38__UICollisionBehavior__didEndContact___block_invoke;
    v19[3] = &unk_1E16C48B8;
    v20 = v18;
    v21 = self;
    v22 = (id)v7;
    v23 = v5;
    v24 = (id)v6;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](boundaryBodies, "enumerateKeysAndObjectsUsingBlock:", v19);

    WeakRetained = v20;
    goto LABEL_20;
  }
  if (v6 && (*(_BYTE *)&self->_collisionBehaviorFlags & 8) != 0)
  {
    v15 = objc_loadWeakRetained((id *)&self->_collisionDelegate);
    WeakRetained = v15;
    v16 = self;
    v17 = v6;
    goto LABEL_19;
  }
LABEL_21:

}

void __38__UICollisionBehavior__didEndContact___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  v7 = a3;
  v8 = v7;
  if ((id)a1[4] == v7)
  {
    v14 = a1[5];
    if ((*(_BYTE *)(v14 + 136) & 8) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v14 + 120));
      v11 = WeakRetained;
      v12 = a1[5];
      v13 = a1[6];
      goto LABEL_7;
    }
LABEL_8:
    *a4 = 1;
    goto LABEL_9;
  }
  if ((id)a1[7] == v7)
  {
    v9 = a1[5];
    if ((*(_BYTE *)(v9 + 136) & 8) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v9 + 120));
      v11 = WeakRetained;
      v12 = a1[5];
      v13 = a1[8];
LABEL_7:
      objc_msgSend(WeakRetained, "collisionBehavior:endedContactForItem:withBoundaryIdentifier:", v12, v13, v15);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_reevaluate:(unint64_t)a3
{
  if (a3 == 1)
    -[UICollisionBehavior _setupImplicitBoundaries](self, "_setupImplicitBoundaries");
}

- (void)_associate
{
  void *v3;
  char v4;
  void *v5;

  -[UIDynamicBehavior _context](self, "_context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_registerCollisionGroup");

  if (self->_usesImplicitBounds)
  {
    -[UIDynamicBehavior _context](self, "_context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_registerImplicitBounds");

  }
  self->_groupVID = 1 << (2 * v4);
  self->_groupBID = 1 << ((2 * v4) | 1);
  -[UICollisionBehavior _applySettings](self, "_applySettings");
  -[UICollisionBehavior _setupImplicitBoundaries](self, "_setupImplicitBoundaries");
  -[UICollisionBehavior _setupExplicitBoundaries](self, "_setupExplicitBoundaries");
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
  uint64_t i;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[UIDynamicBehavior _context](self, "_context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_unregisterCollisionGroup");

  if (self->_usesImplicitBounds)
  {
    -[UIDynamicBehavior _context](self, "_context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_unregisterImplicitBounds");

  }
  -[UICollisionBehavior _removeImplicitBoundaries](self, "_removeImplicitBoundaries");
  -[UICollisionBehavior _removeExplicitBoundaryBodies](self, "_removeExplicitBoundaryBodies");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[UIDynamicBehavior _items](self, "_items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[UIDynamicBehavior _context](self, "_context");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v9;
        v13[1] = 3221225472;
        v13[2] = __34__UICollisionBehavior__dissociate__block_invoke;
        v13[3] = &unk_1E16C4868;
        v13[4] = self;
        objc_msgSend(v12, "_unregisterBodyForItem:action:", v11, v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

uint64_t __34__UICollisionBehavior__dissociate__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setCollisions:forBody:isEdge:", 0, a2, 0);
}

- (void)setTranslatesReferenceBoundsIntoBoundary:(BOOL)translatesReferenceBoundsIntoBoundary
{
  -[UICollisionBehavior _setTranslatesReferenceItemBounds:intoBoundaryWithInsets:](self, "_setTranslatesReferenceItemBounds:intoBoundaryWithInsets:", translatesReferenceBoundsIntoBoundary, 0.0, 0.0, 0.0, 0.0);
}

- (void)setTranslatesReferenceBoundsIntoBoundaryWithInsets:(UIEdgeInsets)insets
{
  -[UICollisionBehavior _setTranslatesReferenceItemBounds:intoBoundaryWithInsets:](self, "_setTranslatesReferenceItemBounds:intoBoundaryWithInsets:", 1, insets.top, insets.left, insets.bottom, insets.right);
}

- (void)_setTranslatesReferenceItemBounds:(BOOL)a3 intoBoundaryWithInsets:(UIEdgeInsets)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (a3)
  {
    self->_usesImplicitBounds = 1;
    self->_implicitBoundsInsets = a4;
  }
  else
  {
    self->_usesImplicitBounds = 0;
    *(_OWORD *)&self->_implicitBoundsInsets.top = 0u;
    *(_OWORD *)&self->_implicitBoundsInsets.bottom = 0u;
  }
  -[UIDynamicBehavior _context](self, "_context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIDynamicBehavior _context](self, "_context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v4)
      objc_msgSend(v7, "_registerImplicitBounds");
    else
      objc_msgSend(v7, "_unregisterImplicitBounds");

    -[UICollisionBehavior _setupImplicitBoundaries](self, "_setupImplicitBoundaries");
  }
}

- (BOOL)translatesReferenceBoundsIntoBoundary
{
  return self->_usesImplicitBounds;
}

- (void)_removeImplicitBoundaries
{
  void *v3;
  void *v4;
  PKExtendedPhysicsBody *implicitBoundsBody;

  if (self->_implicitBoundsBody)
  {
    -[UIDynamicBehavior _context](self, "_context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_world");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeBody:", self->_implicitBoundsBody);

    implicitBoundsBody = self->_implicitBoundsBody;
    self->_implicitBoundsBody = 0;

  }
}

- (void)_setupImplicitBoundaries
{
  void *v3;
  BOOL v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double top;
  double left;
  double v16;
  double v17;
  double v18;
  const CGPath *v19;
  PKExtendedPhysicsBody *v20;
  PKExtendedPhysicsBody *implicitBoundsBody;
  void *v22;
  void *v23;
  CGRect v24;
  CGRect v25;

  -[UIDynamicBehavior _context](self, "_context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceSystemBounds");
  v4 = CGRectEqualToRect(v24, *MEMORY[0x1E0C9D628]);

  if (!v4)
  {
    -[UICollisionBehavior _removeImplicitBoundaries](self, "_removeImplicitBoundaries");
    if (self->_usesImplicitBounds)
    {
      -[UIDynamicBehavior _context](self, "_context");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_referenceSystemBounds");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;

      top = self->_implicitBoundsInsets.top;
      left = self->_implicitBoundsInsets.left;
      v16 = v9 + top;
      v17 = v11 - (left + self->_implicitBoundsInsets.right);
      v18 = v13 - (top + self->_implicitBoundsInsets.bottom);
      v25.origin.x = v7 + left + -1.0;
      v25.origin.y = v16 + -1.0;
      v25.size.width = v17 + 2.0;
      v25.size.height = v18 + 2.0;
      v19 = CGPathCreateWithRect(v25, 0);
      +[PKExtendedPhysicsBody bodyWithEdgeLoopFromPath:](PKExtendedPhysicsBody, "bodyWithEdgeLoopFromPath:", v19);
      v20 = (PKExtendedPhysicsBody *)objc_claimAutoreleasedReturnValue();
      implicitBoundsBody = self->_implicitBoundsBody;
      self->_implicitBoundsBody = v20;

      -[PKExtendedPhysicsBody setAffectedByGravity:](self->_implicitBoundsBody, "setAffectedByGravity:", 0);
      -[PKExtendedPhysicsBody setDynamic:](self->_implicitBoundsBody, "setDynamic:", 0);
      -[UICollisionBehavior _setCollisions:forBody:isEdge:](self, "_setCollisions:forBody:isEdge:", 1, self->_implicitBoundsBody, 1);
      -[UIDynamicBehavior _context](self, "_context");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_world");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addBody:", self->_implicitBoundsBody);

      CGPathRelease(v19);
      -[UIDynamicBehavior _changedParameterForBody:](self, "_changedParameterForBody:", 0);
    }
  }
}

- (void)addBoundaryWithIdentifier:(id)identifier forPath:(UIBezierPath *)bezierPath
{
  if (identifier)
  {
    if (bezierPath)
      -[UICollisionBehavior _registerBoundaryForIdentifier:path:](self, "_registerBoundaryForIdentifier:path:");
  }
}

- (void)addBoundaryWithIdentifier:(id)identifier fromPoint:(CGPoint)p1 toPoint:(CGPoint)p2
{
  double y;
  double x;
  double v7;
  double v8;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (identifier)
  {
    y = p2.y;
    x = p2.x;
    v7 = p1.y;
    v8 = p1.x;
    v10 = (void *)MEMORY[0x1E0CB3B18];
    v11 = identifier;
    objc_msgSend(v10, "valueWithCGPoint:", v8, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v12;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", x, y);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollisionBehavior _registerBoundaryForIdentifier:path:](self, "_registerBoundaryForIdentifier:path:", v11, v14);

  }
}

- (void)_registerBoundaryForIdentifier:(id)a3 path:(id)a4
{
  id v6;
  NSMutableDictionary *boundaryPaths;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  boundaryPaths = self->_boundaryPaths;
  if (!boundaryPaths)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    v9 = self->_boundaryPaths;
    self->_boundaryPaths = v8;

    boundaryPaths = self->_boundaryPaths;
  }
  -[NSMutableDictionary setObject:forKey:](boundaryPaths, "setObject:forKey:", v6, v10);
  -[UICollisionBehavior _registerBodyForIdentifier:path:](self, "_registerBodyForIdentifier:path:", v10, v6);

}

- (void)_registerBodyForIdentifier:(id)a3 path:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *boundaryBodies;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v7 = a4;
  -[UIDynamicBehavior _context](self, "_context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "CGPointValue");
      v12 = v11;
      v14 = v13;
      objc_msgSend(v7, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "CGPointValue");
      +[PKExtendedPhysicsBody bodyWithEdgeFromPoint:toPoint:](PKExtendedPhysicsBody, "bodyWithEdgeFromPoint:toPoint:", v12, v14, v16, v17);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        goto LABEL_8;
    }
    goto LABEL_7;
  }
  +[PKExtendedPhysicsBody bodyWithEdgeLoopFromPath:](PKExtendedPhysicsBody, "bodyWithEdgeLoopFromPath:", objc_msgSend(objc_retainAutorelease(v7), "CGPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollisionBehavior.m"), 368, CFSTR("invalid path for collision boundary"));

    v9 = 0;
  }
LABEL_8:
  if (!self->_boundaryBodies)
  {
    v19 = (NSMutableDictionary *)objc_opt_new();
    boundaryBodies = self->_boundaryBodies;
    self->_boundaryBodies = v19;

  }
  objc_msgSend(v9, "representedObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
    objc_msgSend(v9, "setRepresentedObject:", self);
  -[NSMutableDictionary setObject:forKey:](self->_boundaryBodies, "setObject:forKey:", v9, v24);
  objc_msgSend(v9, "setAffectedByGravity:", 0);
  objc_msgSend(v9, "setDynamic:", 0);
  -[UIDynamicBehavior _context](self, "_context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_world");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addBody:", v9);

  -[UICollisionBehavior _setCollisions:forBody:isEdge:](self, "_setCollisions:forBody:isEdge:", 1, v9, 1);
  -[UIDynamicBehavior _changedParameterForBody:](self, "_changedParameterForBody:", 0);

LABEL_13:
}

- (UIBezierPath)boundaryWithIdentifier:(id)identifier
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v11;

  -[NSMutableDictionary objectForKey:](self->_boundaryPaths, "objectForKey:", identifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UICollisionBehavior.m"), 397, 0);

      }
      v7 = v5;
      +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "CGPointValue");
      objc_msgSend(v6, "moveToPoint:");

      objc_msgSend(v7, "objectAtIndex:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "CGPointValue");
      objc_msgSend(v6, "addLineToPoint:");

    }
  }
  else
  {
    v6 = 0;
  }

  return (UIBezierPath *)v6;
}

- (void)removeBoundaryWithIdentifier:(id)identifier
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = identifier;
  if (v4)
  {
    v8 = v4;
    -[NSMutableDictionary objectForKey:](self->_boundaryBodies, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[UICollisionBehavior _setCollisions:forBody:isEdge:](self, "_setCollisions:forBody:isEdge:", 0, v5, 1);
      -[UIDynamicBehavior _context](self, "_context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_world");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeBody:", v5);

      -[NSMutableDictionary removeObjectForKey:](self->_boundaryBodies, "removeObjectForKey:", v8);
    }
    -[NSMutableDictionary removeObjectForKey:](self->_boundaryPaths, "removeObjectForKey:", v8);
    -[UIDynamicBehavior _changedParameterForBody:](self, "_changedParameterForBody:", 0);

    v4 = v8;
  }

}

- (NSArray)boundaryIdentifiers
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_boundaryPaths, "allKeys");
}

- (void)removeAllBoundaries
{
  -[UICollisionBehavior _removeExplicitBoundaryBodies](self, "_removeExplicitBoundaryBodies");
  -[UICollisionBehavior _removeExplicitBoundaryPaths](self, "_removeExplicitBoundaryPaths");
}

- (void)_setupExplicitBoundaries
{
  NSMutableDictionary *boundaryPaths;
  _QWORD v3[5];

  boundaryPaths = self->_boundaryPaths;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__UICollisionBehavior__setupExplicitBoundaries__block_invoke;
  v3[3] = &unk_1E16C48E0;
  v3[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](boundaryPaths, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __47__UICollisionBehavior__setupExplicitBoundaries__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKey:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(*(id *)(a1 + 32), "_registerBodyForIdentifier:path:", v7, v5);

}

- (void)_removeExplicitBoundaryBodies
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *boundaryBodies;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_boundaryBodies;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKey:](self->_boundaryBodies, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7), (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollisionBehavior _setCollisions:forBody:isEdge:](self, "_setCollisions:forBody:isEdge:", 0, v8, 0);
        -[UIDynamicBehavior _context](self, "_context");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_world");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeBody:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  boundaryBodies = self->_boundaryBodies;
  self->_boundaryBodies = 0;

  -[UIDynamicBehavior _changedParameterForBody:](self, "_changedParameterForBody:", 0);
}

- (void)_removeExplicitBoundaryPaths
{
  NSMutableDictionary *boundaryPaths;

  boundaryPaths = self->_boundaryPaths;
  self->_boundaryPaths = 0;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  UICollisionBehaviorMode v6;
  const __CFString *v7;
  const __CFString *v8;
  CGFloat top;
  double left;
  double bottom;
  double right;
  void *v13;
  void *v14;
  objc_super v16;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v16.receiver = self;
  v16.super_class = (Class)UICollisionBehavior;
  -[UIDynamicBehavior description](&v16, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[UICollisionBehavior collisionMode](self, "collisionMode");
  v7 = CFSTR(" (All) ");
  if (v6 == 1)
    v7 = CFSTR(" (Items) ");
  if (v6 == 2)
    v8 = CFSTR(" (Boundaries) ");
  else
    v8 = v7;
  objc_msgSend(v5, "appendString:", v8);
  if (-[UICollisionBehavior translatesReferenceBoundsIntoBoundary](self, "translatesReferenceBoundsIntoBoundary"))
  {
    top = self->_implicitBoundsInsets.top;
    left = self->_implicitBoundsInsets.left;
    bottom = self->_implicitBoundsInsets.bottom;
    right = self->_implicitBoundsInsets.right;
    if (left == 0.0 && top == 0.0 && right == 0.0 && bottom == 0.0)
    {
      objc_msgSend(v5, "appendString:", CFSTR("(Reference Bounds) "));
    }
    else
    {
      NSStringFromUIEdgeInsets(*(UIEdgeInsets *)&top);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("(Reference Bounds + %@) "), v13);

    }
  }
  else
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("(%@) "), self->_boundaryPaths);
  }
  -[UIDynamicBehavior _itemsDescription](self, "_itemsDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v14);

  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collisionDelegate);
  objc_storeStrong((id *)&self->_boundaryPaths, 0);
  objc_storeStrong((id *)&self->_boundaryBodies, 0);
  objc_storeStrong((id *)&self->_implicitBoundsBody, 0);
}

@end
