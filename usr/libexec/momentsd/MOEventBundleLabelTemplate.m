@implementation MOEventBundleLabelTemplate

- (MOEventBundleLabelTemplate)initWithConditionStrings:(id)a3 labels:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  MOEventBundleLabelTemplate *v15;
  id os_log;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelTemplate conditionsFromLabels:](MOEventBundleLabelTemplate, "conditionsFromLabels:", v10));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelTemplate conditionsFromConditionStrings:](MOEventBundleLabelTemplate, "conditionsFromConditionStrings:", v9));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "setByAddingObjectsFromSet:", v12));
    self = -[MOEventBundleLabelTemplate initWithConditions:labels:context:](self, "initWithConditions:labels:context:", v14, v10, v11);

    v15 = self;
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MOEventBundleLabelTemplate initWithConditionStrings:labels:context:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventBundleLabelTemplate.m"), 46, CFSTR("Invalid parameter not satisfying: labels"));

    v15 = 0;
  }

  return v15;
}

- (MOEventBundleLabelTemplate)initWithConditions:(id)a3 labels:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  MOEventBundleLabelFormat *v18;
  MOEventBundleLabelTemplate *v19;
  id os_log;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v10)
  {
    v30 = v9;
    v12 = objc_opt_new(NSMutableArray);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v32;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v13);
          v18 = -[MOEventBundleLabelFormat initWithFormat:]([MOEventBundleLabelFormat alloc], "initWithFormat:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v17));
          -[NSMutableArray addObject:](v12, "addObject:", v18);

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v15);
    }

    v9 = v30;
    self = -[MOEventBundleLabelTemplate initWithConditions:formats:context:](self, "initWithConditions:formats:context:", v30, v12, v11);
    v19 = self;
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[MOEventBundleLabelTemplate initWithConditionStrings:labels:context:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);

    v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    -[NSMutableArray handleFailureInMethod:object:file:lineNumber:description:](v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventBundleLabelTemplate.m"), 57, CFSTR("Invalid parameter not satisfying: labels"));
    v19 = 0;
  }

  return v19;
}

- (MOEventBundleLabelTemplate)initWithConditions:(id)a3 formats:(id)a4 context:(id)a5
{
  id v10;
  id v11;
  id v12;
  MOEventBundleLabelTemplate *v13;
  id *p_isa;
  MOEventBundleLabelTemplate *v15;
  id os_log;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v11)
  {
    v27.receiver = self;
    v27.super_class = (Class)MOEventBundleLabelTemplate;
    v13 = -[MOEventBundleLabelTemplate init](&v27, "init");
    p_isa = (id *)&v13->super.isa;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_conditions, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
    }
    self = p_isa;
    v15 = self;
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MOEventBundleLabelTemplate initWithConditions:formats:context:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventBundleLabelTemplate.m"), 68, CFSTR("Invalid parameter not satisfying: formats"));

    v15 = 0;
  }

  return v15;
}

+ (id)conditionsFromLabels:(id)a3
{
  id v3;
  NSMutableSet *v4;
  void *i;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *j;
  void *v12;
  MOEventBundleLabelCondition *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v18;
  id obj;
  uint64_t v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableSet);
  v31 = 0;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("\\{([0-9a-zA-Z\\-\\_]+)\\}"), 1, &v31));
  v18 = v31;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v3;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v22)
  {
    v20 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")));
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v9; j = (char *)j + 1)
            {
              if (*(_QWORD *)v24 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v12, "numberOfRanges"))
              {
                v13 = objc_opt_new(MOEventBundleLabelCondition);
                v14 = objc_msgSend(v12, "rangeAtIndex:", 1);
                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringWithRange:", v14, v15));
                -[MOEventBundleLabelCondition setKeyword:](v13, "setKeyword:", v16);

                -[NSMutableSet addObject:](v4, "addObject:", v13);
              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
          }
          while (v9);
        }

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v22);
  }

  return v4;
}

+ (id)formatsFromLabels:(id)a3
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MOEventBundleLabelFormat *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8), "componentsSeparatedByString:", CFSTR("|")));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", 0));
        v11 = 0;
        if ((unint64_t)objc_msgSend(v9, "count") >= 2)
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", 1));
        v12 = -[MOEventBundleLabelFormat initWithFormat:capitalizationType:]([MOEventBundleLabelFormat alloc], "initWithFormat:capitalizationType:", v10, +[MOEventBundleLabelTemplate capitalizationTypeFromString:](MOEventBundleLabelTemplate, "capitalizationTypeFromString:", v11));
        -[NSMutableArray addObject:](v4, "addObject:", v12);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v4;
}

+ (id)conditionsFromConditionStrings:(id)a3
{
  id v3;
  NSMutableSet *v4;
  void **p_vtable;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void **v25;
  NSMutableSet *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v36;
  id obj;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  _BYTE v54[128];
  _BYTE v55[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableSet);
  v53 = 0;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("(!)?([0-9a-zA-Z\\-\\_]+)(\\s?(=|==|>|<|>=|<=|!=)\\s?([-+]?[0-9]*\\.?[0-9]+|[0-9a-zA-Z\\-\\_]+)(:(f|d|s))?)?"), 1, &v53));
  v36 = v53;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v3;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v40)
  {
    v38 = *(_QWORD *)v50;
    p_vtable = &OBJC_METACLASS___MOSignificantContactManager.vtable;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v50 != v38)
          objc_enumerationMutation(obj);
        v41 = v6;
        v7 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "matchesInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length")));
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v43 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        if (v43)
        {
          v9 = *(_QWORD *)v46;
          v42 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v43; i = (char *)i + 1)
            {
              if (*(_QWORD *)v46 != v9)
                objc_enumerationMutation(v8);
              v11 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v11, "numberOfRanges"))
              {
                v12 = objc_msgSend(v11, "rangeAtIndex:", 2);
                v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringWithRange:", v12, v13));
                v14 = objc_msgSend(objc_alloc((Class)(p_vtable + 442)), "initWithKeyword:", v44);
                v15 = objc_msgSend(v11, "rangeAtIndex:", 1);
                if (v16)
                {
                  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringWithRange:", v15, v16));
                  v18 = objc_msgSend(p_vtable + 442, "templateOperatorFromString:", v17);

                  if (v18)
                    objc_msgSend(v14, "setTemplateOperator:", v18);
                }
                if (objc_msgSend(v14, "templateOperator") != (id)8)
                {
                  v19 = objc_msgSend(v11, "rangeAtIndex:", 4);
                  if (v20)
                  {
                    v21 = p_vtable + 442;
                    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringWithRange:", v19, v20));
                    v23 = v7;
                    v24 = v8;
                    v25 = p_vtable;
                    v26 = v4;
                    v27 = (void *)v22;
                    v28 = objc_msgSend(v21, "templateOperatorFromString:", v22);

                    v4 = v26;
                    p_vtable = v25;
                    v8 = v24;
                    v7 = v23;
                    v9 = v42;
                    if (v28)
                    {
                      objc_msgSend(v14, "setTemplateOperator:", v28);
                      v29 = objc_msgSend(v11, "rangeAtIndex:", 5);
                      if (v30)
                      {
                        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringWithRange:", v29, v30));
                        objc_msgSend(v14, "setValue:", v31);

                      }
                      else
                      {
                        objc_msgSend(v14, "setTemplateOperator:", 0);
                      }
                      v32 = objc_msgSend(v11, "rangeAtIndex:", 7);
                      if (v33)
                      {
                        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringWithRange:", v32, v33));
                        objc_msgSend(v14, "setValueType:", objc_msgSend(p_vtable + 442, "valueTypeFromString:", v34));

                      }
                    }
                  }
                  else
                  {
                    objc_msgSend(v14, "setTemplateOperator:", 7);
                  }
                }
                -[NSMutableSet addObject:](v4, "addObject:", v14);

              }
            }
            v43 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
          }
          while (v43);
        }

        v6 = v41 + 1;
      }
      while ((id)(v41 + 1) != v40);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v40);
  }

  return v4;
}

+ (id)conditionsFromExtendStrings:(id)a3
{
  id v3;
  void **p_vtable;
  uint64_t v5;
  void *v6;
  void *v7;
  void *i;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableArray *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *j;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v37;
  id obj;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSMutableSet *v47;
  id v48;
  uint64_t v49;
  id v50;
  __int128 v51;
  __int128 v52;
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
  id v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];

  v3 = a3;
  v47 = objc_opt_new(NSMutableSet);
  v63 = 0;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("([0-9a-zA-Z\\-\\_]+)\\s?(:)\\s?([0-9a-zA-Z\\-\\_\\,\\s]+)"), 1, &v63));
  v37 = v63;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v3;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
  if (v41)
  {
    v39 = *(_QWORD *)v60;
    p_vtable = &OBJC_METACLASS___MOSignificantContactManager.vtable;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v60 != v39)
          objc_enumerationMutation(obj);
        v42 = v5;
        v6 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length", v37)));
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v48 = v7;
        v50 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
        if (v50)
        {
          v49 = *(_QWORD *)v56;
          v43 = v6;
          do
          {
            for (i = 0; i != v50; i = (char *)i + 1)
            {
              if (*(_QWORD *)v56 != v49)
                objc_enumerationMutation(v48);
              v9 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v9, "numberOfRanges"))
              {
                v10 = objc_msgSend(v9, "rangeAtIndex:", 1);
                v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringWithRange:", v10, v11));
                v13 = objc_msgSend(objc_alloc((Class)(p_vtable + 442)), "initWithKeyword:", v12);
                v14 = objc_msgSend(v9, "rangeAtIndex:", 2);
                if (v15)
                {
                  v16 = v12;
                  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringWithRange:", v14, v15));
                  v18 = objc_msgSend(p_vtable + 442, "templateOperatorFromString:", v17);

                  v12 = v16;
                  if (v18)
                    objc_msgSend(v13, "setTemplateOperator:", v18);
                }
                v19 = objc_msgSend(v9, "rangeAtIndex:", 3);
                if (v20)
                {
                  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringWithRange:", v19, v20));
                  if (objc_msgSend(v21, "length"))
                  {
                    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
                    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByTrimmingCharactersInSet:", v22));

                    if (objc_msgSend(v23, "isEqualToString:", CFSTR("_ANY_")))
                    {
                      objc_msgSend(v13, "setValue:", CFSTR("_ANY_"));
                    }
                    else
                    {
                      v44 = v23;
                      v46 = v12;
                      v24 = objc_opt_new(NSMutableArray);
                      v51 = 0u;
                      v52 = 0u;
                      v53 = 0u;
                      v54 = 0u;
                      v45 = v21;
                      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "componentsSeparatedByString:", CFSTR(",")));
                      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
                      if (v26)
                      {
                        v27 = v26;
                        v28 = *(_QWORD *)v52;
                        do
                        {
                          for (j = 0; j != v27; j = (char *)j + 1)
                          {
                            if (*(_QWORD *)v52 != v28)
                              objc_enumerationMutation(v25);
                            v30 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)j);
                            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
                            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "stringByTrimmingCharactersInSet:", v31));

                            -[NSMutableArray addObject:](v24, "addObject:", v32);
                          }
                          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
                        }
                        while (v27);
                      }

                      if (-[NSMutableArray count](v24, "count"))
                      {
                        v33 = -[NSMutableArray copy](v24, "copy");
                        objc_msgSend(v13, "setValues:", v33);

                      }
                      p_vtable = (void **)(&OBJC_METACLASS___MOSignificantContactManager + 24);
                      v6 = v43;
                      v23 = v44;
                      v21 = v45;
                      v12 = v46;
                    }

                  }
                }
                if (objc_msgSend(v13, "templateOperator"))
                {
                  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "values"));
                  if (objc_msgSend(v34, "count"))
                  {

                    goto LABEL_35;
                  }
                  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value"));

                  if (v35)
LABEL_35:
                    -[NSMutableSet addObject:](v47, "addObject:", v13);
                }

                continue;
              }
            }
            v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
          }
          while (v50);
        }

        v5 = v42 + 1;
      }
      while ((id)(v42 + 1) != v41);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
    }
    while (v41);
  }

  return v47;
}

+ (id)conditionsFromCapitalizations:(id)a3
{
  id v3;
  NSMutableSet *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  MOEventBundleLabelCondition *v11;
  MOEventBundleLabelCondition *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableSet);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
        v11 = [MOEventBundleLabelCondition alloc];
        v12 = -[MOEventBundleLabelCondition initWithKeyword:](v11, "initWithKeyword:", v10, (_QWORD)v14);
        -[MOEventBundleLabelCondition setTemplateOperator:](v12, "setTemplateOperator:", 7);
        -[MOEventBundleLabelCondition setCapitalized:](v12, "setCapitalized:", 1);
        -[NSMutableSet addObject:](v4, "addObject:", v12);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (unint64_t)capitalizationTypeFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  unint64_t v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  unsigned int v13;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
    v6 = objc_msgSend(CFSTR("nop"), "isEqualToString:", v5);

    if ((v6 & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));
      v9 = objc_msgSend(CFSTR("titlecap"), "isEqualToString:", v8);

      if ((v9 & 1) != 0)
      {
        v7 = 2;
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));
        v11 = objc_msgSend(CFSTR("cap"), "isEqualToString:", v10);

        if ((v11 & 1) != 0)
        {
          v7 = 3;
        }
        else
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));
          v13 = objc_msgSend(CFSTR("fpo"), "isEqualToString:", v12);

          if (v13)
            v7 = 3;
          else
            v7 = 1;
        }
      }
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)checkConditionForMetaData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  unsigned int v13;
  id os_log;
  NSObject *v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  NSObject *v19;
  MOEventBundleLabelTemplate *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  _BYTE v27[18];
  __int16 v28;
  unsigned int v29;
  _BYTE v30[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelTemplate conditions](self, "conditions"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelTemplate conditions](self, "conditions"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v8)
    {
      v9 = v8;
      v21 = self;
      v10 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v13 = objc_msgSend(v12, "yieldConditionForMetaData:", v4);
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v15 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "keyword"));
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)v27 = v16;
            *(_WORD *)&v27[8] = 2112;
            *(_QWORD *)&v27[10] = v12;
            v28 = 1024;
            v29 = v13;
            _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "template yieldConditionForMetaData, keyword, %@, condition, %@, output, %d", buf, 0x1Cu);

          }
          if (!v13)
          {
            v17 = 0;
            goto LABEL_14;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v9)
          continue;
        break;
      }
      v17 = 1;
LABEL_14:
      self = v21;
    }
    else
    {
      v17 = 1;
    }

    v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v27 = v17;
      *(_WORD *)&v27[4] = 2112;
      *(_QWORD *)&v27[6] = self;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "template checkConditionForMetaData, output, %d, template, %@", buf, 0x12u);
    }

  }
  else
  {
    LOBYTE(v17) = 1;
  }

  return v17;
}

- (BOOL)needExtensionForKeyword:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelTemplate conditions](self, "conditions", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "templateOperator") == (id)9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "keyword"));
          v11 = objc_msgSend(v10, "isEqualToString:", v4);

          if ((v11 & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v6;
}

- (BOOL)needCapitalizationForKeyword:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelTemplate conditions](self, "conditions", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keyword"));
          if (objc_msgSend(v11, "isEqualToString:", v5))
          {
            v12 = objc_msgSend(v10, "capitalized");

            if ((v12 & 1) != 0)
            {
              LOBYTE(v7) = 1;
              goto LABEL_16;
            }
          }
          else
          {

          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }
LABEL_16:

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return (char)v7;
}

- (id)formattedStringsForMetaData:(id)a3
{
  id v4;
  __objc2_class *v5;
  void *v6;
  void *v7;
  void *v8;
  id os_log;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  unsigned int v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  id v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  NSObject *v49;
  id v50;
  NSObject *v51;
  id v52;
  NSObject *v53;
  id v54;
  NSObject *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  id v61;
  NSObject *v62;
  id v63;
  NSObject *v64;
  id v65;
  NSObject *v66;
  uint64_t v67;
  void *v68;
  const __CFString *v69;
  NSObject *v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  NSObject *v75;
  uint64_t v76;
  void *v77;
  id v78;
  NSObject *v79;
  id v80;
  NSObject *v81;
  id v82;
  NSObject *v83;
  void *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  id v94;
  id v96;
  NSMutableArray *v97;
  id obj;
  uint64_t v99;
  void *v100;
  id v101;
  void *v102;
  NSMutableArray *v103;
  id v104;
  void *v105;
  id v106;
  char v107;
  id v108;
  unsigned int v109;
  uint64_t v110;
  id v111;
  void *v112;
  MOEventBundleLabelTemplate *v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  id v122;
  uint8_t buf[4];
  uint64_t v124;
  __int16 v125;
  NSObject *v126;
  __int16 v127;
  uint64_t v128;
  __int16 v129;
  void *v130;
  __int16 v131;
  id v132;
  uint8_t v133[4];
  uint64_t v134;
  _BYTE v135[128];
  _BYTE v136[128];

  v4 = a3;
  v122 = 0;
  v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("\\{([0-9a-zA-Z\\-\\_]+)\\}"), 1, &v122));
  v96 = v122;
  v97 = objc_opt_new(NSMutableArray);
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v113 = self;
  obj = (id)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelTemplate formats](self, "formats"));
  v101 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v136, 16);
  if (v101)
  {
    v99 = *(_QWORD *)v119;
    v5 = MOEventPatternDetectorFeatureExtractorDurationSinceLastEvent;
    v106 = v4;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v119 != v99)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * (_QWORD)v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "format"));
        v108 = objc_msgSend(v8, "copy");
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v10 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v124 = (uint64_t)v8;
          _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "template, %@", buf, 0xCu);
        }

        v103 = objc_opt_new(NSMutableArray);
        v105 = v7;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "format"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "matchesInString:options:range:", v11, 0, 0, objc_msgSend(v8, "length")));

        v116 = 0u;
        v117 = 0u;
        v114 = 0u;
        v115 = 0u;
        v13 = v12;
        v111 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v114, v135, 16);
        if (!v111)
        {

LABEL_76:
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&v5[40], "_Moments_LocalizedStringWithFormat:arguments:", v8, v103));
          v74 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v75 = objc_claimAutoreleasedReturnValue(v74);
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
          {
            v83 = -[NSMutableArray count](v103, "count");
            v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "mask"));
            v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "mask"));
            *(_DWORD *)buf = 138413058;
            v124 = (uint64_t)v8;
            v125 = 2048;
            v126 = v83;
            v127 = 2112;
            v128 = (uint64_t)v84;
            v129 = 2112;
            v130 = v85;
            _os_log_debug_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEBUG, "template, %@, args, %lu, outputString, %@, localizedString, %@, formatting completed", buf, 0x2Au);

          }
          if (v73)
          {
            if (objc_msgSend(v105, "capitalizationType") == (id)1 || objc_msgSend(v105, "capitalizationType") == (id)2)
            {
              v76 = objc_claimAutoreleasedReturnValue(objc_msgSend(&v5[40], "_Moments_CapitalizedStringForKey:", v73));
              goto LABEL_82;
            }
            if (objc_msgSend(v105, "capitalizationType") != (id)3)
              goto LABEL_83;
            v76 = objc_claimAutoreleasedReturnValue(objc_msgSend(&v5[40], "_Moments_AllCapitalizedStringForKey:", v73));
LABEL_82:
            v77 = (void *)v76;

            v73 = v77;
            if (!v77)
            {
              v82 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              v81 = objc_claimAutoreleasedReturnValue(v82);
              if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
              {
                v89 = -[NSMutableArray count](v103, "count");
                v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "mask"));
                v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "mask"));
                v92 = objc_msgSend(v105, "capitalizationType");
                *(_DWORD *)buf = 138413314;
                v124 = (uint64_t)v8;
                v125 = 2048;
                v126 = v89;
                v127 = 2112;
                v128 = (uint64_t)v90;
                v129 = 2112;
                v130 = v91;
                v131 = 2048;
                v132 = v92;
                _os_log_error_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "template, %@, args, %lu, outputString, %@, localizedString, %@, capitalization failure, %lu", buf, 0x34u);

              }
              v73 = 0;
LABEL_91:

            }
            else
            {
LABEL_83:
              v78 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              v79 = objc_claimAutoreleasedReturnValue(v78);
              if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
              {
                v86 = -[NSMutableArray count](v103, "count");
                v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "mask"));
                v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "mask"));
                *(_DWORD *)buf = 138413058;
                v124 = (uint64_t)v8;
                v125 = 2048;
                v126 = v86;
                v127 = 2112;
                v128 = (uint64_t)v87;
                v129 = 2112;
                v130 = v88;
                _os_log_debug_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEBUG, "template, %@, args, %lu, outputString, %@, localizedString, %@, localization completed", buf, 0x2Au);

              }
              -[NSMutableArray addObject:](v97, "addObject:", v73);
              if (objc_msgSend(v73, "containsString:", CFSTR("{")))
              {
                v80 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                v81 = objc_claimAutoreleasedReturnValue(v80);
                if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v124 = (uint64_t)v73;
                  _os_log_error_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "The string contains a symbol. %@", buf, 0xCu);
                }
                goto LABEL_91;
              }
            }
          }

          goto LABEL_93;
        }
        v104 = v13;
        v102 = v6;
        v110 = *(_QWORD *)v115;
        v107 = 1;
        v14 = v105;
        do
        {
          v15 = 0;
          v16 = v8;
          do
          {
            if (*(_QWORD *)v115 != v110)
              objc_enumerationMutation(v104);
            v17 = objc_msgSend(*(id *)(*((_QWORD *)&v114 + 1) + 8 * (_QWORD)v15), "rangeAtIndex:", 1);
            v19 = v18;
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "format"));
            v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "substringWithRange:", v17, v19));

            v22 = -[MOEventBundleLabelTemplate needCapitalizationForKeyword:](v113, "needCapitalizationForKeyword:", v21);
            v23 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            v24 = objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v124 = (uint64_t)v16;
              v125 = 2112;
              v126 = v21;
              _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "template, %@, keyword, %@", buf, 0x16u);
            }

            v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v21));
            v26 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_CapitalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_CapitalizedStringForKey:", v21));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v26));

            if (v25)
            {
              v109 = v22;
              if (-[MOEventBundleLabelTemplate needExtensionForKeyword:](v113, "needExtensionForKeyword:", v21))
              {
                v29 = v4;
                v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%@}"), v21, v96));
                v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%@}"), v25));
                v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", v30, v31));

                v33 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                v34 = objc_claimAutoreleasedReturnValue(v33);
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412802;
                  v124 = v32;
                  v125 = 2112;
                  v126 = v21;
                  v127 = 2112;
                  v128 = (uint64_t)v25;
                  _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "extended template, %@, keyword, %@, extended keyword, %@", buf, 0x20u);
                }

                v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", v25));
                v36 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_CapitalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_CapitalizedStringForKey:", v25));
                v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", v36));

                v38 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                v39 = objc_claimAutoreleasedReturnValue(v38);
                v8 = (void *)v32;
                if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138413058;
                  v124 = v32;
                  v125 = 2112;
                  v126 = v25;
                  v127 = 2112;
                  v128 = v35;
                  v129 = 2112;
                  v130 = v37;
                  _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "extended template, %@, extended keyword, %@, value, %@, value.cap, %@", buf, 0x2Au);
                }

                v14 = v105;
                if (!v35)
                {
                  v63 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                  v64 = objc_claimAutoreleasedReturnValue(v63);
                  if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v124 = (uint64_t)v21;
                    _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "extended keyword is not found, %@", buf, 0xCu);
                  }

                  v41 = 0;
                  v107 = 0;
                  v4 = v106;
                  goto LABEL_66;
                }

                v25 = v35;
                v4 = v106;
              }
              else
              {
                v37 = v27;
                v8 = v16;
              }
              v42 = objc_opt_class(NSString, v28);
              if ((objc_opt_isKindOfClass(v25, v42) & 1) != 0)
              {
                v45 = v25;
                v112 = v8;
                if (v37
                  && (v46 = objc_opt_class(NSString, v44), (objc_opt_isKindOfClass(v37, v46) & 1) != 0))
                {
                  v47 = v37;
                }
                else
                {
                  v47 = 0;
                }
                v54 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                v55 = objc_claimAutoreleasedReturnValue(v54);
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
                {
                  v70 = objc_claimAutoreleasedReturnValue(-[NSObject mask](v45, "mask"));
                  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "mask"));
                  *(_DWORD *)buf = 138412802;
                  v124 = (uint64_t)v21;
                  v125 = 2112;
                  v126 = v70;
                  v127 = 2112;
                  v128 = (uint64_t)v71;
                  _os_log_debug_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "keyword, %@, value type, NSString, value, %@, value.cap, %@", buf, 0x20u);

                }
LABEL_44:
                v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%@}"), v21));
                v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%@}"), v45));
                v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "stringByReplacingOccurrencesOfString:withString:", v56, v57));

                if (objc_msgSend(v14, "capitalizationType") == (id)2
                  && +[MOEventBundleLabelLocalizer isPreferredLanguageTitlecaseCapable](MOEventBundleLabelLocalizer, "isPreferredLanguageTitlecaseCapable"))
                {
                  if (v47)
                    v59 = v47;
                  else
                    v59 = (id)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_TitleCapitalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_TitleCapitalizedStringForKey:", v45));
                  v60 = (uint64_t)v59;
                  v4 = v106;
LABEL_61:

                  v45 = v60;
                  goto LABEL_62;
                }
                if (v109)
                {
                  v4 = v106;
                  if (+[MOEventBundleLabelLocalizer isPreferredLanguageMidSentenceCaseCapable](MOEventBundleLabelLocalizer, "isPreferredLanguageMidSentenceCaseCapable"))
                  {
                    v60 = objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_CapitalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_CapitalizedStringForKey:", v45));
                    goto LABEL_61;
                  }
LABEL_62:
                  v14 = v105;
                }
                else
                {
                  v4 = v106;
                }
                -[NSMutableArray addObject:](v103, "addObject:", v45);

                v108 = (id)v58;
                goto LABEL_64;
              }
              v48 = objc_opt_class(NSNumber, v43);
              if ((objc_opt_isKindOfClass(v25, v48) & 1) != 0)
              {
                v49 = v25;
                v45 = objc_claimAutoreleasedReturnValue(-[NSObject stringValue](v49, "stringValue"));
                if (!v45)
                {
                  v50 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                  v51 = objc_claimAutoreleasedReturnValue(v50);
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                    -[MOEventBundleLabelTemplate formattedStringsForMetaData:].cold.1(v133, &v134, v51);

                  v45 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), -[NSObject intValue](v49, "intValue")));
                }
                v112 = v8;
                v52 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                v53 = objc_claimAutoreleasedReturnValue(v52);
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  v124 = (uint64_t)v21;
                  v125 = 2112;
                  v126 = v45;
                  _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "keyword, %@, value type, NSNumber, value, %@", buf, 0x16u);
                }

                if (v45)
                {
                  v47 = 0;
                  goto LABEL_44;
                }
                v107 = 0;
LABEL_64:
                v65 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                v66 = objc_claimAutoreleasedReturnValue(v65);
                v8 = v112;
                if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
                {
                  v67 = objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "mask"));
                  v68 = (void *)v67;
                  *(_DWORD *)buf = 138412546;
                  v69 = CFSTR("NO");
                  if ((v107 & 1) != 0)
                    v69 = CFSTR("YES");
                  v124 = v67;
                  v125 = 2112;
                  v126 = v69;
                  _os_log_debug_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEBUG, "outputString, %@, formattingCompleted, %@", buf, 0x16u);

                }
                v41 = 1;
                goto LABEL_66;
              }
              v61 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              v62 = objc_claimAutoreleasedReturnValue(v61);
              if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v124 = (uint64_t)v21;
                v125 = 2112;
                v126 = v25;
                _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "keyword, %@, value type is not supported, %@", buf, 0x16u);
              }

              v41 = 0;
              v107 = 0;
            }
            else
            {
              v40 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              v25 = objc_claimAutoreleasedReturnValue(v40);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v124 = (uint64_t)v21;
                _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "keyword is not found, %@", buf, 0xCu);
              }
              v41 = 0;
              v107 = 0;
              v37 = v27;
              v8 = v16;
            }
LABEL_66:

            if (!v41)
              goto LABEL_73;
            v15 = (char *)v15 + 1;
            v16 = v8;
          }
          while (v111 != v15);
          v72 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v114, v135, 16);
          v111 = v72;
        }
        while (v72);
LABEL_73:
        v13 = v104;

        v5 = MOEventPatternDetectorFeatureExtractorDurationSinceLastEvent;
        v6 = v102;
        if ((v107 & 1) != 0)
          goto LABEL_76;
LABEL_93:

        v6 = (char *)v6 + 1;
      }
      while (v6 != v101);
      v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v136, 16);
      v101 = v93;
    }
    while (v93);
  }

  v94 = -[NSMutableArray copy](v97, "copy");
  return v94;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelTemplate conditions](self, "conditions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelTemplate formats](self, "formats"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("condidionts, %@, labels, %@"), v3, v4));

  return v5;
}

- (NSSet)conditions
{
  return self->_conditions;
}

- (void)setConditions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)formats
{
  return self->_formats;
}

- (void)setFormats:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_formats, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
}

- (void)initWithConditionStrings:(uint64_t)a3 labels:(uint64_t)a4 context:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "Invalid parameter not satisfying: labels", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_2();
}

- (void)initWithConditions:(uint64_t)a3 formats:(uint64_t)a4 context:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "Invalid parameter not satisfying: formats", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_2();
}

- (void)formattedStringsForMetaData:(os_log_t)log .cold.1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "stringValue %@", buf, 0xCu);
}

@end
