@implementation TSDEditableBezierPathSource

- (TSDEditableBezierPathSource)init
{
  TSDEditableBezierPathSource *v2;
  TSDBezierSubpath *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDEditableBezierPathSource;
  v2 = -[TSDEditableBezierPathSource init](&v5, sel_init);
  if (v2)
  {
    v2->mSubpaths = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v3 = objc_alloc_init(TSDBezierSubpath);
    -[NSMutableArray addObject:](v2->mSubpaths, "addObject:", v3);

  }
  return v2;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p subpaths=%p>"), NSStringFromClass(v4), self, self->mSubpaths);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setHasHorizontalFlip:", -[TSDPathSource hasHorizontalFlip](self, "hasHorizontalFlip"));
  objc_msgSend(v4, "setHasVerticalFlip:", -[TSDPathSource hasVerticalFlip](self, "hasVerticalFlip"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:copyItems:", -[TSDEditableBezierPathSource subpaths](self, "subpaths"), 1);
  objc_msgSend(v4, "setSubpaths:", v5);
  v6 = v5;
  return v4;
}

+ (id)editableBezierPathSource
{
  return objc_alloc_init(TSDEditableBezierPathSource);
}

+ (TSDEditableBezierPathSource)editableBezierPathSourceWithPathSource:(id)a3
{
  return (TSDEditableBezierPathSource *)objc_msgSend(a1, "editableBezierPathSourceWithBezierPath:", objc_msgSend(a3, "bezierPath"));
}

+ (TSDEditableBezierPathSource)editableBezierPathSourceWithBezierPath:(id)a3
{
  TSDEditableBezierPathSource *v4;

  v4 = +[TSDEditableBezierPathSource editableBezierPathSource](TSDEditableBezierPathSource, "editableBezierPathSource");
  -[TSDEditableBezierPathSource setBezierPath:](v4, "setBezierPath:", a3);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v7;
  const CGPath *v8;
  const CGPath *v9;
  objc_super v11;
  uint64_t v12;
  uint64_t v13;

  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v12 = v3;
    v13 = v4;
    v11.receiver = self;
    v11.super_class = (Class)TSDEditableBezierPathSource;
    v7 = -[TSDPathSource isEqual:](&v11, sel_isEqual_);
    if (v7)
    {
      v8 = (const CGPath *)objc_msgSend(-[TSDPathSource bezierPath](self, "bezierPath"), "CGPath");
      v9 = (const CGPath *)objc_msgSend((id)objc_msgSend(a3, "bezierPath"), "CGPath");
      if (v8 == v9 || (v7 = CGPathEqualToPath(v8, v9)) != 0)
        LOBYTE(v7) = 1;
    }
  }
  return v7;
}

- (BOOL)closeIfEndpointsAreEqual
{
  return objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mSubpaths, "objectAtIndex:", self->mActiveSubpath), "closeIfEndpointsAreEqual");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDEditableBezierPathSource;
  -[TSDEditableBezierPathSource dealloc](&v3, sel_dealloc);
}

- (BOOL)isRectangular
{
  if (-[NSMutableArray count](self->mSubpaths, "count") == 1)
    return objc_msgSend((id)-[NSMutableArray lastObject](self->mSubpaths, "lastObject"), "isRectangular");
  else
    return 0;
}

- (BOOL)isCircular
{
  if (-[NSMutableArray count](self->mSubpaths, "count") == 1)
    return objc_msgSend((id)-[NSMutableArray lastObject](self->mSubpaths, "lastObject"), "isCircular");
  else
    return 0;
}

- (id)bezierPathWithoutFlips
{
  id v3;

  v3 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
  objc_msgSend(v3, "moveToPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  -[NSMutableArray makeObjectsPerformSelector:withObject:](self->mSubpaths, "makeObjectsPerformSelector:withObject:", sel_appendToBezierPath_, v3);
  return v3;
}

- (CGPath)pathWithoutFlips
{
  return (CGPath *)objc_msgSend(-[TSDEditableBezierPathSource bezierPathWithoutFlips](self, "bezierPathWithoutFlips"), "CGPath");
}

- (void)convertToHobby
{
  -[NSMutableArray makeObjectsPerformSelector:](self->mSubpaths, "makeObjectsPerformSelector:", sel_convertToHobby);
}

- (void)setBezierPath:(id)a3
{
  uint64_t v5;
  NSMutableArray *mSubpaths;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  TSDBezierNode *v11;
  TSDBezierNode *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t *);
  void *v25;
  TSDEditableBezierPathSource *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a3, "elementCount");
  v35 = 0;
  v36 = &v35;
  v37 = 0x3052000000;
  v38 = __Block_byref_object_copy__18;
  v39 = __Block_byref_object_dispose__18;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3052000000;
  v32 = __Block_byref_object_copy__18;
  v33 = __Block_byref_object_dispose__18;
  v34 = 0;

  mSubpaths = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  self->mSubpaths = mSubpaths;
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = __45__TSDEditableBezierPathSource_setBezierPath___block_invoke;
  v25 = &unk_24D82CFA0;
  v26 = self;
  v27 = &v29;
  v28 = &v35;
  if (v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
    {
      v8 = objc_msgSend(a3, "elementAtIndex:associatedPoints:", i, &v41, v22, v23);
      if (v36[5])
        v24(&v22);
      v9 = (void *)objc_msgSend((id)v30[5], "lastNode");
      v10 = v9;
      switch(v8)
      {
        case 0:
          v11 = +[TSDBezierNode bezierNodeWithPoint:](TSDBezierNode, "bezierNodeWithPoint:", v41, v42);
          v36[5] = (uint64_t)v11;
          if (i)
            v30[5] = 0;
          else
            v24(&v22);
          break;
        case 1:
          v12 = +[TSDBezierNode bezierNodeWithPoint:](TSDBezierNode, "bezierNodeWithPoint:", v41, v42);
          goto LABEL_10;
        case 2:
          objc_msgSend(v9, "setOutControlPoint:", v41, v42);
          objc_msgSend(v10, "setType:", 2);
          v12 = +[TSDBezierNode bezierNodeWithPoint:inControlPoint:outControlPoint:](TSDBezierNode, "bezierNodeWithPoint:inControlPoint:outControlPoint:", v45, v46, v43, v44, v45, v46);
LABEL_10:
          objc_msgSend((id)v30[5], "addNode:", v12);
          break;
        case 3:
          v13 = objc_msgSend((id)v30[5], "firstNode");
          v14 = (void *)v13;
          if (v10)
            v15 = v13 == 0;
          else
            v15 = 1;
          if (!v15)
          {
            objc_msgSend(v10, "nodePoint");
            v17 = v16;
            v19 = v18;
            objc_msgSend(v14, "nodePoint");
            if (TSDNearlyEqualPoints(v17, v19, v20, v21))
            {
              objc_msgSend(v10, "inControlPoint");
              objc_msgSend(v14, "setInControlPoint:");
              objc_msgSend((id)v30[5], "removeLastNode");
            }
          }
          objc_msgSend((id)v30[5], "setClosed:", 1);
          break;
        default:
          continue;
      }
    }
    mSubpaths = self->mSubpaths;
  }
  -[NSMutableArray makeObjectsPerformSelector:](mSubpaths, "makeObjectsPerformSelector:", sel_updateReflectedState, v22, v23);
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "BOOLForKey:", CFSTR("TSDCreateBezierNodesByDefault")) & 1) == 0)-[TSDEditableBezierPathSource convertToHobby](self, "convertToHobby");
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
}

uint64_t __45__TSDEditableBezierPathSource_setBezierPath___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t result;

  v2 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  if (!v2)
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = objc_alloc_init(TSDBezierSubpath);
    objc_msgSend(*(id *)(a1[4] + 16), "addObject:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));

    v2 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  }
  result = objc_msgSend(v2, "addNode:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = 0;
  return result;
}

- (void)setNodes:(id)a3
{
  TSDBezierSubpath *v5;

  self->mSubpaths = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = objc_alloc_init(TSDBezierSubpath);
  -[NSMutableArray addObject:](self->mSubpaths, "addObject:", v5);

  -[TSDBezierSubpath setNodes:](v5, "setNodes:", a3);
}

- (NSMutableArray)nodes
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[NSMutableArray makeObjectsPerformSelector:withObject:](self->mSubpaths, "makeObjectsPerformSelector:withObject:", sel_addNodesToArray_, v3);
  return (NSMutableArray *)v3;
}

- (void)reverseDirection
{
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mSubpaths, "objectAtIndex:", self->mActiveSubpath), "reverseDirection");
}

- (void)setLockedFlipTransform:(BOOL)a3
{
  CGAffineTransform *p_mLockedFlipTransform;
  objc_super v6;
  objc_super v7[4];

  p_mLockedFlipTransform = &self->mLockedFlipTransform;
  v7[0].receiver = self;
  v7[0].super_class = (Class)TSDEditableBezierPathSource;
  -[objc_super pathFlipTransform](v7, sel_pathFlipTransform);
  v6 = v7[2];
  *(objc_super *)&p_mLockedFlipTransform->a = v7[1];
  *(objc_super *)&p_mLockedFlipTransform->c = v6;
  *(objc_super *)&p_mLockedFlipTransform->tx = v7[3];
  self->mHasLockedFlipTransform = a3;
}

- (CGAffineTransform)pathFlipTransform
{
  __int128 v3;
  objc_super v4;

  if (LOBYTE(self->tx))
  {
    v3 = *(_OWORD *)&self[1].b;
    *(_OWORD *)&retstr->a = *(_OWORD *)&self->ty;
    *(_OWORD *)&retstr->c = v3;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].d;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)TSDEditableBezierPathSource;
    return (CGAffineTransform *)-[CGAffineTransform pathFlipTransform](&v4, sel_pathFlipTransform);
  }
  return self;
}

- (CGSize)naturalSize
{
  id v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v2 = -[TSDEditableBezierPathSource bezierPathWithoutFlips](self, "bezierPathWithoutFlips");
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "bounds");
    v5 = v4;
    v7 = v6;
  }
  else
  {
    v5 = *MEMORY[0x24BDBF148];
    v7 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  v8 = objc_msgSend(v3, "isLineSegment");
  v9 = 1.0;
  if (v5 >= 1.0)
    v10 = v5;
  else
    v10 = 1.0;
  if (v7 >= 1.0)
    v9 = v7;
  if (v8)
    v11 = v7;
  else
    v11 = v9;
  if (v8)
    v12 = v5;
  else
    v12 = v10;
  result.height = v11;
  result.width = v12;
  return result;
}

- (Class)preferredRepClass
{
  return (Class)objc_opt_class();
}

- (void)setNaturalSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  __int128 v10;
  NSMutableArray *mSubpaths;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
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
  CGAffineTransform v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  height = a3.height;
  width = a3.width;
  v48 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)-[NSMutableArray count](-[TSDEditableBezierPathSource nodes](self, "nodes"), "count") >= 2)
  {
    -[TSDEditableBezierPathSource naturalSize](self, "naturalSize");
    if (v6 <= 0.0)
      v8 = 1.0;
    else
      v8 = width / v6;
    if (v7 <= 0.0)
      v9 = 1.0;
    else
      v9 = height / v7;
    v10 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v45.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v45.c = v10;
    *(_OWORD *)&v45.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    v31 = v10;
    v33 = *(_OWORD *)&v45.a;
    *(_OWORD *)&v44.a = *(_OWORD *)&v45.a;
    *(_OWORD *)&v44.c = v10;
    v29 = *(_OWORD *)&v45.tx;
    *(_OWORD *)&v44.tx = *(_OWORD *)&v45.tx;
    CGAffineTransformScale(&v45, &v44, v8, v9);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    mSubpaths = self->mSubpaths;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v41 != v14)
            objc_enumerationMutation(mSubpaths);
          v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          v44 = v45;
          objc_msgSend(v16, "transformUsingAffineTransform:", &v44, v29, v31, v33);
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      }
      while (v13);
    }
    -[TSDEditableBezierPathSource naturalSize](self, "naturalSize", v29, v31, v33);
    v18 = v17;
    v20 = v19;
    if (!TSDNearlyEqualSizes(v17, v19, width, height))
    {
      v21 = width / v18;
      v22 = 1.0;
      if (v18 <= 0.0)
        v21 = 1.0;
      *(_OWORD *)&v45.a = v34;
      *(_OWORD *)&v45.c = v32;
      *(_OWORD *)&v45.tx = v30;
      if (v20 > 0.0)
        v22 = height / v20;
      *(_OWORD *)&v39.a = v34;
      *(_OWORD *)&v39.c = v32;
      *(_OWORD *)&v39.tx = v30;
      CGAffineTransformScale(&v44, &v39, v21, v22);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v23 = self->mSubpaths;
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v36;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v36 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
            v44 = v45;
            objc_msgSend(v28, "transformUsingAffineTransform:", &v44);
          }
          v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
        }
        while (v25);
      }
    }
  }
}

- (void)transformUsingAffineTransform:(CGAffineTransform *)a3
{
  NSMutableArray *mSubpaths;
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
  mSubpaths = self->mSubpaths;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(mSubpaths);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v10 = *(_OWORD *)&a3->c;
        v11[0] = *(_OWORD *)&a3->a;
        v11[1] = v10;
        v11[2] = *(_OWORD *)&a3->tx;
        objc_msgSend(v9, "transformUsingAffineTransform:", v11);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
}

- (void)alignToOrigin
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v7;
  CGFloat MinY;
  NSMutableArray *mSubpaths;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CGAffineTransform v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CGAffineTransform v20;
  _BYTE v21[128];
  uint64_t v22;
  CGRect v23;
  CGRect v24;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(-[TSDEditableBezierPathSource bezierPathWithoutFlips](self, "bezierPathWithoutFlips"), "bounds");
  x = v23.origin.x;
  y = v23.origin.y;
  width = v23.size.width;
  height = v23.size.height;
  memset(&v20, 0, sizeof(v20));
  v7 = -CGRectGetMinX(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MinY = CGRectGetMinY(v24);
  CGAffineTransformMakeTranslation(&v20, v7, -MinY);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  mSubpaths = self->mSubpaths;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(mSubpaths);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
        v15 = v20;
        objc_msgSend(v14, "transformUsingAffineTransform:", &v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v11);
  }
}

- (void)adjustGeometryForAlignToOrigin:(id)a3
{
  TSDAdjustGeometryForAlignPathSourceToOrigin(a3, self);
}

- (void)addNode:(id)a3
{
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mSubpaths, "objectAtIndex:", self->mActiveSubpath), "addNode:", a3);
}

- (void)removeLastNode
{
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mSubpaths, "objectAtIndex:", self->mActiveSubpath), "removeLastNode");
}

- (id)nodePriorToNode:(id)a3
{
  return (id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mSubpaths, "objectAtIndex:", self->mActiveSubpath), "nodePriorToNode:", a3);
}

- (id)nodeAfterNode:(id)a3
{
  return (id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mSubpaths, "objectAtIndex:", self->mActiveSubpath), "nodeAfterNode:", a3);
}

- (TSDBezierNode)firstNode
{
  return (TSDBezierNode *)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mSubpaths, "objectAtIndex:", self->mActiveSubpath), "firstNode");
}

- (TSDBezierNode)lastNode
{
  return (TSDBezierNode *)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mSubpaths, "objectAtIndex:", self->mActiveSubpath), "lastNode");
}

- (void)offsetSelectedNodesByDelta:(CGPoint)a3
{
  double y;
  double x;
  NSMutableArray *mSubpaths;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  y = a3.y;
  x = a3.x;
  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  mSubpaths = self->mSubpaths;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(mSubpaths);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "offsetSelectedNodesByDelta:", x, y);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)offsetSelectedEdgesByDelta:(CGPoint)a3
{
  double y;
  double x;
  NSMutableArray *mSubpaths;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  y = a3.y;
  x = a3.x;
  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  mSubpaths = self->mSubpaths;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(mSubpaths);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "offsetSelectedEdgesByDelta:", x, y);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (BOOL)hasSelectedNode
{
  NSMutableArray *mSubpaths;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
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
  mSubpaths = self->mSubpaths;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(mSubpaths);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "hasSelectedNode");
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5 & 1;
}

- (BOOL)allNodesSelected
{
  NSMutableArray *mSubpaths;
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
  mSubpaths = self->mSubpaths;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(mSubpaths);
      v7 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "allNodesSelected");
      if (!v7)
        break;
      if (v4 == ++v6)
      {
        v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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

- (void)removeNode:(id)a3
{
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mSubpaths, "objectAtIndex:", self->mActiveSubpath), "removeNode:", a3);
}

- (BOOL)isCompound
{
  return (unint64_t)-[NSMutableArray count](self->mSubpaths, "count") > 1;
}

- (BOOL)canDeleteSelectedNodes
{
  BOOL v3;
  NSMutableArray *mSubpaths;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v10;
  void *v11;
  void *v12;

  v3 = -[TSDEditableBezierPathSource isCompound](self, "isCompound");
  mSubpaths = self->mSubpaths;
  if (!v3)
    return objc_msgSend((id)-[NSMutableArray lastObject](mSubpaths, "lastObject"), "canDeleteSelectedNodes");
  v5 = (void *)-[NSMutableArray objectEnumerator](mSubpaths, "objectEnumerator");
  v6 = objc_msgSend(v5, "nextObject");
  if (!v6)
    return 1;
  v7 = (void *)v6;
  while (!objc_msgSend(v7, "hasSelectedNode") || objc_msgSend(v7, "canDeleteSelectedNodes"))
  {
    v7 = (void *)objc_msgSend(v5, "nextObject");
    if (!v7)
      return 1;
  }
  v10 = (void *)-[NSMutableArray objectEnumerator](self->mSubpaths, "objectEnumerator");
  do
  {
    v11 = (void *)objc_msgSend(v10, "nextObject");
    v8 = v11 != 0;
    if (!v11)
      break;
    v12 = v11;
    if (!objc_msgSend(v11, "hasSelectedNode"))
      break;
  }
  while (!objc_msgSend(v12, "canDeleteSelectedNodes"));
  return v8;
}

- (BOOL)deletingSelectedNodesWillDeleteShape
{
  NSMutableArray *mSubpaths;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  int v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  mSubpaths = self->mSubpaths;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(mSubpaths);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend((id)objc_msgSend(v7, "nodes"), "count") >= 3)
        {
          v8 = objc_msgSend(v7, "hasSelectedNode");
          if (!v8)
            return v8;
          if ((objc_msgSend(v7, "canDeleteSelectedNodes") & 1) != 0)
          {
            LOBYTE(v8) = 0;
            return v8;
          }
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  LOBYTE(v8) = 1;
  return v8;
}

- (void)deleteSelectedNodesForced:(BOOL)a3
{
  void *v5;
  NSMutableArray *mSubpaths;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  mSubpaths = self->mSubpaths;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(mSubpaths);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "canDeleteSelectedNodes"))
        {
          objc_msgSend(v11, "deleteSelectedNodes");
        }
        else if (a3 || objc_msgSend(v11, "allNodesSelected"))
        {
          if (objc_msgSend(v11, "hasSelectedNode"))
            objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  -[NSMutableArray removeObjectsInArray:](self->mSubpaths, "removeObjectsInArray:", v5);
}

- (void)deleteSelectedNodes
{
  -[TSDEditableBezierPathSource deleteSelectedNodesForced:](self, "deleteSelectedNodesForced:", 0);
}

- (void)selectAllNodes
{
  -[NSMutableArray makeObjectsPerformSelector:](self->mSubpaths, "makeObjectsPerformSelector:", sel_selectAllNodes);
}

- (void)deselectAllNodes
{
  -[NSMutableArray makeObjectsPerformSelector:](self->mSubpaths, "makeObjectsPerformSelector:", sel_deselectAllNodes);
}

- (id)bezierNodeUnderPoint:(CGPoint)a3 withTransform:(CGAffineTransform *)a4 andTolerance:(double)a5 returningType:(int64_t *)a6
{
  double y;
  double x;
  void *v11;
  id result;
  __int128 v13;
  _OWORD v14[3];

  y = a3.y;
  x = a3.x;
  v11 = (void *)-[NSMutableArray objectEnumerator](-[TSDEditableBezierPathSource subpaths](self, "subpaths"), "objectEnumerator");
  do
  {
    result = (id)objc_msgSend(v11, "nextObject");
    if (!result)
      break;
    v13 = *(_OWORD *)&a4->c;
    v14[0] = *(_OWORD *)&a4->a;
    v14[1] = v13;
    v14[2] = *(_OWORD *)&a4->tx;
    result = (id)objc_msgSend(result, "bezierNodeUnderPoint:withTransform:andTolerance:returningType:", v14, a6, x, y, a5);
  }
  while (!result);
  return result;
}

- (double)distanceToPoint:(CGPoint)a3 subpathIndex:(unint64_t *)a4 elementIndex:(unint64_t *)a5 tValue:(double *)a6 threshold:(double)a7
{
  double y;
  double x;
  uint64_t v14;
  BOOL v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  double v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  double v23;
  uint64_t v25;
  unint64_t v26;

  y = a3.y;
  x = a3.x;
  v14 = -[NSMutableArray count](self->mSubpaths, "count");
  if (v14)
    v15 = a7 < 1.79769313e308;
  else
    v15 = 0;
  if (v15)
  {
    v20 = v14;
    v17 = 0;
    v16 = 0;
    v18 = 0;
    v19 = 1.79769313e308;
    v21 = 1;
    do
    {
      v22 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->mSubpaths, "objectAtIndexedSubscript:", v21 - 1);
      v25 = 0;
      v26 = 0;
      objc_msgSend(v22, "distanceToPoint:elementIndex:tValue:threshold:", &v26, &v25, x, y, a7);
      if (v23 < v19)
      {
        v16 = v26;
        v18 = v25;
        v17 = v21 - 1;
        v19 = v23;
      }
      if (v21 >= v20)
        break;
      ++v21;
    }
    while (v19 > a7);
  }
  else
  {
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 1.79769313e308;
  }
  if (a4)
    *a4 = v17;
  if (a5)
    *a5 = v16;
  if (a6)
    *(_QWORD *)a6 = v18;
  return v19;
}

- (BOOL)bezierPathUnderPoint:(CGPoint)a3 withTransform:(CGAffineTransform *)a4 tolerance:(double)a5
{
  double y;
  double x;
  id v9;
  __int128 v10;
  _OWORD v12[3];

  y = a3.y;
  x = a3.x;
  v9 = -[TSDEditableBezierPathSource bezierPathWithoutFlips](self, "bezierPathWithoutFlips");
  v10 = *(_OWORD *)&a4->c;
  v12[0] = *(_OWORD *)&a4->a;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a4->tx;
  objc_msgSend(v9, "transformUsingAffineTransform:", v12);
  return objc_msgSend(v9, "pointOnPath:tolerance:", x, y, a5);
}

- (id)insertNodeAtPoint:(CGPoint)a3 tolerance:(double)a4
{
  double y;
  double x;
  void *v7;
  id result;
  id v9;

  y = a3.y;
  x = a3.x;
  v7 = (void *)-[NSMutableArray objectEnumerator](self->mSubpaths, "objectEnumerator");
  while (1)
  {
    result = (id)objc_msgSend(v7, "nextObject");
    if (!result)
      break;
    v9 = result;
    if (objc_msgSend((id)objc_msgSend(result, "bezierPath"), "pointOnPath:tolerance:", x, y, a4))
      return (id)objc_msgSend(v9, "insertNodeAtPoint:tolerance:", x, y, a4);
  }
  return result;
}

- (CGRect)nodeBounds
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  void *v6;
  void *i;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect result;
  CGRect v20;

  x = *MEMORY[0x24BDBF090];
  y = *(double *)(MEMORY[0x24BDBF090] + 8);
  width = *(double *)(MEMORY[0x24BDBF090] + 16);
  height = *(double *)(MEMORY[0x24BDBF090] + 24);
  v6 = (void *)-[NSMutableArray objectEnumerator](-[TSDEditableBezierPathSource subpaths](self, "subpaths"), "objectEnumerator");
  for (i = v6; ; v6 = i)
  {
    v8 = (void *)objc_msgSend(v6, "nextObject");
    if (!v8)
      break;
    objc_msgSend(v8, "nodeBounds");
    v20.origin.x = v9;
    v20.origin.y = v10;
    v20.size.width = v11;
    v20.size.height = v12;
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    v18 = CGRectUnion(v17, v20);
    x = v18.origin.x;
    y = v18.origin.y;
    width = v18.size.width;
    height = v18.size.height;
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

- (void)toggleNode:(id)a3 toType:(int)a4 prevNode:(id)a5 nextNode:(id)a6
{
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

  if (objc_msgSend(a3, "type") != a4)
  {
    switch(a4)
    {
      case 1:
        objc_msgSend(a3, "setType:", 1);
        if (objc_msgSend(a6, "type") == 1)
        {
          objc_msgSend(a3, "nodePoint");
          objc_msgSend(a3, "setOutControlPoint:");
          objc_msgSend(a6, "nodePoint");
          objc_msgSend(a6, "setInControlPoint:");
        }
        if (objc_msgSend(a5, "type") == 1)
        {
          objc_msgSend(a3, "nodePoint");
          objc_msgSend(a3, "setInControlPoint:");
          objc_msgSend(a5, "nodePoint");
          objc_msgSend(a5, "setOutControlPoint:");
        }
        break;
      case 3:
        objc_msgSend(a3, "setType:", 3);
        break;
      case 2:
        objc_msgSend(a3, "nodePoint");
        v11 = v10;
        v13 = v12;
        objc_msgSend(a3, "outControlPoint");
        if (TSDNearlyEqualPoints(v11, v13, v14, v15))
        {
          objc_msgSend(a6, "nodePoint");
          v17 = v16;
          v19 = v18;
          objc_msgSend(a6, "inControlPoint");
          if (TSDNearlyEqualPoints(v17, v19, v20, v21))
          {
            objc_msgSend(a3, "nodePoint");
            v23 = v22;
            v25 = v24;
            objc_msgSend(a6, "nodePoint");
            objc_msgSend(a3, "setOutControlPoint:", TSDMixPoints(v23, v25, v26, v27, 0.333333333));
            objc_msgSend(a3, "nodePoint");
            v29 = v28;
            v31 = v30;
            objc_msgSend(a6, "nodePoint");
            objc_msgSend(a6, "setInControlPoint:", TSDMixPoints(v29, v31, v32, v33, 0.666666667));
          }
        }
        objc_msgSend(a3, "nodePoint");
        v35 = v34;
        v37 = v36;
        objc_msgSend(a3, "inControlPoint");
        if (TSDNearlyEqualPoints(v35, v37, v38, v39))
        {
          objc_msgSend(a5, "nodePoint");
          v41 = v40;
          v43 = v42;
          objc_msgSend(a5, "outControlPoint");
          if (TSDNearlyEqualPoints(v41, v43, v44, v45))
          {
            objc_msgSend(a3, "nodePoint");
            v47 = v46;
            v49 = v48;
            objc_msgSend(a5, "nodePoint");
            objc_msgSend(a3, "setInControlPoint:", TSDMixPoints(v47, v49, v50, v51, 0.333333333));
            objc_msgSend(a3, "nodePoint");
            v53 = v52;
            v55 = v54;
            objc_msgSend(a5, "nodePoint");
            objc_msgSend(a5, "setOutControlPoint:", TSDMixPoints(v53, v55, v56, v57, 0.666666667));
          }
        }
        objc_msgSend(a3, "setType:", 2);
        objc_msgSend(a3, "updateReflectedState");
        break;
    }
  }
}

- (void)toggleSelectedNodesToType:(int)a3
{
  uint64_t i;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *obj;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->mSubpaths;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v6 = (void *)objc_msgSend(v5, "nodes");
        if (objc_msgSend(v6, "count"))
        {
          v7 = objc_msgSend(v5, "isClosed");
          v8 = v7 ? objc_msgSend(v6, "lastObject") : 0;
          v9 = objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
          v10 = objc_msgSend(v6, "count");
          if (v10)
          {
            v11 = v10;
            v12 = 0;
            v13 = v10 - 1;
            do
            {
              v14 = (void *)v9;
              v15 = v12 + 1;
              if (((v12 + 1 >= v11) & ~v7) != 0)
              {
                v9 = 0;
              }
              else
              {
                if (v13 == v12)
                  v16 = 0;
                else
                  v16 = v12 + 1;
                v9 = objc_msgSend(v6, "objectAtIndexedSubscript:", v16);
              }
              if (objc_msgSend(v14, "isSelected"))
                -[TSDEditableBezierPathSource toggleNode:toType:prevNode:nextNode:](self, "toggleNode:toType:prevNode:nextNode:", v14, a3, v8, v9);
              v12 = v15;
              v8 = (uint64_t)v14;
            }
            while (v11 != v15);
          }
        }
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v19);
  }
}

- (void)sharpenAllNodes
{
  -[NSMutableArray makeObjectsPerformSelector:](self->mSubpaths, "makeObjectsPerformSelector:", sel_sharpenAllNodes);
}

- (void)smoothNode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)-[NSMutableArray objectEnumerator](self->mSubpaths, "objectEnumerator");
  while (1)
  {
    v5 = (void *)objc_msgSend(v4, "nextObject");
    if (!v5)
      break;
    v6 = v5;
    if (objc_msgSend((id)objc_msgSend(v5, "nodes"), "containsObject:", a3))
    {
      objc_msgSend(v6, "smoothNode:", a3);
      return;
    }
  }
}

- (void)smoothAllNodes
{
  -[NSMutableArray makeObjectsPerformSelector:](self->mSubpaths, "makeObjectsPerformSelector:", sel_smoothAllNodes);
}

- (BOOL)isClosed
{
  NSMutableArray *mSubpaths;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  mSubpaths = self->mSubpaths;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(mSubpaths);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if (objc_msgSend((id)objc_msgSend(v7, "nodes"), "count") && (objc_msgSend(v7, "isClosed") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return v3;
}

- (BOOL)isOpen
{
  return !-[TSDEditableBezierPathSource isClosed](self, "isClosed");
}

- (void)setClosed:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *mSubpaths;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  mSubpaths = self->mSubpaths;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(mSubpaths);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "setClosed:", v3);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)selectSubpathForNode:(id)a3 toggle:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = (void *)-[NSMutableArray objectEnumerator](self->mSubpaths, "objectEnumerator");
  while (1)
  {
    v7 = (void *)objc_msgSend(v6, "nextObject");
    if (!v7)
      break;
    v8 = v7;
    if (objc_msgSend((id)objc_msgSend(v7, "nodes"), "containsObject:", a3))
    {
      if (v4 && objc_msgSend(v8, "allNodesSelected"))
        objc_msgSend(v8, "deselectAllNodes");
      else
        objc_msgSend(v8, "selectAllNodes");
      return;
    }
  }
}

- (id)subpathsForConnectingUsingFirstSubpathFirstNode:(BOOL *)a3 andSecondPathFirstNode:(BOOL *)a4
{
  NSMutableArray *mSubpaths;
  id result;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[2];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  *a3 = 0;
  *a4 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  mSubpaths = self->mSubpaths;
  result = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (result)
  {
    v8 = result;
    v9 = 0;
    v10 = *(_QWORD *)v14;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(mSubpaths);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11);
        if ((objc_msgSend(v12, "isClosed") & 1) == 0 && objc_msgSend((id)objc_msgSend(v12, "nodes"), "count"))
        {
          if (objc_msgSend((id)objc_msgSend(v12, "firstNode"), "isSelected"))
          {
            if (v9)
            {
              *a4 = 1;
LABEL_18:
              if (!v12)
                return 0;
              v17[0] = v9;
              v17[1] = v12;
              return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
            }
            *a3 = 1;
            v9 = v12;
          }
          if (objc_msgSend((id)objc_msgSend(v12, "lastNode"), "isSelected"))
          {
            if (v9)
              goto LABEL_18;
            v9 = v12;
          }
        }
        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      result = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      v8 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (BOOL)canConnectSelectedNodes
{
  __int16 v3;

  v3 = 0;
  return -[TSDEditableBezierPathSource subpathsForConnectingUsingFirstSubpathFirstNode:andSecondPathFirstNode:](self, "subpathsForConnectingUsingFirstSubpathFirstNode:andSecondPathFirstNode:", (char *)&v3 + 1, &v3) != 0;
}

- (void)connectSelectedNodes
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *mSubpaths;
  void *v9;
  void *v10;
  uint64_t v11;
  __int16 v12;

  v12 = 0;
  v3 = -[TSDEditableBezierPathSource subpathsForConnectingUsingFirstSubpathFirstNode:andSecondPathFirstNode:](self, "subpathsForConnectingUsingFirstSubpathFirstNode:andSecondPathFirstNode:", (char *)&v12 + 1, &v12);
  if (v3)
  {
    v4 = v3;
    v5 = (void *)objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    if (v5 == v6)
    {
      if (HIBYTE(v12) != v12)
        objc_msgSend(v5, "setClosed:", 1);
    }
    else
    {
      v7 = v6;
      if (!HIBYTE(v12) && (_BYTE)v12)
        goto LABEL_12;
      if (HIBYTE(v12) && !(_BYTE)v12)
      {
        objc_msgSend((id)objc_msgSend(v6, "nodes"), "addObjectsFromArray:", objc_msgSend(v5, "nodes"));
        mSubpaths = self->mSubpaths;
        v9 = v5;
LABEL_14:
        -[NSMutableArray removeObjectIdenticalTo:](mSubpaths, "removeObjectIdenticalTo:", v9);
        return;
      }
      if (!(HIBYTE(v12) | v12))
      {
        objc_msgSend(v6, "reverseDirection");
LABEL_12:
        objc_msgSend((id)objc_msgSend(v5, "nodes"), "addObjectsFromArray:", objc_msgSend(v7, "nodes"));
LABEL_13:
        mSubpaths = self->mSubpaths;
        v9 = v7;
        goto LABEL_14;
      }
      if (HIBYTE(v12) && (_BYTE)v12)
      {
        objc_msgSend(v6, "reverseDirection");
        v10 = (void *)objc_msgSend(v5, "nodes");
        v11 = objc_msgSend(v7, "nodes");
        objc_msgSend(v10, "insertObjects:atIndexes:", v11, objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, objc_msgSend((id)objc_msgSend(v7, "nodes"), "count")));
        goto LABEL_13;
      }
    }
  }
}

- (BOOL)canCloseSelectedNodes
{
  NSMutableArray *mSubpaths;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  mSubpaths = self->mSubpaths;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(mSubpaths);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if ((objc_msgSend(v7, "isClosed") & 1) == 0
          && objc_msgSend((id)objc_msgSend(v7, "nodes"), "count")
          && ((objc_msgSend((id)objc_msgSend(v7, "firstNode"), "isSelected") & 1) != 0
           || (objc_msgSend((id)objc_msgSend(v7, "lastNode"), "isSelected") & 1) != 0))
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return v3;
}

- (void)closeSelectedNodes
{
  NSMutableArray *mSubpaths;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
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
  mSubpaths = self->mSubpaths;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(mSubpaths);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isClosed") & 1) == 0
          && objc_msgSend((id)objc_msgSend(v7, "nodes"), "count")
          && ((objc_msgSend((id)objc_msgSend(v7, "firstNode"), "isSelected") & 1) != 0
           || objc_msgSend((id)objc_msgSend(v7, "lastNode"), "isSelected")))
        {
          if (objc_msgSend((id)objc_msgSend(v7, "firstNode"), "type") == 3)
            objc_msgSend((id)objc_msgSend(v7, "firstNode"), "setType:", 1);
          objc_msgSend(v7, "setClosed:", 1);
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }
}

- (void)deleteSelectedEdges
{
  void *v2;
  NSMutableArray *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  TSDBezierSubpath *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  TSDBezierSubpath *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  TSDBezierSubpath *v19;
  int v20;
  NSMutableArray *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;

  v24 = (void *)-[NSMutableArray copy](self->mSubpaths, "copy");
  v2 = (void *)objc_msgSend(v24, "objectEnumerator");
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v26 = v2;
  v4 = objc_msgSend(v2, "nextObject");
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "nodes"), "mutableCopy");
      v7 = objc_msgSend(v6, "count");
      if (objc_msgSend((id)objc_msgSend(v6, "lastObject"), "isSelected"))
        objc_msgSend(v5, "setClosed:", 0);
      if (v7 < 1)
        goto LABEL_23;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      do
      {
        v13 = objc_msgSend(v6, "objectAtIndex:", v11);
        if (v12 && objc_msgSend(v12, "isSelected"))
        {
          if (v11 - v10 >= 2)
          {
            v14 = objc_alloc_init(TSDBezierSubpath);
            -[TSDBezierSubpath setNodes:](v14, "setNodes:", objc_msgSend(v6, "objectsAtIndexes:", objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", v10, v11 - v10)));
            -[NSMutableArray addObject:](v3, "addObject:", v14);

            v15 = (void *)-[NSMutableArray lastObject](-[TSDBezierSubpath nodes](v14, "nodes"), "lastObject");
            objc_msgSend(v15, "nodePoint");
            objc_msgSend(v15, "setOutControlPoint:");
            if (v9 || (objc_msgSend(v5, "isClosed") & 1) == 0)
            {
              v16 = (void *)-[NSMutableArray objectAtIndex:](-[TSDBezierSubpath nodes](v14, "nodes"), "objectAtIndex:", 0);
              objc_msgSend(v16, "nodePoint");
              objc_msgSend(v16, "setInControlPoint:");
            }
            if (!v9)
              v9 = v14;
          }
          v8 = 1;
          v10 = v11;
        }
        ++v11;
        v12 = (void *)v13;
      }
      while (v7 != v11);
      if ((v8 & 1) != 0)
      {
        v17 = v7 - v10;
        if (v17 > 1 || (v18 = objc_msgSend(v5, "isClosed"), v17 == 1) && v18)
        {
          v19 = objc_alloc_init(TSDBezierSubpath);
          -[TSDBezierSubpath setNodes:](v19, "setNodes:", objc_msgSend(v6, "objectsAtIndexes:", objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", v10, v17)));
          -[NSMutableArray addObject:](v3, "addObject:", v19);

          v20 = objc_msgSend(v5, "isClosed");
          v21 = -[TSDBezierSubpath nodes](v19, "nodes");
          if (v20)
          {
            -[NSMutableArray addObjectsFromArray:](v21, "addObjectsFromArray:", -[TSDBezierSubpath nodes](v9, "nodes"));
            -[NSMutableArray removeObjectIdenticalTo:](v3, "removeObjectIdenticalTo:", v9);
          }
          else
          {
            v22 = (void *)-[NSMutableArray objectAtIndex:](v21, "objectAtIndex:", 0);
            objc_msgSend(v22, "nodePoint");
            objc_msgSend(v22, "setInControlPoint:");
            v23 = (void *)-[NSMutableArray lastObject](-[TSDBezierSubpath nodes](v19, "nodes"), "lastObject");
            objc_msgSend(v23, "nodePoint");
            objc_msgSend(v23, "setOutControlPoint:");
          }
        }
      }
      else
      {
LABEL_23:
        -[NSMutableArray addObject:](v3, "addObject:", v5);
      }

      v5 = (void *)objc_msgSend(v26, "nextObject");
    }
    while (v5);
  }

  self->mSubpaths = v3;
}

- (id)splitEdge:(int64_t)a3 at:(double)a4 fromSubpath:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
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
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  TSDBezierNode *v29;
  float64_t v30;
  float64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  TSDBezierNode *v38;
  float64x2_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE v47[16];
  double v48;
  double v49;
  double v50;
  double v51;
  double v52[9];

  v52[8] = *(double *)MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mSubpaths, "objectAtIndex:", a5), "nodes");
  v8 = v7;
  if (a3 <= 0)
  {
    v9 = (void *)objc_msgSend(v7, "lastObject");
    v10 = (void *)objc_msgSend(v8, "objectAtIndex:", 0);
    a3 = objc_msgSend(v8, "count");
  }
  else
  {
    v9 = (void *)objc_msgSend(v7, "objectAtIndex:", a3 - 1);
    v10 = (void *)objc_msgSend(v8, "objectAtIndex:", a3);
  }
  objc_msgSend(v10, "nodePoint");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v10, "inControlPoint");
  if (TSDNearlyEqualPoints(v12, v14, v15, v16)
    && (objc_msgSend(v9, "nodePoint"),
        v18 = v17,
        v20 = v19,
        objc_msgSend(v9, "outControlPoint"),
        TSDNearlyEqualPoints(v18, v20, v21, v22)))
  {
    objc_msgSend(v9, "nodePoint");
    v24 = v23;
    v26 = v25;
    objc_msgSend(v10, "nodePoint");
    v29 = +[TSDBezierNode bezierNodeWithPoint:](TSDBezierNode, "bezierNodeWithPoint:", (1.0 - a4) * v24 + a4 * v27, (1.0 - a4) * v26 + a4 * v28);
  }
  else
  {
    objc_msgSend(v9, "nodePoint");
    v40.f64[0] = v30;
    v40.f64[1] = v31;
    objc_msgSend(v9, "outControlPoint");
    v41 = v32;
    v42 = v33;
    objc_msgSend(v10, "inControlPoint");
    v43 = v34;
    v44 = v35;
    objc_msgSend(v10, "nodePoint");
    v45 = v36;
    v46 = v37;
    TSDCurveBetween(&v40, (uint64_t)v47, 0.0, a4);
    TSDCurveBetween(&v40, (uint64_t)v52, a4, 1.0);
    objc_msgSend(v9, "setOutControlPoint:", v48, v49);
    objc_msgSend(v10, "setInControlPoint:", v52[4], v52[5]);
    v29 = +[TSDBezierNode bezierNodeWithPoint:inControlPoint:outControlPoint:](TSDBezierNode, "bezierNodeWithPoint:inControlPoint:outControlPoint:", v52[0], v52[1], v50, v51, v52[2], v52[3]);
  }
  v38 = v29;
  -[TSDBezierNode setSelected:](v29, "setSelected:", 1);
  objc_msgSend(v8, "insertObject:atIndex:", v38, a3);
  return v38;
}

- (void)splitSelectedEdges
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t j;
  uint64_t v11;

  v3 = -[NSMutableArray count](self->mSubpaths, "count");
  if (v3 >= 1)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      v6 = (void *)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mSubpaths, "objectAtIndex:", i), "nodes");
      v7 = objc_msgSend(v6, "count");
      if (v7 >= 1)
      {
        v8 = v7;
        v9 = 0;
        for (j = 0; j < v8; ++j)
        {
          v11 = objc_msgSend(v6, "objectAtIndex:", j);
          if (v9)
          {
            if (objc_msgSend(v9, "isSelected"))
            {
              -[TSDEditableBezierPathSource splitEdge:at:fromSubpath:](self, "splitEdge:at:fromSubpath:", j++, i, 0.5);
              ++v8;
            }
          }
          v9 = (void *)v11;
        }
      }
    }
  }
}

- (void)splitSelectedNodes
{
  NSMutableArray *mSubpaths;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t j;
  void *v11;
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
  TSDBezierNode *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  mSubpaths = self->mSubpaths;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(mSubpaths);
        v7 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "nodes");
        v8 = objc_msgSend(v7, "count");
        if (v8)
        {
          v9 = v8;
          for (j = 0; j < v9; ++j)
          {
            v11 = (void *)objc_msgSend(v7, "objectAtIndex:", j);
            if (objc_msgSend(v11, "isSelected"))
            {
              objc_msgSend(v11, "nodePoint");
              v13 = v12;
              v15 = v14;
              objc_msgSend(v11, "nodePoint");
              v17 = v16;
              v19 = v18;
              objc_msgSend(v11, "outControlPoint");
              v22 = +[TSDBezierNode bezierNodeWithPoint:inControlPoint:outControlPoint:](TSDBezierNode, "bezierNodeWithPoint:inControlPoint:outControlPoint:", v13, v15, v17, v19, v20, v21);
              -[TSDBezierNode setSelected:](v22, "setSelected:", 0);
              objc_msgSend(v11, "nodePoint");
              objc_msgSend(v11, "setOutControlPoint:");
              objc_msgSend(v7, "insertObject:atIndex:", v22, ++j);
              ++v9;
            }
          }
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v4);
  }
}

- (BOOL)canCutAtSelectedNodes
{
  NSMutableArray *mSubpaths;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  mSubpaths = self->mSubpaths;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(mSubpaths);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v8 = (void *)objc_msgSend(v7, "nodes");
        v9 = objc_msgSend(v7, "isClosed");
        v10 = objc_msgSend(v8, "count");
        if (v10)
        {
          v11 = v9 ^ 1u;
          v12 = v10 - (objc_msgSend(v7, "isClosed") ^ 1);
          if (v12 > v11)
          {
            while ((objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", v11), "isSelected") & 1) == 0)
            {
              if (v12 == ++v11)
                goto LABEL_10;
            }
            LOBYTE(v3) = 1;
            return v3;
          }
        }
LABEL_10:
        ;
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mSubpaths, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      LOBYTE(v3) = 0;
      if (v4)
        continue;
      break;
    }
  }
  return v3;
}

- (void)cutAtSelectedNodes
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  TSDBezierSubpath *v18;
  void *v19;
  TSDEditableBezierPathSource *v20;
  NSMutableArray *obj;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = self;
  obj = self->mSubpaths;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v22 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v22)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v8 = (void *)objc_msgSend(v7, "nodes");
        if (objc_msgSend(v8, "count"))
        {
          if (objc_msgSend(v7, "isClosed"))
          {
            v9 = objc_msgSend(v8, "count");
            while (v9)
            {
              v10 = (void *)objc_msgSend(v8, "objectAtIndexedSubscript:", --v9);
              if (objc_msgSend(v10, "isSelected"))
              {
                objc_msgSend(v10, "setSelected:", 0);
                if (v9)
                {
                  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                  objc_msgSend(v11, "addObjectsFromArray:", objc_msgSend(v8, "subarrayWithRange:", v9, objc_msgSend(v8, "count") - v9));
                  objc_msgSend(v11, "addObjectsFromArray:", objc_msgSend(v8, "subarrayWithRange:", 0, v9));
                  objc_msgSend(v7, "setNodes:", v11);

                  v8 = v11;
                }
                v12 = (void *)objc_msgSend(v10, "copy");
                objc_msgSend((id)objc_msgSend(v7, "nodes"), "addObject:", v12);

                objc_msgSend(v7, "setClosed:", 0);
                break;
              }
            }
          }
          if ((objc_msgSend(v7, "isClosed") & 1) == 0)
          {
            v13 = objc_msgSend(v8, "count");
            v14 = v13 - 1;
            if ((unint64_t)(v13 - 1) >= 2)
            {
              v15 = 1 - v13;
              do
              {
                v16 = v14 - 1;
                v17 = (void *)objc_msgSend(v8, "objectAtIndexedSubscript:", v14 - 1);
                if (objc_msgSend(v17, "isSelected"))
                {
                  objc_msgSend(v17, "setSelected:", 0);
                  v18 = objc_alloc_init(TSDBezierSubpath);
                  v19 = (void *)objc_msgSend(v17, "copy");
                  -[NSMutableArray addObject:](-[TSDBezierSubpath nodes](v18, "nodes"), "addObject:", v19);

                  -[NSMutableArray addObjectsFromArray:](-[TSDBezierSubpath nodes](v18, "nodes"), "addObjectsFromArray:", objc_msgSend(v8, "subarrayWithRange:", v14, objc_msgSend(v8, "count") + v15));
                  objc_msgSend(v8, "removeObjectsInRange:", v14, objc_msgSend(v8, "count") + v15);
                  objc_msgSend(v3, "addObject:", v18);

                }
                ++v15;
                --v14;
              }
              while (v16 > 1);
            }
          }
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }
  -[NSMutableArray addObjectsFromArray:](v20->mSubpaths, "addObjectsFromArray:", v3);

}

- (CGPath)subpathForSelection
{
  id v3;
  void *v4;
  void *i;
  void *v6;

  v3 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
  v4 = (void *)-[NSMutableArray objectEnumerator](self->mSubpaths, "objectEnumerator");
  for (i = v4; ; v4 = i)
  {
    v6 = (void *)objc_msgSend(v4, "nextObject");
    if (!v6)
      break;
    objc_msgSend(v6, "appendToBezierPath:selectedNodesOnly:fromIndex:", v3, 1, 0);
  }
  return (CGPath *)objc_msgSend(v3, "CGPath");
}

- (NSArray)nodeTypes
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  NSMutableArray *obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = (NSArray *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = self->mSubpaths;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v9 = (void *)objc_msgSend(v8, "nodes");
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v17;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v17 != v12)
                objc_enumerationMutation(v9);
              -[NSArray addObject:](v3, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", (char)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "type")));
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v11);
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }
  return v3;
}

- (void)setNodeTypes:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = self->mSubpaths;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v10 = (void *)objc_msgSend(v9, "nodes");
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v17;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v17 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "setType:", objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v6 + v14), "intValue"));
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            v6 += v14;
          }
          while (v12);
        }
        ++v8;
      }
      while (v8 != v5);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }
}

- (void)moveToPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  TSDBezierSubpath *v7;

  y = a3.y;
  x = a3.x;
  v6 = (void *)-[NSMutableArray lastObject](self->mSubpaths, "lastObject");
  if (objc_msgSend((id)objc_msgSend(v6, "nodes"), "count"))
  {
    if (objc_msgSend((id)objc_msgSend(v6, "nodes"), "count") == 1)
    {
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "nodes"), "lastObject"), "setNodePoint:", x, y);
    }
    else
    {
      v7 = objc_alloc_init(TSDBezierSubpath);
      -[NSMutableArray addObject:](self->mSubpaths, "addObject:", v7);

    }
  }
  else
  {
    objc_msgSend(v6, "addNode:", +[TSDBezierNode bezierNodeWithPoint:](TSDBezierNode, "bezierNodeWithPoint:", x, y));
  }
}

- (void)lineToPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  uint64_t v7;

  y = a3.y;
  x = a3.x;
  v5 = (void *)-[NSMutableArray lastObject](self->mSubpaths, "lastObject");
  if (!objc_msgSend((id)objc_msgSend(v5, "nodes"), "count"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDEditableBezierPathSource lineToPoint:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditableBezierPathSource.m"), 2291, CFSTR("cannot add line to subpath without move first"));
  }
  objc_msgSend(v5, "addNode:", +[TSDBezierNode bezierNodeWithPoint:](TSDBezierNode, "bezierNodeWithPoint:", x, y));
}

- (void)curveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v9 = a3.y;
  v10 = a3.x;
  v11 = (void *)-[NSMutableArray lastObject](self->mSubpaths, "lastObject");
  if (!objc_msgSend((id)objc_msgSend(v11, "nodes"), "count"))
  {
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDEditableBezierPathSource curveToPoint:controlPoint1:controlPoint2:]");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditableBezierPathSource.m"), 2299, CFSTR("cannot add line to subpath without move first"));
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "nodes"), "lastObject"), "setOutControlPoint:", v8, v7);
  objc_msgSend(v11, "addNode:", +[TSDBezierNode bezierNodeWithPoint:inControlPoint:outControlPoint:](TSDBezierNode, "bezierNodeWithPoint:inControlPoint:outControlPoint:", v10, v9, x, y, v10, v9));
}

- (void)smoothCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  -[TSDEditableBezierPathSource curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", a3.x, a3.y, a4.x, a4.y, a5.x, a5.y);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[NSMutableArray lastObject](self->mSubpaths, "lastObject"), "nodes"), "lastObject"), "setType:", 3);
}

- (void)closePath
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  TSDBezierSubpath *v14;

  v3 = (void *)-[NSMutableArray lastObject](self->mSubpaths, "lastObject");
  if ((unint64_t)objc_msgSend((id)objc_msgSend(v3, "nodes"), "count") <= 1)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDEditableBezierPathSource closePath]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditableBezierPathSource.m"), 2320, CFSTR("cannot close subpath without a line or curve segment"));
  }
  objc_msgSend(v3, "setClosed:", 1);
  v6 = (void *)objc_msgSend((id)objc_msgSend(v3, "nodes"), "objectAtIndex:", 0);
  v7 = (void *)objc_msgSend((id)objc_msgSend(v3, "nodes"), "lastObject");
  objc_msgSend(v6, "nodePoint");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "nodePoint");
  if (TSDNearlyEqualPoints(v9, v11, v12, v13))
  {
    objc_msgSend(v7, "inControlPoint");
    objc_msgSend(v6, "setInControlPoint:");
    objc_msgSend((id)objc_msgSend(v3, "nodes"), "removeLastObject");
  }
  v14 = objc_alloc_init(TSDBezierSubpath);
  -[NSMutableArray addObject:](self->mSubpaths, "addObject:", v14);

}

- (int64_t)mixingTypeWithObject:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__TSDEditableBezierPathSource_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_24D82BFD8;
  v4[4] = a3;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __52__TSDEditableBezierPathSource_mixingTypeWithObject___block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_opt_class();
  if (!TSUDynamicCast())
  {
    v0 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v1 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDEditableBezierPathSource mixingTypeWithObject:]_block_invoke");
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditableBezierPathSource.m"), 2344, CFSTR("nil object after cast"));
  }
  return 1;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __64__TSDEditableBezierPathSource_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_24D82CFC8;
  v5[4] = self;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

uint64_t __64__TSDEditableBezierPathSource_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

- (NSMutableArray)subpaths
{
  return self->mSubpaths;
}

- (void)setSubpaths:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
