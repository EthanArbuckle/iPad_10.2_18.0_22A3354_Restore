@implementation TSDAbstractLayout

- (TSDAbstractLayout)root
{
  TSDAbstractLayout *mParent;

  mParent = self->mParent;
  if (mParent)
    return -[TSDAbstractLayout root](mParent, "root");
  else
    return self;
}

- (void)setInterimPositionX:(double)a3
{
  self->mInterimPosition.x = a3;
  self->mInterimPositionXSet = 1;
}

- (void)fixTransformFromInterimPosition
{
  -[TSDAbstractLayout p_fixTransformFromInterimPosition:interimPositionXSet:interimPositionYSet:](self, "p_fixTransformFromInterimPosition:interimPositionXSet:interimPositionYSet:", self->mInterimPositionXSet, self->mInterimPositionYSet, self->mInterimPosition.x, self->mInterimPosition.y);
  self->mLastInterimPosition = self->mInterimPosition;
  *(_WORD *)&self->mLastInterimPositionXSet = *(_WORD *)&self->mInterimPositionXSet;
  self->mInterimPosition = (CGPoint)*MEMORY[0x24BDBEFB0];
  *(_WORD *)&self->mInterimPositionXSet = 0;
}

- (void)setGeometry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)offsetGeometryBy:(CGPoint)a3
{
  if (a3.x != *MEMORY[0x24BDBEFB0] || a3.y != *(double *)(MEMORY[0x24BDBEFB0] + 8))
    -[TSDAbstractLayout setGeometry:](self, "setGeometry:", -[TSDLayoutGeometry geometryByTranslatingBy:](-[TSDAbstractLayout geometry](self, "geometry"), "geometryByTranslatingBy:", a3.x, a3.y));
}

- (void)p_fixTransformFromInterimPosition:(CGPoint)a3 interimPositionXSet:(BOOL)a4 interimPositionYSet:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  double v8;
  double v9;
  double x;
  double v11;

  v5 = a5;
  y = a3.y;
  v8 = 0.0;
  v9 = 0.0;
  if (a4)
  {
    x = a3.x;
    -[TSDAbstractLayout alignmentFrameOriginForFixingInterimPosition](self, "alignmentFrameOriginForFixingInterimPosition");
    v9 = x - a3.x;
  }
  if (v5)
  {
    -[TSDAbstractLayout alignmentFrameOriginForFixingInterimPosition](self, "alignmentFrameOriginForFixingInterimPosition", a3.x);
    v8 = y - v11;
  }
  -[TSDAbstractLayout offsetGeometryBy:](self, "offsetGeometryBy:", v9, v8);
}

- (CGRect)alignmentFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSDLayoutGeometry frame](-[TSDAbstractLayout geometry](self, "geometry"), "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (TSDLayoutGeometry)geometry
{
  return self->mGeometry;
}

- (TSDAbstractLayout)init
{
  TSDAbstractLayout *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDAbstractLayout;
  v2 = -[TSDAbstractLayout init](&v4, sel_init);
  if (v2)
    v2->mGeometry = objc_alloc_init(TSDLayoutGeometry);
  return v2;
}

- (void)setInterimPositionY:(double)a3
{
  self->mInterimPosition.y = a3;
  self->mInterimPositionYSet = 1;
}

- (void)removeFromParent
{
  -[TSDAbstractLayout replaceChild:with:](self->mParent, "replaceChild:with:", self, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[NSMutableArray makeObjectsPerformSelector:withObject:](self->mChildren, "makeObjectsPerformSelector:withObject:", sel_setParent_, 0);
  v3.receiver = self;
  v3.super_class = (Class)TSDAbstractLayout;
  -[TSDAbstractLayout dealloc](&v3, sel_dealloc);
}

- (id)geometryInParent
{
  void *v3;
  TSDLayoutGeometry *v4;
  _OWORD v6[3];

  v3 = (void *)-[TSDLayoutGeometry mutableCopy](-[TSDAbstractLayout geometry](self, "geometry"), "mutableCopy");
  v4 = -[TSDAbstractLayout geometry](self->mParent, "geometry");
  if (v4)
    -[TSDLayoutGeometry transform](v4, "transform");
  else
    memset(v6, 0, sizeof(v6));
  objc_msgSend(v3, "transformBy:", v6);
  return v3;
}

- (id)geometryInRoot
{
  return -[TSDAbstractLayout geometryInRoot:](self, "geometryInRoot:", -[TSDAbstractLayout geometry](self, "geometry"));
}

- (id)geometryInRoot:(id)a3
{
  void *v4;
  TSDAbstractLayout *i;
  TSDLayoutGeometry *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  for (i = self->mParent; i; i = -[TSDAbstractLayout parent](i, "parent"))
  {
    v6 = -[TSDAbstractLayout geometry](i, "geometry", v8, v9, v10);
    if (v6)
    {
      -[TSDLayoutGeometry transform](v6, "transform");
    }
    else
    {
      v9 = 0u;
      v10 = 0u;
      v8 = 0u;
    }
    objc_msgSend(v4, "transformBy:", &v8);
  }
  return v4;
}

- (id)visibleGeometries
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = -[TSDAbstractLayout geometry](self, "geometry");
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
}

- (CGAffineTransform)transform
{
  CGAffineTransform *result;

  result = -[TSDAbstractLayout geometry](self, "geometry");
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform transform](result, "transform");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (CGAffineTransform)transformInParent
{
  TSDLayoutGeometry *v5;
  TSDLayoutGeometry *v6;
  CGAffineTransform v8;
  CGAffineTransform t1;

  v5 = -[TSDAbstractLayout geometry](self, "geometry");
  if (v5)
    -[TSDLayoutGeometry transform](v5, "transform");
  else
    memset(&t1, 0, sizeof(t1));
  v6 = -[TSDAbstractLayout geometry](self->mParent, "geometry");
  if (v6)
    -[TSDLayoutGeometry transform](v6, "transform");
  else
    memset(&v8, 0, sizeof(v8));
  return CGAffineTransformConcat(retstr, &t1, &v8);
}

- (CGAffineTransform)transformInRoot
{
  CGAffineTransform *result;
  void *mParent;
  void *v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[3];
  __int128 v11;
  __int128 v12;
  __int128 v13;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  result = -[TSDAbstractLayout geometry](self, "geometry");
  if (result)
  {
    result = (CGAffineTransform *)-[CGAffineTransform transform](result, "transform");
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  mParent = self->mParent;
  if (mParent)
  {
    do
    {
      v7 = (void *)objc_msgSend(mParent, "geometry");
      if (v7)
      {
        v8 = *(_OWORD *)&retstr->c;
        v10[0] = *(_OWORD *)&retstr->a;
        v10[1] = v8;
        v10[2] = *(_OWORD *)&retstr->tx;
        objc_msgSend(v7, "transformByConcatenatingTransformTo:", v10);
      }
      else
      {
        v12 = 0u;
        v13 = 0u;
        v11 = 0u;
      }
      v9 = v12;
      *(_OWORD *)&retstr->a = v11;
      *(_OWORD *)&retstr->c = v9;
      *(_OWORD *)&retstr->tx = v13;
      result = (CGAffineTransform *)objc_msgSend(mParent, "parent");
      mParent = result;
    }
    while (result);
  }
  return result;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSDLayoutGeometry frame](-[TSDAbstractLayout geometry](self, "geometry"), "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)frameInParent
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](self, "geometry"), "size");
  -[TSDAbstractLayout rectInParent:](self, "rectInParent:", TSDRectWithSize());
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)frameInRoot
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](self, "geometry"), "size");
  -[TSDAbstractLayout rectInRoot:](self, "rectInRoot:", TSDRectWithSize());
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)rectInParent:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGAffineTransform v7;
  CGRect v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self)
    -[TSDAbstractLayout transformInParent](self, "transformInParent");
  else
    memset(&v7, 0, sizeof(v7));
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  return CGRectApplyAffineTransform(v8, &v7);
}

- (CGRect)rectInRoot:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGAffineTransform v7;
  CGRect v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self)
    -[TSDAbstractLayout transformInRoot](self, "transformInRoot");
  else
    memset(&v7, 0, sizeof(v7));
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  return CGRectApplyAffineTransform(v8, &v7);
}

- (BOOL)isAxisAlignedUnflippedInRoot
{
  _OWORD v3[3];

  if (self)
    -[TSDAbstractLayout transformInRoot](self, "transformInRoot");
  else
    memset(v3, 0, sizeof(v3));
  return TSDIsTransformAxisAlignedUnflipped((double *)v3);
}

- (BOOL)isRootLayoutForInspectorGeometry
{
  return 0;
}

- (BOOL)providesGuidesForChildLayouts
{
  return 0;
}

- (id)parentLayoutForProvidingGuides
{
  TSDAbstractLayout *v2;

  v2 = -[TSDAbstractLayout parent](self, "parent");
  if (-[TSDAbstractLayout providesGuidesForChildLayouts](v2, "providesGuidesForChildLayouts"))
    return v2;
  else
    return -[TSDAbstractLayout parentLayoutForProvidingGuides](v2, "parentLayoutForProvidingGuides");
}

- (id)layoutsForProvidingGuidesForChildLayouts
{
  void *v2;
  uint64_t v3;

  if (!-[TSDAbstractLayout providesGuidesForChildLayouts](self, "providesGuidesForChildLayouts"))
  {
    v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDAbstractLayout layoutsForProvidingGuidesForChildLayouts]");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDAbstractLayout.m"), 155, CFSTR("This method should never be called on a layout which returns NO for providesGuidesForChildLayouts."));
  }
  return 0;
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  return 0;
}

- (void)setParent:(id)a3
{
  self->mParent = (TSDAbstractLayout *)a3;
}

- (NSArray)children
{
  return &self->mChildren->super;
}

- (void)setChildren:(id)a3
{
  NSMutableArray *mChildren;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  NSMutableArray *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  mChildren = self->mChildren;
  if (mChildren != a3 && (-[NSMutableArray isEqual:](mChildren, "isEqual:") & 1) == 0)
  {
    if (a3)
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", a3);
    else
      v6 = 0;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = self->mChildren;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if ((objc_msgSend(v6, "containsObject:", v12) & 1) == 0)
            objc_msgSend(v12, "setParent:", 0);
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v9);
    }

    if (self->mChildren)
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", self->mChildren);
    else
      v13 = 0;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(a3);
          v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
          if ((objc_msgSend(v13, "containsObject:", v18) & 1) == 0)
          {
            objc_msgSend(v18, "removeFromParent");
            objc_msgSend(v18, "setParent:", self);
          }
        }
        v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v15);
    }

    v19 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
    self->mChildren = v19;
  }
}

- (void)addChild:(id)a3
{
  NSMutableArray *mChildren;
  uint64_t v6;

  mChildren = self->mChildren;
  if (mChildren)
    v6 = -[NSMutableArray count](mChildren, "count");
  else
    v6 = 0;
  -[TSDAbstractLayout insertChild:atIndex:](self, "insertChild:atIndex:", a3, v6);
}

- (void)insertChild:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v6;
  id v7;
  NSMutableArray *mChildren;

  if (a3)
  {
    v6 = objc_msgSend(a3, "parent");
    if (v6)
    {
      v7 = a3;
      objc_msgSend(a3, "removeFromParent");
    }
    mChildren = self->mChildren;
    if (!mChildren)
    {
      mChildren = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      self->mChildren = mChildren;
    }
    -[NSMutableArray insertObject:atIndex:](mChildren, "insertObject:atIndex:", a3, a4);
    objc_msgSend(a3, "setParent:", self);
    if (v6)

  }
}

- (void)insertChild:(id)a3 below:(id)a4
{
  NSMutableArray *mChildren;
  uint64_t v7;

  mChildren = self->mChildren;
  if (mChildren)
  {
    v7 = -[NSMutableArray indexOfObjectIdenticalTo:](mChildren, "indexOfObjectIdenticalTo:", a4);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      -[TSDAbstractLayout insertChild:atIndex:](self, "insertChild:atIndex:", a3, v7);
  }
}

- (void)insertChild:(id)a3 above:(id)a4
{
  NSMutableArray *mChildren;
  uint64_t v7;

  mChildren = self->mChildren;
  if (mChildren)
  {
    v7 = -[NSMutableArray indexOfObjectIdenticalTo:](mChildren, "indexOfObjectIdenticalTo:", a4);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      -[TSDAbstractLayout insertChild:atIndex:](self, "insertChild:atIndex:", a3, v7 + 1);
  }
}

- (void)replaceChild:(id)a3 with:(id)a4
{
  NSMutableArray *mChildren;
  uint64_t v8;
  uint64_t v9;
  id v10;

  mChildren = self->mChildren;
  if (mChildren)
  {
    v8 = -[NSMutableArray indexOfObjectIdenticalTo:](mChildren, "indexOfObjectIdenticalTo:");
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = v8;
      v10 = a3;
      -[NSMutableArray removeObjectAtIndex:](self->mChildren, "removeObjectAtIndex:", v9);
      objc_msgSend(a3, "setParent:", 0);

      -[TSDAbstractLayout insertChild:atIndex:](self, "insertChild:atIndex:", a4, v9);
    }
  }
}

- (void)exchangeChildAtIndex:(unint64_t)a3 withChildAtIndex:(unint64_t)a4
{
  NSMutableArray *mChildren;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v12;
  uint64_t v13;

  mChildren = self->mChildren;
  if (!mChildren)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDAbstractLayout exchangeChildAtIndex:withChildAtIndex:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDAbstractLayout.m"), 281, CFSTR("invalid nil value for '%s'"), "mChildren");
    mChildren = self->mChildren;
  }
  if (a3 != a4 && mChildren)
  {
    v10 = -[NSMutableArray count](mChildren, "count");
    if (v10 > a3 && v10 > a4)
    {
      -[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:](self->mChildren, "exchangeObjectAtIndex:withObjectAtIndex:", a3, a4);
    }
    else
    {
      v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDAbstractLayout exchangeChildAtIndex:withChildAtIndex:]");
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDAbstractLayout.m"), 284, CFSTR("bad index"));
    }
  }
}

- (void)addLayoutsInRect:(CGRect)a3 toArray:(id)a4 deep:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  double y;
  double x;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  TSDLayoutGeometry *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v38 = *MEMORY[0x24BDAC8D0];
  -[TSDAbstractLayout frameForCulling](self, "frameForCulling");
  if (TSDIntersectsRect(v12, v13, v14, v15, x, y, width, height))
  {
    objc_msgSend(a4, "addObject:", self);
    if (v5)
    {
      -[TSDAbstractLayout frameForCulling](self, "frameForCulling");
      v43.origin.x = x;
      v43.origin.y = y;
      v43.size.width = width;
      v43.size.height = height;
      v40 = CGRectIntersection(v39, v43);
      v16 = v40.origin.x;
      v17 = v40.origin.y;
      v18 = v40.size.width;
      v19 = v40.size.height;
      memset(&v36, 0, sizeof(v36));
      v20 = -[TSDAbstractLayout geometry](self, "geometry");
      if (v20)
        -[TSDLayoutGeometry transform](v20, "transform");
      else
        memset(&v35, 0, sizeof(v35));
      CGAffineTransformInvert(&v36, &v35);
      v34 = v36;
      v41.origin.x = v16;
      v41.origin.y = v17;
      v41.size.width = v18;
      v41.size.height = v19;
      v42 = CGRectApplyAffineTransform(v41, &v34);
      v21 = v42.origin.x;
      v22 = v42.origin.y;
      v23 = v42.size.width;
      v24 = v42.size.height;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v25 = -[TSDAbstractLayout children](self, "children", 0);
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v31;
        do
        {
          v29 = 0;
          do
          {
            if (*(_QWORD *)v31 != v28)
              objc_enumerationMutation(v25);
            objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v29++), "addLayoutsInRect:toArray:deep:", a4, 1, v21, v22, v23, v24);
          }
          while (v27 != v29);
          v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
        }
        while (v27);
      }
    }
  }
}

- (void)addLayoutsToArray:(id)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "addObject:", self);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = -[TSDAbstractLayout children](self, "children", 0);
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "addLayoutsToArray:", a3);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)addDescendentLayoutsToArray:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = -[TSDAbstractLayout children](self, "children", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "addLayoutsToArray:", a3);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (CGRect)alignmentFrameInRoot
{
  TSDAbstractLayout *v3;
  double v4;
  CGFloat x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  TSDAbstractLayout *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  v3 = -[TSDAbstractLayout parent](self, "parent");
  -[TSDAbstractLayout alignmentFrame](self, "alignmentFrame");
  x = v4;
  y = v6;
  width = v8;
  height = v10;
  if (v3)
  {
    v12 = -[TSDAbstractLayout parent](self, "parent");
    if (v12)
      -[TSDAbstractLayout transformInRoot](v12, "transformInRoot");
    else
      memset(&v17, 0, sizeof(v17));
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    v19 = CGRectApplyAffineTransform(v18, &v17);
    x = v19.origin.x;
    y = v19.origin.y;
    width = v19.size.width;
    height = v19.size.height;
  }
  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)shouldSnapWhileResizing
{
  double v3;
  double v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  if (self)
  {
    -[TSDAbstractLayout transformInRoot](self, "transformInRoot");
  }
  else
  {
    v7 = 0u;
    v8 = 0u;
    v6 = 0u;
  }
  -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](self, "geometry", v6, v7, v8), "size");
  return TSDIsTransformAxisAlignedWithObjectSize((double *)&v6, v3, v4);
}

- (double)interimPositionX
{
  return self->mInterimPosition.x;
}

- (double)interimPositionY
{
  return self->mInterimPosition.y;
}

- (void)fixTransformFromLastInterimPosition
{
  -[TSDAbstractLayout p_fixTransformFromInterimPosition:interimPositionXSet:interimPositionYSet:](self, "p_fixTransformFromInterimPosition:interimPositionXSet:interimPositionYSet:", self->mLastInterimPositionXSet, self->mLastInterimPositionYSet, self->mLastInterimPosition.x, self->mLastInterimPosition.y);
}

- (BOOL)supportsResize
{
  return 1;
}

- (BOOL)supportsInspectorPositioning
{
  return 1;
}

- (BOOL)supportsRotation
{
  return 0;
}

- (BOOL)supportsParentRotation
{
  return 1;
}

- (BOOL)canRotateChildLayout:(id)a3
{
  return 1;
}

- (id)delegateConformingToProtocol:(id)a3 forLayout:(id)a4
{
  return 0;
}

- (TSDAbstractLayout)parent
{
  return self->mParent;
}

@end
