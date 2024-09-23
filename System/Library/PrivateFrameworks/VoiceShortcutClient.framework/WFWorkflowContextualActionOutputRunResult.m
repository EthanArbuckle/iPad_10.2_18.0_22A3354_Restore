@implementation WFWorkflowContextualActionOutputRunResult

- (WFWorkflowContextualActionOutputRunResult)initWithOutput:(id)a3 files:(id)a4 runError:(id)a5 reversalState:(id)a6
{
  id v11;
  id v12;
  WFWorkflowContextualActionOutputRunResult *v13;
  WFWorkflowContextualActionOutputRunResult *v14;
  uint64_t v15;
  NSData *reversalState;
  WFWorkflowContextualActionOutputRunResult *v17;
  objc_super v19;

  v11 = a4;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)WFWorkflowContextualActionOutputRunResult;
  v13 = -[WFWorkflowOutputRunResult initWithOutput:runError:](&v19, sel_initWithOutput_runError_, a3, a5);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_files, a4);
    v15 = objc_msgSend(v12, "copy");
    reversalState = v14->_reversalState;
    v14->_reversalState = (NSData *)v15;

    v17 = v14;
  }

  return v14;
}

- (WFWorkflowContextualActionOutputRunResult)initWithCoder:(id)a3
{
  id v4;
  WFWorkflowContextualActionOutputRunResult *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *files;
  uint64_t v11;
  NSData *reversalState;
  WFWorkflowContextualActionOutputRunResult *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFWorkflowContextualActionOutputRunResult;
  v5 = -[WFWorkflowOutputRunResult initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("files"));
    v9 = objc_claimAutoreleasedReturnValue();
    files = v5->_files;
    v5->_files = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reversalState"));
    v11 = objc_claimAutoreleasedReturnValue();
    reversalState = v5->_reversalState;
    v5->_reversalState = (NSData *)v11;

    v13 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFWorkflowContextualActionOutputRunResult;
  v4 = a3;
  -[WFWorkflowOutputRunResult encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[WFWorkflowContextualActionOutputRunResult files](self, "files", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("files"));

  -[WFWorkflowContextualActionOutputRunResult reversalState](self, "reversalState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("reversalState"));

}

- (NSArray)files
{
  return self->_files;
}

- (NSData)reversalState
{
  return self->_reversalState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reversalState, 0);
  objc_storeStrong((id *)&self->_files, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
