@implementation PCSCTreeNode

- (PCSCTreeNode)initWithExpression:(id)a3 version:(int64_t)a4 andParent:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  PCSCTreeNode *v12;
  PCSCTreeNode *v13;
  uint64_t v14;
  PCSCTreeNode *v15;
  NSDictionary *opTokens;
  NSDictionary *typeTokens;
  uint64_t v18;
  id v19;
  void *v20;
  NSDictionary *value;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  uint64_t v27;
  PCSCTreeNode *v28;
  void *v29;
  id v30;
  PCSCTreeNode *v31;
  id v32;
  PCSCTreeNode *v33;
  PCSCTreeNode *v34;
  void *v35;
  int64_t operator;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  NSDictionary *v41;
  NSDictionary *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  objc_super v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  NSDictionary *v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  void *v67;
  _BYTE v68[128];

  v10 = a3;
  v11 = a5;
  v59.receiver = self;
  v59.super_class = (Class)PCSCTreeNode;
  v12 = -[PCSCTreeNode init](&v59, "init");
  v13 = v12;
  if (!v12)
    goto LABEL_53;
  objc_storeWeak((id *)&v12->_parent, v11);
  v13->_version = a4;
  if (-[PCSCTreeNode level](v13, "level") >= 6)
  {
    if (!a6)
      goto LABEL_53;
    v14 = -1111;
LABEL_5:
    v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.statusconditionserror"), v14, 0));
    goto LABEL_54;
  }
  opTokens = v13->_opTokens;
  v13->_opTokens = (NSDictionary *)&off_10022B280;

  typeTokens = v13->_typeTokens;
  v13->_typeTokens = (NSDictionary *)&off_10022B2A8;

  v18 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v10, v18) & 1) == 0)
  {
    v40 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v10, v40) & 1) == 0)
    {
      if (!a6)
        goto LABEL_53;
      v14 = -1112;
      goto LABEL_5;
    }
    v41 = (NSDictionary *)v10;
    v42 = v13->_typeTokens;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v41, "objectForKeyedSubscript:", CFSTR("type")));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v42, "objectForKeyedSubscript:", v43));
    -[PCSCTreeNode setType:](v13, "setType:", objc_msgSend(v44, "integerValue"));

    if ((id)-[PCSCTreeNode type](v13, "type") != (id)1)
    {
      if (a6)
        *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.statusconditionserror"), -1120, 0));

      goto LABEL_53;
    }
    v45 = APLogForCategory(44);
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "iTunesDSID"));
      *(_DWORD *)buf = 136643587;
      v61 = "-[PCSCTreeNode initWithExpression:version:andParent:error:]";
      v62 = 2114;
      v63 = v41;
      v64 = 2160;
      v65 = 1752392040;
      v66 = 2112;
      v67 = v48;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "[%{sensitive}s]: found StatusCondition node: %{public}@. DSID %{mask.hash}@", buf, 0x2Au);

    }
    value = v13->_value;
    v13->_value = v41;
    goto LABEL_30;
  }
  v53 = v11;
  v19 = v10;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[PCSCTreeNode setChildren:](v13, "setChildren:", v20);

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  value = (NSDictionary *)v19;
  v22 = -[NSDictionary countByEnumeratingWithState:objects:count:](value, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
  if (!v22)
    goto LABEL_21;
  v23 = v22;
  v24 = *(_QWORD *)v56;
  while (2)
  {
    for (i = 0; i != v23; i = (char *)i + 1)
    {
      if (*(_QWORD *)v56 != v24)
        objc_enumerationMutation(value);
      v26 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
      v27 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
      {
        v28 = v26;
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v13->_opTokens, "objectForKey:", v28));
        v30 = objc_msgSend(v29, "integerValue");

        if (v30)
        {
          if (!-[PCSCTreeNode operator](v13, "operator"))
          {
            -[PCSCTreeNode setOperator:](v13, "setOperator:", v30);
            goto LABEL_19;
          }
          if (a6)
          {
            v49 = -1118;
            goto LABEL_44;
          }
        }
        else if (a6)
        {
          v49 = -1110;
LABEL_44:
          v11 = v53;
          *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.statusconditionserror"), v49, 0));
          v34 = v28;
          goto LABEL_51;
        }
        v34 = v28;
        goto LABEL_50;
      }
      v31 = [PCSCTreeNode alloc];
      v32 = -[PCSCTreeNode version](v13, "version");
      v54 = 0;
      v28 = -[PCSCTreeNode initWithExpression:version:andParent:error:](v31, "initWithExpression:version:andParent:error:", v26, v32, v13, &v54);
      v33 = (PCSCTreeNode *)v54;
      v34 = v33;
      if (v33 || !v28)
      {
        if (a6 && v33)
          *a6 = objc_retainAutorelease(v33);

LABEL_50:
        v11 = v53;
LABEL_51:

        goto LABEL_52;
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[PCSCTreeNode children](v13, "children"));
      objc_msgSend(v35, "addObject:", v28);

LABEL_19:
    }
    v23 = -[NSDictionary countByEnumeratingWithState:objects:count:](value, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    if (v23)
      continue;
    break;
  }
LABEL_21:

  operator = v13->_operator;
  if ((unint64_t)(operator - 1) >= 2)
  {
    v11 = v53;
    if (operator == 3)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[PCSCTreeNode children](v13, "children"));
      v51 = objc_msgSend(v50, "count");

      if (v51 == (id)1)
        goto LABEL_30;
      if (!a6)
        goto LABEL_52;
      v39 = -1115;
    }
    else
    {
      if (!a6)
        goto LABEL_52;
      v39 = -1110;
    }
LABEL_57:
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.statusconditionserror"), v39, 0));
    goto LABEL_52;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[PCSCTreeNode children](v13, "children"));
  v38 = objc_msgSend(v37, "count");

  v11 = v53;
  if ((unint64_t)v38 > 1)
  {
LABEL_30:

    v15 = v13;
    goto LABEL_54;
  }
  if (a6)
  {
    v39 = -1114;
    goto LABEL_57;
  }
LABEL_52:

LABEL_53:
  v15 = 0;
LABEL_54:

  return v15;
}

- (int)level
{
  id WeakRetained;
  void *v3;
  int v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  if (!WeakRetained)
    return 0;
  v3 = WeakRetained;
  v4 = 0;
  do
  {
    ++v4;
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parent"));

    v3 = (void *)v5;
  }
  while (v5);
  return v4;
}

- (id)description
{
  int v3;
  uint64_t v4;
  void *v5;
  NSDictionary *value;
  void *v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSDictionary *opTokens;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSMutableArray *children;
  id v26;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  __CFString *v34;

  v3 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_10002D3E0;
  v33 = sub_10002D380;
  v34 = &stru_100219118;
  while (v3 < -[PCSCTreeNode level](self, "level"))
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v30[5], "stringByAppendingString:", CFSTR("  ")));
    v5 = (void *)v30[5];
    v30[5] = v4;

    ++v3;
  }
  value = self->_value;
  if (value)
  {
    v7 = (void *)v30[5];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](value, "allKeys"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
    v10 = self->_value;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](v10, "allKeys"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ : %@"), v9, v13));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", v14));
    v16 = (void *)v30[5];
    v30[5] = v15;

  }
  if (self->_operator)
  {
    v17 = (void *)v30[5];
    opTokens = self->_opTokens;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeysForObject:](opTokens, "allKeysForObject:", v19));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", 0));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v21));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", v22));
    v24 = (void *)v30[5];
    v30[5] = v23;

  }
  children = self->_children;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10017970C;
  v28[3] = &unk_100218E28;
  v28[4] = &v29;
  -[NSMutableArray enumerateObjectsUsingBlock:](children, "enumerateObjectsUsingBlock:", v28);
  v26 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v26;
}

+ (id)_convertOperator:(int64_t)a3
{
  if (qword_10026D160 != -1)
    dispatch_once(&qword_10026D160, &stru_100218E48);
  return objc_msgSend((id)qword_10026D158, "objectAtIndex:", a3);
}

+ (id)_translateNodeToDataAdaptor:(id)a3 dataDictionary:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DA%p"), v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v10, "setObject:forKey:", CFSTR("com.apple.ap.statuscondition"), CFSTR("adaptor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "value"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("identifier")));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "value"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("bundleID")));

  if (v12
    && v14
    && (v15 = objc_opt_class(NSNull), (objc_opt_isKindOfClass(v12, v15) & 1) == 0)
    && (v16 = objc_opt_class(NSNull), (objc_opt_isKindOfClass(v14, v16) & 1) == 0))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v18, "setObject:forKey:", v12, CFSTR("conditionID"));
    objc_msgSend(v18, "setObject:forKey:", v14, CFSTR("bundleID"));
    objc_msgSend(v10, "setObject:forKey:", v18, CFSTR("inputs"));
    objc_msgSend(v7, "setObject:forKey:", v10, v9);
    v17 = v9;

  }
  else
  {
    v17 = 0;
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.statusconditionserror"), -1113, 0));
  }

  return v17;
}

+ (id)_translateRootNodeToExpressionFormat:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v23;
  id v24;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v5, "version")));
  objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("version"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[PCSCTreeNode _convertOperator:](PCSCTreeNode, "_convertOperator:", objc_msgSend(v5, "operator")));
  objc_msgSend(v9, "addObject:", v10);
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "children"));
  if (v11
    && (v12 = (void *)v11,
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "children")),
        v14 = objc_msgSend(v13, "count"),
        v13,
        v12,
        v14))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[PCSCTreeNode _translateChildNodesToExpressionFormat:dataDictionary:error:](PCSCTreeNode, "_translateChildNodesToExpressionFormat:dataDictionary:error:", v5, v7, a4));
    objc_msgSend(v9, "addObjectsFromArray:", v15);

  }
  else
  {
    v16 = objc_claimAutoreleasedReturnValue(+[PCSCTreeNode _translateNodeToDataAdaptor:dataDictionary:error:](PCSCTreeNode, "_translateNodeToDataAdaptor:dataDictionary:error:", v5, v7, a4));
    if (!v16)
    {
      v21 = 0;
      goto LABEL_8;
    }
    v17 = (void *)v16;
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("data"));
    objc_msgSend(v9, "addObject:", v17);

  }
  objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("expression"));
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("data"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));
  v23 = v19;
  v20 = objc_msgSend(v6, "copy");
  v24 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));

LABEL_8:
  return v21;
}

+ (id)_translateChildNodesToExpressionFormat:(id)a3 dataDictionary:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v19 = v7;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "children"));
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v14, "operator"))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[PCSCTreeNode _convertOperator:](PCSCTreeNode, "_convertOperator:", objc_msgSend(v14, "operator")));
          objc_msgSend(v15, "addObject:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[PCSCTreeNode _translateChildNodesToExpressionFormat:dataDictionary:error:](PCSCTreeNode, "_translateChildNodesToExpressionFormat:dataDictionary:error:", v14, v8, a5));
          objc_msgSend(v15, "addObjectsFromArray:", v17);
          objc_msgSend(v9, "addObject:", v15);

        }
        else
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[PCSCTreeNode _translateNodeToDataAdaptor:dataDictionary:error:](PCSCTreeNode, "_translateNodeToDataAdaptor:dataDictionary:error:", v14, v8, a5));
          objc_msgSend(v9, "addObject:", v15);
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  return v9;
}

- (PCSCTreeNode)parent
{
  return (PCSCTreeNode *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (NSDictionary)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (int64_t)operator
{
  return self->_operator;
}

- (void)setOperator:(int64_t)a3
{
  self->_operator = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (NSDictionary)opTokens
{
  return self->_opTokens;
}

- (void)setOpTokens:(id)a3
{
  objc_storeStrong((id *)&self->_opTokens, a3);
}

- (NSDictionary)typeTokens
{
  return self->_typeTokens;
}

- (void)setTypeTokens:(id)a3
{
  objc_storeStrong((id *)&self->_typeTokens, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeTokens, 0);
  objc_storeStrong((id *)&self->_opTokens, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
}

@end
