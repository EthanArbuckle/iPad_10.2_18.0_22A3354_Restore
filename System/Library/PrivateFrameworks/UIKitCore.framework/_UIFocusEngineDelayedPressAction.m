@implementation _UIFocusEngineDelayedPressAction

- (id)_initWithPressType:(int64_t)a3 timestamp:(double)a4 sender:(id)a5
{
  id v9;
  _UIFocusEngineDelayedPressAction *v10;
  _UIFocusEngineDelayedPressAction *v11;
  void *v13;
  objc_super v14;

  v9 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusEventRecognizer.m"), 3494, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sender"));

  }
  v14.receiver = self;
  v14.super_class = (Class)_UIFocusEngineDelayedPressAction;
  v10 = -[_UIFocusEngineDelayedPressAction init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_sender, v9);
    v11->_pressType = a3;
    v11->_timestamp = a4;
  }

  return v11;
}

+ (void)sendDelayedPressWithType:(int64_t)a3 timestamp:(double)a4 sender:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = -[_UIFocusEngineDelayedPressAction _initWithPressType:timestamp:sender:]([_UIFocusEngineDelayedPressAction alloc], "_initWithPressType:timestamp:sender:", a3, v7, a4);

  v10[0] = *MEMORY[0x1E0C99860];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performSelector:withObject:afterDelay:inModes:", sel__sendPressEvent, 0, v9, 0.0);

}

- (void)_sendPressEvent
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIPressInfo *v15;

  -[_UIFocusEngineDelayedPressAction sender](self, "sender");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v15 = (UIPressInfo *)v3;
    -[_UIFocusEngineDelayedPressAction sender](self, "sender");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "owningView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "_contextId"))
    {

      goto LABEL_7;
    }
    -[_UIFocusEngineDelayedPressAction sender](self, "sender");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "owningView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v15 = objc_alloc_init(UIPressInfo);
      -[UIPressInfo setType:](v15, "setType:", -[_UIFocusEngineDelayedPressAction pressType](self, "pressType"));
      -[_UIFocusEngineDelayedPressAction timestamp](self, "timestamp");
      -[UIPressInfo setTimestamp:](v15, "setTimestamp:");
      -[UIPressInfo setSource:](v15, "setSource:", 3);
      -[_UIFocusEngineDelayedPressAction sender](self, "sender");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "owningView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIFocusEngineDelayedPressAction sender](self, "sender");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "owningView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_window");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPressInfo setContextID:](v15, "setContextID:", objc_msgSend(v14, "_contextId"));

      -[UIPressInfo setPhase:](v15, "setPhase:", 0);
      -[UIPressInfo setForce:](v15, "setForce:", 1.0);
      objc_msgSend((id)UIApp, "_sendButtonEventWithPressInfo:", v15);
      -[UIPressInfo setPhase:](v15, "setPhase:", 3);
      -[UIPressInfo setForce:](v15, "setForce:", 0.0);
      objc_msgSend((id)UIApp, "_sendButtonEventWithPressInfo:", v15);
LABEL_7:

    }
  }
}

- (_UIFocusEventRecognizer)sender
{
  return (_UIFocusEventRecognizer *)objc_loadWeakRetained((id *)&self->_sender);
}

- (int64_t)pressType
{
  return self->_pressType;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sender);
}

@end
