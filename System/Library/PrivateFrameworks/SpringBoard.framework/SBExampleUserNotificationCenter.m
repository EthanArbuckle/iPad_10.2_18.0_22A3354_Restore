@implementation SBExampleUserNotificationCenter

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_51);
  return (id)sharedInstance___sharedInstance_1;
}

void __49__SBExampleUserNotificationCenter_sharedInstance__block_invoke()
{
  SBExampleUserNotificationCenter *v0;
  void *v1;

  v0 = objc_alloc_init(SBExampleUserNotificationCenter);
  v1 = (void *)sharedInstance___sharedInstance_1;
  sharedInstance___sharedInstance_1 = (uint64_t)v0;

}

- (NSString)latestNotificationRequestIdentifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), __notificationRequestCount);
}

- (NSString)sectionIdentifier
{
  return (NSString *)CFSTR("com.apple.usernotifications.example");
}

- (void)publish
{
  -[SBExampleUserNotificationCenter publishWithNumberOfUniqueThreads:](self, "publishWithNumberOfUniqueThreads:", 0);
}

- (void)publishWithNumberOfUniqueThreads:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  id v6;

  ++__notificationRequestCount;
  if (a3)
  {
    v4 = __notificationThreadCount++;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("thread-%ld"), v4 % a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), __notificationRequestCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBExampleUserNotificationCenter _postNotificationWithID:threadIdentifier:](self, "_postNotificationWithID:threadIdentifier:", v5, v6);

}

- (void)publish:(unint64_t)a3 completion:(id)a4
{
  -[SBExampleUserNotificationCenter publish:numberOfUniqueThreads:completion:](self, "publish:numberOfUniqueThreads:completion:", a3, 0, a4);
}

- (void)publish:(unint64_t)a3 numberOfUniqueThreads:(unint64_t)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  void *v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  _QWORD *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  _QWORD v24[5];
  _QWORD v25[5];

  v8 = (void (**)(_QWORD))a5;
  if (a3)
  {
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v25[3] = 0;
    -[SBExampleUserNotificationCenter _userNotificationCenter](self, "_userNotificationCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __76__SBExampleUserNotificationCenter_publish_numberOfUniqueThreads_completion___block_invoke;
    v24[3] = &unk_1E8EA5490;
    v24[4] = v25;
    objc_msgSend(v9, "getDeliveredNotificationsWithCompletionHandler:", v24);

    v11 = a3;
    do
    {
      -[SBExampleUserNotificationCenter publishWithNumberOfUniqueThreads:](self, "publishWithNumberOfUniqueThreads:", a4);
      --v11;
    }
    while (v11);
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    do
    {
      v12 = dispatch_group_create();
      dispatch_group_enter(v12);
      -[SBExampleUserNotificationCenter _userNotificationCenter](self, "_userNotificationCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v10;
      v15[1] = 3221225472;
      v15[2] = __76__SBExampleUserNotificationCenter_publish_numberOfUniqueThreads_completion___block_invoke_2;
      v15[3] = &unk_1E8EA54B8;
      v18 = v25;
      v19 = a3;
      v17 = &v20;
      v14 = v12;
      v16 = v14;
      objc_msgSend(v13, "getDeliveredNotificationsWithCompletionHandler:", v15);

      dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    }
    while (!*((_BYTE *)v21 + 24));
    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(v25, 8);
  }
  if (v8)
    v8[2](v8);

}

uint64_t __76__SBExampleUserNotificationCenter_publish_numberOfUniqueThreads_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __76__SBExampleUserNotificationCenter_publish_numberOfUniqueThreads_completion___block_invoke_2(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "count") == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
                                                                                          + *(_QWORD *)(a1 + 56);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)update
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), __notificationRequestCount);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBExampleUserNotificationCenter _postNotificationWithID:threadIdentifier:](self, "_postNotificationWithID:threadIdentifier:", v3, 0);

}

- (void)removeAllNotifications
{
  void *v3;
  id v4;

  -[SBExampleUserNotificationCenter _userNotificationCenter](self, "_userNotificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllPendingNotificationRequests");

  -[SBExampleUserNotificationCenter _userNotificationCenter](self, "_userNotificationCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllDeliveredNotifications");

}

- (void)_postNotificationWithID:(id)a3 threadIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  -[SBExampleUserNotificationCenter _existingNotificationRequestForIdentifier:](self, "_existingNotificationRequestForIdentifier:", v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "content");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDate:", v11);

    objc_msgSend(v9, "body");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "rangeOfString:", CFSTR(" [UPDATE]\n\n\n[UPDATE]"));
    if (objc_msgSend(v12, "hasSuffix:", CFSTR(" [UPDATE]\n\n\n[UPDATE]")))
    {
      objc_msgSend(v12, "substringToIndex:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v12, "hasSuffix:", CFSTR(" [UPDATE]")))
        v15 = CFSTR(" [UPDATE]\n\n\n[UPDATE]");
      else
        v15 = CFSTR(" [UPDATE]");
      objc_msgSend(v12, "stringByAppendingString:", v15);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v14;

    objc_msgSend(v10, "setBody:", v16);
    -[SBExampleUserNotificationCenter _userNotificationCenter](self, "_userNotificationCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:", v18, v10, 0);

  }
  else
  {
    v9 = -[SBExampleUserNotificationCenter _newNotificationRequest:threadIdentifier:](self, "_newNotificationRequest:threadIdentifier:", v18, v6);
    -[SBExampleUserNotificationCenter _userNotificationCenter](self, "_userNotificationCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addNotificationRequest:withCompletionHandler:", v9, 0);
  }

}

- (id)_existingNotificationRequestForIdentifier:(id)a3
{
  id v4;
  UNUserNotificationCenter *userNotificationCenter;
  NSObject *v6;
  UNUserNotificationCenter *v7;
  NSObject *v8;
  UNUserNotificationCenter *v9;
  _QWORD v11[4];
  id v12;
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__17;
  v19 = __Block_byref_object_dispose__17;
  v20 = 0;
  userNotificationCenter = self->_userNotificationCenter;
  if (userNotificationCenter)
  {
    v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    v7 = self->_userNotificationCenter;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__SBExampleUserNotificationCenter__existingNotificationRequestForIdentifier___block_invoke;
    v11[3] = &unk_1E8EA54E0;
    v12 = v4;
    v14 = &v15;
    v8 = v6;
    v13 = v8;
    -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:](v7, "getDeliveredNotificationsWithCompletionHandler:", v11);
    dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);

    userNotificationCenter = (UNUserNotificationCenter *)v16[5];
  }
  v9 = userNotificationCenter;
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __77__SBExampleUserNotificationCenter__existingNotificationRequestForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "request", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (v10)
        {
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v12 = *(void **)(v11 + 40);
          *(_QWORD *)(v11 + 40) = v8;

          goto LABEL_11;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (id)_userNotificationCenter
{
  UNUserNotificationCenter *userNotificationCenter;
  id v4;
  void *v5;
  UNUserNotificationCenter *v6;
  UNUserNotificationCenter *v7;

  userNotificationCenter = self->_userNotificationCenter;
  if (!userNotificationCenter)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEC7A0]);
    -[SBExampleUserNotificationCenter sectionIdentifier](self, "sectionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UNUserNotificationCenter *)objc_msgSend(v4, "initWithBundleIdentifier:", v5);
    v7 = self->_userNotificationCenter;
    self->_userNotificationCenter = v6;

    -[UNUserNotificationCenter requestAuthorizationWithOptions:completionHandler:](self->_userNotificationCenter, "requestAuthorizationWithOptions:completionHandler:", 7, &__block_literal_global_9);
    userNotificationCenter = self->_userNotificationCenter;
  }
  return userNotificationCenter;
}

- (id)_newNotificationRequest:(id)a3 threadIdentifier:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Notification %@"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v8);

  objc_msgSend(v7, "setBody:", CFSTR("Message"));
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("http://www.apple.com"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDefaultActionURL:", v9);

  if (v6)
    objc_msgSend(v7, "setThreadIdentifier:", v6);
  objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:", v5, v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
}

@end
