@implementation _SBSystemApertureSignificantUpdateTransitionAssertion

- (_SBSystemApertureSignificantUpdateTransitionAssertion)initWithElement:(id)a3
{
  id v5;
  _SBSystemApertureSignificantUpdateTransitionAssertion *v6;
  _SBSystemApertureSignificantUpdateTransitionAssertion *v7;
  NSObject *v8;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  _SBSystemApertureSignificantUpdateTransitionAssertion *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureViewController.m"), 4260, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("element"));

  }
  v11.receiver = self;
  v11.super_class = (Class)_SBSystemApertureSignificantUpdateTransitionAssertion;
  v6 = -[SAAssertion init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_element, v5);
    SBLogSystemApertureController();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v7;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Created significant update transition assertion: %{public}@", buf, 0xCu);
    }

  }
  return v7;
}

- (id)_descriptionConstituents
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  objc_super v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_element);
  if (WeakRetained)
  {
    v10.receiver = self;
    v10.super_class = (Class)_SBSystemApertureSignificantUpdateTransitionAssertion;
    -[SAAssertion _descriptionConstituents](&v10, sel__descriptionConstituents);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("element");
    MEMORY[0x1D17E3810](WeakRetained);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayByAddingObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_SBSystemApertureSignificantUpdateTransitionAssertion;
    -[SAAssertion _descriptionConstituents](&v9, sel__descriptionConstituents);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (SAElement)element
{
  return (SAElement *)objc_loadWeakRetained((id *)&self->_element);
}

- (void)setElement:(id)a3
{
  objc_storeWeak((id *)&self->_element, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_element);
}

@end
