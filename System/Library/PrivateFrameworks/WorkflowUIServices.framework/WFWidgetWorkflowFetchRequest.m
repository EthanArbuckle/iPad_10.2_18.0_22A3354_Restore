@implementation WFWidgetWorkflowFetchRequest

- (WFWidgetWorkflowFetchRequest)initWithFetchType:(unint64_t)a3 identifier:(id)a4 limit:(unint64_t)a5 retryCount:(unint64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  WFWidgetWorkflowFetchRequest *v14;
  WFWidgetWorkflowFetchRequest *v15;
  uint64_t v16;
  NSString *identifier;
  uint64_t v18;
  id completionHandler;
  WFWidgetWorkflowFetchRequest *v20;
  objc_super v22;

  v12 = a4;
  v13 = a7;
  v22.receiver = self;
  v22.super_class = (Class)WFWidgetWorkflowFetchRequest;
  v14 = -[WFWidgetWorkflowFetchRequest init](&v22, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    v16 = objc_msgSend(v12, "copy");
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v16;

    v15->_limit = a5;
    v15->_retryCount = a6;
    v18 = objc_msgSend(v13, "copy");
    completionHandler = v15->_completionHandler;
    v15->_completionHandler = (id)v18;

    v20 = v15;
  }

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)WFWidgetWorkflowFetchRequest;
  -[WFWidgetWorkflowFetchRequest description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WFWidgetWorkflowFetchRequest type](self, "type"))
    v5 = CFSTR("collection");
  else
    v5 = CFSTR("single workflow");
  -[WFWidgetWorkflowFetchRequest identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, type: %@, identifier: %@, limit: %lu, retryCount: %lu>"), v4, v5, v6, -[WFWidgetWorkflowFetchRequest limit](self, "limit"), -[WFWidgetWorkflowFetchRequest retryCount](self, "retryCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
