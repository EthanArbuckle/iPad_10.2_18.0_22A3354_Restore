@implementation _UIButtonBarTargetAction

- (SEL)proxyAction
{
  return sel__invoke_forEvent_;
}

- (void)setActionFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (_UIButtonBarTargetAction)initWithBarButtonItem:(id)a3
{
  id v5;
  _UIButtonBarTargetAction *v6;
  _UIButtonBarTargetAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIButtonBarTargetAction;
  v6 = -[_UIButtonBarTargetAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_barButtonItem, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionFilter, 0);
  objc_storeStrong((id *)&self->_barButtonItem, 0);
}

- (_UIButtonBarTargetAction)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s should not be called"), "-[_UIButtonBarTargetAction init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "raise");

  return 0;
}

- (void)_invoke:(id)a3 forEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD);
  void (**actionFilter)(id, id, _UIButtonBarTargetAction *, void (**)(_QWORD));
  UIBarButtonItem *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  _UIButtonBarTargetAction *v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __45___UIButtonBarTargetAction__invoke_forEvent___block_invoke;
  v17 = &unk_1E16B1B50;
  v18 = self;
  v8 = v7;
  v19 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(&v14);
  actionFilter = (void (**)(id, id, _UIButtonBarTargetAction *, void (**)(_QWORD)))self->_actionFilter;
  if (actionFilter)
  {
    actionFilter[2](actionFilter, v6, self, v9);
  }
  else
  {
    v9[2](v9);
    v11 = self->_barButtonItem;
    if ((dyld_program_sdk_at_least() & 1) == 0 && qword_1ECD7CC88 != -1)
      dispatch_once(&qword_1ECD7CC88, &__block_literal_global_47);
    if (_MergedGlobals_956)
    {
      -[UIBarButtonItem target](v11, "target", v14, v15, v16, v17, v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[UIBarButtonItem action](v11, "action") == sel_rightBttnAction
        && objc_msgSend(v12, "isMemberOfClass:", NSClassFromString(CFSTR("BAHTLocationsSearchResultViewController"))))
      {
        objc_msgSend(v12, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setNeedsLayout");

      }
    }

  }
}

- (UIBarButtonItem)barButtonItem
{
  return self->_barButtonItem;
}

- (id)actionFilter
{
  return self->_actionFilter;
}

@end
