@implementation _DASTaskDependencyGraph

- (id)initTaskGraph
{
  _DASTaskDependencyGraph *v2;
  uint64_t v3;
  NSMutableDictionary *graph;
  uint64_t v5;
  NSMutableDictionary *taskNodeMap;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_DASTaskDependencyGraph;
  v2 = -[_DASTaskDependencyGraph init](&v14, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    graph = v2->_graph;
    v2->_graph = (NSMutableDictionary *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    taskNodeMap = v2->_taskNodeMap;
    v2->_taskNodeMap = (NSMutableDictionary *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_create("com.apple.dasd.taskDependencyGraph", v10);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v11;

  }
  return v2;
}

- (void)addTaskNodeToGraph:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100089CA0;
  block[3] = &unk_10015D558;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (void)addDependencyEdgeFrom:(id)a3 to:(id)a4
{
  id v6;
  OS_dispatch_queue *queue;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v8 = a3;
  v6 = a4;
  if (v8 && v6)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100089E20;
    block[3] = &unk_10015D530;
    block[4] = self;
    v10 = v8;
    v11 = v6;
    dispatch_sync((dispatch_queue_t)queue, block);

  }
}

- (id)nodeForTaskIdentifier:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10008A030;
  v16 = sub_10008A040;
  v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008A048;
  block[3] = &unk_10015DB40;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)constructTaskDependencyGraphForTask:(id)a3 dependencyDataMap:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _DASTaskDependencyGraphNode *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *k;
  uint64_t v33;
  void *v34;
  _DASTaskDependencyGraphNode *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *m;
  _DASTaskDependencyGraphNode *v41;
  _DASTaskDependencyGraphNode *v43;
  id v44;
  uint64_t v45;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  id v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];

  v44 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v7 = v5;
  v48 = v7;
  v52 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
  if (v52)
  {
    v50 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v52; i = (char *)i + 1)
      {
        if (*(_QWORD *)v67 != v50)
          objc_enumerationMutation(v7);
        v9 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "producedResultIdentifiers"));

        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v63;
          do
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(_QWORD *)v63 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)j);
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v17));

              if (!v18)
              {
                v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
                objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, v17);

              }
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v17));
              objc_msgSend(v20, "addObject:", v9);

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
          }
          while (v14);
        }

        v7 = v48;
      }
      v52 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
    }
    while (v52);
  }
  v49 = v6;

  v21 = -[_DASTaskDependencyGraph initTaskGraph](self, "initTaskGraph");
  v22 = -[_DASTaskDependencyGraphNode initWithIdentifier:]([_DASTaskDependencyGraphNode alloc], "initWithIdentifier:", v44);
  objc_msgSend(v21, "addTaskNodeToGraph:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v22));
  v43 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v22));
  v25 = v24;
LABEL_18:
  if (objc_msgSend(v24, "count"))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "firstObject"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "taskIdentifier"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v27));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "dependencyIdentifiers"));

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v30 = v29;
    v51 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
    if (!v51)
      goto LABEL_45;
    v31 = *(_QWORD *)v59;
    v45 = *(_QWORD *)v59;
    v47 = v30;
    while (1)
    {
      for (k = 0; k != v51; k = (char *)k + 1)
      {
        if (*(_QWORD *)v59 != v31)
          objc_enumerationMutation(v30);
        v33 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)k);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v33));

        if (v34)
        {
          v53 = k;
          v35 = (_DASTaskDependencyGraphNode *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "nodeForTaskIdentifier:", v33));
          if (!v35)
            v35 = -[_DASTaskDependencyGraphNode initWithIdentifier:]([_DASTaskDependencyGraphNode alloc], "initWithIdentifier:", v33);
          objc_msgSend(v21, "addDependencyEdgeFrom:to:", v26, v35);
          if ((objc_msgSend(v23, "containsObject:", v35) & 1) == 0)
          {
            objc_msgSend(v23, "addObject:", v35);
            objc_msgSend(v25, "addObject:", v35);
          }
        }
        else
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKey:", v33));

          if (!v36)
            continue;
          v53 = k;
          v35 = (_DASTaskDependencyGraphNode *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", v33));
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v37 = -[_DASTaskDependencyGraphNode countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
          if (v37)
          {
            v38 = v37;
            v39 = *(_QWORD *)v55;
            do
            {
              for (m = 0; m != v38; m = (char *)m + 1)
              {
                if (*(_QWORD *)v55 != v39)
                  objc_enumerationMutation(v35);
                v41 = (_DASTaskDependencyGraphNode *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "nodeForTaskIdentifier:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)m)));
                if (!v41)
                  v41 = -[_DASTaskDependencyGraphNode initWithIdentifier:]([_DASTaskDependencyGraphNode alloc], "initWithIdentifier:", v33);
                objc_msgSend(v21, "addDependencyEdgeFrom:to:", v26, v41);
                if ((objc_msgSend(v23, "containsObject:", v41) & 1) == 0)
                {
                  objc_msgSend(v23, "addObject:", v41);
                  objc_msgSend(v25, "addObject:", v41);
                }

              }
              v38 = -[_DASTaskDependencyGraphNode countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
            }
            while (v38);
            v30 = v47;
            v7 = v48;
            v31 = v45;
          }
        }

        k = v53;
      }
      v51 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
      if (!v51)
      {
LABEL_45:

        objc_msgSend(v25, "removeObjectAtIndex:", 0);
        v24 = v25;
        goto LABEL_18;
      }
    }
  }

  return v21;
}

- (NSMutableDictionary)graph
{
  return self->_graph;
}

- (void)setGraph:(id)a3
{
  objc_storeStrong((id *)&self->_graph, a3);
}

- (NSMutableDictionary)taskNodeMap
{
  return self->_taskNodeMap;
}

- (void)setTaskNodeMap:(id)a3
{
  objc_storeStrong((id *)&self->_taskNodeMap, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_taskNodeMap, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

@end
