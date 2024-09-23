@implementation NSNotificationCenter(SafariCoreExtras)

- (void)safari_addObserver:()SafariCoreExtras selector:forUserDefaultKey:
{
  void *v8;
  id v9;
  id v10;

  v8 = (void *)MEMORY[0x1E0C99EA0];
  v9 = a3;
  objc_msgSend(v8, "safari_notificationNameForUserDefaultsKey:", a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addObserver:selector:name:object:", v9, a4, v10, 0);

}

- (void)safari_removeObserver:()SafariCoreExtras forUserDefaultKey:
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0C99EA0];
  v7 = a3;
  objc_msgSend(v6, "safari_notificationNameForUserDefaultsKey:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removeObserver:name:object:", v7, v8, 0);

}

- (id)safari_addObserverForUserDefaultKey:()SafariCoreExtras queue:usingBlock:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0C99EA0];
  v11 = a4;
  objc_msgSend(v10, "safari_notificationNameForUserDefaultsKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __95__NSNotificationCenter_SafariCoreExtras__safari_addObserverForUserDefaultKey_queue_usingBlock___block_invoke;
  v17[3] = &unk_1E649D1C0;
  v18 = v8;
  v19 = v9;
  v13 = v8;
  v14 = v9;
  objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:", v12, 0, v11, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
