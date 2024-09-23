@implementation MapsActivityItemsConfiguration

- (NSArray)itemProvidersForActivityItemsConfiguration
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = sub_1004323EC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "getItemProviders", ", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityItemsConfiguration internalActivityItemsConfiguration](self, "internalActivityItemsConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemProvidersForActivityItemsConfiguration"));

  v7 = sub_1004323EC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "getItemProviders", ", v10, 2u);
  }

  return (NSArray *)v6;
}

- (BOOL)_hasItemsForActivityItemsConfiguration
{
  id v3;
  NSObject *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = sub_1004323EC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "checkHasActivityItems", ", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityItemsConfiguration internalActivityItemsConfiguration](self, "internalActivityItemsConfiguration"));
  v6 = objc_msgSend(v5, "_hasItemsForActivityItemsConfiguration");

  v7 = sub_1004323EC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "checkHasActivityItems", ", v10, 2u);
  }

  return v6;
}

- (UIActivityItemsConfiguration)internalActivityItemsConfiguration
{
  UIActivityItemsConfiguration *internalActivityItemsConfiguration;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSTimer *v8;
  NSTimer *invalidationTimer;
  id v10;
  void *v11;
  void *v12;
  UIActivityItemsConfiguration *v13;
  UIActivityItemsConfiguration *v14;
  void *v15;
  _QWORD v17[5];

  internalActivityItemsConfiguration = self->_internalActivityItemsConfiguration;
  if (!internalActivityItemsConfiguration)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityItemsConfiguration shareItemSource](self, "shareItemSource"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityItemsConfiguration shareItemSource](self, "shareItemSource"));
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chromeViewController"));

      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentShareItemSource"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10090A538;
      v17[3] = &unk_1011BFC08;
      v17[4] = self;
      v8 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v17, 0.0));
      invalidationTimer = self->_invalidationTimer;
      self->_invalidationTimer = v8;

    }
    v10 = objc_alloc((Class)UIActivityItemsConfiguration);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activityProviders"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "applicationActivities"));
    v13 = (UIActivityItemsConfiguration *)objc_msgSend(v10, "_initWithActivityItems:applicationActivities:", v11, v12);
    v14 = self->_internalActivityItemsConfiguration;
    self->_internalActivityItemsConfiguration = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "excludedActivityTypes"));
    -[UIActivityItemsConfiguration _setExcludedActivityTypes:](self->_internalActivityItemsConfiguration, "_setExcludedActivityTypes:", v15);

    internalActivityItemsConfiguration = self->_internalActivityItemsConfiguration;
  }
  return internalActivityItemsConfiguration;
}

- (BOOL)activityItemsConfigurationSupportsInteraction:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityItemsConfiguration internalActivityItemsConfiguration](self, "internalActivityItemsConfiguration"));
  v6 = objc_msgSend(v5, "activityItemsConfigurationSupportsInteraction:", v4);

  return v6;
}

- (void)setShareItemSource:(id)a3
{
  UIActivityItemsConfiguration *internalActivityItemsConfiguration;
  id v6;

  objc_storeStrong((id *)&self->_shareItemSource, a3);
  v6 = a3;
  internalActivityItemsConfiguration = self->_internalActivityItemsConfiguration;
  self->_internalActivityItemsConfiguration = 0;

  -[NSTimer invalidate](self->_invalidationTimer, "invalidate");
}

- (id)_excludedInteractions
{
  _QWORD v3[2];

  v3[0] = _UIActivityItemsConfigurationInteractionServicesMenu;
  v3[1] = _UIActivityItemsConfigurationInteractionShare;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 2));
}

- (ShareItemSource)shareItemSource
{
  return self->_shareItemSource;
}

- (void)setInternalActivityItemsConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_internalActivityItemsConfiguration, a3);
}

- (NSTimer)invalidationTimer
{
  return self->_invalidationTimer;
}

- (void)setInvalidationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_invalidationTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationTimer, 0);
  objc_storeStrong((id *)&self->_internalActivityItemsConfiguration, 0);
  objc_storeStrong((id *)&self->_shareItemSource, 0);
}

@end
