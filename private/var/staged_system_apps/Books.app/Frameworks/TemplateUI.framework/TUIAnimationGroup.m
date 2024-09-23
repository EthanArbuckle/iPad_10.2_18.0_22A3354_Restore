@implementation TUIAnimationGroup

- (id)copyWithZone:(_NSZone *)a3
{
  TUIAnimationGroup *v4;
  NSDictionary *v5;
  NSDictionary *phases;

  v4 = -[TUIAnimationGroup init](+[TUIAnimationGroup allocWithZone:](TUIAnimationGroup, "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = (NSDictionary *)-[NSDictionary copy](self->_phases, "copy");
    phases = v4->_phases;
    v4->_phases = v5;

  }
  return v4;
}

- (id)description
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  NSDictionary *phases;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v3 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v3, "addObject:", CFSTR("<"));
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %p"), self));
  objc_msgSend(v3, "addObject:", v7);

  objc_msgSend(v3, "addObject:", CFSTR(" phases: { "));
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  phases = self->_phases;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_769C8;
  v12[3] = &unk_23FE08;
  v14 = &v15;
  v9 = v3;
  v13 = v9;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](phases, "enumerateKeysAndObjectsUsingBlock:", v12);
  if (*((_BYTE *)v16 + 24))
    objc_msgSend(v9, "addObject:", CFSTR(" "));
  objc_msgSend(v9, "addObject:", CFSTR("}>"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsJoinedByString:", &stru_243BF0));

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (NSDictionary)phases
{
  return self->_phases;
}

- (void)setPhases:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phases, 0);
}

- (id)_generateModelsForPhase:(id)a3 sourceRenderModel:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)NSMutableArray);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAnimationGroup phases](self, "phases"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v6));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "animations", 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v15), "generateRenderModelsFromSource:", v7));
        if (v16)
        {
          objc_msgSend(v10, "delay");
          objc_msgSend(v10, "delay");
          objc_msgSend(v16, "setDelay:");
          objc_msgSend(v10, "duration");
          objc_msgSend(v10, "duration");
          objc_msgSend(v16, "setDuration:");
          objc_msgSend(v16, "setOptions:", (unint64_t)objc_msgSend(v16, "options") | (unint64_t)objc_msgSend(v10, "options"));
          objc_msgSend(v8, "addObject:", v16);
        }

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  if (!objc_msgSend(v8, "count"))
  {

    v8 = 0;
  }

  return v8;
}

- (id)generateAnimationRenderModelsForAllPhasesFromSource:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  TUIAnimationGroupPhaseRenderModelCollection *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAnimationGroup phases](self, "phases", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAnimationGroup _generateModelsForPhase:sourceRenderModel:](self, "_generateModelsForPhase:sourceRenderModel:", v11, v4));
        if (objc_msgSend(v12, "count"))
          objc_msgSend(v5, "setObject:forKey:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    v13 = objc_alloc_init(TUIAnimationGroupPhaseRenderModelCollection);
    -[TUIAnimationGroupPhaseRenderModelCollection setPhaseRenderModels:](v13, "setPhaseRenderModels:", v5);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
