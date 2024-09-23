@implementation PXDiagnosticsService

- (PXDiagnosticsService)init
{
  return -[PXDiagnosticsService initWithItemProviders:](self, "initWithItemProviders:", MEMORY[0x1E0C9AA60]);
}

- (PXDiagnosticsService)initWithItemProviders:(id)a3
{
  id v4;
  PXDiagnosticsService *v5;
  uint64_t v6;
  NSArray *itemProviders;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXDiagnosticsService;
  v5 = -[PXDiagnosticsService init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    itemProviders = v5->_itemProviders;
    v5->_itemProviders = (NSArray *)v6;

  }
  return v5;
}

- (NSString)title
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Untitled Service (%@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (UIViewController)contextualViewController
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  if (!-[PXDiagnosticsService canProvideConsoleDescription](self, "canProvideConsoleDescription"))
    return (UIViewController *)0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__PXDiagnosticsService_contextualViewController__block_invoke;
  v6[3] = &unk_1E5148158;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F20], "px_viewControllerWithOutput:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDiagnosticsService title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  return (UIViewController *)v3;
}

- (void)performAction
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDiagnosticsService.m"), 51, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXDiagnosticsService performAction]", v6);

  abort();
}

- (NSArray)itemProviders
{
  return self->_itemProviders;
}

- (BOOL)canProvideConsoleDescription
{
  return self->_canProvideConsoleDescription;
}

- (NSString)consoleDescription
{
  return self->_consoleDescription;
}

- (BOOL)canProvideSettingsViewController
{
  return self->_canProvideSettingsViewController;
}

- (UIViewController)settingsViewController
{
  return self->_settingsViewController;
}

- (BOOL)canPerformAction
{
  return self->_canPerformAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsViewController, 0);
  objc_storeStrong((id *)&self->_consoleDescription, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

uint64_t __48__PXDiagnosticsService_contextualViewController__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "consoleDescription");
}

@end
