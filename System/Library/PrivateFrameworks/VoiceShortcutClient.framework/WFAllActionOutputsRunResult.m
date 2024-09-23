@implementation WFAllActionOutputsRunResult

- (WFAllActionOutputsRunResult)initWithActionOutputs:(id)a3 runError:(id)a4
{
  id v7;
  id v8;
  WFAllActionOutputsRunResult *v9;
  uint64_t v10;
  NSData *archivedOutputs;
  uint64_t v12;
  NSDictionary *cachedOutputs;
  WFAllActionOutputsRunResult *v14;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAllActionOutputsRunResult.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionOutputs"));

  }
  v17.receiver = self;
  v17.super_class = (Class)WFAllActionOutputsRunResult;
  v9 = -[WFWorkflowRunResult initWithError:](&v17, sel_initWithError_, v8);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "wf_securelyArchivedDataWithRootObject:deletionResponsibility:", v7, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    archivedOutputs = v9->_archivedOutputs;
    v9->_archivedOutputs = (NSData *)v10;

    v12 = objc_msgSend(v7, "copy");
    cachedOutputs = v9->_cachedOutputs;
    v9->_cachedOutputs = (NSDictionary *)v12;

    v14 = v9;
  }

  return v9;
}

- (BOOL)hasOutputs
{
  void *v2;
  BOOL v3;

  -[WFAllActionOutputsRunResult archivedOutputs](self, "archivedOutputs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)getActionOutputsWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  void (**v10)(id, void *, _QWORD);
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  -[WFAllActionOutputsRunResult cachedOutputs](self, "cachedOutputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFAllActionOutputsRunResult cachedOutputs](self, "cachedOutputs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6, 0);

  }
  else
  {
    -[WFAllActionOutputsRunResult archivedOutputs](self, "archivedOutputs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[WFAllActionOutputsRunResult archivedOutputs](self, "archivedOutputs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __69__WFAllActionOutputsRunResult_getActionOutputsWithCompletionHandler___block_invoke;
      v9[3] = &unk_1E5FC8308;
      v9[4] = self;
      v10 = v4;
      -[WFAllActionOutputsRunResult generateOutputsFromRepresentation:withCompletion:](self, "generateOutputsFromRepresentation:withCompletion:", v8, v9);

    }
    else
    {
      v4[2](v4, 0, 0);
    }
  }

}

- (id)unableToDecodeError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0CB28A8];
  v9[0] = *MEMORY[0x1E0CB2D68];
  WFLocalizedString(CFSTR("Unable to finish running"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = *MEMORY[0x1E0CB2D50];
  WFLocalizedString(CFSTR("The output of the shortcut could not be processed."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 0x7FFFFFFFFFFFFFFFLL, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)generateOutputsFromRepresentation:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  Class v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[3];
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = NSClassFromString((NSString *)CFSTR("WFContentCollection"));
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C99E60];
    v16[0] = v7;
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3710];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __80__WFAllActionOutputsRunResult_generateOutputsFromRepresentation_withCompletion___block_invoke;
    v14[3] = &unk_1E5FC8330;
    v15 = v6;
    v12 = (id)objc_msgSend(v11, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v5, v10, v14);

  }
  else
  {
    getWFVoiceShortcutClientLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[WFAllActionOutputsRunResult generateOutputsFromRepresentation:withCompletion:]";
      _os_log_impl(&dword_1AF681000, v13, OS_LOG_TYPE_FAULT, "%s Unable to get output from WFWorkflowRunRequest, since ContentKit isn't linked.", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (WFAllActionOutputsRunResult)initWithCoder:(id)a3
{
  id v4;
  WFAllActionOutputsRunResult *v5;
  uint64_t v6;
  NSData *archivedOutputs;
  WFAllActionOutputsRunResult *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFAllActionOutputsRunResult;
  v5 = -[WFWorkflowRunResult initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("archivedOutputs"));
    v6 = objc_claimAutoreleasedReturnValue();
    archivedOutputs = v5->_archivedOutputs;
    v5->_archivedOutputs = (NSData *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFAllActionOutputsRunResult;
  v4 = a3;
  -[WFWorkflowRunResult encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFAllActionOutputsRunResult archivedOutputs](self, "archivedOutputs", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("archivedOutputs"));

}

- (NSData)archivedOutputs
{
  return self->_archivedOutputs;
}

- (NSDictionary)cachedOutputs
{
  return self->_cachedOutputs;
}

- (void)setCachedOutputs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedOutputs, 0);
  objc_storeStrong((id *)&self->_archivedOutputs, 0);
}

uint64_t __80__WFAllActionOutputsRunResult_generateOutputsFromRepresentation_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__WFAllActionOutputsRunResult_getActionOutputsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setCachedOutputs:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
