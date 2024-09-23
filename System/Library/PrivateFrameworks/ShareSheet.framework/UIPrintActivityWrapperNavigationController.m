@implementation UIPrintActivityWrapperNavigationController

- (UIPrintActivityWrapperNavigationController)initWithPrintInteractionController:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  UIPrintActivityWrapperNavigationController *v7;
  uint64_t v8;
  id completionHandler;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIPrintActivityWrapperNavigationController;
  v5 = a4;
  v6 = a3;
  v7 = -[UIPrintActivityWrapperNavigationController init](&v11, sel_init);
  -[UIPrintActivityWrapperNavigationController setPrintInteractionController:](v7, "setPrintInteractionController:", v6, v11.receiver, v11.super_class);

  v8 = objc_msgSend(v5, "copy");
  completionHandler = v7->_completionHandler;
  v7->_completionHandler = (id)v8;

  return v7;
}

- (void)viewDidLoad
{
  objc_super v3;

  if (!-[UIPrintActivityWrapperNavigationController presentedPrintInteractionController](self, "presentedPrintInteractionController"))-[UIPrintActivityWrapperNavigationController setPresentedPrintInteractionController:](self, "setPresentedPrintInteractionController:", 1);
  v3.receiver = self;
  v3.super_class = (Class)UIPrintActivityWrapperNavigationController;
  -[UIPrintActivityWrapperNavigationController viewDidLoad](&v3, sel_viewDidLoad);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;
  _QWORD v7[5];

  v3 = a3;
  -[UIPrintActivityWrapperNavigationController printInteractionController](self, "printInteractionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__UIPrintActivityWrapperNavigationController_viewWillAppear___block_invoke;
  v7[3] = &unk_1E4003368;
  v7[4] = self;
  objc_msgSend(v5, "presentAnimated:completionHandler:", 0, v7);

  v6.receiver = self;
  v6.super_class = (Class)UIPrintActivityWrapperNavigationController;
  -[UIPrintActivityWrapperNavigationController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
}

uint64_t __61__UIPrintActivityWrapperNavigationController_viewWillAppear___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1408) + 16))();
}

- (BOOL)presentedPrintInteractionController
{
  return self->_presentedPrintInteractionController;
}

- (void)setPresentedPrintInteractionController:(BOOL)a3
{
  self->_presentedPrintInteractionController = a3;
}

- (UIPrintInteractionController)printInteractionController
{
  return self->_printInteractionController;
}

- (void)setPrintInteractionController:(id)a3
{
  objc_storeStrong((id *)&self->_printInteractionController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printInteractionController, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
