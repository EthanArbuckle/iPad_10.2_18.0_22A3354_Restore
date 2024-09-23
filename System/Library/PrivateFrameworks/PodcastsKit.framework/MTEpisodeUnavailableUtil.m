@implementation MTEpisodeUnavailableUtil

+ (int64_t)unavailableReasonForEpisode:(id)a3
{
  id v3;
  int64_t v4;
  void *v5;
  int v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isRestricted") & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "feedDeleted") && !objc_msgSend(v3, "isDownloaded"))
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isDownloaded") & 1) != 0
         || (+[MTReachability sharedInstance](MTReachability, "sharedInstance"),
             v5 = (void *)objc_claimAutoreleasedReturnValue(),
             v6 = objc_msgSend(v5, "isReachable"),
             v5,
             v6))
  {
    if (objc_msgSend(v3, "isEntitled"))
      v4 = 0;
    else
      v4 = 7;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

+ (id)alertTitleForUnavailableReason:(int64_t)a3 podcastTitle:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;

  v5 = a4;
  v6 = v5;
  switch(a3)
  {
    case 3:
      if (objc_msgSend(v5, "length"))
      {
        v7 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = CFSTR("EPISODE_FEEDDELETED_TITLE");
        goto LABEL_7;
      }
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v11;
      v12 = CFSTR("EPISODE_FEEDDELETED_TITLE_NO_PODCAST");
      goto LABEL_17;
    case 4:
      if (objc_msgSend(v5, "length"))
      {
        v7 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = CFSTR("EPISODE_UNAVAILABLE_TITLE");
LABEL_7:
        objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_24FD64198, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", v13, v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v11;
        v12 = CFSTR("EPISODE_UNAVAILABLE_TITLE_NO_PODCAST");
LABEL_17:
        objc_msgSend(v11, "localizedStringForKey:value:table:", v12, &stru_24FD64198, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }

      return v14;
    case 5:
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v11;
      v12 = CFSTR("CANNOT_BE_PLAYED_TITLE");
      goto LABEL_17;
    case 6:
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v11;
      v12 = CFSTR("CANT_BE_PLAYED_ON_DEVICE");
      goto LABEL_17;
    case 7:
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v11;
      v12 = CFSTR("SUBSCRIBE_TO_LISTEN");
      goto LABEL_17;
    case 8:
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v11;
      v12 = CFSTR("SUBSCRIPTION_IS_REQUIRED");
      goto LABEL_17;
    case 9:
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v11;
      v12 = CFSTR("LICENSE_SLOT_ERROR_TITLE");
      goto LABEL_17;
    case 10:
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v11;
      v12 = CFSTR("LICENSE_DEVICES_ERROR_TITLE");
      goto LABEL_17;
    case 11:
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v11;
      v12 = CFSTR("WATCH_CANNOT_PLAY_VIDEOS_TITLE");
      goto LABEL_17;
    default:
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v11;
      v12 = CFSTR("EPISODE_UNAVAILABLE");
      goto LABEL_17;
  }
}

+ (id)stringForUnavailableReason:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;

  if ((unint64_t)(a3 - 3) < 8)
    goto LABEL_2;
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("Restricted");
    goto LABEL_3;
  }
  if (a3 == 13)
  {
LABEL_2:
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("Unavailable");
LABEL_3:
    objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24FD64198, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (a3 != 2)
  {
    v7 = 0;
    return v7;
  }
  +[MTReachability sharedInstance](MTReachability, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reasonTextForNoInternet");
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_4:
  v7 = (void *)v6;

  return v7;
}

+ (id)longStringForUnavailableReason:(int64_t)a3 podcastTitle:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  int v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v15;

  v6 = a4;
  v7 = 0;
  switch(a3)
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("ALERT_MESSAGE_RESTRICTED");
      goto LABEL_11;
    case 2:
      objc_msgSend(a1, "longReasonTextForNoInternet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("SUBSCRIPTION_REQUIRED");
      goto LABEL_11;
    case 9:
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("LICENSE_SLOT_ERROR");
      goto LABEL_11;
    case 10:
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("LICENSE_DEVICES_ERROR");
      goto LABEL_11;
    case 11:
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("WATCH_CANNOT_PLAY_VIDEOS_MESSAGE");
LABEL_11:
      objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_24FD64198, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 13:
      v11 = MGGetBoolAnswer();
      v12 = CFSTR("WIFI_LICENSE_CORRUPTION_ERROR");
      if (v11)
        v12 = CFSTR("WLAN_LICENSE_CORRUPTION_ERROR");
      v13 = (void *)MEMORY[0x24BDD1488];
      v14 = v12;
      objc_msgSend(v13, "mainBundle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", v14, &stru_24FD64198, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      break;
  }

  return v7;
}

+ (id)longReasonTextForNoInternet
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  __CFString *v10;

  +[MTReachability sharedInstance](MTReachability, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "reasonForNoInternet");

  if (v3 == 1)
  {
    v6 = MGGetBoolAnswer();
    v7 = CFSTR("EPISODE_AIRPLANE_MODE_WIFI");
    v8 = CFSTR("EPISODE_AIRPLANE_MODE_WLAN");
LABEL_7:
    if (v6)
      v7 = (__CFString *)v8;
    v9 = (void *)MEMORY[0x24BDD1488];
    v10 = v7;
    objc_msgSend(v9, "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", v10, &stru_24FD64198, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if (v3 == 2)
  {
    v6 = MGGetBoolAnswer();
    v7 = CFSTR("EPISODE_SYSTEM_CELLULAR_DISABLED_WIFI");
    v8 = CFSTR("EPISODE_SYSTEM_CELLULAR_DISABLED_WLAN");
    goto LABEL_7;
  }
  if (v3 != 3)
  {
    v5 = 0;
    return v5;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("EPISODE_NO_INTERNET"), &stru_24FD64198, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v5;
}

- (BOOL)showDialogForReason:(int64_t)a3 podcastTitle:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  _QWORD aBlock[4];
  id v24;
  int64_t v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__MTEpisodeUnavailableUtil_showDialogForReason_podcastTitle_completion___block_invoke;
  aBlock[3] = &unk_24FD62668;
  v11 = v9;
  v24 = v11;
  v25 = a3;
  v12 = _Block_copy(aBlock);
  v13 = 0;
  v14 = 0;
  if ((unint64_t)a3 > 0xD)
    goto LABEL_5;
  if (((1 << a3) & 0x2F78) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "alertTitleForUnavailableReason:podcastTitle:", a3, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "longStringForUnavailableReason:podcastTitle:", a3, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisodeUnavailableUtil _presentErrorDialogWithTitle:message:handler:](self, "_presentErrorDialogWithTitle:message:handler:", v15, v13, v12);
    v14 = 1;
LABEL_4:

    goto LABEL_5;
  }
  if (!a3)
    goto LABEL_11;
  if (a3 == 2)
  {
    +[MTReachability sharedInstance](MTReachability, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v10;
    v20[1] = 3221225472;
    v20[2] = __72__MTEpisodeUnavailableUtil_showDialogForReason_podcastTitle_completion___block_invoke_2;
    v20[3] = &unk_24FD62690;
    v21 = v11;
    v22 = 2;
    v14 = objc_msgSend(v19, "showInternetUnreachableDialogWithAcknowledmentBlock:", v20);

    v13 = 0;
    v15 = v21;
    goto LABEL_4;
  }
LABEL_5:
  _MTLogCategoryPlayback();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = v13;
    if (!v13)
    {
      objc_msgSend((id)objc_opt_class(), "longStringForUnavailableReason:podcastTitle:", a3, v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138412290;
    v27 = v17;
    _os_log_impl(&dword_22FB0C000, v16, OS_LOG_TYPE_ERROR, "Episode Unavailable (%@)", buf, 0xCu);
    if (!v13)

  }
LABEL_11:

  return v14;
}

uint64_t __72__MTEpisodeUnavailableUtil_showDialogForReason_podcastTitle_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __72__MTEpisodeUnavailableUtil_showDialogForReason_podcastTitle_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_presentErrorDialogWithTitle:(id)a3 message:(id)a4 handler:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _MTLogCategoryPlayback();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_22FB0C000, v8, OS_LOG_TYPE_ERROR, "Unable to show Episode Unavailable dialog. Title = [%@], Message = [%@]", (uint8_t *)&v9, 0x16u);
  }

}

@end
