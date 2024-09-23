@implementation SUPolicyRollback

- (SUPolicyRollback)initWithRollbackOptions:(id)a3
{
  id v5;
  SUPolicyRollback *v6;
  SUPolicyRollback *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUPolicyRollback;
  v6 = -[SUPolicyRollback init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rollbackOptions, a3);

  return v7;
}

- (BOOL)cancelActiveUpdate
{
  return -[SURollbackOptions cancelActiveUpdate](self->_rollbackOptions, "cancelActiveUpdate");
}

- (SURollbackOptions)rollbackOptions
{
  return self->_rollbackOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rollbackOptions, 0);
}

@end
