@implementation CHPKSettingsServer

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CHPKSettingsServer;
  -[CHPKSettingsServer dealloc](&v3, "dealloc");
}

+ (void)initialize
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CHPKSettingsServer;
  objc_msgSendSuper2(&v3, "initialize");
  if ((id)objc_opt_class(CHPKSettingsServer) == a1)
    +[CHPKSettingsServer setupDefaults](CHPKSettingsServer, "setupDefaults");
}

+ (void)setupDefaults
{
  if (qword_10002AD98 != -1)
    dispatch_once(&qword_10002AD98, &stru_100024708);
}

+ (id)sharedSettingsServer
{
  if (qword_10002ADA8 != -1)
    dispatch_once(&qword_10002ADA8, &stru_100024728);
  return (id)qword_10002ADA0;
}

- (CHPKSettingsServer)init
{
  CHPKSettingsServer *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSXPCListener *v9;
  NSXPCListener *listener;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CHPKSettingsServer;
  v2 = -[CHPKSettingsServer init](&v12, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);

    v7 = dispatch_queue_create("com.apple.handwritingd.CHPKSettings", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.handwritingd.pksettings"));
    listener = v2->_listener;
    v2->_listener = v9;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    v2->_isListening = 0;

  }
  return v2;
}

- (void)resumeConnectionIfIdle
{
  void *v3;

  if (!-[CHPKSettingsServer isListening](self, "isListening"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHPKSettingsServer listener](self, "listener"));
    objc_msgSend(v3, "resume");

    -[CHPKSettingsServer setIsListening:](self, "setIsListening:", 1);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  NSXPCListener *listener;
  void *v8;

  v6 = a4;
  listener = self->_listener;
  if (listener == a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CHPKRemoteSettingsProtocol));
    objc_msgSend(v6, "setExportedInterface:", v8);

  }
  objc_msgSend(v6, "setExportedObject:", self);
  objc_msgSend(v6, "resume");

  return listener == a3;
}

- (void)setGlobalPrefersPencilOnlyDrawing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("UIPencilOnlyDrawWithPencilKey"));
  objc_msgSend(v4, "synchronize");

}

- (void)openPencilSettings
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];
  _QWORD v13[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=Pencil")));
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)qword_10002ADB0;
  v11 = qword_10002ADB0;
  if (!qword_10002ADB0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100005634;
    v7[3] = &unk_1000247A0;
    v7[4] = &v8;
    sub_100005634((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultWorkspace"));
  v12[0] = CFSTR("__UnlockDevice");
  v12[1] = CFSTR("__PromptUnlockDevice");
  v13[0] = &__kCFBooleanTrue;
  v13[1] = &__kCFBooleanTrue;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
  objc_msgSend(v5, "openSensitiveURL:withOptions:", v2, v6);

}

- (void)setCurrentScribbleLanguageIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v8;

  v8 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:"));
  if (+[CHRecognitionSession isLocaleSupported:](CHRecognitionSession, "isLocaleSupported:", v3))
  {
    v4 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.PencilKit"));
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("CurrentScribbleLanguageKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("ScribbleLanguageTimestampKey"));

    objc_msgSend(v4, "synchronize");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.PencilKit"), 0, 0, 1u);

  }
}

- (void)setCurrentScribbleLanguageIdentifiers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  __CFNotificationCenter *DarwinNotifyCenter;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
LABEL_4:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(v5);
      v10 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", v10, (_QWORD)v17));
      if (objc_msgSend(v10, "length"))
      {
        if (+[CHRecognitionSession isLocaleSupported:](CHRecognitionSession, "isLocaleSupported:", v11))
        {
          if ((unint64_t)objc_msgSend(v10, "length") >= 0x10)
          {
            v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringWithRange:", 0, 15));

            v10 = (id)v12;
          }
          objc_msgSend(v4, "addObject:", v10);
          if ((unint64_t)objc_msgSend(v4, "count") >= 0xA)
            break;
        }
      }

      if (v7 == (id)++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (!v7)
          goto LABEL_14;
        goto LABEL_4;
      }
    }

  }
LABEL_14:

  v13 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.PencilKit"));
  objc_msgSend(v13, "setObject:forKey:", v4, CFSTR("CurrentScribbleLanguages"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("ScribbleLanguageTimestampKey"));

  objc_msgSend(v13, "synchronize");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.PencilKit"), 0, 0, 1u);

}

- (void)getGlobalPrefersPencilHoverPreviewEnabledWithCompletion:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v3 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("PKUIPencilHoverPreviewEnabledKey"));

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, id))v6 + 2))(v6, v4);
    v5 = v6;
  }

}

- (void)setGlobalPrefersPencilHoverPreviewEnabled:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v5;
  void (**v6)(void);

  v4 = a3;
  v6 = (void (**)(void))a4;
  v5 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
  objc_msgSend(v5, "setBool:forKey:", v4, CFSTR("PKUIPencilHoverPreviewEnabledKey"));
  objc_msgSend(v5, "setValue:forKey:", &__kCFBooleanTrue, CFSTR("PKHasUserChangedHoverPreviewEnabledSettingKey"));
  if (v6)
    v6[2]();

}

- (void)setGlobalAutoRefineEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("UIAutoRefineEnabledKey"));
  objc_msgSend(v4, "synchronize");

}

- (BOOL)getGlobalAutoRefineEnabled
{
  id v2;
  unsigned __int8 v3;

  v2 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("UIAutoRefineEnabledKey"));

  return v3;
}

- (void)setGlobalAutoRefineEnabled:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v5;
  void (**v6)(void);

  v4 = a3;
  v6 = (void (**)(void))a4;
  v5 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
  objc_msgSend(v5, "setBool:forKey:", v4, CFSTR("UIAutoRefineEnabledKey"));
  objc_msgSend(v5, "synchronize");
  if (v6)
    v6[2]();

}

- (void)sessionDidBegin
{
  -[CHPKSettingsServer _enqueueTimestampUpdate](self, "_enqueueTimestampUpdate");
}

- (void)sessionDidEnd
{
  -[CHPKSettingsServer _enqueueTimestampUpdate](self, "_enqueueTimestampUpdate");
}

- (void)_enqueueTimestampUpdate
{
  void *v3;
  OS_dispatch_queue *queue;
  id v5;
  _QWORD v6[4];
  id v7;
  CHPKSettingsServer *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005368;
  v6[3] = &unk_100024778;
  objc_copyWeak(&v9, &location);
  v7 = v3;
  v8 = self;
  v5 = v3;
  dispatch_sync((dispatch_queue_t)queue, v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_touchLastSessionTimestampIfNecessary
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CHPKSettingsServer queuedTimestampDate](self, "queuedTimestampDate"));
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v12 = v4;

  v5 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.PencilKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("ScribbleLanguageTimestampKey")));
  v7 = objc_msgSend(v6, "copy");

  if (!v7)
  {
    v10 = 0;
LABEL_9:
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("ScribbleLanguageTimestampKey"));

    objc_msgSend(v5, "synchronize");
    goto LABEL_10;
  }
  objc_msgSend(v7, "doubleValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateByAddingUnit:value:toDate:options:", 64, 30, v8, 0));

  if (!v10 || objc_msgSend(v12, "compare:", v10) == (id)-1)
    goto LABEL_9;
LABEL_10:

}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)setIsListening:(BOOL)a3
{
  self->_isListening = a3;
}

- (NSDate)queuedTimestampDate
{
  return self->_queuedTimestampDate;
}

- (void)setQueuedTimestampDate:(id)a3
{
  objc_storeStrong((id *)&self->_queuedTimestampDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedTimestampDate, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
