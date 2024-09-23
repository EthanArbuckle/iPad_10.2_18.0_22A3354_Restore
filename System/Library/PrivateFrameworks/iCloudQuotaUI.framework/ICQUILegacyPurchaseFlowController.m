@implementation ICQUILegacyPurchaseFlowController

- (void)beginFlowWithPresenter:(id)a3 action:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  ICQUICloudStorageOffersManager *offerManager;
  ICQUICloudStorageOffersManager *v13;
  ICQUICloudStorageOffersManager *v14;
  void *v15;
  id flowCompletion;
  id v17;
  UINavigationController *v18;
  UINavigationController *navController;
  void *v20;
  uint8_t v21[16];

  v8 = a4;
  v9 = a5;
  v10 = a3;
  _ICQGetLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "Presenting legacy cloud storage offers flow.", v21, 2u);
  }

  offerManager = self->_offerManager;
  if (!offerManager)
  {
    v13 = objc_alloc_init(ICQUICloudStorageOffersManager);
    v14 = self->_offerManager;
    self->_offerManager = v13;

    -[ICQUICloudStorageOffersManager setDelegate:](self->_offerManager, "setDelegate:", self);
    offerManager = self->_offerManager;
  }
  -[ICQUICloudStorageOffersManager setShouldOfferDeviceOffers:](offerManager, "setShouldOfferDeviceOffers:", *MEMORY[0x24BE75828] == (_QWORD)v8);
  v15 = (void *)objc_msgSend(v9, "copy");

  flowCompletion = self->_flowCompletion;
  self->_flowCompletion = v15;

  v17 = objc_alloc_init(MEMORY[0x24BE04DB0]);
  v18 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v17);
  navController = self->_navController;
  self->_navController = v18;

  -[UINavigationController setModalPresentationStyle:](self->_navController, "setModalPresentationStyle:", 2);
  -[UINavigationController setModalTransitionStyle:](self->_navController, "setModalTransitionStyle:", 0);
  objc_msgSend(v10, "presentViewController:animated:completion:", self->_navController, 1, 0);

  -[UINavigationController presentationController](self->_navController, "presentationController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDelegate:", self);

  -[ICQUICloudStorageOffersManager beginFlowWithNavigationController:modally:](self->_offerManager, "beginFlowWithNavigationController:modally:", self->_navController, 0);
}

- (void)managerDidCancel:(id)a3
{
  NSObject *v4;
  void *v5;
  id flowCompletion;
  uint8_t v7[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Cloud storage offers flow did cancel.", v7, 2u);
  }

  if (self->_flowCompletion)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Preferences.cloud-storage-offers"), 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))self->_flowCompletion + 2))();
    flowCompletion = self->_flowCompletion;
    self->_flowCompletion = 0;

  }
}

- (void)manager:(id)a3 didCompleteWithError:(id)a4
{
  id v5;
  NSObject *v6;
  void (**flowCompletion)(id, _BOOL8, id);
  void *v8;
  _BOOL8 v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Cloud storage offers flow did complete with error: %@", (uint8_t *)&v11, 0xCu);
  }

  flowCompletion = (void (**)(id, _BOOL8, id))self->_flowCompletion;
  if (flowCompletion)
  {
    if (v5)
    {
      objc_msgSend(v5, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.Preferences.cloud-storage-offers")))
        v9 = objc_msgSend(v5, "code") == 2;
      else
        v9 = 0;

      flowCompletion = (void (**)(id, _BOOL8, id))self->_flowCompletion;
    }
    else
    {
      v9 = 1;
    }
    flowCompletion[2](flowCompletion, v9, v5);
    v10 = self->_flowCompletion;
    self->_flowCompletion = 0;

  }
}

- (void)manager:(id)a3 loadDidFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  void (**flowCompletion)(id, _QWORD, id);
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Cloud storage offers flow did fail with error: %@", (uint8_t *)&v8, 0xCu);
  }

  flowCompletion = (void (**)(id, _QWORD, id))self->_flowCompletion;
  if (flowCompletion)
    flowCompletion[2](flowCompletion, 0, v5);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Legacy purchase flow was dismissed.", v5, 2u);
  }

  -[ICQUILegacyPurchaseFlowController managerDidCancel:](self, "managerDidCancel:", self->_offerManager);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_flowCompletion, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_offerManager, 0);
}

@end
