@implementation PSUIntentMessageHistorySearcher

- (void)recentMessagesSinceDate:(id)a3 conversationIdentifier:(id)a4 appBundleId:(id)a5 incomingMessageID:(id)a6 limit:(int64_t)a7 options:(unint64_t)a8 completionHandler:(id)a9
{
  char v9;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  _QWORD *v32;
  _QWORD v33[4];
  id v34;
  _QWORD *v35;
  _QWORD v36[3];
  char v37;
  _QWORD v38[2];

  v9 = a8;
  v38[1] = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a9;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v37 = 0;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9C98]), "initWithStartDate:endDate:onCalendar:inTimeZone:", v13, 0, 0, 0);
  v19 = objc_alloc(MEMORY[0x24BDDA080]);
  v38[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithRecipients:senders:searchTerms:attributes:dateTimeRange:identifiers:notificationIdentifiers:speakableGroupNames:conversationIdentifiers:", 0, 0, 0, v9 & 3, v18, 0, 0, 0, v20);

  objc_msgSend(v21, "_setLaunchId:", v15);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE5B900]), "initWithIntent:", v21);
  objc_msgSend(v22, "setRequiresTCC:", 0);
  objc_msgSend(v22, "setRequestTimeoutInterval:", 5.0);
  v23 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __144__PSUIntentMessageHistorySearcher_recentMessagesSinceDate_conversationIdentifier_appBundleId_incomingMessageID_limit_options_completionHandler___block_invoke;
  v33[3] = &unk_2515CA180;
  v35 = v36;
  v24 = v17;
  v34 = v24;
  objc_msgSend(v22, "setTimeoutHandler:", v33);
  objc_msgSend(v22, "setInterruptionHandler:", &__block_literal_global);
  v28[0] = v23;
  v28[1] = 3221225472;
  v28[2] = __144__PSUIntentMessageHistorySearcher_recentMessagesSinceDate_conversationIdentifier_appBundleId_incomingMessageID_limit_options_completionHandler___block_invoke_5;
  v28[3] = &unk_2515CA238;
  v32 = v36;
  v25 = v24;
  v31 = v25;
  v26 = v16;
  v29 = v26;
  v27 = v22;
  v30 = v27;
  objc_msgSend(v27, "resumeWithCompletionHandler:", v28);

  _Block_object_dispose(v36, 8);
}

void __144__PSUIntentMessageHistorySearcher_recentMessagesSinceDate_conversationIdentifier_appBundleId_incomingMessageID_limit_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  PSUSummarizationLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_error_impl(&dword_244BC5000, v4, OS_LOG_TYPE_ERROR, "Request to fetch messages timed out with error: %@", (uint8_t *)&v5, 0xCu);
  }

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

void __144__PSUIntentMessageHistorySearcher_recentMessagesSinceDate_conversationIdentifier_appBundleId_incomingMessageID_limit_options_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  __int128 v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (objc_msgSend(v6, "code") != 3001)
    {
      PSUSummarizationLogging();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v7;
        _os_log_error_impl(&dword_244BC5000, v9, OS_LOG_TYPE_ERROR, "Unable to resume intent connection with error: %@", buf, 0xCu);
      }

    }
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  else
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __144__PSUIntentMessageHistorySearcher_recentMessagesSinceDate_conversationIdentifier_appBundleId_incomingMessageID_limit_options_completionHandler___block_invoke_6;
    v11[3] = &unk_2515CA210;
    v10 = *(_OWORD *)(a1 + 48);
    v8 = (id)v10;
    v15 = v10;
    v12 = *(id *)(a1 + 32);
    v13 = v5;
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v13, "handleIntentWithCompletionHandler:", v11);

  }
}

void __144__PSUIntentMessageHistorySearcher_recentMessagesSinceDate_conversationIdentifier_appBundleId_incomingMessageID_limit_options_completionHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    PSUSummarizationLogging();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    v14 = "Unable to handle the search for messages intent: %@";
    v15 = v13;
    v16 = 12;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "messages");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = (void *)MEMORY[0x24BDBD1A8];
    if (v8)
      v10 = (void *)v8;
    v11 = v10;

    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __144__PSUIntentMessageHistorySearcher_recentMessagesSinceDate_conversationIdentifier_appBundleId_incomingMessageID_limit_options_completionHandler___block_invoke_8;
    v17[3] = &unk_2515CA1E8;
    v18 = *(id *)(a1 + 32);
    objc_msgSend(v11, "_pas_filteredArrayWithTest:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }

    goto LABEL_14;
  }
  PSUSummarizationLogging();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v14 = "Unable to handle the search for messages intent (incorrect response)";
    v15 = v13;
    v16 = 2;
LABEL_16:
    _os_log_error_impl(&dword_244BC5000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
  }
LABEL_12:

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
LABEL_14:

}

BOOL __144__PSUIntentMessageHistorySearcher_recentMessagesSinceDate_conversationIdentifier_appBundleId_incomingMessageID_limit_options_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  _BOOL8 v7;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32)
    && (objc_msgSend(v3, "identifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32)),
        v5,
        (v6 & 1) != 0)
    || objc_msgSend(v4, "messageEffectType") == 6)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "sender");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8 != 0;

  }
  return v7;
}

void __144__PSUIntentMessageHistorySearcher_recentMessagesSinceDate_conversationIdentifier_appBundleId_incomingMessageID_limit_options_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  PSUSummarizationLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_244BC5000, v3, OS_LOG_TYPE_ERROR, "Request to fetch messages was interrupted with error: %@", (uint8_t *)&v4, 0xCu);
  }

}

@end
