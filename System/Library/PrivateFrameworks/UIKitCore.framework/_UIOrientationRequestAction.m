@implementation _UIOrientationRequestAction

- (_UIOrientationRequestAction)initWithRequestedInterfaceOrientationMask:(unint64_t)a3 completion:(id)a4
{
  return -[_UIOrientationRequestAction initWithRequestedInterfaceOrientationMask:callbackQueue:completion:](self, "initWithRequestedInterfaceOrientationMask:callbackQueue:completion:", a3, 0, a4);
}

- (_UIOrientationRequestAction)initWithRequestedInterfaceOrientationMask:(unint64_t)a3 callbackQueue:(id)a4 completion:(id)a5
{
  return -[_UIOrientationRequestAction initWithRequestedInterfaceOrientationMask:policy:callbackQueue:completion:](self, "initWithRequestedInterfaceOrientationMask:policy:callbackQueue:completion:", a3, 1, a4, a5);
}

- (_UIOrientationRequestAction)initWithRequestedInterfaceOrientationMask:(unint64_t)a3 policy:(unint64_t)a4 callbackQueue:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _UIOrientationRequestAction *v17;
  void *v19;
  objc_super v20;

  v11 = a5;
  v12 = a6;
  if (a4 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIOrientationRequestAction.m"), 30, CFSTR("A valid policy must be provided."));

  }
  v13 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0D016A0], "responderWithHandler:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forSetting:", v15, 1);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forSetting:", v16, 2);

  if (v11)
    objc_msgSend(v14, "setQueue:", v11);
  objc_msgSend(v14, "setTimeout:", dispatch_time(0, 2000000000));
  v20.receiver = self;
  v20.super_class = (Class)_UIOrientationRequestAction;
  v17 = -[_UIOrientationRequestAction initWithInfo:responder:](&v20, sel_initWithInfo_responder_, v13, v14);

  return v17;
}

- (unint64_t)requestedInterfaceOrientationMask
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[_UIOrientationRequestAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "unsignedIntValue");
  else
    v4 = 0;

  return v4;
}

- (unint64_t)policy
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[_UIOrientationRequestAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "unsignedIntValue");
  else
    v4 = 0;

  return v4;
}

- (int64_t)UIActionType
{
  return 49;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Requested policy");
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    return CFSTR("Requested interface orientation mask");
  else
    return (id)v3;
}

- (id)settings:(id)a3 valueDescriptionForFlag:(int64_t)a4 object:(id)a5 ofSetting:(unint64_t)a6
{
  id v8;
  id v9;
  __CFString *v10;
  int v11;
  const __CFString *v12;

  v8 = a3;
  v9 = a5;
  if (a6 != 2)
  {
    if (a6 == 1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "unsignedIntValue");
        BSInterfaceOrientationMaskDescription();
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  v11 = objc_msgSend(v9, "unsignedIntValue");
  v12 = CFSTR("honor user preference");
  if (v11 != 2)
    v12 = 0;
  if (v11 == 1)
    v10 = CFSTR("default");
  else
    v10 = (__CFString *)v12;
LABEL_12:

  return v10;
}

@end
