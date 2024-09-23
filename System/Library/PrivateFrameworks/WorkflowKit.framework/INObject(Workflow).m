@implementation INObject(Workflow)

- (void)wf_transformUsingCodableAttribute:()Workflow completionHandler:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("INObject+Workflow.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  objc_msgSend(a1, "displayImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__INObject_Workflow__wf_transformUsingCodableAttribute_completionHandler___block_invoke;
    v11[3] = &unk_1E7AF4968;
    v11[4] = a1;
    v12 = v8;
    objc_msgSend(v9, "wf_transformUsingCodableAttribute:completionHandler:", 0, v11);

  }
  else
  {
    (*((void (**)(id, void *))v8 + 2))(v8, a1);
  }

}

@end
