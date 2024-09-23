@implementation WFUIRecordingEventState

- (WFUIRecordingEventState)initWithEvent:(id)a3
{
  id v5;
  WFUIRecordingEventState *v6;
  uint64_t v7;
  WFUIRUserEvent *event;
  WFUIRecordingEventState *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFUIRecordingEventParameter.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFUIRecordingEventState;
  v6 = -[WFUIRecordingEventState init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    event = v6->_event;
    v6->_event = (WFUIRUserEvent *)v7;

    v9 = v6;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  WFUIRecordingEventState *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (WFUIRecordingEventState *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFUIRecordingEventState event](v4, "event");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFUIRecordingEventState event](self, "event");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFUIRecordingEventState event](self, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSArray)containedVariables
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  -[WFUIRecordingEventState event](self, "event");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a5 + 2))(v7, v8, 0);

}

- (WFUIRecordingEventState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v6;
  WFUIRUserEvent *v7;
  WFUIRecordingEventState *v8;

  v6 = a3;
  v7 = -[WFUIRUserEvent initWithSerializedRepresentation:]([WFUIRUserEvent alloc], "initWithSerializedRepresentation:", v6);

  if (v7)
    v8 = (WFUIRecordingEventState *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEvent:", v7);
  else
    v8 = 0;

  return v8;
}

- (WFPropertyListObject)serializedRepresentation
{
  void *v2;
  void *v3;

  -[WFUIRecordingEventState event](self, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serializedRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFPropertyListObject *)v3;
}

- (WFUIRUserEvent)event
{
  return self->_event;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end
