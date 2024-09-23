@implementation ICQUserNotifications

+ (void)postUserNotificationWithIdentifier:(id)a3 title:(id)a4 subTitle:(id)a5 bodyText:(id)a6 url:(id)a7 replaceExisting:(BOOL)a8 offerID:(id)a9 completion:(id)a10
{
  uint64_t (*v15)(uint64_t, uint64_t);
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _BYTE *v36;
  _BYTE buf[24];
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v15 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v31 = a4;
  v32 = a5;
  v33 = a6;
  v16 = a7;
  v17 = a9;
  v18 = a10;
  if (!a8)
  {
    +[_ICQHelperFunctions userDefaultsDictionaryForKey:](_ICQHelperFunctions, "userDefaultsDictionaryForKey:", CFSTR("ICQUserNotificationKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v17);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    _ICQGetLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2112;
      v38 = v15;
      _os_log_impl(&dword_1CDEBD000, v21, OS_LOG_TYPE_DEFAULT, "ICQUserNotification for offerID: %@, last notification ID was %@, new ID %@", buf, 0x20u);
    }

    if (v20 && objc_msgSend(v15, "isEqualToString:", v20))
    {
      _ICQGetLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v15;
        _os_log_impl(&dword_1CDEBD000, v22, OS_LOG_TYPE_DEFAULT, "Ignoring notification with id %@ since it was already posted and we were asked not to repost.", buf, 0xCu);
      }
      goto LABEL_20;
    }

  }
  +[_ICQHelperFunctions userDefaultsDictionaryForKey:](_ICQHelperFunctions, "userDefaultsDictionaryForKey:", CFSTR("ICQUserNotificationKey"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v23, "mutableCopy");

  if (!v19)
    v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, v17);
  v24 = (void *)objc_msgSend(v19, "copy");
  +[_ICQHelperFunctions setUserDefaultsObject:forKey:](_ICQHelperFunctions, "setUserDefaultsObject:forKey:", v24, CFSTR("ICQUserNotificationKey"));

  v20 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
  objc_msgSend(v20, "setTitle:", v31);
  objc_msgSend(v20, "setSubtitle:", v32);
  objc_msgSend(v20, "setBody:", v33);
  _ICQGetLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v16;
    _os_log_impl(&dword_1CDEBD000, v25, OS_LOG_TYPE_DEFAULT, "ICQUserNotifications: got URL: %@", buf, 0xCu);
  }

  if (v16)
  {
    v26 = v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=ROOT"));
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v22 = v26;
  objc_msgSend(v20, "setDefaultActionURL:", v26);
  if (v15)
  {
    v27 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "UUIDString");
    v27 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:", v27, v20, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v38 = __Block_byref_object_copy__3;
  v39 = __Block_byref_object_dispose__3;
  v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", CFSTR("com.apple.iCloud.FollowUp"));
  v30 = *(void **)(*(_QWORD *)&buf[8] + 40);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __122__ICQUserNotifications_postUserNotificationWithIdentifier_title_subTitle_bodyText_url_replaceExisting_offerID_completion___block_invoke;
  v34[3] = &unk_1E8B38CE0;
  v35 = v18;
  v36 = buf;
  objc_msgSend(v30, "addNotificationRequest:withCompletionHandler:", v29, v34);

  _Block_object_dispose(buf, 8);
LABEL_20:

}

void __122__ICQUserNotifications_postUserNotificationWithIdentifier_title_subTitle_bodyText_url_replaceExisting_offerID_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

@end
