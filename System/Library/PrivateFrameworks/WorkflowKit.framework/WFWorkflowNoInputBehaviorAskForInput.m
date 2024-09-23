@implementation WFWorkflowNoInputBehaviorAskForInput

- (WFWorkflowNoInputBehaviorAskForInput)initWithContentItemClass:(Class)a3 serializedParameters:(id)a4
{
  id v8;
  WFWorkflowNoInputBehaviorAskForInput *v9;
  WFWorkflowNoInputBehaviorAskForInput *v10;
  WFWorkflowNoInputBehaviorAskForInput *v11;
  void *v13;
  objc_super v14;

  v8 = a4;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowNoInputBehavior.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentItemClass"));

  }
  v14.receiver = self;
  v14.super_class = (Class)WFWorkflowNoInputBehaviorAskForInput;
  v9 = -[WFWorkflowNoInputBehaviorAskForInput init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contentItemClass, a3);
    objc_storeStrong((id *)&v10->_serializedParameters, a4);
    v11 = v10;
  }

  return v10;
}

- (NSDictionary)serializedParameters
{
  NSDictionary *v3;
  void *v4;

  if (-[NSDictionary count](self->_serializedParameters, "count"))
  {
    v3 = self->_serializedParameters;
  }
  else
  {
    +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultSerializedParametersForActionSelectingContentOfType:", -[WFWorkflowNoInputBehaviorAskForInput contentItemClass](self, "contentItemClass"));
    v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)resolveWithUserInterface:(id)a3 runningDelegate:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowNoInputBehavior.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowNoInputBehavior.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WFWorkflowNoInputBehaviorAskForInput contentItemClass](self, "contentItemClass");
  -[WFWorkflowNoInputBehaviorAskForInput serializedParameters](self, "serializedParameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createActionForSelectingContentOfType:serializedParameters:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v10, "noInputBehavior:wantsToRunAction:completionHandler:", self, v16, v12);
  }
  else
  {
    getWFGeneralLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[WFWorkflowNoInputBehaviorAskForInput resolveWithUserInterface:runningDelegate:completionHandler:]";
      _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_FAULT, "%s Tried to run an Ask For input behavior, but the content type is unknown?", buf, 0xCu);
    }

    v12[2](v12, 0, 0);
  }

}

- (WFWorkflowNoInputBehaviorAskForInput)initWithSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  Class v8;
  void *v9;
  void *v10;
  WFWorkflowNoInputBehaviorAskForInput *v11;
  id v13;
  WFWorkflowNoInputBehaviorAskForInput *v14;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "behaviorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFNoInputBehaviorParametersIfBehavior(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v11 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ItemClass"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = NSClassFromString(v7);
    if (-[objc_class isSubclassOfClass:](v8, "isSubclassOfClass:", objc_opt_class()))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SerializedParameters"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
      }
      else
      {
        v10 = 0;
      }
      v13 = v10;

      v14 = -[WFWorkflowNoInputBehaviorAskForInput initWithContentItemClass:serializedParameters:](self, "initWithContentItemClass:serializedParameters:", v8, v13);
      self = v14;
      v11 = self;
      goto LABEL_11;
    }
  }
  else
  {

    v7 = 0;
  }
  v11 = 0;
LABEL_11:

LABEL_13:
  return v11;
}

- (id)serializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = CFSTR("ItemClass");
  NSStringFromClass(-[WFWorkflowNoInputBehaviorAskForInput contentItemClass](self, "contentItemClass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[WFWorkflowNoInputBehaviorAskForInput serializedParameters](self, "serializedParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFWorkflowNoInputBehaviorAskForInput serializedParameters](self, "serializedParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("SerializedParameters"));

  }
  objc_msgSend((id)objc_opt_class(), "behaviorName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "copy");
  WFNoInputBehaviorSerializedRepresentation(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (Class)contentItemClass
{
  return self->_contentItemClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItemClass, 0);
  objc_storeStrong((id *)&self->_serializedParameters, 0);
}

+ (id)behaviorName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (BOOL)resolvesInput
{
  return 1;
}

@end
