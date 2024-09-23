@implementation EQKitHBox

- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  y = a4.y;
  x = a4.x;
  v21 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)EQKitHBox;
  -[EQKitBox renderIntoContext:offset:](&v19, sel_renderIntoContext_offset_);
  if (a3)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = -[EQKitCompoundBox childBoxes](self, "childBoxes", 0);
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v13, "renderIntoContext:offset:", a3, x, y);
          objc_msgSend(v13, "width");
          x = x + v14;
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v10);
    }
  }
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  int v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  NSEnumerator *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  double v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  y = a4.y;
  x = a4.x;
  v36 = *MEMORY[0x24BDAC8D0];
  v8 = *((_DWORD *)a3 + 6);
  if (v8 == 2)
  {
    -[EQKitCompoundBox width](self, "width");
    v17 = v16;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v18 = -[NSArray reverseObjectEnumerator](-[EQKitCompoundBox childBoxes](self, "childBoxes", 0), "reverseObjectEnumerator");
    v10 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v10)
    {
      v19 = v10;
      v20 = x + v17;
      v21 = *(_QWORD *)v27;
LABEL_14:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v22);
        objc_msgSend(v23, "width");
        v20 = v20 - v24;
        if ((objc_msgSend(v23, "appendOpticalAlignToSpec:offset:", a3, v20, y) & 1) != 0)
          goto LABEL_21;
        if (v19 == ++v22)
        {
          v19 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          LOBYTE(v10) = 0;
          if (v19)
            goto LABEL_14;
          return v10;
        }
      }
    }
  }
  else
  {
    if (v8)
    {
      LOBYTE(v10) = 0;
      return v10;
    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = -[EQKitCompoundBox childBoxes](self, "childBoxes");
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v31;
LABEL_5:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v13);
        if ((objc_msgSend(v14, "appendOpticalAlignToSpec:offset:", a3, x, y) & 1) != 0)
          break;
        objc_msgSend(v14, "width");
        x = x + v15;
        if (v11 == ++v13)
        {
          v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
          LOBYTE(v10) = 0;
          if (v11)
            goto LABEL_5;
          return v10;
        }
      }
LABEL_21:
      LOBYTE(v10) = 1;
    }
  }
  return v10;
}

- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4
{
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  __int128 v14;
  __int128 v15;
  CGAffineTransform v17;
  CGAffineTransform v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (a4 == self)
  {
LABEL_12:
    LOBYTE(v7) = 1;
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = -[EQKitCompoundBox childBoxes](self, "childBoxes");
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      v10 = 0.0;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v12, "p_getTransform:fromDescendant:", a3, a4))
          {
            v14 = *(_OWORD *)&a3->c;
            *(_OWORD *)&v17.a = *(_OWORD *)&a3->a;
            *(_OWORD *)&v17.c = v14;
            *(_OWORD *)&v17.tx = *(_OWORD *)&a3->tx;
            CGAffineTransformTranslate(&v18, &v17, v10, 0.0);
            v15 = *(_OWORD *)&v18.c;
            *(_OWORD *)&a3->a = *(_OWORD *)&v18.a;
            *(_OWORD *)&a3->c = v15;
            *(_OWORD *)&a3->tx = *(_OWORD *)&v18.tx;
            goto LABEL_12;
          }
          objc_msgSend(v12, "width");
          v10 = v10 + v13;
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        LOBYTE(v7) = 0;
        if (v8)
          continue;
        break;
      }
    }
  }
  return v7;
}

- (void)p_cacheDimensionsForHeight:(double *)a3 depth:(double *)a4 width:(double *)a5
{
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (!a3 && !a4 && !a5)
    return;
  if (a5)
    *a5 = 0.0;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = -[EQKitCompoundBox childBoxes](self, "childBoxes", 0);
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v9)
  {
    v12 = 1;
    if (a3)
      goto LABEL_34;
    goto LABEL_36;
  }
  v10 = v9;
  v11 = *(_QWORD *)v25;
  v12 = 1;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v25 != v11)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v13);
      objc_msgSend(v14, "vsize");
      if (v15 == 0.0)
        goto LABEL_24;
      if (a3)
      {
        if ((v12 & 1) != 0 || (v16 = *a3, objc_msgSend(v14, "height"), v16 <= v17))
          objc_msgSend(v14, "height");
        else
          v18 = *(_QWORD *)a3;
        *(_QWORD *)a3 = v18;
      }
      if (a4)
      {
        if ((v12 & 1) != 0 || (v19 = *a4, objc_msgSend(v14, "depth"), v19 <= v20))
          objc_msgSend(v14, "depth");
        else
          v21 = *(_QWORD *)a4;
        v12 = 0;
        *(_QWORD *)a4 = v21;
LABEL_24:
        if (!a5)
          goto LABEL_26;
LABEL_25:
        objc_msgSend(v14, "width");
        *a5 = v22 + *a5;
        goto LABEL_26;
      }
      v12 = 0;
      if (a5)
        goto LABEL_25;
LABEL_26:
      ++v13;
    }
    while (v10 != v13);
    v23 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    v10 = v23;
  }
  while (v23);
  if (!a3)
    goto LABEL_36;
LABEL_34:
  if ((v12 & 1) != 0)
    *a3 = 0.0;
LABEL_36:
  if (((a4 != 0) & v12) == 1)
    *a4 = 0.0;
}

- (CGRect)p_cacheErasableBounds
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat r2;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect result;
  CGRect v37;

  v32 = *MEMORY[0x24BDAC8D0];
  x = *MEMORY[0x24BDBF090];
  y = *(double *)(MEMORY[0x24BDBF090] + 8);
  width = *(double *)(MEMORY[0x24BDBF090] + 16);
  height = *(double *)(MEMORY[0x24BDBF090] + 24);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = -[EQKitCompoundBox childBoxes](self, "childBoxes");
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v12, "erasableBounds");
        v14 = v13;
        v16 = v15;
        r2 = v17;
        v19 = v10 + v18;
        objc_msgSend(v12, "width");
        v26 = v20;
        v33.origin.x = x;
        v33.origin.y = y;
        v33.size.width = width;
        v33.size.height = height;
        if (CGRectIsEmpty(v33))
        {
          x = v19;
          y = v14;
          width = v16;
          height = r2;
        }
        else
        {
          v34.origin.x = x;
          v34.origin.y = y;
          v34.size.width = width;
          v34.size.height = height;
          v37.origin.x = v19;
          v37.origin.y = v14;
          v37.size.width = v16;
          v37.size.height = r2;
          v35 = CGRectUnion(v34, v37);
          x = v35.origin.x;
          y = v35.origin.y;
          width = v35.size.width;
          height = v35.size.height;
        }
        v10 = v10 + v26;
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v8);
  }
  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

@end
