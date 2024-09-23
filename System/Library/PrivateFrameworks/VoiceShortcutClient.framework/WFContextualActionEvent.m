@implementation WFContextualActionEvent

- (WFContextualActionEvent)initWithAction:(id)a3 contentTypes:(id)a4 containerName:(id)a5 surface:(unint64_t)a6
{
  id v12;
  id v13;
  id v14;
  WFContextualActionEvent *v15;
  WFContextualActionEvent *v16;
  WFContextualActionEvent *v17;
  void *v19;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualActionEvent.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

  }
  v20.receiver = self;
  v20.super_class = (Class)WFContextualActionEvent;
  v15 = -[WFContextualActionEvent init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_action, a3);
    objc_storeStrong((id *)&v16->_contentTypes, a4);
    objc_storeStrong((id *)&v16->_containerName, a5);
    v16->_surface = a6;
    v17 = v16;
  }

  return v16;
}

- (WFContextualAction)action
{
  return self->_action;
}

- (NSArray)contentTypes
{
  return self->_contentTypes;
}

- (NSString)containerName
{
  return self->_containerName;
}

- (unint64_t)surface
{
  return self->_surface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerName, 0);
  objc_storeStrong((id *)&self->_contentTypes, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
