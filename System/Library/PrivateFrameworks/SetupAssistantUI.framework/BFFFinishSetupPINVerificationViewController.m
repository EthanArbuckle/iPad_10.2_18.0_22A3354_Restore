@implementation BFFFinishSetupPINVerificationViewController

- (void)loadView
{
  id v3;
  id v4;
  void *v5;
  objc_super v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6.receiver = self;
  v6.super_class = (Class)BFFFinishSetupPINVerificationViewController;
  -[BFFFinishSetupPINVerificationViewController loadView](&v6, sel_loadView);
  v3 = objc_alloc_init(MEMORY[0x24BE75430]);
  v4 = objc_alloc_init(MEMORY[0x24BE75590]);
  objc_msgSend(v4, "setEditPaneClass:", objc_opt_class());
  objc_msgSend(v4, "setProperty:forKey:", &unk_24D23E120, CFSTR("mode"));
  objc_msgSend(v3, "setSpecifier:", v4);
  objc_msgSend(v3, "setPinDelegate:", self);
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFFinishSetupPINVerificationViewController setViewControllers:](self, "setViewControllers:", v5);

}

- (id)stringsBundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

- (void)didAcceptEnteredPIN:(id)a3
{
  void (**completion)(id, id);
  id v5;

  completion = (void (**)(id, id))self->_completion;
  if (completion)
  {
    completion[2](completion, a3);
    v5 = self->_completion;
    self->_completion = 0;

  }
}

- (void)didCancelEnteringPIN
{
  void (**completion)(id, _QWORD);
  id v4;

  completion = (void (**)(id, _QWORD))self->_completion;
  if (completion)
  {
    completion[2](completion, 0);
    v4 = self->_completion;
    self->_completion = 0;

  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1472);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

@end
