void SidecarTransferLocked(os_unfair_lock_s *a1, void *a2)
{
  os_unfair_lock_s *v3;
  void (**v4)(_QWORD);
  os_unfair_lock_s *v5;

  v3 = a1 + 4;
  v4 = a2;
  v5 = a1;
  os_unfair_lock_lock(v3);
  v4[2](v4);

  os_unfair_lock_unlock(v3);
}

void sub_2200466AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_220046A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SidecarTransferReceiverHandleMessage(void *a1, void *a2)
{
  unsigned int *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t TransferID;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id *v15;
  _BOOL4 v16;
  id *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  SidecarTransferGroup *v37;
  id *v38;
  _QWORD v39[7];
  id obj;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = atomic_load(v3 + 10);
  if (v6 < 1)
  {
    v47 = 0;
    v48 = &v47;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy_;
    v51 = __Block_byref_object_dispose_;
    v52 = 0;
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy_;
    v45 = __Block_byref_object_dispose_;
    v46 = 0;
    TransferID = SidecarMessageGetTransferID(v4);
    v38 = v3;
    v36 = v5;
    v9 = v5;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", TransferID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38[7], "objectForKey:", v10);
    v37 = (SidecarTransferGroup *)objc_claimAutoreleasedReturnValue();
    if (!v37)
    {
      if (!v38[7])
      {
        v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v12 = v38[7];
        v38[7] = v11;

        v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v14 = v38[8];
        v38[8] = v13;

      }
      v37 = -[SidecarTransferGroup initWithMessage:]([SidecarTransferGroup alloc], "initWithMessage:", v9);
      objc_msgSend(v38[8], "addObject:", v10);
      objc_msgSend(v38[7], "setObject:forKey:", v37, v10);
    }

    v15 = (id *)(v48 + 5);
    obj = (id)v48[5];
    v16 = -[SidecarTransferGroup handleMessage:error:](v37, "handleMessage:error:", v9, &obj);
    objc_storeStrong(v15, obj);
    if (v16)
    {
      if (-[SidecarTransferGroup isComplete](v37, "isComplete"))
      {
        v17 = v38;
        v18 = (void *)objc_msgSend(v17[8], "copy");
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v19 = v18;
        v20 = 0;
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, buf, 16);
        if (v21)
        {
          v22 = *(_QWORD *)v54;
          while (2)
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v54 != v22)
                objc_enumerationMutation(v19);
              v24 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
              objc_msgSend(v17[7], "objectForKey:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v25, "isComplete"))
              {

                goto LABEL_24;
              }
              if (!v20)
                v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v19, "count"));
              objc_msgSend(v20, "addObject:", v25);
              objc_msgSend(v17[8], "removeObject:", v24);
              objc_msgSend(v17[7], "removeObjectForKey:", v24);

            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, buf, 16);
            if (v21)
              continue;
            break;
          }
        }
LABEL_24:

        v28 = (void *)v42[5];
        v42[5] = (uint64_t)v20;
        goto LABEL_25;
      }
    }
    else if (!v48[5])
    {
      v26 = v9;
      v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("SidecarErrorDomain"), -1010, 0);
      if (v27)
      {
        SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v30)
        {
          v32 = v30;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v27, "domain");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v27, "code");
            objc_msgSend(v27, "localizedDescription");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543875;
            v58 = v33;
            v59 = 2048;
            v60 = v34;
            v61 = 2113;
            v62 = v35;
            _os_log_impl(&dword_220044000, v32, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

          }
        }

      }
      v28 = (void *)v48[5];
      v48[5] = (uint64_t)v27;
LABEL_25:

    }
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __SidecarTransferReceiverHandleMessage_block_invoke;
    v39[3] = &unk_24E5E0BF8;
    v39[4] = v38;
    v39[5] = &v41;
    v39[6] = &v47;
    v7 = (void *)MEMORY[0x2207DCAD0](v39);

    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(&v47, 8);

    v5 = v36;
    goto LABEL_27;
  }
  SidecarTransferMessageEnqueue(v3, v4);
  v7 = 0;
LABEL_27:

  return v7;
}

void sub_220046F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void SidecarTransferMessageEnqueue(void *a1, void *a2)
{
  id v3;
  _QWORD **AssociatedObject;
  _QWORD *v5;
  _QWORD *v6;
  id object;

  object = a1;
  v3 = a2;
  AssociatedObject = (_QWORD **)objc_getAssociatedObject(object, SidecarTransferMessageEnqueue);
  if (!AssociatedObject)
    AssociatedObject = (_QWORD **)_SidecarAssociatedQueueAlloc(object, SidecarTransferMessageEnqueue);
  v5 = malloc_type_malloc(0x10uLL, 0xE0040CF218873uLL);
  *v5 = v3;
  v5[1] = 0;
  v6 = v5 + 1;
  *AssociatedObject[1] = v5;

  AssociatedObject[1] = v6;
}

uint64_t __Block_byref_object_copy__60(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x2207DCAD0](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__61(uint64_t a1)
{

}

uint64_t SidecarTransferSenderSliceData(void *a1)
{
  os_unfair_lock_s *v1;
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v1 = a1;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __SidecarTransferSenderSliceData_block_invoke;
  v4[3] = &unk_24E5E0C48;
  v4[4] = v1;
  v4[5] = &v5;
  SidecarTransferLocked(v1, v4);
  v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_220047630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SidecarTransferSenderSetMessageData(void *a1, void *a2)
{
  id v3;
  os_unfair_lock_s *v4;
  _QWORD v5[6];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __SidecarTransferSenderSetMessageData_block_invoke;
  v5[3] = &unk_24E5E1640;
  v5[4] = a1;
  v5[5] = a2;
  v3 = a2;
  v4 = a1;
  SidecarTransferLocked(v4, v5);

}

void SidecarTransferSendMessage(void *a1, void *a2)
{
  id v3;
  os_unfair_lock_s *v4;
  _QWORD v5[6];

  v3 = a2;
  v4 = a1;
  SidecarMessageSetRequestID(v3, -[os_unfair_lock_s requestID](v4, "requestID"));
  SidecarMessageSetTransferID(v3, -[os_unfair_lock_s transferID](v4, "transferID"));
  SidecarMessageSetType(v3, -[os_unfair_lock_s type](v4, "type"));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __SidecarTransferSendMessage_block_invoke;
  v5[3] = &unk_24E5E1640;
  v5[4] = v4;
  v5[5] = v3;
  SidecarTransferLocked(v4, v5);

}

void __SidecarTransferSendMessage(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v6[5];

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = ____SidecarTransferSendMessage_block_invoke;
  v6[3] = &unk_24E5E1100;
  v6[4] = v4;
  objc_msgSend(v5, "sendMessage:completion:", v3, v6);

}

void sub_220048174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220048238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2200483DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2200485E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220048730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220048960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_220048AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_220048C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2200491E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void SidecarRequestFinish(void *a1, void *a2)
{
  unint64_t *v3;
  id v4;
  void *v5;
  unint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  unint64_t *v14;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = v3 + 14;
  v7 = atomic_load(v3 + 14);
  if (v7 <= 2)
  {
    do
    {
      v8 = __ldaxr(v6);
      if (v8 != v7)
      {
        __clrex();
        goto LABEL_8;
      }
    }
    while (__stlxr(3uLL, v6));
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __SidecarRequestFinish_block_invoke;
    v12 = &unk_24E5E1640;
    v13 = v4;
    v14 = v3;
    if (v4)
    {
      objc_msgSend(v3, "willChangeValueForKey:", CFSTR("error"), v9, v10, v11, v12, v13, v14);
      __SidecarRequestFinish_block_invoke((uint64_t)&v9);
      objc_msgSend(v3, "didChangeValueForKey:", CFSTR("error"));
    }
    else
    {
      __SidecarRequestFinish_block_invoke((uint64_t)&v9);
    }
  }
LABEL_8:

}

unint64_t *SidecarRequestSetState(void *a1, int64_t a2)
{
  unint64_t *result;
  unint64_t *v4;
  int64_t v5;
  BOOL v6;
  _BOOL8 v7;

  result = a1;
  v4 = result + 14;
  do
    v5 = __ldaxr(v4);
  while (__stlxr(a2, v4));
  if (v5 <= a2 && (v5 != a2 ? (v6 = v5 < 5) : (v6 = 1), v6))
  {
    v7 = v5 != a2;

    return (unint64_t *)v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void SidecarRequestDisconnectSession(void *a1)
{
  os_unfair_lock_s *v1;
  void *v2;
  void *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v1 = a1;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__103;
  v9 = __Block_byref_object_dispose__104;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __SidecarRequestDisconnectSession_block_invoke;
  v4[3] = &unk_24E5E0C48;
  v4[4] = v1;
  v4[5] = &v5;
  SidecarTransferLocked(v1, v4);
  v2 = (void *)v6[5];
  -[os_unfair_lock_s error](v1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "closeWithError:completion:", v3, &__block_literal_global_105);

  _Block_object_dispose(&v5, 8);
}

void sub_22004990C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__103(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__104(uint64_t a1)
{

}

void sub_220049DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SidecarRequestTransferEnqueue(void *a1, void *a2)
{
  id v3;
  _QWORD **AssociatedObject;
  _QWORD *v5;
  _QWORD *v6;
  id object;

  object = a1;
  v3 = a2;
  AssociatedObject = (_QWORD **)objc_getAssociatedObject(object, SidecarRequestTransferEnqueue);
  if (!AssociatedObject)
    AssociatedObject = (_QWORD **)_SidecarAssociatedQueueAlloc(object, SidecarRequestTransferEnqueue);
  v5 = malloc_type_malloc(0x10uLL, 0xE0040CF218873uLL);
  *v5 = v3;
  v5[1] = 0;
  v6 = v5 + 1;
  *AssociatedObject[1] = v5;

  AssociatedObject[1] = v6;
}

void SidecarRequestSendMessage(void *a1, void *a2, uint64_t a3)
{
  id v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __SidecarRequestSendMessage_block_invoke;
  v6[3] = &unk_24E5E0D08;
  v6[4] = a1;
  v6[5] = 0;
  v5 = a1;
  objc_msgSend(a2, "sendMessage:completion:", a3, v6);

}

id SidecarCoreBundle()
{
  if (__SidecarCoreInit != -1)
    dispatch_once(&__SidecarCoreInit, &__block_literal_global_78);
  return (id)__SidecarCoreBundle;
}

id SidecarQueue()
{
  if (__SidecarCoreInit != -1)
    dispatch_once(&__SidecarCoreInit, &__block_literal_global_78);
  return (id)__sidecarQueue;
}

NSObject *SidecarCoreLogSubsystem(os_log_type_t type)
{
  NSObject *v1;
  NSObject *v2;
  NSObject *v3;

  v1 = atomic_load(&__SidecarCoreLogSubsystem);
  if (v1)
  {
    if (os_log_type_enabled(v1, type))
      v2 = v1;
    else
      v2 = 0;
    v3 = v2;
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id SidecarRelayConnection()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v0 = (void *)SidecarRelayConnection_connection;
  if (!SidecarRelayConnection_connection)
  {
    v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.sidecar-relay"), 0);
    v2 = (void *)SidecarRelayConnection_connection;
    SidecarRelayConnection_connection = v1;

    v3 = (void *)SidecarRelayConnection_connection;
    SidecarQueue();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setQueue:", v4);

    objc_msgSend((id)SidecarRelayConnection_connection, "setInvalidationHandler:", &__block_literal_global_162);
    objc_msgSend((id)SidecarRelayConnection_connection, "setInterruptionHandler:", &__block_literal_global_3);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25559E658);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_relayDevicesForServiceIdentifier_completion_, 0, 1);

    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_relayFetchRemoteDisplaySendingDeviceStatesWithCompletion_, 0, 1);

    objc_msgSend((id)SidecarRelayConnection_connection, "setRemoteObjectInterface:", v5);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25559CCC0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)SidecarRelayConnection_connection, "setExportedInterface:", v17);

    +[SidecarCoreProxy defaultProxy](SidecarCoreProxy, "defaultProxy");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)SidecarRelayConnection_connection, "setExportedObject:", v18);

    objc_msgSend((id)SidecarRelayConnection_connection, "resume");
    v0 = (void *)SidecarRelayConnection_connection;
  }
  return v0;
}

void _SidecarCoreLogAPIError(const void *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  const char *dli_sname;
  void *v7;
  uint64_t v8;
  void *v9;
  Dl_info v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  memset(&v10, 0, sizeof(v10));
  dladdr(a1, &v10);
  SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    dli_sname = v10.dli_sname;
    objc_msgSend(v3, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446979;
    v12 = dli_sname;
    v13 = 2114;
    v14 = v7;
    v15 = 2048;
    v16 = v8;
    v17 = 2113;
    v18 = v9;
    _os_log_impl(&dword_220044000, v5, OS_LOG_TYPE_ERROR, "%{public}s: %{public}@ (%ld) %{private}@", buf, 0x2Au);

  }
}

void _SidecarCoreLogObjCAPIError(void *a1, const char *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a3;
  SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "code");
    objc_msgSend(v6, "localizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544387;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    v18 = 2114;
    v19 = v11;
    v20 = 2048;
    v21 = v12;
    v22 = 2113;
    v23 = v13;
    _os_log_impl(&dword_220044000, v8, OS_LOG_TYPE_ERROR, "-[%{public}@ %{public}@]: %{public}@ (%ld) %{private}@", (uint8_t *)&v14, 0x34u);

  }
}

id SidecarRelayProxyAsync(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[6];

  v3 = a2;
  SidecarRelayConnection();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __SidecarRelayProxyAsync_block_invoke;
  v7[3] = &unk_24E5E0DC0;
  v7[4] = v3;
  v7[5] = a1;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void SidecarCoreLogAPIError(const void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (a1)
    {
      _SidecarCoreLogAPIError(a1, v3);
    }
    else
    {
      v5 = v3;
      SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "domain");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v5, "code");
        objc_msgSend(v5, "localizedDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543875;
        v12 = v8;
        v13 = 2048;
        v14 = v9;
        v15 = 2113;
        v16 = v10;
        _os_log_impl(&dword_220044000, v7, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", (uint8_t *)&v11, 0x20u);

      }
    }
  }

}

id SidecarRelayProxySync(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__171;
  v12 = __Block_byref_object_dispose__172;
  v13 = 0;
  SidecarQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __SidecarRelayProxySync_block_invoke;
  block[3] = &unk_24E5E0DE8;
  block[5] = &v8;
  block[6] = a1;
  block[4] = v3;
  dispatch_sync(v4, block);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void sub_22004B394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__171(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__172(uint64_t a1)
{

}

id SidecarDiagnose(uint64_t a1)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  _QWORD v15[5];

  SidecarRegisterStateNotification();
  if (atomic_load(&SidecarDeviceState))
  {
    v3 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __SidecarDiagnose_block_invoke;
    v15[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v15[4] = a1;
    v4 = (void *)objc_msgSend(v15, "copy");
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__171;
    v13 = __Block_byref_object_dispose__172;
    v14 = 0;
    SidecarRelayProxySync((uint64_t)SidecarDiagnose, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __SidecarDiagnose_block_invoke_2;
    v8[3] = &unk_24E5E0E30;
    v8[4] = v4;
    v8[5] = &v9;
    objc_msgSend(v5, "relayDiagnose:", v8);

    v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

  }
  else
  {
    v6 = (id)MEMORY[0x24BDBD1B8];
  }
  return v6;
}

void sub_22004B5CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t SidecarGetProcessUniqueID()
{
  unint64_t result;
  pid_t v1;
  int v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  result = atomic_load(&SidecarGetProcessUniqueID_uniqueId);
  if (!result)
  {
    v6 = 0;
    v4 = 0u;
    v5 = 0u;
    v3 = 0u;
    v1 = getpid();
    v2 = proc_pidinfo(v1, 17, 1uLL, &v3, 56);
    result = 0;
    if (v2 == 56)
    {
      result = v4;
      atomic_store(v4, &SidecarGetProcessUniqueID_uniqueId);
    }
  }
  return result;
}

void SidecarRegisterServiceProvider(void *a1)
{
  id v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = a1;
  SidecarQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __SidecarRegisterServiceProvider_block_invoke;
  block[3] = &unk_24E5E1578;
  block[4] = v1;
  dispatch_async(v2, block);

}

void SidecarServiceProviderReady(void *a1)
{
  id v1;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  v1 = a1;
  if (v1)
  {
    SidecarQueue();
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __SidecarServiceProviderReady_block_invoke;
    block[3] = &unk_24E5E1578;
    block[4] = v1;
    dispatch_async(v2, block);
  }
  else
  {
    SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    v3 = objc_claimAutoreleasedReturnValue();
    v2 = v3;
    if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220044000, v2, OS_LOG_TYPE_ERROR, "SidecarServiceProviderReady called with nil uuid.", buf, 2u);
    }
  }

}

void SidecarOptOutOfReconnect(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  v1 = a1;
  SidecarQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __SidecarOptOutOfReconnect_block_invoke;
  block[3] = &unk_24E5E1050;
  v5 = v1;
  v3 = v1;
  dispatch_async(v2, block);

}

const __CFString *SidecarSessionStateAsNSString(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("Unknown");
  else
    return off_24E5E0ED0[a1];
}

id SidecarMessageCreateMutable()
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 5);
}

id SidecarMessageGetDictionaryRepresentation(void *a1)
{
  return a1;
}

id SidecarMessageGetDefaults(void *a1)
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKey:", &unk_24E5E6898);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = (id)MEMORY[0x24BDBD1B8];

  return v2;
}

uint64_t SidecarMessageSetDefaults(void *a1, const char *a2)
{
  if (a2)
    return objc_msgSend(a1, "setObject:forKey:", a2, &unk_24E5E6898);
  else
    return objc_msgSend(a1, "removeObjectForKey:", &unk_24E5E6898);
}

id SidecarMessageGetItemData(void *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a1, "objectForKey:", &unk_24E5E68B0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void SidecarMessageSetItemData(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a1;
  v5 = a3;
  objc_msgSend(v8, "objectForKey:", &unk_24E5E68B0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v8, "setObject:forKey:", v6, &unk_24E5E68B0);
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

}

void SidecarMessageSetItemMetaData(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  v3 = a2;
  v4 = objc_msgSend(v3, "count");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v4);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
        v22[0] = &unk_24E5E68C8;
        v11 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v10, "data", v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "length"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v22[1] = &unk_24E5E68E0;
        v23[0] = v13;
        objc_msgSend(v10, "type");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v23[1] = v14;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v15);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v7);
  }

  objc_msgSend(v16, "setObject:forKey:", v5, &unk_24E5E68F8);
}

uint64_t SidecarMessageGetType(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;

  objc_msgSend(a1, "objectForKey:", &unk_24E5E6910);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = objc_msgSend(v1, "integerValue");
    if ((unint64_t)(v2 - 1) >= 4)
      v3 = 0;
    else
      v3 = v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void SidecarMessageSetType(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a1;
  objc_msgSend(v3, "numberWithInteger:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, &unk_24E5E6910);

}

id SidecarMessageGetServiceName(void *a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKey:", &unk_24E5E6928);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

uint64_t SidecarMessageSetServiceName(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setObject:forKey:", a2, &unk_24E5E6928);
}

uint64_t SidecarMessageGetRequestID(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:", &unk_24E5E6940);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = objc_msgSend(v1, "integerValue");
  else
    v2 = 0;

  return v2;
}

void SidecarMessageSetRequestID(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a1;
  objc_msgSend(v3, "numberWithInteger:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, &unk_24E5E6940);

}

uint64_t SidecarMessageGetTransferID(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:", &unk_24E5E6958);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = objc_msgSend(v1, "integerValue");
  else
    v2 = 0;

  return v2;
}

void SidecarMessageSetTransferID(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a1;
  objc_msgSend(v3, "numberWithInteger:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, &unk_24E5E6958);

}

SidecarMapTable *SidecarMapTableCreateStrong()
{
  return -[SidecarMapTable initWithKeyMask:weakObjects:]([SidecarMapTable alloc], "initWithKeyMask:weakObjects:", 0x7FFFFFFFLL, 0);
}

SidecarMapTable *SidecarMapTableCreateWeak()
{
  return -[SidecarMapTable initWithKeyMask:weakObjects:]([SidecarMapTable alloc], "initWithKeyMask:weakObjects:", 0x7FFFFFFFLL, 1);
}

uint64_t SidecarMapTableAddObject(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t Handle;
  id v6;
  uint32_t v7;
  void *v8;

  v3 = a1;
  v4 = a2;
  Handle = SidecarMapTableGetHandle((uint64_t)v3, (uint64_t)v4);
  if (!Handle)
  {
    v6 = v3;
    do
    {
      v7 = arc4random();
      Handle = v7 & 0x7FFFFFFF;
      if ((v7 & 0x7FFFFFFF) == 0)
        break;
      SidecarMapTableGetObject((uint64_t)v6, Handle);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    while (v8);

    SidecarMapTableReplaceObject(v6, Handle, v4);
  }

  return Handle;
}

uint64_t SidecarMapTableGetHandle(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 24), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0;

  return v4;
}

id SidecarMapTableGetObject(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 16);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void SidecarMapTableReplaceObject(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id *v8;

  v8 = a1;
  v5 = a3;
  v6 = SidecarMapTableRemoveObject(v8, a2);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8[3], "setObject:forKey:", v7, v5);
    objc_msgSend(v8[2], "setObject:forKey:", v5, v7);

  }
}

id SidecarMapTableRemoveObject(void *a1, uint64_t a2)
{
  id *v3;
  void *v4;
  void *v5;

  v3 = a1;
  SidecarMapTableGetObject((uint64_t)v3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3[3], "removeObjectForKey:", v4);
    objc_msgSend(v3[2], "removeObjectForKey:", v5);

  }
  return v4;
}

uint64_t SidecarMapTableGetCount(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 16), "count");
}

uint64_t SidecarMapTableRemoveAllObjects(_QWORD *a1)
{
  void *v1;
  _QWORD *v2;
  void *v3;

  v1 = (void *)a1[3];
  v2 = a1;
  objc_msgSend(v1, "removeAllObjects");
  v3 = (void *)v2[2];

  return objc_msgSend(v3, "removeAllObjects");
}

void SidecarMapTableIterateObjects(void *a1, void *a2)
{
  NSMapTable **v3;
  void (**v4)(id, uint64_t);
  uint64_t v5;
  void *value;
  void *key;
  NSMapEnumerator enumerator;

  v3 = a1;
  v4 = a2;
  memset(&enumerator, 0, sizeof(enumerator));
  NSEnumerateMapTable(&enumerator, v3[2]);
  value = 0;
  key = 0;
  while (NSNextMapEnumeratorPair(&enumerator, &key, &value))
  {
    v5 = objc_msgSend(key, "integerValue");
    if (value)
      v4[2](v4, v5);
  }
  NSEndMapTableEnumeration(&enumerator);

}

void sub_22004DEEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__438(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__439(uint64_t a1)
{

}

id SidecarDevicesForService(void *a1)
{
  id v1;
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

  v1 = a1;
  SidecarRelayProxySync((uint64_t)SidecarDevicesForService, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__438;
  v11 = __Block_byref_object_dispose__439;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __SidecarDevicesForService_block_invoke;
  v6[3] = &unk_24E5E0F40;
  v6[4] = &v7;
  objc_msgSend(v2, "relayDevicesForServiceIdentifier:completion:", v1, v6);
  v3 = (void *)v8[5];
  if (!v3)
    v3 = (void *)MEMORY[0x24BDBD1A8];
  v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

void sub_22004E2D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t SidecarDeviceGeneration()
{
  SidecarRegisterStateNotification();
  return atomic_load(&SidecarDeviceState);
}

id SidecarLocalizedString(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v9 = a1;
  SidecarCoreBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", v9, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v11, &a9);
  return v12;
}

id SidecarLocalizedWirelessString(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v9 = a1;
  if (SidecarLocalizedWirelessString_onceToken != -1)
    dispatch_once(&SidecarLocalizedWirelessString_onceToken, &__block_literal_global_552);
  if (SidecarLocalizedWirelessString_usesWAPI)
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("_WLAN"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v9;
  }
  v18 = v10;
  SidecarLocalizedString(v10, v11, v12, v13, v14, v15, v16, v17, (uint64_t)&a9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void validateXPCCoder(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char isKindOfClass;
  void *v8;
  objc_class *v9;
  void *v10;
  id v11;

  v11 = a1;
  v5 = a3;
  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v8 = (void *)MEMORY[0x24BDBCE88];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", v5, CFSTR("%@ only supports coding for XPC"), v10);

  }
}

double decodeDouble(void *a1, void *a2)
{
  id v3;
  id v4;
  double v5;
  double v6;
  double v8;

  v3 = a2;
  v4 = a1;
  if (objc_msgSend(v4, "allowsKeyedCoding"))
  {
    objc_msgSend(v4, "decodeDoubleForKey:", v3);
    v6 = v5;

  }
  else
  {
    v8 = 0.0;
    objc_msgSend(v4, "decodeValueOfObjCType:at:size:", "d", &v8, 8);

    v6 = v8;
  }

  return v6;
}

void encodeDouble(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  double v7;

  v5 = a2;
  v7 = a3;
  v6 = a1;
  if (objc_msgSend(v6, "allowsKeyedCoding"))
    objc_msgSend(v6, "encodeDouble:forKey:", v5, a3);
  else
    objc_msgSend(v6, "encodeValueOfObjCType:at:", "d", &v7);

}

uint64_t decodeInteger(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v7;

  v3 = a2;
  v4 = a1;
  if (objc_msgSend(v4, "allowsKeyedCoding"))
  {
    v5 = objc_msgSend(v4, "decodeIntegerForKey:", v3);

  }
  else
  {
    v7 = 0;
    objc_msgSend(v4, "decodeValueOfObjCType:at:size:", "q", &v7, 8);

    v5 = v7;
  }

  return v5;
}

void encodeInteger(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = a2;
  v7 = a3;
  v6 = a1;
  if (objc_msgSend(v6, "allowsKeyedCoding"))
    objc_msgSend(v6, "encodeInteger:forKey:", a3, v5);
  else
    objc_msgSend(v6, "encodeValueOfObjCType:at:", "q", &v7);

}

id decodeObject(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a1;
  if (objc_msgSend(v6, "allowsKeyedCoding"))
  {
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", a3, v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "decodeObject");
    v8 = objc_claimAutoreleasedReturnValue();

    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = (void *)v8;
    else
      v9 = 0;
    v7 = v9;
    v6 = (id)v8;
  }

  return v7;
}

void encodeObject(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = a1;
  if (objc_msgSend(v6, "allowsKeyedCoding"))
    objc_msgSend(v6, "encodeObject:forKey:", v5, v7);
  else
    objc_msgSend(v6, "encodeObject:", v5);

}

id SidecarSessionWithHandle(uint64_t a1, int a2)
{
  id v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (a2)
  {
    SidecarSessionGetFromRemoteMapTable(a1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x3032000000;
    v8 = __Block_byref_object_copy__638;
    v9 = __Block_byref_object_dispose__639;
    v10 = 0;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __SidecarSessionGetFromLocalMapTable_block_invoke;
    v4[3] = &unk_24E5E1218;
    v4[4] = &v5;
    v4[5] = a1;
    SidecarSessionWithLocalMapTable(v4);
    v3 = (id)v6[5];
    _Block_object_dispose(&v5, 8);

    return v3;
  }
}

void sub_220051598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SidecarSessionGetFromRemoteMapTable(uint64_t a1)
{
  id v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__638;
  v8 = __Block_byref_object_dispose__639;
  v9 = 0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __SidecarSessionGetFromRemoteMapTable_block_invoke;
  v3[3] = &unk_24E5E1218;
  v3[4] = &v4;
  v3[5] = a1;
  SidecarSessionWithRemoteMapTable(v3);
  v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_22005165C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__638(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__639(uint64_t a1)
{

}

void SidecarSessionWithLocalMapTable(void *a1)
{
  void (**v1)(void);

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&SidecarSessionWithMapTable_lock);
  if (!__SidecarSessionLocalMapTable)
    __SidecarSessionLocalMapTable = -[SidecarMapTable initWithKeyMask:weakObjects:]([SidecarMapTable alloc], "initWithKeyMask:weakObjects:", 0x7FFFFFFFLL, 1);
  v1[2]();
  os_unfair_lock_unlock((os_unfair_lock_t)&SidecarSessionWithMapTable_lock);

}

void SidecarSessionWithRemoteMapTable(void *a1)
{
  void (**v1)(void);

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&SidecarSessionWithMapTable_lock);
  if (!__SidecarSessionRemoteMapTable)
    __SidecarSessionRemoteMapTable = -[SidecarMapTable initWithKeyMask:weakObjects:]([SidecarMapTable alloc], "initWithKeyMask:weakObjects:", 0x7FFFFFFFLL, 0);
  v1[2]();
  os_unfair_lock_unlock((os_unfair_lock_t)&SidecarSessionWithMapTable_lock);

}

void sub_220051CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2200523B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sessionCompletion(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v5 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __sessionCompletion_block_invoke;
  v10[3] = &unk_24E5E1618;
  v11 = v5;
  v12 = a2;
  v10[4] = a1;
  v6 = v5;
  v7 = a1;
  v8 = (void *)MEMORY[0x2207DCAD0](v10);

  return v8;
}

void __sessionCompletion_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  id v5;
  id v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *log;
  _QWORD block[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = *(const char **)(a1 + 48);
    v5 = *(id *)(a1 + 32);
    v6 = v3;
    if (v5)
      v7 = v4 == 0;
    else
      v7 = 1;
    if (v7)
    {
      SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        log = v9;
        v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
        v9 = log;
        if (v10)
        {
          objc_msgSend(v6, "domain");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v6, "code");
          objc_msgSend(v6, "localizedDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543875;
          v19 = v11;
          v20 = 2048;
          v21 = v12;
          v22 = 2113;
          v23 = v13;
          _os_log_impl(&dword_220044000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

          v9 = log;
        }
      }

    }
    else
    {
      _SidecarCoreLogObjCAPIError(v5, v4, v6);
    }

  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __sessionCompletion_block_invoke_2;
    block[3] = &unk_24E5E12B0;
    v17 = *(id *)(a1 + 40);
    v16 = v3;
    dispatch_async(v8, block);

  }
}

uint64_t __sessionCompletion_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

unint64_t *SidecarSessionSetState(void *a1, int64_t a2)
{
  unint64_t *result;
  unint64_t *v4;
  int64_t v5;
  _BOOL8 v6;

  result = a1;
  v4 = result + 9;
  do
    v5 = __ldaxr(v4);
  while (__stlxr(a2, v4));
  if (v5 > a2)
  {
    __break(1u);
  }
  else
  {
    v6 = v5 != a2;

    return (unint64_t *)v6;
  }
  return result;
}

id SidecarOPACKEncode(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  int v6;

  v3 = a1;
  if (_SidecarOPACKInit_once != -1)
    dispatch_once(&_SidecarOPACKInit_once, &__block_literal_global_711);
  v6 = 0;
  v4 = (void *)_SidecarOPACKEncode(v3, 0, &v6);
  if (a2 && v6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v6, 0);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

uint64_t _SidecarOPACKStub(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = -6718;
  return 0;
}

id SidecarOPACKDecode(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  int v6;

  v3 = a1;
  if (_SidecarOPACKInit_once != -1)
    dispatch_once(&_SidecarOPACKInit_once, &__block_literal_global_711);
  v6 = 0;
  v4 = (void *)_SidecarOPACKDecode(v3, 0, &v6);
  if (a2 && v6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v6, 0);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

_QWORD *_SidecarAssociatedQueueAlloc(void *a1, const void *a2)
{
  id v3;
  _QWORD *v4;

  v3 = a1;
  v4 = malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
  *v4 = 0;
  v4[1] = v4;
  objc_setAssociatedObject(v3, a2, v4, 0);

  return v4;
}

void _SidecarAssociatedQueueDealloc(void *a1, const void *a2, _QWORD *a3)
{
  id v5;
  id object;

  v5 = a1;
  if (*a3)
  {
    __break(1u);
  }
  else
  {
    object = v5;
    free(a3);
    objc_setAssociatedObject(object, a2, 0, 0);

  }
}

void SidecarRegisterStateNotification()
{
  uint64_t v0;
  id v1;
  _QWORD v2[7];
  char v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __SidecarRegisterStateNotification_block_invoke;
  v2[3] = &unk_24E5E1320;
  v3 = 1;
  v2[5] = "com.apple.sidecar-relay.device-generation";
  v2[6] = &SidecarDeviceState;
  v2[4] = &__block_literal_global_437;
  v0 = qword_25559ACD8[0];
  v1 = &__block_literal_global_437;
  if (v0 != -1)
    dispatch_once(qword_25559ACD8, v2);

}

void SidecarUpdateStateNotification(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  uint64_t v4;
  unint64_t v5;
  uint64_t state64;

  v3 = a2;
  state64 = 0;
  notify_get_state(*(_DWORD *)(a1 + 16), &state64);
  v4 = state64;
  do
    v5 = __ldaxr((unint64_t *)a1);
  while (__stlxr(v4, (unint64_t *)a1));
  if (v3 && v5 != state64)
    v3[2](v3);

}

double SidecarAbsoluteTime()
{
  uint64_t v0;

  v0 = mach_absolute_time();
  if (SidecarTimeScale_once != -1)
    dispatch_once(&SidecarTimeScale_once, &__block_literal_global_726);
  return *(double *)&SidecarTimeScale_scale * (double)v0;
}

id filterTargetDevice(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a1;
  v6 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__803;
  v16 = __Block_byref_object_dispose__804;
  v17 = 0;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_devicesByForcingFetchFromRelay:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __filterTargetDevice_block_invoke;
  v11[3] = &unk_24E5E1468;
  v11[4] = v7;
  v11[5] = &v12;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);
  v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v9;
}

void sub_220053C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

SidecarRequest *makeRequest(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  SidecarRequest *v6;

  v3 = a1;
  v4 = a2;
  if (v4
    || (objc_msgSend(v3, "devices"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "firstObject"),
        v4 = (id)objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    v6 = -[SidecarRequest initWithService:device:]([SidecarRequest alloc], "initWithService:device:", v3, v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __Block_byref_object_copy__803(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__804(uint64_t a1)
{

}

void __filterTargetDevice_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (*a4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

BOOL __filterSupportedDevices_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "rapportVersion") >= v2;
}

void __filterDevices_block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

uint64_t isSidecarInternal()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("com.apple.sidecar.internal"));

  return v1;
}

const __CFString *SidecarDeviceVisualDetectabilityAsNSString(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("UnrecognizedValue");
  else
    return off_24E5E1488[a1];
}

void SidecarRegisterServicePresenter(void *a1)
{
  id v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = a1;
  SidecarQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __SidecarRegisterServicePresenter_block_invoke;
  block[3] = &unk_24E5E1578;
  block[4] = v1;
  dispatch_async(v2, block);

}

void SidecarServicePresenterReady(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  SidecarQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __SidecarServicePresenterReady_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v2, block);

}

void SidecarCoreLogObjCAPIError(void *a1, const char *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (v5 && a2)
    {
      _SidecarCoreLogObjCAPIError(v5, a2, v6);
    }
    else
    {
      v8 = v6;
      SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "domain");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v8, "code");
        objc_msgSend(v8, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543875;
        v15 = v11;
        v16 = 2048;
        v17 = v12;
        v18 = 2113;
        v19 = v13;
        _os_log_impl(&dword_220044000, v10, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", (uint8_t *)&v14, 0x20u);

      }
    }
  }

}

void streamCompletion(void *a1, const char *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD block[7];

  v9 = a1;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v11)
  {
    SidecarCoreLogObjCAPIError(v9, a2, v11);
    objc_msgSend(v10, "invalidate");
  }
  else if (v10)
  {
    v13 = v10;
    v14 = v9;
    SidecarSessionGetStreams(v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v13, *((_QWORD *)v13 + 1));
    objc_storeWeak((id *)v13 + 4, v14);

    objc_msgSend(v13, "rapportStream");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setStreamFlags:", objc_msgSend(v16, "streamFlags") | 4);

  }
  objc_msgSend(v9, "queue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __streamCompletion_block_invoke;
  block[3] = &unk_24E5E1710;
  block[5] = v10;
  block[6] = v12;
  block[4] = v11;
  dispatch_async(v17, block);

}

uint64_t __streamCompletion_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[6];
  if (a1[4])
    v3 = 0;
  else
    v3 = a1[5];
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

id SidecarSessionGetStreams(void *a1, int a2)
{
  id v3;
  id v4;
  BOOL v5;

  v3 = a1;
  objc_getAssociatedObject(v3, SidecarSessionGetStreams);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = 1;
  else
    v5 = a2 == 0;
  if (!v5)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_setAssociatedObject(v3, SidecarSessionGetStreams, v4, (void *)0x301);
  }

  return v4;
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t NSClassFromObject()
{
  return MEMORY[0x24BDD0B78]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSEndMapTableEnumeration(NSMapEnumerator *enumerator)
{
  MEMORY[0x24BDD0BD0](enumerator);
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x24BDD0BD8](retstr, table);
}

BOOL NSEqualSizes(NSSize aSize, NSSize bSize)
{
  return MEMORY[0x24BDD0BF0]((__n128)aSize, *(__n128 *)&aSize.height, (__n128)bSize, *(__n128 *)&bSize.height);
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x24BDD10F0](enumerator, key, value);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x24BDD11E8]();
}

NSSize NSSizeFromString(NSString *aString)
{
  double v1;
  double v2;
  NSSize result;

  MEMORY[0x24BDD1220](aString);
  result.height = v2;
  result.width = v1;
  return result;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x24BDD1270]((__n128)aSize, *(__n128 *)&aSize.height);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _NSRequestConcreteObject()
{
  return MEMORY[0x24BDD19F0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x24BDAE058](a1, a2);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uid_t getuid(void)
{
  return MEMORY[0x24BDAE788]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x24BDAF6F8](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

