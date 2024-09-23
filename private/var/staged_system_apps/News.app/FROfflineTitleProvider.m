@implementation FROfflineTitleProvider

+ (id)offlineTitleWithOfflineReason:(int64_t)a3 offlineViewContext:(int64_t)a4
{
  return _objc_msgSend(a1, "offlineTitleWithOfflineReason:offlineViewContext:withInfo:", a3, a4, 0);
}

+ (id)offlineTitleWithOfflineReason:(int64_t)a3 offlineViewContext:(int64_t)a4 withInfo:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;

  v7 = a5;
  v8 = v7;
  switch(a4)
  {
    case 0:
      if ((unint64_t)(a3 - 1) < 5)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v9 = v11;
        v12 = CFSTR("Feed Unavailable");
        goto LABEL_42;
      }
      if (a3 != 6)
        goto LABEL_44;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v11;
      v12 = CFSTR("This feed isn’t available.");
      goto LABEL_42;
    case 1:
      if ((unint64_t)(a3 - 1) > 5)
        goto LABEL_44;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v11;
      v12 = CFSTR("Couldn’t Reload");
      goto LABEL_42;
    case 2:
      if ((unint64_t)(a3 - 1) >= 5 && a3 != 6)
        goto LABEL_44;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v11;
      v12 = CFSTR("Couldn’t Load Stories");
      goto LABEL_42;
    case 3:
      if ((unint64_t)(a3 - 1) >= 5 && a3 != 6)
        goto LABEL_44;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v11;
      v12 = CFSTR("Related Stories Unavailable");
      goto LABEL_42;
    case 4:
    case 5:
    case 9:
    case 10:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NUErrorMessageFactory errorMessageForArticleViewWithOfflineReason:](NUErrorMessageFactory, "errorMessageForArticleViewWithOfflineReason:", a3));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
      goto LABEL_43;
    case 6:
      if ((unint64_t)(a3 - 1) >= 5)
      {
        if (a3 != 6)
          goto LABEL_44;
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("feedType")));
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("channel"));

        if (v14)
        {
LABEL_31:
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v9 = v11;
          v12 = CFSTR("FRChannelUnavailableAlertTitle");
          goto LABEL_42;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("feedType")));
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("topic"));

        if (v16)
          goto LABEL_41;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("feedType")));
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("channel"));

      if (v18)
        goto LABEL_31;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("feedType")));
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("topic"));

      if (!v20)
      {
LABEL_44:
        a4 = 0;
        goto LABEL_45;
      }
LABEL_41:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v11;
      v12 = CFSTR("FRTopicUnavailableAlertTitle");
LABEL_42:
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v12, &stru_1000DF290, 0));
LABEL_43:
      a4 = v10;

LABEL_45:
      return (id)a4;
    case 7:
      if ((unint64_t)(a3 - 1) >= 5 && a3 != 6)
        goto LABEL_44;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v11;
      v12 = CFSTR("Content Unavailable");
      goto LABEL_42;
    case 8:
      if ((unint64_t)(a3 - 1) >= 5 && a3 != 6)
        goto LABEL_44;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v11;
      v12 = CFSTR("Search Unavailable");
      goto LABEL_42;
    case 11:
      if ((unint64_t)(a3 - 1) >= 5 && a3 != 6)
        goto LABEL_44;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v11;
      v12 = CFSTR("Apple News Unavailable");
      goto LABEL_42;
    case 12:
      if ((unint64_t)(a3 - 1) > 5)
        goto LABEL_44;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v11;
      v12 = CFSTR("Can’t Open");
      goto LABEL_42;
    case 13:
    case 14:
      if ((unint64_t)(a3 - 1) > 5)
        goto LABEL_44;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v11;
      v12 = CFSTR("Subscription Unavailable");
      goto LABEL_42;
    default:
      goto LABEL_45;
  }
}

+ (id)offlineMessageWithOfflineReason:(int64_t)a3 offlineViewContext:(int64_t)a4
{
  return _objc_msgSend(a1, "offlineMessageWithOfflineReason:offlineViewContext:withInfo:", a3, a4, 0);
}

+ (id)offlineMessageWithOfflineReason:(int64_t)a3 offlineViewContext:(int64_t)a4 withInfo:(id)a5
{
  id v7;
  void *v8;
  id v9;
  int64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;

  v7 = a5;
  v8 = v7;
  switch(a4)
  {
    case 0:
    case 1:
    case 12:
      switch(a3)
      {
        case 1:
        case 2:
          goto LABEL_6;
        case 3:
          goto LABEL_20;
        case 4:
        case 5:
          goto LABEL_15;
        case 6:
          goto LABEL_21;
        default:
          goto LABEL_19;
      }
    case 2:
      switch(a3)
      {
        case 1:
        case 2:
          goto LABEL_6;
        case 3:
          goto LABEL_20;
        case 4:
        case 5:
          goto LABEL_15;
        case 6:
          goto LABEL_21;
        default:
          goto LABEL_19;
      }
    case 3:
      switch(a3)
      {
        case 1:
        case 2:
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v9 = v11;
          v12 = CFSTR("Apple News isn’t connected to the internet. Go online to see related stories.");
          goto LABEL_28;
        case 3:
          goto LABEL_20;
        case 4:
        case 5:
          v9 = objc_msgSend(objc_alloc((Class)TSAlertArticleUnavailable), "initWithBlockedReason:", 1);
          v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "message"));
          goto LABEL_29;
        case 6:
          goto LABEL_21;
        default:
          goto LABEL_19;
      }
    case 4:
    case 5:
    case 9:
    case 10:
      v9 = (id)objc_claimAutoreleasedReturnValue(+[NUErrorMessageFactory errorMessageForArticleViewWithOfflineReason:](NUErrorMessageFactory, "errorMessageForArticleViewWithOfflineReason:", a3));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subtitle"));
      goto LABEL_29;
    case 6:
      switch(a3)
      {
        case 1:
        case 2:
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("feedType")));
          v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("topic"));

          if (v14)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v9 = v11;
            v12 = CFSTR("Apple News isn’t connected to the internet. Go online to see this topic.");
          }
          else
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("feedType")));
            v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("channel"));

            if (v16)
            {
              v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v9 = v11;
              v12 = CFSTR("Apple News isn’t connected to the internet. Go online to see this channel.");
            }
            else
            {
LABEL_27:
              v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v9 = v11;
              v12 = CFSTR("FROpenChannelRequiresLatestVersionOS");
            }
          }
          break;
        case 3:
          goto LABEL_20;
        case 4:
        case 5:
          goto LABEL_27;
        case 6:
          goto LABEL_21;
        default:
          goto LABEL_19;
      }
LABEL_28:
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v12, &stru_1000DF290, 0));
LABEL_29:
      a4 = v10;

      break;
    case 7:
      switch(a3)
      {
        case 1:
        case 2:
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v9 = v11;
          v12 = CFSTR("Apple News isn’t connected to the internet. Go online to see this content.");
          goto LABEL_28;
        case 3:
          goto LABEL_20;
        case 4:
        case 5:
          goto LABEL_15;
        case 6:
          goto LABEL_21;
        default:
          goto LABEL_19;
      }
    case 8:
      switch(a3)
      {
        case 1:
        case 2:
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v9 = v11;
          v12 = CFSTR("Apple News isn’t connected to the internet. Go online to search.");
          goto LABEL_28;
        case 3:
LABEL_20:
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v9 = v11;
          v12 = CFSTR("Apple News isn’t supported in your current region.");
          goto LABEL_28;
        case 4:
        case 5:
          goto LABEL_15;
        case 6:
LABEL_21:
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v9 = v11;
          v12 = CFSTR("Sorry, Apple News is no longer fully supported on older devices.");
          goto LABEL_28;
        default:
          goto LABEL_19;
      }
    case 11:
      switch(a3)
      {
        case 1:
        case 2:
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v9 = v11;
          v12 = CFSTR("Apple News isn’t connected to the internet. Go online to get started.");
          goto LABEL_28;
        case 3:
          goto LABEL_22;
        case 4:
        case 5:
          goto LABEL_15;
        case 6:
          goto LABEL_23;
        default:
          goto LABEL_19;
      }
    case 13:
    case 14:
      switch(a3)
      {
        case 1:
        case 2:
LABEL_6:
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v9 = v11;
          v12 = CFSTR("Apple News isn’t connected to the internet.");
          goto LABEL_28;
        case 3:
LABEL_22:
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v9 = v11;
          v12 = CFSTR("The app isn’t supported in your current region.");
          goto LABEL_28;
        case 4:
        case 5:
LABEL_15:
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v9 = v11;
          v12 = CFSTR("FRRequireLatestVersionOS");
          goto LABEL_28;
        case 6:
LABEL_23:
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v9 = v11;
          v12 = CFSTR("Apple News is no longer fully supported on older devices.");
          goto LABEL_28;
        default:
LABEL_19:
          a4 = 0;
          break;
      }
      break;
    default:
      break;
  }

  return (id)a4;
}

+ (id)offlineAcceptActionTitleWithOfflineReason:(int64_t)a3 offlineViewContext:(int64_t)a4
{
  return _objc_msgSend(a1, "offlineAcceptActionTitleWithOfflineReason:offlineViewContext:withInfo:", a3, a4, 0);
}

+ (id)offlineAcceptActionTitleWithOfflineReason:(int64_t)a3 offlineViewContext:(int64_t)a4 withInfo:(id)a5
{
  void *v5;
  void *v6;

  v5 = 0;
  if ((unint64_t)a4 <= 0xE && ((1 << a4) & 0x6630) != 0)
  {
    v5 = 0;
    if ((unint64_t)a3 <= 5 && ((1 << a3) & 0x36) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FRGoToSettings"), &stru_1000DF290, 0));

    }
  }
  return v5;
}

+ (id)offlineIgnoreActionTitleWithOfflineReason:(int64_t)a3 offlineViewContext:(int64_t)a4
{
  return _objc_msgSend(a1, "offlineIgnoreActionTitleWithOfflineReason:offlineViewContext:withInfo:", a3, a4, 0);
}

+ (id)offlineIgnoreActionTitleWithOfflineReason:(int64_t)a3 offlineViewContext:(int64_t)a4 withInfo:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;

  v7 = a5;
  v8 = 0;
  if ((unint64_t)a4 <= 0xE && ((1 << a4) & 0x6630) != 0)
  {
    v8 = 0;
    if ((unint64_t)a3 <= 6)
    {
      if (((1 << a3) & 6) != 0)
        goto LABEL_7;
      if (((1 << a3) & 0x30) != 0)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v10 = v9;
        v11 = CFSTR("Not Now");
        goto LABEL_9;
      }
      if (((1 << a3) & 0x48) != 0)
      {
LABEL_7:
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v10 = v9;
        v11 = CFSTR("OK");
LABEL_9:
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1000DF290, 0));

      }
    }
  }

  return v8;
}

@end
