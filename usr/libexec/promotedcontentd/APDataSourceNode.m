@implementation APDataSourceNode

- (APDataSourceNode)initWithParent:(id)a3 identifier:(id)a4 dataSource:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  APDataSourceNode *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  void *v21;
  objc_super v22;
  NSErrorUserInfoKey v23;
  void *v24;
  NSErrorUserInfoKey v25;
  void *v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)APDataSourceNode;
  v13 = -[APDataSourceNode init](&v22, "init");
  if (!v13)
  {
    a6 = 0;
    goto LABEL_13;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("adaptor")));
  if (v14)
  {
    v15 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    {
      objc_storeStrong((id *)&v13->_adaptorIdentifier, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("inputs")));
      if (!v16 || (v17 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v16, v17) & 1) != 0))
      {
        objc_storeStrong((id *)&v13->_identifier, a4);
        objc_storeStrong((id *)&v13->_inputs, v16);
        objc_storeWeak((id *)&v13->_parent, v10);
        a6 = v13;
LABEL_10:

        goto LABEL_11;
      }
      if (!a6)
        goto LABEL_10;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Adaptor '%@' specifies inputs which are not a dictionary."), v14));
      v23 = NSLocalizedDescriptionKey;
      v24 = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), -1112, v21));

LABEL_9:
      a6 = 0;
      goto LABEL_10;
    }
  }
  if (a6)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Adaptor name '%@' is nil or an invalid type."), v14));
    v25 = NSLocalizedDescriptionKey;
    v26 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), -1112, v18));

    goto LABEL_9;
  }
LABEL_11:

LABEL_13:
  return (APDataSourceNode *)a6;
}

- (BOOL)evaluate:(id *)a3
{
  return -[APDataSourceNode evaluateUsingLibrary:error:](self, "evaluateUsingLibrary:error:", 0, a3);
}

- (BOOL)evaluateUsingLibrary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[7];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  NSErrorUserInfoKey v27;
  void *v28;
  NSErrorUserInfoKey v29;
  void *v30;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[APDataAdaptorRepository sharedRepository](APDataAdaptorRepository, "sharedRepository"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APDataSourceNode adaptorIdentifier](self, "adaptorIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "adaptorWithIdentifier:", v8));

  if (!v9)
  {
    if (!a4)
      goto LABEL_9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[APDataSourceNode adaptorIdentifier](self, "adaptorIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Adaptor '%@' is not registered."), v12));

    v29 = NSLocalizedDescriptionKey;
    v30 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), -1130, v14));

LABEL_8:
    LOBYTE(a4) = 0;
    goto LABEL_9;
  }
  v10 = objc_opt_class(APDataAdaptor);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
  {
    if (!a4)
      goto LABEL_9;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[APDataSourceNode adaptorIdentifier](self, "adaptorIdentifier"));
    v16 = (objc_class *)objc_opt_class(v9);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Adaptor '%@' is of unsupported type '%@'."), v15, v18));

    v27 = NSLocalizedDescriptionKey;
    v28 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.dataadaptors"), 5203, v20));

    goto LABEL_8;
  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APDataSourceNode inputs](self, "inputs"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10008F5B0;
  v22[3] = &unk_100213220;
  v22[5] = &v23;
  v22[6] = a4;
  v22[4] = self;
  objc_msgSend(v9, "runWithParametersSync:handler:", v11, v22);

  LOBYTE(a4) = *((_BYTE *)v24 + 24) != 0;
  _Block_object_dispose(&v23, 8);
LABEL_9:

  return (char)a4;
}

- (NSArray)children
{
  return self->_children;
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

- (NSString)adaptorIdentifier
{
  return self->_adaptorIdentifier;
}

- (void)setAdaptorIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_adaptorIdentifier, a3);
}

- (NSDictionary)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_adaptorIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_children, 0);
}

@end
