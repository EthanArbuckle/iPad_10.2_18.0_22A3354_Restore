@implementation WFHarnessActionContext

- (WFHarnessActionContext)initWithIdentifier:(id)a3 indexInWorkflow:(unint64_t)a4
{
  id v7;
  WFHarnessActionContext *v8;
  uint64_t v9;
  NSString *identifier;
  WFHarnessActionContext *v11;
  void *v13;
  objc_super v14;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHarnessActionSelector.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v14.receiver = self;
  v14.super_class = (Class)WFHarnessActionContext;
  v8 = -[WFHarnessActionContext init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v8->_indexInWorkflow = a4;
    v11 = v8;
  }

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)indexInWorkflow
{
  return self->_indexInWorkflow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
