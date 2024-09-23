@implementation PPTopicReadWriteServerRequestHandler

- (void)donateTopics:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 exactMatchesInSourceText:(id)a8 completion:(id)a9
{
  _BOOL8 v12;
  id v15;
  void (**v16)(id, uint64_t, id);
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v12 = a6;
  v26 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = (void (**)(id, uint64_t, id))a9;
  v17 = a8;
  v18 = a4;
  pp_xpc_server_log_handle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v25 = objc_msgSend(v15, "count");
    _os_log_impl(&dword_1C392E000, v19, OS_LOG_TYPE_DEFAULT, "PPTopicReadWriteServer: donateTopics: %tu topics", buf, 0xCu);
  }

  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v21 = objc_msgSend(v20, "donateTopics:source:algorithm:cloudSync:sentimentScore:exactMatchesInSourceText:error:", v15, v18, a5, v12, v17, &v23, a7);

  v22 = v23;
  v16[2](v16, v21, v22);

}

- (void)deleteAllTopicsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 completion:(id)a5
{
  void (**v7)(id, uint64_t, _QWORD, id);
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint8_t buf[16];

  v7 = (void (**)(id, uint64_t, _QWORD, id))a5;
  v8 = a4;
  v9 = a3;
  pp_xpc_server_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEFAULT, "PPTopicReadWriteServer: deleteAllTopicsFromSourcesWithBundleId:documentIds:", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v12 = objc_msgSend(v11, "deleteAllTopicsFromSourcesWithBundleId:documentIds:deletedCount:error:", v9, v8, buf, &v14);

  v13 = v14;
  v7[2](v7, v12, *(_QWORD *)buf, v13);

}

- (void)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 completion:(id)a5
{
  void (**v7)(id, uint64_t, _QWORD, id);
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint8_t buf[16];

  v7 = (void (**)(id, uint64_t, _QWORD, id))a5;
  v8 = a4;
  v9 = a3;
  pp_xpc_server_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEFAULT, "PPTopicReadWriteServer: deleteAllTopicsFromSourcesWithBundleId:groupIds:", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v12 = objc_msgSend(v11, "deleteAllTopicsFromSourcesWithBundleId:groupIds:deletedCount:error:", v9, v8, buf, &v14);

  v13 = v14;
  v7[2](v7, v12, *(_QWORD *)buf, v13);

}

- (void)deleteAllTopicsFromSourcesWithBundleId:(id)a3 completion:(id)a4
{
  void (**v5)(id, uint64_t, _QWORD, id);
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint8_t buf[16];

  v5 = (void (**)(id, uint64_t, _QWORD, id))a4;
  v6 = a3;
  pp_xpc_server_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPTopicReadWriteServer: deleteAllTopicsFromSourcesWithBundleId:", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v9 = objc_msgSend(v8, "deleteAllTopicsFromSourcesWithBundleId:deletedCount:error:", v6, buf, &v11);

  v10 = v11;
  v5[2](v5, v9, *(_QWORD *)buf, v10);

}

- (void)deleteAllTopicsWithTopicId:(id)a3 completion:(id)a4
{
  void (**v5)(id, uint64_t, _QWORD, id);
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint8_t buf[16];

  v5 = (void (**)(id, uint64_t, _QWORD, id))a4;
  v6 = a3;
  pp_xpc_server_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPTopicReadWriteServer: deleteAllTopicsFromSourcesWithTopicId", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v9 = objc_msgSend(v8, "deleteAllTopicsWithTopicId:deletedCount:error:", v6, buf, &v11);

  v10 = v11;
  v5[2](v5, v9, *(_QWORD *)buf, v10);

}

- (void)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 completion:(id)a6
{
  void (**v9)(id, uint64_t, _QWORD, id);
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint8_t buf[16];

  v9 = (void (**)(id, uint64_t, _QWORD, id))a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  pp_xpc_server_log_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "PPTopicReadWriteServer: deleteAllTopicsFromSourcesWithBundleId:groupId:olderThanDate:", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v15 = objc_msgSend(v14, "deleteAllTopicsFromSourcesWithBundleId:groupId:olderThan:deletedCount:error:", v12, v11, v10, buf, &v17);

  v16 = v17;
  v9[2](v9, v15, *(_QWORD *)buf, v16);

}

- (void)cloudSyncWithCompletion:(id)a3
{
  void (**v3)(id, uint64_t, id);
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint8_t buf[16];

  v3 = (void (**)(id, uint64_t, id))a3;
  pp_xpc_server_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPTopicReadWriteServer: cloudSync", buf, 2u);
  }

  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v6 = objc_msgSend(v5, "cloudSyncWithError:", &v8);
  v7 = v8;

  v3[2](v3, v6, v7);
}

- (void)clearWithCompletion:(id)a3
{
  void (**v3)(id, uint64_t, _QWORD, id);
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint8_t buf[16];

  v3 = (void (**)(id, uint64_t, _QWORD, id))a3;
  pp_xpc_server_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPTopicReadWriteServer: clear", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v6 = objc_msgSend(v5, "clearWithError:deletedCount:", &v8, buf);
  v7 = v8;

  v3[2](v3, v6, *(_QWORD *)buf, v7);
}

- (void)computeAndCacheTopicScores:(id)a3
{
  void (**v3)(id, uint64_t, id);
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint8_t buf[16];

  v3 = (void (**)(id, uint64_t, id))a3;
  pp_xpc_server_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPTopicReadWriteServer: computeAndCacheTopicScores", buf, 2u);
  }

  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v6 = objc_msgSend(v5, "computeAndCacheTopicScores:", &v8);
  v7 = v8;

  v3[2](v3, v6, v7);
}

@end
