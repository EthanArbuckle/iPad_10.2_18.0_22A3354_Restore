@implementation SAUIElementAssertion

- (SAUIElementAssertion)initWithElement:(id)a3 invalidationHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SAUIElementAssertion *v10;
  SAUIElementAssertion *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v18;
  void *v19;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  SAUIElementAssertion *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SAUIElementAssertion.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("element"));

    if (v9)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SAUIElementAssertion.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invalidationHandler"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_8;
LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)SAUIElementAssertion;
  v10 = -[SAAssertion init](&v20, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_element, v7);
    -[SAAssertion addInvalidationBlock:](v11, "addInvalidationBlock:", v9);
    v12 = (void *)*MEMORY[0x24BEB36B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BEB36B8], OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = (void *)objc_opt_class();
      v15 = v14;
      MEMORY[0x24958F5B4](v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v14;
      v23 = 2050;
      v24 = v11;
      v25 = 2114;
      v26 = v16;
      _os_log_impl(&dword_247C5B000, v13, OS_LOG_TYPE_DEFAULT, "Created assertion (<%{public}@: %{public}p>) for element: %{public}@", buf, 0x20u);

    }
  }

  return v11;
}

- (void)invalidateWithReason:(id)a3 layoutModeChangeReason:(int64_t)a4
{
  objc_super v4;

  self->_invalidationLayoutModeChangeReason = a4;
  v4.receiver = self;
  v4.super_class = (Class)SAUIElementAssertion;
  -[SAAssertion invalidateWithReason:](&v4, sel_invalidateWithReason_, a3);
}

- (id)_descriptionConstituents
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  objc_super v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_element);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("element"));

  }
  if (!-[SAAssertion isValid](self, "isValid"))
  {
    SAUIStringFromLayoutModeChangeReason(self->_invalidationLayoutModeChangeReason);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("invalidationLayoutModeChangeReason"));

  }
  if (objc_msgSend(v4, "count"))
  {
    v11.receiver = self;
    v11.super_class = (Class)SAUIElementAssertion;
    -[SAAssertion _descriptionConstituents](&v11, sel__descriptionConstituents);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObject:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SAUIElementAssertion;
    -[SAAssertion _descriptionConstituents](&v10, sel__descriptionConstituents);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (SAElement)element
{
  return (SAElement *)objc_loadWeakRetained((id *)&self->_element);
}

- (int64_t)invalidationLayoutModeChangeReason
{
  return self->_invalidationLayoutModeChangeReason;
}

- (void)setInvalidationLayoutModeChangeReason:(int64_t)a3
{
  self->_invalidationLayoutModeChangeReason = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_element);
}

@end
