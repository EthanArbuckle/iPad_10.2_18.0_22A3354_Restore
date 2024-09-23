@implementation _UIStickerPickerServiceRemoteViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (id)requestCardViewControllerWithConnectionHandler:(id)a3
{
  return (id)objc_msgSend(a1, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("StickersAppCardViewController"), CFSTR("com.apple.iMessageAppsViewService"), a3);
}

+ (id)serviceViewControllerInterface
{
  if (qword_1ECD7DC08 != -1)
    dispatch_once(&qword_1ECD7DC08, &__block_literal_global_216);
  return (id)_MergedGlobals_1047;
}

+ (id)exportedInterface
{
  if (qword_1ECD7DC18 != -1)
    dispatch_once(&qword_1ECD7DC18, &__block_literal_global_82_0);
  return (id)qword_1ECD7DC10;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIStickerPickerServiceRemoteViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewServiceDidTerminateWithError:", v4);

}

- (void)stickerPickerCardDidLoad
{
  id v2;

  -[_UIStickerPickerServiceRemoteViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stickerPickerCardDidLoad");

}

- (void)dismissCard
{
  id v2;

  -[_UIStickerPickerServiceRemoteViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissCard");

}

- (void)stageStickerWithIdentifier:(id)a3 representations:(id)a4 name:(id)a5 externalURI:(id)a6 accessibilityLabel:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[_UIStickerPickerServiceRemoteViewController delegate](self, "delegate");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stageStickerWithIdentifier:representations:name:externalURI:accessibilityLabel:", v16, v15, v14, v13, v12);

}

- (void)stageSticker:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIStickerPickerServiceRemoteViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stageSticker:", v4);

}

- (void)remoteHandlesRecentsStickerDonationWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  void (**v7)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    v7 = v4;
    -[_UIStickerPickerServiceRemoteViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[_UIStickerPickerServiceRemoteViewController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "remoteHandlesRecentsStickerDonationWithCompletionHandler:", v7);

    }
    else
    {
      v7[2](v7, 1);
    }
    v4 = v7;
  }

}

- (_UIStickerPickerRemoteViewControllerDelegate)delegate
{
  return (_UIStickerPickerRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
