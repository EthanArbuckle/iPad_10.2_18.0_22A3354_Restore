@implementation SBSSystemNotesCreateAction

- (SBSSystemNotesCreateAction)initWithReason:(int64_t)a3 responder:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _SBSSystemNotesCreateActionSettingsDescriptionProvider *v10;
  SBSSystemNotesCreateAction *v11;
  void *v13;
  objc_super v14;

  v7 = a4;
  if (a3 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSystemNotesCreateAction.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason > SBSSystemNotesCreateReasonInvalid && reason < SBSSystemNotesCreateReasonCount"));

  }
  v8 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v9, 0);

  v10 = objc_alloc_init(_SBSSystemNotesCreateActionSettingsDescriptionProvider);
  objc_msgSend(v8, "setDescriptionProvider:", v10);

  v14.receiver = self;
  v14.super_class = (Class)SBSSystemNotesCreateAction;
  v11 = -[SBSSystemNotesCreateAction initWithInfo:responder:](&v14, sel_initWithInfo_responder_, v8, v7);

  return v11;
}

- (int64_t)reason
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;

  -[SBSSystemNotesCreateAction info](self, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForSetting:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  if (v6 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSystemNotesCreateAction.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reasonNum >= SBSSystemNotesCreateReasonInvalid && reasonNum <= SBSSystemNotesCreateReasonCount"));

  }
  return v6;
}

@end
