@implementation BTDaemonAlert

+ (BTDaemonAlert)alertWithTitle:(id)a3 message:(id)a4 defaultButton:(id)a5 alternateButton:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  BTDaemonAlert *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_opt_new(BTDaemonAlert);
  -[BTDaemonAlert setTitle:](v13, "setTitle:", v12);

  -[BTDaemonAlert setMessage:](v13, "setMessage:", v11);
  -[BTDaemonAlert setDefaultButtonText:](v13, "setDefaultButtonText:", v10);

  -[BTDaemonAlert setAlternateButtonText:](v13, "setAlternateButtonText:", v9);
  return v13;
}

- (void)presentAlert:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFUserNotification *v15;
  __CFUserNotification *v16;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v18;
  __CFRunLoop *Main;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[3];
  _QWORD v39[3];

  v4 = a3;
  v38[0] = kCFUserNotificationAlertTopMostKey;
  v38[1] = SBUserNotificationDismissOnLock;
  v39[0] = &__kCFBooleanTrue;
  v39[1] = &__kCFBooleanFalse;
  v38[2] = SBUserNotificationDontDismissOnUnlock;
  v39[2] = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 3));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTDaemonAlert title](self, "title"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTDaemonAlert title](self, "title"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, kCFUserNotificationAlertHeaderKey);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTDaemonAlert message](self, "message"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTDaemonAlert message](self, "message"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, kCFUserNotificationAlertMessageKey);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTDaemonAlert defaultButtonText](self, "defaultButtonText"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BTDaemonAlert defaultButtonText](self, "defaultButtonText"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, kCFUserNotificationDefaultButtonTitleKey);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BTDaemonAlert alternateButtonText](self, "alternateButtonText"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BTDaemonAlert alternateButtonText](self, "alternateButtonText"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, kCFUserNotificationAlternateButtonTitleKey);

  }
  v15 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, (CFDictionaryRef)v6);
  if (v15)
  {
    v16 = v15;
    RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, v15, (CFUserNotificationCallBack)sub_100002DE4, 0);
    if (RunLoopSource)
    {
      v18 = RunLoopSource;
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, v18, kCFRunLoopDefaultMode);
      CFRelease(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[BTDaemonAlertResponse responseWithAlert:handler:](BTDaemonAlertResponse, "responseWithAlert:handler:", self, v4));
      v21 = sub_1000030B0();
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", v16));
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v20, v23);

    }
    else
    {
      v31 = qword_100015A68;
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
        sub_100009024((uint64_t)v6, v31, v32, v33, v34, v35, v36, v37);
      CFRelease(v16);
    }
  }
  else
  {
    v24 = qword_100015A68;
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
      sub_100008FBC((uint64_t)v6, v24, v25, v26, v27, v28, v29, v30);
  }

}

- (void)cancel
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  BTDaemonAlert *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = sub_1000030B0();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v9, (_QWORD)v12));
        v11 = (BTDaemonAlert *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "alert"));

        if (v11 == self)
        {
          CFUserNotificationCancel((CFUserNotificationRef)objc_msgSend(v9, "pointerValue"));
          CFRelease(objc_msgSend(v9, "pointerValue"));
          objc_msgSend(v4, "removeObjectForKey:", v9);

          goto LABEL_11;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSString)defaultButtonText
{
  return self->_defaultButtonText;
}

- (void)setDefaultButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_defaultButtonText, a3);
}

- (NSString)alternateButtonText
{
  return self->_alternateButtonText;
}

- (void)setAlternateButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_alternateButtonText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateButtonText, 0);
  objc_storeStrong((id *)&self->_defaultButtonText, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
