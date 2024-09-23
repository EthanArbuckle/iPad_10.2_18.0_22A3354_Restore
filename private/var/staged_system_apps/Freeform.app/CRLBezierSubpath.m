@implementation CRLBezierSubpath

- (CRLBezierSubpath)init
{
  CRLBezierSubpath *v2;
  NSMutableArray *v3;
  NSMutableArray *mNodes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLBezierSubpath;
  v2 = -[CRLBezierSubpath init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mNodes = v2->mNodes;
    v2->mNodes = v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  Class v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  objc_opt_class(self, a2);
  v5 = objc_alloc_init(v4);
  v6 = objc_alloc((Class)NSArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v8 = objc_msgSend(v6, "initWithArray:copyItems:", v7, 1);

  objc_msgSend(v5, "setNodes:", v8);
  objc_msgSend(v5, "setClosed:", self->mClosed);

  return v5;
}

- (id)description
{
  Class v3;
  NSString *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)v5;
  if (self->mClosed)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p nodes=%p closed=%@>"), v5, self, self->mNodes, v7));

  return v8;
}

- (void)setNodes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *mNodes;

  v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  mNodes = self->mNodes;
  self->mNodes = v4;

}

- (BOOL)isRectangular
{
  unsigned int v3;
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  void **v10;
  double *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  double *v16;
  double v17;
  double v18;
  double *v19;
  double v20;
  double v21;
  double *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  BOOL v41;
  double v43;
  double v44[6];
  _OWORD v45[2];

  v3 = -[CRLBezierSubpath isClosed](self, "isClosed");
  if (!v3)
    return v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v5 = objc_msgSend(v4, "count");

  if (v5 != (id)4)
    goto LABEL_24;
  memset(v45, 0, sizeof(v45));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  objc_msgSend(v6, "getObjects:range:", v45, 0, 4);

  v7 = 0;
  do
  {
    v3 = objc_msgSend(*((id *)v45 + v7), "isCollapsed");
    if (v3)
      v8 = v7 >= 3;
    else
      v8 = 1;
    ++v7;
  }
  while (!v8);
  if (v3)
  {
    v9 = 0;
    v10 = (void **)v45;
    do
    {
      v11 = &v44[v9 - 1];
      v12 = *v10++;
      objc_msgSend(v12, "nodePoint");
      *(_QWORD *)v11 = v13;
      *((_QWORD *)v11 + 1) = v14;
      v9 += 2;
    }
    while (v9 != 8);
    v15 = 0;
    v16 = v44;
    do
    {
      v17 = *(v16 - 1);
      v18 = *v16;
      v19 = &v44[2 * ((v15 + 1) & 3) - 1];
      v20 = *v19;
      v21 = v19[1];
      v22 = &v44[2 * ((v15 + 2) & 3) - 1];
      v23 = *v22;
      v24 = v22[1];
      v25 = sub_10006108C(v17, *v16, v20, v21);
      v26 = sub_10006108C(v20, v21, v23, v24);
      v27 = vabdd_f64(sub_10006108C(v17, v18, v23, v24), sqrt(v26 * v26 + v25 * v25));
      v16 += 2;
    }
    while (v27 <= 0.00100000005 && v15++ < 3);
    if (v27 <= 0.00100000005)
    {
      v29 = sub_10005FDB0(v43, v44[0], v44[1]);
      v33 = sub_1000615D8(v29, v30, v31, v32, v44[3]);
      v37 = sub_1000615D8(v33, v34, v35, v36, v44[5]);
      v39 = v38;
      v40 = 0;
      do
      {
        LOBYTE(v3) = sub_10005FDF0(v44[v40 - 1], v44[v40], v37, v39);
        if ((v3 & 1) != 0)
          break;
        v41 = v40 == 6;
        v40 += 2;
      }
      while (!v41);
      return v3;
    }
LABEL_24:
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)isCircular
{
  _BOOL4 v3;
  void *v4;
  unsigned __int8 v5;

  v3 = -[CRLBezierSubpath isClosed](self, "isClosed");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath bezierPath](self, "bezierPath"));
    v5 = objc_msgSend(v4, "isCircular");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (CRLBezierPath)bezierPath
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  -[CRLBezierSubpath appendToBezierPath:selectedNodesOnly:fromIndex:](self, "appendToBezierPath:selectedNodesOnly:fromIndex:", v3, 0, 0);
  return (CRLBezierPath *)v3;
}

- (void)appendToBezierPath:(id)a3 selectedNodesOnly:(BOOL)a4 fromIndex:(unint64_t)a5
{
  _BOOL4 v6;
  void *v8;
  unint64_t v9;
  BOOL v10;
  char v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  char v18;
  char *v19;
  unint64_t v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  _BOOL4 v35;
  void *v36;
  id v37;

  v6 = a4;
  v37 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v9 = (unint64_t)objc_msgSend(v8, "count");

  if (!v9)
    goto LABEL_27;
  if (a5)
    v10 = 1;
  else
    v10 = !self->mClosed;
  v11 = !v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", a5));

  objc_msgSend(v13, "nodePoint");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v37, "moveToPoint:");
  v18 = 0;
  v19 = (char *)(v9 + self->mClosed);
  v20 = a5 + 1;
  while (1)
  {
    v21 = v13;
    if (v20 >= (unint64_t)v19)
      break;
    v22 = v17;
    v23 = v15;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", v20 % v9));

    objc_msgSend(v13, "nodePoint");
    v15 = v25;
    v17 = v26;
    if (!v6 || objc_msgSend(v21, "isSelected") && objc_msgSend(v13, "isSelected"))
    {
      objc_msgSend(v21, "outControlPoint");
      v28 = v27;
      v30 = v29;
      objc_msgSend(v13, "inControlPoint");
      v32 = v31;
      v34 = v33;
      if ((v18 & 1) != 0)
        objc_msgSend(v37, "moveToPoint:", v23, v22);
      if (sub_10005FDF0(v23, v22, v28, v30))
      {
        v35 = sub_10005FDF0(v32, v34, v15, v17);
        v36 = v37;
        if (v35)
        {
          objc_msgSend(v37, "lineToPoint:", v15, v17);
LABEL_21:
          v18 = 0;
          goto LABEL_22;
        }
      }
      else
      {
        v36 = v37;
      }
      objc_msgSend(v36, "curveToPoint:controlPoint1:controlPoint2:", v15, v17, v28, v30, v32, v34);
      goto LABEL_21;
    }
    v11 = 0;
    v18 = 1;
LABEL_22:

    ++v20;
    if (!v13)
    {
      v21 = 0;
      break;
    }
  }
  if ((v11 & 1) != 0)
    objc_msgSend(v37, "closePath");

LABEL_27:
}

- (void)appendToBezierPath:(id)a3
{
  -[CRLBezierSubpath appendToBezierPath:selectedNodesOnly:fromIndex:](self, "appendToBezierPath:selectedNodesOnly:fromIndex:", a3, 0, 0);
}

- (void)updateReflectedState
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  objc_msgSend(v2, "makeObjectsPerformSelector:", "updateReflectedState");

}

- (void)reverseDirection
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reverseObjectEnumerator"));

  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextObject"));
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      objc_msgSend(v6, "swapControlPoints");
      objc_msgSend(v4, "addObject:", v6);
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextObject"));

      v6 = (void *)v7;
    }
    while (v7);
  }
  -[CRLBezierSubpath setNodes:](self, "setNodes:", v4);

}

- (void)transformUsingAffineTransform:(CGAffineTransform *)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  _OWORD v11[3];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8);
        v10 = *(_OWORD *)&a3->c;
        v11[0] = *(_OWORD *)&a3->a;
        v11[1] = v10;
        v11[2] = *(_OWORD *)&a3->tx;
        objc_msgSend(v9, "transformUsingAffineTransform:", v11);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)addNode:(id)a3
{
  -[NSMutableArray addObject:](self->mNodes, "addObject:", a3);
}

- (void)removeNode:(id)a3
{
  -[NSMutableArray removeObject:](self->mNodes, "removeObject:", a3);
}

- (void)removeLastNode
{
  -[NSMutableArray removeLastObject](self->mNodes, "removeLastObject");
}

- (id)nodePriorToNode:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v6 = (uint64_t)objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 < 1)
  {
    if (!self->mClosed)
    {
      v9 = 0;
      return v9;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v6 - 1));
  }
  v9 = (void *)v8;

  return v9;
}

- (id)nodeAfterNode:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  char *v7;
  void *v8;
  char *v9;
  void *v10;
  void *v11;
  char *v12;
  void *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v6 = (char *)objc_msgSend(v5, "indexOfObject:", v4);

  v7 = v6 + 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v9 = (char *)objc_msgSend(v8, "count");

  if (v7 >= v9)
  {
    if (!self->mClosed)
    {
      v13 = 0;
      return v13;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
    v11 = v10;
    v12 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
    v11 = v10;
    v12 = v7;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", v12));

  return v13;
}

- (CRLBezierNode)firstNode
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  return (CRLBezierNode *)v3;
}

- (CRLBezierNode)lastNode
{
  _BOOL4 mClosed;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  mClosed = self->mClosed;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v4 = v3;
  if (mClosed)
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", 0));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));
  v6 = (void *)v5;

  return (CRLBezierNode *)v6;
}

- (void)offsetSelectedNodesByDelta:(CGPoint)a3
{
  double x;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  x = a3.x;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "isSelected"))
        {
          objc_msgSend(v9, "nodePoint");
          objc_msgSend(v9, "moveToPoint:", sub_1000603D0(v10, v11, x));
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)offsetSelectedEdgesByDelta:(CGPoint)a3
{
  double x;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  id v14;

  x = a3.x;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectEnumerator"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));

  v8 = objc_msgSend(v7, "isSelected");
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "nextObject"));
  if (v9)
  {
    v10 = (void *)v9;
    do
    {
      if ((v8 & 1) != 0 || objc_msgSend(v10, "isSelected"))
      {
        objc_msgSend(v10, "nodePoint");
        objc_msgSend(v10, "moveToPoint:", sub_1000603D0(v11, v12, x));
        v8 = objc_msgSend(v10, "isSelected");
      }
      else
      {
        v8 = 0;
      }
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "nextObject"));

      v10 = (void *)v13;
    }
    while (v13);
  }

}

- (BOOL)allNodesSelected
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "reverseObjectEnumerator"));

  v4 = 0;
  do
  {
    v5 = v4;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextObject"));

  }
  while (v4 && (objc_msgSend(v4, "isSelected") & 1) != 0);

  return v4 == 0;
}

- (BOOL)hasSelectedNode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "reverseObjectEnumerator"));

  v4 = 0;
  do
  {
    v5 = v4;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextObject"));

  }
  while (v4 && !objc_msgSend(v4, "isSelected"));

  return v4 != 0;
}

- (BOOL)canDeleteSelectedNodes
{
  void *v2;
  void *v3;
  int v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectEnumerator"));

  v4 = 0;
  v5 = 0;
  v6 = 0;
  do
  {
    v7 = v6;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextObject"));

    if (!v6)
      break;
    v8 = objc_msgSend(v6, "isSelected");
    v4 |= v8;
    v5 += v8 ^ 1;
  }
  while ((v4 & 1) == 0 || v5 < 2);

  return v6 != 0;
}

- (void)deleteSelectedNodes
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectEnumerator"));

  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextObject"));
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      if ((objc_msgSend(v6, "isSelected") & 1) == 0)
        objc_msgSend(v4, "addObject:", v6);
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextObject"));

      v6 = (void *)v7;
    }
    while (v7);
  }
  -[CRLBezierSubpath setNodes:](self, "setNodes:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v9 = objc_msgSend(v8, "count");

  if ((unint64_t)v9 <= 1)
    -[CRLBezierSubpath setClosed:](self, "setClosed:", 0);

}

- (void)selectAllNodes
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "setSelected:", 1);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)deselectAllNodes
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "setSelected:", 0);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (double)distanceToPoint:(CGPoint)a3 elementIndex:(unint64_t *)a4 tValue:(double *)a5 threshold:(double)a6
{
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  unint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double y;
  double x;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double *v48;
  double v49;
  double v51;
  double v52;
  float64x2_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v11 = (unint64_t)objc_msgSend(v10, "count");

  if (!v11)
    return 1.79769313e308;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 0));

  objc_msgSend(v13, "nodePoint");
  v16 = 0;
  v17 = v11 + self->mClosed;
  v18 = 0.0;
  v19 = 1.79769313e308;
  v48 = a5;
  if (v17 < 2 || (v20 = v14, v21 = v15, v22 = a6 * a6, v23 = 1.79769313e308, v49 = a6 * a6, a6 * a6 >= 1.79769313e308))
  {
    v24 = v13;
    v45 = 0;
LABEL_17:
    if (!a4)
      goto LABEL_19;
  }
  else
  {
    v24 = 0;
    v16 = 0;
    v19 = 1.79769313e308;
    v25 = 2;
    while (1)
    {
      v51 = v19;
      v52 = v18;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes", v23, v22, v48));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectAtIndexedSubscript:", (v25 - 1) % v11));

      objc_msgSend(v27, "nodePoint");
      v29 = v28;
      v31 = v30;
      objc_msgSend(v13, "outControlPoint");
      v33 = v32;
      v35 = v34;
      objc_msgSend(v27, "inControlPoint");
      v37 = v36;
      v39 = v38;
      if (!sub_10005FDF0(v20, v21, v33, v35))
        goto LABEL_8;
      if (sub_10005FDF0(v37, v39, v29, v31))
      {
        v53.f64[0] = v20;
        v53.f64[1] = v21;
        v54 = v29;
        v55 = v31;
        x = a3.x;
        y = a3.y;
        v18 = sub_1003135C8(v53.f64, a3.x, a3.y);
        v42 = sub_100061A8C(v53.f64[0], v53.f64[1], v54, v55, v18);
      }
      else
      {
LABEL_8:
        v53.f64[0] = v20;
        v53.f64[1] = v21;
        v54 = v33;
        v55 = v35;
        v56 = v37;
        v57 = v39;
        v58 = v29;
        v59 = v31;
        x = a3.x;
        y = a3.y;
        v18 = sub_10031367C(&v53, a3.x, a3.y, 1.0);
        v42 = sub_1000602A8(&v53, v18);
      }
      v44 = sub_10006010C(v42, v43, x, y);
      v19 = v51;
      if (v44 >= v51)
      {
        v18 = v52;
      }
      else
      {
        v19 = v44;
        v16 = v25 - 2;
      }
      v24 = v27;

      if (v25 >= v17)
        break;
      ++v25;
      v23 = v49;
      v45 = v24;
      v21 = v31;
      v20 = v29;
      v13 = v24;
      if (v19 <= v49)
        goto LABEL_17;
    }
    v45 = v24;
    if (!a4)
      goto LABEL_19;
  }
  *a4 = v16;
LABEL_19:
  if (v48)
    *v48 = v18;
  v46 = sqrt(v19);

  return v46;
}

- (id)bezierNodeUnderPoint:(CGPoint)a3 withTransform:(CGAffineTransform *)a4 andTolerance:(double)a5 returningType:(int64_t *)a6
{
  double y;
  double x;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  id v16;
  _OWORD v18[3];

  y = a3.y;
  x = a3.x;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectEnumerator"));

  v13 = 0;
  while (1)
  {
    v14 = v13;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nextObject"));

    if (!v13)
      break;
    v15 = *(_OWORD *)&a4->c;
    v18[0] = *(_OWORD *)&a4->a;
    v18[1] = v15;
    v18[2] = *(_OWORD *)&a4->tx;
    if (objc_msgSend(v13, "underPoint:withTransform:andTolerance:returningType:", v18, a6, x, y, a5))
    {
      v16 = v13;
      break;
    }
  }

  return v13;
}

- (CGRect)nodeBounds
{
  CGFloat width;
  CGFloat height;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double x;
  double v12;
  CGFloat y;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect result;

  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectEnumerator"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextObject"));
    objc_msgSend(v9, "nodePoint");
    x = v10;
    y = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextObject"));

    if (v14)
    {
      do
      {
        objc_msgSend(v14, "nodePoint");
        x = sub_1000615D8(x, y, width, height, v15);
        y = v16;
        width = v17;
        height = v18;
        if (objc_msgSend(v14, "isSelected"))
        {
          objc_msgSend(v14, "inControlPoint");
          v20 = sub_1000615D8(x, y, width, height, v19);
          v22 = v21;
          v24 = v23;
          v26 = v25;
          objc_msgSend(v14, "outControlPoint");
          x = sub_1000615D8(v20, v22, v24, v26, v27);
          y = v28;
          width = v29;
          height = v30;
        }
        v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextObject"));

        v14 = (void *)v31;
      }
      while (v31);
    }

  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
  }
  v32 = x;
  v33 = y;
  v34 = width;
  v35 = height;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (void)sharpenAllNodes
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  objc_msgSend(v2, "makeObjectsPerformSelector:", "collapse");

}

- (void)smoothNode:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  double y;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double x;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  int8x16_t v94;
  int8x16_t v95;
  int8x16_t v96;
  int8x16_t v97;
  BOOL v98;
  int8x16_t v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  id v113;

  v113 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodePriorToNode:](self, "nodePriorToNode:", v113));
  v5 = objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodeAfterNode:](self, "nodeAfterNode:", v113));
  v6 = (void *)v5;
  y = CGPointZero.y;
  if (v4)
  {
    objc_msgSend(v4, "nodePoint");
    v9 = v8;
    v11 = v10;
    objc_msgSend(v113, "nodePoint");
    x = sub_1000603B8(v9, v11, v12);
    v15 = v14;
    if (!v6)
    {
      objc_msgSend(v113, "nodePoint");
      v17 = v16;
      v19 = v18;
      v20 = sub_1000603DC(x, v15, 0.330000013);
      objc_msgSend(v113, "setInControlPoint:", sub_1000603D0(v17, v19, v20));
      goto LABEL_22;
    }
  }
  else
  {
    x = CGPointZero.x;
    v15 = CGPointZero.y;
    if (!v5)
      goto LABEL_22;
  }
  objc_msgSend(v6, "nodePoint");
  v22 = v21;
  v24 = v23;
  objc_msgSend(v113, "nodePoint");
  v26 = sub_1000603B8(v22, v24, v25);
  v28 = v27;
  if (v4)
  {
    if (!sub_10005FDF0(x, v15, CGPointZero.x, y) && !sub_10005FDF0(v26, v28, CGPointZero.x, y))
    {
      objc_msgSend(v113, "inControlPoint");
      v30 = v29;
      v32 = v31;
      objc_msgSend(v113, "nodePoint");
      if (sub_10005FDF0(v30, v32, v33, v34))
      {
        objc_msgSend(v113, "nodePoint");
        v36 = v35;
        v38 = v37;
        v39 = sub_1000603DC(x, v15, 0.100000001);
        objc_msgSend(v113, "setInControlPoint:", sub_1000603D0(v36, v38, v39));
      }
      objc_msgSend(v113, "outControlPoint");
      v41 = v40;
      v43 = v42;
      objc_msgSend(v113, "nodePoint");
      if (sub_10005FDF0(v41, v43, v44, v45))
      {
        objc_msgSend(v113, "nodePoint");
        v47 = v46;
        v49 = v48;
        v50 = sub_1000603DC(v26, v28, 0.100000001);
        objc_msgSend(v113, "setOutControlPoint:", sub_1000603D0(v47, v49, v50));
      }
      objc_msgSend(v113, "inControlPoint");
      v52 = v51;
      v54 = v53;
      objc_msgSend(v113, "nodePoint");
      v56 = sub_1000603B8(v52, v54, v55);
      v58 = v57;
      v59 = sub_100061070(v56, v57);
      v111 = sub_1000603DC(v56, v58, 1.0 / v59);
      v112 = v60;
      objc_msgSend(v113, "nodePoint");
      v62 = v61;
      v64 = v63;
      objc_msgSend(v113, "outControlPoint");
      v66 = sub_1000603B8(v62, v64, v65);
      v68 = v67;
      v69 = sub_100061070(v66, v67);
      v70 = sub_1000603DC(v66, v68, 1.0 / v69);
      v72 = v71;
      v73 = sub_100061070(x, v15);
      v74 = v73 * 0.5 + (v59 - v73 * 0.5) * 0.699999988;
      v75 = sub_100061070(v26, v28) * 0.5;
      v76 = v75 + (v69 - v75) * 0.699999988;
      v77 = sub_1000603D0(v111, v112, v70);
      v79 = sub_1000603DC(v77, v78, 0.5);
      v81 = v80;
      v82 = sub_100061070(v79, v80);
      if (v82 >= 0.5)
        v83 = sub_1000603DC(v79, v81, 1.0 / v82);
      else
        v83 = sub_10006200C(0, v70, v72);
      v90 = v83;
      v91 = v84;
      v92 = v74 * sub_1000603C4(v111, v112, v83, v84);
      v93 = -(v76 * sub_1000603C4(v70, v72, v90, v91));
      *(double *)v95.i64 = fabs(v92);
      *(double *)v96.i64 = v74 * 0.5;
      if (*(double *)v95.i64 < v74 * 0.5)
      {
        *(float *)v96.i32 = *(double *)v96.i64;
        *(float *)v95.i32 = v92;
        v97.i64[0] = 0x8000000080000000;
        v97.i64[1] = 0x8000000080000000;
        v96 = vbslq_s8(v97, v96, v95);
        v92 = *(float *)v96.i32;
      }
      *(double *)v96.i64 = fabs(v93);
      *(double *)v94.i64 = v76 * 0.5;
      v98 = *(double *)v96.i64 < v76 * 0.5;
      *(float *)v94.i32 = v76 * 0.5;
      *(float *)v96.i32 = v93;
      v99.i64[0] = 0x8000000080000000;
      v99.i64[1] = 0x8000000080000000;
      *(double *)v94.i64 = *(float *)vbslq_s8(v99, v94, v96).i32;
      if (v98)
        v100 = *(double *)v94.i64;
      else
        v100 = v93;
      objc_msgSend(v113, "nodePoint");
      v102 = v101;
      v104 = v103;
      v105 = sub_1000603DC(v90, v91, v92);
      objc_msgSend(v113, "setInControlPoint:", sub_1000603D0(v102, v104, v105));
      objc_msgSend(v113, "nodePoint");
      v107 = v106;
      v109 = v108;
      v110 = sub_1000603DC(v90, v91, v100);
      objc_msgSend(v113, "setOutControlPoint:", sub_1000603D0(v107, v109, v110));
      objc_msgSend(v113, "setReflectedState:", 1);
    }
  }
  else
  {
    objc_msgSend(v113, "nodePoint");
    v86 = v85;
    v88 = v87;
    v89 = sub_1000603DC(v26, v28, 0.330000013);
    objc_msgSend(v113, "setOutControlPoint:", sub_1000603D0(v86, v88, v89));
  }
LABEL_22:

}

- (BOOL)closeIfEndpointsAreEqual
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (-[CRLBezierSubpath isClosed](self, "isClosed"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath firstNode](self, "firstNode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath lastNode](self, "lastNode"));
    objc_msgSend(v5, "nodePoint");
    v7 = v6;
    v9 = v8;
    objc_msgSend(v4, "nodePoint");
    v3 = sub_10005FDF0(v7, v9, v10, v11);
    if (v3)
    {
      objc_msgSend(v5, "inControlPoint");
      objc_msgSend(v4, "setInControlPoint:");
      -[CRLBezierSubpath removeLastNode](self, "removeLastNode");
      -[CRLBezierSubpath setClosed:](self, "setClosed:", 1);
    }
    objc_msgSend(v4, "updateReflectedState");

  }
  return v3;
}

- (void)addNodesToArray:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  objc_msgSend(v4, "addObjectsFromArray:", v5);

}

- (id)splitEdgeAtIndex:(unint64_t)a3 atPercentage:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  float64_t v12;
  double v13;
  float64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CRLBezierNode *v30;
  void *v31;
  void *v32;
  id v33;
  char v36[16];
  double v37;
  double v38;
  double v39;
  double v40;
  char v41[16];
  double v42;
  double v43;
  double v44;
  double v45;
  float64x2_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a3));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v9 = a3 + 1;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", (a3 + 1) % (unint64_t)objc_msgSend(v10, "count")));

  objc_msgSend(v7, "nodePoint");
  v13 = v12;
  v15 = v14;
  v46.f64[0] = v12;
  v46.f64[1] = v14;
  objc_msgSend(v7, "outControlPoint");
  v17 = v16;
  v19 = v18;
  v47 = v16;
  v48 = v18;
  objc_msgSend(v11, "inControlPoint");
  v21 = v20;
  v23 = v22;
  v49 = v20;
  v50 = v22;
  objc_msgSend(v11, "nodePoint");
  v25 = v24;
  v27 = v26;
  v51 = v24;
  v52 = v26;
  if (sub_10005FDF0(v13, v15, v17, v19) && sub_10005FDF0(v21, v23, v25, v27))
  {
    v47 = sub_100061A8C(v13, v15, v25, v27, 0.333333333);
    v48 = v28;
    v49 = sub_100061A8C(v13, v15, v25, v27, 0.666666667);
    v50 = v29;
  }
  v30 = +[CRLBezierNode bezierNodeWithPoint:](CRLBezierNode, "bezierNodeWithPoint:", sub_1000602A8(&v46, a4));
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  objc_msgSend(v31, "setReflectedState:", 2);
  objc_msgSend(v31, "setType:", 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v33 = objc_msgSend(v32, "mutableCopy");

  objc_msgSend(v33, "insertObject:atIndex:", v31, v9);
  -[CRLBezierSubpath setNodes:](self, "setNodes:", v33);
  sub_100313400(&v46, (uint64_t)v41, 0.0, a4);
  sub_100313400(&v46, (uint64_t)v36, a4, 1.0);
  objc_msgSend(v7, "setOutControlPoint:", v42, v43);
  objc_msgSend(v31, "setInControlPoint:", v44, v45);
  objc_msgSend(v31, "setOutControlPoint:", v37, v38);
  objc_msgSend(v11, "setInControlPoint:", v39, v40);

  return v31;
}

- (void)convertToHobby
{
  void *v3;
  unint64_t v4;
  void *v5;
  char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v4 = (unint64_t)objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)(-[CRLBezierSubpath isClosed](self, "isClosed") ^ 1);
    v6 = (char *)(v4 - (_QWORD)v5);
    if ((void *)v4 != v5)
    {
      v7 = 0;
      do
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v7));

        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
        v11 = v7 + 1;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", (v7 + 1) % v4));

        if (objc_msgSend(v9, "reflectedState"))
        {
          objc_msgSend(v9, "setType:", 3);
        }
        else if (!objc_msgSend(v9, "reflectedState"))
        {
          objc_msgSend(v9, "setType:", 1);
          if (!objc_msgSend(v12, "reflectedState"))
          {
            objc_msgSend(v9, "nodePoint");
            v14 = v13;
            v16 = v15;
            objc_msgSend(v9, "outControlPoint");
            if (!sub_10005FDF0(v14, v16, v17, v18)
              || (objc_msgSend(v12, "nodePoint"),
                  v20 = v19,
                  v22 = v21,
                  objc_msgSend(v12, "inControlPoint"),
                  !sub_10005FDF0(v20, v22, v23, v24)))
            {
              v25 = -[CRLBezierSubpath splitEdgeAtIndex:atPercentage:](self, "splitEdgeAtIndex:atPercentage:", v7, 0.5);
              ++v6;
              ++v4;
            }
          }
        }

        ++v7;
      }
      while (v11 < (unint64_t)v6);
    }
  }
}

- (NSArray)nodes
{
  return &self->mNodes->super;
}

- (BOOL)isClosed
{
  return self->mClosed;
}

- (void)setClosed:(BOOL)a3
{
  self->mClosed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mNodes, 0);
}

- (void)smoothAllNodes
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes", 0));
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "setType:", 3);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[CRLBezierSubpath updateSmoothNodes](self, "updateSmoothNodes");
}

- (CGPoint)calculateNewControlFromOriginalDelta:(CGPoint)a3 currentDelta:(CGPoint)a4 originalSmoothDelta:(CGPoint)a5 node:(CGPoint)a6
{
  CGFloat y;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  long double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double x;
  CGPoint result;

  x = a6.x;
  y = a5.y;
  v7 = a5.x;
  v8 = a4.y;
  v9 = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  v12 = 1.0;
  v13 = 0.0;
  if (!sub_10005FDF0(a3.x, a3.y, a5.x, a5.y) && !sub_10005FDF0(CGPointZero.x, CGPointZero.y, v7, y))
  {
    v26 = v8;
    v14 = sub_100061070(v11, v10);
    v12 = v14 / sub_100061070(v7, y);
    v15 = sub_1000618B4(v11, v10);
    v13 = v15 - sub_1000618B4(v7, y);
    v8 = v26;
  }
  v16 = sub_100061070(v9, v8);
  v17 = v8;
  v18 = v12 * v16;
  v19 = sub_1000618B4(v9, v17);
  v20 = sub_100061F64(v13 + v19);
  v22 = sub_1000603DC(v20, v21, v18);
  v24 = sub_1000603D0(v22, v23, x);
  result.y = v25;
  result.x = v24;
  return result;
}

- (void)morphWithMorphInfo:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  BOOL v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  float64x2_t v56;
  double v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  _QWORD *v112;
  double v113;
  double v114;
  uint64_t v115;
  uint64_t v116;
  double v117;
  double v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  double *v126;
  void *v127;
  void *v128;
  double v129;
  unint64_t v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  float64_t v136;
  float64_t v137;
  double v138;
  double v139;
  double v140;
  double v141;
  uint64_t v142;
  uint64_t v143;
  float64_t v144;
  float64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  unint64_t v149;
  uint64_t v150;
  double v151;
  float64x2_t v152;
  const double *v153;
  const double *v154;
  float64x2_t *v155;
  unint64_t v156;
  unint64_t v157;
  void *v158;
  void *v159;
  __int128 v160;
  char *v161;
  unint64_t v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  id v169;
  double v170;
  double *v171;
  id v172;
  double v173;
  id v174;
  void *v175;
  double v176;
  unint64_t v177;
  _QWORD v178[5];
  float64x2_t v179[4];
  float64x2_t v180[3];
  uint64_t v181;
  uint64_t v182;
  float64x2_t v183;
  double v184;
  double v185;
  double v186;
  double v187;
  uint64_t v188;
  uint64_t v189;
  _BYTE v190[64];
  float64x2_t v191;
  float64x2_t v192;
  float64x2_t v193;
  float64x2x2_t v194;
  float64x2x2_t v195;
  float64x2x2_t v196;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v6 = (unint64_t)objc_msgSend(v5, "count");

  if (v6)
  {
    v161 = (char *)malloc_type_malloc(32 * v6, 0x9EDE2835uLL);
    v171 = (double *)malloc_type_malloc(16 * v6, 0x5AB53934uLL);
    v7 = -[CRLBezierSubpath isClosed](self, "isClosed") ^ 1;
    v8 = v6 - v7;
    v162 = v6;
    if (v6 != v7)
    {
      v9 = 0;
      do
      {
        v10 = v9++;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v10));

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v9 % v6));

        if (objc_msgSend(v12, "type") == (id)1 && objc_msgSend(v14, "type") == (id)1)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originalNodeForNode:", v12));
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originalNodeForNode:", v14));
          v17 = (void *)v16;
          if (v15 && v16 && objc_msgSend(v15, "type") == (id)1 && objc_msgSend(v17, "type") == (id)1)
          {
            v174 = objc_msgSend(v4, "originalSubpathIndexForNode:", v12);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "original"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "subpaths"));
            v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", v174));

            v20 = (char *)objc_msgSend(v4, "originalNodeIndexForNode:", v12);
            v172 = objc_msgSend(v4, "originalNodeIndexForNode:", v14);
            v21 = (unint64_t)(v20 + 1);
            v22 = v175;
            if (objc_msgSend(v175, "isClosed"))
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v175, "nodes"));
              v21 %= (unint64_t)objc_msgSend(v23, "count");

              v22 = v175;
            }
            _ZF = v21 == (_QWORD)v172;
            v6 = v162;
            if (_ZF)
            {
              objc_msgSend(v12, "nodePoint");
              v25 = v24;
              v27 = v26;
              objc_msgSend(v14, "nodePoint");
              _ZF = v25 == v29 && v27 == v28;
              if (_ZF
                || ((objc_msgSend(v15, "nodePoint"), v32 = v31, v34 = v33, objc_msgSend(v17, "nodePoint"), v32 == v36)
                  ? (v37 = v34 == v35)
                  : (v37 = 0),
                    v37))
              {
                objc_msgSend(v12, "nodePoint");
                objc_msgSend(v12, "setOutControlPoint:");
                objc_msgSend(v14, "nodePoint");
                v58 = v14;
              }
              else
              {
                v192 = 0u;
                v193 = 0u;
                v191 = 0u;
                objc_msgSend(v15, "nodePoint");
                v39 = v38;
                v41 = v40;
                objc_msgSend(v17, "nodePoint");
                v43 = v42;
                v45 = v44;
                objc_msgSend(v12, "nodePoint");
                v47 = v46;
                v49 = v48;
                objc_msgSend(v14, "nodePoint");
                sub_10007979C(1, (uint64_t)&v191, v39, v41, v43, v45, v47, v49, v50, v51);
                objc_msgSend(v15, "outControlPoint");
                objc_msgSend(v12, "setOutControlPoint:", vaddq_f64(v193, vmlaq_n_f64(vmulq_n_f64(v192, v52), v191, v53)));
                objc_msgSend(v17, "inControlPoint");
                v22 = v175;
                v56 = vaddq_f64(v193, vmlaq_n_f64(vmulq_n_f64(v192, v54), v191, v55));
                v57 = v56.f64[1];
                v58 = v14;
              }
              objc_msgSend(v58, "setInControlPoint:", v56.f64[0], v57);
            }

          }
        }

      }
      while (v8 != v9);
    }
    v59 = 0;
    v60 = 0;
    if (v6 <= 1)
      v61 = 1;
    else
      v61 = v6;
    v62 = v161 + 16;
    __asm { FMOV            V0.2D, #1.0 }
    v160 = _Q0;
    do
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes", v160));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectAtIndex:", v60));

      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originalNodeForNode:", v68));
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originalSmoothNodeForNode:", v68));
      if (v69)
      {
        objc_msgSend(v68, "inControlPoint");
        v72 = v71;
        v74 = v73;
        objc_msgSend(v68, "nodePoint");
        v76 = sub_1000603B8(v72, v74, v75);
        v168 = v77;
        v170 = v76;
        objc_msgSend(v68, "outControlPoint");
        v79 = v78;
        v81 = v80;
        objc_msgSend(v68, "nodePoint");
        v176 = sub_1000603B8(v79, v81, v82);
        v167 = v83;
        objc_msgSend(v69, "inControlPoint");
        v85 = v84;
        v87 = v86;
        objc_msgSend(v69, "nodePoint");
        v89 = sub_1000603B8(v85, v87, v88);
        v91 = v90;
        objc_msgSend(v70, "inControlPoint");
        v93 = v92;
        v95 = v94;
        objc_msgSend(v70, "nodePoint");
        v165 = sub_1000603B8(v93, v95, v96);
        v166 = v97;
        objc_msgSend(v69, "outControlPoint");
        v99 = v98;
        v101 = v100;
        objc_msgSend(v69, "nodePoint");
        v173 = sub_1000603B8(v99, v101, v102);
        v104 = v103;
        v164 = v103;
        objc_msgSend(v70, "outControlPoint");
        v106 = v105;
        v108 = v107;
        objc_msgSend(v70, "nodePoint");
        v110 = sub_1000603B8(v106, v108, v109);
        v163 = v111;
        v178[0] = _NSConcreteStackBlock;
        v178[1] = 3221225472;
        v178[2] = sub_100408E44;
        v178[3] = &unk_10125B7E8;
        v178[4] = v171;
        v112 = objc_retainBlock(v178);
        ((void (*)(_QWORD *, uint64_t, double, double, double, double, double, double))v112[2])(v112, v59, v89, v91, v170, v168, v165, v166);
        ((void (*)(_QWORD *, uint64_t, double, double, double, double, double, double))v112[2])(v112, v59 + 1, v173, v104, v176, v167, v110, v163);
        objc_msgSend(v68, "nodePoint");
        -[CRLBezierSubpath calculateNewControlFromOriginalDelta:currentDelta:originalSmoothDelta:node:](self, "calculateNewControlFromOriginalDelta:currentDelta:originalSmoothDelta:node:", v89, v91, v170, v168, v165, v166, v113, v114);
        *(v62 - 2) = v115;
        *(v62 - 1) = v116;
        objc_msgSend(v68, "nodePoint");
        -[CRLBezierSubpath calculateNewControlFromOriginalDelta:currentDelta:originalSmoothDelta:node:](self, "calculateNewControlFromOriginalDelta:currentDelta:originalSmoothDelta:node:", v173, v164, v176, v167, v110, v163, v117, v118);
        *v62 = v119;
        v62[1] = v120;

      }
      else
      {
        *(_OWORD *)&v171[2 * v60] = v160;
        objc_msgSend(v68, "inControlPoint");
        *(v62 - 2) = v121;
        *(v62 - 1) = v122;
        objc_msgSend(v68, "outControlPoint");
        *v62 = v123;
        v62[1] = v124;
      }

      ++v60;
      v59 += 2;
      v62 += 4;
    }
    while (v61 != v60);
    v125 = 0;
    v126 = v171 + 1;
    do
    {
      v127 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
      v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "objectAtIndex:", v125));

      if (objc_msgSend(v128, "type") == (id)3 && (v125 || -[CRLBezierSubpath isClosed](self, "isClosed")))
      {
        v129 = (*(v126 - 1) + *v126) * 0.5;
        *(v126 - 1) = v129;
        *v126 = v129;
      }

      ++v125;
      v126 += 2;
    }
    while (v61 != v125);
    v169 = v4;
    v177 = v162 - (-[CRLBezierSubpath isClosed](self, "isClosed") ^ 1);
    if (v177)
    {
      v130 = 0;
      do
      {
        v131 = v130++;
        v132 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
        v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "objectAtIndex:", v131));

        v134 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
        v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "objectAtIndex:", v130 % v162));

        objc_msgSend(v133, "nodePoint");
        v183.f64[0] = v136;
        v183.f64[1] = v137;
        objc_msgSend(v133, "outControlPoint");
        v184 = v138;
        v185 = v139;
        objc_msgSend(v135, "inControlPoint");
        v186 = v140;
        v187 = v141;
        objc_msgSend(v135, "nodePoint");
        v188 = v142;
        v189 = v143;
        objc_msgSend(v133, "nodePoint");
        v180[0].f64[0] = v144;
        v180[0].f64[1] = v145;
        v146 = (2 * v131) | 1;
        v180[1] = *(float64x2_t *)&v161[16 * v146];
        v180[2] = *(float64x2_t *)&v161[32 * (v130 % v162)];
        objc_msgSend(v135, "nodePoint");
        v181 = v147;
        v182 = v148;
        sub_100313330(&v183, (uint64_t)&v191);
        sub_100313330(v180, (uint64_t)v190);
        v149 = 0;
        *(double *)&v150 = fmax(fmin((v171[v146] + v171[2 * (v130 % v162)]) * 0.5, 1.0), 0.0);
        v151 = 1.0 - *(double *)&v150;
        v152 = (float64x2_t)vdupq_lane_s64(v150, 0);
        do
        {
          v153 = &v191.f64[v149 / 8];
          v194 = vld2q_f64(v153);
          v154 = (const double *)&v190[v149];
          v195 = vld2q_f64(v154);
          v196.val[0] = vmlaq_f64(vmulq_n_f64(v195.val[0], v151), v152, v194.val[0]);
          v196.val[1] = vmlaq_f64(vmulq_n_f64(v195.val[1], v151), v152, v194.val[1]);
          v155 = &v179[v149 / 0x10];
          vst2q_f64(v155->f64, v196);
          v149 += 32;
        }
        while (v149 != 64);
        sub_10031337C(v179, (uint64_t)&v183);
        objc_msgSend(v133, "setOutControlPoint:", v184, v185);
        objc_msgSend(v135, "setInControlPoint:", v186, v187);

      }
      while (v130 != v177);
    }
    v156 = -[CRLBezierSubpath isClosed](self, "isClosed") ^ 1;
    v157 = v162 - (-[CRLBezierSubpath isClosed](self, "isClosed") ^ 1);
    if (v157 > v156)
    {
      do
      {
        v158 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
        v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "objectAtIndex:", v156));

        if (objc_msgSend(v159, "type") == (id)3)
          objc_msgSend(v159, "balanceControlPoints");

        ++v156;
      }
      while (v157 != v156);
    }
    free(v171);
    free(v161);
    v4 = v169;
  }

}

- (int64_t)updateSmoothNodes:(id)a3 from:(int64_t)a4 to:(int64_t)a5 closed:(BOOL)a6 addTemporaryNodes:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v11;
  void *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  BOOL v17;
  int64_t v18;
  float v19;
  int64_t v20;
  double v21;
  double v22;
  id v23;
  int64_t v24;
  double *v25;
  double *v26;
  uint64_t v27;
  double *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  unint64_t v39;
  double *v40;
  uint64_t i;
  double v42;
  double v43;
  __CLPK_doublereal *v44;
  __CLPK_doublereal *v45;
  BOOL v46;
  int64_t v47;
  double *v48;
  __CLPK_doublereal *v49;
  void *v50;
  void *v51;
  id v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  long double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  long double v67;
  double v68;
  double v69;
  void *v70;
  int64_t v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  long double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  long double v87;
  double v88;
  double v89;
  __CLPK_doublereal *v90;
  double *v91;
  uint64_t v92;
  double v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  int v102;
  int v103;
  unsigned int v104;
  uint64_t v105;
  NSObject *v106;
  void *v107;
  void *v108;
  void *v109;
  double v110;
  double *v111;
  uint64_t v112;
  int v113;
  int v114;
  unsigned int v115;
  uint64_t v116;
  NSObject *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  double *v123;
  uint64_t v124;
  uint64_t v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  uint64_t v150;
  void *v151;
  double v152;
  double v153;
  double v154;
  float64_t v155;
  double v156;
  double v157;
  uint64_t v158;
  uint64_t v159;
  double v160;
  uint64_t v161;
  uint64_t v162;
  double v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  void *v176;
  void *v177;
  void *v178;
  uint64_t v179;
  double *v180;
  uint64_t v181;
  uint64_t v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  uint64_t v203;
  int64_t v204;
  void *v205;
  double v206;
  double v207;
  double v208;
  double v209;
  uint64_t v210;
  void *v211;
  double v212;
  double v213;
  double v214;
  double v215;
  void *v216;
  void *v217;
  int v218;
  id v219;
  id v220;
  uint64_t v221;
  void *j;
  void *v223;
  void *v224;
  int64_t v225;
  void *v226;
  id v227;
  void *v228;
  BOOL v229;
  int64_t v230;
  NSObject *v231;
  void *v232;
  NSObject *v233;
  void *v234;
  void *v235;
  void *v236;
  int64_t v238;
  int64_t v239;
  uint64_t v240;
  int64_t v241;
  int64_t v242;
  unint64_t v243;
  int v244;
  uint64_t v245;
  uint64_t size;
  BOOL v247;
  void *v248;
  char v249;
  int64_t v250;
  int64_t v251;
  unint64_t v252;
  BOOL v253;
  __CLPK_doublereal *v254;
  uint64_t v255;
  double *v256;
  uint64_t v257;
  double *v258;
  __CLPK_doublereal *v259;
  __CLPK_doublereal *v260;
  double *v261;
  char v262;
  uint64_t v263;
  double *v264;
  uint64_t v265;
  double *v266;
  uint64_t obj;
  id obja;
  int64_t v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  _BYTE v275[128];
  char v276[16];
  double v277;
  double v278;
  double v279;
  double v280;
  char v281[16];
  double v282;
  double v283;
  double v284;
  double v285;
  double v286;
  double v287;
  float64x2_t v288;
  double v289;
  uint64_t v290;
  double v291;
  uint64_t v292;
  double v293;
  uint64_t v294;
  uint8_t buf[8];
  _BYTE v296[40];
  double v297;
  uint64_t v298;

  v7 = a7;
  v8 = a6;
  v11 = a3;
  v12 = v11;
  v13 = a5 - a4;
  if (a5 - a4 >= 1)
  {
    v250 = 0;
    v14 = 0;
    v15 = v13 + 1;
    v16 = a5 - a4 != 1 || v8;
    v249 = v16;
    size = 16 * v15;
    v240 = 2 * v15;
    v245 = 2 * v15 - 1;
    v253 = v8;
    v17 = !v8;
    v257 = 8 * v15;
    if (v8)
      v18 = v13 + 2;
    else
      v18 = a5 - a4;
    v19 = 1.0;
    if (!v17)
      v19 = 2.0;
    v251 = a5 - a4;
    if (v17)
      v20 = a5 - a4;
    else
      v20 = v13 + 1;
    v265 = v20;
    v247 = v7;
    v244 = !v7;
    v242 = v18 - 1;
    v243 = (unint64_t)(float)(v19 * (float)(unint64_t)(8 * v15));
    v21 = 1.0;
    v22 = -2.0;
    v238 = a4;
    v239 = a5;
    v270 = a5;
    v263 = v13 + 1;
    v241 = 8 * a5 - 8 * a4 + 8;
    v248 = v11;
    v252 = v18;
    while (1)
    {
      v23 = objc_msgSend(v12, "count");
      if ((v249 & 1) == 0)
        break;
      v24 = (int64_t)v23;
      v255 = v14;
      v25 = (double *)malloc_type_malloc(size, 0x1000040451B5BE8uLL);
      v26 = (double *)malloc_type_malloc(v257, 0x100004000313F17uLL);
      v266 = (double *)malloc_type_malloc(v257, 0x100004000313F17uLL);
      v27 = 0;
      v261 = v25;
      v28 = v25 + 1;
      v256 = v25 + 1;
      do
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", (a4 + v27) % v24));
        objc_msgSend(v29, "nodePoint");
        v31 = v30;
        v33 = v32;

        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", (a4 + v27 + 1) % v24));
        objc_msgSend(v34, "nodePoint");
        v36 = v35;

        v37 = sub_1000603B8(v31, v33, v36);
        *(v28 - 1) = v37;
        *v28 = v38;
        v26[v27++] = sqrt(v38 * v38 + v37 * v37);
        v28 += 2;
      }
      while (v15 != v27);
      v258 = v26;
      v39 = v252;
      if (v252 >= 2)
      {
        v40 = v256;
        for (i = 1; i != v252; ++i)
        {
          v42 = *(v40 - 1);
          v43 = v21 / (*v40 * *v40 + v42 * v42);
          v266[i % v15] = sub_100061F34((v261[2 * (i % v15) + 1] * *v40 + v261[2 * (i % v15)] * v42) * v43, (v261[2 * (i % v15) + 1] * v42 - v261[2 * (i % v15)] * *v40) * v43);
          v40 += 2;
        }
      }
      v44 = (__CLPK_doublereal *)malloc_type_malloc(v257, 0x100004000313F17uLL);
      v259 = (__CLPK_doublereal *)malloc_type_malloc(v257, 0x100004000313F17uLL);
      v260 = (__CLPK_doublereal *)malloc_type_malloc(v257, 0x100004000313F17uLL);
      v45 = (__CLPK_doublereal *)malloc_type_malloc(v243, 0x358D1C7AuLL);
      v46 = v253;
      v47 = v251;
      v48 = v266;
      v49 = v44;
      v264 = v45;
      if (!v253)
      {
        *v266 = 0.0;
        v266[v251] = 0.0;
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", a4 % v24));
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", (a4 + 1) % v24));
        v52 = objc_msgSend(v50, "type");
        *v49 = 0.0;
        if (v52 == (id)2)
        {
          *v259 = 1.0;
          *v260 = 0.0;
          objc_msgSend(v50, "outControlPoint");
          v54 = v53;
          v56 = v55;
          objc_msgSend(v50, "nodePoint");
          v58 = sub_1000603B8(v54, v56, v57);
          v60 = sub_100061F34(v58, v59);
          objc_msgSend(v51, "nodePoint");
          v62 = v61;
          v64 = v63;
          objc_msgSend(v50, "nodePoint");
          v66 = sub_1000603B8(v62, v64, v65);
          v68 = sub_100061F34(v66, v67);
          v69 = sub_1000620DC(v60 - v68);
        }
        else
        {
          *v259 = 3.0;
          *v260 = 3.0;
          v69 = v266[1] * -3.0;
        }
        *v264 = v69;
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", v270 % v24));

        if (v270 <= 0)
          v71 = v24;
        else
          v71 = v270;
        v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", (v71 - 1) % v24));

        if (objc_msgSend(v70, "type") == (id)2)
        {
          v49[v251] = 0.0;
          v259[v251] = 1.0;
          v260[v251] = 0.0;
          objc_msgSend(v70, "inControlPoint");
          v74 = v73;
          v76 = v75;
          objc_msgSend(v70, "nodePoint");
          v78 = sub_1000603B8(v74, v76, v77);
          v80 = sub_100061F34(v78, v79);
          objc_msgSend(v72, "nodePoint");
          v82 = v81;
          v84 = v83;
          objc_msgSend(v70, "nodePoint");
          v86 = sub_1000603B8(v82, v84, v85);
          v88 = sub_100061F34(v86, v87);
          v89 = sub_1000620DC(v80 - v88);
        }
        else
        {
          v49[v251] = 3.0;
          v259[v251] = 3.0;
          v89 = 0.0;
          v260[v251] = 0.0;
        }
        v264[v251] = v89;

        v45 = v264;
        v46 = v253;
        v15 = v263;
        v39 = v252;
        v48 = v266;
      }
      v90 = v260;
      v91 = v261;
      if (v39 >= 2)
      {
        v92 = 0;
        do
        {
          v93 = v26[v92];
          v94 = v92 + 2;
          v95 = v92 + 1;
          v96 = (v92 + 1) % v15;
          v97 = v21 / v93;
          v98 = v21 / v26[v96];
          v49[v96] = v97;
          v259[v96] = v97 + v98 + v97 + v98;
          v260[v96] = v98;
          v45[v96] = v97 * v22 * v48[v96] - v98 * v48[v94 % v15];
          v92 = v95;
        }
        while (v242 != v95);
      }
      v254 = v49;
      if (v46)
      {
        v99 = v260[v251];
        v100 = *v259;
        v101 = *v49;
        *v259 = *v259 + *v259;
        v259[v251] = v259[v251] + v99 * v101 / v100;
        if (v15 < v240)
        {
          bzero((char *)v45 + v241, v257);
          v45 = v264;
          v90 = v260;
        }
        v45[v15] = -v100;
        v45[v245] = v99;
        v102 = sub_100409048(v15, 2, v49 + 1, v259, v90, v45, v15);
        if (v102)
        {
          v103 = v102;
          v104 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125B8C8);
          v105 = v103;
          v106 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)&buf[4] = v104;
            *(_WORD *)v296 = 2082;
            *(_QWORD *)&v296[2] = "-[CRLBezierSubpath(Smoothing) updateSmoothNodes:from:to:closed:addTemporaryNodes:]";
            *(_WORD *)&v296[10] = 2082;
            *(_QWORD *)&v296[12] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditableBezierPathSmoothing.m";
            *(_WORD *)&v296[20] = 1024;
            *(_DWORD *)&v296[22] = 502;
            *(_WORD *)&v296[26] = 2048;
            *(_QWORD *)&v296[28] = v105;
            _os_log_error_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d dgtsv failure with error %ld", buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125B8E8);
          v107 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v231 = v107;
            v232 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = v104;
            *(_WORD *)v296 = 2114;
            *(_QWORD *)&v296[2] = v232;
            _os_log_error_impl((void *)&_mh_execute_header, v231, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierSubpath(Smoothing) updateSmoothNodes:from:to:closed:addTemporaryNodes:]"));
          v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditableBezierPathSmoothing.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v108, v109, 502, 0, "dgtsv failure with error %ld", v105);

          v47 = v251;
          v15 = v263;
          v91 = v261;
          v48 = v266;
        }
        v110 = -(*v264 - v101 * v264[v47] / v100) / (v264[v15] + v21 - v101 * v264[v245] / v100);
        v111 = v264;
        v112 = v15;
        do
        {
          *v111 = *v111 + v110 * *(double *)((char *)v111 + v241);
          ++v111;
          --v112;
        }
        while (v112);
      }
      else
      {
        v113 = sub_100409048(v15, 1, v49 + 1, v259, v260, v45, v15);
        if (v113)
        {
          v114 = v113;
          v115 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125B908);
          v116 = v114;
          v117 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)&buf[4] = v115;
            *(_WORD *)v296 = 2082;
            *(_QWORD *)&v296[2] = "-[CRLBezierSubpath(Smoothing) updateSmoothNodes:from:to:closed:addTemporaryNodes:]";
            *(_WORD *)&v296[10] = 2082;
            *(_QWORD *)&v296[12] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditableBezierPathSmoothing.m";
            *(_WORD *)&v296[20] = 1024;
            *(_DWORD *)&v296[22] = 513;
            *(_WORD *)&v296[26] = 2048;
            *(_QWORD *)&v296[28] = v116;
            _os_log_error_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d dgtsv failure with error %ld", buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125B928);
          v118 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v233 = v118;
            v234 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = v115;
            *(_WORD *)v296 = 2114;
            *(_QWORD *)&v296[2] = v234;
            _os_log_error_impl((void *)&_mh_execute_header, v233, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierSubpath(Smoothing) updateSmoothNodes:from:to:closed:addTemporaryNodes:]"));
          v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLEditableBezierPathSmoothing.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v119, v120, 513, 0, "dgtsv failure with error %ld", v116);

          v15 = v263;
          v91 = v261;
          v48 = v266;
        }
      }
      obj = v24;
      if (v247)
      {
        v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        if (v265 < 1)
        {
          v262 = 1;
        }
        else
        {
          v122 = 0;
          v262 = 1;
          v123 = v256;
          do
          {
            v124 = v122 + 1;
            v125 = (v122 + 1) % v15;
            v126 = v264[v122];
            v127 = sub_100061F64(v126);
            v129 = sub_1000615C0(v127, v128, *(v123 - 1), *v123);
            v131 = v130;
            v132 = sub_100408F84(v126, -v266[v125] - v264[v125]);
            v133 = sub_1000603DC(v129, v131, -v132);
            v135 = v134;
            v136 = -v266[v125] - v264[v125];
            v137 = sub_100061F64(-v136);
            v139 = sub_1000615C0(v137, v138, *(v123 - 1), *v123);
            v141 = v140;
            v142 = sub_100408F84(v136, v264[v122]);
            v143 = sub_1000603DC(v139, v141, v142);
            v145 = v144;
            v146 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
            v147 = a4 + v122;
            v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "objectAtIndex:", (a4 + v122) % obj));

            v149 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
            v150 = (v147 + 1) % obj;
            v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "objectAtIndex:", v150));

            objc_msgSend(v148, "nodePoint");
            v153 = v152;
            v155 = v154;
            objc_msgSend(v151, "nodePoint");
            v157 = v156;
            v159 = v158;
            v160 = sub_1000603D0(v133, v135, v153);
            v162 = v161;
            v163 = sub_1000603D0(v143, v145, v157);
            v165 = v164;
            *(double *)buf = v153;
            *(float64_t *)v296 = v155;
            objc_msgSend(v148, "outControlPoint");
            *(_QWORD *)&v296[8] = v166;
            *(_QWORD *)&v296[16] = v167;
            objc_msgSend(v151, "inControlPoint");
            *(_QWORD *)&v296[24] = v168;
            *(_QWORD *)&v296[32] = v169;
            v297 = v157;
            v298 = v159;
            v288.f64[0] = v153;
            v288.f64[1] = v155;
            v289 = v160;
            v290 = v162;
            v291 = v163;
            v292 = v165;
            v293 = v157;
            v294 = v159;
            v170 = sub_1000602A8((float64x2_t *)buf, 0.5);
            v172 = v171;
            v173 = sub_1000602A8(&v288, 0.5);
            v174 = sub_1000603B8(v170, v172, v173);
            if (sub_100061080(v174, v175) > 4.0)
            {
              sub_100313400((float64x2_t *)buf, (uint64_t)v281, 0.0, 0.5);
              sub_100313400((float64x2_t *)buf, (uint64_t)v276, 0.5, 1.0);
              objc_msgSend(v148, "setOutControlPoint:", v282, v283);
              objc_msgSend(v151, "setInControlPoint:", v279, v280);
              v176 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierNode bezierNodeWithPoint:inControlPoint:outControlPoint:](CRLBezierNode, "bezierNodeWithPoint:inControlPoint:outControlPoint:", v286, v287, v284, v285, v277, v278));
              objc_msgSend(v176, "setType:", 4);
              v177 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v150));
              v178 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v176, CFSTR("node"), v177, CFSTR("index"), 0));
              objc_msgSend(v121, "addObject:", v178);

              v262 = 0;
            }

            v123 += 2;
            v122 = v124;
            v15 = v263;
          }
          while (v265 != v124);
        }
        objc_msgSend(v121, "sortUsingFunction:context:", sub_100409454, 0);
        v273 = 0u;
        v274 = 0u;
        v271 = 0u;
        v272 = 0u;
        obja = v121;
        v219 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v271, v275, 16);
        if (v219)
        {
          v220 = v219;
          v221 = *(_QWORD *)v272;
          v21 = 1.0;
          v22 = -2.0;
          do
          {
            for (j = 0; j != v220; j = (char *)j + 1)
            {
              if (*(_QWORD *)v272 != v221)
                objc_enumerationMutation(obja);
              v223 = *(void **)(*((_QWORD *)&v271 + 1) + 8 * (_QWORD)j);
              v224 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "objectForKey:", CFSTR("index")));
              v225 = (int)objc_msgSend(v224, "intValue");

              v226 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
              v227 = objc_msgSend(v226, "mutableCopy");

              v228 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v223, "objectForKey:", CFSTR("node")));
              objc_msgSend(v227, "insertObject:atIndex:", v228, v225);

              -[CRLBezierSubpath setNodes:](self, "setNodes:", v227);
              v229 = a4 <= v225;
              if (a4 > v225)
                ++a4;
              v230 = v270;
              if (!v229)
                v230 = v270 + 1;
              v270 = v230 + 1;

            }
            v220 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v271, v275, 16);
          }
          while (v220);
        }
        else
        {
          v21 = 1.0;
          v22 = -2.0;
        }

        v250 += (int64_t)objc_msgSend(obja, "count");
        v218 = v262 & 1;
        v12 = v248;
        v15 = v263;
        v91 = v261;
        v26 = v258;
        v48 = v266;
      }
      else if (v265 < 1)
      {
        v218 = 1;
        v12 = v248;
      }
      else
      {
        v179 = 0;
        v180 = v256;
        do
        {
          v181 = v179 + 1;
          v182 = (v179 + 1) % v15;
          v183 = v264[v179];
          v184 = sub_100061F64(v183);
          v186 = sub_1000615C0(v184, v185, *(v180 - 1), *v180);
          v188 = v187;
          v189 = sub_100408F84(v183, -v48[v182] - v264[v182]);
          v190 = sub_1000603DC(v186, v188, -v189);
          v192 = v191;
          v193 = -v48[v182] - v264[v182];
          v194 = sub_100061F64(-v193);
          v196 = sub_1000615C0(v194, v195, *(v180 - 1), *v180);
          v198 = v197;
          v199 = sub_100408F84(v193, v264[v179]);
          v200 = sub_1000603DC(v196, v198, v199);
          v202 = v201;
          v203 = a4 + v179;
          v204 = (a4 + v179) % v24;
          v205 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v248, "objectAtIndex:", v204));
          objc_msgSend(v205, "nodePoint");
          v207 = sub_1000603D0(v190, v192, v206);
          v209 = v208;

          v210 = (v203 + 1) % v24;
          v211 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v248, "objectAtIndex:", v210));
          objc_msgSend(v211, "nodePoint");
          v213 = sub_1000603D0(v200, v202, v212);
          v215 = v214;

          v48 = v266;
          v216 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v248, "objectAtIndex:", v204));
          objc_msgSend(v216, "setOutControlPoint:", v207, v209);

          v217 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v248, "objectAtIndex:", v210));
          objc_msgSend(v217, "setInControlPoint:", v213, v215);

          v180 += 2;
          v179 = v181;
        }
        while (v265 != v181);
        v218 = 1;
        v91 = v261;
        v12 = v248;
      }
      free(v254);
      free(v259);
      free(v260);
      free(v264);
      free(v91);
      free(v26);
      free(v48);
      if (((v218 | v244) & 1) == 0)
      {
        v14 = v255 + 1;
        if (v255 != 3)
          continue;
      }
      goto LABEL_96;
    }
    v235 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", v238));
    v236 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", v239));
    if (objc_msgSend(v235, "type") != (id)2)
    {
      objc_msgSend(v235, "nodePoint");
      objc_msgSend(v235, "setOutControlPoint:");
    }
    if (objc_msgSend(v236, "type") != (id)2)
    {
      objc_msgSend(v236, "nodePoint");
      objc_msgSend(v236, "setInControlPoint:");
    }

  }
  v250 = 0;
LABEL_96:

  return v250;
}

- (void)updateSmoothNodes:(id)a3 addTemporaryNodes:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _BOOL4 v27;
  char *v28;
  CRLBezierSubpath *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  BOOL v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  id v43;
  char v44;
  int64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  id v49;

  v4 = a4;
  v49 = a3;
  v6 = (uint64_t)objc_msgSend(v49, "count");
  if (v6 < 2)
  {
    v7 = 0;
    v8 = 0;
    goto LABEL_70;
  }
  v9 = v6;
  if (v4)
  {
    v7 = 0;
    v8 = 0;
  }
  else
  {
    v10 = 0;
    v8 = 0;
    v11 = 0;
    v12 = v6 - 1;
    do
    {
      v13 = v8;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectAtIndex:", v10));

      v14 = v10 + 1;
      if (v10 + 1 < v9 || -[CRLBezierSubpath isClosed](self, "isClosed"))
      {
        if (v12 == v10)
          v15 = 0;
        else
          v15 = v10 + 1;
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectAtIndex:", v15));
      }
      else
      {
        v7 = 0;
      }

      if (objc_msgSend(v8, "type") == (id)1 && v7 && objc_msgSend(v7, "type") == (id)1)
      {
        objc_msgSend(v8, "nodePoint");
        objc_msgSend(v8, "setOutControlPoint:");
        objc_msgSend(v7, "nodePoint");
        objc_msgSend(v7, "setInControlPoint:");
      }
      if (!objc_msgSend(v8, "type"))
      {
        if (objc_msgSend(v8, "isCollapsed"))
          v16 = 1;
        else
          v16 = 2;
        objc_msgSend(v8, "setType:", v16);
      }
      ++v10;
      v11 = v7;
    }
    while (v9 != v14);
  }
  if (-[CRLBezierSubpath isClosed](self, "isClosed"))
  {
    v17 = 0;
    while (1)
    {
      if ((v9 & ~(v9 >> 63)) == v17)
      {
        v28 = (char *)objc_msgSend(v49, "count") - 1;
        v29 = self;
        v30 = v49;
        v31 = 0;
        v32 = 1;
        goto LABEL_69;
      }
      v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectAtIndex:", v17));

      if (objc_msgSend(v19, "type") != (id)3 && objc_msgSend(v19, "type") != (id)4)
        break;
      ++v17;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectAtIndex:", (v18 + 1) % v9));

      objc_msgSend(v20, "nodePoint");
      v22 = v21;
      v24 = v23;
      objc_msgSend(v19, "nodePoint");
      v7 = v20;
      v8 = v19;
      if (sub_10005FDF0(v22, v24, v25, v26))
      {
        LOBYTE(v27) = 1;
        v7 = v20;
        goto LABEL_33;
      }
    }
    LOBYTE(v27) = 0;
    ++v17;
LABEL_33:
    v8 = v19;
  }
  else
  {
    LOBYTE(v27) = 0;
    v17 = 0;
    v18 = 0;
  }
  if (v18 >= v9 + v17)
    goto LABEL_70;
  v48 = 0;
  v33 = 0;
  do
  {
    v34 = v27;
    v35 = v7;
    v36 = v8;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectAtIndex:", v18 % v9, v48));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectAtIndex:", (v18 + 1) % v9));
    objc_msgSend(v7, "nodePoint");
    v38 = v37;
    v40 = v39;
    objc_msgSend(v8, "nodePoint");
    v27 = sub_10005FDF0(v38, v40, v41, v42);
    v43 = objc_msgSend(v8, "type");
    if ((v33 & 1) != 0)
    {
      if (v43 == (id)3)
      {
        if (!v27)
          goto LABEL_58;
      }
      else
      {
        v44 = objc_msgSend(v8, "type") != (id)4 || v27;
        if ((v44 & 1) == 0)
          goto LABEL_58;
      }
      v45 = -[CRLBezierSubpath updateSmoothNodes:from:to:closed:addTemporaryNodes:](self, "updateSmoothNodes:from:to:closed:addTemporaryNodes:", v49, v48, v18, 0, v4);
      v33 = 0;
      v18 += v45;
      v9 += v45;
      if (!v4)
        goto LABEL_59;
      goto LABEL_63;
    }
    if (v43 != (id)3 && objc_msgSend(v8, "type") != (id)4)
      goto LABEL_52;
    if (!v27)
    {
      if (v34)
      {
LABEL_52:
        v33 = 0;
        if (v4)
          goto LABEL_63;
LABEL_59:
        if (v27)
        {
LABEL_60:
          objc_msgSend(v8, "nodePoint", v48);
          objc_msgSend(v8, "setOutControlPoint:");
        }
        if (v34)
        {
          objc_msgSend(v8, "nodePoint");
          objc_msgSend(v8, "setInControlPoint:");
        }
LABEL_63:
        v28 = (char *)v18;
        goto LABEL_64;
      }
      if (v18 <= 1)
        v46 = 1;
      else
        v46 = v18;
      v48 = v46 - 1;
LABEL_58:
      v33 = 1;
      if (!v4)
        goto LABEL_59;
      goto LABEL_63;
    }
    v33 = 0;
    v28 = (char *)v18;
    if (!v4)
      goto LABEL_60;
LABEL_64:
    v18 = (uint64_t)(v28 + 1);
  }
  while ((uint64_t)(v28 + 1) < v9 + v17);
  v47 = v33 ^ 1;
  if (v17)
    v47 = 1;
  if ((v47 & 1) == 0)
  {
    v29 = self;
    v31 = v48;
    v30 = v49;
    v32 = 0;
LABEL_69:
    -[CRLBezierSubpath updateSmoothNodes:from:to:closed:addTemporaryNodes:](v29, "updateSmoothNodes:from:to:closed:addTemporaryNodes:", v30, v31, v28, v32, v4, v48);
  }
LABEL_70:

}

- (void)updateSmoothNodes
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  -[CRLBezierSubpath updateSmoothNodes:addTemporaryNodes:](self, "updateSmoothNodes:addTemporaryNodes:", v3, 0);

}

- (void)removeTemporaryNodes
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  float64_t v11;
  float64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  float64x2_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  v4 = (uint64_t)objc_msgSend(v3, "count");

  if (v4 >= 1)
  {
    for (i = 0; i < v4; ++i)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", i));

      if (objc_msgSend(v7, "type") == (id)4)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
        v9 = objc_msgSend(v8, "mutableCopy");

        objc_msgSend(v9, "removeObjectAtIndex:", i);
        -[CRLBezierSubpath updateSmoothNodes:addTemporaryNodes:](self, "updateSmoothNodes:addTemporaryNodes:", v9, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", i));
        objc_msgSend(v10, "nodePoint");
        v34.f64[0] = v11;
        v34.f64[1] = v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", i));
        objc_msgSend(v13, "outControlPoint");
        v35 = v14;
        v36 = v15;
        v16 = v4 - 1;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", (i + 1) % (v4 - 1)));
        objc_msgSend(v17, "inControlPoint");
        v37 = v18;
        v38 = v19;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", (i + 1) % (v4 - 1)));
        objc_msgSend(v20, "nodePoint");
        v39 = v21;
        v40 = v22;

        objc_msgSend(v7, "nodePoint");
        v24 = v23;
        v26 = v25;
        v27 = sub_1000602A8(&v34, 0.5);
        v28 = sub_1000603B8(v24, v26, v27);
        if (sub_100061080(v28, v29) < 16.0)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
          v31 = objc_msgSend(v30, "mutableCopy");

          objc_msgSend(v31, "removeObjectAtIndex:", i);
          -[CRLBezierSubpath setNodes:](self, "setNodes:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
          -[CRLBezierSubpath updateSmoothNodes:addTemporaryNodes:](self, "updateSmoothNodes:addTemporaryNodes:", v32, 0);

          --i;
          v4 = v16;
        }

      }
    }
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  -[CRLBezierSubpath updateSmoothNodes:addTemporaryNodes:](self, "updateSmoothNodes:addTemporaryNodes:", v33, 0);

}

- (void)addTemporarySmoothNodes
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLBezierSubpath nodes](self, "nodes"));
  -[CRLBezierSubpath updateSmoothNodes:addTemporaryNodes:](self, "updateSmoothNodes:addTemporaryNodes:", v3, 1);

}

@end
