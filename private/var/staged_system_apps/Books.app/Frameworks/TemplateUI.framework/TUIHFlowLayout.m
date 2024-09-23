@implementation TUIHFlowLayout

- (TUIHFlowLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  id v8;
  id v9;
  id v10;
  TUIHFlowLayout *v11;
  TUIHFlowLayout *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TUIHFlowLayout;
  v11 = -[TUILayout initWithModel:parent:controller:](&v16, "initWithModel:parent:controller:", v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    -[TUILayout specifiedWidth](v11, "specifiedWidth");
    if ((v13 & 0x6000000000000) == 0x2000000000000)
      -[TUILayout setSpecifiedHeightComputeInherited:](v12, "setSpecifiedHeightComputeInherited:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](v12, "box"));
    v12->_guideLayout = objc_msgSend(v14, "layoutMode") == (char *)&dword_0 + 1;

  }
  return v12;
}

- (id)guideLayoutControllerForLayout:(id)a3
{
  TUIHFlowLayout *v4;
  TUIHFlowLayout *v5;
  void *v6;

  v4 = (TUIHFlowLayout *)a3;
  if (v4)
  {
    while (1)
    {
      v5 = (TUIHFlowLayout *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](v4, "layoutAncestor"));
      if (v5 == self)
        break;

      v4 = v5;
      if (!v5)
        goto LABEL_6;
    }

  }
LABEL_6:
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout guideLayoutController](v4, "guideLayoutController"));

  return v6;
}

- (id)guideForLayout:(id)a3 spec:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHFlowLayout guideLayoutControllerForLayout:](self, "guideLayoutControllerForLayout:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "guideForSpec:", v6));

  return v8;
}

- (id)guideProviderForLayout:(id)a3
{
  if (!self->_guideLayout)
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
  TUIHFlowLayout *v8;
  unsigned __int8 v9;
  objc_super v11;

  v6 = a3;
  v7 = v6;
  if (self->_guideLayout)
  {
    v8 = (TUIHFlowLayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutAncestor"));
    v9 = v8 == self;

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)TUIHFlowLayout;
    v9 = -[TUILayout shouldUseDefaultGuideForLayout:edge:](&v11, "shouldUseDefaultGuideForLayout:edge:", v6, a4);
  }

  return v9;
}

- (BOOL)isVerticallyAligningChildren
{
  return 1;
}

- (void)computeLayout
{
  double v3;
  double v4;
  void *v5;
  TUIMutableHStack *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  TUIMutableHStack *v11;
  void *v12;
  id v13;
  uint64_t v14;
  TUIMutableHStack *v15;
  TUIGuideLayoutController *v16;
  NSMutableArray *v17;
  id v18;
  uint64_t v19;
  double v20;
  void *j;
  double v22;
  void *v23;
  void *v24;
  float v25;
  double v26;
  unint64_t v27;
  void *v28;
  unsigned __int8 v29;
  double v30;
  void *v31;
  char *v32;
  NSMutableArray *v33;
  _QWORD v34[8];
  uint64_t v35;
  double *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];

  -[TUILayout computeWidth](self, "computeWidth");
  v4 = v3;
  v33 = objc_opt_new(NSMutableArray);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "setFlexedWidth:", NAN);
        -[TUILayout containingWidth](self, "containingWidth");
        objc_msgSend(v10, "setContainingWidth:");
        objc_msgSend(v10, "validateLayout");
        if ((objc_msgSend(v10, "hidden") & 1) == 0
          && !-[TUIMutableHStack addChildLayout:ifFitting:](v6, "addChildLayout:ifFitting:", v10, 1))
        {
          v11 = [TUIMutableHStack alloc];
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
          v13 = objc_msgSend(v12, "hspacing");
          v15 = -[TUIMutableHStack initWithLayout:spacing:maxWidth:](v11, "initWithLayout:spacing:maxWidth:", self, v13, v14, v4);

          v6 = v15;
          if (self->_guideLayout)
          {
            v16 = objc_alloc_init(TUIGuideLayoutController);
            -[TUIHStack setGuideLayoutController:](v15, "setGuideLayoutController:", v16);

          }
          -[NSMutableArray addObject:](v33, "addObject:", v15);
          -[TUIMutableHStack addChildLayout:ifFitting:](v15, "addChildLayout:ifFitting:", v10, 0);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v7);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v17 = v33;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v40;
    v20 = 0.0;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v40 != v19)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)j), "accumulatedWidth");
        v20 = fmax(v20, v22);
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v18);
  }
  else
  {
    v20 = 0.0;
  }

  v35 = 0;
  v36 = (double *)&v35;
  v37 = 0x2020000000;
  v38 = 0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  objc_msgSend(v23, "vspacing");

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v25 = COERCE_FLOAT(objc_msgSend(v24, "vspacing"));

  v26 = v25;
  v27 = -[TUILayout computedLayoutDirection](self, "computedLayoutDirection");
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
  v29 = objc_msgSend(v28, "isHorizontallyAligningChildren");

  v30 = 0.0;
  if ((v29 & 1) != 0)
  {
    v4 = v20;
  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
    v32 = (char *)objc_msgSend(v31, "halign");

    if ((unint64_t)v32 < 2)
    {
      if (v27 == 2)
        v30 = v4 - v20;
      else
        v30 = 0.0;
    }
    else if (v32 == (_BYTE *)&dword_0 + 2)
    {
      v30 = (v4 - v20) * 0.5;
    }
    else if (v32 == (_BYTE *)&dword_0 + 3)
    {
      if (v27 == 2)
        v30 = 0.0;
      else
        v30 = v4 - v20;
    }
  }
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_46574;
  v34[3] = &unk_23EB20;
  v34[4] = &v35;
  *(double *)&v34[5] = v26;
  *(double *)&v34[6] = v30;
  *(double *)&v34[7] = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](v17, "enumerateObjectsUsingBlock:", v34);
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v4, v36[3]);
  _Block_object_dispose(&v35, 8);

}

- (void)onChildInvalidate:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TUIHFlowLayout;
  -[TUILayout onChildInvalidate:](&v5, "onChildInvalidate:", v4);
  objc_msgSend(v4, "setFlexedWidth:", NAN);

}

- (unint64_t)visibleBoundsGeneration
{
  return self->_visibleBoundsGeneration;
}

@end
