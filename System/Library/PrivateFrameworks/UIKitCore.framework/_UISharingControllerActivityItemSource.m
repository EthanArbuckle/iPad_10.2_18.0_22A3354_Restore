@implementation _UISharingControllerActivityItemSource

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  _UISharingControllerActivityItemSource *v5;

  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0D96D98]))
    v5 = self;
  else
    v5 = 0;
  return v5;
}

- (UICloudSharingController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
