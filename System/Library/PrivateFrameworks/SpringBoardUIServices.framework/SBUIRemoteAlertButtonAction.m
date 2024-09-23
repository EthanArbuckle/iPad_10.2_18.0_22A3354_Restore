@implementation SBUIRemoteAlertButtonAction

- (SBUIRemoteAlertButtonAction)initWithEvents:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBUIRemoteAlertButtonAction;
  return -[SBUIButtonAction initWithButtonEvents:](&v4, sel_initWithButtonEvents_, a3);
}

- (SBUIRemoteAlertButtonAction)initWithEvents:(unint64_t)a3 withHandler:(id)a4
{
  id v6;
  SBUIRemoteAlertButtonAction *v7;
  objc_super v9;
  _QWORD v10[4];
  id v11;

  v10[1] = 3221225472;
  v10[2] = __58__SBUIRemoteAlertButtonAction_initWithEvents_withHandler___block_invoke;
  v10[3] = &unk_1E4C3EFE8;
  v11 = a4;
  v9.receiver = self;
  v9.super_class = (Class)SBUIRemoteAlertButtonAction;
  v10[0] = MEMORY[0x1E0C809B0];
  v6 = v11;
  v7 = -[SBUIButtonAction initWithButtonEvents:withHandler:](&v9, sel_initWithButtonEvents_withHandler_, a3, v10);

  return v7;
}

uint64_t __58__SBUIRemoteAlertButtonAction_initWithEvents_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)events
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBUIRemoteAlertButtonAction;
  return -[SBUIButtonAction buttonEvents](&v3, sel_buttonEvents);
}

- (void)sendResponseWithUnHandledEvents:(unint64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBUIRemoteAlertButtonAction;
  -[SBUIButtonAction sendResponseWithUnHandledButtonEvents:](&v3, sel_sendResponseWithUnHandledButtonEvents_, a3);
}

@end
