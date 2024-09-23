@implementation SAUIAlertingAssertion

- (SAUIAlertingAssertion)initWithPreferredLayoutModeAssertion:(id)a3 invalidationInterval:(double)a4
{
  id v7;
  SAUIAlertingAssertion *v8;
  SAUIAlertingAssertion *v9;
  id *p_preferredLayoutModeAssertion;
  uint64_t v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id from;
  id location;
  objc_super v21;

  v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SAUIAlertingAssertion;
  v8 = -[SAAutomaticallyInvalidatingAssertion initWithInvalidationInterval:](&v21, sel_initWithInvalidationInterval_, a4);
  v9 = v8;
  if (v8)
  {
    p_preferredLayoutModeAssertion = (id *)&v8->_preferredLayoutModeAssertion;
    objc_storeStrong((id *)&v8->_preferredLayoutModeAssertion, a3);
    objc_initWeak(&location, v9);
    objc_initWeak(&from, *p_preferredLayoutModeAssertion);
    v11 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __83__SAUIAlertingAssertion_initWithPreferredLayoutModeAssertion_invalidationInterval___block_invoke;
    v16[3] = &unk_25193CFE8;
    objc_copyWeak(&v17, &from);
    objc_copyWeak(&v18, &location);
    -[SAAssertion addInvalidationBlock:](v9, "addInvalidationBlock:", v16);
    v12 = *p_preferredLayoutModeAssertion;
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __83__SAUIAlertingAssertion_initWithPreferredLayoutModeAssertion_invalidationInterval___block_invoke_2;
    v14[3] = &unk_25193CD28;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v12, "addInvalidationBlock:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __83__SAUIAlertingAssertion_initWithPreferredLayoutModeAssertion_invalidationInterval___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isValid"))
    objc_msgSend(WeakRetained, "invalidateWithReason:", v7);
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (v5 && *((id *)v5 + 10) == WeakRetained)
  {
    *((_QWORD *)v5 + 10) = 0;

  }
}

void __83__SAUIAlertingAssertion_initWithPreferredLayoutModeAssertion_invalidationInterval___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isValid"))
    objc_msgSend(WeakRetained, "invalidateWithReason:", v5);

}

- (SAUIPreferredLayoutModeAssertion)preferredLayoutModeAssertion
{
  return self->_preferredLayoutModeAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredLayoutModeAssertion, 0);
}

@end
