@implementation CRLCanvasAbstractLayout

- (CRLCanvasAbstractLayout)init
{
  CRLCanvasAbstractLayout *v2;
  CRLCanvasLayoutGeometry *v3;
  CRLCanvasLayoutGeometry *geometry;
  NSMutableArray *v5;
  NSMutableArray *children;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLCanvasAbstractLayout;
  v2 = -[CRLCanvasAbstractLayout init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(CRLCanvasLayoutGeometry);
    geometry = v2->_geometry;
    v2->_geometry = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    children = v2->_children;
    v2->_children = v5;

  }
  return v2;
}

- (CRLCanvasLayoutGeometry)geometryInParent
{
  void *v3;
  CRLCanvasAbstractLayout **p_parent;
  id WeakRetained;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _OWORD v11[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  p_parent = &self->_parent;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  if (!WeakRetained)
    return (CRLCanvasLayoutGeometry *)v3;
  v6 = objc_msgSend(v3, "mutableCopy");
  v7 = objc_loadWeakRetained((id *)p_parent);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geometry"));
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "transform");
  else
    memset(v11, 0, sizeof(v11));
  objc_msgSend(v6, "transformBy:", v11);

  return (CRLCanvasLayoutGeometry *)v6;
}

- (CRLCanvasLayoutGeometry)geometryInRoot
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometryInRoot:](self, "geometryInRoot:", v3));

  return (CRLCanvasLayoutGeometry *)v4;
}

- (id)geometryInRoot:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v4 = objc_msgSend(a3, "mutableCopy");
  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometry", v11, v12, v13));
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "transform");
      }
      else
      {
        v12 = 0u;
        v13 = 0u;
        v11 = 0u;
      }
      objc_msgSend(v4, "transformBy:", &v11);

      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parent"));
      v6 = (void *)v9;
    }
    while (v9);
  }
  return v4;
}

- (NSArray)visibleGeometries
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return (NSArray *)v3;
}

- (CGAffineTransform)transform
{
  void *v4;
  CGAffineTransform *result;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "transform");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (CGAffineTransform)transformInParent
{
  void *v5;
  void *v6;
  CRLCanvasAbstractLayout **p_parent;
  id WeakRetained;
  CGAffineTransform *result;
  id v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  CGAffineTransform v15;
  CGAffineTransform t2;
  CGAffineTransform v17;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "transform");
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  p_parent = &self->_parent;
  WeakRetained = objc_loadWeakRetained((id *)p_parent);

  if (WeakRetained)
  {
    v10 = objc_loadWeakRetained((id *)p_parent);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "geometry"));
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "transform");
    else
      memset(&t2, 0, sizeof(t2));
    v13 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v15.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v15.c = v13;
    *(_OWORD *)&v15.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformConcat(&v17, &v15, &t2);
    v14 = *(_OWORD *)&v17.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v17.a;
    *(_OWORD *)&retstr->c = v14;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v17.tx;

  }
  return result;
}

- (CGAffineTransform)transformInRoot
{
  void *v5;
  void *v6;
  CGAffineTransform *result;
  CGAffineTransform *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  _OWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "transform");
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  result = (CGAffineTransform *)objc_loadWeakRetained((id *)&self->_parent);
  if (result)
  {
    v8 = result;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CGAffineTransform geometry](v8, "geometry"));
      v10 = v9;
      if (v9)
      {
        v11 = *(_OWORD *)&retstr->c;
        v14[0] = *(_OWORD *)&retstr->a;
        v14[1] = v11;
        v14[2] = *(_OWORD *)&retstr->tx;
        objc_msgSend(v9, "transformByConcatenatingTransformTo:", v14);
      }
      else
      {
        v16 = 0u;
        v17 = 0u;
        v15 = 0u;
      }
      v12 = v16;
      *(_OWORD *)&retstr->a = v15;
      *(_OWORD *)&retstr->c = v12;
      *(_OWORD *)&retstr->tx = v17;

      v13 = objc_claimAutoreleasedReturnValue(-[CGAffineTransform parent](v8, "parent"));
      v8 = (CGAffineTransform *)v13;
    }
    while (v13);
  }
  return result;
}

- (CGRect)frame
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
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)frameInParent
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  objc_msgSend(v3, "size");
  -[CRLCanvasAbstractLayout rectInParent:](self, "rectInParent:", sub_10005FDDC());
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)frameInRoot
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  objc_msgSend(v3, "size");
  -[CRLCanvasAbstractLayout rectInRoot:](self, "rectInRoot:", sub_10005FDDC());
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
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
  -[CRLCanvasAbstractLayout transformInParent](self, "transformInParent");
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
  -[CRLCanvasAbstractLayout transformInRoot](self, "transformInRoot");
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  return CGRectApplyAffineTransform(v8, &v7);
}

- (CGRect)clipRect
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
  double v11;
  double v12;
  double v13;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  objc_msgSend(v2, "size");
  v3 = sub_10005FDDC();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)clippedRectInRoot:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  id WeakRetained;
  void *v13;
  BOOL IsNull;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGAffineTransform v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect result;
  CGRect v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectIsNull(a3))
  {
    -[CRLCanvasAbstractLayout clipRect](self, "clipRect");
    v33.origin.x = v8;
    v33.origin.y = v9;
    v33.size.width = v10;
    v33.size.height = v11;
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v28 = CGRectIntersection(v27, v33);
    x = v28.origin.x;
    y = v28.origin.y;
    width = v28.size.width;
    height = v28.size.height;
    WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
    if (WeakRetained)
    {
      v13 = WeakRetained;
      v29.origin.x = x;
      v29.origin.y = y;
      v29.size.width = width;
      v29.size.height = height;
      IsNull = CGRectIsNull(v29);

      if (!IsNull)
      {
        v15 = objc_loadWeakRetained((id *)&self->_parent);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
        v17 = v16;
        if (v16)
          objc_msgSend(v16, "transform");
        else
          memset(&v26, 0, sizeof(v26));
        v30.origin.x = x;
        v30.origin.y = y;
        v30.size.width = width;
        v30.size.height = height;
        v31 = CGRectApplyAffineTransform(v30, &v26);
        objc_msgSend(v15, "clippedRectInRoot:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
        x = v18;
        y = v19;
        width = v20;
        height = v21;

      }
    }
  }
  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)isAxisAlignedUnflippedInRoot
{
  double v3;

  -[CRLCanvasAbstractLayout transformInRoot](self, "transformInRoot");
  return sub_1000793E0(&v3);
}

- (BOOL)isRootLayoutForInspectorGeometry
{
  return 0;
}

- (BOOL)isRootLevelForInlineGeometry
{
  return 0;
}

- (BOOL)providesGuidesForChildLayouts
{
  return 0;
}

- (BOOL)exclusivelyProvidesGuidesForChildLayouts
{
  return 0;
}

- (CRLCanvasAbstractLayout)parentLayoutForProvidingGuides
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  if (objc_msgSend(v2, "providesGuidesForChildLayouts"))
    v3 = v2;
  else
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "parentLayoutForProvidingGuides"));
  v4 = v3;

  return (CRLCanvasAbstractLayout *)v4;
}

- (NSArray)layoutsForProvidingGuidesForChildLayouts
{
  void *v2;
  void *v3;
  void *v4;

  if (!-[CRLCanvasAbstractLayout providesGuidesForChildLayouts](self, "providesGuidesForChildLayouts"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A768);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2EFE8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A788);
    v2 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasAbstractLayout layoutsForProvidingGuidesForChildLayouts]"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasAbstractLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 177, 0, "This method should never be called on a layout which returns NO for providesGuidesForChildLayouts.");

  }
  return 0;
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  return 0;
}

- (CRLCanvasAbstractLayout)root
{
  CRLCanvasAbstractLayout **p_parent;
  id WeakRetained;
  id v5;
  CRLCanvasAbstractLayout *v6;

  p_parent = &self->_parent;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_parent);
    v6 = (CRLCanvasAbstractLayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "root"));

  }
  else
  {
    v6 = self;
  }

  return v6;
}

- (void)setChildren:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *children;
  id v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  NSMutableArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  NSMutableArray *v20;
  NSMutableArray *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v4 = (NSMutableArray *)a3;
  children = self->_children;
  if (children != v4 && (-[NSMutableArray isEqual:](children, "isEqual:", v4) & 1) == 0)
  {
    if (v4)
      v6 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v4);
    else
      v6 = 0;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = self->_children;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v6, "containsObject:", v12) & 1) == 0)
            objc_msgSend(v12, "setParent:", 0);
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v9);
    }

    if (self->_children)
      v13 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", self->_children);
    else
      v13 = 0;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = v4;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j);
          if ((objc_msgSend(v13, "containsObject:", v19, (_QWORD)v22) & 1) == 0)
          {
            objc_msgSend(v19, "removeFromParent");
            objc_msgSend(v19, "setParent:", self);
          }
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v16);
    }

    if (v4)
      v4 = v14;
    else
      v4 = (NSMutableArray *)&__NSArray0__struct;
    v20 = (NSMutableArray *)-[NSMutableArray mutableCopy](v4, "mutableCopy", (_QWORD)v22);
    v21 = self->_children;
    self->_children = v20;

  }
}

- (void)removeFromParent
{
  uint64_t v3;
  id v4;
  id WeakRetained;
  id v6;

  objc_opt_class(CRLCanvasLayout, a2);
  v4 = sub_100221D0C(v3, self);
  v6 = (id)objc_claimAutoreleasedReturnValue(v4);
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
    objc_msgSend(WeakRetained, "replaceChild:with:", v6, 0);

  }
}

- (void)addChild:(id)a3
{
  NSMutableArray *children;
  id v5;
  id v6;

  v6 = a3;
  children = self->_children;
  if (children)
    v5 = -[NSMutableArray count](children, "count");
  else
    v5 = 0;
  -[CRLCanvasAbstractLayout insertChild:atIndex:](self, "insertChild:atIndex:", v6, v5);

}

- (void)insertChild:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  NSMutableArray *children;
  NSMutableArray *v9;
  NSMutableArray *v10;
  id v11;

  v6 = a3;
  if (v6)
  {
    v11 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parent"));

    if (v7)
      objc_msgSend(v11, "removeFromParent");
    children = self->_children;
    if (!children)
    {
      v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v10 = self->_children;
      self->_children = v9;

      children = self->_children;
    }
    -[NSMutableArray insertObject:atIndex:](children, "insertObject:atIndex:", v11, a4);
    objc_msgSend(v11, "setParent:", self);
    v6 = v11;
  }

}

- (void)insertChild:(id)a3 below:(id)a4
{
  id v6;
  NSMutableArray *children;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  children = self->_children;
  if (children)
  {
    v8 = -[NSMutableArray indexOfObjectIdenticalTo:](children, "indexOfObjectIdenticalTo:", v6);
    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
      -[CRLCanvasAbstractLayout insertChild:atIndex:](self, "insertChild:atIndex:", v9, v8);
  }

}

- (void)insertChild:(id)a3 above:(id)a4
{
  id v6;
  NSMutableArray *children;
  char *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  children = self->_children;
  if (children)
  {
    v8 = (char *)-[NSMutableArray indexOfObjectIdenticalTo:](children, "indexOfObjectIdenticalTo:", v6);
    if (v8 != (char *)0x7FFFFFFFFFFFFFFFLL)
      -[CRLCanvasAbstractLayout insertChild:atIndex:](self, "insertChild:atIndex:", v9, v8 + 1);
  }

}

- (void)replaceChild:(id)a3 with:(id)a4
{
  id v6;
  NSMutableArray *children;
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  children = self->_children;
  if (children)
  {
    v8 = -[NSMutableArray indexOfObjectIdenticalTo:](children, "indexOfObjectIdenticalTo:", v10);
    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = v8;
      -[NSMutableArray removeObjectAtIndex:](self->_children, "removeObjectAtIndex:", v8);
      objc_msgSend(v10, "setParent:", 0);
      if (v6)
        -[CRLCanvasAbstractLayout insertChild:atIndex:](self, "insertChild:atIndex:", v6, v9);
    }
  }

}

- (void)exchangeChildAtIndex:(unint64_t)a3 withChildAtIndex:(unint64_t)a4
{
  NSMutableArray *children;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;
  void *v14;
  void *v15;

  children = self->_children;
  if (!children)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A7A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2F0F0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A7C8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasAbstractLayout exchangeChildAtIndex:withChildAtIndex:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasAbstractLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 276, 0, "invalid nil value for '%{public}s'", "_children");

    children = self->_children;
  }
  if (a3 != a4 && children)
  {
    v11 = -[NSMutableArray count](children, "count");
    if ((unint64_t)v11 > a3 && (unint64_t)v11 > a4)
    {
      -[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:](self->_children, "exchangeObjectAtIndex:withObjectAtIndex:", a3, a4);
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125A7E8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2F06C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125A808);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasAbstractLayout exchangeChildAtIndex:withChildAtIndex:]"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasAbstractLayout.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 279, 0, "bad index");

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
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  _BYTE v38[128];
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
  v11 = a4;
  -[CRLCanvasAbstractLayout frameForCulling](self, "frameForCulling");
  if (sub_100060F38(v12, v13, v14, v15, x, y, width, height))
  {
    objc_msgSend(v11, "addObject:", self);
    if (v5)
    {
      -[CRLCanvasAbstractLayout frameForCulling](self, "frameForCulling");
      v43.origin.x = x;
      v43.origin.y = y;
      v43.size.width = width;
      v43.size.height = height;
      v40 = CGRectIntersection(v39, v43);
      v16 = v40.origin.x;
      v17 = v40.origin.y;
      v18 = v40.size.width;
      v19 = v40.size.height;
      memset(&v37, 0, sizeof(v37));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
      v21 = v20;
      if (v20)
        objc_msgSend(v20, "transform");
      else
        memset(&v36, 0, sizeof(v36));
      CGAffineTransformInvert(&v37, &v36);

      v35 = v37;
      v41.origin.x = v16;
      v41.origin.y = v17;
      v41.size.width = v18;
      v41.size.height = v19;
      v42 = CGRectApplyAffineTransform(v41, &v35);
      v22 = v42.origin.x;
      v23 = v42.origin.y;
      v24 = v42.size.width;
      v25 = v42.size.height;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children", 0));
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v28; i = (char *)i + 1)
          {
            if (*(_QWORD *)v32 != v29)
              objc_enumerationMutation(v26);
            objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i), "addLayoutsInRect:toArray:deep:", v11, 1, v22, v23, v24, v25);
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
        }
        while (v28);
      }

    }
  }

}

- (CGRect)frameForCullingInRoot
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  -[CRLCanvasAbstractLayout frameForCulling](self, "frameForCulling");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "transformInRoot");
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

- (BOOL)shouldBeIncludedInParentFrameForCulling
{
  return 1;
}

- (CGRect)alignmentFrame
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
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)alignmentFrameInParent
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
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometryInParent](self, "geometryInParent"));
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)alignmentFrameInRoot
{
  void *v3;
  double v4;
  CGFloat x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGAffineTransform v18;
  CGRect v19;
  CGRect v20;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));

  -[CRLCanvasAbstractLayout alignmentFrame](self, "alignmentFrame");
  x = v4;
  y = v6;
  width = v8;
  height = v10;
  if (v3)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
    v13 = v12;
    if (v12)
      objc_msgSend(v12, "transformInRoot");
    else
      memset(&v18, 0, sizeof(v18));
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    v20 = CGRectApplyAffineTransform(v19, &v18);
    x = v20.origin.x;
    y = v20.origin.y;
    width = v20.size.width;
    height = v20.size.height;

  }
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)shouldSnapWhileResizing
{
  void *v3;
  double v4;
  double v5;
  BOOL v6;
  double v8;

  -[CRLCanvasAbstractLayout transformInRoot](self, "transformInRoot");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  objc_msgSend(v3, "size");
  v6 = sub_1000792C0(&v8, v4, v5);

  return v6;
}

- (double)interimPositionX
{
  return self->_interimPosition.x;
}

- (void)setInterimPositionX:(double)a3
{
  self->_interimPosition.x = a3;
  self->_interimPositionXSet = 1;
}

- (double)interimPositionY
{
  return self->_interimPosition.y;
}

- (void)setInterimPositionY:(double)a3
{
  self->_interimPosition.y = a3;
  self->_interimPositionYSet = 1;
}

- (void)fixTransformFromInterimPosition
{
  -[CRLCanvasAbstractLayout p_fixTransformFromInterimPosition:interimPositionXSet:interimPositionYSet:](self, "p_fixTransformFromInterimPosition:interimPositionXSet:interimPositionYSet:", self->_interimPositionXSet, self->_interimPositionYSet, self->_interimPosition.x, self->_interimPosition.y);
  self->_lastInterimPosition = self->_interimPosition;
  *(_WORD *)&self->_lastInterimPositionXSet = *(_WORD *)&self->_interimPositionXSet;
  self->_interimPosition = CGPointZero;
  *(_WORD *)&self->_interimPositionXSet = 0;
}

- (void)fixTransformFromLastInterimPosition
{
  -[CRLCanvasAbstractLayout p_fixTransformFromInterimPosition:interimPositionXSet:interimPositionYSet:](self, "p_fixTransformFromInterimPosition:interimPositionXSet:interimPositionYSet:", self->_lastInterimPositionXSet, self->_lastInterimPositionYSet, self->_lastInterimPosition.x, self->_lastInterimPosition.y);
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
    -[CRLCanvasAbstractLayout alignmentFrameOriginForFixingInterimPosition](self, "alignmentFrameOriginForFixingInterimPosition");
    v9 = x - a3.x;
  }
  if (v5)
  {
    -[CRLCanvasAbstractLayout alignmentFrameOriginForFixingInterimPosition](self, "alignmentFrameOriginForFixingInterimPosition", a3.x);
    v8 = y - v11;
  }
  -[CRLCanvasAbstractLayout offsetGeometryBy:](self, "offsetGeometryBy:", v9, v8);
}

- (void)offsetGeometryBy:(CGPoint)a3
{
  double y;
  double x;
  void *v7;
  id v8;

  y = a3.y;
  x = a3.x;
  if (a3.x != CGPointZero.x || a3.y != CGPointZero.y)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "geometryByTranslatingBy:", x, y));
    -[CRLCanvasAbstractLayout setGeometry:](self, "setGeometry:", v7);

  }
}

- (BOOL)supportsRotation
{
  return 0;
}

- (BOOL)canRotateChildLayout:(id)a3
{
  return 1;
}

- (BOOL)supportsCalloutAttributes
{
  return 0;
}

- (id)childLayoutContainingPossibleDescendentLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRLCanvasAbstractLayout *v7;
  uint64_t v8;
  CRLCanvasAbstractLayout *v9;
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    do
    {
      v7 = (CRLCanvasAbstractLayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parent"));

      if (v7 == self)
        break;
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parent"));

      v6 = (void *)v8;
    }
    while (v8);
  }
  else
  {
    v6 = 0;
  }
  v9 = (CRLCanvasAbstractLayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parent"));

  if (v9 == self)
    v10 = v6;
  else
    v10 = 0;

  return v10;
}

- (CRLCanvasLayoutGeometry)geometry
{
  return self->_geometry;
}

- (void)setGeometry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CRLCanvasAbstractLayout)parent
{
  return (CRLCanvasAbstractLayout *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (CGPoint)lastInterimPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastInterimPosition.x;
  y = self->_lastInterimPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSArray)children
{
  return &self->_children->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
}

@end
