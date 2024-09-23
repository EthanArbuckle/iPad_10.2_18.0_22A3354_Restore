@implementation TUILiveFloatingLayoutController

- (void)setRenderModel:(id)a3 withInvalidationContext:(id)a4
{
  TUIRenderModelCollection *v7;
  id v8;
  NSMapTable *v9;
  NSMapTable *entryMap;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  id v20;
  _TUIFloatingEntry *v21;
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
  TUIRenderModelCollection *v39;
  id obj;
  uint64_t v41;
  id v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];

  v7 = (TUIRenderModelCollection *)a3;
  v8 = a4;
  if (self->_renderModel != v7)
  {
    v39 = v7;
    objc_storeStrong((id *)&self->_renderModel, a3);
    v9 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 512, 512));
    entryMap = self->_entryMap;
    self->_entryMap = v9;

    v11 = objc_alloc_init((Class)NSMutableArray);
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection sections](self->_renderModel, "sections"));
    v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v42)
    {
      v41 = *(_QWORD *)v49;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v49 != v41)
            objc_enumerationMutation(obj);
          v43 = v12;
          v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v12);
          v14 = objc_msgSend(v13, "liveTransformsForKind:", objc_opt_class(TUIFloatingLiveTransform));
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v45;
            do
            {
              for (i = 0; i != v17; i = (char *)i + 1)
              {
                if (*(_QWORD *)v45 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(id *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
                v21 = objc_alloc_init(_TUIFloatingEntry);
                -[_TUIFloatingEntry setFloatingLiveTransform:](v21, "setFloatingLiveTransform:", v20);
                objc_msgSend(v13, "offset");
                -[_TUIFloatingEntry setSectionOffset:](v21, "setSectionOffset:");
                objc_msgSend(v13, "offset");
                v23 = v22;
                objc_msgSend(v13, "size");
                -[_TUIFloatingEntry setSectionBottomY:](v21, "setSectionBottomY:", v23 + v24);
                objc_msgSend(v13, "offset");
                v26 = v25;
                objc_msgSend(v20, "center");
                v28 = v26 + v27;
                objc_msgSend(v20, "size");
                v30 = v28 - v29 * 0.5;
                objc_msgSend(v13, "offset");
                v32 = v31;
                objc_msgSend(v20, "center");
                v34 = v32 + v33;
                objc_msgSend(v20, "size");
                v36 = v34 - v35 * 0.5;
                -[_TUIFloatingEntry setCurrentOffset:](v21, "setCurrentOffset:", v30, v36);
                -[_TUIFloatingEntry setDefaultPosition:](v21, "setDefaultPosition:", v30, v36);
                -[NSMapTable setObject:forKey:](self->_entryMap, "setObject:forKey:", v21, v20);

                objc_msgSend(v11, "addObject:", v21);
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
            }
            while (v17);
          }

          v12 = v43 + 1;
        }
        while ((id)(v43 + 1) != v42);
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      }
      while (v42);
    }

    objc_msgSend(v11, "sortUsingComparator:", &stru_242228);
    v37 = (NSArray *)objc_msgSend(v11, "copy");
    entries = self->_entries;
    self->_entries = v37;

    -[TUILiveFloatingLayoutController didUpdateContentOffset:withInvalidationContext:](self, "didUpdateContentOffset:withInvalidationContext:", v8, self->_currentContentOffset.x, self->_currentContentOffset.y);
    v7 = v39;
  }

}

- (void)didUpdateContentOffset:(CGPoint)a3 withInvalidationContext:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  NSUInteger v8;
  NSArray *entries;
  id v10;
  _QWORD v11[5];
  id v12;
  NSUInteger v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  self->_currentContentOffset.x = x;
  self->_currentContentOffset.y = y;
  v8 = -[NSArray count](self->_entries, "count");
  entries = self->_entries;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_12E440;
  v11[3] = &unk_242250;
  v12 = v7;
  v13 = v8;
  v11[4] = self;
  v10 = v7;
  -[NSArray enumerateObjectsUsingBlock:](entries, "enumerateObjectsUsingBlock:", v11);

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
