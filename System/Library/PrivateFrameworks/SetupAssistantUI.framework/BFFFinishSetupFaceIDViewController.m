@implementation BFFFinishSetupFaceIDViewController

- (BFFFinishSetupFaceIDViewController)init
{
  BFFFinishSetupFaceIDViewController *v2;
  BFFFinishSetupFaceIDViewController *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BFFFinishSetupFaceIDViewController;
  v2 = -[BFFFaceIDViewController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[BFFFaceIDViewController setFaceIDViewControllerDelegate:](v2, "setFaceIDViewControllerDelegate:", v2);
    -[BFFFaceIDViewController setCompletesOnCancel:](v3, "setCompletesOnCancel:", 1);
    objc_msgSend(MEMORY[0x24BE85888], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFFaceIDViewController setDeviceProvider:](v3, "setDeviceProvider:", v4);

    -[BFFFaceIDViewController setEnrollmentConfiguration:](v3, "setEnrollmentConfiguration:", 1);
  }
  return v3;
}

- (void)faceIDViewController:(id)a3 didCompleteWithResult:(unint64_t)a4 pushedViewControllers:(id)a5
{
  id v7;
  void (**completion)(void);
  id v9;
  id v10;

  v10 = a3;
  v7 = a5;
  completion = (void (**)(void))self->_completion;
  if (completion)
  {
    completion[2]();
    v9 = self->_completion;
    self->_completion = 0;

  }
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
}

@end
