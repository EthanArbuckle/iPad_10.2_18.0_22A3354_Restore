@implementation WFSiriWorkflowRunRequest

- (WFSiriWorkflowRunRequest)initWithOptions:(id)a3
{
  id v5;
  WFSiriWorkflowRunRequest *v6;
  WFSiriWorkflowRunRequest *v7;
  WFSiriWorkflowRunRequest *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriWorkflowRunRequest;
  v6 = -[WFWorkflowRunRequest initWithInput:presentationMode:](&v10, sel_initWithInput_presentationMode_, 0, 4);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_options, a3);
    v8 = v7;
  }

  return v7;
}

- (WFSiriWorkflowRunRequest)initWithCoder:(id)a3
{
  id v4;
  WFSiriWorkflowRunRequest *v5;
  uint64_t v6;
  WFSiriWorkflowRunnerClientOptions *options;
  WFSiriWorkflowRunRequest *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriWorkflowRunRequest;
  v5 = -[WFWorkflowRunRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("options"));
    v6 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (WFSiriWorkflowRunnerClientOptions *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFSiriWorkflowRunRequest;
  v4 = a3;
  -[WFWorkflowRunRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFSiriWorkflowRunRequest options](self, "options", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("options"));

}

- (BOOL)handlesSiriActionRequests
{
  return 1;
}

- (WFSiriWorkflowRunnerClientOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
