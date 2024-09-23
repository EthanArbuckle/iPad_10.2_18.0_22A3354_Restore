@implementation TUIHBoxLayout

- (TUIHBoxLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  id v8;
  id v9;
  id v10;
  TUIHBoxLayout *v11;
  TUIHBoxLayout *v12;
  uint64_t v13;
  void *v14;
  char *v15;
  TUIGuideLayoutController *v16;
  TUIGuideLayoutController *guideLayoutController;
  void *v18;
  char *v19;
  char v20;
  void *v21;
  char *v22;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)TUIHBoxLayout;
  v11 = -[TUILayout initWithModel:parent:controller:](&v24, "initWithModel:parent:controller:", v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    -[TUILayout specifiedWidth](v11, "specifiedWidth");
    if ((v13 & 0x6000000000000) == 0x2000000000000)
      -[TUILayout setSpecifiedWidthComputeInherited:](v12, "setSpecifiedWidthComputeInherited:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](v12, "box"));
    v15 = (char *)objc_msgSend(v14, "layoutMode");

    if (v15 != (_BYTE *)&dword_0 + 1)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](v12, "box"));
      v19 = (char *)objc_msgSend(v18, "layoutMode");

      if (v19 == (_BYTE *)&dword_0 + 2)
      {
        v20 = *(_BYTE *)&v12->_flags | 2;
      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](v12, "box"));
        v22 = (char *)objc_msgSend(v21, "layoutMode");

        if (v22 != (_BYTE *)&dword_0 + 3)
          goto LABEL_11;
        v20 = *(_BYTE *)&v12->_flags | 6;
      }
      *(_BYTE *)&v12->_flags = v20;
      goto LABEL_11;
    }
    v16 = objc_alloc_init(TUIGuideLayoutController);
    guideLayoutController = v12->_guideLayoutController;
    v12->_guideLayoutController = v16;

  }
LABEL_11:

  return v12;
}

- (id)guideLayoutControllerForLayout:(id)a3
{
  return self->_guideLayoutController;
}

- (id)guideForLayout:(id)a3 spec:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue(-[TUIGuideLayoutController guideForSpec:](self->_guideLayoutController, "guideForSpec:", a4));
}

- (id)guideProviderForLayout:(id)a3
{
  if (!self->_guideLayoutController)
    self = 0;
  return self;
}

- (id)defaultGuideSpecForLayout:(id)a3 edge:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = v5;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2
    && objc_msgSend(v5, "shouldUseDefaultGuideForLayout:edge:", v5, a4))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUIGuideSpec unbound](TUIGuideSpec, "unbound"));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)shouldUseDefaultGuideForLayout:(id)a3 edge:(unint64_t)a4
{
  id v6;
  void *v7;
  TUIHBoxLayout *v8;
  unsigned __int8 v9;
  objc_super v11;

  v6 = a3;
  v7 = v6;
  if (self->_guideLayoutController)
  {
    v8 = (TUIHBoxLayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutAncestor"));
    v9 = v8 == self;

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)TUIHBoxLayout;
    v9 = -[TUILayout shouldUseDefaultGuideForLayout:edge:](&v11, "shouldUseDefaultGuideForLayout:edge:", v6, a4);
  }

  return v9;
}

- (BOOL)isVerticallyAligningChildren
{
  return 1;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *__p;
  char *v29;
  char *v30;
  _BYTE v31[128];

  __p = 0;
  v29 = 0;
  v30 = 0;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v3);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "validatedIntrinsicWidthConsideringSpecified");
        v9 = v7;
        v10 = v8;
        v11 = v29;
        if (v29 >= v30)
        {
          v13 = (v29 - (_BYTE *)__p) >> 4;
          v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 60)
            sub_6F9C();
          v15 = v30 - (_BYTE *)__p;
          if ((v30 - (_BYTE *)__p) >> 3 > v14)
            v14 = v15 >> 3;
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0)
            v16 = 0xFFFFFFFFFFFFFFFLL;
          else
            v16 = v14;
          if (v16)
            v17 = (char *)sub_22FD4((uint64_t)&v30, v16);
          else
            v17 = 0;
          v18 = &v17[16 * v13];
          *(_QWORD *)v18 = v9;
          *((_QWORD *)v18 + 1) = v10;
          v20 = (char *)__p;
          v19 = v29;
          v21 = v18;
          if (v29 != __p)
          {
            do
            {
              *((_OWORD *)v21 - 1) = *((_OWORD *)v19 - 1);
              v21 -= 16;
              v19 -= 16;
            }
            while (v19 != v20);
            v19 = (char *)__p;
          }
          v12 = v18 + 16;
          __p = v21;
          v29 = v18 + 16;
          v30 = &v17[16 * v16];
          if (v19)
            operator delete(v19);
        }
        else
        {
          *(_QWORD *)v29 = v7;
          *((_QWORD *)v11 + 1) = v8;
          v12 = v11 + 16;
        }
        v29 = v12;
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v4);
  }

  v22 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthSum((unint64_t)__p, (v29 - (_BYTE *)__p) >> 4);
  if (__p)
  {
    v29 = (char *)__p;
    operator delete(__p);
  }
  return v22;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentWidth
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *__p;
  char *v29;
  char *v30;
  _BYTE v31[128];

  __p = 0;
  v29 = 0;
  v30 = 0;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v3);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "computedWidth");
        v9 = v7;
        v10 = v8;
        v11 = v29;
        if (v29 >= v30)
        {
          v13 = (v29 - (_BYTE *)__p) >> 4;
          v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 60)
            sub_6F9C();
          v15 = v30 - (_BYTE *)__p;
          if ((v30 - (_BYTE *)__p) >> 3 > v14)
            v14 = v15 >> 3;
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0)
            v16 = 0xFFFFFFFFFFFFFFFLL;
          else
            v16 = v14;
          if (v16)
            v17 = (char *)sub_22FD4((uint64_t)&v30, v16);
          else
            v17 = 0;
          v18 = &v17[16 * v13];
          *(_QWORD *)v18 = v9;
          *((_QWORD *)v18 + 1) = v10;
          v20 = (char *)__p;
          v19 = v29;
          v21 = v18;
          if (v29 != __p)
          {
            do
            {
              *((_OWORD *)v21 - 1) = *((_OWORD *)v19 - 1);
              v21 -= 16;
              v19 -= 16;
            }
            while (v19 != v20);
            v19 = (char *)__p;
          }
          v12 = v18 + 16;
          __p = v21;
          v29 = v18 + 16;
          v30 = &v17[16 * v16];
          if (v19)
            operator delete(v19);
        }
        else
        {
          *(_QWORD *)v29 = v7;
          *((_QWORD *)v11 + 1) = v8;
          v12 = v11 + 16;
        }
        v29 = v12;
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v4);
  }

  v22 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthSum((unint64_t)__p, (v29 - (_BYTE *)__p) >> 4);
  if (__p)
  {
    v29 = (char *)__p;
    operator delete(__p);
  }
  return v22;
}

- (void)computeLayout
{
  double v3;
  double v4;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v5;
  double v6;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  TUIHStack *v12;
  void *v13;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v14;
  uint64_t v15;
  TUIHStack *v16;

  -[TUILayout computeWidth](self, "computeWidth");
  v4 = v3;
  v5 = -[TUILayout specifiedHeight](self, "specifiedHeight");
  v7 = v5;
  v9 = v8;
  if ((v8 & 0x8000000000000) != 0)
  {
    LODWORD(v6) = (_DWORD)v5;
    -[TUILayout computeHeight](self, "computeHeight", v6);
    v10 = v11;
  }
  else
  {
    v10 = NAN;
  }
  v12 = [TUIHStack alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v16 = -[TUIHStack initWithLayout:children:](v12, "initWithLayout:children:", self, v13);

  -[TUIHStack setComputedWidth:](v16, "setComputedWidth:", v4);
  -[TUIHStack setComputedHeight:](v16, "setComputedHeight:", v10);
  -[TUILayout containingWidth](self, "containingWidth");
  -[TUIHStack setContainingMaxWidth:](v16, "setContainingMaxWidth:");
  v14 = -[TUILayout specifiedWidth](self, "specifiedWidth");
  -[TUIHStack setSpecifiedWidth:](v16, "setSpecifiedWidth:", v14, v15);
  -[TUIHStack setSpecifiedHeight:](v16, "setSpecifiedHeight:", v7, v9);
  -[TUIHStack setGuideLayoutController:](v16, "setGuideLayoutController:", self->_guideLayoutController);
  -[TUIHStack setPrefersEqualWidth:](v16, "setPrefersEqualWidth:", (*(_BYTE *)&self->_flags >> 1) & 1);
  -[TUIHStack setUseStrictEqualWidth:](v16, "setUseStrictEqualWidth:", (*(_BYTE *)&self->_flags >> 2) & 1);
  -[TUIHStack computeLayout](v16, "computeLayout");
  if (self->_dynamicLayouts)
    -[TUIHBoxLayout _updateDynamicLayouts](self, "_updateDynamicLayouts");
  -[TUIHStack layoutSize](v16, "layoutSize");
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:");
  *(_BYTE *)&self->_flags |= 1u;

}

- (void)_updateDynamicLayouts
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];

  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = self->_dynamicLayouts;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * (_QWORD)v5), "updateSummariesFromChildren", (_QWORD)v6);
        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)onChildInvalidate:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TUIHBoxLayout;
  -[TUILayout onChildInvalidate:](&v5, "onChildInvalidate:", v4);
  objc_msgSend(v4, "setFlexedWidth:", NAN);

}

- (void)onDesdendantSpecifiedWidthModifiedDidChange
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  objc_msgSend(v3, "onDesdendantSpecifiedWidthModifiedDidChangeForChild:", self);

}

- (void)onDesdendantSpecifiedWidthModifiedDidChangeForChild:(id)a3
{
  -[TUILayout updateDesdendantSpecifiedWidthModifiedWithFlag:](self, "updateDesdendantSpecifiedWidthModifiedWithFlag:", 0);
}

- (void)appendLayoutsWithSpecifiedWidthModifiedToArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_15D420;
  v7[3] = &unk_23E800;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

- (void)onContainingWidthChange
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (-[TUILayout desdendantSpecifiedWidthModified](self, "desdendantSpecifiedWidthModified"))
  {
    v3 = objc_opt_new(NSMutableArray);
    -[TUIHBoxLayout appendLayoutsWithSpecifiedWidthModifiedToArray:](self, "appendLayoutsWithSpecifiedWidthModifiedToArray:", v3);
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v4 = v3;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "onSpecifiedWidthChanged", (_QWORD)v8);
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)modifiedSpecifiedWidthForChild:(SEL)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  TUIHBoxLayout *v9;
  double v10;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "box"));
  v6 = objc_msgSend(v5, "relativeWidth");
  v8 = v7;

  v9 = self;
  -[TUILayout containingWidth](v9, "containingWidth");
  v11 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthByScaling((uint64_t)v6, v8, v10);

  return v11;
}

- (void)onChildrenUpdated
{
  void *v3;
  char v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  unsigned int v10;
  NSMutableArray *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *j;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v30.receiver = self;
  v30.super_class = (Class)TUIHBoxLayout;
  -[TUILayout onChildrenUpdated](&v30, "onChildrenUpdated");
  -[TUILayout invalidateIntrinsicSize](self, "invalidateIntrinsicSize");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "box"));
        v10 = objc_msgSend(v9, "hasRelativeWidth");

        if (v10)
        {
          v4 = 1;
          objc_msgSend(v8, "setSpecifiedWidthModified:", 1);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v5);
  }

  -[TUILayout updateDesdendantSpecifiedWidthModifiedWithFlag:](self, "updateDesdendantSpecifiedWidthModifiedWithFlag:", v4 & 1);
  v11 = objc_opt_new(NSMutableArray);
  v12 = objc_opt_class(_TUIHBoxDynamicArrayLayout);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout containers](self, "containers", 0));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j);
        if (objc_opt_class(v17) == v12)
          v18 = v17;
        else
          v18 = 0;
        v19 = v18;
        if (v19)
          -[NSMutableArray addObject:](v11, "addObject:", v19);

      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    }
    while (v14);
  }

  v20 = -[NSMutableArray count](v11, "count");
  if (v20)
    v21 = -[NSMutableArray copy](v11, "copy");
  else
    v21 = 0;
  objc_storeStrong((id *)&self->_dynamicLayouts, v21);
  if (v20)

}

- (void)appendVisibleBoundsObservers:(id)a3 axis:(unint64_t)a4 offset:(double)a5
{
  id v8;
  void *v9;
  NSMutableArray *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSMutableArray *v18;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v8 = a3;
  if (a4 == 1)
  {
    v17 = 1;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      *(_BYTE *)&self->_flags &= ~1u;
      ++self->_visibleBoundsGeneration;
    }
    v18 = objc_opt_new(NSMutableArray);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout model](self, "model"));
    objc_msgSend(v9, "appendLayoutChildrenToArray:", v18);

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v18;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v14, "dynamicArrayWindowingBox") & 1) != 0)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dynamicArrayWindowingBox"));
            if (v15)
            {
              v16 = +[TUIVisibleBoundsObserver newHorizontalWithWindow:layout:offset:](TUIVisibleBoundsObserver, "newHorizontalWithWindow:layout:offset:", v15, self, a5);
              objc_msgSend(v8, "addObject:", v16);

            }
          }
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    a4 = 1;
  }
  v19.receiver = self;
  v19.super_class = (Class)TUIHBoxLayout;
  -[TUILayout appendVisibleBoundsObservers:axis:offset:](&v19, "appendVisibleBoundsObservers:axis:offset:", v8, a4, a5, v17);

}

- (unint64_t)visibleBoundsGeneration
{
  return self->_visibleBoundsGeneration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guideLayoutController, 0);
  objc_storeStrong((id *)&self->_dynamicLayouts, 0);
}

@end
