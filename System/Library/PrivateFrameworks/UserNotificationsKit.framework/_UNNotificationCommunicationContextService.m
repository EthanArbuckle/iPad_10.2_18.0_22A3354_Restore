@implementation _UNNotificationCommunicationContextService

- (_UNNotificationCommunicationContextService)init
{
  _UNNotificationCommunicationContextService *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UNNotificationCommunicationContextService;
  v2 = -[_UNNotificationCommunicationContextService init](&v4, sel_init);
  if (v2)
    NCRegisterUserNotificationsUILogging();
  return v2;
}

- (id)resolveCommunicationContextForRequest:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  int v22;
  id v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "communicationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = NCUILogCommunicationNotifications;
    if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138543618;
      v23 = v7;
      v24 = 2082;
      v25 = "-[_UNNotificationCommunicationContextService resolveCommunicationContextForRequest:bundleIdentifier:]";
      _os_log_impl(&dword_2149F4000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: Service existing context context", (uint8_t *)&v22, 0x16u);
    }
    -[_UNNotificationCommunicationContextService _updatedCommunicationContext:bundleIdentifier:](self, "_updatedCommunicationContext:bundleIdentifier:", v9, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = NCUILogCommunicationNotifications;
      if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 138543618;
        v23 = v7;
        v24 = 2082;
        v25 = "-[_UNNotificationCommunicationContextService resolveCommunicationContextForRequest:bundleIdentifier:]";
        _os_log_impl(&dword_2149F4000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: New context created while servicing request", (uint8_t *)&v22, 0x16u);
      }
      objc_msgSend(v6, "content");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");
      objc_msgSend(v14, "setCommunicationContext:", v11);

      if (v14)
      {
        v15 = (void *)MEMORY[0x24BDF8858];
        objc_msgSend(v6, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "trigger");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "requestWithIdentifier:content:trigger:destinations:", v16, v14, v17, objc_msgSend(v6, "destinations"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
    v11 = 0;
  }
  v18 = 0;
LABEL_12:
  if (v18)
    v19 = v18;
  else
    v19 = v6;
  v20 = v19;

  return v20;
}

- (id)_updatedCommunicationContext:(id)a3 bundleIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v7, "setBundleIdentifier:", v5);
  objc_msgSend(v6, "sender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[_UNNotificationContactService sharedInstance](_UNNotificationContactService, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateServiceWithContact:bundleIdentifier:", v8, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && (objc_msgSend(v10, "isEqual:", v8) & 1) == 0)
    {
      v11 = NCUILogCommunicationNotifications;
      if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138544130;
        v14 = v5;
        v15 = 2082;
        v16 = "-[_UNNotificationCommunicationContextService _updatedCommunicationContext:bundleIdentifier:]";
        v17 = 2114;
        v18 = v8;
        v19 = 2114;
        v20 = v10;
        _os_log_impl(&dword_2149F4000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: Updated sender.\nExisting:%{public}@\nUpdated:%{public}@", (uint8_t *)&v13, 0x2Au);
      }
      objc_msgSend(v7, "setSender:", v10);
    }

  }
  return v7;
}

@end
