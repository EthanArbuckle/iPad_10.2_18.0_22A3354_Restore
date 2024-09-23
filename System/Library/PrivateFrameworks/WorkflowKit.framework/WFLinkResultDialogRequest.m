@implementation WFLinkResultDialogRequest

- (WFLinkResultDialogRequest)initWithSuccessResult:(id)a3 attribution:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  WFLinkResultDialogRequest *v10;
  uint64_t v11;
  LNSuccessResult *v12;
  uint64_t v13;
  WFDialogButton *doneButton;
  WFLinkResultDialogRequest *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "output");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewSnippet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)WFLinkResultDialogRequest;
  v10 = -[WFLinkSnippetDialogRequest initWithViewSnippet:attribution:](&v17, sel_initWithViewSnippet_attribution_, v9, v7);

  if (v10)
  {
    v11 = objc_msgSend(v6, "copy");
    v12 = v10->_result;
    v10->_result = (LNSuccessResult *)v11;

    objc_msgSend(MEMORY[0x1E0DC7AD8], "doneButton");
    v13 = objc_claimAutoreleasedReturnValue();
    doneButton = v10->_doneButton;
    v10->_doneButton = (WFDialogButton *)v13;

    v15 = v10;
  }

  return v10;
}

- (void)getCATResultWithCompletionHandler:(id)a3
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  void (**v16)(id, void *);

  v5 = (void (**)(id, void *))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkResultDialogRequest.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[WFLinkResultDialogRequest catResult](self, "catResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFLinkResultDialogRequest catResult](self, "catResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v7);

  }
  else
  {
    -[WFLinkResultDialogRequest result](self, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "output");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dialog");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[WFLinkResultDialogRequest result](self, "result");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "output");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dialog");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __63__WFLinkResultDialogRequest_getCATResultWithCompletionHandler___block_invoke;
      v15[3] = &unk_1E7AF0770;
      v15[4] = self;
      v16 = v5;
      objc_msgSend(v13, "getResultWithCompletionHandler:", v15);

    }
    else
    {
      v5[2](v5, 0);
    }
  }

}

- (WFLinkResultDialogRequest)initWithCoder:(id)a3
{
  id v4;
  WFLinkResultDialogRequest *v5;
  uint64_t v6;
  LNSuccessResult *v7;
  uint64_t v8;
  WFDialogButton *doneButton;
  WFLinkResultDialogRequest *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFLinkResultDialogRequest;
  v5 = -[WFLinkSnippetDialogRequest initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("result"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v5->_result;
    v5->_result = (LNSuccessResult *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("doneButton"));
    v8 = objc_claimAutoreleasedReturnValue();
    doneButton = v5->_doneButton;
    v5->_doneButton = (WFDialogButton *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFLinkResultDialogRequest;
  v4 = a3;
  -[WFLinkSnippetDialogRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[WFLinkResultDialogRequest result](self, "result", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("result"));

  -[WFLinkResultDialogRequest doneButton](self, "doneButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("doneButton"));

}

- (WFDialogButton)doneButton
{
  return self->_doneButton;
}

- (LNSuccessResult)result
{
  return self->_result;
}

- (LNDialogResult)catResult
{
  return self->_catResult;
}

- (void)setCatResult:(id)a3
{
  objc_storeStrong((id *)&self->_catResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catResult, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
}

void __63__WFLinkResultDialogRequest_getCATResultWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void (*v8)(void);
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    getWFWorkflowExecutionLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[WFLinkResultDialogRequest getCATResultWithCompletionHandler:]_block_invoke";
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s Could not get CATResult, error: %@", (uint8_t *)&v9, 0x16u);
    }

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setCatResult:", v5);
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v8();

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
