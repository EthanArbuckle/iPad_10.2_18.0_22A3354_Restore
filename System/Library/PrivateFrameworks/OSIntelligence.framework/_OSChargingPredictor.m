@implementation _OSChargingPredictor

- (_OSChargingPredictor)init
{
  _OSChargingPredictor *v2;
  os_log_t v3;
  OS_os_log *log;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_OSChargingPredictor;
  v2 = -[_OSChargingPredictor init](&v6, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.osintelligence", "charging");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    -[_OSChargingPredictor initConnection](v2, "initConnection");
  }
  return v2;
}

- (void)initConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *connection;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.OSIntelligence.charging"), 4096);
  connection = self->_connection;
  self->_connection = v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF8DA118);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v5);

  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38___OSChargingPredictor_initConnection__block_invoke;
  v9[3] = &unk_1E7D7B878;
  objc_copyWeak(&v10, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __38___OSChargingPredictor_initConnection__block_invoke_55;
  v7[3] = &unk_1E7D7B878;
  objc_copyWeak(&v8, &location);
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v7);
  -[NSXPCConnection resume](self->_connection, "resume");
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)handleInterruption
{
  os_unfair_lock_s *p_lock;
  NSXPCConnection *connection;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  os_unfair_lock_unlock(p_lock);
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
    -[_OSChargingPredictor initConnection](self, "initConnection");
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
  v4.super_class = (Class)_OSChargingPredictor;
  -[_OSChargingPredictor dealloc](&v4, sel_dealloc);
}

+ (id)predictor
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (BOOL)longChargeExpected
{
  return -[_OSChargingPredictor longChargeExpectedWithConfidence:](self, "longChargeExpectedWithConfidence:", 0.75);
}

- (BOOL)longChargeExpectedWithConfidence:(double)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  BOOL v8;

  -[_OSChargingPredictor chargePredictionOutputOfScheme:withError:](self, "chargePredictionOutputOfScheme:withError:", 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "confidence"), v6 > a3))
  {
    objc_msgSend(v5, "chargingDuration");
    v8 = v7 > 1800.0;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (double)predictedChargeDuration
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[_OSChargingPredictor chargePredictionOutputOfScheme:withError:](self, "chargePredictionOutputOfScheme:withError:", 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = 0.0;
  if (v2 && objc_msgSend(v2, "meetsSystemConfidenceThreshold"))
  {
    objc_msgSend(v3, "chargingDuration");
    v4 = v5;
  }

  return v4;
}

- (id)chargePredictionOutputOfScheme:(unint64_t)a3 withError:(id *)a4
{
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[8];
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  -[_OSChargingPredictor validConnection](self, "validConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65___OSChargingPredictor_chargePredictionOutputOfScheme_withError___block_invoke;
  v14[3] = &unk_1E7D7B8A0;
  v14[5] = &v15;
  v14[6] = a2;
  v14[4] = self;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __65___OSChargingPredictor_chargePredictionOutputOfScheme_withError___block_invoke_59;
  v13[3] = &unk_1E7D7B8C8;
  v13[4] = self;
  v13[5] = &v21;
  v13[6] = &v15;
  v13[7] = a2;
  objc_msgSend(v10, "chargeDurationPredictionOfScheme:withHandler:", a3, v13);

  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v11 = (id)v22[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

- (double)timeUntilNextExpectedPlugin
{
  double result;

  -[_OSChargingPredictor timeUntilNextExpectedPluginWithConfidence:](self, "timeUntilNextExpectedPluginWithConfidence:", 0.75);
  return result;
}

- (double)timeUntilNextExpectedPluginWithConfidence:(double)a3
{
  return 0.0;
}

- (BOOL)isDeepDischargeExpected
{
  return 0;
}

- (int)expectedMinimumDischarge
{
  return 20;
}

- (id)fixModelOutput:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[_OSChargingPredictor validConnection](self, "validConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __39___OSChargingPredictor_fixModelOutput___block_invoke;
  v11[3] = &unk_1E7D7B8F0;
  v11[4] = self;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __39___OSChargingPredictor_fixModelOutput___block_invoke_61;
  v10[3] = &unk_1E7D7B918;
  v10[4] = &v12;
  objc_msgSend(v7, "fixModelOutput:withHandler:", v4, v10);

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (void)fixModelOutput:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v6 = a4;
  v7 = a3;
  -[_OSChargingPredictor validConnection](self, "validConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51___OSChargingPredictor_fixModelOutput_withHandler___block_invoke;
  v10[3] = &unk_1E7D7B8F0;
  v10[4] = self;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fixModelOutput:withHandler:", v7, v6);

}

- (id)unfixModelOutput
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  -[_OSChargingPredictor validConnection](self, "validConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40___OSChargingPredictor_unfixModelOutput__block_invoke;
  v9[3] = &unk_1E7D7B8F0;
  v9[4] = self;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __40___OSChargingPredictor_unfixModelOutput__block_invoke_63;
  v8[3] = &unk_1E7D7B918;
  v8[4] = &v10;
  objc_msgSend(v5, "unfixModelOutputWithHandler:", v8);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (void)unfixModelOutputWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  -[_OSChargingPredictor validConnection](self, "validConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52___OSChargingPredictor_unfixModelOutputWithHandler___block_invoke;
  v7[3] = &unk_1E7D7B8F0;
  v7[4] = self;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unfixModelOutputWithHandler:", v4);

}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
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
  objc_storeStrong((id *)&self->_log, 0);
}

@end
