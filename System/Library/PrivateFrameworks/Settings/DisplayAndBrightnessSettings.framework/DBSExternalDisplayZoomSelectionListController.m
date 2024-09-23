@implementation DBSExternalDisplayZoomSelectionListController

- (void)updateNavigationButtonStateWithCurrentState
{
  void *v3;
  id v4;

  -[DBSExternalDisplayZoomSelectionListController externalDisplayInfo](self, "externalDisplayInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayModeSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSExternalDisplayZoomSelectionListController _updateNavigationButtonStateWithNewDisplayModeSettings:](self, "_updateNavigationButtonStateWithNewDisplayModeSettings:", v3);

}

- (void)userDidTapDone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = a3;
  -[DBSExternalDisplayZoomSelectionListController selectedDisplayModeSettings](self, "selectedDisplayModeSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSExternalDisplayZoomSelectionListController externalDisplayInfo](self, "externalDisplayInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayModeSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEqual:", v5) & 1) != 0)
  {
    -[DBSExternalDisplayZoomSelectionListController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  else
  {
    objc_initWeak(&location, self);
    -[DBSExternalDisplayZoomSelectionListController displayService](self, "displayService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSExternalDisplayZoomSelectionListController externalDisplayInfo](self, "externalDisplayInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __64__DBSExternalDisplayZoomSelectionListController_userDidTapDone___block_invoke;
    v12[3] = &unk_24F026268;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v9, "setSettings:forDisplay:options:completionHandler:", v5, v11, 2, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __64__DBSExternalDisplayZoomSelectionListController_userDidTapDone___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v3 = a2;
  if (v3)
  {
    DBSLogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64__DBSExternalDisplayZoomSelectionListController_userDidTapDone___block_invoke_cold_1((uint64_t)v3, v4);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__DBSExternalDisplayZoomSelectionListController_userDidTapDone___block_invoke_148;
  block[3] = &unk_24F0261A0;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v6);

}

void __64__DBSExternalDisplayZoomSelectionListController_userDidTapDone___block_invoke_148(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayZoomDidUpdate");

}

- (id)supportedDisplayZoomOptions
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;

  v3 = (void *)objc_opt_new();
  -[DBSExternalDisplayZoomSelectionListController externalDisplayInfo](self, "externalDisplayInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportedScales");

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "addObject:", &unk_24F02FA80);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "addObject:", &unk_24F02FA98);
  if ((v5 & 4) != 0)
LABEL_4:
    objc_msgSend(v3, "addObject:", &unk_24F02FAB0);
LABEL_5:
  DBSLogForCategory(1uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[DBSExternalDisplayZoomSelectionListController supportedDisplayZoomOptions].cold.1(self, (uint64_t)v3, v6);

  return v3;
}

- (void)displayZoomTableViewCell:(id)a3 userDidTapOnDisplayZoomOption:(unint64_t)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  if (a4 <= 2)
  {
    v5 = qword_227A5ED28[a4];
    v6 = objc_alloc(MEMORY[0x24BEB0AA0]);
    -[DBSExternalDisplayZoomSelectionListController externalDisplayInfo](self, "externalDisplayInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayModeSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v6, "initWithSettings:", v8);

    objc_msgSend(v9, "setScale:", v5);
    -[DBSExternalDisplayZoomSelectionListController _updateNavigationButtonStateWithNewDisplayModeSettings:](self, "_updateNavigationButtonStateWithNewDisplayModeSettings:", v9);

  }
}

- (unint64_t)displayZoomTableViewCellCurrentlySelectedDisplayZoomOption:(id)a3
{
  void *v3;
  unint64_t v4;

  -[DBSExternalDisplayZoomSelectionListController selectedDisplayModeSettings](self, "selectedDisplayModeSettings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "scale");

  if (v4 > 2)
    return 0;
  else
    return qword_227A5ED28[v4];
}

- (SBSConnectedDisplayInfo)externalDisplayInfo
{
  return self->_externalDisplayInfo;
}

- (void)setExternalDisplayInfo:(id)a3
{
  objc_storeStrong((id *)&self->_externalDisplayInfo, a3);
}

- (SBSExternalDisplayService)displayService
{
  return self->_displayService;
}

- (void)setDisplayService:(id)a3
{
  objc_storeStrong((id *)&self->_displayService, a3);
}

- (SBSDisplayModeSettings)selectedDisplayModeSettings
{
  return self->_selectedDisplayModeSettings;
}

- (void)setSelectedDisplayModeSettings:(id)a3
{
  objc_storeStrong((id *)&self->_selectedDisplayModeSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedDisplayModeSettings, 0);
  objc_storeStrong((id *)&self->_displayService, 0);
  objc_storeStrong((id *)&self->_externalDisplayInfo, 0);
}

void __64__DBSExternalDisplayZoomSelectionListController_userDidTapDone___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_227A37000, a2, OS_LOG_TYPE_ERROR, "Failed to modify external display zoom: %@", (uint8_t *)&v2, 0xCu);
}

- (void)supportedDisplayZoomOptions
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "displayService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "externalDisplayInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  v12 = 2112;
  v13 = a2;
  _os_log_debug_impl(&dword_227A37000, a3, OS_LOG_TYPE_DEBUG, "displayService %@, displayInfo %@, supported display zooms %@", (uint8_t *)&v8, 0x20u);

}

@end
