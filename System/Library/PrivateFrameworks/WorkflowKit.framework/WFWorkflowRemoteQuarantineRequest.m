@implementation WFWorkflowRemoteQuarantineRequest

- (WFWorkflowRemoteQuarantineRequest)initWithWorkflowRecord:(id)a3
{
  id v5;
  WFWorkflowRemoteQuarantineRequest *v6;
  WFWorkflowRemoteQuarantineRequest *v7;
  WFWorkflowRemoteQuarantineRequest *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWorkflowRemoteQuarantineRequest;
  v6 = -[WFBaseRemoteQuarantineRequest init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workflowRecord, a3);
    v8 = v7;
  }

  return v7;
}

- (id)workflowName
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[WFWorkflowRemoteQuarantineRequest workflowRecord](self, "workflowRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[WFWorkflow defaultName](WFWorkflow, "defaultName");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)workflowJavaScriptCoreRepresentationWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[WFWorkflowRemoteQuarantineRequest workflowRecord](self, "workflowRecord", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "rootObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE90]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v9, CFSTR("WFCurrentBundleVersion"));

  -[WFWorkflowRemoteQuarantineRequest workflowName](self, "workflowName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v10, CFSTR("WFWorkflowName"));

  WFJavaScriptCoreRepresentationFromPropertyList();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)defaultLocalizedDeniedErrorTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("“%@” contains known malware. You should delete this shortcut."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRemoteQuarantineRequest workflowName](self, "workflowName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)defaultLocalizedDeniedErrorMessage
{
  return &stru_1E7AFA810;
}

- (id)javaScriptCoreRepresentationWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  -[WFWorkflowRemoteQuarantineRequest workflowJavaScriptCoreRepresentation](self, "workflowJavaScriptCoreRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_4;
  -[WFWorkflowRemoteQuarantineRequest workflowJavaScriptCoreRepresentationWithError:](self, "workflowJavaScriptCoreRepresentationWithError:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    -[WFWorkflowRemoteQuarantineRequest setWorkflowJavaScriptCoreRepresentation:](self, "setWorkflowJavaScriptCoreRepresentation:", v6);

LABEL_4:
    v9.receiver = self;
    v9.super_class = (Class)WFWorkflowRemoteQuarantineRequest;
    -[WFBaseRemoteQuarantineRequest javaScriptCoreRepresentationWithError:](&v9, sel_javaScriptCoreRepresentationWithError_, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)policyFunctionName
{
  return CFSTR("decidePolicyForWorkflowQuarantineRequest");
}

- (WFWorkflowRecord)workflowRecord
{
  return self->_workflowRecord;
}

- (NSDictionary)workflowJavaScriptCoreRepresentation
{
  return self->_workflowJavaScriptCoreRepresentation;
}

- (void)setWorkflowJavaScriptCoreRepresentation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowJavaScriptCoreRepresentation, 0);
  objc_storeStrong((id *)&self->_workflowRecord, 0);
}

+ (id)JSONKeyPathsByPropertyKey
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFWorkflowRemoteQuarantineRequest;
  objc_msgSendSuper2(&v6, sel_JSONKeyPathsByPropertyKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v7 = CFSTR("workflowJavaScriptCoreRepresentation");
  v8[0] = CFSTR("workflow");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  return v3;
}

@end
