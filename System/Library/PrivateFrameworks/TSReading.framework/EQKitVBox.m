@implementation EQKitVBox

- (EQKitVBox)initWithChildBoxes:(id)a3 pivotIndex:(unint64_t)a4
{
  EQKitVBox *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EQKitVBox;
  result = -[EQKitCompoundBox initWithChildBoxes:](&v6, sel_initWithChildBoxes_, a3);
  if (result)
    result->mPivotIndex = a4;
  return result;
}

- (EQKitVBox)initWithChildBoxes:(id)a3
{
  return -[EQKitVBox initWithChildBoxes:pivotIndex:](self, "initWithChildBoxes:pivotIndex:", a3, 0);
}

- (EQKitVBox)init
{
  return -[EQKitVBox initWithChildBoxes:pivotIndex:](self, "initWithChildBoxes:pivotIndex:", 0, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithChildBoxes:pivotIndex:", -[EQKitCompoundBox childBoxes](self, "childBoxes"), -[EQKitVBox pivotIndex](self, "pivotIndex"));
}

- (BOOL)isEqual:(id)a3
{
  EQKitVBox *v3;
  BOOL v4;
  uint64_t v6;
  EQKitVBox *v7;
  EQKitVBox *v8;

  v3 = self;
  v4 = self == a3;
  LOBYTE(self) = self == a3;
  if (a3)
  {
    if (!v4)
    {
      LODWORD(self) = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
      if ((_DWORD)self)
      {
        v6 = -[EQKitVBox pivotIndex](v3, "pivotIndex");
        if (v6 == objc_msgSend(a3, "pivotIndex"))
        {
          v7 = -[EQKitCompoundBox childBoxes](v3, "childBoxes");
          self = (EQKitVBox *)objc_msgSend(a3, "childBoxes");
          if (v7 == self)
          {
            LOBYTE(self) = 1;
          }
          else
          {
            v8 = self;
            LOBYTE(self) = 0;
            if (v7 && v8)
              LOBYTE(self) = -[EQKitVBox isEqual:](v7, "isEqual:");
          }
        }
        else
        {
          LOBYTE(self) = 0;
        }
      }
    }
  }
  return (char)self;
}

- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  double v8;
  double v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  y = a4.y;
  x = a4.x;
  v26 = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)EQKitVBox;
  -[EQKitBox renderIntoContext:offset:](&v24, sel_renderIntoContext_offset_);
  if (a3)
  {
    -[EQKitCompoundBox height](self, "height");
    v9 = v8;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = -[EQKitCompoundBox childBoxes](self, "childBoxes", 0);
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = y - v9;
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v16, "layoutHeight");
          v18 = v13 + v17;
          objc_msgSend(v16, "renderIntoContext:offset:", a3, x, v18);
          objc_msgSend(v16, "layoutDepth");
          v13 = v18 + v19;
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v12);
    }
  }
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  double v8;
  double v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  double v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  double v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  y = a4.y;
  x = a4.x;
  v27 = *MEMORY[0x24BDAC8D0];
  -[EQKitCompoundBox height](self, "height");
  if ((*((_DWORD *)a3 + 6) | 2) == 2
    && (v9 = v8,
        v24 = 0u,
        v25 = 0u,
        v22 = 0u,
        v23 = 0u,
        v10 = -[EQKitCompoundBox childBoxes](self, "childBoxes", 0),
        (v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16)) != 0))
  {
    v12 = v11;
    v13 = 0;
    v14 = y - v9;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v17, "layoutHeight");
        v19 = v14 + v18;
        v13 |= objc_msgSend(v17, "appendOpticalAlignToSpec:offset:", a3, x, v19);
        objc_msgSend(v17, "layoutDepth");
        v14 = v19 + v20;
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }
  else
  {
    LOBYTE(v13) = 0;
  }
  return v13 & 1;
}

- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4
{
  double v7;
  double v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  CGAffineTransform v22;
  CGAffineTransform v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (a4 == self)
  {
LABEL_12:
    LOBYTE(v10) = 1;
  }
  else
  {
    -[EQKitCompoundBox height](self, "height");
    v8 = v7;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = -[EQKitCompoundBox childBoxes](self, "childBoxes");
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = -v8;
      v13 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v15, "layoutHeight");
          v17 = v12 + v16;
          if (objc_msgSend(v15, "p_getTransform:fromDescendant:", a3, a4))
          {
            v19 = *(_OWORD *)&a3->c;
            *(_OWORD *)&v22.a = *(_OWORD *)&a3->a;
            *(_OWORD *)&v22.c = v19;
            *(_OWORD *)&v22.tx = *(_OWORD *)&a3->tx;
            CGAffineTransformTranslate(&v23, &v22, 0.0, v17);
            v20 = *(_OWORD *)&v23.c;
            *(_OWORD *)&a3->a = *(_OWORD *)&v23.a;
            *(_OWORD *)&a3->c = v20;
            *(_OWORD *)&a3->tx = *(_OWORD *)&v23.tx;
            goto LABEL_12;
          }
          objc_msgSend(v15, "layoutDepth");
          v12 = v17 + v18;
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        LOBYTE(v10) = 0;
        if (v11)
          continue;
        break;
      }
    }
  }
  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[EQKitCompoundBox height](self, "height");
  v6 = v5;
  -[EQKitCompoundBox depth](self, "depth");
  v8 = v7;
  -[EQKitCompoundBox width](self, "width");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: height=%f depth=%f width=%f childBoxes=%@ pivotIndex=%lu"), v4, self, v6, v8, v9, -[EQKitCompoundBox childBoxes](self, "childBoxes"), -[EQKitVBox pivotIndex](self, "pivotIndex"));
}

- (void)p_cacheDimensionsForHeight:(double *)a3 depth:(double *)a4 width:(double *)a5
{
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t i;
  id v15;
  void *v16;
  double v17;
  double *v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;

  if (a3 || a4 || a5)
  {
    if (a3)
      *a3 = 0.0;
    if (a4)
      *a4 = 0.0;
    if (a5)
      *a5 = 0.0;
    v9 = -[EQKitCompoundBox childBoxes](self, "childBoxes");
    v10 = -[NSArray count](v9, "count");
    if (v10)
    {
      v11 = v10;
      v12 = v10 - 1;
      v13 = v10 - 1;
      if (-[EQKitVBox pivotIndex](self, "pivotIndex") < v10 - 1)
        v13 = -[EQKitVBox pivotIndex](self, "pivotIndex");
      for (i = 0; v11 != i; ++i)
      {
        v15 = -[NSArray objectAtIndex:](v9, "objectAtIndex:", i);
        v16 = v15;
        if (i >= v13)
        {
          if (i <= v13)
          {
            if (a3)
            {
              if (v13)
                objc_msgSend(v15, "layoutHeight");
              else
                objc_msgSend(v15, "height");
              *a3 = v19 + *a3;
            }
            if (!a4)
              goto LABEL_31;
            if (v13 == v12)
              objc_msgSend(v16, "depth");
            else
              objc_msgSend(v16, "layoutDepth");
LABEL_29:
            v18 = a4;
LABEL_30:
            *v18 = v17 + *v18;
            goto LABEL_31;
          }
          if (a4)
          {
            objc_msgSend(v15, "layoutVSize");
            goto LABEL_29;
          }
        }
        else if (a3)
        {
          objc_msgSend(v15, "layoutVSize");
          v18 = a3;
          goto LABEL_30;
        }
LABEL_31:
        if (a5)
        {
          v20 = *a5;
          objc_msgSend(v16, "width");
          if (v20 <= v21)
            objc_msgSend(v16, "width");
          else
            v22 = *(_QWORD *)a5;
          *(_QWORD *)a5 = v22;
        }
      }
    }
  }
}

- (CGRect)p_cacheErasableBounds
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  double v7;
  double v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t i;
  CGFloat v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect result;
  CGRect v43;

  v38 = *MEMORY[0x24BDAC8D0];
  x = *MEMORY[0x24BDBF090];
  y = *(double *)(MEMORY[0x24BDBF090] + 8);
  width = *(double *)(MEMORY[0x24BDBF090] + 16);
  height = *(double *)(MEMORY[0x24BDBF090] + 24);
  -[EQKitCompoundBox height](self, "height");
  v8 = v7;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v9 = -[EQKitCompoundBox childBoxes](self, "childBoxes");
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = -v8;
    v13 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        v15 = x;
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v16, "layoutHeight", *(_QWORD *)&v31);
        v18 = v12 + v17;
        objc_msgSend(v16, "erasableBounds");
        x = v19;
        v21 = v20;
        v23 = v22;
        v32 = v18;
        v25 = v18 + v24;
        objc_msgSend(v16, "layoutDepth");
        v31 = v26;
        v39.origin.x = v15;
        v39.origin.y = y;
        v39.size.width = width;
        v39.size.height = height;
        if (CGRectIsEmpty(v39))
        {
          y = v25;
          width = v21;
          height = v23;
        }
        else
        {
          v40.origin.x = v15;
          v40.origin.y = y;
          v40.size.width = width;
          v40.size.height = height;
          v43.origin.x = x;
          v43.origin.y = v25;
          v43.size.width = v21;
          v43.size.height = v23;
          v41 = CGRectUnion(v40, v43);
          x = v41.origin.x;
          y = v41.origin.y;
          width = v41.size.width;
          height = v41.size.height;
        }
        v12 = v32 + v31;
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v11);
  }
  v27 = x;
  v28 = y;
  v29 = width;
  v30 = height;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (unint64_t)pivotIndex
{
  return self->mPivotIndex;
}

@end
