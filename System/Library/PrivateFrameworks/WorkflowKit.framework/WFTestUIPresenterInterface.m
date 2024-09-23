@implementation WFTestUIPresenterInterface

- (WFTestUIPresenterInterface)initWithTestCase:(id)a3 backgroundRunner:(id)a4
{
  id v7;
  id v8;
  WFTestUIPresenterInterface *v9;
  WFTestUIPresenterInterface *v10;
  WFTestUIPresenterInterface *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFTestUIPresenterInterface;
  v9 = -[WFTestUIPresenterInterface init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_testCase, a3);
    objc_storeWeak((id *)&v10->_backgroundRunner, v8);
    v11 = v10;
  }

  return v10;
}

- (void)showDialogRequest:(id)a3 runningContext:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void (**v31)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[3];

  v42[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  -[WFTestUIPresenterInterface backgroundRunner](self, "backgroundRunner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dialogTransformer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentAction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v9, "contextForAction:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentTestCase");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "interactions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __81__WFTestUIPresenterInterface_showDialogRequest_runningContext_completionHandler___block_invoke;
    v34[3] = &unk_1E7AEACF8;
    v16 = v7;
    v35 = v16;
    v17 = v12;
    v36 = v17;
    objc_msgSend(v14, "if_compactMap:", v34);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "currentTestCase");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handledInteractions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "unionSet:", v18);

    if (objc_msgSend(v18, "count"))
    {
      if ((unint64_t)objc_msgSend(v18, "count") < 2)
      {
        objc_msgSend(v18, "anyObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "interaction");
        v31 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v32[0] = v15;
        v32[1] = 3221225472;
        v32[2] = __81__WFTestUIPresenterInterface_showDialogRequest_runningContext_completionHandler___block_invoke_2;
        v32[3] = &unk_1E7AEAD20;
        v33 = v8;
        ((void (**)(_QWORD, void *, id, _QWORD *))v31)[2](v31, v11, v16, v32);

        v23 = v33;
        goto LABEL_9;
      }
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v37 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Test UI presenter asked to present dialog %@ but there were multiple matching interactions found"), v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v21;
      v25 = 4;
    }
    else
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v39 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Test UI presenter asked to present dialog %@ but there were no matching interactions found"), v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v29;
      v25 = 3;
    }
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("WFHarnessTestErrorDomain"), v25, v23);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v30);

LABEL_9:
    v27 = v35;
    goto LABEL_10;
  }
  v26 = (void *)MEMORY[0x1E0CB35C8];
  v41 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Test UI presenter asked to present dialog %@ while no action is running"), v7);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v42[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("WFHarnessTestErrorDomain"), 2, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v28);

LABEL_10:
}

- (void)dismissPresentedContentForRunningContext:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)performSiriRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void (**v31)(id, void *);
  void (**v32)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v33[4];
  void (**v34)(id, void *);
  _QWORD v35[4];
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[WFTestUIPresenterInterface backgroundRunner](self, "backgroundRunner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dialogTransformer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentAction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "contextForAction:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentTestCase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "siriInteractions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __67__WFTestUIPresenterInterface_performSiriRequest_completionHandler___block_invoke;
    v35[3] = &unk_1E7AEAD48;
    v15 = v6;
    v36 = v15;
    v16 = v11;
    v37 = v16;
    objc_msgSend(v13, "if_compactMap:", v35);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "currentTestCase");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handledSiriInteractions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "unionSet:", v17);

    if (objc_msgSend(v17, "count"))
    {
      if ((unint64_t)objc_msgSend(v17, "count") < 2)
        goto LABEL_9;
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v38 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Test UI presenter asked to perform Siri request %@ but there were multiple matching interactions found"), v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v20;
      v24 = 7;
    }
    else
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v40 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Test UI presenter asked to perform Siri request %@ but there were no matching interactions found"), v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v29;
      v24 = 6;
    }
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("WFHarnessTestErrorDomain"), v24, v22);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = MEMORY[0x1E0C809B0];
    if (v30)
    {
      v31 = (void (**)(id, void *))objc_msgSend(objc_alloc(MEMORY[0x1E0DC7CA0]), "initWithError:", v30);
      v7[2](v7, v31);
LABEL_10:

      v28 = v36;
      goto LABEL_11;
    }
LABEL_9:
    objc_msgSend(v17, "anyObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "interaction");
    v32 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v33[0] = v14;
    v33[1] = 3221225472;
    v33[2] = __67__WFTestUIPresenterInterface_performSiriRequest_completionHandler___block_invoke_2;
    v33[3] = &unk_1E7AEAD70;
    v34 = v7;
    ((void (**)(_QWORD, void *, id, _QWORD *))v32)[2](v32, v10, v15, v33);

    v31 = v34;
    goto LABEL_10;
  }
  v25 = (void *)MEMORY[0x1E0CB35C8];
  v42 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Test UI presenter asked to perform Siri request %@ while no action is running"), v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("WFHarnessTestErrorDomain"), 5, v27);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7CA0]), "initWithError:", v16);
  v7[2](v7, v28);
LABEL_11:

}

- (void)performDialogRequest:(id)a3 completionHandler:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;

  v5 = (objc_class *)MEMORY[0x1E0DC7AF0];
  v6 = a4;
  v7 = (id)objc_msgSend([v5 alloc], "initWithResponseCode:", 4);
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (WFHarnessTestCase)testCase
{
  return self->_testCase;
}

- (WFBackgroundShortcutRunner)backgroundRunner
{
  return (WFBackgroundShortcutRunner *)objc_loadWeakRetained((id *)&self->_backgroundRunner);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backgroundRunner);
  objc_storeStrong((id *)&self->_testCase, 0);
}

id __67__WFTestUIPresenterInterface_performSiriRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "siriActionRequestClass");
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v3, "selector"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "matchesContext:", *(_QWORD *)(a1 + 40)),
        v4,
        v5))
  {
    v6 = v3;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __67__WFTestUIPresenterInterface_performSiriRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a3);
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0DC7CA0]);
    objc_msgSend(v9, "errorRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithError:", v7);
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);

  }
}

id __81__WFTestUIPresenterInterface_showDialogRequest_runningContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "dialogRequestClass");
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v3, "selector"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "matchesContext:", *(_QWORD *)(a1 + 40)),
        v4,
        v5))
  {
    v6 = v3;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __81__WFTestUIPresenterInterface_showDialogRequest_runningContext_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32), a3, 0);
  }
  else
  {
    objc_msgSend(a2, "errorRepresentation");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v4);

  }
}

@end
