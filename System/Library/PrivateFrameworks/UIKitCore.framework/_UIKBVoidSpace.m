@implementation _UIKBVoidSpace

- (_UIKBVoidSpace)init
{
  _UIKBVoidSpace *v2;
  NSMutableArray *v3;
  NSMutableArray *distinctSpaces;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIKBVoidSpace;
  v2 = -[_UIKBVoidSpace init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    distinctSpaces = v2->_distinctSpaces;
    v2->_distinctSpaces = v3;

  }
  return v2;
}

- (void)addRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double MinX;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  NSMutableArray *distinctSpaces;
  void *v22;
  NSMutableArray *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v29 = *MEMORY[0x1E0C80C00];
  MinX = CGRectGetMinX(a3);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = self->_distinctSpaces;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v13);
      objc_msgSend(v14, "CGRectValue", (_QWORD)v24);
      if (vabdd_f64(CGRectGetMaxX(v30), MinX) < 0.00000011920929)
        break;
      if (v11 == ++v13)
      {
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v15 = v14;

    if (!v15)
      goto LABEL_12;
    objc_msgSend(v15, "CGRectValue");
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    v32 = CGRectUnion(v31, v33);
    v16 = v32.origin.x;
    v17 = v32.origin.y;
    v18 = v32.size.width;
    v19 = v32.size.height;
    v20 = -[NSMutableArray indexOfObject:](self->_distinctSpaces, "indexOfObject:", v15);
    distinctSpaces = self->_distinctSpaces;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v16, v17, v18, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray replaceObjectAtIndex:withObject:](distinctSpaces, "replaceObjectAtIndex:withObject:", v20, v22);

  }
  else
  {
LABEL_9:

LABEL_12:
    v23 = self->_distinctSpaces;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height, (_QWORD)v24);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v23, "addObject:", v15);
  }

}

- (id)divideSpaceIntoNumberOfPieces:(unint64_t)a3
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;
  CGRect v32;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = self->_distinctSpaces;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v10), "CGRectValue", (_QWORD)v25);
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v19 = -[NSMutableArray count](self->_distinctSpaces, "count");
        if (v16 > 0.0)
        {
          v20 = v16 / (double)(a3 / v19);
          v21 = v16;
          v22 = v12;
          do
          {
            v31.origin.x = v12;
            v31.origin.y = v14;
            v31.size.width = v16;
            v31.size.height = v18;
            v32.origin.x = v22;
            v32.origin.y = v14;
            v32.size.width = v20;
            v32.size.height = v18;
            if (!CGRectContainsRect(v31, v32))
              break;
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v22, v14, v20, v18);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v23);

            v22 = v20 + v22;
            v21 = v21 - v20;
          }
          while (v21 > 0.0);
        }
        ++v10;
      }
      while (v10 != v8);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distinctSpaces, 0);
}

@end
