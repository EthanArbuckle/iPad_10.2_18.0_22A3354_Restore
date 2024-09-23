@implementation PGMomentNodeRuleInterpreter

- (PGMomentNodeRuleInterpreter)initWithGraph:(id)a3
{
  id v5;
  PGMomentNodeRuleInterpreter *v6;
  PGMomentNodeRuleInterpreter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGMomentNodeRuleInterpreter;
  v6 = -[PGMomentNodeRuleInterpreter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_graph, a3);

  return v7;
}

- (id)evaluateObjects:(id)a3 forCondition:(id)a4
{
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "type");
  if (v8 == 2)
  {
    -[PGMomentNodeRuleInterpreter evaluateMomentNodes:forPersonCondition:](self, "evaluateMomentNodes:forPersonCondition:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8 == 1)
      -[PGMomentNodeRuleInterpreter evaluateMomentNodes:forDateRangeCondition:](self, "evaluateMomentNodes:forDateRangeCondition:", v6, v7);
    else
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (id)evaluateMomentNodes:(id)a3 forDateRangeCondition:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "predicateWithFormat:", CFSTR("localStartDate >= %@ && localEndDate <= %@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredSetUsingPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)evaluateMomentNodes:(id)a3 forPersonCondition:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v26;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a4, "personUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x1E0CD16C0], "localIdentifierWithUUID:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v13);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v10);
  }

  +[PGGraphPersonNodeCollection personNodesForArrayOfLocalIdentifiers:inGraph:](PGGraphPersonNodeCollection, "personNodesForArrayOfLocalIdentifiers:inGraph:", v8, self->_graph);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v15, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v26 = v6;
  v27 = v6;
  v17 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (!v17)
    goto LABEL_20;
  v18 = v17;
  v19 = *(_QWORD *)v30;
  do
  {
    for (j = 0; j != v18; ++j)
    {
      if (*(_QWORD *)v30 != v19)
        objc_enumerationMutation(v27);
      v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
      objc_msgSend(v21, "consolidatedPersonNodesPresentInAssets");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "intersectsSet:", v15))
      {

      }
      else
      {
        objc_msgSend(v21, "personNodesInProximity");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "intersectsSet:", v15);

        if (!v24)
          continue;
      }
      objc_msgSend(v16, "addObject:", v21);
    }
    v18 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  }
  while (v18);
LABEL_20:

  v6 = v26;
LABEL_22:

  return v16;
}

- (PGGraph)graph
{
  return self->_graph;
}

- (void)setGraph:(id)a3
{
  objc_storeStrong((id *)&self->_graph, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
}

@end
