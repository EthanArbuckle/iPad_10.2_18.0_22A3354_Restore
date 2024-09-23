@implementation CarInstrumentClusterWindow

- (CarInstrumentClusterWindow)initWithWindowScene:(id)a3
{
  CarInstrumentClusterWindow *v3;
  CarInstrumentClusterWindow *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarInstrumentClusterWindow;
  v3 = -[CarInstrumentClusterWindow initWithWindowScene:](&v6, "initWithWindowScene:", a3);
  v4 = v3;
  if (v3)
  {
    -[CarInstrumentClusterWindow addClusterSettingsObserver:](v3, "addClusterSettingsObserver:", v3);
    -[CarInstrumentClusterWindow _updateChromeConfiguration](v4, "_updateChromeConfiguration");
  }
  return v4;
}

- (void)setRootViewController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char isKindOfClass;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  objc_super v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarInstrumentClusterWindow rootViewController](self, "rootViewController"));
  v6 = objc_opt_class(CarChromeViewController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = objc_opt_class(CarChromeViewController);
    isKindOfClass = objc_opt_isKindOfClass(v4, v7);

    if ((isKindOfClass & 1) != 0)
      goto LABEL_5;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarInstrumentClusterWindow rootViewController](self, "rootViewController"));
    objc_msgSend(v5, "setNotificationLayoutGuide:", 0);
  }

LABEL_5:
  v15.receiver = self;
  v15.super_class = (Class)CarInstrumentClusterWindow;
  -[CarInstrumentClusterWindow setRootViewController:](&v15, "setRootViewController:", v4);
  v9 = v4;
  if (objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___CarInstrumentClusterConfigurationDelegate))
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  -[CarInstrumentClusterWindow setConfigurationDelegate:](self, "setConfigurationDelegate:", v11);
  v12 = v9;
  if (objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___CarInstrumentClusterWindowZoomDelegate))
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  -[CarInstrumentClusterWindow setZoomDelegate:](self, "setZoomDelegate:", v14);
}

- (void)setHidden:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  CarInstrumentClusterWindow *v9;
  __int16 v10;
  _BOOL8 v11;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CarInstrumentClusterWindow;
  -[CarInstrumentClusterWindow setHidden:](&v7, "setHidden:");
  v5 = sub_1004334FC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    v9 = self;
    v10 = 2048;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] setHidden:%ld", buf, 0x16u);
  }

}

- (void)notificationLayoutGuideDidChange
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  int v10;
  CarInstrumentClusterWindow *v11;

  v3 = sub_1004334FC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v10 = 134349056;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] notificationLayoutGuideDidChange", (uint8_t *)&v10, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarInstrumentClusterWindow rootViewController](self, "rootViewController"));
  v6 = objc_opt_class(CarChromeViewController);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarInstrumentClusterWindow notificationLayoutGuide](self, "notificationLayoutGuide"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarInstrumentClusterWindow rootViewController](self, "rootViewController"));
    objc_msgSend(v9, "setNotificationLayoutGuide:", v8);

  }
}

- (void)setConfigurationDelegate:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  CarInstrumentClusterWindow *v13;
  __int16 v14;
  CarInstrumentClusterWindow *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_configurationDelegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_configurationDelegate, v4);
    v6 = sub_1004334FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = objc_opt_class(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarInstrumentClusterWindow chromeConfiguration](self, "chromeConfiguration"));
      v12 = 134350082;
      v13 = self;
      v14 = 2048;
      v15 = self;
      v16 = 2112;
      v17 = v8;
      v18 = 2048;
      v19 = v4;
      v20 = 2112;
      v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] configurationDelegate of window: %p changed to: <%@:%p>. current configuration: %@", (uint8_t *)&v12, 0x34u);

    }
    v10 = objc_loadWeakRetained((id *)&self->_configurationDelegate);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarInstrumentClusterWindow chromeConfiguration](self, "chromeConfiguration"));
    objc_msgSend(v10, "sceneConfigurationDidChange:", v11);

  }
}

- (void)setChromeConfiguration:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  int v10;
  CarInstrumentClusterWindow *v11;
  __int16 v12;
  CarInstrumentClusterWindow *v13;
  __int16 v14;
  id v15;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_chromeConfiguration) & 1) == 0)
  {
    v6 = sub_1004334FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = 134349570;
      v11 = self;
      v12 = 2048;
      v13 = self;
      v14 = 2112;
      v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Will update chrome configuration on window: %p with configuration: %@", (uint8_t *)&v10, 0x20u);
    }

    objc_storeStrong((id *)&self->_chromeConfiguration, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_configurationDelegate);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarInstrumentClusterWindow chromeConfiguration](self, "chromeConfiguration"));
    objc_msgSend(WeakRetained, "sceneConfigurationDidChange:", v9);

  }
}

- (CRSUIInstrumentClusterSceneSettings)currentSceneSettings
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  int v20;
  CarInstrumentClusterWindow *v21;
  __int16 v22;
  CarInstrumentClusterWindow *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarInstrumentClusterWindow windowScene](self, "windowScene"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_FBSScene"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "settings"));

  if (!v5)
  {
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  v6 = objc_opt_class(CRSUIInstrumentClusterSceneSettings);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    v11 = sub_1004334FC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v13 = (objc_class *)objc_opt_class(self);
      v14 = NSStringFromClass(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (objc_class *)objc_opt_class(v5);
      v17 = NSStringFromClass(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v20 = 134349826;
      v21 = self;
      v22 = 2112;
      v23 = self;
      v24 = 2048;
      v25 = v15;
      v26 = 2112;
      v27 = v18;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "[%{public}p] Scene settings for window: <%@:%p> were of invalid class: %@", (uint8_t *)&v20, 0x2Au);

    }
    goto LABEL_10;
  }
  v7 = v5;
  v8 = objc_opt_class(CRSUIInstrumentClusterSceneSettings);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

LABEL_11:
  return (CRSUIInstrumentClusterSceneSettings *)v10;
}

- (void)_updateChromeConfiguration
{
  CarInstrumentClusterChromeConfiguration *v3;
  CarInstrumentClusterChromeConfiguration *v4;
  id v5;

  v3 = [CarInstrumentClusterChromeConfiguration alloc];
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CarInstrumentClusterWindow currentSceneSettings](self, "currentSceneSettings"));
  v4 = -[CarInstrumentClusterChromeConfiguration initWithInstrumentClusterSceneSettings:](v3, "initWithInstrumentClusterSceneSettings:", v5);
  -[CarInstrumentClusterWindow setChromeConfiguration:](self, "setChromeConfiguration:", v4);

}

- (void)_windowWantsToZoomInDirection:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarInstrumentClusterWindow zoomDelegate](self, "zoomDelegate"));
  objc_msgSend(v4, "windowWantsToZoomInDirection:", a3);

}

- (void)clusterWindow:(id)a3 didChangeCompassSetting:(unint64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  CarInstrumentClusterWindow *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  unint64_t v14;

  v6 = a3;
  v7 = sub_1004334FC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 134349568;
    v10 = self;
    v11 = 2048;
    v12 = v6;
    v13 = 2048;
    v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] clusterWindow:didChangeCompassSetting: %p, %lu", (uint8_t *)&v9, 0x20u);
  }

  -[CarInstrumentClusterWindow _updateChromeConfiguration](self, "_updateChromeConfiguration");
}

- (void)clusterWindow:(id)a3 didChangeETASetting:(unint64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  CarInstrumentClusterWindow *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  unint64_t v14;

  v6 = a3;
  v7 = sub_1004334FC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 134349568;
    v10 = self;
    v11 = 2048;
    v12 = v6;
    v13 = 2048;
    v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] clusterWindow:didChangeETASetting: %p, %lu", (uint8_t *)&v9, 0x20u);
  }

  -[CarInstrumentClusterWindow _updateChromeConfiguration](self, "_updateChromeConfiguration");
}

- (void)clusterWindow:(id)a3 didChangeSpeedLimitSetting:(unint64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  CarInstrumentClusterWindow *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  unint64_t v14;

  v6 = a3;
  v7 = sub_1004334FC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 134349568;
    v10 = self;
    v11 = 2048;
    v12 = v6;
    v13 = 2048;
    v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] clusterWindow:didChangeSpeedLimitSetting: %p, %lu", (uint8_t *)&v9, 0x20u);
  }

  -[CarInstrumentClusterWindow _updateChromeConfiguration](self, "_updateChromeConfiguration");
}

- (void)clusterWindow:(id)a3 didZoomInDirection:(int64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  CarInstrumentClusterWindow *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  int64_t v14;

  v6 = a3;
  v7 = sub_1004334FC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 134349568;
    v10 = self;
    v11 = 2048;
    v12 = v6;
    v13 = 2048;
    v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] clusterWindow:didZoomInDirection: %p, %ld", (uint8_t *)&v9, 0x20u);
  }

  -[CarInstrumentClusterWindow _windowWantsToZoomInDirection:](self, "_windowWantsToZoomInDirection:", a4);
}

- (CarInstrumentClusterChromeConfiguration)chromeConfiguration
{
  return self->_chromeConfiguration;
}

- (CarInstrumentClusterConfigurationDelegate)configurationDelegate
{
  return (CarInstrumentClusterConfigurationDelegate *)objc_loadWeakRetained((id *)&self->_configurationDelegate);
}

- (CarInstrumentClusterWindowZoomDelegate)zoomDelegate
{
  return (CarInstrumentClusterWindowZoomDelegate *)objc_loadWeakRetained((id *)&self->_zoomDelegate);
}

- (void)setZoomDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_zoomDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_zoomDelegate);
  objc_destroyWeak((id *)&self->_configurationDelegate);
  objc_storeStrong((id *)&self->_chromeConfiguration, 0);
}

@end
