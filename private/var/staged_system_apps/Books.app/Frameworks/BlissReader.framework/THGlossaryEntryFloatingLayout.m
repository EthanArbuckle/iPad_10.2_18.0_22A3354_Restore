@implementation THGlossaryEntryFloatingLayout

- (id)floatingLayouts
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_msgSend(-[THGlossaryEntryFloatingLayout info](self, "info"), "bodyFloatingInfos");
  v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  v5 = -[THGlossaryEntryFloatingLayout layoutController](self, "layoutController");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v3);
        v10 = objc_msgSend(v5, "layoutForInfo:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9));
        if (v10)
          objc_msgSend(v4, "addObject:", v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  return v4;
}

- (CGRect)boundingBoxForChildren
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect result;
  CGRect v28;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v6 = -[THGlossaryEntryFloatingLayout floatingLayouts](self, "floatingLayouts");
  if (objc_msgSend(v6, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v10), "geometry"), "frame");
          v28.origin.x = v11;
          v28.origin.y = v12;
          v28.size.width = v13;
          v28.size.height = v14;
          v24.origin.x = x;
          v24.origin.y = y;
          v24.size.width = width;
          v24.size.height = height;
          v25 = CGRectUnion(v24, v28);
          x = v25.origin.x;
          y = v25.origin.y;
          width = v25.size.width;
          height = v25.size.height;
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }
  }
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  if (CGRectIsNull(v26))
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)p_addWrappingRequirementsForLayout:(id)a3 toArray:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(a3, "children", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v12 = TSUProtocolCast(&OBJC_PROTOCOL___TSDWrappable, v11);
        if (!v12)
        {
          v13 = TSUProtocolCast(&OBJC_PROTOCOL___TSDWrappableParent, v11);
          if (!v13)
            continue;
          v12 = v13;
          -[THGlossaryEntryFloatingLayout p_addWrappingRequirementsForLayout:toArray:](self, "p_addWrappingRequirementsForLayout:toArray:", v11, a4);
        }
        objc_msgSend(a4, "addObject:", v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
}

- (id)childrenForWrappingDependents
{
  id v3;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  -[THGlossaryEntryFloatingLayout p_addWrappingRequirementsForLayout:toArray:](self, "p_addWrappingRequirementsForLayout:toArray:", self, v3);
  return v3;
}

- (void)updateChildrenFromInfo
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = objc_msgSend(-[THGlossaryEntryFloatingLayout children](self, "children"), "count");
  if (v3 != objc_msgSend(objc_msgSend(-[THGlossaryEntryFloatingLayout info](self, "info"), "childInfos"), "count"))
  {
    v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(objc_msgSend(-[THGlossaryEntryFloatingLayout info](self, "info"), "bodyFloatingInfos"), "count"));
    v5 = objc_msgSend(-[THGlossaryEntryFloatingLayout info](self, "info"), "bodyFloatingInfos");
    v6 = -[THGlossaryEntryFloatingLayout layoutController](self, "layoutController");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          v12 = objc_msgSend(v6, "layoutForInfo:childOfLayout:", v11, self);
          if (!v12)
          {
            v12 = objc_msgSend(objc_alloc((Class)objc_msgSend(v11, "layoutClass")), "initWithInfo:", v11);
            if (!v12)
              continue;
          }
          -[NSMutableArray addObject:](v4, "addObject:", v12);

        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    -[THGlossaryEntryFloatingLayout setChildren:](self, "setChildren:", v4);
    -[THGlossaryEntryFloatingLayout invalidate](self, "invalidate");
  }
  objc_msgSend(-[THGlossaryEntryFloatingLayout children](self, "children"), "makeObjectsPerformSelector:", "updateChildrenFromInfo");
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", self);
}

- (id)computeLayoutGeometry
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  id v9;
  double v10;

  -[THGlossaryEntryFloatingLayout boundingBoxForChildren](self, "boundingBoxForChildren");
  v4 = v3;
  v6 = v5;
  v7 = objc_opt_class(THGlossaryEntryLayout);
  *(_QWORD *)&v8 = TSUDynamicCast(v7, -[THGlossaryEntryFloatingLayout parent](self, "parent")).n128_u64[0];
  objc_msgSend(objc_msgSend(v9, "layoutStyleProvider", v8), "glossaryEntryLayoutValueForDistance:", 3);
  return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v10, 0.0, v4, v6);
}

- (CGSize)maximumFrameSizeForChild:(id)a3
{
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGSize result;

  v5 = objc_opt_class(TSDLayout);
  *(_QWORD *)&v7 = TSUDynamicCast(v5, -[THGlossaryEntryFloatingLayout parent](self, "parent")).n128_u64[0];
  if (v6)
  {
    objc_msgSend(v6, "maximumFrameSizeForChild:", a3, v7);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)THGlossaryEntryFloatingLayout;
    -[THGlossaryEntryFloatingLayout maximumFrameSizeForChild:](&v10, "maximumFrameSizeForChild:", a3, v7);
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)descendentWrappables
{
  return +[TSDLayout descendentWrappablesOfLayout:](TSDLayout, "descendentWrappablesOfLayout:", self);
}

- (int)wrapContainerMode
{
  return 0;
}

@end
