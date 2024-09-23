id sub_20A02208C(uint64_t a1, const char *a2)
{
  void *v2;
  const char *v3;
  void *v4;
  const char *v5;

  objc_msgSend_cborWithData_(MEMORY[0x24BE10200], a2, a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cborWithInteger_(MEMORY[0x24BE10200], v3, 24);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTag_(v2, v5, (uint64_t)v4);

  return v2;
}

id sub_20A0220E4(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  void *v4;
  const char *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE50];
  objc_msgSend_cborEncodeToBstrCbor(a1, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataWithCBOR_(v3, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id sub_20A02212C(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  _BYTE *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  _BYTE *v25;
  const char *v26;
  uint64_t v27;
  unsigned int v28;
  unsigned __int8 *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v35;
  char __str[3];

  v3 = a3;
  v6 = objc_msgSend_length(v3, v4, v5);
  v10 = v6;
  if (v6 && (v6 & 1) == 0)
  {
    v11 = objc_alloc(MEMORY[0x24BDBCEC8]);
    if (v10 >= 0)
      v13 = (void *)objc_msgSend_initWithLength_(v11, v12, v10 >> 1);
    else
      v13 = (void *)objc_msgSend_initWithLength_(v11, v12, (v10 + 1) >> 1);
    v17 = v13;
    if (v13)
    {
      v18 = objc_retainAutorelease(v13);
      v21 = (_BYTE *)objc_msgSend_mutableBytes(v18, v19, v20);
      v22 = objc_retainAutorelease(v3);
      v25 = (_BYTE *)objc_msgSend_UTF8String(v22, v23, v24);
      __str[2] = 0;
      v28 = *v25;
      if (!*v25)
      {
LABEL_14:
        v31 = (void *)objc_msgSend_copy(v18, v26, v27);
LABEL_18:

        goto LABEL_19;
      }
      v29 = v25 + 2;
      v30 = MEMORY[0x24BDAC740];
      v31 = 0;
      while (1)
      {
        __str[0] = v28;
        v32 = *(v29 - 1);
        __str[1] = *(v29 - 1);
        if ((v28 & 0x80) != 0)
          break;
        if ((*(_DWORD *)(v30 + 4 * v28 + 60) & 0x10000) == 0 || (char)v32 < 0)
          goto LABEL_18;
        if ((*(_DWORD *)(v30 + 4 * v32 + 60) & 0x10000) == 0)
          break;
        *v21++ = strtoul(__str, 0, 16);
        v33 = *v29;
        v29 += 2;
        v28 = v33;
        if (!v33)
          goto LABEL_14;
      }
    }
    else
    {
      sub_20A02B230(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[NSData(STSExtension) STS_dataFromHexString:]", 31, CFSTR("Memory allocation request failed."), v14, v15, v16, v35);
    }
    v31 = 0;
    goto LABEL_18;
  }
  sub_20A02B230(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[NSData(STSExtension) STS_dataFromHexString:]", 25, CFSTR("String is of invalid length=%ld"), v7, v8, v9, v6);
  v31 = 0;
LABEL_19:

  return v31;
}

__CFString *sub_20A022294(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  unsigned __int8 *v16;
  char *v17;
  int v18;
  const char *v19;
  __CFString *v20;
  uint64_t v22;

  v4 = objc_msgSend_length(a1, a2, a3);
  if (!v4)
    goto LABEL_7;
  v7 = v4;
  v8 = objc_msgSend_length(a1, v5, v6);
  v9 = (char *)malloc_type_malloc((2 * v8) | 1, 0xDE05561AuLL);
  if (!v9)
  {
    sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[NSData(STSExtension) STS_asHexString]", 65, a1, CFSTR("Memory allocation request failed."), v10, v11, v22);
LABEL_7:
    v20 = &stru_24C2B35E8;
    return v20;
  }
  v12 = v9;
  v9[2 * v8] = 0;
  v13 = objc_retainAutorelease(a1);
  v16 = (unsigned __int8 *)objc_msgSend_bytes(v13, v14, v15);
  v17 = v12;
  do
  {
    v18 = *v16++;
    sprintf(v17, "%02X", v18);
    v17 += 2;
    --v7;
  }
  while (v7);
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v19, (uint64_t)v12);
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  free(v12);
  return v20;
}

id sub_20A022394(void *a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  _BYTE *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;

  v2 = objc_alloc(MEMORY[0x24BDBCEC8]);
  v5 = objc_msgSend_length(a1, v3, v4);
  v7 = objc_retainAutorelease((id)objc_msgSend_initWithLength_(v2, v6, v5));
  v10 = (_BYTE *)objc_msgSend_mutableBytes(v7, v8, v9);
  v13 = objc_msgSend_length(a1, v11, v12) - 1;
  if (v13 >= 0)
  {
    do
    {
      v14 = objc_retainAutorelease(a1);
      *v10++ = *(_BYTE *)(objc_msgSend_bytes(v14, v15, v16) + v13--);
    }
    while (v13 != -1);
  }
  return v7;
}

id sub_20A026604(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v14;

  v2 = 0;
  v3 = *MEMORY[0x24BDD0B88];
  v4 = 2;
  while (1)
  {
    v5 = v2;
    (*(void (**)(uint64_t))(a1 + 16))(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
      break;
    objc_msgSend_domain(v2, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v8, v9, v3))
    {

LABEL_11:
      v14 = v2;
      break;
    }
    v12 = objc_msgSend_code(v2, v10, v11);

    if (v12 != 4097 || v4-- == 0)
      goto LABEL_11;
  }

  return v2;
}

id sub_20A0266C0(_QWORD *a1, const char *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  id v9;
  _QWORD v11[5];
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_20A0267D4;
  v17 = sub_20A0267E4;
  v18 = 0;
  v3 = (void *)a1[4];
  v4 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_20A0267EC;
  v12[3] = &unk_24C2B3108;
  v12[4] = v3;
  v12[5] = &v13;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, a2, (uint64_t)v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a1[5];
  v7 = a1[6];
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = sub_20A026850;
  v11[3] = &unk_24C2B3130;
  v11[4] = &v13;
  objc_msgSend_startConnectionHandoverWithConfiguration_type_callback_(v5, v8, v6, v7, v11);

  v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

void sub_20A0267BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20A0267D4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_20A0267E4(uint64_t a1)
{

}

void sub_20A0267EC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary startISO18013WithConnectionHandoverConfiguration:type:delegate:]_block_invoke", 79, *(void **)(a1 + 32), CFSTR("XPC Error: %@"), v4, v5, (uint64_t)v3);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20A026850(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

id sub_20A026928(uint64_t a1, const char *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_20A0267D4;
  v16 = sub_20A0267E4;
  v17 = 0;
  v3 = *(void **)(a1 + 32);
  v4 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_20A026A3C;
  v11[3] = &unk_24C2B3108;
  v11[4] = v3;
  v11[5] = &v12;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, a2, (uint64_t)v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = sub_20A026AA0;
  v10[3] = &unk_24C2B3130;
  v10[4] = &v12;
  objc_msgSend_connectNotificationListenerEndpoint_callback_(v5, v7, v6, v10);

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void sub_20A026A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A026A3C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary connectToNotificationListener:]_block_invoke_2", 104, *(void **)(a1 + 32), CFSTR("XPC Error: %@"), v4, v5, (uint64_t)v3);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20A026AA0(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_20A026BEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20A026C00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  const char *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  HIWORD(v17) = 111;
  sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary processUnifiedAccessStepupAPDU:callbackQueue:responseHandler:]_block_invoke", 130, *(void **)(a1 + 32), CFSTR("Not initialized"), a7, a8, v17);
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v10, (uint64_t)&v17 + 6, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD1540];
  v18 = *MEMORY[0x24BDD0FC8];
  v19[0] = CFSTR("Not initialized");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v13, (uint64_t)v19, &v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v12, v15, (uint64_t)CFSTR("STSXPCHelperErrorDomain"), 2, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *, void *, uint64_t))(v9 + 16))(v9, v11, v16, 1);
}

void sub_20A026EC0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  if (v7)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_20A026F94;
    block[3] = &unk_24C2B31A8;
    v11 = *(id *)(a1 + 40);
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t sub_20A026F94(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_20A026FA8(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary processConnectionHandoverRequest:callbackQueue:responseHandler:]_block_invoke_3", 165, v3, CFSTR("XPC Error: %@"), v4, v5, (uint64_t)v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t sub_20A027014(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20A0271AC(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  char v14;

  v7 = a2;
  v8 = a4;
  v9 = *(NSObject **)(a1 + 32);
  if (v9)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = sub_20A027294;
    v10[3] = &unk_24C2B3248;
    v13 = *(id *)(a1 + 40);
    v11 = v7;
    v14 = a3;
    v12 = v8;
    dispatch_async(v9, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t sub_20A027294(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

void sub_20A0272AC(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary processConnectionHandoverRequestData:callbackQueue:responseHandler:]_block_invoke_3", 199, v3, CFSTR("XPC Error: %@"), v4, v5, (uint64_t)v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t sub_20A02731C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20A0274A0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  if (v7)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_20A027574;
    block[3] = &unk_24C2B31A8;
    v11 = *(id *)(a1 + 40);
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t sub_20A027574(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_20A027588(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary generateConnectionHandoverRequestWithQueue:responseHandler:]_block_invoke_3", 229, v3, CFSTR("XPC Error: %@"), v4, v5, (uint64_t)v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t sub_20A0275F4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20A027778(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  if (v7)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_20A02784C;
    block[3] = &unk_24C2B31A8;
    v11 = *(id *)(a1 + 40);
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t sub_20A02784C(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_20A027860(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary generateQRCodeCHRequestAndStartACWithQueue:responseHandler:]_block_invoke_3", 251, v3, CFSTR("XPC Error: %@"), v4, v5, (uint64_t)v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t sub_20A0278CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20A027A64(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = sub_20A027B14;
    v5[3] = &unk_24C2B3310;
    v7 = *(id *)(a1 + 40);
    v6 = v3;
    dispatch_async(v4, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t sub_20A027B14(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_20A027B24(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary connectRemoteWithConnectionHandoverSelect:callbackQueue:responseHandler:]_block_invoke_3", 278, v3, CFSTR("XPC Error: %@"), v4, v5, (uint64_t)v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t sub_20A027B8C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_20A027D24(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = sub_20A027DD4;
    v5[3] = &unk_24C2B3310;
    v7 = *(id *)(a1 + 40);
    v6 = v3;
    dispatch_async(v4, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t sub_20A027DD4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_20A027DE4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary connectRemoteWithQRCodeHandoverData:callbackQueue:responseHandler:]_block_invoke_3", 300, v3, CFSTR("XPC Error: %@"), v4, v5, (uint64_t)v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t sub_20A027E4C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_20A027FC0(uint64_t a1, const char *a2)
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void **v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  id v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_20A0267D4;
  v19 = sub_20A0267E4;
  v20 = 0;
  v3 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_20A0280D0;
  v14[3] = &unk_24C2B3108;
  v14[4] = v3;
  v14[5] = &v15;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, a2, (uint64_t)v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_seProxyListener(*(void **)(a1 + 32), v5, v6);
  v7 = (void **)objc_claimAutoreleasedReturnValue();
  sub_20A02C324(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transferSEProxyWithXPCEndpoint_(v4, v11, (uint64_t)v10);

  v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v12;
}

void sub_20A0280B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A0280D0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary startSEProxyListener:parameters:workQueue:]_block_invoke_2", 336, *(void **)(a1 + 32), CFSTR("XPC Error: %@"), v4, v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20A02867C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20A0287B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_20A0287D0(uint64_t a1, const char *a2)
{
  void *v2;
  void *v3;
  const char *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_20A0267D4;
  v12 = sub_20A0267E4;
  v13 = 0;
  v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_20A0288B0;
  v7[3] = &unk_24C2B3108;
  v7[4] = v2;
  v7[5] = &v8;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v2, a2, (uint64_t)v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidateWithCompletion_(v3, v4, (uint64_t)&unk_24C2B3070);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void sub_20A028898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A0288B0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary invalidate]_block_invoke_2", 428, *(void **)(a1 + 32), CFSTR("XPC Error: %@"), v4, v5, (uint64_t)v3);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20A028914()
{
  NSObject *v0;
  uint8_t v1[16];

  sub_20A02B2F8();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_20A021000, v0, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Invalidate STSXPCHeler", (const char *)&unk_20A0326B3, v1, 2u);
  }

}

void sub_20A028AC8(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_20A028C20(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_20A028DA0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_20A028DD0(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  os_activity_scope_state_s v8;

  v2 = _os_activity_create(&dword_20A021000, "STSHelperLibrary xpcInvalidated", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v2, &v8);
  os_activity_scope_leave(&v8);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_xpc(WeakRetained, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_didInvalidateXPC_connection_(WeakRetained, v7, 1, v6);

}

void sub_20A028E60(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  os_activity_scope_state_s v8;

  v2 = _os_activity_create(&dword_20A021000, "STSHelperLibrary xpcInterrupted", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v2, &v8);
  os_activity_scope_leave(&v8);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_xpc(WeakRetained, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_didInvalidateXPC_connection_(WeakRetained, v7, 0, v6);

}

void sub_20A028FF0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_20A0291F4(_QWORD *a1, const char *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  id v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_20A0267D4;
  v18 = sub_20A0267E4;
  v19 = 0;
  v3 = MEMORY[0x24BDAC760];
  v4 = (void *)a1[4];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_20A029310;
  v13[3] = &unk_24C2B3130;
  v13[4] = &v14;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v4, a2, (uint64_t)v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a1[5];
  v7 = a1[6];
  v8 = a1[7];
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = sub_20A029320;
  v12[3] = &unk_24C2B3130;
  v12[4] = &v14;
  objc_msgSend_testWifiHandoverSessionWithServiceName_publisherRole_datapathPMK_datapathPMKID_callback_(v5, v9, v6, 1, v7, v8, v12);

  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void sub_20A0292F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A029310(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_20A029320(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

id sub_20A029444(_QWORD *a1, const char *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  id v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_20A0267D4;
  v18 = sub_20A0267E4;
  v19 = 0;
  v3 = MEMORY[0x24BDAC760];
  v4 = (void *)a1[4];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_20A029560;
  v13[3] = &unk_24C2B3130;
  v13[4] = &v14;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v4, a2, (uint64_t)v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a1[5];
  v7 = a1[6];
  v8 = a1[7];
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = sub_20A029570;
  v12[3] = &unk_24C2B3130;
  v12[4] = &v14;
  objc_msgSend_testWifiHandoverSessionWithServiceName_publisherRole_datapathPMK_datapathPMKID_callback_(v5, v9, v6, 0, v7, v8, v12);

  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void sub_20A029548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A029560(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_20A029570(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

id sub_20A029724(uint64_t a1, const char *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  id v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_20A0267D4;
  v18 = sub_20A0267E4;
  v19 = 0;
  v3 = MEMORY[0x24BDAC760];
  v4 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_20A029844;
  v13[3] = &unk_24C2B3130;
  v13[4] = &v14;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v4, a2, (uint64_t)v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(a1 + 56) == 0;
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = sub_20A029854;
  v12[3] = &unk_24C2B3130;
  v12[4] = &v14;
  objc_msgSend_testBluetoothHandoverSessionType_uuid_peripheralAddress_callback_(v5, v9, v6, v7, v8, v12);

  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void sub_20A02982C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A029844(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_20A029854(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

id sub_20A029A08(uint64_t a1, const char *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_20A0267D4;
  v19 = sub_20A0267E4;
  v20 = 0;
  v3 = MEMORY[0x24BDAC760];
  v4 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_20A029B2C;
  v14[3] = &unk_24C2B3130;
  v14[4] = &v15;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v4, a2, (uint64_t)v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (*(_BYTE *)(a1 + 56))
    v8 = 2;
  else
    v8 = 3;
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = sub_20A029B3C;
  v13[3] = &unk_24C2B3130;
  v13[4] = &v15;
  objc_msgSend_testBluetoothHandoverSessionType_uuid_peripheralAddress_callback_(v5, v6, v8, v9, v10, v13);

  v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v11;
}

void sub_20A029B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20A029B2C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_20A029B3C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

id *sub_20A029B4C(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  id *v16;
  unsigned __int16 *v17;
  STSApdu *v18;
  id *p_isa;
  _BYTE *v20;
  int v21;
  _BOOL4 v22;
  unsigned __int16 *v23;
  unsigned int v24;
  BOOL v25;
  uint64_t v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  unsigned int v33;
  BOOL v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  uint64_t v38;
  id v39;
  const char *v40;
  void *v41;

  v2 = a2;
  objc_opt_self();
  v3 = objc_retainAutorelease(v2);
  v6 = objc_msgSend_bytes(v3, v4, v5);
  v7 = objc_retainAutorelease(v3);
  v10 = objc_msgSend_bytes(v7, v8, v9);
  v13 = objc_msgSend_length(v7, v11, v12);
  if ((unint64_t)objc_msgSend_length(v7, v14, v15) >= 4)
  {
    v17 = (unsigned __int16 *)(v10 + v13);
    v18 = objc_alloc_init(STSApdu);
    p_isa = (id *)&v18->super.isa;
    if (v18)
    {
      v18->_cls = *(_BYTE *)v6;
      v18->_instruction = *(_BYTE *)(v6 + 1);
      v18->_p1 = *(_BYTE *)(v6 + 2);
      v18->_p2 = *(_BYTE *)(v6 + 3);
    }
    v20 = (_BYTE *)(v6 + 4);
    if ((unsigned __int16 *)(v6 + 4) == v17)
      goto LABEL_44;
    v21 = *v20;
    v22 = *v20 == 0;
    if (*v20)
    {
      v23 = (unsigned __int16 *)(v6 + 5);
      v24 = *v20;
    }
    else
    {
      v26 = (char *)v17 - v20;
      if (v26 == 1)
      {
        v22 = 0;
        v24 = 0;
        v23 = (unsigned __int16 *)(v6 + 5);
        v25 = 1;
        goto LABEL_16;
      }
      if (v26 <= 2)
        goto LABEL_36;
      v23 = (unsigned __int16 *)(v6 + 7);
      v24 = __rev16(*(unsigned __int16 *)(v6 + 5));
      if (!v24)
      {
        v25 = 0;
        v22 = 1;
        goto LABEL_16;
      }
    }
    v25 = v21 != 0;
    if ((char *)v17 - (char *)v23 >= v24)
    {
      v27 = objc_retainAutorelease(v7);
      v30 = objc_msgSend_bytes(v27, v28, v29);
      objc_msgSend_subdataWithRange_(v27, v31, (uint64_t)v23 - v30, v24);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (p_isa)
        objc_storeStrong(p_isa + 2, v32);

      v23 = (unsigned __int16 *)((char *)v23 + v24);
    }
    else if ((char *)v17 - (char *)v23 > 0)
    {
      goto LABEL_36;
    }
LABEL_16:
    if (v23 == v17)
    {
      if (p_isa && p_isa[2])
      {
LABEL_44:
        v16 = p_isa;
        goto LABEL_45;
      }
      if (v24)
        v36 = v24;
      else
        v36 = 0x10000;
      if (v24)
        v37 = v24;
      else
        v37 = 253;
      if (v22)
        v38 = v36;
      else
        v38 = v37;
LABEL_41:
      v39 = objc_alloc(MEMORY[0x24BDD16E0]);
      v41 = (void *)objc_msgSend_initWithInt_(v39, v40, v38);
      if (p_isa)
        objc_storeStrong(p_isa + 3, v41);

      goto LABEL_44;
    }
    if ((char *)v17 - (char *)v23 == 2)
    {
      if (!v25)
      {
        v33 = __rev16(*v23);
        v34 = v33 == 0;
        v35 = 0x10000;
LABEL_38:
        if (v34)
          v38 = v35;
        else
          v38 = v33;
        goto LABEL_41;
      }
    }
    else if ((char *)v17 - (char *)v23 == 1 && !v22)
    {
      v33 = *(unsigned __int8 *)v23;
      v34 = v33 == 0;
      v35 = 253;
      goto LABEL_38;
    }
LABEL_36:
    v16 = 0;
LABEL_45:

    goto LABEL_46;
  }
  v16 = 0;
LABEL_46:

  return v16;
}

id sub_20A02AB88(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  int v43;
  const char *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  const char *v82;
  char v84;
  char v85;

  v3 = a3;
  objc_msgSend_data(MEMORY[0x24BDBCEC8], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = 0;
  v84 = objc_msgSend_header(v3, v7, v8);
  objc_msgSend_appendBytes_length_(v6, v9, (uint64_t)&v84, 1);
  objc_msgSend_type(v3, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {

  }
  else if (!objc_msgSend_typeNameFormat(v3, v13, v14))
  {
    v85 = 0;
    objc_msgSend_appendBytes_length_(v6, v15, (uint64_t)&v85, 1);
    v85 = 0;
    objc_msgSend_appendBytes_length_(v6, v82, (uint64_t)&v85, 1);
    goto LABEL_22;
  }
  objc_msgSend_type(v3, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend_length(v17, v18, v19);

  objc_msgSend_appendBytes_length_(v6, v20, (uint64_t)&v85, 1);
  if (objc_msgSend_shortRecord(v3, v21, v22))
  {
    v85 = 0;
    objc_msgSend_payload(v3, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_length(v25, v26, v27);

    if (v28)
    {
      objc_msgSend_payload(v3, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend_length(v31, v32, v33);

    }
  }
  else
  {
    objc_msgSend_payload(v3, v23, v24);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend_length(v34, v35, v36);

    if (v37)
    {
      objc_msgSend_payload(v3, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend_length(v40, v41, v42);

    }
    else
    {
      v43 = 0;
    }
    v85 = HIBYTE(v43);
    objc_msgSend_appendBytes_length_(v6, v38, (uint64_t)&v85, 1);
    v85 = BYTE2(v43);
    objc_msgSend_appendBytes_length_(v6, v44, (uint64_t)&v85, 1);
    v85 = BYTE1(v43);
    objc_msgSend_appendBytes_length_(v6, v45, (uint64_t)&v85, 1);
    v85 = v43;
  }
  objc_msgSend_appendBytes_length_(v6, v29, (uint64_t)&v85, 1);
  if (objc_msgSend__idLengthPresent(v3, v46, v47))
  {
    objc_msgSend_identifier(v3, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend_length(v50, v51, v52);

    if (v53)
    {
      objc_msgSend_identifier(v3, v48, v49);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend_length(v54, v55, v56);

      objc_msgSend_appendBytes_length_(v6, v57, (uint64_t)&v85, 1);
    }
  }
  objc_msgSend_type(v3, v48, v49);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend_length(v58, v59, v60);

  if (v61)
  {
    objc_msgSend_type(v3, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendData_(v6, v65, (uint64_t)v64);

  }
  if (objc_msgSend__idLengthPresent(v3, v62, v63))
  {
    objc_msgSend_identifier(v3, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend_length(v68, v69, v70);

    if (v71)
    {
      objc_msgSend_identifier(v3, v66, v67);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendData_(v6, v73, (uint64_t)v72);

    }
  }
  objc_msgSend_payload(v3, v66, v67);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend_length(v74, v75, v76);

  if (v77)
  {
    objc_msgSend_payload(v3, v78, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendData_(v6, v81, (uint64_t)v80);

  }
LABEL_22:

  return v6;
}

id sub_20A02AE84(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (objc_msgSend_count(v3, v5, v6))
  {
    v9 = 0;
    do
    {
      if (!v9)
      {
        objc_msgSend_objectAtIndexedSubscript_(v3, v7, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setMessageBegin_(v10, v11, 1);

      }
      if (v9 == objc_msgSend_count(v3, v7, v8) - 1)
      {
        objc_msgSend_objectAtIndexedSubscript_(v3, v12, v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setMessageEnd_(v13, v14, 1);

      }
      v15 = (void *)MEMORY[0x24BDBCE50];
      objc_msgSend_objectAtIndexedSubscript_(v3, v12, v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dataWithSTSNDEFRecord_(v15, v17, (uint64_t)v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendData_(v4, v19, (uint64_t)v18);

      ++v9;
    }
    while (v9 < objc_msgSend_count(v3, v20, v21));
  }
  v22 = (void *)objc_msgSend_copy(v4, v7, v8);

  return v22;
}

uint64_t sub_20A02AF9C()
{
  if (qword_2545C7CC8 != -1)
    dispatch_once(&qword_2545C7CC8, &unk_24C2B3090);
  return dword_2545C7CC4;
}

uint64_t sub_20A02AFDC()
{
  uint64_t result;

  result = arc4random();
  dword_2545C7CC4 = result;
  return result;
}

void sub_20A02AFF8(os_log_type_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  const char *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (qword_2545C7CD8 != -1)
    dispatch_once(&qword_2545C7CD8, &unk_24C2B3418);
  v6 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8 = objc_retainAutorelease((id)objc_msgSend_initWithFormat_arguments_(v6, v7, (uint64_t)v5, a3));
  v11 = objc_msgSend_UTF8String(v8, v9, v10);
  v12 = qword_2545C7CD0;
  if (os_log_type_enabled((os_log_t)qword_2545C7CD0, a1))
  {
    v13 = 136446210;
    v14 = v11;
    _os_log_impl(&dword_20A021000, v12, a1, "%{public}s", (uint8_t *)&v13, 0xCu);
  }

}

void sub_20A02B108()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.sts", "logging");
  v1 = (void *)qword_2545C7CD0;
  qword_2545C7CD0 = (uint64_t)v0;

}

void sub_20A02B138(os_log_type_t a1, int a2, uint64_t a3, uint64_t a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v14;
  id v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;

  v14 = a5;
  v15 = a6;
  if (!a2)
    goto LABEL_5;
  if (qword_2545C7CF0 != -1)
    dispatch_once(&qword_2545C7CF0, &unk_24C2B3458);
  if (byte_2545C7CC0 == 1)
  {
LABEL_5:
    v16 = (void *)MEMORY[0x24BDD17C8];
    v17 = v15;
    v20 = objc_msgSend_objectInstanceID(v14, v18, v19);
    objc_msgSend_stringWithFormat_(v16, v21, (uint64_t)CFSTR("%08x [%s]:%d %@"), v20, a3, a4, v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    sub_20A02AFF8(a1, v22, (uint64_t)&a9);
  }

}

void sub_20A02B230(os_log_type_t a1, int a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  const char *v13;
  id v14;
  void *v15;

  v14 = a5;
  if (!a2)
    goto LABEL_5;
  if (qword_2545C7CF0 != -1)
    dispatch_once(&qword_2545C7CF0, &unk_24C2B3458);
  if (byte_2545C7CC0 == 1)
  {
LABEL_5:
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v13, (uint64_t)CFSTR("%s : %d : %@"), a3, a4, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    sub_20A02AFF8(a1, v15, (uint64_t)&a9);

  }
}

id sub_20A02B2F8()
{
  if (qword_2545C7CE8 != -1)
    dispatch_once(&qword_2545C7CE8, &unk_24C2B3438);
  return (id)qword_2545C7CE0;
}

void sub_20A02B338()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.sts.signpost", "GeneralSignposts");
  v1 = (void *)qword_2545C7CE0;
  qword_2545C7CE0 = (uint64_t)v0;

}

uint64_t sub_20A02B368()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  if ((_DWORD)result)
    byte_2545C7CC0 = 1;
  return result;
}

void sub_20A02BDA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_20A02B230(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSRemoteTransceiverProxy initWithListenerEndpoint:]_block_invoke", 34, CFSTR("XPC interrupted"), a6, a7, a8, a9);
}

void sub_20A02BDC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_20A02B230(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSRemoteTransceiverProxy initWithListenerEndpoint:]_block_invoke_2", 37, CFSTR("XPC invalidated"), a6, a7, a8, a9);
}

void sub_20A02BFCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20A02BFF0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_20A02C000(uint64_t a1)
{

}

void sub_20A02C008(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSRemoteTransceiverProxy transceive:outError:]_block_invoke", 55, *(void **)(a1 + 32), CFSTR("XPC error: %@"), v4, v5, (uint64_t)v3);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void sub_20A02C06C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

id *sub_20A02C1A8(id *a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  id *v9;
  objc_super v11;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)STSRemoteTransceiverProxyListener;
    v9 = (id *)objc_msgSendSuper2(&v11, sel_init);
    a1 = v9;
    if (v9)
    {
      objc_storeWeak(v9 + 2, v7);
      objc_storeStrong(a1 + 3, a4);
      *((_BYTE *)a1 + 8) = a3;
    }
  }

  return a1;
}

uint64_t sub_20A02C290(uint64_t result, const char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;

  if (result)
  {
    v3 = result;
    if (!*(_QWORD *)(result + 32))
    {
      objc_msgSend_anonymousListener(MEMORY[0x24BDD1998], a2, a3);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(v3 + 32);
      *(_QWORD *)(v3 + 32) = v4;

      objc_msgSend_setDelegate_(*(void **)(v3 + 32), v6, v3);
      return objc_msgSend_resume(*(void **)(v3 + 32), v7, v8);
    }
  }
  return result;
}

void sub_20A02C2F0(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;

  if (a1)
  {
    objc_msgSend_invalidate(*(void **)(a1 + 32), a2, a3);
    v4 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

  }
}

void **sub_20A02C324(void **a1, const char *a2, uint64_t a3)
{
  if (a1)
  {
    objc_msgSend_endpoint(a1[4], a2, a3);
    a1 = (void **)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void sub_20A02C5AC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 96));
  objc_destroyWeak((id *)(v5 - 88));
  _Unwind_Resume(a1);
}

void sub_20A02C5F4(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id WeakRetained;
  void *v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  id v15;

  sub_20A02B138(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSRemoteTransceiverProxyListener listener:shouldAcceptNewConnection:]_block_invoke", 101, a1[4], CFSTR("XPC invalidated"), a7, a8, v14);
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v15 = WeakRetained;
  if (WeakRetained)
    v10 = (void *)*((_QWORD *)WeakRetained + 5);
  else
    v10 = 0;
  v11 = v10;
  v12 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend_removeObject_(v11, v13, (uint64_t)v12);

}

void sub_20A02C688(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id WeakRetained;
  void *v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  id v15;

  sub_20A02B138(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSRemoteTransceiverProxyListener listener:shouldAcceptNewConnection:]_block_invoke_2", 105, a1[4], CFSTR("XPC interrupted"), a7, a8, v14);
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v15 = WeakRetained;
  if (WeakRetained)
    v10 = (void *)*((_QWORD *)WeakRetained + 5);
  else
    v10 = 0;
  v11 = v10;
  v12 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend_removeObject_(v11, v13, (uint64_t)v12);

}

id *sub_20A02C8E4(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id *v13;
  STSNFCHandoverHandler *v14;
  id v15;
  objc_super v17;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)STSUnifiedAccessHandler;
    v13 = (id *)objc_msgSendSuper2(&v17, sel_init);
    a1 = v13;
    if (v13)
    {
      objc_storeWeak(v13 + 1, v9);
      objc_storeStrong(a1 + 2, a4);
      objc_storeStrong(a1 + 3, a5);
      objc_storeStrong(a1 + 4, a3);
      v14 = objc_alloc_init(STSNFCHandoverHandler);
      v15 = a1[5];
      a1[5] = v14;

    }
  }

  return a1;
}

uint64_t sub_20A02C9D0(uint64_t a1)
{
  uint64_t hasPrefix;
  id v2;
  const char *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;

  hasPrefix = a1;
  if (a1)
  {
    v2 = objc_alloc(MEMORY[0x24BDBCE50]);
    v4 = (void *)objc_msgSend_initWithBytes_length_(v2, v3, (uint64_t)&unk_20A0305A1, 9);
    objc_msgSend_STS_asHexString(v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc(MEMORY[0x24BDBCE50]);
    v10 = (void *)objc_msgSend_initWithBytes_length_(v8, v9, (uint64_t)&unk_20A0305AA, 9);
    objc_msgSend_STS_asHexString(v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend_hasPrefix_(*(void **)(hasPrefix + 32), v14, (uint64_t)v7) & 1) != 0)
      hasPrefix = 1;
    else
      hasPrefix = objc_msgSend_hasPrefix_(*(void **)(hasPrefix + 32), v15, (uint64_t)v13);

  }
  return hasPrefix;
}

void sub_20A02CA88(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;

  v5 = a2;
  v6 = a3;
  v9 = objc_msgSend_length(v5, v7, v8);
  v12 = *(_QWORD **)(a1 + 32);
  if (v9)
  {
    if (v12)
      v13 = (_QWORD *)v12[5];
    else
      v13 = 0;
    sub_20A02E8F8(v13, v5);
    v24 = 0;
    v14 = *(_QWORD *)(a1 + 32);
    if (v14)
      v15 = *(_QWORD *)(v14 + 40);
    else
      v15 = 0;
    sub_20A02E930(v15, *(_QWORD *)(a1 + 48), &v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    sub_20A02B138(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSUnifiedAccessHandler _processStepupRequest:responseLe:callback:]_block_invoke", 104, *(void **)(a1 + 32), CFSTR("respApdu=%@, error=%@, isLastChunk=%d"), v17, v18, (uint64_t)v16);
    v19 = sub_20A02C9D0(*(_QWORD *)(a1 + 32));
    (*(void (**)(_QWORD, void *, id, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v16, v6, v24 & ~v19);

  }
  else
  {
    sub_20A02B138(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSUnifiedAccessHandler _processStepupRequest:responseLe:callback:]_block_invoke", 95, v12, CFSTR("Empty response"), v10, v11, v23);
    v20 = objc_alloc(MEMORY[0x24BDBCE50]);
    v22 = objc_msgSend_initWithBytes_length_(v20, v21, (uint64_t)&unk_20A0305B3, 2);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v5 = (id)v22;
  }

}

void sub_20A02CBEC(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSUnifiedAccessHandler _processStepupRequest:responseLe:callback:]_block_invoke_2", 115, v3, CFSTR("XPC Error: %@"), v5, v6, (uint64_t)v4);
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v8, (uint64_t)&unk_20A0305B3, 2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, uint64_t))(v7 + 16))(v7, v9, v4, 1);

}

void sub_20A02CC90(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(id **)(a1 + 40);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_20A02CD40;
  v10[3] = &unk_24C2B3518;
  v8 = v6;
  v12 = v8;
  v10[4] = a1;
  v9 = v5;
  v11 = v9;
  sub_20A02E5C4(v7, v9, v10);

}

void sub_20A02CD40(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  const char *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  id WeakRetained;
  const char *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  const char *v33;
  id v34;
  const char *v35;
  void *v36;
  _QWORD *v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v9 = a4;
  if (v7)
  {
    v10 = *(_QWORD *)(a1 + 48);
    v11 = (void *)MEMORY[0x24BDD1540];
    v38[0] = *MEMORY[0x24BDD0FC8];
    v40[0] = off_2545C7C80;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v8, (uint64_t)v40, v38, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v11, v13, (uint64_t)CFSTR("STSXPCHelperErrorDomain"), 11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *, uint64_t))(v10 + 16))(v10, v7, v14, 1);
  }
  else if ((a2 & 1) != 0)
  {
    v16 = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD **)(a1 + 40);
    if (v15)
      v15 = (_QWORD *)v15[3];
    v37 = v15;
    v19 = objc_msgSend_unsignedIntegerValue(v37, v17, v18);
    v20 = *(id *)(a1 + 48);
    v21 = v20;
    if (v16)
    {
      v22 = MEMORY[0x24BDAC760];
      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = sub_20A02CA88;
      v40[3] = &unk_24C2B34F0;
      v40[4] = v16;
      v23 = v20;
      v41 = v23;
      v42 = v19;
      v24 = v9;
      v25 = (void *)MEMORY[0x20BD1EA88](v40);
      WeakRetained = objc_loadWeakRetained((id *)(v16 + 8));
      v38[0] = v22;
      v38[1] = 3221225472;
      v38[2] = sub_20A02CBEC;
      v38[3] = &unk_24C2B31F8;
      v38[4] = v16;
      v39 = v23;
      objc_msgSend_asynchronousRemoteObjectProxyWithErrorHandler_(WeakRetained, v27, (uint64_t)v38);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = sub_20A02C9D0(v16);
      v31 = v16 + 16;
      v30 = *(_QWORD *)(v16 + 16);
      v32 = *(id *)(v31 + 8);
      objc_msgSend_processUnifiedAccessStepupSessionEstablishment_forAcwg_endpointIdentifier_intermediateKeyMaterial_callback_(v28, v33, (uint64_t)v24, v29, v32, v30, v25);

    }
  }
  else
  {
    v34 = objc_alloc(MEMORY[0x24BDBCE50]);
    v36 = (void *)objc_msgSend_initWithBytes_length_(v34, v35, (uint64_t)&unk_20A0305B5, 2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void sub_20A02CFE0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  id v19;

  v19 = a2;
  v6 = a4;
  if (objc_msgSend_length(v19, v7, v8))
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      v10 = *(_QWORD **)(v9 + 40);
    else
      v10 = 0;
    sub_20A02E8F8(v10, v19);
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      v12 = *(_QWORD *)(v11 + 40);
    else
      v12 = 0;
    sub_20A02E930(v12, *(_QWORD *)(a1 + 48), 0);
    v13 = objc_claimAutoreleasedReturnValue();
    sub_20A02B138(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSUnifiedAccessHandler _processHandoverRequest:responseLe:callback:]_block_invoke", 156, *(void **)(a1 + 32), CFSTR("respApdu=%@, error=%@"), v14, v15, v13);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    v6 = (id)v13;
  }
  else
  {
    v16 = objc_alloc(MEMORY[0x24BDBCE50]);
    v18 = objc_msgSend_initWithBytes_length_(v16, v17, (uint64_t)&unk_20A0305B3, 2);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v19 = (id)v18;
  }

}

void sub_20A02D108(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSUnifiedAccessHandler _processHandoverRequest:responseLe:callback:]_block_invoke_2", 161, v3, CFSTR("XPC Error: %@"), v5, v6, (uint64_t)v4);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v7, (uint64_t)&unk_20A0305B3, 2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_20A02D1A8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(id **)(a1 + 40);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_20A02D258;
  v10[3] = &unk_24C2B3518;
  v8 = v6;
  v12 = v8;
  v10[4] = a1;
  v9 = v5;
  v11 = v9;
  sub_20A02E5C4(v7, v9, v10);

}

void sub_20A02D258(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  const char *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  id WeakRetained;
  const char *v28;
  void *v29;
  const char *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *);
  void *v36;
  uint64_t v37;
  id v38;
  _QWORD v39[5];
  id v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v9 = a4;
  if (v7)
  {
    v10 = *(_QWORD *)(a1 + 48);
    v11 = (void *)MEMORY[0x24BDD1540];
    v33 = *MEMORY[0x24BDD0FC8];
    v39[0] = off_2545C7C80;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v8, (uint64_t)v39, &v33, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v11, v13, (uint64_t)CFSTR("STSXPCHelperErrorDomain"), 11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, id, void *, uint64_t))(v10 + 16))(v10, v7, v14, 1);
  }
  else
  {
    if ((a2 & 1) != 0)
    {
      v16 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD **)(a1 + 40);
      if (v15)
        v15 = (_QWORD *)v15[3];
      v17 = v15;
      v20 = objc_msgSend_unsignedIntegerValue(v17, v18, v19);
      v21 = *(id *)(a1 + 48);
      v22 = v21;
      if (v16)
      {
        v23 = MEMORY[0x24BDAC760];
        v39[0] = MEMORY[0x24BDAC760];
        v39[1] = 3221225472;
        v39[2] = sub_20A02CFE0;
        v39[3] = &unk_24C2B3540;
        v24 = v21;
        v39[4] = v16;
        v40 = v24;
        v41 = v20;
        v25 = v9;
        v26 = (void *)MEMORY[0x20BD1EA88](v39);
        WeakRetained = objc_loadWeakRetained((id *)(v16 + 8));
        v33 = v23;
        v34 = 3221225472;
        v35 = sub_20A02D108;
        v36 = &unk_24C2B31F8;
        v37 = v16;
        v38 = v24;
        objc_msgSend_asynchronousRemoteObjectProxyWithErrorHandler_(WeakRetained, v28, (uint64_t)&v33);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_processHandoverRequest_callback_(v29, v30, (uint64_t)v25, v26, v33, v34, v35, v36, v37);

      }
    }
    else
    {
      v31 = objc_alloc(MEMORY[0x24BDBCE50]);
      v17 = (_QWORD *)objc_msgSend_initWithBytes_length_(v31, v32, (uint64_t)&unk_20A0305B5, 2);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

void sub_20A02D4C4(void *a1, void *a2, void *a3)
{
  _QWORD *v5;
  void (**v6)(id, void *, _QWORD, uint64_t);
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  const char *v28;
  uint64_t v29;
  _BYTE *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  __CFString *v37;
  uint64_t v38;
  const char *v39;
  id v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __CFString *v53;
  os_log_type_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  void *v61;
  void *v62;
  void *v63;
  const char *v64;
  id v65;
  const char *v66;
  const char *v67;
  void *v68;
  const char *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD v74[2];

  v74[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
    v7 = (void *)v5[2];
  else
    v7 = 0;
  v8 = v7;
  v11 = objc_msgSend_length(v8, v9, v10);

  if (v11)
  {
    sub_20A02B138(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSUnifiedAccessHandler _processControlFlow:callback:]", 332, a1, CFSTR("%@"), v12, v13, (uint64_t)v5);
    if (v5)
      v14 = (void *)v5[2];
    else
      v14 = 0;
    v15 = v14;
    v16 = 0x24BDD1000uLL;
    v17 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD0FC8];
    v73 = *MEMORY[0x24BDD0FC8];
    v74[0] = off_2545C7C80;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v19, (uint64_t)v74, &v73, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v17, v21, (uint64_t)CFSTR("STSXPCHelperErrorDomain"), 11, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_length(v15, v23, v24))
    {
      v27 = objc_retainAutorelease(v15);
      v30 = (_BYTE *)objc_msgSend_bytes(v27, v28, v29);
      v33 = objc_msgSend_length(v27, v31, v32);
      if (*v30 != 65)
      {
        v37 = CFSTR("Invalid CONTROL_FLOW payload");
        v38 = 297;
        goto LABEL_17;
      }
      if ((unint64_t)(v33 - 1) <= 1)
      {
        v37 = CFSTR("Invalid CONTROL_FLOW payload");
        v38 = 302;
LABEL_17:
        sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSUnifiedAccessHandler _extractContentFromTag41:isCompleted:]", v38, a1, v37, v35, v36, v72);
        v46 = 1;
        goto LABEL_18;
      }
      if (v30[1] != 1)
      {
        v37 = CFSTR("Invalid CONTROL_FLOW payload length");
        v38 = 317;
        goto LABEL_17;
      }
      v47 = (void *)MEMORY[0x24BDD1540];
      v73 = v18;
      v74[0] = STSXPCHelperErrorDescriptions;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v34, (uint64_t)v74, &v73, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v47, v49, (uint64_t)CFSTR("STSXPCHelperErrorDomain"), 0, v48);
      v50 = objc_claimAutoreleasedReturnValue();

      if (v30[2] == 1)
      {
        v53 = CFSTR("CONTROL_FLOW returned Success");
        v54 = OS_LOG_TYPE_INFO;
        v55 = 310;
      }
      else
      {
        v72 = v30[2];
        v53 = CFSTR("CONTROL_FLOW returned Failure %d");
        v54 = OS_LOG_TYPE_ERROR;
        v55 = 313;
      }
      sub_20A02B138(v54, 0, (uint64_t)"-[STSUnifiedAccessHandler _extractContentFromTag41:isCompleted:]", v55, a1, v53, v51, v52, v72);
      v46 = 0;
      v22 = (void *)v50;
      v16 = 0x24BDD1000;
    }
    else
    {
      sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSUnifiedAccessHandler _extractContentFromTag41:isCompleted:]", 289, a1, CFSTR("Invalid CONTROL_FLOW payload"), v25, v26, v72);
      v46 = 1;
    }
LABEL_18:
    v40 = v22;

    if (objc_msgSend_code(v40, v56, v57)
      && (objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v58, (uint64_t)&unk_20A0305B3, 2),
          (v59 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v61 = (void *)v59;
      v62 = *(void **)(v16 + 1344);
      v73 = v18;
      v74[0] = off_2545C7C80;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v60, (uint64_t)v74, &v73, 1);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v62, v64, (uint64_t)CFSTR("STSXPCHelperErrorDomain"), 11, v63);
    }
    else
    {
      v65 = objc_alloc(MEMORY[0x24BDBCE50]);
      v61 = (void *)objc_msgSend_initWithBytes_length_(v65, v66, (uint64_t)&unk_20A0305B5, 2);
      if ((v46 & 1) == 0)
      {
        v6[2](v6, v61, 0, 1);
        goto LABEL_25;
      }
      v68 = *(void **)(v16 + 1344);
      v73 = v18;
      v74[0] = off_2545C7CA8;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v67, (uint64_t)v74, &v73, 1);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v68, v69, (uint64_t)CFSTR("STSXPCHelperErrorDomain"), 16, v63);
    }
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(id, void *, void *, uint64_t))v6)[2](v6, v61, v70, 1);
LABEL_25:

    goto LABEL_26;
  }
  sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSUnifiedAccessHandler _processControlFlow:callback:]", 325, a1, CFSTR("Unexpected payload length 0"), v12, v13, v71);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v39, (uint64_t)&unk_20A0305B3, 2);
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v41 = (void *)MEMORY[0x24BDD1540];
  v73 = *MEMORY[0x24BDD0FC8];
  v74[0] = off_2545C7C80;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v42, (uint64_t)v74, &v73, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v41, v44, (uint64_t)CFSTR("STSXPCHelperErrorDomain"), 11, v43);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(id, void *, void *, uint64_t))v6)[2](v6, v40, v45, 1);
LABEL_26:

}

void sub_20A02D9E8(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  id *v15;
  int v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  char v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  const char *v56;
  const char *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  char v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  const char *v68;
  const char *v69;
  const char *v70;
  const char *v71;
  void *v72;
  const char *v73;
  void *v74;
  const char *v75;
  void *v76;
  const char *v77;
  void *v78;
  void (*v79)(_QWORD, void *, void *, uint64_t);
  void (**v80)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v81;
  void *v82;
  uint64_t v83;
  id v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  id v107;
  const char *v108;
  uint64_t v109;
  _DWORD *v110;
  _BOOL4 v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  const char *v118;
  id v119;
  id v120;
  const char *v121;
  uint64_t v122;
  unint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  id v130;
  const char *v131;
  void *v132;
  void *v133;
  const char *v134;
  int v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  _QWORD v139[4];
  id v140;
  id v141;
  char v142;
  char v143;
  __int16 v144;
  BOOL v145[3];
  char v146;
  char v147;
  char v148;
  uint64_t v149;
  _QWORD v150[2];

  v150[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v139[0] = MEMORY[0x24BDAC760];
    v139[1] = 3221225472;
    v139[2] = sub_20A02E300;
    v139[3] = &unk_24C2B3568;
    v140 = v7;
    v141 = v8;
    v9 = a2;
    v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x20BD1EA88](v139);
    sub_20A029B4C((uint64_t)STSApdu, v9);
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v14 = *(unsigned __int8 *)(v11 + 9);
      if (v14 > 0xBF)
      {
        if (v14 == 192)
        {
          v102 = *(id *)(v11 + 16);
          v105 = objc_msgSend_length(v102, v103, v104);

          if (!v105)
          {
            v145[0] = 0;
            v119 = a1[5];
            v120 = *(id *)(v11 + 24);
            v123 = objc_msgSend_unsignedIntegerValue(v120, v121, v122);
            sub_20A02E930((uint64_t)v119, v123, v145);
            v124 = (void *)objc_claimAutoreleasedReturnValue();

            if (v124)
            {
              v128 = 0;
            }
            else
            {
              v132 = (void *)MEMORY[0x24BDD1540];
              v149 = *MEMORY[0x24BDD0FC8];
              v150[0] = off_2545C7C38;
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v125, (uint64_t)v150, &v149, 1);
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_errorWithDomain_code_userInfo_(v132, v134, (uint64_t)CFSTR("STSXPCHelperErrorDomain"), 2, v133);
              v128 = (void *)objc_claimAutoreleasedReturnValue();

            }
            sub_20A02B138(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSUnifiedAccessHandler processReceivedRequest:callbackQueue:callback:]", 401, a1, CFSTR("respApdu=%@, error=%@, isLastChunk=%d"), v126, v127, (uint64_t)v124);
            v135 = sub_20A02C9D0((uint64_t)a1);
            ((void (**)(_QWORD, void *, void *, _QWORD))v10)[2](v10, v124, v128, v145[0] & ~v135);

            goto LABEL_45;
          }
          objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v106, (uint64_t)&unk_20A0305B9, 2);
          goto LABEL_42;
        }
        if (v14 == 195)
        {
          v84 = *(id *)(v11 + 16);
          v87 = objc_msgSend_length(v84, v85, v86);

          if (!v87)
          {
            sub_20A02B138(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSUnifiedAccessHandler processReceivedRequest:callbackQueue:callback:]", 381, a1, CFSTR("Missing payload"), v89, v90, v136);
            v117 = objc_alloc(MEMORY[0x24BDBCE50]);
            v116 = objc_msgSend_initWithBytes_length_(v117, v118, (uint64_t)&unk_20A0305B9, 2);
            goto LABEL_43;
          }
          if (!*(_BYTE *)(v11 + 10))
          {
            if (*(_BYTE *)(v11 + 11) == 1)
            {
              sub_20A02D1A8((uint64_t)a1, (void *)v11, v10);
              goto LABEL_45;
            }
            if (!*(_BYTE *)(v11 + 11))
            {
              sub_20A02CC90((uint64_t)a1, (void *)v11, v10);
              goto LABEL_45;
            }
          }
          objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v88, (uint64_t)&unk_20A0305BB, 2);
LABEL_42:
          v116 = objc_claimAutoreleasedReturnValue();
LABEL_43:
          v78 = (void *)v116;
          v79 = (void (*)(_QWORD, void *, void *, uint64_t))v10[2];
          v80 = v10;
          v81 = v78;
          v82 = 0;
          v83 = 0;
          goto LABEL_44;
        }
        goto LABEL_23;
      }
      if (v14 != 60)
      {
        if (v14 == 164)
        {
          v15 = (id *)(id)v11;
          v16 = sub_20A02C9D0((uint64_t)a1);
          v17 = v15[2];
          v20 = objc_msgSend_length(v17, v18, v19);
          if (v16)
          {
            if (v20 == 9)
            {
              v21 = objc_retainAutorelease(v15[2]);
              v24 = objc_msgSend_bytes(v21, v22, v23);
              v26 = *(_QWORD *)v24 != 0x55CEAC09090000A0 || *(_BYTE *)(v24 + 8) != 2;

              if (!v26)
              {
                objc_msgSend_data(MEMORY[0x24BDBCEC8], v27, v28);
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                v147 = -124;
                v148 = 9;
                objc_msgSend_appendBytes_length_(v138, v31, (uint64_t)&v147, 1);
                objc_msgSend_appendBytes_length_(v138, v32, (uint64_t)&v148, 1);
                objc_msgSend_appendBytes_length_(v138, v33, (uint64_t)&unk_20A0305AA, 9);
                objc_msgSend_data(MEMORY[0x24BDBCEC8], v34, v35);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v146 = 0x80;
                *(_WORD *)v145 = 0;
                v148 = 2;
                objc_msgSend_appendBytes_length_(v36, v37, (uint64_t)&v146, 1);
                objc_msgSend_appendBytes_length_(v36, v38, (uint64_t)&v148, 1);
                objc_msgSend_appendBytes_length_(v36, v39, (uint64_t)v145, 2);
                objc_msgSend_data(MEMORY[0x24BDBCEC8], v40, v41);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v144 = 26239;
                LODWORD(v150[0]) = 918018;
                LODWORD(v149) = 918018;
                v148 = 8;
                objc_msgSend_appendBytes_length_(v42, v43, (uint64_t)&v144, 2);
                objc_msgSend_appendBytes_length_(v42, v44, (uint64_t)&v148, 1);
                objc_msgSend_appendBytes_length_(v42, v45, (uint64_t)v150, 4);
                objc_msgSend_appendBytes_length_(v42, v46, (uint64_t)&v149, 4);
                objc_msgSend_data(MEMORY[0x24BDBCEC8], v47, v48);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v143 = -91;
                v52 = objc_msgSend_length(v36, v50, v51);
                v148 = objc_msgSend_length(v42, v53, v54) + v52;
                objc_msgSend_appendBytes_length_(v49, v55, (uint64_t)&v143, 1);
                objc_msgSend_appendBytes_length_(v49, v56, (uint64_t)&v148, 1);
                objc_msgSend_appendData_(v49, v57, (uint64_t)v36);
                objc_msgSend_appendData_(v49, v58, (uint64_t)v42);
                objc_msgSend_data(MEMORY[0x24BDBCEC8], v59, v60);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                v142 = 111;
                v64 = objc_msgSend_length(v138, v62, v63);
                v148 = objc_msgSend_length(v49, v65, v66) + v64;
                objc_msgSend_appendBytes_length_(v61, v67, (uint64_t)&v142, 1);
                objc_msgSend_appendBytes_length_(v61, v68, (uint64_t)&v148, 1);
                objc_msgSend_appendData_(v61, v69, (uint64_t)v138);
                objc_msgSend_appendData_(v61, v70, (uint64_t)v49);
                objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v71, (uint64_t)&unk_20A0305B5, 2);
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_appendData_(v61, v73, (uint64_t)v72);

LABEL_56:
                ((void (**)(_QWORD, void *, _QWORD, _QWORD))v10)[2](v10, v61, 0, 0);

                goto LABEL_45;
              }
            }
            else
            {

            }
            sub_20A02B138(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSUnifiedAccessHandler _processSelectAID:]", 266, a1, CFSTR("Unexpected SELECT: %@"), v29, v30, (uint64_t)v15);
          }
          else
          {
            if (v20 == 7)
            {
              v107 = objc_retainAutorelease(v15[2]);
              v110 = (_DWORD *)objc_msgSend_bytes(v107, v108, v109);
              v112 = *v110 != 134217888 || *(_DWORD *)((char *)v110 + 3) != 33642504;

              if (!v112)
              {
                objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v113, (uint64_t)&unk_20A0305B5, 2);
LABEL_55:
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_56;
              }
            }
            else
            {

            }
            sub_20A02B138(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSUnifiedAccessHandler _processSelectAID:]", 275, a1, CFSTR("Unexpected SELECT: %@"), v114, v115, (uint64_t)v15);
          }
          objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v129, (uint64_t)&unk_20A0305B7, 2);
          goto LABEL_55;
        }
LABEL_23:
        sub_20A02B138(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSUnifiedAccessHandler processReceivedRequest:callbackQueue:callback:]", 421, a1, CFSTR("Unsupported instruction: %@"), v12, v13, v11);
LABEL_41:
        objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v91, (uint64_t)&unk_20A0305BD, 2);
        goto LABEL_42;
      }
      sub_20A02B138(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSUnifiedAccessHandler processReceivedRequest:callbackQueue:callback:]", 404, a1, CFSTR("Control Flow"), v12, v13, v136);
      if (!sub_20A02C9D0((uint64_t)a1))
      {
        sub_20A02B138(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSUnifiedAccessHandler processReceivedRequest:callbackQueue:callback:]", 416, a1, CFSTR("Unsupported instruction: %@"), v92, v93, v11);
        goto LABEL_41;
      }
      v94 = *(id *)(v11 + 16);
      v97 = objc_msgSend_length(v94, v95, v96);

      if (v97)
      {
        if (!*(_BYTE *)(v11 + 10) && !*(_BYTE *)(v11 + 11))
        {
          sub_20A02D4C4(a1, (void *)v11, v10);
          goto LABEL_45;
        }
        objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v98, (uint64_t)&unk_20A0305BB, 2);
        v101 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        sub_20A02B138(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSUnifiedAccessHandler processReceivedRequest:callbackQueue:callback:]", 407, a1, CFSTR("Missing payload"), v99, v100, v137);
        v130 = objc_alloc(MEMORY[0x24BDBCE50]);
        v101 = objc_msgSend_initWithBytes_length_(v130, v131, (uint64_t)&unk_20A0305B9, 2);
      }
      v78 = (void *)v101;
      v79 = (void (*)(_QWORD, void *, void *, uint64_t))v10[2];
      v80 = v10;
      v81 = v78;
      v82 = 0;
    }
    else
    {
      sub_20A02B138(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSUnifiedAccessHandler processReceivedRequest:callbackQueue:callback:]", 370, a1, CFSTR("Invalid APDU: %@"), v12, v13, 0);
      v74 = (void *)MEMORY[0x24BDD1540];
      v149 = *MEMORY[0x24BDD0FC8];
      v150[0] = CFSTR("Invalid APDU");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v75, (uint64_t)v150, &v149, 1);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v74, v77, (uint64_t)CFSTR("STSXPCHelperErrorDomain"), 5, v76);
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      v79 = (void (*)(_QWORD, void *, void *, uint64_t))v10[2];
      v80 = v10;
      v81 = 0;
      v82 = v78;
    }
    v83 = 1;
LABEL_44:
    v79(v80, v81, v82, v83);

LABEL_45:
  }

}

void sub_20A02E300(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  char v17;

  v7 = a2;
  v8 = a3;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_20A02E3C8;
  v13[3] = &unk_24C2B3248;
  v9 = *(NSObject **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v15 = v8;
  v16 = v10;
  v14 = v7;
  v17 = a4;
  v11 = v8;
  v12 = v7;
  dispatch_async(v9, v13);

}

uint64_t sub_20A02E3C8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
}

id sub_20A02E490(void *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  char v21;
  const char *v22;
  char v24;

  v3 = a2;
  v6 = v3;
  if (a1)
  {
    v9 = objc_msgSend_length(v3, v4, v5);
    if (v9 >= 0x100)
    {
      if ((unint64_t)objc_msgSend_length(v6, v7, v8) >= 0x10000)
      {
        if ((unint64_t)objc_msgSend_length(v6, v11, v12) >> 32)
          v10 = 8;
        else
          v10 = 4;
      }
      else
      {
        v10 = 2;
      }
    }
    else
    {
      v10 = 1;
    }
    v24 = 83;
    v13 = objc_alloc(MEMORY[0x24BDBCEC8]);
    v15 = (void *)objc_msgSend_initWithBytes_length_(v13, v14, (uint64_t)&v24, 1);
    a1 = v15;
    if (v9 > 0xFF)
    {
      v24 = v10 | 0x80;
      objc_msgSend_appendBytes_length_(v15, v16, (uint64_t)&v24, 1);
      v21 = 8 * v10 - 8;
      do
      {
        v24 = (unint64_t)objc_msgSend_length(v6, v19, v20) >> v21;
        objc_msgSend_appendBytes_length_(a1, v22, (uint64_t)&v24, 1);
        v21 -= 8;
        --v10;
      }
      while (v10);
    }
    else
    {
      v24 = objc_msgSend_length(v6, v16, v17);
      objc_msgSend_appendBytes_length_(a1, v18, (uint64_t)&v24, 1);
    }
    objc_msgSend_appendData_(a1, v19, (uint64_t)v6);
  }

  return a1;
}

void sub_20A02E5C4(id *a1, void *a2, void *a3)
{
  void (**v5)(id, uint64_t, void *, void *);
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  const char *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  _BYTE *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  id v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  unint64_t v41;
  unsigned __int8 *v42;
  id v43;
  const char *v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;

  v52 = a2;
  v5 = a3;
  if (a1)
  {
    if (v52)
      v6 = (void *)*((_QWORD *)v52 + 2);
    else
      v6 = 0;
    v7 = v6;
    v10 = objc_msgSend_length(v7, v8, v9);

    if (v10)
    {
      sub_20A02B138(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSNFCHandoverHandler processEnvelopeCommand:completionHandler:]", 123, a1, CFSTR("%@"), v11, v12, (uint64_t)v52);
      v13 = a1[1];
      v14 = v13;
      if (!v52)
      {
        objc_msgSend_appendData_(v13, 0, 0);

LABEL_7:
        v17 = a1[1];
        if (objc_msgSend_length(v17, v18, v19))
        {
          v22 = objc_retainAutorelease(v17);
          v25 = (_BYTE *)objc_msgSend_bytes(v22, v23, v24);
          v28 = objc_msgSend_length(v22, v26, v27);
          if (*v25 == 83)
          {
            if (v28 == 1)
            {
              v29 = 49;
            }
            else
            {
              v41 = v25[1];
              if ((char)v25[1] < 0)
              {
                v46 = v41 & 0x7F;
                v36 = v28 - 2;
                if (v28 - 2 < (v41 & 0x7F))
                {
                  v29 = 59;
                  goto LABEL_15;
                }
                v41 = 0;
                v42 = v25 + 2;
                if (v28 != 2 && v46)
                {
                  v41 = 0;
                  v47 = 2 - v28;
                  do
                  {
                    v48 = *v42++;
                    v41 = v48 | (v41 << 8);
                    --v46;
                    v49 = v47 + 1;
                    if (!(_BYTE)v46)
                      break;
                    ++v47;
                  }
                  while (v47);
                  v36 = -v49;
                }
              }
              else
              {
                v42 = v25 + 2;
                v36 = v28 - 2;
              }
              if (v41 == v36)
              {
                v43 = objc_retainAutorelease(v22);
                v35 = (uint64_t)&v42[-objc_msgSend_bytes(v43, v44, v45)];

                if (v36)
                {
                  v37 = 0;
                  goto LABEL_17;
                }
LABEL_16:
                objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v34, (uint64_t)&unk_20A0305BF, 2);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
                objc_msgSend_subdataWithRange_(a1[1], v34, v35, v36);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v5[2](v5, 1, v37, v38);

                v39 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
                v40 = a1[1];
                a1[1] = v39;

                goto LABEL_18;
              }
              v29 = 73;
            }
          }
          else
          {
            v29 = 44;
          }
        }
        else
        {
          v29 = 36;
        }
LABEL_15:
        sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSNFCHandoverHandler _extractContentFromTag53:]", v29, a1, CFSTR("Invalid ENVELOPE payload"), v20, v21, v51);

        v35 = 0;
        v36 = 0;
        goto LABEL_16;
      }
      v15 = *((id *)v52 + 2);
      objc_msgSend_appendData_(v14, v16, (uint64_t)v15);

      if ((*((_BYTE *)v52 + 8) & 0x10) == 0)
        goto LABEL_7;
      v5[2](v5, 0, 0, a1[1]);
    }
    else
    {
      sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSNFCHandoverHandler processEnvelopeCommand:completionHandler:]", 116, a1, CFSTR("Unexpected payload length 0"), v11, v12, v50);
      objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v30, (uint64_t)&unk_20A0305BF, 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, 1, v31, a1[1]);

      v32 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      v33 = a1[1];
      a1[1] = v32;

    }
  }
LABEL_18:

}

void sub_20A02E8F8(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;

  if (a1)
  {
    a1[3] = 0;
    sub_20A02E490(a1, a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)a1[2];
    a1[2] = v3;

  }
}

id sub_20A02E930(uint64_t a1, unint64_t a2, BOOL *a3)
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  char v32;
  char v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  _BYTE v42[2];

  if (!a1)
    return 0;
  v6 = *(id *)(a1 + 16);
  if (!v6
    || (v11 = v6,
        v12 = *(_QWORD *)(a1 + 24),
        v13 = objc_msgSend_length(*(void **)(a1 + 16), v7, v8),
        v11,
        v12 == v13))
  {
    sub_20A02B138(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSNFCHandoverHandler getResponseAPDUWithChunkSize:isLastChunk:]", 148, (void *)a1, CFSTR("Empty response buffer"), v9, v10, v41);
    if (a3)
    {
      *a3 = 1;
      return 0;
    }
    return 0;
  }
  if (a2 > 0x1000)
  {
    a2 = 4096;
    sub_20A02B138(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSNFCHandoverHandler getResponseAPDUWithChunkSize:isLastChunk:]", 154, (void *)a1, CFSTR("Restrict chunk size to %lu"), v9, v10, 4096);
  }
  v15 = *(id *)(a1 + 16);
  v18 = objc_msgSend_length(v15, v16, v17);
  v19 = *(_QWORD *)(a1 + 24);

  if (v18 - v19 >= a2)
    v20 = a2;
  else
    v20 = v18 - v19;
  v21 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  objc_msgSend_subdataWithRange_(*(void **)(a1 + 16), v22, *(_QWORD *)(a1 + 24), v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendData_(v21, v24, (uint64_t)v23);

  v25 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 24) += v20;
  v26 = v25;
  v29 = objc_msgSend_length(v26, v27, v28);
  v30 = *(_QWORD *)(a1 + 24);

  v32 = v29 - v30;
  if ((unint64_t)(v29 - v30) >= 0x100)
  {
    v32 = 0;
LABEL_16:
    v33 = 97;
    goto LABEL_17;
  }
  if (v29 != v30)
    goto LABEL_16;
  v32 = 0;
  v33 = -112;
LABEL_17:
  v42[0] = v33;
  v42[1] = v32;
  objc_msgSend_appendBytes_length_(v21, v31, (uint64_t)v42, 2);
  v34 = *(_QWORD *)(a1 + 24);
  v37 = objc_msgSend_length(*(void **)(a1 + 16), v35, v36);
  if (a3)
    *a3 = v34 == v37;
  if (v34 == v37)
  {
    sub_20A02B138(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSNFCHandoverHandler getResponseAPDUWithChunkSize:isLastChunk:]", 184, (void *)a1, CFSTR("Buffer all read"), v38, v39, v41);
    v40 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)(a1 + 24) = 0;

  }
  return v21;
}

id sub_20A02F250(id a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const __CFAllocator *v8;
  SecTaskRef v9;
  uint64_t v10;
  uint64_t v11;
  __SecTask *v12;
  __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  CFTypeRef v16;
  CFTypeID v17;
  BOOL v18;
  audit_token_t token;
  objc_super v21;
  CFErrorRef error;

  v3 = a2;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)STSXPCHelperClientEntitlementChecker;
    a1 = objc_msgSendSuper2(&v21, sel_init);
    if (a1)
    {
      *((_DWORD *)a1 + 3) = objc_msgSend_processIdentifier(v3, v4, v5);
      v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      if (v3)
        objc_msgSend_auditToken(v3, v6, v7);
      else
        memset(&token, 0, sizeof(token));
      v9 = SecTaskCreateWithAuditToken(v8, &token);
      if (v9)
      {
        v12 = v9;
        v13 = CFSTR("com.apple.sts.xpchelperclient.transceive.proxy.listener");
        error = 0;
        v16 = SecTaskCopyValueForEntitlement(v12, CFSTR("com.apple.sts.xpchelperclient.transceive.proxy.listener"), &error);
        if (error)
        {
          sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCHelperClientEntitlementChecker _copyValueOfEntitlement:secTask:]", 34, a1, CFSTR("Failed to get entitlements: %@"), v14, v15, (uint64_t)error);
          CFRelease(error);
        }
        if (v16)
        {
          v17 = CFGetTypeID(v16);
          v18 = v17 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v16) != 0;
          CFRelease(v16);
        }
        else
        {
          v18 = 0;
        }

        *((_BYTE *)a1 + 8) = v18;
        CFRelease(v12);
      }
      else
      {
        sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCHelperClientEntitlementChecker initWithConnection:]", 88, a1, CFSTR("Cannot create SecTaskRef with XPC Connection: %@"), v10, v11, (uint64_t)v3);

        a1 = 0;
      }
    }
  }

  return a1;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x24BDE8D78](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x24BDAD160](__buf, __nbytes);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFE60](a1, a2);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

