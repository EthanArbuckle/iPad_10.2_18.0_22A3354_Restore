@implementation STUIStatusBarSensorActivityItem

- (id)dependentEntryKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0DB0D40]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensorActivityIndicator, 0);
}

- (STUIStatusBarSensorActivityView)sensorActivityIndicator
{
  STUIStatusBarSensorActivityView *sensorActivityIndicator;

  sensorActivityIndicator = self->_sensorActivityIndicator;
  if (!sensorActivityIndicator)
  {
    -[STUIStatusBarSensorActivityItem _create_sensorActivityIndicator](self, "_create_sensorActivityIndicator");
    sensorActivityIndicator = self->_sensorActivityIndicator;
  }
  return sensorActivityIndicator;
}

- (void)_create_sensorActivityIndicator
{
  STUIStatusBarSensorActivityView *v3;
  STUIStatusBarSensorActivityView *v4;
  STUIStatusBarSensorActivityView *sensorActivityIndicator;

  v3 = [STUIStatusBarSensorActivityView alloc];
  v4 = -[STUIStatusBarSensorActivityView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  sensorActivityIndicator = self->_sensorActivityIndicator;
  self->_sensorActivityIndicator = v4;

}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_super v17;

  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)STUIStatusBarSensorActivityItem;
  v7 = a3;
  -[STUIStatusBarItem applyUpdate:toDisplayItem:](&v17, sel_applyUpdate_toDisplayItem_, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "dataChanged", v17.receiver, v17.super_class);

  if (v9)
  {
    -[STUIStatusBarItem statusBar](self, "statusBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "_showSensorActivityIndicatorWithoutPortalView");

    -[STUIStatusBarSensorActivityItem sensorActivityIndicator](self, "sensorActivityIndicator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarItem statusBar](self, "statusBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_effectiveTargetScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v12, "configureSensorViewWithoutPortalIfNeededForTargetScreen:", v14);
    }
    else
    {
      if (objc_msgSend(v12, "configurePortalViewIfNeededForTargetScreen:", v14))
        v15 = objc_msgSend(v6, "isEnabled");
      else
        v15 = 0;
      objc_msgSend(v6, "setEnabled:", v15);
    }

  }
  return v8;
}

- (void)setSensorActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_sensorActivityIndicator, a3);
}

@end
