@implementation ICMentionNotificationController

+ (id)sharedController
{
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, &__block_literal_global_71);
  return (id)sharedController_sharedController;
}

void __51__ICMentionNotificationController_sharedController__block_invoke()
{
  ICMentionNotificationController *v0;
  void *v1;

  v0 = objc_alloc_init(ICMentionNotificationController);
  v1 = (void *)sharedController_sharedController;
  sharedController_sharedController = (uint64_t)v0;

}

- (OS_dispatch_queue)notificationSerialQueue
{
  if (notificationSerialQueue_onceToken != -1)
    dispatch_once(&notificationSerialQueue_onceToken, &__block_literal_global_10);
  return (OS_dispatch_queue *)(id)notificationSerialQueue_queue;
}

void __58__ICMentionNotificationController_notificationSerialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.notes.mentionNotificationQueue", v2);
  v1 = (void *)notificationSerialQueue_queue;
  notificationSerialQueue_queue = (uint64_t)v0;

}

- (void)listenForReachabilityChange
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D64498];
  objc_msgSend(MEMORY[0x1E0D64250], "sharedReachabilityForInternetConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_reachabilityChanged_, v4, v5);

  -[ICMentionNotificationController sendPendingNotifications](self, "sendPendingNotifications");
}

- (void)reachabilityChanged:(id)a3
{
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD block[5];

  dispatch_get_global_queue(9, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__ICMentionNotificationController_reachabilityChanged___block_invoke;
  block[3] = &unk_1E5C1D540;
  block[4] = self;
  dispatch_after(v5, v4, block);

}

uint64_t __55__ICMentionNotificationController_reachabilityChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendPendingNotifications");
}

- (void)sendPendingNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ICMentionNotificationController sendPendingNotificationsCreatedBefore:](self, "sendPendingNotificationsCreatedBefore:", v3);

}

- (void)sendPendingNotificationsCreatedBefore:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ICMentionNotificationController *v9;

  v4 = a3;
  -[ICMentionNotificationController notificationSerialQueue](self, "notificationSerialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__ICMentionNotificationController_sendPendingNotificationsCreatedBefore___block_invoke;
  v7[3] = &unk_1E5C1D9A8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __73__ICMentionNotificationController_sendPendingNotificationsCreatedBefore___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  objc_msgSend(MEMORY[0x1E0D64250], "sharedReachabilityForInternetConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentReachabilityStatus");

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "workerManagedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __73__ICMentionNotificationController_sendPendingNotificationsCreatedBefore___block_invoke_2;
    v10[3] = &unk_1E5C1D7C0;
    v11 = v5;
    v6 = *(id *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v12 = v6;
    v13 = v7;
    v9 = v5;
    objc_msgSend(v9, "performBlockAndWait:", v10);

  }
  else
  {
    v8 = os_log_create("com.apple.notes", "Mentions");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __73__ICMentionNotificationController_sendPendingNotificationsCreatedBefore___block_invoke_cold_1();

  }
}

void __73__ICMentionNotificationController_sendPendingNotificationsCreatedBefore___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[ICMentionNotificationController pendingMentionsInContext:createdBeforeDate:](ICMentionNotificationController, "pendingMentionsInContext:createdBeforeDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = os_log_create("com.apple.notes", "Mentions");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __73__ICMentionNotificationController_sendPendingNotificationsCreatedBefore___block_invoke_2_cold_1((uint64_t *)(a1 + 40), (uint64_t)v2, v3);

  +[ICMentionNotificationController coalesceMentions:](ICMentionNotificationController, "coalesceMentions:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        v10 = os_log_create("com.apple.notes", "Mentions");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v9;
          _os_log_debug_impl(&dword_1AC7A1000, v10, OS_LOG_TYPE_DEBUG, "Attempting to send notification for coalesced mentions: %@", buf, 0xCu);
        }

        objc_msgSend((id)objc_opt_class(), "triggerNotificationForMentionAttachments:context:", v9, *(_QWORD *)(a1 + 32));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v6);
  }

}

+ (void)triggerNotificationForMentionAttachments:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t m;
  void *v63;
  NSObject *v64;
  int v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  id obj;
  id obja;
  void *v86;
  void *v87;
  void *v88;
  _QWORD v89[4];
  id v90;
  id v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint8_t buf[4];
  int v110;
  __int16 v111;
  uint64_t v112;
  __int16 v113;
  void *v114;
  __int16 v115;
  void *v116;
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tokenContentIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "note");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "folder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v88 = (void *)v8;
  objc_msgSend(v9, "participantForUserID:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serverShareCheckingParent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "recordID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "recordName");
  v16 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "owner");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ic_userRecordNameInNote:", v9);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "recordID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "recordName");
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "recordID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "recordName");
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  v86 = (void *)v16;
  v81 = v14;
  if (!v16 || !v87 || !v88)
  {
    v26 = os_log_create("com.apple.notes", "Mentions");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      +[ICMentionNotificationController triggerNotificationForMentionAttachments:context:].cold.2();

    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    v21 = v5;
    v27 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v105, v120, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v106;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v106 != v29)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * i), "setMentionNotificationState:", 3);
        }
        v28 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v105, v120, 16);
      }
      while (v28);
    }
    goto LABEL_24;
  }
  if (objc_msgSend(v13, "isCurrentUser"))
  {
    v20 = os_log_create("com.apple.notes", "Mentions");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      +[ICMentionNotificationController triggerNotificationForMentionAttachments:context:].cold.1();

    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v21 = v5;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v101, v119, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v102;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v102 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * j), "setMentionNotificationState:", 3);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v101, v119, 16);
      }
      while (v23);
    }
LABEL_24:

    objc_msgSend(v6, "ic_save");
    goto LABEL_48;
  }
  v75 = v13;
  v76 = v12;
  v77 = v9;
  v78 = v7;
  v79 = v6;
  v80 = v5;
  v99 = 0u;
  v100 = 0u;
  v98 = 0u;
  v97 = 0u;
  obj = v5;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v118, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v98;
    do
    {
      for (k = 0; k != v32; ++k)
      {
        if (*(_QWORD *)v98 != v33)
          objc_enumerationMutation(obj);
        v35 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * k);
        objc_msgSend(v35, "tokenContentIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v88, "isEqualToString:", v36);

        if ((v37 & 1) == 0)
        {
          v38 = (void *)MEMORY[0x1E0D641A0];
          objc_msgSend(v35, "tokenContentIdentifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[recipientUserId isEqualToString:mention.tokenContentIdentifier]", "+[ICMentionNotificationController triggerNotificationForMentionAttachments:context:]", 1, 0, CFSTR("Mismatch triggering coalesced mention notification to %@, expecting %@"), v39, v88);

        }
        objc_msgSend(v35, "serverShareCheckingParent");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "recordID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "recordName");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v86, "isEqualToString:", v42);

        if ((v43 & 1) == 0)
        {
          v44 = (void *)MEMORY[0x1E0D641A0];
          objc_msgSend(v35, "serverShareCheckingParent");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "recordID");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "recordName");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[shareRecordName isEqualToString:mention.serverShareCheckingParent.recordID.recordName]", "+[ICMentionNotificationController triggerNotificationForMentionAttachments:context:]", 1, 0, CFSTR("Mismatch triggering coalesced mention notification for %@, expecting %@"), v47, v86);

        }
        objc_msgSend(v35, "note");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "recordID");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "recordName");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v87, "isEqualToString:", v50);

        if ((v51 & 1) == 0)
        {
          v52 = (void *)MEMORY[0x1E0D641A0];
          objc_msgSend(v35, "note");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "recordID");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "recordName");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[noteRecordName isEqualToString:mention.note.recordID.recordName]", "+[ICMentionNotificationController triggerNotificationForMentionAttachments:context:]", 1, 0, CFSTR("Mismatch triggering coalesced mention notification for note %@, expecting %@"), v55, v87);

        }
      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v118, 16);
    }
    while (v32);
  }

  v56 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v83);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)v56;
  objc_msgSend(v57, "postNotificationName:object:", CFSTR("ICMentionNotificationControllerWillSendNotification"), v56);

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v58 = obj;
  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v93, v117, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v94;
    obja = v58;
    do
    {
      for (m = 0; m != v60; ++m)
      {
        if (*(_QWORD *)v94 != v61)
          objc_enumerationMutation(v58);
        v63 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * m);
        objc_msgSend(v63, "setMentionNotificationState:", 2);
        objc_msgSend(v63, "setMentionNotificationAttemptCount:", objc_msgSend(v63, "mentionNotificationAttemptCount") + 1);
        v64 = os_log_create("com.apple.notes", "Mentions");
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
        {
          v65 = objc_msgSend(v63, "mentionNotificationAttemptCount");
          objc_msgSend(MEMORY[0x1E0D63A78], "sharedConfiguration");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v66, "mentionNotificationMaxRetries");
          objc_msgSend(v63, "ic_loggingIdentifier");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109890;
          v110 = v65;
          v111 = 2048;
          v112 = v67;
          v113 = 2112;
          v114 = v88;
          v115 = 2112;
          v116 = v68;
          _os_log_debug_impl(&dword_1AC7A1000, v64, OS_LOG_TYPE_DEBUG, "Attempt (%d/%lu) to send notification to participant (%@) for mention: %@", buf, 0x26u);

          v58 = obja;
        }

      }
      v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v93, v117, 16);
    }
    while (v60);
  }

  v6 = v79;
  objc_msgSend(v79, "ic_save");
  objc_msgSend((id)objc_opt_class(), "senderNameForMentions:", v58);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "noteTitleForMentions:", v58);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "snippetForMentions:", v58);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63A88], "sharedController");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v89[0] = MEMORY[0x1E0C809B0];
  v89[1] = 3221225472;
  v89[2] = __84__ICMentionNotificationController_triggerNotificationForMentionAttachments_context___block_invoke;
  v89[3] = &unk_1E5C230F8;
  v90 = v79;
  v91 = v58;
  v92 = v74;
  v73 = v74;
  v12 = v76;
  objc_msgSend(v72, "sendMentionNotificationToParticipant:inlineAttachmentRecordName:shareRecordName:shareOwnerUserId:accountId:noteRecordName:senderName:noteTitle:mentionSnippet:callback:", v88, v83, v86, v82, v76, v87, v69, v70, v71, v89);

  v5 = v80;
  v9 = v77;
  v7 = v78;
  v13 = v75;
LABEL_48:

}

void __84__ICMentionNotificationController_triggerNotificationForMentionAttachments_context___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__ICMentionNotificationController_triggerNotificationForMentionAttachments_context___block_invoke_2;
  v6[3] = &unk_1E5C1F1B0;
  v4 = a1[4];
  v7 = a1[5];
  v8 = v3;
  v9 = a1[4];
  v10 = a1[6];
  v5 = v3;
  objc_msgSend(v4, "performBlock:", v6);

}

void __84__ICMentionNotificationController_triggerNotificationForMentionAttachments_context___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[4];
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    v20 = v2;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v8 = *(_QWORD *)(a1 + 40);
        v9 = os_log_create("com.apple.notes", "Mentions");
        v10 = v9;
        if (!v8)
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            __84__ICMentionNotificationController_triggerNotificationForMentionAttachments_context___block_invoke_2_cold_1(v25, v7, &v26, v10);

          v14 = v7;
          v15 = 2;
          goto LABEL_14;
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "ic_loggingIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = *(void **)(a1 + 40);
          objc_msgSend(v17, "userInfo");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v28 = v16;
          v29 = 2112;
          v30 = v17;
          v2 = v20;
          v31 = 2112;
          v32 = v18;
          _os_log_error_impl(&dword_1AC7A1000, v10, OS_LOG_TYPE_ERROR, "Failed to send mention (%@) notification: %@ (userInfo=%@)", buf, 0x20u);

        }
        v11 = objc_msgSend(v7, "mentionNotificationAttemptCount");
        objc_msgSend(MEMORY[0x1E0D63A78], "sharedConfiguration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "mentionNotificationMaxRetries");

        v14 = v7;
        if (v13 > v11)
        {
          v15 = 1;
LABEL_14:
          objc_msgSend(v14, "setMentionNotificationState:", v15);
          continue;
        }
        objc_msgSend(v7, "setMentionNotificationState:", 3);
        objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 4);
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICMentionNotificationController triggerNotificationForMentionAttachments:context:]_block_invoke", 1, 1, CFSTR("Unrecoverable failure sending mention notification"));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 48), "ic_save");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "postNotificationName:object:", CFSTR("ICMentionNotificationControllerDidSendNotification"), *(_QWORD *)(a1 + 56));

}

+ (id)coalesceMentions:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  id v25;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = v3;
  v28 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v28)
  {
    v6 = *(_QWORD *)v33;
    v27 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(v5);
        v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v8, "note");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "tokenContentIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 && (objc_msgSend(v10, "length") ? (v12 = v11 == 0) : (v12 = 1), !v12 && objc_msgSend(v11, "length")))
        {
          objc_msgSend(v10, "stringByAppendingString:", v11);
          v13 = objc_claimAutoreleasedReturnValue();
          if (!v13)
            objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((noteParticipantParentKey) != nil)", "+[ICMentionNotificationController coalesceMentions:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "noteParticipantParentKey");
          objc_msgSend(v8, "parentAttachment");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v8, "parentAttachment");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject stringByAppendingString:](v13, "stringByAppendingString:", v17);
            v18 = v5;
            v19 = v4;
            v20 = objc_claimAutoreleasedReturnValue();

            v13 = v20;
            v4 = v19;
            v5 = v18;
            v6 = v27;
          }
          objc_msgSend(v4, "objectForKeyedSubscript:", v13);
          v21 = (id)objc_claimAutoreleasedReturnValue();
          if (!v21)
          {
            v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, v13);
          }
          objc_msgSend(v21, "ic_addNonNilObject:", v8);

        }
        else
        {
          v13 = os_log_create("com.apple.notes", "Mentions");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v37 = v11;
            v38 = 2112;
            v39 = v10;
            _os_log_error_impl(&dword_1AC7A1000, v13, OS_LOG_TYPE_ERROR, "Coalesce mentions skipping mention of %@ in note %@", buf, 0x16u);
          }
        }

      }
      v28 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v28);
  }

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __52__ICMentionNotificationController_coalesceMentions___block_invoke;
  v29[3] = &unk_1E5C23148;
  v30 = v25;
  v31 = a1;
  v22 = v25;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v29);
  v23 = (void *)objc_msgSend(v22, "copy");

  return v23;
}

void __52__ICMentionNotificationController_coalesceMentions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id obj;
  id v35;
  _QWORD v37[4];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "firstObject");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "parentAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v3;
  if (v4)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v44 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v10, "parentAttachment");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12 != v13)
          {
            v14 = (void *)MEMORY[0x1E0D641A0];
            objc_msgSend(v10, "parentAttachment");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "mentionInParent.parentAttachment.identifier == parent.identifier", "+[ICMentionNotificationController coalesceMentions:]_block_invoke", 1, 0, CFSTR("Error trying to coalesce mentions by parent attachment got %@, expected %@"), v16, v17);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v7);
    }

    v18 = *(void **)(a1 + 32);
    v19 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v18, "addObject:", v19);
  }
  else
  {
    v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v3;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v40 != v22)
            objc_enumerationMutation(obj);
          v24 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
          v25 = *(void **)(a1 + 40);
          v47 = v24;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v25, "rangeOfSnippetForMentions:", v26);
          v29 = v28;

          if (v27 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v27, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectForKeyedSubscript:", v30);
            v31 = (id)objc_claimAutoreleasedReturnValue();
            if (!v31)
            {
              v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v35, "setObject:forKeyedSubscript:", v31, v30);
            }
            objc_msgSend(v31, "addObject:", v24);

          }
        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v21);
    }

    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __52__ICMentionNotificationController_coalesceMentions___block_invoke_2;
    v37[3] = &unk_1E5C23120;
    v38 = *(id *)(a1 + 32);
    v19 = v35;
    objc_msgSend(v35, "enumerateKeysAndObjectsUsingBlock:", v37);

  }
}

void __52__ICMentionNotificationController_coalesceMentions___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(v3, "addObject:", v4);

}

+ (id)sameNoteMentionsFrom:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__ICMentionNotificationController_sameNoteMentionsFrom___block_invoke;
  v9[3] = &unk_1E5C23170;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v3, "ic_compactMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __56__ICMentionNotificationController_sameNoteMentionsFrom___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == *(void **)(a1 + 32))
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

+ (id)senderNameForMentions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;

  v4 = a3;
  objc_msgSend(a1, "sameNoteMentionsFrom:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = objc_msgSend(v4, "count");

  if (v6 != v7)
  {
    v8 = os_log_create("com.apple.notes", "Mentions");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[ICMentionNotificationController senderNameForMentions:].cold.1();

  }
  objc_msgSend(v5, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "note");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "note", "+[ICMentionNotificationController senderNameForMentions:]", 1, 0, CFSTR("Tried to get a sender name for mentions without a note"));
  objc_msgSend(v10, "serverShareCheckingParent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "share", "+[ICMentionNotificationController senderNameForMentions:]", 1, 0, CFSTR("Tried to a sender name for a note without a share"));
  objc_msgSend(v11, "currentUserParticipant");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ic_shortParticipantName");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v13 = &stru_1E5C2F8C0;
  v15 = v13;

  return v15;
}

+ (id)noteTitleForMentions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;

  v4 = a3;
  objc_msgSend(a1, "sameNoteMentionsFrom:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = objc_msgSend(v4, "count");

  if (v6 != v7)
  {
    v8 = os_log_create("com.apple.notes", "Mentions");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[ICMentionNotificationController senderNameForMentions:].cold.1();

  }
  objc_msgSend(v5, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "note");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "note", "+[ICMentionNotificationController noteTitleForMentions:]", 1, 0, CFSTR("Tried to get title for mentions without a note"));
  objc_msgSend(v10, "title");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
    v11 = &stru_1E5C2F8C0;
  v13 = v11;

  return v13;
}

+ (id)snippetForMentions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "note");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "parentAttachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0D639F0], "mentionNotificationSnippetForAttachmentType:", objc_msgSend(v8, "attachmentType"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ic_trimmedString");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = objc_msgSend(a1, "rangeOfSnippetForMentions:", v4);
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = &stru_1E5C2F8C0;
LABEL_9:

        goto LABEL_10;
      }
      v14 = v12;
      v15 = v13;
      objc_msgSend(v7, "attributedString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "attributedSubstringFromRange:", v14, v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "managedObjectContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:formatter:", v17, &__block_literal_global_62);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "string");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "ic_trimmedString");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_9;
  }
  v11 = &stru_1E5C2F8C0;
LABEL_10:

  return v11;
}

id __54__ICMentionNotificationController_snippetForMentions___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

+ (_NSRange)rangeOfSnippetForMentions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger length;
  uint64_t v14;
  uint64_t location;
  uint64_t i;
  NSUInteger v17;
  NSUInteger v18;
  NSRange v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  NSUInteger v23;
  uint64_t v24;
  NSUInteger v25;
  uint64_t j;
  uint64_t v27;
  NSUInteger v28;
  NSRange v29;
  NSUInteger v30;
  uint64_t v31;
  BOOL v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSUInteger v37;
  uint64_t k;
  NSUInteger v39;
  NSUInteger v40;
  NSRange v41;
  NSRange v42;
  NSRange v43;
  void *v44;
  void *v45;
  int v46;
  BOOL v47;
  void *v48;
  NSUInteger v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  NSUInteger v58;
  NSUInteger v59;
  NSUInteger v60;
  NSUInteger v61;
  NSRange v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t m;
  NSUInteger v68;
  NSUInteger v69;
  NSRange v70;
  NSRange v71;
  void *v72;
  void *v73;
  int v74;
  NSUInteger v75;
  NSUInteger v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  uint64_t v103;
  NSRange v104;
  NSRange v105;
  NSRange v106;
  NSRange v107;
  NSRange v108;
  NSRange v109;
  _NSRange result;
  NSRange v111;
  NSRange v112;
  NSRange v113;

  v103 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "sameNoteMentionsFrom:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6 != objc_msgSend(v4, "count"))
  {
    v7 = os_log_create("com.apple.notes", "Mentions");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[ICMentionNotificationController senderNameForMentions:].cold.1();

  }
  objc_msgSend(v5, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "note");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v30 = 0;
    v31 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_93;
  }
  v81 = v9;
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v95, v102, 16);
  v82 = v10;
  v77 = v5;
  v79 = v4;
  if (!v11)
  {
LABEL_19:

    goto LABEL_20;
  }
  v12 = v11;
  length = 0;
  v14 = *(_QWORD *)v96;
  location = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v96 != v14)
        objc_enumerationMutation(v10);
      v17 = objc_msgSend(a1, "rangeOfParagraphForMention:", *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * i), v77, v79);
      v19.location = v17;
      v19.length = v18;
      if (location != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v17 == 0x7FFFFFFFFFFFFFFFLL)
          continue;
        v104.location = location;
        v104.length = length;
        v19 = NSUnionRange(v104, v19);
      }
      location = v19.location;
      length = v19.length;
      if (v19.length > 0xC8)
        goto LABEL_19;
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v95, v102, 16);
  }
  while (v12);

  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_20:
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v20 = v10;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
    if (!v21)
    {
      length = 0;
      location = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_34;
    }
    v22 = v21;
    v23 = 0;
    v24 = *(_QWORD *)v92;
    v25 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v92 != v24)
          objc_enumerationMutation(v20);
        v27 = objc_msgSend(a1, "rangeOfSentenceForMention:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * j), v77, v79);
        location = v27;
        length = v28;
        if (v25 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v27 == 0x7FFFFFFFFFFFFFFFLL)
            continue;
          v105.location = v25;
          v105.length = v23;
          v111.location = location;
          v111.length = length;
          v29 = NSUnionRange(v105, v111);
          location = v29.location;
          length = v29.length;
        }
        v25 = location;
        v23 = length;
        if (length > 0xC8)
          goto LABEL_34;
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
      length = v23;
      location = v25;
      if (!v22)
      {
LABEL_34:

        v10 = v82;
        break;
      }
    }
  }
  v32 = length > 0xC8 || location == 0x7FFFFFFFFFFFFFFFLL;
  v9 = v81;
  if (!v32)
    goto LABEL_55;
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v33 = v10;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
  location = 0x7FFFFFFFFFFFFFFFLL;
  if (!v34)
  {
    length = 0;
    v10 = v82;
    goto LABEL_54;
  }
  v35 = v34;
  length = 0;
  v36 = *(_QWORD *)v88;
  v37 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (k = 0; k != v35; ++k)
    {
      if (*(_QWORD *)v88 != v36)
        objc_enumerationMutation(v33);
      v39 = objc_msgSend(a1, "rangeOfMention:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * k), v77, v79);
      v41.location = v39;
      v41.length = v40;
      if (v37 == 0x7FFFFFFFFFFFFFFFLL)
      {
        length = v40;
        v37 = v39;
      }
      else if (v39 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v106.location = v37;
        v106.length = length;
        v42 = NSUnionRange(v106, v41);
        v37 = v42.location;
        length = v42.length;
      }
    }
    v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
  }
  while (v35);

  location = 0x7FFFFFFFFFFFFFFFLL;
  v10 = v82;
  if (v37 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v81, "attributedString");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    v112.length = objc_msgSend(v33, "length");
    v107.location = v37;
    v107.length = 200;
    v112.location = 0;
    v43 = NSIntersectionRange(v107, v112);
    location = v43.location;
    length = v43.length;
LABEL_54:

  }
LABEL_55:
  objc_msgSend(v81, "attributedString", v77, v79);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "string");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "ic_rangeIsValid:", location, length);

  if (v46)
    v47 = location == 0x7FFFFFFFFFFFFFFFLL;
  else
    v47 = 1;
  if (v47
    && (objc_msgSend(v10, "firstObject"),
        v48 = (void *)objc_claimAutoreleasedReturnValue(),
        location = objc_msgSend(a1, "rangeOfMention:", v48),
        length = v49,
        v48,
        location == 0x7FFFFFFFFFFFFFFFLL))
  {
    v50 = 0;
    location = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    objc_msgSend(v81, "attributedString");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "string");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "substringWithRange:", location, length);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceAndNewlineCharacterSet");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "formUnionWithCharacterSet:", v54);

  objc_msgSend(v50, "stringByTrimmingCharactersInSet:", v53);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "length");

  if (v56 == 1)
  {
    objc_msgSend(v82, "firstObject");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(a1, "rangeOfSentenceBeforeMention:", v57);
    v60 = v59;
    v113.location = objc_msgSend(a1, "rangeOfSentenceAfterMention:", v57);
    v113.length = v61;
    v108.location = v58;
    v108.length = v60;
    v62 = NSUnionRange(v108, v113);
    location = v62.location;
    if (v62.length >= 0xC8)
      length = 200;
    else
      length = v62.length;

  }
  if (length > 0xC8 || location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v63 = v82;
    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
    if (v64)
    {
      v65 = v64;
      length = 0;
      v66 = *(_QWORD *)v84;
      location = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (m = 0; m != v65; ++m)
        {
          if (*(_QWORD *)v84 != v66)
            objc_enumerationMutation(v63);
          v68 = objc_msgSend(a1, "rangeOfMention:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * m));
          v70.location = v68;
          v70.length = v69;
          if (location == 0x7FFFFFFFFFFFFFFFLL)
          {
            length = v69;
            location = v68;
          }
          else if (v68 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v109.location = location;
            v109.length = length;
            v71 = NSUnionRange(v109, v70);
            location = v71.location;
            length = v71.length;
          }
        }
        v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
      }
      while (v65);
    }
    else
    {
      length = 0;
      location = 0x7FFFFFFFFFFFFFFFLL;
    }

    if (length >= 0xC8)
      length = 200;
    v9 = v81;
  }
  objc_msgSend(v9, "attributedString");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "string");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "ic_rangeIsValid:", location, length);
  if (v74)
    v31 = location;
  else
    v31 = 0x7FFFFFFFFFFFFFFFLL;
  if (v74)
    v30 = length;
  else
    v30 = 0;

  v5 = v78;
  v4 = v80;
LABEL_93:

  v75 = v31;
  v76 = v30;
  result.length = v76;
  result.location = v75;
  return result;
}

+ (_NSRange)rangeOfMention:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  const char *v19;
  __int128 v20;
  _NSRange result;

  v3 = a3;
  objc_msgSend(v3, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = &v16;
  v18 = 0x3010000000;
  v19 = "";
  v20 = xmmword_1ACA582A0;
  v6 = objc_msgSend(v5, "length");
  v7 = *MEMORY[0x1E0D63950];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__ICMentionNotificationController_rangeOfMention___block_invoke;
  v13[3] = &unk_1E5C1F360;
  v8 = v3;
  v14 = v8;
  v15 = &v16;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v6, 0, v13);
  v9 = v17[4];
  v10 = v17[5];

  _Block_object_dispose(&v16, 8);
  v11 = v9;
  v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

void __50__ICMentionNotificationController_rangeOfMention___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  int v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  v9 = objc_msgSend(v16, "conformsToProtocol:", &unk_1EECADDB0);
  v10 = v16;
  if (v9)
  {
    v11 = v16;
    if (objc_msgSend(MEMORY[0x1E0D63C60], "isInlineAttachment:", v11))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "attachmentIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

      if (v14)
      {
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        *(_QWORD *)(v15 + 32) = a3;
        *(_QWORD *)(v15 + 40) = a4;
        *a5 = 1;
      }
    }

    v10 = v16;
  }

}

+ (_NSRange)rangeOfParagraphForMention:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  void *v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  _NSRange result;

  v4 = a3;
  objc_msgSend(v4, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(a1, "rangeOfMention:", v4);
  v9 = v8;

  v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v6, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "paragraphRangeForRange:", v7, v9);
    v11 = v13;

  }
  v14 = v10;
  v15 = v11;
  result.length = v15;
  result.location = v14;
  return result;
}

+ (_NSRange)rangeOfSentenceForMention:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  void *v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  _NSRange result;

  v4 = a3;
  objc_msgSend(v4, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(a1, "rangeOfMention:", v4);
  v9 = v8;

  v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v6, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "ic_sentenceRangeForRange:", v7, v9);
    v11 = v13;

  }
  v14 = v10;
  v15 = v11;
  result.length = v15;
  result.location = v14;
  return result;
}

+ (_NSRange)rangeOfSentenceBeforeMention:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  void *v11;
  void *v12;
  NSUInteger v13;
  NSRange v14;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSRange v20;
  _NSRange result;
  NSRange v22;

  v4 = a3;
  objc_msgSend(v4, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(a1, "rangeOfMention:", v4);
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceAndNewlineCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "formUnionWithCharacterSet:", v12);

  v13 = v8;
  do
  {
    if (!v13)
      break;
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    --v13;
  }
  while ((objc_msgSend(v11, "characterIsMember:", objc_msgSend(v7, "characterAtIndex:", v13)) & 1) != 0);
  v20.location = v13;
  v20.length = v10;
  v22.location = v8;
  v22.length = v10;
  v14 = NSUnionRange(v20, v22);
  v15 = objc_msgSend(v7, "ic_sentenceRangeForRange:", v14.location, v14.length);
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.length = v19;
  result.location = v18;
  return result;
}

+ (_NSRange)rangeOfSentenceAfterMention:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  void *v11;
  void *v12;
  NSUInteger v13;
  NSRange v14;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSRange v20;
  _NSRange result;
  NSRange v22;

  v4 = a3;
  objc_msgSend(v4, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(a1, "rangeOfMention:", v4);
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceAndNewlineCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "formUnionWithCharacterSet:", v12);

  v13 = v8;
  while (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((unint64_t)objc_msgSend(v7, "length") >= 2
      && v13 < objc_msgSend(v7, "length") - 2
      && (objc_msgSend(v11, "characterIsMember:", objc_msgSend(v7, "characterAtIndex:", ++v13)) & 1) != 0)
    {
      continue;
    }
    goto LABEL_8;
  }
  v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_8:
  v20.location = v13;
  v20.length = v10;
  v22.location = v8;
  v22.length = v10;
  v14 = NSUnionRange(v20, v22);
  v15 = objc_msgSend(v7, "ic_sentenceRangeForRange:", v14.location, v14.length);
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.length = v19;
  result.location = v18;
  return result;
}

+ (id)predicateForMentionsInState:(int)a3 inContext:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v4 = *(_QWORD *)&a3;
  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D63B40], "predicateForMentionsInContext:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("mentionNotificationState == %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3528];
  v13[0] = v5;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)pendingMentionsInContext:(id)a3 createdBeforeDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "predicateForMentionsInState:inContext:", 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("creationDate <= %@"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D63B40];
  v11 = (void *)MEMORY[0x1E0CB3528];
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ic_objectsMatchingPredicate:context:", v13, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __73__ICMentionNotificationController_sendPendingNotificationsCreatedBefore___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Not sending pending notifications because the internet is not reachable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __73__ICMentionNotificationController_sendPendingNotificationsCreatedBefore___block_invoke_2_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_DEBUG, "Pending mentions before %@: %@", (uint8_t *)&v4, 0x16u);
}

+ (void)triggerNotificationForMentionAttachments:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Setting mention notification state to failed because the user mentioned theirself", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)triggerNotificationForMentionAttachments:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Setting mention notification state to failed because the note is no longer shared or the recipient is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __84__ICMentionNotificationController_triggerNotificationForMentionAttachments_context___block_invoke_2_cold_1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "ic_loggingIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1AC7A1000, a4, OS_LOG_TYPE_DEBUG, "Successfully sent notification for mention: %@", a1, 0xCu);

}

+ (void)senderNameForMentions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, v0, v1, "notificationSnippetForMentions passed mentions from more than one note", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
