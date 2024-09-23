@implementation WFActionWillRunLNActionTestingEvent

- (WFActionWillRunLNActionTestingEvent)initWithAction:(id)a3 lnAction:(id)a4
{
  id v7;
  id v8;
  WFActionWillRunLNActionTestingEvent *v9;
  WFActionWillRunLNActionTestingEvent *v10;
  WFActionWillRunLNActionTestingEvent *v11;
  void *v13;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionWillRunLNActionTestingEvent.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lnAction"));

  }
  v14.receiver = self;
  v14.super_class = (Class)WFActionWillRunLNActionTestingEvent;
  v9 = -[WFActionTestingEvent initWithAction:](&v14, sel_initWithAction_, v7);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lnAction, a4);
    v11 = v10;
  }

  return v10;
}

- (LNAction)lnAction
{
  return self->_lnAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lnAction, 0);
}

@end
