@implementation THWStackedControlContainerLayout

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWStackedControlContainerLayout;
  -[THWContainerLayout dealloc](&v3, "dealloc");
}

- (THWStackedControlContainerLayoutDelegate)delegate
{
  return (THWStackedControlContainerLayoutDelegate *)objc_msgSend(-[THWStackedControlContainerLayout info](self, "info"), "delegate");
}

- (void)updateChildrenFromInfo
{
  THWStackedControlContainerLayoutDelegate *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];

  v17.receiver = self;
  v17.super_class = (Class)THWStackedControlContainerLayout;
  -[THWContainerLayout updateChildrenFromInfo](&v17, "updateChildrenFromInfo");
  v3 = -[THWStackedControlContainerLayout delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(v3, "stackedControlContainer:isHeightFlexibleForLayout:") & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = -[THWStackedControlContainerLayout children](self, "children", 0);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = 0;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v4);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if (-[THWStackedControlContainerLayoutDelegate stackedControlContainer:isHeightFlexibleForLayout:](v3, "stackedControlContainer:isHeightFlexibleForLayout:", self, v11))
          {
            if (v8)
            {
              v12 = v8;
            }
            else
            {
              v12 = objc_alloc_init((Class)NSMutableArray);
              v8 = v12;
            }
          }
          else if (v7)
          {
            v12 = v7;
          }
          else
          {
            v12 = objc_alloc_init((Class)NSMutableArray);
            v7 = v12;
          }
          objc_msgSend(v12, "addObject:", v11);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
      v8 = 0;
    }
    -[THWStackedControlContainerLayout setChildrenWithFixedHeight:](self, "setChildrenWithFixedHeight:", v7);
    -[THWStackedControlContainerLayout setChildrenWithFlexibleHeight:](self, "setChildrenWithFlexibleHeight:", v8);

  }
  else
  {
    -[THWStackedControlContainerLayout setChildrenWithFixedHeight:](self, "setChildrenWithFixedHeight:", -[THWStackedControlContainerLayout children](self, "children"));
    -[THWStackedControlContainerLayout setChildrenWithFlexibleHeight:](self, "setChildrenWithFlexibleHeight:", 0);
  }
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  NSArray *childrenWithFlexibleHeight;
  char *v6;
  id v7;
  id result;

  childrenWithFlexibleHeight = self->_childrenWithFlexibleHeight;
  if (childrenWithFlexibleHeight
    && -[NSArray indexOfObjectIdenticalTo:](childrenWithFlexibleHeight, "indexOfObjectIdenticalTo:", a3) != 0x7FFFFFFFFFFFFFFFLL)
  {
    return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", self);
  }
  v6 = (char *)-[NSArray indexOfObjectIdenticalTo:](self->_childrenWithFixedHeight, "indexOfObjectIdenticalTo:", a3) + 1;
  if (v6 < (char *)-[NSArray count](self->_childrenWithFixedHeight, "count")
    && (v7 = -[NSArray objectAtIndex:](self->_childrenWithFixedHeight, "objectAtIndex:", v6)) != 0)
  {
    result = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v7, self, 0);
  }
  else
  {
    result = +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", self);
  }
  if (self->_childrenWithFlexibleHeight)
    return objc_msgSend(result, "arrayByAddingObjectsFromArray:");
  return result;
}

- (double)p_computeTotalHeightWithInsets:(UIEdgeInsets)a3 fixedOnly:(BOOL)a4
{
  _BOOL4 v4;
  double bottom;
  double top;
  THWStackedControlContainerLayoutDelegate *v8;
  NSArray *childrenWithFixedHeight;
  double v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  double v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];

  v4 = a4;
  bottom = a3.bottom;
  top = a3.top;
  v8 = -[THWStackedControlContainerLayout delegate](self, "delegate", a3.top, a3.left, a3.bottom, a3.right);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  if (v4)
    childrenWithFixedHeight = self->_childrenWithFixedHeight;
  else
    childrenWithFixedHeight = (NSArray *)-[THWStackedControlContainerLayout children](self, "children");
  v10 = top + bottom;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](childrenWithFixedHeight, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(childrenWithFixedHeight);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i), "frame");
        v10 = v10 + v15;
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](childrenWithFixedHeight, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v12);
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v16 = -[THWStackedControlContainerLayout children](self, "children", 0);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v28;
    do
    {
      v21 = 0;
      v22 = v19;
      do
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v16);
        v19 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v21);
        if (v22)
        {
          -[THWStackedControlContainerLayoutDelegate stackedControlContainer:verticalPaddingAfter:](v8, "stackedControlContainer:verticalPaddingAfter:", self, v22);
          v24 = v23;
          -[THWStackedControlContainerLayoutDelegate stackedControlContainer:verticalPaddingBefore:](v8, "stackedControlContainer:verticalPaddingBefore:", self, v19);
          if (v24 >= v25)
            v25 = v24;
          v10 = v10 + v25;
        }
        v21 = (char *)v21 + 1;
        v22 = v19;
      }
      while (v18 != v21);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v18);
  }
  return v10;
}

- (double)heightForFlexibleChildLayout:(id)a3
{
  THWStackedControlContainerLayoutDelegate *v5;
  double v6;
  double v7;
  char v8;
  double v9;
  double v10;
  double result;

  v5 = -[THWStackedControlContainerLayout delegate](self, "delegate");
  -[THWStackedControlContainerLayoutDelegate stackedControlContainerInsets:](v5, "stackedControlContainerInsets:", self);
  -[THWStackedControlContainerLayout p_computeTotalHeightWithInsets:fixedOnly:](self, "p_computeTotalHeightWithInsets:fixedOnly:", 1);
  v7 = v6;
  if ((objc_opt_respondsToSelector(v5, "stackedControlContainer:heightForFlexibleLayout:withTotalFixedHeight:") & 1) != 0)
  {
    -[THWStackedControlContainerLayoutDelegate stackedControlContainer:heightForFlexibleLayout:withTotalFixedHeight:](v5, "stackedControlContainer:heightForFlexibleLayout:withTotalFixedHeight:", self, a3, v7);
  }
  else
  {
    v8 = objc_opt_respondsToSelector(v5, "stackedControlContainerMinHeight:");
    result = 0.0;
    if ((v8 & 1) != 0)
    {
      -[THWStackedControlContainerLayoutDelegate stackedControlContainerMinHeight:](v5, "stackedControlContainerMinHeight:", self, 0.0);
      if (v7 >= v9)
        v10 = 0.0;
      else
        v10 = v9 - v7;
      return v10 / (double)-[NSArray count](self->_childrenWithFlexibleHeight, "count");
    }
  }
  return result;
}

- (id)layoutGeometryForLayout:(id)a3
{
  id v5;
  char *v6;
  id result;
  char *v8;
  THWStackedControlContainerLayoutDelegate *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  id v20;
  id v21;
  double MaxY;
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
  unsigned int v34;
  CGFloat y;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  id v40;
  double v41;
  double v42;
  double v43;
  __n128 v44;
  __n128 v45;
  double v46;
  CGAffineTransform v47;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v50;
  CGRect v51;
  CGRect v52;

  v5 = -[THWStackedControlContainerLayout children](self, "children");
  v6 = (char *)objc_msgSend(v5, "indexOfObjectIdenticalTo:", a3);
  if (v6 == (char *)0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v8 = v6;
  v9 = -[THWStackedControlContainerLayout delegate](self, "delegate");
  -[THWStackedControlContainerLayoutDelegate stackedControlContainerWidth:](v9, "stackedControlContainerWidth:", self);
  v11 = v10;
  -[THWStackedControlContainerLayoutDelegate stackedControlContainerInsets:](v9, "stackedControlContainerInsets:", self);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  if ((objc_opt_respondsToSelector(v9, "stackedControlContainer:isHeightFlexibleForLayout:") & 1) != 0
    && -[THWStackedControlContainerLayoutDelegate stackedControlContainer:isHeightFlexibleForLayout:](v9, "stackedControlContainer:isHeightFlexibleForLayout:", self, a3)&& (-[THWStackedControlContainerLayout heightForFlexibleChildLayout:](self, "heightForFlexibleChildLayout:", a3), v18 > 0.0)&& (v19 = objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v15, 0.0, v11 - v15 - v17, v18)) != 0|| (v19 = -[THWStackedControlContainerLayoutDelegate stackedControlContainer:layoutGeometryForLayout:](v9, "stackedControlContainer:layoutGeometryForLayout:", self, a3)) != 0
    || (result = objc_msgSend(a3, "layoutGeometryFromInfo"), (v19 = result) != 0))
  {
    if (v8)
    {
      v20 = objc_msgSend(v5, "objectAtIndex:", v8 - 1);
      if (v20)
      {
        v21 = v20;
        objc_msgSend(v20, "frame");
        MaxY = CGRectGetMaxY(v51);
        -[THWStackedControlContainerLayoutDelegate stackedControlContainer:verticalPaddingAfter:](v9, "stackedControlContainer:verticalPaddingAfter:", self, v21);
        v24 = v23;
        -[THWStackedControlContainerLayoutDelegate stackedControlContainer:verticalPaddingBefore:](v9, "stackedControlContainer:verticalPaddingBefore:", self, a3);
        if (v24 >= v25)
          v26 = v24;
        else
          v26 = v25;
        -[THWStackedControlContainerLayoutDelegate stackedControlContainer:verticalSpacingAfter:](v9, "stackedControlContainer:verticalSpacingAfter:", self, v21);
        v13 = MaxY + v27 + v26;
      }
    }
    -[THWStackedControlContainerLayoutDelegate stackedControlContainer:verticalPaddingBefore:](v9, "stackedControlContainer:verticalPaddingBefore:", self, a3);
    v46 = v13 + v28;
    v29 = v11;
    v30 = v15;
    v31 = v11 - v15;
    v32 = v17;
    v33 = v31 - v17;
    v34 = -[THWStackedControlContainerLayoutDelegate stackedControlContainer:alignmentForLayout:](v9, "stackedControlContainer:alignmentForLayout:", self, self);
    y = CGPointZero.y;
    objc_msgSend(v19, "size");
    v37 = v36;
    v39 = v38;
    memset(&v50, 0, sizeof(v50));
    objc_msgSend(v19, "transform");
    v40 = -[THWStackedControlContainerLayout geometry](self, "geometry");
    if (v40)
      objc_msgSend(v40, "transform");
    else
      memset(&t2, 0, sizeof(t2));
    CGAffineTransformConcat(&v50, &t1, &t2);
    v47 = v50;
    v52.origin.x = CGPointZero.x;
    v52.origin.y = y;
    v52.size.width = v37;
    v52.size.height = v39;
    *(CGRect *)v44.n128_u64 = CGRectApplyAffineTransform(v52, &v47);
    v41 = v44.n128_f64[0];
    v42 = v45.n128_f64[0];
    v44.n128_f64[0] = v30 + (v33 - v43) * 0.5;
    v45.n128_f64[0] = v29 - v32 - v43;
    if (v34 != 1)
      v45.n128_f64[0] = v30;
    if (v34 - 2 >= 2)
      v44.n128_f64[0] = v45.n128_f64[0];
    v45.n128_f64[0] = v46;
    return objc_msgSend(v19, "geometryByTranslatingBy:", TSDSubtractPoints(v44, v45, v41, v42));
  }
  return result;
}

- (void)p_positionChildrenWithAlignment:(unsigned int)a3
{
  THWStackedControlContainerLayoutDelegate *v5;
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
  double v16;
  double v17;
  double v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  double v24;
  void *v25;
  void *v26;
  unsigned int v27;
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
  id v45;
  __n128 v46;
  __n128 v47;
  double v48;
  double v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];

  v5 = -[THWStackedControlContainerLayout delegate](self, "delegate");
  -[THWStackedControlContainerLayoutDelegate stackedControlContainerWidth:](v5, "stackedControlContainerWidth:", self);
  v7 = v6;
  -[THWStackedControlContainerLayoutDelegate stackedControlContainerInsets:](v5, "stackedControlContainerInsets:", self);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (a3)
  {
    v15 = v8;
    if ((objc_opt_respondsToSelector(v5, "stackedControlContainerMinHeight:") & 1) != 0)
    {
      -[THWStackedControlContainerLayoutDelegate stackedControlContainerMinHeight:](v5, "stackedControlContainerMinHeight:", self);
      v17 = v16;
      -[THWStackedControlContainerLayout p_computeTotalHeightWithInsets:fixedOnly:](self, "p_computeTotalHeightWithInsets:fixedOnly:", 0, v10, v12, v15, v14);
      if (v18 < v17)
      {
        if (a3 == 1 || a3 == 3)
        {
          v10 = v10 + (v17 - v18) * 0.5;
        }
        else if (a3 == 2)
        {
          v10 = v10 + v17 - v18;
        }
      }
    }
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v19 = -[THWStackedControlContainerLayout children](self, "children");
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v51;
    v49 = v7 - v12 - v14;
    v24 = v7 - v14;
    do
    {
      v25 = 0;
      v26 = v22;
      do
      {
        if (*(_QWORD *)v51 != v23)
          objc_enumerationMutation(v19);
        v22 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v25);
        v27 = -[THWStackedControlContainerLayoutDelegate stackedControlContainer:alignmentForLayout:](v5, "stackedControlContainer:alignmentForLayout:", self, v22);
        objc_msgSend(v22, "frame");
        v29 = v28;
        v31 = v30;
        v33 = v32;
        v35 = v34;
        if ((objc_opt_respondsToSelector(v5, "stackedControlContainer:minHeightForChildLayout:") & 1) != 0)
        {
          -[THWStackedControlContainerLayoutDelegate stackedControlContainer:minHeightForChildLayout:](v5, "stackedControlContainer:minHeightForChildLayout:", self, v22);
          v35 = v36;
        }
        if (v26)
        {
          -[THWStackedControlContainerLayoutDelegate stackedControlContainer:verticalPaddingAfter:](v5, "stackedControlContainer:verticalPaddingAfter:", self, v26);
          v38 = v37;
          -[THWStackedControlContainerLayoutDelegate stackedControlContainer:verticalPaddingBefore:](v5, "stackedControlContainer:verticalPaddingBefore:", self, v22);
          if (v38 >= v39)
            v39 = v38;
          v10 = v10 + v39;
        }
        -[THWStackedControlContainerLayoutDelegate stackedControlContainer:verticalSpacingBefore:](v5, "stackedControlContainer:verticalSpacingBefore:", self, v22);
        v41 = v10 + v40;
        v42 = v12 + (v49 - v33) * 0.5;
        v43 = v24 - v33;
        if (v27 != 1)
          v43 = v12;
        if (v27 - 2 >= 2)
          v44 = v43;
        else
          v44 = v12 + (v49 - v33) * 0.5;
        v45 = objc_msgSend(v22, "geometry", v42, v43);
        v46.n128_f64[0] = v44;
        v47.n128_f64[0] = v41;
        objc_msgSend(v22, "setGeometry:", objc_msgSend(v45, "geometryByTranslatingBy:", TSDSubtractPoints(v46, v47, v29, v31)));
        -[THWStackedControlContainerLayoutDelegate stackedControlContainer:verticalSpacingAfter:](v5, "stackedControlContainer:verticalSpacingAfter:", self, v22);
        v10 = v35 + v41 + v48;
        v25 = (char *)v25 + 1;
        v26 = v22;
      }
      while (v21 != v25);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    }
    while (v21);
  }
}

- (void)validate
{
  objc_super v3;

  -[THWStackedControlContainerLayout invalidateFrame](self, "invalidateFrame");
  v3.receiver = self;
  v3.super_class = (Class)THWStackedControlContainerLayout;
  -[THWControlContainerLayout validate](&v3, "validate");
}

- (id)computeLayoutGeometry
{
  THWStackedControlContainerLayoutDelegate *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double MinY;
  double v14;
  double v15;
  double MaxY;
  double v17;
  double v18;
  double v19;
  char v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v26;
  CGRect v27;

  v3 = -[THWStackedControlContainerLayout delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(v3, "stackedControlContainerVerticalAlignment:") & 1) != 0)
    v4 = -[THWStackedControlContainerLayoutDelegate stackedControlContainerVerticalAlignment:](v3, "stackedControlContainerVerticalAlignment:", self);
  else
    v4 = 0;
  -[THWStackedControlContainerLayout p_positionChildrenWithAlignment:](self, "p_positionChildrenWithAlignment:", v4);
  if ((objc_opt_respondsToSelector(v3, "stackedControlContainerChildrenPositioned:") & 1) != 0)
    -[THWStackedControlContainerLayoutDelegate stackedControlContainerChildrenPositioned:](v3, "stackedControlContainerChildrenPositioned:", self);
  v5 = -[THWStackedControlContainerLayout children](self, "children");
  if (objc_msgSend(v5, "count"))
    v6 = objc_msgSend(v5, "objectAtIndex:", 0);
  else
    v6 = 0;
  if ((objc_opt_respondsToSelector(v3, "stackedControlContainerHeightLastChild:") & 1) == 0
    || (v7 = -[THWStackedControlContainerLayoutDelegate stackedControlContainerHeightLastChild:](v3, "stackedControlContainerHeightLastChild:", self)) == 0)
  {
    v7 = objc_msgSend(v5, "lastObject");
  }
  -[THWStackedControlContainerLayoutDelegate stackedControlContainerInsets:](v3, "stackedControlContainerInsets:", self);
  v9 = v8;
  v11 = v10;
  v12 = v8;
  if (v6)
  {
    objc_msgSend(v6, "frame");
    MinY = CGRectGetMinY(v26);
    -[THWStackedControlContainerLayoutDelegate stackedControlContainer:verticalSpacingBefore:](v3, "stackedControlContainer:verticalSpacingBefore:", self, v6);
    v12 = MinY - v14;
  }
  v15 = v9;
  if (v7)
  {
    objc_msgSend(v7, "frame");
    MaxY = CGRectGetMaxY(v27);
    -[THWStackedControlContainerLayoutDelegate stackedControlContainer:verticalSpacingAfter:](v3, "stackedControlContainer:verticalSpacingAfter:", self, v7);
    v15 = MaxY + v17;
  }
  -[THWStackedControlContainerLayoutDelegate stackedControlContainerWidth:](v3, "stackedControlContainerWidth:", self);
  v19 = v18;
  v20 = objc_opt_respondsToSelector(v3, "stackedControlContainerMinHeight:");
  v21 = 0.0;
  if ((v20 & 1) != 0)
    -[THWStackedControlContainerLayoutDelegate stackedControlContainerMinHeight:](v3, "stackedControlContainerMinHeight:", self, 0.0);
  v22 = fmax(fmax(v11 + v15 - (v12 - v9), 0.0), v21);
  -[THWStackedControlContainerLayoutDelegate stackedControlContainerOrigin:](v3, "stackedControlContainerOrigin:", self);
  return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v23, v24, v19, v22);
}

- (unsigned)autosizeFlagsForTextLayout:(id)a3
{
  THWStackedControlContainerLayoutDelegate *v5;
  unsigned int v6;

  v5 = -[THWStackedControlContainerLayout delegate](self, "delegate");
  v6 = 3;
  if ((objc_opt_respondsToSelector(v5, "stackedControlContainer:autoGrowHorizontallyTextLayout:") & 1) != 0)
  {
    if (-[THWStackedControlContainerLayoutDelegate stackedControlContainer:autoGrowHorizontallyTextLayout:](v5, "stackedControlContainer:autoGrowHorizontallyTextLayout:", self, a3))return 7;
    else
      return 3;
  }
  return v6;
}

- (unsigned)verticalAlignmentForTextLayout:(id)a3
{
  return 0;
}

- (CGRect)nonAutosizedFrameForTextLayout:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWStackedControlContainerLayout nonAutosizedFrameForTextLayout:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWStackedControlContainer.m"), 436, CFSTR("shouldn't be called"));
  v3 = 100.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 100.0;
  result.size.height = v6;
  result.size.width = v3;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4
{
  CGFloat height;
  double width;
  THWStackedControlContainerLayoutDelegate *v8;
  id v9;
  char *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double MaxY;
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
  CGRect v35;
  CGRect result;

  height = a4.height;
  width = a4.width;
  v8 = -[THWStackedControlContainerLayout delegate](self, "delegate");
  v9 = -[THWStackedControlContainerLayout children](self, "children");
  v10 = (char *)objc_msgSend(v9, "indexOfObjectIdenticalTo:", a3);
  if (v10)
  {
    v11 = objc_msgSend(v9, "objectAtIndex:", v10 - 1);
    -[THWStackedControlContainerLayoutDelegate stackedControlContainerInsets:](v8, "stackedControlContainerInsets:", self);
    v14 = v13;
    v16 = v15;
    if (v11)
    {
      objc_msgSend(v11, "frame");
      MaxY = CGRectGetMaxY(v35);
      -[THWStackedControlContainerLayoutDelegate stackedControlContainer:verticalPaddingAfter:](v8, "stackedControlContainer:verticalPaddingAfter:", self, v11);
      v19 = v18;
      -[THWStackedControlContainerLayoutDelegate stackedControlContainer:verticalPaddingBefore:](v8, "stackedControlContainer:verticalPaddingBefore:", self, a3);
      if (v19 < v20)
        v19 = v20;
      -[THWStackedControlContainerLayoutDelegate stackedControlContainer:verticalSpacingAfter:](v8, "stackedControlContainer:verticalSpacingAfter:", self, v11);
      v22 = MaxY + v21 + v19;
    }
    else
    {
      v22 = v12;
    }
  }
  else
  {
    -[THWStackedControlContainerLayoutDelegate stackedControlContainerInsets:](v8, "stackedControlContainerInsets:", self);
    v22 = v23;
    v14 = v24;
    v16 = v25;
  }
  -[THWStackedControlContainerLayoutDelegate stackedControlContainer:verticalSpacingBefore:](v8, "stackedControlContainer:verticalSpacingBefore:", self, a3);
  v27 = v26;
  -[THWStackedControlContainerLayoutDelegate stackedControlContainerWidth:](v8, "stackedControlContainerWidth:", self);
  v29 = v28;
  if ((objc_opt_respondsToSelector(v8, "stackedControlContainer:leftRightInsetForTextLayout:") & 1) != 0)
  {
    -[THWStackedControlContainerLayoutDelegate stackedControlContainer:leftRightInsetForTextLayout:](v8, "stackedControlContainer:leftRightInsetForTextLayout:", self, a3);
    v16 = v30;
    v14 = v30;
  }
  if ((objc_opt_respondsToSelector(v8, "stackedControlContainer:autoGrowHorizontallyTextLayout:") & 1) != 0
    && -[THWStackedControlContainerLayoutDelegate stackedControlContainer:autoGrowHorizontallyTextLayout:](v8, "stackedControlContainer:autoGrowHorizontallyTextLayout:", self, a3))
  {
    v29 = v16 + width + v14;
  }
  v31 = v22 + v27;
  v32 = v29 - v14 - v16;
  v33 = v14;
  v34 = height;
  result.size.height = v34;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v33;
  return result;
}

- (id)dependentsOfTextLayout:(id)a3
{
  return -[THWStackedControlContainerLayout additionalDependenciesForChildLayout:](self, "additionalDependenciesForChildLayout:", a3);
}

- (Class)repClassForTextLayout:(id)a3
{
  return 0;
}

- (id)styleProviderForLayout:(id)a3
{
  return -[THWStackedControlContainerLayoutDelegate stackedControlContainer:styleProviderForLayout:](-[THWStackedControlContainerLayout delegate](self, "delegate"), "stackedControlContainer:styleProviderForLayout:", self, a3);
}

- (id)styleProviderForStorage:(id)a3
{
  THWStackedControlContainerLayoutDelegate *v5;

  v5 = -[THWStackedControlContainerLayout delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(v5, "stackedControlContainer:styleProviderForStorage:") & 1) != 0)
    return -[THWStackedControlContainerLayoutDelegate stackedControlContainer:styleProviderForStorage:](v5, "stackedControlContainer:styleProviderForStorage:", self, a3);
  else
    return 0;
}

- (BOOL)allowsLastLineTruncation:(id)a3
{
  THWStackedControlContainerLayoutDelegate *v5;

  v5 = -[THWStackedControlContainerLayout delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(v5, "stackedControlContainer:allowsLastLineTruncationForLayout:") & 1) != 0)
    return -[THWStackedControlContainerLayoutDelegate stackedControlContainer:allowsLastLineTruncationForLayout:](v5, "stackedControlContainer:allowsLastLineTruncationForLayout:", self, a3);
  else
    return 0;
}

- (unsigned)maxLineCountForTextLayout:(id)a3
{
  THWStackedControlContainerLayoutDelegate *v5;

  v5 = -[THWStackedControlContainerLayout delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(v5, "stackedControlContainer:maxLineCountForLayout:") & 1) != 0)
    return -[THWStackedControlContainerLayoutDelegate stackedControlContainer:maxLineCountForLayout:](v5, "stackedControlContainer:maxLineCountForLayout:", self, a3);
  else
    return 0;
}

- (double)maxAutoGrowWidthForTextLayout:(id)a3
{
  THWStackedControlContainerLayoutDelegate *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = -[THWStackedControlContainerLayout delegate](self, "delegate", a3);
  -[THWStackedControlContainerLayoutDelegate stackedControlContainerWidth:](v4, "stackedControlContainerWidth:", self);
  v6 = v5;
  -[THWStackedControlContainerLayoutDelegate stackedControlContainerInsets:](v4, "stackedControlContainerInsets:", self);
  return v6 - v7 - v8;
}

- (CGSize)adjustedInsets
{
  double width;
  double height;
  CGSize result;

  width = CGSizeZero.width;
  height = CGSizeZero.height;
  result.height = height;
  result.width = width;
  return result;
}

- (TSWPPadding)layoutMargins
{
  return 0;
}

- (unint64_t)columnCount
{
  return 1;
}

- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return 0.0;
}

- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return 0.0;
}

- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6
{
  if (a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWStackedControlContainerLayout positionForColumnIndex:bodyWidth:outWidth:outGap:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWStackedControlContainer.m"), 578, CFSTR("unexpected column index"));
  if (a5)
    *a5 = a4;
  if (a6)
    *a6 = 0.0;
  return 0.0;
}

- (BOOL)alwaysStartsNewTarget
{
  return 0;
}

- (BOOL)shrinkTextToFit
{
  return 0;
}

- (BOOL)columnsAreLeftToRight
{
  return 1;
}

- (NSArray)childrenWithFixedHeight
{
  return self->_childrenWithFixedHeight;
}

- (void)setChildrenWithFixedHeight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSArray)childrenWithFlexibleHeight
{
  return self->_childrenWithFlexibleHeight;
}

- (void)setChildrenWithFlexibleHeight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

@end
