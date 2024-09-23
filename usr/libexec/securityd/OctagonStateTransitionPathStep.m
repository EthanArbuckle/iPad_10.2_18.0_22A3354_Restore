@implementation OctagonStateTransitionPathStep

- (id)initAsSuccess
{
  OctagonStateTransitionPathStep *v2;
  OctagonStateTransitionPathStep *v3;
  NSDictionary *followStates;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OctagonStateTransitionPathStep;
  v2 = -[OctagonStateTransitionPathStep init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_successState = 1;
    followStates = v2->_followStates;
    v2->_followStates = (NSDictionary *)&__NSDictionary0__struct;

  }
  return v3;
}

- (OctagonStateTransitionPathStep)initWithPath:(id)a3
{
  id v5;
  OctagonStateTransitionPathStep *v6;
  OctagonStateTransitionPathStep *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OctagonStateTransitionPathStep;
  v6 = -[OctagonStateTransitionPathStep init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_successState = 0;
    objc_storeStrong((id *)&v6->_followStates, a3);
  }

  return v7;
}

- (id)nextStep:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionPathStep followStates](self, "followStates"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionPathStep followStates](self, "followStates"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<OSTPath(%@)>"), v3));

  return v4;
}

- (BOOL)successState
{
  return self->_successState;
}

- (void)setSuccessState:(BOOL)a3
{
  self->_successState = a3;
}

- (NSDictionary)followStates
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followStates, 0);
}

+ (id)success
{
  return -[OctagonStateTransitionPathStep initAsSuccess]([OctagonStateTransitionPathStep alloc], "initAsSuccess");
}

+ (id)pathFromDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  _UNKNOWN **v9;
  void *i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _UNKNOWN **v15;
  void *v16;
  id v17;
  OctagonStateTransitionPathStep *v18;
  OctagonStateTransitionPathStep *v19;
  OctagonStateTransitionPathStep *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    v9 = &AAAccountClassPrimary_ptr;
    v22 = v5;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v11));
        v13 = objc_opt_class(OctagonStateTransitionPathStep);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);
        }
        else
        {
          v14 = objc_opt_class(v9[294]);
          if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0)
          {
            v15 = v9;
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep pathFromDictionary:](OctagonStateTransitionPathStep, "pathFromDictionary:", v12));
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, v11);

            v9 = v15;
            v5 = v22;
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  v17 = objc_msgSend(v4, "count");
  v18 = [OctagonStateTransitionPathStep alloc];
  if (v17)
    v19 = -[OctagonStateTransitionPathStep initWithPath:](v18, "initWithPath:", v4);
  else
    v19 = -[OctagonStateTransitionPathStep initAsSuccess](v18, "initAsSuccess");
  v20 = v19;

  return v20;
}

@end
