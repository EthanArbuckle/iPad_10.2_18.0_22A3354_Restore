@implementation TUAudioController

void __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_acquireLock");
  if (**(_QWORD **)(a1 + 64) <= *(_QWORD *)(a1 + 72))
  {
    TUDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke_cold_5();

    objc_msgSend(*(id *)(a1 + 32), "_releaseLock");
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_acquireLock");
    if (**(_QWORD **)(a1 + 64) <= *(_QWORD *)(a1 + 72))
    {
      TUDefaultLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke_cold_4();

      v6 = TUObjectsAreEqualOrNil((unint64_t)v2, **(_QWORD **)(a1 + 80));
      TUDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v6 & 1) != 0)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke_cold_3();

        objc_msgSend(*(id *)(a1 + 32), "_releaseLock");
        objc_msgSend(*(id *)(a1 + 32), "_acquireLock");
        **(_BYTE **)(a1 + 88) = 0;
        objc_msgSend(*(id *)(a1 + 32), "_releaseLock");
      }
      else
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v9 = **(_QWORD **)(a1 + 80);
          *(_DWORD *)buf = 138412546;
          v20 = v9;
          v21 = 2112;
          v22 = v2;
          _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Requested value is different from cached value (cached = %@, current = %@)", buf, 0x16u);
        }

        objc_storeStrong(*(id **)(a1 + 80), v2);
        objc_msgSend(*(id *)(a1 + 32), "_releaseLock");
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke_10;
        v14[3] = &unk_1E38A1768;
        v10 = *(id *)(a1 + 40);
        v11 = *(_QWORD *)(a1 + 32);
        v15 = v10;
        v16 = v11;
        v12 = *(id *)(a1 + 48);
        v13 = *(_QWORD *)(a1 + 88);
        v17 = v12;
        v18 = v13;
        dispatch_async(MEMORY[0x1E0C80D38], v14);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_releaseLock");
      TUDefaultLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke_cold_2();

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_releaseLock");
    TUDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke_cold_1();
  }

}

- (void)_acquireLock
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_modifyingStateLock, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_releaseLock
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_modifyingStateLock);
}

- (void)_requestUpdatedValueWithBlock:(id)a3 object:(id *)a4 isRequestingPointer:(BOOL *)a5 forceNewRequest:(BOOL)a6 scheduleTimePointer:(unint64_t *)a7 notificationString:(id)a8 notificationUserInfo:(id)a9 queue:(id)a10
{
  _BOOL4 v12;
  id v16;
  id v17;
  id v18;
  NSObject *v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  unint64_t *v26;
  uint64_t v27;
  id *v28;
  BOOL *v29;

  v12 = a6;
  v16 = a3;
  v17 = a8;
  v18 = a9;
  if (!*a5 || v12)
  {
    v20 = a10;
    v21 = mach_absolute_time();
    *a7 = v21;
    *a5 = 1;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke;
    v22[3] = &unk_1E38A1790;
    v22[4] = self;
    v26 = a7;
    v27 = v21;
    v25 = v16;
    v28 = a4;
    v23 = v17;
    v24 = v18;
    v29 = a5;
    dispatch_async(v20, v22);

  }
}

- (void)_requestUpdatedValueWithBlock:(id)a3 object:(id *)a4 isRequestingPointer:(BOOL *)a5 forceNewRequest:(BOOL)a6 scheduleTimePointer:(unint64_t *)a7 notificationString:(id)a8 queue:(id)a9
{
  -[TUAudioController _requestUpdatedValueWithBlock:object:isRequestingPointer:forceNewRequest:scheduleTimePointer:notificationString:notificationUserInfo:queue:](self, "_requestUpdatedValueWithBlock:object:isRequestingPointer:forceNewRequest:scheduleTimePointer:notificationString:notificationUserInfo:queue:", a3, a4, a5, a6, a7, a8, 0, a9);
}

- (TUAudioController)init
{
  TUAudioController *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *modifyingStateLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUAudioController;
  v2 = -[TUAudioController init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_semaphore_create(1);
    modifyingStateLock = v2->_modifyingStateLock;
    v2->_modifyingStateLock = (OS_dispatch_semaphore *)v3;

  }
  return v2;
}

- (OS_dispatch_semaphore)modifyingStateLock
{
  return self->_modifyingStateLock;
}

- (void)setModifyingStateLock:(id)a3
{
  objc_storeStrong((id *)&self->_modifyingStateLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifyingStateLock, 0);
}

uint64_t __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke_10(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Posting changed notification: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 40), "_acquireLock");
  **(_BYTE **)(a1 + 56) = 0;
  return objc_msgSend(*(id *)(a1 + 40), "_releaseLock");
}

void __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_19A50D000, v0, v1, "Skipping request, newer one coming", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_19A50D000, v0, v1, "Skipping post, newer request coming", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_19A50D000, v0, v1, "Value is the same", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_19A50D000, v0, v1, "Processing post, no newer ones in the queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_19A50D000, v0, v1, "Processing request, no newer ones in the queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
