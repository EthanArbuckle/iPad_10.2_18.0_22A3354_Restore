@implementation PPLocationReadWriteServerRequestHandler

- (void)donateLocations:(id)a3 source:(id)a4 contextualNamedEntities:(id)a5 algorithm:(unsigned __int16)a6 cloudSync:(BOOL)a7 decayRate:(double)a8 completion:(id)a9
{
  _BOOL8 v10;
  uint64_t v11;
  id v14;
  void (**v15)(id, uint64_t, id);
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v10 = a7;
  v11 = a6;
  v25 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = (void (**)(id, uint64_t, id))a9;
  v16 = a5;
  v17 = a4;
  pp_xpc_server_log_handle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v24 = objc_msgSend(v14, "count");
    _os_log_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEFAULT, "PPLocationReadWriteServer: donateLocations: %tu locations", buf, 0xCu);
  }

  +[PPLocalLocationStore defaultStore](PPLocalLocationStore, "defaultStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v20 = objc_msgSend(v19, "donateLocations:source:contextualNamedEntities:algorithm:cloudSync:error:", v14, v17, v16, v11, v10, &v22);

  v21 = v22;
  v15[2](v15, v20, v21);

}

- (void)cloudSyncWithCompletion:(id)a3
{
  void (**v3)(id, uint64_t, _QWORD);
  NSObject *v4;
  uint8_t v5[16];

  v3 = (void (**)(id, uint64_t, _QWORD))a3;
  pp_xpc_server_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPLocationReadWriteServer: cloudSync", v5, 2u);
  }

  v3[2](v3, 1, 0);
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
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPLocationReadWriteServer: clear", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  +[PPLocalLocationStore defaultStore](PPLocalLocationStore, "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v6 = objc_msgSend(v5, "clearWithError:deletedCount:", &v8, buf);
  v7 = v8;

  v3[2](v3, v6, *(_QWORD *)buf, v7);
}

@end
