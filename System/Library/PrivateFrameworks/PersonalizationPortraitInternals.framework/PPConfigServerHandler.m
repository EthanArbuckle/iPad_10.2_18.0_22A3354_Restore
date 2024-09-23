@implementation PPConfigServerHandler

- (void)assetVersionWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = a3;
  pp_default_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);

  pp_default_signpost_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PPConfigServer.assetVersion", ", buf, 2u);
  }

  pp_xpc_server_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, "PPConfigServer: assetVersion", v12, 2u);
  }

  pp_default_signpost_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v10, OS_SIGNPOST_INTERVAL_END, v5, "PPConfigServer.assetVersion", ", v11, 2u);
  }

  (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);
}

- (void)variantNameWithCompletion:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  v3 = (void (**)(id, void *, _QWORD))a3;
  pp_default_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);

  pp_default_signpost_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PPConfigServer.variantName", ", buf, 2u);
  }

  pp_xpc_server_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, "PPConfigServer: variantName", v14, 2u);
  }

  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "portraitVariantName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  pp_default_signpost_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v12, OS_SIGNPOST_INTERVAL_END, v5, "PPConfigServer.variantName", ", v13, 2u);
  }

  v3[2](v3, v10, 0);
}

- (void)readableTrialTreatmentsMappingWithCompletion:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  v3 = (void (**)(id, void *, _QWORD))a3;
  pp_default_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);

  pp_default_signpost_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PPConfigServer.readableTrialTreatmentsMapping", ", buf, 2u);
  }

  pp_xpc_server_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, "PPConfigServer: readableTrialTreatmentsMapping", v14, 2u);
  }

  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "readableTreatmentsMapping");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  pp_default_signpost_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v12, OS_SIGNPOST_INTERVAL_END, v5, "PPConfigServer.readableTrialTreatmentsMapping", ", v13, 2u);
  }

  v3[2](v3, v10, 0);
}

@end
