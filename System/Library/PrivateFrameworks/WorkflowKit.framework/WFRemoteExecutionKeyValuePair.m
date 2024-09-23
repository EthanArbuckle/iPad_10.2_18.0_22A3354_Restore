@implementation WFRemoteExecutionKeyValuePair

- (WFRemoteExecutionKeyValuePair)initWithKey:(id)a3 value:(id)a4
{
  id v8;
  id v9;
  void *v10;
  WFRemoteExecutionKeyValuePair *v11;
  WFRemoteExecutionKeyValuePair *v12;
  WFRemoteExecutionKeyValuePair *v13;
  void *v15;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionKeyValuePair.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteExecutionKeyValuePair.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFRemoteExecutionKeyValuePair;
  v11 = -[WFRemoteExecutionKeyValuePair init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_key, a3);
    objc_storeStrong(&v12->_value, a4);
    v13 = v12;
  }

  return v12;
}

- (NSString)key
{
  return self->_key;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
