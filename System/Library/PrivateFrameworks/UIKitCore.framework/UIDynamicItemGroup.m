@implementation UIDynamicItemGroup

- (UIDynamicItemGroup)initWithItems:(NSArray *)items
{
  NSArray *v4;
  UIDynamicItemGroup *v5;
  uint64_t v6;
  NSMapTable *itemsToOffsets;
  double v8;
  double v9;
  double v10;
  double v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  NSMapTable *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = items;
  v31.receiver = self;
  v31.super_class = (Class)UIDynamicItemGroup;
  v5 = -[UIDynamicItemGroup init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    itemsToOffsets = v5->_itemsToOffsets;
    v5->_itemsToOffsets = (NSMapTable *)v6;

    if (-[NSArray count](v4, "count"))
    {
      v8 = unionRectOfItems(v4);
      v5->_center.x = v8 + v9 * 0.5;
      v5->_center.y = v11 + v10 * 0.5;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v12 = v4;
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v28 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v18 = (void *)MEMORY[0x1E0C99DA0];
              v19 = (objc_class *)objc_opt_class();
              NSStringFromClass(v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "raise:format:", CFSTR("Invalid Argument"), CFSTR("%@ cannot be initialized with items containing %@"), v20, objc_opt_class());

            }
            v21 = v5->_itemsToOffsets;
            v22 = (void *)MEMORY[0x1E0CB3B18];
            objc_msgSend(v17, "center");
            objc_msgSend(v22, "valueWithCGPoint:", v23 - v5->_center.x, v24 - v5->_center.y);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMapTable setObject:forKey:](v21, "setObject:forKey:", v25, v17);

          }
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v14);
      }

    }
  }

  return v5;
}

- (NSArray)items
{
  void *v2;
  void *v3;

  -[NSMapTable keyEnumerator](self->_itemsToOffsets, "keyEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  y = a3.y;
  x = a3.x;
  v22 = *MEMORY[0x1E0C80C00];
  v5 = self->_center.x;
  v6 = self->_center.y;
  self->_center = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[UIDynamicItemGroup items](self, "items", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = x - v5;
    v11 = y - v6;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v14, "center");
        objc_msgSend(v14, "setCenter:", v10 + v15, v11 + v16);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

- (CGPoint)center
{
  double x;
  double y;
  CGPoint result;

  x = self->_center.x;
  y = self->_center.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  double v17;
  __int128 v18;
  __int128 v19;
  double v20;
  _OWORD v21[3];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CGAffineTransform t2;
  CGAffineTransform t1;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_transform.tx;
  v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.c = v6;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v7 = *(_OWORD *)&a3->a;
    v8 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
    *(_OWORD *)&self->_transform.tx = v8;
    *(_OWORD *)&self->_transform.a = v7;
    -[UIDynamicItemGroup items](self, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v14, "center", v19);
          -[NSMapTable objectForKey:](self->_itemsToOffsets, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "CGPointValue");
          v19 = v16;
          v20 = v17;

          objc_msgSend(v14, "setCenter:", vaddq_f64(vaddq_f64(*(float64x2_t *)&a3->tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&a3->a, *(double *)&v19), vmulq_n_f64(*(float64x2_t *)&a3->c, v20))), (float64x2_t)self->_center));
          v18 = *(_OWORD *)&a3->c;
          v21[0] = *(_OWORD *)&a3->a;
          v21[1] = v18;
          v21[2] = *(_OWORD *)&a3->tx;
          objc_msgSend(v14, "setTransform:", v21);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v11);
    }

  }
}

- (CGRect)bounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  -[UIDynamicItemGroup items](self, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unionRectOfItems(v2);
  v4 = v3;
  v6 = v5;

  v7 = *MEMORY[0x1E0C9D538];
  v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v9 = v4;
  v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].c;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsToOffsets, 0);
}

@end
