@implementation WFStaccatoActionTemplateParameterValue(WorkflowKit)

- (id)initWithAction:()WorkflowKit state:parameter:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  objc_super v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFStaccatoActionTemplate_WorkflowKit.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFStaccatoActionTemplate_WorkflowKit.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameter"));

LABEL_3:
  v29.receiver = a1;
  v29.super_class = (Class)&off_1EF70C9D0;
  v13 = objc_msgSendSuper2(&v29, sel_init);
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v10;
      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
      }
      else
      {
        v15 = 0;
      }
      v19 = v15;

      objc_msgSend(v19, "value");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v18 = 0;
LABEL_20:
        objc_msgSend(v12, "localizedLabelForPossibleState:", v10);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedSubtitleLabelForPossibleState:", v10);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "accessoryImageForPossibleState:", v10);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "serializedRepresentation");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (id)objc_msgSend(v13, "initWithIdentifier:localizedTitle:localizedSubtitle:image:serializedState:", v18, v22, v23, v24, v25);

        goto LABEL_21;
      }
      v16 = v10;
      if (v16)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v16;
        else
          v17 = 0;
      }
      else
      {
        v17 = 0;
      }
      v20 = v17;

      objc_msgSend(v20, "value");
      v19 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "value");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      WFSerializedIdentifierFromLinkValue();
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_20;
  }
LABEL_21:

  return v13;
}

@end
