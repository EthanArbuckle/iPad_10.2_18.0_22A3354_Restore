@implementation ICInAppMessageUserNotificationCoordinator

+ (id)_musicCenter
{
  if (_musicCenter_sOnceToken != -1)
    dispatch_once(&_musicCenter_sOnceToken, &__block_literal_global_11802);
  return (id)_musicCenter_sharedMusicCenter;
}

+ (id)_amsPushHandler
{
  if (_amsPushHandler_sOnceToken != -1)
    dispatch_once(&_amsPushHandler_sOnceToken, &__block_literal_global_2);
  return (id)_amsPushHandler_sharedPushHandler;
}

+ (void)addBadgeIconForBundleIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  void (**v15)(id, _QWORD);
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a4;
  objc_msgSend(a1, "_centerForBundleIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_musicCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  objc_msgSend(v7, "badgeNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  if (v9 && v11 == 1)
  {
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = a1;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Recieved a message to increment the badge count of the Music app when it already is badged with the number 1. The count will not be incremented.", buf, 0xCu);
    }

    v6[2](v6, 0);
  }
  else
  {
    if ((v9 & 1) != 0)
    {
      v13 = &unk_1E43E66B8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11 + 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __88__ICInAppMessageUserNotificationCoordinator_addBadgeIconForBundleIdentifier_completion___block_invoke;
    v14[3] = &unk_1E438E500;
    v15 = v6;
    objc_msgSend(v7, "setBadgeNumber:withCompletionHandler:", v13, v14);

  }
}

+ (void)removeBadgeIconForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  objc_msgSend(a1, "_centerForBundleIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "badgeNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9 - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __91__ICInAppMessageUserNotificationCoordinator_removeBadgeIconForBundleIdentifier_completion___block_invoke;
    v11[3] = &unk_1E438E500;
    v12 = v6;
    objc_msgSend(v7, "setBadgeNumber:withCompletionHandler:", v10, v11);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

+ (BOOL)scheduleNotificationWithPayload:(id)a3 forBundleIdentifier:(id)a4
{
  id v5;
  void *v6;
  int v7;

  v5 = a3;
  objc_msgSend(a1, "_amsPushHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldHandleNotification:", v5);
  if (v7)
    objc_msgSend(v6, "handleNotification:", v5);

  return v7;
}

+ (void)removeNotificationWithIdentifier:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "_centerForBundleIdentifier:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removePendingNotificationRequestsWithIdentifiers:", v8);

  v10 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeDeliveredNotificationsWithIdentifiers:", v9);
}

+ (id)_centerForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Music")))
    {
      objc_msgSend(a1, "_musicCenter");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", v5);
    }
    v7 = (void *)v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __91__ICInAppMessageUserNotificationCoordinator_removeBadgeIconForBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88__ICInAppMessageUserNotificationCoordinator_addBadgeIconForBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__ICInAppMessageUserNotificationCoordinator__amsPushHandler__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CFDC08]);
  objc_msgSend(v3, "setUserNotificationExtensionId:", CFSTR("music-notification-default"));
  objc_msgSend(MEMORY[0x1E0CFD9E8], "bagForProfile:profileVersion:", CFSTR("Music"), CFSTR("1"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFDC10]), "initWithConfiguration:bag:", v3, v0);
  v2 = (void *)_amsPushHandler_sharedPushHandler;
  _amsPushHandler_sharedPushHandler = v1;

}

void __57__ICInAppMessageUserNotificationCoordinator__musicCenter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", CFSTR("com.apple.Music"));
  v1 = (void *)_musicCenter_sharedMusicCenter;
  _musicCenter_sharedMusicCenter = v0;

}

@end
