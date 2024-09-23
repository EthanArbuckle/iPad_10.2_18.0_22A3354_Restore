@implementation PLNotificationUNCenter

- (PLNotificationUNCenter)init
{
  PLNotificationUNCenter *v2;
  uint64_t v3;
  UNUserNotificationCenter *unc;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLNotificationUNCenter;
  v2 = -[PLNotificationUNCenter init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "_UNNotificationInitialize");
    v3 = objc_claimAutoreleasedReturnValue();
    unc = v2->_unc;
    v2->_unc = (UNUserNotificationCenter *)v3;

    -[UNUserNotificationCenter setDelegate:](v2->_unc, "setDelegate:", v2);
  }
  return v2;
}

- (void)sendNotificationForNotification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationUNCenter.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notification"));

    v5 = 0;
  }
  -[PLNotificationUNCenter _makeTempThumbnailFileForNotification:](self, "_makeTempThumbnailFileForNotification:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLNotificationUNCenter sendNotificationForNotification:withAttachmentURL:forceToSound:](self, "sendNotificationForNotification:withAttachmentURL:forceToSound:", v8, v6, 1);

}

- (void)sendNotificationForNotification:(id)a3 withAttachmentURL:(id)a4 forceToSound:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  void *v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  UNUserNotificationCenter *unc;
  id v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30[2];
  _BYTE location[12];
  __int16 v32;
  void *v33;
  uint64_t v34;

  v5 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationUNCenter.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notification"));

  }
  objc_msgSend((id)objc_opt_class(), "_notificationEnablementKeyForNotificationType:", objc_msgSend(v9, "notificationType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (PLIsNotificationTypeEnabledForKey() & 1) == 0)
  {
    PLPhotoSharingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = v9;
      v32 = 2114;
      v33 = v11;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, "Ignoring disabled notification %@, enablement key: %{public}@", location, 0x16u);
    }
  }
  else
  {
    v12 = 0.001;
    switch(objc_msgSend(v9, "notificationType"))
    {
      case 0:
      case 1:
        v12 = 2.0;
        break;
      case 2:
      case 3:
      case 4:
      case 5:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
        v12 = 10.0;
        break;
      case 6:
        objc_msgSend(v9, "notificationDeliveryDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
        {
          objc_msgSend(v20, "timeIntervalSinceNow");
          v12 = v22;
        }
        else
        {
          v12 = 0.001;
        }
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKey:", CFSTR("PhotosMemoriesNotificationDelayOverride"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v24, "doubleValue");
          v12 = v25;
        }

        break;
      default:
        break;
    }
    if (v12 < 0.001)
      v12 = 0.001;
    objc_msgSend(MEMORY[0x1E0CEC790], "triggerWithTimeInterval:repeats:", 0, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    -[PLNotificationUNCenter _notificationContentWithNotification:withImageURL:sound:](self, "_notificationContentWithNotification:withImageURL:sound:", v9, v10, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requestIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:", v15, v14, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)location, self);
    unc = self->_unc;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __89__PLNotificationUNCenter_sendNotificationForNotification_withAttachmentURL_forceToSound___block_invoke;
    v27[3] = &unk_1E3674D78;
    objc_copyWeak(v30, (id *)location);
    v30[1] = *(id *)&v12;
    v18 = v14;
    v28 = v18;
    v19 = v15;
    v29 = v19;
    -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](unc, "addNotificationRequest:withCompletionHandler:", v16, v27);

    objc_destroyWeak(v30);
    objc_destroyWeak((id *)location);

  }
}

- (void)removeAllNotifications
{
  -[UNUserNotificationCenter removeAllPendingNotificationRequests](self->_unc, "removeAllPendingNotificationRequests");
  -[UNUserNotificationCenter removeAllDeliveredNotifications](self->_unc, "removeAllDeliveredNotifications");
}

- (void)removeNotificationsForNotifications:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationUNCenter.m"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notifications"));

  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__PLNotificationUNCenter_removeNotificationsForNotifications___block_invoke;
  v9[3] = &unk_1E366F078;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);
  -[UNUserNotificationCenter removePendingNotificationRequestsWithIdentifiers:](self->_unc, "removePendingNotificationRequestsWithIdentifiers:", v6);
  -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:](self->_unc, "removeDeliveredNotificationsWithIdentifiers:", v6);
  -[PLNotificationUNCenter updateBadgeCountWithDelay:](self, "updateBadgeCountWithDelay:", 1);

}

- (void)updateBadgeCountWithDelay:(unint64_t)a3
{
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v4 = dispatch_time(0, 1000000000 * a3);
  dispatch_get_global_queue(17, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PLNotificationUNCenter_updateBadgeCountWithDelay___block_invoke;
  v6[3] = &unk_1E3677D48;
  objc_copyWeak(&v7, &location);
  dispatch_after(v4, v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)updateImageData:(id)a3 forNotificationWithIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[3];
  char v24;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationUNCenter.m"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageData"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationUNCenter.m"), 196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v10 = MEMORY[0x1E0C809B0];
  v24 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __72__PLNotificationUNCenter_updateImageData_forNotificationWithIdentifier___block_invoke;
  v19[3] = &unk_1E366F0C8;
  v19[4] = self;
  v20 = v7;
  v21 = v9;
  v22 = v23;
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __72__PLNotificationUNCenter_updateImageData_forNotificationWithIdentifier___block_invoke_43;
  v15[3] = &unk_1E366F110;
  v18 = v23;
  v15[4] = self;
  v11 = v20;
  v16 = v11;
  v12 = v21;
  v17 = v12;
  -[PLNotificationUNCenter _findNotificationForRequestIdentifier:withPendingHandler:deliveredHandler:completionHandler:](self, "_findNotificationForRequestIdentifier:withPendingHandler:deliveredHandler:completionHandler:", v12, v19, v15, 0);

  _Block_object_dispose(v23, 8);
}

- (void)_findNotificationForRequestIdentifier:(id)a3 withPendingHandler:(id)a4 deliveredHandler:(id)a5 completionHandler:(id)a6
{
  id v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  BOOL v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;

  v11 = a3;
  v12 = (unint64_t)a4;
  v13 = (unint64_t)a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationUNCenter.m"), 262, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v15 = (v12 | v13) == 0;
  if (!(v12 | v13))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationUNCenter.m"), 263, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pendingHandler || deliveredHandler"));

  }
  v16 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __118__PLNotificationUNCenter__findNotificationForRequestIdentifier_withPendingHandler_deliveredHandler_completionHandler___block_invoke;
  v35[3] = &unk_1E366F188;
  v35[4] = self;
  v17 = v11;
  v36 = v17;
  v18 = (id)v13;
  v37 = v18;
  v19 = v14;
  v38 = v19;
  v29[0] = v16;
  v29[1] = 3221225472;
  v29[2] = __118__PLNotificationUNCenter__findNotificationForRequestIdentifier_withPendingHandler_deliveredHandler_completionHandler___block_invoke_4;
  v29[3] = &unk_1E366F200;
  v29[4] = self;
  v30 = v17;
  v31 = (id)v12;
  v32 = v18;
  v20 = (id)MEMORY[0x19AEC174C](v35);
  v33 = v20;
  v34 = v19;
  v21 = v19;
  v22 = v18;
  v23 = v17;
  v24 = (id)v12;
  v25 = MEMORY[0x19AEC174C](v29);
  v26 = (void *)v25;
  if (!v15)
  {
    if (!v12)
      v25 = (uint64_t)v20;
    (*(void (**)(void))(v25 + 16))();
  }

}

- (void)removeNotificationWithRequestIdentifiers:(id)a3
{
  UNUserNotificationCenter *unc;
  id v5;

  unc = self->_unc;
  v5 = a3;
  -[UNUserNotificationCenter removePendingNotificationRequestsWithIdentifiers:](unc, "removePendingNotificationRequestsWithIdentifiers:", v5);
  -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:](self->_unc, "removeDeliveredNotificationsWithIdentifiers:", v5);

  -[PLNotificationUNCenter updateBadgeCountWithDelay:](self, "updateBadgeCountWithDelay:", 1);
}

- (void)mergeExistingAndSendNotificationForNotification:(id)a3 thumbnailHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "requestIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PLNotificationUNCenter mergeExistingAndSendNotificationForNotification:requestIdentifier:thumbnailHandler:](self, "mergeExistingAndSendNotificationForNotification:requestIdentifier:thumbnailHandler:", v7, v8, v6);

}

- (void)mergeExistingAndSendNotificationForNotification:(id)a3 requestIdentifier:(id)a4 thumbnailHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[4];
  id v21;
  PLNotificationUNCenter *v22;
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD v31[3];
  char v32;
  _QWORD v33[3];
  char v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v11 = MEMORY[0x1E0C809B0];
  v32 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __109__PLNotificationUNCenter_mergeExistingAndSendNotificationForNotification_requestIdentifier_thumbnailHandler___block_invoke;
  v26[3] = &unk_1E366F228;
  v26[4] = self;
  v27 = v9;
  v28 = v8;
  v29 = v31;
  v30 = v33;
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __109__PLNotificationUNCenter_mergeExistingAndSendNotificationForNotification_requestIdentifier_thumbnailHandler___block_invoke_2;
  v20[3] = &unk_1E366F250;
  v24 = v33;
  v21 = v28;
  v22 = self;
  v12 = v27;
  v23 = v12;
  v25 = v31;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __109__PLNotificationUNCenter_mergeExistingAndSendNotificationForNotification_requestIdentifier_thumbnailHandler___block_invoke_51;
  v15[3] = &unk_1E366F278;
  v18 = v33;
  v15[4] = self;
  v13 = v21;
  v16 = v13;
  v19 = v31;
  v14 = v10;
  v17 = v14;
  -[PLNotificationUNCenter _findNotificationForRequestIdentifier:withPendingHandler:deliveredHandler:completionHandler:](self, "_findNotificationForRequestIdentifier:withPendingHandler:deliveredHandler:completionHandler:", v12, v26, v20, v15);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);

}

- (void)findExistingNotificationByIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[3];
  char v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationUNCenter.m"), 414, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationUNCenter.m"), 415, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v16[4] = v18;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __85__PLNotificationUNCenter_findExistingNotificationByIdentifier_withCompletionHandler___block_invoke;
  v17[3] = &unk_1E366F2A0;
  v17[4] = v18;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__PLNotificationUNCenter_findExistingNotificationByIdentifier_withCompletionHandler___block_invoke_2;
  v16[3] = &unk_1E366F2C8;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__PLNotificationUNCenter_findExistingNotificationByIdentifier_withCompletionHandler___block_invoke_3;
  v13[3] = &unk_1E36714A8;
  v10 = v9;
  v14 = v10;
  v15 = v18;
  -[PLNotificationUNCenter _findNotificationForRequestIdentifier:withPendingHandler:deliveredHandler:completionHandler:](self, "_findNotificationForRequestIdentifier:withPendingHandler:deliveredHandler:completionHandler:", v7, v17, v16, v13);

  _Block_object_dispose(v18, 8);
}

- (void)enumerateExistingNotificationsUsingBlock:(id)a3
{
  id v5;
  UNUserNotificationCenter *unc;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  _QWORD v12[3];
  char v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationUNCenter.m"), 428, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v13 = 0;
  unc = self->_unc;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__PLNotificationUNCenter_enumerateExistingNotificationsUsingBlock___block_invoke;
  v9[3] = &unk_1E366F368;
  v7 = v5;
  v10 = v7;
  v11 = v12;
  v9[4] = self;
  -[UNUserNotificationCenter getPendingNotificationRequestsWithCompletionHandler:](unc, "getPendingNotificationRequestsWithCompletionHandler:", v9);

  _Block_object_dispose(v12, 8);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  void (**v6)(void);

  v6 = (void (**)(void))a5;
  PLProcessNotificationResponse(a4);
  v6[2]();

}

- (id)_makeTempThumbnailFileForNotification:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "thumbnailImageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_msgSend(v4, "requestIdentifier"), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    -[PLNotificationUNCenter _makeTempThumbnailFileForImageData:identifier:](self, "_makeTempThumbnailFileForImageData:identifier:", v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_makeTempThumbnailFileForImageData:(id)a3 identifier:(id)a4
{
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v4 = 0;
  v18 = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v6 = a4;
    v7 = a3;
    NSTemporaryDirectory();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("notificationTempImage_%@.jpg"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "stringByAppendingPathComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    LODWORD(v8) = objc_msgSend(v7, "writeToFile:options:error:", v10, 1, &v15);

    v11 = v15;
    if ((_DWORD)v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PLPhotoSharingGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v13;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "ERROR: Writing temp file for notification thumbnail failed: %@", buf, 0xCu);

      }
      v4 = 0;
    }

  }
  return v4;
}

- (id)_notificationContentWithNotification:(id)a3 withImageURL:(id)a4 sound:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  _QWORD v32[2];

  v5 = a5;
  v32[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationUNCenter.m"), 887, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notification"));

  }
  v11 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
  objc_msgSend(v9, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v12);

  objc_msgSend(v9, "message");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBody:", v13);

  objc_msgSend((id)objc_opt_class(), "_categoryIdentifierForNotification:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCategoryIdentifier:", v14);

  objc_msgSend((id)objc_opt_class(), "_threadIdentifierForNotification:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setThreadIdentifier:", v15);

  objc_msgSend(v11, "setInterruptionLevel:", objc_msgSend((id)objc_opt_class(), "_interruptionLevelForNotification:", v9));
  v16 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v9, "destinationURLString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLWithString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDefaultActionURL:", v18);

  objc_msgSend((id)objc_opt_class(), "_contentUserInfoForNotification:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserInfo:", v19);

  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_soundForNotification:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSound:", v20);

  }
  if (v10)
  {
    v27 = 0;
    objc_msgSend(MEMORY[0x1E0CEC718], "attachmentWithIdentifier:URL:options:error:", CFSTR("my_image"), v10, 0, &v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v27;
    if (v21)
    {
      v32[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
      v23 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAttachments:", v23);
    }
    else
    {
      PLPhotoSharingGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v22, "localizedDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v29 = v10;
        v30 = 2112;
        v31 = v24;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "ERROR: create attachment for URL (%@) failed, error: %@", buf, 0x16u);

      }
    }

  }
  return v11;
}

- (id)_copiedContentFromContent:(id)a3 WithImageData:(id)a4 identifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLNotificationUNCenter.m"), 921, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("content"));

  }
  v12 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
  objc_msgSend(v9, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:", v13);

  objc_msgSend(v9, "body");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBody:", v14);

  objc_msgSend(v9, "categoryIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCategoryIdentifier:", v15);

  objc_msgSend(v9, "threadIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setThreadIdentifier:", v16);

  objc_msgSend(v9, "defaultActionURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDefaultActionURL:", v17);

  objc_msgSend(v9, "sound");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSound:", v18);

  -[PLNotificationUNCenter _makeTempThumbnailFileForImageData:identifier:](self, "_makeTempThumbnailFileForImageData:identifier:", v10, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v31 = 0;
    objc_msgSend(MEMORY[0x1E0CEC718], "attachmentWithIdentifier:URL:options:error:", CFSTR("my_image"), v19, 0, &v31);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v31;
    if (v20)
    {
      v36[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAttachments:", v22);

      v23 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v9, "userInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "dictionaryWithDictionary:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D74BA8]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D74C38]);

      objc_msgSend(v12, "setUserInfo:", v25);
    }
    else
    {
      PLPhotoSharingGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v21, "localizedDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v33 = v19;
        v34 = 2112;
        v35 = v28;
        _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "ERROR: create attachment for URL (%@) failed, error: %@", buf, 0x16u);

      }
      v25 = v12;
      v12 = 0;
    }

  }
  else
  {

    v12 = 0;
  }

  return v12;
}

- (void)_updateAppBadge
{
  void *v3;
  uint64_t v4;

  -[PLNotificationUNCenter delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentAppBadgeCountForNotificationUNCenter:", self);

  -[UNUserNotificationCenter setBadgeCount:withCompletionHandler:](self->_unc, "setBadgeCount:withCompletionHandler:", v4, 0);
}

- (PLNotificationUNCenterDelegate)delegate
{
  return (PLNotificationUNCenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_unc, 0);
}

void __67__PLNotificationUNCenter_enumerateExistingNotificationsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  v4 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__PLNotificationUNCenter_enumerateExistingNotificationsUsingBlock___block_invoke_2;
  v14[3] = &unk_1E366F2F0;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v15 = v5;
  v16 = v6;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v14);
  v7 = *(void **)(a1 + 40);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __67__PLNotificationUNCenter_enumerateExistingNotificationsUsingBlock___block_invoke_3;
  v11[3] = &unk_1E366F340;
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 48);
  v12 = v9;
  v13 = v10;
  objc_msgSend(v8, "getDeliveredNotificationsWithCompletionHandler:", v11);

}

void __67__PLNotificationUNCenter_enumerateExistingNotificationsUsingBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D74BA8]);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v9)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v8 = v9;
    *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

void __67__PLNotificationUNCenter_enumerateExistingNotificationsUsingBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__PLNotificationUNCenter_enumerateExistingNotificationsUsingBlock___block_invoke_4;
  v6[3] = &unk_1E366F318;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v6);

}

void __67__PLNotificationUNCenter_enumerateExistingNotificationsUsingBlock___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a2, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D74BA8]);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v10)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v9 = v10;
    *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

uint64_t __85__PLNotificationUNCenter_findExistingNotificationByIdentifier_withCompletionHandler___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __85__PLNotificationUNCenter_findExistingNotificationByIdentifier_withCompletionHandler___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __85__PLNotificationUNCenter_findExistingNotificationByIdentifier_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __109__PLNotificationUNCenter_mergeExistingAndSendNotificationForNotification_requestIdentifier_thumbnailHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(_QWORD *)(a1 + 40);
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removePendingNotificationRequestsWithIdentifiers:", v6, v13, v14);

  objc_msgSend(v5, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D74BA8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 48), "notificationByMergingWithNotificationDictionary:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "sendNotificationForNotification:", v10);
      objc_msgSend(v10, "thumbnailImageData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "sendNotificationForNotification:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 48), "thumbnailImageData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;

}

void __109__PLNotificationUNCenter_mergeExistingAndSendNotificationForNotification_requestIdentifier_thumbnailHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(a2, "request");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "content");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D74BA8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "notificationByMergingWithNotificationDictionary:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 40), "_makeTempThumbnailFileForNotification:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "_notificationContentWithNotification:withImageURL:sound:", v7, v8, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(a1 + 48);
        v11 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __109__PLNotificationUNCenter_mergeExistingAndSendNotificationForNotification_requestIdentifier_thumbnailHandler___block_invoke_3;
        v12[3] = &unk_1E3674D50;
        v13 = v7;
        objc_msgSend(v11, "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:", v10, v9, v12);
        if (!v8)
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

      }
    }

  }
}

uint64_t __109__PLNotificationUNCenter_mergeExistingAndSendNotificationForNotification_requestIdentifier_thumbnailHandler___block_invoke_51(uint64_t a1)
{
  void *v2;
  uint64_t result;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "sendNotificationForNotification:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "thumbnailImageData");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __109__PLNotificationUNCenter_mergeExistingAndSendNotificationForNotification_requestIdentifier_thumbnailHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLPhotoSharingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "PLNotification replaced notification content: %@ (error: %@)", (uint8_t *)&v6, 0x16u);
  }

}

void __118__PLNotificationUNCenter__findNotificationForRequestIdentifier_withPendingHandler_deliveredHandler_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __118__PLNotificationUNCenter__findNotificationForRequestIdentifier_withPendingHandler_deliveredHandler_completionHandler___block_invoke_2;
  v4[3] = &unk_1E366F160;
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v3, "getDeliveredNotificationsWithCompletionHandler:", v4);

}

void __118__PLNotificationUNCenter__findNotificationForRequestIdentifier_withPendingHandler_deliveredHandler_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __118__PLNotificationUNCenter__findNotificationForRequestIdentifier_withPendingHandler_deliveredHandler_completionHandler___block_invoke_5;
  v3[3] = &unk_1E366F1D8;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  objc_msgSend(v2, "getPendingNotificationRequestsWithCompletionHandler:", v3);

}

void __118__PLNotificationUNCenter__findNotificationForRequestIdentifier_withPendingHandler_deliveredHandler_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v4 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __118__PLNotificationUNCenter__findNotificationForRequestIdentifier_withPendingHandler_deliveredHandler_completionHandler___block_invoke_6;
    v5[3] = &unk_1E366F1B0;
    v6 = *(id *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

  }
  if (*(_QWORD *)(a1 + 48))
  {
    v3 = *(_QWORD *)(a1 + 56);
LABEL_6:
    (*(void (**)(void))(v3 + 16))();
    goto LABEL_7;
  }
  v3 = *(_QWORD *)(a1 + 64);
  if (v3)
    goto LABEL_6;
LABEL_7:

}

void __118__PLNotificationUNCenter__findNotificationForRequestIdentifier_withPendingHandler_deliveredHandler_completionHandler___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    *a4 = 1;
  }

}

void __118__PLNotificationUNCenter__findNotificationForRequestIdentifier_withPendingHandler_deliveredHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __118__PLNotificationUNCenter__findNotificationForRequestIdentifier_withPendingHandler_deliveredHandler_completionHandler___block_invoke_3;
  v9[3] = &unk_1E366F138;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v9);
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v4, v5, v6, v7);

}

void __118__PLNotificationUNCenter__findNotificationForRequestIdentifier_withPendingHandler_deliveredHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    *a4 = 1;
  }

}

void __72__PLNotificationUNCenter_updateImageData_forNotificationWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "count"))
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v3, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_copiedContentFromContent:WithImageData:identifier:", v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      v21[0] = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removePendingNotificationRequestsWithIdentifiers:", v10);

      objc_msgSend(v3, "trigger");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:", *(_QWORD *)(a1 + 48), v8, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, *(id *)(a1 + 32));
      v13 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __72__PLNotificationUNCenter_updateImageData_forNotificationWithIdentifier___block_invoke_2;
      v15[3] = &unk_1E366F0A0;
      objc_copyWeak(&v19, &location);
      v16 = v8;
      v17 = *(id *)(a1 + 48);
      v14 = v12;
      v18 = v14;
      objc_msgSend(v13, "addNotificationRequest:withCompletionHandler:", v14, v15);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);

    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

}

void __72__PLNotificationUNCenter_updateImageData_forNotificationWithIdentifier___block_invoke_43(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    v3 = (void *)a1[4];
    objc_msgSend(a2, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_copiedContentFromContent:WithImageData:identifier:", v5, a1[5], a1[6]);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v7;
    if (v7)
    {
      objc_msgSend(*(id *)(a1[4] + 8), "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:", a1[6], v7, &__block_literal_global_64442);
      v6 = v7;
    }

  }
}

void __72__PLNotificationUNCenter_updateImageData_forNotificationWithIdentifier___block_invoke_2_44(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLPhotoSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "PLNotification updated thumbnail image (error: %@)", (uint8_t *)&v4, 0xCu);
  }

}

void __72__PLNotificationUNCenter_updateImageData_forNotificationWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PLPhotoSharingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "localizedDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "ERROR: PLNotification failed to post a notifcation (error: %@)", (uint8_t *)&v12, 0xCu);

    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "updateBadgeCountWithDelay:", 0);

    PLPhotoSharingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "body");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "defaultActionURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      v12 = 138413314;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "PLNotification replaced a notification (title: %@, body: %@, defaultActionURL: %@, requestIdentifier: %@, request: %@)", (uint8_t *)&v12, 0x34u);

    }
  }

}

void __52__PLNotificationUNCenter_updateBadgeCountWithDelay___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  +[PLPhotoLibrary cloudSharingPhotoLibrary](PLPhotoLibrary, "cloudSharingPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__PLNotificationUNCenter_updateBadgeCountWithDelay___block_invoke_2;
  v3[3] = &unk_1E3677D48;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  objc_msgSend(v2, "performBlock:", v3);
  objc_destroyWeak(&v4);

}

void __52__PLNotificationUNCenter_updateBadgeCountWithDelay___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateAppBadge");

}

void __62__PLNotificationUNCenter_removeNotificationsForNotifications___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "requestIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __89__PLNotificationUNCenter_sendNotificationForNotification_withAttachmentURL_forceToSound___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PLPhotoSharingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "localizedDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "ERROR: PLNotification failed to post a notifcation (error: %@)", (uint8_t *)&v12, 0xCu);

    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "updateBadgeCountWithDelay:", (unint64_t)*(double *)(a1 + 56));

    PLPhotoSharingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "body");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "defaultActionURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 56);
      v11 = *(_QWORD *)(a1 + 40);
      v12 = 138413314;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2048;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "PLNotification Posted: Title: %@, Body: %@, defaultActionURL: %@, delay:%.3fs, requestIdentifier: %@", (uint8_t *)&v12, 0x34u);

    }
  }

}

+ (id)_UNNotificationInitialize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", CFSTR("com.apple.mobileslideshow"));
  v14 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend((id)objc_opt_class(), "_updatesCategory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_updatesLikedCategory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_updatesCommentedCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_invitationsCategoryWithJunkAction:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_invitationsCategoryWithJunkAction:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_invitationAcceptedCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_expiringCMMCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_readyToViewInvitationCMMCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_sharedLibrarySuggestionsCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_sharedLibraryParticipantAssetTrashNotificationCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithObjects:", v13, v2, v3, v4, v5, v6, v7, v8, v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setNotificationCategories:", v11);
  return v15;
}

+ (id)_updatesCategory
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CEC700];
  v3 = *MEMORY[0x1E0D74AB0];
  PLServicesLocalizedFrameworkStringForAssetsd();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC710], "iconWithSystemImageName:", CFSTR("hand.thumbsup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionWithIdentifier:title:options:icon:", v3, v4, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CEC780];
  v8 = *MEMORY[0x1E0D74A50];
  PLServicesLocalizedFrameworkStringForAssetsd();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC710], "iconWithSystemImageName:", CFSTR("bubble.left"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PLServicesLocalizedFrameworkStringForAssetsd();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithIdentifier:title:options:icon:textInputButtonTitle:textInputPlaceholder:", v8, v9, 0, v10, v11, &stru_1E36789C0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v6;
  v16[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC720], "categoryWithIdentifier:actions:intentIdentifiers:options:", *MEMORY[0x1E0D74B08], v13, MEMORY[0x1E0C9AA60], 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_updatesLikedCategory
{
  return (id)objc_msgSend(MEMORY[0x1E0CEC720], "categoryWithIdentifier:actions:intentIdentifiers:options:", *MEMORY[0x1E0D74B20], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0);
}

+ (id)_updatesCommentedCategory
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CEC780];
  v3 = *MEMORY[0x1E0D74A50];
  PLServicesLocalizedFrameworkStringForAssetsd();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC710], "iconWithSystemImageName:", CFSTR("bubble.left"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLServicesLocalizedFrameworkStringForAssetsd();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionWithIdentifier:title:options:icon:textInputButtonTitle:textInputPlaceholder:", v3, v4, 0, v5, v6, &stru_1E36789C0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CEC720];
  v9 = *MEMORY[0x1E0D74B10];
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "categoryWithIdentifier:actions:intentIdentifiers:options:", v9, v10, MEMORY[0x1E0C9AA60], 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_invitationsCategoryWithJunkAction:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)*MEMORY[0x1E0D74AD0];
  if (v3)
  {
    v6 = (void *)MEMORY[0x1E0CEC700];
    v7 = *MEMORY[0x1E0D74AA8];
    PLServicesLocalizedFrameworkStringForAssetsd();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEC710], "iconWithSystemImageName:", CFSTR("xmark.bin"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionWithIdentifier:title:options:icon:", v7, v8, 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObject:", v10);
    v11 = (id)*MEMORY[0x1E0D74AD8];

    v5 = v11;
  }
  v12 = (void *)MEMORY[0x1E0CEC700];
  v13 = *MEMORY[0x1E0D74A48];
  PLServicesLocalizedFrameworkStringForAssetsd();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC710], "iconWithSystemImageName:", CFSTR("checkmark.circle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithIdentifier:title:options:icon:", v13, v14, 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObject:", v16);
  v17 = (void *)MEMORY[0x1E0CEC700];
  v18 = *MEMORY[0x1E0D74AA0];
  PLServicesLocalizedFrameworkStringForAssetsd();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC710], "iconWithSystemImageName:", CFSTR("xmark.circle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "actionWithIdentifier:title:options:icon:", v18, v19, 0, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObject:", v21);
  objc_msgSend(MEMORY[0x1E0CEC720], "categoryWithIdentifier:actions:intentIdentifiers:options:", v5, v4, MEMORY[0x1E0C9AA60], 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)_invitationAcceptedCategory
{
  return (id)objc_msgSend(MEMORY[0x1E0CEC720], "categoryWithIdentifier:actions:intentIdentifiers:options:", *MEMORY[0x1E0D74AC8], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0);
}

+ (id)_expiringCMMCategory
{
  return (id)objc_msgSend(MEMORY[0x1E0CEC720], "categoryWithIdentifier:actions:intentIdentifiers:options:", *MEMORY[0x1E0D74AC0], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0);
}

+ (id)_readyToViewInvitationCMMCategory
{
  return (id)objc_msgSend(MEMORY[0x1E0CEC720], "categoryWithIdentifier:actions:intentIdentifiers:options:", *MEMORY[0x1E0D74AE0], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0);
}

+ (id)_sharedLibrarySuggestionsCategory
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CEC700];
  v3 = *MEMORY[0x1E0D74FD8];
  PLServicesSharedLibraryLocalizedFrameworkString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionWithIdentifier:title:options:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CEC700];
  v7 = *MEMORY[0x1E0D74AB8];
  PLServicesSharedLibraryLocalizedFrameworkString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithIdentifier:title:options:", v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CEC720];
  v11 = *MEMORY[0x1E0D74B00];
  v15[0] = v5;
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "categoryWithIdentifier:actions:intentIdentifiers:options:", v11, v12, MEMORY[0x1E0C9AA60], 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_sharedLibraryParticipantAssetTrashNotificationCategory
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CEC700];
  v3 = *MEMORY[0x1E0D74FD8];
  PLServicesSharedLibraryLocalizedFrameworkString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionWithIdentifier:title:options:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CEC720];
  v7 = *MEMORY[0x1E0D74AF8];
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "categoryWithIdentifier:actions:intentIdentifiers:options:", v7, v8, MEMORY[0x1E0C9AA60], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_soundForNotification:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;

  v3 = (void *)MEMORY[0x1E0CEC6E8];
  v4 = a3;
  objc_msgSend(v3, "soundWithAlertType:", 9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "notificationType");

  v7 = (_QWORD *)MEMORY[0x1E0DBF770];
  if (v6 != 6)
    v7 = (_QWORD *)MEMORY[0x1E0DBF778];
  objc_msgSend(v5, "setAlertTopic:", *v7);
  return v5;
}

+ (id)_notificationEnablementKeyForNotificationType:(int64_t)a3
{
  id v3;

  if ((unint64_t)a3 <= 0xE && ((0x567Fu >> a3) & 1) != 0)
    v3 = **((id **)&unk_1E366F388 + a3);
  else
    v3 = 0;
  return v3;
}

+ (id)_categoryIdentifierForNotification:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id *v6;
  int v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "notificationType");
  v5 = 0;
  v6 = (id *)MEMORY[0x1E0D74AC8];
  switch(v4)
  {
    case 0:
      v7 = objc_msgSend(v3, "offerToReportAsJunk");
      v6 = (id *)MEMORY[0x1E0D74AD0];
      if (v7)
        v6 = (id *)MEMORY[0x1E0D74AD8];
      goto LABEL_15;
    case 1:
      goto LABEL_15;
    case 3:
      v6 = (id *)MEMORY[0x1E0D74B08];
      goto LABEL_15;
    case 4:
      v6 = (id *)MEMORY[0x1E0D74B10];
      goto LABEL_15;
    case 5:
      v6 = (id *)MEMORY[0x1E0D74B20];
      goto LABEL_15;
    case 6:
      v6 = (id *)MEMORY[0x1E0D74B18];
      goto LABEL_15;
    case 9:
      v6 = (id *)MEMORY[0x1E0D74AC0];
      goto LABEL_15;
    case 10:
      v6 = (id *)MEMORY[0x1E0D74AE0];
      goto LABEL_15;
    case 12:
      v6 = (id *)MEMORY[0x1E0D74B00];
      goto LABEL_15;
    case 13:
      v6 = (id *)MEMORY[0x1E0D74AE8];
      goto LABEL_15;
    case 14:
      v6 = (id *)MEMORY[0x1E0D74AF8];
      goto LABEL_15;
    case 16:
      v6 = (id *)MEMORY[0x1E0D74AF0];
LABEL_15:
      v5 = *v6;
      break;
    default:
      break;
  }

  return v5;
}

+ (id)_threadIdentifierForNotification:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "notificationType");
  if (v3 > 5)
    return 0;
  else
    return off_1E366F400[v3];
}

+ (unint64_t)_interruptionLevelForNotification:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "notificationType");
  if (v3 > 0x10)
    return 0;
  else
    return qword_199B9F690[v3];
}

+ (id)_contentUserInfoForNotification:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLNotificationUNCenter.m"), 962, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notification"));

  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v5, "notificationType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, *MEMORY[0x1E0D74BF0]);

  objc_msgSend(v5, "mainAssetUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "mainAssetUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v9, *MEMORY[0x1E0D74B58]);

  }
  objc_msgSend(v5, "albumCloudGUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v5, "albumCloudGUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v11, *MEMORY[0x1E0D74B28]);

  }
  objc_msgSend(v5, "interestingMemoryUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v5, "interestingMemoryUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v13, *MEMORY[0x1E0D74BC8]);

  }
  objc_msgSend(v5, "photoLibraryURLString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v5, "photoLibraryURLString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v15, *MEMORY[0x1E0D74C10]);

  }
  objc_msgSend(v5, "suppressionContexts");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v5, "suppressionContexts");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v17, *MEMORY[0x1E0D74C28]);

  }
  objc_msgSend(v5, "dictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v6, "setObject:forKey:", v18, *MEMORY[0x1E0D74BA8]);

  return v6;
}

@end
