@implementation SBUIPowerDownViewController

- (void)loadView
{
  SBUIPowerDownView *v3;
  void *v4;
  SBUIPowerDownView *v5;

  v3 = [SBUIPowerDownView alloc];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[SBUIPowerDownView initWithFrame:](v3, "initWithFrame:");

  -[SBUIPowerDownView setDelegate:](v5, "setDelegate:", self);
  -[SBUIPowerDownViewController setView:](self, "setView:", v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBUIPowerDownViewController;
  -[SBUIPowerDownViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[SBUIPowerDownViewController _powerDownView](self, "_powerDownView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showAnimated:completion:", 0, 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBUIPowerDownViewController;
  -[SBUIPowerDownViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[SBUIPowerDownViewController _powerDownView](self, "_powerDownView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hideAnimated:completion:", 0, 0);

}

- (void)powerDownViewRequestCancel:(id)a3
{
  id v4;

  -[SBUIPowerDownViewController powerDownDelegate](self, "powerDownDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "powerDownViewRequestCancel:", self);

}

- (void)powerDownViewRequestPowerDown:(id)a3
{
  id v4;

  -[SBUIPowerDownViewController powerDownDelegate](self, "powerDownDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "powerDownViewRequestPowerDown:", self);

}

- (SBUIPowerDownViewControllerDelegate)powerDownDelegate
{
  return (SBUIPowerDownViewControllerDelegate *)objc_loadWeakRetained((id *)&self->powerDownDelegate);
}

- (void)setPowerDownDelegate:(id)a3
{
  objc_storeWeak((id *)&self->powerDownDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->powerDownDelegate);
}

@end
