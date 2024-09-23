@implementation OctagonStateTransitionPath

- (OctagonStateTransitionPath)initWithState:(id)a3 pathStep:(id)a4
{
  id v7;
  id v8;
  OctagonStateTransitionPath *v9;
  OctagonStateTransitionPath *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OctagonStateTransitionPath;
  v9 = -[OctagonStateTransitionPath init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_initialState, a3);
    objc_storeStrong((id *)&v10->_pathStep, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionPath initialState](self, "initialState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionPath pathStep](self, "pathStep"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<OctagonStateTransitionPath: %@ %@"), v3, v4));

  return v5;
}

- (id)asPathStep
{
  OctagonStateTransitionPathStep *v3;
  void *v4;
  void *v5;
  void *v6;
  OctagonStateTransitionPathStep *v7;
  void *v9;
  void *v10;

  v3 = [OctagonStateTransitionPathStep alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionPath initialState](self, "initialState"));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionPath pathStep](self, "pathStep"));
  v10 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  v7 = -[OctagonStateTransitionPathStep initWithPath:](v3, "initWithPath:", v6);

  return v7;
}

- (OctagonStateString)initialState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInitialState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OctagonStateTransitionPathStep)pathStep
{
  return (OctagonStateTransitionPathStep *)objc_getProperty(self, a2, 16, 1);
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
  OctagonStateTransitionPath *v13;
  OctagonStateTransitionPath *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v5)
  {
    v13 = 0;
    goto LABEL_15;
  }
  v6 = v5;
  v7 = *(_QWORD *)v18;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v9));
      v11 = objc_opt_class(OctagonStateTransitionPathStep);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
      {
        v13 = -[OctagonStateTransitionPath initWithState:pathStep:]([OctagonStateTransitionPath alloc], "initWithState:pathStep:", v9, v10);
LABEL_14:

        goto LABEL_15;
      }
      v12 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
      {
        v14 = [OctagonStateTransitionPath alloc];
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep pathFromDictionary:](OctagonStateTransitionPathStep, "pathFromDictionary:", v10));
        v13 = -[OctagonStateTransitionPath initWithState:pathStep:](v14, "initWithState:pathStep:", v9, v15);

        goto LABEL_14;
      }

    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    v13 = 0;
    if (v6)
      continue;
    break;
  }
LABEL_15:

  return v13;
}

@end
