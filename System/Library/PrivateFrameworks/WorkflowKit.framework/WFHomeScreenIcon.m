@implementation WFHomeScreenIcon

- (WFHomeScreenIcon)initWithWorkflowIcon:(id)a3 customImageData:(id)a4
{
  id v8;
  id v9;
  WFHomeScreenIcon *v10;
  WFHomeScreenIcon *v11;
  WFHomeScreenIcon *v12;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHomeScreenIcon.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflowIcon"));

  }
  v15.receiver = self;
  v15.super_class = (Class)WFHomeScreenIcon;
  v10 = -[WFHomeScreenIcon init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_workflowIcon, a3);
    objc_storeStrong((id *)&v11->_customImageData, a4);
    v12 = v11;
  }

  return v11;
}

- (WFWorkflowIcon)workflowIcon
{
  return self->_workflowIcon;
}

- (NSData)customImageData
{
  return self->_customImageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customImageData, 0);
  objc_storeStrong((id *)&self->_workflowIcon, 0);
}

@end
