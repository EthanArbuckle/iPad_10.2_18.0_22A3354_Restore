@implementation PLAssetsdNotificationService

- (void)userViewedNotificationWithAlbumCloudGUID:(id)a3
{
  id v3;
  int v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  const char *Name;
  __int128 v9;
  char v10;
  __int128 v11;
  SEL sel[2];
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  *(_OWORD *)sel = 0u;
  v9 = 0u;
  v4 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v9) = v4;
  if (v4)
  {
    *((_QWORD *)&v9 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: userViewedNotificationWithAlbumCloudGUID:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v9 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager", (_QWORD)v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userViewedNotificationWithAlbumCloudGUID:", v3);

  if (v10)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  if ((_QWORD)v11)
  {
    PLRequestGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v7, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)noteInterestingMemoryAlertWithMemoryUUID:(id)a3 notificationDeliveryDate:(id)a4
{
  id v6;
  id v7;
  int v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  const char *Name;
  __int128 v14;
  char v15;
  __int128 v16;
  SEL sel[2];
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16 = 0u;
  *(_OWORD *)sel = 0u;
  v14 = 0u;
  v8 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v14) = v8;
  if (v8)
  {
    *((_QWORD *)&v14 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: noteInterestingMemoryAlertWithMemoryUUID:notificationDeliveryDate:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v14 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  v9 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdNotificationService noteInterestingMemoryAlertWithMemoryUUID:notificationDeliveryDate:]", (_QWORD)v14);
  +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationForInterestingMemoryWithMemoryUUID:library:notificationDeliveryDate:", v6, v9, v7);

  if (v15)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  if ((_QWORD)v16)
  {
    PLRequestGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v19 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v12, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)noteInterestingMemoryAlertViewedWithUUID:(id)a3
{
  id v3;
  int v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  const char *Name;
  __int128 v9;
  char v10;
  __int128 v11;
  SEL sel[2];
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  *(_OWORD *)sel = 0u;
  v9 = 0u;
  v4 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v9) = v4;
  if (v4)
  {
    *((_QWORD *)&v9 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: noteInterestingMemoryAlertViewedWithUUID:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v9 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager", (_QWORD)v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeNotificationForInterestingMemoryWithUUID:", v3);

  if (v10)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  if ((_QWORD)v11)
  {
    PLRequestGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v7, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)respondToPhotoStreamInvitationWithAlbumCloudGUID:(id)a3 acceptInvitation:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  int v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  const char *Name;
  __int128 v11;
  char v12;
  __int128 v13;
  SEL sel[2];
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13 = 0u;
  *(_OWORD *)sel = 0u;
  v11 = 0u;
  v6 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v11) = v6;
  if (v6)
  {
    *((_QWORD *)&v11 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: respondToPhotoStreamInvitationWithAlbumCloudGUID:acceptInvitation:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v11 + 1), (os_activity_scope_state_t)((char *)&v13 + 8));
  }
  +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager", (_QWORD)v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendResponse:toPhotoStreamInvitationForAlbumWithCloudGUID:", v4, v5);

  if (v12)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v13 + 8));
  if ((_QWORD)v13)
  {
    PLRequestGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v16 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v9, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)reportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID:(id)a3
{
  id v3;
  int v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  const char *Name;
  __int128 v9;
  char v10;
  __int128 v11;
  SEL sel[2];
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  *(_OWORD *)sel = 0u;
  v9 = 0u;
  v4 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v9) = v4;
  if (v4)
  {
    *((_QWORD *)&v9 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: reportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v9 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager", (_QWORD)v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID:", v3);

  if (v10)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  if ((_QWORD)v11)
  {
    PLRequestGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v7, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)noteGoingToExpireCMMsAlertWithCMMUUIDs:(id)a3 thumbnailImageData:(id)a4 notificationTitle:(id)a5 notificationSubtitle:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  const char *Name;
  __int128 v18;
  char v19;
  __int128 v20;
  SEL sel[2];
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v20 = 0u;
  *(_OWORD *)sel = 0u;
  v18 = 0u;
  v13 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v18) = v13;
  if (v13)
  {
    *((_QWORD *)&v18 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: noteGoingToExpireCMMsAlertWithCMMUUIDs:thumbnailImageData:notificationTitle:notificationSubtitle:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v18 + 1), (os_activity_scope_state_t)((char *)&v20 + 8));
  }
  +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager", (_QWORD)v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationForExpiringCMMsWithUUIDs:thumbnailImageData:notificationTitle:notificationSubtitle:", v9, v10, v11, v12);

  if (v19)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v20 + 8));
  if ((_QWORD)v20)
  {
    PLRequestGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if ((unint64_t)(v20 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v23 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v16, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)noteReadyToViewMomentShareWithUUID:(id)a3
{
  id v4;
  int v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  const char *Name;
  __int128 v11;
  char v12;
  __int128 v13;
  SEL sel[2];
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  *(_OWORD *)sel = 0u;
  v11 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v11) = v5;
  if (v5)
  {
    *((_QWORD *)&v11 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: noteReadyToViewMomentShareWithUUID:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v11 + 1), (os_activity_scope_state_t)((char *)&v13 + 8));
  }
  v6 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdNotificationService noteReadyToViewMomentShareWithUUID:]", (_QWORD)v11);
  +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationForReadyToViewMomentShareWithUUID:photoLibrary:", v4, v6);

  if (v12)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v13 + 8));
  if ((_QWORD)v13)
  {
    PLRequestGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v16 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v9, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)notePhotosChallengeSubmissionWithNotificationDeliveryDate:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationForPhotosChallengeSubmissionWithNotificationDeliveryDate:", v3);

}

- (void)notePhotosChallengeNewQuestionsWithNotificationDeliveryDate:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationForPhotosChallengeNewQuestionsWithNotificationDeliveryDate:", v3);

}

- (void)notifyStartOfInterestForUnrenderedCinematicVideoItems
{
  int v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  const char *Name;
  __int128 v7;
  char v8;
  __int128 v9;
  SEL sel[2];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  *(_OWORD *)sel = 0u;
  v7 = 0u;
  v2 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v7) = v2;
  if (v2)
  {
    *((_QWORD *)&v7 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: notifyStartOfInterestForUnrenderedCinematicVideoItems", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v7 + 1), (os_activity_scope_state_t)((char *)&v9 + 8));
  }
  +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager", (_QWORD)v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationForInterestInUnrenderedCinematicVideoItems");

  if (v8)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v9 + 8));
  if ((_QWORD)v9)
  {
    PLRequestGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v12 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v5, OS_SIGNPOST_INTERVAL_END, v9, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)notifyEndOfInterestForUnrenderedCinematicVideoItems
{
  int v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  const char *Name;
  __int128 v7;
  char v8;
  __int128 v9;
  SEL sel[2];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  *(_OWORD *)sel = 0u;
  v7 = 0u;
  v2 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v7) = v2;
  if (v2)
  {
    *((_QWORD *)&v7 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: notifyEndOfInterestForUnrenderedCinematicVideoItems", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v7 + 1), (os_activity_scope_state_t)((char *)&v9 + 8));
  }
  +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager", (_QWORD)v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeNotificationForInterestInUnrenderedCinematicVideoItems");

  if (v8)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v9 + 8));
  if ((_QWORD)v9)
  {
    PLRequestGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v12 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v5, OS_SIGNPOST_INTERVAL_END, v9, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)noteSharedLibrarySuggestionsWithNotificationDeliveryDate:(id)a3
{
  id v3;
  int v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  const char *Name;
  __int128 v9;
  char v10;
  __int128 v11;
  SEL sel[2];
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  *(_OWORD *)sel = 0u;
  v9 = 0u;
  v4 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v9) = v4;
  if (v4)
  {
    *((_QWORD *)&v9 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: noteSharedLibrarySuggestionsWithNotificationDeliveryDate:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v9 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager", (_QWORD)v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationForSharedLibrarySuggestionsWithNotificationDeliveryDate:", v3);

  if (v10)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  if ((_QWORD)v11)
  {
    PLRequestGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v7, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

@end
