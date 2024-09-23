@implementation PLAssetsdNotificationClient

- (void)asyncNotifyUserViewedNotificationWithAlbumCloudGUID:(id)a3
{
  id v5;
  _BOOL4 v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *Name;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  __int128 v17;
  __int128 v18;
  SEL sel[2];
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18 = 0u;
  *(_OWORD *)sel = 0u;
  v17 = 0u;
  v6 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled", 0);
  LOBYTE(v17) = v6;
  if (v6)
  {
    *((_QWORD *)&v17 + 1) = _os_activity_create(&dword_199DF7000, "PLXPC Client: asyncNotifyUserViewedNotificationWithAlbumCloudGUID:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  PLRequestGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v21 = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_unboostingRemoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "userViewedNotificationWithAlbumCloudGUID:", v5);

  if ((_BYTE)v17)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  if (v8)
  {
    PLRequestGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      v16 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v21 = v16;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)asyncNotifyResponseToPhotoStreamInvitationForAlbumWithCloudGUID:(id)a3 acceptInvitation:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  _BOOL4 v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  const char *Name;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  __int128 v19;
  __int128 v20;
  SEL sel[2];
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v20 = 0u;
  *(_OWORD *)sel = 0u;
  v19 = 0u;
  v8 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled", 0);
  LOBYTE(v19) = v8;
  if (v8)
  {
    *((_QWORD *)&v19 + 1) = _os_activity_create(&dword_199DF7000, "PLXPC Client: asyncNotifyResponseToPhotoStreamInvitationForAlbumWithCloudGUID:acceptInvitation:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v19 + 1), (os_activity_scope_state_t)((char *)&v20 + 8));
  }
  PLRequestGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v10 = os_signpost_id_generate(v9);
  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v23 = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_unboostingRemoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "respondToPhotoStreamInvitationWithAlbumCloudGUID:acceptInvitation:", v7, v4);

  if ((_BYTE)v19)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v20 + 8));
  if (v10)
  {
    PLRequestGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      v18 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v23 = v18;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v17, OS_SIGNPOST_INTERVAL_END, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)asyncNotifyInterestingMemoryNotificationForColletionID:(id)a3 notificationDeliveryDate:(id)a4
{
  id v7;
  id v8;
  _BOOL4 v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  const char *Name;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  __int128 v20;
  __int128 v21;
  SEL sel[2];
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v21 = 0u;
  *(_OWORD *)sel = 0u;
  v20 = 0u;
  v9 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled", 0);
  LOBYTE(v20) = v9;
  if (v9)
  {
    *((_QWORD *)&v20 + 1) = _os_activity_create(&dword_199DF7000, "PLXPC Client: asyncNotifyInterestingMemoryNotificationForColletionID:notificationDeliveryDate:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v20 + 1), (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  PLRequestGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v11 = os_signpost_id_generate(v10);
  v12 = v10;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v24 = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_unboostingRemoteObjectProxy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "noteInterestingMemoryAlertWithMemoryUUID:notificationDeliveryDate:", v7, v8);

  if ((_BYTE)v20)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  if (v11)
  {
    PLRequestGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      v19 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v24 = v19;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v18, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)asyncNotifyInterestingMemoryNotificationViewedForColletionID:(id)a3
{
  id v5;
  _BOOL4 v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *Name;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  __int128 v17;
  __int128 v18;
  SEL sel[2];
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18 = 0u;
  *(_OWORD *)sel = 0u;
  v17 = 0u;
  v6 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled", 0);
  LOBYTE(v17) = v6;
  if (v6)
  {
    *((_QWORD *)&v17 + 1) = _os_activity_create(&dword_199DF7000, "PLXPC Client: asyncNotifyInterestingMemoryNotificationViewedForColletionID:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  PLRequestGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v21 = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_unboostingRemoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "noteInterestingMemoryAlertViewedWithUUID:", v5);

  if ((_BYTE)v17)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  if (v8)
  {
    PLRequestGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      v16 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v21 = v16;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)asyncNotifyReportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID:(id)a3
{
  id v5;
  _BOOL4 v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *Name;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  __int128 v17;
  __int128 v18;
  SEL sel[2];
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18 = 0u;
  *(_OWORD *)sel = 0u;
  v17 = 0u;
  v6 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled", 0);
  LOBYTE(v17) = v6;
  if (v6)
  {
    *((_QWORD *)&v17 + 1) = _os_activity_create(&dword_199DF7000, "PLXPC Client: asyncNotifyReportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  PLRequestGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v21 = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_unboostingRemoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID:", v5);

  if ((_BYTE)v17)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  if (v8)
  {
    PLRequestGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      v16 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v21 = v16;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)asyncNotifyExpiringMomentShareWithUUIDs:(id)a3 thumbnailImageData:(id)a4 notificationTitle:(id)a5 notificationSubtitle:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _BOOL4 v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  const char *Name;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  __int128 v26;
  __int128 v27;
  SEL sel[2];
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v27 = 0u;
  *(_OWORD *)sel = 0u;
  v26 = 0u;
  v15 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled", 0);
  LOBYTE(v26) = v15;
  if (v15)
  {
    *((_QWORD *)&v26 + 1) = _os_activity_create(&dword_199DF7000, "PLXPC Client: asyncNotifyExpiringMomentShareWithUUIDs:thumbnailImageData:notificationTitle:notificationSubtitle:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v26 + 1), (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  PLRequestGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v17 = os_signpost_id_generate(v16);
  v18 = v16;
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v30 = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_unboostingRemoteObjectProxy");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "noteGoingToExpireCMMsAlertWithCMMUUIDs:thumbnailImageData:notificationTitle:notificationSubtitle:", v11, v12, v13, v14);

  if ((_BYTE)v26)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  if (v17)
  {
    PLRequestGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      v25 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v30 = v25;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v24, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)asyncNotifyReadyToViewMomentShareWithUUID:(id)a3
{
  id v5;
  _BOOL4 v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *Name;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  __int128 v17;
  __int128 v18;
  SEL sel[2];
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18 = 0u;
  *(_OWORD *)sel = 0u;
  v17 = 0u;
  v6 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled", 0);
  LOBYTE(v17) = v6;
  if (v6)
  {
    *((_QWORD *)&v17 + 1) = _os_activity_create(&dword_199DF7000, "PLXPC Client: asyncNotifyReadyToViewMomentShareWithUUID:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  PLRequestGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v21 = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_unboostingRemoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "noteReadyToViewMomentShareWithUUID:", v5);

  if ((_BYTE)v17)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  if (v8)
  {
    PLRequestGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      v16 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v21 = v16;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)asyncNotifyPhotosChallengeSubmissionWithNotificationDeliveryDate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_unboostingRemoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notePhotosChallengeSubmissionWithNotificationDeliveryDate:", v4);

}

- (void)asyncNotifyPhotosChallengeNewQuestionsWithNotificationDeliveryDate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_unboostingRemoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notePhotosChallengeNewQuestionsWithNotificationDeliveryDate:", v4);

}

- (void)asyncNotifyStartOfInterestForUnrenderedCinematicVideoItems
{
  _BOOL4 v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *Name;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  __int128 v15;
  __int128 v16;
  SEL sel[2];
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  *(_OWORD *)sel = 0u;
  v15 = 0u;
  v4 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled", 0);
  LOBYTE(v15) = v4;
  if (v4)
  {
    *((_QWORD *)&v15 + 1) = _os_activity_create(&dword_199DF7000, "PLXPC Client: asyncNotifyStartOfInterestForUnrenderedCinematicVideoItems", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  PLRequestGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v19 = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_unboostingRemoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "notifyStartOfInterestForUnrenderedCinematicVideoItems");
  if ((_BYTE)v15)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  if (v6)
  {
    PLRequestGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      v14 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v19 = v14;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v13, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)asyncNotifyEndOfInterestForUnrenderedCinematicVideoItems
{
  _BOOL4 v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *Name;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  __int128 v15;
  __int128 v16;
  SEL sel[2];
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  *(_OWORD *)sel = 0u;
  v15 = 0u;
  v4 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled", 0);
  LOBYTE(v15) = v4;
  if (v4)
  {
    *((_QWORD *)&v15 + 1) = _os_activity_create(&dword_199DF7000, "PLXPC Client: asyncNotifyEndOfInterestForUnrenderedCinematicVideoItems", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  PLRequestGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v19 = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_unboostingRemoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "notifyEndOfInterestForUnrenderedCinematicVideoItems");
  if ((_BYTE)v15)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  if (v6)
  {
    PLRequestGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      v14 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v19 = v14;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v13, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)asyncNotifySharedLibrarySuggestionsWithNotificationDeliveryDate:(id)a3
{
  id v5;
  _BOOL4 v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *Name;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  __int128 v17;
  __int128 v18;
  SEL sel[2];
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18 = 0u;
  *(_OWORD *)sel = 0u;
  v17 = 0u;
  v6 = +[PLXPCMessageLogger enabled](PLXPCMessageLogger, "enabled", 0);
  LOBYTE(v17) = v6;
  if (v6)
  {
    *((_QWORD *)&v17 + 1) = _os_activity_create(&dword_199DF7000, "PLXPC Client: asyncNotifySharedLibrarySuggestionsWithNotificationDeliveryDate:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  PLRequestGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  sel[1] = a2;
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v21 = Name;
    _os_signpost_emit_with_name_impl(&dword_199DF7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  -[PLAssetsdBaseClient proxyFactory](self, "proxyFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_unboostingRemoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "noteSharedLibrarySuggestionsWithNotificationDeliveryDate:", v5);
  if ((_BYTE)v17)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  if (v8)
  {
    PLRequestGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      v16 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v21 = v16;
      _os_signpost_emit_with_name_impl(&dword_199DF7000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

@end
