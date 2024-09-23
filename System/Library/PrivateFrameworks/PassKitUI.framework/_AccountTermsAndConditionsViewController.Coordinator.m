@implementation _AccountTermsAndConditionsViewController.Coordinator

- (void)dismiss
{
  objc_msgSend(*(id *)self->viewController, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

@end
