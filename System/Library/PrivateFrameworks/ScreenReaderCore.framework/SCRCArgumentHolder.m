@implementation SCRCArgumentHolder

- (SCRCArgumentHolder)init
{
  SCRCArgumentHolder *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCRCArgumentHolder;
  result = -[SCRCArgumentHolder init](&v3, sel_init);
  if (result)
    result->_action = 0;
  return result;
}

- (SCRCArgumentHolder)initWithArgument:(id)a3 option:(id)a4 description:(id)a5 target:(id)a6 action:(SEL)a7 required:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  SCRCArgumentHolder *v18;
  SCRCArgumentHolder *v19;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SCRCArgumentHolder;
  v18 = -[SCRCArgumentHolder init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_argument, a3);
    objc_storeStrong((id *)&v19->_option, a4);
    objc_storeStrong((id *)&v19->_argumentDescription, a5);
    objc_storeWeak(&v19->_target, v17);
    v19->_action = a7;
    v19->_required = a8;
  }

  return v19;
}

- (BOOL)process
{
  uint64_t v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  char v10;

  -[SCRCArgumentHolder target](self, "target");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3 && (v4 = (void *)v3, v5 = -[SCRCArgumentHolder action](self, "action"), v4, v5))
  {
    -[SCRCArgumentHolder target](self, "target");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SCRCArgumentHolder action](self, "action");
    -[SCRCArgumentHolder argument](self, "argument");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SCRCPerformSelector(v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SCRCArgumentHolder required](self, "required") ^ 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "BOOLValue");
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SCRCArgumentHolder option](self, "option");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "option");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[SCRCArgumentHolder option](self, "option");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "option");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:options:", v6, 1);
  return v7;
}

- (NSString)option
{
  return self->_option;
}

- (NSString)argument
{
  return self->_argument;
}

- (void)setArgument:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)argumentDescription
{
  return self->_argumentDescription;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (SEL)action
{
  return self->_action;
}

- (BOOL)required
{
  return self->_required;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_argumentDescription, 0);
  objc_storeStrong((id *)&self->_argument, 0);
  objc_storeStrong((id *)&self->_option, 0);
}

@end
