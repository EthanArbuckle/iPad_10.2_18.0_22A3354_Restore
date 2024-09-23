@implementation TUIGuideLayoutController

- (TUIGuideLayoutController)init
{
  TUIGuideLayoutController *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *guides;
  uint64_t v5;
  NSMapTable *nodes;
  NSMutableArray *v7;
  NSMutableArray *edges;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TUIGuideLayoutController;
  v2 = -[TUIGuideLayoutController init](&v10, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    guides = v2->_guides;
    v2->_guides = v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 512, 0));
    nodes = v2->_nodes;
    v2->_nodes = (NSMapTable *)v5;

    v7 = objc_opt_new(NSMutableArray);
    edges = v2->_edges;
    v2->_edges = v7;

  }
  return v2;
}

- (void)reset
{
  -[NSMutableArray removeAllObjects](self->_edges, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_nodes, "removeAllObjects");
  -[TUIGuideLayoutController setLayoutPhase:](self, "setLayoutPhase:", 0);
}

- (void)setLayoutPhase:(unint64_t)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (self->_layoutPhase != a3)
  {
    self->_layoutPhase = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "guideLayoutController:changedPhase:", self, a3);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (id)guideForSpec:(id)a3
{
  id v4;
  void *v5;
  _TUIGuideInstance *v6;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "kind") == (char *)&dword_0 + 1)
    {
      v6 = -[_TUIGuideInstance initWithSpec:]([_TUIGuideInstance alloc], "initWithSpec:", v5);
    }
    else
    {
      v6 = (_TUIGuideInstance *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_guides, "objectForKeyedSubscript:", v5));
      if (!v6)
      {
        v6 = -[_TUIGuideInstance initWithSpec:]([_TUIGuideInstance alloc], "initWithSpec:", v5);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_guides, "setObject:forKeyedSubscript:", v6, v5);
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)guideForSpec:(id)a3 withOffset:(double)a4
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIGuideLayoutController guideForSpec:](self, "guideForSpec:", a3));
  objc_msgSend(v5, "setOffset:", a4);
  return v5;
}

- (id)_nodeFromGuide:(id)a3
{
  id v4;
  _TUIGuideNode *v5;

  v4 = a3;
  v5 = (_TUIGuideNode *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_nodes, "objectForKey:", v4));
  if (!v5)
  {
    v5 = objc_opt_new(_TUIGuideNode);
    -[NSMapTable setObject:forKey:](self->_nodes, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (void)addEdgeFrom:(id)a3 to:(id)a4 length:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  id v10;
  void *v11;
  _TUIGuideEdge *v12;
  void *v13;
  void *v14;
  id v15;

  if (!self->_layoutPhase)
  {
    v6 = v5;
    v10 = a4;
    v15 = (id)objc_claimAutoreleasedReturnValue(-[TUIGuideLayoutController _nodeFromGuide:](self, "_nodeFromGuide:", a3));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIGuideLayoutController _nodeFromGuide:](self, "_nodeFromGuide:", v10));

    v12 = objc_opt_new(_TUIGuideEdge);
    -[_TUIGuideEdge setTo:](v12, "setTo:", v11);
    -[_TUIGuideEdge setLength:](v12, "setLength:", a5, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "edges"));
    objc_msgSend(v13, "addObject:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dependencies"));
    objc_msgSend(v14, "addObject:", v15);

    -[NSMutableArray addObject:](self->_edges, "addObject:", v12);
  }
}

- (double)offsetForGuide:(id)a3
{
  void *v3;
  void *v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIGuideLayoutController _nodeFromGuide:](self, "_nodeFromGuide:", a3));
  v4 = v3;
  if (v3)
    v5 = COERCE_FLOAT(objc_msgSend(v3, "accumulatedLength"));
  else
    v5 = 0.0;

  return v5;
}

- (void)solve
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  void *v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  TUIGuideLayoutController *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v28 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_nodes, "objectEnumerator"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dependencies"));
        v12 = objc_msgSend(v11, "count");

        if (!v12)
          objc_msgSend(v3, "addObject:", v10);
        objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v7);
  }
  v29 = v4;

  if (objc_msgSend(v3, "count"))
  {
    do
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "anyObject"));
      v14 = v3;
      objc_msgSend(v3, "removeObject:", v13);
      objc_msgSend(v29, "removeObject:", v13);
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "edges"));
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (!v16)
        goto LABEL_26;
      v17 = v16;
      v18 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)j);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "to"));
          v22 = fmaxf(COERCE_FLOAT(objc_msgSend(v21, "accumulatedLength")), COERCE_FLOAT(objc_msgSend(v13, "accumulatedLength")) + COERCE_FLOAT(objc_msgSend(v20, "length")));
          if (v22 <= -3.4028e38)
          {
            v24 = 4286578687;
          }
          else
          {
            if (v22 < 3.4028e38)
            {
              v23 = LODWORD(v22) | 0x7FC0000000000000;
              goto LABEL_22;
            }
            v24 = 2139095039;
          }
          v23 = v24 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000;
LABEL_22:
          objc_msgSend(v21, "setAccumulatedLength:", v23, 2143289344);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dependencies"));
          objc_msgSend(v25, "removeObject:", v13);

          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dependencies"));
          v27 = objc_msgSend(v26, "count");

          if (!v27)
            objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v17);
LABEL_26:

      v3 = v14;
    }
    while (objc_msgSend(v14, "count"));
  }
  -[TUIGuideLayoutController _enumerateSolution:](v28, "_enumerateSolution:", &stru_23ED28);
  -[TUIGuideLayoutController setLayoutPhase:](v28, "setLayoutPhase:", 1);

}

- (double)computeLength
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  double v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_nodes, "objectEnumerator", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v6 = fmax(v6, COERCE_FLOAT(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "accumulatedLength")));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (void)_enumerateSolution:(id)a3
{
  void (**v4)(id, _QWORD, double);
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = (void (**)(id, _QWORD, double))a3;
  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_nodes, "keyEnumerator", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_nodes, "objectForKey:", v10));
          v4[2](v4, v10, COERCE_FLOAT(objc_msgSend(v11, "accumulatedLength")));

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (unint64_t)layoutPhase
{
  return self->_layoutPhase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_guides, 0);
  objc_storeStrong((id *)&self->_edges, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

@end
