@implementation PPNamedEntityReadWriteServerRequestHandler

- (void)donateNamedEntities:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 completion:(id)a8
{
  _BOOL8 v10;
  id v13;
  void (**v14)(id, uint64_t, id);
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v10 = a6;
  v23 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = (void (**)(id, uint64_t, id))a8;
  v15 = a4;
  pp_xpc_server_log_handle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v22 = objc_msgSend(v13, "count");
    _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadWriteServer: donateNamedEntities: %tu entities", buf, 0xCu);
  }

  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v18 = objc_msgSend(v17, "donateNamedEntities:source:algorithm:cloudSync:sentimentScore:error:", v13, v15, a5, v10, &v20, a7);

  v19 = v20;
  v14[2](v14, v18, v19);

}

- (void)flushDonationsWithCompletion:(id)a3
{
  void (**v3)(_QWORD);
  NSObject *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(_QWORD))a3;
  pp_xpc_server_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadWriteServer: flushDonations", buf, 2u);
  }

  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = objc_msgSend(v5, "flushDonationsWithError:", &v9);
  v7 = v9;

  if ((v6 & 1) == 0)
  {
    pp_xpc_server_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_error_impl(&dword_1C392E000, v8, OS_LOG_TYPE_ERROR, "flushDonationsWithError unexpectedly failed: %@", buf, 0xCu);
    }

  }
  v3[2](v3);

}

- (void)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 completion:(id)a5
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
    _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadWriteServer: deleteAllNamedEntitiesFromSourcesWithBundleId:documentIds:", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v12 = objc_msgSend(v11, "deleteAllNamedEntitiesFromSourcesWithBundleId:documentIds:deletedCount:error:", v9, v8, buf, &v14);

  v13 = v14;
  v7[2](v7, v12, *(_QWORD *)buf, v13);

}

- (void)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 completion:(id)a5
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
    _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadWriteServer: deleteAllNamedEntitiesFromSourcesWithBundleId:groupIds:", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v12 = objc_msgSend(v11, "deleteAllNamedEntitiesFromSourcesWithBundleId:groupIds:deletedCount:error:", v9, v8, buf, &v14);

  v13 = v14;
  v7[2](v7, v12, *(_QWORD *)buf, v13);

}

- (void)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 completion:(id)a4
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
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadWriteServer: deleteAllNamedEntitiesFromSourcesWithBundleId", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v9 = objc_msgSend(v8, "deleteAllNamedEntitiesFromSourcesWithBundleId:deletedCount:error:", v6, buf, &v11);

  v10 = v11;
  v5[2](v5, v9, *(_QWORD *)buf, v10);

}

- (void)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThanDate:(id)a5 completion:(id)a6
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
    _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadWriteServer: deleteAllNamedEntitiesFromSourcesWithBundleId:groupId:olderThanDate", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v15 = objc_msgSend(v14, "deleteAllNamedEntitiesFromSourcesWithBundleId:groupId:olderThan:deletedCount:error:", v12, v11, v10, buf, &v17);

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
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadWriteServer: cloudSync", buf, 2u);
  }

  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
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
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadWriteServer: clear", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v6 = objc_msgSend(v5, "clearWithError:deletedCount:", &v8, buf);
  v7 = v8;

  v3[2](v3, v6, *(_QWORD *)buf, v7);
}

- (void)donateMapItem:(id)a3 forPlaceName:(id)a4 completion:(id)a5
{
  void (**v7)(id, uint64_t, id);
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint8_t buf[16];

  v7 = (void (**)(id, uint64_t, id))a5;
  v8 = a4;
  v9 = a3;
  pp_xpc_server_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadWriteServer: donateMapItem", buf, 2u);
  }

  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v12 = objc_msgSend(v11, "donateMapItem:forPlaceName:error:", v9, v8, &v14);

  v13 = v14;
  v7[2](v7, v12, v13);

}

- (void)removeMapItemForPlaceName:(id)a3 completion:(id)a4
{
  void (**v5)(id, uint64_t, id);
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint8_t buf[16];

  v5 = (void (**)(id, uint64_t, id))a4;
  v6 = a3;
  pp_xpc_server_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadWriteServer: removeMapItemForPlaceName", buf, 2u);
  }

  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v9 = objc_msgSend(v8, "removeMapItemForPlaceName:error:", v6, &v11);

  v10 = v11;
  v5[2](v5, v9, v10);

}

- (void)removeMapItemsBeforeCutoffDate:(id)a3 completion:(id)a4
{
  void (**v5)(id, uint64_t, id);
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint8_t buf[16];

  v5 = (void (**)(id, uint64_t, id))a4;
  v6 = a3;
  pp_xpc_server_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadWriteServer: removeMapItemsBeforeCutoffDate", buf, 2u);
  }

  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v9 = objc_msgSend(v8, "removeMapItemsBeforeCutoffDate:error:", v6, &v11);

  v10 = v11;
  v5[2](v5, v9, v10);

}

- (void)donateLocationNamedEntities:(id)a3 bundleId:(id)a4 groupId:(id)a5 completion:(id)a6
{
  id v9;
  void (**v10)(id, uint64_t, id);
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, uint64_t, id))a6;
  v11 = a5;
  v12 = a4;
  pp_xpc_server_log_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v19 = objc_msgSend(v9, "count");
    _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "PPNamedEntityReadWriteServer: donateLocationNamedEntities: %tu entities", buf, 0xCu);
  }

  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v15 = objc_msgSend(v14, "donateLocationNamedEntities:bundleId:groupId:error:", v9, v12, v11, &v17);

  v16 = v17;
  v10[2](v10, v15, v16);

}

@end
