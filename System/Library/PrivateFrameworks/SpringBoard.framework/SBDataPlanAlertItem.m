@implementation SBDataPlanAlertItem

- (void)didDeactivateForReason:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v3 = *(_QWORD *)&a3;
  if (SBAlertItemIsUserDeactivate())
  {
    -[SBAlertItem alertController](self, "alertController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (!v7)
    {
      +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "activateAlertItem:", self);

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)SBDataPlanAlertItem;
  -[SBAlertItem didDeactivateForReason:](&v9, sel_didDeactivateForReason_, v3);
}

- (BOOL)suppressForKeynote
{
  return 1;
}

@end
