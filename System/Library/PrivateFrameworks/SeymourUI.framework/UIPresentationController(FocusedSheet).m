@implementation UIPresentationController(FocusedSheet)

+ (SMUFocusedSheetPresentationController)sheetPresentationControllerForPresentedController:()FocusedSheet presentingController:
{
  id v5;
  id v6;
  SMUFocusedSheetPresentationController *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SMUFocusedSheetPresentationController initWithPresentedViewController:presentingViewController:]([SMUFocusedSheetPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v6, v5);

  return v7;
}

@end
