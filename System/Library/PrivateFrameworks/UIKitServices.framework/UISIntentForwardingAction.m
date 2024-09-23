@implementation UISIntentForwardingAction

- (UISIntentForwardingAction)initWithIntentForwardingAction:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  UISIntentForwardingAction *v14;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0D22FF0]);
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE1E7480))
  {
    objc_msgSend(v8, "setObject:forSetting:", v6, 5);
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("INIntentForwardingActionObjectKey"));
    objc_msgSend(v9, "encodedData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forSetting:", v10, 3);

  }
  v11 = (void *)MEMORY[0x1E0D22F60];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__UISIntentForwardingAction_initWithIntentForwardingAction_responseHandler___block_invoke;
  v16[3] = &unk_1E2CAF9E8;
  v17 = v7;
  v12 = v7;
  objc_msgSend(v11, "responderWithHandler:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTimeout:", dispatch_time(0, 10000000000));
  v14 = -[UISIntentForwardingAction initWithInfo:responder:](self, "initWithInfo:responder:", v8, v13);

  return v14;
}

void __76__UISIntentForwardingAction_initWithIntentForwardingAction_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "intentForwardingActionResponse");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
}

- (UISIntentForwardingAction)initWithIntent:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  UISIntentForwardingAction *v14;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0D22FF0]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("INIntentObjectKey"));
  objc_msgSend(v9, "encodedData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v10, 1);

  v11 = (void *)MEMORY[0x1E0D22F60];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__UISIntentForwardingAction_initWithIntent_reply___block_invoke;
  v16[3] = &unk_1E2CAF9E8;
  v17 = v7;
  v12 = v7;
  objc_msgSend(v11, "responderWithHandler:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTimeout:", dispatch_time(0, 10000000000));
  v14 = -[UISIntentForwardingAction initWithInfo:responder:](self, "initWithInfo:responder:", v8, v13);

  return v14;
}

void __50__UISIntentForwardingAction_initWithIntent_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "intentResponse");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
}

- (INIntent)intent
{
  INIntent *cachedIntent;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  INIntent *v9;
  INIntent *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  cachedIntent = self->_cachedIntent;
  if (!cachedIntent)
  {
    -[UISIntentForwardingAction info](self, "info");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForSetting:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      NSLog(CFSTR("%s: Invalid UISIntentForwardingAction object does not have data: %@"), "-[UISIntentForwardingAction intent]", self);
      return (INIntent *)0;
    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, 0);
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v7 = (void *)getINIntentClass_softClass;
    v16 = getINIntentClass_softClass;
    if (!getINIntentClass_softClass)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __getINIntentClass_block_invoke;
      v12[3] = &unk_1E2CAF658;
      v12[4] = &v13;
      __getINIntentClass_block_invoke((uint64_t)v12);
      v7 = (void *)v14[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v13, 8);
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", v8, CFSTR("INIntentObjectKey"));
    v9 = (INIntent *)objc_claimAutoreleasedReturnValue();
    v10 = self->_cachedIntent;
    self->_cachedIntent = v9;

    objc_msgSend(v6, "finishDecoding");
    cachedIntent = self->_cachedIntent;
  }
  return cachedIntent;
}

- (INIntentForwardingAction)intentForwardingAction
{
  INIntentForwardingAction **p_cachedIntentForwardingAction;
  INIntentForwardingAction *cachedIntentForwardingAction;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  INIntentForwardingAction *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  p_cachedIntentForwardingAction = &self->_cachedIntentForwardingAction;
  cachedIntentForwardingAction = self->_cachedIntentForwardingAction;
  if (!cachedIntentForwardingAction)
  {
    -[UISIntentForwardingAction info](self, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForSetting:", 5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_storeStrong((id *)p_cachedIntentForwardingAction, v6);
    }
    else
    {
      -[UISIntentForwardingAction info](self, "info");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForSetting:", 3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        NSLog(CFSTR("%s: Invalid UISIntentForwardingAction object does not have data: %@"), "-[UISIntentForwardingAction intentForwardingAction]", self);
        return (INIntentForwardingAction *)0;
      }
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v8, 0);
      v16 = 0;
      v17 = &v16;
      v18 = 0x2050000000;
      v10 = (void *)getINIntentForwardingActionClass_softClass;
      v19 = getINIntentForwardingActionClass_softClass;
      if (!getINIntentForwardingActionClass_softClass)
      {
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __getINIntentForwardingActionClass_block_invoke;
        v15[3] = &unk_1E2CAF658;
        v15[4] = &v16;
        __getINIntentForwardingActionClass_block_invoke((uint64_t)v15);
        v10 = (void *)v17[3];
      }
      v11 = objc_retainAutorelease(v10);
      _Block_object_dispose(&v16, 8);
      objc_msgSend(v9, "decodeObjectOfClass:forKey:", v11, CFSTR("INIntentForwardingActionObjectKey"));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *p_cachedIntentForwardingAction;
      *p_cachedIntentForwardingAction = (INIntentForwardingAction *)v12;

      objc_msgSend(v9, "finishDecoding");
    }

    cachedIntentForwardingAction = *p_cachedIntentForwardingAction;
  }
  return cachedIntentForwardingAction;
}

- (int64_t)UIActionType
{
  return 27;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("intent forwarding action");
  if (a3 != 3)
    v3 = 0;
  if (a3 == 1)
    return CFSTR("intent");
  else
    return (id)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedIntentForwardingAction, 0);
  objc_storeStrong((id *)&self->_cachedIntent, 0);
}

@end
