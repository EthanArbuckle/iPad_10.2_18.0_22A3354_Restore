@implementation MFNanoServerMessageFetchService

- (id)messagesForMailboxes:(id)a3 param:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoServerMessageFetchService _criterionForMessagesFromMailboxes:param:](self, "_criterionForMessagesFromMailboxes:param:", a3, v6));
  if (v7)
  {
    v11 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "loadLibraryMessagesFromLibraryMatchingCriterion:count:protectedDataAvailable:", v7, objc_msgSend(v6, "count"), &v11));

    objc_msgSend(v6, "setProtectedDataAvailable:", v11);
  }
  else
  {
    v9 = &__NSArray0__struct;
  }

  return v9;
}

- (id)_criterionForMessagesFromMailboxes:(id)a3 param:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)NSMutableArray);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoServerMessageFetchService _criterionForMessagesFromMailbox:param:](self, "_criterionForMessagesFromMailbox:param:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v12), v7, (_QWORD)v16));
        if (v13)
          objc_msgSend(v8, "addObject:", v13);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCriterion orCompoundCriterionWithCriteria:](MFMessageCriterion, "orCompoundCriterionWithCriteria:", v8));
  return v14;
}

- (id)_criterionForMessagesFromMailbox:(id)a3 param:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  double v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "url"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoServerMessageFetchService criterionForMailboxUrl:](self, "criterionForMailboxUrl:", v8));

  if (v9)
  {
    v10 = objc_alloc_init((Class)NSMutableArray);
    objc_msgSend(v10, "addObject:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoServerMessageFetchService _filterTypeCriterionForMailbox:](self, "_filterTypeCriterionForMailbox:", v6));
    if (v11)
      objc_msgSend(v10, "addObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "beforeDateReceived"));

    if (v12)
    {
      v13 = objc_alloc((Class)MFMessageCriterion);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "beforeDateReceived"));
      objc_msgSend(v14, "timeIntervalSince1970");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), (uint64_t)v15));
      v17 = objc_msgSend(v13, "initWithType:qualifier:expression:", 11, 5, v16);

      objc_msgSend(v10, "addObject:", v17);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateReceivedLimit"));

    if (v18)
    {
      v19 = objc_alloc((Class)MFMessageCriterion);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateReceivedLimit"));
      objc_msgSend(v20, "timeIntervalSince1970");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), (uint64_t)(v21 + -1.0)));
      v23 = objc_msgSend(v19, "initWithType:qualifier:expression:", 11, 6, v22);

      objc_msgSend(v10, "addObject:", v23);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "conversationId"));

    if (v24)
    {
      v25 = objc_alloc((Class)MFMessageCriterion);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "conversationId"));
      v27 = objc_msgSend(v25, "initWithType:qualifier:expression:", 34, 3, v26);

      objc_msgSend(v10, "addObject:", v27);
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCriterion andCompoundCriterionWithCriteria:](MFMessageCriterion, "andCompoundCriterionWithCriteria:", v10));

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)criterionForMailboxUrl:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCriterion criterionForMailboxURL:](MFMessageCriterion, "criterionForMailboxURL:", v5));

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount nano_activeMailAccounts](MailAccount, "nano_activeMailAccounts"));
    v17 = v7;
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v9);
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "mailboxUidOfType:createIfNeeded:", 7, 0));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URLString"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCriterion criterionForMailboxURL:](MFMessageCriterion, "criterionForMailboxURL:", v14));
            objc_msgSend(v8, "addObject:", v15);

          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v10);
      }

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCriterion orCompoundCriterionWithCriteria:](MFMessageCriterion, "orCompoundCriterionWithCriteria:", v8));
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (id)_filterTypeCriterionForMailbox:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  if ((objc_msgSend(v4, "hasFilterType:", 1) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = objc_msgSend(&off_100019BE0, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(&off_100019BE0);
          v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "unsignedIntegerValue");
          if (objc_msgSend(v4, "hasFilterType:", v10))
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoServerMessageFetchService _criterionForFilterType:](self, "_criterionForFilterType:", v10));
            if (v11)
              objc_msgSend(v6, "addObject:", v11);

          }
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(&off_100019BE0, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCriterion orCompoundCriterionWithCriteria:](MFMessageCriterion, "orCompoundCriterionWithCriteria:", v6));

  }
  return v5;
}

- (id)_criterionForFilterType:(unint64_t)a3
{
  void *v3;

  v3 = 0;
  if ((uint64_t)a3 > 15)
  {
    switch(a3)
    {
      case 0x10uLL:
        v3 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCriterion includesMeCriterion](MFMessageCriterion, "includesMeCriterion"));
        break;
      case 0x20uLL:
        v3 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCriterion threadNotifyMessageCriterion](MFMessageCriterion, "threadNotifyMessageCriterion"));
        break;
      case 0x40uLL:
        v3 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCriterion todayMessageCriterion](MFMessageCriterion, "todayMessageCriterion"));
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 2uLL:
        v3 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCriterion senderIsVIPCriterion:](MFMessageCriterion, "senderIsVIPCriterion:", 1));
        break;
      case 4uLL:
        v3 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCriterion flaggedMessageCriterion](MFMessageCriterion, "flaggedMessageCriterion"));
        break;
      case 8uLL:
        v3 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCriterion unreadMessageCriterion](MFMessageCriterion, "unreadMessageCriterion"));
        break;
    }
  }
  return v3;
}

@end
