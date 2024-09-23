@implementation SAUIPreferredLayoutModeAssertion

- (SAUIPreferredLayoutModeAssertion)initWithRepresentedElement:(id)a3 layoutModePreference:(id)a4
{
  id v7;
  id v8;
  SAUIPreferredLayoutModeAssertion *v9;
  SAUIPreferredLayoutModeAssertion *v10;
  NSObject *v11;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  SAUIPreferredLayoutModeAssertion *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SAUIPreferredLayoutModeAssertion.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("representedElement"));

  }
  v14.receiver = self;
  v14.super_class = (Class)SAUIPreferredLayoutModeAssertion;
  v9 = -[SAAssertion init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_layoutModePreference, a4);
    objc_storeWeak((id *)&v10->_representedElement, v7);
    v11 = SAUILogElementViewControlling;
    if (os_log_type_enabled((os_log_t)SAUILogElementViewControlling, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v10;
      _os_log_impl(&dword_247C5B000, v11, OS_LOG_TYPE_DEFAULT, "Created preferred layout mode assertion: %{public}@", buf, 0xCu);
    }
  }

  return v10;
}

- (SAUIPreferredLayoutModeAssertion)initWithRepresentedElement:(id)a3 preferredLayoutMode:(int64_t)a4 reason:(int64_t)a5
{
  id v8;
  SAUILayoutModePreference *v9;
  SAUIPreferredLayoutModeAssertion *v10;

  v8 = a3;
  v9 = -[SAUILayoutModePreference initWithPreferredLayoutMode:reason:]([SAUILayoutModePreference alloc], "initWithPreferredLayoutMode:reason:", a4, a5);
  v10 = -[SAUIPreferredLayoutModeAssertion initWithRepresentedElement:layoutModePreference:](self, "initWithRepresentedElement:layoutModePreference:", v8, v9);

  return v10;
}

- (int64_t)preferredLayoutMode
{
  return -[SAUILayoutModePreference preferredLayoutMode](self->_layoutModePreference, "preferredLayoutMode");
}

- (int64_t)layoutModeChangeReason
{
  return -[SAUILayoutModePreference layoutModeChangeReason](self->_layoutModePreference, "layoutModeChangeReason");
}

- (BOOL)layoutModePreferenceMayBeImplicitlyInvalidated
{
  return -[SAUILayoutModePreference layoutModePreferenceMayBeImplicitlyInvalidated](self->_layoutModePreference, "layoutModePreferenceMayBeImplicitlyInvalidated");
}

- (id)_descriptionConstituents
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_representedElement);
  if (WeakRetained)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), WeakRetained);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "clientIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("; clientIdentifier: %@"), v6);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "elementIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("; elementIdentifier: %@"), v7);

    }
    objc_msgSend(v5, "appendString:", CFSTR(">"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("representedElement"));

  }
  SAUIStringFromElementViewLayoutMode(-[SAUIPreferredLayoutModeAssertion preferredLayoutMode](self, "preferredLayoutMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("preferredLayoutMode"));

  SAUIStringFromLayoutModeChangeReason(-[SAUIPreferredLayoutModeAssertion layoutModeChangeReason](self, "layoutModeChangeReason"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("layoutModeChangeReason"));

  v13.receiver = self;
  v13.super_class = (Class)SAUIPreferredLayoutModeAssertion;
  -[SAAssertion _descriptionConstituents](&v13, sel__descriptionConstituents);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObject:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (SAElement)representedElement
{
  return (SAElement *)objc_loadWeakRetained((id *)&self->_representedElement);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_representedElement);
  objc_storeStrong((id *)&self->_layoutModePreference, 0);
}

@end
