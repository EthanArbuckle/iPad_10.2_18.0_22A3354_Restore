@implementation SCLSuppressSchoolModeAssertion

- (SCLSuppressSchoolModeAssertion)initWithExplanation:(id)a3
{
  id v4;
  SCLSuppressSchoolModeAssertion *v5;
  SCLSuppressSchoolModeAssertion *v6;
  uint64_t v7;
  NSString *explanation;
  uint64_t v9;
  NSUUID *UUID;
  uint64_t v11;
  NSXPCConnection *connection;
  NSXPCConnection *v13;
  void *v14;
  NSXPCConnection *v15;
  uint64_t v16;
  NSXPCConnection *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SCLSuppressSchoolModeAssertion;
  v5 = -[SCLSuppressSchoolModeAssertion init](&v24, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_state = 0;
    v7 = objc_msgSend(v4, "copy");
    explanation = v6->_explanation;
    v6->_explanation = (NSString *)v7;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v9 = objc_claimAutoreleasedReturnValue();
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v9;

    v6->_lock._os_unfair_lock_opaque = 0;
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", 0x24E29CE48, 0);
    connection = v6->_connection;
    v6->_connection = (NSXPCConnection *)v11;

    v13 = v6->_connection;
    SCLSuppressSchoolModeAssertionXPCServerInterface();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v13, "setRemoteObjectInterface:", v14);

    objc_initWeak(&location, v6);
    v15 = v6->_connection;
    v16 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __54__SCLSuppressSchoolModeAssertion_initWithExplanation___block_invoke;
    v21[3] = &unk_24E29B8C0;
    objc_copyWeak(&v22, &location);
    -[NSXPCConnection setInterruptionHandler:](v15, "setInterruptionHandler:", v21);
    v17 = v6->_connection;
    v19[0] = v16;
    v19[1] = 3221225472;
    v19[2] = __54__SCLSuppressSchoolModeAssertion_initWithExplanation___block_invoke_2;
    v19[3] = &unk_24E29B8C0;
    objc_copyWeak(&v20, &location);
    -[NSXPCConnection setInvalidationHandler:](v17, "setInvalidationHandler:", v19);
    -[NSXPCConnection resume](v6->_connection, "resume");
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __54__SCLSuppressSchoolModeAssertion_initWithExplanation___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionInterrupted");

}

void __54__SCLSuppressSchoolModeAssertion_initWithExplanation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionInvalidated");

}

- (BOOL)isValid
{
  SCLSuppressSchoolModeAssertion *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_state == 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)description
{
  os_unfair_lock_s *p_lock;
  unint64_t state;
  __CFString *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  state = self->_state;
  os_unfair_lock_unlock(p_lock);
  if (state > 2)
    v5 = 0;
  else
    v5 = off_24E29B9C0[state];
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSuppressSchoolModeAssertion explanation](self, "explanation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@ %p (%@); %@>"), v8, self, v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state != 2)
  {
    self->_state = 2;
    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)acquireWithInvalidationHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSXPCConnection *connection;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSUUID *UUID;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  NSObject *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  SCLSuppressSchoolModeAssertion *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = _os_activity_create(&dword_21E4AD000, "Acquire suppression assertion async", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  scl_framework_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = self;
    _os_log_impl(&dword_21E4AD000, v6, OS_LOG_TYPE_DEFAULT, "Acquiring suppression assertion %@", buf, 0xCu);
  }

  connection = self->_connection;
  v8 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __65__SCLSuppressSchoolModeAssertion_acquireWithInvalidationHandler___block_invoke;
  v18[3] = &unk_24E29B8E8;
  v9 = v4;
  v18[4] = self;
  v19 = v9;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSuppressSchoolModeAssertion explanation](self, "explanation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UUID = self->_UUID;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __65__SCLSuppressSchoolModeAssertion_acquireWithInvalidationHandler___block_invoke_2;
  v15[3] = &unk_24E29B910;
  v15[4] = self;
  v13 = v5;
  v16 = v13;
  v14 = v9;
  v17 = v14;
  objc_msgSend(v10, "acquireWithExplanation:UUID:completion:", v11, UUID, v15);

  os_activity_scope_leave(&state);
}

uint64_t __65__SCLSuppressSchoolModeAssertion_acquireWithInvalidationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

void __65__SCLSuppressSchoolModeAssertion_acquireWithInvalidationHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_activity_scope_state_s v8;

  v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v6 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    *(_QWORD *)(v6 + 32) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    v8.opaque[0] = 0;
    v8.opaque[1] = 0;
    os_activity_scope_enter(*(os_activity_t *)(a1 + 40), &v8);
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 8));
    v8.opaque[0] = 0;
    v8.opaque[1] = 0;
    os_activity_scope_enter(*(os_activity_t *)(a1 + 40), &v8);
    scl_framework_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __65__SCLSuppressSchoolModeAssertion_acquireWithInvalidationHandler___block_invoke_2_cold_1((_QWORD *)(a1 + 32), (uint64_t)v5, v7);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  os_activity_scope_leave(&v8);

}

- (BOOL)acquireWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSXPCConnection *connection;
  void *v9;
  void *v10;
  NSUUID *UUID;
  NSObject *v12;
  BOOL v13;
  _QWORD v15[7];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = _os_activity_create(&dword_21E4AD000, "Acquire suppression assertion sync", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  scl_framework_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_21E4AD000, v6, OS_LOG_TYPE_DEFAULT, "Acquiring suppression assertion %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v7 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __51__SCLSuppressSchoolModeAssertion_acquireWithError___block_invoke;
  v16[3] = &unk_24E29B938;
  v16[4] = &buf;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSuppressSchoolModeAssertion explanation](self, "explanation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UUID = self->_UUID;
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __51__SCLSuppressSchoolModeAssertion_acquireWithError___block_invoke_2;
  v15[3] = &unk_24E29B960;
  v15[5] = &v17;
  v15[6] = &buf;
  v15[4] = self;
  objc_msgSend(v9, "acquireWithExplanation:UUID:completion:", v10, UUID, v15);

  if (!*((_BYTE *)v18 + 24))
  {
    scl_framework_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SCLSuppressSchoolModeAssertion acquireWithError:].cold.1((uint64_t)self, (uint64_t)&buf + 8, v12);

  }
  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  v13 = *((_BYTE *)v18 + 24) != 0;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);
  return v13;
}

void __51__SCLSuppressSchoolModeAssertion_acquireWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __51__SCLSuppressSchoolModeAssertion_acquireWithError___block_invoke_2(_QWORD *a1, int a2, void *a3)
{
  id v6;

  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  if (a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
    *(_QWORD *)(a1[4] + 32) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));
  }

}

- (void)connectionInterrupted
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_error_impl(&dword_21E4AD000, a2, OS_LOG_TYPE_ERROR, "Suppression connection interrupted - needs reconnect = %{BOOL}d", (uint8_t *)v2, 8u);
}

- (void)connectionInvalidated
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21E4AD000, log, OS_LOG_TYPE_ERROR, "Suppression connection invalidated. Further attempts to acquire suppression assertion will fail.", v1, 2u);
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

void __65__SCLSuppressSchoolModeAssertion_acquireWithInvalidationHandler___block_invoke_2_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_21E4AD000, a2, a3, "Could not acquire assertion - %@ %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x24BDAC8D0]);
}

- (void)acquireWithError:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *(_QWORD *)(*(_QWORD *)a2 + 40);
  OUTLINED_FUNCTION_0(&dword_21E4AD000, a2, a3, "Could not acquire assertion - %@ %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x24BDAC8D0]);
}

@end
