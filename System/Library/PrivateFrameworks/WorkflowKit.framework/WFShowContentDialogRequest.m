@implementation WFShowContentDialogRequest

- (WFShowContentDialogRequest)initWithContentCollection:(id)a3 attribution:(id)a4 prompt:(id)a5
{
  id v8;
  WFShowContentDialogRequest *v9;
  uint64_t v10;
  NSData *archivedContentCollection;
  uint64_t v12;
  WFContentCollection *cachedContentCollection;
  uint64_t v14;
  WFDialogButton *doneButton;
  uint64_t v16;
  WFDialogButton *cancelButton;
  WFShowContentDialogRequest *v18;
  NSObject *v19;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WFShowContentDialogRequest;
  v9 = -[WFDialogRequest initWithAttribution:prompt:](&v21, sel_initWithAttribution_prompt_, a4, a5);
  if (!v9)
  {
LABEL_7:
    v18 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB36F8], "wf_securelyArchivedDataWithRootObject:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  archivedContentCollection = v9->_archivedContentCollection;
  v9->_archivedContentCollection = (NSData *)v10;

  if (!v9->_archivedContentCollection)
  {
    getWFGeneralLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[WFShowContentDialogRequest initWithContentCollection:attribution:prompt:]";
      v24 = 2114;
      v25 = 0;
      _os_log_impl(&dword_1C15B3000, v19, OS_LOG_TYPE_FAULT, "%s Unable to archive content collection: %{public}@", buf, 0x16u);
    }

    goto LABEL_7;
  }
  v12 = objc_msgSend(v8, "copy");
  cachedContentCollection = v9->_cachedContentCollection;
  v9->_cachedContentCollection = (WFContentCollection *)v12;

  objc_msgSend(MEMORY[0x1E0DC7AD8], "doneButton");
  v14 = objc_claimAutoreleasedReturnValue();
  doneButton = v9->_doneButton;
  v9->_doneButton = (WFDialogButton *)v14;

  objc_msgSend(MEMORY[0x1E0DC7AD8], "cancelButton");
  v16 = objc_claimAutoreleasedReturnValue();
  cancelButton = v9->_cancelButton;
  v9->_cancelButton = (WFDialogButton *)v16;

  v18 = v9;
LABEL_8:

  return v18;
}

- (void)getContentCollectionWithCompletionHandler:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void (**v8)(void *, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[6];
  _QWORD aBlock[4];
  id v18;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFShowContentDialogRequest.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__WFShowContentDialogRequest_getContentCollectionWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E7AF50F8;
  v7 = v5;
  v18 = v7;
  v8 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[WFShowContentDialogRequest cachedContentCollection](self, "cachedContentCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[WFShowContentDialogRequest cachedContentCollection](self, "cachedContentCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v10);

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB3710];
    -[WFShowContentDialogRequest archivedContentCollection](self, "archivedContentCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __72__WFShowContentDialogRequest_getContentCollectionWithCompletionHandler___block_invoke_3;
    v16[3] = &unk_1E7AF5120;
    v16[4] = self;
    v16[5] = v8;
    v14 = (id)objc_msgSend(v11, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v12, v13, v16);

  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogRequest attribution](self, "attribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogRequest prompt](self, "prompt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFShowContentDialogRequest cachedContentCollection](self, "cachedContentCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, title: %@, prompt: %@, contentCollection (if loaded): %@>"), v5, self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (WFShowContentDialogRequest)initWithCoder:(id)a3
{
  id v4;
  WFShowContentDialogRequest *v5;
  uint64_t v6;
  NSData *archivedContentCollection;
  uint64_t v8;
  WFDialogButton *doneButton;
  uint64_t v10;
  WFDialogButton *cancelButton;
  WFShowContentDialogRequest *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFShowContentDialogRequest;
  v5 = -[WFDialogRequest initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("archivedContentCollection"));
    v6 = objc_claimAutoreleasedReturnValue();
    archivedContentCollection = v5->_archivedContentCollection;
    v5->_archivedContentCollection = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("doneButton"));
    v8 = objc_claimAutoreleasedReturnValue();
    doneButton = v5->_doneButton;
    v5->_doneButton = (WFDialogButton *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cancelButton"));
    v10 = objc_claimAutoreleasedReturnValue();
    cancelButton = v5->_cancelButton;
    v5->_cancelButton = (WFDialogButton *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFShowContentDialogRequest;
  v4 = a3;
  -[WFDialogRequest encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[WFShowContentDialogRequest archivedContentCollection](self, "archivedContentCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("archivedContentCollection"));

  -[WFShowContentDialogRequest doneButton](self, "doneButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("doneButton"));

  -[WFShowContentDialogRequest cancelButton](self, "cancelButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("cancelButton"));

}

- (WFDialogButton)doneButton
{
  return self->_doneButton;
}

- (WFDialogButton)cancelButton
{
  return self->_cancelButton;
}

- (NSData)archivedContentCollection
{
  return self->_archivedContentCollection;
}

- (void)setArchivedContentCollection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (WFContentCollection)cachedContentCollection
{
  return self->_cachedContentCollection;
}

- (void)setCachedContentCollection:(id)a3
{
  objc_storeStrong((id *)&self->_cachedContentCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedContentCollection, 0);
  objc_storeStrong((id *)&self->_archivedContentCollection, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
}

void __72__WFShowContentDialogRequest_getContentCollectionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __72__WFShowContentDialogRequest_getContentCollectionWithCompletionHandler___block_invoke_2;
    v4[3] = &unk_1E7AF76F0;
    v6 = *(id *)(a1 + 32);
    v5 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
}

void __72__WFShowContentDialogRequest_getContentCollectionWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    getWFGeneralLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v5 = 136315138;
      v6 = "-[WFShowContentDialogRequest getContentCollectionWithCompletionHandler:]_block_invoke_3";
      _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_FAULT, "%s Unable to unarchive content collection.", (uint8_t *)&v5, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "setCachedContentCollection:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __72__WFShowContentDialogRequest_getContentCollectionWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
