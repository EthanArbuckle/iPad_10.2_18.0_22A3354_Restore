@implementation MTEpisodeUnavailableUtil

+ (int64_t)unavailableReasonForEpisode:(id)a3
{
  id v3;
  int64_t v4;
  void *v5;
  unsigned int v6;

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
         || (v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance")),
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

+ (int64_t)unavailableReasonForServerEpisode:(id)a3
{
  id v3;
  int64_t v4;
  void *v5;
  unsigned int v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isRestricted") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
    v6 = objc_msgSend(v5, "isReachable");

    if (v6)
    {
      if (objc_msgSend(v3, "priceTypeIsPSUB"))
        v4 = 7;
      else
        v4 = 0;
    }
    else
    {
      v4 = 2;
    }
  }

  return v4;
}

+ (id)alertTitleForUnavailableReason:(int64_t)a3 podcastTitle:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = v5;
  switch(a3)
  {
    case 3:
      if (objc_msgSend(v5, "length"))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("EPISODE_FEEDDELETED_TITLE");
        goto LABEL_7;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v10;
      v11 = CFSTR("EPISODE_FEEDDELETED_TITLE_NO_PODCAST");
      goto LABEL_17;
    case 4:
      if (objc_msgSend(v5, "length"))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("EPISODE_UNAVAILABLE_TITLE");
LABEL_7:
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1004C6D40, 0));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v6));

      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v10;
        v11 = CFSTR("EPISODE_UNAVAILABLE_TITLE_NO_PODCAST");
LABEL_17:
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_1004C6D40, 0));
      }

      return v13;
    case 5:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v10;
      v11 = CFSTR("CANNOT_BE_PLAYED_TITLE");
      goto LABEL_17;
    case 6:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v10;
      v11 = CFSTR("CANT_BE_PLAYED_ON_DEVICE");
      goto LABEL_17;
    case 7:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v10;
      v11 = CFSTR("SUBSCRIBE_TO_LISTEN");
      goto LABEL_17;
    case 8:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v10;
      v11 = CFSTR("SUBSCRIPTION_IS_REQUIRED");
      goto LABEL_17;
    case 9:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v10;
      v11 = CFSTR("LICENSE_SLOT_ERROR_TITLE");
      goto LABEL_17;
    case 10:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v10;
      v11 = CFSTR("LICENSE_DEVICES_ERROR_TITLE");
      goto LABEL_17;
    case 11:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v10;
      v11 = CFSTR("WATCH_CANNOT_PLAY_VIDEOS_TITLE");
      goto LABEL_17;
    default:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v10;
      v11 = CFSTR("EPISODE_UNAVAILABLE");
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
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Restricted");
    goto LABEL_3;
  }
  if (a3 == 13)
  {
LABEL_2:
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Unavailable");
LABEL_3:
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1004C6D40, 0));
    goto LABEL_4;
  }
  if (a3 != 2)
  {
    v7 = 0;
    return v7;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reasonTextForNoInternet"));
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
  __CFString *v13;
  void *v14;

  v6 = a4;
  v7 = 0;
  switch(a3)
  {
    case 1:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("ALERT_MESSAGE_RESTRICTED");
      goto LABEL_11;
    case 2:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "longReasonTextForNoInternet"));
      break;
    case 7:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("SUBSCRIPTION_REQUIRED");
      goto LABEL_11;
    case 9:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("LICENSE_SLOT_ERROR");
      goto LABEL_11;
    case 10:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("LICENSE_DEVICES_ERROR");
      goto LABEL_11;
    case 11:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("WATCH_CANNOT_PLAY_VIDEOS_MESSAGE");
LABEL_11:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1004C6D40, 0));

      break;
    case 13:
      v11 = MGGetBoolAnswer(CFSTR("wapi"));
      v12 = CFSTR("WIFI_LICENSE_CORRUPTION_ERROR");
      if (v11)
        v12 = CFSTR("WLAN_LICENSE_CORRUPTION_ERROR");
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v13, &stru_1004C6D40, 0));

      break;
    default:
      break;
  }

  return v7;
}

+ (id)longReasonTextForNoInternet
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  int v6;
  __CFString *v7;
  const __CFString *v8;
  __CFString *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
  v3 = objc_msgSend(v2, "reasonForNoInternet");

  if (v3 == (id)1)
  {
    v6 = MGGetBoolAnswer(CFSTR("wapi"));
    v7 = CFSTR("EPISODE_AIRPLANE_MODE_WIFI");
    v8 = CFSTR("EPISODE_AIRPLANE_MODE_WLAN");
LABEL_7:
    if (v6)
      v7 = (__CFString *)v8;
    v9 = v7;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v9, &stru_1004C6D40, 0));

    goto LABEL_10;
  }
  if (v3 == (id)2)
  {
    v6 = MGGetBoolAnswer(CFSTR("wapi"));
    v7 = CFSTR("EPISODE_SYSTEM_CELLULAR_DISABLED_WIFI");
    v8 = CFSTR("EPISODE_SYSTEM_CELLULAR_DISABLED_WLAN");
    goto LABEL_7;
  }
  if (v3 != (id)3)
  {
    v5 = 0;
    return v5;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("EPISODE_NO_INTERNET"), &stru_1004C6D40, 0));
LABEL_10:

  return v5;
}

- (BOOL)showDialogForReason:(int64_t)a3 podcastTitle:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  int64_t v29;
  uint8_t buf[4];
  void *v31;

  v8 = a4;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000C490C;
  v27[3] = &unk_1004A9D30;
  v9 = a5;
  v28 = v9;
  v29 = a3;
  v10 = objc_retainBlock(v27);
  v12 = v10;
  v13 = 0;
  v14 = 0;
  switch(a3)
  {
    case 0:
      goto LABEL_10;
    case 1:
      v10 = -[MTEpisodeUnavailableUtil _presentRestrictedDialogWithHandler:](self, "_presentRestrictedDialogWithHandler:", v10);
      v13 = 0;
      goto LABEL_3;
    case 2:
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000C4928;
      v24[3] = &unk_1004A9D58;
      v25 = v9;
      v26 = 2;
      v14 = objc_msgSend(v23, "showInternetUnreachableDialogWithAcknowledmentBlock:", v24);

      v13 = 0;
      goto LABEL_4;
    case 3:
    case 4:
    case 5:
    case 6:
    case 8:
    case 9:
    case 10:
    case 11:
    case 13:
      v15 = objc_msgSend((id)objc_opt_class(self), "alertTitleForUnavailableReason:podcastTitle:", a3, v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = objc_msgSend((id)objc_opt_class(self), "longStringForUnavailableReason:podcastTitle:", a3, v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v17);
      -[MTEpisodeUnavailableUtil _presentErrorDialogWithTitle:message:handler:](self, "_presentErrorDialogWithTitle:message:handler:", v16, v13, v12);

LABEL_3:
      v14 = 1;
      goto LABEL_4;
    default:
LABEL_4:
      v18 = _MTLogCategoryPlayback(v10, v11);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = v13;
        if (!v13)
        {
          v21 = objc_msgSend((id)objc_opt_class(self), "longStringForUnavailableReason:podcastTitle:", a3, v8);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v21);
        }
        *(_DWORD *)buf = 138412290;
        v31 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Episode Unavailable (%@)", buf, 0xCu);
        if (!v13)

      }
LABEL_10:

      return v14;
  }
}

- (void)_presentErrorDialogWithTitle:(id)a3 message:(id)a4 handler:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a5;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[MTAlertController alertControllerWithTitle:message:preferredStyle:](MTAlertController, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1004C6D40, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v9, 1, v7));

  objc_msgSend(v11, "addAction:", v10);
  objc_msgSend(v11, "presentAnimated:completion:", 1, 0);

}

- (void)_presentRestrictedDialogWithHandler:(id)a3
{
  id v3;
  _QWORD v4[4];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000C4AA8;
  v4[3] = &unk_1004A9D80;
  v5 = a3;
  v3 = v5;
  +[MTRestrictionsUtil presentExplicitRestrictionAlertIfNeededOfType:actionCompletion:](MTRestrictionsUtil, "presentExplicitRestrictionAlertIfNeededOfType:actionCompletion:", 0, v4);

}

+ (void)promptBeforePerformingIntentAsBufferedAirPlayForRoute:(id)a3 provider:(id)a4 queueStatus:(unint64_t)a5 completion:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(id, uint64_t);
  void *v17;
  void (**v18)(id, uint64_t);
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  int v27;
  unsigned int v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  unsigned int v36;
  void *v37;
  const __CFString *v38;
  unsigned int v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  NSString *v47;
  unsigned int v48;
  const __CFString *v49;
  uint64_t v50;
  unsigned int v51;
  unsigned int v52;
  void *v53;
  id v55;
  id v56;
  _QWORD v57[4];
  void (**v58)(id, uint64_t);
  _QWORD v59[4];
  id v60;

  v56 = a3;
  v55 = a4;
  v8 = a6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1004C6D40, 0));
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_1000C5258;
  v59[3] = &unk_1004A9318;
  v12 = v8;
  v60 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 1, v59));

  objc_msgSend(v9, "addAction:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Play"), &stru_1004C6D40, 0));
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_1000C5268;
  v57[3] = &unk_1004A9318;
  v16 = (void (**)(id, uint64_t))v12;
  v17 = v9;
  v18 = v16;
  v58 = v16;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 0, v57));

  objc_msgSend(v9, "addAction:", v19);
  if (isTV(objc_msgSend(v9, "setPreferredAction:", v19)))
  {
    v18[2](v18, 1);
    v20 = 0;
    v21 = 0;
    v23 = v55;
    v22 = v56;
  }
  else
  {
    if (isPad())
    {
      v22 = v56;
      if (objc_msgSend(v56, "isHomePodRoute"))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v25 = v24;
        v26 = CFSTR("SHARED_QUEUE_UNSUPPORTED_TITLE_HOMEPOD_IPAD");
      }
      else
      {
        v32 = objc_msgSend(v56, "isAppleTVRoute");
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v25 = v24;
        if (v32)
          v26 = CFSTR("SHARED_QUEUE_UNSUPPORTED_TITLE_APPLETV_IPAD");
        else
          v26 = CFSTR("SHARED_QUEUE_UNSUPPORTED_TITLE_DEVICE_IPAD");
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", v26, &stru_1004C6D40, 0));
      v23 = v55;

      switch(a5)
      {
        case 0uLL:
          goto LABEL_59;
        case 1uLL:
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          if (v55)
          {
            v38 = CFSTR("SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOW_PLAYING_ITEM_IPAD");
            goto LABEL_33;
          }
          v49 = CFSTR("SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOW_PLAYING_ITEM_IPAD_NO_PROVIDER");
          break;
        case 2uLL:
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v37 = v40;
          v41 = CFSTR("SHARED_QUEUE_UNSUPPORTED_MESSAGE_SINGLE_QUEUE_ITEM_IPAD");
          goto LABEL_45;
        case 3uLL:
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v37 = v40;
          v41 = CFSTR("SHARED_QUEUE_UNSUPPORTED_MESSAGE_MULTIPLE_QUEUE_ITEMS_IPAD");
          goto LABEL_45;
        case 4uLL:
          if (objc_msgSend(v56, "isHomePodRoute"))
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v43 = v42;
            v44 = CFSTR("SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOT_FOUND_HOMEPOD_IPAD");
          }
          else
          {
            v48 = objc_msgSend(v56, "isAppleTVRoute");
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v43 = v42;
            if (v48)
              v44 = CFSTR("SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOT_FOUND_APPLETV_IPAD");
            else
              v44 = CFSTR("SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOT_FOUND_DEVICE_IPAD");
          }
          v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "localizedStringForKey:value:table:", v44, &stru_1004C6D40, 0));

          v20 = 0;
          v21 = (void *)v50;
          goto LABEL_58;
        default:
          goto LABEL_34;
      }
LABEL_55:
      v45 = v17;
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", v49, &stru_1004C6D40, 0));
      v47 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v46, 0);
LABEL_56:
      v20 = (void *)objc_claimAutoreleasedReturnValue(v47);

      v17 = v45;
    }
    else
    {
      v27 = isTouch();
      v22 = v56;
      v28 = objc_msgSend(v56, "isHomePodRoute");
      if (v27)
      {
        if (v28)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v30 = v29;
          v31 = CFSTR("SHARED_QUEUE_UNSUPPORTED_TITLE_HOMEPOD_IPOD");
        }
        else
        {
          v36 = objc_msgSend(v56, "isAppleTVRoute");
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v30 = v29;
          if (v36)
            v31 = CFSTR("SHARED_QUEUE_UNSUPPORTED_TITLE_APPLETV_IPOD");
          else
            v31 = CFSTR("SHARED_QUEUE_UNSUPPORTED_TITLE_DEVICE_IPOD");
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", v31, &stru_1004C6D40, 0));
        v23 = v55;

        switch(a5)
        {
          case 0uLL:
            goto LABEL_59;
          case 1uLL:
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            if (v55)
            {
              v38 = CFSTR("SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOW_PLAYING_ITEM_IPOD");
              goto LABEL_33;
            }
            v49 = CFSTR("SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOW_PLAYING_ITEM_IPOD_NO_PROVIDER");
            goto LABEL_55;
          case 2uLL:
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v37 = v40;
            v41 = CFSTR("SHARED_QUEUE_UNSUPPORTED_MESSAGE_SINGLE_QUEUE_ITEM_IPOD");
            goto LABEL_45;
          case 3uLL:
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v37 = v40;
            v41 = CFSTR("SHARED_QUEUE_UNSUPPORTED_MESSAGE_MULTIPLE_QUEUE_ITEMS_IPOD");
            goto LABEL_45;
          case 4uLL:
            if (objc_msgSend(v56, "isHomePodRoute"))
            {
              v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v37 = v40;
              v41 = CFSTR("SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOT_FOUND_HOMEPOD_IPOD");
              goto LABEL_45;
            }
            v51 = objc_msgSend(v56, "isAppleTVRoute");
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            if (v51)
              v41 = CFSTR("SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOT_FOUND_APPLETV_IPOD");
            else
              v41 = CFSTR("SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOT_FOUND_DEVICE_IPOD");
            break;
          default:
            goto LABEL_34;
        }
      }
      else
      {
        if (v28)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v34 = v33;
          v35 = CFSTR("SHARED_QUEUE_UNSUPPORTED_TITLE_HOMEPOD_IPHONE");
        }
        else
        {
          v39 = objc_msgSend(v56, "isAppleTVRoute");
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v34 = v33;
          if (v39)
            v35 = CFSTR("SHARED_QUEUE_UNSUPPORTED_TITLE_APPLETV_IPHONE");
          else
            v35 = CFSTR("SHARED_QUEUE_UNSUPPORTED_TITLE_DEVICE_IPHONE");
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", v35, &stru_1004C6D40, 0));
        v23 = v55;

        switch(a5)
        {
          case 0uLL:
            goto LABEL_59;
          case 1uLL:
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            if (!v55)
            {
              v49 = CFSTR("SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOW_PLAYING_ITEM_IPHONE_NO_PROVIDER");
              goto LABEL_55;
            }
            v38 = CFSTR("SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOW_PLAYING_ITEM_IPHONE");
LABEL_33:
            v45 = v17;
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", v38, &stru_1004C6D40, 0));
            v47 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v46, v23);
            goto LABEL_56;
          case 2uLL:
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v37 = v40;
            v41 = CFSTR("SHARED_QUEUE_UNSUPPORTED_MESSAGE_SINGLE_QUEUE_ITEM_IPHONE");
            goto LABEL_45;
          case 3uLL:
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v37 = v40;
            v41 = CFSTR("SHARED_QUEUE_UNSUPPORTED_MESSAGE_MULTIPLE_QUEUE_ITEMS_IPHONE");
            goto LABEL_45;
          case 4uLL:
            if (objc_msgSend(v56, "isHomePodRoute"))
            {
              v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v37 = v40;
              v41 = CFSTR("SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOT_FOUND_HOMEPOD_IPHONE");
              goto LABEL_45;
            }
            v52 = objc_msgSend(v56, "isAppleTVRoute");
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            if (v52)
              v41 = CFSTR("SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOT_FOUND_APPLETV_IPHONE");
            else
              v41 = CFSTR("SHARED_QUEUE_UNSUPPORTED_MESSAGE_NOT_FOUND_DEVICE_IPHONE");
            break;
          default:
LABEL_34:
            v20 = 0;
            goto LABEL_58;
        }
      }
      v40 = v37;
LABEL_45:
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", v41, &stru_1004C6D40, 0));
    }

  }
LABEL_58:
  objc_msgSend(v17, "setTitle:", v21);
  objc_msgSend(v17, "setMessage:", v20);
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIViewController mt_rootViewController](UIViewController, "mt_rootViewController"));
  objc_msgSend(v53, "presentViewController:animated:completion:", v17, 1, 0);

LABEL_59:
}

@end
