@implementation TUILivePinningLayoutController

- (TUILivePinningLayoutController)init
{
  TUILivePinningLayoutController *v2;
  TUILivePinningLayoutController *v3;
  CGPoint origin;
  CGSize size;
  NSMapTable *entryMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUILivePinningLayoutController;
  v2 = -[TUILivePinningLayoutController init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    origin = CGRectZero.origin;
    size = CGRectZero.size;
    v2->_currentViewBounds.origin = CGRectZero.origin;
    v2->_currentViewBounds.size = size;
    v2->_currentAdjustedViewBounds.origin = origin;
    v2->_currentAdjustedViewBounds.size = size;
    entryMap = v2->_entryMap;
    v2->_entryMap = 0;

    v3->_hasTabBar = 0;
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
  double y;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  id v21;
  _TUIPinningEntry *v22;
  NSArray *v23;
  NSArray *entries;
  id v25;
  TUIRenderModelCollection *v26;
  id obj;
  uint64_t v28;
  id v29;
  uint64_t v30;
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

  v7 = (TUIRenderModelCollection *)a3;
  v8 = a4;
  if (self->_renderModel != v7)
  {
    v25 = v8;
    v26 = v7;
    objc_storeStrong((id *)&self->_renderModel, a3);
    v9 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 512, 512));
    entryMap = self->_entryMap;
    self->_entryMap = v9;

    v11 = objc_alloc_init((Class)NSMutableArray);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection sections](self->_renderModel, "sections"));
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v29)
    {
      v28 = *(_QWORD *)v36;
      y = CGPointZero.y;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v36 != v28)
            objc_enumerationMutation(obj);
          v30 = v13;
          v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v13);
          v15 = objc_msgSend(v14, "liveTransformsForKind:", objc_opt_class(TUIPinningLiveTransform));
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v32;
            do
            {
              for (i = 0; i != v18; i = (char *)i + 1)
              {
                if (*(_QWORD *)v32 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
                v22 = objc_alloc_init(_TUIPinningEntry);
                -[_TUIPinningEntry setPinningLiveTransform:](v22, "setPinningLiveTransform:", v21);
                -[_TUIPinningEntry setCurrentOffset:](v22, "setCurrentOffset:", CGPointZero.x, y);
                -[_TUIPinningEntry setDefaultPosition:](v22, "setDefaultPosition:", CGPointZero.x, y);
                objc_msgSend(v14, "offset");
                -[_TUIPinningEntry setSectionOffset:](v22, "setSectionOffset:");
                -[NSMapTable setObject:forKey:](self->_entryMap, "setObject:forKey:", v22, v21);

                objc_msgSend(v11, "addObject:", v22);
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            }
            while (v18);
          }

          v13 = v30 + 1;
        }
        while ((id)(v30 + 1) != v29);
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v29);
    }

    v23 = (NSArray *)objc_msgSend(v11, "copy");
    entries = self->_entries;
    self->_entries = v23;

    v8 = v25;
    -[TUILivePinningLayoutController updatePinningTransformsWithViewBounds:adjustedViewBounds:invalidationContext:hasTabBar:](self, "updatePinningTransformsWithViewBounds:adjustedViewBounds:invalidationContext:hasTabBar:", v25, self->_hasTabBar, self->_currentViewBounds.origin.x, self->_currentViewBounds.origin.y, self->_currentViewBounds.size.width, self->_currentViewBounds.size.height, self->_currentAdjustedViewBounds.origin.x, self->_currentAdjustedViewBounds.origin.y, self->_currentAdjustedViewBounds.size.width, self->_currentAdjustedViewBounds.size.height);

    v7 = v26;
  }

}

- (void)updatePinningTransformsWithViewBounds:(CGRect)a3 adjustedViewBounds:(CGRect)a4 invalidationContext:(id)a5 hasTabBar:(BOOL)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  id v16;
  NSArray *entries;
  id v18;
  _QWORD v19[5];
  id v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  BOOL v29;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3.size.height;
  v12 = a3.size.width;
  v13 = a3.origin.y;
  v14 = a3.origin.x;
  v16 = a5;
  self->_currentViewBounds.origin.x = v14;
  self->_currentViewBounds.origin.y = v13;
  self->_currentViewBounds.size.width = v12;
  self->_currentViewBounds.size.height = v11;
  self->_currentAdjustedViewBounds.origin.x = x;
  self->_currentAdjustedViewBounds.origin.y = y;
  self->_currentAdjustedViewBounds.size.width = width;
  self->_currentAdjustedViewBounds.size.height = height;
  self->_hasTabBar = a6;
  entries = self->_entries;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_154690;
  v19[3] = &unk_242CC0;
  v21 = v14;
  v22 = v13;
  v23 = v12;
  v24 = v11;
  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  v29 = a6;
  v19[4] = self;
  v20 = v16;
  v18 = v16;
  -[NSArray enumerateObjectsUsingBlock:](entries, "enumerateObjectsUsingBlock:", v19);

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
  double v15;
  double v16;
  double v17;
  double v18;
  TUILayoutAttributes *v19;
  _OWORD v21[3];
  __int128 v22;
  __int128 v23;
  __int128 v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "liveTransform"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_entryMap, "objectForKey:", v5));
  objc_msgSend(v4, "center");
  v8 = v7;
  objc_msgSend(v4, "center");
  v10 = v9;
  objc_msgSend(v6, "currentOffset");
  v12 = v8 + v11;
  v14 = v10 + v13;
  objc_msgSend(v6, "sectionOffset");
  v16 = v12 - v15;
  objc_msgSend(v6, "sectionOffset");
  v18 = v14 - v17;
  v19 = objc_alloc_init(TUILayoutAttributes);
  -[TUILayoutAttributes setCenter:](v19, "setCenter:", v16, v18);
  objc_msgSend(v4, "size");
  -[TUILayoutAttributes setSize:](v19, "setSize:");
  if (v4)
  {
    objc_msgSend(v4, "transform");
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v22 = 0u;
  }
  v21[0] = v22;
  v21[1] = v23;
  v21[2] = v24;
  -[TUILayoutAttributes setTransform:](v19, "setTransform:", v21);

  return v19;
}

- (TUIRenderModelCollection)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CGRect)currentViewBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_currentViewBounds.origin.x;
  y = self->_currentViewBounds.origin.y;
  width = self->_currentViewBounds.size.width;
  height = self->_currentViewBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCurrentViewBounds:(CGRect)a3
{
  self->_currentViewBounds = a3;
}

- (CGRect)currentAdjustedViewBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_currentAdjustedViewBounds.origin.x;
  y = self->_currentAdjustedViewBounds.origin.y;
  width = self->_currentAdjustedViewBounds.size.width;
  height = self->_currentAdjustedViewBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCurrentAdjustedViewBounds:(CGRect)a3
{
  self->_currentAdjustedViewBounds = a3;
}

- (NSMapTable)entryMap
{
  return self->_entryMap;
}

- (void)setEntryMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)hasTabBar
{
  return self->_hasTabBar;
}

- (void)setHasTabBar:(BOOL)a3
{
  self->_hasTabBar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryMap, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
