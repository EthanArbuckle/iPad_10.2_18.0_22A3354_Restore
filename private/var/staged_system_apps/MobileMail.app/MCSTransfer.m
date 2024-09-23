@implementation MCSTransfer

- (MCSTransfer)init
{
  -[MCSTransfer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MCSTransfer init]", "MCSTransfer.m", 41, "0");
}

- (MCSTransfer)initWithDestination:(id)a3 markAsRead:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  MCSTransfer *v8;
  MCSTransfer *v9;
  NSDictionary *v10;
  NSDictionary *originalLocations;
  id v12;
  id v13;
  MCSFlagChange *v14;
  MCSFlagChange *equivalentFlagChange;
  objc_super v17;

  v4 = a4;
  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MCSTransfer;
  v8 = -[MCSTransfer init](&v17, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_destination, a3);
    v10 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    originalLocations = v9->_originalLocations;
    v9->_originalLocations = v10;

    *((_BYTE *)v9 + 40) = *((_BYTE *)v9 + 40) & 0xFE | v4;
    if (v4)
    {
      v12 = objc_alloc((Class)NSMutableSet);
      v13 = objc_msgSend(v12, "initWithObjects:", MessageIsRead, 0);
      v14 = -[MCSFlagChange initWithFlagsToSet:flagsToClear:reason:]([MCSFlagChange alloc], "initWithFlagsToSet:flagsToClear:reason:", v13, 0, 4);
      equivalentFlagChange = v9->_equivalentFlagChange;
      v9->_equivalentFlagChange = v14;

    }
    *((_BYTE *)&v9->super.super + 8) |= 1u;
  }

  return v9;
}

- (MCSTransfer)initWithSpecialDestination:(int64_t)a3 markAsRead:(BOOL)a4 deleteIfSame:(BOOL)a5
{
  _BOOL4 v5;
  MCSTransfer *result;
  char v8;

  v5 = a5;
  result = -[MCSTransfer initWithDestination:markAsRead:](self, "initWithDestination:markAsRead:", 0, a4);
  if (result)
  {
    result->_specialType = a3;
    if (v5)
      v8 = 2;
    else
      v8 = 0;
    *((_BYTE *)result + 40) = *((_BYTE *)result + 40) & 0xFD | v8;
  }
  return result;
}

- (id)destination
{
  return self->_destination;
}

- (id)applyPendingChangeToObjects:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!-[MCSOperation isFinalized](self, "isFinalized"))
    __assert_rtn("-[MCSTransfer applyPendingChangeToObjects:]", "MCSTransfer.m", 78, "[self isFinalized]");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCSFlagChange applyPendingChangeToObjects:](self->_equivalentFlagChange, "applyPendingChangeToObjects:", v4));

  return v5;
}

- (BOOL)commitToMessages:(id)a3 failures:(id)a4 newMessages:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *j;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  void *v48;
  id v49;
  id v50;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];

  v44 = a3;
  v45 = a4;
  v49 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"));
  objc_msgSend(v7, "addReason:", MonitoredActivityReasonMoving);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "messageChangeManager"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCSTransfer _storeToMessagesMappingWithMessages:](self, "_storeToMessagesMappingWithMessages:", v44));
  -[MCSTransfer setOriginalLocations:](self, "setOriginalLocations:", v9);

  v42 = objc_alloc_init((Class)NSMutableArray);
  if (self->_destination)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "allObjects"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxUid URL](self->_destination, "URL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "moveMessages:destinationMailboxURL:userInitiated:", v10, v11, 1));

    objc_msgSend(v49, "addObjectsFromArray:", v12);
  }
  else
  {
    v50 = objc_alloc_init((Class)NSMutableDictionary);
    v46 = objc_alloc_init((Class)NSMutableSet);
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_originalLocations, "allKeys"));
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v14)
    {
      v47 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v57 != v47)
            objc_enumerationMutation(v13);
          v16 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mailbox", v42));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "representedAccount"));
          v19 = v18;
          if (v18)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mailboxUidOfType:createIfNeeded:", self->_specialType, 0));
            if (objc_msgSend(v20, "isEqual:", v17))
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_originalLocations, "objectForKey:", v16));
              objc_msgSend(v46, "unionSet:", v21);
            }
            else
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "uniqueID"));
              v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKey:", v21));
              v23 = (id)v22;
              if (!v22)
                v23 = objc_alloc_init((Class)NSMutableSet);
              v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_originalLocations, "objectForKey:", v16));
              objc_msgSend(v23, "unionSet:", v24);

              if (!v22)
                objc_msgSend(v50, "setObject:forKey:", v23, v21);

            }
          }

        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      }
      while (v14);
    }

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "allKeys"));
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v53;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(_QWORD *)v53 != v27)
            objc_enumerationMutation(v25);
          v29 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)j);
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount accountWithUniqueId:](MailAccount, "accountWithUniqueId:", v29, v42));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "mailboxUidOfType:createIfNeeded:", self->_specialType, 1));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKey:", v29));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "allObjects"));

          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "URL"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "moveMessages:destinationMailboxURL:userInitiated:", v33, v34, 1));

          objc_msgSend(v49, "addObjectsFromArray:", v35);
        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      }
      while (v26);
    }

    if ((*((_BYTE *)self + 40) & 2) != 0 && objc_msgSend(v46, "count"))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "allObjects"));
      objc_msgSend(v48, "deleteMessages:", v36);

    }
  }
  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v37 = objc_msgSend(objc_alloc((Class)ECMessageFlagChange), "initWithBuilder:", &stru_10051EDF8);
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "allObjects"));
    v39 = objc_msgSend(v48, "applyFlagChange:toMessages:", v37, v38);

  }
  objc_msgSend(v45, "addObjectsFromArray:", v42, v42);
  -[MCSTransfer _notifyStoresOfTransferedMessages:failedMessages:](self, "_notifyStoresOfTransferedMessages:failedMessages:", v49, v45);
  v40 = objc_msgSend(v44, "count");
  LOBYTE(v40) = v40 > objc_msgSend(v45, "count");

  return (char)v40;
}

- (BOOL)willMarkRead
{
  return 1;
}

- (BOOL)willMarkUnread
{
  return 0;
}

- (BOOL)willUnflag
{
  return 1;
}

- (BOOL)willFlag
{
  return 0;
}

- (id)description
{
  const __CFString *v2;

  if ((*((_BYTE *)self + 40) & 1) != 0)
    v2 = CFSTR("mark read");
  else
    v2 = CFSTR("don't mark read");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p Transfer to %@ (%@)"), self, self->_destination, v2);
}

- (id)localizedErrorDescriptionForMessageCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  if (a3 == 1)
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ERROR_TRANSFERRING_LONG_FORMAT"), &stru_100531B00, CFSTR("Main")));
  else
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ERROR_TRANSFERRING_LONG_FORMAT_MANY"), &stru_100531B00, CFSTR("Main")));
  v8 = (void *)v7;

  if (self->_destination)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MailChangeManager sharedChangeManager](MailChangeManager, "sharedChangeManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayNameUsingSpecialNamesForMailbox:", self->_destination));

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailboxUid specialNameForType:](MFMailboxUid, "specialNameForType:", self->_specialType));
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v10));

  return v11;
}

- (id)localizedErrorTitleForMessageCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (a3 == 1)
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ERROR_TRANSFERRING_TITLE"), &stru_100531B00, CFSTR("Main")));
  else
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ERROR_TRANSFERRING_TITLE_MULTIPLE"), &stru_100531B00, CFSTR("Main")));
  v7 = (void *)v6;

  return v7;
}

- (id)localizedShortOperationDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OPERATION_TRANSFER_DESC"), &stru_100531B00, CFSTR("Main")));

  return v3;
}

- (void)setIsDeletion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 40) = *((_BYTE *)self + 40) & 0xFB | v3;
}

- (void)_notifyStoresOfTransferedMessages:(id)a3 failedMessages:(id)a4
{
  id v6;
  id v7;
  NSDictionary *originalLocations;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  originalLocations = self->_originalLocations;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100104C4C;
  v11[3] = &unk_10051EE48;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](originalLocations, "enumerateKeysAndObjectsUsingBlock:", v11);

}

- (id)_storeToMessagesMappingWithMessages:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "messageStore", (_QWORD)v13));
        if (v10)
        {
          v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v10));
          if (!v11)
          {
            v11 = objc_alloc_init((Class)NSMutableSet);
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v10);
          }
          objc_msgSend(v11, "addObject:", v9);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v4;
}

- (NSDictionary)originalLocations
{
  return self->_originalLocations;
}

- (void)setOriginalLocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalLocations, 0);
  objc_storeStrong((id *)&self->_equivalentFlagChange, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

@end
