@implementation DMDActivationPredicateNot

- (DMDActivationPredicateNot)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 subPredicateObserver:(id)a5 predicate:(id)a6
{
  id v11;
  DMDActivationPredicateNot *v12;
  DMDActivationPredicateNot *v13;
  objc_super v15;

  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)DMDActivationPredicateNot;
  v12 = -[DMDActivationPredicateObserver initWithDelegate:uniqueIdentifier:predicate:](&v15, "initWithDelegate:uniqueIdentifier:predicate:", a3, a4, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_subPredicateObserver, a5);

  return v13;
}

- (id)evaluatePredicateWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  unsigned int v18;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateNot subPredicateObserver](self, "subPredicateObserver"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "evaluatePredicateWithError:", a3));

  if (v6)
  {
    v7 = DMFConfigurationEngineLog(-[DMDActivationPredicateObserver setLastPredicateEvaluationValue:](self, "setLastPredicateEvaluationValue:", objc_msgSend(v6, "BOOLValue") ^ 1));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
      v13 = 138543874;
      v14 = v9;
      v15 = 2114;
      v16 = v10;
      v17 = 1024;
      v18 = -[DMDActivationPredicateObserver lastPredicateEvaluationValue](self, "lastPredicateEvaluationValue");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Predicate type: %{public}@ with unique identifier: %{public}@ evaluated predicate: %d", (uint8_t *)&v13, 0x1Cu);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[DMDActivationPredicateObserver lastPredicateEvaluationValue](self, "lastPredicateEvaluationValue")));
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)metadata
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  void *v10;

  v9.receiver = self;
  v9.super_class = (Class)DMDActivationPredicateNot;
  v3 = -[DMDActivationPredicateObserver metadata](&v9, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateNot subPredicateObserver](self, "subPredicateObserver"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metadata"));

  if (v6)
  {
    v10 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, DMFDeclarationStatePredicateSubPredicatesKey);

  }
  return v4;
}

- (DMDActivationPredicateObserver)subPredicateObserver
{
  return self->_subPredicateObserver;
}

- (void)setSubPredicateObserver:(id)a3
{
  objc_storeStrong((id *)&self->_subPredicateObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subPredicateObserver, 0);
}

@end
