@implementation DMDActivationPredicateCompound

- (DMDActivationPredicateCompound)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 subPredicateObservers:(id)a5 predicate:(id)a6
{
  id v10;
  DMDActivationPredicateCompound *v11;
  NSArray *v12;
  NSArray *subPredicateObservers;
  objc_super v15;

  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)DMDActivationPredicateCompound;
  v11 = -[DMDActivationPredicateObserver initWithDelegate:uniqueIdentifier:predicate:](&v15, "initWithDelegate:uniqueIdentifier:predicate:", a3, a4, a6);
  if (v11)
  {
    v12 = (NSArray *)objc_msgSend(v10, "copy");
    subPredicateObservers = v11->_subPredicateObservers;
    v11->_subPredicateObservers = v12;

  }
  return v11;
}

- (void)updateObserverRegistration
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];

  v12.receiver = self;
  v12.super_class = (Class)DMDActivationPredicateCompound;
  -[DMDActivationPredicateObserver updateObserverRegistration](&v12, "updateObserverRegistration");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateCompound subPredicateObservers](self, "subPredicateObservers", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "updateObserverRegistration");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (void)invalidate
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateCompound subPredicateObservers](self, "subPredicateObservers"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "invalidate");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)DMDActivationPredicateCompound;
  -[DMDActivationPredicateObserver invalidate](&v8, "invalidate");
}

- (id)metadata
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];

  v18.receiver = self;
  v18.super_class = (Class)DMDActivationPredicateCompound;
  v3 = -[DMDActivationPredicateObserver metadata](&v18, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateCompound subPredicateObservers](self, "subPredicateObservers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateCompound subPredicateObservers](self, "subPredicateObservers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11), "metadata"));
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, DMFDeclarationStatePredicateSubPredicatesKey);

  return v4;
}

- (void)reportActivationPredicateObserverDidTrigger
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];

  v12.receiver = self;
  v12.super_class = (Class)DMDActivationPredicateCompound;
  -[DMDActivationPredicateObserver reportActivationPredicateObserverDidTrigger](&v12, "reportActivationPredicateObserverDidTrigger");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateCompound subPredicateObservers](self, "subPredicateObservers", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "reportActivationPredicateObserverDidTrigger");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (NSArray)subPredicateObservers
{
  return self->_subPredicateObservers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subPredicateObservers, 0);
}

@end
