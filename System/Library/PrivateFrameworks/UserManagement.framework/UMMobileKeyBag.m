@implementation UMMobileKeyBag

+ (void)initialize
{
  __CFNotificationCenter *DarwinNotifyCenter;
  const char *v3;
  void *v4;
  const char *v5;
  int isEqualToString;
  const char *v7;
  void *v8;
  const char *v9;
  __CFDictionary *v10;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (DarwinNotifyCenter)
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_18FAED624, CFSTR("com.apple.mobile.keybagd.user_changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v10 = UMUserTypeDeviceMode(0, 0);
  objc_msgSend_objectForKeyedSubscript_(v10, v3, kUMDeviceModeKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v4, v5, kUMDeviceModeSharedIPad);
  byte_1ECD37F68 = isEqualToString;
  if (isEqualToString)
  {
    objc_msgSend_objectForKeyedSubscript_(v10, v7, kUMUserTypeKey);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v8, v9, kUMUserTypeEphemeral))
      byte_1EE184FC0 = 1;

  }
}

+ (UMUser)lastLoggedInUser
{
  void *v2;
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[6];
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_18FAEAA10;
  v37 = sub_18FAEA9E8;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_18FAEAA10;
  v31 = sub_18FAEA9E8;
  v32 = 0;
  sub_18FAE7234();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAFF584(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_18FAEDF44;
  v26[3] = &unk_1E2A4A950;
  v26[4] = &v33;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v5, (uint64_t)v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v4;
  v25[1] = 3221225472;
  v25[2] = sub_18FAEDFD0;
  v25[3] = &unk_1E2A4A9A0;
  v25[4] = &v27;
  v25[5] = &v33;
  objc_msgSend_userSessionLRUInfoWithReply_(v6, v7, (uint64_t)v25);

  v8 = (void *)v28[5];
  if (v8)
  {
    v9 = v8;
    objc_msgSend_lastObject(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v12;
    if (v12)
    {
      v16 = objc_msgSend_unsignedIntValue(v12, v13, v14);
      sub_18FAE72AC((uint64_t)UMUser, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    if (!v34[5])
    {
      v17 = 0;
      goto LABEL_9;
    }
    sub_18FAEA1C0();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    sub_18FAF6C60((uint64_t)v9, CFSTR("Could not get LRU UIDs, error: %@"), v18, v19, v20, v21, v22, v23, v34[5]);
    v17 = 0;
  }

LABEL_9:
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return (UMUser *)v17;
}

+ (id)currentSyncBubbleUser
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;

  v13 = 0;
  v2 = UMCurrentSyncBubbleSessionID(&v13);
  if ((_DWORD)v2 == -1)
  {
    if (v13)
    {
      sub_18FAEA1C0();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v13;
      sub_18FAF6C60((uint64_t)v4, CFSTR("Could not get current sync bubble uid, error: %@"), v6, v7, v8, v9, v10, v11, (uint64_t)v13);

    }
    v3 = 0;
  }
  else
  {
    sub_18FAE72AC((uint64_t)UMUser, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)queuedSyncBubbleUsers
{
  uint64_t v2;
  void *v4;
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  objc_msgSend_currentSyncBubbleUser(a1, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_18FAF2324;
  v15[3] = &unk_1E2A4AB08;
  v16 = v4;
  v6 = v4;
  objc_msgSend_predicateWithBlock_(v5, v7, (uint64_t)v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allSyncBubbleUsers(a1, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filteredArrayUsingPredicate_(v11, v12, (uint64_t)v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)allSyncBubbleUsers
{
  void *v2;
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  id v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[6];
  _QWORD v40[5];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = sub_18FAEAA10;
  v51 = sub_18FAEA9E8;
  v52 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = sub_18FAEAA10;
  v45 = sub_18FAEA9E8;
  v46 = 0;
  sub_18FAE7234();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAFF584(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = sub_18FAF2654;
  v40[3] = &unk_1E2A4A950;
  v40[4] = &v47;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v5, (uint64_t)v40);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v4;
  v39[1] = 3221225472;
  v39[2] = sub_18FAF26E0;
  v39[3] = &unk_1E2A4A9A0;
  v39[4] = &v41;
  v39[5] = &v47;
  objc_msgSend_listSyncBubbleUserswithReply_(v6, v7, (uint64_t)v39);

  v8 = (void *)v42[5];
  if (v8)
  {
    v9 = v8;
    v10 = (void *)MEMORY[0x1E0C99DE8];
    v13 = objc_msgSend_count(v9, v11, v12);
    objc_msgSend_arrayWithCapacity_(v10, v14, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v16 = v9;
    v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v35, v53, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v36;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v36 != v21)
            objc_enumerationMutation(v16);
          v18 = (const char *)objc_msgSend_unsignedIntValue(*(void **)(*((_QWORD *)&v35 + 1) + 8 * v22), v18, v19);
          if ((_DWORD)v18 != 502)
          {
            sub_18FAE72AC((uint64_t)UMUser, (uint64_t)v18);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
              objc_msgSend_addObject_(v15, v23, (uint64_t)v24);

          }
          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v35, v53, 16);
      }
      while (v20);
    }

    v27 = (void *)objc_msgSend_copy(v15, v25, v26);
  }
  else
  {
    if (!v48[5])
    {
      v27 = 0;
      goto LABEL_17;
    }
    sub_18FAEA1C0();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    sub_18FAF6C60((uint64_t)v16, CFSTR("Could not get sync bubble uids, error: %@"), v28, v29, v30, v31, v32, v33, v48[5]);
    v27 = 0;
  }

LABEL_17:
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  return v27;
}

+ (id)syncBubbleMachServiceNamesForUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  _QWORD v23[6];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v4 = a3;
  sub_18FAF1520((uint64_t)a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_18FAEAA10;
  v35 = sub_18FAEA9E8;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_18FAEAA10;
  v29 = sub_18FAEA9E8;
  v30 = 0;
  sub_18FAE7234();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAFF584(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_18FAF29A0;
  v24[3] = &unk_1E2A4A950;
  v24[4] = &v31;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v7, v9, (uint64_t)v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = sub_18FAF2A2C;
  v23[3] = &unk_1E2A4A9A0;
  v23[4] = &v25;
  v23[5] = &v31;
  objc_msgSend_listSyncServiceSourcesForUserSession_withReply_(v10, v11, (uint64_t)v5, v23);

  v12 = (void *)v26[5];
  if (v12)
  {
    v13 = v12;
  }
  else if (v32[5])
  {
    sub_18FAEA1C0();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAF6C60((uint64_t)v14, CFSTR("Could not get mach service names, error: %@"), v15, v16, v17, v18, v19, v20, v32[5]);

  }
  v21 = v12;

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v21;
}

+ (BOOL)startSyncBubbleForUser:(id)a3 outError:(id *)a4
{
  return sub_18FAF2AFC((uint64_t)a1, 1, a3, a4);
}

+ (BOOL)stopSyncBubbleForUser:(id)a3 outError:(id *)a4
{
  return sub_18FAF2AFC((uint64_t)a1, 0, a3, a4);
}

+ (BOOL)clearSyncBubblesWithOutError:(id *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  int v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_18FAEAA10;
  v24 = sub_18FAEA9E8;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  sub_18FAE7234();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAFF584(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_18FAF2F04;
  v15[3] = &unk_1E2A4A950;
  v15[4] = &v20;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5, v7, (uint64_t)v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = sub_18FAF2F90;
  v14[3] = &unk_1E2A4AA90;
  v14[4] = &v20;
  v14[5] = &v16;
  objc_msgSend_clearSyncBubbleUserswithReply_(v8, v9, (uint64_t)v14);

  v10 = (void *)v21[5];
  v11 = *((unsigned __int8 *)v17 + 24);
  if (a3)
    *a3 = objc_retainAutorelease(v10);
  v12 = v10;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v11 != 0;
}

@end
