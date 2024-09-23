@implementation PXResourceReclamationObservation

- (PXResourceReclamationObservation)initWithController:(id)a3 weakTarget:(id)a4 selector:(SEL)a5
{
  id v8;
  id v9;
  PXResourceReclamationObservation *v10;
  PXResourceReclamationObservation *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXResourceReclamationObservation;
  v10 = -[PXResourceReclamationObservation init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_controller, v8);
    objc_storeWeak(&v11->_target, v9);
    v11->_selector = a5;
    objc_msgSend(v8, "registerObserver:", v11);
  }

  return v11;
}

- (PXResourceReclamationObservation)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXResourceReclamationObservation.m"), 35, CFSTR("%s is not available as initializer"), "-[PXResourceReclamationObservation init]");

  abort();
}

- (void)resourceReclamationEventDidOccur:(id)a3
{
  id *p_target;
  id v5;
  id WeakRetained;

  p_target = &self->_target;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(p_target);
  objc_msgSend(WeakRetained, "performSelector:withObject:", self->_selector, v5);

}

- (PXAVResourceReclamationController)controller
{
  return (PXAVResourceReclamationController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_destroyWeak(&self->_target);
  objc_storeStrong(&self->_eventHandler, 0);
}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXResourceReclamationObservation.m"), 39, CFSTR("%s is not available as initializer"), "+[PXResourceReclamationObservation new]");

  abort();
}

@end
