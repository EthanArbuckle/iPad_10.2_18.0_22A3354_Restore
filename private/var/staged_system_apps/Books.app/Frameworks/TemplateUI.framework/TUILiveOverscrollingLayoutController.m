@implementation TUILiveOverscrollingLayoutController

- (TUILiveOverscrollingLayoutController)init
{
  TUILiveOverscrollingLayoutController *v2;
  TUILiveOverscrollingLayoutController *v3;
  NSMapTable *entryMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUILiveOverscrollingLayoutController;
  v2 = -[TUILiveOverscrollingLayoutController init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_currentContentOffset = CGPointZero;
    entryMap = v2->_entryMap;
    v2->_entryMap = 0;

  }
  return v3;
}

- (void)setRenderModel:(id)a3 withInvalidationContext:(id)a4
{
  TUIRenderModelCollection *v7;
  id v8;
  NSMapTable *v9;
  NSMapTable *entryMap;
  id v11;
  void *i;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  id v19;
  _TUIOverscrollingEntry *v20;
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
  NSArray *v37;
  NSArray *entries;
  id v39;
  id obj;
  uint64_t v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];

  v7 = (TUIRenderModelCollection *)a3;
  v8 = a4;
  if (self->_renderModel != v7)
  {
    v39 = v8;
    objc_storeStrong((id *)&self->_renderModel, a3);
    v9 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 512, 512));
    entryMap = self->_entryMap;
    self->_entryMap = v9;

    v11 = objc_alloc_init((Class)NSMutableArray);
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection sections](self->_renderModel, "sections"));
    v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v42)
    {
      v41 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v42; i = (char *)i + 1)
        {
          if (*(_QWORD *)v51 != v41)
            objc_enumerationMutation(obj);
          v13 = objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i), "liveTransformsForKind:", objc_opt_class(TUIOverscrollingLiveTransform));
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v47;
            do
            {
              for (j = 0; j != v16; j = (char *)j + 1)
              {
                if (*(_QWORD *)v47 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(id *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j);
                v20 = objc_alloc_init(_TUIOverscrollingEntry);
                -[_TUIOverscrollingEntry setOverscrollingLiveTransform:](v20, "setOverscrollingLiveTransform:", v19);
                objc_msgSend(v19, "size");
                v22 = v21;
                objc_msgSend(v19, "size");
                v24 = v23;
                if (v19)
                {
                  objc_msgSend(v19, "transform");
                  v25 = *((double *)&v43 + 1);
                  v26 = *(double *)&v43;
                  v27 = *((double *)&v44 + 1);
                  v28 = *(double *)&v44;
                  v29 = *((double *)&v45 + 1);
                  v30 = *(double *)&v45;
                }
                else
                {
                  v44 = 0u;
                  v45 = 0u;
                  v29 = 0.0;
                  v27 = 0.0;
                  v25 = 0.0;
                  v30 = 0.0;
                  v43 = 0u;
                  v28 = 0.0;
                  v26 = 0.0;
                }
                v31 = v22 * -0.5;
                v32 = v30 + v24 * -0.5 * v28 + v26 * (v22 * -0.5);
                v33 = v29 + v24 * -0.5 * v27 + v25 * v31;
                objc_msgSend(v19, "center");
                v35 = v32 + v34;
                objc_msgSend(v19, "center");
                -[_TUIOverscrollingEntry setDefaultOrigin:](v20, "setDefaultOrigin:", v35, v33 + v36);
                objc_msgSend(v19, "size");
                -[_TUIOverscrollingEntry setDefaultSize:](v20, "setDefaultSize:");
                -[_TUIOverscrollingEntry setDefaultScale:](v20, "setDefaultScale:", 1.0);
                -[_TUIOverscrollingEntry setCurrentScale:](v20, "setCurrentScale:", 1.0);
                -[NSMapTable setObject:forKey:](self->_entryMap, "setObject:forKey:", v20, v19);
                objc_msgSend(v11, "addObject:", v20);

              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
            }
            while (v16);
          }

        }
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v42);
    }

    v37 = (NSArray *)objc_msgSend(v11, "copy");
    entries = self->_entries;
    self->_entries = v37;

    v8 = v39;
    -[TUILiveOverscrollingLayoutController updateOverscrollingTransformsWithContentOffset:invalidationContext:](self, "updateOverscrollingTransformsWithContentOffset:invalidationContext:", v39, self->_currentContentOffset.x, self->_currentContentOffset.y);

  }
}

- (void)updateOverscrollingTransformsWithContentOffset:(CGPoint)a3 invalidationContext:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  NSArray *entries;
  id v9;
  _QWORD v10[5];
  id v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  self->_currentContentOffset.x = x;
  self->_currentContentOffset.y = y;
  entries = self->_entries;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_114D30;
  v10[3] = &unk_241B08;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  -[NSArray enumerateObjectsUsingBlock:](entries, "enumerateObjectsUsingBlock:", v10);

}

- (id)liveAttributesForRenderModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  TUILayoutAttributes *v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  double v30;
  CGFloat v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v45;
  CGAffineTransform v46;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "liveTransform"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_entryMap, "objectForKey:", v5));
  objc_msgSend(v4, "center");
  v8 = v7;
  objc_msgSend(v4, "center");
  v10 = v9;
  objc_msgSend(v6, "defaultOrigin");
  v12 = v8 + v11;
  objc_msgSend(v6, "defaultOrigin");
  v14 = v10 + v13;
  v15 = objc_alloc_init(TUILayoutAttributes);
  -[TUILayoutAttributes setCenter:](v15, "setCenter:", v12, v14);
  objc_msgSend(v4, "size");
  -[TUILayoutAttributes setSize:](v15, "setSize:");
  memset(&v46, 0, sizeof(v46));
  objc_msgSend(v6, "currentScale");
  v17 = v16;
  objc_msgSend(v6, "currentScale");
  CGAffineTransformMakeScale(&v46, v17, v18);
  objc_msgSend(v4, "center");
  v20 = v19;
  objc_msgSend(v6, "defaultSize");
  v22 = v21;
  objc_msgSend(v4, "center");
  v24 = v23;
  objc_msgSend(v6, "defaultSize");
  v26 = v25;
  v27 = *(_OWORD *)&CGAffineTransformIdentity.a;
  v28 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v45.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v45.c = v28;
  v29 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&v45.tx = v29;
  if (v5)
  {
    v34 = v28;
    v35 = v27;
    v33 = v29;
    objc_msgSend(v5, "transform");
    v29 = v33;
    v28 = v34;
    v27 = v35;
  }
  else
  {
    memset(&t2, 0, sizeof(t2));
  }
  *(_OWORD *)&t1.a = v27;
  *(_OWORD *)&t1.c = v28;
  *(_OWORD *)&t1.tx = v29;
  CGAffineTransformConcat(&v45, &t1, &t2);
  if (v4)
    objc_msgSend(v4, "transform");
  else
    memset(&v42, 0, sizeof(v42));
  v41 = v45;
  CGAffineTransformConcat(&t1, &v41, &v42);
  v45 = t1;
  objc_msgSend(v6, "currentScale");
  if (v30 != 1.0)
  {
    v31 = v20 - v22 * 0.5;
    CGAffineTransformMakeTranslation(&v40, v31, v24 - v26 * 0.5);
    v41 = v45;
    CGAffineTransformConcat(&t1, &v41, &v40);
    v45 = t1;
    v41 = t1;
    v39 = v46;
    CGAffineTransformConcat(&t1, &v41, &v39);
    v45 = t1;
    CGAffineTransformMakeTranslation(&v38, -v31, -(v24 - v26 * 0.5));
    v41 = v45;
    CGAffineTransformConcat(&t1, &v41, &v38);
    v45 = t1;
    CGAffineTransformMakeTranslation(&v37, 0.0, self->_currentContentOffset.y * 0.5);
    v41 = v45;
    CGAffineTransformConcat(&t1, &v41, &v37);
    v45 = t1;
  }
  v36 = v45;
  -[TUILayoutAttributes setTransform:](v15, "setTransform:", &v36);

  return v15;
}

- (TUIRenderModelCollection)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CGPoint)currentContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentContentOffset.x;
  y = self->_currentContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCurrentContentOffset:(CGPoint)a3
{
  self->_currentContentOffset = a3;
}

- (NSMapTable)entryMap
{
  return self->_entryMap;
}

- (void)setEntryMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryMap, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
