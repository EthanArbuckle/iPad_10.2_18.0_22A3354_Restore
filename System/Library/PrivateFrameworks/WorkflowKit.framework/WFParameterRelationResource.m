@implementation WFParameterRelationResource

+ (BOOL)mustBeAvailableForDisplay
{
  return 1;
}

- (WFParameterRelationResource)initWithParameterKey:(id)a3 parameterValues:(id)a4 relation:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  WFParameterRelationResource *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v16[0] = CFSTR("WFParameterKey");
  v16[1] = CFSTR("WFParameterValues");
  v17[0] = a3;
  v17[1] = a4;
  v9 = (void *)MEMORY[0x1E0C99D80];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  if (v8)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, CFSTR("WFParameterRelation"));
  v14 = -[WFResource initWithDefinition:](self, "initWithDefinition:", v13);

  return v14;
}

- (NSArray)comparedValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[WFResource definition](self, "definition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("WFParameterValues"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFResource definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("WFParameterValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v7 = v4;
  }
  else
  {
    if (!v6)
    {
      v8 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_6;
    }
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
LABEL_6:

  return (NSArray *)v8;
}

- (NSString)parameterKey
{
  void *v2;
  void *v3;

  -[WFResource definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("WFParameterKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)relation
{
  void *v2;
  void *v3;

  -[WFResource definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("WFParameterRelation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setupWithAction:(id)a3 parameter:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id WeakRetained;
  void *v13;
  id obj;

  obj = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterRelationResource parameterKey](self, "parameterKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if ((v11 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFParameterRelationResource.m"), 82, CFSTR("Parameter key of relation resource must match the key of the parameter passed to setupWithAction:parameter:"));

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  objc_msgSend(WeakRetained, "removeEventObserver:", self);

  objc_storeWeak((id *)&self->_action, obj);
  objc_storeWeak((id *)&self->_parameter, v8);
  objc_msgSend(obj, "addEventObserver:", self);
  -[WFResource invalidateAvailability](self, "invalidateAvailability");

}

- (void)refreshAvailability
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char isKindOfClass;
  id v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  WFParameterRelationResource *v28;
  _BOOL8 v29;
  WFParameterRelationResource *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  char v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  -[WFParameterRelationResource action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    -[WFResource updateAvailability:withError:](self, "updateAvailability:withError:", 0, 0);
    goto LABEL_79;
  }
  if (objc_msgSend(v3, "isRunning")
    && (objc_msgSend(v4, "processedParameters"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    objc_msgSend(v4, "processedParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterRelationResource parameterKey](self, "parameterKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFParameterRelationResource parameterKey](self, "parameterKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serializedParameterStateForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      -[WFParameterRelationResource parameter](self, "parameter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "defaultSerializedRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = 0;
      goto LABEL_10;
    }
    v8 = v9;
    v7 = v8;
  }
  v10 = v8;
LABEL_10:

  -[WFParameterRelationResource parameter](self, "parameter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  v14 = v12;
  v15 = v14;
  if (v14)
  {
    if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EF74ED78))
      v14 = v15;
    else
      v14 = 0;
  }
  objc_msgSend(v14, "codableAttribute");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16
    && (v17 = (void *)v16,
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v17,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v13, "valueForKeyPath:", CFSTR("identifier"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = v13;
  }
  v20 = v19;

  -[WFParameterRelationResource relation](self, "relation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "isEqualToString:", CFSTR("??")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = objc_msgSend(v20, "length") == 0;
    else
      v22 = v20 == 0;
    v29 = !v22;
    goto LABEL_35;
  }
  if (objc_msgSend(v21, "isEqualToString:", CFSTR("!=")))
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    -[WFParameterRelationResource comparedValues](self, "comparedValues");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v52;
      while (2)
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v52 != v26)
            objc_enumerationMutation(v23);
          if (objc_msgSend(v20, "isEqual:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i)))
          {
            v30 = self;
            v31 = 0;
            goto LABEL_77;
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        if (v25)
          continue;
        break;
      }
    }

    v28 = self;
    v29 = 1;
    goto LABEL_36;
  }
  if (objc_msgSend(v21, "isEqualToString:", CFSTR("nil")))
  {
    v29 = v20 == 0;
LABEL_35:
    v28 = self;
    goto LABEL_36;
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[WFParameterRelationResource comparedValues](self, "comparedValues");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (!v32)
    goto LABEL_75;
  v33 = v32;
  v34 = *(_QWORD *)v48;
  while (2)
  {
    for (j = 0; j != v33; ++j)
    {
      if (*(_QWORD *)v48 != v34)
        objc_enumerationMutation(v23);
      v36 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
      if (objc_msgSend(v21, "isEqualToString:", CFSTR(">"), v44))
      {
        if (objc_msgSend(v20, "compare:", v36) == 1)
          goto LABEL_76;
        continue;
      }
      if (objc_msgSend(v21, "isEqualToString:", CFSTR(">=")))
      {
        if (objc_msgSend(v20, "compare:", v36) == 1)
          goto LABEL_76;
LABEL_50:
        if ((objc_msgSend(v20, "isEqual:", v36) & 1) != 0)
          goto LABEL_76;
        continue;
      }
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("<")))
      {
        if (objc_msgSend(v20, "compare:", v36) == -1)
          goto LABEL_76;
      }
      else if (objc_msgSend(v21, "isEqualToString:", CFSTR("<=")))
      {
        if (objc_msgSend(v20, "compare:", v36) == -1 || objc_msgSend(v20, "isEqual:", v36))
          goto LABEL_76;
      }
      else
      {
        if (!objc_msgSend(v21, "isEqualToString:", CFSTR("⊃")))
          goto LABEL_50;
        v37 = v36;
        if (v37)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v38 = v37;
          else
            v38 = 0;
        }
        else
        {
          v38 = 0;
        }
        v39 = v38;

        if (objc_msgSend(v39, "length"))
        {
          v44 = v39;
          v40 = v20;
          v45 = v37;
          if (v20)
          {
            v41 = v40;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v42 = v41;
            else
              v42 = 0;
          }
          else
          {
            v42 = 0;
            v41 = v40;
          }
          v43 = v42;

          v46 = objc_msgSend(v43, "containsString:", v45);
          if ((v46 & 1) != 0)
          {
LABEL_76:
            v30 = self;
            v31 = 1;
LABEL_77:
            -[WFResource updateAvailability:withError:](v30, "updateAvailability:withError:", v31, 0, v44);

            goto LABEL_78;
          }
        }
        else
        {

        }
      }
    }
    v33 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (v33)
      continue;
    break;
  }
LABEL_75:

  v28 = self;
  v29 = 0;
LABEL_36:
  -[WFResource updateAvailability:withError:](v28, "updateAvailability:withError:", v29, 0, v44);
LABEL_78:

LABEL_79:
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  id v5;
  void *v6;
  int v7;

  v5 = a4;
  -[WFParameterRelationResource parameterKey](self, "parameterKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
    -[WFResource refreshAvailabilityWithNotification](self, "refreshAvailabilityWithNotification");
}

- (WFAction)action
{
  return (WFAction *)objc_loadWeakRetained((id *)&self->_action);
}

- (void)setAction:(id)a3
{
  objc_storeWeak((id *)&self->_action, a3);
}

- (WFParameter)parameter
{
  return (WFParameter *)objc_loadWeakRetained((id *)&self->_parameter);
}

- (void)setParameter:(id)a3
{
  objc_storeWeak((id *)&self->_parameter, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parameter);
  objc_destroyWeak((id *)&self->_action);
}

@end
