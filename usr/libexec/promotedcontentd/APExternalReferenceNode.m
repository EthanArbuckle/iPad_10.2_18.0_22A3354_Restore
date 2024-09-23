@implementation APExternalReferenceNode

- (APExternalReferenceNode)initWithIdentifier:(id)a3
{
  id v5;
  APExternalReferenceNode *v6;
  APExternalReferenceNode *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APExternalReferenceNode;
  v6 = -[APExternalReferenceNode init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

- (BOOL)evaluate:(id *)a3
{
  return -[APExternalReferenceNode evaluateUsingLibrary:error:](self, "evaluateUsingLibrary:error:", 0, a3);
}

- (BOOL)evaluateUsingLibrary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSErrorUserInfoKey v16;
  void *v17;
  uint8_t buf[4];
  void *v19;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APExternalReferenceNode identifier](self, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "referenceFromIdentifier:error:", v7, a4));

  if (v8)
  {
    v9 = objc_msgSend(v8, "evaluateUsingLibrary:error:", v6, a4);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APExternalReferenceNode identifier](self, "identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to resolve node with identifier '%@'"), v10));

    v12 = APLogForCategory(6);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    if (a4)
    {
      v16 = NSLocalizedDescriptionKey;
      v17 = v11;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), -1131, v14));

    }
    v9 = 0;
  }

  return v9;
}

- (APExpressionNodeProtocol)parent
{
  return (APExpressionNodeProtocol *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_parent);
}

@end
