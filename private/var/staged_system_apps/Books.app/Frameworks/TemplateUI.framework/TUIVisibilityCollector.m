@implementation TUIVisibilityCollector

- (TUIVisibilityCollector)initWithController:(id)a3 provider:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  TUIVisibilityCollector *v11;
  TUIVisibilityCollector *v12;
  CGSize size;
  uint64_t v14;
  NSMapTable *q_trackerStateMap;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TUIVisibilityCollector;
  v11 = -[TUIVisibilityCollector init](&v17, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_controller, v8);
    objc_storeWeak((id *)&v12->_provider, v9);
    objc_storeStrong((id *)&v12->_identifier, a5);
    *((_BYTE *)v12 + 88) &= 0xF0u;
    size = CGRectNull.size;
    v12->_q_visibleBounds.origin = CGRectNull.origin;
    v12->_q_visibleBounds.size = size;
    v14 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 512, 512));
    q_trackerStateMap = v12->_q_trackerStateMap;
    v12->_q_trackerStateMap = (NSMapTable *)v14;

  }
  return v12;
}

- (id)children
{
  return -[NSMutableArray copy](self->_currentChildren, "copy");
}

- (void)updateSections
{
  double v3;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = sub_1C2AC();
  -[TUIVisibilityCollector updateSectionsAtTime:](self, "updateSectionsAtTime:", v3);
}

- (void)updateSectionsAtTime:(double)a3
{
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "visibilityProviderSections"));
  v7 = objc_msgSend(v6, "copy");

  v8 = objc_loadWeakRetained((id *)&self->_controller);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1C8FC;
  v10[3] = &unk_23D7D0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "queueUpdateForCollector:time:block:", self, v10, a3);

}

- (void)updateVisibleBounds
{
  double v3;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = sub_1C2AC();
  -[TUIVisibilityCollector updateVisibleBoundsAtTime:](self, "updateVisibleBoundsAtTime:", v3);
}

- (void)updateVisibleBoundsAtTime:(double)a3
{
  id WeakRetained;
  double v6;
  id v7;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  if (!objc_msgSend(WeakRetained, "visibilityProviderIsScrolling"))
  {

    goto LABEL_5;
  }
  v6 = a3 - self->_lastScrollUpdate;

  if (v6 > 0.1)
  {
LABEL_5:
    self->_lastScrollUpdate = a3;
    v7 = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(v7, "queueVisibleBoundsUpdateForCollector:time:", self, a3);

  }
}

- (void)teardown
{
  double v3;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = sub_1C2AC();
  -[TUIVisibilityCollector teardownAtTime:](self, "teardownAtTime:", v3);
}

- (void)teardownAtTime:(double)a3
{
  TUIVisibilityController **p_controller;
  id WeakRetained;
  void *v7;
  id v8;
  _QWORD v9[5];

  p_controller = &self->_controller;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1CACC;
  v9[3] = &unk_23D938;
  v9[4] = self;
  objc_msgSend(WeakRetained, "queueUpdateForCollector:time:block:", self, v9, a3);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVisibilityCollector parent](self, "parent"));
  objc_msgSend(v7, "_removeChild:", self);

  v8 = objc_loadWeakRetained((id *)p_controller);
  objc_msgSend(v8, "removeCollector:", self);

}

- (BOOL)_computeVisible
{
  id WeakRetained;
  unsigned __int8 v4;
  TUIVisibilityCollector **p_parent;
  id v6;
  void *v7;
  id v8;
  unsigned __int8 v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  v4 = objc_msgSend(WeakRetained, "visibilityProviderIsVisible");

  p_parent = &self->_parent;
  v6 = objc_loadWeakRetained((id *)&self->_parent);
  if (v6)
  {
    v7 = v6;
    v8 = objc_loadWeakRetained((id *)p_parent);
    v9 = objc_msgSend(v8, "_computeVisible");

    v4 &= v9;
  }
  return v4;
}

- (void)becameVisibleAtTime:(double)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "queueUpdateVisible:forCollector:time:", 1, self, a3);

}

- (void)becameHiddenAtTime:(double)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "queueUpdateVisible:forCollector:time:", 0, self, a3);

}

- (void)updateVisible
{
  double v3;

  v3 = sub_1C2AC();
  -[TUIVisibilityCollector updateVisibleAtTime:](self, "updateVisibleAtTime:", v3);
}

- (void)updateVisibleAtTime:(double)a3
{
  if (-[TUIVisibilityCollector _computeVisible](self, "_computeVisible"))
    -[TUIVisibilityCollector becameVisibleAtTime:](self, "becameVisibleAtTime:", a3);
  else
    -[TUIVisibilityCollector becameHiddenAtTime:](self, "becameHiddenAtTime:", a3);
}

- (void)_addChild:(id)a3
{
  id v4;
  NSMutableArray *currentChildren;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;
  id WeakRetained;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  if (v4)
  {
    currentChildren = self->_currentChildren;
    if (!currentChildren)
    {
      v6 = objc_opt_new(NSMutableArray);
      v7 = self->_currentChildren;
      self->_currentChildren = v6;

      currentChildren = self->_currentChildren;
    }
    -[NSMutableArray addObject:](currentChildren, "addObject:", v4);
    objc_msgSend(v4, "setParent:", self);
    v8 = -[NSMutableArray copy](self->_currentChildren, "copy");
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1CD58;
    v11[3] = &unk_23D7D0;
    v11[4] = self;
    v12 = v8;
    v10 = v8;
    objc_msgSend(WeakRetained, "queueUpdateWithBlock:", v11);

  }
}

- (void)_removeChild:(id)a3
{
  NSMutableArray *currentChildren;
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  _QWORD v9[5];
  id v10;

  if (a3)
  {
    currentChildren = self->_currentChildren;
    v5 = a3;
    -[NSMutableArray removeObjectIdenticalTo:](currentChildren, "removeObjectIdenticalTo:", v5);
    objc_msgSend(v5, "setParent:", 0);

    v6 = -[NSMutableArray copy](self->_currentChildren, "copy");
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1CE28;
    v9[3] = &unk_23D7D0;
    v9[4] = self;
    v10 = v6;
    v8 = v6;
    objc_msgSend(WeakRetained, "queueUpdateWithBlock:", v9);

  }
}

- (double)_now
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v4 = v3;

  return v4;
}

- (void)q_updateVisibleBounds:(CGRect)a3
{
  self->_q_visibleBounds = a3;
  *((_BYTE *)self + 88) |= 1u;
}

- (BOOL)q_updateVisible:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 88);
  if (((((v3 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 4;
    else
      v4 = 0;
    *((_BYTE *)self + 88) = v3 & 0xFB | v4;
  }
  return ((v3 & 4) == 0) ^ a3 ^ 1;
}

- (CGSize)q_visibleBoundsSize
{
  double width;
  double height;
  CGSize result;

  width = self->_q_visibleBounds.size.width;
  height = self->_q_visibleBounds.size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)q_computeChangeNodeForTracker:(id)a3 anyChange:(BOOL *)a4 rootVisibleSize:(CGSize)a5 needsUpdate:(BOOL)a6 needUpdateSet:(id)a7
{
  double height;
  double width;
  id v13;
  TUIVisibilityChangeNode *v14;
  _TUIVisibilityState *v15;
  unsigned int v16;
  NSSet *v17;
  NSDictionary *v18;
  uint64_t v19;
  void *v20;
  NSMutableDictionary *v21;
  NSArray *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  CGFloat x;
  CGFloat y;
  CGFloat v30;
  CGFloat v31;
  uint64_t v32;
  uint64_t v33;
  NSDictionary *v34;
  NSArray *v35;
  id v36;
  id v37;
  NSMutableDictionary *v38;
  uint64_t v39;
  void *j;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  BOOL v45;
  _TUIVisibilityState *v46;
  NSSet *visible;
  NSDictionary *v48;
  NSSet *v49;
  id v50;
  void *v51;
  NSSet *v52;
  unint64_t v53;
  void *v54;
  NSSet *v55;
  unint64_t v56;
  unint64_t v57;
  NSSet *v58;
  id v59;
  const char *v60;
  NSMutableDictionary *v61;
  NSMutableDictionary *v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  NSDictionary *attributesMap;
  NSDictionary *v70;
  void *v71;
  id v72;
  SEL v73;
  unint64_t v75;
  id v76;
  NSDictionary *v77;
  NSDictionary *v78;
  NSSet *v79;
  NSSet *v80;
  _TUIVisibilityState *v81;
  _TUIVisibilityState *v82;
  unsigned int v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[5];
  id v94;
  NSMutableDictionary *v95;
  uint64_t v96;
  uint64_t v97;
  double v98;
  double v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  CGRect v107;
  CGRect v108;

  height = a5.height;
  width = a5.width;
  v13 = a3;
  v84 = a7;
  if ((*((_BYTE *)self + 88) & 1) == 0)
  {
    v14 = 0;
    goto LABEL_93;
  }
  if (a6)
    v83 = 1;
  else
    v83 = objc_msgSend(v84, "containsObject:", self);
  v15 = (_TUIVisibilityState *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_q_trackerStateMap, "objectForKey:", v13));
  if (!v15)
  {
    v15 = objc_alloc_init(_TUIVisibilityState);
    -[NSMapTable setObject:forKey:](self->_q_trackerStateMap, "setObject:forKey:", v15, v13);
    v83 = 1;
    if (!v15)
    {
      v18 = 0;
      v17 = 0;
LABEL_9:
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v21 = objc_opt_new(NSMutableDictionary);
      if ((*((_BYTE *)self + 88) & 4) != 0 && (*((_BYTE *)self + 88) & 8) == 0 && width > 0.0 && height > 0.0)
      {
        v77 = v18;
        v80 = v17;
        v81 = v15;
        v102 = 0u;
        v103 = 0u;
        v100 = 0u;
        v101 = 0u;
        v22 = self->_q_sections;
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v100, v106, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v101;
          do
          {
            for (i = 0; i != v24; i = (char *)i + 1)
            {
              if (*(_QWORD *)v101 != v25)
                objc_enumerationMutation(v22);
              v27 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)i);
              objc_msgSend(v27, "frame");
              x = v107.origin.x;
              y = v107.origin.y;
              v30 = v107.size.width;
              v31 = v107.size.height;
              if (!CGRectIsEmpty(v107))
              {
                v108.origin.x = x;
                v108.origin.y = y;
                v108.size.width = v30;
                v108.size.height = v31;
                if (CGRectIntersectsRect(self->_q_visibleBounds, v108))
                {
                  objc_msgSend(v27, "frame");
                  v93[0] = _NSConcreteStackBlock;
                  v93[1] = 3221225472;
                  v93[2] = sub_1D5E0;
                  v93[3] = &unk_23DBB8;
                  v96 = v32;
                  v97 = v33;
                  v93[4] = self;
                  v98 = width;
                  v99 = height;
                  v94 = v20;
                  v95 = v21;
                  objc_msgSend(v13, "enumerateAttributesInSection:block:", v27, v93);

                }
              }
            }
            v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v100, v106, 16);
          }
          while (v24);
        }

        v17 = v80;
        v15 = v81;
        v18 = v77;
      }
      if (objc_msgSend(v20, "count"))
        v79 = (NSSet *)objc_msgSend(v20, "copy");
      else
        v79 = 0;

      if (-[NSMutableDictionary count](v21, "count"))
        v34 = (NSDictionary *)-[NSMutableDictionary copy](v21, "copy");
      else
        v34 = 0;

      v19 = 1;
      v18 = v34;
      goto LABEL_31;
    }
  }
  v16 = v83;
  v17 = v15->_visible;
  v18 = v15->_attributesMap;
  LOBYTE(v83) = 0;
  v19 = 0;
  v79 = v17;
  if (v16)
    goto LABEL_9;
LABEL_31:
  v78 = v18;
  v82 = v15;
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v35 = self->_q_children;
  v36 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v89, v105, 16);
  if (v36)
  {
    v37 = v36;
    v38 = 0;
    v39 = *(_QWORD *)v90;
    do
    {
      for (j = 0; j != v37; j = (char *)j + 1)
      {
        if (*(_QWORD *)v90 != v39)
          objc_enumerationMutation(v35);
        v41 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)j);
        v42 = objc_msgSend(v41, "q_computeChangeNodeForTracker:anyChange:rootVisibleSize:needsUpdate:needUpdateSet:", v13, a4, v19, v84, width, height);
        v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "identifier"));
        v44 = (void *)v43;
        if (v42)
          v45 = v43 == 0;
        else
          v45 = 1;
        if (!v45)
        {
          if (!v38)
            v38 = objc_opt_new(NSMutableDictionary);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v42, v44);
        }

      }
      v37 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v89, v105, 16);
    }
    while (v37);
  }
  else
  {
    v38 = 0;
  }

  if ((v83 & 1) != 0)
  {
    visible = 0;
    v46 = v82;
  }
  else
  {
    v46 = v82;
    visible = v82->_visible;
  }
  v48 = v78;
  v49 = v79;
  if (v79 == visible)
  {
    v53 = 0;
    v54 = 0;
  }
  else
  {
    if (v79)
    {
      v50 = -[NSSet mutableCopy](v79, "mutableCopy");
      v51 = v50;
      if ((v83 & 1) != 0)
        v52 = 0;
      else
        v52 = v46->_visible;
      objc_msgSend(v50, "minusSet:", v52);
      if (objc_msgSend(v51, "count"))
        v53 = (unint64_t)objc_msgSend(v51, "copy");
      else
        v53 = 0;
      if ((v83 & 1) != 0 || !v46->_visible)
      {
        v56 = 0;
      }
      else
      {
        v57 = v53;
        if ((v83 & 1) != 0)
          v58 = 0;
        else
          v58 = v46->_visible;
        v59 = -[NSSet mutableCopy](v58, "mutableCopy");
        objc_msgSend(v59, "minusSet:", v79);
        if (objc_msgSend(v59, "count"))
          v56 = (unint64_t)objc_msgSend(v59, "copy");
        else
          v56 = 0;

        v53 = v57;
      }

    }
    else
    {
      if ((v83 & 1) != 0)
        v55 = 0;
      else
        v55 = v46->_visible;
      v56 = v55;
      v53 = 0;
    }
    v76 = (id)v56;
    if (v53 | v56)
      *a4 = 1;
    v54 = (void *)v56;
    if (objc_msgSend((id)v56, "count"))
    {
      if (v78)
        v61 = (NSMutableDictionary *)-[NSDictionary mutableCopy](v78, "mutableCopy");
      else
        v61 = objc_opt_new(NSMutableDictionary);
      v62 = v61;
      v75 = v53;
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      v63 = (id)v56;
      v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v85, v104, 16);
      if (v64)
      {
        v65 = v64;
        v66 = *(_QWORD *)v86;
        do
        {
          v67 = 0;
          do
          {
            if (*(_QWORD *)v86 != v66)
              objc_enumerationMutation(v63);
            v68 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)v67);
            if ((v83 & 1) != 0)
              attributesMap = 0;
            else
              attributesMap = v82->_attributesMap;
            v70 = attributesMap;
            v71 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v70, "objectForKeyedSubscript:", v68));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v62, "setObject:forKeyedSubscript:", v71, v68);

            v67 = (char *)v67 + 1;
          }
          while (v65 != v67);
          v72 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v85, v104, 16);
          v65 = v72;
        }
        while (v72);
      }

      v48 = (NSDictionary *)-[NSMutableDictionary copy](v62, "copy");
      v49 = v79;
      v46 = v82;
      v53 = v75;
      v54 = v76;
    }
    if ((v83 & 1) == 0)
    {
      objc_setProperty_nonatomic_copy(v46, v60, v49, 8);
      objc_setProperty_nonatomic_copy(v46, v73, v48, 16);
    }
  }
  v14 = -[TUIVisibilityChangeNode initWithIdentifiers:added:removed:identifierNodeMap:attributesMap:]([TUIVisibilityChangeNode alloc], "initWithIdentifiers:added:removed:identifierNodeMap:attributesMap:", v49, v53, v54, v38, v48);

LABEL_93:
  return v14;
}

- (NSObject)identifier
{
  return self->_identifier;
}

- (TUIVisibilityProviding)provider
{
  return (TUIVisibilityProviding *)objc_loadWeakRetained((id *)&self->_provider);
}

- (void)setProvider:(id)a3
{
  objc_storeWeak((id *)&self->_provider, a3);
}

- (TUIVisibilityCollector)parent
{
  return (TUIVisibilityCollector *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_q_trackerStateMap, 0);
  objc_storeStrong((id *)&self->_q_sections, 0);
  objc_storeStrong((id *)&self->_q_children, 0);
  objc_storeStrong((id *)&self->_currentChildren, 0);
  objc_destroyWeak((id *)&self->_controller);
}

@end
