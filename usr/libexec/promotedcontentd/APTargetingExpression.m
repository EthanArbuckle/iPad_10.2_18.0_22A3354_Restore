@implementation APTargetingExpression

- (APTargetingExpression)initWithString:(id)a3
{
  id v4;
  void *v5;
  NSError *v6;
  void *v7;
  id v8;
  id v9;
  NSError *v10;
  APTargetingExpression *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSError *v15;
  NSError *error;
  id v18;
  NSErrorUserInfoKey v19;
  void *v20;
  NSErrorUserInfoKey v21;
  const __CFString *v22;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    v6 = (NSError *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataUsingEncoding:", 4));
    v18 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v6, 4, &v18));
    v8 = v18;
    v9 = v18;
    if (v9)
    {
      objc_storeStrong((id *)&self->_error, v8);
    }
    else
    {
      v12 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v7, v12) & 1) != 0)
      {
        self = -[APTargetingExpression initWithDictionary:](self, "initWithDictionary:", v7);
        v11 = self;
LABEL_10:

        goto LABEL_11;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid JSON object type in '%@'"), v5));
      v19 = NSLocalizedDescriptionKey;
      v20 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
      v15 = (NSError *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), -1112, v14));
      error = self->_error;
      self->_error = v15;

    }
    v11 = 0;
    goto LABEL_10;
  }
  v21 = NSLocalizedDescriptionKey;
  v22 = CFSTR("Targeting expression is nil or empty.");
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
  v10 = (NSError *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), -1122, v9));
  v11 = 0;
  v6 = self->_error;
  self->_error = v10;
LABEL_11:

  return v11;
}

- (APTargetingExpression)initWithDictionary:(id)a3
{
  id v4;
  APTargetingExpression *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  NSString *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *expressionDict;
  void *v14;
  uint64_t v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSError *v28;
  APTargetingExpression *v29;
  const __CFString **v30;
  NSErrorUserInfoKey *v31;
  void *v32;
  uint64_t v33;
  NSError *error;
  APTargetingExpression *v35;
  void *v36;
  uint64_t v37;
  NSError *v38;
  APTargetingExpression *v39;
  void *v40;
  uint64_t v41;
  NSError *v42;
  APTargetingExpression *v43;
  objc_super v45;
  NSErrorUserInfoKey v46;
  const __CFString *v47;
  NSErrorUserInfoKey v48;
  const __CFString *v49;
  NSErrorUserInfoKey v50;
  const __CFString *v51;
  NSErrorUserInfoKey v52;
  const __CFString *v53;
  NSErrorUserInfoKey v54;
  const __CFString *v55;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)APTargetingExpression;
  v5 = -[APTargetingExpression init](&v45, "init");
  if (!v5)
    goto LABEL_18;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v7;

  v9 = v5->_identifier;
  v10 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
  {
    v54 = NSLocalizedDescriptionKey;
    v55 = CFSTR("'identifier' must be a string.");
    v30 = &v55;
    v31 = &v54;
LABEL_13:
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v31, 1));
    v33 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), -1112, v32));
    error = v5->_error;
    v5->_error = (NSError *)v33;

    v35 = v5;
    goto LABEL_18;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
  expressionDict = v5->_expressionDict;
  v5->_expressionDict = (NSDictionary *)v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[APTargetingExpression expressionDict](v5, "expressionDict"));
  v15 = objc_opt_class(NSDictionary);
  isKindOfClass = objc_opt_isKindOfClass(v14, v15);

  if ((isKindOfClass & 1) == 0)
  {
    v52 = NSLocalizedDescriptionKey;
    v53 = CFSTR("Targeting expression must be a dictionary.");
    v30 = &v53;
    v31 = &v52;
    goto LABEL_13;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[APTargetingExpression expressionDict](v5, "expressionDict"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("expression")));

  v19 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[APTargetingExpression expressionDict](v5, "expressionDict"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("subexpressions")));

    if (v21 && (v22 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v21, v22) & 1) == 0))
    {
      v48 = NSLocalizedDescriptionKey;
      v49 = CFSTR("'subExpressions' must be a dictionary.");
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
      v41 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), -1112, v40));
      v42 = v5->_error;
      v5->_error = (NSError *)v41;

      v43 = v5;
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[APTargetingExpression expressionDict](v5, "expressionDict"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("data")));

      if (v24)
      {
        v25 = objc_opt_class(NSDictionary);
        if ((objc_opt_isKindOfClass(v24, v25) & 1) == 0)
        {
          v46 = NSLocalizedDescriptionKey;
          v47 = CFSTR("'data' must be a dictionary.");
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1));
          v27 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), -1112, v26));
          v28 = v5->_error;
          v5->_error = (NSError *)v27;

        }
      }
      v29 = v5;

    }
  }
  else
  {
    v50 = NSLocalizedDescriptionKey;
    v51 = CFSTR("'expression' must be an array.");
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1));
    v37 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), -1112, v36));
    v38 = v5->_error;
    v5->_error = (NSError *)v37;

    v39 = v5;
  }

LABEL_18:
  return v5;
}

- (APExpressionEvaluationProtocol)rootNode
{
  APExpressionEvaluationProtocol *rootNode;
  APTargetingExpressionNode *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  APExpressionEvaluationProtocol *v12;
  NSError *v13;
  APExpressionEvaluationProtocol *v14;
  NSError *error;
  id v17;

  rootNode = self->_rootNode;
  if (!rootNode)
  {
    v4 = [APTargetingExpressionNode alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APTargetingExpression identifier](self, "identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[APTargetingExpression expressionDict](self, "expressionDict"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("expression")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[APTargetingExpression expressionDict](self, "expressionDict"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("subexpressions")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APTargetingExpression expressionDict](self, "expressionDict"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("data")));
    v17 = 0;
    v12 = -[APTargetingExpressionNode initWithParent:identifier:expressionOrReference:subExpressions:data:error:](v4, "initWithParent:identifier:expressionOrReference:subExpressions:data:error:", 0, v5, v7, v9, v11, &v17);
    v13 = (NSError *)v17;
    v14 = self->_rootNode;
    self->_rootNode = v12;

    error = self->_error;
    self->_error = v13;

    rootNode = self->_rootNode;
  }
  return rootNode;
}

- (BOOL)evaluate:(id *)a3
{
  return -[APTargetingExpression evaluateUsingLibrary:error:](self, "evaluateUsingLibrary:error:", 0, a3);
}

- (BOOL)evaluateUsingLibrary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APTargetingExpression rootNode](self, "rootNode"));
  LOBYTE(a4) = objc_msgSend(v7, "evaluateUsingLibrary:error:", v6, a4);

  return (char)a4;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setRootNode:(id)a3
{
  objc_storeStrong((id *)&self->_rootNode, a3);
}

- (NSDictionary)expressionDict
{
  return self->_expressionDict;
}

- (void)setExpressionDict:(id)a3
{
  objc_storeStrong((id *)&self->_expressionDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressionDict, 0);
  objc_storeStrong((id *)&self->_rootNode, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
