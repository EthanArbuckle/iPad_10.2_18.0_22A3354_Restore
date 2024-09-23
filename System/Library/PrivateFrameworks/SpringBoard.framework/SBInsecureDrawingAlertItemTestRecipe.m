@implementation SBInsecureDrawingAlertItemTestRecipe

- (id)title
{
  return CFSTR("Test Insecure Drawing Alert");
}

- (void)handleVolumeIncrease
{
  SBInsecureDrawingAlertItem *v3;
  SBInsecureDrawingAlertItem *alertItem;
  id v5;

  if (!self->_alertItem)
  {
    v3 = objc_alloc_init(SBInsecureDrawingAlertItem);
    alertItem = self->_alertItem;
    self->_alertItem = v3;

    -[SBInsecureDrawingAlertItem setProcessName:](self->_alertItem, "setProcessName:", CFSTR("Test Process"));
  }
  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activateAlertItem:", self->_alertItem);

}

- (void)handleVolumeDecrease
{
  void *v3;
  SBInsecureDrawingAlertItem *alertItem;

  if (self->_alertItem)
  {
    +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deactivateAlertItem:", self->_alertItem);

    alertItem = self->_alertItem;
    self->_alertItem = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertItem, 0);
}

@end
