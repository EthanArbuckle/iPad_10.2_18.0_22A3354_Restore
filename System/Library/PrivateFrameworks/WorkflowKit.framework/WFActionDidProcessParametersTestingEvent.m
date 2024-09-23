@implementation WFActionDidProcessParametersTestingEvent

- (WFActionDidProcessParametersTestingEvent)initWithAction:(id)a3 processedParameters:(id)a4
{
  id v7;
  id v8;
  WFActionDidProcessParametersTestingEvent *v9;
  uint64_t v10;
  NSDictionary *processedParameters;
  WFActionDidProcessParametersTestingEvent *v12;
  void *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionDidProcessParametersTestingEvent.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("processedParameters"));

  }
  v15.receiver = self;
  v15.super_class = (Class)WFActionDidProcessParametersTestingEvent;
  v9 = -[WFActionTestingEvent initWithAction:](&v15, sel_initWithAction_, v7);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    processedParameters = v9->_processedParameters;
    v9->_processedParameters = (NSDictionary *)v10;

    v12 = v9;
  }

  return v9;
}

- (NSDictionary)processedParameters
{
  return self->_processedParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedParameters, 0);
}

@end
