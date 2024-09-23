@implementation UIActivityCollaborationModeRestriction_Legacy

- (UIActivityCollaborationModeRestriction_Legacy)initWithDisabledMode:(int64_t)a3 alertTitle:(id)a4 alertMessage:(id)a5 alertConfirmationButtonTitle:(id)a6 alertContinueToModeButtonTitle:(id)a7
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIActivityCollaborationModeRestriction_Legacy;
  return -[UIActivityCollaborationModeRestriction initWithDisabledMode:alertTitle:alertMessage:alertDismissButtonTitle:alertContinueToModeButtonTitle:](&v8, sel_initWithDisabledMode_alertTitle_alertMessage_alertDismissButtonTitle_alertContinueToModeButtonTitle_, a3, a4, a5, a6, a7);
}

@end
