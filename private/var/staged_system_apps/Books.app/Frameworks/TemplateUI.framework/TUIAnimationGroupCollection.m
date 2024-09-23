@implementation TUIAnimationGroupCollection

- (id)copyWithZone:(_NSZone *)a3
{
  TUIAnimationGroupCollection *v4;
  NSDictionary *v5;
  NSDictionary *groups;

  v4 = -[TUIAnimationGroupCollection init](+[TUIAnimationGroupCollection allocWithZone:](TUIAnimationGroupCollection, "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = (NSDictionary *)-[NSDictionary copy](self->_groups, "copy");
    groups = v4->_groups;
    v4->_groups = v5;

  }
  return v4;
}

- (NSDictionary)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groups, 0);
}

- (id)generateAllGroupRenderModelsFromSource:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  TUIAnimationGroupRenderModelCollection *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v17 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAnimationGroupCollection groups](self, "groups"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "generateAnimationRenderModelsForAllPhasesFromSource:", v4));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "phaseRenderModels"));
        v14 = objc_msgSend(v13, "count");

        if (v14)
          objc_msgSend(v17, "setObject:forKey:", v12, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }
  if (objc_msgSend(v17, "count"))
  {
    v15 = objc_alloc_init(TUIAnimationGroupRenderModelCollection);
    -[TUIAnimationGroupRenderModelCollection setGroupPhases:](v15, "setGroupPhases:", v17);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
