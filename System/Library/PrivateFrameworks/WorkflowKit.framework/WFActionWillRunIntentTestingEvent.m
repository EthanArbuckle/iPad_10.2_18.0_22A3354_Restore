@implementation WFActionWillRunIntentTestingEvent

- (WFActionWillRunIntentTestingEvent)initWithAction:(id)a3 intent:(id)a4
{
  id v7;
  id v8;
  WFActionWillRunIntentTestingEvent *v9;
  WFActionWillRunIntentTestingEvent *v10;
  WFActionWillRunIntentTestingEvent *v11;
  void *v13;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionWillRunIntentTestingEvent.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("intent"));

  }
  v14.receiver = self;
  v14.super_class = (Class)WFActionWillRunIntentTestingEvent;
  v9 = -[WFActionTestingEvent initWithAction:](&v14, sel_initWithAction_, v7);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_intent, a4);
    v11 = v10;
  }

  return v10;
}

- (INIntent)intent
{
  return self->_intent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intent, 0);
}

@end
