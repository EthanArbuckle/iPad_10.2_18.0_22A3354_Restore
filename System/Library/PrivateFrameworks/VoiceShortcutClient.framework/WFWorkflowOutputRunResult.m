@implementation WFWorkflowOutputRunResult

- (WFWorkflowOutputRunResult)initWithOutput:(id)a3
{
  return -[WFWorkflowOutputRunResult initWithOutput:runError:](self, "initWithOutput:runError:", a3, 0);
}

- (WFWorkflowOutputRunResult)initWithOutput:(id)a3 runError:(id)a4
{
  id v7;
  WFWorkflowOutputRunResult *v8;
  WFWorkflowOutputRunResult *v9;
  void *v10;
  WFWorkflowOutputRunResult *v11;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFWorkflowOutputRunResult;
  v8 = -[WFWorkflowRunResult initWithError:](&v13, sel_initWithError_, a4);
  v9 = v8;
  if (v8)
  {
    if (v7)
    {
      -[WFWorkflowOutputRunResult generateRepresentationFromOutput:](v8, "generateRepresentationFromOutput:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    objc_storeStrong((id *)&v9->_archivedOutput, v10);
    if (v7)

    objc_storeStrong((id *)&v9->_cachedOutput, a3);
    v11 = v9;
  }

  return v9;
}

- (id)resultBySettingError:(id)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFWorkflowOutputRunResult;
  -[WFWorkflowRunResult resultBySettingError:](&v11, sel_resultBySettingError_, a3);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowOutputRunResult archivedOutput](self, "archivedOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copyWithZone:", 0);
  v7 = (void *)v4[2];
  v4[2] = v6;

  -[WFWorkflowOutputRunResult cachedOutput](self, "cachedOutput");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v4[3];
  v4[3] = v8;

  return self;
}

- (BOOL)hasOutput
{
  void *v2;
  BOOL v3;

  -[WFWorkflowOutputRunResult archivedOutput](self, "archivedOutput");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)getOutputWithCompletionHandler:(id)a3
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
  -[WFWorkflowOutputRunResult cachedOutput](self, "cachedOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFWorkflowOutputRunResult cachedOutput](self, "cachedOutput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6, 0);

  }
  else
  {
    -[WFWorkflowOutputRunResult archivedOutput](self, "archivedOutput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[WFWorkflowOutputRunResult archivedOutput](self, "archivedOutput");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __60__WFWorkflowOutputRunResult_getOutputWithCompletionHandler___block_invoke;
      v9[3] = &unk_1E5FC6610;
      v9[4] = self;
      v10 = v4;
      -[WFWorkflowOutputRunResult generateOutputFromRepresentation:withCompletion:](self, "generateOutputFromRepresentation:withCompletion:", v8, v9);

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

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowOutputRunResult cachedOutput](self, "cachedOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    -[WFWorkflowOutputRunResult archivedOutput](self, "archivedOutput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[WFWorkflowRunResult error](self, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p Output: %@, Error: %@"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  return v9;
}

- (id)generateRepresentationFromOutput:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "wf_securelyArchivedDataWithRootObject:deletionResponsibility:", a3, 1);
}

- (void)generateOutputFromRepresentation:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  Class v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = NSClassFromString((NSString *)CFSTR("WFContentCollection"));
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3710];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __77__WFWorkflowOutputRunResult_generateOutputFromRepresentation_withCompletion___block_invoke;
    v12[3] = &unk_1E5FC6270;
    v13 = v6;
    v10 = (id)objc_msgSend(v8, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v5, v9, v12);

  }
  else
  {
    getWFVoiceShortcutClientLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[WFWorkflowOutputRunResult generateOutputFromRepresentation:withCompletion:]";
      _os_log_impl(&dword_1AF681000, v11, OS_LOG_TYPE_FAULT, "%s Unable to get output from WFWorkflowRunRequest, since ContentKit isn't linked.", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (WFWorkflowOutputRunResult)initWithCoder:(id)a3
{
  id v4;
  WFWorkflowOutputRunResult *v5;
  uint64_t v6;
  NSData *archivedOutput;
  WFWorkflowOutputRunResult *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWorkflowOutputRunResult;
  v5 = -[WFWorkflowRunResult initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("archivedOutput"));
    v6 = objc_claimAutoreleasedReturnValue();
    archivedOutput = v5->_archivedOutput;
    v5->_archivedOutput = (NSData *)v6;

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
  v6.super_class = (Class)WFWorkflowOutputRunResult;
  v4 = a3;
  -[WFWorkflowRunResult encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFWorkflowOutputRunResult archivedOutput](self, "archivedOutput", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("archivedOutput"));

}

- (NSData)archivedOutput
{
  return self->_archivedOutput;
}

- (WFContentCollection)cachedOutput
{
  return self->_cachedOutput;
}

- (void)setCachedOutput:(id)a3
{
  objc_storeStrong((id *)&self->_cachedOutput, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedOutput, 0);
  objc_storeStrong((id *)&self->_archivedOutput, 0);
}

uint64_t __77__WFWorkflowOutputRunResult_generateOutputFromRepresentation_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__WFWorkflowOutputRunResult_getOutputWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setCachedOutput:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
