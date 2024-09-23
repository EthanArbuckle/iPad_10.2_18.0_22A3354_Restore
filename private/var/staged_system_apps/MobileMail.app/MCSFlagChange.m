@implementation MCSFlagChange

- (MCSFlagChange)initWithFlagsToSet:(id)a3 flagsToClear:(id)a4 reason:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  MCSFlagChange *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *flagChanges;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  _BYTE v41[128];

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "intersectsSet:", v9);
  if ((_DWORD)v10)
  {
    sub_100101B30((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17, (uint64_t)v8);
    if (objc_msgSend(v8, "intersectsSet:", v9))
      __assert_rtn("-[MCSFlagChange initWithFlagsToSet:flagsToClear:reason:]", "MCSFlagChange.m", 43, "[flagsToSet intersectsSet:flagsToClear] == __objc_no");
  }
  v39.receiver = self;
  v39.super_class = (Class)MCSFlagChange;
  v18 = -[MCSFlagChange init](&v39, "init");
  if (v18)
  {
    v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    flagChanges = v18->_flagChanges;
    v18->_flagChanges = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v18->_flagChanges, "setObject:forKeyedSubscript:", v21, MFMessageChangeReason);

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v22 = v8;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v36;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v36 != v24)
            objc_enumerationMutation(v22);
          -[NSMutableDictionary setObject:forKey:](v18->_flagChanges, "setObject:forKey:", CFSTR("YES"), *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v25));
          v25 = (char *)v25 + 1;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v23);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v26 = v9;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v32;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v32 != v28)
            objc_enumerationMutation(v26);
          -[NSMutableDictionary setObject:forKey:](v18->_flagChanges, "setObject:forKey:", CFSTR("NO"), *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v29));
          v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      }
      while (v27);
    }

    *((_BYTE *)&v18->super.super + 8) |= 1u;
  }

  return v18;
}

- (id)_applyFlagChange:(id)a3 toObjects:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id obj;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  _BYTE v31[128];

  v24 = a3;
  v6 = a4;
  if (!-[MCSOperation isFinalized](self, "isFinalized"))
    __assert_rtn("-[MCSFlagChange _applyFlagChange:toObjects:]", "MCSFlagChange.m", 66, "[self isFinalized]");
  v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", MFMessageIsFlagged));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", MessageIsRead));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", MessageIsDeleted));
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        if (v9)
        {
          if (objc_msgSend(v9, "BOOLValue"))
            v14 = CFSTR("MCSChangeSetReadMessages");
          else
            v14 = CFSTR("MCSChangeSetUnreadMessages");
          objc_msgSend(v7, "addObject:toSetForKey:", v13, v14);
        }
        if (v8)
        {
          if (objc_msgSend(v8, "BOOLValue"))
            v15 = CFSTR("MCSChangeSetFlaggedMessages");
          else
            v15 = CFSTR("MCSChangeSetUnflaggedMessages");
          objc_msgSend(v7, "addObject:toSetForKey:", v13, v15);
        }
        if (v23)
          objc_msgSend(v7, "addObject:toSetForKey:", v13, CFSTR("MCSChangeSetDeletedMessages"));
        v16 = objc_msgSend(v13, "messageFlags");
        v17 = MFMessageFlagsByApplyingDictionary(v16, v24);
        if ((id)v17 != v16)
          objc_msgSend(v13, "setMessageFlagsWithoutCommitting:", v17);
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v10);
  }

  v19 = MFLogGeneral(v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "#ChangeSetActions flags applied to messages: %@", buf, 0xCu);
  }

  return v7;
}

- (id)applyPendingChangeToObjects:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MCSFlagChange _applyFlagChange:toObjects:](self, "_applyFlagChange:toObjects:", self->_flagChanges, a3));
}

- (void)_sortMessages:(id)a3 intoLibraryMesages:(id)a4 nonLibraryMessages:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v14, "isLibraryMessage", (_QWORD)v16))
          v15 = v8;
        else
          v15 = v9;
        objc_msgSend(v15, "addObject:", v14);
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

- (BOOL)commitToMessages:(id)a3 failures:(id)a4 newMessages:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  NSMutableDictionary *flagChanges;
  void *v15;
  id v16;
  id v17;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v22 = a3;
  v20 = a4;
  v21 = a5;
  if (!-[MCSOperation isFinalized](self, "isFinalized"))
    __assert_rtn("-[MCSFlagChange commitToMessages:failures:newMessages:]", "MCSFlagChange.m", 125, "[self isFinalized]");
  v23 = objc_alloc_init((Class)NSMutableSet);
  v8 = objc_alloc_init((Class)NSMutableSet);
  -[MCSFlagChange _sortMessages:intoLibraryMesages:nonLibraryMessages:](self, "_sortMessages:intoLibraryMesages:nonLibraryMessages:", v22, v23, v8);
  if (objc_msgSend(v23, "count"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allObjects"));
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "mf_dictionaryWithMessagesSortedByStore"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          flagChanges = self->_flagChanges;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v13));
          v16 = objc_msgSend(v13, "setFlagsFromDictionary:forMessages:", flagChanges, v15);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v10);
    }

  }
  if (objc_msgSend(v8, "count"))
    v17 = -[MCSFlagChange applyPendingChangeToObjects:](self, "applyPendingChangeToObjects:", v8);

  return 1;
}

- (id)description
{
  return -[NSMutableDictionary description](self->_flagChanges, "description");
}

- (BOOL)willMarkRead
{
  return -[NSMutableDictionary mf_BOOLForKey:](self->_flagChanges, "mf_BOOLForKey:", MessageIsRead);
}

- (BOOL)willMarkUnread
{
  uint64_t v3;
  void *v4;

  v3 = MessageIsRead;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_flagChanges, "objectForKey:", MessageIsRead));

  if (v4)
    return -[NSMutableDictionary mf_BOOLForKey:](self->_flagChanges, "mf_BOOLForKey:", v3) ^ 1;
  else
    return 0;
}

- (BOOL)willUnflag
{
  uint64_t v3;
  void *v4;

  v3 = MFMessageIsFlagged;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_flagChanges, "objectForKey:", MFMessageIsFlagged));

  if (v4)
    return -[NSMutableDictionary mf_BOOLForKey:](self->_flagChanges, "mf_BOOLForKey:", v3) ^ 1;
  else
    return 0;
}

- (BOOL)willFlag
{
  return -[NSMutableDictionary mf_BOOLForKey:](self->_flagChanges, "mf_BOOLForKey:", MFMessageIsFlagged);
}

- (id)localizedErrorDescriptionForMessageCount:(unint64_t)a3
{
  return 0;
}

- (id)localizedErrorTitleForMessageCount:(unint64_t)a3
{
  return 0;
}

- (id)localizedShortOperationDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OPERATION_FLAG_DESC"), &stru_100531B00, CFSTR("Main")));

  return v3;
}

- (void)setIsDeletion:(BOOL)a3
{
  *((_BYTE *)self + 24) = *((_BYTE *)self + 24) & 0xFE | a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flagChanges, 0);
}

@end
