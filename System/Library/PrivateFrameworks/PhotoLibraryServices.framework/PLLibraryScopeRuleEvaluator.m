@implementation PLLibraryScopeRuleEvaluator

- (PLLibraryScopeRuleEvaluator)initWithRules:(id)a3 andInterpreter:(id)a4
{
  id v6;
  id v7;
  PLLibraryScopeRuleEvaluator *v8;
  PLLibraryScopeRuleEvaluator *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLLibraryScopeRuleEvaluator;
  v8 = -[PLLibraryScopeRuleEvaluator init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PLLibraryScopeRuleEvaluator setRules:](v8, "setRules:", v6);
    -[PLLibraryScopeRuleEvaluator setInterpreter:](v9, "setInterpreter:", v7);
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)PLLibraryScopeRuleEvaluator;
  -[PLLibraryScopeRuleEvaluator description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLibraryScopeRuleEvaluator interpreter](self, "interpreter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLibraryScopeRuleEvaluator rules](self, "rules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - interpreter: %@ rules: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)evaluateObjects:(id)a3 withResultEnumerationBlock:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t m;
  void *v41;
  id obj;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *context;
  void (**v47)(id, _QWORD, uint64_t, void *);
  id v48;
  id v49;
  PLLibraryScopeRuleEvaluator *v50;
  uint64_t v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  void *v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v47 = (void (**)(id, _QWORD, uint64_t, void *))a4;
  v41 = v6;
  v52 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v50 = self;
  -[PLLibraryScopeRuleEvaluator rules](self, "rules");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
  if (v44)
  {
    v43 = *(_QWORD *)v70;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v70 != v43)
        objc_enumerationMutation(obj);
      v45 = v8;
      v9 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v8);
      context = (void *)MEMORY[0x19AEC1554]();
      objc_msgSend(v9, "allConditions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v49 = v10;
      v11 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
      if (v11)
      {
        v12 = v11;
        v51 = *(_QWORD *)v66;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v66 != v51)
              objc_enumerationMutation(v49);
            v14 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
            v15 = (void *)MEMORY[0x19AEC1554]();
            -[PLLibraryScopeRuleEvaluator interpreter](v50, "interpreter");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "evaluateObjects:forCondition:", v52, v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v17, "count"))
            {
              v18 = objc_msgSend(v14, "criteria");
              if (v18 == 2)
              {
                objc_msgSend(v48, "minusSet:", v17);
                objc_msgSend(v52, "minusSet:", v17);
              }
              else if (v18 == 1)
              {
                objc_msgSend(v48, "unionSet:", v17);
              }
              v63 = 0u;
              v64 = 0u;
              v61 = 0u;
              v62 = 0u;
              v19 = v17;
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v61, v76, 16);
              if (v20)
              {
                v21 = v20;
                v22 = *(_QWORD *)v62;
                do
                {
                  for (j = 0; j != v21; ++j)
                  {
                    if (*(_QWORD *)v62 != v22)
                      objc_enumerationMutation(v19);
                    objc_msgSend(v7, "setObject:forKey:", v14, *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j));
                  }
                  v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v61, v76, 16);
                }
                while (v21);
              }

            }
            objc_autoreleasePoolPop(v15);
          }
          v12 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
        }
        while (v12);
      }

      v24 = objc_msgSend(v52, "count");
      objc_autoreleasePoolPop(context);
      if (!v24)
        break;
      v8 = v45 + 1;
      if (v45 + 1 == v44)
      {
        v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
        if (v44)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_msgSend(v52, "minusSet:", v48);
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(v7, "keyEnumerator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v58;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v58 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * k);
        objc_msgSend(v7, "objectForKey:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "criteria");
        v74 = v31;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v47[2](v47, v30, v32, v33);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v75, 16);
    }
    while (v27);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v34 = v52;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v54;
    v38 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      for (m = 0; m != v36; ++m)
      {
        if (*(_QWORD *)v54 != v37)
          objc_enumerationMutation(v34);
        v47[2](v47, *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * m), 0, v38);
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
    }
    while (v36);
  }

  return v48;
}

- (NSArray)rules
{
  return self->_rules;
}

- (void)setRules:(id)a3
{
  objc_storeStrong((id *)&self->_rules, a3);
}

- (PLLibraryScopeRuleInterpreter)interpreter
{
  return self->_interpreter;
}

- (void)setInterpreter:(id)a3
{
  objc_storeStrong((id *)&self->_interpreter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpreter, 0);
  objc_storeStrong((id *)&self->_rules, 0);
}

@end
