@implementation APTargetingExpressionNode

- (APTargetingExpressionNode)initWithParent:(id)a3 identifier:(id)a4 expressionOrReference:(id)a5 subExpressions:(id)a6 data:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  APTargetingExpressionNode *v19;
  id *p_isa;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v27;
  void *v28;
  objc_super v29;
  NSErrorUserInfoKey v30;
  void *v31;
  NSErrorUserInfoKey v32;
  void *v33;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v29.receiver = self;
  v29.super_class = (Class)APTargetingExpressionNode;
  v19 = -[APTargetingExpressionNode init](&v29, "init");
  p_isa = (id *)&v19->super.isa;
  if (!v19)
    goto LABEL_5;
  objc_storeStrong((id *)&v19->_identifier, a4);
  objc_storeWeak(p_isa + 1, v14);
  if ((int)objc_msgSend(p_isa, "level") < 6)
  {
    v23 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v16, v23) & 1) != 0)
    {
      v24 = objc_msgSend(p_isa, "_initWithExpression:subExpressions:data:error:", v16, v17, v18, a8);
    }
    else
    {
      v25 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v16, v25) & 1) == 0)
      {
        if (!a8)
          goto LABEL_11;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown expression type in %@"), p_isa));
        v30 = NSLocalizedDescriptionKey;
        v31 = v27;
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
        *a8 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), -1122, v28));

        goto LABEL_5;
      }
      v24 = objc_msgSend(p_isa, "_initWithReference:subExpressions:data:error:", v16, v17, v18, a8);
    }
    p_isa = (id *)v24;
    a8 = p_isa;
    goto LABEL_11;
  }
  if (a8)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Exceeded maximum nesting level of %d"), 5));
    v32 = NSLocalizedDescriptionKey;
    v33 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    *a8 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), -1111, v22));

LABEL_5:
    a8 = 0;
  }
LABEL_11:

  return (APTargetingExpressionNode *)a8;
}

- (id)_initWithExpression:(id)a3 subExpressions:(id)a4 data:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSErrorUserInfoKey v23;
  void *v24;
  NSErrorUserInfoKey v25;
  void *v26;
  NSErrorUserInfoKey v27;
  void *v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10 && (unint64_t)objc_msgSend(v10, "count") > 1)
  {
    v15 = opTokens();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", v17));

    if (v13)
    {
      v18 = objc_msgSend(v13, "integerValue");
      if (v18)
      {
        -[APTargetingExpressionNode setOperator:](self, "setOperator:", v18);
        a6 = (id *)objc_claimAutoreleasedReturnValue(-[APTargetingExpressionNode createChildrenFromExpression:subExpressions:data:error:](self, "createChildrenFromExpression:subExpressions:data:error:", v10, v11, v12, a6));
LABEL_14:

        goto LABEL_15;
      }
      if (!a6)
        goto LABEL_14;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown operator in expression %@"), v10));
      v23 = NSLocalizedDescriptionKey;
      v24 = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
      v21 = -1110;
    }
    else
    {
      if (!a6)
        goto LABEL_14;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Operator expected.\n%@"), v10));
      v25 = NSLocalizedDescriptionKey;
      v26 = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
      v21 = -1114;
    }
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), v21, v20));

    goto LABEL_13;
  }
  if (a6)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Expression requires at least 2 elements.\n%@"), v10));
    v27 = NSLocalizedDescriptionKey;
    v28 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), -1114, v14));

LABEL_13:
    a6 = 0;
    goto LABEL_14;
  }
LABEL_15:

  return a6;
}

- (id)_initWithReference:(id)a3 subExpressions:(id)a4 data:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  APTargetingExpressionNode *v15;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v11));
  if (v14)
    self = -[APTargetingExpressionNode _initWithExpression:subExpressions:data:error:](self, "_initWithExpression:subExpressions:data:error:", v14, v12, v13, a6);
  else
    objc_storeStrong((id *)&self->_identifier, a3);
  v15 = self;

  return v15;
}

- (id)createChildrenFromExpression:(id)a3 subExpressions:(id)a4 data:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char isKindOfClass;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  APTargetingExpressionNode *v22;
  uint64_t v23;
  char v24;
  APTargetingExpressionNode *v25;
  void *v26;
  APDataSourceNode *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  id v34;
  APTargetingExpressionNode *v35;
  void *v37;
  void *v38;
  APTargetingExpressionNode *v39;
  id v40;
  id v41;
  NSErrorUserInfoKey v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  NSErrorUserInfoKey v47;
  void *v48;

  v9 = a3;
  v41 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if ((unint64_t)objc_msgSend(v9, "count") < 2)
  {
LABEL_23:
    v34 = objc_msgSend(v11, "copy");
    -[APTargetingExpressionNode setChildren:](self, "setChildren:", v34);

    v35 = self;
    goto LABEL_24;
  }
  v12 = 1;
  v39 = self;
  v40 = v10;
  while (1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v12));
    v14 = objc_opt_class(NSString);
    isKindOfClass = objc_opt_isKindOfClass(v13, v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v12));
    if ((isKindOfClass & 1) != 0)
      break;
    v23 = objc_opt_class(NSArray);
    v24 = objc_opt_isKindOfClass(v16, v23);

    if ((v24 & 1) != 0)
    {
      v25 = [APTargetingExpressionNode alloc];
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v12));
      v22 = -[APTargetingExpressionNode initWithParent:identifier:expressionOrReference:subExpressions:data:error:](v25, "initWithParent:identifier:expressionOrReference:subExpressions:data:error:", self, 0, v16, v41, v10, a6);
      goto LABEL_20;
    }
LABEL_22:
    if (++v12 >= (unint64_t)objc_msgSend(v9, "count"))
      goto LABEL_23;
  }
  v17 = opTokens();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v16));

  if (!v19)
  {
    v20 = v11;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", v16));
    if (v21)
    {
      v22 = -[APTargetingExpressionNode initWithParent:identifier:expressionOrReference:subExpressions:data:error:]([APTargetingExpressionNode alloc], "initWithParent:identifier:expressionOrReference:subExpressions:data:error:", self, v16, v16, v41, v10, a6);
      if (v22)
      {
LABEL_7:
        -[APTargetingExpressionNode setParent:](v22, "setParent:", self);
LABEL_19:

        v11 = v20;
LABEL_20:

        if (v22)
        {
          objc_msgSend(v11, "addObject:", v22);

        }
        goto LABEL_22;
      }
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v16));
      if (v26)
      {
        v27 = [APDataSourceNode alloc];
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v16));
        v22 = -[APDataSourceNode initWithParent:identifier:dataSource:error:](v27, "initWithParent:identifier:dataSource:error:", self, v16, v28, a6);

        v10 = v40;
      }
      else
      {
        v22 = -[APExternalReferenceNode initWithIdentifier:]([APExternalReferenceNode alloc], "initWithIdentifier:", v16);
      }

      if (v22)
        goto LABEL_7;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[APTargetingExpressionNode identifier](self, "identifier"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to create child node %@ for node %@. Reference not found."), v16, v29));

    v31 = APLogForCategory(46);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v46 = v30;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    if (a6)
    {
      v43 = NSLocalizedDescriptionKey;
      v44 = v30;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), -1128, v33));

    }
    self = v39;
    v10 = v40;
    goto LABEL_19;
  }
  if (a6)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Duplicate operator '%@'"), v16));
    v47 = NSLocalizedDescriptionKey;
    v48 = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1));
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), -1118, v38));

  }
  v35 = 0;
LABEL_24:

  return v35;
}

- (int)level
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;

  v2 = objc_claimAutoreleasedReturnValue(-[APTargetingExpressionNode parent](self, "parent"));
  if (!v2)
    return 0;
  v3 = (void *)v2;
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

- (BOOL)evaluate:(id *)a3
{
  return -[APTargetingExpressionNode evaluateUsingLibrary:error:](self, "evaluateUsingLibrary:error:", 0, a3);
}

- (BOOL)evaluateUsingLibrary:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  id v15;
  unint64_t v16;
  void *v17;
  unsigned int v18;
  int64_t v19;
  void *v20;
  id v21;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[APTargetingExpressionNode children](self, "children"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APTargetingExpressionNode children](self, "children"));
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[APTargetingExpressionNode _evaluatableChildNode:error:](self, "_evaluatableChildNode:error:", 0, a4));
      v12 = v11;
      if (v11)
      {
        v13 = objc_msgSend(v11, "evaluateUsingLibrary:error:", v6, a4);
        if ((id)-[APTargetingExpressionNode operator](self, "operator") == (id)4)
        {
          LOBYTE(v13) = v13 ^ 1;
LABEL_21:

          goto LABEL_22;
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[APTargetingExpressionNode children](self, "children"));
        v15 = objc_msgSend(v14, "count");

        if ((unint64_t)v15 < 2)
          goto LABEL_21;
        v16 = 1;
        while (1)
        {
          v17 = v12;
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[APTargetingExpressionNode _evaluatableChildNode:error:](self, "_evaluatableChildNode:error:", v16, a4));

          if (!v12)
            break;
          v18 = objc_msgSend(v12, "evaluateUsingLibrary:error:", v6, a4);
          if (a4)
          {
            if (*a4)
              break;
          }
          v19 = -[APTargetingExpressionNode operator](self, "operator");
          if (v19 == 3)
          {
            v13 |= v18;
          }
          else if (v19 == 2)
          {
            v13 &= v18;
          }
          else
          {
            v13 = 0;
            if (a4)
              *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), -1110, 0));
          }
          ++v16;
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[APTargetingExpressionNode children](self, "children"));
          v21 = objc_msgSend(v20, "count");

          if (v16 >= (unint64_t)v21)
            goto LABEL_21;
        }
      }
      LOBYTE(v13) = 0;
      goto LABEL_21;
    }
  }
  LOBYTE(v13) = 0;
LABEL_22:

  return v13 & 1;
}

- (id)_evaluatableChildNode:(unint64_t)a3 error:(id *)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSErrorUserInfoKey v19;
  void *v20;
  uint8_t buf[4];
  void *v22;

  v7 = objc_claimAutoreleasedReturnValue(-[APTargetingExpressionNode children](self, "children"));
  if (!v7)
    return 0;
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APTargetingExpressionNode children](self, "children"));
  v10 = objc_msgSend(v9, "count");

  if ((unint64_t)v10 <= a3)
    return 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APTargetingExpressionNode children](self, "children"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", a3));

  if ((objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___APExpressionEvaluationProtocol) & 1) != 0)
  {
    v13 = v12;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Child node %lu does not conform to APExpressionEvaluationProtocol."), a3));
    v16 = APLogForCategory(46);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    if (a4)
    {
      v19 = NSLocalizedDescriptionKey;
      v20 = v15;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), -1121, v18));

    }
    v13 = 0;
  }

  return v13;
}

- (APExpressionNodeProtocol)parent
{
  return (APExpressionNodeProtocol *)objc_loadWeakRetained((id *)&self->_parent);
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

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)operator
{
  return self->_operator;
}

- (void)setOperator:(int64_t)a3
{
  self->_operator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
}

@end
