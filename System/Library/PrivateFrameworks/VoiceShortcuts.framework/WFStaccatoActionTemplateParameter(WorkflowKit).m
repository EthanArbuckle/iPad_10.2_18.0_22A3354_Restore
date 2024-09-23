@implementation WFStaccatoActionTemplateParameter(WorkflowKit)

- (id)initWithLinkAction:()WorkflowKit parameter:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFStaccatoActionTemplate_WorkflowKit.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFStaccatoActionTemplate_WorkflowKit.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameter"));

LABEL_3:
  v21.receiver = a1;
  v21.super_class = (Class)&off_1EF70C628;
  v10 = objc_msgSendSuper2(&v21, sel_init);
  if (v10)
  {
    objc_msgSend(v9, "key");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parameterStateForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7D80]), "initWithAction:state:parameter:", v7, v12, v9);
    else
      v13 = 0;
    objc_msgSend(v9, "key");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v10, "initWithKey:actionIdentifier:localizedLabel:localizedDescription:defaultValue:", v14, v15, v16, v17, v13);

  }
  return v10;
}

@end
