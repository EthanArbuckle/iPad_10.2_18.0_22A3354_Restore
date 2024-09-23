@implementation TUIAXCustomAction

- (TUIAXCustomAction)initWithTrigger:(id)a3 actionData:(id)a4 actionObject:(id)a5 actionDelegate:(id)a6 controlIdentifier:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  TUIAXCustomAction *v18;
  TUIAXCustomAction *v19;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TUIAXCustomAction;
  v18 = -[TUIAXCustomAction init](&v21, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_trigger, a3);
    objc_storeStrong((id *)&v19->_actionData, a4);
    objc_storeWeak((id *)&v19->_actionDelegate, v16);
    objc_storeStrong(&v19->_actionObject, a5);
    objc_storeStrong((id *)&v19->_controlIdentifier, a7);
  }

  return v19;
}

- (TUIAXCustomAction)initWithRefId:(id)a3 trigger:(id)a4
{
  id v7;
  id v8;
  TUIAXCustomAction *v9;
  TUIAXCustomAction *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUIAXCustomAction;
  v9 = -[TUIAXCustomAction init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_refId, a3);
    objc_storeStrong((id *)&v10->_trigger, a4);
  }

  return v10;
}

- (id)copyFromReference:(id)a3
{
  id v4;
  TUIAXCustomAction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  TUIAXCustomAction *v11;
  void *v12;

  v4 = a3;
  v5 = [TUIAXCustomAction alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trigger"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionObject"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionDelegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "controlIdentifier"));

  v11 = -[TUIAXCustomAction initWithTrigger:actionData:actionObject:actionDelegate:controlIdentifier:](v5, "initWithTrigger:actionData:actionObject:actionDelegate:controlIdentifier:", v6, v7, v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXCustomAction label](self, "label"));
  -[TUIAXCustomAction setLabel:](v11, "setLabel:", v12);

  -[TUIAXCustomAction setIsDefault:](v11, "setIsDefault:", -[TUIAXCustomAction isDefault](self, "isDefault"));
  return v11;
}

- (id)dereferenceByCollector:(id)a3
{
  __CFString *trigger;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  trigger = (__CFString *)self->_trigger;
  if (!trigger)
    trigger = CFSTR("press");
  v6 = trigger;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "customActionByRefIdAndTrigger"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", self->_refId));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v6));

  return v9;
}

- (BOOL)isReference
{
  return self->_refId != 0;
}

- (void)invokeWithArguments:(id)a3
{
  id WeakRetained;
  TUIElementBehaviorArgumentsMap *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  if (WeakRetained)
  {
    v5 = self->_actionData;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIElementBehaviorArgumentsMap arguments](v5, "arguments"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dictionaryByAddingEntriesFromDictionary:", v10));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIElementBehaviorArgumentsMap behavior](v5, "behavior"));
    if (v8)
    {
      v9 = objc_loadWeakRetained((id *)&self->_actionDelegate);
      objc_msgSend(v9, "handleActionForObject:withName:arguments:", self->_actionObject, v8, v7);

    }
  }

}

- (NSString)refId
{
  return self->_refId;
}

- (NSString)trigger
{
  return self->_trigger;
}

- (TUIElementBehaviorArgumentsMap)actionData
{
  return self->_actionData;
}

- (id)actionObject
{
  return self->_actionObject;
}

- (TUIActionHandlerDelegate)actionDelegate
{
  return (TUIActionHandlerDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (TUIIdentifier)controlIdentifier
{
  return self->_controlIdentifier;
}

- (void)setControlIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (void)setIsDefault:(BOOL)a3
{
  self->_isDefault = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_controlIdentifier, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong(&self->_actionObject, 0);
  objc_storeStrong((id *)&self->_actionData, 0);
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_refId, 0);
}

@end
