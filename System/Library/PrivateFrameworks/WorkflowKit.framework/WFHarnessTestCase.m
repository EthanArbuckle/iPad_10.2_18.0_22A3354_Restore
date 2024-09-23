@implementation WFHarnessTestCase

- (WFHarnessTestCase)initWithIdentifier:(id)a3 name:(id)a4 workflowRunDescriptor:(id)a5 input:(id)a6 automationType:(id)a7 interactions:(id)a8 siriInteractions:(id)a9 conditions:(id)a10 resultExpectation:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  WFHarnessTestCase *v21;
  id v22;
  id v23;
  id v24;
  WFHarnessTestCase *v25;
  uint64_t v26;
  NSString *identifier;
  uint64_t v28;
  NSString *name;
  uint64_t v30;
  NSString *automationType;
  uint64_t v32;
  NSMutableSet *handledInteractions;
  uint64_t v34;
  NSMutableSet *handledSiriInteractions;
  uint64_t v36;
  NSMutableSet *handledConditions;
  WFHarnessTestCase *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id obj;
  id v47;
  id v48;
  id v49;
  id v50;
  objc_super v51;

  v17 = a3;
  v18 = a4;
  v50 = a5;
  obj = a6;
  v49 = a6;
  v19 = a7;
  v47 = a8;
  v20 = a8;
  v21 = self;
  v22 = v20;
  v48 = a9;
  v23 = a10;
  v24 = a11;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21, CFSTR("WFHarnessTestCase.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v18)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21, CFSTR("WFHarnessTestCase.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

LABEL_3:
  if (v50)
  {
    if (v22)
      goto LABEL_5;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21, CFSTR("WFHarnessTestCase.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interactions"));

    if (v23)
      goto LABEL_6;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21, CFSTR("WFHarnessTestCase.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("runDescriptor"));

  if (!v22)
    goto LABEL_12;
LABEL_5:
  if (v23)
    goto LABEL_6;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21, CFSTR("WFHarnessTestCase.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("conditions"));

LABEL_6:
  v51.receiver = v21;
  v51.super_class = (Class)WFHarnessTestCase;
  v25 = -[WFHarnessTestCase init](&v51, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v17, "copy");
    identifier = v25->_identifier;
    v25->_identifier = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    name = v25->_name;
    v25->_name = (NSString *)v28;

    objc_storeStrong((id *)&v25->_runDescriptor, a5);
    objc_storeStrong((id *)&v25->_input, obj);
    v30 = objc_msgSend(v19, "copy");
    automationType = v25->_automationType;
    v25->_automationType = (NSString *)v30;

    objc_storeStrong((id *)&v25->_interactions, v47);
    objc_storeStrong((id *)&v25->_siriInteractions, a9);
    objc_storeStrong((id *)&v25->_conditions, a10);
    objc_storeStrong((id *)&v25->_resultExpectation, a11);
    v32 = objc_opt_new();
    handledInteractions = v25->_handledInteractions;
    v25->_handledInteractions = (NSMutableSet *)v32;

    v34 = objc_opt_new();
    handledSiriInteractions = v25->_handledSiriInteractions;
    v25->_handledSiriInteractions = (NSMutableSet *)v34;

    v36 = objc_opt_new();
    handledConditions = v25->_handledConditions;
    v25->_handledConditions = (NSMutableSet *)v36;

    v38 = v25;
  }

  return v25;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %p: name: %@, identifier: %@, runDescriptor: %@)"), v5, self, self->_name, self->_identifier, self->_runDescriptor);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (WFWorkflowRunDescriptor)runDescriptor
{
  return self->_runDescriptor;
}

- (WFContentCollection)input
{
  return self->_input;
}

- (NSString)automationType
{
  return self->_automationType;
}

- (NSSet)interactions
{
  return self->_interactions;
}

- (NSSet)siriInteractions
{
  return self->_siriInteractions;
}

- (NSSet)conditions
{
  return self->_conditions;
}

- (WFHarnessTestResultExpectation)resultExpectation
{
  return self->_resultExpectation;
}

- (NSMutableSet)handledInteractions
{
  return self->_handledInteractions;
}

- (NSMutableSet)handledSiriInteractions
{
  return self->_handledSiriInteractions;
}

- (NSMutableSet)handledConditions
{
  return self->_handledConditions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handledConditions, 0);
  objc_storeStrong((id *)&self->_handledSiriInteractions, 0);
  objc_storeStrong((id *)&self->_handledInteractions, 0);
  objc_storeStrong((id *)&self->_resultExpectation, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
  objc_storeStrong((id *)&self->_siriInteractions, 0);
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_automationType, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_runDescriptor, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
