@implementation _UIStatusBarSensorActivityItem

- (id)dependentEntryKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("sensorActivityEntry"));
}

- (_UIStatusBarSensorActivityView)sensorActivityIndicator
{
  _UIStatusBarSensorActivityView *sensorActivityIndicator;

  sensorActivityIndicator = self->_sensorActivityIndicator;
  if (!sensorActivityIndicator)
  {
    -[_UIStatusBarSensorActivityItem _create_sensorActivityIndicator](self, "_create_sensorActivityIndicator");
    sensorActivityIndicator = self->_sensorActivityIndicator;
  }
  return sensorActivityIndicator;
}

- (void)_create_sensorActivityIndicator
{
  _UIStatusBarSensorActivityView *v3;
  _UIStatusBarSensorActivityView *v4;
  _UIStatusBarSensorActivityView *sensorActivityIndicator;

  v3 = [_UIStatusBarSensorActivityView alloc];
  v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  sensorActivityIndicator = self->_sensorActivityIndicator;
  self->_sensorActivityIndicator = v4;

}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_UIStatusBarSensorActivityItem;
  v6 = a3;
  -[_UIStatusBarItem applyUpdate:toDisplayItem:](&v18, sel_applyUpdate_toDisplayItem_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "dataChanged", v18.receiver, v18.super_class);

  if (v8)
  {
    -[_UIStatusBarItem statusBar](self, "statusBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "visualProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[_UIStatusBarItem statusBar](self, "statusBar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "visualProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "showSensorActivityIndicatorWithoutPortalView");

      if (v13)
      {
        -[_UIStatusBarSensorActivityItem sensorActivityIndicator](self, "sensorActivityIndicator");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIStatusBarItem statusBar](self, "statusBar");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_effectiveTargetScreen");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "configureSensorViewWithoutPortalIfNeededForTargetScreen:", v16);
LABEL_7:

        return v7;
      }
    }
    else
    {

    }
    -[_UIStatusBarSensorActivityItem sensorActivityIndicator](self, "sensorActivityIndicator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarItem statusBar](self, "statusBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_effectiveTargetScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "configurePortalViewIfNeededForTargetScreen:", v16);
    goto LABEL_7;
  }
  return v7;
}

- (void)setSensorActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_sensorActivityIndicator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensorActivityIndicator, 0);
}

@end
