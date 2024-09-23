@implementation _OSInactivityPredictionClient

- (_OSInactivityPredictionClient)init
{
  _OSInactivityPredictionClient *v2;
  os_log_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_OSInactivityPredictionClient;
  v2 = -[_OSInactivityPredictionClient init](&v6, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.osintelligence", "inactivity.predictionclient");
    v4 = (void *)gInactivityPredictionClientLog;
    gInactivityPredictionClientLog = (uint64_t)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    -[_OSInactivityPredictionClient initConnection](v2, "initConnection");
  }
  return v2;
}

- (void)initConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *connection;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id location;
  _QWORD v18[7];

  v18[6] = *MEMORY[0x1E0C80C00];
  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.OSIntelligence"), 4096);
  connection = self->_connection;
  self->_connection = v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF8D9318);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  v18[2] = objc_opt_class();
  v18[3] = objc_opt_class();
  v18[4] = objc_opt_class();
  v18[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_backedUpDataWithHandler_, 0, 1);

  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v5);
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47___OSInactivityPredictionClient_initConnection__block_invoke;
  v15[3] = &unk_1E7D7B878;
  objc_copyWeak(&v16, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v15);
  v10 = v9;
  v11 = 3221225472;
  v12 = __47___OSInactivityPredictionClient_initConnection__block_invoke_85;
  v13 = &unk_1E7D7B878;
  objc_copyWeak(&v14, &location);
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &v10);
  -[NSXPCConnection resume](self->_connection, "resume", v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)handleInterruption
{
  OUTLINED_FUNCTION_5(&dword_1C34CE000, a1, a3, "Connection to inactivity predictor interrupted", a5, a6, a7, a8, 0);
}

- (id)validConnection
{
  os_unfair_lock_s *p_lock;
  NSXPCConnection *connection;
  NSXPCConnection *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  connection = self->_connection;
  if (!connection)
  {
    -[_OSInactivityPredictionClient initConnection](self, "initConnection");
    connection = self->_connection;
  }
  v5 = connection;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)_OSInactivityPredictionClient;
  -[_OSInactivityPredictionClient dealloc](&v4, sel_dealloc);
}

- (double)recommendedWaitTime
{
  void *v2;
  void *v3;
  double v4;
  _QWORD v6[5];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52___OSInactivityPredictionClient_recommendedWaitTime__block_invoke_89;
  v6[3] = &unk_1E7D7B9E8;
  v6[4] = &v7;
  objc_msgSend(v3, "recommendedWaitTimeWithHandler:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)modelDescription
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_91);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49___OSInactivityPredictionClient_modelDescription__block_invoke_92;
  v6[3] = &unk_1E7D7B918;
  v6[4] = &v7;
  objc_msgSend(v3, "modelDescriptionWithHandler:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)modelMetadata
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_94);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46___OSInactivityPredictionClient_modelMetadata__block_invoke_95;
  v6[3] = &unk_1E7D7BA50;
  v6[4] = &v7;
  objc_msgSend(v3, "modelMetadataWithHandler:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)hasEnoughInactivityHistory
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_97);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59___OSInactivityPredictionClient_hasEnoughInactivityHistory__block_invoke_98;
  v5[3] = &unk_1E7D7BA98;
  v5[4] = &v6;
  objc_msgSend(v3, "hasEnoughInactivityHistoryWithHandler:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (id)inactivityHistoryDiagnosis
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_100);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59___OSInactivityPredictionClient_inactivityHistoryDiagnosis__block_invoke_101;
  v6[3] = &unk_1E7D7B918;
  v6[4] = &v7;
  objc_msgSend(v3, "inactivityHistoryDiagnosisWithHandler:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)deviceUsageDiagnosis
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_102);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53___OSInactivityPredictionClient_deviceUsageDiagnosis__block_invoke_103;
  v6[3] = &unk_1E7D7B918;
  v6[4] = &v7;
  objc_msgSend(v3, "deviceUsageDiagnosisWithHandler:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)longInactivityPredictionResultWithError:(id *)a3
{
  return -[_OSInactivityPredictionClient longInactivityPredictionResultWithOptions:withError:](self, "longInactivityPredictionResultWithOptions:withError:", 0, a3);
}

- (id)longInactivityPredictionResultWithOptions:(int64_t)a3 withError:(id *)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85___OSInactivityPredictionClient_longInactivityPredictionResultWithOptions_withError___block_invoke;
  v12[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v12[4] = a3;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __85___OSInactivityPredictionClient_longInactivityPredictionResultWithOptions_withError___block_invoke_105;
  v11[3] = &unk_1E7D7BB20;
  v11[4] = &v19;
  v11[5] = &v13;
  objc_msgSend(v8, "longInactivityPredictionResultWithOptions:withHandler:", a3, v11);

  if (a4)
    *a4 = objc_retainAutorelease((id)v14[5]);
  v9 = (id)v20[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

- (id)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withError:(id *)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[4];
  id v19;
  int64_t v20;
  double v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v10 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__1;
  v32 = __Block_byref_object_dispose__1;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __114___OSInactivityPredictionClient_longInactivityPredictionResultAtDate_withTimeSinceInactive_withOptions_withError___block_invoke;
  v18[3] = &unk_1E7D7BB48;
  v20 = a5;
  v13 = v10;
  v19 = v13;
  v21 = a4;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __114___OSInactivityPredictionClient_longInactivityPredictionResultAtDate_withTimeSinceInactive_withOptions_withError___block_invoke_107;
  v17[3] = &unk_1E7D7BB20;
  v17[4] = &v28;
  v17[5] = &v22;
  objc_msgSend(v14, "longInactivityPredictionResultAtDate:withTimeSinceInactive:withOptions:withHandler:", v13, a5, v17, a4);

  if (a6)
    *a6 = objc_retainAutorelease((id)v23[5]);
  v15 = (id)v29[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v15;
}

- (id)fixModelOutput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_108);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48___OSInactivityPredictionClient_fixModelOutput___block_invoke_109;
  v9[3] = &unk_1E7D7B918;
  v9[4] = &v10;
  objc_msgSend(v6, "fixModelOutput:withHandler:", v4, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)unfixModelOutput
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_110);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49___OSInactivityPredictionClient_unfixModelOutput__block_invoke_111;
  v6[3] = &unk_1E7D7B918;
  v6[4] = &v7;
  objc_msgSend(v3, "unfixModelOutputWithHandler:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)overrideRecommendedWaitTimeTo:(double)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_112);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63___OSInactivityPredictionClient_overrideRecommendedWaitTimeTo___block_invoke_113;
  v7[3] = &unk_1E7D7BA98;
  v7[4] = &v8;
  objc_msgSend(v5, "overrideRecommendedWaitTimeTo:withHandler:", v7, a3);

  LOBYTE(v4) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v4;
}

- (BOOL)restoreRecommendedWaitTime
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_114);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59___OSInactivityPredictionClient_restoreRecommendedWaitTime__block_invoke_115;
  v5[3] = &unk_1E7D7BA98;
  v5[4] = &v6;
  objc_msgSend(v3, "restoreRecommendedWaitTimeWithHandler:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)restoreInactivityModel
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_116);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55___OSInactivityPredictionClient_restoreInactivityModel__block_invoke_117;
  v5[3] = &unk_1E7D7BA98;
  v5[4] = &v6;
  objc_msgSend(v3, "restoreInactivityModelWithHandler:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (id)backedUpData
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_118);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45___OSInactivityPredictionClient_backedUpData__block_invoke_119;
  v6[3] = &unk_1E7D7BC30;
  v6[4] = &v7;
  objc_msgSend(v3, "backedUpDataWithHandler:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)recommendedWaitTimeWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_121);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recommendedWaitTimeWithHandler:", v4);

}

- (void)modelDescriptionWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_122);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modelDescriptionWithHandler:", v4);

}

- (void)modelMetadataWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_123);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modelMetadataWithHandler:", v4);

}

- (void)inactivityHistoryDiagnosisWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_124);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inactivityHistoryDiagnosisWithHandler:", v4);

}

- (void)hasEnoughInactivityHistoryWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_125);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hasEnoughInactivityHistoryWithHandler:", v4);

}

- (void)deviceUsageDiagnosisWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_126);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceUsageDiagnosisWithHandler:", v4);

}

- (void)longInactivityPredictionResultWithHandler:(id)a3
{
  -[_OSInactivityPredictionClient longInactivityPredictionResultWithOptions:withHandler:](self, "longInactivityPredictionResultWithOptions:withHandler:", 0, a3);
}

- (void)longInactivityPredictionResultWithOptions:(int64_t)a3 withHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v6 = a4;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87___OSInactivityPredictionClient_longInactivityPredictionResultWithOptions_withHandler___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v9[4] = a3;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "longInactivityPredictionResultWithOptions:withHandler:", a3, v6);

}

- (void)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  int64_t v17;
  double v18;

  v10 = a3;
  v11 = a6;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __116___OSInactivityPredictionClient_longInactivityPredictionResultAtDate_withTimeSinceInactive_withOptions_withHandler___block_invoke;
  v15[3] = &unk_1E7D7BB48;
  v16 = v10;
  v17 = a5;
  v18 = a4;
  v13 = v10;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "longInactivityPredictionResultAtDate:withTimeSinceInactive:withOptions:withHandler:", v13, a5, v11, a4);

}

- (void)fixModelOutput:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_127);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fixModelOutput:withHandler:", v7, v6);

}

- (void)unfixModelOutputWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_128);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unfixModelOutputWithHandler:", v4);

}

- (void)overrideRecommendedWaitTimeTo:(double)a3 withHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_129);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "overrideRecommendedWaitTimeTo:withHandler:", v6, a3);

}

- (void)restoreRecommendedWaitTimeWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_130);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "restoreRecommendedWaitTimeWithHandler:", v4);

}

- (void)restoreInactivityModelWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_131);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "restoreInactivityModelWithHandler:", v4);

}

- (void)backedUpDataWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_OSInactivityPredictionClient validConnection](self, "validConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_132);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backedUpDataWithHandler:", v4);

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
