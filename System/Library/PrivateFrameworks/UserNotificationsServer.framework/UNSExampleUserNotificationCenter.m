@implementation UNSExampleUserNotificationCenter

- (UNSExampleUserNotificationCenter)init
{
  UNSExampleUserNotificationCenter *v2;
  UNSExampleUserNotificationCenter *v3;
  uint64_t v4;
  PTTestRecipe *basicTestRecipe;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UNSExampleUserNotificationCenter;
  v2 = -[UNSExampleUserNotificationCenter init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UNSExampleUserNotificationCenter _basicPostUpdateRecipe](v2, "_basicPostUpdateRecipe");
    v4 = objc_claimAutoreleasedReturnValue();
    basicTestRecipe = v3->_basicTestRecipe;
    v3->_basicTestRecipe = (PTTestRecipe *)v4;

    +[PTDomain registerTestRecipe:](UNSUserNotificationServerDomain, "registerTestRecipe:", v3->_basicTestRecipe);
  }
  return v3;
}

- (id)latestNotificationRequestIdentifier
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), __notificationRequestCount);
}

- (id)sectionIdentifier
{
  return CFSTR("com.apple.usernotifications.example");
}

- (void)publish
{
  -[UNSExampleUserNotificationCenter publishWithNumberOfUniqueThreads:](self, "publishWithNumberOfUniqueThreads:", 0);
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
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("thread-%ld"), v4 % a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), __notificationRequestCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSExampleUserNotificationCenter _postNotificationWithID:threadIdentifier:](self, "_postNotificationWithID:threadIdentifier:", v5, v6);

}

- (void)publish:(unint64_t)a3 completion:(id)a4
{
  -[UNSExampleUserNotificationCenter publish:numberOfUniqueThreads:completion:](self, "publish:numberOfUniqueThreads:completion:", a3, 0, a4);
}

- (void)publish:(unint64_t)a3 numberOfUniqueThreads:(unint64_t)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = (void (**)(_QWORD))a5;
  if (a3)
  {
    v9 = a3;
    do
    {
      -[UNSExampleUserNotificationCenter publishWithNumberOfUniqueThreads:](self, "publishWithNumberOfUniqueThreads:", a4);
      --v9;
    }
    while (v9);
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    v10 = MEMORY[0x24BDAC760];
    do
    {
      v11 = dispatch_group_create();
      dispatch_group_enter(v11);
      -[UNSExampleUserNotificationCenter _userNotificationCenter](self, "_userNotificationCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v10;
      v14[1] = 3221225472;
      v14[2] = __77__UNSExampleUserNotificationCenter_publish_numberOfUniqueThreads_completion___block_invoke;
      v14[3] = &unk_24D63A1E0;
      v16 = &v18;
      v17 = a3;
      v13 = v11;
      v15 = v13;
      objc_msgSend(v12, "getDeliveredNotificationsWithCompletionHandler:", v14);

      dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    }
    while (!*((_BYTE *)v19 + 24));
    _Block_object_dispose(&v18, 8);
  }
  if (v8)
    v8[2](v8);

}

void __77__UNSExampleUserNotificationCenter_publish_numberOfUniqueThreads_completion___block_invoke(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "count") == *(_QWORD *)(a1 + 48);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)update
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), __notificationRequestCount);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UNSExampleUserNotificationCenter _postNotificationWithID:threadIdentifier:](self, "_postNotificationWithID:threadIdentifier:", v3, 0);

}

- (void)removeAllNotifications
{
  void *v3;
  id v4;

  -[UNSExampleUserNotificationCenter _userNotificationCenter](self, "_userNotificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllPendingNotificationRequests");

  -[UNSExampleUserNotificationCenter _userNotificationCenter](self, "_userNotificationCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllDeliveredNotifications");

}

- (void)_postNotificationWithID:(id)a3 threadIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
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
  -[UNSExampleUserNotificationCenter _existingNotificationRequestForIdentifier:](self, "_existingNotificationRequestForIdentifier:", v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "content");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
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
    -[UNSExampleUserNotificationCenter _userNotificationCenter](self, "_userNotificationCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:", v18, v10, 0);

  }
  else
  {
    v8 = -[UNSExampleUserNotificationCenter _newNotificationRequest:threadIdentifier:](self, "_newNotificationRequest:threadIdentifier:", v18, v6);
    -[UNSExampleUserNotificationCenter _userNotificationCenter](self, "_userNotificationCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addNotificationRequest:withCompletionHandler:", v8, 0);
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
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  userNotificationCenter = self->_userNotificationCenter;
  if (userNotificationCenter)
  {
    v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    v7 = self->_userNotificationCenter;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __78__UNSExampleUserNotificationCenter__existingNotificationRequestForIdentifier___block_invoke;
    v11[3] = &unk_24D63A208;
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

void __78__UNSExampleUserNotificationCenter__existingNotificationRequestForIdentifier___block_invoke(uint64_t a1, void *a2)
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

  v18 = *MEMORY[0x24BDAC8D0];
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
    v4 = objc_alloc(MEMORY[0x24BDF88B8]);
    -[UNSExampleUserNotificationCenter sectionIdentifier](self, "sectionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UNUserNotificationCenter *)objc_msgSend(v4, "initWithBundleIdentifier:", v5);
    v7 = self->_userNotificationCenter;
    self->_userNotificationCenter = v6;

    -[UNUserNotificationCenter requestAuthorizationWithOptions:completionHandler:](self->_userNotificationCenter, "requestAuthorizationWithOptions:completionHandler:", 7, &__block_literal_global_10);
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
  v7 = objc_alloc_init(MEMORY[0x24BDF8800]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Notification %@"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v8);

  objc_msgSend(v7, "setBody:", CFSTR("Message"));
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("http://www.apple.com"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDefaultActionURL:", v9);

  objc_msgSend(v7, "setCategoryIdentifier:", CFSTR("default"));
  if (v6)
    objc_msgSend(v7, "setThreadIdentifier:", v6);
  objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:", v5, v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_basicPostUpdateRecipe
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__UNSExampleUserNotificationCenter__basicPostUpdateRecipe__block_invoke;
  v4[3] = &unk_24D63A270;
  v4[4] = self;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__UNSExampleUserNotificationCenter__basicPostUpdateRecipe__block_invoke_2;
  v3[3] = &unk_24D63A270;
  objc_msgSend(MEMORY[0x24BE7B310], "recipeWithTitle:increaseAction:decreaseAction:", CFSTR("Post [UP] / Update [DN] Notification"), v4, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __58__UNSExampleUserNotificationCenter__basicPostUpdateRecipe__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "publish");
}

uint64_t __58__UNSExampleUserNotificationCenter__basicPostUpdateRecipe__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "update");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basicTestRecipe, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
}

@end
