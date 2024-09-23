@implementation KTStateTransitionPath

- (KTStateTransitionPath)initWithState:(id)a3 pathStep:(id)a4
{
  id v7;
  id v8;
  KTStateTransitionPath *v9;
  KTStateTransitionPath *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)KTStateTransitionPath;
  v9 = -[KTStateTransitionPath init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_initialState, a3);
    objc_storeStrong((id *)&v10->_pathStep, a4);
  }

  return v10;
}

- (id)asPathStep
{
  KTStateTransitionPathStep *v3;
  void *v4;
  void *v5;
  void *v6;
  KTStateTransitionPathStep *v7;
  void *v9;
  void *v10;

  v3 = [KTStateTransitionPathStep alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionPath initialState](self, "initialState"));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionPath pathStep](self, "pathStep"));
  v10 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  v7 = -[KTStateTransitionPathStep initWithPath:](v3, "initWithPath:", v6);

  return v7;
}

+ (id)pathFromDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  KTStateTransitionPath *v15;
  KTStateTransitionPath *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v5)
  {
    v15 = 0;
    goto LABEL_15;
  }
  v6 = v5;
  v7 = *(_QWORD *)v20;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(_QWORD *)v20 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v9));
      v12 = objc_opt_class(KTStateTransitionPathStep, v11);
      if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
      {
        v15 = -[KTStateTransitionPath initWithState:pathStep:]([KTStateTransitionPath alloc], "initWithState:pathStep:", v9, v10);
LABEL_14:

        goto LABEL_15;
      }
      v14 = objc_opt_class(NSDictionary, v13);
      if ((objc_opt_isKindOfClass(v10, v14) & 1) != 0)
      {
        v16 = [KTStateTransitionPath alloc];
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionPathStep pathFromDictionary:](KTStateTransitionPathStep, "pathFromDictionary:", v10));
        v15 = -[KTStateTransitionPath initWithState:pathStep:](v16, "initWithState:pathStep:", v9, v17);

        goto LABEL_14;
      }

    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    v15 = 0;
    if (v6)
      continue;
    break;
  }
LABEL_15:

  return v15;
}

- (KTStateString)initialState
{
  return (KTStateString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInitialState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (KTStateTransitionPathStep)pathStep
{
  return (KTStateTransitionPathStep *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPathStep:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathStep, 0);
  objc_storeStrong((id *)&self->_initialState, 0);
}

@end
