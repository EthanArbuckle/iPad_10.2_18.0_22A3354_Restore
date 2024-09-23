@implementation MFMailMessage

- (BOOL)canReplyAll
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailMessage to](self, "to"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MFEmailSet setWithArray:](MFEmailSet, "setWithArray:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailMessage cc](self, "cc"));
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailMessage senders](self, "senders"));
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailMessage account](self, "account"));
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_claimAutoreleasedReturnValue(+[MailAccount defaultMailAccountForDelivery](MailAccount, "defaultMailAccountForDelivery"));
  v10 = v9;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "emailAddressesAndAliasesList", 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(v4, "removeObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i));
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  v15 = (unint64_t)objc_msgSend(v4, "count") > 1;
  return v15;
}

@end
