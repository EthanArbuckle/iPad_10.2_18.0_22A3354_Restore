@implementation DMDActivationPredicateAny

- (id)evaluatePredicateWithError:(id *)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  unsigned int v29;
  _BYTE v30[128];

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateCompound subPredicateObservers](self, "subPredicateObservers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v9), "evaluatePredicateWithError:", a3));
        if (!v10)
        {

          return 0;
        }
        v11 = v10;
        v12 = objc_msgSend(v10, "BOOLValue");

        if ((v12 & 1) != 0)
        {
          v13 = 1;
          goto LABEL_13;
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_13:

  v15 = DMFConfigurationEngineLog(-[DMDActivationPredicateObserver setLastPredicateEvaluationValue:](self, "setLastPredicateEvaluationValue:", v13));
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
    v19 = -[DMDActivationPredicateObserver lastPredicateEvaluationValue](self, "lastPredicateEvaluationValue");
    *(_DWORD *)buf = 138543874;
    v25 = v17;
    v26 = 2114;
    v27 = v18;
    v28 = 1024;
    v29 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Predicate type: %{public}@ with unique identifier: %{public}@ evaluated predicate: %d", buf, 0x1Cu);

  }
  return (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[DMDActivationPredicateObserver lastPredicateEvaluationValue](self, "lastPredicateEvaluationValue")));
}

@end
