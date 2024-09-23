@implementation SBUISystemApertureSceneAction

- (SBUISystemApertureSceneAction)initWithCommand:(int64_t)a3
{
  id v5;
  void *v6;
  SBUISystemApertureSceneAction *v7;
  objc_super v9;

  v5 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 0);

  v9.receiver = self;
  v9.super_class = (Class)SBUISystemApertureSceneAction;
  v7 = -[SBUISystemApertureSceneAction initWithInfo:responder:](&v9, sel_initWithInfo_responder_, v5, 0);

  return v7;
}

- (int64_t)command
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SBUISystemApertureSceneAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3)
    return 0;
  else
    return CFSTR("command");
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (a5)
  {
    v7 = 0;
  }
  else
  {
    SBUISystemApertureCommandDescription(objc_msgSend(a4, "unsignedIntegerValue", a3, v5, v6));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

@end
