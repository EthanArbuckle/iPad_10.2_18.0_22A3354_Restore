@implementation WFStaccatoActionTemplateParameterValueSection(WorkflowKit)

- (uint64_t)initWithSection:()WorkflowKit action:parameter:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  id (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id v26;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __95__WFStaccatoActionTemplateParameterValueSection_WorkflowKit__initWithSection_action_parameter___block_invoke;
  v24 = &unk_1E7AA8098;
  v25 = v8;
  v26 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v11, "if_compactMap:", &v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "title", v21, v22, v23, v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subtitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "image");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "wf_image");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(a1, "initWithTitle:subtitle:image:values:", v15, v16, v18, v14);

  return v19;
}

@end
