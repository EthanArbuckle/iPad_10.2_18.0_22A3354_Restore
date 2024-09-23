@implementation REElementBlockAction

- (REElementBlockAction)initWithAction:(id)a3
{
  id v4;
  REElementBlockAction *v5;
  uint64_t v6;
  id action;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REElementBlockAction;
  v5 = -[REElementBlockAction init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    action = v5->_action;
    v5->_action = (id)v6;

  }
  return v5;
}

- (void)_performWithContext:(id)a3
{
  (*((void (**)(void))self->_action + 2))();
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)REElementBlockAction;
  v4 = -[REElementBlockAction copy](&v8, sel_copy, a3);
  v5 = objc_msgSend(self->_action, "copy");
  v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (unint64_t)hash
{
  return objc_msgSend(self->_action, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  BOOL v5;

  v4 = (id *)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4[3] == self->_action;

  return v5;
}

- (id)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
}

@end
