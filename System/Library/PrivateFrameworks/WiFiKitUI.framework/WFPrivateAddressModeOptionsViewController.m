@implementation WFPrivateAddressModeOptionsViewController

- (WFPrivateAddressModeOptionsViewController)initWithTitles:(id)a3 originalSelection:(id)a4 isCurrentNetwork:(BOOL)a5 currentNetworkName:(id)a6 isChinaDevice:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v9;
  id v12;
  id v13;
  WFPrivateAddressModeOptionsViewController *v14;
  WFPrivateAddressModeOptionsViewController *v15;
  objc_super v17;

  v7 = a7;
  v9 = a5;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)WFPrivateAddressModeOptionsViewController;
  v14 = -[WFValueListViewController initWithTitles:switchTitle:](&v17, sel_initWithTitles_switchTitle_, a3, 0);
  v15 = v14;
  if (v14)
  {
    -[WFPrivateAddressModeOptionsViewController setOriginalSelection:](v14, "setOriginalSelection:", v12);
    -[WFValueListViewController setSelectedTitle:](v15, "setSelectedTitle:", v12);
    -[WFPrivateAddressModeOptionsViewController setIsCurrentNetwork:](v15, "setIsCurrentNetwork:", v9);
    -[WFPrivateAddressModeOptionsViewController setNetworkName:](v15, "setNetworkName:", v13);
    -[WFPrivateAddressModeOptionsViewController setIsChinaDevice:](v15, "setIsChinaDevice:", v7);
  }

  return v15;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSString *pendingSelection;
  void *v11;
  NSString *v12;
  NSString *originalSelection;
  void *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  void *v20;
  id v21;

  v21 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v21, 1);
  -[WFValueListViewController titles](self, "titles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v21, "row"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFValueListViewController selectedTitle](self, "selectedTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    -[WFPrivateAddressModeOptionsViewController setPendingSelection:](self, "setPendingSelection:", v7);
    pendingSelection = self->_pendingSelection;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("kWFLocRandomMACOffOption"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (pendingSelection == v12)
    {
      -[WFPrivateAddressModeOptionsViewController _promptForAllowTrackingCurrentNetwork:indexPath:](self, "_promptForAllowTrackingCurrentNetwork:indexPath:", self->_isCurrentNetwork, v21);
    }
    else
    {
      originalSelection = self->_originalSelection;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("kWFLocRandomMACOffOption"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();

      if (originalSelection == v15 && self->_isCurrentNetwork)
      {
        -[WFPrivateAddressModeOptionsViewController _promptForInterruptCurrentNetwork:](self, "_promptForInterruptCurrentNetwork:", v21);
      }
      else
      {
        -[WFValueListViewController setSelectedTitle:](self, "setSelectedTitle:", self->_pendingSelection);
        -[WFPrivateAddressModeOptionsViewController tableView](self, "tableView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", objc_msgSend(v21, "section"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "reloadSections:withRowAnimation:", v17, 5);

      }
    }
  }
  -[WFValueListViewController completionHandler](self, "completionHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[WFValueListViewController completionHandler](self, "completionHandler");
    v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[WFValueListViewController selectedTitle](self, "selectedTitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v19)[2](v19, v20, 1);

  }
}

- (void)_promptForInterruptCurrentNetwork:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id location[2];

  v4 = a3;
  v5 = -[WFPrivateAddressModeOptionsViewController isChinaDevice](self, "isChinaDevice");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    v8 = CFSTR("kWFLocPirvateAddressInterruptionAlertTile_CH");
  else
    v8 = CFSTR("kWFLocPirvateAddressInterruptionAlertTitle");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v9, self->_networkName);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v10, &stru_24DB39F78, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)v10;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("kWFLocPirvateAddressInterruptionAlertOK"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BEBD3A8];
  v15 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __79__WFPrivateAddressModeOptionsViewController__promptForInterruptCurrentNetwork___block_invoke;
  v28[3] = &unk_24DB37B18;
  objc_copyWeak(&v30, location);
  v28[4] = self;
  v16 = v4;
  v29 = v16;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v13, 0, v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)v9;
  objc_msgSend(v11, "addAction:", v17);
  v18 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("kWFLocPirvateAddressInterruptionAlertCancel"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  v25[1] = 3221225472;
  v25[2] = __79__WFPrivateAddressModeOptionsViewController__promptForInterruptCurrentNetwork___block_invoke_2;
  v25[3] = &unk_24DB37B18;
  objc_copyWeak(&v27, location);
  v25[4] = self;
  v21 = v16;
  v26 = v21;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 1, v25);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addAction:", v22);
  -[WFPrivateAddressModeOptionsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v30);

  objc_destroyWeak(location);
}

void __79__WFPrivateAddressModeOptionsViewController__promptForInterruptCurrentNetwork___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1112);
  v3 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setSelectedTitle:", v2);

  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadSections:withRowAnimation:", v6, 5);

}

void __79__WFPrivateAddressModeOptionsViewController__promptForInterruptCurrentNetwork___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1104);
  v3 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setSelectedTitle:", v2);

  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadSections:withRowAnimation:", v6, 5);

}

- (void)_promptForAllowTrackingCurrentNetwork:(BOOL)a3 indexPath:(id)a4
{
  _BOOL4 v4;
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id location[2];

  v4 = a3;
  v6 = a4;
  v7 = -[WFPrivateAddressModeOptionsViewController isChinaDevice](self, "isChinaDevice");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    v10 = CFSTR("kWFLocPirvateAddressAllowTrackingAlertTitle_CH");
  else
    v10 = CFSTR("kWFLocPirvateAddressAllowTrackingAlertTitle");
  v11 = &stru_24DB39F78;
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v12, self->_networkName);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("kWFLocPirvateAddressAllowTrackingAlertMessage"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_initWeak(location, self);
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v13, v11, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)v13;
  v27 = (void *)v12;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("kWFLocPirvateAddressAllowTrackingAlertAllow"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BEBD3A8];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __93__WFPrivateAddressModeOptionsViewController__promptForAllowTrackingCurrentNetwork_indexPath___block_invoke;
  v31[3] = &unk_24DB37B18;
  objc_copyWeak(&v33, location);
  v31[4] = self;
  v19 = v6;
  v32 = v19;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v17, 0, v31);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v20);
  v21 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("kWFLocPirvateAddressAllowTrackingAlertCancel"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __93__WFPrivateAddressModeOptionsViewController__promptForAllowTrackingCurrentNetwork_indexPath___block_invoke_2;
  v28[3] = &unk_24DB37B18;
  objc_copyWeak(&v30, location);
  v28[4] = self;
  v24 = v19;
  v29 = v24;
  objc_msgSend(v21, "actionWithTitle:style:handler:", v23, 1, v28);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addAction:", v25);
  -[WFPrivateAddressModeOptionsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v33);

  objc_destroyWeak(location);
}

void __93__WFPrivateAddressModeOptionsViewController__promptForAllowTrackingCurrentNetwork_indexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1112);
  v3 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setSelectedTitle:", v2);

  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadSections:withRowAnimation:", v6, 5);

}

void __93__WFPrivateAddressModeOptionsViewController__promptForAllowTrackingCurrentNetwork_indexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1104);
  v3 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setSelectedTitle:", v2);

  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadSections:withRowAnimation:", v6, 5);

}

- (NSString)originalSelection
{
  return self->_originalSelection;
}

- (void)setOriginalSelection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1104);
}

- (NSString)pendingSelection
{
  return self->_pendingSelection;
}

- (void)setPendingSelection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1112);
}

- (BOOL)isCurrentNetwork
{
  return self->_isCurrentNetwork;
}

- (void)setIsCurrentNetwork:(BOOL)a3
{
  self->_isCurrentNetwork = a3;
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1120);
}

- (BOOL)isChinaDevice
{
  return self->_isChinaDevice;
}

- (void)setIsChinaDevice:(BOOL)a3
{
  self->_isChinaDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_pendingSelection, 0);
  objc_storeStrong((id *)&self->_originalSelection, 0);
}

@end
