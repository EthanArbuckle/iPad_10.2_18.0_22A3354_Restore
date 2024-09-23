@implementation ShortcutHandlingTask

+ (id)taskForShortcutItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __objc2_class *v6;
  id v7;
  id v8;
  NSObject *v9;
  const char *v10;
  id v12;
  int v13;
  void *v14;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "type"));
    if ((objc_msgSend(&off_1012741A8, "containsObject:", v5) & 1) != 0)
    {
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Maps.mark-my-location"))
        || objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Maps.action.mark-my-location-from-app-delegate")))
      {
        v6 = _MarkUserLocationShortcutHandlingTask;
LABEL_6:
        v7 = objc_msgSend([v6 alloc], "initWithShortcutItem:", v4);
LABEL_12:

        goto LABEL_13;
      }
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Maps.share-location"))
        || objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Maps.action.share-location-from-app-delegate")))
      {
        v6 = _ShareUserLocationShortcutHandlingTask;
        goto LABEL_6;
      }
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Maps.search-nearby")))
      {
        v6 = _SearchNearbyShortcutHandlingTask;
        goto LABEL_6;
      }
      v12 = sub_100431A4C();
      v9 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v13 = 138412290;
        v14 = v5;
        v10 = "Shortcut item type not handled %@";
        goto LABEL_10;
      }
    }
    else
    {
      v8 = sub_100431A4C();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v13 = 138412290;
        v14 = v5;
        v10 = "Shortcut item type unknown %@";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v13, 0xCu);
      }
    }

    v7 = 0;
    goto LABEL_12;
  }
  v7 = 0;
LABEL_13:

  return v7;
}

- (ShortcutHandlingTask)initWithShortcutItem:(id)a3
{
  id v5;
  ShortcutHandlingTask *v6;
  ShortcutHandlingTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ShortcutHandlingTask;
  v6 = -[ShortcutHandlingTask init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_item, a3);

  return v7;
}

- (void)taskFinished:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ShortcutHandlingTask;
  -[RichMapsActivityCreatingTaskImpl taskFinished:](&v4, "taskFinished:", a3);
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", -[ShortcutHandlingTask analyticsActionType](self, "analyticsActionType"), 0, 0);
}

- (int)analyticsActionType
{
  return 17099;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

@end
