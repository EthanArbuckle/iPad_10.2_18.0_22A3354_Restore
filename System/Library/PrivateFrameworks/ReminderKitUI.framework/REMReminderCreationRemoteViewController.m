@implementation REMReminderCreationRemoteViewController

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REMReminderCreationRemoteViewController;
  v4 = a3;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v5, sel_viewServiceDidTerminateWithError_, v4);
  -[REMReminderCreationRemoteViewController viewServiceDidFailWithError:](self, "viewServiceDidFailWithError:", v4, v5.receiver, v5.super_class);

}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549D6CF8);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "rem_reminderCreationRemoteViewControllerExportedInterface");
}

- (void)viewServicePreferredSizeDidChange:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[REMReminderCreationRemoteViewController publicViewController](self, "publicViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewServicePreferredSizeDidChange:", width, height);

}

- (void)viewServiceDidCancel
{
  id v2;

  -[REMReminderCreationRemoteViewController publicViewController](self, "publicViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewServiceDidCancel");

}

- (void)viewServiceDidFailWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMReminderCreationRemoteViewController publicViewController](self, "publicViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewServiceDidFailWithError:", v4);

}

- (void)viewServiceDidFinish
{
  id v2;

  -[REMReminderCreationRemoteViewController publicViewController](self, "publicViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewServiceDidFinish");

}

- (void)viewHostDidDismiss
{
  void *v3;

  -[REMReminderCreationRemoteViewController viewServiceViewController](self, "viewServiceViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewHostDidDismiss");

  -[REMReminderCreationRemoteViewController setPublicViewController:](self, "setPublicViewController:", 0);
}

- (REMReminderCreationPublicViewController)publicViewController
{
  return (REMReminderCreationPublicViewController *)objc_loadWeakRetained((id *)&self->_publicViewController);
}

- (void)setPublicViewController:(id)a3
{
  objc_storeWeak((id *)&self->_publicViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_publicViewController);
}

@end
