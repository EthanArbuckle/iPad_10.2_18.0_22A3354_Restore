@implementation SBSSystemNotesConnectAction

- (SBSSystemNotesConnectAction)initWithSource:(unint64_t)a3 responder:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _SBSSystemNotesConnectActionSettingsDescriptionProvider *v10;
  SBSSystemNotesConnectAction *v11;
  void *v13;
  objc_super v14;

  v7 = a4;
  if (a3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSystemNotesConnectAction.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connectionSource < SBSSystemNotesSceneConnectionSourceCount"));

  }
  v8 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v9, 0);

  v10 = objc_alloc_init(_SBSSystemNotesConnectActionSettingsDescriptionProvider);
  objc_msgSend(v8, "setDescriptionProvider:", v10);

  v14.receiver = self;
  v14.super_class = (Class)SBSSystemNotesConnectAction;
  v11 = -[SBSSystemNotesConnectAction initWithInfo:responder:](&v14, sel_initWithInfo_responder_, v8, v7);

  return v11;
}

- (unint64_t)connectionSource
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;

  -[SBSSystemNotesConnectAction info](self, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForSetting:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  if (v6 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSystemNotesConnectAction.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceNum < SBSSystemNotesSceneConnectionSourceCount"));

  }
  return v6;
}

@end
