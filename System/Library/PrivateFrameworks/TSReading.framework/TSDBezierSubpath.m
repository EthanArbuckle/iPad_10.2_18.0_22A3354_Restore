@implementation TSDBezierSubpath

- (TSDBezierSubpath)init
{
  TSDBezierSubpath *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDBezierSubpath;
  v2 = -[TSDBezierSubpath init](&v4, sel_init);
  if (v2)
    v2->mNodes = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setNodes:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:copyItems:", -[TSDBezierSubpath nodes](self, "nodes"), 1));
  objc_msgSend(v4, "setClosed:", self->mClosed);
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self->mClosed)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p nodes=%p closed=%@>"), v5, self, self->mNodes, v6);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDBezierSubpath;
  -[TSDBezierSubpath dealloc](&v3, sel_dealloc);
}

- (BOOL)isRectangular
{
  int v3;
  unint64_t v4;
  BOOL v5;
  uint64_t v6;
  void **v7;
  double *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  double *v13;
  double v14;
  double v15;
  double *v16;
  double v17;
  double v18;
  double *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  BOOL v38;
  double v40;
  double v41[7];
  _QWORD v42[5];

  v42[4] = *MEMORY[0x24BDAC8D0];
  v3 = -[TSDBezierSubpath isClosed](self, "isClosed");
  if (!v3)
    return v3;
  if (-[NSMutableArray count](self->mNodes, "count") != 4)
    goto LABEL_24;
  -[NSMutableArray getObjects:range:](self->mNodes, "getObjects:range:", v42, 0, 4);
  v4 = 0;
  do
  {
    v3 = objc_msgSend((id)v42[v4], "isCollapsed");
    if (v3)
      v5 = v4 >= 3;
    else
      v5 = 1;
    ++v4;
  }
  while (!v5);
  if (v3)
  {
    v6 = 0;
    v7 = (void **)v42;
    do
    {
      v8 = &v41[v6 - 1];
      v9 = *v7++;
      objc_msgSend(v9, "nodePoint");
      *(_QWORD *)v8 = v10;
      *((_QWORD *)v8 + 1) = v11;
      v6 += 2;
    }
    while (v6 != 8);
    v12 = 0;
    v13 = v41;
    do
    {
      v14 = *(v13 - 1);
      v15 = *v13;
      v16 = &v41[2 * ((v12 + 1) & 3) - 1];
      v17 = *v16;
      v18 = v16[1];
      v19 = &v41[2 * ((v12 + 2) & 3) - 1];
      v20 = *v19;
      v21 = v19[1];
      v22 = TSDDistance(v14, *v13, v17, v18);
      v23 = TSDDistance(v17, v18, v20, v21);
      v24 = vabdd_f64(TSDDistance(v14, v15, v20, v21), sqrt(v23 * v23 + v22 * v22));
      v13 += 2;
    }
    while (v24 <= 0.00100000005 && v12++ < 3);
    if (v24 <= 0.00100000005)
    {
      v26 = TSDRectWithPoints(v40, v41[0], v41[1]);
      v30 = TSDGrowRectToPoint(v26, v27, v28, v29, v41[3], v41[4]);
      v34 = TSDGrowRectToPoint(v30, v31, v32, v33, v41[5], v41[6]);
      v36 = v35;
      v37 = 0;
      do
      {
        LOBYTE(v3) = TSDNearlyEqualPoints(v41[v37 - 1], v41[v37], v34, v36);
        if ((v3 & 1) != 0)
          break;
        v38 = v37 == 6;
        v37 += 2;
      }
      while (!v38);
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

  v3 = -[TSDBezierSubpath isClosed](self, "isClosed");
  if (v3)
    LOBYTE(v3) = -[TSDBezierPath isCircular](-[TSDBezierSubpath bezierPath](self, "bezierPath"), "isCircular");
  return v3;
}

- (TSDBezierPath)bezierPath
{
  TSDBezierPath *v3;

  v3 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
  -[TSDBezierSubpath appendToBezierPath:selectedNodesOnly:fromIndex:](self, "appendToBezierPath:selectedNodesOnly:fromIndex:", v3, 0, 0);
  return v3;
}

- (void)appendToBezierPath:(id)a3 selectedNodesOnly:(BOOL)a4 fromIndex:(unint64_t)a5
{
  _BOOL4 v6;
  uint64_t v9;
  unint64_t v10;
  BOOL v11;
  char v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  char v18;
  unint64_t v19;
  unint64_t v20;
  double v21;
  double v22;
  void *v23;
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

  v6 = a4;
  v9 = -[NSMutableArray count](self->mNodes, "count");
  if (v9)
  {
    v10 = v9;
    if (a5)
      v11 = 1;
    else
      v11 = !self->mClosed;
    v12 = !v11;
    v13 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->mNodes, "objectAtIndexedSubscript:", a5);
    objc_msgSend(v13, "nodePoint");
    v15 = v14;
    v17 = v16;
    objc_msgSend(a3, "moveToPoint:");
    v18 = 0;
    v19 = v10 + self->mClosed;
    v20 = a5 + 1;
    do
    {
      if (v20 >= v19)
        break;
      v21 = v17;
      v22 = v15;
      v23 = v13;
      v13 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->mNodes, "objectAtIndexedSubscript:", v20 % v10);
      objc_msgSend(v13, "nodePoint");
      v15 = v24;
      v17 = v25;
      if (!v6 || objc_msgSend(v23, "isSelected") && objc_msgSend(v13, "isSelected"))
      {
        objc_msgSend(v23, "outControlPoint");
        v27 = v26;
        v29 = v28;
        objc_msgSend(v13, "inControlPoint");
        v31 = v30;
        v33 = v32;
        if ((v18 & 1) != 0)
          objc_msgSend(a3, "moveToPoint:", v22, v21);
        if (TSDNearlyEqualPoints(v22, v21, v27, v29) && TSDNearlyEqualPoints(v31, v33, v15, v17))
          objc_msgSend(a3, "lineToPoint:", v15, v17);
        else
          objc_msgSend(a3, "curveToPoint:controlPoint1:controlPoint2:", v15, v17, v27, v29, v31, v33);
        v18 = 0;
      }
      else
      {
        v12 = 0;
        v18 = 1;
      }
      ++v20;
    }
    while (v13);
    if ((v12 & 1) != 0)
      objc_msgSend(a3, "closePath");
  }
}

- (void)appendToBezierPath:(id)a3
{
  -[TSDBezierSubpath appendToBezierPath:selectedNodesOnly:fromIndex:](self, "appendToBezierPath:selectedNodesOnly:fromIndex:", a3, 0, 0);
}

- (void)updateReflectedState
{
  -[NSMutableArray makeObjectsPerformSelector:](self->mNodes, "makeObjectsPerformSelector:", sel_updateReflectedState);
}

- (void)reverseDirection
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = (void *)-[NSMutableArray reverseObjectEnumerator](self->mNodes, "reverseObjectEnumerator");
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_msgSend(v3, "nextObject");
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      objc_msgSend(v5, "swapControlPoints");
      objc_msgSend(v6, "addObject:", v5);
      v5 = (void *)objc_msgSend(v3, "nextObject");
    }
    while (v5);
  }
  -[TSDBezierSubpath setNodes:](self, "setNodes:", v6);

}

- (void)transformUsingAffineTransform:(CGAffineTransform *)a3
{
  NSMutableArray *mNodes;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  _OWORD v11[3];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  mNodes = self->mNodes;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mNodes, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(mNodes);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v10 = *(_OWORD *)&a3->c;
        v11[0] = *(_OWORD *)&a3->a;
        v11[1] = v10;
        v11[2] = *(_OWORD *)&a3->tx;
        objc_msgSend(v9, "transformUsingAffineTransform:", v11);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mNodes, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
}

- (void)addNode:(id)a3
{
  -[NSMutableArray addObject:](self->mNodes, "addObject:", a3);
}

- (void)removeLastNode
{
  -[NSMutableArray removeLastObject](self->mNodes, "removeLastObject");
}

- (id)nodePriorToNode:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = -[NSMutableArray indexOfObject:](self->mNodes, "indexOfObject:", a3);
  v5 = v4 - 1;
  if (v4 >= 1)
    return (id)-[NSMutableArray objectAtIndex:](self->mNodes, "objectAtIndex:", v5);
  if (self->mClosed)
    return (id)-[NSMutableArray lastObject](self->mNodes, "lastObject", v5);
  return 0;
}

- (id)nodeAfterNode:(id)a3
{
  unint64_t v4;

  v4 = -[NSMutableArray indexOfObject:](self->mNodes, "indexOfObject:", a3) + 1;
  if (v4 < -[NSMutableArray count](self->mNodes, "count"))
    return (id)-[NSMutableArray objectAtIndex:](self->mNodes, "objectAtIndex:", v4);
  if (self->mClosed)
  {
    v4 = 0;
    return (id)-[NSMutableArray objectAtIndex:](self->mNodes, "objectAtIndex:", v4);
  }
  return 0;
}

- (TSDBezierNode)firstNode
{
  return (TSDBezierNode *)-[NSMutableArray firstObject](self->mNodes, "firstObject");
}

- (TSDBezierNode)lastNode
{
  _BOOL4 mClosed;
  NSMutableArray *mNodes;

  mClosed = self->mClosed;
  mNodes = self->mNodes;
  if (mClosed)
    return (TSDBezierNode *)-[NSMutableArray objectAtIndex:](mNodes, "objectAtIndex:", 0);
  else
    return (TSDBezierNode *)-[NSMutableArray lastObject](mNodes, "lastObject");
}

- (void)offsetSelectedNodesByDelta:(CGPoint)a3
{
  double x;
  NSMutableArray *mNodes;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  x = a3.x;
  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  mNodes = self->mNodes;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mNodes, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(mNodes);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "isSelected"))
        {
          objc_msgSend(v9, "nodePoint");
          objc_msgSend(v9, "moveToPoint:", TSDAddPoints(v10, v11, x));
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mNodes, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
}

- (void)offsetSelectedEdgesByDelta:(CGPoint)a3
{
  double x;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;

  x = a3.x;
  v5 = (void *)-[NSMutableArray objectEnumerator](self->mNodes, "objectEnumerator");
  v6 = objc_msgSend((id)-[NSMutableArray lastObject](self->mNodes, "lastObject"), "isSelected");
  v7 = objc_msgSend(v5, "nextObject");
  if (v7)
  {
    v8 = (void *)v7;
    do
    {
      if ((v6 & 1) != 0 || objc_msgSend(v8, "isSelected"))
      {
        objc_msgSend(v8, "nodePoint");
        objc_msgSend(v8, "moveToPoint:", TSDAddPoints(v9, v10, x));
        v6 = objc_msgSend(v8, "isSelected");
      }
      else
      {
        v6 = 0;
      }
      v8 = (void *)objc_msgSend(v5, "nextObject");
    }
    while (v8);
  }
}

- (BOOL)allNodesSelected
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)-[NSMutableArray reverseObjectEnumerator](self->mNodes, "reverseObjectEnumerator");
  do
  {
    v3 = (void *)objc_msgSend(v2, "nextObject");
    v4 = v3;
  }
  while (v3 && (objc_msgSend(v3, "isSelected") & 1) != 0);
  return v4 == 0;
}

- (BOOL)hasSelectedNode
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)-[NSMutableArray reverseObjectEnumerator](self->mNodes, "reverseObjectEnumerator");
  do
  {
    v3 = (void *)objc_msgSend(v2, "nextObject");
    v4 = v3;
  }
  while (v3 && !objc_msgSend(v3, "isSelected"));
  return v4 != 0;
}

- (void)removeNode:(id)a3
{
  -[NSMutableArray removeObject:](self->mNodes, "removeObject:", a3);
}

- (BOOL)canDeleteSelectedNodes
{
  void *v2;
  int v3;
  unint64_t v4;
  void *v5;
  void *v6;
  int v7;

  v2 = (void *)-[NSMutableArray objectEnumerator](self->mNodes, "objectEnumerator");
  v3 = 0;
  v4 = 0;
  do
  {
    v5 = (void *)objc_msgSend(v2, "nextObject");
    v6 = v5;
    if (!v5)
      break;
    v7 = objc_msgSend(v5, "isSelected");
    v3 |= v7;
    v4 += v7 ^ 1u;
  }
  while ((v3 & 1) == 0 || v4 < 2);
  return v6 != 0;
}

- (void)deleteSelectedNodes
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)-[NSMutableArray objectEnumerator](self->mNodes, "objectEnumerator");
  v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = objc_msgSend(v3, "nextObject");
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      if ((objc_msgSend(v6, "isSelected") & 1) == 0)
        -[NSMutableArray addObject:](v4, "addObject:", v6);
      v6 = (void *)objc_msgSend(v3, "nextObject");
    }
    while (v6);
  }

  self->mNodes = v4;
  if ((unint64_t)-[NSMutableArray count](v4, "count") <= 1)
    -[TSDBezierSubpath setClosed:](self, "setClosed:", 0);
}

- (void)selectAllNodes
{
  NSMutableArray *mNodes;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  mNodes = self->mNodes;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mNodes, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(mNodes);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "setSelected:", 1);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mNodes, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)deselectAllNodes
{
  NSMutableArray *mNodes;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  mNodes = self->mNodes;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mNodes, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(mNodes);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "setSelected:", 0);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mNodes, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (double)distanceToPoint:(CGPoint)a3 elementIndex:(unint64_t *)a4 tValue:(double *)a5 threshold:(double)a6
{
  uint64_t v10;
  unint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  unint64_t v19;
  double v20;
  double v21;
  unint64_t v23;
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
  double v35;
  double v36;
  double y;
  double x;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  BOOL v44;
  double v45;
  double v47;
  double v48;
  float64x2_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v10 = -[NSMutableArray count](self->mNodes, "count");
  if (!v10)
    return 1.79769313e308;
  v11 = v10;
  v12 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->mNodes, "objectAtIndexedSubscript:", 0);
  objc_msgSend(v12, "nodePoint");
  v14 = v13;
  v16 = v15;
  v17 = v11 + self->mClosed;
  v45 = a6 * a6;
  if (v17 >= 2 && a6 * a6 < 1.79769313e308)
  {
    v19 = 0;
    v20 = 0.0;
    v21 = 1.79769313e308;
    v23 = 2;
    do
    {
      v47 = v21;
      v48 = v20;
      v24 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->mNodes, "objectAtIndexedSubscript:", (v23 - 1) % v11, *(_QWORD *)&v45);
      objc_msgSend(v24, "nodePoint");
      v26 = v25;
      v28 = v27;
      objc_msgSend(v12, "outControlPoint");
      v30 = v29;
      v32 = v31;
      objc_msgSend(v24, "inControlPoint");
      v34 = v33;
      v36 = v35;
      if (TSDNearlyEqualPoints(v14, v16, v30, v32) && TSDNearlyEqualPoints(v34, v36, v26, v28))
      {
        v49.f64[0] = v14;
        v49.f64[1] = v16;
        v50 = v26;
        v51 = v28;
        x = a3.x;
        y = a3.y;
        TSDNearestPointOnLineToPoint(v49.f64, a3.x, a3.y);
        v40 = v39;
        v41 = TSDMixPoints(v49.f64[0], v49.f64[1], v50, v51, v39);
      }
      else
      {
        v49.f64[0] = v14;
        v49.f64[1] = v16;
        v50 = v30;
        v51 = v32;
        v52 = v34;
        v53 = v36;
        v54 = v26;
        v55 = v28;
        x = a3.x;
        y = a3.y;
        v40 = TSDNearestPointOnCurveToPoint(&v49, a3.x, a3.y, 1.0);
        v41 = TSDPointOnCurve(&v49, v40);
      }
      v43 = TSDDistanceSquared(v41, v42, x, y);
      v21 = v47;
      v44 = v43 < v47;
      if (v43 < v47)
      {
        v21 = v43;
        v19 = v23 - 2;
      }
      v20 = v48;
      if (v44)
        v20 = v40;
      if (v23 >= v17)
        break;
      ++v23;
      v16 = v28;
      v14 = v26;
      v12 = v24;
    }
    while (v21 > v45);
  }
  else
  {
    v19 = 0;
    v20 = 0.0;
    v21 = 1.79769313e308;
  }
  if (a4)
    *a4 = v19;
  if (a5)
    *a5 = v20;
  return sqrt(v21);
}

- (id)bezierNodeUnderPoint:(CGPoint)a3 withTransform:(CGAffineTransform *)a4 andTolerance:(double)a5 returningType:(int64_t *)a6
{
  double y;
  double x;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  _OWORD v16[3];

  y = a3.y;
  x = a3.x;
  v11 = (void *)-[NSMutableArray objectEnumerator](-[TSDBezierSubpath nodes](self, "nodes"), "objectEnumerator");
  do
  {
    v12 = (void *)objc_msgSend(v11, "nextObject");
    v13 = v12;
    if (!v12)
      break;
    v14 = *(_OWORD *)&a4->c;
    v16[0] = *(_OWORD *)&a4->a;
    v16[1] = v14;
    v16[2] = *(_OWORD *)&a4->tx;
  }
  while (!objc_msgSend(v12, "underPoint:withTransform:andTolerance:returningType:", v16, a6, x, y, a5));
  return v13;
}

- (id)insertNodeAtPoint:(CGPoint)a3 tolerance:(double)a4
{
  double y;
  double x;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
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
  double v22;
  double v23;
  uint64_t v24;
  _BOOL4 v25;
  TSDBezierNode *v26;
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
  TSDBezierNode *v59;
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
  id v74;
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
  id v98;
  id v99;

  y = a3.y;
  x = a3.x;
  v8 = (void *)-[NSMutableArray objectEnumerator](-[TSDBezierSubpath nodes](self, "nodes"), "objectEnumerator");
  v9 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
  v10 = objc_msgSend(v8, "nextObject");
  v11 = objc_msgSend(v8, "nextObject");
  if (!v11)
    return 0;
  v12 = (void *)v11;
  v13 = (void *)v10;
  while (1)
  {
    objc_msgSend(v9, "removeAllPoints");
    objc_msgSend(v13, "nodePoint");
    objc_msgSend(v9, "moveToPoint:");
    objc_msgSend(v12, "nodePoint");
    v15 = v14;
    v17 = v16;
    objc_msgSend(v13, "outControlPoint");
    v19 = v18;
    v21 = v20;
    objc_msgSend(v12, "inControlPoint");
    objc_msgSend(v9, "curveToPoint:controlPoint1:controlPoint2:", v15, v17, v19, v21, v22, v23);
    v9 = (id)objc_msgSend(v9, "bezierPathByFlatteningPath");
    if (objc_msgSend(v9, "pointOnPath:tolerance:", x, y, a4))
      break;
    v24 = objc_msgSend(v8, "nextObject");
    if (v24 || (v25 = -[TSDBezierSubpath isClosed](self, "isClosed"), v24 = v10, v25))
    {
      v13 = v12;
      v12 = (void *)v24;
      if (v24)
        continue;
    }
    return 0;
  }
  objc_msgSend(v13, "nodePoint");
  v28 = v27;
  v30 = v29;
  objc_msgSend(v13, "outControlPoint");
  if (TSDNearlyEqualPoints(v28, v30, v31, v32)
    && (objc_msgSend(v12, "nodePoint"),
        v34 = v33,
        v36 = v35,
        objc_msgSend(v12, "outControlPoint"),
        TSDNearlyEqualPoints(v34, v36, v37, v38)))
  {
    objc_msgSend(v13, "nodePoint");
    v41 = TSDDistance(x, y, v39, v40);
    objc_msgSend(v12, "nodePoint");
    v43 = v42;
    v45 = v44;
    objc_msgSend(v13, "nodePoint");
    v48 = v41 / TSDDistance(v43, v45, v46, v47);
    objc_msgSend(v12, "nodePoint");
    v50 = v49;
    v52 = v51;
    objc_msgSend(v13, "nodePoint");
    v54 = TSDSubtractPoints(v50, v52, v53);
    v56 = TSDMultiplyPointScalar(v54, v55, v48);
    objc_msgSend(v13, "nodePoint");
    v59 = +[TSDBezierNode bezierNodeWithPoint:](TSDBezierNode, "bezierNodeWithPoint:", TSDAddPoints(v57, v58, v56));
  }
  else
  {
    objc_msgSend(v13, "nodePoint");
    v61 = v60;
    v63 = v62;
    objc_msgSend(v13, "outControlPoint");
    v65 = v64;
    v67 = v66;
    objc_msgSend(v12, "inControlPoint");
    v69 = v68;
    v71 = v70;
    objc_msgSend(v12, "nodePoint");
    v74 = +[TSDBezierSegment segmentFromPoint:outPoint:inPoint:toPoint:](TSDBezierSegment, "segmentFromPoint:outPoint:inPoint:toPoint:", v61, v63, v65, v67, v69, v71, v72, v73);
    objc_msgSend(v74, "parametricValueForPoint:", x, y);
    v98 = 0;
    v99 = 0;
    objc_msgSend(v74, "splitAtParametricValue:left:right:", &v99, &v98);
    objc_msgSend(v13, "nodePoint");
    v76 = v75;
    v78 = v77;
    objc_msgSend(v13, "outControlPoint");
    if (!TSDNearlyEqualPoints(v76, v78, v79, v80))
    {
      objc_msgSend(v99, "outPoint");
      objc_msgSend(v13, "setOutControlPoint:");
    }
    objc_msgSend(v12, "nodePoint");
    v82 = v81;
    v84 = v83;
    objc_msgSend(v12, "outControlPoint");
    if (!TSDNearlyEqualPoints(v82, v84, v85, v86))
    {
      objc_msgSend(v98, "inPoint");
      objc_msgSend(v12, "setInControlPoint:");
    }
    objc_msgSend(v99, "toPoint");
    v88 = v87;
    v90 = v89;
    objc_msgSend(v99, "inPoint");
    v92 = v91;
    v94 = v93;
    objc_msgSend(v98, "outPoint");
    v59 = +[TSDBezierNode bezierNodeWithPoint:inControlPoint:outControlPoint:](TSDBezierNode, "bezierNodeWithPoint:inControlPoint:outControlPoint:", v88, v90, v92, v94, v95, v96);
  }
  v26 = v59;
  -[TSDBezierNode setReflectedState:](v59, "setReflectedState:", 1);
  -[NSMutableArray insertObject:atIndex:](self->mNodes, "insertObject:atIndex:", v26, -[NSMutableArray indexOfObject:](self->mNodes, "indexOfObject:", v12));
  return v26;
}

- (CGRect)nodeBounds
{
  double *v3;
  CGFloat v4;
  CGFloat v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  uint64_t v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect result;

  v3 = (double *)MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 24);
  if (-[NSMutableArray count](-[TSDBezierSubpath nodes](self, "nodes"), "count"))
  {
    v6 = (void *)-[NSMutableArray objectEnumerator](-[TSDBezierSubpath nodes](self, "nodes"), "objectEnumerator");
    objc_msgSend((id)objc_msgSend(v6, "nextObject"), "nodePoint");
    v8 = v7;
    v10 = v9;
    v11 = objc_msgSend(v6, "nextObject");
    if (v11)
    {
      v12 = (void *)v11;
      do
      {
        objc_msgSend(v12, "nodePoint");
        v8 = TSDGrowRectToPoint(v8, v10, v4, v5, v13, v14);
        v10 = v15;
        v4 = v16;
        v5 = v17;
        if (objc_msgSend(v12, "isSelected"))
        {
          objc_msgSend(v12, "inControlPoint");
          v20 = TSDGrowRectToPoint(v8, v10, v4, v5, v18, v19);
          v22 = v21;
          v24 = v23;
          v26 = v25;
          objc_msgSend(v12, "outControlPoint");
          v8 = TSDGrowRectToPoint(v20, v22, v24, v26, v27, v28);
          v10 = v29;
          v4 = v30;
          v5 = v31;
        }
        v12 = (void *)objc_msgSend(v6, "nextObject");
      }
      while (v12);
    }
  }
  else
  {
    v8 = *v3;
    v10 = v3[1];
  }
  v32 = v8;
  v33 = v10;
  v34 = v4;
  v35 = v5;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (void)sharpenAllNodes
{
  -[NSMutableArray makeObjectsPerformSelector:](self->mNodes, "makeObjectsPerformSelector:", sel_collapse);
}

- (void)smoothNode:(id)a3
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
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
  double v94;
  double v95;
  int8x16_t v96;
  int8x16_t v97;
  int8x16_t v98;
  int8x16_t v99;
  BOOL v100;
  int8x16_t v101;
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
  double v113;
  double v114;

  v5 = -[TSDBezierSubpath nodePriorToNode:](self, "nodePriorToNode:");
  v6 = -[TSDBezierSubpath nodeAfterNode:](self, "nodeAfterNode:", a3);
  v7 = v6;
  v8 = *MEMORY[0x24BDBEFB0];
  v9 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  if (v5)
  {
    objc_msgSend(v5, "nodePoint");
    v11 = v10;
    v13 = v12;
    objc_msgSend(a3, "nodePoint");
    v15 = TSDSubtractPoints(v11, v13, v14);
    v17 = v16;
    if (!v7)
    {
      objc_msgSend(a3, "nodePoint");
      v19 = v18;
      v21 = v20;
      v22 = TSDMultiplyPointScalar(v15, v17, 0.330000013);
      objc_msgSend(a3, "setInControlPoint:", TSDAddPoints(v19, v21, v22));
      return;
    }
  }
  else
  {
    v15 = *MEMORY[0x24BDBEFB0];
    v17 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    if (!v6)
      return;
  }
  objc_msgSend(v7, "nodePoint");
  v24 = v23;
  v26 = v25;
  objc_msgSend(a3, "nodePoint");
  v28 = TSDSubtractPoints(v24, v26, v27);
  v30 = v29;
  if (v5)
  {
    if (!TSDNearlyEqualPoints(v15, v17, v8, v9) && !TSDNearlyEqualPoints(v28, v30, v8, v9))
    {
      objc_msgSend(a3, "inControlPoint");
      v37 = v36;
      v39 = v38;
      objc_msgSend(a3, "nodePoint");
      if (TSDNearlyEqualPoints(v37, v39, v40, v41))
      {
        objc_msgSend(a3, "nodePoint");
        v43 = v42;
        v45 = v44;
        v46 = TSDMultiplyPointScalar(v15, v17, 0.100000001);
        objc_msgSend(a3, "setInControlPoint:", TSDAddPoints(v43, v45, v46));
      }
      objc_msgSend(a3, "outControlPoint");
      v48 = v47;
      v50 = v49;
      objc_msgSend(a3, "nodePoint");
      if (TSDNearlyEqualPoints(v48, v50, v51, v52))
      {
        objc_msgSend(a3, "nodePoint");
        v54 = v53;
        v56 = v55;
        v57 = TSDMultiplyPointScalar(v28, v30, 0.100000001);
        objc_msgSend(a3, "setOutControlPoint:", TSDAddPoints(v54, v56, v57));
      }
      objc_msgSend(a3, "inControlPoint");
      v59 = v58;
      v61 = v60;
      objc_msgSend(a3, "nodePoint");
      v63 = TSDSubtractPoints(v59, v61, v62);
      v65 = v64;
      v66 = TSDPointLength(v63, v64);
      v113 = TSDMultiplyPointScalar(v63, v65, 1.0 / v66);
      v114 = v67;
      objc_msgSend(a3, "nodePoint");
      v69 = v68;
      v71 = v70;
      objc_msgSend(a3, "outControlPoint");
      v73 = TSDSubtractPoints(v69, v71, v72);
      v75 = v74;
      v76 = TSDPointLength(v73, v74);
      v77 = TSDMultiplyPointScalar(v73, v75, 1.0 / v76);
      v79 = v78;
      v80 = TSDPointLength(v15, v17);
      v81 = v80 * 0.5 + (v66 - v80 * 0.5) * 0.699999988;
      v82 = TSDPointLength(v28, v30) * 0.5;
      v83 = v82 + (v76 - v82) * 0.699999988;
      v84 = TSDAddPoints(v113, v114, v77);
      v86 = TSDMultiplyPointScalar(v84, v85, 0.5);
      v88 = v87;
      v89 = TSDPointLength(v86, v87);
      if (v89 >= 0.5)
        v90 = TSDMultiplyPointScalar(v86, v88, 1.0 / v89);
      else
        v90 = TSDRotatePoint90Degrees(0, v77, v79);
      v92 = v90;
      v93 = v91;
      v94 = v81 * TSDDotPoints(v113, v114, v90, v91);
      v95 = -(v83 * TSDDotPoints(v77, v79, v92, v93));
      *(double *)v97.i64 = fabs(v94);
      *(double *)v98.i64 = v81 * 0.5;
      if (*(double *)v97.i64 < v81 * 0.5)
      {
        *(float *)v98.i32 = *(double *)v98.i64;
        *(float *)v97.i32 = v94;
        v99.i64[0] = 0x8000000080000000;
        v99.i64[1] = 0x8000000080000000;
        v98 = vbslq_s8(v99, v98, v97);
        v94 = *(float *)v98.i32;
      }
      *(double *)v98.i64 = fabs(v95);
      *(double *)v96.i64 = v83 * 0.5;
      v100 = *(double *)v98.i64 < v83 * 0.5;
      *(float *)v96.i32 = v83 * 0.5;
      *(float *)v98.i32 = v95;
      v101.i64[0] = 0x8000000080000000;
      v101.i64[1] = 0x8000000080000000;
      *(double *)v96.i64 = *(float *)vbslq_s8(v101, v96, v98).i32;
      if (v100)
        v102 = *(double *)v96.i64;
      else
        v102 = v95;
      objc_msgSend(a3, "nodePoint");
      v104 = v103;
      v106 = v105;
      v107 = TSDMultiplyPointScalar(v92, v93, v94);
      objc_msgSend(a3, "setInControlPoint:", TSDAddPoints(v104, v106, v107));
      objc_msgSend(a3, "nodePoint");
      v109 = v108;
      v111 = v110;
      v112 = TSDMultiplyPointScalar(v92, v93, v102);
      objc_msgSend(a3, "setOutControlPoint:", TSDAddPoints(v109, v111, v112));
      objc_msgSend(a3, "setReflectedState:", 1);
    }
  }
  else
  {
    objc_msgSend(a3, "nodePoint");
    v32 = v31;
    v34 = v33;
    v35 = TSDMultiplyPointScalar(v28, v30, 0.330000013);
    objc_msgSend(a3, "setOutControlPoint:", TSDAddPoints(v32, v34, v35));
  }
}

- (BOOL)closeIfEndpointsAreEqual
{
  _BOOL4 v3;
  TSDBezierNode *v4;
  TSDBezierNode *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (-[TSDBezierSubpath isClosed](self, "isClosed"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v4 = -[TSDBezierSubpath firstNode](self, "firstNode");
    v5 = -[TSDBezierSubpath lastNode](self, "lastNode");
    -[TSDBezierNode nodePoint](v5, "nodePoint");
    v7 = v6;
    v9 = v8;
    -[TSDBezierNode nodePoint](v4, "nodePoint");
    v3 = TSDNearlyEqualPoints(v7, v9, v10, v11);
    if (v3)
    {
      -[TSDBezierNode inControlPoint](v5, "inControlPoint");
      -[TSDBezierNode setInControlPoint:](v4, "setInControlPoint:");
      -[TSDBezierSubpath removeLastNode](self, "removeLastNode");
      -[TSDBezierSubpath setClosed:](self, "setClosed:", 1);
    }
    -[TSDBezierNode updateReflectedState](v4, "updateReflectedState");
  }
  return v3;
}

- (void)addNodesToArray:(id)a3
{
  objc_msgSend(a3, "addObjectsFromArray:", self->mNodes);
}

- (id)splitEdgeAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  float64_t v8;
  double v9;
  float64_t v10;
  double v11;
  double v12;
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
  double v25;
  TSDBezierNode *v26;
  char v28[16];
  double v29;
  double v30;
  double v31;
  double v32;
  char v33[16];
  double v34;
  double v35;
  double v36;
  double v37;
  float64x2_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->mNodes, "objectAtIndexedSubscript:");
  v6 = a3 + 1;
  v7 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->mNodes, "objectAtIndexedSubscript:", (a3 + 1) % -[NSMutableArray count](self->mNodes, "count"));
  objc_msgSend(v5, "nodePoint");
  v9 = v8;
  v11 = v10;
  v38.f64[0] = v8;
  v38.f64[1] = v10;
  objc_msgSend(v5, "outControlPoint");
  v13 = v12;
  v15 = v14;
  v39 = v12;
  v40 = v14;
  objc_msgSend(v7, "inControlPoint");
  v17 = v16;
  v19 = v18;
  v41 = v16;
  v42 = v18;
  objc_msgSend(v7, "nodePoint");
  v21 = v20;
  v23 = v22;
  v43 = v20;
  v44 = v22;
  if (TSDNearlyEqualPoints(v9, v11, v13, v15) && TSDNearlyEqualPoints(v17, v19, v21, v23))
  {
    v39 = TSDMixPoints(v9, v11, v21, v23, 0.333333333);
    v40 = v24;
    v41 = TSDMixPoints(v9, v11, v21, v23, 0.666666667);
    v42 = v25;
  }
  v26 = +[TSDBezierNode bezierNodeWithPoint:](TSDBezierNode, "bezierNodeWithPoint:", TSDPointOnCurve(&v38, 0.5));
  -[TSDBezierNode setReflectedState:](v26, "setReflectedState:", 2);
  -[TSDBezierNode setType:](v26, "setType:", 3);
  -[NSMutableArray insertObject:atIndex:](self->mNodes, "insertObject:atIndex:", v26, v6);
  TSDCurveBetween(&v38, (uint64_t)v33, 0.0, 0.5);
  TSDCurveBetween(&v38, (uint64_t)v28, 0.5, 1.0);
  objc_msgSend(v5, "setOutControlPoint:", v34, v35);
  -[TSDBezierNode setInControlPoint:](v26, "setInControlPoint:", v36, v37);
  -[TSDBezierNode setOutControlPoint:](v26, "setOutControlPoint:", v29, v30);
  objc_msgSend(v7, "setInControlPoint:", v31, v32);
  return v26;
}

- (void)convertToHobby
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  double v11;
  double v12;
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

  v3 = -[NSMutableArray count](self->mNodes, "count");
  if (v3)
  {
    v4 = v3;
    v5 = -[TSDBezierSubpath isClosed](self, "isClosed") ^ 1;
    v6 = v4 - v5;
    if (v4 != v5)
    {
      v7 = 0;
      do
      {
        v8 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->mNodes, "objectAtIndexedSubscript:", v7);
        v9 = v7 + 1;
        v10 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->mNodes, "objectAtIndexedSubscript:", (v7 + 1) % v4);
        if (objc_msgSend(v8, "reflectedState"))
        {
          objc_msgSend(v8, "setType:", 3);
        }
        else if (!objc_msgSend(v8, "reflectedState"))
        {
          objc_msgSend(v8, "setType:", 1);
          if (!objc_msgSend(v10, "reflectedState"))
          {
            objc_msgSend(v8, "nodePoint");
            v12 = v11;
            v14 = v13;
            objc_msgSend(v8, "outControlPoint");
            if (!TSDNearlyEqualPoints(v12, v14, v15, v16)
              || (objc_msgSend(v10, "nodePoint"),
                  v18 = v17,
                  v20 = v19,
                  objc_msgSend(v10, "inControlPoint"),
                  !TSDNearlyEqualPoints(v18, v20, v21, v22)))
            {
              -[TSDBezierSubpath splitEdgeAtIndex:](self, "splitEdgeAtIndex:", v7);
              ++v6;
              ++v4;
            }
          }
        }
        ++v7;
      }
      while (v9 < v6);
    }
  }
}

- (NSMutableArray)nodes
{
  return self->mNodes;
}

- (void)setNodes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (BOOL)isClosed
{
  return self->mClosed;
}

- (void)setClosed:(BOOL)a3
{
  self->mClosed = a3;
}

@end
