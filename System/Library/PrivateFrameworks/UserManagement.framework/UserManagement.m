void sub_18FAE6D74()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ECD37F58;
  qword_1ECD37F58 = v0;

  if (qword_1ECD37F58)
    *(_QWORD *)(qword_1ECD37F58 + 8) = 0;
}

void sub_18FAE6DB0(id *a1, void *a2, int a3)
{
  const char *v6;
  id v7;
  void *v8;
  const char *v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;

  v7 = a2;
  if (a1 && !a1[28])
  {
    objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v6, (uint64_t)&unk_1EE18B610);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRemoteObjectInterface_(v7, v9, (uint64_t)v8);

    objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v10, (uint64_t)&unk_1EE188EB0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setExportedInterface_(v7, v12, (uint64_t)v11);

    objc_msgSend_setExportedObject_(v7, v13, (uint64_t)a1);
    objc_initWeak(&location, a1);
    v14 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_18FAFBDA4;
    v24[3] = &unk_1E2A4AE40;
    objc_copyWeak(&v25, &location);
    objc_msgSend_setInterruptionHandler_(v7, v15, (uint64_t)v24);
    v22[0] = v14;
    v22[1] = 3221225472;
    v22[2] = sub_18FAFC094;
    v22[3] = &unk_1E2A4AE40;
    objc_copyWeak(&v23, &location);
    objc_msgSend_setInvalidationHandler_(v7, v16, (uint64_t)v22);
    if (a3 && xpc_user_sessions_enabled())
    {
      xpc_user_sessions_get_foreground_uid();
      objc_msgSend__xpcConnection(v7, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_connection_set_target_user_session_uid();

    }
    objc_msgSend_resume(v7, v17, v18);
    objc_storeStrong(a1 + 28, a2);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

}

void sub_18FAE6FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18FAE7004(uint64_t a1, void *a2, void *a3)
{
  const char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;

  v25 = a2;
  v7 = a3;
  if (!v7)
  {
    if (v25)
    {
      if (*(_QWORD *)(a1 + 48))
      {
        **(_DWORD **)(a1 + 48) = objc_msgSend_machPort(v25, v5, v6);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        goto LABEL_8;
      }
    }
    else
    {
      sub_18FAE9AB8();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("no targetPort received from replacePersonaPortVoucher"), v9, v10, v11, v12, v13, v14, v24);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE964C((uint64_t)v8, v15);

    }
    sub_18FAE9AB8();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("INVALID CALLBACK from replacePersonaPortVoucher with null targetPortPtr"), v17, v18, v19, v20, v21, v22, v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v16, v23);

    goto LABEL_8;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
LABEL_8:

}

id sub_18FAE7120()
{
  objc_opt_self();
  if (qword_1ECD37F28 != -1)
    dispatch_once(&qword_1ECD37F28, &unk_1E2A4A6A8);
  return (id)qword_1ECD37F30;
}

void sub_18FAE7164(void *a1)
{
  const char *v1;
  uint64_t v2;
  id obj;

  if (a1)
  {
    obj = a1;
    objc_sync_enter(obj);
    if (objc_msgSend_shouldFetchAttributes(obj, v1, v2))
      sub_18FAE772C(obj, 0);
    objc_sync_exit(obj);

  }
}

void sub_18FAE71C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18FAE71DC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v10;

  if (a1)
  {
    sub_18FAE762C((uint64_t)UMLogMessage, a2, (uint64_t)&a9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C(a1, v10);

  }
}

id sub_18FAE7234()
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18FAEACE0;
  block[3] = &unk_1E2A4A848;
  block[4] = v0;
  if (qword_1ECD37F50 != -1)
    dispatch_once(&qword_1ECD37F50, block);
  return (id)qword_1ECD37F48;
}

id sub_18FAE72AC(uint64_t a1, uint64_t a2)
{
  void *v3;
  const char *v4;

  objc_opt_self();
  v3 = (void *)objc_opt_new();
  objc_msgSend_setUid_(v3, v4, a2);
  return v3;
}

id sub_18FAE72E0()
{
  const char *v0;
  void *v1;
  const char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v6 = kUMUserSessionTypeKey;
  v7[0] = kUMUserSessionManagedDevice;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v0, (uint64_t)v7, &v6, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend_mutableCopy(v1, v2, v3);

  return v4;
}

id *sub_18FAE7380(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = a2;
  objc_opt_self();
  v15 = sub_18FAE7524((id *)[UMGenerationCache alloc], v14, v13, v12, v11, v10);

  return v15;
}

void sub_18FAE742C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v10;
  id v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;

  if (a1)
  {
    v10 = (objc_class *)MEMORY[0x1E0CB3940];
    v11 = a2;
    v12 = [v10 alloc];
    v14 = (void *)objc_msgSend_initWithFormat_arguments_(v12, v13, (uint64_t)v11, &a9);

    if (v14)
      objc_msgSend_addObject_(*(void **)(a1 + 8), v15, (uint64_t)v14);

  }
}

id *sub_18FAE7524(id *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id *v17;
  uint64_t v18;
  id v19;
  objc_super v21;

  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)UMGenerationCache;
    v17 = (id *)objc_msgSendSuper2(&v21, sel_init);
    a1 = v17;
    if (v17)
    {
      objc_storeStrong(v17 + 5, a5);
      objc_storeStrong(a1 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      a1[4] = v14;
      v18 = MEMORY[0x194007B90](v16);
      v19 = a1[6];
      a1[6] = (id)v18;

      a1[7] = 0;
      a1[1] = (id)0xFFFFFFFF00000000;
    }
  }

  return a1;
}

id sub_18FAE762C(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a2;
  objc_opt_self();
  v5 = (void *)objc_opt_new();
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8 = (void *)objc_msgSend_initWithFormat_arguments_(v6, v7, (uint64_t)v4, a3);

  sub_18FAE742C((uint64_t)v5, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v8);
  return v5;
}

void sub_18FAE76B0()
{
  UMSideEffects *v0;
  void *v1;
  UMLibInfoProvider *v2;
  const char *v3;
  const char *v4;
  UMLibNotifyProvider *v5;

  v0 = objc_alloc_init(UMSideEffects);
  v1 = (void *)qword_1ECD37F30;
  qword_1ECD37F30 = (uint64_t)v0;

  v2 = objc_alloc_init(UMLibInfoProvider);
  objc_msgSend_setLibInfo_((void *)qword_1ECD37F30, v3, (uint64_t)v2);

  v5 = objc_alloc_init(UMLibNotifyProvider);
  objc_msgSend_setLibNotify_((void *)qword_1ECD37F30, v4, (uint64_t)v5);

}

BOOL sub_18FAE772C(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  _BOOL8 v13;
  id v14;
  uint64_t v15;
  char v16;
  uint64_t v18;
  id v19;

  if (!a1)
    return 0;
  v3 = a1;
  objc_sync_enter(v3);
  if ((byte_1EE184F30 & 1) != 0)
  {
    sub_18FAEA1C0();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE71DC((uint64_t)v4, CFSTR("Error: this process is not entitled to access user properties"), v5, v6, v7, v8, v9, v10, v18);

    sub_18FAEC284((uint64_t)UMError, 7uLL);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  v19 = 0;
  v13 = sub_18FAE7860((uint64_t)UMMobileKeyBag, v3, &v19);
  v14 = v19;
  v12 = v14;
  if (v14)
    v16 = v13;
  else
    v16 = 1;
  if ((v16 & 1) == 0)
  {
    if (objc_msgSend_code(v14, v11, v15) != 7)
      goto LABEL_10;
    v13 = 0;
    byte_1EE184F30 = 1;
  }
LABEL_11:
  if (a2)
    *a2 = objc_retainAutorelease(v12);
  objc_msgSend_setShouldFetchAttributes_(v3, v11, 0);

  objc_sync_exit(v3);
  return v13;
}

void sub_18FAE784C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL sub_18FAE7860(uint64_t a1, void *a2, _QWORD *a3)
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;

  v4 = a2;
  v5 = objc_opt_self();
  objc_opt_self();
  if (byte_1ECD37F68 && !objc_msgSend_uid(v4, v6, v7))
  {
    v10 = 0;
  }
  else
  {
    v8 = objc_msgSend_uid(v4, v6, v7);
    sub_18FAE8128(v5, v8, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;
    if (v9)
      sub_18FAF09D4(v5, v9, v4);

  }
  return v10;
}

id sub_18FAE7908(uint64_t a1, unint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v6 = objc_opt_self();
  if (v4)
  {
    v10 = *MEMORY[0x1E0CB3388];
    v11[0] = v4;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  sub_18FAE7A90(v6, a2, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id sub_18FAE7A90(uint64_t a1, unint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v6 = objc_opt_self();
  if (a2 > 9)
    v7 = CFSTR("An error occurred");
  else
    v7 = off_1E2A4A8D0[a2];
  v11 = *MEMORY[0x1E0CB2D50];
  v12[0] = v7;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE7F38(v6, a2, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id sub_18FAE7B78()
{
  uint64_t v0;
  uint64_t v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_opt_self();
  v0 = objc_opt_self();
  v1 = sub_18FAEBAE0(v0, 0);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EE184F90);
  if (!qword_1ECD37EF8 || objc_msgSend_uid((void *)qword_1ECD37EF8, v2, v3) != (_DWORD)v1)
  {
    sub_18FAE72AC((uint64_t)UMUser, v1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)qword_1ECD37EF8;
    qword_1ECD37EF8 = v4;

  }
  v6 = (id)qword_1ECD37EF8;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EE184F90);
  return v6;
}

void sub_18FAE7C04(uint64_t a1, void *a2, _QWORD *a3)
{
  const char *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  objc_opt_self();
  v5 = v16;
  if (v16)
  {
    if (objc_msgSend_code(v16, v4, (uint64_t)v16) == 1)
    {
      sub_18FAEA1C0();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE71DC((uint64_t)v6, CFSTR("Error: this process is not entitled to access user properties"), v7, v8, v9, v10, v11, v12, v15);

      v13 = 7;
    }
    else
    {
      v13 = 8;
    }
    v5 = v16;
    if (a3)
    {
      sub_18FAE7908((uint64_t)UMError, v13, v16);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v5 = v16;
      *a3 = v14;
    }
  }

}

void sub_18FAE7D5C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;

  v16 = a2;
  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    sub_18FAEA1C0();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote getUserSessionAttributes: %@"), v7, v8, v9, v10, v11, v12, (uint64_t)v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v6, v13);

  }
  else
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = v16;
    v6 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v15;
  }

}

id sub_18FAE7F38(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_self();
  if (v7)
    v10 = objc_msgSend_mutableCopy(v7, v8, v9);
  else
    v10 = objc_opt_new();
  v11 = (void *)v10;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = v6;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v25, v29, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v12);
        v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v12, v15, v19, (_QWORD)v25);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v11, v21, (uint64_t)v20, v19);

      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v25, v29, 16);
    }
    while (v16);
  }

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v22, (uint64_t)CFSTR("UMUserManagerErrorDomain"), a2, v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

void sub_18FAE80C8()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ECD37F70;
  qword_1ECD37F70 = v0;

}

id sub_18FAE8128(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[6];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v5 = objc_opt_self();
  sub_18FAE72E0();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v7, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v9, (uint64_t)v8, kUMUserSessionIDKey);

  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_18FAEAA10;
  v34 = sub_18FAEA9E8;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_18FAEAA10;
  v28 = sub_18FAEA9E8;
  v29 = 0;
  if (v6)
  {
    sub_18FAE7234();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAFF584(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_18FAF32AC;
    v23[3] = &unk_1E2A4A950;
    v23[4] = &v30;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v12, v14, (uint64_t)v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = sub_18FAE7D5C;
    v22[3] = &unk_1E2A4AAE0;
    v22[4] = &v30;
    v22[5] = &v24;
    objc_msgSend_getUserSessionAttributes_reply_(v15, v16, (uint64_t)v6, v22);

    v17 = (void *)v25[5];
    if (!v17)
    {
      sub_18FAE7C04(v5, (void *)v31[5], a3);
      v17 = (void *)v25[5];
    }
    v18 = v17;

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v10, *MEMORY[0x1E0CB2FE0], 22, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v31[5];
    v31[5] = v19;

    v18 = 0;
    if (a3)
      *a3 = objc_retainAutorelease((id)v31[5]);
  }
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v18;
}

void sub_18FAE8358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_18FAE867C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  id v10;
  UMPersonaMachPort *v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  _QWORD v24[7];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v10 = a3;
  objc_opt_self();
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_18FAEAA10;
  v30 = sub_18FAEA9E8;
  v31 = 0;
  v11 = [UMPersonaMachPort alloc];
  v13 = (void *)objc_msgSend_initWithMachPort_options_(v11, v12, a2, 1);
  sub_18FAE7234();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAFF584(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_18FAED658;
  v25[3] = &unk_1E2A4A950;
  v25[4] = &v26;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v15, v17, (uint64_t)v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = getpid();
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = sub_18FAE7004;
  v24[3] = &unk_1E2A4A978;
  v24[4] = &v26;
  v24[5] = &v32;
  v24[6] = a5;
  objc_msgSend_replacePersonaMachPortVoucher_withAccountID_generationSet_forPid_withReply_(v18, v20, (uint64_t)v13, v10, a4, v19, v24);

  if (a6)
  {
    v21 = (void *)v27[5];
    if (v21)
      *a6 = objc_retainAutorelease(v21);
  }
  v22 = *((unsigned __int8 *)v33 + 24);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v22;
}

void sub_18FAE8854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18FAE88F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    sub_18FAE9AB8();
    v2 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v2;
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      v10 = *(_QWORD *)(v10 + 8);
    sub_18FAE71DC(v2, CFSTR("Object was released before block was called in queue: %@"), v3, v4, v5, v6, v7, v8, v10);

  }
}

void sub_18FAE8974(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v6 = 0;
  v3 = sub_18FAE8DD0((uint64_t)UMMobileKeyBag, v2, &v6);
  v4 = v6;
  v5 = v6;
  if ((v3 & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);

}

void sub_18FAE8C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FAE8C2C(uint64_t a1, void *a2, void *a3)
{
  if (a1)
    sub_18FAE8C3C(a1, a2, a3, 1);
}

void sub_18FAE8C3C(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id location;

  v7 = a3;
  if (a1)
  {
    objc_initWeak(&location, a2);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_18FAE88F0;
    v10[3] = &unk_1E2A4A870;
    objc_copyWeak(&v12, &location);
    v10[4] = a1;
    v11 = v7;
    v8 = (void *)MEMORY[0x194007B90](v10);
    v9 = *(NSObject **)(a1 + 8);
    if (a4)
      dispatch_sync(v9, v8);
    else
      dispatch_async(v9, v8);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

id sub_18FAE8D1C()
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18FAEAD04;
  block[3] = &unk_1E2A4A848;
  block[4] = v0;
  if (qword_1ECD37F40 != -1)
    dispatch_once(&qword_1ECD37F40, block);
  return (id)qword_1ECD37F38;
}

uint64_t sub_18FAE8DD0(uint64_t a1, void *a2, _QWORD *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  const char *v64;
  UMUserPersonaContext *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  id v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  int v98;
  const char *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;

  v4 = a2;
  objc_opt_self();
  if (a3)
    *a3 = 0;
  if (!v4)
  {
    sub_18FAE9AB8();
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("dropping voucher due to nil personaUniqueString"), v74, v75, v76, v77, v78, v79, v117);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v73, v80);

LABEL_14:
    v81 = 0;
LABEL_19:
    v108 = 1;
    goto LABEL_20;
  }
  if (qword_1ECD37F00 && sub_18FAEA2D4())
  {
    sub_18FAEA1C0();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Persona generation has changed; dropping cached vouchers."),
      v6,
      v7,
      v8,
      v9,
      v10,
      v11,
      v117);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v5, v12);

    objc_msgSend_removeAllObjects((void *)qword_1ECD37F00, v13, v14);
  }
  sub_18FAE9AB8();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Adopting Voucher for accountID:%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v15, v22);

  if (qword_1ECD37F00)
  {
    objc_msgSend_allKeys((void *)qword_1ECD37F00, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25
      && (sub_18FAE9AB8(),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("AllKeys is:%@"), v27, v28, v29, v30, v31, v32, (uint64_t)v4), v33 = (void *)objc_claimAutoreleasedReturnValue(), sub_18FAE964C((uint64_t)v26, v33), v33, v26, (objc_msgSend_containsObject_(v25, v34, (uint64_t)v4) & 1) != 0))
    {
      objc_msgSend_objectForKey_((void *)qword_1ECD37F00, v35, (uint64_t)v4);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE9AB8();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("has Cache key and its value is:%@"), v38, v39, v40, v41, v42, v43, (uint64_t)v36);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE964C((uint64_t)v37, v44);

      if (v36)
      {
        sub_18FAE9AB8();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Found Cached Copy of voucher for Account:%@"), v46, v47, v48, v49, v50, v51, (uint64_t)v4);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18FAE964C((uint64_t)v45, v52);

        objc_msgSend_contextAdopt(v36, v53, v54);
        sub_18FAEA1C0();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Adopted cached Voucher for accountID:%@"), v56, v57, v58, v59, v60, v61, (uint64_t)v4);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18FAE964C((uint64_t)v55, v62);

        objc_msgSend_removeObjectForKey_((void *)qword_1ECD37F00, v63, (uint64_t)v4);
        v65 = objc_alloc_init(UMUserPersonaContext);
        if (v65)
        {
          objc_msgSend_setObject_forKey_((void *)qword_1ECD37F00, v64, (uint64_t)v65, v4);
          sub_18FAE9AB8();
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Cached personaVocuherDictionary is :%@"), v67, v68, v69, v70, v71, v72, qword_1ECD37F00);
        }
        else
        {
          sub_18FAE9AB8();
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("could not generate a cached Copy after adoption for Account:%@"), v110, v111, v112, v113, v114, v115, (uint64_t)v4);
        }
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18FAE964C((uint64_t)v66, v116);

        goto LABEL_14;
      }
    }
    else
    {
      sub_18FAE9AB8();
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("has NO Cache key"), v83, v84, v85, v86, v87, v88, v118);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE964C((uint64_t)v82, v89);

    }
  }
  sub_18FAE9AB8();
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("No Cached Copy of voucher for Account:%@, generating one from usermanagerd"), v91, v92, v93, v94, v95, v96, (uint64_t)v4);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v90, v97);

  v98 = mach_voucher_persona_self();
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v99, *MEMORY[0x1E0CB2D98], v98, 0);
  v81 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAEA1C0();
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to get existing mach voucher Port with error:%@"), v101, v102, v103, v104, v105, v106, (uint64_t)v81);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v100, v107);

  if (!v81)
    goto LABEL_19;
  if (a3)
  {
    v81 = objc_retainAutorelease(v81);
    v108 = 0;
    *a3 = v81;
  }
  else
  {
    v108 = 0;
  }
LABEL_20:

  return v108;
}

void sub_18FAE964C(uint64_t a1, void *a2)
{
  unint64_t v2;
  os_log_type_t v3;
  void **v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  os_log_type_t v8;
  NSObject *v9;
  const char *v10;
  uint32_t v11;
  int v12;
  uid_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 8);
    if (v2 >= 5)
      v3 = OS_LOG_TYPE_DEFAULT;
    else
      v3 = (0x1110020100uLL >> (8 * v2));
    v4 = a2;
    sub_18FAE9810(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE9830(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], v3);
      if (v6)
      {
        if (v7)
        {
          v12 = 67240707;
          v13 = getuid();
          v14 = 2114;
          v15 = v5;
          v16 = 2113;
          v17 = v6;
          v8 = v3;
          v9 = MEMORY[0x1E0C81028];
          v10 = "(%{public}d) %{public}@; %{private}@";
          v11 = 28;
LABEL_15:
          _os_log_impl(&dword_18FAE5000, v9, v8, v10, (uint8_t *)&v12, v11);
        }
LABEL_16:

        return;
      }
      if (!v7)
        goto LABEL_16;
      v12 = 67240450;
      v13 = getuid();
      v14 = 2114;
      v15 = v5;
      v8 = v3;
      v9 = MEMORY[0x1E0C81028];
      v10 = "(%{public}d) %{public}@";
    }
    else
    {
      if (!v6 || !os_log_type_enabled(MEMORY[0x1E0C81028], v3))
        goto LABEL_16;
      v12 = 67240451;
      v13 = getuid();
      v14 = 2113;
      v15 = v6;
      v9 = MEMORY[0x1E0C81028];
      v10 = "(%{public}d) %{private}@";
      v8 = v3;
    }
    v11 = 18;
    goto LABEL_15;
  }
}

void **sub_18FAE9810(void **a1)
{
  if (a1)
  {
    sub_18FAE9850((uint64_t)a1, a1[1]);
    a1 = (void **)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void **sub_18FAE9830(void **a1)
{
  if (a1)
  {
    sub_18FAE9850((uint64_t)a1, a1[2]);
    a1 = (void **)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id sub_18FAE9850(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v6 = v3;
  v7 = 0;
  if (a1 && v3)
  {
    if (objc_msgSend_count(v3, v4, v5))
    {
      v7 = (void *)objc_opt_new();
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v8 = v6;
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v17, v21, 16);
      if (v10)
      {
        v12 = v10;
        v13 = *(_QWORD *)v18;
        v14 = &stru_1E2A4D300;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v8);
            objc_msgSend_appendFormat_(v7, v11, (uint64_t)CFSTR("%@%@"), v14, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++), (_QWORD)v17);
            v14 = CFSTR(", ");
          }
          while (v12 != v15);
          v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v17, v21, 16);
          v14 = CFSTR(", ");
        }
        while (v12);
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

void **sub_18FAE99B4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  void **v10;
  id v11;
  const char *v12;
  void *v13;
  const char *v14;

  v9 = a2;
  objc_opt_self();
  v10 = (void **)objc_opt_new();
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13 = (void *)objc_msgSend_initWithFormat_arguments_(v11, v12, (uint64_t)v9, &a9);

  if (v13)
  {
    if (v10)
      objc_msgSend_addObject_(v10[1], v14, (uint64_t)v13);
    else
      objc_msgSend_addObject_(0, v14, (uint64_t)v13);
  }

  return v10;
}

id sub_18FAE9AB8()
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18FAEADBC;
  block[3] = &unk_1E2A4A848;
  block[4] = v0;
  if (qword_1ECD37F20 != -1)
    dispatch_once(&qword_1ECD37F20, block);
  return (id)qword_1ECD37F18;
}

UMUserPersona *sub_18FAE9B44()
{
  objc_opt_self();
  return objc_alloc_init(UMUserPersona);
}

uint64_t sub_18FAE9DE8()
{
  objc_opt_self();
  return byte_1ECD37F68;
}

__CFDictionary *UMUserTypeDeviceMode(uint64_t a1, CFErrorRef *a2)
{
  __CFDictionary *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  CFIndex v21;
  void *v22;
  uint64_t v24;
  uint32_t v25;

  v3 = sub_18FAEA954();
  v25 = 0;
  v4 = sub_18FAEA910(&v25);
  if ((_DWORD)v4)
  {
    sub_18FAEA1C0();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to get multiuser_config flags from kernel with error:%d"), v6, v7, v8, v9, v10, v11, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v5, v12);

    sub_18FAEA1C0();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v4 == 2)
      v20 = CFSTR("FAILED to UMUserTypeDeviceMode, EPERM");
    else
      v20 = CFSTR("FAILED to UMUserTypeDeviceMode, EINVAL");
    if ((_DWORD)v4 == 2)
      v21 = 1;
    else
      v21 = 22;
    sub_18FAE99B4((uint64_t)UMLogMessage, v20, v13, v14, v15, v16, v17, v18, v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v19, v22);

  }
  else
  {
    if ((v25 & 0x80000000) != 0)
    {
      CFDictionarySetValue(v3, kUMDeviceModeKey, kUMDeviceModeSharedIPad);
      CFDictionarySetValue(v3, kUMUserTypeKey, kUMUserTypeEphemeral);
      return v3;
    }
    v21 = 0;
  }
  CFDictionarySetValue(v3, kUMDeviceModeKey, kUMDeviceModeSingleUser);
  CFDictionarySetValue(v3, kUMUserTypeKey, kUMUserTypePermanent);
  if (a2 && (_DWORD)v4)
    *a2 = CFErrorCreate(0, (CFErrorDomain)*MEMORY[0x1E0C9AFD0], v21, 0);
  return v3;
}

uint64_t sub_18FAE9FB8()
{
  void *v0;
  void *v1;
  uint64_t v2;
  const char *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _QWORD v22[5];
  id v23;

  objc_opt_self();
  objc_opt_self();
  if (byte_1ECD37F68 && (byte_1EE185009 & 1) == 0)
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = sub_18FAEAA10;
    v22[4] = sub_18FAEA9E8;
    v23 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    sub_18FAE7234();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAFF584(v0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_18FAF1A58;
    v17[3] = &unk_1E2A4A950;
    v17[4] = v22;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v1, v3, (uint64_t)v17);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v2;
    v16[1] = 3221225472;
    v16[2] = sub_18FAF1AE4;
    v16[3] = &unk_1E2A4AA90;
    v16[4] = v22;
    v16[5] = &v18;
    objc_msgSend_isLoginSessionwithReply_(v4, v5, (uint64_t)v16);

    byte_1EE185008 = *((_BYTE *)v19 + 24);
    byte_1EE185009 = 1;
    sub_18FAEA1C0();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (byte_1EE185008)
      v13 = "TRUE";
    else
      v13 = "FALSE";
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("isLoginSession:%s"), v6, v7, v8, v9, v10, v11, (uint64_t)v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v12, v14);

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(v22, 8);

  }
  return byte_1EE185008;
}

void sub_18FAEA19C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id sub_18FAEA1C0()
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18FAE6D74;
  block[3] = &unk_1E2A4A848;
  block[4] = v0;
  if (qword_1ECD37F60 != -1)
    dispatch_once(&qword_1ECD37F60, block);
  return (id)qword_1ECD37F58;
}

uint64_t sub_18FAEA2D4()
{
  void *v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;

  objc_opt_self();
  sub_18FAEA8CC();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v1 = sub_18FAEA3C8((uint64_t)v0, &v12);
  v2 = v12;

  if (v2)
  {
    sub_18FAEBC90();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE71DC((uint64_t)v3, CFSTR("Failed to fetch test if generation has changed: failed to fetch new generation value: %@"), v4, v5, v6, v7, v8, v9, (uint64_t)v2);

LABEL_6:
    v10 = 1;
    goto LABEL_7;
  }
  if (v1 != qword_1EE184F38)
  {
    qword_1EE184F38 = v1;
    goto LABEL_6;
  }
  v10 = 0;
LABEL_7:

  return v10;
}

uint64_t sub_18FAEA3C8(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;

  if (!a1)
    return 0;
  if (a2)
    *a2 = 0;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  if (sub_18FAEA448(a1))
    sub_18FAEB5E0(a1);
  v4 = *(_QWORD *)(a1 + 56);
  if (!v4)
  {
    sub_18FAEBF24(a1, a2);
    v4 = *(_QWORD *)(a1 + 56);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  return v4;
}

uint64_t sub_18FAEA448(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  id v6;
  const char *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t HasPostedForToken_error;
  id v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id v22;
  int v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (*(_DWORD *)(a1 + 12) != -1)
      goto LABEL_4;
    v2 = *(id *)(a1 + 40);
    objc_msgSend_libNotify(v2, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(id *)(a1 + 24);
    *(_DWORD *)(a1 + 12) = objc_msgSend_registerCheck_(v5, v7, (uint64_t)v6);

    if (*(_DWORD *)(a1 + 12) != -1)
    {
LABEL_4:
      v8 = *(id *)(a1 + 40);
      objc_msgSend_libNotify(v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(unsigned int *)(a1 + 12);
      v22 = 0;
      HasPostedForToken_error = objc_msgSend_notificationHasPostedForToken_error_(v11, v13, v12, &v22);
      v15 = v22;

      if ((HasPostedForToken_error & 1) == 0)
      {
        if (v15)
        {
          v16 = *(id *)(a1 + 32);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = sub_18FAED604();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              v17 &= ~1u;
            if (v17)
            {
              v18 = *(_QWORD *)(a1 + 16);
              v23 = 138543362;
              v24 = v18;
              v19 = v16;
              v20 = (void *)_os_log_send_and_compose_impl();

              if (v20)
                sub_18FAED60C();
            }
            else
            {
              v20 = 0;
            }
            free(v20);
          }

          *(_QWORD *)(a1 + 56) = 0;
          goto LABEL_18;
        }
        if (!*(_QWORD *)(a1 + 56))
LABEL_18:
          HasPostedForToken_error = 1;
      }

      return HasPostedForToken_error;
    }
  }
  return 0;
}

id sub_18FAEA8CC()
{
  objc_opt_self();
  if (qword_1EE184F88 != -1)
    dispatch_once(&qword_1EE184F88, &unk_1E2A4AA00);
  return (id)qword_1EE184F58;
}

uint64_t sub_18FAEA910(uint32_t *a1)
{
  host_t v2;
  uint64_t result;
  uint32_t multiuser_flags;

  multiuser_flags = 0;
  v2 = MEMORY[0x194007968]();
  result = host_get_multiuser_config_flags(v2, &multiuser_flags);
  if (a1)
  {
    if (!(_DWORD)result)
      *a1 = multiuser_flags;
  }
  return result;
}

CFMutableDictionaryRef sub_18FAEA954()
{
  CFMutableDictionaryRef result;

  result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!result)
  {
    syslog(7, "Out of Memory!!! Dying!...so...cold....");
    exit(-1);
  }
  return result;
}

void sub_18FAEA9E8(uint64_t a1)
{

}

void sub_18FAEA9F0(uint64_t a1)
{

}

void sub_18FAEA9F8(uint64_t a1)
{

}

void sub_18FAEAA00(uint64_t a1)
{

}

void sub_18FAEAA08(uint64_t a1)
{

}

uint64_t sub_18FAEAA10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_18FAEAA20(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_18FAEAA30(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_18FAEAA40(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_18FAEAA50(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

id sub_18FAEAA80()
{
  return sub_18FAE7120();
}

void sub_18FAEAA8C()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(off_1EE184570, "sideeffect");
  v1 = (void *)qword_1EE184F78;
  qword_1EE184F78 = (uint64_t)v0;

}

void sub_18FAEAAC0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(off_1EE184570, "sideeffect");
  v1 = (void *)qword_1EE184F80;
  qword_1EE184F80 = (uint64_t)v0;

}

void sub_18FAEAAF4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(off_1EE184570, "persona");
  v1 = (void *)qword_1EE184F60;
  qword_1EE184F60 = (uint64_t)v0;

}

void sub_18FAEAB28()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(off_1EE184570, "persona");
  v1 = (void *)qword_1EE184F68;
  qword_1EE184F68 = (uint64_t)v0;

}

void sub_18FAEAB5C()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(off_1EE184570, "persona");
  v1 = (void *)qword_1EE184F70;
  qword_1EE184F70 = (uint64_t)v0;

}

void sub_18FAEAB90(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;

  v5 = a2;
  v17 = v5;
  if (a3)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2FE0];
    v10 = objc_msgSend_code(a3, v6, v7);
    objc_msgSend_errorWithDomain_code_userInfo_(v8, v11, v9, v10, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;
  }
  else
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = v5;
    v14 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v16;
  }

}

void sub_18FAEAC30()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  if (qword_1EE184FA0 != -1)
    dispatch_once(&qword_1EE184FA0, &unk_1E2A4AB28);
  v0 = (id)qword_1EE184F68;
  sub_18FAEAA80();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAE7380((uint64_t)UMGenerationCache, CFSTR("persona"), CFSTR("com.apple.mobile.usermanagerd.personageneration_changed"), v0, v3, &unk_1E2A4AA40);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1EE184F58;
  qword_1EE184F58 = v1;

}

void sub_18FAEACE0()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ECD37F48;
  qword_1ECD37F48 = v0;

}

void sub_18FAEAD04()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  NSObject *v3;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ECD37F38;
  qword_1ECD37F38 = v0;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("UMQueueServer", v3);
  sub_18FAEB11C(qword_1ECD37F38, v2);

}

void sub_18FAEAD7C()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ECD37F08;
  qword_1ECD37F08 = v0;

  if (qword_1ECD37F08)
    *(_QWORD *)(qword_1ECD37F08 + 8) = 3;
}

void sub_18FAEADBC()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ECD37F18;
  qword_1ECD37F18 = v0;

  if (qword_1ECD37F18)
    *(_QWORD *)(qword_1ECD37F18 + 8) = 2;
}

id sub_18FAEAE00(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v5 = a2;
  if (a1)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = sub_18FAEAA30;
    v27 = sub_18FAEA9F8;
    v28 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = sub_18FAEAA30;
    v21 = sub_18FAEA9F8;
    v22 = 0;
    if (a3)
      *a3 = 0;
    sub_18FAFF584(a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_18FAFFAB0;
    v16[3] = &unk_1E2A4A950;
    v16[4] = &v23;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v6, v8, (uint64_t)v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = getpid();
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = sub_18FAEAB90;
    v15[3] = &unk_1E2A4AAE0;
    v15[4] = &v23;
    v15[5] = &v17;
    objc_msgSend_fetchPersona_forPid_completionHandler_(v9, v11, (uint64_t)v5, v10, v15);

    if (a3)
    {
      v12 = (void *)v24[5];
      if (v12)
        *a3 = objc_retainAutorelease(v12);
    }
    v13 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void sub_18FAEAF90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18FAEAFB4(uint64_t a1)
{
  id v2;
  const char *v3;
  id v4;

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 224))
    {
      v2 = objc_alloc(MEMORY[0x1E0CB3B38]);
      v4 = (id)objc_msgSend_initWithMachServiceName_options_(v2, v3, (uint64_t)CFSTR("com.apple.mobile.keybagd.UserManager.xpc"), 0);
      sub_18FAE6DB0((id *)a1, v4, 1);

    }
  }
}

void sub_18FAEB11C(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

void sub_18FAEB5E0(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  int v16;
  int v17;
  uint64_t v18;
  void *v19;
  id v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(id *)(a1 + 40);
    objc_msgSend_libNotify(v2, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(unsigned int *)(a1 + 12);
    v20 = 0;
    v8 = objc_msgSend_stateForToken_error_(v5, v7, v6, &v20);
    v9 = v20;
    *(_QWORD *)(a1 + 56) = v8;

    if (*(_QWORD *)(a1 + 56))
    {
      if (qword_1EE184F98 != -1)
        dispatch_once(&qword_1EE184F98, &unk_1E2A4A668);
      v10 = (id)qword_1EE184F60;
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        goto LABEL_25;
      v11 = sub_18FAED604();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        v11 &= ~1u;
      if (v11)
      {
        v12 = *(_QWORD *)(a1 + 16);
        v13 = *(_QWORD *)(a1 + 56);
        v21 = 138543618;
        v22 = v12;
        v23 = 2048;
        v24 = v13;
        v14 = v10;
        goto LABEL_21;
      }
LABEL_23:
      v19 = 0;
LABEL_24:
      free(v19);
      goto LABEL_25;
    }
    v10 = *(id *)(a1 + 32);
    v15 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v15)
      {
        v16 = sub_18FAED604();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          v16 &= ~1u;
        if (!v16)
          goto LABEL_23;
LABEL_20:
        v18 = *(_QWORD *)(a1 + 16);
        v21 = 138543362;
        v22 = v18;
        v14 = v10;
LABEL_21:
        v19 = (void *)_os_log_send_and_compose_impl();

        if (v19)
          sub_18FAED60C();
        goto LABEL_24;
      }
    }
    else if (v15)
    {
      v17 = sub_18FAED604();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        v17 &= ~1u;
      if (!v17)
        goto LABEL_23;
      goto LABEL_20;
    }
LABEL_25:

  }
}

uint64_t sub_18FAEBAC4()
{
  objc_opt_self();
  return byte_1EE184FC0;
}

uint64_t sub_18FAEBAE0(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v41;
  uint64_t v42;
  uint32_t v43;

  objc_opt_self();
  v43 = 0;
  v3 = sub_18FAEA910(&v43);
  if ((_DWORD)v3)
  {
    v5 = v3;
    sub_18FAEA1C0();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to get multiuser_config flags from kernel with error:%d"), v7, v8, v9, v10, v11, v12, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v6, v13);

    sub_18FAEA1C0();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v5 == 2)
      v21 = CFSTR("FAILED to MKBUserTypeDeviceMode, EPERM");
    else
      v21 = CFSTR("FAILED to MKBUserTypeDeviceMode, EINVAL");
    if ((_DWORD)v5 == 2)
      v22 = 1;
    else
      v22 = 22;
    sub_18FAE99B4((uint64_t)UMLogMessage, v21, v14, v15, v16, v17, v18, v19, v42);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v20, v23);

  }
  else
  {
    v24 = v43 & 0x3FFFFFFF;
    if ((v43 & 0x80000000) != 0 || v24 > 0x1F4)
    {
      dword_1ECD37EF0 = v43 & 0x3FFFFFFF;
      return v24;
    }
    v22 = 2;
  }
  dword_1ECD37EF0 = -1;
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, *MEMORY[0x1E0CB2FE0], v22, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Could not get the foreground UID"), v26, v27, v28, v29, v30, v31, v41);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v32, CFSTR("error: %@"), v33, v34, v35, v36, v37, v38, (uint64_t)v25);
  sub_18FAEA1C0();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v39, v32);

  if (a2)
    *a2 = objc_retainAutorelease(v25);

  v24 = dword_1ECD37EF0;
  return v24;
}

id sub_18FAEBC90()
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18FAEAD7C;
  block[3] = &unk_1E2A4A848;
  block[4] = v0;
  if (qword_1ECD37F10 != -1)
    dispatch_once(&qword_1ECD37F10, block);
  return (id)qword_1ECD37F08;
}

id sub_18FAEBD08()
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18FAEBD80;
  block[3] = &unk_1E2A4A848;
  block[4] = v0;
  if (qword_1EE184FB8 != -1)
    dispatch_once(&qword_1EE184FB8, block);
  return (id)qword_1EE184FB0;
}

void sub_18FAEBD80()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  NSObject *v3;

  v0 = objc_opt_new();
  v1 = (void *)qword_1EE184FB0;
  qword_1EE184FB0 = v0;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("UMQueueClient", v3);
  sub_18FAEB11C(qword_1EE184FB0, v2);

}

id sub_18FAEBDF8()
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18FAEBE70;
  block[3] = &unk_1E2A4A848;
  block[4] = v0;
  if (qword_1EE184F08 != -1)
    dispatch_once(&qword_1EE184F08, block);
  return (id)qword_1EE184F10;
}

void sub_18FAEBE70()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  NSObject *v3;

  v0 = objc_opt_new();
  v1 = (void *)qword_1EE184F10;
  qword_1EE184F10 = v0;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("UMQueueUserList", v3);
  sub_18FAEB11C(qword_1EE184F10, v2);

}

void sub_18FAEBEE8(uint64_t a1, void *a2, void *a3)
{
  if (a1)
    sub_18FAE8C3C(a1, a2, a3, 0);
}

uint64_t sub_18FAEBEF8(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

BOOL sub_18FAEBF10(_BOOL8 result)
{
  if (result)
    return *(_QWORD *)(result + 56) == 0;
  return result;
}

void sub_18FAEBF24(uint64_t a1, _QWORD *a2)
{
  _QWORD *v4;
  uint64_t (*v5)(void);
  _QWORD *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  void *v16;

  if (a1)
  {
    if (a2)
      *a2 = 0;
    v4 = *(_QWORD **)(a1 + 48);
    v5 = (uint64_t (*)(void))v4[2];
    v6 = v4;
    v7 = v5();
    v8 = 0;
    *(_QWORD *)(a1 + 56) = v7;

    if (*(_QWORD *)(a1 + 56))
    {
      if (qword_1EE184F98 != -1)
        dispatch_once(&qword_1EE184F98, &unk_1E2A4A668);
      v9 = (id)qword_1EE184F60;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = sub_18FAED604();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          v10 &= ~1u;
        if (v10)
        {
          v11 = v9;
          v12 = (void *)_os_log_send_and_compose_impl();

          if (v12)
            sub_18FAED60C();
        }
        else
        {
          v12 = 0;
        }
        free(v12);
      }

    }
    else
    {
      v13 = *(id *)(a1 + 32);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = sub_18FAED604();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          v14 &= ~1u;
        if (v14)
        {
          v15 = v13;
          v16 = (void *)_os_log_send_and_compose_impl();

          if (v16)
            sub_18FAED60C();
        }
        else
        {
          v16 = 0;
        }
        free(v16);
      }

      if (a2)
        *a2 = objc_retainAutorelease(v8);
    }

  }
}

uint64_t sub_18FAEC1B8(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

uint64_t sub_18FAEC1C4(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 12);
  return result;
}

uint64_t sub_18FAEC1D0(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

uint64_t sub_18FAEC1DC(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

uint64_t sub_18FAEC1E8(uint64_t result, int a2)
{
  if (result)
    *(_DWORD *)(result + 12) = a2;
  return result;
}

uint64_t sub_18FAEC1F4(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

uint64_t sub_18FAEC200(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

uint64_t sub_18FAEC20C(uint64_t result, uint64_t a2)
{
  if (result)
    *(_QWORD *)(result + 56) = a2;
  return result;
}

uint64_t sub_18FAEC218(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

uint64_t sub_18FAEC224(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 8);
  return result;
}

uint64_t sub_18FAEC230(uint64_t result, int a2)
{
  if (result)
    *(_DWORD *)(result + 8) = a2;
  return result;
}

id sub_18FAEC284(uint64_t a1, unint64_t a2)
{
  uint64_t v3;

  v3 = objc_opt_self();
  return sub_18FAE7A90(v3, a2, 0);
}

BOOL UMUserSessionSetSecureBackupBlob(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  _BOOL8 v6;
  id v7;
  id v10;

  sub_18FAE7234();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = sub_18FB02438(v5, a2, &v10);
  v7 = v10;

  if (a3)
  {
    if (!v6 && v7 != 0)
      *a3 = v7;
  }

  return v6;
}

BOOL UMUserSessionRetrieveSecureBackupBlob(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  id v11;

  sub_18FAE7234();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  sub_18FB026BC(v5, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;

  if (a2 && (v8 = v6) != 0 || a3 && (!v6 ? (v9 = v7 == 0) : (v9 = 1), v8 = v7, a2 = a3, !v9))
    *a2 = v8;

  return v6 != 0;
}

BOOL UMUserSessionDeleteSecureBackupBlob(uint64_t a1, _QWORD *a2)
{
  void *v3;
  _BOOL8 v4;
  id v5;
  id v8;

  sub_18FAE7234();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v4 = sub_18FB0294C(v3, &v8);
  v5 = v8;

  if (a2)
  {
    if (!v4 && v5 != 0)
      *a2 = v5;
  }

  return v4;
}

BOOL UMUserSessionIsLoginWindow(uint64_t a1, _QWORD *a2)
{
  void *v3;
  _BOOL8 v4;
  id v5;
  id v8;

  sub_18FAE7234();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v4 = sub_18FB030AC((uint64_t)v3, &v8);
  v5 = v8;

  if (a2)
  {
    if (!v4 && v5 != 0)
      *a2 = v5;
  }

  return v4;
}

void *UMUserSessionConfigureLoginWindow(const __CFDictionary *a1, _QWORD *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v10;

  if (a1 && CFDictionaryContainsKey(a1, kUMUserSessionTotalUsers))
    v4 = sub_18FAECB70(a1, kUMUserSessionTotalUsers);
  else
    v4 = 0xFFFFFFFFLL;
  sub_18FAE7234();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  sub_18FB02BB0(v5, v4, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;

  if (v6)
  {
    v8 = v6;
  }
  else if (a2 && v7)
  {
    *a2 = v7;
  }

  return v6;
}

BOOL UMUserSessionSwitchToLoginWindow(uint64_t a1, _QWORD *a2)
{
  void *v3;
  _BOOL8 v4;
  id v5;
  id v8;

  sub_18FAE7234();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v4 = sub_18FB02E48(v3, &v8);
  v5 = v8;

  if (a2)
  {
    if (!v4 && v5 != 0)
      *a2 = v5;
  }

  return v4;
}

uint64_t UMForegroundUserSessionID(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v6;

  sub_18FAE7234();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v3 = sub_18FB0313C((uint64_t)v2, &v6);
  v4 = v6;

  if (a1 && v4)
    *a1 = v4;

  return v3;
}

void *UMUserSessionLoadWithPasscode(void *a1, void *a2, _QWORD *a3)
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v11;

  sub_18FAE7234();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  sub_18FB03438((uint64_t)v6, a1, a2, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;

  if (v7)
  {
    v9 = v7;
  }
  else if (a3 && v8)
  {
    *a3 = v8;
  }

  return v7;
}

uint64_t UMCurrentSyncBubbleSessionID(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v6;

  sub_18FAE7234();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v3 = sub_18FB034EC(v2, &v6);
  v4 = v6;

  if (a1 && v4)
    *a1 = v4;

  return v3;
}

void *UMUserSessionListSyncMachServices(void *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v9;

  sub_18FAE7234();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  sub_18FB03754(v4, a1, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;

  if (v5)
  {
    v7 = v5;
  }
  else if (a2 && v6)
  {
    *a2 = v6;
  }
  if (a2 && v6)
    *a2 = v6;

  return v5;
}

BOOL UMUserSessionIsLoginSession(uint64_t a1, _QWORD *a2)
{
  void *v3;
  _BOOL8 v4;
  id v5;
  id v7;

  sub_18FAE7234();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v4 = sub_18FB03A54(v3, &v7);
  v5 = v7;

  if (v5)
    *a2 = v5;

  return v4;
}

void *UMUserSessionForegroundSession(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v8;

  sub_18FAE7234();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  sub_18FB03150(v3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (v4)
  {
    v6 = v4;
  }
  else if (a2 && v5)
  {
    *a2 = v5;
  }

  return v4;
}

void *UMUserSessionAttributes(void *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v9;

  sub_18FAE7234();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  sub_18FB03CB4(v4, a1, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;

  if (a2 && v6)
    *a2 = v6;
  if (v5)
    v7 = v5;

  return v5;
}

BOOL UMUserSessionSwitchWithBlob(void *a1, void *a2, _QWORD *a3)
{
  void *v6;
  _BOOL8 v7;
  id v8;
  id v10;

  sub_18FAE7234();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v7 = sub_18FB03FB0(v6, a1, a2, &v10);
  v8 = v10;

  if (a3 && !v7)
    *a3 = v8;

  return v7;
}

uint64_t UMUserSessionDataMigrationSetup(void *a1, void *a2, _QWORD *a3)
{
  void *v6;
  uint64_t v7;
  id v8;
  BOOL v9;
  id v11;

  sub_18FAE7234();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = sub_18FB042B0((uint64_t)v6, a1, a2, &v11);
  v8 = v11;

  if (a3)
  {
    if ((_DWORD)v7)
      v9 = 1;
    else
      v9 = v8 == 0;
    if (!v9)
      *a3 = v8;
  }

  return v7;
}

const void *sub_18FAECB00(const __CFDictionary *a1, const void *a2)
{
  const void *result;
  const void *v3;
  CFTypeID v4;

  result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    v3 = result;
    v4 = CFGetTypeID(result);
    if (v4 == CFDataGetTypeID())
      return v3;
    else
      return 0;
  }
  return result;
}

const void *sub_18FAECB38(const __CFDictionary *a1, const void *a2)
{
  const void *result;
  const void *v3;
  CFTypeID v4;

  result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    v3 = result;
    v4 = CFGetTypeID(result);
    if (v4 == CFArrayGetTypeID())
      return v3;
    else
      return 0;
  }
  return result;
}

uint64_t sub_18FAECB70(const __CFDictionary *a1, const void *a2)
{
  uint64_t v2;
  const __CFNumber *Value;
  const __CFNumber *v4;
  CFTypeID v5;
  unsigned int valuePtr;

  v2 = 0xFFFFFFFFLL;
  valuePtr = -1;
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    v4 = Value;
    v5 = CFGetTypeID(Value);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
      return valuePtr;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return v2;
}

uint64_t sub_18FAECBD8(const __CFDictionary *a1, const void *a2)
{
  uint64_t v2;
  const __CFNumber *Value;
  const __CFNumber *v4;
  CFTypeID v5;
  uint64_t valuePtr;

  v2 = -1;
  valuePtr = -1;
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    v4 = Value;
    v5 = CFGetTypeID(Value);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberLongLongType, &valuePtr);
      return valuePtr;
    }
    else
    {
      return -1;
    }
  }
  return v2;
}

uint64_t sub_18FAECC40(const __CFDictionary *a1, const void *a2)
{
  uint64_t v2;
  const __CFNumber *Value;
  const __CFNumber *v4;
  CFTypeID v5;
  uint64_t valuePtr;

  v2 = -1;
  valuePtr = -1;
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    v4 = Value;
    v5 = CFGetTypeID(Value);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberSInt64Type, &valuePtr);
      return valuePtr;
    }
    else
    {
      return -1;
    }
  }
  return v2;
}

const __CFBoolean *sub_18FAECCA8(const __CFDictionary *a1, const void *a2)
{
  const __CFBoolean *result;
  const __CFBoolean *v3;
  CFTypeID v4;

  result = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    v3 = result;
    v4 = CFGetTypeID(result);
    if (v4 == CFBooleanGetTypeID())
      return (const __CFBoolean *)(CFBooleanGetValue(v3) != 0);
    else
      return 0;
  }
  return result;
}

const void *sub_18FAECCF8(const __CFDictionary *a1, const void *a2)
{
  const void *Value;
  const void *v3;
  CFTypeID v4;

  Value = CFDictionaryGetValue(a1, a2);
  if (!Value)
    return 0;
  v3 = Value;
  v4 = CFGetTypeID(Value);
  if (v4 != CFStringGetTypeID())
    return 0;
  return v3;
}

BOOL sub_18FAECD38(const __CFDictionary *a1, const void *a2, char *a3, int a4)
{
  const __CFString *v6;

  v6 = (const __CFString *)sub_18FAECCF8(a1, a2);
  return v6 && CFStringGetCString(v6, a3, a4, 0x8000100u);
}

CFTypeRef sub_18FAECD84(const __CFDictionary *a1, const void *a2)
{
  const void *Value;
  const void *v3;
  CFTypeID v4;

  Value = CFDictionaryGetValue(a1, a2);
  if (Value && (v3 = Value, v4 = CFGetTypeID(Value), v4 == CFDictionaryGetTypeID()))
    return CFRetain(v3);
  else
    return 0;
}

CFTypeRef sub_18FAECDD0(const void *a1)
{
  __CFWriteStream *v2;
  __CFWriteStream *v3;
  CFTypeRef v4;

  v2 = CFWriteStreamCreateWithAllocatedBuffers((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (!v2)
    return 0;
  v3 = v2;
  if (CFWriteStreamOpen(v2))
  {
    if (CFPropertyListWrite(a1, v3, kCFPropertyListBinaryFormat_v1_0, 0, 0) < 1)
      v4 = 0;
    else
      v4 = CFWriteStreamCopyProperty(v3, (CFStreamPropertyKey)*MEMORY[0x1E0C9B2A8]);
    CFWriteStreamClose(v3);
  }
  else
  {
    v4 = 0;
  }
  CFRelease(v3);
  return v4;
}

CFPropertyListRef sub_18FAECE74(UInt8 *bytes, CFIndex length)
{
  const __CFAllocator *v2;
  __CFReadStream *v3;
  __CFReadStream *v4;
  CFPropertyListRef v5;
  CFPropertyListFormat format;

  format = kCFPropertyListBinaryFormat_v1_0;
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = CFReadStreamCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], bytes, length, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  if (v3)
  {
    v4 = v3;
    if (CFReadStreamOpen(v3))
    {
      v5 = CFPropertyListCreateWithStream(v2, v4, 0, 2uLL, &format, 0);
      if (!v5)
        syslog(7, "Could not create object from stream");
      CFReadStreamClose(v4);
    }
    else
    {
      syslog(7, "Could not open the stream");
      v5 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    syslog(7, "Could not create stream for serialized data");
    return 0;
  }
  return v5;
}

const void *sub_18FAECF50(UInt8 *bytes, CFIndex length)
{
  const void *v2;
  const __CFAllocator *v4;
  __CFReadStream *v5;
  __CFReadStream *v6;
  CFPropertyListRef v7;
  CFTypeID v8;
  CFPropertyListFormat format;

  v2 = 0;
  format = kCFPropertyListBinaryFormat_v1_0;
  if (bytes && length)
  {
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v5 = CFReadStreamCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], bytes, length, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
    if (!v5)
    {
      syslog(7, "Could not create stream from serialized data");
      return 0;
    }
    v6 = v5;
    if (CFReadStreamOpen(v5))
    {
      v7 = CFPropertyListCreateWithStream(v4, v6, length, 2uLL, &format, 0);
      v2 = v7;
      if (!v7)
      {
        syslog(7, "Could not create dictionary from stream");
        goto LABEL_9;
      }
      v8 = CFGetTypeID(v7);
      if (v8 == CFDictionaryGetTypeID())
      {
LABEL_9:
        CFReadStreamClose(v6);
        CFRelease(v6);
        return v2;
      }
      CFRelease(v2);
    }
    else
    {
      syslog(7, "Could not open the stream");
    }
    v2 = 0;
    goto LABEL_9;
  }
  return v2;
}

const void *sub_18FAED064(const char *a1)
{
  int v2;
  int v3;
  void *v4;
  ssize_t v5;
  const void *v6;
  int *v8;
  char *v9;
  int *v10;
  char *v11;
  int *v12;
  stat v13;

  memset(&v13, 0, sizeof(v13));
  v2 = open(a1, 0);
  if (v2 == -1)
  {
    v8 = __error();
    v9 = strerror(*v8);
    syslog(7, "Could not open %s: %s", a1, v9);
    v4 = 0;
    v6 = 0;
    goto LABEL_7;
  }
  v3 = v2;
  if (fstat(v2, &v13))
  {
    v10 = __error();
    v11 = strerror(*v10);
    syslog(7, "Could not fstat %s: %s", a1, v11);
    v6 = 0;
    v4 = 0;
    goto LABEL_6;
  }
  v4 = malloc_type_malloc(LODWORD(v13.st_size), 0x772E5F62uLL);
  if (!v4)
  {
    syslog(7, "Could not allocate buffer");
LABEL_12:
    v6 = 0;
    goto LABEL_6;
  }
  v5 = read(v3, v4, v13.st_size);
  if (v5 != v13.st_size)
  {
    v12 = __error();
    strerror(*v12);
    syslog(7, "Could not read %s: %s");
    goto LABEL_12;
  }
  v6 = sub_18FAECF50((UInt8 *)v4, v5);
LABEL_6:
  close(v3);
LABEL_7:
  free(v4);
  return v6;
}

CFMutableDictionaryRef sub_18FAED1AC(CFDictionaryRef theDict)
{
  CFMutableDictionaryRef result;

  result = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, theDict);
  if (!result)
  {
    syslog(7, "Out of Memory!!! Dying!...so...cold....");
    exit(-1);
  }
  return result;
}

CFMutableArrayRef sub_18FAED1F0()
{
  CFMutableArrayRef result;

  result = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  if (!result)
  {
    syslog(7, "Out of Memory!!! Dying!...so...cold....");
    exit(-1);
  }
  return result;
}

CFStringRef sub_18FAED238(char *cStr)
{
  CFStringRef result;

  result = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], cStr, 0x8000100u);
  if (!result)
  {
    syslog(7, "Out of Memory!!! Dying!...so...cold....");
    exit(-1);
  }
  return result;
}

uint64_t sub_18FAED280(mach_port_name_t name)
{
  mach_port_type_t ptype;

  ptype = 0;
  if (mach_port_type(*MEMORY[0x1E0C83DA0], name, &ptype))
    return 0;
  else
    return ptype;
}

void sub_18FAED2C0(mach_port_name_t name)
{
  kern_return_t v2;
  mach_port_type_t v3;
  BOOL v4;
  mach_port_type_t ptype;

  ptype = 0;
  v2 = mach_port_type(*MEMORY[0x1E0C83DA0], name, &ptype);
  v3 = ptype;
  if (v2)
    v4 = 1;
  else
    v4 = ptype == 0;
  if (v4)
  {
    syslog(7, "Port:%d has NORIGHTS");
    return;
  }
  if ((ptype & 0x10000) != 0)
  {
    syslog(7, "Port:%d has SENDRIGHT", name);
    if ((v3 & 0x20000) == 0)
    {
LABEL_9:
      if ((v3 & 0x40000) == 0)
        goto LABEL_10;
LABEL_14:
      syslog(7, "Port:%d has SENDONCERIGHT", name);
      if ((v3 & 0x100000) == 0)
        return;
      goto LABEL_15;
    }
  }
  else if ((ptype & 0x20000) == 0)
  {
    goto LABEL_9;
  }
  syslog(7, "Port:%d has RECEIVERIGHT", name);
  if ((v3 & 0x40000) != 0)
    goto LABEL_14;
LABEL_10:
  if ((v3 & 0x100000) != 0)
LABEL_15:
    syslog(7, "Port:%d has DEADNAME");
}

uint64_t sub_18FAED398()
{
  size_t __len;
  char __big[1024];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  __len = 1023;
  bzero(__big, 0x400uLL);
  if (sysctlbyname("kern.bootargs", __big, &__len, 0, 0) || strnstr(__big, "um-migration-debug=0", __len))
    return 0;
  if (strnstr(__big, "um-migration-debug=1", __len))
    return 1;
  if (strnstr(__big, "um-migration-debug=2", __len))
    return 2;
  if (strnstr(__big, "um-migration-debug=3", __len))
    return 3;
  if (strnstr(__big, "um-migration-debug=4", __len))
    return 4;
  if (strnstr(__big, "um-migration-debug=5", __len))
    return 5;
  if (strnstr(__big, "um-migration-debug=100", __len))
    return 100;
  if (strnstr(__big, "um-migration-debug=101", __len))
    return 101;
  return 0;
}

void sub_18FAED518(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v9 = a2;
  objc_opt_self();
  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  v12 = objc_msgSend_initWithFormat_arguments_(v10, v11, (uint64_t)v9, &a9);
  sub_18FAF6BA8();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v13, CFSTR("%@"), v14, v15, v16, v17, v18, v19, v12);

  abort();
}

void sub_18FAED58C(uint64_t a1, void *a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v4 = a3;
  v7 = objc_opt_self();
  if (v14 && objc_msgSend_code(v14, v5, v6) == 1)
    sub_18FAED518(v7, CFSTR("You do not have the correct entitlements for operation: %@"), v8, v9, v10, v11, v12, v13, (uint64_t)v4);

}

uint64_t sub_18FAED604()
{
  return 1;
}

void sub_18FAED60C()
{
  _os_crash();
  __break(1u);
}

void sub_18FAED624(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_sharedManager(UMUserManager, a2, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userListDidUpdate(v5, v3, v4);

}

void sub_18FAED658(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

id sub_18FAED6E4(void *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const void *v11;
  id v12;
  const char *v13;
  int v14;
  void *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v25[2];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v6 = v3;
  if (a1)
  {
    if (!v3)
      goto LABEL_7;
    a1 = (void *)objc_msgSend_length(v3, v4, v5);
    if (a1)
    {
      if (pipe(v25) != -1)
      {
        v7 = v25[1];
        v8 = objc_retainAutorelease(v6);
        v11 = (const void *)objc_msgSend_bytes(v8, v9, v10);
        write(v7, v11, (size_t)a1);
        close(v25[1]);
        v12 = objc_alloc(MEMORY[0x1E0CB3608]);
        a1 = (void *)objc_msgSend_initWithFileDescriptor_closeOnDealloc_(v12, v13, v25[0], 1);
        goto LABEL_8;
      }
      v14 = *__error();
      sub_18FAEA1C0();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = strerror(v14);
      sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("failed to get fds(1) with error:%s"), v17, v18, v19, v20, v21, v22, (uint64_t)v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE964C((uint64_t)v15, v23);

LABEL_7:
      a1 = 0;
    }
  }
LABEL_8:

  return a1;
}

uint64_t sub_18FAED81C()
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18FAED894;
  block[3] = &unk_1E2A4A848;
  block[4] = v0;
  if (qword_1EE184F40 != -1)
    dispatch_once(&qword_1EE184F40, block);
  return byte_1EE184F29;
}

uint64_t sub_18FAED894()
{
  uint64_t result;
  int v1;
  uint64_t v2;
  BOOL v3;

  result = getuid();
  if (result < 0x1F6)
  {
    v3 = 0;
  }
  else
  {
    v1 = result;
    v2 = objc_opt_self();
    result = sub_18FAEBAE0(v2, 0);
    v3 = (_DWORD)result != v1;
  }
  byte_1EE184F29 = v3;
  return result;
}

uint64_t sub_18FAED8E8()
{
  uint64_t v0;

  v0 = objc_opt_self();
  return sub_18FAEBAE0(v0, 0);
}

uint64_t sub_18FAED900()
{
  objc_opt_self();
  if (qword_1EE184FD0 != -1)
    dispatch_once(&qword_1EE184FD0, &unk_1E2A4A688);
  return byte_1EE184FC8;
}

void sub_18FAED944()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    byte_1EE184FC8 = CFEqual(v0, CFSTR("Internal")) != 0;
    CFRelease(v1);
  }
}

uint64_t sub_18FAED9A0()
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18FAEDA18;
  block[3] = &unk_1E2A4A848;
  block[4] = v0;
  if (qword_1EE184FD8 != -1)
    dispatch_once(&qword_1EE184FD8, block);
  return qword_1EE184638;
}

void sub_18FAEDA18(uint64_t a1)
{
  void *v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  id v7;

  sub_18FAE8128(*(_QWORD *)(a1 + 32), 502, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v7 = v1;
    objc_msgSend_objectForKeyedSubscript_(v1, v2, kUMUserSessionTotalUsers);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    if (v3)
      qword_1EE184638 = objc_msgSend_unsignedIntegerValue(v3, v4, v5);

    v1 = v7;
  }

}

uint64_t sub_18FAEDA88()
{
  uint64_t v0;
  void *v1;
  const char *v2;
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  v0 = objc_opt_self();
  objc_opt_self();
  if (byte_1ECD37F68)
  {
    sub_18FAE8128(v0, 502, 0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v1;
    if (v1)
    {
      objc_msgSend_objectForKeyedSubscript_(v1, v2, kUMUserSessionEachUserSize);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v4;
      if (v4)
        qword_1EE184FE0 = objc_msgSend_unsignedLongLongValue(v4, v5, v6);

    }
  }
  return qword_1EE184FE0;
}

uint64_t sub_18FAEDB18()
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  objc_opt_self();
  if (byte_1ECD37F68)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18FAEDBAC;
    block[3] = &unk_1E2A4A848;
    block[4] = v0;
    if (qword_1EE184FF0 != -1)
      dispatch_once(&qword_1EE184FF0, block);
  }
  return dword_1EE184FE8;
}

void sub_18FAEDBAC(uint64_t a1)
{
  void *v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  id v7;

  sub_18FAE8128(*(_QWORD *)(a1 + 32), 502, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v7 = v1;
    objc_msgSend_objectForKeyedSubscript_(v1, v2, kUMUserSessionPreviousLoggedinIDKey);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    if (v3)
      dword_1EE184FE8 = objc_msgSend_unsignedIntValue(v3, v4, v5);

    v1 = v7;
  }

}

id sub_18FAEDC1C()
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18FAEDC94;
  block[3] = &unk_1E2A4A848;
  block[4] = v0;
  if (qword_1EE185000 != -1)
    dispatch_once(&qword_1EE185000, block);
  return (id)qword_1EE184FF8;
}

void sub_18FAEDC94()
{
  void *v0;
  uint64_t v1;
  const char *v2;
  uint64_t v3;
  const char *v4;
  const char *v5;
  const char *v6;
  void *v7;

  objc_opt_self();
  if (byte_1ECD37F68)
  {
    sub_18FAE72AC((uint64_t)UMUser, 502);
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v0 = (void *)objc_opt_new();
    v1 = getuid();
    objc_msgSend_setUid_(v0, v2, v1);
    v3 = getgid();
    objc_msgSend_setGid_(v0, v4, v3);
    objc_msgSend_setGivenName_(v0, v5, (uint64_t)CFSTR("login"));
    objc_msgSend_setFamilyName_(v0, v6, (uint64_t)CFSTR("login"));
  }
  v7 = (void *)qword_1EE184FF8;
  qword_1EE184FF8 = (uint64_t)v0;

}

void sub_18FAEDF1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18FAEDF44(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FAEDFD0(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v6 = a3;
  if (v15)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    sub_18FAEA1C0();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote userSessionLRUInfoWithReply: %@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v7, v14);

  }
}

id sub_18FAEE098(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  id v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  id v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[6];
  _QWORD v50[5];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = sub_18FAEAA10;
  v61 = sub_18FAEA9E8;
  v62 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = sub_18FAEAA10;
  v55 = sub_18FAEA9E8;
  v56 = 0;
  sub_18FAE7234();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAFF584(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = sub_18FAEE40C;
  v50[3] = &unk_1E2A4A950;
  v50[4] = &v57;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v4, v6, (uint64_t)v50);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v5;
  v49[1] = 3221225472;
  v49[2] = sub_18FAEE498;
  v49[3] = &unk_1E2A4A9A0;
  v49[4] = &v51;
  v49[5] = &v57;
  objc_msgSend_listAllUserSessionIDsWithAReply_(v7, v8, (uint64_t)v49);

  v15 = (void *)v52[5];
  if (v15)
  {
    v18 = v15;
    if (a2)
    {
      objc_msgSend_predicateWithBlock_(MEMORY[0x1E0CB3880], v16, (uint64_t)&unk_1E2A4A9E0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_filteredArrayUsingPredicate_(v18, v20, (uint64_t)v19);
      v21 = objc_claimAutoreleasedReturnValue();

      v18 = (id)v21;
    }
    v22 = (void *)MEMORY[0x1E0C99DE8];
    v23 = objc_msgSend_count(v18, v16, v17);
    objc_msgSend_arrayWithCapacity_(v22, v24, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v26 = v18;
    v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v45, v63, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v46;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v46 != v31)
            objc_enumerationMutation(v26);
          v33 = objc_msgSend_intValue(*(void **)(*((_QWORD *)&v45 + 1) + 8 * v32), v28, v29);
          sub_18FAE72AC((uint64_t)UMUser, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v25, v35, (uint64_t)v34);

          ++v32;
        }
        while (v30 != v32);
        v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v28, (uint64_t)&v45, v63, 16);
      }
      while (v30);
    }
    v36 = v26;
  }
  else
  {
    if (!v58[5])
    {
      v25 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_15;
    }
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Could not get user UIDs"), v9, v10, v11, v12, v13, v14, v44);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAF8F3C((uint64_t)v36, CFSTR("error: %@"), v37, v38, v39, v40, v41, v42, v58[5]);
    sub_18FAEA1C0();
    v26 = (id)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v26, v36);
    v25 = (void *)MEMORY[0x1E0C9AA60];
  }

LABEL_15:
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
  return v25;
}

void sub_18FAEE3C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

void sub_18FAEE40C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FAEE498(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v6 = a3;
  if (v15)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    sub_18FAEA1C0();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote listAllUserSessionIDsWithAReply: %@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v7, v14);

  }
}

BOOL sub_18FAEE560(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_unsignedIntValue(a2, (const char *)a2, a3) != 502;
}

uint64_t sub_18FAEE580(uint64_t a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;

  sub_18FAE7234();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = sub_18FAFFB3C(v3, a2);

  return v4;
}

id sub_18FAEE5C4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  const char *v3;
  void *v4;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  _QWORD v31[6];
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  objc_opt_self();
  objc_opt_self();
  if (byte_1ECD37F68)
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = sub_18FAEAA10;
    v43 = sub_18FAEA9E8;
    v44 = 0;
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = sub_18FAEAA10;
    v37 = sub_18FAEA9E8;
    v38 = 0;
    sub_18FAE7234();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAFF584(v0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = sub_18FAEE810;
    v32[3] = &unk_1E2A4A950;
    v32[4] = &v33;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v1, v3, (uint64_t)v32);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v2;
    v31[1] = 3221225472;
    v31[2] = sub_18FAEE89C;
    v31[3] = &unk_1E2A4AA68;
    v31[4] = &v33;
    v31[5] = &v39;
    objc_msgSend_retrieveUserSessionBlobwithReply_(v4, v5, (uint64_t)v31);

    v6 = (void *)v40[5];
    if (v6)
    {
      sub_18FB05410((uint64_t)UMUserSwitchContext, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = (void *)v34[5];
      if (v8)
      {
        sub_18FAED58C((uint64_t)UMAbort, v8, CFSTR("get user switch context"));
        sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Error retrieving context"), v9, v10, v11, v12, v13, v14, v30);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18FAF8F3C((uint64_t)v15, CFSTR("error: %@"), v16, v17, v18, v19, v20, v21, v34[5]);
        sub_18FAEA1C0();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18FAE964C((uint64_t)v22, v15);

      }
      else
      {
        sub_18FAEA1C0();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18FAE71DC((uint64_t)v15, CFSTR("Could not retrieve context, but we have no error"), v23, v24, v25, v26, v27, v28, v30);
      }

      v7 = 0;
    }

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v39, 8);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

void sub_18FAEE7E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18FAEE810(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FAEE89C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;

  v16 = a2;
  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    sub_18FAEA1C0();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote retrieveUserSessionBlobwithReply: %@"), v7, v8, v9, v10, v11, v12, (uint64_t)v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v6, v13);

  }
  else
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = v16;
    v6 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v15;
  }

}

void sub_18FAEE960()
{
  void *v0;
  void *v1;
  uint64_t v2;
  const char *v3;
  void *v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[6];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  objc_opt_self();
  objc_opt_self();
  if (byte_1ECD37F68)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = sub_18FAEAA10;
    v32 = sub_18FAEA9E8;
    v33 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    sub_18FAE7234();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAFF584(v0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_18FAEEB54;
    v23[3] = &unk_1E2A4A950;
    v23[4] = &v28;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v1, v3, (uint64_t)v23);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v2;
    v22[1] = 3221225472;
    v22[2] = sub_18FAEEBE0;
    v22[3] = &unk_1E2A4AA90;
    v22[4] = &v28;
    v22[5] = &v24;
    objc_msgSend_deleteUserSessionBlobwithReply_(v4, v5, (uint64_t)v22);

    if (!*((_BYTE *)v25 + 24))
    {
      v6 = (void *)v29[5];
      if (v6)
      {
        sub_18FAED58C((uint64_t)UMAbort, v6, CFSTR("delete user switch context"));
        sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Error deleting context"), v7, v8, v9, v10, v11, v12, v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18FAF8F3C((uint64_t)v13, CFSTR("error: %@"), v14, v15, v16, v17, v18, v19, v29[5]);
        sub_18FAEA1C0();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18FAE964C((uint64_t)v20, v13);

      }
    }

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v28, 8);

  }
}

void sub_18FAEEB2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18FAEEB54(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FAEEBE0(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v4 = a2;
  if (v4)
  {
    v13 = (uint64_t)v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    sub_18FAEA1C0();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote deleteUserSessionBlobwithReply: %@"), v6, v7, v8, v9, v10, v11, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v5, v12);

    v4 = (id)v13;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

id sub_18FAEEC8C(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  unint64_t v36;
  void *v37;
  double v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  uint64_t v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = objc_opt_self();
  objc_opt_self();
  if (!byte_1ECD37F68)
  {
    sub_18FAEF108(v6, v4, v5);
    sub_18FAEF1F4(v6, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    sub_18FAEF918(v6, v11, v5, &v44);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v44;
    v15 = v14;
    v12 = 0;
    if (v13 || !v14)
      goto LABEL_21;
    sub_18FAED58C((uint64_t)UMAbort, v14, CFSTR("load user"));
    v18 = objc_msgSend_code(v15, v16, v17);
    v48 = *MEMORY[0x1E0CB3388];
    v49 = v15;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)&v49, &v48, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend_mutableCopy(v20, v21, v22);

    if (v18 == -15)
      goto LABEL_16;
    if (v18 != 73)
    {
      if (v18 != -14)
        goto LABEL_19;
      goto LABEL_18;
    }
LABEL_17:
    v36 = 9;
    goto LABEL_20;
  }
  if (sub_18FAEF04C(v6, v4) <= 0.0)
  {
    sub_18FAEF108(v6, v4, v5);
    sub_18FAEF1F4(v6, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    sub_18FAEF918(v6, v11, v5, &v47);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v47;
    v15 = v24;
    v12 = 0;
    if (v13 || !v24)
      goto LABEL_21;
    sub_18FAED58C((uint64_t)UMAbort, v24, CFSTR("load user"));
    v27 = objc_msgSend_code(v15, v25, v26);
    v52 = *MEMORY[0x1E0CB3388];
    v53[0] = v15;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v28, (uint64_t)v53, &v52, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend_mutableCopy(v29, v30, v31);

    if (v27 != 73)
    {
      if (v27 != -14)
      {
        if (v27 == -15)
        {
          objc_msgSend_sharedManager(UMUserManager, v32, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v45[0] = MEMORY[0x1E0C809B0];
          v45[1] = 3221225472;
          v45[2] = sub_18FAEFB38;
          v45[3] = &unk_1E2A4AAB8;
          v46 = v4;
          objc_msgSend_disableUser_completionHandler_(v34, v35, (uint64_t)v46, v45);

LABEL_16:
          v36 = 4;
LABEL_20:
          sub_18FAE7A90((uint64_t)UMError, v36, v23);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
          goto LABEL_22;
        }
LABEL_19:
        v36 = 3;
        goto LABEL_20;
      }
LABEL_18:
      v37 = (void *)MEMORY[0x1E0CB37E8];
      v38 = sub_18FAEF04C(v6, v4);
      objc_msgSend_numberWithDouble_(v37, v39, v40, v38);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v23, v42, (uint64_t)v41, CFSTR("UMErrorPasscodeBackOffInterval"));

      v36 = 6;
      goto LABEL_20;
    }
    goto LABEL_17;
  }
  v50 = CFSTR("UMErrorPasscodeBackOffInterval");
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v9;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)&v51, &v50, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  sub_18FAE7A90((uint64_t)UMError, 6uLL, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v12;
}

double sub_18FAEF04C(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  int v8;
  double v9;
  void *v10;
  void *UserLockStateInfo;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;

  v2 = a2;
  v3 = objc_opt_self();
  objc_msgSend_sharedManager(UMUserManager, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_userExists_(v6, v7, (uint64_t)v2);

  v9 = -1.0;
  if (v8)
  {
    sub_18FAF1520(v3, v2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    UserLockStateInfo = (void *)MKBUserSessionGetUserLockStateInfo();
    objc_msgSend_objectForKeyedSubscript_(UserLockStateInfo, v12, *MEMORY[0x1E0D4E5B8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v13, v14, v15);
    v9 = v16;

  }
  return v9;
}

void sub_18FAEF108(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  id v21;

  v21 = a2;
  v4 = a3;
  objc_opt_self();
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v7 = (void *)objc_msgSend_initWithData_encoding_(v5, v6, (uint64_t)v4, 4);
    objc_msgSend_decimalDigitCharacterSet(MEMORY[0x1E0CB3500], v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByTrimmingCharactersInSet_(v7, v11, (uint64_t)v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_length(v12, v13, v14);

    if (!v15)
    {
      if (objc_msgSend_length(v7, v16, v17) == 4)
      {
        objc_msgSend_setPasscodeType_(v21, v18, 0);
      }
      else if (objc_msgSend_length(v7, v18, v19) == 6)
      {
        objc_msgSend_setPasscodeType_(v21, v20, 1);
      }
    }

  }
}

id sub_18FAEF1F4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  void *v49;
  uint64_t isAuditor;
  const char *v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t isDisabled;
  const char *v58;
  void *v59;
  const char *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t isTransientUser;
  const char *v65;
  void *v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t isPrimaryUser;
  const char *v72;
  void *v73;
  const char *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t isAdminUser;
  const char *v79;
  void *v80;
  const char *v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  void *v87;
  const char *v88;
  void *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  void *v95;
  const char *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t hasManagedCredentials;
  const char *v105;
  void *v106;
  const char *v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  const char *v115;
  void *v116;
  id v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  __CFString *v126;
  void *v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  const char *v133;
  void *v134;
  id v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  __CFString *v144;
  void *v145;
  void *v146;
  uint64_t v147;
  id v148;
  const char *v149;
  id v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  id v164;
  uint64_t v166;
  id v167;
  id v168;
  id v169;

  v2 = a2;
  objc_opt_self();
  sub_18FAE72E0();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_alternateDSID(v2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_alternateDSID(v2, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, kUMUserSessionAlternateDSIDKey);

  }
  objc_msgSend_username(v2, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend_username(v2, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v15, (uint64_t)v14, kUMUserSessionNameKey);

  }
  objc_msgSend_givenName(v2, v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend_givenName(v2, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v20, (uint64_t)v19, kUMUserSessionFirstNameKey);

  }
  objc_msgSend_familyName(v2, v17, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend_familyName(v2, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v25, (uint64_t)v24, kUMUserSessionLastNameKey);

  }
  objc_msgSend_displayName(v2, v22, v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend_displayName(v2, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v30, (uint64_t)v29, kUMUserSessionDisplayNameKey);

  }
  objc_msgSend_photoURL(v2, v27, v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend_photoURL(v2, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_absoluteString(v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v38, (uint64_t)v37, kUMUserSessionFileInfoKey);

  }
  objc_msgSend_userAuxiliaryString(v2, v32, v33);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend_userAuxiliaryString(v2, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v43, (uint64_t)v42, kUMUserSessionLanguageKey);

  }
  objc_msgSend_lastRemoteAuthDate(v2, v40, v41);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    objc_msgSend_lastRemoteAuthDate(v2, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v48, (uint64_t)v47, kUMUserSessionCloudLoginTimeStampKey);

  }
  v49 = (void *)MEMORY[0x1E0CB37E8];
  isAuditor = objc_msgSend_isAuditor(v2, v45, v46);
  objc_msgSend_numberWithBool_(v49, v51, isAuditor);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v53, (uint64_t)v52, kUMUserSessionAuditorKey);

  v54 = (void *)MEMORY[0x1E0CB37E8];
  isDisabled = objc_msgSend_isDisabled(v2, v55, v56);
  objc_msgSend_numberWithBool_(v54, v58, isDisabled);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v60, (uint64_t)v59, kUMUserSessionDisabledKey);

  v61 = (void *)MEMORY[0x1E0CB37E8];
  isTransientUser = objc_msgSend_isTransientUser(v2, v62, v63);
  objc_msgSend_numberWithBool_(v61, v65, isTransientUser);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v67, (uint64_t)v66, kUMUserSessionisTransientKey);

  v68 = (void *)MEMORY[0x1E0CB37E8];
  isPrimaryUser = objc_msgSend_isPrimaryUser(v2, v69, v70);
  objc_msgSend_numberWithBool_(v68, v72, isPrimaryUser);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v74, (uint64_t)v73, kUMUserSessionisPrimaryKey);

  v75 = (void *)MEMORY[0x1E0CB37E8];
  isAdminUser = objc_msgSend_isAdminUser(v2, v76, v77);
  objc_msgSend_numberWithBool_(v75, v79, isAdminUser);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v81, (uint64_t)v80, kUMUserSessionisAdminKey);

  v82 = (void *)MEMORY[0x1E0CB37E8];
  v85 = objc_msgSend_passcodeLockGracePeriod(v2, v83, v84);
  objc_msgSend_numberWithUnsignedInteger_(v82, v86, v85);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v88, (uint64_t)v87, kUMUserSessionRequiresPasscodeKey);

  v89 = (void *)objc_opt_new();
  v90 = (void *)MEMORY[0x1E0CB37E8];
  v93 = objc_msgSend_passcodeType(v2, v91, v92);
  objc_msgSend_numberWithUnsignedInteger_(v90, v94, v93);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v89, v96, (uint64_t)v95, CFSTR("passcodeType"));

  objc_msgSend_languages(v2, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v89, v100, (uint64_t)v99, CFSTR("languages"));

  v101 = (void *)MEMORY[0x1E0CB37E8];
  hasManagedCredentials = objc_msgSend_hasManagedCredentials(v2, v102, v103);
  objc_msgSend_numberWithBool_(v101, v105, hasManagedCredentials);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v89, v107, (uint64_t)v106, CFSTR("hasManagedCredentials"));

  objc_msgSend_errorCausingLogout(v2, v108, v109);
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  if (v110)
  {
    v113 = (void *)MEMORY[0x1E0CB36F8];
    objc_msgSend_errorCausingLogout(v2, v111, v112);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = 0;
    objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(v113, v115, (uint64_t)v114, 1, &v169);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = v169;

    objc_msgSend_setObject_forKeyedSubscript_(v89, v118, (uint64_t)v116, CFSTR("errorCausingLogout"));
    sub_18FAEA1C0();
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    if (v116)
    {
      v126 = CFSTR("Successful archive of logout error\n");
    }
    else
    {
      v166 = (uint64_t)v117;
      v126 = CFSTR("Failed to archive the logout error with an error:%@ \n");
    }
    sub_18FAE99B4((uint64_t)UMLogMessage, v126, v119, v120, v121, v122, v123, v124, v166);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v125, v127);

  }
  else
  {
    v117 = 0;
  }
  objc_msgSend_debugErrorCausingLogout(v2, v111, v112);
  v128 = (void *)objc_claimAutoreleasedReturnValue();

  if (v128)
  {
    v131 = (void *)MEMORY[0x1E0CB36F8];
    objc_msgSend_debugErrorCausingLogout(v2, v129, v130);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v168 = v117;
    objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(v131, v133, (uint64_t)v132, 1, &v168);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = v168;

    objc_msgSend_setObject_forKeyedSubscript_(v89, v136, (uint64_t)v134, CFSTR("debugErrorCausingLogout"));
    sub_18FAEA1C0();
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    if (v134)
    {
      v144 = CFSTR("Successful archive of debug logout error\n");
    }
    else
    {
      v166 = (uint64_t)v135;
      v144 = CFSTR("Failed to archive the debug logout error with an error:%@ \n");
    }
    sub_18FAE99B4((uint64_t)UMLogMessage, v144, v137, v138, v139, v140, v141, v142, v166);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v143, v145);

  }
  else
  {
    v135 = v117;
  }
  v167 = 0;
  objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E0CB38B0], v129, (uint64_t)v89, 200, 0, &v167);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  if (v146)
  {
    v147 = kUMUserSessionOpaqueDataKey;
    v148 = v167;
    objc_msgSend_setObject_forKeyedSubscript_(v3, v149, (uint64_t)v146, v147);
  }
  else
  {
    v150 = v167;
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Could not save user's opaque data"), v151, v152, v153, v154, v155, v156, v166);
    v148 = (id)objc_claimAutoreleasedReturnValue();
    sub_18FAF8F3C((uint64_t)v148, CFSTR("error: %@"), v157, v158, v159, v160, v161, v162, (uint64_t)v150);

    sub_18FAEA1C0();
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v163, v148);

  }
  v164 = v3;

  return v164;
}

id sub_18FAEF918(uint64_t a1, void *a2, void *a3, _QWORD *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  id v23;
  _QWORD v25[6];
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v6 = a2;
  v7 = a3;
  v8 = objc_opt_self();
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_18FAEAA10;
  v37 = sub_18FAEA9E8;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_18FAEAA10;
  v31 = sub_18FAEA9E8;
  v32 = 0;
  if (v7 && (v11 = v8, objc_msgSend_length(v7, v9, v10)))
  {
    sub_18FAEFBCC(v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_length(v7, v13, v14);
  }
  else
  {
    v12 = 0;
    v15 = 0;
  }
  sub_18FAE7234();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAFF584(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_18FAEFCE8;
  v26[3] = &unk_1E2A4A950;
  v26[4] = &v27;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v17, v19, (uint64_t)v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v18;
  v25[1] = 3221225472;
  v25[2] = sub_18FAEFD74;
  v25[3] = &unk_1E2A4AAE0;
  v25[4] = &v33;
  v25[5] = &v27;
  objc_msgSend_loadUserSession_withSecret_oldSize_reply_(v20, v21, (uint64_t)v6, v12, v15, v25);

  if (a4)
  {
    v22 = (void *)v28[5];
    if (v22)
      *a4 = objc_retainAutorelease(v22);
  }
  v23 = (id)v34[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v23;
}

void sub_18FAEFB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_18FAEFB38(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = a2;
    sub_18FAF90A4((uint64_t)UMLogMessage, v2, CFSTR("Could not disable user"), v4, v5, v6, v7, v8, v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    sub_18FAF8F3C((uint64_t)v17, CFSTR("error: %@"), v9, v10, v11, v12, v13, v14, (uint64_t)v3);

    sub_18FAEA1C0();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v15, v17);

  }
}

id sub_18FAEFBCC(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  int v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const void *v10;
  id v11;
  const char *v12;
  int v13;
  void *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v23[2];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  if (!v2)
    goto LABEL_6;
  v5 = (void *)objc_msgSend_length(v2, v3, v4);
  if (v5)
  {
    if (pipe(v23) != -1)
    {
      v6 = v23[1];
      v7 = objc_retainAutorelease(v2);
      v10 = (const void *)objc_msgSend_bytes(v7, v8, v9);
      write(v6, v10, (size_t)v5);
      close(v23[1]);
      v11 = objc_alloc(MEMORY[0x1E0CB3608]);
      v5 = (void *)objc_msgSend_initWithFileDescriptor_closeOnDealloc_(v11, v12, v23[0], 1);
      goto LABEL_7;
    }
    v13 = *__error();
    sub_18FAEA1C0();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = strerror(v13);
    sub_18FAF6C60((uint64_t)v14, CFSTR("failed to get fds(1) with error:%s"), v16, v17, v18, v19, v20, v21, (uint64_t)v15);

LABEL_6:
    v5 = 0;
  }
LABEL_7:

  return v5;
}

void sub_18FAEFCE8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FAEFD74(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);

}

uint64_t sub_18FAEFDF4(uint64_t a1, void *a2, void *a3, _QWORD *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  uint64_t v23;
  _QWORD v25[6];
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a2;
  v7 = a3;
  v8 = objc_opt_self();
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_18FAEAA10;
  v35 = sub_18FAEA9E8;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  if (v7 && (v11 = v8, objc_msgSend_length(v7, v9, v10)))
  {
    sub_18FAEFBCC(v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_length(v7, v13, v14);
  }
  else
  {
    v12 = 0;
    v15 = 0;
  }
  sub_18FAE7234();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAFF584(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_18FAF0008;
  v26[3] = &unk_1E2A4A950;
  v26[4] = &v31;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v17, v19, (uint64_t)v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v18;
  v25[1] = 3221225472;
  v25[2] = sub_18FAF0094;
  v25[3] = &unk_1E2A4AA90;
  v25[4] = &v31;
  v25[5] = &v27;
  objc_msgSend_dataMigrationSetup_withSecret_oldSize_reply_(v20, v21, (uint64_t)v6, v12, v15, v25);

  if (a4)
  {
    v22 = (void *)v32[5];
    if (v22)
      *a4 = objc_retainAutorelease(v22);
  }
  v23 = *((unsigned __int8 *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v23;
}

void sub_18FAEFFE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18FAF0008(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FAF0094(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

uint64_t sub_18FAF00F4(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  objc_opt_self();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_18FAEAA10;
  v22 = sub_18FAEA9E8;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  sub_18FAE7234();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAFF584(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18FAF0280;
  v13[3] = &unk_1E2A4A950;
  v13[4] = &v18;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v4, v6, (uint64_t)v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = sub_18FAF030C;
  v12[3] = &unk_1E2A4AA90;
  v12[4] = &v18;
  v12[5] = &v14;
  objc_msgSend_migrateSharedAndPrimaryUserVolumeWithReply_(v7, v8, (uint64_t)v12);

  if (a2)
  {
    v9 = (void *)v19[5];
    if (v9)
      *a2 = objc_retainAutorelease(v9);
  }
  v10 = *((unsigned __int8 *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v10;
}

void sub_18FAF025C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18FAF0280(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FAF030C(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

uint64_t sub_18FAF036C(uint64_t a1, void *a2, _QWORD *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a2;
  objc_opt_self();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_18FAEAA10;
  v24 = sub_18FAEA9E8;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  sub_18FAE7234();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAFF584(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_18FAF0518;
  v15[3] = &unk_1E2A4A950;
  v15[4] = &v20;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v6, v8, (uint64_t)v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = sub_18FAF05A4;
  v14[3] = &unk_1E2A4AA90;
  v14[4] = &v20;
  v14[5] = &v16;
  objc_msgSend_migrateGuestUserVolume_withReply_(v9, v10, (uint64_t)v4, v14);

  if (a3)
  {
    v11 = (void *)v21[5];
    if (v11)
      *a3 = objc_retainAutorelease(v11);
  }
  v12 = *((unsigned __int8 *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v12;
}

void sub_18FAF04F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18FAF0518(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FAF05A4(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

id sub_18FAF0604(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  const char *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v2 = a2;
  v3 = objc_opt_self();
  sub_18FAEF1F4(v3, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_18FAEAA10;
  v22 = sub_18FAEA9E8;
  v23 = 0;
  if (v5)
  {
    sub_18FAE7234();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAFF584(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_18FAF0830;
    v17[3] = &unk_1E2A4A950;
    v17[4] = &v18;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v7, v9, (uint64_t)v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = sub_18FAF08BC;
    v16[3] = &unk_1E2A4AA90;
    v16[4] = &v18;
    v16[5] = &v24;
    objc_msgSend_removeUserSession_reply_(v10, v11, (uint64_t)v5, v16);

    if (*((_BYTE *)v25 + 24) || (v14 = (void *)v19[5]) == 0)
    {
      v12 = 0;
    }
    else
    {
      sub_18FAED58C((uint64_t)UMAbort, v14, CFSTR("delete user"));
      sub_18FAE7908((uint64_t)UMError, 8uLL, (void *)v19[5]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v4, *MEMORY[0x1E0CB2FE0], 22, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v13;
}

void sub_18FAF0808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18FAF0830(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FAF08BC(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t v14;

  v4 = a2;
  if (v4)
  {
    v14 = (uint64_t)v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    sub_18FAEA1C0();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote removeUserSession: %@"), v6, v7, v8, v9, v10, v11, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v5, v12);

    v4 = (id)v14;
    v13 = 0;
  }
  else
  {
    v13 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v13;

}

id sub_18FAF0974(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a2;
  v3 = objc_opt_self();
  v4 = (void *)objc_opt_new();
  sub_18FAF09D4(v3, v2, v4);

  return v4;
}

void sub_18FAF09D4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t *v22;
  void *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  const char *v32;
  void *v33;
  const char *v34;
  const char *v35;
  void *v36;
  const char *v37;
  const char *v38;
  void *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  void *v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  const char *v48;
  void *v49;
  const char *v50;
  const char *v51;
  void *v52;
  const char *v53;
  const char *v54;
  void *v55;
  const char *v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  const char *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  const char *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  const char *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  const char *v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  const char *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  const char *v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  const char *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  const char *v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  const char *v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  const char *v117;
  void *v118;
  const char *v119;
  const char *v120;
  void *v121;
  const char *v122;
  const char *v123;
  void *v124;
  const char *v125;
  const char *v126;
  void *v127;
  const char *v128;
  const char *v129;
  void *v130;
  const char *v131;
  const char *v132;
  void *v133;
  const char *v134;
  const char *v135;
  const char *v136;
  void *v137;
  void *v138;
  id v139;
  void *v140;
  uint64_t v141;
  const char *v142;
  void *v143;
  const char *v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  uint64_t v149;
  const char *v150;
  void *v151;
  const char *v152;
  const char *v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  void *v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  const char *v161;
  void *v162;
  id v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  __CFString *v172;
  id v173;
  id v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  void *v182;
  const char *v183;
  void *v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  __CFString *v193;
  void *v194;
  uint64_t v195;
  void *v196;
  id v197;
  void *v198;
  id v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  uint64_t v204;
  void *v205;
  id v206;
  id v207;
  id v208;
  uint64_t v209;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  if (v4)
  {
    v6 = v5;
    objc_msgSend_objectForKeyedSubscript_(v4, v7, kUMUserSessionIDKey);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_unsignedIntValue(v8, v9, v10);
    objc_msgSend_setUid_(v6, v12, v11);

    objc_msgSend_objectForKeyedSubscript_(v4, v13, kUMUserSessionGroupIDKey);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_unsignedIntValue(v14, v15, v16);
    objc_msgSend_setGid_(v6, v18, v17);

    objc_msgSend_objectForKeyedSubscript_(v4, v19, kUMUserSessionAlternateDSIDKey);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (uint64_t *)&kUMUserSessionUUIDKey;
    if (v20)
      v22 = (uint64_t *)&kUMUserSessionAlternateDSIDKey;
    objc_msgSend_objectForKeyedSubscript_(v4, v21, *v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAlternateDSID_(v6, v24, (uint64_t)v23);

    objc_msgSend_objectForKeyedSubscript_(v4, v25, kUMUserSessionHomeDirKey);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v26, (uint64_t)v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setHomeDirectoryURL_(v6, v29, (uint64_t)v28);

    }
    objc_msgSend_objectForKeyedSubscript_(v4, v26, kUMUserSessionNameKey);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUsername_(v6, v31, (uint64_t)v30);

    objc_msgSend_objectForKeyedSubscript_(v4, v32, kUMUserSessionFirstNameKey);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGivenName_(v6, v34, (uint64_t)v33);

    objc_msgSend_objectForKeyedSubscript_(v4, v35, kUMUserSessionLastNameKey);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFamilyName_(v6, v37, (uint64_t)v36);

    objc_msgSend_objectForKeyedSubscript_(v4, v38, kUMUserSessionDisplayNameKey);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDisplayName_(v6, v40, (uint64_t)v39);

    objc_msgSend_objectForKeyedSubscript_(v4, v41, kUMUserSessionFileInfoKey);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v42, (uint64_t)v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPhotoURL_(v6, v45, (uint64_t)v44);

    }
    objc_msgSend_objectForKeyedSubscript_(v4, v42, kUMUserSessionLanguageKey);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserAuxiliaryString_(v6, v47, (uint64_t)v46);

    objc_msgSend_objectForKeyedSubscript_(v4, v48, kUMUserSessionCreateTimeStampKey);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCreationDate_(v6, v50, (uint64_t)v49);

    objc_msgSend_objectForKeyedSubscript_(v4, v51, kUMUserSessionLoginTimeStampKey);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastLoginDate_(v6, v53, (uint64_t)v52);

    objc_msgSend_objectForKeyedSubscript_(v4, v54, kUMUserSessionCloudLoginTimeStampKey);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastRemoteAuthDate_(v6, v56, (uint64_t)v55);

    objc_msgSend_objectForKeyedSubscript_(v4, v57, kUMUserSessionLoginUserKey);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend_BOOLValue(v58, v59, v60);
    objc_msgSend_setIsLoginUser_(v6, v62, v61);

    objc_msgSend_objectForKeyedSubscript_(v4, v63, kUMUserSessionAuditorKey);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend_BOOLValue(v64, v65, v66);
    objc_msgSend_setIsAuditor_(v6, v68, v67);

    objc_msgSend_objectForKeyedSubscript_(v4, v69, kUMUserSessionDisabledKey);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend_BOOLValue(v70, v71, v72);
    objc_msgSend_setIsDisabled_(v6, v74, v73);

    objc_msgSend_objectForKeyedSubscript_(v4, v75, kUMUserSessionisTransientKey);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend_BOOLValue(v76, v77, v78);
    objc_msgSend_setIsTransientUser_(v6, v80, v79);

    objc_msgSend_objectForKeyedSubscript_(v4, v81, kUMUserSessionisPrimaryKey);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend_BOOLValue(v82, v83, v84);
    objc_msgSend_setIsPrimaryUser_(v6, v86, v85);

    objc_msgSend_objectForKeyedSubscript_(v4, v87, kUMUserSessionisAdminKey);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend_BOOLValue(v88, v89, v90);
    objc_msgSend_setIsAdminUser_(v6, v92, v91);

    objc_msgSend_objectForKeyedSubscript_(v4, v93, kUMUserSessionRequiresPasscodeKey);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend_unsignedLongValue(v94, v95, v96);
    objc_msgSend_setPasscodeLockGracePeriod_(v6, v98, v97);

    objc_msgSend_objectForKeyedSubscript_(v4, v99, kUMUserSessionQuotaLimitKey);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = objc_msgSend_unsignedLongLongValue(v100, v101, v102);
    objc_msgSend_setDataQuota_(v6, v104, v103);

    objc_msgSend_objectForKeyedSubscript_(v4, v105, kUMUserSessionQuotaUsedKey);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend_unsignedLongLongValue(v106, v107, v108);
    objc_msgSend_setDataUsed_(v6, v110, v109);

    objc_msgSend_objectForKeyedSubscript_(v4, v111, kUMUserSessionDirtyKey);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = objc_msgSend_BOOLValue(v112, v113, v114);
    objc_msgSend_setHasDataToSync_(v6, v116, v115);

    objc_msgSend_objectForKeyedSubscript_(v4, v117, kUMUserSessionFirstLoginStartTimeKey);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFirstLoginStartDate_(v6, v119, (uint64_t)v118);

    objc_msgSend_objectForKeyedSubscript_(v4, v120, kUMUserSessionFirstLoginEndTimeKey);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFirstLoginEndDate_(v6, v122, (uint64_t)v121);

    objc_msgSend_objectForKeyedSubscript_(v4, v123, kUMUserSessionCachedLoginStartTimeKey);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastCachedLoginStartDate_(v6, v125, (uint64_t)v124);

    objc_msgSend_objectForKeyedSubscript_(v4, v126, kUMUserSessionCachedLoginEndTimeKey);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastCachedLoginEndDate_(v6, v128, (uint64_t)v127);

    objc_msgSend_objectForKeyedSubscript_(v4, v129, kUMUserSessionLogoutStartTimeKey);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastLogoutStartDate_(v6, v131, (uint64_t)v130);

    objc_msgSend_objectForKeyedSubscript_(v4, v132, kUMUserSessionLogoutEndTimeKey);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastLogoutEndDate_(v6, v134, (uint64_t)v133);

    objc_msgSend_objectForKeyedSubscript_(v4, v135, kUMUserSessionOpaqueDataKey);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v137)
      goto LABEL_32;
    v209 = 0;
    v208 = 0;
    objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E0CB38B0], v136, (uint64_t)v137, 0, &v209, &v208);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = v208;
    v140 = (void *)MEMORY[0x1E0C99E60];
    v141 = objc_opt_class();
    v195 = 0;
    objc_msgSend_setWithObjects_(v140, v142, v141);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    if (v138)
    {
      if (v209 != 200)
        goto LABEL_31;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_31;
      v204 = (uint64_t)v143;
      objc_msgSend_objectForKeyedSubscript_(v138, v144, (uint64_t)CFSTR("passcodeType"));
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v148 = v145;
      if (v145)
      {
        v149 = objc_msgSend_unsignedLongValue(v145, v146, v147);
        objc_msgSend_setPasscodeType_(v6, v150, v149);
      }
      v203 = v148;
      objc_msgSend_objectForKeyedSubscript_(v138, v146, (uint64_t)CFSTR("languages"));
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setLanguages_(v6, v152, (uint64_t)v151);

      objc_msgSend_objectForKeyedSubscript_(v138, v153, (uint64_t)CFSTR("hasManagedCredentials"));
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = v154;
      if (v154)
      {
        v158 = objc_msgSend_BOOLValue(v154, v155, v156);
        objc_msgSend_setHasManagedCredentials_(v6, v159, v158);
      }
      v202 = v157;
      objc_msgSend_objectForKeyedSubscript_(v138, v155, (uint64_t)CFSTR("errorCausingLogout"));
      v160 = objc_claimAutoreleasedReturnValue();
      v201 = (void *)v160;
      v205 = v27;
      if (v160)
      {
        v199 = v139;
        v207 = 0;
        objc_msgSend_unarchivedObjectOfClasses_fromData_error_(MEMORY[0x1E0CB3710], v161, v204, v160, &v207);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        v163 = v207;
        objc_msgSend_setErrorCausingLogout_(v6, v164, (uint64_t)v162);
        sub_18FAEA1C0();
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        if (v162)
        {
          v172 = CFSTR("Successful Unarchive of logout error\n");
        }
        else
        {
          v195 = (uint64_t)v163;
          v172 = CFSTR("Failed to Unarchive logout error with error:%@ \n");
        }
        sub_18FAE99B4((uint64_t)UMLogMessage, v172, v165, v166, v167, v168, v169, v170, v195);
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18FAE964C((uint64_t)v171, v182);

        v139 = v199;
        v181 = v163;
      }
      else
      {
        v181 = 0;
      }
      objc_msgSend_objectForKeyedSubscript_(v138, v161, (uint64_t)CFSTR("debugErrorCausingLogout"));
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      if (v184)
      {
        v197 = v5;
        v173 = v139;
        v206 = v181;
        v200 = v184;
        objc_msgSend_unarchivedObjectOfClasses_fromData_error_(MEMORY[0x1E0CB3710], v183, v204, v184, &v206);
        v185 = objc_claimAutoreleasedReturnValue();
        v174 = v206;

        objc_msgSend_setDebugErrorCausingLogout_(v6, v186, v185);
        sub_18FAEA1C0();
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        v198 = (void *)v185;
        if (v185)
        {
          v193 = CFSTR("Successful Unarchive of debug logout error \n");
        }
        else
        {
          v195 = (uint64_t)v174;
          v193 = CFSTR("Failed to Unarchive debug logout error with error:%@ \n");
        }
        sub_18FAE99B4((uint64_t)UMLogMessage, v193, v187, v188, v189, v190, v191, v192, v195);
        v194 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v197;
        sub_18FAE964C((uint64_t)v196, v194);

        v143 = (void *)v204;
        v184 = v200;
      }
      else
      {
        v173 = v139;
        v174 = v181;
        v143 = (void *)v204;
      }

    }
    else
    {
      v205 = v27;
      v173 = v139;
      sub_18FAEA1C0();
      v174 = (id)objc_claimAutoreleasedReturnValue();
      sub_18FAE71DC((uint64_t)v174, CFSTR("Could not properly get user's opaque data"), v175, v176, v177, v178, v179, v180, 0);
    }

    v139 = v173;
    v27 = v205;
LABEL_31:

LABEL_32:
  }

}

id sub_18FAF1350(uint64_t a1, void *a2, _QWORD *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = a2;
  v5 = objc_opt_self();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_18FAEAA10;
  v28 = sub_18FAEA9E8;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_18FAEAA10;
  v22 = sub_18FAEA9E8;
  v23 = 0;
  sub_18FAF1520(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE7234();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAFF584(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_18FAF15F0;
  v17[3] = &unk_1E2A4A950;
  v17[4] = &v18;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v8, v10, (uint64_t)v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = sub_18FAF167C;
  v16[3] = &unk_1E2A4AA68;
  v16[4] = &v18;
  v16[5] = &v24;
  objc_msgSend_userKeybagOpaqueData_KeybagBlobwithReply_(v11, v12, (uint64_t)v6, v16);

  if (a3)
  {
    v13 = (void *)v19[5];
    if (v13)
      *a3 = objc_retainAutorelease(v13);
  }
  v14 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v14;
}

void sub_18FAF14F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

id sub_18FAF1520(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  v12 = kUMUserSessionIDKey;
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v6 = objc_msgSend_uid(v2, v4, v5);

  objc_msgSend_numberWithUnsignedInt_(v3, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v9, (uint64_t)v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void sub_18FAF15F0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FAF167C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;

  v16 = a2;
  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    sub_18FAEA1C0();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote KeybagOpaqueDataForUser: %@"), v7, v8, v9, v10, v11, v12, (uint64_t)v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v6, v13);

  }
  else
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = v16;
    v6 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v15;
  }

}

uint64_t sub_18FAF1740(uint64_t a1, void *a2, void *a3, _QWORD *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a2;
  v7 = a3;
  v8 = objc_opt_self();
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_18FAEAA10;
  v29 = sub_18FAEA9E8;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  sub_18FAF1520(v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE7234();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAFF584(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_18FAF1920;
  v20[3] = &unk_1E2A4A950;
  v20[4] = &v25;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v11, v13, (uint64_t)v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = sub_18FAF19AC;
  v19[3] = &unk_1E2A4AA90;
  v19[4] = &v25;
  v19[5] = &v21;
  objc_msgSend_setUserKeybagOpaqueData_keybagBlob_withReply_(v14, v15, (uint64_t)v9, v7, v19);

  if (a4)
  {
    v16 = (void *)v26[5];
    if (v16)
      *a4 = objc_retainAutorelease(v16);
  }
  v17 = *((unsigned __int8 *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v17;
}

void sub_18FAF18F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18FAF1920(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FAF19AC(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v4 = a2;
  if (v4)
  {
    v13 = (uint64_t)v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    sub_18FAEA1C0();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote setUserKeybagOpaqueData: %@"), v6, v7, v8, v9, v10, v11, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v5, v12);

    v4 = (id)v13;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

void sub_18FAF1A58(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FAF1AE4(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

uint64_t sub_18FAF1B44()
{
  uint64_t result;

  result = objc_opt_self();
  byte_1EE185009 = 0;
  return result;
}

BOOL sub_18FAF1B60(uint64_t a1, void *a2, _QWORD *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  _BOOL8 v23;
  uint64_t v25;
  _QWORD v26[6];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v4 = a2;
  v5 = objc_opt_self();
  sub_18FAE9AB8();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAF90A4((uint64_t)UMLogMessage, v4, CFSTR("Commit changes"), v7, v8, v9, v10, v11, v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v6, v12);

  sub_18FAEF1F4(v5, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v13, v14, v15))
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = sub_18FAEAA10;
    v38 = sub_18FAEA9E8;
    v39 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = sub_18FAEAA10;
    v32 = sub_18FAEA9E8;
    v33 = 0;
    sub_18FAE7234();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAFF584(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_18FAF1D94;
    v27[3] = &unk_1E2A4A950;
    v27[4] = &v34;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v17, v19, (uint64_t)v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v18;
    v26[1] = 3221225472;
    v26[2] = sub_18FAF1E20;
    v26[3] = &unk_1E2A4AAE0;
    v26[4] = &v28;
    v26[5] = &v34;
    objc_msgSend_setUserSessionAttributes_reply_(v20, v21, (uint64_t)v13, v26);

    v22 = v29[5];
    v23 = v22 != 0;
    if (!v22)
      sub_18FAE7C04(v5, (void *)v35[5], a3);

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v34, 8);

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

void sub_18FAF1D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_18FAF1D94(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FAF1E20(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v6 = a3;
  if (v15)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    sub_18FAEA1C0();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote setUserSessionAttributes: %@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v7, v14);

  }
}

id sub_18FAF1EE8(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  void *v18;
  char *v19;

  v2 = a2;
  objc_opt_self();
  objc_msgSend_objectForKeyedSubscript_(v2, v3, kUMUserSwitchTaskNameKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v2, v5, kUMUserSwitchTaskReasonKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v2, v7, kUMUserSwitchTaskBundleIDKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_taskWithName_reason_forBundleID_(UMTask, v9, (uint64_t)v4, v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v2, v11, kUMUserSwitchTaskPIDKey);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_intValue(v12, v13, v14);
  objc_msgSend_setPid_(v10, v16, v15);
  objc_msgSend_objectForKeyedSubscript_(v2, v17, kUMUserSwitchTaskUUIDKey);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    sub_18FAF948C(MEMORY[0x1E0CB3A28], v18);
    v19 = (char *)objc_claimAutoreleasedReturnValue();
    sub_18FB076F8(v10, v19);

  }
  return v10;
}

id sub_18FAF2030(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;

  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_opt_new();
  objc_msgSend_name(v2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_name(v2, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, kUMUserSwitchTaskNameKey);

  }
  objc_msgSend_reason(v2, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend_reason(v2, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v15, (uint64_t)v14, kUMUserSwitchTaskReasonKey);

  }
  objc_msgSend_bundleID(v2, v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend_bundleID(v2, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v20, (uint64_t)v19, kUMUserSwitchTaskBundleIDKey);

  }
  v21 = (void *)MEMORY[0x1E0CB37E8];
  v22 = objc_msgSend_pid(v2, v17, v18);
  objc_msgSend_numberWithInt_(v21, v23, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v25, (uint64_t)v24, kUMUserSwitchTaskPIDKey);

  sub_18FAEC1D0((uint64_t)v2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    sub_18FAEC1D0((uint64_t)v2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v31, (uint64_t)v30, kUMUserSwitchTaskUUIDKey);

  }
  return v3;
}

uint64_t sub_18FAF2324(uint64_t a1, void *a2)
{
  return objc_msgSend_isEqualToUser_(a2, (const char *)a2, *(_QWORD *)(a1 + 32)) ^ 1;
}

void sub_18FAF2610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

void sub_18FAF2654(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FAF26E0(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v6 = a3;
  if (v15)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    sub_18FAEA1C0();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote listSyncBubbleUserswithReply: %@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v7, v14);

  }
}

void sub_18FAF297C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18FAF29A0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FAF2A2C(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v6 = a3;
  if (v15)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    sub_18FAEA1C0();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote listSyncServiceSourcesForUserSession: %@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v7, v14);

  }
}

BOOL sub_18FAF2AFC(uint64_t a1, int a2, void *a3, _QWORD *a4)
{
  id v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  int v20;
  id v21;
  _QWORD v23[6];
  _QWORD v24[5];
  _QWORD v25[6];
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a3;
  objc_opt_self();
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_18FAEAA10;
  v35 = sub_18FAEA9E8;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  sub_18FAE7234();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAFF584(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  if (a2)
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_18FAF303C;
    v26[3] = &unk_1E2A4A950;
    v26[4] = &v31;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v8, v9, (uint64_t)v26);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_uid(v6, v12, v13);
    v25[0] = v10;
    v25[1] = 3221225472;
    v25[2] = sub_18FAF30C8;
    v25[3] = &unk_1E2A4AA90;
    v25[4] = &v31;
    v25[5] = &v27;
    objc_msgSend_startUserSyncBubble_withReply_(v11, v15, v14, v25);
  }
  else
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_18FAF3174;
    v24[3] = &unk_1E2A4A950;
    v24[4] = &v31;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v8, v9, (uint64_t)v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_uid(v6, v16, v17);
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = sub_18FAF3200;
    v23[3] = &unk_1E2A4AA90;
    v23[4] = &v31;
    v23[5] = &v27;
    objc_msgSend_stoptUserSyncBubble_withReply_(v11, v19, v18, v23);
  }

  v20 = *((unsigned __int8 *)v28 + 24);
  if (!*((_BYTE *)v28 + 24))
  {
    v21 = (id)v32[5];
    if (!a4)
      goto LABEL_7;
    goto LABEL_6;
  }
  v21 = 0;
  if (a4)
LABEL_6:
    *a4 = objc_retainAutorelease(v21);
LABEL_7:

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v20 != 0;
}

void sub_18FAF2D3C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18FAF2EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18FAF2F04(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FAF2F90(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v4 = a2;
  if (v4)
  {
    v13 = (uint64_t)v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    sub_18FAEA1C0();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote clearSyncBubbleUserswithReply: %@"), v6, v7, v8, v9, v10, v11, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v5, v12);

    v4 = (id)v13;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

void sub_18FAF303C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FAF30C8(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v4 = a2;
  if (v4)
  {
    v13 = (uint64_t)v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    sub_18FAEA1C0();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote startUserSyncBubble: %@"), v6, v7, v8, v9, v10, v11, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v5, v12);

    v4 = (id)v13;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

void sub_18FAF3174(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FAF3200(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v4 = a2;
  if (v4)
  {
    v13 = (uint64_t)v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    sub_18FAEA1C0();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote stoptUserSyncBubble: %@"), v6, v7, v8, v9, v10, v11, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v5, v12);

    v4 = (id)v13;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

void sub_18FAF32AC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FAF33CC(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  BOOL v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  objc_msgSend_currentUser(*(void **)(a1 + 32), a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v4 = sub_18FAE772C(v3, &v10);
  v5 = v10;
  v8 = v5;
  if (v4 || !v5)
  {

  }
  else
  {
    v9 = objc_msgSend_code(v5, v6, v7);

    if (v9 == 7)
      byte_1EE185010 = 1;
  }

}

void sub_18FAF3464(void *a1)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  _QWORD v21[5];

  if (a1)
  {
    sub_18FAEBDF8();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_18FAF3544;
    v21[3] = &unk_1E2A4AB78;
    v21[4] = a1;
    sub_18FAEBEE8((uint64_t)v2, a1, v21);

    objc_msgSend_sharedManager(UMUserManager, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentUser(v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    sub_18FAEA1C0();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_uid(v8, v10, v11);
    sub_18FAE71DC((uint64_t)v9, CFSTR("CurrentUser with UID:%d set to refetch attributes"), v13, v14, v15, v16, v17, v18, v12);

    objc_msgSend_refetchUser(v8, v19, v20);
  }
}

void sub_18FAF3544(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

id *sub_18FAF35BC(id *WeakRetained)
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 3);
  return WeakRetained;
}

void sub_18FAF36C4(void **a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;

  v3 = a2;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_18FAF381C;
  v20[3] = &unk_1E2A4ABA0;
  v21 = a1[7];
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x194007B90](v20);
  sub_18FAEA1C0();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAF90A4((uint64_t)UMLogMessage, a1[4], CFSTR("Load user"), v6, v7, v8, v9, v10, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v5, v11);

  if (objc_msgSend_isSharedIPad(v3, v12, v13)
    && !objc_msgSend_isLoginSession(a1[5], v14, v15))
  {
    v17 = 0;
    goto LABEL_7;
  }
  if (!objc_msgSend_userExists_(v3, v14, (uint64_t)a1[4]))
  {
    v17 = 2;
LABEL_7:
    sub_18FAEC284((uint64_t)UMError, v17);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  sub_18FAEEC8C((uint64_t)UMMobileKeyBag, a1[4], a1[6]);
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v18 = (void *)v16;
  v4[2](v4, v16);

}

uint64_t sub_18FAF381C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_18FAF391C(void **a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  int isLoginSession;
  const char *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;

  v3 = a2;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_18FAF3AC8;
  v21[3] = &unk_1E2A4ABA0;
  v22 = a1[7];
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x194007B90](v21);
  sub_18FAEA1C0();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAF90A4((uint64_t)UMLogMessage, a1[4], CFSTR("Create user"), v6, v7, v8, v9, v10, v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v5, v11);

  if (objc_msgSend_isSharedIPad(v3, v12, v13))
    isLoginSession = objc_msgSend_isLoginSession(a1[5], v14, v15);
  else
    isLoginSession = 1;
  if (objc_msgSend_isSharedIPad(v3, v14, v15) && sub_18FAED900())
  {
    if (((_os_feature_enabled_impl() | isLoginSession) & 1) == 0)
    {
LABEL_7:
      v18 = 0;
LABEL_11:
      sub_18FAEC284((uint64_t)UMError, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  else if (!isLoginSession)
  {
    goto LABEL_7;
  }
  if ((objc_msgSend_userExists_(v3, v17, (uint64_t)a1[4]) & 1) != 0)
  {
    v18 = 1;
    goto LABEL_11;
  }
  sub_18FAEEC8C((uint64_t)UMMobileKeyBag, a1[4], a1[6]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
    sub_18FAF3464(v3);
LABEL_12:
  ((void (**)(_QWORD, void *))v4)[2](v4, v19);

}

uint64_t sub_18FAF3AC8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_18FAF3BA0(void **a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  int v19;
  const char *v20;
  uint64_t v21;
  int v22;
  const char *v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;

  v3 = a2;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_18FAF3D2C;
  v27[3] = &unk_1E2A4ABA0;
  v28 = a1[6];
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x194007B90](v27);
  sub_18FAEA1C0();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAF90A4((uint64_t)UMLogMessage, a1[4], CFSTR("Delete user"), v6, v7, v8, v9, v10, v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v5, v11);

  if (objc_msgSend_uid(a1[4], v12, v13) == 501
    || (objc_msgSend_currentUser(a1[5], v14, v15),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend_uid(v16, v17, v18),
        v22 = objc_msgSend_uid(a1[4], v20, v21),
        v16,
        v19 == v22))
  {
    v24 = 0;
LABEL_4:
    sub_18FAEC284((uint64_t)UMError, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!objc_msgSend_userExists_(v3, v23, (uint64_t)a1[4]))
  {
    v24 = 2;
    goto LABEL_4;
  }
  sub_18FAF0604((uint64_t)UMMobileKeyBag, a1[4]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
    sub_18FAF3464(v3);
LABEL_5:
  ((void (**)(_QWORD, void *))v4)[2](v4, v25);

}

uint64_t sub_18FAF3D2C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_18FAF3E00(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  id v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;

  v3 = a2;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_18FAF3F8C;
  v27[3] = &unk_1E2A4ABA0;
  v28 = *(id *)(a1 + 40);
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x194007B90](v27);
  sub_18FAEA1C0();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAF90A4((uint64_t)UMLogMessage, *(void **)(a1 + 32), CFSTR("Disable user"), v6, v7, v8, v9, v10, v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v5, v11);

  if (!objc_msgSend_isSharedIPad(v3, v12, v13))
  {
    v24 = 0;
LABEL_6:
    sub_18FAEC284((uint64_t)UMError, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v4)[2](v4, v25);

    goto LABEL_7;
  }
  if (!objc_msgSend_userExists_(v3, v14, *(_QWORD *)(a1 + 32)))
  {
    v24 = 2;
    goto LABEL_6;
  }
  v15 = *(id *)(a1 + 32);
  objc_msgSend_setIsDisabled_(v15, v16, 1);
  objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E0C99D68], v17, v18, -604800.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLastRemoteAuthDate_(v15, v20, (uint64_t)v19);

  objc_msgSend_commitChanges(v15, v21, v22);
  objc_msgSend_switchToLoginUserWithCompletionHandler_(v3, v23, (uint64_t)v4);
LABEL_7:

}

uint64_t sub_18FAF3F8C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id *sub_18FAF4010(id *result, void *a2)
{
  if (result)
    return (id *)objc_storeWeak(result + 3, a2);
  return result;
}

void sub_18FAF421C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    *(_BYTE *)(v4 + 16) = 0;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    v6 = v3;
    (*(void (**)(void))(v5 + 16))();
    v3 = v6;
  }

}

uint64_t sub_18FAF426C(uint64_t result, char a2)
{
  if (result)
    *(_BYTE *)(result + 16) = a2;
  return result;
}

BOOL sub_18FAF4278(_BOOL8 result)
{
  if (result)
    return *(_BYTE *)(result + 16) != 0;
  return result;
}

void sub_18FAF43DC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    *(_BYTE *)(v4 + 16) = 0;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    v6 = v3;
    (*(void (**)(void))(v5 + 16))();
    v3 = v6;
  }

}

void sub_18FAF47F4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    *(_BYTE *)(v4 + 16) = 0;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    v6 = v3;
    (*(void (**)(void))(v5 + 16))();
    v3 = v6;
  }

}

id *sub_18FAF613C(id *WeakRetained)
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 4);
  return WeakRetained;
}

id *sub_18FAF6158(id *result, void *a2)
{
  if (result)
    return (id *)objc_storeWeak(result + 4, a2);
  return result;
}

void sub_18FAF6270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FAF6288(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  v6 = a2;
  v3 = (void *)v6[1];
  if (!v3)
  {
    sub_18FAEE098((uint64_t)UMMobileKeyBag, 1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v6[1];
    v6[1] = v4;

    v3 = (void *)v6[1];
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v3);

}

void sub_18FAF63D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FAF63E8(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  v6 = a2;
  v3 = (void *)v6[1];
  if (!v3)
  {
    sub_18FAEE098((uint64_t)UMMobileKeyBag, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v6[1];
    v6[1] = v4;

    v3 = (void *)v6[1];
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v3);

}

void sub_18FAF69B0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    *(_BYTE *)(v4 + 16) = 0;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    v6 = v3;
    (*(void (**)(void))(v5 + 16))();
    v3 = v6;
  }

}

uint64_t sub_18FAF6AE4(uint64_t result, uint64_t a2)
{
  if (result)
    *(_QWORD *)(result + 8) = a2;
  return result;
}

id sub_18FAF6AF0()
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18FAF6B68;
  block[3] = &unk_1E2A4A848;
  block[4] = v0;
  if (qword_1EE185028 != -1)
    dispatch_once(&qword_1EE185028, block);
  return (id)qword_1EE185020;
}

void sub_18FAF6B68()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1EE185020;
  qword_1EE185020 = v0;

  if (qword_1EE185020)
    *(_QWORD *)(qword_1EE185020 + 8) = 1;
}

id sub_18FAF6BA8()
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18FAF6C20;
  block[3] = &unk_1E2A4A848;
  block[4] = v0;
  if (qword_1EE185038 != -1)
    dispatch_once(&qword_1EE185038, block);
  return (id)qword_1EE185030;
}

void sub_18FAF6C20()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1EE185030;
  qword_1EE185030 = v0;

  if (qword_1EE185030)
    *(_QWORD *)(qword_1EE185030 + 8) = 4;
}

void sub_18FAF6C60(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v10;

  if (a1)
  {
    sub_18FAF8EB8((uint64_t)UMLogMessage, a2, (uint64_t)&a9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C(a1, v10);

  }
}

uint64_t sub_18FAF6CF0(void *a1, void *a2)
{
  id v3;
  const char *v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a2;
  v5 = v3;
  if (a1)
  {
    if (v3)
    {
      objc_msgSend_valueForEntitlement_(a1, v4, (uint64_t)v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v9 = objc_msgSend_BOOLValue(v6, v7, v8);
      else
        v9 = 0;

    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void sub_18FAF738C(void *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t isEnterprisePersona;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t isPersonalPersona;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t isUniversalPersona;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t isSystemPersona;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t isDefaultPersona;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t isGuestPersona;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t isDataSeparatedPersona;
  const char *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  id v67;

  if (a1)
  {
    v3 = a2;
    objc_msgSend_personaLayoutPathURL(v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPersonaLayoutPathURL_(a1, v7, (uint64_t)v6);

    objc_msgSend_userPersonaUniqueString(v3, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserPersonaUniqueString_(a1, v11, (uint64_t)v10);

    v14 = objc_msgSend_userPersonaType(v3, v12, v13);
    objc_msgSend_setUserPersonaType_(a1, v15, v14);
    v18 = objc_msgSend_userPersona_id(v3, v16, v17);
    objc_msgSend_setUserPersona_id_(a1, v19, v18);
    isEnterprisePersona = objc_msgSend_isEnterprisePersona(v3, v20, v21);
    objc_msgSend_setIsEnterprisePersona_(a1, v23, isEnterprisePersona);
    isPersonalPersona = objc_msgSend_isPersonalPersona(v3, v24, v25);
    objc_msgSend_setIsPersonalPersona_(a1, v27, isPersonalPersona);
    isUniversalPersona = objc_msgSend_isUniversalPersona(v3, v28, v29);
    objc_msgSend_setIsUniversalPersona_(a1, v31, isUniversalPersona);
    isSystemPersona = objc_msgSend_isSystemPersona(v3, v32, v33);
    objc_msgSend_setIsSystemPersona_(a1, v35, isSystemPersona);
    isDefaultPersona = objc_msgSend_isDefaultPersona(v3, v36, v37);
    objc_msgSend_setIsDefaultPersona_(a1, v39, isDefaultPersona);
    isGuestPersona = objc_msgSend_isGuestPersona(v3, v40, v41);
    objc_msgSend_setIsGuestPersona_(a1, v43, isGuestPersona);
    isDataSeparatedPersona = objc_msgSend_isDataSeparatedPersona(v3, v44, v45);
    objc_msgSend_setIsDataSeparatedPersona_(a1, v47, isDataSeparatedPersona);
    objc_msgSend_userPersonaBundleIDList(v3, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserPersonaBundleIDList_(a1, v51, (uint64_t)v50);

    objc_msgSend_creationDate(v3, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCreationDate_(a1, v55, (uint64_t)v54);

    objc_msgSend_lastLoginDate(v3, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastLoginDate_(a1, v59, (uint64_t)v58);

    objc_msgSend_lastDisableDate(v3, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastDisableDate_(a1, v63, (uint64_t)v62);

    objc_msgSend_lastEnableDate(v3, v64, v65);
    v67 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setLastEnableDate_(a1, v66, (uint64_t)v67);
  }
}

id sub_18FAF7F7C(void *a1)
{
  void *v1;
  const char *v2;
  uint64_t v3;
  void *v4;

  if (a1)
  {
    sub_18FAF948C(MEMORY[0x1E0CB3A28], a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v1, v2, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t sub_18FAF7FCC(void *a1, const char *a2)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  if (!a1)
    return 0;
  objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend_BOOLValue(v2, v3, v4);
    v6 = 0;
  }
  else
  {
    v5 = 0;
    v6 = 2;
  }
  *__error() = v6;

  return v5;
}

uint64_t sub_18FAF8050(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  int v7;

  if (!a1)
    return 0;
  objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a3 = objc_msgSend_intValue(v4, v5, v6);
    v7 = 0;
  }
  else
  {
    v7 = 2;
  }
  *__error() = v7;

  return a3;
}

uint64_t sub_18FAF80D4(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  int v7;

  if (!a1)
    return 0;
  objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a3 = objc_msgSend_unsignedIntValue(v4, v5, v6);
    v7 = 0;
  }
  else
  {
    v7 = 2;
  }
  *__error() = v7;

  return a3;
}

uint64_t sub_18FAF8158(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  int v7;

  if (!a1)
    return 0;
  objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a3 = objc_msgSend_longLongValue(v4, v5, v6);
    v7 = 0;
  }
  else
  {
    v7 = 2;
  }
  *__error() = v7;

  return a3;
}

uint64_t sub_18FAF81DC(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  int v7;

  if (!a1)
    return 0;
  objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a3 = objc_msgSend_unsignedLongLongValue(v4, v5, v6);
    v7 = 0;
  }
  else
  {
    v7 = 2;
  }
  *__error() = v7;

  return a3;
}

id sub_18FAF8260(void *a1, const char *a2)
{
  void *v2;
  char isKindOfClass;
  int *v4;
  id v5;

  if (a1)
  {
    objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = __error();
    if ((isKindOfClass & 1) != 0)
    {
      *v4 = 0;
      v5 = v2;
    }
    else
    {
      v5 = 0;
      *v4 = 2;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

id sub_18FAF82DC(void *a1, const char *a2)
{
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v3 = v2;
    v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v3);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            *__error() = 2;

            v11 = 0;
            goto LABEL_14;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v9, (uint64_t)&v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }

    objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v10, (uint64_t)v3, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *__error() = 0;
LABEL_14:

  }
  else
  {
    v11 = 0;
    *__error() = 2;
  }

  return v11;
}

id sub_18FAF8474(void *a1, const char *a2)
{
  void *v2;
  void *v3;
  int v4;

  if (a1)
  {
    objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      sub_18FAF948C(MEMORY[0x1E0CB3A28], v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 2 * (v3 == 0);
    }
    else
    {
      v3 = 0;
      v4 = 2;
    }
    *__error() = v4;

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id sub_18FAF850C(void *a1, const char *a2)
{
  void *v2;
  char isKindOfClass;
  int *v4;
  id v5;

  if (a1)
  {
    objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = __error();
    if ((isKindOfClass & 1) != 0)
    {
      *v4 = 0;
      v5 = v2;
    }
    else
    {
      v5 = 0;
      *v4 = 2;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

id sub_18FAF8588(void *a1, const char *a2)
{
  void *v2;
  char isKindOfClass;
  int *v4;
  id v5;

  if (a1)
  {
    objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = __error();
    if ((isKindOfClass & 1) != 0)
    {
      *v4 = 0;
      v5 = v2;
    }
    else
    {
      v5 = 0;
      *v4 = 2;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

id sub_18FAF8604(uint64_t a1, const char *a2)
{
  void *v2;
  id v3;
  NSObject *v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v9 = 0;
  objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E0CB38B0], a2, a1, 200, 0, &v9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v9;
  if (!v2)
  {
    if (qword_1EE185048 != -1)
      dispatch_once(&qword_1EE185048, &unk_1E2A4A6E8);
    v4 = (id)qword_1EE185040;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = sub_18FAED604();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        v6 = v5;
      else
        v6 = v5 & 0xFFFFFFFE;
      if (v6)
      {
        v10 = 138543362;
        v11 = v3;
        v7 = (void *)_os_log_send_and_compose_impl();
        if (v7)
          sub_18FAED60C();
      }
      else
      {
        v7 = 0;
      }
      free(v7);
    }

  }
  return v2;
}

id sub_18FAF8780(uint64_t a1, const char *a2)
{
  void *v2;
  id v3;
  NSObject *v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v9 = 0;
  objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E0CB38B0], a2, a1, 200, 0, &v9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v9;
  if (!v2)
  {
    if (qword_1EE185048 != -1)
      dispatch_once(&qword_1EE185048, &unk_1E2A4A6E8);
    v4 = (id)qword_1EE185040;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = sub_18FAED604();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        v6 = v5;
      else
        v6 = v5 & 0xFFFFFFFE;
      if (v6)
      {
        v10 = 138412290;
        v11 = v3;
        v7 = (void *)_os_log_send_and_compose_impl();
        if (v7)
          sub_18FAED60C();
      }
      else
      {
        v7 = 0;
      }
      free(v7);
    }

  }
  return v2;
}

id sub_18FAF88FC(uint64_t a1, const char *a2)
{
  void *v2;
  id v3;
  NSObject *v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  NSObject *v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  id v12;
  id v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v14 = 0;
    objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E0CB38B0], a2, a1, 0, 0, &v14);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v14;
    if (v2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (qword_1EE185048 != -1)
          dispatch_once(&qword_1EE185048, &unk_1E2A4A6E8);
        v4 = (id)qword_1EE185040;
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          v15[0] = 0;
          v5 = sub_18FAED604();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
            v6 = v5;
          else
            v6 = v5 & 0xFFFFFFFE;
          if (v6)
          {
            v7 = (void *)_os_log_send_and_compose_impl();
            if (v7)
              sub_18FAED60C();
          }
          else
          {
            v7 = 0;
          }
          free(v7);
        }

        v12 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      if (qword_1EE185048 != -1)
        dispatch_once(&qword_1EE185048, &unk_1E2A4A6E8);
      v8 = (id)qword_1EE185040;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = sub_18FAED604();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          v10 = v9;
        else
          v10 = v9 & 0xFFFFFFFE;
        if (v10)
        {
          LODWORD(v15[0]) = 138543362;
          *(_QWORD *)((char *)v15 + 4) = v3;
          v11 = (void *)_os_log_send_and_compose_impl();
          if (v11)
            sub_18FAED60C();
        }
        else
        {
          v11 = 0;
        }
        free(v11);
      }

    }
    v12 = v2;
LABEL_29:

    return v12;
  }
  return 0;
}

id sub_18FAF8B78(uint64_t a1, const char *a2)
{
  void *v2;
  id v3;
  NSObject *v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  NSObject *v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  id v12;
  id v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v14 = 0;
    objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E0CB38B0], a2, a1, 0, 0, &v14);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v14;
    if (v2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (qword_1EE185048 != -1)
          dispatch_once(&qword_1EE185048, &unk_1E2A4A6E8);
        v4 = (id)qword_1EE185040;
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          v15[0] = 0;
          v5 = sub_18FAED604();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
            v6 = v5;
          else
            v6 = v5 & 0xFFFFFFFE;
          if (v6)
          {
            v7 = (void *)_os_log_send_and_compose_impl();
            if (v7)
              sub_18FAED60C();
          }
          else
          {
            v7 = 0;
          }
          free(v7);
        }

        v12 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      if (qword_1EE185048 != -1)
        dispatch_once(&qword_1EE185048, &unk_1E2A4A6E8);
      v8 = (id)qword_1EE185040;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = sub_18FAED604();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          v10 = v9;
        else
          v10 = v9 & 0xFFFFFFFE;
        if (v10)
        {
          LODWORD(v15[0]) = 138543362;
          *(_QWORD *)((char *)v15 + 4) = v3;
          v11 = (void *)_os_log_send_and_compose_impl();
          if (v11)
            sub_18FAED60C();
        }
        else
        {
          v11 = 0;
        }
        free(v11);
      }

    }
    v12 = v2;
LABEL_29:

    return v12;
  }
  return 0;
}

void sub_18FAF8DF4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(off_1EE184570, "default");
  v1 = (void *)qword_1EE185040;
  qword_1EE185040 = (uint64_t)v0;

}

void **sub_18FAF8E28(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  void **v10;
  id v11;
  const char *v12;
  void *v13;
  const char *v14;

  v9 = a2;
  objc_opt_self();
  v10 = (void **)objc_opt_new();
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13 = (void *)objc_msgSend_initWithFormat_arguments_(v11, v12, (uint64_t)v9, &a9);

  if (v13)
  {
    if (v10)
      objc_msgSend_addObject_(v10[2], v14, (uint64_t)v13);
    else
      objc_msgSend_addObject_(0, v14, (uint64_t)v13);
  }

  return v10;
}

id sub_18FAF8EB8(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a2;
  objc_opt_self();
  v5 = (void *)objc_opt_new();
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8 = (void *)objc_msgSend_initWithFormat_arguments_(v6, v7, (uint64_t)v4, a3);

  sub_18FAF8F3C((uint64_t)v5, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v8);
  return v5;
}

void sub_18FAF8F3C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v10;
  id v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;

  if (a1)
  {
    v10 = (objc_class *)MEMORY[0x1E0CB3940];
    v11 = a2;
    v12 = [v10 alloc];
    v14 = (void *)objc_msgSend_initWithFormat_arguments_(v12, v13, (uint64_t)v11, &a9);

    if (v14)
      objc_msgSend_addObject_(*(void **)(a1 + 16), v15, (uint64_t)v14);

  }
}

void sub_18FAF8FB4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v8 = objc_msgSend_uid(v5, v6, v7);
  sub_18FAE742C((uint64_t)v4, CFSTR("uid: %d"), v9, v10, v11, v12, v13, v14, v8);
  objc_msgSend_username(v5, v15, v16);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  sub_18FAF8F3C((uint64_t)v4, CFSTR("username: %@"), v17, v18, v19, v20, v21, v22, (uint64_t)v23);
}

id sub_18FAF904C(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a2;
  v3 = objc_opt_self();
  v4 = (void *)objc_opt_new();
  sub_18FAF8FB4(v3, v2, v4);

  return v4;
}

void **sub_18FAF90A4(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  id v11;
  uint64_t v12;
  void **v13;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;

  v10 = a2;
  v11 = a3;
  v12 = objc_opt_self();
  v13 = (void **)objc_opt_new();
  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  v16 = (void *)objc_msgSend_initWithFormat_arguments_(v14, v15, (uint64_t)v11, &a9);

  if (v16)
  {
    if (v13)
      objc_msgSend_addObject_(v13[1], v17, (uint64_t)v16);
    else
      objc_msgSend_addObject_(0, v17, (uint64_t)v16);
  }
  sub_18FAF8FB4(v12, v10, v13);

  return v13;
}

void **sub_18FAF9160(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  id v11;
  uint64_t v12;
  void **v13;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;

  v10 = a2;
  v11 = a3;
  v12 = objc_opt_self();
  v13 = (void **)objc_opt_new();
  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  v16 = (void *)objc_msgSend_initWithFormat_arguments_(v14, v15, (uint64_t)v11, &a9);

  if (v16)
  {
    if (v13)
      objc_msgSend_addObject_(v13[2], v17, (uint64_t)v16);
    else
      objc_msgSend_addObject_(0, v17, (uint64_t)v16);
  }
  sub_18FAF8FB4(v12, v10, v13);

  return v13;
}

void sub_18FAF921C(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v4 = a3;
  v18 = a2;
  objc_opt_self();
  sub_18FAEC1D0((uint64_t)v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE742C((uint64_t)v4, CFSTR("uuid: %@"), v6, v7, v8, v9, v10, v11, (uint64_t)v5);

  sub_18FAF8F3C((uint64_t)v4, CFSTR("task: %@"), v12, v13, v14, v15, v16, v17, (uint64_t)v18);
}

id sub_18FAF92AC(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a2;
  v3 = objc_opt_self();
  v4 = (void *)objc_opt_new();
  sub_18FAF921C(v3, v2, v4);

  return v4;
}

void **sub_18FAF9304(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  id v11;
  uint64_t v12;
  void **v13;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;

  v10 = a2;
  v11 = a3;
  v12 = objc_opt_self();
  v13 = (void **)objc_opt_new();
  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  v16 = (void *)objc_msgSend_initWithFormat_arguments_(v14, v15, (uint64_t)v11, &a9);

  if (v16)
  {
    if (v13)
      objc_msgSend_addObject_(v13[1], v17, (uint64_t)v16);
    else
      objc_msgSend_addObject_(0, v17, (uint64_t)v16);
  }
  sub_18FAF921C(v12, v10, v13);

  return v13;
}

void **sub_18FAF93C0(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  id v11;
  uint64_t v12;
  void **v13;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;

  v10 = a2;
  v11 = a3;
  v12 = objc_opt_self();
  v13 = (void **)objc_opt_new();
  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  v16 = (void *)objc_msgSend_initWithFormat_arguments_(v14, v15, (uint64_t)v11, &a9);

  if (v16)
  {
    if (v13)
      objc_msgSend_addObject_(v13[2], v17, (uint64_t)v16);
    else
      objc_msgSend_addObject_(0, v17, (uint64_t)v16);
  }
  sub_18FAF921C(v12, v10, v13);

  return v13;
}

void sub_18FAF947C(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

id sub_18FAF948C(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  const char *v4;
  void *v5;

  v2 = a2;
  objc_opt_self();
  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  v5 = (void *)objc_msgSend_initWithUUIDString_(v3, v4, (uint64_t)v2);

  return v5;
}

id sub_18FAF94D8(uint64_t a1, const __CFUUID *a2)
{
  __CFString *v3;
  __CFString *v4;
  void *v5;

  objc_opt_self();
  if (a2)
  {
    v3 = (__CFString *)CFUUIDCreateString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
    if (!v3)
      sub_18FB07E28();
    v4 = v3;
    sub_18FAF948C(MEMORY[0x1E0CB3A28], v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

CFUUIDRef sub_18FAF9548(void *a1, const char *a2, uint64_t a3)
{
  const __CFAllocator *v3;
  __CFString *v4;
  CFUUIDRef v5;

  if (!a1)
    return 0;
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  objc_msgSend_UUIDString(a1, a2, a3);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = CFUUIDCreateFromString(v3, v4);

  if (!v5)
    sub_18FB07E28();
  return v5;
}

UMPasswd *sub_18FAF95A4(uint64_t a1, uint64_t a2)
{
  UMPasswd *v3;

  objc_opt_self();
  v3 = objc_alloc_init(UMPasswd);
  sub_18FAEC230((uint64_t)v3, *(_DWORD *)(a2 + 20));
  return v3;
}

void sub_18FAF98BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (!WeakRetained)
      sub_18FAED518((uint64_t)UMAbort, CFSTR("You must have a stakeholder registered"), v10, v11, v12, v13, v14, v15, a9);
  }
}

void sub_18FAF9908(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (!WeakRetained || (v17 = *(_QWORD *)(a1 + 40), WeakRetained, v17 != 3))
      sub_18FAED518((uint64_t)UMAbort, CFSTR("You must have a sync stakeholder registered"), v11, v12, v13, v14, v15, v16, a9);
  }
}

void sub_18FAF9A28(uint64_t a1, void *a2)
{
  const char *v3;
  _QWORD *self;

  self = a2;
  if (self)
  {
    self[5] = 1;
    objc_setProperty_nonatomic_copy(self, v3, *(id *)(a1 + 40), 128);
  }
  sub_18FAF9AA0((uint64_t)self, *(void **)(a1 + 32));

}

uint64_t sub_18FAF9A80(uint64_t result, uint64_t a2)
{
  if (result)
    *(_QWORD *)(result + 40) = a2;
  return result;
}

void sub_18FAF9A8C(void *a1, char *newValue)
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 128);
}

void sub_18FAF9AA0(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id obj;

  v3 = a2;
  if (a1)
  {
    obj = v3;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (WeakRetained)
      sub_18FAED518((uint64_t)UMAbort, CFSTR("There is already a registered stakeholder"), v5, v6, v7, v8, v9, v10, v11);
    objc_storeWeak((id *)(a1 + 32), obj);
    sub_18FAFACC4(a1, 2, 0);
    v3 = obj;
  }

}

void sub_18FAF9BC4(uint64_t a1, uint64_t a2)
{
  if (a2)
    *(_QWORD *)(a2 + 40) = 2;
  sub_18FAF9AA0(a2, *(void **)(a1 + 32));
}

void sub_18FAF9CA4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void **v27;

  v27 = a2;
  if (sub_18FAED81C())
  {
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Setting up a listener for mach service"), v3, v4, v5, v6, v7, v8, v26);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAF8F3C((uint64_t)v9, CFSTR("name: %@"), v10, v11, v12, v13, v14, v15, *(_QWORD *)(a1 + 32));
    sub_18FAE9AB8();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v16, v9);

    v17 = objc_alloc(MEMORY[0x1E0CB3B58]);
    v19 = (void *)objc_msgSend_initWithMachServiceName_(v17, v18, *(_QWORD *)(a1 + 32));
    sub_18FAF9DB8((uint64_t)v27, v19);

    v21 = *(_QWORD *)(a1 + 40);
    if (v27)
    {
      objc_msgSend_setDelegate_(v27[30], v20, v21);
      objc_msgSend_resume(v27[30], v22, v23);
    }
    else
    {
      objc_msgSend_setDelegate_(0, v20, v21);
      objc_msgSend_resume(0, v24, v25);
    }

  }
  if (v27)
    v27[5] = (void *)3;
  sub_18FAF9DD4((uint64_t)v27, *(void **)(a1 + 32));
  sub_18FAF9AA0((uint64_t)v27, *(void **)(a1 + 48));

}

void sub_18FAF9DB8(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 240), a2);
}

uint64_t sub_18FAF9DC8(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 240);
  return result;
}

void sub_18FAF9DD4(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

void sub_18FAF9EB4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  id WeakRetained;
  const char *v19;
  char isEqual;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  id *v30;
  uint64_t v31;
  uint64_t v32;
  id *v33;

  v33 = a2;
  sub_18FAE9AB8();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v3, CFSTR("Unregister stakeholder"), v4, v5, v6, v7, v8, v9, v31);

  sub_18FAF98BC((uint64_t)v33, v10, v11, v12, v13, v14, v15, v16, v32);
  if (v33)
  {
    WeakRetained = objc_loadWeakRetained(v33 + 4);
    isEqual = objc_msgSend_isEqual_(WeakRetained, v19, *(_QWORD *)(a1 + 32));
  }
  else
  {
    WeakRetained = 0;
    isEqual = objc_msgSend_isEqual_(0, v17, *(_QWORD *)(a1 + 32));
  }
  v21 = isEqual;

  if ((v21 & 1) == 0)
    sub_18FAED518((uint64_t)UMAbort, CFSTR("%@ is not the current stakeholder"), v22, v23, v24, v25, v26, v27, *(_QWORD *)(a1 + 32));
  if (v33)
  {
    v33[7] = *(id *)(a1 + 48);
    sub_18FAF9FD8((uint64_t)v33, *(void **)(a1 + 40));
    sub_18FAFACC4((uint64_t)v33, 3, 0);
    if (v33[5] == (id)3)
      objc_msgSend_invalidate(v33[30], v28, v29);
    objc_storeWeak(v33 + 4, 0);
    v30 = v33;
    v33[5] = 0;
    *((_BYTE *)v33 + 9) = 0;
  }
  else
  {
    sub_18FAF9FD8(0, *(void **)(a1 + 40));
    v30 = 0;
  }

}

void sub_18FAF9FD8(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

void sub_18FAF9FE8(uint64_t a1, uint64_t a2)
{
  if (a1)
    sub_18FAFACC4(a1, a2, 0);
}

uint64_t sub_18FAF9FF8(uint64_t result, char a2)
{
  if (result)
    *(_BYTE *)(result + 9) = a2;
  return result;
}

void sub_18FAFA0B0(uint64_t a1, void *a2)
{
  void *v2;
  SEL v3;
  id v4;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v4 = a2;
    objc_setProperty_nonatomic_copy(v4, v3, v2, 136);
    sub_18FAFACC4((uint64_t)v4, 1, 0);

  }
}

void sub_18FAFA104(void *a1, char *newValue)
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 136);
}

void sub_18FAFA1B8(uint64_t a1, void *a2)
{
  void *v2;
  SEL v3;
  id v4;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v4 = a2;
    objc_setProperty_nonatomic_copy(v4, v3, v2, 160);
    sub_18FAFACC4((uint64_t)v4, 12, 0);

  }
}

void sub_18FAFA20C(void *a1, char *newValue)
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 160);
}

void sub_18FAFA364(uint64_t a1, void *a2)
{
  const char *v3;
  void *v4;
  void *v5;
  const char *v6;
  id self;

  self = a2;
  sub_18FB05FDC(*(uint64_t **)(a1 + 32), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAEF1F4((uint64_t)UMMobileKeyBag, *(void **)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAFA424((uint64_t)self, v5);

  sub_18FAFA434((uint64_t)self, *(void **)(a1 + 48));
  sub_18FAFA444((uint64_t)self, v4);
  sub_18FAFA454((uint64_t)self, *(void **)(a1 + 56));
  if (self)
  {
    objc_setProperty_nonatomic_copy(self, v6, *(id *)(a1 + 64), 136);
    sub_18FAFACC4((uint64_t)self, 0, 0);
  }

}

void sub_18FAFA424(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 72), a2);
}

void sub_18FAFA434(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 80), a2);
}

void sub_18FAFA444(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 88), a2);
}

void sub_18FAFA454(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 96), a2);
}

void sub_18FAFA59C(uint64_t a1, void *a2)
{
  const char *v3;
  void *v4;
  void *v5;
  const char *v6;
  id self;

  self = a2;
  sub_18FB05FDC(*(uint64_t **)(a1 + 32), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAEF1F4((uint64_t)UMMobileKeyBag, *(void **)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAFA424((uint64_t)self, v5);

  sub_18FAFA434((uint64_t)self, *(void **)(a1 + 48));
  sub_18FAFA444((uint64_t)self, v4);
  sub_18FAFA454((uint64_t)self, *(void **)(a1 + 56));
  if (self)
  {
    objc_setProperty_nonatomic_copy(self, v6, *(id *)(a1 + 64), 152);
    sub_18FAFACC4((uint64_t)self, 13, 0);
  }

}

void sub_18FAFA65C(void *a1, char *newValue)
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 152);
}

void sub_18FAFA710(uint64_t a1, void *a2)
{
  void *v2;
  SEL v3;
  id v4;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v4 = a2;
    objc_setProperty_nonatomic_copy(v4, v3, v2, 168);
    sub_18FAFACC4((uint64_t)v4, 14, 0);

  }
}

void sub_18FAFA764(void *a1, char *newValue)
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 168);
}

void sub_18FAFA818(uint64_t a1, void *a2)
{
  void *v2;
  SEL v3;
  id v4;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v4 = a2;
    objc_setProperty_nonatomic_copy(v4, v3, v2, 144);
    sub_18FAFACC4((uint64_t)v4, 10, 0);

  }
}

void sub_18FAFA86C(void *a1, char *newValue)
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 144);
}

void sub_18FAFA8CC(uint64_t a1, void *a2)
{
  SEL v2;
  id v3;

  if (a2)
  {
    v3 = a2;
    objc_setProperty_nonatomic_copy(v3, v2, 0, 144);
    sub_18FAFACC4((uint64_t)v3, 11, 0);

  }
}

void sub_18FAFA9B4(uint64_t a1, void *a2)
{
  void *v2;
  SEL v3;
  id v4;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v4 = a2;
    objc_setProperty_nonatomic_copy(v4, v3, v2, 208);
    sub_18FAFACC4((uint64_t)v4, 8, 0);

  }
}

void sub_18FAFAA08(void *a1, char *newValue)
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 208);
}

void sub_18FAFAA68(uint64_t a1, void *a2)
{
  SEL v2;
  id v3;

  if (a2)
  {
    v3 = a2;
    objc_setProperty_nonatomic_copy(v3, v2, 0, 208);
    sub_18FAFACC4((uint64_t)v3, 9, 0);

  }
}

void sub_18FAFAAB0(void *a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  if (a1)
  {
    sub_18FAE8D1C();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = sub_18FAFAB50;
    v5[3] = &unk_1E2A4ACB8;
    v6 = v3;
    sub_18FAEBEE8((uint64_t)v4, a1, v5);

  }
}

void sub_18FAFAB50(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  id v5;
  char isKindOfClass;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;

  v3 = a2;
  v45 = v3;
  if (v3)
    v4 = (void *)v3[24];
  else
    v4 = 0;
  v5 = v4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  sub_18FAE9AB8();
  v7 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v7;
  if ((isKindOfClass & 1) != 0)
  {
    sub_18FAE71DC(v7, CFSTR("Add user sync task"), v8, v9, v10, v11, v12, v13, v41);

    sub_18FAF9908((uint64_t)v45, v15, v16, v17, v18, v19, v20, v21, v42);
    if (v45)
      v22 = (void *)v45[25];
    else
      v22 = 0;
    v23 = v22;

    v24 = 6;
    v5 = v23;
    objc_msgSend_addObject_(v23, v25, *(_QWORD *)(a1 + 32));
  }
  else
  {
    sub_18FAE71DC(v7, CFSTR("Add user switch blocking task"), v8, v9, v10, v11, v12, v13, v41);

    sub_18FAF98BC((uint64_t)v45, v26, v27, v28, v29, v30, v31, v32, v44);
    v24 = 4;
    objc_msgSend_addObject_(v5, v33, *(_QWORD *)(a1 + 32));
  }
  if (v45 && *((_BYTE *)v45 + 9))
  {
    sub_18FAE9AB8();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE71DC((uint64_t)v34, CFSTR("Already registered stakeholder, so telling server to add task"), v35, v36, v37, v38, v39, v40, v43);

    sub_18FAFACC4((uint64_t)v45, v24, *(void **)(a1 + 32));
  }

}

uint64_t sub_18FAFAC98(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 192);
  return result;
}

uint64_t sub_18FAFACA4(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 200);
  return result;
}

BOOL sub_18FAFACB0(_BOOL8 result)
{
  if (result)
    return *(_BYTE *)(result + 9) != 0;
  return result;
}

void sub_18FAFACC4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  const char *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  const char *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  const char *v63;
  void *v64;
  const char *v65;
  void *v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  id v83;
  const char *v84;
  void *v85;
  const char *v86;
  unint64_t v87;
  __CFString *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  const char *v97;
  void *v98;
  const char *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  const char *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  id v118;
  const char *v119;
  void *v120;
  id v121;
  const char *v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  const char *v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  const char *v140;
  void *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  const char *v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  const char *v159;
  void *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  void *v168;
  id v169;
  const char *v170;
  void *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  const char *v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  const char *v188;
  void *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  const char *v196;
  const char *v197;
  void *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  id v205;
  const char *v206;
  void *v207;
  uint64_t v208;
  id v209;
  const char *v210;
  void *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  const char *v218;
  const char *v219;
  void *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  const char *v227;
  const char *v228;
  uint64_t v229;
  void *v230;
  void *v231;
  unsigned int v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  _QWORD v237[4];
  id v238;
  _QWORD v239[4];
  id v240;
  _QWORD v241[4];
  id v242;
  _QWORD v243[4];
  id v244;
  _QWORD v245[4];
  id v246;
  _QWORD v247[4];
  id v248;
  _QWORD v249[4];
  id v250;
  _QWORD v251[4];
  id v252;
  _QWORD v253[4];
  id v254;
  id location[2];

  v5 = a3;
  if (!a1)
    goto LABEL_48;
  if ((sub_18FAE9DE8() & 1) == 0 && a2 && a2 != 15)
  {
    sub_18FAEA1C0();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = CFSTR("_sendXPCMessageToServerOfType not applicable, bailing as its not multiUser");
    goto LABEL_17;
  }
  if ((sub_18FAED81C() & 1) != 0)
  {
    sub_18FAEA1C0();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("RD: _sendXPCMessageToServerOfType in sync bubble"), v7, v8, v9, v10, v11, v12, v229);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v6, v13);

  }
  else
  {
    sub_18FAEAFB4(a1);
  }
  if (!*(_QWORD *)(a1 + 224))
  {
    sub_18FAEA1C0();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = CFSTR("no xpc connection to send message to server");
LABEL_17:
    sub_18FAE99B4((uint64_t)UMLogMessage, v26, v19, v20, v21, v22, v23, v24, v229);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v25, v27);

    goto LABEL_48;
  }
  if (qword_1EE185058 != -1)
    dispatch_once(&qword_1EE185058, &unk_1E2A4ADF8);
  v232 = dword_1EE185050;
  objc_initWeak(location, (id)a1);
  v14 = MEMORY[0x1E0C809B0];
  v253[0] = MEMORY[0x1E0C809B0];
  v253[1] = 3221225472;
  v253[2] = sub_18FAFC164;
  v253[3] = &unk_1E2A4AE88;
  objc_copyWeak(&v254, location);
  v236 = (void *)MEMORY[0x194007B90](v253);
  v251[0] = v14;
  v251[1] = 3221225472;
  v251[2] = sub_18FAFC238;
  v251[3] = &unk_1E2A4AE88;
  objc_copyWeak(&v252, location);
  v235 = (void *)MEMORY[0x194007B90](v251);
  v249[0] = v14;
  v249[1] = 3221225472;
  v249[2] = sub_18FAFC300;
  v249[3] = &unk_1E2A4AE88;
  objc_copyWeak(&v250, location);
  v234 = (void *)MEMORY[0x194007B90](v249);
  v247[0] = v14;
  v247[1] = 3221225472;
  v247[2] = sub_18FAFC3D4;
  v247[3] = &unk_1E2A4AE88;
  objc_copyWeak(&v248, location);
  v233 = (void *)MEMORY[0x194007B90](v247);
  v245[0] = v14;
  v245[1] = 3221225472;
  v245[2] = sub_18FAFC4A8;
  v245[3] = &unk_1E2A4AEB0;
  objc_copyWeak(&v246, location);
  v15 = (void *)MEMORY[0x194007B90](v245);
  switch(a2)
  {
    case 0:
      v39 = v15;
      sub_18FAEA1C0();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE71DC((uint64_t)v40, CFSTR("Tell server switch to user"), v41, v42, v43, v44, v45, v46, v229);

      v47 = *(id *)(a1 + 224);
      objc_msgSend_remoteObjectProxyWithErrorHandler_(v47, v48, (uint64_t)&unk_1E2A4AED0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = *(id *)(a1 + 72);
      v51 = *(id *)(a1 + 80);
      v52 = *(id *)(a1 + 88);
      v53 = *(id *)(a1 + 96);
      objc_msgSend_switchToUser_passcodeData_context_preferences_pid_completionHandler_(v49, v54, (uint64_t)v50, v51, v52, v53, v232, v236);
      goto LABEL_35;
    case 1:
      v39 = v15;
      sub_18FAEA1C0();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE71DC((uint64_t)v55, CFSTR("Tell server switch to login screen"), v56, v57, v58, v59, v60, v61, v229);

      v62 = *(id *)(a1 + 224);
      objc_msgSend_remoteObjectProxyWithErrorHandler_(v62, v63, (uint64_t)&unk_1E2A4AF10);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_switchToLoginUserWithPID_completionHandler_(v64, v65, v232, v236);
      goto LABEL_37;
    case 2:
      v231 = v15;
      v243[0] = v14;
      v243[1] = 3221225472;
      v243[2] = sub_18FAFC834;
      v243[3] = &unk_1E2A4AE88;
      objc_copyWeak(&v244, location);
      v66 = (void *)MEMORY[0x194007B90](v243);
      v67 = *(_QWORD *)(a1 + 40);
      switch(v67)
      {
        case 1:
          sub_18FAEA1C0();
          v211 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18FAE71DC((uint64_t)v211, CFSTR("Tell server register user switch stakeholder"), v212, v213, v214, v215, v216, v217, v229);

          v68 = *(id *)(a1 + 224);
          objc_msgSend_remoteObjectProxyWithErrorHandler_(v68, v218, (uint64_t)&unk_1E2A4AF90);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_registerUserSwitchStakeholderForPID_completionHandler_(v75, v219, v232, v66);
          break;
        case 2:
          sub_18FAEA1C0();
          v220 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18FAE71DC((uint64_t)v220, CFSTR("Tell server register critical user switch stakeholder"), v221, v222, v223, v224, v225, v226, v229);

          v68 = *(id *)(a1 + 224);
          objc_msgSend_remoteObjectProxyWithErrorHandler_(v68, v227, (uint64_t)&unk_1E2A4AFB0);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_registerCriticalUserSwitchStakeholderForPID_completionHandler_(v75, v228, v232, v66);
          break;
        case 3:
          v68 = *(id *)(a1 + 48);
          sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Tell server register user sync stakeholder with mach service"), v69, v70, v71, v72, v73, v74, v229);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18FAF8F3C((uint64_t)v75, CFSTR("name: %@"), v76, v77, v78, v79, v80, v81, (uint64_t)v68);
          sub_18FAEA1C0();
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18FAE964C((uint64_t)v82, v75);

          v83 = *(id *)(a1 + 224);
          objc_msgSend_remoteObjectProxyWithErrorHandler_(v83, v84, (uint64_t)&unk_1E2A4A768);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_registerUserSyncStakeholderForPID_machServiceName_completionHandler_(v85, v86, v232, v68, v66);

          break;
        default:
          goto LABEL_54;
      }

LABEL_54:
      objc_destroyWeak(&v244);
      v15 = v231;
LABEL_47:

      objc_destroyWeak(&v246);
      objc_destroyWeak(&v248);

      objc_destroyWeak(&v250);
      objc_destroyWeak(&v252);

      objc_destroyWeak(&v254);
      objc_destroyWeak(location);
      break;
    case 3:
      v87 = *(_QWORD *)(a1 + 56);
      v39 = v15;
      if (v87 >= 3)
        v88 = 0;
      else
        v88 = off_1E2A4B490[v87];
      sub_18FAEA1C0();
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE71DC((uint64_t)v198, CFSTR("Tell server unregister stakeholder, status: %@"), v199, v200, v201, v202, v203, v204, (uint64_t)v88);

      v205 = *(id *)(a1 + 224);
      objc_msgSend_remoteObjectProxyWithErrorHandler_(v205, v206, (uint64_t)&unk_1E2A4AFD0);
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      v208 = *(_QWORD *)(a1 + 56);
      v209 = *(id *)(a1 + 64);
      objc_msgSend_unregisterStakeholderForPID_status_reason_completionHandler_(v207, v210, v232, v208, v209, &unk_1E2A4AFF0);

      goto LABEL_40;
    case 4:
    case 5:
    case 6:
    case 7:
      v230 = v15;
      v16 = v5;
      sub_18FAF2030((uint64_t)UMMobileKeyBag, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((a2 | 2) == 6 && *(_BYTE *)(a1 + 8))
      {
        ++*(_QWORD *)(a1 + 216);
        v241[0] = v14;
        v241[1] = 3221225472;
        v241[2] = sub_18FAFCF60;
        v241[3] = &unk_1E2A4AE88;
        objc_copyWeak(&v242, location);
        v18 = (void *)MEMORY[0x194007B90](v241);
        objc_destroyWeak(&v242);
      }
      else
      {
        v18 = &unk_1E2A4B010;
      }
      switch(a2)
      {
        case 4:
          sub_18FAEA1C0();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18FAF9304((uint64_t)UMLogMessage, v16, CFSTR("Tell server add user switch blocking task"), v29, v30, v31, v32, v33, v229);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18FAE964C((uint64_t)v28, v34);

          v35 = *(id *)(a1 + 224);
          objc_msgSend_remoteObjectProxyWithErrorHandler_(v35, v36, (uint64_t)&unk_1E2A4B030);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addUserSwitchBlockingTask_forPID_completionHandler_(v37, v38, (uint64_t)v17, v232, v18);
          goto LABEL_44;
        case 5:
          sub_18FAEA1C0();
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18FAF9304((uint64_t)UMLogMessage, v16, CFSTR("Tell server remove user switch blocking task"), v172, v173, v174, v175, v176, v229);
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18FAE964C((uint64_t)v171, v177);

          v35 = *(id *)(a1 + 224);
          objc_msgSend_remoteObjectProxyWithErrorHandler_(v35, v178, (uint64_t)&unk_1E2A4B050);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeUserSwitchBlockingTask_forPID_completionHandler_(v37, v179, (uint64_t)v17, v232, v18);
          goto LABEL_44;
        case 6:
          sub_18FAEA1C0();
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18FAF9304((uint64_t)UMLogMessage, v16, CFSTR("Tell server add user sync task"), v181, v182, v183, v184, v185, v229);
          v186 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18FAE964C((uint64_t)v180, v186);

          v35 = *(id *)(a1 + 224);
          objc_msgSend_remoteObjectProxyWithErrorHandler_(v35, v187, (uint64_t)&unk_1E2A4B070);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addUserSyncTask_forPID_completionHandler_(v37, v188, (uint64_t)v17, v232, v18);
          goto LABEL_44;
        case 7:
          sub_18FAEA1C0();
          v189 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18FAF9304((uint64_t)UMLogMessage, v16, CFSTR("Tell server remove user sync task"), v190, v191, v192, v193, v194, v229);
          v195 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18FAE964C((uint64_t)v189, v195);

          v35 = *(id *)(a1 + 224);
          objc_msgSend_remoteObjectProxyWithErrorHandler_(v35, v196, (uint64_t)&unk_1E2A4B090);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeUserSyncTask_forPID_completionHandler_(v37, v197, (uint64_t)v17, v232, v18);
LABEL_44:

          break;
        default:
          break;
      }

      goto LABEL_46;
    case 8:
      v230 = v15;
      sub_18FAEA1C0();
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE71DC((uint64_t)v89, CFSTR("Tell server terminate sync"), v90, v91, v92, v93, v94, v95, v229);

      v96 = *(id *)(a1 + 224);
      objc_msgSend_remoteObjectProxyWithErrorHandler_(v96, v97, (uint64_t)&unk_1E2A4B0B0);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v239[0] = v14;
      v239[1] = 3221225472;
      v239[2] = sub_18FAFD2E4;
      v239[3] = &unk_1E2A4AE88;
      objc_copyWeak(&v240, location);
      objc_msgSend_terminateSyncBubbleForPID_completionHandler_(v98, v99, v232, v239);

      objc_destroyWeak(&v240);
LABEL_46:
      v15 = v230;
      goto LABEL_47;
    case 9:
      v39 = v15;
      sub_18FAEA1C0();
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE71DC((uint64_t)v100, CFSTR("Tell server resume sync"), v101, v102, v103, v104, v105, v106, v229);

      v62 = *(id *)(a1 + 224);
      objc_msgSend_remoteObjectProxyWithErrorHandler_(v62, v107, (uint64_t)&unk_1E2A4B0F0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_resumeSyncBubbleForPID_completionHandler_(v64, v108, v232, &unk_1E2A4B110);
      goto LABEL_37;
    case 10:
      v109 = v15;
      sub_18FAEA1C0();
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE71DC((uint64_t)v110, CFSTR("Tell server suspend quotas"), v111, v112, v113, v114, v115, v116, v229);

      v117 = *(id *)(a1 + 144);
      v118 = *(id *)(a1 + 224);
      objc_msgSend_remoteObjectProxyWithErrorHandler_(v118, v119, (uint64_t)&unk_1E2A4A7A8);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v237[0] = v14;
      v237[1] = 3221225472;
      v237[2] = sub_18FAFD4DC;
      v237[3] = &unk_1E2A4ABA0;
      v121 = v117;
      v238 = v121;
      objc_msgSend_suspendUserQuotaForPID_completionHandler_(v120, v122, v232, v237);

      v15 = v109;
      goto LABEL_47;
    case 11:
      v39 = v15;
      sub_18FAEA1C0();
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE71DC((uint64_t)v123, CFSTR("Tell server resume quotas"), v124, v125, v126, v127, v128, v129, v229);

      v62 = *(id *)(a1 + 224);
      objc_msgSend_remoteObjectProxyWithErrorHandler_(v62, v130, (uint64_t)&unk_1E2A4B130);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_reengageUserQuotaForPID_completionHandler_(v64, v131, v232, &unk_1E2A4B150);
      goto LABEL_37;
    case 12:
      v39 = v15;
      sub_18FAEA1C0();
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE71DC((uint64_t)v132, CFSTR("Tell server Logout to LoginSession Screen"), v133, v134, v135, v136, v137, v138, v229);

      v62 = *(id *)(a1 + 224);
      objc_msgSend_remoteObjectProxyWithErrorHandler_(v62, v139, (uint64_t)&unk_1E2A4AF50);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_logoutToLoginSessionWithPID_completionHandler_(v64, v140, v232, v234);
      goto LABEL_37;
    case 13:
      v39 = v15;
      sub_18FAEA1C0();
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE71DC((uint64_t)v141, CFSTR("Tell server switch to direct switch to User"), v142, v143, v144, v145, v146, v147, v229);

      v47 = *(id *)(a1 + 224);
      objc_msgSend_remoteObjectProxyWithErrorHandler_(v47, v148, (uint64_t)&unk_1E2A4AEF0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = *(id *)(a1 + 72);
      v51 = *(id *)(a1 + 80);
      v52 = *(id *)(a1 + 88);
      v53 = *(id *)(a1 + 96);
      objc_msgSend_directSwitchToUser_passcodeData_context_preferences_pid_completionHandler_(v49, v149, (uint64_t)v50, v51, v52, v53, v232, v235);
LABEL_35:

      goto LABEL_39;
    case 14:
      v39 = v15;
      sub_18FAEA1C0();
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE71DC((uint64_t)v150, CFSTR("Tell server switch to checkinLoginUI"), v151, v152, v153, v154, v155, v156, v229);

      v62 = *(id *)(a1 + 224);
      objc_msgSend_remoteObjectProxyWithErrorHandler_(v62, v157, (uint64_t)&unk_1E2A4AF30);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v158 = getpid();
      objc_msgSend_loginUICheckinForPID_completionHandler_(v64, v159, v158, v233);
LABEL_37:

      goto LABEL_40;
    case 15:
      v39 = v15;
      sub_18FAEA1C0();
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE71DC((uint64_t)v160, CFSTR("Tell server to Provision Device"), v161, v162, v163, v164, v165, v166, v229);

      v47 = *(id *)(a1 + 224);
      objc_msgSend_remoteObjectProxyWithErrorHandler_(v47, v167, (uint64_t)&unk_1E2A4A7C8);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      v169 = *(id *)(a1 + 112);
      objc_msgSend_provisionDevice_forPid_completionHandler_(v168, v170, (uint64_t)v169, v232, v39);

LABEL_39:
LABEL_40:
      v15 = v39;
      goto LABEL_47;
    default:
      goto LABEL_47;
  }
LABEL_48:

}

void sub_18FAFB9D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, id *a12, uint64_t a13, id *a14, id *a15)
{
  id *v15;
  id *v16;
  id *v17;
  uint64_t v18;

  objc_destroyWeak(v15);
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(a14);
  objc_destroyWeak(a15);
  objc_destroyWeak(a12);
  objc_destroyWeak((id *)(v18 - 112));
  _Unwind_Resume(a1);
}

void sub_18FAFBA98(void *a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  if (a1)
  {
    sub_18FAE8D1C();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = sub_18FAFBB38;
    v5[3] = &unk_1E2A4ACB8;
    v6 = v3;
    sub_18FAEBEE8((uint64_t)v4, a1, v5);

  }
}

void sub_18FAFBB38(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  id v5;
  char isKindOfClass;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;

  v3 = a2;
  v45 = v3;
  if (v3)
    v4 = (void *)v3[24];
  else
    v4 = 0;
  v5 = v4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  sub_18FAE9AB8();
  v7 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v7;
  if ((isKindOfClass & 1) != 0)
  {
    sub_18FAE71DC(v7, CFSTR("Remove user sync task"), v8, v9, v10, v11, v12, v13, v41);

    sub_18FAF9908((uint64_t)v45, v15, v16, v17, v18, v19, v20, v21, v42);
    if (v45)
      v22 = (void *)v45[25];
    else
      v22 = 0;
    v23 = v22;

    v24 = 7;
    v5 = v23;
    objc_msgSend_removeObject_(v23, v25, *(_QWORD *)(a1 + 32));
  }
  else
  {
    sub_18FAE71DC(v7, CFSTR("Remove user switch blocking task"), v8, v9, v10, v11, v12, v13, v41);

    sub_18FAF98BC((uint64_t)v45, v26, v27, v28, v29, v30, v31, v32, v44);
    v24 = 5;
    objc_msgSend_removeObject_(v5, v33, *(_QWORD *)(a1 + 32));
  }
  if (v45 && *((_BYTE *)v45 + 9))
  {
    sub_18FAE9AB8();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE71DC((uint64_t)v34, CFSTR("Already registered stakeholder, so telling server to remove task"), v35, v36, v37, v38, v39, v40, v43);

    sub_18FAFACC4((uint64_t)v45, v24, *(void **)(a1 + 32));
  }

}

uint64_t sub_18FAFBCBC(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 224);
  return result;
}

void sub_18FAFBCC8(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v2 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to notify usermanagerd that login is complete: "), v3, v4, v5, v6, v7, v8, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v17, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_18FAEA1C0();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v15, v17);

}

uint64_t sub_18FAFBD44(uint64_t result)
{
  if (result)
  {
    if (qword_1EE185058 != -1)
      dispatch_once(&qword_1EE185058, &unk_1E2A4ADF8);
    return dword_1EE185050;
  }
  return result;
}

uint64_t sub_18FAFBD88()
{
  uint64_t result;

  result = getpid();
  dword_1EE185050 = result;
  return result;
}

void sub_18FAFBDA4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  uint64_t v10;
  id v11;

  sub_18FAEA1C0();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v2, CFSTR("XPC connection interrupted"), v3, v4, v5, v6, v7, v8, v10);

  sub_18FAE8D1C();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_18FAEBEE8((uint64_t)v11, WeakRetained, &unk_1E2A4AE18);

}

void sub_18FAFBE28(uint64_t a1, void *a2)
{
  _DWORD *v2;
  unsigned int v3;
  _DWORD *v4;

  v2 = a2;
  if (!v2)
    goto LABEL_4;
  v3 = v2[4];
  if (v3 <= 4)
  {
    v2[4] = v3 + 1;
LABEL_4:
    v4 = v2;
    sub_18FAFBE80((uint64_t)v2);
    v2 = v4;
  }

}

uint64_t sub_18FAFBE68(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 16);
  return result;
}

uint64_t sub_18FAFBE74(uint64_t result, int a2)
{
  if (result)
    *(_DWORD *)(result + 16) = a2;
  return result;
}

void sub_18FAFBE80(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id WeakRetained;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  BOOL v33;
  _BOOL8 v34;
  __CFString *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  __CFString *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  if (a1)
  {
    sub_18FAEA1C0();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE71DC((uint64_t)v2, CFSTR("Resend XPC messages"), v3, v4, v5, v6, v7, v8, v61);

    *(_BYTE *)(a1 + 9) = 0;
    *(_BYTE *)(a1 + 11) = 0;
    if (*(_QWORD *)(a1 + 144))
    {
      sub_18FAE9AB8();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE71DC((uint64_t)v9, CFSTR("Quota suspension requested"), v10, v11, v12, v13, v14, v15, v62);

      sub_18FAFACC4(a1, 10, 0);
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (WeakRetained)
    {
      sub_18FAE9AB8();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE71DC((uint64_t)v17, CFSTR("We have a stakeholder, so re-register"), v18, v19, v20, v21, v22, v23, v62);

      sub_18FAFACC4(a1, 2, 0);
    }
    if (*(_QWORD *)(a1 + 208))
      sub_18FAFACC4(a1, 8, 0);
    if (*(_QWORD *)(a1 + 136))
    {
      v24 = *(_QWORD *)(a1 + 72);
      sub_18FAE9AB8();
      v25 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v25;
      v33 = v24 == 0;
      v34 = v24 == 0;
      if (v33)
        v35 = CFSTR("Switch to login user initiated");
      else
        v35 = CFSTR("Switch to user initiated");
      sub_18FAE71DC(v25, v35, v26, v27, v28, v29, v30, v31, v62);

      sub_18FAFACC4(a1, v34, 0);
    }
    if (*(_QWORD *)(a1 + 120) && *(_QWORD *)(a1 + 112))
    {
      sub_18FAE9AB8();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE71DC((uint64_t)v36, CFSTR("Provision of Device Reinitiated"), v37, v38, v39, v40, v41, v42, v62);

      sub_18FAFACC4(a1, 15, 0);
    }
    if (*(_QWORD *)(a1 + 160))
    {
      sub_18FAE9AB8();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE71DC((uint64_t)v43, CFSTR("logout to Login Session initiated"), v44, v45, v46, v47, v48, v49, v62);

      sub_18FAFACC4(a1, 12, 0);
    }
    if (*(_QWORD *)(a1 + 152))
    {
      v50 = *(_QWORD *)(a1 + 72);
      sub_18FAE9AB8();
      v51 = objc_claimAutoreleasedReturnValue();
      v58 = (void *)v51;
      if (v50)
        v59 = CFSTR("Switch to Direct user initiated");
      else
        v59 = CFSTR("Switch to login user initiated");
      if (v50)
        v60 = 13;
      else
        v60 = 1;
      sub_18FAE71DC(v51, v59, v52, v53, v54, v55, v56, v57, v62);

      sub_18FAFACC4(a1, v60, 0);
    }
  }
}

void sub_18FAFC094(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  uint64_t v10;
  id v11;

  sub_18FAEA1C0();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v2, CFSTR("XPC connection invalidated"), v3, v4, v5, v6, v7, v8, v10);

  sub_18FAE8D1C();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_18FAEBEE8((uint64_t)v11, WeakRetained, &unk_1E2A4AE60);

}

void sub_18FAFC118(uint64_t a1, const char *a2, uint64_t a3)
{
  sub_18FAFC120((uint64_t)a2, a2, a3);
}

void sub_18FAFC120(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;

  if (a1)
  {
    objc_msgSend_invalidate(*(void **)(a1 + 224), a2, a3);
    v4 = *(void **)(a1 + 224);
    *(_QWORD *)(a1 + 224) = 0;

  }
}

void sub_18FAFC154(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 224), a2);
}

void sub_18FAFC164(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void (**v6)(id, void *);
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  sub_18FAED58C((uint64_t)UMAbort, v11, CFSTR("switch user"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    v5 = (void *)*((_QWORD *)WeakRetained + 17);
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    if (v11)
    {
      if (objc_msgSend_code(v11, v7, v8) == 16)
        v9 = 5;
      else
        v9 = 8;
      sub_18FAE7908((uint64_t)UMError, v9, v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    v6[2](v6, v10);

  }
}

uint64_t sub_18FAFC22C(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 136);
  return result;
}

void sub_18FAFC238(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void (**v6)(id, void *);
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  sub_18FAED58C((uint64_t)UMAbort, v11, CFSTR("Direct switch user"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    v5 = (void *)*((_QWORD *)WeakRetained + 17);
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    if (v11)
    {
      if (objc_msgSend_code(v11, v7, v8) == 16)
        v9 = 5;
      else
        v9 = 8;
      sub_18FAE7908((uint64_t)UMError, v9, v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    v6[2](v6, v10);

  }
}

void sub_18FAFC300(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void (**v6)(id, void *);
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  sub_18FAED58C((uint64_t)UMAbort, v11, CFSTR("Logout to Login Session"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    v5 = (void *)*((_QWORD *)WeakRetained + 20);
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    if (v11)
    {
      if (objc_msgSend_code(v11, v7, v8) == 16)
        v9 = 5;
      else
        v9 = 8;
      sub_18FAE7908((uint64_t)UMError, v9, v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    v6[2](v6, v10);

  }
}

uint64_t sub_18FAFC3C8(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 160);
  return result;
}

void sub_18FAFC3D4(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void (**v6)(id, void *);
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  sub_18FAED58C((uint64_t)UMAbort, v11, CFSTR("LoginUI Checkin"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    v5 = (void *)*((_QWORD *)WeakRetained + 21);
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    if (v11)
    {
      if (objc_msgSend_code(v11, v7, v8) == 16)
        v9 = 5;
      else
        v9 = 8;
      sub_18FAE7908((uint64_t)UMError, v9, v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    v6[2](v6, v10);

  }
}

uint64_t sub_18FAFC49C(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 168);
  return result;
}

void sub_18FAFC4A8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void (**v9)(id, id, void *);
  const char *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  sub_18FAED58C((uint64_t)UMAbort, v5, CFSTR("Provisioning of the Device"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
    v8 = (void *)*((_QWORD *)WeakRetained + 15);
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    if (v5)
    {
      if (objc_msgSend_code(v5, v10, v11) == 16)
        v12 = 5;
      else
        v12 = 8;
      sub_18FAE7908((uint64_t)UMError, v12, v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    v9[2](v9, v14, v13);

  }
}

uint64_t sub_18FAFC58C(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 120);
  return result;
}

void sub_18FAFC598(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v2 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to switch to user: "), v3, v4, v5, v6, v7, v8, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v17, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_18FAEA1C0();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v15, v17);

}

uint64_t sub_18FAFC614(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 72);
  return result;
}

uint64_t sub_18FAFC620(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 80);
  return result;
}

uint64_t sub_18FAFC62C(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 88);
  return result;
}

uint64_t sub_18FAFC638(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 96);
  return result;
}

void sub_18FAFC644(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v2 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to direct switch to user: "), v3, v4, v5, v6, v7, v8, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v17, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_18FAEA1C0();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v15, v17);

}

void sub_18FAFC6C0(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v2 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to switch to login user: "), v3, v4, v5, v6, v7, v8, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v17, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_18FAEA1C0();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v15, v17);

}

void sub_18FAFC73C(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v2 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to checkin with LoginUI: "), v3, v4, v5, v6, v7, v8, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v17, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_18FAEA1C0();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v15, v17);

}

void sub_18FAFC7B8(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v2 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to logout to login session: "), v3, v4, v5, v6, v7, v8, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v17, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_18FAEA1C0();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v15, v17);

}

void sub_18FAFC834(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  if (!v3)
  {
    sub_18FAE8D1C();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    sub_18FAEBEE8((uint64_t)v4, WeakRetained, &unk_1E2A4AF70);

  }
  sub_18FAEBD08();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained((id *)(a1 + 32));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18FAFCC10;
  v9[3] = &unk_1E2A4ACB8;
  v10 = v3;
  v8 = v3;
  sub_18FAEBEE8((uint64_t)v6, v7, v9);

}

void sub_18FAFC928(uint64_t a1, void *a2)
{
  _BYTE *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  const char *v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  const char *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  SEL v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  sub_18FAF6AF0();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v3, CFSTR("Registered stakeholder successfully"), v4, v5, v6, v7, v8, v9, v55);

  if (v2)
  {
    v2[9] = 1;
    sub_18FAF6AF0();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE71DC((uint64_t)v10, CFSTR("Will send tasks"), v11, v12, v13, v14, v15, v16, v55);

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v17 = (void *)*((_QWORD *)v2 + 24);
  }
  else
  {
    sub_18FAF6AF0();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE71DC((uint64_t)v48, CFSTR("Will send tasks"), v49, v50, v51, v52, v53, v54, v55);

    v17 = 0;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
  }
  v18 = v17;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v59, v64, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v60 != v22)
          objc_enumerationMutation(v18);
        sub_18FAFACC4((uint64_t)v2, 4, *(void **)(*((_QWORD *)&v59 + 1) + 8 * i));
      }
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v24, (uint64_t)&v59, v64, 16);
    }
    while (v21);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  if (v2)
    v25 = (void *)*((_QWORD *)v2 + 25);
  else
    v25 = 0;
  v26 = v25;
  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v55, v63, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v56 != v30)
          objc_enumerationMutation(v26);
        sub_18FAFACC4((uint64_t)v2, 6, *(void **)(*((_QWORD *)&v55 + 1) + 8 * j));
      }
      v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v32, (uint64_t)&v55, v63, 16);
    }
    while (v29);
  }

  sub_18FAF6AF0();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v33, CFSTR("Did send tasks"), v34, v35, v36, v37, v38, v39, v55);

  if (v2)
  {
    v2[11] = 1;
    if (*((_QWORD *)v2 + 22))
    {
      sub_18FAEA1C0();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE71DC((uint64_t)v40, CFSTR("Calling stored upload content completion handler"), v41, v42, v43, v44, v45, v46, v55);

      (*(void (**)(void))(*((_QWORD *)v2 + 22) + 16))();
      objc_setProperty_nonatomic_copy(v2, v47, 0, 176);
    }
  }

}

uint64_t sub_18FAFCBE4(uint64_t result, char a2)
{
  if (result)
    *(_BYTE *)(result + 11) = a2;
  return result;
}

uint64_t sub_18FAFCBF0(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 176);
  return result;
}

void sub_18FAFCBFC(void *a1, char *newValue)
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 176);
}

void sub_18FAFCC10(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v24 = v3;
  if (!v4)
  {
    v22 = 0;
    if (!v3)
      goto LABEL_8;
    goto LABEL_6;
  }
  sub_18FAED58C((uint64_t)UMAbort, v4, CFSTR("register stakeholder"));
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Error registering stakeholder"), v5, v6, v7, v8, v9, v10, v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v11, CFSTR("error: %@"), v12, v13, v14, v15, v16, v17, *(_QWORD *)(a1 + 32));
  sub_18FAEA1C0();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v18, v11);

  if (objc_msgSend_code(*(void **)(a1 + 32), v19, v20) == 16)
    v21 = 5;
  else
    v21 = 8;
  sub_18FAE7908((uint64_t)UMError, v21, *(void **)(a1 + 32));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = v24;
  if (v24)
  {
LABEL_6:
    if (v3[16])
      (*(void (**)(void))(v24[16] + 16))();
  }
LABEL_8:

}

uint64_t sub_18FAFCD24(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 128);
  return result;
}

void sub_18FAFCD30(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v2 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to register user switch stakeholder: "), v3, v4, v5, v6, v7, v8, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v17, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_18FAEA1C0();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v15, v17);

}

void sub_18FAFCDAC(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v2 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to register user switch critical stakeholder: "), v3, v4, v5, v6, v7, v8, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v17, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_18FAEA1C0();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v15, v17);

}

void sub_18FAFCE28(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v2 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to register user sync stakeholder mach service: "), v3, v4, v5, v6, v7, v8, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v17, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_18FAEA1C0();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v15, v17);

}

void sub_18FAFCEA4(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v2 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to unregister stakeholder: "), v3, v4, v5, v6, v7, v8, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v17, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_18FAEA1C0();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v15, v17);

}

uint64_t sub_18FAFCF20(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

BOOL sub_18FAFCF34(_BOOL8 result)
{
  if (result)
    return *(_BYTE *)(result + 8) != 0;
  return result;
}

uint64_t sub_18FAFCF48(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 216);
  return result;
}

uint64_t sub_18FAFCF54(uint64_t result, uint64_t a2)
{
  if (result)
    *(_QWORD *)(result + 216) = a2;
  return result;
}

void sub_18FAFCF60(uint64_t a1)
{
  id WeakRetained;
  id v3;

  sub_18FAE8D1C();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_18FAEBEE8((uint64_t)v3, WeakRetained, &unk_1E2A4A788);

}

void sub_18FAFCFC0(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v20 = a2;
  sub_18FAE9AB8();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v2, CFSTR("Server received added task"), v3, v4, v5, v6, v7, v8, v18);

  v9 = v20;
  if (v20)
  {
    v10 = *((_QWORD *)v20 + 27) - 1;
    *((_QWORD *)v20 + 27) = v10;
    if (!v10)
    {
      if (*((_QWORD *)v20 + 23))
      {
        sub_18FAE9AB8();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18FAE71DC((uint64_t)v11, CFSTR("Calling stored will switch completion handler"), v12, v13, v14, v15, v16, v17, v19);

        (*(void (**)(void))(*((_QWORD *)v20 + 23) + 16))();
        v9 = v20;
      }
    }
  }

}

uint64_t sub_18FAFD06C(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 184);
  return result;
}

void sub_18FAFD078(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v2 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to add user switch blocking task: "), v3, v4, v5, v6, v7, v8, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v17, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_18FAEA1C0();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v15, v17);

}

void sub_18FAFD0F4(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v2 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to remove user switch blocking task: "), v3, v4, v5, v6, v7, v8, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v17, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_18FAEA1C0();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v15, v17);

}

void sub_18FAFD170(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v2 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to add user sync task: "), v3, v4, v5, v6, v7, v8, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v17, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_18FAEA1C0();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v15, v17);

}

void sub_18FAFD1EC(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v2 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to add user sync task: "), v3, v4, v5, v6, v7, v8, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v17, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_18FAEA1C0();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v15, v17);

}

void sub_18FAFD268(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v2 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to terminate sync: "), v3, v4, v5, v6, v7, v8, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v17, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_18FAEA1C0();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v15, v17);

}

void sub_18FAFD2E4(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  sub_18FAED58C((uint64_t)UMAbort, a2, CFSTR("terminate sync"));
  sub_18FAEBD08();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_18FAEBEE8((uint64_t)v4, WeakRetained, &unk_1E2A4B0D0);

}

void sub_18FAFD358(uint64_t a1, void *a2)
{
  _QWORD *v2;
  SEL v3;
  id self;

  v2 = a2;
  if (v2 && v2[26])
  {
    self = v2;
    (*(void (**)(void))(v2[26] + 16))();
    objc_setProperty_nonatomic_copy(self, v3, 0, 208);
    v2 = self;
  }

}

uint64_t sub_18FAFD3C8(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 208);
  return result;
}

void sub_18FAFD3D4(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v2 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to resume sync: "), v3, v4, v5, v6, v7, v8, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v17, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_18FAEA1C0();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v15, v17);

}

uint64_t sub_18FAFD454(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 144);
  return result;
}

void sub_18FAFD460(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v2 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to suspend quotas: "), v3, v4, v5, v6, v7, v8, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v17, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_18FAEA1C0();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v15, v17);

}

void sub_18FAFD4DC(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  sub_18FAED58C((uint64_t)UMAbort, v4, CFSTR("suspend quota"));
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void sub_18FAFD538(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v2 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to resume quotas: "), v3, v4, v5, v6, v7, v8, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v17, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_18FAEA1C0();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v15, v17);

}

void sub_18FAFD5B4(uint64_t a1, void *a2)
{
  sub_18FAED58C((uint64_t)UMAbort, a2, CFSTR("resume quota"));
}

void sub_18FAFD5C8(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v2 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to add user switch blocking task: "), v3, v4, v5, v6, v7, v8, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v17, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_18FAEA1C0();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v15, v17);

}

uint64_t sub_18FAFD644(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 112);
  return result;
}

uint64_t sub_18FAFD650(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 152);
  return result;
}

void sub_18FAFD65C(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id WeakRetained;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (a1)
  {
    sub_18FAE8D1C();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAEBEE8((uint64_t)v3, (void *)a1, &unk_1E2A4A7E8);

    v4 = *(_QWORD *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = WeakRetained;
    if (v4 == 2)
      objc_msgSend_willSwitchToUser_(WeakRetained, v6, (uint64_t)v10);
    else
      objc_msgSend_willSwitchUser(WeakRetained, v6, v7);

    sub_18FAE8D1C();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAEBEE8((uint64_t)v9, (void *)a1, &unk_1E2A4B170);

    *(_BYTE *)(a1 + 10) = 1;
  }

}

void sub_18FAFD718(uint64_t a1, uint64_t a2)
{
  if (a2)
    *(_BYTE *)(a2 + 8) = 1;
}

uint64_t sub_18FAFD728(uint64_t result, char a2)
{
  if (result)
    *(_BYTE *)(result + 8) = a2;
  return result;
}

void sub_18FAFD734(uint64_t a1, uint64_t a2)
{
  if (a2)
    *(_BYTE *)(a2 + 8) = 0;
}

uint64_t sub_18FAFD740(uint64_t result, char a2)
{
  if (result)
    *(_BYTE *)(result + 10) = a2;
  return result;
}

void sub_18FAFD74C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  const char *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  if (a1)
  {
    if (!*(_BYTE *)(a1 + 10))
    {
      v14 = v3;
      sub_18FAFD65C(a1, v3);
      v3 = v14;
    }
    if (*(_QWORD *)(a1 + 40) == 2)
    {
      v15 = (uint64_t)v3;
      sub_18FAEA1C0();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE71DC((uint64_t)v4, CFSTR("readyToSwitchToUser"), v5, v6, v7, v8, v9, v10, v13);

      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend_readyToSwitchToUser_(WeakRetained, v12, v15);

      v3 = (id)v15;
    }
  }

}

BOOL sub_18FAFD7E4(_BOOL8 result)
{
  if (result)
    return *(_BYTE *)(result + 10) != 0;
  return result;
}

void sub_18FAFD7F8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  const char *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  if (a1)
  {
    if (!*(_BYTE *)(a1 + 10))
    {
      v14 = v3;
      sub_18FAFD65C(a1, v3);
      v3 = v14;
    }
    if (*(_QWORD *)(a1 + 40) == 2)
    {
      v15 = (uint64_t)v3;
      sub_18FAEA1C0();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE71DC((uint64_t)v4, CFSTR("readyToSwitchToLoginSession"), v5, v6, v7, v8, v9, v10, v13);

      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend_readyToSwitchToLoginSession_(WeakRetained, v12, v15);

      v3 = (id)v15;
    }
  }

}

void sub_18FAFD954(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v4, CFSTR("Will switch user"), v5, v6, v7, v8, v9, v10, v15);

  v11 = *(void **)(a1 + 32);
  if (v11)
  {
    sub_18FAF0974((uint64_t)UMMobileKeyBag, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  sub_18FAFD65C((uint64_t)v3, v12);
  sub_18FAE8D1C();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18FAFDA54;
  v16[3] = &unk_1E2A4AD30;
  v14 = *(void **)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  sub_18FAEBEE8((uint64_t)v13, v14, v16);

}

void sub_18FAFDA54(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SEL v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id self;

  v3 = a2;
  self = v3;
  if (v3 && *((_QWORD *)v3 + 27))
  {
    sub_18FAE9AB8();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE71DC((uint64_t)v4, CFSTR("Waiting on sending added tasks, storing will switch completion handler"), v5, v6, v7, v8, v9, v10, v19);

    objc_setProperty_nonatomic_copy(self, v11, *(id *)(a1 + 32), 184);
  }
  else
  {
    sub_18FAE9AB8();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE71DC((uint64_t)v12, CFSTR("Not waiting on sending any added tasks, calling will switch completion handler"), v13, v14, v15, v16, v17, v18, v19);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_18FAFDAF8(void *a1, char *newValue)
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 184);
}

void sub_18FAFDBD0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v4, CFSTR("Ready to switch user"), v5, v6, v7, v8, v9, v10, v15);

  v11 = *(void **)(a1 + 32);
  if (v11)
  {
    sub_18FAF0974((uint64_t)UMMobileKeyBag, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  sub_18FAFD74C((uint64_t)v3, v12);
  sub_18FAE8D1C();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18FAFDCD0;
  v16[3] = &unk_1E2A4AD30;
  v14 = *(void **)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  sub_18FAEBEE8((uint64_t)v13, v14, v16);

}

uint64_t sub_18FAFDCD0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  sub_18FAE9AB8();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v2, CFSTR("Calling ready to switch user completion handler"), v3, v4, v5, v6, v7, v8, v10);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_18FAFDDD8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v4, CFSTR("Ready to readyToSwitchToLoginSession And Restart Self"), v5, v6, v7, v8, v9, v10, v19);

  v11 = *(void **)(a1 + 32);
  if (v11)
  {
    sub_18FAF0974((uint64_t)UMMobileKeyBag, v11);
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  sub_18FAEA1C0();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v12, CFSTR("Calling readyToSwitchToLoginSession completion handler"), v13, v14, v15, v16, v17, v18, v20);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  sub_18FAFD7F8((uint64_t)v3, v21);

}

void sub_18FAFDF4C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16[4];
  id v17;
  id location;

  v3 = a2;
  sub_18FAE9AB8();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v4, CFSTR("User switch task list did update"), v5, v6, v7, v8, v9, v10, v16[0]);

  objc_initWeak(&location, v3);
  v11 = *(_QWORD **)(a1 + 32);
  if (v11)
    v11 = (_QWORD *)v11[28];
  v12 = v11;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v12, v13, (uint64_t)&unk_1E2A4B1E0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = (uint64_t)sub_18FAFE0E0;
  v16[3] = (uint64_t)&unk_1E2A4B208;
  objc_copyWeak(&v17, &location);
  objc_msgSend_fetchUserSwitchBlockingTaskListWithCompletionHandler_(v14, v15, (uint64_t)v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void sub_18FAFE040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18FAFE064(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v2 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to fetch user switch blocking task list: "), v3, v4, v5, v6, v7, v8, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v17, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  sub_18FAEA1C0();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v15, v17);

}

void sub_18FAFE0E0(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  void *v22;
  id WeakRetained;
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v25 = a1;
  v33 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = v2;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v28, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v4);
        sub_18FAF1EE8((uint64_t)UMMobileKeyBag, *(void **)(*((_QWORD *)&v28 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_bundleID(v10, v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v3, v14, (uint64_t)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          v17 = (void *)objc_opt_new();
          objc_msgSend_setObject_forKeyedSubscript_(v3, v18, (uint64_t)v17, v13);

        }
        objc_msgSend_objectForKeyedSubscript_(v3, v16, (uint64_t)v13, v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v19, v20, (uint64_t)v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v21, (uint64_t)&v28, v32, 16);
    }
    while (v7);
  }

  sub_18FAEBD08();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(v25 + 32));
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_18FAFE2F8;
  v26[3] = &unk_1E2A4ACB8;
  v27 = v3;
  v24 = v3;
  sub_18FAEBEE8((uint64_t)v22, WeakRetained, v26);

}

void sub_18FAFE2F8(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  if (a2)
    WeakRetained = objc_loadWeakRetained((id *)(a2 + 32));
  else
    WeakRetained = 0;
  v4 = WeakRetained;
  objc_msgSend_userSwitchBlockingTasksDidUpdate_(WeakRetained, (const char *)a2, *(_QWORD *)(a1 + 32));

}

void sub_18FAFE424(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  id *v24;
  uint64_t v25[4];
  id *v26;
  id v27;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v4, CFSTR("Upload content"), v5, v6, v7, v8, v9, v10, v25[0]);

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained(v3 + 4);
    if (WeakRetained)
    {
      v12 = v3[5];

      if (v12 == (id)3)
      {
        if (*((_BYTE *)v3 + 12))
        {
          sub_18FAEA1C0();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18FAE71DC((uint64_t)v13, CFSTR("Already called upload content, resending tasks"), v14, v15, v16, v17, v18, v19, v25[0]);

          sub_18FAE8D1C();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18FAEBEE8((uint64_t)v20, v3, &unk_1E2A4A808);
        }
        else
        {
          v20 = objc_loadWeakRetained(v3 + 4);
          objc_msgSend_uploadContent(v20, v21, v22);
        }

      }
    }
    *((_BYTE *)v3 + 12) = 1;
  }
  sub_18FAE8D1C();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = (uint64_t)sub_18FAFE5B8;
  v25[3] = (uint64_t)&unk_1E2A4B1C0;
  v26 = v3;
  v27 = *(id *)(a1 + 32);
  v24 = v3;
  sub_18FAEBEE8((uint64_t)v23, v24, v25);

}

BOOL sub_18FAFE590(_BOOL8 result)
{
  if (result)
    return *(_BYTE *)(result + 12) != 0;
  return result;
}

void sub_18FAFE5A4(uint64_t a1, uint64_t a2)
{
  sub_18FAFBE80(a2);
}

uint64_t sub_18FAFE5AC(uint64_t result, char a2)
{
  if (result)
    *(_BYTE *)(result + 12) = a2;
  return result;
}

void sub_18FAFE5B8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  uint64_t v19;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_BYTE *)(v2 + 11))
  {
    sub_18FAE9AB8();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE71DC((uint64_t)v3, CFSTR("Already sent tasks, calling upload content completion handler"), v4, v5, v6, v7, v8, v9, v19);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    sub_18FAE9AB8();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE71DC((uint64_t)v10, CFSTR("Have not sent tasks, storing upload content completion handler"), v11, v12, v13, v14, v15, v16, v19);

    v18 = *(void **)(a1 + 32);
    if (v18)
      objc_setProperty_nonatomic_copy(v18, v17, *(id *)(a1 + 40), 176);
  }
}

BOOL sub_18FAFE65C(_BOOL8 result)
{
  if (result)
    return *(_BYTE *)(result + 11) != 0;
  return result;
}

void sub_18FAFE6BC(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  sub_18FAEA1C0();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v2, CFSTR("Bubble did pop"), v3, v4, v5, v6, v7, v8, v10);

  v9 = v11;
  if (v11 && *((_QWORD *)v11 + 26))
  {
    (*(void (**)(void))(*((_QWORD *)v11 + 26) + 16))();
    v9 = v11;
  }

}

void sub_18FAFE738(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  if (a1)
  {
    v1 = (id *)(a1 + 248);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 248));

    sub_18FAEA1C0();
    v3 = objc_claimAutoreleasedReturnValue();
    v13 = (id)v3;
    if (WeakRetained)
    {
      sub_18FAE71DC(v3, CFSTR("calling stakeholder for  personaListDidUpdate"), v4, v5, v6, v7, v8, v9, v12);

      v13 = objc_loadWeakRetained(v1);
      objc_msgSend_personaListDidUpdate(v13, v10, v11);
    }
    else
    {
      sub_18FAE71DC(v3, CFSTR("NO stakeholder for  personaListDidUpdate"), v4, v5, v6, v7, v8, v9, v12);
    }

  }
}

id *sub_18FAFE7C4(id *WeakRetained)
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 31);
  return WeakRetained;
}

void sub_18FAFE880(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v4, CFSTR("persona List Did Update"), v5, v6, v7, v8, v9, v10, v13);

  sub_18FAFE738((uint64_t)v3);
  sub_18FAE8D1C();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18FAFE950;
  v14[3] = &unk_1E2A4AD30;
  v12 = *(void **)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  sub_18FAEBEE8((uint64_t)v11, v12, v14);

}

uint64_t sub_18FAFE950(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  sub_18FAE9AB8();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v2, CFSTR("Calling personaListDidUpdate completion handler"), v3, v4, v5, v6, v7, v8, v10);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_18FAFEA38(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v4, CFSTR("persona List Did Update Callback"), v5, v6, v7, v8, v9, v10, v13);

  sub_18FAFE738((uint64_t)v3);
  sub_18FAE8D1C();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18FAFEB08;
  v14[3] = &unk_1E2A4AD30;
  v12 = *(void **)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  sub_18FAEBEE8((uint64_t)v11, v12, v14);

}

uint64_t sub_18FAFEB08(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  sub_18FAE9AB8();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v2, CFSTR("persona Update callback completion handler"), v3, v4, v5, v6, v7, v8, v10);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_18FAFEC50(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;

  v11 = a2;
  sub_18FAE9AB8();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v3, CFSTR("Set up server with connection"), v4, v5, v6, v7, v8, v9, v10);

  sub_18FAE6DB0(v11, *(void **)(a1 + 32), 0);
  sub_18FAFBE80((uint64_t)v11);

}

void sub_18FAFECC0(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  if (a1)
  {
    v10 = a3;
    v11 = a2;
    sub_18FAEAFB4(a1);
    v12 = *(void **)(a1 + 224);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_18FAFEDBC;
    v19[3] = &unk_1E2A4ABA0;
    v13 = v9;
    v20 = v13;
    v14 = v12;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v14, v15, (uint64_t)v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = getpid();
    objc_msgSend_createPersona_passcodeData_passcodeDataType_forPid_completionHandler_(v16, v18, (uint64_t)v11, v10, a4, v17, v13);

  }
}

void sub_18FAFEDBC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v3 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed creating persona: "), v4, v5, v6, v7, v8, v9, v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v18, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  sub_18FAEA1C0();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v16, v18);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_18FAFEE58(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  if (a1)
  {
    v7 = a2;
    sub_18FAEAFB4(a1);
    v8 = *(void **)(a1 + 224);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_18FAFEF30;
    v15[3] = &unk_1E2A4ABA0;
    v9 = v6;
    v16 = v9;
    v10 = v8;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v10, v11, (uint64_t)v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = getpid();
    objc_msgSend_deletePersona_forPid_completionHandler_(v12, v14, (uint64_t)v7, v13, v9);

  }
}

void sub_18FAFEF30(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v3 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to delete persona: "), v4, v5, v6, v7, v8, v9, v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v18, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  sub_18FAEA1C0();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v16, v18);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_18FAFEFC8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  if (a1)
  {
    v6 = a2;
    sub_18FAEAFB4(a1);
    v7 = *(void **)(a1 + 224);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_18FAFF0A0;
    v14[3] = &unk_1E2A4ABA0;
    v8 = v5;
    v15 = v8;
    v9 = v7;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v9, v10, (uint64_t)v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = getpid();
    objc_msgSend_disablePersona_forPid_completionHandler_(v11, v13, (uint64_t)v6, v12, v8);

  }
}

void sub_18FAFF0A0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v3 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to disable persona: "), v4, v5, v6, v7, v8, v9, v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v18, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  sub_18FAEA1C0();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v16, v18);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_18FAFF138(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  if (a1)
  {
    sub_18FAEAFB4(a1);
    v4 = *(void **)(a1 + 224);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18FAFF1F4;
    v11[3] = &unk_1E2A4ABA0;
    v5 = v3;
    v12 = v5;
    v6 = v4;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v6, v7, (uint64_t)v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = getpid();
    objc_msgSend_fetchPersonaListforPid_withCompletionHandler_(v8, v10, v9, v5);

  }
}

void sub_18FAFF1F4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v3 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to fetch persona list: "), v4, v5, v6, v7, v8, v9, v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v18, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  sub_18FAEA1C0();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v16, v18);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_18FAFF290(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  if (a1)
  {
    sub_18FAEAFB4(a1);
    v4 = *(void **)(a1 + 224);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18FAFF34C;
    v11[3] = &unk_1E2A4ABA0;
    v5 = v3;
    v12 = v5;
    v6 = v4;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v6, v7, (uint64_t)v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = getpid();
    objc_msgSend_fetchAllUsersPersonaListforPid_withCompletionHandler_(v8, v10, v9, v5);

  }
}

void sub_18FAFF34C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v3 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to persona list for all users: "), v4, v5, v6, v7, v8, v9, v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v18, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  sub_18FAEA1C0();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v16, v18);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_18FAFF3E8(void *a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  if (a1)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = sub_18FAEAA30;
    v24 = sub_18FAEA9F8;
    v25 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = sub_18FAEAA30;
    v18 = sub_18FAEA9F8;
    v19 = 0;
    if (a2)
      *a2 = 0;
    sub_18FAFF584(a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_18FAFF7AC;
    v13[3] = &unk_1E2A4A950;
    v13[4] = &v20;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v5, (uint64_t)v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = getpid();
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = sub_18FAFF838;
    v12[3] = &unk_1E2A4A9A0;
    v12[4] = &v20;
    v12[5] = &v14;
    objc_msgSend_fetchPersonaListforPid_withCompletionHandler_(v6, v8, v7, v12);

    if (a2)
    {
      v9 = (void *)v21[5];
      if (v9)
        *a2 = objc_retainAutorelease(v9);
    }
    v10 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v20, 8);

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

void sub_18FAFF560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

id sub_18FAFF584(void *a1)
{
  id *v1;
  id v2;
  const char *v3;
  uint64_t v4;
  id v5;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  id v10;
  const char *v11;
  id v12;
  const char *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  id v29;
  uint64_t v31;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    if (v1[29])
    {
LABEL_7:
      v29 = v1[29];
      objc_sync_exit(v1);

      return v29;
    }
    v2 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v4 = objc_msgSend_initWithMachServiceName_options_(v2, v3, (uint64_t)CFSTR("com.apple.mobile.usermanagerd.xpc"), 0);
    v5 = v1[29];
    v1[29] = (id)v4;

    if (v1[29])
    {
      objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v6, (uint64_t)&unk_1EE18B670);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v1[29];
      objc_msgSend_setRemoteObjectInterface_(v8, v9, (uint64_t)v7);

      v10 = v1[29];
      objc_msgSend_setInterruptionHandler_(v10, v11, (uint64_t)&unk_1E2A4B298);

      v12 = v1[29];
      objc_msgSend_setInvalidationHandler_(v12, v13, (uint64_t)&unk_1E2A4B2B8);

      if (xpc_user_sessions_enabled())
      {
        xpc_user_sessions_get_foreground_uid();
        v14 = v1[29];
        objc_msgSend__xpcConnection(v14, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        xpc_connection_set_target_user_session_uid();

      }
      sub_18FAEA1C0();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("SYNC CONNECTION SETUP"), v19, v20, v21, v22, v23, v24, v31);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE964C((uint64_t)v18, v25);

      v26 = v1[29];
      objc_msgSend_resume(v26, v27, v28);

      goto LABEL_7;
    }
    objc_sync_exit(v1);

  }
  return 0;
}

void sub_18FAFF794(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18FAFF7AC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to fetch persona list: got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FAFF838(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;

  v25 = a2;
  v5 = a3;
  if (v5)
  {
    sub_18FAEA1C0();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to fetch persona list: %@"), v7, v8, v9, v10, v11, v12, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v6, v13);

    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2FE0];
    v18 = objc_msgSend_code(v5, v16, v17);
    objc_msgSend_errorWithDomain_code_userInfo_(v14, v19, v15, v18, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;
  }
  else
  {
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v24 = v25;
    v22 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v24;
  }

}

void sub_18FAFF93C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  if (a1)
  {
    v6 = a2;
    sub_18FAEAFB4(a1);
    v7 = *(void **)(a1 + 224);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_18FAFFA14;
    v14[3] = &unk_1E2A4ABA0;
    v8 = v5;
    v15 = v8;
    v9 = v7;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v9, v10, (uint64_t)v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = getpid();
    objc_msgSend_fetchPersona_forPid_completionHandler_(v11, v13, (uint64_t)v6, v12, v8);

  }
}

void sub_18FAFFA14(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v3 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to fetch persona: "), v4, v5, v6, v7, v8, v9, v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v18, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  sub_18FAEA1C0();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v16, v18);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_18FAFFAB0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to fetch persona: got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

uint64_t sub_18FAFFB3C(void *a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  if (!a1)
    return 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_18FAEAA30;
  v21 = sub_18FAEA9F8;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if (a2)
    *a2 = 0;
  sub_18FAFF584(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18FAFFCBC;
  v12[3] = &unk_1E2A4A950;
  v12[4] = &v17;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v5, (uint64_t)v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = sub_18FAFFE0C;
  v11[3] = &unk_1E2A4B230;
  v11[4] = &v17;
  v11[5] = &v13;
  objc_msgSend_fetchPersonaGenerationNumberWithCompletionHandler_(v6, v7, (uint64_t)v11);

  if (a2)
  {
    v8 = (void *)v18[5];
    if (v8)
      *a2 = objc_retainAutorelease(v8);
  }
  v9 = v14[3];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v9;
}

void sub_18FAFFC98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18FAFFCBC(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  if (qword_1EE184FA8 != -1)
    dispatch_once(&qword_1EE184FA8, &unk_1E2A4B470);
  v4 = (id)qword_1EE184F70;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = sub_18FAED604();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      v6 = v5;
    else
      v6 = v5 & 0xFFFFFFFE;
    if (v6)
    {
      v7 = (void *)_os_log_send_and_compose_impl();
      if (v7)
        sub_18FAED60C();
    }
    else
    {
      v7 = 0;
    }
    free(v7);
  }

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void sub_18FAFFE0C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

void sub_18FAFFE74(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  if (a1)
  {
    sub_18FAEAFB4(a1);
    v4 = *(void **)(a1 + 224);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18FAFFF30;
    v11[3] = &unk_1E2A4ABA0;
    v5 = v3;
    v12 = v5;
    v6 = v4;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v6, v7, (uint64_t)v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = getpid();
    objc_msgSend_fetchAsidMapforPid_withCompletionHandler_(v8, v10, v9, v5);

  }
}

void sub_18FAFFF30(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v3 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to fetch ASID map: "), v4, v5, v6, v7, v8, v9, v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v18, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  sub_18FAEA1C0();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v16, v18);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_18FAFFFCC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  _QWORD v17[4];
  id v18;

  v7 = a4;
  if (a1)
  {
    v8 = a3;
    v9 = a2;
    sub_18FAEAFB4(a1);
    v10 = *(void **)(a1 + 224);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_18FB000B8;
    v17[3] = &unk_1E2A4ABA0;
    v11 = v7;
    v18 = v11;
    v12 = v10;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v12, v13, (uint64_t)v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = getpid();
    objc_msgSend_setSinglePersonaBundlesIdentifiers_forPersona_forPid_completionHandler_(v14, v16, (uint64_t)v9, v8, v15, v11);

  }
}

void sub_18FB000B8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v3 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to set bundle identifiers: "), v4, v5, v6, v7, v8, v9, v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v18, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  sub_18FAEA1C0();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v16, v18);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

BOOL sub_18FB00150(void *a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  _BOOL8 v18;
  _QWORD v20[6];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v10 = v8;
  if (a1)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = sub_18FAEAA30;
    v30 = sub_18FAEA9F8;
    v31 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    if (a4)
      *a4 = 0;
    v32 = kUMUserPersonaUniqueStringKey;
    v33[0] = v8;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v9, (uint64_t)v33, &v32, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAFF584(a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_18FB00388;
    v21[3] = &unk_1E2A4A950;
    v21[4] = &v26;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v12, v14, (uint64_t)v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = sub_18FB00414;
    v20[3] = &unk_1E2A4AA90;
    v20[4] = &v26;
    v20[5] = &v22;
    objc_msgSend_setBundlesIdentifiers_forPersona_completionHandler_(v15, v16, (uint64_t)v7, v11, v20);

    if (a4)
    {
      v17 = (void *)v27[5];
      if (v17)
        *a4 = objc_retainAutorelease(v17);
    }
    v18 = *((_BYTE *)v23 + 24) != 0;

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v26, 8);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void sub_18FB00358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a12);
  va_start(va, a12);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18FB00388(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to set synchronous bundleIds: got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FB00414(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  if (a2)
  {
    v3 = a2;
    sub_18FAEA1C0();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to set synchronous bundleIds: %@"), v5, v6, v7, v8, v9, v10, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v4, v11);

    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2FE0];
    v16 = objc_msgSend_code(v3, v14, v15);

    objc_msgSend_errorWithDomain_code_userInfo_(v12, v17, v13, v16, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_18FB00520(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  if (a1)
  {
    v6 = a2;
    sub_18FAEAFB4(a1);
    v7 = *(void **)(a1 + 224);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_18FB005F8;
    v14[3] = &unk_1E2A4ABA0;
    v8 = v5;
    v15 = v8;
    v9 = v7;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v9, v10, (uint64_t)v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = getpid();
    objc_msgSend_fetchBundleIdentifiersForPersona_forPid_completionHandler_(v11, v13, (uint64_t)v6, v12, v8);

  }
}

void sub_18FB005F8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v3 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to fetch bundle identifiers: "), v4, v5, v6, v7, v8, v9, v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v18, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  sub_18FAEA1C0();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v16, v18);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_18FB00694(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  if (a1)
  {
    v6 = a2;
    sub_18FAEAFB4(a1);
    v7 = *(void **)(a1 + 224);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_18FB0076C;
    v14[3] = &unk_1E2A4ABA0;
    v8 = v5;
    v15 = v8;
    v9 = v7;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v9, v10, (uint64_t)v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = getpid();
    objc_msgSend_setMultiPersonaBundlesIdentifiers_forPid_WithcompletionHandler_(v11, v13, (uint64_t)v6, v12, v8);

  }
}

void sub_18FB0076C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v3 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to set multi-persona bundle identifiers: "), v4, v5, v6, v7, v8, v9, v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v18, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  sub_18FAEA1C0();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v16, v18);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_18FB00804(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  if (a1)
  {
    sub_18FAEAFB4(a1);
    v4 = *(void **)(a1 + 224);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18FB008C0;
    v11[3] = &unk_1E2A4ABA0;
    v5 = v3;
    v12 = v5;
    v6 = v4;
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v6, v7, (uint64_t)v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = getpid();
    objc_msgSend_fetchMultiPersonaBundleIdentifiersforPid_withCompletionHandler_(v8, v10, v9, v5);

  }
}

void sub_18FB008C0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v3 = a2;
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to fetch multi-persona bundle identifiers: "), v4, v5, v6, v7, v8, v9, v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAF8F3C((uint64_t)v18, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  sub_18FAEA1C0();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v16, v18);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_18FB0095C(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7 = v5;
  if (a1)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = sub_18FAEAA30;
    v29 = sub_18FAEA9F8;
    v30 = 0;
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = sub_18FAEAA30;
    v23 = sub_18FAEA9F8;
    v24 = 0;
    if (a3)
      *a3 = 0;
    v31 = kUMUserPersonaUniqueStringKey;
    v32[0] = v5;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v6, (uint64_t)v32, &v31, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAFF584(a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_18FB00B7C;
    v18[3] = &unk_1E2A4A950;
    v18[4] = &v25;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v9, v11, (uint64_t)v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = sub_18FB00C08;
    v17[3] = &unk_1E2A4A9A0;
    v17[4] = &v25;
    v17[5] = &v19;
    objc_msgSend_bundleIdentifiersForPersona_completionHandler_(v12, v13, (uint64_t)v8, v17);

    if (a3)
    {
      v14 = (void *)v26[5];
      if (v14)
        *a3 = objc_retainAutorelease(v14);
    }
    v15 = (id)v20[5];

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v25, 8);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void sub_18FB00B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_18FB00B7C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to fetch synchronous bundleIDs: got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FB00C08(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;

  v25 = a2;
  v5 = a3;
  if (v5)
  {
    sub_18FAEA1C0();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to fetch synchronous bundleIDs: %@"), v7, v8, v9, v10, v11, v12, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v6, v13);

    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2FE0];
    v18 = objc_msgSend_code(v5, v16, v17);
    objc_msgSend_errorWithDomain_code_userInfo_(v14, v19, v15, v18, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;
  }
  else
  {
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v24 = v25;
    v22 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v24;
  }

}

id sub_18FB00D0C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v3 = a2;
  if (a1)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = sub_18FAEAA30;
    v29 = sub_18FAEA9F8;
    v30 = 0;
    sub_18FAEAFB4(a1);
    v4 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_18FB00ED0;
    v24[3] = &unk_1E2A4A950;
    v24[4] = &v25;
    v5 = (void *)MEMORY[0x194007B90](v24);
    sub_18FAEA1C0();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Registering machservice:%@ with UserManager"), v7, v8, v9, v10, v11, v12, (uint64_t)v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v6, v13);

    v14 = *(id *)(a1 + 224);
    v22[0] = v4;
    v22[1] = 3221225472;
    v22[2] = sub_18FB00F90;
    v22[3] = &unk_1E2A4ABA0;
    v15 = v5;
    v23 = v15;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v14, v16, (uint64_t)v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = getpid();
    objc_msgSend_registerUserPersonaObserverForPID_withMachServiceName_completionHandler_(v17, v19, v18, v3, v15);

    v20 = (id)v26[5];
    _Block_object_dispose(&v25, 8);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void sub_18FB00EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FB00ED0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;

  if (a2)
  {
    v4 = objc_msgSend_copy(a2, (const char *)a2, a3);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    sub_18FAEA1C0();
    v21 = (id)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("registerUserPersonaObserverForPID returned with error:%@"), v7, v8, v9, v10, v11, v12, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  }
  else
  {
    sub_18FAE9AB8();
    v21 = (id)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("registerUserPersonaObserverForPID Successful"), v13, v14, v15, v16, v17, v18, v20);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v21, v19);

}

uint64_t sub_18FB00F90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_18FB00F9C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id *v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  if (a1)
  {
    sub_18FAE9AB8();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("launchPersonaCallback"), v3, v4, v5, v6, v7, v8, v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v2, v9);

    v10 = (id *)(a1 + 248);
    WeakRetained = objc_loadWeakRetained(v10);

    if (WeakRetained)
    {
      sub_18FAE9AB8();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("calling personaStakeholder"), v13, v14, v15, v16, v17, v18, v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE964C((uint64_t)v12, v19);

      v24 = objc_loadWeakRetained(v10);
      objc_msgSend_personaListDidUpdate(v24, v20, v21);

    }
  }
}

id sub_18FB01098(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  char *v34;
  const char *v35;
  char *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!a1)
  {
    v25 = 0;
    goto LABEL_16;
  }
  v8 = v6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 248));

  if (WeakRetained)
    sub_18FAED518((uint64_t)UMAbort, CFSTR("There is already a registered stakeholder"), v10, v11, v12, v13, v14, v15, v91);
  if (v8)
    goto LABEL_5;
  v34 = sub_18FB0143C();
  if (!v34)
  {
    sub_18FAEA1C0();
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Unable to find bundleCstring"), v66, v67, v68, v69, v70, v71, v91);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v65, v72);

    goto LABEL_13;
  }
  v36 = v34;
  objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v35, (uint64_t)v34, 4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE9AB8();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR(" bundlename:%@; Cstring:%s"),
    v39,
    v40,
    v41,
    v42,
    v43,
    v44,
    (uint64_t)v37);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v38, v45);

  free(v36);
  if (!v37)
  {
LABEL_13:
    sub_18FAEA1C0();
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Unable to find bundlename"), v74, v75, v76, v77, v78, v79, v93);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v73, v80);

    goto LABEL_14;
  }
  sub_18FAEA1C0();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("computing bundlename:%@"), v47, v48, v49, v50, v51, v52, (uint64_t)v37);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v46, v53);

  v8 = (id)objc_msgSend_mutableCopy(v37, v54, v55);
  objc_msgSend_appendString_(v8, v56, (uint64_t)CFSTR(".personaobserver"));
  sub_18FAE9AB8();
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("computed machservice for callback:%@"), v58, v59, v60, v61, v62, v63, (uint64_t)v8);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v57, v64);

  if (v8)
  {
LABEL_5:
    sub_18FAEA1C0();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Setting up XPC listner for %@"), v17, v18, v19, v20, v21, v22, (uint64_t)v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v16, v23);

    sub_18FB015A8();
    v24 = (id *)objc_claimAutoreleasedReturnValue();
    sub_18FB016A0(v24, v8, &unk_1E2A4B250);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      sub_18FAE9AB8();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Successful Setting up XPC listner, registering with UMServer"), v27, v28, v29, v30, v31, v32, v92);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE964C((uint64_t)v26, v33);

      sub_18FB00D0C(a1, v8);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
        objc_storeWeak((id *)(a1 + 248), v5);
    }
    goto LABEL_15;
  }
LABEL_14:
  sub_18FAEA1C0();
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Unable to compute machservice name"), v82, v83, v84, v85, v86, v87, v94);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v81, v88);

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v89, *MEMORY[0x1E0CB2FE0], 22, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_15:

LABEL_16:
  return v25;
}

char *sub_18FB0143C()
{
  char *v0;
  int v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  _OWORD v7[2];
  mach_msg_type_number_t task_info_outCnt[2];
  char v9[1024];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  memset(v7, 0, sizeof(v7));
  task_info_outCnt[0] = 8;
  if (task_info(*MEMORY[0x1E0C83DA0], 0xFu, (task_info_t)v7, task_info_outCnt))
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
      sub_18FB07E40();
    return 0;
  }
  getpid();
  *(_QWORD *)task_info_outCnt = 0;
  v2 = csops_audittoken();
  v3 = bswap32(task_info_outCnt[1]);
  task_info_outCnt[0] = bswap32(task_info_outCnt[0]);
  task_info_outCnt[1] = v3;
  if ((v2 & 0x80000000) == 0)
  {
    if (!v2)
      return strndup(v9, v3 - 8);
    return 0;
  }
  if (*__error() != 34)
    return 0;
  v4 = malloc_type_malloc(task_info_outCnt[1], 0xC61E0774uLL);
  v5 = csops_audittoken();
  v6 = bswap32(*((_DWORD *)v4 + 1));
  *(_DWORD *)v4 = bswap32(*(_DWORD *)v4);
  *((_DWORD *)v4 + 1) = v6;
  if (v5)
    v0 = 0;
  else
    v0 = strndup((const char *)v4 + 8, v6 - 8);
  free(v4);
  return v0;
}

id sub_18FB015A8()
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18FB044C4;
  block[3] = &unk_1E2A4A848;
  block[4] = v0;
  if (qword_1EE185068 != -1)
    dispatch_once(&qword_1EE185068, block);
  return (id)qword_1EE185060;
}

void sub_18FB01620()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  sub_18FAEA1C0();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Persona Observer machservice Callback"), v1, v2, v3, v4, v5, v6, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v0, v7);

  sub_18FAE7234();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FB00F9C((uint64_t)v9);

}

id sub_18FB016A0(id *a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  SEL v22;
  id v23;
  const char *v24;
  uint64_t v25;
  id v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v42;
  uint64_t v43;

  v6 = a2;
  v13 = a3;
  if (a1)
  {
    if (v6)
    {
      objc_storeStrong(a1 + 1, a2);
      sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("registering personalistener"), v14, v15, v16, v17, v18, v19, v42);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE9AB8();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE964C((uint64_t)v21, v20);

      objc_setProperty_nonatomic_copy(a1, v22, v13, 32);
      v23 = objc_alloc(MEMORY[0x1E0CB3B58]);
      v25 = objc_msgSend_initWithMachServiceName_(v23, v24, (uint64_t)v6);
      v26 = a1[3];
      a1[3] = (id)v25;

      objc_msgSend_setDelegate_(a1[3], v27, (uint64_t)a1);
      objc_msgSend_resume(a1[3], v28, v29);
      sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Completed registration of personalistener"), v30, v31, v32, v33, v34, v35, v43);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      sub_18FAEA1C0();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE964C((uint64_t)v37, v36);

      v38 = 0;
    }
    else
    {
      sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("nil machserviceName, registration failed"), v7, v8, v9, v10, v11, v12, v42);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAEA1C0();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE964C((uint64_t)v39, v36);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v40, *MEMORY[0x1E0CB2FE0], 22, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v38 = 0;
  }

  return v38;
}

id *sub_18FB0183C(id *result, void *a2)
{
  if (result)
    return (id *)objc_storeWeak(result + 31, a2);
  return result;
}

void sub_18FB0184C(void *a1, void *a2, void *a3)
{
  if (a1)
    sub_18FB01860(a1, a2, 0, a3);
}

void sub_18FB01860(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    sub_18FAE8D1C();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18FB01948;
    v11[3] = &unk_1E2A4B278;
    v14 = v9;
    v12 = v7;
    v13 = v8;
    sub_18FAEBEE8((uint64_t)v10, a1, v11);

  }
}

void sub_18FB01948(void **a1, void *a2)
{
  id v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id self;

  v3 = a2;
  self = v3;
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, v4, a1[6], 256);
    v3 = self;
  }
  sub_18FB01098((uint64_t)v3, a1[4], a1[5]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAEA1C0();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to registerPersonaListUpdateObserver:%@"), v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  else
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Successful registration of registerPersonaListUpdateObserver"), v6, v7, v8, v9, v10, v11, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v12, v13);

  (*((void (**)(void))a1[6] + 2))();
}

void sub_18FB01A14(void *a1, char *newValue)
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 256);
}

void sub_18FB01A28(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    sub_18FAE8D1C();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_18FB01AE8;
    v8[3] = &unk_1E2A4B1C0;
    v9 = v5;
    v10 = v6;
    sub_18FAEBEE8((uint64_t)v7, a1, v8);

  }
}

void sub_18FB01AE8(uint64_t a1, void *a2)
{
  const char *v3;
  id self;

  self = a2;
  sub_18FB01B48((uint64_t)self, *(void **)(a1 + 32));
  if (self)
  {
    objc_setProperty_nonatomic_copy(self, v3, *(id *)(a1 + 40), 120);
    sub_18FAFACC4((uint64_t)self, 15, 0);
  }

}

void sub_18FB01B48(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 112), a2);
}

void sub_18FB01B58(void *a1, char *newValue)
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 120);
}

void sub_18FB01B6C(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id *obj;

  if (a1)
  {
    obj = a1;
    objc_sync_enter(obj);
    v1 = obj[29];
    objc_msgSend_invalidate(v1, v2, v3);

    v4 = obj[29];
    obj[29] = 0;

    sub_18FAEA1C0();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("SYNC CONNECTION TEARDOWN"), v6, v7, v8, v9, v10, v11, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v5, v12);

    objc_sync_exit(obj);
  }
}

void sub_18FB01C24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t sub_18FB01C38(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 232);
  return result;
}

void sub_18FB01C44(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 232), a2);
}

void sub_18FB01C54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  sub_18FAEBC90();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Interruption handler invoked"), v0, v1, v2, v3, v4, v5, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v8, v6);

}

void sub_18FB01CB8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  sub_18FAEBC90();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Invalidation handler invoked, clearing connection"), v1, v2, v3, v4, v5, v6, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v0, v7);

  sub_18FAE7234();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FB01B6C(v9);

}

uint64_t sub_18FB01D38(void *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;

  v5 = a2;
  if (a1)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 5;
    sub_18FAFF584(a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_18FB01E88;
    v16[3] = &unk_1E2A4B2E0;
    v8 = v5;
    v17 = v8;
    v18 = &v19;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v6, v9, (uint64_t)v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = getpid();
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = sub_18FB01F28;
    v15[3] = &unk_1E2A4A950;
    v15[4] = &v19;
    objc_msgSend_personaLoginWithPid_WithUserODuuid_withUid_completionHandler_(v10, v12, v11, v8, a3, v15);

    v13 = *((unsigned int *)v20 + 6);
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void sub_18FB01E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FB01E88(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to perform persona login for user %@: got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, *(_QWORD *)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  LODWORD(v4) = objc_msgSend_code(v3, v12, v13);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_DWORD)v4;
}

uint64_t sub_18FB01F28(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  if (a2)
    result = objc_msgSend_code(a2, (const char *)a2, a3);
  else
    result = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_18FB01F64(void *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;

  v5 = a2;
  if (a1)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 5;
    sub_18FAFF584(a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_18FB020B4;
    v16[3] = &unk_1E2A4B2E0;
    v8 = v5;
    v17 = v8;
    v18 = &v19;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v6, v9, (uint64_t)v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = getpid();
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = sub_18FB02154;
    v15[3] = &unk_1E2A4A950;
    v15[4] = &v19;
    objc_msgSend_personaLogoutWithPid_WithUserODuuid_withUid_completionHandler_(v10, v12, v11, v8, a3, v15);

    v13 = *((unsigned int *)v20 + 6);
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void sub_18FB0209C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FB020B4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to perform persona logout for user %@: got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, *(_QWORD *)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  LODWORD(v4) = objc_msgSend_code(v3, v12, v13);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_DWORD)v4;
}

uint64_t sub_18FB02154(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  if (a2)
    result = objc_msgSend_code(a2, (const char *)a2, a3);
  else
    result = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

id sub_18FB02190(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v3 = a2;
  if (a1)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = sub_18FAEAA30;
    v21 = sub_18FAEA9F8;
    v22 = 0;
    sub_18FAFF584(a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_18FB022FC;
    v15[3] = &unk_1E2A4AAB8;
    v6 = v3;
    v16 = v6;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v4, v7, (uint64_t)v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = sub_18FB02384;
    v12[3] = &unk_1E2A4B308;
    v13 = v6;
    v14 = &v17;
    objc_msgSend_grantSandboxExtensionForPersonaWithUniqueString_completionHandler_(v8, v9, (uint64_t)v13, v12);

    v10 = (id)v18[5];
    _Block_object_dispose(&v17, 8);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_18FB022E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FB022FC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a2;
  sub_18FAEBC90();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to grant sandbox extension for persona %@: got error from remote proxy: %@"), v4, v5, v6, v7, v8, v9, *(_QWORD *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  sub_18FAE964C((uint64_t)v11, v10);
}

void sub_18FB02384(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  v5 = a3;
  if (v16)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = v16;
    v8 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else
  {
    sub_18FAEBC90();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to grant sandbox extension for persona %@: %@"), v9, v10, v11, v12, v13, v14, *(_QWORD *)(a1 + 32));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v8, v15);

  }
}

BOOL sub_18FB02438(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  _BOOL8 v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v5 = a2;
  if (a1)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = sub_18FAEAA30;
    v20 = sub_18FAEA9F8;
    v21 = 0;
    sub_18FAFF584(a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_18FB025D0;
    v15[3] = &unk_1E2A4A950;
    v15[4] = &v16;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v6, v8, (uint64_t)v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = sub_18FB0265C;
    v14[3] = &unk_1E2A4AA90;
    v14[4] = &v16;
    v14[5] = &v22;
    objc_msgSend_setUserSessionSecureBackupBlob_withReply_(v9, v10, (uint64_t)v5, v14);

    if (a3)
    {
      v11 = (void *)v17[5];
      if (v11)
        *a3 = objc_retainAutorelease(v11);
    }
    v12 = *((_BYTE *)v23 + 24) != 0;

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void sub_18FB025AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18FB025D0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to setSecureBackup blob, got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FB0265C(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

id sub_18FB026BC(void *a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
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

  if (a1)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = sub_18FAEAA30;
    v23 = sub_18FAEA9F8;
    v24 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = sub_18FAEAA30;
    v17 = sub_18FAEA9F8;
    v18 = 0;
    sub_18FAFF584(a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_18FB02840;
    v12[3] = &unk_1E2A4A950;
    v12[4] = &v13;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v5, (uint64_t)v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = sub_18FB028CC;
    v11[3] = &unk_1E2A4AA68;
    v11[4] = &v19;
    v11[5] = &v13;
    objc_msgSend_retrieveUserSessionSecureBackupBlobwithReply_(v6, v7, (uint64_t)v11);

    if (a2)
    {
      v8 = (void *)v14[5];
      if (v8)
        *a2 = objc_retainAutorelease(v8);
    }
    v9 = (id)v20[5];

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v19, 8);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

void sub_18FB0281C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18FB02840(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR(" Failed to retrieve Secure BackupBlob, got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FB028CC(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);

}

BOOL sub_18FB0294C(void *a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  _BOOL8 v9;
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
  char v22;

  if (!a1)
    return 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_18FAEAA30;
  v17 = sub_18FAEA9F8;
  v18 = 0;
  sub_18FAFF584(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18FB02AC4;
  v12[3] = &unk_1E2A4A950;
  v12[4] = &v13;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v5, (uint64_t)v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = sub_18FB02B50;
  v11[3] = &unk_1E2A4AA90;
  v11[4] = &v13;
  v11[5] = &v19;
  objc_msgSend_deleteUserSessionSecureBlobwithReply_(v6, v7, (uint64_t)v11);

  if (a2)
  {
    v8 = (void *)v14[5];
    if (v8)
      *a2 = objc_retainAutorelease(v8);
  }
  v9 = *((_BYTE *)v20 + 24) != 0;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v9;
}

void sub_18FB02AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18FB02AC4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to delete Secure BackupBlob, got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FB02B50(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

id sub_18FB02BB0(void *a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[5];
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

  if (a1)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = sub_18FAEAA30;
    v25 = sub_18FAEA9F8;
    v26 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = sub_18FAEAA30;
    v19 = sub_18FAEA9F8;
    v20 = 0;
    sub_18FAFF584(a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_18FB02D3C;
    v14[3] = &unk_1E2A4A950;
    v14[4] = &v21;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5, v7, (uint64_t)v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = sub_18FB02DC8;
    v13[3] = &unk_1E2A4AAE0;
    v13[4] = &v15;
    v13[5] = &v21;
    objc_msgSend_configureLoginUIWithUserSessionCount_reply_(v8, v9, a2, v13);

    if (a3)
    {
      v10 = (void *)v22[5];
      if (v10)
        *a3 = objc_retainAutorelease(v10);
    }
    v11 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

void sub_18FB02D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18FB02D3C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to configure LoginWindow, got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FB02DC8(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);

}

BOOL sub_18FB02E48(void *a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  _BOOL8 v9;
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
  char v22;

  if (!a1)
    return 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_18FAEAA30;
  v17 = sub_18FAEA9F8;
  v18 = 0;
  sub_18FAFF584(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18FB02FC0;
  v12[3] = &unk_1E2A4A950;
  v12[4] = &v13;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v5, (uint64_t)v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = sub_18FB0304C;
  v11[3] = &unk_1E2A4AA90;
  v11[4] = &v13;
  v11[5] = &v19;
  objc_msgSend_switchToLoginUIUserSessionWithReply_(v6, v7, (uint64_t)v11);

  if (a2)
  {
    v8 = (void *)v14[5];
    if (v8)
      *a2 = objc_retainAutorelease(v8);
  }
  v9 = *((_BYTE *)v20 + 24) != 0;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v9;
}

void sub_18FB02F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18FB02FC0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to switch to Loginwindow, got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FB0304C(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

BOOL sub_18FB030AC(uint64_t a1, _QWORD *a2)
{
  int v3;
  id v4;
  void *v5;
  _BOOL8 v6;
  id v8;

  if (!a1)
    return 0;
  v8 = 0;
  v3 = sub_18FAEBAE0((uint64_t)UMMobileKeyBag, &v8);
  v4 = v8;
  v5 = v4;
  if (v4)
  {
    v6 = 0;
    if (a2)
      *a2 = objc_retainAutorelease(v4);
  }
  else
  {
    v6 = v3 == 502;
  }

  return v6;
}

uint64_t sub_18FB0313C(uint64_t result, _QWORD *a2)
{
  if (result)
    return sub_18FAEBAE0((uint64_t)UMMobileKeyBag, a2);
  return result;
}

id sub_18FB03150(void *a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  id v8;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  if (a1)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = sub_18FAEAA30;
    v22 = sub_18FAEA9F8;
    v23 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_18FAEAA30;
    v16 = sub_18FAEA9F8;
    v17 = 0;
    sub_18FAFF584(a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18FB032D0;
    v11[3] = &unk_1E2A4A950;
    v11[4] = &v18;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v5, (uint64_t)v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = sub_18FB0335C;
    v10[3] = &unk_1E2A4AAE0;
    v10[4] = &v12;
    v10[5] = &v18;
    objc_msgSend_foregroundUserSessionAttributesWithReply_(v6, v7, (uint64_t)v10);

    if (a2)
      *a2 = objc_retainAutorelease((id)v19[5]);
    v8 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v18, 8);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

void sub_18FB032AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18FB032D0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed Foreground usersession attributes, got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FB0335C(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a2;
  v6 = a3;
  if (v18)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    sub_18FAEA1C0();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_code(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8, v9);
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote foregroundUserSessionAttributesWithReply: %ld"), v11, v12, v13, v14, v15, v16, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v7, v17);

  }
}

id sub_18FB03438(uint64_t a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  const char *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a2;
  v9 = a3;
  if (!a1)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  if (!v7)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v8, *MEMORY[0x1E0CB2FE0], 22, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a4)
      *a4 = objc_retainAutorelease(v11);

    goto LABEL_7;
  }
  sub_18FAEF918((uint64_t)UMMobileKeyBag, v7, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v10;
}

uint64_t sub_18FB034EC(void *a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
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
  int v22;

  if (!a1)
    return 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = -1;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_18FAEAA30;
  v17 = sub_18FAEA9F8;
  v18 = 0;
  sub_18FAFF584(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18FB03660;
  v12[3] = &unk_1E2A4A950;
  v12[4] = &v13;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v5, (uint64_t)v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = sub_18FB036EC;
  v11[3] = &unk_1E2A4B330;
  v11[4] = &v13;
  v11[5] = &v19;
  objc_msgSend_currentSyncBubbleIDwithReply_(v6, v7, (uint64_t)v11);

  if (a2)
  {
    v8 = (void *)v14[5];
    if (v8)
      *a2 = objc_retainAutorelease(v8);
  }
  v9 = *((unsigned int *)v20 + 6);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v9;
}

void sub_18FB0363C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18FB03660(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed Current SyncBubble ID, got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FB036EC(uint64_t a1, int a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

id sub_18FB03754(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[5];
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

  v5 = a2;
  if (a1)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = sub_18FAEAA30;
    v25 = sub_18FAEA9F8;
    v26 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = sub_18FAEAA30;
    v19 = sub_18FAEA9F8;
    v20 = 0;
    sub_18FAFF584(a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_18FB038EC;
    v14[3] = &unk_1E2A4A950;
    v14[4] = &v21;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v6, v8, (uint64_t)v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = sub_18FB03978;
    v13[3] = &unk_1E2A4A9A0;
    v13[4] = &v15;
    v13[5] = &v21;
    objc_msgSend_listSyncServiceSourcesForUserSession_withReply_(v9, v10, (uint64_t)v5, v13);

    if (a3)
      *a3 = objc_retainAutorelease((id)v22[5]);
    v11 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void sub_18FB038C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18FB038EC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed list syncservices for usersession, got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FB03978(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a2;
  v6 = a3;
  if (v18)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    sub_18FAEA1C0();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_code(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8, v9);
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("got error from remote listSyncServiceSourcesForUserSession: %ld"), v11, v12, v13, v14, v15, v16, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v7, v17);

  }
}

BOOL sub_18FB03A54(void *a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  _BOOL8 v8;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  if (!a1)
    return 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_18FAEAA30;
  v16 = sub_18FAEA9F8;
  v17 = 0;
  sub_18FAFF584(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18FB03BC8;
  v11[3] = &unk_1E2A4A950;
  v11[4] = &v12;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v5, (uint64_t)v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = sub_18FB03C54;
  v10[3] = &unk_1E2A4AA90;
  v10[4] = &v12;
  v10[5] = &v18;
  objc_msgSend_isLoginSessionwithReply_(v6, v7, (uint64_t)v10);

  if (a2)
    *a2 = objc_retainAutorelease((id)v13[5]);
  v8 = *((_BYTE *)v19 + 24) != 0;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v8;
}

void sub_18FB03BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18FB03BC8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed isLoginSession,got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FB03C54(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

id sub_18FB03CB4(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[5];
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

  v5 = a2;
  if (a1)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = sub_18FAEAA30;
    v25 = sub_18FAEA9F8;
    v26 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = sub_18FAEAA30;
    v19 = sub_18FAEA9F8;
    v20 = 0;
    sub_18FAFF584(a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_18FB03E4C;
    v14[3] = &unk_1E2A4A950;
    v14[4] = &v21;
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v6, v8, (uint64_t)v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = sub_18FB03ED8;
    v13[3] = &unk_1E2A4AAE0;
    v13[4] = &v21;
    v13[5] = &v15;
    objc_msgSend_getUserSessionAttributes_reply_(v9, v10, (uint64_t)v5, v13);

    if (a3)
      *a3 = objc_retainAutorelease((id)v22[5]);
    v11 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void sub_18FB03E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18FB03E4C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed Usersession attributes  info, got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FB03ED8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;

  v19 = a2;
  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    sub_18FAEA1C0();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend_code(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v7, v8);
    sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("getUserSessionAttributes error: %ld"), v10, v11, v12, v13, v14, v15, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE964C((uint64_t)v6, v16);

  }
  else
  {
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = v19;
    v6 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v18;
  }

}

BOOL sub_18FB03FB0(void *a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  const char *v8;
  id v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  _BOOL8 v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v7 = a2;
  v9 = a3;
  if (a1)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = sub_18FAEAA30;
    v25 = sub_18FAEA9F8;
    v26 = 0;
    if (v7)
    {
      sub_18FAFF584(a1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = sub_18FB041C0;
      v20[3] = &unk_1E2A4A950;
      v20[4] = &v21;
      objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v10, v12, (uint64_t)v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v11;
      v19[1] = 3221225472;
      v19[2] = sub_18FB0424C;
      v19[3] = &unk_1E2A4AA90;
      v19[4] = &v21;
      v19[5] = &v27;
      objc_msgSend_switchToUserSession_withOpaqueData_reply_(v13, v14, (uint64_t)v7, v9, v19);

      if (a4)
        *a4 = objc_retainAutorelease((id)v22[5]);
      v15 = *((_BYTE *)v28 + 24) != 0;

    }
    else
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v8, *MEMORY[0x1E0CB2FE0], 22, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v22[5];
      v22[5] = v16;

      v15 = 0;
      if (a4)
        *a4 = objc_retainAutorelease((id)v22[5]);
    }
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void sub_18FB04198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18FB041C0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  sub_18FAEA1C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to Switch Usersession, got error from remote proxy: %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v4, v11);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

void sub_18FB0424C(uint64_t a1, void *a2)
{
  id v4;
  char v5;
  id v6;

  v4 = a2;
  if (v4)
  {
    v6 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v6;
    v5 = 0;
  }
  else
  {
    v5 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;

}

uint64_t sub_18FB042B0(uint64_t result, void *a2, void *a3, _QWORD *a4)
{
  if (result)
    return sub_18FAEFDF4((uint64_t)UMMobileKeyBag, a2, a3, a4);
  return result;
}

void sub_18FB042C4(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

uint64_t sub_18FB042D4(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 104);
  return result;
}

void sub_18FB042E0(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 104), a2);
}

void sub_18FB042F0(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 192), a2);
}

void sub_18FB04300(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 200), a2);
}

uint64_t sub_18FB04310(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 256);
  return result;
}

id *sub_18FB0431C(id *WeakRetained)
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 33);
  return WeakRetained;
}

id *sub_18FB04338(id *result, void *a2)
{
  if (result)
    return (id *)objc_storeWeak(result + 33, a2);
  return result;
}

BOOL sub_18FB04348(_BOOL8 result)
{
  if (result)
    return *(_BYTE *)(result + 13) != 0;
  return result;
}

uint64_t sub_18FB0435C(uint64_t result, char a2)
{
  if (result)
    *(_BYTE *)(result + 13) = a2;
  return result;
}

void sub_18FB044C4()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1EE185060;
  qword_1EE185060 = v0;

}

void sub_18FB0454C(void *a1, char *newValue)
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 32);
}

uint64_t sub_18FB04600(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  sub_18FAEA1C0();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v2, CFSTR("willSwitchToUser on UMPersonaCallbackListener "), v3, v4, v5, v6, v7, v8, v10);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_18FB046E8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  sub_18FAEA1C0();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v2, CFSTR("readyToSwitchToUser on UMPersonaCallbackListener "), v3, v4, v5, v6, v7, v8, v10);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_18FB047D0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  sub_18FAEA1C0();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v2, CFSTR("readyToSwitchToLoginSession on UMPersonaCallbackListener "), v3, v4, v5, v6, v7, v8, v10);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_18FB04864()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  sub_18FAEA1C0();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v7, CFSTR("userSwitchTaskListDidUpdate on UMPersonaCallbackListener "), v0, v1, v2, v3, v4, v5, v6);

}

void sub_18FB048EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  sub_18FAEA1C0();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v7, CFSTR("deviceLoginSessionStateDidUpdate on UMPersonaCallbackListener "), v0, v1, v2, v3, v4, v5, v6);

}

uint64_t sub_18FB049C8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  sub_18FAEA1C0();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v2, CFSTR("Upload content on UMPersonaCallbackListener "), v3, v4, v5, v6, v7, v8, v10);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_18FB04A5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  sub_18FAEA1C0();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v7, CFSTR("bubbleDidPop on UMPersonaCallbackListener "), v0, v1, v2, v3, v4, v5, v6);

}

uint64_t sub_18FB04B38(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  sub_18FAEA1C0();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v2, CFSTR("personaListDidUpdateCompletionHandler on UMPersonaCallbackListener "), v3, v4, v5, v6, v7, v8, v10);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_18FB04C20(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;

  v3 = a2;
  sub_18FAE9AB8();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v4, CFSTR("persona Update callback"), v5, v6, v7, v8, v9, v10, v22);

  if (v3 && v3[4])
  {
    (*(void (**)(void))(v3[4] + 16))();
    sub_18FAEA1C0();
    v11 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v11;
    v19 = CFSTR("personaUpdateCallbackHandler:DONE");
  }
  else
  {
    sub_18FAEA1C0();
    v11 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v11;
    v19 = CFSTR("NO personaUpdateCallbackHandler");
  }
  sub_18FAE71DC(v11, v19, v12, v13, v14, v15, v16, v17, v23);

  sub_18FAE8D1C();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_18FB04D40;
  v24[3] = &unk_1E2A4AD30;
  v21 = *(void **)(a1 + 32);
  v25 = *(id *)(a1 + 40);
  sub_18FAEBEE8((uint64_t)v20, v21, v24);

}

uint64_t sub_18FB04D40(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  sub_18FAE9AB8();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v2, CFSTR("Calling personaUpdateCallbackHandler completion handler"), v3, v4, v5, v6, v7, v8, v10);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_18FB04E50(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;

  v10 = a2;
  sub_18FAE9AB8();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v3, CFSTR("<%p> Set up server with connection"), v4, v5, v6, v7, v8, v9, *(_QWORD *)(a1 + 32));

  sub_18FB04EBC(v10, *(void **)(a1 + 32));
}

void sub_18FB04EBC(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  const char *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id from;
  id location;

  v3 = a2;
  if (a1)
  {
    v4 = a1[2];
    objc_sync_enter(v4);
    v5 = a1[2];
    objc_msgSend_addObject_(v5, v6, (uint64_t)v3);

    objc_sync_exit(v4);
    objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v7, (uint64_t)&unk_1EE18B610);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRemoteObjectInterface_(v3, v9, (uint64_t)v8);

    objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v10, (uint64_t)&unk_1EE188EB0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setExportedInterface_(v3, v12, (uint64_t)v11);

    objc_msgSend_setExportedObject_(v3, v13, (uint64_t)a1);
    objc_initWeak(&location, a1);
    objc_initWeak(&from, v3);
    v14 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_18FB050C4;
    v22[3] = &unk_1E2A4AE40;
    objc_copyWeak(&v23, &from);
    objc_msgSend_setInterruptionHandler_(v3, v15, (uint64_t)v22);
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = sub_18FB05124;
    v19[3] = &unk_1E2A4B450;
    objc_copyWeak(&v20, &from);
    objc_copyWeak(&v21, &location);
    objc_msgSend_setInvalidationHandler_(v3, v16, (uint64_t)v19);
    objc_msgSend_resume(v3, v17, v18);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

}

void sub_18FB05074(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 64));
  objc_destroyWeak((id *)(v4 - 56));
  _Unwind_Resume(a1);
}

void sub_18FB050C4(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  sub_18FAEA1C0();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_18FAE71DC((uint64_t)v9, CFSTR("<%p> XPC connection interrupted"), v3, v4, v5, v6, v7, v8, (uint64_t)WeakRetained);

}

void sub_18FB05124(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_18FAEA1C0();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v3, CFSTR("<%p> XPC connection invalidated"), v4, v5, v6, v7, v8, v9, (uint64_t)WeakRetained);

  sub_18FAE8D1C();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_loadWeakRetained((id *)(a1 + 40));
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18FB05200;
  v13[3] = &unk_1E2A4B428;
  v14 = WeakRetained;
  v12 = WeakRetained;
  sub_18FAEBEE8((uint64_t)v10, v11, v13);

}

void sub_18FB05200(uint64_t a1, uint64_t a2)
{
  sub_18FB05210(a2, *(void **)(a1 + 32));
}

void sub_18FB05210(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  id v6;

  v6 = a2;
  if (a1)
  {
    v3 = *(id *)(a1 + 16);
    objc_sync_enter(v3);
    v4 = *(id *)(a1 + 16);
    objc_msgSend_removeObject_(v4, v5, (uint64_t)v6);

    objc_sync_exit(v3);
  }

}

void sub_18FB05278(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_18FB05410(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  const char *v42;
  void *v43;
  uint64_t v45;
  void *v46;
  id v47;

  v2 = a2;
  v46 = (void *)objc_opt_self();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_opt_class();
  objc_opt_class();
  v45 = v5;
  objc_msgSend_setWithObjects_(v3, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  objc_msgSend_unarchivedObjectOfClasses_fromData_error_(MEMORY[0x1E0CB3710], v8, (uint64_t)v7, v2, &v47);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v47;
  sub_18FAEA1C0();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v18 = CFSTR("SUCCESSFUL unarchive of switch context \n");
  }
  else
  {
    v45 = (uint64_t)v10;
    v18 = CFSTR("Failed to unarchive the switch context with an error:%@ \n");
  }
  sub_18FAE99B4((uint64_t)UMLogMessage, v18, v11, v12, v13, v14, v15, v16, v45);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v17, v19);

  objc_msgSend_objectForKeyedSubscript_(v9, v20, (uint64_t)CFSTR("setupData"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v22, (uint64_t)CFSTR("shortLivedToken"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v24, (uint64_t)CFSTR("secondaryActionRequired"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v26, (uint64_t)CFSTR("environmentsByServices"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (sub_18FAED900())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      sub_18FAEA1C0();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_description(v27, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Switching to the following environments: \n%@"), v34, v35, v36, v37, v38, v39, (uint64_t)v33);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE964C((uint64_t)v30, v40);

      sub_18FB05684((uint64_t)v46, v27);
    }
  }
  v41 = objc_msgSend_BOOLValue(v25, v28, v29);
  objc_msgSend_contextWithSetupData_shortLivedToken_secondaryActionRequired_(v46, v42, (uint64_t)v21, v23, v41);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

void sub_18FB05684(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  objc_class *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  dispatch_semaphore_t v19;
  NSObject *v20;
  const char *v21;
  id v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  BOOL v36;
  id v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  _BOOL4 v62;
  id v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  dispatch_semaphore_t v72;
  NSObject *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  __CFString *v77;
  const char *v78;
  uint64_t v79;
  __CFString *v80;
  __CFString *v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  id obj;
  uint64_t v108;
  NSObject *v109;
  id v110;
  void *v111;
  _QWORD v112[4];
  NSObject *v113;
  uint64_t *v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  uint64_t (*v119)(uint64_t, uint64_t);
  void (*v120)(uint64_t);
  id v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  char v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _QWORD v134[4];
  NSObject *v135;
  uint64_t *v136;
  uint64_t *v137;
  uint64_t v138;
  uint64_t *v139;
  uint64_t v140;
  uint64_t (*v141)(uint64_t, uint64_t);
  void (*v142)(uint64_t);
  id v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t (*v147)(uint64_t, uint64_t);
  void (*v148)(uint64_t);
  id v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  uint64_t v157;

  v157 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  v138 = 0;
  v139 = &v138;
  v140 = 0x2050000000;
  v3 = (void *)qword_1EE185070;
  v141 = (uint64_t (*)(uint64_t, uint64_t))qword_1EE185070;
  if (!qword_1EE185070)
  {
    v144 = MEMORY[0x1E0C809B0];
    v145 = 3221225472;
    v146 = (uint64_t)sub_18FB0623C;
    v147 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E2A4B500;
    v148 = (void (*)(uint64_t))&v138;
    sub_18FB0623C((uint64_t)&v144);
    v3 = (void *)v139[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v138, 8);
  v110 = objc_alloc_init(v4);
  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  obj = v2;
  v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v150, v156, 16);
  if (v106)
  {
    v105 = *(_QWORD *)v151;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v151 != v105)
        {
          v7 = v6;
          objc_enumerationMutation(obj);
          v6 = v7;
        }
        v108 = v6;
        v8 = *(id *)(*((_QWORD *)&v150 + 1) + 8 * v6);
        objc_msgSend_objectForKeyedSubscript_(obj, v9, (uint64_t)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18FAEA1C0();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("About to switch to:\n\tService name: '%@'\n\tEnvironment name: '%@'\n\n"), v12, v13, v14, v15, v16, v17, (uint64_t)v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18FAE964C((uint64_t)v11, v18);

        v144 = 0;
        v145 = (uint64_t)&v144;
        v146 = 0x3032000000;
        v147 = sub_18FAEAA40;
        v148 = sub_18FAEAA00;
        v149 = 0;
        v138 = 0;
        v139 = &v138;
        v140 = 0x3032000000;
        v141 = sub_18FAEAA40;
        v142 = sub_18FAEAA00;
        v143 = 0;
        v19 = dispatch_semaphore_create(0);
        v134[0] = MEMORY[0x1E0C809B0];
        v134[1] = 3221225472;
        v134[2] = sub_18FB060EC;
        v134[3] = &unk_1E2A4B4B0;
        v136 = &v144;
        v137 = &v138;
        v20 = v19;
        v135 = v20;
        objc_msgSend_servicesWithForcePoll_completion_(v110, v21, 0, v134);
        v109 = v20;
        dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
        v132 = 0u;
        v133 = 0u;
        v130 = 0u;
        v131 = 0u;
        v22 = *(id *)(v145 + 40);
        v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v130, v155, 16);
        if (v26)
        {
          v27 = *(_QWORD *)v131;
LABEL_10:
          v28 = 0;
          while (1)
          {
            if (*(_QWORD *)v131 != v27)
              objc_enumerationMutation(v22);
            v29 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * v28);
            objc_msgSend_identifier(v29, v24, v25);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend_caseInsensitiveCompare_(v30, v31, (uint64_t)v8))
              break;
            objc_msgSend_name(v29, v32, v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend_caseInsensitiveCompare_(v34, v35, (uint64_t)v8) == 0;

            if (v36)
              goto LABEL_19;
            if (v26 == ++v28)
            {
              v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v24, (uint64_t)&v130, v155, 16);
              if (v26)
                goto LABEL_10;
              goto LABEL_17;
            }
          }

LABEL_19:
          v37 = v29;

          if (v37)
            goto LABEL_21;
        }
        else
        {
LABEL_17:

        }
        sub_18FAEA1C0();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Service '%@' not found.\n\n"), v41, v42, v43, v44, v45, v46, (uint64_t)v8);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        sub_18FAE964C((uint64_t)v40, v47);

        v37 = 0;
LABEL_21:
        v128 = 0u;
        v129 = 0u;
        v126 = 0u;
        v127 = 0u;
        objc_msgSend_environments(v37, v38, v39);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v126, v154, 16);
        v111 = v37;
        if (v52)
        {
          v53 = *(_QWORD *)v127;
          while (2)
          {
            for (i = 0; i != v52; ++i)
            {
              if (*(_QWORD *)v127 != v53)
                objc_enumerationMutation(v48);
              v55 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * i);
              objc_msgSend_identifier(v55, v50, v51);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend_caseInsensitiveCompare_(v56, v57, (uint64_t)v10))
              {

LABEL_33:
                v63 = v55;
                goto LABEL_34;
              }
              objc_msgSend_name(v55, v58, v59);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = objc_msgSend_caseInsensitiveCompare_(v60, v61, (uint64_t)v10) == 0;

              if (v62)
                goto LABEL_33;
            }
            v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v50, (uint64_t)&v126, v154, 16);
            v63 = 0;
            if (v52)
              continue;
            break;
          }
        }
        else
        {
          v63 = 0;
        }
LABEL_34:

        if ((objc_msgSend_isEqualToString_(v10, v64, (uint64_t)CFSTR("prod")) & 1) == 0)
        {
          if (v63)
            goto LABEL_38;
          sub_18FAEA1C0();
          v63 = (id)objc_claimAutoreleasedReturnValue();
          sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Environment '%@' not found for service '%@'.\n\n"), v65, v66, v67, v68, v69, v70, (uint64_t)v10);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18FAE964C((uint64_t)v63, v71);

        }
        v63 = 0;
LABEL_38:
        v122 = 0;
        v123 = &v122;
        v124 = 0x2020000000;
        v125 = 0;
        v116 = 0;
        v117 = &v116;
        v118 = 0x3032000000;
        v119 = sub_18FAEAA40;
        v120 = sub_18FAEAA00;
        v121 = 0;
        v72 = dispatch_semaphore_create(0);

        v112[0] = MEMORY[0x1E0C809B0];
        v112[1] = 3221225472;
        v112[2] = sub_18FB06174;
        v112[3] = &unk_1E2A4B4D8;
        v114 = &v122;
        v115 = &v116;
        v73 = v72;
        v113 = v73;
        objc_msgSend_switchToEnvironment_service_completion_(v110, v74, (uint64_t)v63, v111, v112);
        dispatch_semaphore_wait(v73, 0xFFFFFFFFFFFFFFFFLL);
        objc_msgSend_identifier(v63, v75, v76);
        v77 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v63, v78, v79);
        v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v81 = v80;
        if (!v77)
        {

          v77 = CFSTR("prod");
          v81 = CFSTR("Production");
        }
        if (*((_BYTE *)v123 + 24))
        {
          sub_18FAEA1C0();
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_identifier(v111, v83, v84);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_name(v111, v86, v87);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Success: Switched to '%@' (%@) environment for service '%@' (%@)\n"), v89, v90, v91, v92, v93, v94, (uint64_t)v77);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18FAE964C((uint64_t)v82, v95);

        }
        else
        {
          sub_18FAEA1C0();
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_description((void *)v117[5], v96, v97);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Failed to switch to environment '%@': %@\n"), v98, v99, v100, v101, v102, v103, (uint64_t)v81);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18FAE964C((uint64_t)v82, v88);
        }

        _Block_object_dispose(&v116, 8);
        _Block_object_dispose(&v122, 8);

        _Block_object_dispose(&v138, 8);
        _Block_object_dispose(&v144, 8);

        v6 = v108 + 1;
      }
      while (v108 + 1 != v106);
      v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v104, (uint64_t)&v150, v156, 16);
    }
    while (v106);
  }

}

void sub_18FB05E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  _Block_object_dispose(&a61, 8);
  _Unwind_Resume(a1);
}

uint64_t *sub_18FB05EB0(uint64_t *a1, const char *a2)
{
  uint64_t *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;

  v2 = a1;
  if (a1)
  {
    objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E0C99E08], a2, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setupData(v2, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend_setupData(v2, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, CFSTR("setupData"));

    }
    objc_msgSend_shortLivedToken(v2, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend_shortLivedToken(v2, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v3, v15, (uint64_t)v14, CFSTR("shortLivedToken"));

    }
    v16 = (void *)MEMORY[0x1E0CB37E8];
    v17 = objc_msgSend_secondaryActionRequired(v2, v12, v13);
    objc_msgSend_numberWithBool_(v16, v18, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v20, (uint64_t)v19, CFSTR("secondaryActionRequired"));

    if (v2[4])
      objc_msgSend_setObject_forKeyedSubscript_(v3, v21, v2[4], CFSTR("environmentsByServices"));
    v2 = (uint64_t *)objc_msgSend_copy(v3, v21, v22);

  }
  return v2;
}

id sub_18FB05FDC(uint64_t *a1, const char *a2)
{
  void *v2;
  void *v3;
  const char *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  uint64_t v17;
  id v18;

  if (!a1)
    return 0;
  v2 = (void *)MEMORY[0x1E0CB36F8];
  sub_18FB05EB0(a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(v2, v4, (uint64_t)v3, 1, &v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v18;

  sub_18FAEA1C0();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v14 = CFSTR("SUCCESSFUL archive of switch context\n");
  }
  else
  {
    v17 = (uint64_t)v6;
    v14 = CFSTR("Failed to archive the switch context with an error:%@ \n");
  }
  sub_18FAE99B4((uint64_t)UMLogMessage, v14, v7, v8, v9, v10, v11, v12, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE964C((uint64_t)v13, v15);

  return v5;
}

void sub_18FB060EC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_18FB06174(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

Class sub_18FB0623C(uint64_t a1)
{
  Class result;

  if (!qword_1EE185078)
  {
    qword_1EE185078 = _sl_dlopen();
    if (!qword_1EE185078)
    {
      abort_report_np();
LABEL_6:
      sub_18FB07E80();
    }
  }
  result = objc_getClass("SWSwitchController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  qword_1EE185070 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18FB06794(void *a1@<X0>, const char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;

  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  if (a1)
  {
    v5 = objc_msgSend_uid(a1, a2, a3);
    v29 = 0;
    if (quotactl("/private/var", 458752, v5, &v29))
    {
      v12 = *__error();
      v13 = CFSTR("Error getting quota status");
LABEL_4:
      sub_18FAE99B4((uint64_t)UMLogMessage, v13, v6, v7, v8, v9, v10, v11, v28);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAF8F3C((uint64_t)v14, CFSTR("error num: %d"), v15, v16, v17, v18, v19, v20, v12);
      sub_18FAEA1C0();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE964C((uint64_t)v21, v14);

LABEL_5:
      return;
    }
    if (!v29)
    {
      sub_18FAEA1C0();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE71DC((uint64_t)v14, CFSTR("Quotas are off"), v22, v23, v24, v25, v26, v27, v28);
      goto LABEL_5;
    }
    if (quotactl("/private/var", 196608, v5, (caddr_t)a4))
    {
      v12 = *__error();
      v13 = CFSTR("Error getting quota");
      goto LABEL_4;
    }
  }
}

uint64_t sub_18FB06C78(uint64_t result, void *a2)
{
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  uint64_t isAuditor;
  const char *v67;
  const char *v68;
  uint64_t v69;
  uint64_t isLoginUser;
  const char *v71;
  const char *v72;
  uint64_t v73;
  uint64_t isDisabled;
  const char *v75;
  const char *v76;
  uint64_t v77;
  uint64_t isTransientUser;
  const char *v79;
  const char *v80;
  uint64_t v81;
  uint64_t isPrimaryUser;
  const char *v83;
  const char *v84;
  uint64_t v85;
  uint64_t isAdminUser;
  const char *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  uint64_t hasManagedCredentials;
  const char *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  const char *v108;
  uint64_t v109;
  uint64_t hasDataToSync;
  const char *v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  const char *v120;

  if (result)
  {
    v2 = (void *)result;
    v3 = a2;
    v6 = objc_msgSend_uid(v3, v4, v5);
    objc_msgSend_setUid_(v2, v7, v6);
    v10 = objc_msgSend_gid(v3, v8, v9);
    objc_msgSend_setGid_(v2, v11, v10);
    objc_msgSend_alternateDSID(v3, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAlternateDSID_(v2, v15, (uint64_t)v14);

    objc_msgSend_homeDirectoryURL(v3, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHomeDirectoryURL_(v2, v19, (uint64_t)v18);

    objc_msgSend_username(v3, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUsername_(v2, v23, (uint64_t)v22);

    objc_msgSend_givenName(v3, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGivenName_(v2, v27, (uint64_t)v26);

    objc_msgSend_familyName(v3, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFamilyName_(v2, v31, (uint64_t)v30);

    objc_msgSend_displayName(v3, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDisplayName_(v2, v35, (uint64_t)v34);

    objc_msgSend_photoURL(v3, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPhotoURL_(v2, v39, (uint64_t)v38);

    objc_msgSend_userAuxiliaryString(v3, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserAuxiliaryString_(v2, v43, (uint64_t)v42);

    objc_msgSend__photo(v3, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_set_photo_(v2, v47, (uint64_t)v46);

    objc_msgSend_creationDate(v3, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCreationDate_(v2, v51, (uint64_t)v50);

    objc_msgSend_lastLoginDate(v3, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastLoginDate_(v2, v55, (uint64_t)v54);

    objc_msgSend_lastRemoteAuthDate(v3, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLastRemoteAuthDate_(v2, v59, (uint64_t)v58);

    v62 = objc_msgSend_passcodeType(v3, v60, v61);
    objc_msgSend_setPasscodeType_(v2, v63, v62);
    isAuditor = objc_msgSend_isAuditor(v3, v64, v65);
    objc_msgSend_setIsAuditor_(v2, v67, isAuditor);
    isLoginUser = objc_msgSend_isLoginUser(v3, v68, v69);
    objc_msgSend_setIsLoginUser_(v2, v71, isLoginUser);
    isDisabled = objc_msgSend_isDisabled(v3, v72, v73);
    objc_msgSend_setIsDisabled_(v2, v75, isDisabled);
    isTransientUser = objc_msgSend_isTransientUser(v3, v76, v77);
    objc_msgSend_setIsTransientUser_(v2, v79, isTransientUser);
    isPrimaryUser = objc_msgSend_isPrimaryUser(v3, v80, v81);
    objc_msgSend_setIsPrimaryUser_(v2, v83, isPrimaryUser);
    isAdminUser = objc_msgSend_isAdminUser(v3, v84, v85);
    objc_msgSend_setIsAdminUser_(v2, v87, isAdminUser);
    v90 = objc_msgSend_passcodeLockGracePeriod(v3, v88, v89);
    objc_msgSend_setPasscodeLockGracePeriod_(v2, v91, v90);
    objc_msgSend_languages(v3, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLanguages_(v2, v95, (uint64_t)v94);

    hasManagedCredentials = objc_msgSend_hasManagedCredentials(v3, v96, v97);
    objc_msgSend_setHasManagedCredentials_(v2, v99, hasManagedCredentials);
    v102 = objc_msgSend_dataQuota(v3, v100, v101);
    objc_msgSend_setDataQuota_(v2, v103, v102);
    v106 = objc_msgSend_dataUsed(v3, v104, v105);
    objc_msgSend_setDataUsed_(v2, v107, v106);
    hasDataToSync = objc_msgSend_hasDataToSync(v3, v108, v109);
    objc_msgSend_setHasDataToSync_(v2, v111, hasDataToSync);
    objc_msgSend_errorCausingLogout(v3, v112, v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setErrorCausingLogout_(v2, v115, (uint64_t)v114);

    objc_msgSend_debugErrorCausingLogout(v3, v116, v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setDebugErrorCausingLogout_(v2, v119, (uint64_t)v118);
    return objc_msgSend_setShouldFetchAttributes_(v2, v120, 0);
  }
  return result;
}

void sub_18FB07074(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_18FB0758C()
{
  uint64_t result;

  result = getpid();
  dword_1EE184F20 = result;
  return result;
}

void sub_18FB076F8(void *a1, char *newValue)
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 40);
}

uint64_t sub_18FB07A5C(uint64_t result, void *a2)
{
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t isEnterprisePersona;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t isPersonalPersona;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t isSystemPersona;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t isDefaultPersona;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t isGuestPersona;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t isDataSeparatedPersona;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t isDisabled;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;

  if (result)
  {
    v2 = (void *)result;
    v3 = a2;
    v6 = objc_msgSend_uid(v3, v4, v5);
    objc_msgSend_setUid_(v2, v7, v6);
    v10 = objc_msgSend_gid(v3, v8, v9);
    objc_msgSend_setGid_(v2, v11, v10);
    isEnterprisePersona = objc_msgSend_isEnterprisePersona(v3, v12, v13);
    objc_msgSend_setIsEnterprisePersona_(v2, v15, isEnterprisePersona);
    isPersonalPersona = objc_msgSend_isPersonalPersona(v3, v16, v17);
    objc_msgSend_setIsPersonalPersona_(v2, v19, isPersonalPersona);
    isSystemPersona = objc_msgSend_isSystemPersona(v3, v20, v21);
    objc_msgSend_setIsSystemPersona_(v2, v23, isSystemPersona);
    isDefaultPersona = objc_msgSend_isDefaultPersona(v3, v24, v25);
    objc_msgSend_setIsDefaultPersona_(v2, v27, isDefaultPersona);
    isGuestPersona = objc_msgSend_isGuestPersona(v3, v28, v29);
    objc_msgSend_setIsGuestPersona_(v2, v31, isGuestPersona);
    isDataSeparatedPersona = objc_msgSend_isDataSeparatedPersona(v3, v32, v33);
    objc_msgSend_setIsDataSeparatedPersona_(v2, v35, isDataSeparatedPersona);
    isDisabled = objc_msgSend_isDisabled(v3, v36, v37);
    objc_msgSend_setIsDisabled_(v2, v39, isDisabled);
    objc_msgSend_userPersonaUniqueString(v3, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserPersonaUniqueString_(v2, v43, (uint64_t)v42);

    objc_msgSend_userPersonaNickName(v3, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserPersonaNickName_(v2, v47, (uint64_t)v46);

    v50 = objc_msgSend_userPersonaType(v3, v48, v49);
    return objc_msgSend_setUserPersonaType_(v2, v51, v50);
  }
  return result;
}

void sub_18FB07E28()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void sub_18FB07E40()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_18FAE5000, 0, OS_LOG_TYPE_ERROR, "Failed to fetch our own audit token", v0, 2u);
}

void sub_18FB07E80()
{
  const __CFAllocator *v0;
  CFIndex v1;
  const CFArrayCallBacks *v2;

  v0 = (const __CFAllocator *)abort_report_np();
  CFArrayCreateMutable(v0, v1, v2);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AE0](allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x1E0C98AF8](propertyList, stream, format, options, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x1E0C98B10](stream);
}

CFReadStreamRef CFReadStreamCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFReadStreamRef)MEMORY[0x1E0C98B38](alloc, bytes, length, bytesDeallocator);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1E0C98B80](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x1E0C99520](alloc, uuidStr);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x1E0C99600](stream);
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x1E0C99610](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x1E0C99620](alloc, bufferAllocator);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1E0C99650](stream);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MKBUserSessionGetUserLockStateInfo()
{
  return MEMORY[0x1E0D4E570]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1E0C80FF0]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1E0C81068]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t csops_audittoken()
{
  return MEMORY[0x1E0C82B70]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

gid_t getgid(void)
{
  return MEMORY[0x1E0C83678]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1E0C837A0](*(_QWORD *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

kern_return_t host_get_multiuser_config_flags(host_t host, uint32_t *multiuser_flags)
{
  return MEMORY[0x1E0C838B0](*(_QWORD *)&host, multiuser_flags);
}

uint64_t kpersona_getpath()
{
  return MEMORY[0x1E0C83A58]();
}

uint64_t kpersona_info()
{
  return MEMORY[0x1E0C83A60]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1E0C83C90]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1E0C83D88](*(_QWORD *)&task, *(_QWORD *)&name, ptype);
}

uint64_t mach_voucher_persona_self()
{
  return MEMORY[0x1E0C83E20]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1E0C843E0](*(_QWORD *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint64_t notify_register_plain()
{
  return MEMORY[0x1E0C84418]();
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int pipe(int a1[2])
{
  return MEMORY[0x1E0C84B10](a1);
}

int quotactl(const char *a1, int a2, int a3, caddr_t a4)
{
  return MEMORY[0x1E0C84FA0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B8](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1E0C855C8](__big, __little, __len);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

uint64_t voucher_adopt()
{
  return MEMORY[0x1E0C85B10]();
}

uint64_t voucher_copy()
{
  return MEMORY[0x1E0C85B18]();
}

uint64_t voucher_copy_with_persona_mach_voucher()
{
  return MEMORY[0x1E0C85B20]();
}

uint64_t voucher_get_current_persona()
{
  return MEMORY[0x1E0C85B30]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1E0C860D8]();
}

uint64_t xpc_mach_send_copy_right()
{
  return MEMORY[0x1E0C865D8]();
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x1E0C865E0]();
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1E0C86710]();
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1E0C867C8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1E0C867D0]();
}

