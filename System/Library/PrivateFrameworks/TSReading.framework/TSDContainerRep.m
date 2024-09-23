@implementation TSDContainerRep

- (void)dealloc
{
  NSMutableArray *mChildReps;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v11;
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
  mChildReps = self->mChildReps;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildReps, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(mChildReps);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((TSDContainerRep *)objc_msgSend(v8, "parentRep") != self)
        {
          v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDContainerRep dealloc]");
          objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContainerRep.m"), 25, CFSTR("parentRep not correct"));
        }
        objc_msgSend(v8, "setParentRep:", 0);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildReps, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  v11.receiver = self;
  v11.super_class = (Class)TSDContainerRep;
  -[TSDRep dealloc](&v11, sel_dealloc);
}

- (TSDContainerInfo)containerInfo
{
  -[TSDRep info](self, "info");
  return (TSDContainerInfo *)TSUProtocolCast();
}

- (id)childReps
{
  return self->mChildReps;
}

- (BOOL)canSelectChildRep:(id)a3
{
  return 0;
}

- (void)selectChildRep:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDContainerRep selectChildRep:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContainerRep.m"), 61, CFSTR("subclass should override this method"));
}

- (TSDMutableContainerInfo)mutableContainerInfo
{
  -[TSDRep info](self, "info");
  return (TSDMutableContainerInfo *)TSUProtocolCast();
}

- (void)setChildReps:(id)a3
{
  NSMutableArray *mChildReps;
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
  mChildReps = self->mChildReps;
  if (mChildReps != a3 && (-[NSMutableArray isEqual:](mChildReps, "isEqual:") & 1) == 0)
  {
    if (a3)
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", a3);
    else
      v6 = 0;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = self->mChildReps;
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
            objc_msgSend(v12, "setParentRep:", 0);
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v9);
    }

    if (self->mChildReps)
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", self->mChildReps);
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
            objc_msgSend(v18, "parentRep");
            objc_msgSend((id)TSUProtocolCast(), "removeChildRep:", v18);
            objc_msgSend(v18, "setParentRep:", self);
          }
        }
        v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v15);
    }

    v19 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
    self->mChildReps = v19;
  }
}

- (void)addChildRep:(id)a3
{
  NSMutableArray *mChildReps;
  uint64_t v6;

  mChildReps = self->mChildReps;
  if (mChildReps)
    v6 = -[NSMutableArray count](mChildReps, "count");
  else
    v6 = 0;
  -[TSDContainerRep insertChildRep:atIndex:](self, "insertChildRep:atIndex:", a3, v6);
}

- (void)insertChildRep:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v6;
  id v7;
  NSMutableArray *mChildReps;

  if (a3)
  {
    v6 = objc_msgSend(a3, "parentRep");
    if (v6)
    {
      v7 = a3;
      objc_msgSend(a3, "parentRep");
      objc_msgSend((id)TSUProtocolCast(), "removeChildRep:", a3);
    }
    mChildReps = self->mChildReps;
    if (!mChildReps)
    {
      mChildReps = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      self->mChildReps = mChildReps;
    }
    -[NSMutableArray insertObject:atIndex:](mChildReps, "insertObject:atIndex:", a3, a4);
    objc_msgSend(a3, "setParentRep:", self);
    if (v6)

  }
}

- (void)insertChildRep:(id)a3 below:(id)a4
{
  NSMutableArray *mChildReps;
  uint64_t v7;

  mChildReps = self->mChildReps;
  if (mChildReps)
  {
    v7 = -[NSMutableArray indexOfObjectIdenticalTo:](mChildReps, "indexOfObjectIdenticalTo:", a4);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      -[TSDContainerRep insertChildRep:atIndex:](self, "insertChildRep:atIndex:", a3, v7);
  }
}

- (void)insertChildRep:(id)a3 above:(id)a4
{
  NSMutableArray *mChildReps;
  uint64_t v7;

  mChildReps = self->mChildReps;
  if (mChildReps)
  {
    v7 = -[NSMutableArray indexOfObjectIdenticalTo:](mChildReps, "indexOfObjectIdenticalTo:", a4);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      -[TSDContainerRep insertChildRep:atIndex:](self, "insertChildRep:atIndex:", a3, v7 + 1);
  }
}

- (void)removeChildRep:(id)a3
{
  -[TSDContainerRep replaceChildRep:with:](self, "replaceChildRep:with:", a3, 0);
}

- (void)replaceChildRep:(id)a3 with:(id)a4
{
  NSMutableArray *mChildReps;
  uint64_t v8;
  uint64_t v9;
  id v10;

  mChildReps = self->mChildReps;
  if (mChildReps)
  {
    v8 = -[NSMutableArray indexOfObjectIdenticalTo:](mChildReps, "indexOfObjectIdenticalTo:");
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = v8;
      v10 = a3;
      -[NSMutableArray removeObjectAtIndex:](self->mChildReps, "removeObjectAtIndex:", v9);
      objc_msgSend(a3, "setParentRep:", 0);

      -[TSDContainerRep insertChildRep:atIndex:](self, "insertChildRep:atIndex:", a4, v9);
    }
  }
}

- (BOOL)mustDrawOnMainThreadForInteractiveCanvas
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = -[TSDContainerRep childReps](self, "childReps", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "mustDrawOnMainThreadForInteractiveCanvas") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return v3;
}

- (BOOL)canDrawInParallel
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
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
  v2 = -[TSDContainerRep childReps](self, "childReps", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(v2);
      v7 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "canDrawInParallel");
      if (!v7)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (void)updateChildrenFromLayout
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  SEL v24;
  const char *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = -[TSDContainerRep childReps](self, "childReps");
  obj = -[TSDContainerRep visibleChildLayouts](self, "visibleChildLayouts");
  v5 = objc_msgSend(obj, "count");
  if (v5 == objc_msgSend(v4, "count"))
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v36;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v10);
        if (objc_msgSend((id)objc_msgSend(v4, "objectAtIndex:", v8 + v10), "layout") != v11)
          break;
        if (v7 == ++v10)
        {
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
          v8 += v10;
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      if (!v12)
        goto LABEL_32;
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v32;
LABEL_12:
      v16 = v14;
      v14 += v13;
      while (1)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(obj);
        if ((TSDContainerRep *)objc_msgSend((id)objc_msgSend(v4, "objectAtIndex:", v16), "parentRep") != self)
          break;
        ++v16;
        if (!--v13)
        {
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
          if (v13)
            goto LABEL_12;
          goto LABEL_32;
        }
      }
    }
  }
  v24 = a2;
  v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v23 = -[TSDCanvas repForLayout:](self->super.mCanvas, "repForLayout:", v22, v24);
        if (v23)
          goto LABEL_28;
        v23 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend(v22, "repClassOverride")), "initWithLayout:canvas:", v22, self->super.mCanvas);
        -[TSDCanvas delegate](self->super.mCanvas, "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[TSDCanvasDelegate canvas:willLayoutRep:](-[TSDCanvas delegate](self->super.mCanvas, "delegate"), "canvas:willLayoutRep:", self->super.mCanvas, v23);
        if (v23)
        {
LABEL_28:
          objc_msgSend(v17, "addObject:", v23);

        }
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v19);
  }
  objc_msgSend(v17, "sortUsingComparator:", &__block_literal_global_28, v24);
  -[TSDContainerRep setChildReps:](self, "setChildReps:", v17);

  a2 = v25;
LABEL_32:
  objc_msgSend(-[TSDContainerRep childReps](self, "childReps"), "makeObjectsPerformSelector:", a2);
}

uint64_t __43__TSDContainerRep_updateChildrenFromLayout__block_invoke()
{
  void *v0;
  void *v1;

  objc_opt_class();
  v0 = (void *)TSUDynamicCast();
  objc_opt_class();
  v1 = (void *)TSUDynamicCast();
  if (objc_msgSend(v0, "forcesPlacementOnTop") && (objc_msgSend(v1, "forcesPlacementOnTop") & 1) != 0)
    return 0;
  if ((objc_msgSend(v0, "forcesPlacementOnTop") & 1) != 0)
    return 1;
  return objc_msgSend(v1, "forcesPlacementOnTop") << 63 >> 63;
}

- (id)visibleChildLayouts
{
  return -[TSDAbstractLayout children](-[TSDRep layout](self, "layout"), "children");
}

- (void)drawInContext:(CGContext *)a3
{
  CGRect v5;

  CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "whiteColor"), "CGColor"));
  -[TSDRep naturalBounds](self, "naturalBounds");
  CGContextFillRect(a3, v5);
}

- (void)recursivelyPerformSelectorIfImplemented:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)TSDContainerRep;
  -[TSDRep recursivelyPerformSelectorIfImplemented:withObject:withObject:](&v18, sel_recursivelyPerformSelectorIfImplemented_withObject_withObject_);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = -[TSDContainerRep childReps](self, "childReps", 0);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "recursivelyPerformSelectorIfImplemented:withObject:withObject:", a3, a4, a5);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v11);
  }
}

- (void)recursivelyPerformSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)TSDContainerRep;
  -[TSDRep recursivelyPerformSelector:withObject:withObject:](&v18, sel_recursivelyPerformSelector_withObject_withObject_);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = -[TSDContainerRep childReps](self, "childReps", 0);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "recursivelyPerformSelector:withObject:withObject:", a3, a4, a5);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v11);
  }
}

- (id)hitRepChrome:(CGPoint)a3 passingTest:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  void *v16;
  id v17;
  void *v18;
  double x;
  float64x2_t v21;
  double y;
  objc_super v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  y = a3.y;
  x = a3.x;
  v32 = *MEMORY[0x24BDAC8D0];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = (void *)objc_msgSend(-[TSDContainerRep childRepsForHitTesting](self, "childRepsForHitTesting"), "reverseObjectEnumerator");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    v21 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&x, 0);
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v12 = (void *)objc_msgSend((id)objc_msgSend(v11, "layout"), "geometry");
        if (v12)
        {
          objc_msgSend(v12, "inverseTransform");
          v13 = v24;
          v14 = v25;
          v15 = v26;
        }
        else
        {
          v25 = 0u;
          v26 = 0u;
          v15 = 0uLL;
          v13 = 0uLL;
          v14 = 0uLL;
          v24 = 0u;
        }
        v16 = (void *)objc_msgSend(v11, "hitRepChrome:passingTest:", a4, vaddq_f64(v15, vmlaq_f64(vmulq_n_f64(v14, y), v21, v13)));
        if (v16)
          return v16;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v8)
        continue;
      break;
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)TSDContainerRep;
  v17 = -[TSDRep hitRepChrome:](&v23, sel_hitRepChrome_, x, y);
  v18 = v17;
  if (a4 && v17 && !(*((unsigned int (**)(id, id))a4 + 2))(a4, v17))
    return 0;
  return v18;
}

- (id)hitRepChrome:(CGPoint)a3
{
  return -[TSDContainerRep hitRepChrome:passingTest:](self, "hitRepChrome:passingTest:", 0, a3.x, a3.y);
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  void *v18;
  id v19;
  void *v20;
  double x;
  float64x2_t v23;
  double y;
  objc_super v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  y = a3.y;
  x = a3.x;
  v34 = *MEMORY[0x24BDAC8D0];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = (void *)objc_msgSend(-[TSDContainerRep childRepsForHitTesting](self, "childRepsForHitTesting"), "reverseObjectEnumerator");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v30;
    v23 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&x, 0);
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v14 = (void *)objc_msgSend((id)objc_msgSend(v13, "layout"), "geometry");
        if (v14)
        {
          objc_msgSend(v14, "inverseTransform");
          v15 = v26;
          v16 = v27;
          v17 = v28;
        }
        else
        {
          v27 = 0u;
          v28 = 0u;
          v17 = 0uLL;
          v15 = 0uLL;
          v16 = 0uLL;
          v26 = 0u;
        }
        v18 = (void *)objc_msgSend(v13, "hitRep:withGesture:passingTest:", a4, a5, vaddq_f64(v17, vmlaq_f64(vmulq_n_f64(v16, y), v23, v15)));
        if (v18)
          return v18;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v10)
        continue;
      break;
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)TSDContainerRep;
  v19 = -[TSDRep hitRep:](&v25, sel_hitRep_, x, y);
  v20 = v19;
  if (a5 && v19 && !(*((unsigned int (**)(id, id))a5 + 2))(a5, v19))
    return 0;
  return v20;
}

- (id)hitRep:(CGPoint)a3
{
  return -[TSDContainerRep hitRep:withGesture:passingTest:](self, "hitRep:withGesture:passingTest:", 0, 0, a3.x, a3.y);
}

- (id)hitReps:(CGPoint)a3 withSlopBlock:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  void *v17;
  id v18;
  double x;
  float64x2_t v21;
  double y;
  objc_super v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  y = a3.y;
  x = a3.x;
  v32 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = (void *)objc_msgSend(-[TSDContainerRep childRepsForHitTesting](self, "childRepsForHitTesting"), "reverseObjectEnumerator");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    v21 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&x, 0);
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v13 = (void *)objc_msgSend((id)objc_msgSend(v12, "layout"), "geometry");
        if (v13)
        {
          objc_msgSend(v13, "inverseTransform");
          v14 = v24;
          v15 = v25;
          v16 = v26;
        }
        else
        {
          v25 = 0u;
          v26 = 0u;
          v16 = 0uLL;
          v14 = 0uLL;
          v15 = 0uLL;
          v24 = 0u;
        }
        v17 = (void *)objc_msgSend(v12, "hitReps:withSlopBlock:", a4, vaddq_f64(v16, vmlaq_f64(vmulq_n_f64(v15, y), v21, v14)));
        if (objc_msgSend(v17, "count"))
          objc_msgSend(v6, "addObjectsFromArray:", v17);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v9);
  }
  v23.receiver = self;
  v23.super_class = (Class)TSDContainerRep;
  v18 = -[TSDRep hitReps:withSlopBlock:](&v23, sel_hitReps_withSlopBlock_, a4, x, y);
  if (objc_msgSend(v18, "count"))
    objc_msgSend(v6, "addObjectsFromArray:", v18);
  return v6;
}

- (void)willReplaceContentsFromRep:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)TSDContainerRep;
  -[TSDRep willReplaceContentsFromRep:](&v19, sel_willReplaceContentsFromRep_);
  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  v5 = (void *)objc_msgSend(-[TSDContainerRep childReps](self, "childReps"), "mutableCopy");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (void *)objc_msgSend(v4, "childReps", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        if (objc_msgSend(v5, "count"))
        {
          v12 = 0;
          while (1)
          {
            v13 = (void *)objc_msgSend(v5, "objectAtIndex:", v12);
            v14 = objc_msgSend(v13, "info");
            if (v14 == objc_msgSend(v11, "info"))
              break;
            if (++v12 >= (unint64_t)objc_msgSend(v5, "count"))
              goto LABEL_12;
          }
          objc_msgSend(v13, "willReplaceContentsFromRep:", v11);
          objc_msgSend(v5, "removeObjectAtIndex:", v12);
        }
LABEL_12:
        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v8);
  }

}

- (void)replaceContentsFromRep:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)TSDContainerRep;
  -[TSDRep replaceContentsFromRep:](&v19, sel_replaceContentsFromRep_);
  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  v5 = (void *)objc_msgSend(-[TSDContainerRep childReps](self, "childReps"), "mutableCopy");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (void *)objc_msgSend(v4, "childReps", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        if (objc_msgSend(v5, "count"))
        {
          v12 = 0;
          while (1)
          {
            v13 = (void *)objc_msgSend(v5, "objectAtIndex:", v12);
            v14 = objc_msgSend(v13, "info");
            if (v14 == objc_msgSend(v11, "info"))
              break;
            if (++v12 >= (unint64_t)objc_msgSend(v5, "count"))
              goto LABEL_12;
          }
          objc_msgSend(v13, "replaceContentsFromRep:", v11);
          objc_msgSend(v5, "removeObjectAtIndex:", v12);
        }
LABEL_12:
        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v8);
  }

}

@end
