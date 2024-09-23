@implementation PXAlertAction

- (PXAlertAction)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAlert.m"), 322, CFSTR("%s is not available as initializer"), "-[PXAlertAction init]");

  abort();
}

- (PXAlertAction)initWithTitle:(id)a3 style:(int64_t)a4 action:(id)a5
{
  id v9;
  id v10;
  PXAlertAction *v11;
  uint64_t v12;
  NSString *title;
  uint64_t v14;
  id action;
  void *v17;
  objc_super v18;

  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAlert.m"), 326, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title != nil"));

  }
  v18.receiver = self;
  v18.super_class = (Class)PXAlertAction;
  v11 = -[PXAlertAction init](&v18, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v12;

    v11->_style = a4;
    v14 = objc_msgSend(v10, "copy");
    action = v11->_action;
    v11->_action = (id)v14;

  }
  return v11;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)style
{
  return self->_style;
}

- (id)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
