@implementation PUEditActionActivity

- (PUEditActionActivity)initWithActionName:(id)a3 activityType:(id)a4 systemImageName:(id)a5
{
  id v8;
  id v9;
  id v10;
  PUEditActionActivity *v11;
  uint64_t v12;
  NSString *actionName;
  uint64_t v14;
  NSString *systemImageName;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PUEditActionActivity;
  v11 = -[UIActivity init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    actionName = v11->_actionName;
    v11->_actionName = (NSString *)v12;

    v14 = objc_msgSend(v10, "copy");
    systemImageName = v11->_systemImageName;
    v11->_systemImageName = (NSString *)v14;

    objc_storeStrong((id *)&v11->_internalActivityType, a4);
  }

  return v11;
}

- (id)activityType
{
  return self->_internalActivityType;
}

- (id)activityTitle
{
  return self->_actionName;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t (**v7)(_QWORD, _QWORD, _QWORD);

  v4 = a3;
  -[PUEditActionActivity canPerformActivityActionHandler](self, "canPerformActivityActionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (-[PUEditActionActivity disablesInsteadOfHides](self, "disablesInsteadOfHides"))
    {
      v6 = 1;
    }
    else
    {
      -[PUEditActionActivity canPerformActivityActionHandler](self, "canPerformActivityActionHandler");
      v7 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v6 = ((uint64_t (**)(_QWORD, id, PUEditActionActivity *))v7)[2](v7, v4, self);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_isDisabled
{
  uint64_t (**v3)(_QWORD, _QWORD, _QWORD);
  int v4;

  if (-[PUEditActionActivity disablesInsteadOfHides](self, "disablesInsteadOfHides"))
  {
    -[PUEditActionActivity canPerformActivityActionHandler](self, "canPerformActivityActionHandler");
    v3 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4 = ((uint64_t (**)(_QWORD, _QWORD, PUEditActionActivity *))v3)[2](v3, MEMORY[0x1E0C9AA60], self) ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)performActivity
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);

  -[PUEditActionActivity performActivityActionHandler](self, "performActivityActionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUEditActionActivity performActivityActionHandler](self, "performActivityActionHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, PUEditActionActivity *))v4)[2](v4, self);

  }
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

- (NSString)actionName
{
  return self->_actionName;
}

- (void)setActionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void)setSystemImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)disablesInsteadOfHides
{
  return self->_disablesInsteadOfHides;
}

- (void)setDisablesInsteadOfHides:(BOOL)a3
{
  self->_disablesInsteadOfHides = a3;
}

- (id)performActivityActionHandler
{
  return self->_performActivityActionHandler;
}

- (void)setPerformActivityActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)canPerformActivityActionHandler
{
  return self->_canPerformActivityActionHandler;
}

- (void)setCanPerformActivityActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)internalActivityType
{
  return self->_internalActivityType;
}

- (void)setInternalActivityType:(id)a3
{
  objc_storeStrong((id *)&self->_internalActivityType, a3);
}

- (id)activityBlock
{
  return self->_activityBlock;
}

- (void)setActivityBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activityBlock, 0);
  objc_storeStrong((id *)&self->_internalActivityType, 0);
  objc_storeStrong(&self->_canPerformActivityActionHandler, 0);
  objc_storeStrong(&self->_performActivityActionHandler, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
}

+ (int64_t)activityCategory
{
  return 0;
}

@end
