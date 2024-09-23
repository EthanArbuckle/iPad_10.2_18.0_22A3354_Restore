@implementation MFUserActivityBrowseMailboxRoute

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C0D38;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA488 != -1)
    dispatch_once(&qword_1005AA488, block);
  return (OS_os_log *)(id)qword_1005AA480;
}

- (MFUserActivityBrowseMailboxRoute)initWithMailboxPickerController:(id)a3
{
  id v5;
  MFUserActivityBrowseMailboxRoute *v6;
  MFUserActivityBrowseMailboxRoute *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFUserActivityBrowseMailboxRoute;
  v6 = -[MFUserActivityBrowseMailboxRoute init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mailboxPickerController, a3);

  return v7;
}

- (id)browseMailboxForActivityPayload:(id)a3 activityType:(id)a4 scrollToMessage:(BOOL)a5
{
  void *v7;
  id v8;
  _UNKNOWN **v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  MFUserActivityBrowseMailboxRoute *v37;
  void *v38;
  _BOOL4 v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[16];
  _BYTE v49[128];
  _QWORD v50[2];
  _QWORD v51[2];

  v39 = a5;
  v43 = a3;
  v40 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", MSMailActivityHandoffBrowseMailboxKeyFocusedMessageID));
  v51[0] = v40;
  v50[0] = CFSTR("ceActivityType");
  v50[1] = CFSTR("ceActivityIsHandoff");
  v8 = objc_msgSend(v7, "length");
  v9 = &off_100541A28;
  if (!v8)
    v9 = &off_100541A40;
  v51[1] = v9;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v51, v50, 2));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", MSMailActivityHandoffBrowseMailboxKeySpecialMailboxType));
  v41 = (void *)v10;
  if (v10)
  {
    if (objc_msgSend(MSMailActivityHandoffBrowseMailboxSpecialMailboxTypeAllInboxes, "isEqualToString:", v10))
    {
      v11 = objc_claimAutoreleasedReturnValue(+[FavoriteItem itemForUnifiedMailboxWithType:selected:](FavoriteItem, "itemForUnifiedMailboxWithType:selected:", 7, 0));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController favoriteItemSelectionTarget](self->_mailboxPickerController, "favoriteItemSelectionTarget"));
      objc_msgSend(v12, "selectCombinedMailboxWithType:item:animated:", 7, v11, 0);

    }
    else if (objc_msgSend(MSMailActivityHandoffBrowseMailboxSpecialMailboxTypeVIP, "isEqualToString:", v10))
    {
      v11 = objc_claimAutoreleasedReturnValue(+[FavoriteItem itemForSharedMailboxWithType:selected:](FavoriteItem, "itemForSharedMailboxWithType:selected:", 1, 0));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController favoriteItemSelectionTarget](self->_mailboxPickerController, "favoriteItemSelectionTarget"));
      objc_msgSend(v22, "selectCombinedInboxWithSourceType:item:animated:", 1, v11, 0);

    }
    else
    {
      v11 = objc_claimAutoreleasedReturnValue(+[MFUserActivityBrowseMailboxRoute log](MFUserActivityBrowseMailboxRoute, "log"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(Browse Activity) Unknown special source type. Assuming generic.", buf, 2u);
      }
    }

LABEL_27:
    v25 = 0;
    if (v7 && v39)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v7));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "mf_messageCriterion"));
      if (v32)
      {

        v25 = 0;
      }
      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mailHandoffErrorWithActivityContextInfo:errorFormat:](NSError, "mailHandoffErrorWithActivityContextInfo:errorFormat:", v42, CFSTR("Couldn't generate criterion for message scroll position for handoff. URL: %@"), v31));
      }

    }
    goto LABEL_45;
  }
  v37 = self;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", MSMailActivityHandoffBrowseMailboxKeyRemoteMailboxURL));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:"));
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount mailAccounts](MailAccount, "mailAccounts"));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v45;
LABEL_8:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v45 != v16)
        objc_enumerationMutation(v14);
      v18 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "uniqueID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "host"));
      v21 = objc_msgSend(v19, "isEqualToString:", v20);

      if ((v21 & 1) != 0)
        break;
      if (v15 == (id)++v17)
      {
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        if (v15)
          goto LABEL_8;
        goto LABEL_14;
      }
    }
    v23 = v18;

    if (!v23)
      goto LABEL_20;
    v24 = objc_opt_class(DAMailAccount);
    if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pathComponents"));
      v26 = v23;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 2));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "mailboxForFolderID:", v27));

    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
      if ((unint64_t)objc_msgSend(v25, "length") >= 3
        && objc_msgSend(v25, "characterAtIndex:", 0) == 47)
      {
        v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "substringFromIndex:", 1));

        v25 = (void *)v33;
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "mailboxUidForRelativePath:create:", v25, 0));
    }

    if (v28)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController favoriteItemSelectionTarget](v37->_mailboxPickerController, "favoriteItemSelectionTarget"));
      objc_msgSend(v34, "selectMailbox:item:animated:", v28, 0, 0);
      v30 = 0;
    }
    else
    {
      if (objc_msgSend(v7, "length"))
        v35 = CFSTR("Wasn't able to resolve mailbox for Browse Activity from handoff. Got URL: %@");
      else
        v35 = CFSTR("Wasn't able to resolve mailbox for Browse Activity for siri shortcut. Got URL: %@");
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v35, v13));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mailHandoffErrorWithActivityContextInfo:errorFormat:](NSError, "mailHandoffErrorWithActivityContextInfo:errorFormat:", v42, v34));
      v30 = 1;
    }

  }
  else
  {
LABEL_14:

LABEL_20:
    if (objc_msgSend(v7, "length"))
      v29 = CFSTR("Wasn't able to resolve account for Browse Activity from handoff. Got URL: %@");
    else
      v29 = CFSTR("Wasn't able to resolve account for Browse Activity for siri shortcut. Got URL: %@");
    v23 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v29, v13));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mailHandoffErrorWithActivityContextInfo:errorFormat:](NSError, "mailHandoffErrorWithActivityContextInfo:errorFormat:", v42, v23));
    v30 = 1;
  }

  if (!v30)
    goto LABEL_27;
LABEL_45:

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxPickerController, 0);
}

@end
