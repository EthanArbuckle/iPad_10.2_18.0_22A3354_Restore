@implementation _PXCardAction

- (_PXCardAction)init
{
  return -[_PXCardAction initWithTitle:action:](self, "initWithTitle:action:", &stru_1E5149688, 0);
}

- (_PXCardAction)initWithTitle:(id)a3 action:(id)a4
{
  id v7;
  id v8;
  _PXCardAction *v9;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  id action;
  void *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXRetailExperienceCardView.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title != nil"));

  }
  v16.receiver = self;
  v16.super_class = (Class)_PXCardAction;
  v9 = -[_PXCardAction init](&v16, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    title = v9->_title;
    v9->_title = (NSString *)v10;

    v12 = objc_msgSend(v8, "copy");
    action = v9->_action;
    v9->_action = (id)v12;

  }
  return v9;
}

- (NSString)title
{
  return self->_title;
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
