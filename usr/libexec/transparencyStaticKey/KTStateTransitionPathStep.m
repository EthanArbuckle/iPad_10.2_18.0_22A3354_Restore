@implementation KTStateTransitionPathStep

- (id)initAsSuccess
{
  KTStateTransitionPathStep *v2;
  KTStateTransitionPathStep *v3;
  NSDictionary *followStates;
  NSError *expectedFailure;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)KTStateTransitionPathStep;
  v2 = -[KTStateTransitionPathStep init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_successState = 1;
    followStates = v2->_followStates;
    v2->_followStates = (NSDictionary *)&__NSDictionary0__struct;

    expectedFailure = v3->_expectedFailure;
    v3->_expectedFailure = 0;

  }
  return v3;
}

- (KTStateTransitionPathStep)initWithPath:(id)a3
{
  id v5;
  KTStateTransitionPathStep *v6;
  KTStateTransitionPathStep *v7;
  NSError *expectedFailure;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)KTStateTransitionPathStep;
  v6 = -[KTStateTransitionPathStep init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    v6->_successState = 0;
    objc_storeStrong((id *)&v6->_followStates, a3);
    expectedFailure = v7->_expectedFailure;
    v7->_expectedFailure = 0;

  }
  return v7;
}

- (KTStateTransitionPathStep)initWithExpectedFailure:(id)a3 withPath:(id)a4
{
  id v7;
  id v8;
  KTStateTransitionPathStep *v9;
  KTStateTransitionPathStep *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)KTStateTransitionPathStep;
  v9 = -[KTStateTransitionPathStep init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    v9->_successState = 0;
    objc_storeStrong((id *)&v9->_followStates, a4);
    objc_storeStrong((id *)&v10->_expectedFailure, a3);
  }

  return v10;
}

- (id)nextStep:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionPathStep followStates](self, "followStates"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionPathStep followStates](self, "followStates"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<OSTPath(%@)>"), v3));

  return v4;
}

+ (id)success
{
  return -[KTStateTransitionPathStep initAsSuccess]([KTStateTransitionPathStep alloc], "initAsSuccess");
}

+ (id)pathFromDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void (__cdecl **v9)(CFDictionaryRef, CFDictionaryApplierFunction, void *);
  void *i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (__cdecl **v17)(CFDictionaryRef, CFDictionaryApplierFunction, void *);
  void *v18;
  id v19;
  KTStateTransitionPathStep *v20;
  KTStateTransitionPathStep *v21;
  KTStateTransitionPathStep *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    v9 = &CFDictionaryApplyFunction_ptr;
    v24 = v5;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v11));
        v14 = objc_opt_class(KTStateTransitionPathStep, v13);
        if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0)
        {
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);
        }
        else
        {
          v16 = objc_opt_class(v9[40], v15);
          if ((objc_opt_isKindOfClass(v12, v16) & 1) != 0)
          {
            v17 = v9;
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionPathStep pathFromDictionary:](KTStateTransitionPathStep, "pathFromDictionary:", v12));
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, v11);

            v9 = v17;
            v5 = v24;
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }

  v19 = objc_msgSend(v4, "count");
  v20 = [KTStateTransitionPathStep alloc];
  if (v19)
    v21 = -[KTStateTransitionPathStep initWithPath:](v20, "initWithPath:", v4);
  else
    v21 = -[KTStateTransitionPathStep initAsSuccess](v20, "initAsSuccess");
  v22 = v21;

  return v22;
}

+ (id)failure:(id)a3 pathFromDictionary:(id)a4
{
  id v5;
  _QWORD *v6;
  void *v7;

  v5 = a3;
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionPathStep pathFromDictionary:](KTStateTransitionPathStep, "pathFromDictionary:", a4));
  v7 = (void *)v6[3];
  v6[3] = v5;

  return v6;
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

- (NSError)expectedFailure
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedFailure, 0);
  objc_storeStrong((id *)&self->_followStates, 0);
}

@end
