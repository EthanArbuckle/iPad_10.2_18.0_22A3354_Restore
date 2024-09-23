@implementation WFStaccatoActionTemplate(WorkflowKit)

- (id)initWithIdentifier:()WorkflowKit sectionIdentifier:linkAction:
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  objc_super v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFStaccatoActionTemplate_WorkflowKit.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifier"));

    if (v11)
      goto LABEL_4;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFStaccatoActionTemplate_WorkflowKit.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  if (!v10)
    goto LABEL_19;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFStaccatoActionTemplate_WorkflowKit.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("linkAction"));

LABEL_4:
  v33.receiver = a1;
  v33.super_class = (Class)&off_1EF70C288;
  v12 = objc_msgSendSuper2(&v33, sel_init);
  if (v12)
  {
    v13 = v11;
    v14 = v13;
    if (v11)
    {
      if (objc_msgSend(v13, "conformsToProtocol:", &unk_1EF716E70))
        v15 = v14;
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
    v16 = v15;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v16, "hiddenParameterKeysForStaccato");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    }
    v18 = v17;
    objc_msgSend(v14, "parameters");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __89__WFStaccatoActionTemplate_WorkflowKit__initWithIdentifier_sectionIdentifier_linkAction___block_invoke;
    v30[3] = &unk_1E7AA8070;
    v20 = v18;
    v31 = v20;
    v21 = v14;
    v32 = v21;
    objc_msgSend(v19, "if_compactMap:", v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v16, "staccatoNameOverride");
    else
      objc_msgSend(v21, "localizedName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedDescriptionSummary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v12, "initWithIdentifier:sectionIdentifier:actionIdentifier:localizedTitle:localizedDescription:parameters:", v9, v10, v24, v23, v25, v22);

  }
  return v12;
}

@end
