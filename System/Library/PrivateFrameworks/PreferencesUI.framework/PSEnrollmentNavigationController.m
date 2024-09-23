@implementation PSEnrollmentNavigationController

- (PSEnrollmentNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  PSEnrollmentNavigationController *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PSEnrollmentNavigationController;
  v8 = -[PSEnrollmentNavigationController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, v6, v7);
  if (v8)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2050000000;
    v9 = (void *)getBFFStyleClass_softClass;
    v18 = getBFFStyleClass_softClass;
    if (!getBFFStyleClass_softClass)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __getBFFStyleClass_block_invoke;
      v14[3] = &unk_24F9E3C20;
      v14[4] = &v15;
      __getBFFStyleClass_block_invoke((uint64_t)v14);
      v9 = (void *)v16[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v15, 8);
    objc_msgSend(v10, "sharedStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "applyThemeToNavigationController:", v8);

  }
  return v8;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "sf_isiPad"))
    v3 = 30;
  else
    v3 = 2;

  return v3;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  int64_t v3;

  -[PSEnrollmentNavigationController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferredStatusBarStyle");

  return v3;
}

- (CGSize)preferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PSEnrollmentNavigationController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)_backgroundColorForModalFormSheet
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.75);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSEnrollmentNavigationController;
  -[PSEnrollmentNavigationController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[PSEnrollmentNavigationController dismissalDelegate](self, "dismissalDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enrollmentNavigationControllerWillDismiss:", self);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSEnrollmentNavigationController;
  -[PSEnrollmentNavigationController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[PSEnrollmentNavigationController dismissalDelegate](self, "dismissalDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enrollmentNavigationControllerDidDismiss:", self);

}

- (PSEnrollmentNavigationControllerDismissalDelegate)dismissalDelegate
{
  return (PSEnrollmentNavigationControllerDismissalDelegate *)objc_loadWeakRetained((id *)&self->_dismissalDelegate);
}

- (void)setDismissalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dismissalDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dismissalDelegate);
}

@end
